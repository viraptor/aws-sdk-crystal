require "json"
require "./model"
require "./customizations"

module CrystalSdkGenerator
  class ModelLoader
    def self.load(api_path : String) : ServiceModel
      data = JSON.parse(File.read(api_path))
      root = data.as_h
      metadata_hash = hash_or_empty(root["metadata"]?)
      docs = load_docs(api_path)

      Customizations.apply(Customizations.service_key(api_path, metadata_hash), root)
      metadata_hash = hash_or_empty(root["metadata"]?)

      metadata = Metadata.new(metadata_hash)
      shapes = parse_shapes(root["shapes"].as_h, docs)
      operations = parse_operations(root["operations"].as_h, docs)
      paginators = load_optional_section(api_path, "paginators-1.json", "pagination").try do |rules|
        PaginatorsModel.new(rules)
      end
      waiters = load_optional_section(api_path, "waiters-2.json", "waiters").try do |rules|
        WaitersModel.new(rules)
      end
      resources = load_optional_section(api_path, "resources-1.json", "resources").try do |rules|
        ResourcesModel.new(rules)
      end
      endpoint_rule_set = load_optional_file(api_path, "endpoint-rule-set-1.json").try do |rules|
        EndpointRuleSetModel.new(rules)
      end
      endpoint_tests = load_optional_file(api_path, "endpoint-tests-1.json").try do |tests|
        EndpointTestsModel.new(tests)
      end

      ServiceModel.new(metadata, operations, shapes, paginators, waiters, resources, endpoint_rule_set, endpoint_tests)
    end

    private def self.parse_shapes(source : Hash(String, JSON::Any), docs : DocsModel) : Hash(String, ShapeModel)
      shapes = {} of String => ShapeModel

      source.each do |name, shape_any|
        shape_hash = shape_any.as_h
        type = ShapeType.from_json(shape_hash["type"].as_s)
        required_members = shape_hash["required"]?.try(&.as_a.map(&.as_s)) || [] of String
        traits = shape_traits(shape_hash)
        shape_doc = docs.shape_docs[name]?
        member_docs = docs.shape_member_docs[name]?

        members = {} of String => ShapeRef
        member_ref = nil
        key_ref = nil
        value_ref = nil

        case type
        when ShapeType::Structure
          if (members_any = shape_hash["members"]?)
            members_any.as_h.each do |member_name, member_any|
              member_doc = member_docs.try { |docs| docs.fetch(member_name, nil) }
              members[member_name] = parse_shape_ref(member_any, required_members.includes?(member_name), member_doc)
            end
          end
        when ShapeType::List
          member_doc = member_docs.try { |docs| docs.fetch("member", nil) }
          member_ref = shape_hash["member"]?.try { |ref| parse_shape_ref(ref, false, member_doc) }
        when ShapeType::Map
          key_doc = member_docs.try { |docs| docs.fetch("key", nil) }
          value_doc = member_docs.try { |docs| docs.fetch("value", nil) }
          key_ref = shape_hash["key"]?.try { |ref| parse_shape_ref(ref, false, key_doc) }
          value_ref = shape_hash["value"]?.try { |ref| parse_shape_ref(ref, false, value_doc) }
        else
          # Scalar shapes have no nested refs.
        end

        shapes[name] = ShapeModel.new(
          name: name,
          type: type,
          traits: traits,
          required_members: required_members,
          members: members,
          member: member_ref,
          key: key_ref,
          value: value_ref,
          documentation: shape_doc
        )
      end

      shapes
    end

    private def self.parse_operations(source : Hash(String, JSON::Any), docs : DocsModel) : Hash(String, OperationModel)
      operations = {} of String => OperationModel

      source.each do |name, operation_any|
        op_hash = operation_any.as_h
        http_hash = op_hash["http"]?.try(&.as_h)

        input_ref = op_hash["input"]?.try { |ref| parse_shape_ref(ref) }
        output_ref = op_hash["output"]?.try { |ref| parse_shape_ref(ref) }

        errors = op_hash["errors"]?.try do |errors_any|
          errors_any.as_a.map do |error_any|
            error_any.as_h["shape"].as_s
          end
        end || [] of String

        traits = operation_traits(op_hash)

        operations[name] = OperationModel.new(
          name: name,
          http_method: http_hash.try(&.["method"]?.try(&.as_s)),
          request_uri: http_hash.try(&.["requestUri"]?.try(&.as_s)),
          input: input_ref,
          output: output_ref,
          errors: errors,
          traits: traits,
          documentation: docs.operation_docs[name]?
        )
      end

      operations
    end

    private def self.parse_shape_ref(ref_any : JSON::Any, required : Bool = false, documentation : String? = nil) : ShapeRef
      ref_hash = ref_any.as_h
      shape_name = ref_hash["shape"].as_s
      traits = ref_hash.reject { |key, _| key == "shape" }
      ShapeRef.new(shape_name, traits, required, documentation)
    end

    private def self.shape_traits(shape_hash : Hash(String, JSON::Any)) : Hash(String, JSON::Any)
      shape_hash.reject do |key, _|
        key == "type" || key == "members" || key == "member" || key == "key" || key == "value" || key == "required"
      end
    end

    private def self.operation_traits(op_hash : Hash(String, JSON::Any)) : Hash(String, JSON::Any)
      op_hash.reject do |key, _|
        key == "http" || key == "input" || key == "output" || key == "errors"
      end
    end

    private def self.hash_or_empty(value : JSON::Any?) : Hash(String, JSON::Any)
      value ? value.as_h : {} of String => JSON::Any
    end

    private def self.load_docs(api_path : String) : DocsModel
      base_dir = File.dirname(api_path)
      path = File.join(base_dir, "docs-2.json")
      return DocsModel.empty unless File.exists?(path)

      data = JSON.parse(File.read(path)).as_h
      operation_docs = parse_operation_docs(data["operations"]?)
      shape_docs, shape_member_docs = parse_shape_docs(data["shapes"]?)
      DocsModel.new(operation_docs, shape_docs, shape_member_docs)
    end

    private def self.parse_operation_docs(value : JSON::Any?) : Hash(String, String)
      return {} of String => String unless value

      docs = {} of String => String
      value.as_h.each do |name, doc_any|
        doc = doc_any.as_s?
        docs[name] = doc if doc
      end
      docs
    end

    private def self.parse_shape_docs(value : JSON::Any?) : Tuple(Hash(String, String), Hash(String, Hash(String, String)))
      shape_docs = {} of String => String
      member_docs = Hash(String, Hash(String, String)).new { |hash, key| hash[key] = {} of String => String }

      return {shape_docs, member_docs} unless value

      value.as_h.each do |shape_name, shape_any|
        shape_hash = shape_any.as_h
        base_doc = shape_hash["base"]?.try(&.as_s?)
        shape_docs[shape_name] = base_doc if base_doc

        refs = shape_hash["refs"]?.try(&.as_h)
        next unless refs

        refs.each do |ref_key, ref_doc_any|
          doc = ref_doc_any.as_s?
          next unless doc

          parts = ref_key.split("$", 2)
          next unless parts.size == 2

          owner = parts[0]
          member = parts[1]
          member_docs[owner][member] = doc
        end
      end

      {shape_docs, member_docs}
    end

    private def self.load_optional_section(api_path : String, filename : String, key : String) : Hash(String, JSON::Any)?
      base_dir = File.dirname(api_path)
      path = File.join(base_dir, filename)
      return nil unless File.exists?(path)

      data = JSON.parse(File.read(path)).as_h
      section = data[key]?
      return nil unless section

      section.as_h
    end

    private def self.load_optional_file(api_path : String, filename : String) : Hash(String, JSON::Any)?
      base_dir = File.dirname(api_path)
      path = File.join(base_dir, filename)
      return nil unless File.exists?(path)

      JSON.parse(File.read(path)).as_h
    end
  end
end
