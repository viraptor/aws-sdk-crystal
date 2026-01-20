require "json"
require "uri"
require "xml"
require "../../runtime"

module Aws
  module Redshift
    module Protocol
      module Query
        CONTENT_TYPE = "application/x-www-form-urlencoded; charset=utf-8"

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : Aws::Runtime::Http::Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          params = URI::Params.new
          params.add("Action", operation.name)
          params.add("Version", Model::API_VERSION) unless Model::API_VERSION.empty?
          add_input_params(params, input)
          uri = endpoint.rstrip("/") + "/"
          headers = {"content-type" => CONTENT_TYPE}
          Aws::Runtime::Http::Request.new("POST", uri, headers, params.to_s)
        end

        def self.parse_error(response : Aws::Runtime::Http::Response) : Exception
          error_type = error_type_from_body(response.body)
          message = error_message_from_body(response.body)
          Errors.build(error_type, message)
        end

        def self.parse_response(response : Aws::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T
          body = response.body
          return output_type.from_json("{}") unless body
          document = XML.parse(body)
          result = result_node(document, operation_name) || document.root
          payload = result ? node_to_json(result) : JSON::Any.new({} of String => JSON::Any)
          output_type.from_json(payload.to_json)
        rescue ex : XML::Error | JSON::SerializableError
          snippet = body ? body[0, 200] : ""
          details = snippet.empty? ? "empty body" : "body=#{snippet}"
          raise Aws::Runtime::Errors::ResponseParseError.new("Failed to parse #{operation_name} response (#{details}): #{ex.message}")
        end

        private def self.add_input_params(params : URI::Params, input) : Nil
          return unless input
          payload = JSON.parse(input.to_json).as_h
          payload.each do |key, value|
            add_param(params, key, value)
          end
        end

        private def self.add_param(params : URI::Params, key : String, value : JSON::Any) : Nil
          case value.raw
          when Nil
          when Array
            value.as_a.each_with_index do |item, index|
              add_param(params, "#{key}.member.#{index + 1}", item)
            end
          when Hash
            params.add(key, value.to_json)
          when String
            params.add(key, value.as_s)
          when Int64
            params.add(key, value.as_i.to_s)
          when Float64
            params.add(key, value.as_f.to_s)
          when Bool
            params.add(key, value.as_bool ? "true" : "false")
          else
            params.add(key, value.to_json)
          end
        end

        private def self.error_type_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Error/Code")
          node.try(&.content)
        rescue XML::Error
          nil
        end

        private def self.error_message_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Error/Message")
          node.try(&.content)
        rescue XML::Error
          nil
        end

        private def self.result_node(document : XML::Node, operation_name : String) : XML::Node?
          document.xpath_node("//*[local-name()=\"#{operation_name}Result\"]") ||
            document.root.try do |root|
              root.children.find do |child|
                child.element? && child.name.ends_with?("Result")
              end
            end
        end

        private def self.node_to_json(node : XML::Node) : JSON::Any
          children = node.children.select(&.element?)
          if children.empty?
            JSON::Any.new(node.content)
          else
            grouped = Hash(String, Array(JSON::Any)).new { |hash, key| hash[key] = [] of JSON::Any }
            children.each do |child|
              grouped[child.name] << node_to_json(child)
            end
            hash = {} of String => JSON::Any
            grouped.each do |key, values|
              hash[key] = values.size == 1 ? values.first : JSON::Any.new(values)
            end
            JSON::Any.new(hash)
          end
        end
      end
    end
  end
end
