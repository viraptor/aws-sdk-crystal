require "file_utils"
require "ecr"
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

      base_dir = File.join(output_root, "src", info.service_dir)
      FileUtils.mkdir_p(File.join(base_dir, "protocol"))
      customizations_dir = File.join(output_root, "src", "customizations", info.service_dir)
      FileUtils.mkdir_p(customizations_dir)

      File.write(File.join(output_root, "src", "#{info.service_dir}.cr"), root_require(info))
      File.write(File.join(base_dir, "types.cr"), render_types(model, info))
      File.write(File.join(base_dir, "errors.cr"), render_errors(model, info))
      File.write(File.join(base_dir, "model.cr"), render_model(model, info))
      File.write(File.join(base_dir, "client.cr"), render_client(model, info))
      File.write(File.join(base_dir, "protocol", "#{protocol_filename(protocol)}.cr"), render_protocol(model, info))
      write_customizations_file(File.join(customizations_dir, "customizations.cr"), info)
    end

    private def self.service_info(model : ServiceModel, api_path : String, protocol : String) : ServiceInfo
      metadata = model.metadata
      service_name = service_name_from_metadata(metadata, api_path)
      module_name = normalize_module_name(service_name)
      service_dir = normalize_service_dir(module_name)
      ServiceInfo.new(service_dir, module_name, protocol)
    end

    private def self.service_from_path(api_path : String) : String
      base_dir = File.dirname(api_path)
      service_dir = File.basename(File.dirname(base_dir))
      service_dir.empty? ? "service" : service_dir
    end

    private def self.service_name_from_metadata(metadata : Metadata, api_path : String) : String
      if (service_id = metadata.service_id)
        return service_id
      end

      name = metadata.raw["serviceAbbreviation"]?.try(&.as_s) ||
             metadata.raw["serviceFullName"]?.try(&.as_s)
      if name
        normalized = name.gsub(/AWS/, "").gsub(/Amazon/, "")
        normalized = normalized.gsub(/[^a-zA-Z0-9 ]+/, "")
        normalized = normalized.gsub(/^[0-9]+/, "")
        normalized = normalized.strip
        return normalized unless normalized.empty?
      end

      metadata.endpoint_prefix || metadata.signing_name || service_from_path(api_path)
    end

    private def self.normalize_service_dir(value : String) : String
      normalized = value.downcase.gsub(/[^a-z0-9]+/, "")
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
        ECR.embed("#{__DIR__}/templates/minimal_generator/root_require.ecr", io)
      end
    end

    private def self.render_types(model : ServiceModel, info : ServiceInfo) : String
      needs_time = model.shapes.values.any? { |shape| shape.type == ShapeType::Timestamp }
      shapes = model.shapes.values.select(&.structure?).sort_by(&.name)

      String.build do |io|
        ECR.embed("#{__DIR__}/templates/minimal_generator/types.ecr", io)
      end
    end

    private def self.render_errors(model : ServiceModel, info : ServiceInfo) : String
      error_shapes = model.shapes.values.select { |shape| exception_shape?(shape) }.sort_by(&.name)

      String.build do |io|
        ECR.embed("#{__DIR__}/templates/minimal_generator/errors.ecr", io)
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
        ECR.embed("#{__DIR__}/templates/minimal_generator/model.ecr", io)
      end
    end

    private def self.render_client(model : ServiceModel, info : ServiceInfo) : String
      operations = model.operations.values.sort_by(&.name)
      protocol_module = protocol_module_name(info.protocol)

      String.build do |io|
        ECR.embed("#{__DIR__}/templates/minimal_generator/client.ecr", io)
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
        ECR.embed("#{__DIR__}/templates/minimal_generator/protocol/rest_json.ecr", io)
      end
    end

    private def self.render_json_rpc(info : ServiceInfo) : String
      content_type = info.protocol == "json_1.1" ? "application/x-amz-json-1.1" : "application/x-amz-json-1.0"

      String.build do |io|
        ECR.embed("#{__DIR__}/templates/minimal_generator/protocol/json_rpc.ecr", io)
      end
    end

    private def self.render_query(info : ServiceInfo) : String
      String.build do |io|
        ECR.embed("#{__DIR__}/templates/minimal_generator/protocol/query.ecr", io)
      end
    end

    private def self.render_rest_xml(model : ServiceModel, info : ServiceInfo) : String
      operations = model.operations.values.sort_by(&.name)
      shapes = model.shapes.values.sort_by(&.name)

      String.build do |io|
        ECR.embed("#{__DIR__}/templates/minimal_generator/protocol/rest_xml.ecr", io)
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

  private def self.param_name(value : String) : String
    name = to_snake_case(value)
    name == "alias" ? "alias_" : name
  end

    private def self.doc_lines(documentation : String?, indent : Int32) : String
      return "" unless documentation

      normalized = normalize_doc(documentation)
      return "" if normalized.empty?

      String.build do |io|
        wrap_doc(normalized, 100).each do |line|
          io << ("  " * indent) << "# " << line << "\n"
        end
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
        ECR.embed("#{__DIR__}/templates/minimal_generator/customizations_stub.ecr", io)
      end
    end
  end
end
