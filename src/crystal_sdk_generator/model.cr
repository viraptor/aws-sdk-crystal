module CrystalSdkGenerator
  struct Metadata
    getter raw : Hash(String, JSON::Any)

    def initialize(@raw : Hash(String, JSON::Any))
    end

    def protocol : String?
      raw["protocol"]?.try(&.as_s)
    end

    def protocols : Array(String)?
      raw["protocols"]?.try(&.as_a.map(&.as_s))
    end

    def json_version : String?
      raw["jsonVersion"]?.try(&.as_s)
    end

    def service_id : String?
      raw["serviceId"]?.try(&.as_s)
    end

    def api_version : String?
      raw["apiVersion"]?.try(&.as_s)
    end

    def signing_name : String?
      raw["signingName"]?.try(&.as_s)
    end

    def endpoint_prefix : String?
      raw["endpointPrefix"]?.try(&.as_s)
    end

  def target_prefix : String?
    raw["targetPrefix"]?.try(&.as_s)
  end
  end

  struct ShapeRef
    getter shape_name : String
    getter traits : Hash(String, JSON::Any)
    getter required : Bool
    getter documentation : String?

    def initialize(
      @shape_name : String,
      @traits : Hash(String, JSON::Any),
      @required : Bool = false,
      @documentation : String? = nil
    )
    end

    def trait?(name : String) : Bool
      traits.has_key?(name)
    end
  end

  struct OperationModel
    getter name : String
    getter http_method : String?
    getter request_uri : String?
    getter input : ShapeRef?
    getter output : ShapeRef?
    getter errors : Array(String)
    getter traits : Hash(String, JSON::Any)
    getter documentation : String?

    def initialize(
      @name : String,
      @http_method : String?,
      @request_uri : String?,
      @input : ShapeRef?,
      @output : ShapeRef?,
      @errors : Array(String),
      @traits : Hash(String, JSON::Any),
      @documentation : String? = nil
    )
    end
  end

  enum ShapeType
    Structure
    List
    Map
    String
    Integer
    Float
    Boolean
    Blob
    Timestamp
    Long
    Double
    Short
    Byte
    Character
    BigInteger
    BigDecimal
    Document
    Unknown

    def self.from_json(value : ::String) : ShapeType
      case value
      when "structure"  then Structure
      when "list"       then List
      when "map"        then Map
      when "string"     then String
      when "integer"    then Integer
      when "float"      then Float
      when "boolean"    then Boolean
      when "blob"       then Blob
      when "timestamp"  then Timestamp
      when "long"       then Long
      when "double"     then Double
      when "short"      then Short
      when "byte"       then Byte
      when "character"  then Character
      when "bigInteger" then BigInteger
      when "bigDecimal" then BigDecimal
      when "document"   then Document
      else
        Unknown
      end
    end
  end

  struct ShapeModel
    getter name : String
    getter type : ShapeType
    getter traits : Hash(String, JSON::Any)
    getter required_members : Array(String)
    getter members : Hash(String, ShapeRef)
    getter member : ShapeRef?
    getter key : ShapeRef?
    getter value : ShapeRef?
    getter documentation : String?

    def initialize(
      @name : String,
      @type : ShapeType,
      @traits : Hash(String, JSON::Any),
      @required_members : Array(String),
      @members : Hash(String, ShapeRef),
      @member : ShapeRef?,
      @key : ShapeRef?,
      @value : ShapeRef?,
      @documentation : String? = nil
    )
    end

    def structure?
      type == ShapeType::Structure
    end
  end

  struct PaginatorsModel
    getter rules : Hash(String, JSON::Any)

    def initialize(@rules : Hash(String, JSON::Any))
    end
  end

  struct WaitersModel
    getter rules : Hash(String, JSON::Any)

    def initialize(@rules : Hash(String, JSON::Any))
    end
  end

  struct ResourcesModel
    getter rules : Hash(String, JSON::Any)

    def initialize(@rules : Hash(String, JSON::Any))
    end
  end

  struct EndpointRuleSetModel
    getter raw : Hash(String, JSON::Any)

    def initialize(@raw : Hash(String, JSON::Any))
    end

    def version : String?
      raw["version"]?.try(&.as_s)
    end

    def parameters : Hash(String, JSON::Any)
      raw["parameters"]?.try(&.as_h) || {} of String => JSON::Any
    end

    def rules : Array(JSON::Any)
      raw["rules"]?.try(&.as_a) || [] of JSON::Any
    end
  end

  struct EndpointTestsModel
    getter raw : Hash(String, JSON::Any)

    def initialize(@raw : Hash(String, JSON::Any))
    end

    def version : String?
      raw["version"]?.try(&.as_s)
    end

    def test_cases : Array(JSON::Any)
      raw["testCases"]?.try(&.as_a) || [] of JSON::Any
    end
  end

  struct DocsModel
    getter operation_docs : Hash(String, String)
    getter shape_docs : Hash(String, String)
    getter shape_member_docs : Hash(String, Hash(String, String))

    def initialize(
      @operation_docs : Hash(String, String),
      @shape_docs : Hash(String, String),
      @shape_member_docs : Hash(String, Hash(String, String))
    )
    end

    def self.empty : DocsModel
      DocsModel.new(
        {} of String => String,
        {} of String => String,
        {} of String => Hash(String, String)
      )
    end
  end

  struct ServiceModel
    getter metadata : Metadata
    getter operations : Hash(String, OperationModel)
    getter shapes : Hash(String, ShapeModel)
    getter paginators : PaginatorsModel?
    getter waiters : WaitersModel?
    getter resources : ResourcesModel?
    getter endpoint_rule_set : EndpointRuleSetModel?
    getter endpoint_tests : EndpointTestsModel?

    def initialize(
      @metadata : Metadata,
      @operations : Hash(String, OperationModel),
      @shapes : Hash(String, ShapeModel),
      @paginators : PaginatorsModel?,
      @waiters : WaitersModel?,
      @resources : ResourcesModel?,
      @endpoint_rule_set : EndpointRuleSetModel?,
      @endpoint_tests : EndpointTestsModel?
    )
    end
  end
end
