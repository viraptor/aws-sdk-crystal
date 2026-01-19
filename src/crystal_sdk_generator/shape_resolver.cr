module CrystalSdkGenerator
  class ShapeNotFoundError < Exception
  end

  class ShapeResolver
    getter model : ServiceModel

    def initialize(@model : ServiceModel)
    end

    def shape(name : String) : ShapeModel
      model.shapes[name]? || raise ShapeNotFoundError.new("shape not found: #{name}")
    end

    def resolve(ref : ShapeRef) : ShapeModel
      shape(ref.shape_name)
    end

    def member(shape_name : String, member_name : String) : ShapeRef
      shape = shape(shape_name)
      raise ShapeNotFoundError.new("shape is not a structure: #{shape_name}") unless shape.structure?

      shape.members[member_name]? || raise ShapeNotFoundError.new("member not found: #{shape_name}.#{member_name}")
    end

    def list_member(shape_name : String) : ShapeRef
      shape = shape(shape_name)
      raise ShapeNotFoundError.new("shape is not a list: #{shape_name}") unless shape.type == ShapeType::List

      shape.member || raise ShapeNotFoundError.new("list member not found: #{shape_name}")
    end

    def map_key(shape_name : String) : ShapeRef
      shape = shape(shape_name)
      raise ShapeNotFoundError.new("shape is not a map: #{shape_name}") unless shape.type == ShapeType::Map

      shape.key || raise ShapeNotFoundError.new("map key not found: #{shape_name}")
    end

    def map_value(shape_name : String) : ShapeRef
      shape = shape(shape_name)
      raise ShapeNotFoundError.new("shape is not a map: #{shape_name}") unless shape.type == ShapeType::Map

      shape.value || raise ShapeNotFoundError.new("map value not found: #{shape_name}")
    end

    def effective_traits(ref : ShapeRef) : Hash(String, JSON::Any)
      shape_traits = resolve(ref).traits
      shape_traits.merge(ref.traits)
    end
  end
end
