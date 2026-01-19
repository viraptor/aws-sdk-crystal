require "file_utils"
require "./model_loader"
require "./protocol_selector"

module CrystalSdkGenerator
  class MinimalGenerator
    struct ServiceInfo
      getter service_dir : String
      getter module_name : String
      getter protocol : String

      def initialize(@service_dir : String, @module_name : String, @protocol : String)
      end
    end

    def self.generate_service(api_path : String, output_root : String) : Nil
      model = ModelLoader.load(api_path)
      protocol = ProtocolSelector.select(model.metadata)
      info = service_info(model, api_path, protocol)

      base_dir = File.join(output_root, "src", "aws_sdk", info.service_dir)
      FileUtils.mkdir_p(File.join(base_dir, "protocol"))
      customizations_dir = File.join(output_root, "src", "aws_sdk", "customizations", info.service_dir)
      FileUtils.mkdir_p(customizations_dir)

      File.write(File.join(output_root, "src", "aws_sdk", "#{info.service_dir}.cr"), root_require(info))
      File.write(File.join(base_dir, "types.cr"), render_types(model, info))
      File.write(File.join(base_dir, "errors.cr"), render_errors(model, info))
      File.write(File.join(base_dir, "model.cr"), render_model(model, info))
      File.write(File.join(base_dir, "client.cr"), render_client(model, info))
      File.write(File.join(base_dir, "protocol", "#{protocol_filename(protocol)}.cr"), render_protocol(model, info))
      write_customizations_file(File.join(customizations_dir, "customizations.cr"), info)
    end

    private def self.service_info(model : ServiceModel, api_path : String, protocol : String) : ServiceInfo
      metadata = model.metadata
      identifier = metadata.endpoint_prefix || metadata.signing_name || metadata.service_id || service_from_path(api_path)
      service_dir = normalize_service_dir(metadata.endpoint_prefix || identifier)
      module_name = normalize_module_name(metadata.service_id || identifier)
      ServiceInfo.new(service_dir, module_name, protocol)
    end

    private def self.service_from_path(api_path : String) : String
      base_dir = File.dirname(api_path)
      service_dir = File.basename(File.dirname(base_dir))
      service_dir.empty? ? "service" : service_dir
    end

    private def self.normalize_service_dir(value : String) : String
      normalized = value.downcase.gsub(/[^a-z0-9]+/, "_").gsub(/^_+|_+$/, "")
      normalized.empty? ? "service" : normalized
    end

    private def self.normalize_module_name(value : String) : String
      parts = value.gsub(/[^A-Za-z0-9]+/, " ").split
      return "Service" if parts.empty?

      parts.map { |part| camelize_part(part) }.join
    end

    private def self.camelize_part(part : String) : String
      return part if part.empty?
      return part if part.upcase == part

      if part.size == 1
        part.upcase
      else
        part[0].upcase + part[1..-1]
      end
    end

    private def self.protocol_filename(protocol : String) : String
      case protocol
      when "rest-json"
        "rest_json"
      when "json_1.0", "json_1.1"
        "json_rpc"
      when "query"
        "query"
      when "rest-xml"
        "rest_xml"
      else
        raise UnsupportedProtocolError.new("unsupported protocol: #{protocol}")
      end
    end

    private def self.protocol_module_name(protocol : String) : String
      case protocol
      when "rest-json"
        "RestJson"
      when "json_1.0", "json_1.1"
        "JsonRpc"
      when "query"
        "Query"
      when "rest-xml"
        "RestXml"
      else
        raise UnsupportedProtocolError.new("unsupported protocol: #{protocol}")
      end
    end

    private def self.root_require(info : ServiceInfo) : String
      protocol_file = protocol_filename(info.protocol)
      String.build do |io|
        emit_line(io, 0, "require \"./runtime\"")
        emit_line(io, 0, "require \"./#{info.service_dir}/client\"")
        emit_line(io, 0, "require \"./#{info.service_dir}/errors\"")
        emit_line(io, 0, "require \"./#{info.service_dir}/model\"")
        emit_line(io, 0, "require \"./#{info.service_dir}/types\"")
        emit_line(io, 0, "require \"./#{info.service_dir}/protocol/#{protocol_file}\"")
        emit_line(io, 0, "require \"./customizations/#{info.service_dir}/customizations\"")
      end
    end

    private def self.render_types(model : ServiceModel, info : ServiceInfo) : String
      needs_time = model.shapes.values.any? { |shape| shape.type == ShapeType::Timestamp }
      shapes = model.shapes.values.select(&.structure?).sort_by(&.name)

      String.build do |io|
        emit_line(io, 0, "require \"json\"")
        emit_line(io, 0, "require \"time\"") if needs_time
        emit_line(io)
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Types")

        shapes.each do |shape|
          emit_line(io)
          emit_doc(io, 3, shape.documentation)
          emit_line(io, 3, "struct #{shape.name}")
          emit_line(io, 4, "include JSON::Serializable")

        members = shape.members.keys.sort_by do |member_name|
          ref = shape.members[member_name]
          {ref.required ? 0 : 1, member_name}
        end
          members.each do |member_name|
            ref = shape.members[member_name]
            json_key = member_json_name(member_name, ref)
            type_name = type_for_shape_ref(ref, model.shapes)
            type_name = "#{type_name}?" unless ref.required
            member_snake = to_snake_case(member_name)
            converter = ""
            if (info.protocol == "json_1.0" || info.protocol == "json_1.1") && type_name.gsub("?", "") == "Time"
              converter = ", converter: AwsSdk::Runtime::UnixTimestampConverter"
            end

            emit_line(io)
            emit_doc(io, 4, ref.documentation)
            emit_line(io, 4, "@[JSON::Field(key: \"#{json_key}\"#{converter})]")
            emit_line(io, 4, "getter #{member_snake} : #{type_name}")
          end

          emit_line(io)
          if members.empty?
            emit_line(io, 4, "def initialize")
            emit_line(io, 4, "end")
          else
            emit_line(io, 4, "def initialize(")
            members.each_with_index do |member_name, index|
              ref = shape.members[member_name]
              type_name = type_for_shape_ref(ref, model.shapes)
              type_name = "#{type_name}?" unless ref.required
              member_snake = to_snake_case(member_name)
              default = ref.required ? "" : " = nil"
              suffix = index == members.size - 1 ? "" : ","
              emit_line(io, 5, "@#{member_snake} : #{type_name}#{default}#{suffix}")
            end
            emit_line(io, 4, ")")
            emit_line(io, 4, "end")
          end

          emit_line(io, 3, "end")
        end

        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.render_errors(model : ServiceModel, info : ServiceInfo) : String
      error_shapes = model.shapes.values.select { |shape| exception_shape?(shape) }.sort_by(&.name)

      String.build do |io|
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Errors")
        emit_line(io, 3, "class ServiceError < Exception")
        emit_line(io, 3, "end")

        error_shapes.each do |shape|
          emit_line(io)
          emit_doc(io, 3, shape.documentation)
          emit_line(io, 3, "class #{shape.name} < ServiceError")
          emit_line(io, 3, "end")
        end

        emit_line(io)
        emit_line(io, 3, "def self.build(error_type : String?, message : String?) : Exception")
        if error_shapes.empty?
          emit_line(io, 4, "ServiceError.new(message || \"Unknown error\")")
        else
          emit_line(io, 4, "case error_type")
          error_shapes.each do |shape|
            emit_line(io, 4, "when \"#{shape.name}\"")
            emit_line(io, 5, "#{shape.name}.new(message)")
          end
          emit_line(io, 4, "else")
          emit_line(io, 5, "ServiceError.new(message || \"Unknown error\")")
          emit_line(io, 4, "end")
        end
        emit_line(io, 3, "end")

        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.render_model(model : ServiceModel, info : ServiceInfo) : String
      operations = model.operations.values.sort_by(&.name)
      api_version = model.metadata.api_version || ""
      target_prefix = model.metadata.target_prefix || ""
      signing_name = model.metadata.signing_name || model.metadata.endpoint_prefix || ""
      endpoint_prefix = model.metadata.endpoint_prefix || signing_name
      endpoint_rule_set = model.endpoint_rule_set

      String.build do |io|
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Model")
        emit_line(io, 3, "API_VERSION = \"#{api_version}\"")
        emit_line(io, 3, "TARGET_PREFIX = \"#{target_prefix}\"")
        emit_line(io, 3, "SIGNING_NAME = \"#{signing_name}\"")
        emit_line(io, 3, "ENDPOINT_PREFIX = \"#{endpoint_prefix}\"")
        if endpoint_rule_set
          emit_line(io, 3, "ENDPOINT_RULE_SET_JSON = <<-JSON")
          endpoint_rule_set.raw.to_json.each_line do |line|
            emit_line(io, 4, line)
          end
          emit_line(io, 3, "JSON")
        else
          emit_line(io, 3, "ENDPOINT_RULE_SET_JSON = nil")
        end
        emit_line(io)
        emit_line(io, 3, "struct OperationModel")
        emit_line(io, 4, "getter name : String")
        emit_line(io, 4, "getter http_method : String")
        emit_line(io, 4, "getter request_uri : String")
        emit_line(io)
        emit_line(io, 4, "def initialize(@name : String, @http_method : String, @request_uri : String)")
        emit_line(io, 5, "raise ArgumentError.new(\"request_uri must start with /\") unless @request_uri.starts_with?(\"/\")")
        emit_line(io, 4, "end")
        emit_line(io, 3, "end")

        operations.each do |operation|
          name = operation.name
          method = operation.http_method || "POST"
          request_uri = operation.request_uri || "/"
          constant_name = to_snake_case(name).upcase
          emit_line(io)
          emit_line(io, 3, "#{constant_name} = OperationModel.new(")
          emit_line(io, 4, "name: \"#{name}\",")
          emit_line(io, 4, "http_method: \"#{method}\",")
          emit_line(io, 4, "request_uri: \"#{request_uri}\"")
          emit_line(io, 3, ")")
        end

        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.render_client(model : ServiceModel, info : ServiceInfo) : String
      operations = model.operations.values.sort_by(&.name)
      protocol_module = protocol_module_name(info.protocol)

      String.build do |io|
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "class Client")
        if info.protocol == "query" || info.protocol == "json_1.0" || info.protocol == "json_1.1" || info.protocol == "rest-xml"
          emit_line(io, 3, "getter endpoint : String")
          emit_line(io, 3, "getter endpoint_headers : Hash(String, String)")
          emit_line(io, 3, "getter region : String")
          emit_line(io, 3, "getter credentials : AwsSdk::Runtime::Credentials")
          emit_line(io, 3, "getter transport : AwsSdk::Runtime::Transport")
          emit_line(io, 3, "getter runtime : AwsSdk::Runtime::Client")
          emit_line(io)
          emit_line(io, 3, "def initialize(")
          emit_line(io, 4, "endpoint : String? = nil,")
          emit_line(io, 4, "region : String? = nil,")
          emit_line(io, 4, "credentials : AwsSdk::Runtime::Credentials? = nil,")
          emit_line(io, 4, "profile : String? = nil,")
          emit_line(io, 4, "use_fips : Bool? = nil,")
          emit_line(io, 4, "use_dualstack : Bool? = nil,")
          emit_line(io, 4, "transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new")
          emit_line(io, 3, ")")
          emit_line(io, 4, "@transport = transport")
          emit_line(io, 4, "@region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)")
          emit_line(io, 4, "@credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)")
          emit_line(io, 4, "endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)")
          emit_line(io, 4, "endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)")
          emit_line(io, 4, "@endpoint = endpoint_result.url")
          emit_line(io, 4, "@endpoint_headers = endpoint_result.headers")
          emit_line(io, 4, "@runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)")
          emit_line(io, 3, "end")

          operations.each do |operation|
            name = operation.name
            method_name = to_snake_case(name)
            constant_name = to_snake_case(name).upcase
            input = operation.input
            output = operation.output
            output_type = output ? "Types::#{output.shape_name}" : "Nil"
            input_shape = input ? model.shapes[input.shape_name]? : nil
            input_members = input_shape && input_shape.structure? ? sorted_members(input_shape) : [] of String

            emit_line(io)
            emit_doc(io, 3, operation.documentation)
            if input && input_members.empty?
              input_type = "Types::#{input.shape_name}"
              emit_line(io, 3, "def #{method_name} : #{output_type}")
              emit_line(io, 4, "input = #{input_type}.new")
              emit_line(io, 4, "#{method_name}(input)")
              emit_line(io, 3, "end")
            elsif input
              input_type = "Types::#{input.shape_name}"
              emit_line(io, 3, "def #{method_name}(")
              input_members.each_with_index do |member_name, index|
                ref = input_shape.not_nil!.members[member_name]
                type_name = type_for_shape_ref(ref, model.shapes)
                type_name = "#{type_name}?" unless ref.required
                member_snake = to_snake_case(member_name)
                default = ref.required ? "" : " = nil"
                suffix = index == input_members.size - 1 ? "" : ","
                emit_line(io, 4, "#{member_snake} : #{type_name}#{default}#{suffix}")
              end
              emit_line(io, 3, ") : #{output_type}")
              args = input_members.map { |member_name| member_snake = to_snake_case(member_name); "#{member_snake}: #{member_snake}" }.join(", ")
              emit_line(io, 4, "input = #{input_type}.new(#{args})")
              emit_line(io, 4, "#{method_name}(input)")
              emit_line(io, 3, "end")
            end

            if input
              input_type = "Types::#{input.shape_name}"
              emit_line(io, 3, "def #{method_name}(input : #{input_type}) : #{output_type}")
              emit_line(io, 4, "request = Protocol::#{protocol_module}.build_request(Model::#{constant_name}, input, endpoint)")
            else
              emit_line(io, 3, "def #{method_name} : #{output_type}")
              emit_line(io, 4, "request = Protocol::#{protocol_module}.build_request(Model::#{constant_name}, nil, endpoint)")
            end
            emit_line(io, 4, "request = request.with_headers(endpoint_headers)")
            emit_line(io, 4, "response = runtime.execute(request)")
            emit_line(io, 4, "raise Protocol::#{protocol_module}.parse_error(response) if response.status >= 300")
            if output
              emit_line(io, 4, "Protocol::#{protocol_module}.parse_response(response, #{output_type}, \"#{name}\")")
            else
              emit_line(io, 4, "nil")
            end
            emit_line(io, 3, "end")
          end
        else
          emit_line(io, 3, "getter endpoint : String")
          emit_line(io, 3, "getter endpoint_headers : Hash(String, String)")
          emit_line(io, 3, "getter region : String")
          emit_line(io)
          emit_line(io, 3, "def initialize(")
          emit_line(io, 4, "endpoint : String? = nil,")
          emit_line(io, 4, "region : String? = nil,")
          emit_line(io, 4, "profile : String? = nil,")
          emit_line(io, 4, "use_fips : Bool? = nil,")
          emit_line(io, 4, "use_dualstack : Bool? = nil")
          emit_line(io, 3, ")")
          emit_line(io, 4, "@region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)")
          emit_line(io, 4, "endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)")
          emit_line(io, 4, "endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)")
          emit_line(io, 4, "@endpoint = endpoint_result.url")
          emit_line(io, 4, "@endpoint_headers = endpoint_result.headers")
          emit_line(io, 3, "end")

          operations.each do |operation|
            name = operation.name
            method_name = to_snake_case(name)
            constant_name = to_snake_case(name).upcase
            input = operation.input
            input_shape = input ? model.shapes[input.shape_name]? : nil
            input_members = input_shape && input_shape.structure? ? sorted_members(input_shape) : [] of String

            emit_line(io)
            emit_doc(io, 3, operation.documentation)
            if input && input_members.empty?
              input_type = "Types::#{input.shape_name}"
              emit_line(io, 3, "def #{method_name} : Protocol::Request")
              emit_line(io, 4, "input = #{input_type}.new")
              emit_line(io, 4, "#{method_name}(input)")
              emit_line(io, 3, "end")
            elsif input
              input_type = "Types::#{input.shape_name}"
              emit_line(io, 3, "def #{method_name}(")
              input_members.each_with_index do |member_name, index|
                ref = input_shape.not_nil!.members[member_name]
                type_name = type_for_shape_ref(ref, model.shapes)
                type_name = "#{type_name}?" unless ref.required
                member_snake = to_snake_case(member_name)
                default = ref.required ? "" : " = nil"
                suffix = index == input_members.size - 1 ? "" : ","
                emit_line(io, 4, "#{member_snake} : #{type_name}#{default}#{suffix}")
              end
              emit_line(io, 3, ") : Protocol::Request")
              args = input_members.map { |member_name| member_snake = to_snake_case(member_name); "#{member_snake}: #{member_snake}" }.join(", ")
              emit_line(io, 4, "input = #{input_type}.new(#{args})")
              emit_line(io, 4, "#{method_name}(input)")
              emit_line(io, 3, "end")
            end

            if input
              input_type = "Types::#{input.shape_name}"
              emit_line(io, 3, "def #{method_name}(input : #{input_type}) : Protocol::Request")
              emit_line(io, 4, "request = Protocol::#{protocol_module}.build_request(Model::#{constant_name}, input, endpoint)")
              emit_line(io, 4, "Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)")
              emit_line(io, 3, "end")
            else
              emit_line(io, 3, "def #{method_name} : Protocol::Request")
              emit_line(io, 4, "request = Protocol::#{protocol_module}.build_request(Model::#{constant_name}, nil, endpoint)")
              emit_line(io, 4, "Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)")
              emit_line(io, 3, "end")
            end
          end
        end

        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.render_protocol(model : ServiceModel, info : ServiceInfo) : String
      case info.protocol
      when "rest-json"
        render_rest_json(info)
      when "json_1.0", "json_1.1"
        render_json_rpc(info)
      when "query"
        render_query(info)
      when "rest-xml"
        render_rest_xml(model, info)
      else
        raise UnsupportedProtocolError.new("unsupported protocol: #{info.protocol}")
      end
    end

    private def self.render_rest_json(info : ServiceInfo) : String
      String.build do |io|
        emit_line(io, 0, "require \"json\"")
        emit_line(io)
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Protocol")
        emit_line(io, 3, "struct Request")
        emit_line(io, 4, "getter method : String")
        emit_line(io, 4, "getter uri : String")
        emit_line(io, 4, "getter headers : Hash(String, String)")
        emit_line(io, 4, "getter body : String?")
        emit_line(io)
        emit_line(io, 4, "def initialize(@method : String, @uri : String, @headers : Hash(String, String), @body : String?)")
        emit_line(io, 4, "end")
        emit_line(io, 3, "end")
        emit_line(io)
        emit_line(io, 3, "struct Response")
        emit_line(io, 4, "getter status : Int32")
        emit_line(io, 4, "getter headers : Hash(String, String)")
        emit_line(io, 4, "getter body : String?")
        emit_line(io)
        emit_line(io, 4, "def initialize(@status : Int32, @headers : Hash(String, String), @body : String?)")
        emit_line(io, 4, "end")
        emit_line(io, 3, "end")
        emit_line(io)
        emit_line(io, 3, "module RestJson")
        emit_line(io, 4, "CONTENT_TYPE = \"application/json\"")
        emit_line(io)
        emit_line(io, 4, "def self.build_request(operation : Model::OperationModel, input, endpoint : String) : Request")
        emit_line(io, 5, "raise ArgumentError.new(\"endpoint must not be empty\") if endpoint.empty?")
        emit_line(io, 5, "uri = endpoint.rstrip(\"/\") + operation.request_uri")
        emit_line(io, 5, "headers = {\"content-type\" => CONTENT_TYPE}")
        emit_line(io, 5, "body = input ? input.to_json : nil")
        emit_line(io, 5, "Request.new(operation.http_method, uri, headers, body)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "def self.parse_error(response : Response) : Exception")
        emit_line(io, 5, "error_type = error_type_from_headers(response.headers) || error_type_from_body(response.body)")
        emit_line(io, 5, "message = error_message_from_body(response.body)")
        emit_line(io, 5, "Errors.build(error_type, message)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_type_from_headers(headers : Hash(String, String)) : String?")
        emit_line(io, 5, "raw = headers[\"x-amzn-errortype\"]? || headers[\"x-amzn-errorType\"]?")
        emit_line(io, 5, "raw.try { |value| value.split(':').first }")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_type_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "parsed = JSON.parse(body).as_h?")
        emit_line(io, 5, "return nil unless parsed")
        emit_line(io)
        emit_line(io, 5, "parsed[\"__type\"]?.try(&.as_s).try { |value| value.split('#').last } ||")
        emit_line(io, 6, "parsed[\"code\"]?.try(&.as_s)")
        emit_line(io, 4, "rescue JSON::ParseException")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_message_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "parsed = JSON.parse(body).as_h?")
        emit_line(io, 5, "return nil unless parsed")
        emit_line(io)
        emit_line(io, 5, "parsed[\"message\"]?.try(&.as_s) || parsed[\"Message\"]?.try(&.as_s)")
        emit_line(io, 4, "rescue JSON::ParseException")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io, 3, "end")
        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.render_json_rpc(info : ServiceInfo) : String
      content_type = info.protocol == "json_1.1" ? "application/x-amz-json-1.1" : "application/x-amz-json-1.0"

      String.build do |io|
        emit_line(io, 0, "require \"json\"")
        emit_line(io, 0, "require \"../../runtime\"")
        emit_line(io)
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Protocol")
        emit_line(io, 3, "module JsonRpc")
        emit_line(io, 4, "CONTENT_TYPE = \"#{content_type}\"")
        emit_line(io)
        emit_line(io, 4, "def self.build_request(operation : Model::OperationModel, input, endpoint : String) : AwsSdk::Runtime::Http::Request")
        emit_line(io, 5, "raise ArgumentError.new(\"endpoint must not be empty\") if endpoint.empty?")
        emit_line(io, 5, "raise ArgumentError.new(\"targetPrefix is missing\") if Model::TARGET_PREFIX.empty?")
        emit_line(io)
        emit_line(io, 5, "uri = endpoint.rstrip(\"/\") + \"/\"")
        emit_line(io, 5, "headers = {")
        emit_line(io, 6, "\"content-type\" => CONTENT_TYPE,")
        emit_line(io, 6, "\"x-amz-target\" => \"\#{Model::TARGET_PREFIX}.\#{operation.name}\",")
        emit_line(io, 5, "}")
        emit_line(io, 5, "body = input ? input.to_json : \"{}\"")
        emit_line(io, 5, "AwsSdk::Runtime::Http::Request.new(\"POST\", uri, headers, body)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "def self.parse_error(response : AwsSdk::Runtime::Http::Response) : Exception")
        emit_line(io, 5, "error_type = error_type_from_headers(response.headers) || error_type_from_body(response.body)")
        emit_line(io, 5, "message = error_message_from_body(response.body)")
        emit_line(io, 5, "Errors.build(error_type, message)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "def self.parse_response(response : AwsSdk::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T")
        emit_line(io, 5, "body = response.body")
        emit_line(io, 5, "return output_type.from_json(\"{}\") unless body")
        emit_line(io, 5, "output_type.from_json(body)")
        emit_line(io, 4, "rescue ex : JSON::ParseException | JSON::SerializableError")
        emit_line(io, 5, "snippet = body ? body[0, 200] : \"\"")
        emit_line(io, 5, "details = snippet.empty? ? \"empty body\" : \"body=\#{snippet}\"")
        emit_line(io, 5, "raise AwsSdk::Runtime::Errors::ResponseParseError.new(\"Failed to parse \#{operation_name} response (\#{details}): \#{ex.message}\")")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_type_from_headers(headers : Hash(String, String)) : String?")
        emit_line(io, 5, "raw = headers[\"x-amzn-errortype\"]? || headers[\"x-amzn-errorType\"]?")
        emit_line(io, 5, "raw.try { |value| value.split(':').first }")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_type_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "parsed = JSON.parse(body).as_h?")
        emit_line(io, 5, "return nil unless parsed")
        emit_line(io)
        emit_line(io, 5, "parsed[\"__type\"]?.try(&.as_s).try { |value| value.split('#').last } ||")
        emit_line(io, 6, "parsed[\"code\"]?.try(&.as_s)")
        emit_line(io, 4, "rescue JSON::ParseException")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_message_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "parsed = JSON.parse(body).as_h?")
        emit_line(io, 5, "return nil unless parsed")
        emit_line(io)
        emit_line(io, 5, "parsed[\"message\"]?.try(&.as_s) || parsed[\"Message\"]?.try(&.as_s)")
        emit_line(io, 4, "rescue JSON::ParseException")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io, 3, "end")
        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.render_query(info : ServiceInfo) : String
      String.build do |io|
        emit_line(io, 0, "require \"json\"")
        emit_line(io, 0, "require \"uri\"")
        emit_line(io, 0, "require \"xml\"")
        emit_line(io, 0, "require \"../../runtime\"")
        emit_line(io)
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Protocol")
        emit_line(io, 3, "module Query")
        emit_line(io, 4, "CONTENT_TYPE = \"application/x-www-form-urlencoded; charset=utf-8\"")
        emit_line(io)
        emit_line(io, 4, "def self.build_request(operation : Model::OperationModel, input, endpoint : String) : AwsSdk::Runtime::Http::Request")
        emit_line(io, 5, "raise ArgumentError.new(\"endpoint must not be empty\") if endpoint.empty?")
        emit_line(io, 5, "params = URI::Params.new")
        emit_line(io, 5, "params.add(\"Action\", operation.name)")
        emit_line(io, 5, "params.add(\"Version\", Model::API_VERSION) unless Model::API_VERSION.empty?")
        emit_line(io, 5, "add_input_params(params, input)")
        emit_line(io, 5, "uri = endpoint.rstrip(\"/\") + \"/\"")
        emit_line(io, 5, "headers = {\"content-type\" => CONTENT_TYPE}")
        emit_line(io, 5, "AwsSdk::Runtime::Http::Request.new(\"POST\", uri, headers, params.to_s)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "def self.parse_error(response : AwsSdk::Runtime::Http::Response) : Exception")
        emit_line(io, 5, "error_type = error_type_from_body(response.body)")
        emit_line(io, 5, "message = error_message_from_body(response.body)")
        emit_line(io, 5, "Errors.build(error_type, message)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "def self.parse_response(response : AwsSdk::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T")
        emit_line(io, 5, "body = response.body")
        emit_line(io, 5, "return output_type.from_json(\"{}\") unless body")
        emit_line(io, 5, "document = XML.parse(body)")
        emit_line(io, 5, "result = result_node(document, operation_name) || document.root")
        emit_line(io, 5, "payload = result ? node_to_json(result) : JSON::Any.new({} of String => JSON::Any)")
        emit_line(io, 5, "output_type.from_json(payload.to_json)")
        emit_line(io, 4, "rescue ex : XML::Error | JSON::SerializableError")
        emit_line(io, 5, "snippet = body ? body[0, 200] : \"\"")
        emit_line(io, 5, "details = snippet.empty? ? \"empty body\" : \"body=\#{snippet}\"")
        emit_line(io, 5, "raise AwsSdk::Runtime::Errors::ResponseParseError.new(\"Failed to parse \#{operation_name} response (\#{details}): \#{ex.message}\")")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.add_input_params(params : URI::Params, input) : Nil")
        emit_line(io, 5, "return unless input")
        emit_line(io, 5, "payload = JSON.parse(input.to_json).as_h")
        emit_line(io, 5, "payload.each do |key, value|")
        emit_line(io, 6, "add_param(params, key, value)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.add_param(params : URI::Params, key : String, value : JSON::Any) : Nil")
        emit_line(io, 5, "case value.raw")
        emit_line(io, 5, "when Nil")
        emit_line(io, 5, "when Array")
        emit_line(io, 6, "value.as_a.each_with_index do |item, index|")
        emit_line(io, 7, "add_param(params, \"\#{key}.member.\#{index + 1}\", item)")
        emit_line(io, 6, "end")
        emit_line(io, 5, "when Hash")
        emit_line(io, 6, "params.add(key, value.to_json)")
        emit_line(io, 5, "when String")
        emit_line(io, 6, "params.add(key, value.as_s)")
        emit_line(io, 5, "when Int64")
        emit_line(io, 6, "params.add(key, value.as_i.to_s)")
        emit_line(io, 5, "when Float64")
        emit_line(io, 6, "params.add(key, value.as_f.to_s)")
        emit_line(io, 5, "when Bool")
        emit_line(io, 6, "params.add(key, value.as_bool ? \"true\" : \"false\")")
        emit_line(io, 5, "else")
        emit_line(io, 6, "params.add(key, value.to_json)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_type_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "document = XML.parse(body)")
        emit_line(io, 5, "node = document.xpath_node(\"//Error/Code\")")
        emit_line(io, 5, "node.try(&.content)")
        emit_line(io, 4, "rescue XML::Error")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_message_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "document = XML.parse(body)")
        emit_line(io, 5, "node = document.xpath_node(\"//Error/Message\")")
        emit_line(io, 5, "node.try(&.content)")
        emit_line(io, 4, "rescue XML::Error")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.result_node(document : XML::Node, operation_name : String) : XML::Node?")
        emit_line(io, 5, %q(document.xpath_node("//*[local-name()=\"#{operation_name}Result\"]") ||))
        emit_line(io, 6, "document.root.try do |root|")
        emit_line(io, 7, "root.children.find do |child|")
        emit_line(io, 8, "child.element? && child.name.ends_with?(\"Result\")")
        emit_line(io, 7, "end")
        emit_line(io, 6, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.node_to_json(node : XML::Node) : JSON::Any")
        emit_line(io, 5, "children = node.children.select(&.element?)")
        emit_line(io, 5, "if children.empty?")
        emit_line(io, 6, "JSON::Any.new(node.content)")
        emit_line(io, 5, "else")
        emit_line(io, 6, "grouped = Hash(String, Array(JSON::Any)).new { |hash, key| hash[key] = [] of JSON::Any }")
        emit_line(io, 6, "children.each do |child|")
        emit_line(io, 7, "grouped[child.name] << node_to_json(child)")
        emit_line(io, 6, "end")
        emit_line(io, 6, "hash = {} of String => JSON::Any")
        emit_line(io, 6, "grouped.each do |key, values|")
        emit_line(io, 7, "hash[key] = values.size == 1 ? values.first : JSON::Any.new(values)")
        emit_line(io, 6, "end")
        emit_line(io, 6, "JSON::Any.new(hash)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io, 3, "end")
        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.render_rest_xml(model : ServiceModel, info : ServiceInfo) : String
      operations = model.operations.values.sort_by(&.name)
      shapes = model.shapes.values.sort_by(&.name)

      String.build do |io|
        emit_line(io, 0, "require \"json\"")
        emit_line(io, 0, "require \"uri\"")
        emit_line(io, 0, "require \"xml\"")
        emit_line(io, 0, "require \"../../runtime\"")
        emit_line(io)
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Protocol")
        emit_line(io, 3, "module RestXml")
        emit_line(io, 4, "CONTENT_TYPE = \"application/xml\"")
        emit_line(io)
        emit_line(io, 4, "struct ShapeMember")
        emit_line(io, 5, "getter name : String")
        emit_line(io, 5, "getter shape : String")
        emit_line(io, 5, "getter location : String?")
        emit_line(io, 5, "getter location_name : String?")
        emit_line(io, 5, "getter flattened : Bool")
        emit_line(io)
        emit_line(io, 5, "def initialize(")
        emit_line(io, 6, "@name : String,")
        emit_line(io, 6, "@shape : String,")
        emit_line(io, 6, "@location : String?,")
        emit_line(io, 6, "@location_name : String?,")
        emit_line(io, 6, "@flattened : Bool")
        emit_line(io, 5, ")")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "struct Shape")
        emit_line(io, 5, "getter name : String")
        emit_line(io, 5, "getter type : String")
        emit_line(io, 5, "getter members : Array(ShapeMember)")
        emit_line(io, 5, "getter list_member : ShapeMember?")
        emit_line(io, 5, "getter flattened : Bool")
        emit_line(io)
        emit_line(io, 5, "def initialize(")
        emit_line(io, 6, "@name : String,")
        emit_line(io, 6, "@type : String,")
        emit_line(io, 6, "@members : Array(ShapeMember),")
        emit_line(io, 6, "@list_member : ShapeMember?,")
        emit_line(io, 6, "@flattened : Bool")
        emit_line(io, 5, ")")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "OPERATION_INPUT_SHAPES = {")
        operations.each do |operation|
          next unless (input = operation.input)
          emit_line(io, 5, "\"#{operation.name}\" => \"#{input.shape_name}\",")
        end
        emit_line(io, 4, "}")
        emit_line(io)
        emit_line(io, 4, "OPERATION_OUTPUT_SHAPES = {")
        operations.each do |operation|
          next unless (output = operation.output)
          emit_line(io, 5, "\"#{operation.name}\" => \"#{output.shape_name}\",")
        end
        emit_line(io, 4, "}")
        emit_line(io)
        emit_line(io, 4, "OPERATION_INPUT_ROOTS = {")
        operations.each do |operation|
          next unless (input = operation.input)
          root_name = trait_string(input.traits, "locationName") || input.shape_name
          emit_line(io, 5, "\"#{operation.name}\" => \"#{root_name}\",")
        end
        emit_line(io, 4, "}")
        emit_line(io)
        emit_line(io, 4, "OPERATION_INPUT_NAMESPACES = {")
        operations.each do |operation|
          next unless (input = operation.input)
          namespace = xml_namespace_uri(input)
          next unless namespace
          emit_line(io, 5, "\"#{operation.name}\" => \"#{namespace}\",")
        end
        emit_line(io, 4, "}")
        emit_line(io)
        emit_line(io, 4, "SHAPES = {")
        shapes.each do |shape|
          shape_type = shape_type_name(shape)
          case shape.type
          when ShapeType::Structure
            emit_line(io, 5, "\"#{shape.name}\" => Shape.new(")
            emit_line(io, 6, "\"#{shape.name}\",")
            emit_line(io, 6, "\"#{shape_type}\",")
            emit_line(io, 6, "[")
            shape.members.keys.sort.each do |member_name|
              ref = shape.members[member_name]
              location = trait_string(ref.traits, "location")
              location_name = trait_string(ref.traits, "locationName")
              flattened = trait_bool(ref.traits, "flattened")
              emit_line(io, 7, "ShapeMember.new(")
              emit_line(io, 8, "\"#{member_name}\",")
              emit_line(io, 8, "\"#{ref.shape_name}\",")
              emit_line(io, 8, "#{location ? "\"#{location}\"" : "nil"},")
              emit_line(io, 8, "#{location_name ? "\"#{location_name}\"" : "nil"},")
              emit_line(io, 8, "#{flattened}")
              emit_line(io, 7, "),")
            end
            emit_line(io, 6, "] of ShapeMember,")
            emit_line(io, 6, "nil,")
            emit_line(io, 6, "false")
            emit_line(io, 5, "),")
          when ShapeType::List
            member_ref = shape.member
            if member_ref
              location_name = trait_string(member_ref.traits, "locationName")
              flattened = trait_bool(shape.traits, "flattened") || trait_bool(member_ref.traits, "flattened")
              emit_line(io, 5, "\"#{shape.name}\" => Shape.new(")
              emit_line(io, 6, "\"#{shape.name}\",")
              emit_line(io, 6, "\"#{shape_type}\",")
              emit_line(io, 6, "[] of ShapeMember,")
              emit_line(io, 6, "ShapeMember.new(")
              emit_line(io, 7, "\"member\",")
              emit_line(io, 7, "\"#{member_ref.shape_name}\",")
              emit_line(io, 7, "nil,")
              emit_line(io, 7, "#{location_name ? "\"#{location_name}\"" : "nil"},")
              emit_line(io, 7, "#{trait_bool(member_ref.traits, "flattened")}")
              emit_line(io, 6, "),")
              emit_line(io, 6, "#{flattened}")
              emit_line(io, 5, "),")
            end
          else
            emit_line(io, 5, "\"#{shape.name}\" => Shape.new(")
            emit_line(io, 6, "\"#{shape.name}\",")
            emit_line(io, 6, "\"#{shape_type}\",")
            emit_line(io, 6, "[] of ShapeMember,")
            emit_line(io, 6, "nil,")
            emit_line(io, 6, "false")
            emit_line(io, 5, "),")
          end
        end
        emit_line(io, 4, "}")
        emit_line(io)
        emit_line(io, 4, "def self.build_request(operation : Model::OperationModel, input, endpoint : String) : AwsSdk::Runtime::Http::Request")
        emit_line(io, 5, "raise ArgumentError.new(\"endpoint must not be empty\") if endpoint.empty?")
        emit_line(io, 5, "payload = input ? JSON.parse(input.to_json).as_h : {} of String => JSON::Any")
        emit_line(io, 5, "input_shape = OPERATION_INPUT_SHAPES[operation.name]?")
        emit_line(io, 5, "raise ArgumentError.new(\"input shape missing for \#{operation.name}\") if input && input_shape.nil?")
        emit_line(io, 5, "uri = endpoint.rstrip(\"/\") + operation.request_uri")
        emit_line(io, 5, "uri = apply_uri_labels(uri, input_shape, payload) if input_shape")
        emit_line(io, 5, "params = URI::Params.new")
        emit_line(io, 5, "headers = {\"content-type\" => CONTENT_TYPE}")
        emit_line(io, 5, "apply_query_params(params, input_shape, payload) if input_shape")
        emit_line(io, 5, "apply_header_params(headers, input_shape, payload) if input_shape")
        emit_line(io, 5, "query = params.to_s")
        emit_line(io, 5, "uri = \"\#{uri}?\#{query}\" unless query.empty?")
        emit_line(io, 5, "body = if input_shape")
        emit_line(io, 6, "body_payload = body_payload(input_shape, payload)")
        emit_line(io, 6, "if body_payload.empty?")
        emit_line(io, 7, "nil")
        emit_line(io, 6, "else")
        emit_line(io, 7, "root_name = OPERATION_INPUT_ROOTS[operation.name]? || input_shape")
        emit_line(io, 7, "namespace = OPERATION_INPUT_NAMESPACES[operation.name]?")
        emit_line(io, 7, "build_xml(root_name, input_shape, body_payload, namespace)")
        emit_line(io, 6, "end")
        emit_line(io, 5, "else")
        emit_line(io, 6, "nil")
        emit_line(io, 5, "end")
        emit_line(io, 5, "AwsSdk::Runtime::Http::Request.new(operation.http_method, uri, headers, body)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "def self.parse_error(response : AwsSdk::Runtime::Http::Response) : Exception")
        emit_line(io, 5, "error_type = error_type_from_body(response.body)")
        emit_line(io, 5, "message = error_message_from_body(response.body)")
        emit_line(io, 5, "Errors.build(error_type, message)")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "def self.parse_response(response : AwsSdk::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T")
        emit_line(io, 5, "payload = {} of String => JSON::Any")
        emit_line(io, 5, "output_shape = OPERATION_OUTPUT_SHAPES[operation_name]?")
        emit_line(io, 5, "if (body = response.body)")
        emit_line(io, 6, "document = XML.parse(body)")
        emit_line(io, 6, "node = result_node(document, operation_name) || document.root")
        emit_line(io, 6, "if node && output_shape")
        emit_line(io, 7, "parsed = parse_node(node, output_shape)")
        emit_line(io, 7, "payload = parsed.as_h? || payload")
        emit_line(io, 6, "end")
        emit_line(io, 5, "end")
        emit_line(io, 5, "apply_header_values(payload, output_shape, response.headers) if output_shape")
        emit_line(io, 5, "output_type.from_json(JSON::Any.new(payload).to_json)")
        emit_line(io, 4, "rescue XML::Error")
        emit_line(io, 5, "output_type.from_json(\"{}\")")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.shape(name : String) : Shape")
        emit_line(io, 5, "SHAPES[name]? || raise ArgumentError.new(\"shape not found: \#{name}\")")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.member_key(member : ShapeMember) : String")
        emit_line(io, 5, "member.location_name || member.name")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.apply_uri_labels(uri : String, input_shape : String, payload : Hash(String, JSON::Any)) : String")
        emit_line(io, 5, "result = uri")
        emit_line(io, 5, "labels = uri.scan(/\\{([^\\}]+)\\}/).map { |match| match[1] }")
        emit_line(io, 5, "return result if labels.empty?")
        emit_line(io, 5, "shape = shape(input_shape)")
        emit_line(io, 5, "labels.each do |label|")
        emit_line(io, 6, "member = shape.members.find { |item| item.location == \"uri\" && member_key(item) == label }")
        emit_line(io, 6, "raise ArgumentError.new(\"missing uri label \#{label}\") unless member")
        emit_line(io, 6, "value = payload[member_key(member)]?")
        emit_line(io, 6, "raise ArgumentError.new(\"missing value for uri label \#{label}\") unless value")
        emit_line(io, 6, "member_shape = shape(member.shape)")
        emit_line(io, 6, "result = result.gsub(\"{\#{label}}\", scalar_text(member_shape.type, value))")
        emit_line(io, 5, "end")
        emit_line(io, 5, "result")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.apply_query_params(params : URI::Params, input_shape : String, payload : Hash(String, JSON::Any)) : Nil")
        emit_line(io, 5, "shape = shape(input_shape)")
        emit_line(io, 5, "shape.members.each do |member|")
        emit_line(io, 6, "next unless member.location == \"querystring\"")
        emit_line(io, 6, "key = member_key(member)")
        emit_line(io, 6, "value = payload[key]?")
        emit_line(io, 6, "next unless value")
        emit_line(io, 6, "add_param(params, key, value)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.apply_header_params(headers : Hash(String, String), input_shape : String, payload : Hash(String, JSON::Any)) : Nil")
        emit_line(io, 5, "shape = shape(input_shape)")
        emit_line(io, 5, "shape.members.each do |member|")
        emit_line(io, 6, "next unless member.location == \"header\"")
        emit_line(io, 6, "key = member_key(member)")
        emit_line(io, 6, "value = payload[key]?")
        emit_line(io, 6, "next unless value")
        emit_line(io, 6, "headers[key] = scalar_text(shape(member.shape).type, value)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.body_payload(input_shape : String, payload : Hash(String, JSON::Any)) : Hash(String, JSON::Any)")
        emit_line(io, 5, "shape = shape(input_shape)")
        emit_line(io, 5, "return {} of String => JSON::Any unless shape.type == \"structure\"")
        emit_line(io, 5, "body = {} of String => JSON::Any")
        emit_line(io, 5, "shape.members.each do |member|")
        emit_line(io, 6, "next unless member.location.nil?")
        emit_line(io, 6, "key = member_key(member)")
        emit_line(io, 6, "value = payload[key]?")
        emit_line(io, 6, "next unless value")
        emit_line(io, 6, "next if value.raw.nil?")
        emit_line(io, 6, "body[key] = value")
        emit_line(io, 5, "end")
        emit_line(io, 5, "body")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.build_xml(root_name : String, root_shape : String, payload : Hash(String, JSON::Any), xml_namespace : String?) : String")
        emit_line(io, 5, "XML.build do |xml|")
        emit_line(io, 6, "shape = shape(root_shape)")
        emit_line(io, 6, "if xml_namespace")
        emit_line(io, 7, "xml.element(root_name, {\"xmlns\" => xml_namespace}) do")
        emit_line(io, 8, "serialize_structure(xml, shape, payload)")
        emit_line(io, 7, "end")
        emit_line(io, 6, "else")
        emit_line(io, 7, "xml.element(root_name) do")
        emit_line(io, 8, "serialize_structure(xml, shape, payload)")
        emit_line(io, 7, "end")
        emit_line(io, 6, "end")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.serialize_structure(xml : XML::Builder, shape : Shape, payload : Hash(String, JSON::Any)) : Nil")
        emit_line(io, 5, "shape.members.each do |member|")
        emit_line(io, 6, "next unless member.location.nil?")
        emit_line(io, 6, "key = member_key(member)")
        emit_line(io, 6, "value = payload[key]?")
        emit_line(io, 6, "next unless value")
        emit_line(io, 6, "serialize_member(xml, member, value)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.serialize_member(xml : XML::Builder, member : ShapeMember, value : JSON::Any) : Nil")
        emit_line(io, 5, "shape = shape(member.shape)")
        emit_line(io, 5, "element_name = member_key(member)")
        emit_line(io, 5, "case shape.type")
        emit_line(io, 5, "when \"structure\"")
        emit_line(io, 6, "xml.element(element_name) do")
        emit_line(io, 7, "serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)")
        emit_line(io, 6, "end")
        emit_line(io, 5, "when \"list\"")
        emit_line(io, 6, "serialize_list(xml, element_name, shape, value, member.flattened)")
        emit_line(io, 5, "else")
        emit_line(io, 6, "xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.serialize_list(xml : XML::Builder, element_name : String, shape : Shape, value : JSON::Any, member_flattened : Bool) : Nil")
        emit_line(io, 5, "items = value.as_a? || [] of JSON::Any")
        emit_line(io, 5, "list_member = shape.list_member")
        emit_line(io, 5, "return unless list_member")
        emit_line(io, 5, "member_name = list_member.location_name || \"member\"")
        emit_line(io, 5, "flattened = shape.flattened || member_flattened")
        emit_line(io, 5, "if flattened")
        emit_line(io, 6, "items.each do |item|")
        emit_line(io, 7, "serialize_value(xml, member_name, list_member.shape, item)")
        emit_line(io, 6, "end")
        emit_line(io, 5, "else")
        emit_line(io, 6, "xml.element(element_name) do")
        emit_line(io, 7, "items.each do |item|")
        emit_line(io, 8, "serialize_value(xml, member_name, list_member.shape, item)")
        emit_line(io, 7, "end")
        emit_line(io, 6, "end")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.serialize_value(xml : XML::Builder, element_name : String, shape_name : String, value : JSON::Any) : Nil")
        emit_line(io, 5, "shape = shape(shape_name)")
        emit_line(io, 5, "case shape.type")
        emit_line(io, 5, "when \"structure\"")
        emit_line(io, 6, "xml.element(element_name) do")
        emit_line(io, 7, "serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)")
        emit_line(io, 6, "end")
        emit_line(io, 5, "when \"list\"")
        emit_line(io, 6, "serialize_list(xml, element_name, shape, value, false)")
        emit_line(io, 5, "else")
        emit_line(io, 6, "xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.scalar_text(shape_type : String, value : JSON::Any) : String")
        emit_line(io, 5, "case value.raw")
        emit_line(io, 5, "when Nil")
        emit_line(io, 6, "\"\"")
        emit_line(io, 5, "when String")
        emit_line(io, 6, "value.as_s")
        emit_line(io, 5, "when Int64")
        emit_line(io, 6, "value.as_i.to_s")
        emit_line(io, 5, "when Float64")
        emit_line(io, 6, "value.as_f.to_s")
        emit_line(io, 5, "when Bool")
        emit_line(io, 6, "value.as_bool ? \"true\" : \"false\"")
        emit_line(io, 5, "else")
        emit_line(io, 6, "value.to_json")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.parse_node(node : XML::Node, shape_name : String) : JSON::Any")
        emit_line(io, 5, "shape = shape(shape_name)")
        emit_line(io, 5, "case shape.type")
        emit_line(io, 5, "when \"structure\"")
        emit_line(io, 6, "JSON::Any.new(parse_structure(node, shape))")
        emit_line(io, 5, "when \"list\"")
        emit_line(io, 6, "JSON::Any.new(parse_list(node, shape))")
        emit_line(io, 5, "else")
        emit_line(io, 6, "parse_scalar(shape.type, node.content)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.parse_structure(node : XML::Node, shape : Shape) : Hash(String, JSON::Any)")
        emit_line(io, 5, "result = {} of String => JSON::Any")
        emit_line(io, 5, "shape.members.each do |member|")
        emit_line(io, 6, "next unless member.location.nil?")
        emit_line(io, 6, "shape_ref = shape(member.shape)")
        emit_line(io, 6, "key = member_key(member)")
        emit_line(io, 6, "if shape_ref.type == \"list\" && (shape_ref.flattened || member.flattened)")
        emit_line(io, 7, "list_member = shape_ref.list_member")
        emit_line(io, 7, "next unless list_member")
        emit_line(io, 7, "member_name = list_member.location_name || \"member\"")
        emit_line(io, 7, "items = node.children.select(&.element?).select { |child| child.name == member_name }")
        emit_line(io, 7, "values = items.map { |child| parse_node(child, list_member.shape) }")
        emit_line(io, 7, "result[key] = JSON::Any.new(values)")
        emit_line(io, 6, "else")
        emit_line(io, 7, "child = node.children.find { |item| item.element? && item.name == key }")
        emit_line(io, 7, "next unless child")
        emit_line(io, 7, "result[key] = parse_node(child, member.shape)")
        emit_line(io, 6, "end")
        emit_line(io, 5, "end")
        emit_line(io, 5, "result")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.parse_list(node : XML::Node, shape : Shape) : Array(JSON::Any)")
        emit_line(io, 5, "member = shape.list_member")
        emit_line(io, 5, "return [] of JSON::Any unless member")
        emit_line(io, 5, "member_name = member.location_name || \"member\"")
        emit_line(io, 5, "items = node.children.select(&.element?).select { |child| child.name == member_name }")
        emit_line(io, 5, "items.map { |child| parse_node(child, member.shape) }")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.parse_scalar(shape_type : String, value : String) : JSON::Any")
        emit_line(io, 5, "case shape_type")
        emit_line(io, 5, "when \"integer\", \"short\", \"byte\"")
        emit_line(io, 6, "JSON::Any.new(value.to_i)")
        emit_line(io, 5, "when \"long\", \"bigInteger\"")
        emit_line(io, 6, "JSON::Any.new(value.to_i64)")
        emit_line(io, 5, "when \"float\", \"double\", \"bigDecimal\"")
        emit_line(io, 6, "JSON::Any.new(value.to_f)")
        emit_line(io, 5, "when \"boolean\"")
        emit_line(io, 6, "JSON::Any.new(value.downcase == \"true\")")
        emit_line(io, 5, "else")
        emit_line(io, 6, "JSON::Any.new(value)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.apply_header_values(payload : Hash(String, JSON::Any), output_shape : String, headers : Hash(String, String)) : Nil")
        emit_line(io, 5, "shape = shape(output_shape)")
        emit_line(io, 5, "shape.members.each do |member|")
        emit_line(io, 6, "next unless member.location == \"header\"")
        emit_line(io, 6, "header_name = member_key(member)")
        emit_line(io, 6, "value = header_value(headers, header_name)")
        emit_line(io, 6, "next unless value")
        emit_line(io, 6, "payload[header_name] = parse_scalar(shape(member.shape).type, value)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.header_value(headers : Hash(String, String), name : String) : String?")
        emit_line(io, 5, "headers[name]? || headers[name.downcase]? || headers[name.upcase]? || headers.find { |key, _| key.downcase == name.downcase }.try(&.[1])")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.result_node(document : XML::Node, operation_name : String) : XML::Node?")
        emit_line(io, 5, %q(document.xpath_node("//*[local-name()=\"#{operation_name}Result\"]") ||))
        emit_line(io, 6, %q(document.xpath_node("//*[local-name()=\"#{operation_name}Response\"]")))
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.add_param(params : URI::Params, key : String, value : JSON::Any) : Nil")
        emit_line(io, 5, "case value.raw")
        emit_line(io, 5, "when Nil")
        emit_line(io, 5, "when Array")
        emit_line(io, 6, "value.as_a.each do |item|")
        emit_line(io, 7, "add_param(params, key, item)")
        emit_line(io, 6, "end")
        emit_line(io, 5, "when Hash")
        emit_line(io, 6, "params.add(key, value.to_json)")
        emit_line(io, 5, "when String")
        emit_line(io, 6, "params.add(key, value.as_s)")
        emit_line(io, 5, "when Int64")
        emit_line(io, 6, "params.add(key, value.as_i.to_s)")
        emit_line(io, 5, "when Float64")
        emit_line(io, 6, "params.add(key, value.as_f.to_s)")
        emit_line(io, 5, "when Bool")
        emit_line(io, 6, "params.add(key, value.as_bool ? \"true\" : \"false\")")
        emit_line(io, 5, "else")
        emit_line(io, 6, "params.add(key, value.to_json)")
        emit_line(io, 5, "end")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_type_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "document = XML.parse(body)")
        emit_line(io, 5, "node = document.xpath_node(\"//Code\")")
        emit_line(io, 5, "node.try(&.content)")
        emit_line(io, 4, "rescue XML::Error")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io)
        emit_line(io, 4, "private def self.error_message_from_body(body : String?) : String?")
        emit_line(io, 5, "return nil unless body")
        emit_line(io, 5, "document = XML.parse(body)")
        emit_line(io, 5, "node = document.xpath_node(\"//Message\")")
        emit_line(io, 5, "node.try(&.content)")
        emit_line(io, 4, "rescue XML::Error")
        emit_line(io, 5, "nil")
        emit_line(io, 4, "end")
        emit_line(io, 3, "end")
        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end

    private def self.member_json_name(member_name : String, ref : ShapeRef) : String
      ref.traits["locationName"]?.try(&.as_s) || member_name
    end

    private def self.sorted_members(shape : ShapeModel) : Array(String)
      shape.members.keys.sort_by do |member_name|
        ref = shape.members[member_name]
        {ref.required ? 0 : 1, member_name}
      end
    end

    private def self.type_for_shape_ref(ref : ShapeRef, shapes : Hash(String, ShapeModel)) : String
      shape = shapes[ref.shape_name]?
      return "JSON::Any" unless shape

      type_for_shape(shape, shapes)
    end

    private def self.type_for_shape(shape : ShapeModel, shapes : Hash(String, ShapeModel)) : String
      case shape.type
      when ShapeType::Structure
        "Types::#{shape.name}"
      when ShapeType::List
        member_type = shape.member ? type_for_shape_ref(shape.member.not_nil!, shapes) : "JSON::Any"
        "Array(#{member_type})"
      when ShapeType::Map
        key_type = shape.key ? type_for_shape_ref(shape.key.not_nil!, shapes) : "String"
        value_type = shape.value ? type_for_shape_ref(shape.value.not_nil!, shapes) : "JSON::Any"
        "Hash(#{key_type}, #{value_type})"
      when ShapeType::String
        "String"
      when ShapeType::Integer, ShapeType::Short, ShapeType::Byte
        "Int32"
      when ShapeType::Long, ShapeType::BigInteger
        "Int64"
      when ShapeType::Float, ShapeType::Double, ShapeType::BigDecimal
        "Float64"
      when ShapeType::Boolean
        "Bool"
      when ShapeType::Blob
        "Bytes"
      when ShapeType::Timestamp
        "Time"
      else
        "JSON::Any"
      end
    end

    private def self.exception_shape?(shape : ShapeModel) : Bool
      value = shape.traits["exception"]?
      return false unless value

      value.as_bool
    rescue JSON::Error
      false
    end

    private def self.to_snake_case(value : String) : String
      normalized = value.gsub(/[^A-Za-z0-9]+/, "_")
      normalized = normalized.gsub(/([a-z0-9])([A-Z])/, "\\1_\\2")
      normalized = normalized.gsub(/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
      normalized.downcase
    end

    private def self.emit_line(io : IO, indent : Int32 = 0, line : String = "") : Nil
      io << ("  " * indent) << line << "\n"
    end

    private def self.emit_doc(io : IO, indent : Int32, documentation : String?) : Nil
      return unless documentation

      normalized = normalize_doc(documentation)
      return if normalized.empty?

      wrap_doc(normalized, 100).each do |line|
        emit_line(io, indent, "# #{line}")
      end
    end

    private def self.normalize_doc(documentation : String) : String
      documentation
        .gsub(/<[^>]+>/, " ")
        .gsub(/\s+/, " ")
        .strip
    end

    private def self.wrap_doc(text : String, max_width : Int32) : Array(String)
      words = text.split
      lines = [] of String
      buffer = ""

      words.each do |word|
        if buffer.empty?
          buffer = word
        elsif buffer.size + 1 + word.size <= max_width
          buffer += " " + word
        else
          lines << buffer
          buffer = word
        end
      end

      lines << buffer unless buffer.empty?
      lines
    end

    private def self.trait_string(traits : Hash(String, JSON::Any), name : String) : String?
      traits[name]?.try(&.as_s?)
    rescue JSON::Error
      nil
    end

    private def self.trait_bool(traits : Hash(String, JSON::Any), name : String) : Bool
      traits[name]?.try(&.as_bool) || false
    rescue JSON::Error
      false
    end

    private def self.xml_namespace_uri(ref : ShapeRef) : String?
      raw = ref.traits["xmlNamespace"]?
      return nil unless raw

      if (value = raw.as_s?)
        value
      elsif (hash = raw.as_h?)
        hash["uri"]?.try(&.as_s?)
      end
    rescue JSON::Error
      nil
    end

    private def self.shape_type_name(shape : ShapeModel) : String
      case shape.type
      when ShapeType::Structure
        "structure"
      when ShapeType::List
        "list"
      when ShapeType::Map
        "map"
      when ShapeType::String
        "string"
      when ShapeType::Integer
        "integer"
      when ShapeType::Float
        "float"
      when ShapeType::Boolean
        "boolean"
      when ShapeType::Blob
        "blob"
      when ShapeType::Timestamp
        "timestamp"
      when ShapeType::Long
        "long"
      when ShapeType::Double
        "double"
      when ShapeType::Short
        "short"
      when ShapeType::Byte
        "byte"
      when ShapeType::Character
        "character"
      when ShapeType::BigInteger
        "bigInteger"
      when ShapeType::BigDecimal
        "bigDecimal"
      when ShapeType::Document
        "document"
      else
        "unknown"
      end
    end

    private def self.write_customizations_file(path : String, info : ServiceInfo) : Nil
      return if File.exists?(path)

      File.write(path, customizations_stub(info))
    end

    private def self.customizations_stub(info : ServiceInfo) : String
      String.build do |io|
        emit_line(io, 0, "module AwsSdk")
        emit_line(io, 1, "module #{info.module_name}")
        emit_line(io, 2, "module Customizations")
        emit_line(io, 2, "end")
        emit_line(io, 1, "end")
        emit_line(io, 0, "end")
      end
    end
  end
end
