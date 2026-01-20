require "json"
require "time"

module AwsSdk
  module IoTSiteWise
    module Types

      # Access is denied.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains an access policy that defines an identity's access to an IoT SiteWise Monitor resource.

      struct AccessPolicySummary
        include JSON::Serializable

        # The ID of the access policy.

        @[JSON::Field(key: "id")]
        getter id : String

        # The identity (an IAM Identity Center user, an IAM Identity Center group, or an IAM user).

        @[JSON::Field(key: "identity")]
        getter identity : Types::Identity

        # The permissions for the access policy. Note that a project ADMINISTRATOR is also known as a project
        # owner.

        @[JSON::Field(key: "permission")]
        getter permission : String

        # The IoT SiteWise Monitor resource (a portal or project).

        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource

        # The date the access policy was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The date the access policy was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time?

        def initialize(
          @id : String,
          @identity : Types::Identity,
          @permission : String,
          @resource : Types::Resource,
          @creation_date : Time? = nil,
          @last_update_date : Time? = nil
        )
        end
      end

      # Contains a definition for an action.

      struct ActionDefinition
        include JSON::Serializable

        # The ID of the action definition.

        @[JSON::Field(key: "actionDefinitionId")]
        getter action_definition_id : String

        # The name of the action definition.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # The type of the action definition.

        @[JSON::Field(key: "actionType")]
        getter action_type : String

        def initialize(
          @action_definition_id : String,
          @action_name : String,
          @action_type : String
        )
        end
      end

      # The JSON payload of the action.

      struct ActionPayload
        include JSON::Serializable

        # The payload of the action in a JSON string.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String

        def initialize(
          @string_value : String
        )
        end
      end

      # Contains the summary of the actions, including information about where the action resolves to.

      struct ActionSummary
        include JSON::Serializable

        # The ID of the action definition.

        @[JSON::Field(key: "actionDefinitionId")]
        getter action_definition_id : String?

        # The ID of the action.

        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        # The detailed resource this action resolves to.

        @[JSON::Field(key: "resolveTo")]
        getter resolve_to : Types::ResolveTo?

        # The resource the action will be taken on.

        @[JSON::Field(key: "targetResource")]
        getter target_resource : Types::TargetResource?

        def initialize(
          @action_definition_id : String? = nil,
          @action_id : String? = nil,
          @resolve_to : Types::ResolveTo? = nil,
          @target_resource : Types::TargetResource? = nil
        )
        end
      end

      # Contains aggregated asset property values (for example, average, minimum, and maximum).

      struct AggregatedValue
        include JSON::Serializable

        # The date the aggregating computations occurred, in Unix epoch time.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The value of the aggregates.

        @[JSON::Field(key: "value")]
        getter value : Types::Aggregates

        # The quality of the aggregated data.

        @[JSON::Field(key: "quality")]
        getter quality : String?

        def initialize(
          @timestamp : Time,
          @value : Types::Aggregates,
          @quality : String? = nil
        )
        end
      end

      # Contains the (pre-calculated) aggregate values for an asset property.

      struct Aggregates
        include JSON::Serializable

        # The average (mean) value of the time series over a time interval window.

        @[JSON::Field(key: "average")]
        getter average : Float64?

        # The count of data points in the time series over a time interval window.

        @[JSON::Field(key: "count")]
        getter count : Float64?

        # The maximum value of the time series over a time interval window.

        @[JSON::Field(key: "maximum")]
        getter maximum : Float64?

        # The minimum value of the time series over a time interval window.

        @[JSON::Field(key: "minimum")]
        getter minimum : Float64?

        # The standard deviation of the time series over a time interval window.

        @[JSON::Field(key: "standardDeviation")]
        getter standard_deviation : Float64?

        # The sum of the time series over a time interval window.

        @[JSON::Field(key: "sum")]
        getter sum : Float64?

        def initialize(
          @average : Float64? = nil,
          @count : Float64? = nil,
          @maximum : Float64? = nil,
          @minimum : Float64? = nil,
          @standard_deviation : Float64? = nil,
          @sum : Float64? = nil
        )
        end
      end

      # Contains the configuration information of an alarm created in an IoT SiteWise Monitor portal. You
      # can use the alarm to monitor an asset property and get notified when the asset property value is
      # outside a specified range. For more information, see Monitoring with alarms in the IoT SiteWise
      # Application Guide .

      struct Alarms
        include JSON::Serializable

        # The ARN of the IAM role that allows the alarm to perform actions and access Amazon Web Services
        # resources and services, such as IoT Events.

        @[JSON::Field(key: "alarmRoleArn")]
        getter alarm_role_arn : String

        # The ARN of the Lambda function that manages alarm notifications. For more information, see Managing
        # alarm notifications in the IoT Events Developer Guide .

        @[JSON::Field(key: "notificationLambdaArn")]
        getter notification_lambda_arn : String?

        def initialize(
          @alarm_role_arn : String,
          @notification_lambda_arn : String? = nil
        )
        end
      end

      # A filter used to match data bindings based on a specific asset. This filter identifies all
      # computation models referencing a particular asset in their data bindings.

      struct AssetBindingValueFilter
        include JSON::Serializable

        # The ID of the asset to filter data bindings by. Only data bindings referencing this specific asset
        # are matched.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        def initialize(
          @asset_id : String
        )
        end
      end

      # Contains information about a composite model in an asset. This object contains the asset's
      # properties that you define in the composite model.

      struct AssetCompositeModel
        include JSON::Serializable

        # The name of the composite model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The asset properties that this composite model defines.

        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::AssetProperty)

        # The type of the composite model. For alarm composite models, this type is AWS/ALARM .

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the composite model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The external ID of the asset composite model. For more information, see Using external IDs in the
        # IoT SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID of the asset composite model.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @name : String,
          @properties : Array(Types::AssetProperty),
          @type : String,
          @description : String? = nil,
          @external_id : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Represents one level between a composite model and the root of the asset.

      struct AssetCompositeModelPathSegment
        include JSON::Serializable

        # The ID of the path segment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the path segment.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains a summary of the composite model for a specific asset.

      struct AssetCompositeModelSummary
        include JSON::Serializable

        # A description of the composite model that this summary describes.

        @[JSON::Field(key: "description")]
        getter description : String

        # The ID of the composite model that this summary describes.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the composite model that this summary describes.

        @[JSON::Field(key: "name")]
        getter name : String

        # The path that includes all the components of the asset model for the asset.

        @[JSON::Field(key: "path")]
        getter path : Array(Types::AssetCompositeModelPathSegment)

        # The type of asset model. ASSET_MODEL – (default) An asset model that you can use to create assets.
        # Can't be included as a component in another asset model. COMPONENT_MODEL – A reusable component that
        # you can include in the composite models of other asset models. You can't create assets directly from
        # this type of asset model.

        @[JSON::Field(key: "type")]
        getter type : String

        # An external ID to assign to the asset model. If the composite model is a derived composite model, or
        # one nested inside a component model, you can only set the external ID using
        # UpdateAssetModelCompositeModel and specifying the derived ID of the model or property from the
        # created model it's a part of.

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        def initialize(
          @description : String,
          @id : String,
          @name : String,
          @path : Array(Types::AssetCompositeModelPathSegment),
          @type : String,
          @external_id : String? = nil
        )
        end
      end

      # Contains error details for the requested associate project asset action.

      struct AssetErrorDetails
        include JSON::Serializable

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : String

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @asset_id : String,
          @code : String,
          @message : String
        )
        end
      end

      # Describes an asset hierarchy that contains a hierarchy's name and ID.

      struct AssetHierarchy
        include JSON::Serializable

        # The hierarchy name provided in the CreateAssetModel or UpdateAssetModel API operation.

        @[JSON::Field(key: "name")]
        getter name : String

        # The external ID of the hierarchy, if it has one. When you update an asset hierarchy, you may assign
        # an external ID if it doesn't already have one. You can't change the external ID of an asset
        # hierarchy that already has one. For more information, see Using external IDs in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID of the hierarchy. This ID is a hierarchyId .

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @name : String,
          @external_id : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains information about a parent asset and a child asset that are related through an asset
      # hierarchy.

      struct AssetHierarchyInfo
        include JSON::Serializable

        # The ID of the child asset in this asset relationship.

        @[JSON::Field(key: "childAssetId")]
        getter child_asset_id : String?

        # The ID of the parent asset in this asset relationship.

        @[JSON::Field(key: "parentAssetId")]
        getter parent_asset_id : String?

        def initialize(
          @child_asset_id : String? = nil,
          @parent_asset_id : String? = nil
        )
        end
      end

      # A filter used to match data bindings based on a specific asset model. This filter identifies all
      # computation models referencing a particular asset model in their data bindings.

      struct AssetModelBindingValueFilter
        include JSON::Serializable

        # The ID of the asset model to filter data bindings by. Only data bindings referemncing this specific
        # asset model are matched.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        def initialize(
          @asset_model_id : String
        )
        end
      end

      # Contains information about a composite model in an asset model. This object contains the asset
      # property definitions that you define in the composite model.

      struct AssetModelCompositeModel
        include JSON::Serializable

        # The name of the composite model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the composite model. For alarm composite models, this type is AWS/ALARM .

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the composite model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The external ID of the asset model composite model. For more information, see Using external IDs in
        # the IoT SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID of the asset model composite model.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The asset property definitions for this composite model.

        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::AssetModelProperty)?

        def initialize(
          @name : String,
          @type : String,
          @description : String? = nil,
          @external_id : String? = nil,
          @id : String? = nil,
          @properties : Array(Types::AssetModelProperty)? = nil
        )
        end
      end

      # Contains a composite model definition in an asset model. This composite model definition is applied
      # to all assets created from the asset model.

      struct AssetModelCompositeModelDefinition
        include JSON::Serializable

        # The name of the composite model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the composite model. For alarm composite models, this type is AWS/ALARM .

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the composite model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An external ID to assign to the composite model. The external ID must be unique among composite
        # models within this asset model. For more information, see Using external IDs in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID to assign to the composite model, if desired. IoT SiteWise automatically generates a unique
        # ID for you, so this parameter is never required. However, if you prefer to supply your own ID
        # instead, you can specify it here in UUID format. If you specify your own ID, it must be globally
        # unique.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The asset property definitions for this composite model.

        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::AssetModelPropertyDefinition)?

        def initialize(
          @name : String,
          @type : String,
          @description : String? = nil,
          @external_id : String? = nil,
          @id : String? = nil,
          @properties : Array(Types::AssetModelPropertyDefinition)? = nil
        )
        end
      end

      # Represents one level between a composite model and the root of the asset model.

      struct AssetModelCompositeModelPathSegment
        include JSON::Serializable

        # The ID of the path segment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the path segment.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains a summary of the composite model.

      struct AssetModelCompositeModelSummary
        include JSON::Serializable

        # The ID of the composite model that this summary describes..

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the composite model that this summary describes..

        @[JSON::Field(key: "name")]
        getter name : String

        # The composite model type. Valid values are AWS/ALARM , CUSTOM , or AWS/L4E_ANOMALY .

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the composite model that this summary describes..

        @[JSON::Field(key: "description")]
        getter description : String?

        # The external ID of a composite model on this asset model. For more information, see Using external
        # IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The path that includes all the pieces that make up the composite model.

        @[JSON::Field(key: "path")]
        getter path : Array(Types::AssetModelCompositeModelPathSegment)?

        def initialize(
          @id : String,
          @name : String,
          @type : String,
          @description : String? = nil,
          @external_id : String? = nil,
          @path : Array(Types::AssetModelCompositeModelPathSegment)? = nil
        )
        end
      end

      # Describes an asset hierarchy that contains a hierarchy's name, ID, and child asset model ID that
      # specifies the type of asset that can be in this hierarchy.

      struct AssetModelHierarchy
        include JSON::Serializable

        # The ID of the asset model, in UUID format. All assets in this hierarchy must be instances of the
        # childAssetModelId asset model. IoT SiteWise will always return the actual asset model ID for this
        # value. However, when you are specifying this value as part of a call to UpdateAssetModel , you may
        # provide either the asset model ID or else externalId: followed by the asset model's external ID. For
        # more information, see Using external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "childAssetModelId")]
        getter child_asset_model_id : String

        # The name of the asset model hierarchy that you specify by using the CreateAssetModel or
        # UpdateAssetModel API operation.

        @[JSON::Field(key: "name")]
        getter name : String

        # The external ID (if any) provided in the CreateAssetModel or UpdateAssetModel operation. You can
        # assign an external ID by specifying this value as part of a call to UpdateAssetModel . However, you
        # can't change the external ID if one is already assigned. For more information, see Using external
        # IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID of the asset model hierarchy. This ID is a hierarchyId . If you are callling UpdateAssetModel
        # to create a new hierarchy: You can specify its ID here, if desired. IoT SiteWise automatically
        # generates a unique ID for you, so this parameter is never required. However, if you prefer to supply
        # your own ID instead, you can specify it here in UUID format. If you specify your own ID, it must be
        # globally unique. If you are calling UpdateAssetModel to modify an existing hierarchy: This can be
        # either the actual ID in UUID format, or else externalId: followed by the external ID, if it has one.
        # For more information, see Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @child_asset_model_id : String,
          @name : String,
          @external_id : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains an asset model hierarchy used in asset model creation. An asset model hierarchy determines
      # the kind (or type) of asset that can belong to a hierarchy.

      struct AssetModelHierarchyDefinition
        include JSON::Serializable

        # The ID of an asset model for this hierarchy. This can be either the actual ID in UUID format, or
        # else externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "childAssetModelId")]
        getter child_asset_model_id : String

        # The name of the asset model hierarchy definition (as specified in the CreateAssetModel or
        # UpdateAssetModel API operation).

        @[JSON::Field(key: "name")]
        getter name : String

        # An external ID to assign to the asset model hierarchy. The external ID must be unique among asset
        # model hierarchies within this asset model. For more information, see Using external IDs in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID to assign to the asset model hierarchy, if desired. IoT SiteWise automatically generates a
        # unique ID for you, so this parameter is never required. However, if you prefer to supply your own ID
        # instead, you can specify it here in UUID format. If you specify your own ID, it must be globally
        # unique.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @child_asset_model_id : String,
          @name : String,
          @external_id : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains information about an asset model property.

      struct AssetModelProperty
        include JSON::Serializable

        # The data type of the asset model property. If you specify STRUCT , you must also specify
        # dataTypeSpec to identify the type of the structure for this property.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The name of the asset model property.

        @[JSON::Field(key: "name")]
        getter name : String

        # The property type (see PropertyType ).

        @[JSON::Field(key: "type")]
        getter type : Types::PropertyType

        # The data type of the structure for this property. This parameter exists on properties that have the
        # STRUCT data type.

        @[JSON::Field(key: "dataTypeSpec")]
        getter data_type_spec : String?

        # The external ID (if any) provided in the CreateAssetModel or UpdateAssetModel operation. You can
        # assign an external ID by specifying this value as part of a call to UpdateAssetModel . However, you
        # can't change the external ID if one is already assigned. For more information, see Using external
        # IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID of the asset model property. If you are callling UpdateAssetModel to create a new property:
        # You can specify its ID here, if desired. IoT SiteWise automatically generates a unique ID for you,
        # so this parameter is never required. However, if you prefer to supply your own ID instead, you can
        # specify it here in UUID format. If you specify your own ID, it must be globally unique. If you are
        # calling UpdateAssetModel to modify an existing property: This can be either the actual ID in UUID
        # format, or else externalId: followed by the external ID, if it has one. For more information, see
        # Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "id")]
        getter id : String?

        # The structured path to the property from the root of the asset model.

        @[JSON::Field(key: "path")]
        getter path : Array(Types::AssetModelPropertyPathSegment)?

        # The unit of the asset model property, such as Newtons or RPM .

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @name : String,
          @type : Types::PropertyType,
          @data_type_spec : String? = nil,
          @external_id : String? = nil,
          @id : String? = nil,
          @path : Array(Types::AssetModelPropertyPathSegment)? = nil,
          @unit : String? = nil
        )
        end
      end

      # Contains information about an assetModelProperty binding value.

      struct AssetModelPropertyBindingValue
        include JSON::Serializable

        # The ID of the asset model, in UUID format.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The ID of the asset model property used in data binding value.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        def initialize(
          @asset_model_id : String,
          @property_id : String
        )
        end
      end

      # A filter used to match data bindings based on a specific asset model property. This filter
      # identifies all computation models that reference a particular property of an asset model in their
      # data bindings.

      struct AssetModelPropertyBindingValueFilter
        include JSON::Serializable

        # The ID of the asset model containing the filter property. This identifies the specific asset model
        # that contains the property of interest.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The ID of the property within the asset model to filter by. Only data bindings referencing this
        # specific property of the specified asset model are matched.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        def initialize(
          @asset_model_id : String,
          @property_id : String
        )
        end
      end

      # Contains an asset model property definition. This property definition is applied to all assets
      # created from the asset model.

      struct AssetModelPropertyDefinition
        include JSON::Serializable

        # The data type of the property definition. If you specify STRUCT , you must also specify dataTypeSpec
        # to identify the type of the structure for this property.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The name of the property definition.

        @[JSON::Field(key: "name")]
        getter name : String

        # The property definition type (see PropertyType ). You can only specify one type in a property
        # definition.

        @[JSON::Field(key: "type")]
        getter type : Types::PropertyType

        # The data type of the structure for this property. This parameter is required on properties that have
        # the STRUCT data type. The options for this parameter depend on the type of the composite model in
        # which you define this property. Use AWS/ALARM_STATE for alarm state in alarm composite models.

        @[JSON::Field(key: "dataTypeSpec")]
        getter data_type_spec : String?

        # An external ID to assign to the property definition. The external ID must be unique among property
        # definitions within this asset model. For more information, see Using external IDs in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID to assign to the asset model property, if desired. IoT SiteWise automatically generates a
        # unique ID for you, so this parameter is never required. However, if you prefer to supply your own ID
        # instead, you can specify it here in UUID format. If you specify your own ID, it must be globally
        # unique.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The unit of the property definition, such as Newtons or RPM .

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @name : String,
          @type : Types::PropertyType,
          @data_type_spec : String? = nil,
          @external_id : String? = nil,
          @id : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # Represents one level between a property and the root of the asset model.

      struct AssetModelPropertyPathSegment
        include JSON::Serializable

        # The ID of the path segment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the path segment.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains a summary of a property associated with a model. This includes information about which
      # interfaces the property belongs to, if any.

      struct AssetModelPropertySummary
        include JSON::Serializable

        # The data type of the property.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The name of the property.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "type")]
        getter type : Types::PropertyType

        # The ID of the composite model that contains the asset model property.

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String?

        # The data type of the structure for this property. This parameter exists on properties that have the
        # STRUCT data type.

        @[JSON::Field(key: "dataTypeSpec")]
        getter data_type_spec : String?

        # The external ID of the property. For more information, see Using external IDs in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID of the property.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A list of interface summaries that describe which interfaces this property belongs to, including the
        # interface asset model ID and the corresponding property ID in the interface.

        @[JSON::Field(key: "interfaceSummaries")]
        getter interface_summaries : Array(Types::InterfaceSummary)?

        # The structured path to the property from the root of the asset model.

        @[JSON::Field(key: "path")]
        getter path : Array(Types::AssetModelPropertyPathSegment)?

        # The unit (such as Newtons or RPM ) of the property.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @name : String,
          @type : Types::PropertyType,
          @asset_model_composite_model_id : String? = nil,
          @data_type_spec : String? = nil,
          @external_id : String? = nil,
          @id : String? = nil,
          @interface_summaries : Array(Types::InterfaceSummary)? = nil,
          @path : Array(Types::AssetModelPropertyPathSegment)? = nil,
          @unit : String? = nil
        )
        end
      end

      # Contains current status information for an asset model. For more information, see Asset and model
      # states in the IoT SiteWise User Guide .

      struct AssetModelStatus
        include JSON::Serializable

        # The current state of the asset model.

        @[JSON::Field(key: "state")]
        getter state : String

        # Contains associated error information, if any.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        def initialize(
          @state : String,
          @error : Types::ErrorDetails? = nil
        )
        end
      end

      # Contains a summary of an asset model.

      struct AssetModelSummary
        include JSON::Serializable

        # The ARN of the asset model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date the asset model was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time

        # The asset model description.

        @[JSON::Field(key: "description")]
        getter description : String

        # The ID of the asset model (used with IoT SiteWise API operations).

        @[JSON::Field(key: "id")]
        getter id : String

        # The date the asset model was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time

        # The name of the asset model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the asset model.

        @[JSON::Field(key: "status")]
        getter status : Types::AssetModelStatus

        # The type of asset model. ASSET_MODEL – (default) An asset model that you can use to create assets.
        # Can't be included as a component in another asset model. COMPONENT_MODEL – A reusable component that
        # you can include in the composite models of other asset models. You can't create assets directly from
        # this type of asset model.

        @[JSON::Field(key: "assetModelType")]
        getter asset_model_type : String?

        # The external ID of the asset model. For more information, see Using external IDs in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The version number of the asset model.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String,
          @creation_date : Time,
          @description : String,
          @id : String,
          @last_update_date : Time,
          @name : String,
          @status : Types::AssetModelStatus,
          @asset_model_type : String? = nil,
          @external_id : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Contains asset property information.

      struct AssetProperty
        include JSON::Serializable

        # The data type of the asset property.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The ID of the asset property.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the property.

        @[JSON::Field(key: "name")]
        getter name : String

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The data type of the structure for this property. This parameter exists on properties that have the
        # STRUCT data type.

        @[JSON::Field(key: "dataTypeSpec")]
        getter data_type_spec : String?

        # The external ID of the asset property. For more information, see Using external IDs in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The asset property's notification topic and state. For more information, see UpdateAssetProperty .

        @[JSON::Field(key: "notification")]
        getter notification : Types::PropertyNotification?

        # The structured path to the property from the root of the asset.

        @[JSON::Field(key: "path")]
        getter path : Array(Types::AssetPropertyPathSegment)?

        # The unit (such as Newtons or RPM ) of the asset property.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @id : String,
          @name : String,
          @alias : String? = nil,
          @data_type_spec : String? = nil,
          @external_id : String? = nil,
          @notification : Types::PropertyNotification? = nil,
          @path : Array(Types::AssetPropertyPathSegment)? = nil,
          @unit : String? = nil
        )
        end
      end

      # Represents a data binding value referencing a specific asset property. It's used to bind computation
      # model variables to actual asset property values for processing.

      struct AssetPropertyBindingValue
        include JSON::Serializable

        # The ID of the asset containing the property. This identifies the specific asset instance's property
        # value used in the computation model.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the property within the asset. This identifies the specific property's value used in the
        # computation model.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        def initialize(
          @asset_id : String,
          @property_id : String
        )
        end
      end

      # A filter used to match data bindings based on a specific asset property. This filter helps identify
      # all computation models referencing a particular property of an asset in their data bindings.

      struct AssetPropertyBindingValueFilter
        include JSON::Serializable

        # The ID of the asset containing the property to filter by. This identifies the specific asset
        # instance containing the property of interest.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the property within the asset to filter by. Only data bindings referencing this specific
        # property of the specified asset are matched.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        def initialize(
          @asset_id : String,
          @property_id : String
        )
        end
      end

      # Represents one level between a property and the root of the asset.

      struct AssetPropertyPathSegment
        include JSON::Serializable

        # The ID of the path segment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the path segment.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains a summary of a property associated with an asset.

      struct AssetPropertySummary
        include JSON::Serializable

        # The ID of the property.

        @[JSON::Field(key: "id")]
        getter id : String

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The ID of the composite model that contains the asset property.

        @[JSON::Field(key: "assetCompositeModelId")]
        getter asset_composite_model_id : String?

        # The external ID of the property. For more information, see Using external IDs in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?


        @[JSON::Field(key: "notification")]
        getter notification : Types::PropertyNotification?

        # The structured path to the property from the root of the asset.

        @[JSON::Field(key: "path")]
        getter path : Array(Types::AssetPropertyPathSegment)?

        # The unit of measure (such as Newtons or RPM) of the asset property.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @id : String,
          @alias : String? = nil,
          @asset_composite_model_id : String? = nil,
          @external_id : String? = nil,
          @notification : Types::PropertyNotification? = nil,
          @path : Array(Types::AssetPropertyPathSegment)? = nil,
          @unit : String? = nil
        )
        end
      end

      # Contains asset property value information.

      struct AssetPropertyValue
        include JSON::Serializable

        # The timestamp of the asset property value.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Types::TimeInNanos

        # The value of the asset property (see Variant ).

        @[JSON::Field(key: "value")]
        getter value : Types::Variant

        # The quality of the asset property value.

        @[JSON::Field(key: "quality")]
        getter quality : String?

        def initialize(
          @timestamp : Types::TimeInNanos,
          @value : Types::Variant,
          @quality : String? = nil
        )
        end
      end

      # Contains information about assets that are related to one another.

      struct AssetRelationshipSummary
        include JSON::Serializable

        # The relationship type of the assets in this relationship. This value is one of the following:
        # HIERARCHY – The assets are related through an asset hierarchy. If you specify this relationship
        # type, this asset relationship includes the hierarchyInfo object.

        @[JSON::Field(key: "relationshipType")]
        getter relationship_type : String

        # The assets that are related through an asset hierarchy. This object is present if the
        # relationshipType is HIERARCHY .

        @[JSON::Field(key: "hierarchyInfo")]
        getter hierarchy_info : Types::AssetHierarchyInfo?

        def initialize(
          @relationship_type : String,
          @hierarchy_info : Types::AssetHierarchyInfo? = nil
        )
        end
      end

      # Contains information about the current status of an asset. For more information, see Asset and model
      # states in the IoT SiteWise User Guide .

      struct AssetStatus
        include JSON::Serializable

        # The current status of the asset.

        @[JSON::Field(key: "state")]
        getter state : String

        # Contains associated error information, if any.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        def initialize(
          @state : String,
          @error : Types::ErrorDetails? = nil
        )
        end
      end

      # Contains a summary of an asset.

      struct AssetSummary
        include JSON::Serializable

        # The ARN of the asset, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the asset model used to create this asset.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The date the asset was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time

        # A list of asset hierarchies that each contain a hierarchyId . A hierarchy specifies allowed
        # parent/child asset relationships.

        @[JSON::Field(key: "hierarchies")]
        getter hierarchies : Array(Types::AssetHierarchy)

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date the asset was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time

        # The name of the asset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the asset.

        @[JSON::Field(key: "status")]
        getter status : Types::AssetStatus

        # A description for the asset.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The external ID of the asset. For more information, see Using external IDs in the IoT SiteWise User
        # Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        def initialize(
          @arn : String,
          @asset_model_id : String,
          @creation_date : Time,
          @hierarchies : Array(Types::AssetHierarchy),
          @id : String,
          @last_update_date : Time,
          @name : String,
          @status : Types::AssetStatus,
          @description : String? = nil,
          @external_id : String? = nil
        )
        end
      end


      struct AssociateAssetsRequest
        include JSON::Serializable

        # The ID of the parent asset. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the child asset to be associated. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "childAssetId")]
        getter child_asset_id : String

        # The ID of a hierarchy in the parent asset's model. (This can be either the actual ID in UUID format,
        # or else externalId: followed by the external ID, if it has one. For more information, see
        # Referencing objects with external IDs in the IoT SiteWise User Guide .) Hierarchies allow different
        # groupings of assets to be formed that all come from the same asset model. For more information, see
        # Asset hierarchies in the IoT SiteWise User Guide .

        @[JSON::Field(key: "hierarchyId")]
        getter hierarchy_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_id : String,
          @child_asset_id : String,
          @hierarchy_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct AssociateTimeSeriesToAssetPropertyRequest
        include JSON::Serializable

        # The alias that identifies the time series.

        @[JSON::Field(key: "alias")]
        getter alias : String

        # The ID of the asset in which the asset property was created. This can be either the actual ID in
        # UUID format, or else externalId: followed by the external ID, if it has one. For more information,
        # see Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the asset property. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @alias : String,
          @asset_id : String,
          @property_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Contains a summary of an associated asset.

      struct AssociatedAssetsSummary
        include JSON::Serializable

        # The ARN of the asset, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the asset model used to create the asset.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The date the asset was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time

        # A list of asset hierarchies that each contain a hierarchyId . A hierarchy specifies allowed
        # parent/child asset relationships.

        @[JSON::Field(key: "hierarchies")]
        getter hierarchies : Array(Types::AssetHierarchy)

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date the asset was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time

        # The name of the asset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the asset.

        @[JSON::Field(key: "status")]
        getter status : Types::AssetStatus

        # A description for the asset.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The external ID of the asset. For more information, see Using external IDs in the IoT SiteWise User
        # Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        def initialize(
          @arn : String,
          @asset_model_id : String,
          @creation_date : Time,
          @hierarchies : Array(Types::AssetHierarchy),
          @id : String,
          @last_update_date : Time,
          @name : String,
          @status : Types::AssetStatus,
          @description : String? = nil,
          @external_id : String? = nil
        )
        end
      end

      # Contains an asset attribute property. For more information, see Attributes in the IoT SiteWise User
      # Guide .

      struct Attribute
        include JSON::Serializable

        # The default value of the asset model property attribute. All assets that you create from the asset
        # model contain this attribute value. You can update an attribute's value after you create an asset.
        # For more information, see Updating attribute values in the IoT SiteWise User Guide .

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        def initialize(
          @default_value : String? = nil
        )
        end
      end


      struct BatchAssociateProjectAssetsRequest
        include JSON::Serializable

        # The IDs of the assets to be associated to the project.

        @[JSON::Field(key: "assetIds")]
        getter asset_ids : Array(String)

        # The ID of the project to which to associate the assets.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_ids : Array(String),
          @project_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct BatchAssociateProjectAssetsResponse
        include JSON::Serializable

        # A list of associated error information, if any.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::AssetErrorDetails)?

        def initialize(
          @errors : Array(Types::AssetErrorDetails)? = nil
        )
        end
      end


      struct BatchDisassociateProjectAssetsRequest
        include JSON::Serializable

        # The IDs of the assets to be disassociated from the project.

        @[JSON::Field(key: "assetIds")]
        getter asset_ids : Array(String)

        # The ID of the project from which to disassociate the assets.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_ids : Array(String),
          @project_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct BatchDisassociateProjectAssetsResponse
        include JSON::Serializable

        # A list of associated error information, if any.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::AssetErrorDetails)?

        def initialize(
          @errors : Array(Types::AssetErrorDetails)? = nil
        )
        end
      end

      # Contains information for an asset property aggregate entry that is associated with the
      # BatchGetAssetPropertyAggregates API. To identify an asset property, you must specify one of the
      # following: The assetId and propertyId of an asset property. A propertyAlias , which is a data stream
      # alias (for example, /company/windfarm/3/turbine/7/temperature ). To define an asset property's
      # alias, see UpdateAssetProperty .

      struct BatchGetAssetPropertyAggregatesEntry
        include JSON::Serializable

        # The data aggregating function.

        @[JSON::Field(key: "aggregateTypes")]
        getter aggregate_types : Array(String)

        # The inclusive end of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "endDate")]
        getter end_date : Time

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The time interval over which to aggregate data.

        @[JSON::Field(key: "resolution")]
        getter resolution : String

        # The exclusive start of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "startDate")]
        getter start_date : Time

        # The ID of the asset in which the asset property was created.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        # The quality by which to filter asset data.

        @[JSON::Field(key: "qualities")]
        getter qualities : Array(String)?

        # The chronological sorting order of the requested information. Default: ASCENDING

        @[JSON::Field(key: "timeOrdering")]
        getter time_ordering : String?

        def initialize(
          @aggregate_types : Array(String),
          @end_date : Time,
          @entry_id : String,
          @resolution : String,
          @start_date : Time,
          @asset_id : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil,
          @qualities : Array(String)? = nil,
          @time_ordering : String? = nil
        )
        end
      end

      # Contains error information for an asset property aggregate entry that is associated with the
      # BatchGetAssetPropertyAggregates API.

      struct BatchGetAssetPropertyAggregatesErrorEntry
        include JSON::Serializable

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The associated error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @entry_id : String,
          @error_code : String,
          @error_message : String
        )
        end
      end

      # Contains the error code and the timestamp for an asset property aggregate entry that is associated
      # with the BatchGetAssetPropertyAggregates API.

      struct BatchGetAssetPropertyAggregatesErrorInfo
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The date the error occurred, in Unix epoch time.

        @[JSON::Field(key: "errorTimestamp")]
        getter error_timestamp : Time

        def initialize(
          @error_code : String,
          @error_timestamp : Time
        )
        end
      end


      struct BatchGetAssetPropertyAggregatesRequest
        include JSON::Serializable

        # The list of asset property aggregate entries for the batch get request. You can specify up to 16
        # entries per request.

        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::BatchGetAssetPropertyAggregatesEntry)

        # The maximum number of results to return for each paginated request. A result set is returned in the
        # two cases, whichever occurs first. The size of the result set is equal to 1 MB. The number of data
        # points in the result set is equal to the value of maxResults . The maximum value of maxResults is
        # 4000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::BatchGetAssetPropertyAggregatesEntry),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct BatchGetAssetPropertyAggregatesResponse
        include JSON::Serializable

        # A list of the errors (if any) associated with the batch request. Each error entry contains the
        # entryId of the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchGetAssetPropertyAggregatesErrorEntry)

        # A list of entries that were not processed by this batch request. because these entries had been
        # completely processed by previous paginated requests. Each skipped entry contains the entryId of the
        # entry that skipped.

        @[JSON::Field(key: "skippedEntries")]
        getter skipped_entries : Array(Types::BatchGetAssetPropertyAggregatesSkippedEntry)

        # A list of entries that were processed successfully by this batch request. Each success entry
        # contains the entryId of the entry that succeeded and the latest query result.

        @[JSON::Field(key: "successEntries")]
        getter success_entries : Array(Types::BatchGetAssetPropertyAggregatesSuccessEntry)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @error_entries : Array(Types::BatchGetAssetPropertyAggregatesErrorEntry),
          @skipped_entries : Array(Types::BatchGetAssetPropertyAggregatesSkippedEntry),
          @success_entries : Array(Types::BatchGetAssetPropertyAggregatesSuccessEntry),
          @next_token : String? = nil
        )
        end
      end

      # Contains information for an entry that has been processed by the previous
      # BatchGetAssetPropertyAggregates request.

      struct BatchGetAssetPropertyAggregatesSkippedEntry
        include JSON::Serializable

        # The completion status of each entry that is associated with the BatchGetAssetPropertyAggregates API.

        @[JSON::Field(key: "completionStatus")]
        getter completion_status : String

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The error information, such as the error code and the timestamp.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::BatchGetAssetPropertyAggregatesErrorInfo?

        def initialize(
          @completion_status : String,
          @entry_id : String,
          @error_info : Types::BatchGetAssetPropertyAggregatesErrorInfo? = nil
        )
        end
      end

      # Contains success information for an entry that is associated with the
      # BatchGetAssetPropertyAggregates API.

      struct BatchGetAssetPropertyAggregatesSuccessEntry
        include JSON::Serializable

        # The requested aggregated asset property values (for example, average, minimum, and maximum).

        @[JSON::Field(key: "aggregatedValues")]
        getter aggregated_values : Array(Types::AggregatedValue)

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        def initialize(
          @aggregated_values : Array(Types::AggregatedValue),
          @entry_id : String
        )
        end
      end

      # Contains information for an asset property value entry that is associated with the
      # BatchGetAssetPropertyValue API. To identify an asset property, you must specify one of the
      # following: The assetId and propertyId of an asset property. A propertyAlias , which is a data stream
      # alias (for example, /company/windfarm/3/turbine/7/temperature ). To define an asset property's
      # alias, see UpdateAssetProperty .

      struct BatchGetAssetPropertyValueEntry
        include JSON::Serializable

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The ID of the asset in which the asset property was created.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @entry_id : String,
          @asset_id : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil
        )
        end
      end

      # Contains error information for an asset property value entry that is associated with the
      # BatchGetAssetPropertyValue API.

      struct BatchGetAssetPropertyValueErrorEntry
        include JSON::Serializable

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The associated error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @entry_id : String,
          @error_code : String,
          @error_message : String
        )
        end
      end

      # The error information, such as the error code and the timestamp.

      struct BatchGetAssetPropertyValueErrorInfo
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The date the error occurred, in Unix epoch time.

        @[JSON::Field(key: "errorTimestamp")]
        getter error_timestamp : Time

        def initialize(
          @error_code : String,
          @error_timestamp : Time
        )
        end
      end

      # Contains information for an asset property historical value entry that is associated with the
      # BatchGetAssetPropertyValueHistory API. To identify an asset property, you must specify one of the
      # following: The assetId and propertyId of an asset property. A propertyAlias , which is a data stream
      # alias (for example, /company/windfarm/3/turbine/7/temperature ). To define an asset property's
      # alias, see UpdateAssetProperty .

      struct BatchGetAssetPropertyValueHistoryEntry
        include JSON::Serializable

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The ID of the asset in which the asset property was created.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The inclusive end of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "endDate")]
        getter end_date : Time?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        # The quality by which to filter asset data.

        @[JSON::Field(key: "qualities")]
        getter qualities : Array(String)?

        # The exclusive start of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "startDate")]
        getter start_date : Time?

        # The chronological sorting order of the requested information. Default: ASCENDING

        @[JSON::Field(key: "timeOrdering")]
        getter time_ordering : String?

        def initialize(
          @entry_id : String,
          @asset_id : String? = nil,
          @end_date : Time? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil,
          @qualities : Array(String)? = nil,
          @start_date : Time? = nil,
          @time_ordering : String? = nil
        )
        end
      end

      # A list of the errors (if any) associated with the batch request. Each error entry contains the
      # entryId of the entry that failed.

      struct BatchGetAssetPropertyValueHistoryErrorEntry
        include JSON::Serializable

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The associated error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @entry_id : String,
          @error_code : String,
          @error_message : String
        )
        end
      end

      # The error information, such as the error code and the timestamp.

      struct BatchGetAssetPropertyValueHistoryErrorInfo
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The date the error occurred, in Unix epoch time.

        @[JSON::Field(key: "errorTimestamp")]
        getter error_timestamp : Time

        def initialize(
          @error_code : String,
          @error_timestamp : Time
        )
        end
      end


      struct BatchGetAssetPropertyValueHistoryRequest
        include JSON::Serializable

        # The list of asset property historical value entries for the batch get request. You can specify up to
        # 16 entries per request.

        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::BatchGetAssetPropertyValueHistoryEntry)

        # The maximum number of results to return for each paginated request. A result set is returned in the
        # two cases, whichever occurs first. The size of the result set is equal to 4 MB. The number of data
        # points in the result set is equal to the value of maxResults . The maximum value of maxResults is
        # 20000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::BatchGetAssetPropertyValueHistoryEntry),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct BatchGetAssetPropertyValueHistoryResponse
        include JSON::Serializable

        # A list of the errors (if any) associated with the batch request. Each error entry contains the
        # entryId of the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchGetAssetPropertyValueHistoryErrorEntry)

        # A list of entries that were not processed by this batch request. because these entries had been
        # completely processed by previous paginated requests. Each skipped entry contains the entryId of the
        # entry that skipped.

        @[JSON::Field(key: "skippedEntries")]
        getter skipped_entries : Array(Types::BatchGetAssetPropertyValueHistorySkippedEntry)

        # A list of entries that were processed successfully by this batch request. Each success entry
        # contains the entryId of the entry that succeeded and the latest query result.

        @[JSON::Field(key: "successEntries")]
        getter success_entries : Array(Types::BatchGetAssetPropertyValueHistorySuccessEntry)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @error_entries : Array(Types::BatchGetAssetPropertyValueHistoryErrorEntry),
          @skipped_entries : Array(Types::BatchGetAssetPropertyValueHistorySkippedEntry),
          @success_entries : Array(Types::BatchGetAssetPropertyValueHistorySuccessEntry),
          @next_token : String? = nil
        )
        end
      end

      # Contains information for an entry that has been processed by the previous
      # BatchGetAssetPropertyValueHistory request.

      struct BatchGetAssetPropertyValueHistorySkippedEntry
        include JSON::Serializable

        # The completion status of each entry that is associated with the BatchGetAssetPropertyValueHistory
        # API.

        @[JSON::Field(key: "completionStatus")]
        getter completion_status : String

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The error information, such as the error code and the timestamp.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::BatchGetAssetPropertyValueHistoryErrorInfo?

        def initialize(
          @completion_status : String,
          @entry_id : String,
          @error_info : Types::BatchGetAssetPropertyValueHistoryErrorInfo? = nil
        )
        end
      end

      # Contains success information for an entry that is associated with the
      # BatchGetAssetPropertyValueHistory API.

      struct BatchGetAssetPropertyValueHistorySuccessEntry
        include JSON::Serializable

        # The requested historical values for the specified asset property.

        @[JSON::Field(key: "assetPropertyValueHistory")]
        getter asset_property_value_history : Array(Types::AssetPropertyValue)

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        def initialize(
          @asset_property_value_history : Array(Types::AssetPropertyValue),
          @entry_id : String
        )
        end
      end


      struct BatchGetAssetPropertyValueRequest
        include JSON::Serializable

        # The list of asset property value entries for the batch get request. You can specify up to 128
        # entries per request.

        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::BatchGetAssetPropertyValueEntry)

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::BatchGetAssetPropertyValueEntry),
          @next_token : String? = nil
        )
        end
      end


      struct BatchGetAssetPropertyValueResponse
        include JSON::Serializable

        # A list of the errors (if any) associated with the batch request. Each error entry contains the
        # entryId of the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchGetAssetPropertyValueErrorEntry)

        # A list of entries that were not processed by this batch request. because these entries had been
        # completely processed by previous paginated requests. Each skipped entry contains the entryId of the
        # entry that skipped.

        @[JSON::Field(key: "skippedEntries")]
        getter skipped_entries : Array(Types::BatchGetAssetPropertyValueSkippedEntry)

        # A list of entries that were processed successfully by this batch request. Each success entry
        # contains the entryId of the entry that succeeded and the latest query result.

        @[JSON::Field(key: "successEntries")]
        getter success_entries : Array(Types::BatchGetAssetPropertyValueSuccessEntry)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @error_entries : Array(Types::BatchGetAssetPropertyValueErrorEntry),
          @skipped_entries : Array(Types::BatchGetAssetPropertyValueSkippedEntry),
          @success_entries : Array(Types::BatchGetAssetPropertyValueSuccessEntry),
          @next_token : String? = nil
        )
        end
      end

      # Contains information for an entry that has been processed by the previous BatchGetAssetPropertyValue
      # request.

      struct BatchGetAssetPropertyValueSkippedEntry
        include JSON::Serializable

        # The completion status of each entry that is associated with the BatchGetAssetPropertyValue request.

        @[JSON::Field(key: "completionStatus")]
        getter completion_status : String

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The error information, such as the error code and the timestamp.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::BatchGetAssetPropertyValueErrorInfo?

        def initialize(
          @completion_status : String,
          @entry_id : String,
          @error_info : Types::BatchGetAssetPropertyValueErrorInfo? = nil
        )
        end
      end

      # Contains success information for an entry that is associated with the BatchGetAssetPropertyValue
      # API.

      struct BatchGetAssetPropertyValueSuccessEntry
        include JSON::Serializable

        # The ID of the entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String


        @[JSON::Field(key: "assetPropertyValue")]
        getter asset_property_value : Types::AssetPropertyValue?

        def initialize(
          @entry_id : String,
          @asset_property_value : Types::AssetPropertyValue? = nil
        )
        end
      end

      # Contains error information from updating a batch of asset property values.

      struct BatchPutAssetPropertyError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The associated error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # A list of timestamps for each error, if any.

        @[JSON::Field(key: "timestamps")]
        getter timestamps : Array(Types::TimeInNanos)

        def initialize(
          @error_code : String,
          @error_message : String,
          @timestamps : Array(Types::TimeInNanos)
        )
        end
      end

      # Contains error information for asset property value entries that are associated with the
      # BatchPutAssetPropertyValue API.

      struct BatchPutAssetPropertyErrorEntry
        include JSON::Serializable

        # The ID of the failed entry.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The list of update property value errors.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchPutAssetPropertyError)

        def initialize(
          @entry_id : String,
          @errors : Array(Types::BatchPutAssetPropertyError)
        )
        end
      end


      struct BatchPutAssetPropertyValueRequest
        include JSON::Serializable

        # The list of asset property value entries for the batch put request. You can specify up to 10 entries
        # per request.

        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::PutAssetPropertyValueEntry)

        # This setting enables partial ingestion at entry-level. If set to true , we ingest all TQVs not
        # resulting in an error. If set to false , an invalid TQV fails ingestion of the entire entry that
        # contains it.

        @[JSON::Field(key: "enablePartialEntryProcessing")]
        getter enable_partial_entry_processing : Bool?

        def initialize(
          @entries : Array(Types::PutAssetPropertyValueEntry),
          @enable_partial_entry_processing : Bool? = nil
        )
        end
      end


      struct BatchPutAssetPropertyValueResponse
        include JSON::Serializable

        # A list of the errors (if any) associated with the batch put request. Each error entry contains the
        # entryId of the entry that failed.

        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchPutAssetPropertyErrorEntry)

        def initialize(
          @error_entries : Array(Types::BatchPutAssetPropertyErrorEntry)
        )
        end
      end

      # Contains text content to which the SiteWise Assistant refers to, and generate the final response. It
      # also contains information about the source.

      struct Citation
        include JSON::Serializable

        # Contains the cited text from the data source.

        @[JSON::Field(key: "content")]
        getter content : Types::Content?

        # Contains information about the data source.

        @[JSON::Field(key: "reference")]
        getter reference : Types::Reference?

        def initialize(
          @content : Types::Content? = nil,
          @reference : Types::Reference? = nil
        )
        end
      end

      # A description of the column in the query results.

      struct ColumnInfo
        include JSON::Serializable

        # The name of the column description.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the column description.

        @[JSON::Field(key: "type")]
        getter type : Types::ColumnType?

        def initialize(
          @name : String? = nil,
          @type : Types::ColumnType? = nil
        )
        end
      end

      # The data type of the column.

      struct ColumnType
        include JSON::Serializable

        # The allowed data types that the column has as it's value.

        @[JSON::Field(key: "scalarType")]
        getter scalar_type : String?

        def initialize(
          @scalar_type : String? = nil
        )
        end
      end

      # Contains information about a composite model property on an asset.

      struct CompositeModelProperty
        include JSON::Serializable


        @[JSON::Field(key: "assetProperty")]
        getter asset_property : Types::Property

        # The name of the property.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the composite model that defines this property.

        @[JSON::Field(key: "type")]
        getter type : String

        # The external ID of the composite model that contains the property. For more information, see Using
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The ID of the composite model that contains the property.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @asset_property : Types::Property,
          @name : String,
          @type : String,
          @external_id : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Metadata for the composition relationship established by using composedAssetModelId in
      # CreateAssetModelCompositeModel .

      struct CompositionDetails
        include JSON::Serializable

        # An array detailing the composition relationship for this composite model.

        @[JSON::Field(key: "compositionRelationship")]
        getter composition_relationship : Array(Types::CompositionRelationshipItem)?

        def initialize(
          @composition_relationship : Array(Types::CompositionRelationshipItem)? = nil
        )
        end
      end

      # Represents a composite model that composed an asset model of type COMPONENT_MODEL .

      struct CompositionRelationshipItem
        include JSON::Serializable

        # The ID of the component.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Contains a summary of the components of the composite model.

      struct CompositionRelationshipSummary
        include JSON::Serializable

        # The ID of a composite model on this asset model.

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String

        # The composite model type. Valid values are AWS/ALARM , CUSTOM , or AWS/L4E_ANOMALY .

        @[JSON::Field(key: "assetModelCompositeModelType")]
        getter asset_model_composite_model_type : String

        # The ID of the asset model, in UUID format.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        def initialize(
          @asset_model_composite_model_id : String,
          @asset_model_composite_model_type : String,
          @asset_model_id : String
        )
        end
      end

      # Contains the configuration of the type of anomaly detection computation model.

      struct ComputationModelAnomalyDetectionConfiguration
        include JSON::Serializable

        # Define the variable name associated with input properties, with the following format ${VariableName}
        # .

        @[JSON::Field(key: "inputProperties")]
        getter input_properties : String

        # Define the variable name associated with the result property, and the following format
        # ${VariableName} .

        @[JSON::Field(key: "resultProperty")]
        getter result_property : String

        def initialize(
          @input_properties : String,
          @result_property : String
        )
        end
      end

      # The configuration for the computation model.

      struct ComputationModelConfiguration
        include JSON::Serializable

        # The configuration for the anomaly detection type of computation model.

        @[JSON::Field(key: "anomalyDetection")]
        getter anomaly_detection : Types::ComputationModelAnomalyDetectionConfiguration?

        def initialize(
          @anomaly_detection : Types::ComputationModelAnomalyDetectionConfiguration? = nil
        )
        end
      end

      # A summary of how a specific data binding is used across computation models. This tracks dependencies
      # between data sources and computation models, allowing you to understand the impact of changes to
      # data sources.

      struct ComputationModelDataBindingUsageSummary
        include JSON::Serializable

        # The list of computation model IDs that use this data binding. This allows identification of all
        # computation models affected by changes to the referenced data source.

        @[JSON::Field(key: "computationModelIds")]
        getter computation_model_ids : Array(String)

        # The data binding matched by the filter criteria. Contains details about specific data binding values
        # used by the computation models.

        @[JSON::Field(key: "matchedDataBinding")]
        getter matched_data_binding : Types::MatchedDataBinding

        def initialize(
          @computation_model_ids : Array(String),
          @matched_data_binding : Types::MatchedDataBinding
        )
        end
      end

      # Contains computation model data binding value information, which can be one of assetModelProperty ,
      # list .

      struct ComputationModelDataBindingValue
        include JSON::Serializable

        # Specifies an asset model property data binding value.

        @[JSON::Field(key: "assetModelProperty")]
        getter asset_model_property : Types::AssetModelPropertyBindingValue?

        # The asset property value used for computation model data binding.

        @[JSON::Field(key: "assetProperty")]
        getter asset_property : Types::AssetPropertyBindingValue?

        # Specifies a list of data binding value.

        @[JSON::Field(key: "list")]
        getter list : Array(Types::ComputationModelDataBindingValue)?

        def initialize(
          @asset_model_property : Types::AssetModelPropertyBindingValue? = nil,
          @asset_property : Types::AssetPropertyBindingValue? = nil,
          @list : Array(Types::ComputationModelDataBindingValue)? = nil
        )
        end
      end

      # A summary of the resource that a computation model resolves to.

      struct ComputationModelResolveToResourceSummary
        include JSON::Serializable


        @[JSON::Field(key: "resolveTo")]
        getter resolve_to : Types::ResolveTo?

        def initialize(
          @resolve_to : Types::ResolveTo? = nil
        )
        end
      end

      # Contains current status information for a computation model.

      struct ComputationModelStatus
        include JSON::Serializable

        # The current state of the computation model.

        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        def initialize(
          @state : String,
          @error : Types::ErrorDetails? = nil
        )
        end
      end

      # Contains a summary of a computation model.

      struct ComputationModelSummary
        include JSON::Serializable

        # The ARN of the computation model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:computation-model/${ComputationModelId}

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The model creation date, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time

        # The ID of the computation model.

        @[JSON::Field(key: "id")]
        getter id : String

        # The time the model was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time

        # The name of the computation model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the computation model.

        @[JSON::Field(key: "status")]
        getter status : Types::ComputationModelStatus

        # The type of the computation model.

        @[JSON::Field(key: "type")]
        getter type : String

        # The version of the computation model.

        @[JSON::Field(key: "version")]
        getter version : String

        # The description of the computation model.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @creation_date : Time,
          @id : String,
          @last_update_date : Time,
          @name : String,
          @status : Types::ComputationModelStatus,
          @type : String,
          @version : String,
          @description : String? = nil
        )
        end
      end

      # Contains the details of an IoT SiteWise configuration error.

      struct ConfigurationErrorDetails
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : String

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # Contains current status information for the configuration.

      struct ConfigurationStatus
        include JSON::Serializable

        # The current state of the configuration.

        @[JSON::Field(key: "state")]
        getter state : String

        # Contains associated error information, if any.

        @[JSON::Field(key: "error")]
        getter error : Types::ConfigurationErrorDetails?

        def initialize(
          @state : String,
          @error : Types::ConfigurationErrorDetails? = nil
        )
        end
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.

      struct ConflictingOperationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ARN of the resource that conflicts with this operation.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ID of the resource that conflicts with this operation.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_arn : String,
          @resource_id : String
        )
        end
      end

      # Contains the cited text from the data source.

      struct Content
        include JSON::Serializable

        # The cited text from the data source.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end


      struct CreateAccessPolicyRequest
        include JSON::Serializable

        # The identity for this access policy. Choose an IAM Identity Center user, an IAM Identity Center
        # group, or an IAM user.

        @[JSON::Field(key: "accessPolicyIdentity")]
        getter access_policy_identity : Types::Identity

        # The permission level for this access policy. Note that a project ADMINISTRATOR is also known as a
        # project owner.

        @[JSON::Field(key: "accessPolicyPermission")]
        getter access_policy_permission : String

        # The IoT SiteWise Monitor resource for this access policy. Choose either a portal or a project.

        @[JSON::Field(key: "accessPolicyResource")]
        getter access_policy_resource : Types::Resource

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of key-value pairs that contain metadata for the access policy. For more information, see
        # Tagging your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_policy_identity : Types::Identity,
          @access_policy_permission : String,
          @access_policy_resource : Types::Resource,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAccessPolicyResponse
        include JSON::Serializable

        # The ARN of the access policy, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}

        @[JSON::Field(key: "accessPolicyArn")]
        getter access_policy_arn : String

        # The ID of the access policy.

        @[JSON::Field(key: "accessPolicyId")]
        getter access_policy_id : String

        def initialize(
          @access_policy_arn : String,
          @access_policy_id : String
        )
        end
      end


      struct CreateAssetModelCompositeModelRequest
        include JSON::Serializable

        # A unique name for the composite model.

        @[JSON::Field(key: "assetModelCompositeModelName")]
        getter asset_model_composite_model_name : String

        # The composite model type. Valid values are AWS/ALARM , CUSTOM , or AWS/L4E_ANOMALY .

        @[JSON::Field(key: "assetModelCompositeModelType")]
        getter asset_model_composite_model_type : String

        # The ID of the asset model this composite model is a part of.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # A description for the composite model.

        @[JSON::Field(key: "assetModelCompositeModelDescription")]
        getter asset_model_composite_model_description : String?

        # An external ID to assign to the composite model. If the composite model is a derived composite
        # model, or one nested inside a component model, you can only set the external ID using
        # UpdateAssetModelCompositeModel and specifying the derived ID of the model or property from the
        # created model it's a part of.

        @[JSON::Field(key: "assetModelCompositeModelExternalId")]
        getter asset_model_composite_model_external_id : String?

        # The ID of the composite model. IoT SiteWise automatically generates a unique ID for you, so this
        # parameter is never required. However, if you prefer to supply your own ID instead, you can specify
        # it here in UUID format. If you specify your own ID, it must be globally unique.

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String?

        # The property definitions of the composite model. For more information, see Inline custom composite
        # models in the IoT SiteWise User Guide . You can specify up to 200 properties per composite model.
        # For more information, see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelCompositeModelProperties")]
        getter asset_model_composite_model_properties : Array(Types::AssetModelPropertyDefinition)?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ID of a component model which is reused to create this composite model.

        @[JSON::Field(key: "composedAssetModelId")]
        getter composed_asset_model_id : String?

        # The expected current entity tag (ETag) for the asset model’s latest or active version (specified
        # using matchForVersionType ). The create request is rejected if the tag does not match the latest or
        # active version's current entity tag. See Optimistic locking for asset model writes in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Accepts * to reject the create request if an active version (specified using matchForVersionType as
        # ACTIVE ) already exists for the asset model.

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # Specifies the asset model version type ( LATEST or ACTIVE ) used in conjunction with If-Match or
        # If-None-Match headers to determine the target ETag for the create operation.

        @[JSON::Field(key: "Match-For-Version-Type")]
        getter match_for_version_type : String?

        # The ID of the parent composite model in this asset model relationship.

        @[JSON::Field(key: "parentAssetModelCompositeModelId")]
        getter parent_asset_model_composite_model_id : String?

        def initialize(
          @asset_model_composite_model_name : String,
          @asset_model_composite_model_type : String,
          @asset_model_id : String,
          @asset_model_composite_model_description : String? = nil,
          @asset_model_composite_model_external_id : String? = nil,
          @asset_model_composite_model_id : String? = nil,
          @asset_model_composite_model_properties : Array(Types::AssetModelPropertyDefinition)? = nil,
          @client_token : String? = nil,
          @composed_asset_model_id : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @match_for_version_type : String? = nil,
          @parent_asset_model_composite_model_id : String? = nil
        )
        end
      end


      struct CreateAssetModelCompositeModelResponse
        include JSON::Serializable

        # The ID of the composed asset model. You can use this ID when you call other IoT SiteWise APIs.

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String

        # The path to the composite model listing the parent composite models.

        @[JSON::Field(key: "assetModelCompositeModelPath")]
        getter asset_model_composite_model_path : Array(Types::AssetModelCompositeModelPathSegment)


        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        def initialize(
          @asset_model_composite_model_id : String,
          @asset_model_composite_model_path : Array(Types::AssetModelCompositeModelPathSegment),
          @asset_model_status : Types::AssetModelStatus
        )
        end
      end


      struct CreateAssetModelRequest
        include JSON::Serializable

        # A unique name for the asset model.

        @[JSON::Field(key: "assetModelName")]
        getter asset_model_name : String

        # The composite models that are part of this asset model. It groups properties (such as attributes,
        # measurements, transforms, and metrics) and child composite models that model parts of your
        # industrial equipment. Each composite model has a type that defines the properties that the composite
        # model supports. Use composite models to define alarms on this asset model. When creating custom
        # composite models, you need to use CreateAssetModelCompositeModel . For more information, see
        # Creating custom composite models (Components) in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelCompositeModels")]
        getter asset_model_composite_models : Array(Types::AssetModelCompositeModelDefinition)?

        # A description for the asset model.

        @[JSON::Field(key: "assetModelDescription")]
        getter asset_model_description : String?

        # An external ID to assign to the asset model. The external ID must be unique within your Amazon Web
        # Services account. For more information, see Using external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelExternalId")]
        getter asset_model_external_id : String?

        # The hierarchy definitions of the asset model. Each hierarchy specifies an asset model whose assets
        # can be children of any other assets created from this asset model. For more information, see Asset
        # hierarchies in the IoT SiteWise User Guide . You can specify up to 10 hierarchies per asset model.
        # For more information, see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelHierarchies")]
        getter asset_model_hierarchies : Array(Types::AssetModelHierarchyDefinition)?

        # The ID to assign to the asset model, if desired. IoT SiteWise automatically generates a unique ID
        # for you, so this parameter is never required. However, if you prefer to supply your own ID instead,
        # you can specify it here in UUID format. If you specify your own ID, it must be globally unique.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String?

        # The property definitions of the asset model. For more information, see Asset properties in the IoT
        # SiteWise User Guide . You can specify up to 200 properties per asset model. For more information,
        # see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelProperties")]
        getter asset_model_properties : Array(Types::AssetModelPropertyDefinition)?

        # The type of asset model. ASSET_MODEL – (default) An asset model that you can use to create assets.
        # Can't be included as a component in another asset model. COMPONENT_MODEL – A reusable component that
        # you can include in the composite models of other asset models. You can't create assets directly from
        # this type of asset model.

        @[JSON::Field(key: "assetModelType")]
        getter asset_model_type : String?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of key-value pairs that contain metadata for the asset model. For more information, see
        # Tagging your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @asset_model_name : String,
          @asset_model_composite_models : Array(Types::AssetModelCompositeModelDefinition)? = nil,
          @asset_model_description : String? = nil,
          @asset_model_external_id : String? = nil,
          @asset_model_hierarchies : Array(Types::AssetModelHierarchyDefinition)? = nil,
          @asset_model_id : String? = nil,
          @asset_model_properties : Array(Types::AssetModelPropertyDefinition)? = nil,
          @asset_model_type : String? = nil,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssetModelResponse
        include JSON::Serializable

        # The ARN of the asset model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}

        @[JSON::Field(key: "assetModelArn")]
        getter asset_model_arn : String

        # The ID of the asset model, in UUID format. You can use this ID when you call other IoT SiteWise API
        # operations.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The status of the asset model, which contains a state ( CREATING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        def initialize(
          @asset_model_arn : String,
          @asset_model_id : String,
          @asset_model_status : Types::AssetModelStatus
        )
        end
      end


      struct CreateAssetRequest
        include JSON::Serializable

        # The ID of the asset model from which to create the asset. This can be either the actual ID in UUID
        # format, or else externalId: followed by the external ID, if it has one. For more information, see
        # Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # A friendly name for the asset.

        @[JSON::Field(key: "assetName")]
        getter asset_name : String

        # A description for the asset.

        @[JSON::Field(key: "assetDescription")]
        getter asset_description : String?

        # An external ID to assign to the asset. The external ID must be unique within your Amazon Web
        # Services account. For more information, see Using external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetExternalId")]
        getter asset_external_id : String?

        # The ID to assign to the asset, if desired. IoT SiteWise automatically generates a unique ID for you,
        # so this parameter is never required. However, if you prefer to supply your own ID instead, you can
        # specify it here in UUID format. If you specify your own ID, it must be globally unique.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of key-value pairs that contain metadata for the asset. For more information, see Tagging
        # your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @asset_model_id : String,
          @asset_name : String,
          @asset_description : String? = nil,
          @asset_external_id : String? = nil,
          @asset_id : String? = nil,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssetResponse
        include JSON::Serializable

        # The ARN of the asset, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}

        @[JSON::Field(key: "assetArn")]
        getter asset_arn : String

        # The ID of the asset, in UUID format. This ID uniquely identifies the asset within IoT SiteWise and
        # can be used with other IoT SiteWise API operations.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The status of the asset, which contains a state ( CREATING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "assetStatus")]
        getter asset_status : Types::AssetStatus

        def initialize(
          @asset_arn : String,
          @asset_id : String,
          @asset_status : Types::AssetStatus
        )
        end
      end


      struct CreateBulkImportJobRequest
        include JSON::Serializable

        # The Amazon S3 destination where errors associated with the job creation request are saved.

        @[JSON::Field(key: "errorReportLocation")]
        getter error_report_location : Types::ErrorReportLocation

        # The files in the specified Amazon S3 bucket that contain your data.

        @[JSON::Field(key: "files")]
        getter files : Array(Types::File)

        # Contains the configuration information of a job, such as the file format used to save data in Amazon
        # S3.

        @[JSON::Field(key: "jobConfiguration")]
        getter job_configuration : Types::JobConfiguration

        # The unique name that helps identify the job request.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The ARN of the IAM role that allows IoT SiteWise to read Amazon S3 data.

        @[JSON::Field(key: "jobRoleArn")]
        getter job_role_arn : String

        # If set to true, ingest new data into IoT SiteWise storage. Measurements with notifications, metrics
        # and transforms are computed. If set to false, historical data is ingested into IoT SiteWise as is.

        @[JSON::Field(key: "adaptiveIngestion")]
        getter adaptive_ingestion : Bool?

        # If set to true, your data files is deleted from S3, after ingestion into IoT SiteWise storage.

        @[JSON::Field(key: "deleteFilesAfterImport")]
        getter delete_files_after_import : Bool?

        def initialize(
          @error_report_location : Types::ErrorReportLocation,
          @files : Array(Types::File),
          @job_configuration : Types::JobConfiguration,
          @job_name : String,
          @job_role_arn : String,
          @adaptive_ingestion : Bool? = nil,
          @delete_files_after_import : Bool? = nil
        )
        end
      end


      struct CreateBulkImportJobResponse
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The unique name that helps identify the job request.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The status of the bulk import job can be one of following values: PENDING – IoT SiteWise is waiting
        # for the current bulk import job to finish. CANCELLED – The bulk import job has been canceled.
        # RUNNING – IoT SiteWise is processing your request to import your data from Amazon S3. COMPLETED –
        # IoT SiteWise successfully completed your request to import data from Amazon S3. FAILED – IoT
        # SiteWise couldn't process your request to import data from Amazon S3. You can use logs saved in the
        # specified error report location in Amazon S3 to troubleshoot issues. COMPLETED_WITH_FAILURES – IoT
        # SiteWise completed your request to import data from Amazon S3 with errors. You can use logs saved in
        # the specified error report location in Amazon S3 to troubleshoot issues.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        def initialize(
          @job_id : String,
          @job_name : String,
          @job_status : String
        )
        end
      end


      struct CreateComputationModelRequest
        include JSON::Serializable

        # The configuration for the computation model.

        @[JSON::Field(key: "computationModelConfiguration")]
        getter computation_model_configuration : Types::ComputationModelConfiguration

        # The data binding for the computation model. Key is a variable name defined in configuration. Value
        # is a ComputationModelDataBindingValue referenced by the variable.

        @[JSON::Field(key: "computationModelDataBinding")]
        getter computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue)

        # The name of the computation model.

        @[JSON::Field(key: "computationModelName")]
        getter computation_model_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the computation model.

        @[JSON::Field(key: "computationModelDescription")]
        getter computation_model_description : String?

        # A list of key-value pairs that contain metadata for the asset. For more information, see Tagging
        # your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @computation_model_configuration : Types::ComputationModelConfiguration,
          @computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue),
          @computation_model_name : String,
          @client_token : String? = nil,
          @computation_model_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateComputationModelResponse
        include JSON::Serializable

        # The ARN of the computation model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:computation-model/${ComputationModelId}

        @[JSON::Field(key: "computationModelArn")]
        getter computation_model_arn : String

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # The status of the computation model, containing a state (CREATING after successfully calling this
        # operation) and any error messages.

        @[JSON::Field(key: "computationModelStatus")]
        getter computation_model_status : Types::ComputationModelStatus

        def initialize(
          @computation_model_arn : String,
          @computation_model_id : String,
          @computation_model_status : Types::ComputationModelStatus
        )
        end
      end


      struct CreateDashboardRequest
        include JSON::Serializable

        # The dashboard definition specified in a JSON literal. IoT SiteWise Monitor (Classic) see Create
        # dashboards (CLI) IoT SiteWise Monitor (AI-aware) see Create dashboards (CLI) in the IoT SiteWise
        # User Guide

        @[JSON::Field(key: "dashboardDefinition")]
        getter dashboard_definition : String

        # A friendly name for the dashboard.

        @[JSON::Field(key: "dashboardName")]
        getter dashboard_name : String

        # The ID of the project in which to create the dashboard.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the dashboard.

        @[JSON::Field(key: "dashboardDescription")]
        getter dashboard_description : String?

        # A list of key-value pairs that contain metadata for the dashboard. For more information, see Tagging
        # your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @dashboard_definition : String,
          @dashboard_name : String,
          @project_id : String,
          @client_token : String? = nil,
          @dashboard_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDashboardResponse
        include JSON::Serializable

        # The ARN of the dashboard, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}

        @[JSON::Field(key: "dashboardArn")]
        getter dashboard_arn : String

        # The ID of the dashboard.

        @[JSON::Field(key: "dashboardId")]
        getter dashboard_id : String

        def initialize(
          @dashboard_arn : String,
          @dashboard_id : String
        )
        end
      end


      struct CreateDatasetRequest
        include JSON::Serializable

        # The name of the dataset.

        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The data source for the dataset.

        @[JSON::Field(key: "datasetSource")]
        getter dataset_source : Types::DatasetSource

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description about the dataset, and its functionality.

        @[JSON::Field(key: "datasetDescription")]
        getter dataset_description : String?

        # The ID of the dataset.

        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # A list of key-value pairs that contain metadata for the access policy. For more information, see
        # Tagging your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @dataset_name : String,
          @dataset_source : Types::DatasetSource,
          @client_token : String? = nil,
          @dataset_description : String? = nil,
          @dataset_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDatasetResponse
        include JSON::Serializable

        # The ARN of the dataset. The format is
        # arn:${Partition}:iotsitewise:${Region}:${Account}:dataset/${DatasetId} .

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        # The ID of the dataset.

        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # The status of the dataset. This contains the state and any error messages. State is CREATING after a
        # successfull call to this API, and any associated error message. The state is ACTIVE when ready to
        # use.

        @[JSON::Field(key: "datasetStatus")]
        getter dataset_status : Types::DatasetStatus

        def initialize(
          @dataset_arn : String,
          @dataset_id : String,
          @dataset_status : Types::DatasetStatus
        )
        end
      end


      struct CreateGatewayRequest
        include JSON::Serializable

        # A unique name for the gateway.

        @[JSON::Field(key: "gatewayName")]
        getter gateway_name : String

        # The gateway's platform. You can only specify one platform in a gateway.

        @[JSON::Field(key: "gatewayPlatform")]
        getter gateway_platform : Types::GatewayPlatform

        # The version of the gateway to create. Specify 3 to create an MQTT-enabled, V3 gateway and 2 to
        # create a Classic streams, V2 gateway. If not specified, the default is 2 (Classic streams, V2
        # gateway). When creating a V3 gateway ( gatewayVersion=3 ) with the GreengrassV2 platform, you must
        # also specify the coreDeviceOperatingSystem parameter. We recommend creating an MQTT-enabled gateway
        # for self-hosted gateways and Siemens Industrial Edge gateways. For more information on gateway
        # versions, see Use Amazon Web Services IoT SiteWise Edge Edge gateways .

        @[JSON::Field(key: "gatewayVersion")]
        getter gateway_version : String?

        # A list of key-value pairs that contain metadata for the gateway. For more information, see Tagging
        # your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @gateway_name : String,
          @gateway_platform : Types::GatewayPlatform,
          @gateway_version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateGatewayResponse
        include JSON::Serializable

        # The ARN of the gateway, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}

        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The ID of the gateway device. You can use this ID when you call other IoT SiteWise API operations.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @gateway_arn : String,
          @gateway_id : String
        )
        end
      end


      struct CreatePortalRequest
        include JSON::Serializable

        # The Amazon Web Services administrator's contact email address.

        @[JSON::Field(key: "portalContactEmail")]
        getter portal_contact_email : String

        # A friendly name for the portal.

        @[JSON::Field(key: "portalName")]
        getter portal_name : String

        # The ARN of a service role that allows the portal's users to access your IoT SiteWise resources on
        # your behalf. For more information, see Using service roles for IoT SiteWise Monitor in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Contains the configuration information of an alarm created in an IoT SiteWise Monitor portal. You
        # can use the alarm to monitor an asset property and get notified when the asset property value is
        # outside a specified range. For more information, see Monitoring with alarms in the IoT SiteWise
        # Application Guide .

        @[JSON::Field(key: "alarms")]
        getter alarms : Types::Alarms?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The email address that sends alarm notifications. If you use the IoT Events managed Lambda function
        # to manage your emails, you must verify the sender email address in Amazon SES .

        @[JSON::Field(key: "notificationSenderEmail")]
        getter notification_sender_email : String?

        # The service to use to authenticate users to the portal. Choose from the following options: SSO – The
        # portal uses IAM Identity Center to authenticate users and manage user permissions. Before you can
        # create a portal that uses IAM Identity Center, you must enable IAM Identity Center. For more
        # information, see Enabling IAM Identity Center in the IoT SiteWise User Guide . This option is only
        # available in Amazon Web Services Regions other than the China Regions. IAM – The portal uses
        # Identity and Access Management to authenticate users and manage user permissions. You can't change
        # this value after you create a portal. Default: SSO

        @[JSON::Field(key: "portalAuthMode")]
        getter portal_auth_mode : String?

        # A description for the portal.

        @[JSON::Field(key: "portalDescription")]
        getter portal_description : String?

        # A logo image to display in the portal. Upload a square, high-resolution image. The image is
        # displayed on a dark background.

        @[JSON::Field(key: "portalLogoImageFile")]
        getter portal_logo_image_file : Types::ImageFile?

        # Define the type of portal. The value for IoT SiteWise Monitor (Classic) is SITEWISE_PORTAL_V1 . The
        # value for IoT SiteWise Monitor (AI-aware) is SITEWISE_PORTAL_V2 .

        @[JSON::Field(key: "portalType")]
        getter portal_type : String?

        # The configuration entry associated with the specific portal type. The value for IoT SiteWise Monitor
        # (Classic) is SITEWISE_PORTAL_V1 . The value for IoT SiteWise Monitor (AI-aware) is
        # SITEWISE_PORTAL_V2 .

        @[JSON::Field(key: "portalTypeConfiguration")]
        getter portal_type_configuration : Hash(String, Types::PortalTypeEntry)?

        # A list of key-value pairs that contain metadata for the portal. For more information, see Tagging
        # your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @portal_contact_email : String,
          @portal_name : String,
          @role_arn : String,
          @alarms : Types::Alarms? = nil,
          @client_token : String? = nil,
          @notification_sender_email : String? = nil,
          @portal_auth_mode : String? = nil,
          @portal_description : String? = nil,
          @portal_logo_image_file : Types::ImageFile? = nil,
          @portal_type : String? = nil,
          @portal_type_configuration : Hash(String, Types::PortalTypeEntry)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePortalResponse
        include JSON::Serializable

        # The ARN of the portal, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}

        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ID of the created portal.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The URL for the IoT SiteWise Monitor portal. You can use this URL to access portals that use IAM
        # Identity Center for authentication. For portals that use IAM for authentication, you must use the
        # IoT SiteWise console to get a URL that you can use to access the portal.

        @[JSON::Field(key: "portalStartUrl")]
        getter portal_start_url : String

        # The status of the portal, which contains a state ( CREATING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "portalStatus")]
        getter portal_status : Types::PortalStatus

        # The associated IAM Identity Center application ID, if the portal uses IAM Identity Center.

        @[JSON::Field(key: "ssoApplicationId")]
        getter sso_application_id : String

        def initialize(
          @portal_arn : String,
          @portal_id : String,
          @portal_start_url : String,
          @portal_status : Types::PortalStatus,
          @sso_application_id : String
        )
        end
      end


      struct CreateProjectRequest
        include JSON::Serializable

        # The ID of the portal in which to create the project.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # A friendly name for the project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the project.

        @[JSON::Field(key: "projectDescription")]
        getter project_description : String?

        # A list of key-value pairs that contain metadata for the project. For more information, see Tagging
        # your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @portal_id : String,
          @project_name : String,
          @client_token : String? = nil,
          @project_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateProjectResponse
        include JSON::Serializable

        # The ARN of the project, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}

        @[JSON::Field(key: "projectArn")]
        getter project_arn : String

        # The ID of the project.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        def initialize(
          @project_arn : String,
          @project_id : String
        )
        end
      end

      # A .CSV file.

      struct Csv
        include JSON::Serializable

        # The column names specified in the .csv file.

        @[JSON::Field(key: "columnNames")]
        getter column_names : Array(String)

        def initialize(
          @column_names : Array(String)
        )
        end
      end

      # Contains information about a customer managed Amazon S3 bucket.

      struct CustomerManagedS3Storage
        include JSON::Serializable

        # The ARN of the Identity and Access Management role that allows IoT SiteWise to send data to Amazon
        # S3.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The ARN of the Amazon S3 object. For more information about how to find the ARN for an Amazon S3
        # object, see Amazon S3 resources in the Amazon Simple Storage Service User Guide .

        @[JSON::Field(key: "s3ResourceArn")]
        getter s3_resource_arn : String

        def initialize(
          @role_arn : String,
          @s3_resource_arn : String
        )
        end
      end

      # Contains a dashboard summary.

      struct DashboardSummary
        include JSON::Serializable

        # The ID of the dashboard.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the dashboard

        @[JSON::Field(key: "name")]
        getter name : String

        # The date the dashboard was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The dashboard's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date the dashboard was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time?

        def initialize(
          @id : String,
          @name : String,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @last_update_date : Time? = nil
        )
        end
      end

      # Represents a value used in a data binding. It can be an asset property or an asset model property.

      struct DataBindingValue
        include JSON::Serializable


        @[JSON::Field(key: "assetModelProperty")]
        getter asset_model_property : Types::AssetModelPropertyBindingValue?

        # The asset property value used in the data binding.

        @[JSON::Field(key: "assetProperty")]
        getter asset_property : Types::AssetPropertyBindingValue?

        def initialize(
          @asset_model_property : Types::AssetModelPropertyBindingValue? = nil,
          @asset_property : Types::AssetPropertyBindingValue? = nil
        )
        end
      end

      # A filter used to match specific data binding values based on criteria. This filter allows searching
      # for data bindings by asset, asset model, asset property, or asset model property.

      struct DataBindingValueFilter
        include JSON::Serializable

        # Filter criteria for matching data bindings based on a specific asset. Used to list all data bindings
        # referencing a particular asset or its properties.

        @[JSON::Field(key: "asset")]
        getter asset : Types::AssetBindingValueFilter?

        # Filter criteria for matching data bindings based on a specific asset model. Used to list all data
        # bindings referencing a particular asset model or its properties.

        @[JSON::Field(key: "assetModel")]
        getter asset_model : Types::AssetModelBindingValueFilter?

        # Filter criteria for matching data bindings based on a specific asset model property. Used to list
        # all data bindings referencing a particular property of an asset model.

        @[JSON::Field(key: "assetModelProperty")]
        getter asset_model_property : Types::AssetModelPropertyBindingValueFilter?

        # Filter criteria for matching data bindings based on a specific asset property. Used to list all data
        # bindings referencing a particular property of an asset.

        @[JSON::Field(key: "assetProperty")]
        getter asset_property : Types::AssetPropertyBindingValueFilter?

        def initialize(
          @asset : Types::AssetBindingValueFilter? = nil,
          @asset_model : Types::AssetModelBindingValueFilter? = nil,
          @asset_model_property : Types::AssetModelPropertyBindingValueFilter? = nil,
          @asset_property : Types::AssetPropertyBindingValueFilter? = nil
        )
        end
      end

      # Contains information about the dataset use and it's source.

      struct DataSetReference
        include JSON::Serializable

        # The ARN of the dataset. The format is
        # arn:${Partition}:iotsitewise:${Region}:${Account}:dataset/${DatasetId} .

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The data source for the dataset.

        @[JSON::Field(key: "source")]
        getter source : Types::Source?

        def initialize(
          @dataset_arn : String? = nil,
          @source : Types::Source? = nil
        )
        end
      end

      # The data source for the dataset.

      struct DatasetSource
        include JSON::Serializable

        # The format of the dataset source associated with the dataset.

        @[JSON::Field(key: "sourceFormat")]
        getter source_format : String

        # The type of data source for the dataset.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The details of the dataset source associated with the dataset.

        @[JSON::Field(key: "sourceDetail")]
        getter source_detail : Types::SourceDetail?

        def initialize(
          @source_format : String,
          @source_type : String,
          @source_detail : Types::SourceDetail? = nil
        )
        end
      end

      # The status of the dataset. This contains the state and any error messages. The state is ACTIVE when
      # ready to use.

      struct DatasetStatus
        include JSON::Serializable

        # The current status of the dataset.

        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        def initialize(
          @state : String,
          @error : Types::ErrorDetails? = nil
        )
        end
      end

      # The summary details for the dataset.

      struct DatasetSummary
        include JSON::Serializable

        # The ARN of the dataset. The format is
        # arn:${Partition}:iotsitewise:${Region}:${Account}:dataset/${DatasetId} .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The dataset creation date, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time

        # A description about the dataset, and its functionality.

        @[JSON::Field(key: "description")]
        getter description : String

        # The ID of the dataset.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date the dataset was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time

        # The name of the dataset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the dataset. This contains the state and any error messages. The state is ACTIVE when
        # ready to use.

        @[JSON::Field(key: "status")]
        getter status : Types::DatasetStatus

        def initialize(
          @arn : String,
          @creation_date : Time,
          @description : String,
          @id : String,
          @last_update_date : Time,
          @name : String,
          @status : Types::DatasetStatus
        )
        end
      end

      # Represents a single data point in a query result.

      struct Datum
        include JSON::Serializable

        # Indicates if the data point is an array.

        @[JSON::Field(key: "arrayValue")]
        getter array_value : Array(Types::Datum)?

        # Indicates if the data point is null.

        @[JSON::Field(key: "nullValue")]
        getter null_value : Bool?

        # Indicates if the data point is a row.

        @[JSON::Field(key: "rowValue")]
        getter row_value : Types::Row?

        # Indicates if the data point is a scalar value such as integer, string, double, or Boolean.

        @[JSON::Field(key: "scalarValue")]
        getter scalar_value : String?

        def initialize(
          @array_value : Array(Types::Datum)? = nil,
          @null_value : Bool? = nil,
          @row_value : Types::Row? = nil,
          @scalar_value : String? = nil
        )
        end
      end


      struct DeleteAccessPolicyRequest
        include JSON::Serializable

        # The ID of the access policy to be deleted.

        @[JSON::Field(key: "accessPolicyId")]
        getter access_policy_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @access_policy_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteAccessPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAssetModelCompositeModelRequest
        include JSON::Serializable

        # The ID of a composite model on this asset model.

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String

        # The ID of the asset model, in UUID format.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The expected current entity tag (ETag) for the asset model’s latest or active version (specified
        # using matchForVersionType ). The delete request is rejected if the tag does not match the latest or
        # active version's current entity tag. See Optimistic locking for asset model writes in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Accepts * to reject the delete request if an active version (specified using matchForVersionType as
        # ACTIVE ) already exists for the asset model.

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # Specifies the asset model version type ( LATEST or ACTIVE ) used in conjunction with If-Match or
        # If-None-Match headers to determine the target ETag for the delete operation.

        @[JSON::Field(key: "Match-For-Version-Type")]
        getter match_for_version_type : String?

        def initialize(
          @asset_model_composite_model_id : String,
          @asset_model_id : String,
          @client_token : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @match_for_version_type : String? = nil
        )
        end
      end


      struct DeleteAssetModelCompositeModelResponse
        include JSON::Serializable


        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        def initialize(
          @asset_model_status : Types::AssetModelStatus
        )
        end
      end


      struct DeleteAssetModelInterfaceRelationshipRequest
        include JSON::Serializable

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The ID of the interface asset model. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_model_id : String,
          @interface_asset_model_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteAssetModelInterfaceRelationshipResponse
        include JSON::Serializable

        # The ARN of the asset model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}

        @[JSON::Field(key: "assetModelArn")]
        getter asset_model_arn : String

        # The ID of the asset model.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String


        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        # The ID of the interface asset model.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        def initialize(
          @asset_model_arn : String,
          @asset_model_id : String,
          @asset_model_status : Types::AssetModelStatus,
          @interface_asset_model_id : String
        )
        end
      end


      struct DeleteAssetModelRequest
        include JSON::Serializable

        # The ID of the asset model to delete. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The expected current entity tag (ETag) for the asset model’s latest or active version (specified
        # using matchForVersionType ). The delete request is rejected if the tag does not match the latest or
        # active version's current entity tag. See Optimistic locking for asset model writes in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Accepts * to reject the delete request if an active version (specified using matchForVersionType as
        # ACTIVE ) already exists for the asset model.

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # Specifies the asset model version type ( LATEST or ACTIVE ) used in conjunction with If-Match or
        # If-None-Match headers to determine the target ETag for the delete operation.

        @[JSON::Field(key: "Match-For-Version-Type")]
        getter match_for_version_type : String?

        def initialize(
          @asset_model_id : String,
          @client_token : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @match_for_version_type : String? = nil
        )
        end
      end


      struct DeleteAssetModelResponse
        include JSON::Serializable

        # The status of the asset model, which contains a state ( DELETING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        def initialize(
          @asset_model_status : Types::AssetModelStatus
        )
        end
      end


      struct DeleteAssetRequest
        include JSON::Serializable

        # The ID of the asset to delete. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteAssetResponse
        include JSON::Serializable

        # The status of the asset, which contains a state ( DELETING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "assetStatus")]
        getter asset_status : Types::AssetStatus

        def initialize(
          @asset_status : Types::AssetStatus
        )
        end
      end


      struct DeleteComputationModelRequest
        include JSON::Serializable

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @computation_model_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteComputationModelResponse
        include JSON::Serializable

        # The status of the computation model. It contains a state (DELETING after successfully calling this
        # operation) and any error messages.

        @[JSON::Field(key: "computationModelStatus")]
        getter computation_model_status : Types::ComputationModelStatus

        def initialize(
          @computation_model_status : Types::ComputationModelStatus
        )
        end
      end


      struct DeleteDashboardRequest
        include JSON::Serializable

        # The ID of the dashboard to delete.

        @[JSON::Field(key: "dashboardId")]
        getter dashboard_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @dashboard_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteDashboardResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDatasetRequest
        include JSON::Serializable

        # The ID of the dataset.

        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @dataset_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteDatasetResponse
        include JSON::Serializable

        # The status of the dataset. This contains the state and any error messages. State is DELETING after a
        # successfull call to this API, and any associated error message.

        @[JSON::Field(key: "datasetStatus")]
        getter dataset_status : Types::DatasetStatus

        def initialize(
          @dataset_status : Types::DatasetStatus
        )
        end
      end


      struct DeleteGatewayRequest
        include JSON::Serializable

        # The ID of the gateway to delete.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @gateway_id : String
        )
        end
      end


      struct DeletePortalRequest
        include JSON::Serializable

        # The ID of the portal to delete.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @portal_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeletePortalResponse
        include JSON::Serializable

        # The status of the portal, which contains a state ( DELETING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "portalStatus")]
        getter portal_status : Types::PortalStatus

        def initialize(
          @portal_status : Types::PortalStatus
        )
        end
      end


      struct DeleteProjectRequest
        include JSON::Serializable

        # The ID of the project.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @project_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteProjectResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTimeSeriesRequest
        include JSON::Serializable

        # The alias that identifies the time series.

        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The ID of the asset in which the asset property was created. This can be either the actual ID in
        # UUID format, or else externalId: followed by the external ID, if it has one. For more information,
        # see Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ID of the asset property. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @alias : String? = nil,
          @asset_id : String? = nil,
          @client_token : String? = nil,
          @property_id : String? = nil
        )
        end
      end


      struct DescribeAccessPolicyRequest
        include JSON::Serializable

        # The ID of the access policy.

        @[JSON::Field(key: "accessPolicyId")]
        getter access_policy_id : String

        def initialize(
          @access_policy_id : String
        )
        end
      end


      struct DescribeAccessPolicyResponse
        include JSON::Serializable

        # The ARN of the access policy, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}

        @[JSON::Field(key: "accessPolicyArn")]
        getter access_policy_arn : String

        # The date the access policy was created, in Unix epoch time.

        @[JSON::Field(key: "accessPolicyCreationDate")]
        getter access_policy_creation_date : Time

        # The ID of the access policy.

        @[JSON::Field(key: "accessPolicyId")]
        getter access_policy_id : String

        # The identity (IAM Identity Center user, IAM Identity Center group, or IAM user) to which this access
        # policy applies.

        @[JSON::Field(key: "accessPolicyIdentity")]
        getter access_policy_identity : Types::Identity

        # The date the access policy was last updated, in Unix epoch time.

        @[JSON::Field(key: "accessPolicyLastUpdateDate")]
        getter access_policy_last_update_date : Time

        # The access policy permission. Note that a project ADMINISTRATOR is also known as a project owner.

        @[JSON::Field(key: "accessPolicyPermission")]
        getter access_policy_permission : String

        # The IoT SiteWise Monitor resource (portal or project) to which this access policy provides access.

        @[JSON::Field(key: "accessPolicyResource")]
        getter access_policy_resource : Types::Resource

        def initialize(
          @access_policy_arn : String,
          @access_policy_creation_date : Time,
          @access_policy_id : String,
          @access_policy_identity : Types::Identity,
          @access_policy_last_update_date : Time,
          @access_policy_permission : String,
          @access_policy_resource : Types::Resource
        )
        end
      end


      struct DescribeActionRequest
        include JSON::Serializable

        # The ID of the action.

        @[JSON::Field(key: "actionId")]
        getter action_id : String

        def initialize(
          @action_id : String
        )
        end
      end


      struct DescribeActionResponse
        include JSON::Serializable

        # The ID of the action definition.

        @[JSON::Field(key: "actionDefinitionId")]
        getter action_definition_id : String

        # The ID of the action.

        @[JSON::Field(key: "actionId")]
        getter action_id : String

        # The JSON payload of the action.

        @[JSON::Field(key: "actionPayload")]
        getter action_payload : Types::ActionPayload

        # The time the action was executed.

        @[JSON::Field(key: "executionTime")]
        getter execution_time : Time

        # The resource the action will be taken on.

        @[JSON::Field(key: "targetResource")]
        getter target_resource : Types::TargetResource

        # The detailed resource this action resolves to.

        @[JSON::Field(key: "resolveTo")]
        getter resolve_to : Types::ResolveTo?

        def initialize(
          @action_definition_id : String,
          @action_id : String,
          @action_payload : Types::ActionPayload,
          @execution_time : Time,
          @target_resource : Types::TargetResource,
          @resolve_to : Types::ResolveTo? = nil
        )
        end
      end


      struct DescribeAssetCompositeModelRequest
        include JSON::Serializable

        # The ID of a composite model on this asset. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetCompositeModelId")]
        getter asset_composite_model_id : String

        # The ID of the asset. This can be either the actual ID in UUID format, or else externalId: followed
        # by the external ID, if it has one. For more information, see Referencing objects with external IDs
        # in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        def initialize(
          @asset_composite_model_id : String,
          @asset_id : String
        )
        end
      end


      struct DescribeAssetCompositeModelResponse
        include JSON::Serializable

        # A description for the composite model.

        @[JSON::Field(key: "assetCompositeModelDescription")]
        getter asset_composite_model_description : String

        # The ID of a composite model on this asset.

        @[JSON::Field(key: "assetCompositeModelId")]
        getter asset_composite_model_id : String

        # The unique, friendly name for the composite model.

        @[JSON::Field(key: "assetCompositeModelName")]
        getter asset_composite_model_name : String

        # The path to the composite model listing the parent composite models.

        @[JSON::Field(key: "assetCompositeModelPath")]
        getter asset_composite_model_path : Array(Types::AssetCompositeModelPathSegment)

        # The property definitions of the composite model that was used to create the asset.

        @[JSON::Field(key: "assetCompositeModelProperties")]
        getter asset_composite_model_properties : Array(Types::AssetProperty)

        # The list of composite model summaries.

        @[JSON::Field(key: "assetCompositeModelSummaries")]
        getter asset_composite_model_summaries : Array(Types::AssetCompositeModelSummary)

        # The composite model type. Valid values are AWS/ALARM , CUSTOM , or AWS/L4E_ANOMALY .

        @[JSON::Field(key: "assetCompositeModelType")]
        getter asset_composite_model_type : String

        # The ID of the asset, in UUID format. This ID uniquely identifies the asset within IoT SiteWise and
        # can be used with other IoT SiteWise APIs.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The available actions for a composite model on this asset.

        @[JSON::Field(key: "actionDefinitions")]
        getter action_definitions : Array(Types::ActionDefinition)?

        # An external ID to assign to the asset model. If the composite model is a component-based composite
        # model, or one nested inside a component model, you can only set the external ID using
        # UpdateAssetModelCompositeModel and specifying the derived ID of the model or property from the
        # created model it's a part of.

        @[JSON::Field(key: "assetCompositeModelExternalId")]
        getter asset_composite_model_external_id : String?

        def initialize(
          @asset_composite_model_description : String,
          @asset_composite_model_id : String,
          @asset_composite_model_name : String,
          @asset_composite_model_path : Array(Types::AssetCompositeModelPathSegment),
          @asset_composite_model_properties : Array(Types::AssetProperty),
          @asset_composite_model_summaries : Array(Types::AssetCompositeModelSummary),
          @asset_composite_model_type : String,
          @asset_id : String,
          @action_definitions : Array(Types::ActionDefinition)? = nil,
          @asset_composite_model_external_id : String? = nil
        )
        end
      end


      struct DescribeAssetModelCompositeModelRequest
        include JSON::Serializable

        # The ID of a composite model on this asset model. This can be either the actual ID in UUID format, or
        # else externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The version alias that specifies the latest or active version of the asset model. The details are
        # returned in the response. The default value is LATEST . See Asset model versions in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "assetModelVersion")]
        getter asset_model_version : String?

        def initialize(
          @asset_model_composite_model_id : String,
          @asset_model_id : String,
          @asset_model_version : String? = nil
        )
        end
      end


      struct DescribeAssetModelCompositeModelResponse
        include JSON::Serializable

        # The description for the composite model.

        @[JSON::Field(key: "assetModelCompositeModelDescription")]
        getter asset_model_composite_model_description : String

        # The ID of a composite model on this asset model.

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String

        # The unique, friendly name for the composite model.

        @[JSON::Field(key: "assetModelCompositeModelName")]
        getter asset_model_composite_model_name : String

        # The path to the composite model listing the parent composite models.

        @[JSON::Field(key: "assetModelCompositeModelPath")]
        getter asset_model_composite_model_path : Array(Types::AssetModelCompositeModelPathSegment)

        # The property definitions of the composite model.

        @[JSON::Field(key: "assetModelCompositeModelProperties")]
        getter asset_model_composite_model_properties : Array(Types::AssetModelProperty)

        # The list of composite model summaries for the composite model.

        @[JSON::Field(key: "assetModelCompositeModelSummaries")]
        getter asset_model_composite_model_summaries : Array(Types::AssetModelCompositeModelSummary)

        # The composite model type. Valid values are AWS/ALARM , CUSTOM , or AWS/L4E_ANOMALY .

        @[JSON::Field(key: "assetModelCompositeModelType")]
        getter asset_model_composite_model_type : String

        # The ID of the asset model, in UUID format.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The available actions for a composite model on this asset model.

        @[JSON::Field(key: "actionDefinitions")]
        getter action_definitions : Array(Types::ActionDefinition)?

        # The external ID of a composite model on this asset model.

        @[JSON::Field(key: "assetModelCompositeModelExternalId")]
        getter asset_model_composite_model_external_id : String?

        # Metadata for the composition relationship established by using composedAssetModelId in
        # CreateAssetModelCompositeModel . For instance, an array detailing the path of the composition
        # relationship for this composite model.

        @[JSON::Field(key: "compositionDetails")]
        getter composition_details : Types::CompositionDetails?

        def initialize(
          @asset_model_composite_model_description : String,
          @asset_model_composite_model_id : String,
          @asset_model_composite_model_name : String,
          @asset_model_composite_model_path : Array(Types::AssetModelCompositeModelPathSegment),
          @asset_model_composite_model_properties : Array(Types::AssetModelProperty),
          @asset_model_composite_model_summaries : Array(Types::AssetModelCompositeModelSummary),
          @asset_model_composite_model_type : String,
          @asset_model_id : String,
          @action_definitions : Array(Types::ActionDefinition)? = nil,
          @asset_model_composite_model_external_id : String? = nil,
          @composition_details : Types::CompositionDetails? = nil
        )
        end
      end


      struct DescribeAssetModelInterfaceRelationshipRequest
        include JSON::Serializable

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The ID of the interface asset model. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        def initialize(
          @asset_model_id : String,
          @interface_asset_model_id : String
        )
        end
      end


      struct DescribeAssetModelInterfaceRelationshipResponse
        include JSON::Serializable

        # The ID of the asset model.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # A list of hierarchy mappings between the interface asset model and the asset model where the
        # interface is applied.

        @[JSON::Field(key: "hierarchyMappings")]
        getter hierarchy_mappings : Array(Types::HierarchyMapping)

        # The ID of the interface asset model.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        # A list of property mappings between the interface asset model and the asset model where the
        # interface is applied.

        @[JSON::Field(key: "propertyMappings")]
        getter property_mappings : Array(Types::PropertyMapping)

        def initialize(
          @asset_model_id : String,
          @hierarchy_mappings : Array(Types::HierarchyMapping),
          @interface_asset_model_id : String,
          @property_mappings : Array(Types::PropertyMapping)
        )
        end
      end


      struct DescribeAssetModelRequest
        include JSON::Serializable

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The version alias that specifies the latest or active version of the asset model. The details are
        # returned in the response. The default value is LATEST . See Asset model versions in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "assetModelVersion")]
        getter asset_model_version : String?

        # Whether or not to exclude asset model properties from the response.

        @[JSON::Field(key: "excludeProperties")]
        getter exclude_properties : Bool?

        def initialize(
          @asset_model_id : String,
          @asset_model_version : String? = nil,
          @exclude_properties : Bool? = nil
        )
        end
      end


      struct DescribeAssetModelResponse
        include JSON::Serializable

        # The ARN of the asset model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}

        @[JSON::Field(key: "assetModelArn")]
        getter asset_model_arn : String

        # The date the asset model was created, in Unix epoch time.

        @[JSON::Field(key: "assetModelCreationDate")]
        getter asset_model_creation_date : Time

        # The asset model's description.

        @[JSON::Field(key: "assetModelDescription")]
        getter asset_model_description : String

        # A list of asset model hierarchies that each contain a childAssetModelId and a hierarchyId (named id
        # ). A hierarchy specifies allowed parent/child asset relationships for an asset model.

        @[JSON::Field(key: "assetModelHierarchies")]
        getter asset_model_hierarchies : Array(Types::AssetModelHierarchy)

        # The ID of the asset model, in UUID format.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The date the asset model was last updated, in Unix epoch time.

        @[JSON::Field(key: "assetModelLastUpdateDate")]
        getter asset_model_last_update_date : Time

        # The name of the asset model.

        @[JSON::Field(key: "assetModelName")]
        getter asset_model_name : String

        # The list of asset properties for the asset model. This object doesn't include properties that you
        # define in composite models. You can find composite model properties in the assetModelCompositeModels
        # object.

        @[JSON::Field(key: "assetModelProperties")]
        getter asset_model_properties : Array(Types::AssetModelProperty)

        # The current status of the asset model, which contains a state and any error message.

        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        # The list of the immediate child custom composite model summaries for the asset model.

        @[JSON::Field(key: "assetModelCompositeModelSummaries")]
        getter asset_model_composite_model_summaries : Array(Types::AssetModelCompositeModelSummary)?

        # The list of built-in composite models for the asset model, such as those with those of type
        # AWS/ALARMS .

        @[JSON::Field(key: "assetModelCompositeModels")]
        getter asset_model_composite_models : Array(Types::AssetModelCompositeModel)?

        # The external ID of the asset model, if any.

        @[JSON::Field(key: "assetModelExternalId")]
        getter asset_model_external_id : String?

        # The type of asset model. ASSET_MODEL – (default) An asset model that you can use to create assets.
        # Can't be included as a component in another asset model. COMPONENT_MODEL – A reusable component that
        # you can include in the composite models of other asset models. You can't create assets directly from
        # this type of asset model.

        @[JSON::Field(key: "assetModelType")]
        getter asset_model_type : String?

        # The version of the asset model. See Asset model versions in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelVersion")]
        getter asset_model_version : String?

        # The entity tag (ETag) is a hash of the retrieved version of the asset model. It's used to make
        # concurrent updates safely to the resource. See Optimistic locking for asset model writes in the IoT
        # SiteWise User Guide . See Optimistic locking for asset model writes in the IoT SiteWise User Guide .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # A list of interface details that describe the interfaces implemented by this asset model, including
        # interface asset model IDs and property mappings.

        @[JSON::Field(key: "interfaceDetails")]
        getter interface_details : Array(Types::InterfaceRelationship)?

        def initialize(
          @asset_model_arn : String,
          @asset_model_creation_date : Time,
          @asset_model_description : String,
          @asset_model_hierarchies : Array(Types::AssetModelHierarchy),
          @asset_model_id : String,
          @asset_model_last_update_date : Time,
          @asset_model_name : String,
          @asset_model_properties : Array(Types::AssetModelProperty),
          @asset_model_status : Types::AssetModelStatus,
          @asset_model_composite_model_summaries : Array(Types::AssetModelCompositeModelSummary)? = nil,
          @asset_model_composite_models : Array(Types::AssetModelCompositeModel)? = nil,
          @asset_model_external_id : String? = nil,
          @asset_model_type : String? = nil,
          @asset_model_version : String? = nil,
          @e_tag : String? = nil,
          @interface_details : Array(Types::InterfaceRelationship)? = nil
        )
        end
      end


      struct DescribeAssetPropertyRequest
        include JSON::Serializable

        # The ID of the asset. This can be either the actual ID in UUID format, or else externalId: followed
        # by the external ID, if it has one. For more information, see Referencing objects with external IDs
        # in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the asset property. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        def initialize(
          @asset_id : String,
          @property_id : String
        )
        end
      end


      struct DescribeAssetPropertyResponse
        include JSON::Serializable

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the asset model, in UUID format.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The name of the asset.

        @[JSON::Field(key: "assetName")]
        getter asset_name : String

        # The external ID of the asset. For more information, see Using external IDs in the IoT SiteWise User
        # Guide .

        @[JSON::Field(key: "assetExternalId")]
        getter asset_external_id : String?

        # The asset property's definition, alias, and notification state. This response includes this object
        # for normal asset properties. If you describe an asset property in a composite model, this response
        # includes the asset property information in compositeModel .

        @[JSON::Field(key: "assetProperty")]
        getter asset_property : Types::Property?

        # The composite model that declares this asset property, if this asset property exists in a composite
        # model.

        @[JSON::Field(key: "compositeModel")]
        getter composite_model : Types::CompositeModelProperty?

        def initialize(
          @asset_id : String,
          @asset_model_id : String,
          @asset_name : String,
          @asset_external_id : String? = nil,
          @asset_property : Types::Property? = nil,
          @composite_model : Types::CompositeModelProperty? = nil
        )
        end
      end


      struct DescribeAssetRequest
        include JSON::Serializable

        # The ID of the asset. This can be either the actual ID in UUID format, or else externalId: followed
        # by the external ID, if it has one. For more information, see Referencing objects with external IDs
        # in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # Whether or not to exclude asset properties from the response.

        @[JSON::Field(key: "excludeProperties")]
        getter exclude_properties : Bool?

        def initialize(
          @asset_id : String,
          @exclude_properties : Bool? = nil
        )
        end
      end


      struct DescribeAssetResponse
        include JSON::Serializable

        # The ARN of the asset, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}

        @[JSON::Field(key: "assetArn")]
        getter asset_arn : String

        # The date the asset was created, in Unix epoch time.

        @[JSON::Field(key: "assetCreationDate")]
        getter asset_creation_date : Time

        # A list of asset hierarchies that each contain a hierarchyId . A hierarchy specifies allowed
        # parent/child asset relationships.

        @[JSON::Field(key: "assetHierarchies")]
        getter asset_hierarchies : Array(Types::AssetHierarchy)

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The date the asset was last updated, in Unix epoch time.

        @[JSON::Field(key: "assetLastUpdateDate")]
        getter asset_last_update_date : Time

        # The ID of the asset model that was used to create the asset.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The name of the asset.

        @[JSON::Field(key: "assetName")]
        getter asset_name : String

        # The list of asset properties for the asset. This object doesn't include properties that you define
        # in composite models. You can find composite model properties in the assetCompositeModels object.

        @[JSON::Field(key: "assetProperties")]
        getter asset_properties : Array(Types::AssetProperty)

        # The current status of the asset, which contains a state and any error message.

        @[JSON::Field(key: "assetStatus")]
        getter asset_status : Types::AssetStatus

        # The list of the immediate child custom composite model summaries for the asset.

        @[JSON::Field(key: "assetCompositeModelSummaries")]
        getter asset_composite_model_summaries : Array(Types::AssetCompositeModelSummary)?

        # The composite models for the asset.

        @[JSON::Field(key: "assetCompositeModels")]
        getter asset_composite_models : Array(Types::AssetCompositeModel)?

        # A description for the asset.

        @[JSON::Field(key: "assetDescription")]
        getter asset_description : String?

        # The external ID of the asset, if any.

        @[JSON::Field(key: "assetExternalId")]
        getter asset_external_id : String?

        def initialize(
          @asset_arn : String,
          @asset_creation_date : Time,
          @asset_hierarchies : Array(Types::AssetHierarchy),
          @asset_id : String,
          @asset_last_update_date : Time,
          @asset_model_id : String,
          @asset_name : String,
          @asset_properties : Array(Types::AssetProperty),
          @asset_status : Types::AssetStatus,
          @asset_composite_model_summaries : Array(Types::AssetCompositeModelSummary)? = nil,
          @asset_composite_models : Array(Types::AssetCompositeModel)? = nil,
          @asset_description : String? = nil,
          @asset_external_id : String? = nil
        )
        end
      end


      struct DescribeBulkImportJobRequest
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribeBulkImportJobResponse
        include JSON::Serializable

        # The Amazon S3 destination where errors associated with the job creation request are saved.

        @[JSON::Field(key: "errorReportLocation")]
        getter error_report_location : Types::ErrorReportLocation

        # The files in the specified Amazon S3 bucket that contain your data.

        @[JSON::Field(key: "files")]
        getter files : Array(Types::File)

        # Contains the configuration information of a job, such as the file format used to save data in Amazon
        # S3.

        @[JSON::Field(key: "jobConfiguration")]
        getter job_configuration : Types::JobConfiguration

        # The date the job was created, in Unix epoch TIME.

        @[JSON::Field(key: "jobCreationDate")]
        getter job_creation_date : Time

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The date the job was last updated, in Unix epoch time.

        @[JSON::Field(key: "jobLastUpdateDate")]
        getter job_last_update_date : Time

        # The unique name that helps identify the job request.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The ARN of the IAM role that allows IoT SiteWise to read Amazon S3 data.

        @[JSON::Field(key: "jobRoleArn")]
        getter job_role_arn : String

        # The status of the bulk import job can be one of following values: PENDING – IoT SiteWise is waiting
        # for the current bulk import job to finish. CANCELLED – The bulk import job has been canceled.
        # RUNNING – IoT SiteWise is processing your request to import your data from Amazon S3. COMPLETED –
        # IoT SiteWise successfully completed your request to import data from Amazon S3. FAILED – IoT
        # SiteWise couldn't process your request to import data from Amazon S3. You can use logs saved in the
        # specified error report location in Amazon S3 to troubleshoot issues. COMPLETED_WITH_FAILURES – IoT
        # SiteWise completed your request to import data from Amazon S3 with errors. You can use logs saved in
        # the specified error report location in Amazon S3 to troubleshoot issues.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        # If set to true, ingest new data into IoT SiteWise storage. Measurements with notifications, metrics
        # and transforms are computed. If set to false, historical data is ingested into IoT SiteWise as is.

        @[JSON::Field(key: "adaptiveIngestion")]
        getter adaptive_ingestion : Bool?

        # If set to true, your data files is deleted from S3, after ingestion into IoT SiteWise storage.

        @[JSON::Field(key: "deleteFilesAfterImport")]
        getter delete_files_after_import : Bool?

        def initialize(
          @error_report_location : Types::ErrorReportLocation,
          @files : Array(Types::File),
          @job_configuration : Types::JobConfiguration,
          @job_creation_date : Time,
          @job_id : String,
          @job_last_update_date : Time,
          @job_name : String,
          @job_role_arn : String,
          @job_status : String,
          @adaptive_ingestion : Bool? = nil,
          @delete_files_after_import : Bool? = nil
        )
        end
      end


      struct DescribeComputationModelExecutionSummaryRequest
        include JSON::Serializable

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # The ID of the resolved resource.

        @[JSON::Field(key: "resolveToResourceId")]
        getter resolve_to_resource_id : String?

        # The type of the resolved resource.

        @[JSON::Field(key: "resolveToResourceType")]
        getter resolve_to_resource_type : String?

        def initialize(
          @computation_model_id : String,
          @resolve_to_resource_id : String? = nil,
          @resolve_to_resource_type : String? = nil
        )
        end
      end


      struct DescribeComputationModelExecutionSummaryResponse
        include JSON::Serializable

        # Contains the execution summary of the computation model.

        @[JSON::Field(key: "computationModelExecutionSummary")]
        getter computation_model_execution_summary : Hash(String, String)

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # The detailed resource this execution summary resolves to.

        @[JSON::Field(key: "resolveTo")]
        getter resolve_to : Types::ResolveTo?

        def initialize(
          @computation_model_execution_summary : Hash(String, String),
          @computation_model_id : String,
          @resolve_to : Types::ResolveTo? = nil
        )
        end
      end


      struct DescribeComputationModelRequest
        include JSON::Serializable

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # The version of the computation model.

        @[JSON::Field(key: "computationModelVersion")]
        getter computation_model_version : String?

        def initialize(
          @computation_model_id : String,
          @computation_model_version : String? = nil
        )
        end
      end


      struct DescribeComputationModelResponse
        include JSON::Serializable

        # The available actions for this computation model.

        @[JSON::Field(key: "actionDefinitions")]
        getter action_definitions : Array(Types::ActionDefinition)

        # The ARN of the computation model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:computation-model/${ComputationModelId}

        @[JSON::Field(key: "computationModelArn")]
        getter computation_model_arn : String

        # The configuration for the computation model.

        @[JSON::Field(key: "computationModelConfiguration")]
        getter computation_model_configuration : Types::ComputationModelConfiguration

        # The model creation date, in Unix epoch time.

        @[JSON::Field(key: "computationModelCreationDate")]
        getter computation_model_creation_date : Time

        # The data binding for the computation model. Key is a variable name defined in configuration. Value
        # is a ComputationModelDataBindingValue referenced by the variable.

        @[JSON::Field(key: "computationModelDataBinding")]
        getter computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue)

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # The date the model was last updated, in Unix epoch time.

        @[JSON::Field(key: "computationModelLastUpdateDate")]
        getter computation_model_last_update_date : Time

        # The name of the computation model.

        @[JSON::Field(key: "computationModelName")]
        getter computation_model_name : String

        # The current status of the asset model, which contains a state and an error message if any.

        @[JSON::Field(key: "computationModelStatus")]
        getter computation_model_status : Types::ComputationModelStatus

        # The version of the computation model.

        @[JSON::Field(key: "computationModelVersion")]
        getter computation_model_version : String

        # The description of the computation model.

        @[JSON::Field(key: "computationModelDescription")]
        getter computation_model_description : String?

        def initialize(
          @action_definitions : Array(Types::ActionDefinition),
          @computation_model_arn : String,
          @computation_model_configuration : Types::ComputationModelConfiguration,
          @computation_model_creation_date : Time,
          @computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue),
          @computation_model_id : String,
          @computation_model_last_update_date : Time,
          @computation_model_name : String,
          @computation_model_status : Types::ComputationModelStatus,
          @computation_model_version : String,
          @computation_model_description : String? = nil
        )
        end
      end


      struct DescribeDashboardRequest
        include JSON::Serializable

        # The ID of the dashboard.

        @[JSON::Field(key: "dashboardId")]
        getter dashboard_id : String

        def initialize(
          @dashboard_id : String
        )
        end
      end


      struct DescribeDashboardResponse
        include JSON::Serializable

        # The ARN of the dashboard, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}

        @[JSON::Field(key: "dashboardArn")]
        getter dashboard_arn : String

        # The date the dashboard was created, in Unix epoch time.

        @[JSON::Field(key: "dashboardCreationDate")]
        getter dashboard_creation_date : Time

        # The dashboard's definition JSON literal. For detailed information, see Creating dashboards (CLI) in
        # the IoT SiteWise User Guide .

        @[JSON::Field(key: "dashboardDefinition")]
        getter dashboard_definition : String

        # The ID of the dashboard.

        @[JSON::Field(key: "dashboardId")]
        getter dashboard_id : String

        # The date the dashboard was last updated, in Unix epoch time.

        @[JSON::Field(key: "dashboardLastUpdateDate")]
        getter dashboard_last_update_date : Time

        # The name of the dashboard.

        @[JSON::Field(key: "dashboardName")]
        getter dashboard_name : String

        # The ID of the project that the dashboard is in.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The dashboard's description.

        @[JSON::Field(key: "dashboardDescription")]
        getter dashboard_description : String?

        def initialize(
          @dashboard_arn : String,
          @dashboard_creation_date : Time,
          @dashboard_definition : String,
          @dashboard_id : String,
          @dashboard_last_update_date : Time,
          @dashboard_name : String,
          @project_id : String,
          @dashboard_description : String? = nil
        )
        end
      end


      struct DescribeDatasetRequest
        include JSON::Serializable

        # The ID of the dataset.

        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        def initialize(
          @dataset_id : String
        )
        end
      end


      struct DescribeDatasetResponse
        include JSON::Serializable

        # The ARN of the dataset. The format is
        # arn:${Partition}:iotsitewise:${Region}:${Account}:dataset/${DatasetId} .

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        # The dataset creation date, in Unix epoch time.

        @[JSON::Field(key: "datasetCreationDate")]
        getter dataset_creation_date : Time

        # A description about the dataset, and its functionality.

        @[JSON::Field(key: "datasetDescription")]
        getter dataset_description : String

        # The ID of the dataset.

        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # The date the dataset was last updated, in Unix epoch time.

        @[JSON::Field(key: "datasetLastUpdateDate")]
        getter dataset_last_update_date : Time

        # The name of the dataset.

        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The data source for the dataset.

        @[JSON::Field(key: "datasetSource")]
        getter dataset_source : Types::DatasetSource

        # The status of the dataset. This contains the state and any error messages. State is CREATING after a
        # successfull call to this API, and any associated error message. The state is ACTIVE when ready to
        # use.

        @[JSON::Field(key: "datasetStatus")]
        getter dataset_status : Types::DatasetStatus

        # The version of the dataset.

        @[JSON::Field(key: "datasetVersion")]
        getter dataset_version : String?

        def initialize(
          @dataset_arn : String,
          @dataset_creation_date : Time,
          @dataset_description : String,
          @dataset_id : String,
          @dataset_last_update_date : Time,
          @dataset_name : String,
          @dataset_source : Types::DatasetSource,
          @dataset_status : Types::DatasetStatus,
          @dataset_version : String? = nil
        )
        end
      end


      struct DescribeDefaultEncryptionConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeDefaultEncryptionConfigurationResponse
        include JSON::Serializable

        # The status of the account configuration. This contains the ConfigurationState . If there's an error,
        # it also contains the ErrorDetails .

        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : Types::ConfigurationStatus

        # The type of encryption used for the encryption configuration.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The key ARN of the customer managed key used for KMS encryption if you use KMS_BASED_ENCRYPTION .

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @configuration_status : Types::ConfigurationStatus,
          @encryption_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct DescribeExecutionRequest
        include JSON::Serializable

        # The ID of the execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        def initialize(
          @execution_id : String
        )
        end
      end


      struct DescribeExecutionResponse
        include JSON::Serializable

        # The ID of the execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The time the process started.

        @[JSON::Field(key: "executionStartTime")]
        getter execution_start_time : Time

        # The status of the execution process.

        @[JSON::Field(key: "executionStatus")]
        getter execution_status : Types::ExecutionStatus


        @[JSON::Field(key: "targetResource")]
        getter target_resource : Types::TargetResource

        # The version of the target resource.

        @[JSON::Field(key: "targetResourceVersion")]
        getter target_resource_version : String

        # The type of action exectued.

        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # Provides detailed information about the execution of your anomaly detection models. This includes
        # model metrics and training timestamps for both training and inference actions. The training action
        # (Amazon Web Services/ANOMALY_DETECTION_TRAINING), includes performance metrics that help you compare
        # different versions of your anomaly detection models. These metrics provide insights into the model's
        # performance during the training process. The inference action (Amazon Web
        # Services/ANOMALY_DETECTION_INFERENCE), includes information about the results of executing your
        # anomaly detection models. This helps you understand the output of your models and assess their
        # performance.

        @[JSON::Field(key: "executionDetails")]
        getter execution_details : Hash(String, String)?

        # The time the process ended.

        @[JSON::Field(key: "executionEndTime")]
        getter execution_end_time : Time?

        # Entity version used for the execution.

        @[JSON::Field(key: "executionEntityVersion")]
        getter execution_entity_version : String?

        # The result of the execution.

        @[JSON::Field(key: "executionResult")]
        getter execution_result : Hash(String, String)?

        # The detailed resource this execution resolves to.

        @[JSON::Field(key: "resolveTo")]
        getter resolve_to : Types::ResolveTo?

        def initialize(
          @execution_id : String,
          @execution_start_time : Time,
          @execution_status : Types::ExecutionStatus,
          @target_resource : Types::TargetResource,
          @target_resource_version : String,
          @action_type : String? = nil,
          @execution_details : Hash(String, String)? = nil,
          @execution_end_time : Time? = nil,
          @execution_entity_version : String? = nil,
          @execution_result : Hash(String, String)? = nil,
          @resolve_to : Types::ResolveTo? = nil
        )
        end
      end


      struct DescribeGatewayCapabilityConfigurationRequest
        include JSON::Serializable

        # The namespace of the capability configuration. For example, if you configure OPC UA sources for an
        # MQTT-enabled gateway, your OPC-UA capability configuration has the namespace
        # iotsitewise:opcuacollector:3 .

        @[JSON::Field(key: "capabilityNamespace")]
        getter capability_namespace : String

        # The ID of the gateway that defines the capability configuration.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @capability_namespace : String,
          @gateway_id : String
        )
        end
      end


      struct DescribeGatewayCapabilityConfigurationResponse
        include JSON::Serializable

        # The JSON document that defines the gateway capability's configuration. For more information, see
        # Configuring data sources (CLI) in the IoT SiteWise User Guide .

        @[JSON::Field(key: "capabilityConfiguration")]
        getter capability_configuration : String

        # The namespace of the gateway capability.

        @[JSON::Field(key: "capabilityNamespace")]
        getter capability_namespace : String

        # The synchronization status of the gateway capability configuration. The sync status can be one of
        # the following: IN_SYNC - The gateway is running with the latest configuration. OUT_OF_SYNC - The
        # gateway hasn't received the latest configuration. SYNC_FAILED - The gateway rejected the latest
        # configuration. UNKNOWN - The gateway hasn't reported its sync status. NOT_APPLICABLE - The gateway
        # doesn't support this capability. This is most common when integrating partner data sources, because
        # the data integration is handled externally by the partner.

        @[JSON::Field(key: "capabilitySyncStatus")]
        getter capability_sync_status : String

        # The ID of the gateway that defines the capability configuration.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @capability_configuration : String,
          @capability_namespace : String,
          @capability_sync_status : String,
          @gateway_id : String
        )
        end
      end


      struct DescribeGatewayRequest
        include JSON::Serializable

        # The ID of the gateway device.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @gateway_id : String
        )
        end
      end


      struct DescribeGatewayResponse
        include JSON::Serializable

        # The date the gateway was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time

        # The ARN of the gateway, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}

        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # A list of gateway capability summaries that each contain a namespace and status. Each gateway
        # capability defines data sources for the gateway. To retrieve a capability configuration's
        # definition, use DescribeGatewayCapabilityConfiguration .

        @[JSON::Field(key: "gatewayCapabilitySummaries")]
        getter gateway_capability_summaries : Array(Types::GatewayCapabilitySummary)

        # The ID of the gateway device.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The name of the gateway.

        @[JSON::Field(key: "gatewayName")]
        getter gateway_name : String

        # The date the gateway was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time

        # The gateway's platform.

        @[JSON::Field(key: "gatewayPlatform")]
        getter gateway_platform : Types::GatewayPlatform?

        # The version of the gateway. A value of 3 indicates an MQTT-enabled, V3 gateway, while 2 indicates a
        # Classic streams, V2 gateway.

        @[JSON::Field(key: "gatewayVersion")]
        getter gateway_version : String?

        def initialize(
          @creation_date : Time,
          @gateway_arn : String,
          @gateway_capability_summaries : Array(Types::GatewayCapabilitySummary),
          @gateway_id : String,
          @gateway_name : String,
          @last_update_date : Time,
          @gateway_platform : Types::GatewayPlatform? = nil,
          @gateway_version : String? = nil
        )
        end
      end


      struct DescribeLoggingOptionsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeLoggingOptionsResponse
        include JSON::Serializable

        # The current logging options.

        @[JSON::Field(key: "loggingOptions")]
        getter logging_options : Types::LoggingOptions

        def initialize(
          @logging_options : Types::LoggingOptions
        )
        end
      end


      struct DescribePortalRequest
        include JSON::Serializable

        # The ID of the portal.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        def initialize(
          @portal_id : String
        )
        end
      end


      struct DescribePortalResponse
        include JSON::Serializable

        # The ARN of the portal, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}

        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The IAM Identity Center application generated client ID (used with IAM Identity Center API
        # operations). IoT SiteWise includes portalClientId for only portals that use IAM Identity Center to
        # authenticate users.

        @[JSON::Field(key: "portalClientId")]
        getter portal_client_id : String

        # The Amazon Web Services administrator's contact email address.

        @[JSON::Field(key: "portalContactEmail")]
        getter portal_contact_email : String

        # The date the portal was created, in Unix epoch time.

        @[JSON::Field(key: "portalCreationDate")]
        getter portal_creation_date : Time

        # The ID of the portal.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The date the portal was last updated, in Unix epoch time.

        @[JSON::Field(key: "portalLastUpdateDate")]
        getter portal_last_update_date : Time

        # The name of the portal.

        @[JSON::Field(key: "portalName")]
        getter portal_name : String

        # The URL for the IoT SiteWise Monitor portal. You can use this URL to access portals that use IAM
        # Identity Center for authentication. For portals that use IAM for authentication, you must use the
        # IoT SiteWise console to get a URL that you can use to access the portal.

        @[JSON::Field(key: "portalStartUrl")]
        getter portal_start_url : String

        # The current status of the portal, which contains a state and any error message.

        @[JSON::Field(key: "portalStatus")]
        getter portal_status : Types::PortalStatus

        # Contains the configuration information of an alarm created in an IoT SiteWise Monitor portal.

        @[JSON::Field(key: "alarms")]
        getter alarms : Types::Alarms?

        # The email address that sends alarm notifications.

        @[JSON::Field(key: "notificationSenderEmail")]
        getter notification_sender_email : String?

        # The service to use to authenticate users to the portal.

        @[JSON::Field(key: "portalAuthMode")]
        getter portal_auth_mode : String?

        # The portal's description.

        @[JSON::Field(key: "portalDescription")]
        getter portal_description : String?

        # The portal's logo image, which is available at a URL.

        @[JSON::Field(key: "portalLogoImageLocation")]
        getter portal_logo_image_location : Types::ImageLocation?

        # Define the type of portal. The value for IoT SiteWise Monitor (Classic) is SITEWISE_PORTAL_V1 . The
        # value for IoT SiteWise Monitor (AI-aware) is SITEWISE_PORTAL_V2 .

        @[JSON::Field(key: "portalType")]
        getter portal_type : String?

        # The configuration entry associated with the specific portal type. The value for IoT SiteWise Monitor
        # (Classic) is SITEWISE_PORTAL_V1 . The value for IoT SiteWise Monitor (AI-aware) is
        # SITEWISE_PORTAL_V2 .

        @[JSON::Field(key: "portalTypeConfiguration")]
        getter portal_type_configuration : Hash(String, Types::PortalTypeEntry)?

        # The ARN of the service role that allows the portal's users to access your IoT SiteWise resources on
        # your behalf. For more information, see Using service roles for IoT SiteWise Monitor in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @portal_arn : String,
          @portal_client_id : String,
          @portal_contact_email : String,
          @portal_creation_date : Time,
          @portal_id : String,
          @portal_last_update_date : Time,
          @portal_name : String,
          @portal_start_url : String,
          @portal_status : Types::PortalStatus,
          @alarms : Types::Alarms? = nil,
          @notification_sender_email : String? = nil,
          @portal_auth_mode : String? = nil,
          @portal_description : String? = nil,
          @portal_logo_image_location : Types::ImageLocation? = nil,
          @portal_type : String? = nil,
          @portal_type_configuration : Hash(String, Types::PortalTypeEntry)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct DescribeProjectRequest
        include JSON::Serializable

        # The ID of the project.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        def initialize(
          @project_id : String
        )
        end
      end


      struct DescribeProjectResponse
        include JSON::Serializable

        # The ID of the portal that the project is in.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The ARN of the project, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}

        @[JSON::Field(key: "projectArn")]
        getter project_arn : String

        # The date the project was created, in Unix epoch time.

        @[JSON::Field(key: "projectCreationDate")]
        getter project_creation_date : Time

        # The ID of the project.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The date the project was last updated, in Unix epoch time.

        @[JSON::Field(key: "projectLastUpdateDate")]
        getter project_last_update_date : Time

        # The name of the project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The project's description.

        @[JSON::Field(key: "projectDescription")]
        getter project_description : String?

        def initialize(
          @portal_id : String,
          @project_arn : String,
          @project_creation_date : Time,
          @project_id : String,
          @project_last_update_date : Time,
          @project_name : String,
          @project_description : String? = nil
        )
        end
      end


      struct DescribeStorageConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeStorageConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : Types::ConfigurationStatus

        # The storage tier that you specified for your data. The storageType parameter can be one of the
        # following values: SITEWISE_DEFAULT_STORAGE – IoT SiteWise saves your data into the hot tier. The hot
        # tier is a service-managed database. MULTI_LAYER_STORAGE – IoT SiteWise saves your data in both the
        # cold tier and the hot tier. The cold tier is a customer-managed Amazon S3 bucket.

        @[JSON::Field(key: "storageType")]
        getter storage_type : String

        # Describes the configuration for ingesting NULL and NaN data. By default the feature is allowed. The
        # feature is disallowed if the value is true .

        @[JSON::Field(key: "disallowIngestNullNaN")]
        getter disallow_ingest_null_na_n : Bool?

        # Contains the storage configuration for time series (data streams) that aren't associated with asset
        # properties. The disassociatedDataStorage can be one of the following values: ENABLED – IoT SiteWise
        # accepts time series that aren't associated with asset properties. After the disassociatedDataStorage
        # is enabled, you can't disable it. DISABLED – IoT SiteWise doesn't accept time series (data streams)
        # that aren't associated with asset properties. For more information, see Data streams in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "disassociatedDataStorage")]
        getter disassociated_data_storage : String?

        # The date the storage configuration was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time?

        # Contains information about the storage destination.

        @[JSON::Field(key: "multiLayerStorage")]
        getter multi_layer_storage : Types::MultiLayerStorage?

        # The number of days your data is kept in the hot tier. By default, your data is kept indefinitely in
        # the hot tier.

        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # A service managed storage tier optimized for analytical queries. It stores periodically uploaded,
        # buffered and historical data ingested with the CreaeBulkImportJob API.

        @[JSON::Field(key: "warmTier")]
        getter warm_tier : String?

        # Set this period to specify how long your data is stored in the warm tier before it is deleted. You
        # can set this only if cold tier is enabled.

        @[JSON::Field(key: "warmTierRetentionPeriod")]
        getter warm_tier_retention_period : Types::WarmTierRetentionPeriod?

        def initialize(
          @configuration_status : Types::ConfigurationStatus,
          @storage_type : String,
          @disallow_ingest_null_na_n : Bool? = nil,
          @disassociated_data_storage : String? = nil,
          @last_update_date : Time? = nil,
          @multi_layer_storage : Types::MultiLayerStorage? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @warm_tier : String? = nil,
          @warm_tier_retention_period : Types::WarmTierRetentionPeriod? = nil
        )
        end
      end


      struct DescribeTimeSeriesRequest
        include JSON::Serializable

        # The alias that identifies the time series.

        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The ID of the asset in which the asset property was created. This can be either the actual ID in
        # UUID format, or else externalId: followed by the external ID, if it has one. For more information,
        # see Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The ID of the asset property. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @alias : String? = nil,
          @asset_id : String? = nil,
          @property_id : String? = nil
        )
        end
      end


      struct DescribeTimeSeriesResponse
        include JSON::Serializable

        # The data type of the time series. If you specify STRUCT , you must also specify dataTypeSpec to
        # identify the type of the structure for this time series.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The ARN of the time series, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:time-series/${TimeSeriesId}

        @[JSON::Field(key: "timeSeriesArn")]
        getter time_series_arn : String

        # The date that the time series was created, in Unix epoch time.

        @[JSON::Field(key: "timeSeriesCreationDate")]
        getter time_series_creation_date : Time

        # The ID of the time series.

        @[JSON::Field(key: "timeSeriesId")]
        getter time_series_id : String

        # The date that the time series was last updated, in Unix epoch time.

        @[JSON::Field(key: "timeSeriesLastUpdateDate")]
        getter time_series_last_update_date : Time

        # The alias that identifies the time series.

        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The ID of the asset in which the asset property was created.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The data type of the structure for this time series. This parameter is required for time series that
        # have the STRUCT data type. The options for this parameter depend on the type of the composite model
        # in which you created the asset property that is associated with your time series. Use
        # AWS/ALARM_STATE for alarm state in alarm composite models.

        @[JSON::Field(key: "dataTypeSpec")]
        getter data_type_spec : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @data_type : String,
          @time_series_arn : String,
          @time_series_creation_date : Time,
          @time_series_id : String,
          @time_series_last_update_date : Time,
          @alias : String? = nil,
          @asset_id : String? = nil,
          @data_type_spec : String? = nil,
          @property_id : String? = nil
        )
        end
      end

      # Contains detailed error information.

      struct DetailedError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : String

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct DisassociateAssetsRequest
        include JSON::Serializable

        # The ID of the parent asset from which to disassociate the child asset. This can be either the actual
        # ID in UUID format, or else externalId: followed by the external ID, if it has one. For more
        # information, see Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the child asset to disassociate. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "childAssetId")]
        getter child_asset_id : String

        # The ID of a hierarchy in the parent asset's model. (This can be either the actual ID in UUID format,
        # or else externalId: followed by the external ID, if it has one. For more information, see
        # Referencing objects with external IDs in the IoT SiteWise User Guide .) Hierarchies allow different
        # groupings of assets to be formed that all come from the same asset model. You can use the hierarchy
        # ID to identify the correct asset to disassociate. For more information, see Asset hierarchies in the
        # IoT SiteWise User Guide .

        @[JSON::Field(key: "hierarchyId")]
        getter hierarchy_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_id : String,
          @child_asset_id : String,
          @hierarchy_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DisassociateTimeSeriesFromAssetPropertyRequest
        include JSON::Serializable

        # The alias that identifies the time series.

        @[JSON::Field(key: "alias")]
        getter alias : String

        # The ID of the asset in which the asset property was created. This can be either the actual ID in
        # UUID format, or else externalId: followed by the external ID, if it has one. For more information,
        # see Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the asset property. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @alias : String,
          @asset_id : String,
          @property_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Contains the details of an IoT SiteWise error.

      struct ErrorDetails
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : String

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String

        # A list of detailed errors.

        @[JSON::Field(key: "details")]
        getter details : Array(Types::DetailedError)?

        def initialize(
          @code : String,
          @message : String,
          @details : Array(Types::DetailedError)? = nil
        )
        end
      end

      # The Amazon S3 destination where errors associated with the job creation request are saved.

      struct ErrorReportLocation
        include JSON::Serializable

        # The name of the Amazon S3 bucket to which errors associated with the bulk import job are sent.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # Amazon S3 uses the prefix as a folder name to organize data in the bucket. Each Amazon S3 object has
        # a key that is its unique identifier in the bucket. Each object in a bucket has exactly one key. The
        # prefix must end with a forward slash (/). For more information, see Organizing objects using
        # prefixes in the Amazon Simple Storage Service User Guide .

        @[JSON::Field(key: "prefix")]
        getter prefix : String

        def initialize(
          @bucket : String,
          @prefix : String
        )
        end
      end


      struct ExecuteActionRequest
        include JSON::Serializable

        # The ID of the action definition.

        @[JSON::Field(key: "actionDefinitionId")]
        getter action_definition_id : String

        # The JSON payload of the action.

        @[JSON::Field(key: "actionPayload")]
        getter action_payload : Types::ActionPayload

        # The resource the action will be taken on.

        @[JSON::Field(key: "targetResource")]
        getter target_resource : Types::TargetResource

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The detailed resource this action resolves to.

        @[JSON::Field(key: "resolveTo")]
        getter resolve_to : Types::ResolveTo?

        def initialize(
          @action_definition_id : String,
          @action_payload : Types::ActionPayload,
          @target_resource : Types::TargetResource,
          @client_token : String? = nil,
          @resolve_to : Types::ResolveTo? = nil
        )
        end
      end


      struct ExecuteActionResponse
        include JSON::Serializable

        # The ID of the action.

        @[JSON::Field(key: "actionId")]
        getter action_id : String

        def initialize(
          @action_id : String
        )
        end
      end


      struct ExecuteQueryRequest
        include JSON::Serializable

        # The IoT SiteWise query statement.

        @[JSON::Field(key: "queryStatement")]
        getter query_statement : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The maximum number of results to return at one time. Minimum is 1 Maximum is 20000 Default is 20000

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @query_statement : String,
          @client_token : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ExecuteQueryResponse
        include JSON::Serializable

        # Represents a single column in the query results.

        @[JSON::Field(key: "columns")]
        getter columns : Array(Types::ColumnInfo)?

        # The string that specifies the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Represents a single row in the query results.

        @[JSON::Field(key: "rows")]
        getter rows : Array(Types::Row)?

        def initialize(
          @columns : Array(Types::ColumnInfo)? = nil,
          @next_token : String? = nil,
          @rows : Array(Types::Row)? = nil
        )
        end
      end

      # The status of the execution.

      struct ExecutionStatus
        include JSON::Serializable

        # The current state of the computation model.

        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Contains the execution summary of the computation model.

      struct ExecutionSummary
        include JSON::Serializable

        # The ID of the execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The time the process started.

        @[JSON::Field(key: "executionStartTime")]
        getter execution_start_time : Time

        # The status of the execution process.

        @[JSON::Field(key: "executionStatus")]
        getter execution_status : Types::ExecutionStatus


        @[JSON::Field(key: "targetResource")]
        getter target_resource : Types::TargetResource

        # The version of the target resource.

        @[JSON::Field(key: "targetResourceVersion")]
        getter target_resource_version : String

        # The type of action exectued.

        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # The time the process ended.

        @[JSON::Field(key: "executionEndTime")]
        getter execution_end_time : Time?

        # The execution entity version associated with the summary.

        @[JSON::Field(key: "executionEntityVersion")]
        getter execution_entity_version : String?

        # The detailed resource this execution resolves to.

        @[JSON::Field(key: "resolveTo")]
        getter resolve_to : Types::ResolveTo?

        def initialize(
          @execution_id : String,
          @execution_start_time : Time,
          @execution_status : Types::ExecutionStatus,
          @target_resource : Types::TargetResource,
          @target_resource_version : String,
          @action_type : String? = nil,
          @execution_end_time : Time? = nil,
          @execution_entity_version : String? = nil,
          @resolve_to : Types::ResolveTo? = nil
        )
        end
      end

      # Contains expression variable information.

      struct ExpressionVariable
        include JSON::Serializable

        # The friendly name of the variable to be used in the expression.

        @[JSON::Field(key: "name")]
        getter name : String

        # The variable that identifies an asset property from which to use values.

        @[JSON::Field(key: "value")]
        getter value : Types::VariableValue

        def initialize(
          @name : String,
          @value : Types::VariableValue
        )
        end
      end

      # The file in Amazon S3 where your data is saved.

      struct File
        include JSON::Serializable

        # The name of the Amazon S3 bucket from which data is imported.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The key of the Amazon S3 object that contains your data. Each object has a key that is a unique
        # identifier. Each object has exactly one key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The version ID to identify a specific version of the Amazon S3 object that contains your data.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @version_id : String? = nil
        )
        end
      end

      # The file format of the data in S3.

      struct FileFormat
        include JSON::Serializable

        # The file is in .CSV format.

        @[JSON::Field(key: "csv")]
        getter csv : Types::Csv?

        # The file is in parquet format.

        @[JSON::Field(key: "parquet")]
        getter parquet : Types::Parquet?

        def initialize(
          @csv : Types::Csv? = nil,
          @parquet : Types::Parquet? = nil
        )
        end
      end

      # The forwarding configuration for a given property.

      struct ForwardingConfig
        include JSON::Serializable

        # The forwarding state for the given property.

        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Contains a summary of a gateway capability configuration.

      struct GatewayCapabilitySummary
        include JSON::Serializable

        # The namespace of the capability configuration. For example, if you configure OPC UA sources for an
        # MQTT-enabled gateway, your OPC-UA capability configuration has the namespace
        # iotsitewise:opcuacollector:3 .

        @[JSON::Field(key: "capabilityNamespace")]
        getter capability_namespace : String

        # The synchronization status of the gateway capability configuration. The sync status can be one of
        # the following: IN_SYNC - The gateway is running with the latest configuration. OUT_OF_SYNC - The
        # gateway hasn't received the latest configuration. SYNC_FAILED - The gateway rejected the latest
        # configuration. UNKNOWN - The gateway hasn't reported its sync status. NOT_APPLICABLE - The gateway
        # doesn't support this capability. This is most common when integrating partner data sources, because
        # the data integration is handled externally by the partner.

        @[JSON::Field(key: "capabilitySyncStatus")]
        getter capability_sync_status : String

        def initialize(
          @capability_namespace : String,
          @capability_sync_status : String
        )
        end
      end

      # The gateway's platform configuration. You can only specify one platform type in a gateway. (Legacy
      # only) For Greengrass V1 gateways, specify the greengrass parameter with a valid Greengrass group
      # ARN. For Greengrass V2 gateways, specify the greengrassV2 parameter with a valid core device thing
      # name. If creating a V3 gateway ( gatewayVersion=3 ), you must also specify the
      # coreDeviceOperatingSystem . For Siemens Industrial Edge gateways, specify the siemensIE parameter
      # with a valid IoT Core thing name.

      struct GatewayPlatform
        include JSON::Serializable

        # A gateway that runs on IoT Greengrass.

        @[JSON::Field(key: "greengrass")]
        getter greengrass : Types::Greengrass?

        # A gateway that runs on IoT Greengrass V2.

        @[JSON::Field(key: "greengrassV2")]
        getter greengrass_v2 : Types::GreengrassV2?

        # A SiteWise Edge gateway that runs on a Siemens Industrial Edge Device.

        @[JSON::Field(key: "siemensIE")]
        getter siemens_ie : Types::SiemensIE?

        def initialize(
          @greengrass : Types::Greengrass? = nil,
          @greengrass_v2 : Types::GreengrassV2? = nil,
          @siemens_ie : Types::SiemensIE? = nil
        )
        end
      end

      # Contains a summary of a gateway.

      struct GatewaySummary
        include JSON::Serializable

        # The date the gateway was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time

        # The ID of the gateway device.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The name of the gateway.

        @[JSON::Field(key: "gatewayName")]
        getter gateway_name : String

        # The date the gateway was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time

        # A list of gateway capability summaries that each contain a namespace and status. Each gateway
        # capability defines data sources for the gateway. To retrieve a capability configuration's
        # definition, use DescribeGatewayCapabilityConfiguration .

        @[JSON::Field(key: "gatewayCapabilitySummaries")]
        getter gateway_capability_summaries : Array(Types::GatewayCapabilitySummary)?


        @[JSON::Field(key: "gatewayPlatform")]
        getter gateway_platform : Types::GatewayPlatform?

        # The version of the gateway. A value of 3 indicates an MQTT-enabled, V3 gateway, while 2 indicates a
        # Classic streams, V2 gateway.

        @[JSON::Field(key: "gatewayVersion")]
        getter gateway_version : String?

        def initialize(
          @creation_date : Time,
          @gateway_id : String,
          @gateway_name : String,
          @last_update_date : Time,
          @gateway_capability_summaries : Array(Types::GatewayCapabilitySummary)? = nil,
          @gateway_platform : Types::GatewayPlatform? = nil,
          @gateway_version : String? = nil
        )
        end
      end


      struct GetAssetPropertyAggregatesRequest
        include JSON::Serializable

        # The data aggregating function.

        @[JSON::Field(key: "aggregateTypes")]
        getter aggregate_types : Array(String)

        # The inclusive end of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "endDate")]
        getter end_date : Time

        # The time interval over which to aggregate data.

        @[JSON::Field(key: "resolution")]
        getter resolution : String

        # The exclusive start of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "startDate")]
        getter start_date : Time

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The maximum number of results to return for each paginated request. A result set is returned in the
        # two cases, whichever occurs first. The size of the result set is equal to 1 MB. The number of data
        # points in the result set is equal to the value of maxResults . The maximum value of maxResults is
        # 2500.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        # The quality by which to filter asset data.

        @[JSON::Field(key: "qualities")]
        getter qualities : Array(String)?

        # The chronological sorting order of the requested information. Default: ASCENDING

        @[JSON::Field(key: "timeOrdering")]
        getter time_ordering : String?

        def initialize(
          @aggregate_types : Array(String),
          @end_date : Time,
          @resolution : String,
          @start_date : Time,
          @asset_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil,
          @qualities : Array(String)? = nil,
          @time_ordering : String? = nil
        )
        end
      end


      struct GetAssetPropertyAggregatesResponse
        include JSON::Serializable

        # The requested aggregated values.

        @[JSON::Field(key: "aggregatedValues")]
        getter aggregated_values : Array(Types::AggregatedValue)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @aggregated_values : Array(Types::AggregatedValue),
          @next_token : String? = nil
        )
        end
      end


      struct GetAssetPropertyValueHistoryRequest
        include JSON::Serializable

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The inclusive end of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "endDate")]
        getter end_date : Time?

        # The maximum number of results to return for each paginated request. A result set is returned in the
        # two cases, whichever occurs first. The size of the result set is equal to 4 MB. The number of data
        # points in the result set is equal to the value of maxResults . The maximum value of maxResults is
        # 20000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        # The quality by which to filter asset data.

        @[JSON::Field(key: "qualities")]
        getter qualities : Array(String)?

        # The exclusive start of the range from which to query historical data, expressed in seconds in Unix
        # epoch time.

        @[JSON::Field(key: "startDate")]
        getter start_date : Time?

        # The chronological sorting order of the requested information. Default: ASCENDING

        @[JSON::Field(key: "timeOrdering")]
        getter time_ordering : String?

        def initialize(
          @asset_id : String? = nil,
          @end_date : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil,
          @qualities : Array(String)? = nil,
          @start_date : Time? = nil,
          @time_ordering : String? = nil
        )
        end
      end


      struct GetAssetPropertyValueHistoryResponse
        include JSON::Serializable

        # The asset property's value history.

        @[JSON::Field(key: "assetPropertyValueHistory")]
        getter asset_property_value_history : Array(Types::AssetPropertyValue)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_property_value_history : Array(Types::AssetPropertyValue),
          @next_token : String? = nil
        )
        end
      end


      struct GetAssetPropertyValueRequest
        include JSON::Serializable

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @asset_id : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil
        )
        end
      end


      struct GetAssetPropertyValueResponse
        include JSON::Serializable

        # The current asset property value.

        @[JSON::Field(key: "propertyValue")]
        getter property_value : Types::AssetPropertyValue?

        def initialize(
          @property_value : Types::AssetPropertyValue? = nil
        )
        end
      end


      struct GetInterpolatedAssetPropertyValuesRequest
        include JSON::Serializable

        # The inclusive end of the range from which to interpolate data, expressed in seconds in Unix epoch
        # time.

        @[JSON::Field(key: "endTimeInSeconds")]
        getter end_time_in_seconds : Int64

        # The time interval in seconds over which to interpolate data. Each interval starts when the previous
        # one ends.

        @[JSON::Field(key: "intervalInSeconds")]
        getter interval_in_seconds : Int64

        # The quality of the asset property value. You can use this parameter as a filter to choose only the
        # asset property values that have a specific quality.

        @[JSON::Field(key: "quality")]
        getter quality : String

        # The exclusive start of the range from which to interpolate data, expressed in seconds in Unix epoch
        # time.

        @[JSON::Field(key: "startTimeInSeconds")]
        getter start_time_in_seconds : Int64

        # The interpolation type. Valid values: LINEAR_INTERPOLATION | LOCF_INTERPOLATION LINEAR_INTERPOLATION
        # – Estimates missing data using linear interpolation . For example, you can use this operation to
        # return the interpolated temperature values for a wind turbine every 24 hours over a duration of 7
        # days. If the interpolation starts July 1, 2021, at 9 AM, IoT SiteWise returns the first interpolated
        # value on July 2, 2021, at 9 AM, the second interpolated value on July 3, 2021, at 9 AM, and so on.
        # LOCF_INTERPOLATION – Estimates missing data using last observation carried forward interpolation If
        # no data point is found for an interval, IoT SiteWise returns the last observed data point for the
        # previous interval and carries forward this interpolated value until a new data point is found. For
        # example, you can get the state of an on-off valve every 24 hours over a duration of 7 days. If the
        # interpolation starts July 1, 2021, at 9 AM, IoT SiteWise returns the last observed data point
        # between July 1, 2021, at 9 AM and July 2, 2021, at 9 AM as the first interpolated value. If a data
        # point isn't found after 9 AM on July 2, 2021, IoT SiteWise uses the same interpolated value for the
        # rest of the days.

        @[JSON::Field(key: "type")]
        getter type : String

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The nanosecond offset converted from endTimeInSeconds .

        @[JSON::Field(key: "endTimeOffsetInNanos")]
        getter end_time_offset_in_nanos : Int32?

        # The query interval for the window, in seconds. IoT SiteWise computes each interpolated value by
        # using data points from the timestamp of each interval, minus the window to the timestamp of each
        # interval plus the window. If not specified, the window ranges between the start time minus the
        # interval and the end time plus the interval. If you specify a value for the intervalWindowInSeconds
        # parameter, the value for the type parameter must be LINEAR_INTERPOLATION . If a data point isn't
        # found during the specified query window, IoT SiteWise won't return an interpolated value for the
        # interval. This indicates that there's a gap in the ingested data points. For example, you can get
        # the interpolated temperature values for a wind turbine every 24 hours over a duration of 7 days. If
        # the interpolation starts on July 1, 2021, at 9 AM with a window of 2 hours, IoT SiteWise uses the
        # data points from 7 AM (9 AM minus 2 hours) to 11 AM (9 AM plus 2 hours) on July 2, 2021 to compute
        # the first interpolated value. Next, IoT SiteWise uses the data points from 7 AM (9 AM minus 2 hours)
        # to 11 AM (9 AM plus 2 hours) on July 3, 2021 to compute the second interpolated value, and so on.

        @[JSON::Field(key: "intervalWindowInSeconds")]
        getter interval_window_in_seconds : Int64?

        # The maximum number of results to return for each paginated request. If not specified, the default
        # value is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        # The nanosecond offset converted from startTimeInSeconds .

        @[JSON::Field(key: "startTimeOffsetInNanos")]
        getter start_time_offset_in_nanos : Int32?

        def initialize(
          @end_time_in_seconds : Int64,
          @interval_in_seconds : Int64,
          @quality : String,
          @start_time_in_seconds : Int64,
          @type : String,
          @asset_id : String? = nil,
          @end_time_offset_in_nanos : Int32? = nil,
          @interval_window_in_seconds : Int64? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil,
          @start_time_offset_in_nanos : Int32? = nil
        )
        end
      end


      struct GetInterpolatedAssetPropertyValuesResponse
        include JSON::Serializable

        # The requested interpolated values.

        @[JSON::Field(key: "interpolatedAssetPropertyValues")]
        getter interpolated_asset_property_values : Array(Types::InterpolatedAssetPropertyValue)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @interpolated_asset_property_values : Array(Types::InterpolatedAssetPropertyValue),
          @next_token : String? = nil
        )
        end
      end

      # Contains details for a gateway that runs on IoT Greengrass. To create a gateway that runs on IoT
      # Greengrass, you must add the IoT SiteWise connector to a Greengrass group and deploy it. Your
      # Greengrass group must also have permissions to upload data to IoT SiteWise. For more information,
      # see Ingesting data using a gateway in the IoT SiteWise User Guide .

      struct Greengrass
        include JSON::Serializable

        # The ARN of the Greengrass group. For more information about how to find a group's ARN, see
        # ListGroups and GetGroup in the IoT Greengrass V1 API Reference .

        @[JSON::Field(key: "groupArn")]
        getter group_arn : String

        def initialize(
          @group_arn : String
        )
        end
      end

      # Contains details for a gateway that runs on IoT Greengrass V2. To create a gateway that runs on IoT
      # Greengrass V2, you must deploy the IoT SiteWise Edge component to your gateway device. Your
      # Greengrass device role must use the AWSIoTSiteWiseEdgeAccess policy. For more information, see Using
      # IoT SiteWise at the edge in the IoT SiteWise User Guide .

      struct GreengrassV2
        include JSON::Serializable

        # The name of the IoT thing for your IoT Greengrass V2 core device.

        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        # The operating system of the core device in IoT Greengrass V2. Specifying the operating system is
        # required for MQTT-enabled, V3 gateways ( gatewayVersion 3 ) and not applicable for Classic stream,
        # V2 gateways ( gatewayVersion 2 ).

        @[JSON::Field(key: "coreDeviceOperatingSystem")]
        getter core_device_operating_system : String?

        def initialize(
          @core_device_thing_name : String,
          @core_device_operating_system : String? = nil
        )
        end
      end

      # Contains information for a group identity in an access policy.

      struct GroupIdentity
        include JSON::Serializable

        # The IAM Identity Center ID of the group.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Maps a hierarchy from an interface asset model to a hierarchy in the asset model where the interface
      # is applied.

      struct HierarchyMapping
        include JSON::Serializable

        # The ID of the hierarchy in the asset model where the interface is applied.

        @[JSON::Field(key: "assetModelHierarchyId")]
        getter asset_model_hierarchy_id : String

        # The ID of the hierarchy in the interface asset model.

        @[JSON::Field(key: "interfaceAssetModelHierarchyId")]
        getter interface_asset_model_hierarchy_id : String

        def initialize(
          @asset_model_hierarchy_id : String,
          @interface_asset_model_hierarchy_id : String
        )
        end
      end

      # Contains information about an Identity and Access Management role. For more information, see IAM
      # roles in the IAM User Guide .

      struct IAMRoleIdentity
        include JSON::Serializable

        # The ARN of the IAM role. For more information, see IAM ARNs in the IAM User Guide .

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Contains information about an Identity and Access Management user.

      struct IAMUserIdentity
        include JSON::Serializable

        # The ARN of the IAM user. For more information, see IAM ARNs in the IAM User Guide . If you delete
        # the IAM user, access policies that contain this identity include an empty arn . You can delete the
        # access policy for the IAM user that no longer exists.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Contains an identity that can access an IoT SiteWise Monitor resource. Currently, you can't use
      # Amazon Web Services API operations to retrieve IAM Identity Center identity IDs. You can find the
      # IAM Identity Center identity IDs in the URL of user and group pages in the IAM Identity Center
      # console .

      struct Identity
        include JSON::Serializable

        # An IAM Identity Center group identity.

        @[JSON::Field(key: "group")]
        getter group : Types::GroupIdentity?

        # An IAM role identity.

        @[JSON::Field(key: "iamRole")]
        getter iam_role : Types::IAMRoleIdentity?

        # An IAM user identity.

        @[JSON::Field(key: "iamUser")]
        getter iam_user : Types::IAMUserIdentity?

        # An IAM Identity Center user identity.

        @[JSON::Field(key: "user")]
        getter user : Types::UserIdentity?

        def initialize(
          @group : Types::GroupIdentity? = nil,
          @iam_role : Types::IAMRoleIdentity? = nil,
          @iam_user : Types::IAMUserIdentity? = nil,
          @user : Types::UserIdentity? = nil
        )
        end
      end

      # Contains an image that is one of the following: An image file. Choose this option to upload a new
      # image. The ID of an existing image. Choose this option to keep an existing image.

      struct Image
        include JSON::Serializable


        @[JSON::Field(key: "file")]
        getter file : Types::ImageFile?

        # The ID of an existing image. Specify this parameter to keep an existing image.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @file : Types::ImageFile? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains an image file.

      struct ImageFile
        include JSON::Serializable

        # The image file contents, represented as a base64-encoded string. The file size must be less than 1
        # MB.

        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The file type of the image.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @data : Bytes,
          @type : String
        )
        end
      end

      # Contains an image that is uploaded to IoT SiteWise and available at a URL.

      struct ImageLocation
        include JSON::Serializable

        # The ID of the image.

        @[JSON::Field(key: "id")]
        getter id : String

        # The URL where the image is available. The URL is valid for 15 minutes so that you can view and
        # download the image

        @[JSON::Field(key: "url")]
        getter url : String

        def initialize(
          @id : String,
          @url : String
        )
        end
      end

      # Contains information about the relationship between an asset model and an interface asset model that
      # is applied to it.

      struct InterfaceRelationship
        include JSON::Serializable

        # The ID of the asset model that has the interface applied to it.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Contains summary information about an interface relationship, which defines how an interface is
      # applied to an asset model. This summary provides the essential identifiers needed to retrieve
      # detailed information about the relationship.

      struct InterfaceRelationshipSummary
        include JSON::Serializable

        # The ID of the asset model that has the interface applied to it.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Contains summary information about an interface that a property belongs to.

      struct InterfaceSummary
        include JSON::Serializable

        # The ID of the interface asset model that contains this property.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        # The ID of the property in the interface asset model that corresponds to this property.

        @[JSON::Field(key: "interfaceAssetModelPropertyId")]
        getter interface_asset_model_property_id : String

        def initialize(
          @interface_asset_model_id : String,
          @interface_asset_model_property_id : String
        )
        end
      end

      # IoT SiteWise can't process your request right now. Try again later.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains information about an interpolated asset property value.

      struct InterpolatedAssetPropertyValue
        include JSON::Serializable


        @[JSON::Field(key: "timestamp")]
        getter timestamp : Types::TimeInNanos


        @[JSON::Field(key: "value")]
        getter value : Types::Variant

        def initialize(
          @timestamp : Types::TimeInNanos,
          @value : Types::Variant
        )
        end
      end

      # The request isn't valid. This can occur if your request contains malformed JSON or unsupported
      # characters. Check your request and try again.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # This contains the SiteWise Assistant's response and the corresponding citation.

      struct InvocationOutput
        include JSON::Serializable

        # A list of citations, and related information for the SiteWise Assistant's response.

        @[JSON::Field(key: "citations")]
        getter citations : Array(Types::Citation)?

        # The text message of the SiteWise Assistant's response.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @citations : Array(Types::Citation)? = nil,
          @message : String? = nil
        )
        end
      end


      struct InvokeAssistantRequest
        include JSON::Serializable

        # A text message sent to the SiteWise Assistant by the user.

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID assigned to a conversation. IoT SiteWise automatically generates a unique ID for you, and
        # this parameter is never required. However, if you prefer to have your own ID, you must specify it
        # here in UUID format. If you specify your own ID, it must be globally unique.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # Specifies if to turn trace on or not. It is used to track the SiteWise Assistant's reasoning, and
        # data access process.

        @[JSON::Field(key: "enableTrace")]
        getter enable_trace : Bool?

        def initialize(
          @message : String,
          @conversation_id : String? = nil,
          @enable_trace : Bool? = nil
        )
        end
      end


      struct InvokeAssistantResponse
        include JSON::Serializable


        @[JSON::Field(key: "body")]
        getter body : Types::ResponseStream

        # The ID of the conversation, in UUID format. This ID uniquely identifies the conversation within IoT
        # SiteWise.

        @[JSON::Field(key: "x-amz-iotsitewise-assistant-conversation-id")]
        getter conversation_id : String

        def initialize(
          @body : Types::ResponseStream,
          @conversation_id : String
        )
        end
      end

      # Contains the configuration information of a job, such as the file format used to save data in Amazon
      # S3.

      struct JobConfiguration
        include JSON::Serializable

        # The file format of the data in S3.

        @[JSON::Field(key: "fileFormat")]
        getter file_format : Types::FileFormat

        def initialize(
          @file_format : Types::FileFormat
        )
        end
      end

      # Contains the job summary information.

      struct JobSummary
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "id")]
        getter id : String

        # The unique name that helps identify the job request.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the bulk import job can be one of following values: PENDING – IoT SiteWise is waiting
        # for the current bulk import job to finish. CANCELLED – The bulk import job has been canceled.
        # RUNNING – IoT SiteWise is processing your request to import your data from Amazon S3. COMPLETED –
        # IoT SiteWise successfully completed your request to import data from Amazon S3. FAILED – IoT
        # SiteWise couldn't process your request to import data from Amazon S3. You can use logs saved in the
        # specified error report location in Amazon S3 to troubleshoot issues. COMPLETED_WITH_FAILURES – IoT
        # SiteWise completed your request to import data from Amazon S3 with errors. You can use logs saved in
        # the specified error report location in Amazon S3 to troubleshoot issues.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @id : String,
          @name : String,
          @status : String
        )
        end
      end

      # The source details for the Kendra dataset source.

      struct KendraSourceDetail
        include JSON::Serializable

        # The knowledgeBaseArn details for the Kendra dataset source.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The roleARN details for the Kendra dataset source.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @knowledge_base_arn : String,
          @role_arn : String
        )
        end
      end

      # You've reached the quota for a resource. For example, this can occur if you're trying to associate
      # more than the allowed number of child assets or attempting to create more than the allowed number of
      # properties for an asset model. For more information, see Quotas in the IoT SiteWise User Guide .

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListAccessPoliciesRequest
        include JSON::Serializable

        # The ARN of the IAM user. For more information, see IAM ARNs in the IAM User Guide . This parameter
        # is required if you specify IAM for identityType .

        @[JSON::Field(key: "iamArn")]
        getter iam_arn : String?

        # The ID of the identity. This parameter is required if you specify USER or GROUP for identityType .

        @[JSON::Field(key: "identityId")]
        getter identity_id : String?

        # The type of identity (IAM Identity Center user, IAM Identity Center group, or IAM user). This
        # parameter is required if you specify identityId .

        @[JSON::Field(key: "identityType")]
        getter identity_type : String?

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the resource. This parameter is required if you specify resourceType .

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource (portal or project). This parameter is required if you specify resourceId .

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @iam_arn : String? = nil,
          @identity_id : String? = nil,
          @identity_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct ListAccessPoliciesResponse
        include JSON::Serializable

        # A list that summarizes each access policy.

        @[JSON::Field(key: "accessPolicySummaries")]
        getter access_policy_summaries : Array(Types::AccessPolicySummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @access_policy_summaries : Array(Types::AccessPolicySummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListActionsRequest
        include JSON::Serializable

        # The ID of the target resource.

        @[JSON::Field(key: "targetResourceId")]
        getter target_resource_id : String

        # The type of resource.

        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The maximum number of results to return for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the resolved resource.

        @[JSON::Field(key: "resolveToResourceId")]
        getter resolve_to_resource_id : String?

        # The type of the resolved resource.

        @[JSON::Field(key: "resolveToResourceType")]
        getter resolve_to_resource_type : String?

        def initialize(
          @target_resource_id : String,
          @target_resource_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resolve_to_resource_id : String? = nil,
          @resolve_to_resource_type : String? = nil
        )
        end
      end


      struct ListActionsResponse
        include JSON::Serializable

        # A list that summarizes the actions associated with the specified asset.

        @[JSON::Field(key: "actionSummaries")]
        getter action_summaries : Array(Types::ActionSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String

        def initialize(
          @action_summaries : Array(Types::ActionSummary),
          @next_token : String
        )
        end
      end


      struct ListAssetModelCompositeModelsRequest
        include JSON::Serializable

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The version alias that specifies the latest or active version of the asset model. The details are
        # returned in the response. The default value is LATEST . See Asset model versions in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "assetModelVersion")]
        getter asset_model_version : String?

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_id : String,
          @asset_model_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetModelCompositeModelsResponse
        include JSON::Serializable

        # A list that summarizes each composite model.

        @[JSON::Field(key: "assetModelCompositeModelSummaries")]
        getter asset_model_composite_model_summaries : Array(Types::AssetModelCompositeModelSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_composite_model_summaries : Array(Types::AssetModelCompositeModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetModelPropertiesRequest
        include JSON::Serializable

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The version alias that specifies the latest or active version of the asset model. The details are
        # returned in the response. The default value is LATEST . See Asset model versions in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "assetModelVersion")]
        getter asset_model_version : String?

        # Filters the requested list of asset model properties. You can choose one of the following options:
        # ALL – The list includes all asset model properties for a given asset model ID. BASE – The list
        # includes only base asset model properties for a given asset model ID. Default: BASE

        @[JSON::Field(key: "filter")]
        getter filter : String?

        # The maximum number of results to return for each paginated request. If not specified, the default
        # value is 50.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_id : String,
          @asset_model_version : String? = nil,
          @filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetModelPropertiesResponse
        include JSON::Serializable

        # A list that summarizes the properties associated with the specified asset model.

        @[JSON::Field(key: "assetModelPropertySummaries")]
        getter asset_model_property_summaries : Array(Types::AssetModelPropertySummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_property_summaries : Array(Types::AssetModelPropertySummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetModelsRequest
        include JSON::Serializable

        # The type of asset model. If you don't provide an assetModelTypes , all types of asset models are
        # returned. ASSET_MODEL – An asset model that you can use to create assets. Can't be included as a
        # component in another asset model. COMPONENT_MODEL – A reusable component that you can include in the
        # composite models of other asset models. You can't create assets directly from this type of asset
        # model. INTERFACE – An interface is a type of model that defines a standard structure that can be
        # applied to different asset models.

        @[JSON::Field(key: "assetModelTypes")]
        getter asset_model_types : Array(String)?

        # The version alias that specifies the latest or active version of the asset model. The details are
        # returned in the response. The default value is LATEST . See Asset model versions in the IoT SiteWise
        # User Guide .

        @[JSON::Field(key: "assetModelVersion")]
        getter asset_model_version : String?

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_types : Array(String)? = nil,
          @asset_model_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetModelsResponse
        include JSON::Serializable

        # A list that summarizes each asset model.

        @[JSON::Field(key: "assetModelSummaries")]
        getter asset_model_summaries : Array(Types::AssetModelSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_summaries : Array(Types::AssetModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetPropertiesRequest
        include JSON::Serializable

        # The ID of the asset. This can be either the actual ID in UUID format, or else externalId: followed
        # by the external ID, if it has one. For more information, see Referencing objects with external IDs
        # in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # Filters the requested list of asset properties. You can choose one of the following options: ALL –
        # The list includes all asset properties for a given asset model ID. BASE – The list includes only
        # base asset properties for a given asset model ID. Default: BASE

        @[JSON::Field(key: "filter")]
        getter filter : String?

        # The maximum number of results to return for each paginated request. If not specified, the default
        # value is 50.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_id : String,
          @filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetPropertiesResponse
        include JSON::Serializable

        # A list that summarizes the properties associated with the specified asset.

        @[JSON::Field(key: "assetPropertySummaries")]
        getter asset_property_summaries : Array(Types::AssetPropertySummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_property_summaries : Array(Types::AssetPropertySummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetRelationshipsRequest
        include JSON::Serializable

        # The ID of the asset. This can be either the actual ID in UUID format, or else externalId: followed
        # by the external ID, if it has one. For more information, see Referencing objects with external IDs
        # in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The type of traversal to use to identify asset relationships. Choose the following option:
        # PATH_TO_ROOT – Identify the asset's parent assets up to the root asset. The asset that you specify
        # in assetId is the first result in the list of assetRelationshipSummaries , and the root asset is the
        # last result.

        @[JSON::Field(key: "traversalType")]
        getter traversal_type : String

        # The maximum number of results to return for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_id : String,
          @traversal_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetRelationshipsResponse
        include JSON::Serializable

        # A list that summarizes each asset relationship.

        @[JSON::Field(key: "assetRelationshipSummaries")]
        getter asset_relationship_summaries : Array(Types::AssetRelationshipSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_relationship_summaries : Array(Types::AssetRelationshipSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetsRequest
        include JSON::Serializable

        # The ID of the asset model by which to filter the list of assets. This parameter is required if you
        # choose ALL for filter . This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String?

        # The filter for the requested list of assets. Choose one of the following options: ALL – The list
        # includes all assets for a given asset model ID. The assetModelId parameter is required if you filter
        # by ALL . TOP_LEVEL – The list includes only top-level assets in the asset hierarchy tree. Default:
        # ALL

        @[JSON::Field(key: "filter")]
        getter filter : String?

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_id : String? = nil,
          @filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetsResponse
        include JSON::Serializable

        # A list that summarizes each asset.

        @[JSON::Field(key: "assetSummaries")]
        getter asset_summaries : Array(Types::AssetSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_summaries : Array(Types::AssetSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedAssetsRequest
        include JSON::Serializable

        # The ID of the asset to query. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # (Optional) If you don't provide a hierarchyId , all the immediate assets in the traversalDirection
        # will be returned. The ID of the hierarchy by which child assets are associated to the asset. (This
        # can be either the actual ID in UUID format, or else externalId: followed by the external ID, if it
        # has one. For more information, see Referencing objects with external IDs in the IoT SiteWise User
        # Guide .) For more information, see Asset hierarchies in the IoT SiteWise User Guide .

        @[JSON::Field(key: "hierarchyId")]
        getter hierarchy_id : String?

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to list associated assets. Choose one of the following options: CHILD – The list
        # includes all child assets associated to the asset. PARENT – The list includes the asset's parent
        # asset. Default: CHILD

        @[JSON::Field(key: "traversalDirection")]
        getter traversal_direction : String?

        def initialize(
          @asset_id : String,
          @hierarchy_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @traversal_direction : String? = nil
        )
        end
      end


      struct ListAssociatedAssetsResponse
        include JSON::Serializable

        # A list that summarizes the associated assets.

        @[JSON::Field(key: "assetSummaries")]
        getter asset_summaries : Array(Types::AssociatedAssetsSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_summaries : Array(Types::AssociatedAssetsSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListBulkImportJobsRequest
        include JSON::Serializable

        # You can use a filter to select the bulk import jobs that you want to retrieve.

        @[JSON::Field(key: "filter")]
        getter filter : String?

        # The maximum number of results to return for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBulkImportJobsResponse
        include JSON::Serializable

        # One or more job summaries to list.

        @[JSON::Field(key: "jobSummaries")]
        getter job_summaries : Array(Types::JobSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_summaries : Array(Types::JobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCompositionRelationshipsRequest
        include JSON::Serializable

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_model_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCompositionRelationshipsResponse
        include JSON::Serializable

        # A list that summarizes each composition relationship.

        @[JSON::Field(key: "compositionRelationshipSummaries")]
        getter composition_relationship_summaries : Array(Types::CompositionRelationshipSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @composition_relationship_summaries : Array(Types::CompositionRelationshipSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListComputationModelDataBindingUsagesRequest
        include JSON::Serializable

        # A filter used to limit the returned data binding usages based on specific data binding values. You
        # can filter by asset, asset model, asset property, or asset model property to find all computation
        # models using these specific data sources.

        @[JSON::Field(key: "dataBindingValueFilter")]
        getter data_binding_value_filter : Types::DataBindingValueFilter

        # The maximum number of results returned for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_binding_value_filter : Types::DataBindingValueFilter,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComputationModelDataBindingUsagesResponse
        include JSON::Serializable

        # A list of summaries describing the data binding usages across computation models. Each summary
        # includes the computation model IDs and the matched data binding details.

        @[JSON::Field(key: "dataBindingUsageSummaries")]
        getter data_binding_usage_summaries : Array(Types::ComputationModelDataBindingUsageSummary)

        # The token for the next set of paginated results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_binding_usage_summaries : Array(Types::ComputationModelDataBindingUsageSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListComputationModelResolveToResourcesRequest
        include JSON::Serializable

        # The ID of the computation model for which to list resolved resources.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # The maximum number of results returned for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @computation_model_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComputationModelResolveToResourcesResponse
        include JSON::Serializable

        # A list of summaries describing the distinct resources that this computation model resolves to when
        # actions were executed.

        @[JSON::Field(key: "computationModelResolveToResourceSummaries")]
        getter computation_model_resolve_to_resource_summaries : Array(Types::ComputationModelResolveToResourceSummary)

        # The token for the next set of paginated results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @computation_model_resolve_to_resource_summaries : Array(Types::ComputationModelResolveToResourceSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListComputationModelsRequest
        include JSON::Serializable

        # The type of computation model. If a computationModelType is not provided, all types of computation
        # models are returned.

        @[JSON::Field(key: "computationModelType")]
        getter computation_model_type : String?

        # The maximum number of results to return for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @computation_model_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComputationModelsResponse
        include JSON::Serializable

        # A list summarizing each computation model.

        @[JSON::Field(key: "computationModelSummaries")]
        getter computation_model_summaries : Array(Types::ComputationModelSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @computation_model_summaries : Array(Types::ComputationModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDashboardsRequest
        include JSON::Serializable

        # The ID of the project.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @project_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDashboardsResponse
        include JSON::Serializable

        # A list that summarizes each dashboard in the project.

        @[JSON::Field(key: "dashboardSummaries")]
        getter dashboard_summaries : Array(Types::DashboardSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dashboard_summaries : Array(Types::DashboardSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetsRequest
        include JSON::Serializable

        # The type of data source for the dataset.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The maximum number of results to return for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @source_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetsResponse
        include JSON::Serializable

        # A list that summarizes the dataset response.

        @[JSON::Field(key: "datasetSummaries")]
        getter dataset_summaries : Array(Types::DatasetSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_summaries : Array(Types::DatasetSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListExecutionsRequest
        include JSON::Serializable

        # The ID of the target resource.

        @[JSON::Field(key: "targetResourceId")]
        getter target_resource_id : String

        # The type of the target resource.

        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The type of action exectued.

        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # The maximum number of results returned for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the resolved resource.

        @[JSON::Field(key: "resolveToResourceId")]
        getter resolve_to_resource_id : String?

        # The type of the resolved resource.

        @[JSON::Field(key: "resolveToResourceType")]
        getter resolve_to_resource_type : String?

        def initialize(
          @target_resource_id : String,
          @target_resource_type : String,
          @action_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resolve_to_resource_id : String? = nil,
          @resolve_to_resource_type : String? = nil
        )
        end
      end


      struct ListExecutionsResponse
        include JSON::Serializable

        # Contains the list of execution summaries of the computation models.

        @[JSON::Field(key: "executionSummaries")]
        getter execution_summaries : Array(Types::ExecutionSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @execution_summaries : Array(Types::ExecutionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListGatewaysRequest
        include JSON::Serializable

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGatewaysResponse
        include JSON::Serializable

        # A list that summarizes each gateway.

        @[JSON::Field(key: "gatewaySummaries")]
        getter gateway_summaries : Array(Types::GatewaySummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @gateway_summaries : Array(Types::GatewaySummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListInterfaceRelationshipsRequest
        include JSON::Serializable

        # The ID of the interface asset model. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @interface_asset_model_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInterfaceRelationshipsResponse
        include JSON::Serializable

        # A list that summarizes each interface relationship.

        @[JSON::Field(key: "interfaceRelationshipSummaries")]
        getter interface_relationship_summaries : Array(Types::InterfaceRelationshipSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @interface_relationship_summaries : Array(Types::InterfaceRelationshipSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPortalsRequest
        include JSON::Serializable

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPortalsResponse
        include JSON::Serializable

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list that summarizes each portal.

        @[JSON::Field(key: "portalSummaries")]
        getter portal_summaries : Array(Types::PortalSummary)?

        def initialize(
          @next_token : String? = nil,
          @portal_summaries : Array(Types::PortalSummary)? = nil
        )
        end
      end


      struct ListProjectAssetsRequest
        include JSON::Serializable

        # The ID of the project.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @project_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProjectAssetsResponse
        include JSON::Serializable

        # A list that contains the IDs of each asset associated with the project.

        @[JSON::Field(key: "assetIds")]
        getter asset_ids : Array(String)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @asset_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListProjectsRequest
        include JSON::Serializable

        # The ID of the portal.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The maximum number of results to return for each paginated request. Default: 50

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @portal_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProjectsResponse
        include JSON::Serializable

        # A list that summarizes each project in the portal.

        @[JSON::Field(key: "projectSummaries")]
        getter project_summaries : Array(Types::ProjectSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @project_summaries : Array(Types::ProjectSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of key-value pairs that contain metadata for the resource. For more information, see
        # Tagging your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTimeSeriesRequest
        include JSON::Serializable

        # The alias prefix of the time series.

        @[JSON::Field(key: "aliasPrefix")]
        getter alias_prefix : String?

        # The ID of the asset in which the asset property was created. This can be either the actual ID in
        # UUID format, or else externalId: followed by the external ID, if it has one. For more information,
        # see Referencing objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The maximum number of results to return for each paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of the time series. The time series type can be one of the following values: ASSOCIATED –
        # The time series is associated with an asset property. DISASSOCIATED – The time series isn't
        # associated with any asset property.

        @[JSON::Field(key: "timeSeriesType")]
        getter time_series_type : String?

        def initialize(
          @alias_prefix : String? = nil,
          @asset_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @time_series_type : String? = nil
        )
        end
      end


      struct ListTimeSeriesResponse
        include JSON::Serializable

        # One or more time series summaries to list.

        @[JSON::Field(key: "TimeSeriesSummaries")]
        getter time_series_summaries : Array(Types::TimeSeriesSummary)

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @time_series_summaries : Array(Types::TimeSeriesSummary),
          @next_token : String? = nil
        )
        end
      end

      # Contains location information about the cited text and where it's stored.

      struct Location
        include JSON::Serializable

        # The URI of the location.

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @uri : String? = nil
        )
        end
      end

      # Contains logging options.

      struct LoggingOptions
        include JSON::Serializable

        # The IoT SiteWise logging verbosity level.

        @[JSON::Field(key: "level")]
        getter level : String

        def initialize(
          @level : String
        )
        end
      end

      # Represents a data binding that matches the specified filter criteria.

      struct MatchedDataBinding
        include JSON::Serializable

        # The value of the matched data binding.

        @[JSON::Field(key: "value")]
        getter value : Types::DataBindingValue

        def initialize(
          @value : Types::DataBindingValue
        )
        end
      end

      # Contains an asset measurement property. For more information, see Measurements in the IoT SiteWise
      # User Guide .

      struct Measurement
        include JSON::Serializable

        # The processing configuration for the given measurement property. You can configure measurements to
        # be kept at the edge or forwarded to the Amazon Web Services Cloud. By default, measurements are
        # forwarded to the cloud.

        @[JSON::Field(key: "processingConfig")]
        getter processing_config : Types::MeasurementProcessingConfig?

        def initialize(
          @processing_config : Types::MeasurementProcessingConfig? = nil
        )
        end
      end

      # The processing configuration for the given measurement property. You can configure measurements to
      # be kept at the edge or forwarded to the Amazon Web Services Cloud. By default, measurements are
      # forwarded to the cloud.

      struct MeasurementProcessingConfig
        include JSON::Serializable

        # The forwarding configuration for the given measurement property.

        @[JSON::Field(key: "forwardingConfig")]
        getter forwarding_config : Types::ForwardingConfig

        def initialize(
          @forwarding_config : Types::ForwardingConfig
        )
        end
      end

      # Contains an asset metric property. With metrics, you can calculate aggregate functions, such as an
      # average, maximum, or minimum, as specified through an expression. A metric maps several values to a
      # single value (such as a sum). The maximum number of dependent/cascading variables used in any one
      # metric calculation is 10. Therefore, a root metric can have up to 10 cascading metrics in its
      # computational dependency tree. Additionally, a metric can only have a data type of DOUBLE and
      # consume properties with data types of INTEGER or DOUBLE . For more information, see Metrics in the
      # IoT SiteWise User Guide .

      struct Metric
        include JSON::Serializable

        # The window (time interval) over which IoT SiteWise computes the metric's aggregation expression. IoT
        # SiteWise computes one data point per window .

        @[JSON::Field(key: "window")]
        getter window : Types::MetricWindow

        # The mathematical expression that defines the metric aggregation function. You can specify up to 10
        # variables per expression. You can specify up to 10 functions per expression. For more information,
        # see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "expression")]
        getter expression : String?

        # The processing configuration for the given metric property. You can configure metrics to be computed
        # at the edge or in the Amazon Web Services Cloud. By default, metrics are forwarded to the cloud.

        @[JSON::Field(key: "processingConfig")]
        getter processing_config : Types::MetricProcessingConfig?

        # The list of variables used in the expression.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::ExpressionVariable)?

        def initialize(
          @window : Types::MetricWindow,
          @expression : String? = nil,
          @processing_config : Types::MetricProcessingConfig? = nil,
          @variables : Array(Types::ExpressionVariable)? = nil
        )
        end
      end

      # The processing configuration for the given metric property. You can configure metrics to be computed
      # at the edge or in the Amazon Web Services Cloud. By default, metrics are forwarded to the cloud.

      struct MetricProcessingConfig
        include JSON::Serializable

        # The compute location for the given metric property.

        @[JSON::Field(key: "computeLocation")]
        getter compute_location : String

        def initialize(
          @compute_location : String
        )
        end
      end

      # Contains a time interval window used for data aggregate computations (for example, average, sum,
      # count, and so on).

      struct MetricWindow
        include JSON::Serializable

        # The tumbling time interval window.

        @[JSON::Field(key: "tumbling")]
        getter tumbling : Types::TumblingWindow?

        def initialize(
          @tumbling : Types::TumblingWindow? = nil
        )
        end
      end

      # Contains IoT SiteWise Monitor error details.

      struct MonitorErrorDetails
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Contains information about the storage destination.

      struct MultiLayerStorage
        include JSON::Serializable

        # Contains information about a customer managed Amazon S3 bucket.

        @[JSON::Field(key: "customerManagedS3Storage")]
        getter customer_managed_s3_storage : Types::CustomerManagedS3Storage

        def initialize(
          @customer_managed_s3_storage : Types::CustomerManagedS3Storage
        )
        end
      end

      # A parquet file.

      struct Parquet
        include JSON::Serializable

        def initialize
        end
      end

      # Identifies an IoT SiteWise Monitor portal.

      struct PortalResource
        include JSON::Serializable

        # The ID of the portal.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Contains information about the current status of a portal.

      struct PortalStatus
        include JSON::Serializable

        # The current state of the portal.

        @[JSON::Field(key: "state")]
        getter state : String

        # Contains associated error information, if any.

        @[JSON::Field(key: "error")]
        getter error : Types::MonitorErrorDetails?

        def initialize(
          @state : String,
          @error : Types::MonitorErrorDetails? = nil
        )
        end
      end

      # Contains a portal summary.

      struct PortalSummary
        include JSON::Serializable

        # The ID of the portal.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the portal.

        @[JSON::Field(key: "name")]
        getter name : String

        # The URL for the IoT SiteWise Monitor portal. You can use this URL to access portals that use IAM
        # Identity Center for authentication. For portals that use IAM for authentication, you must use the
        # IoT SiteWise console to get a URL that you can use to access the portal.

        @[JSON::Field(key: "startUrl")]
        getter start_url : String


        @[JSON::Field(key: "status")]
        getter status : Types::PortalStatus

        # The date the portal was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The portal's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date the portal was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time?

        # Define the type of portal. The value for IoT SiteWise Monitor (Classic) is SITEWISE_PORTAL_V1 . The
        # value for IoT SiteWise Monitor (AI-aware) is SITEWISE_PORTAL_V2 .

        @[JSON::Field(key: "portalType")]
        getter portal_type : String?

        # The ARN of the service role that allows the portal's users to access your IoT SiteWise resources on
        # your behalf. For more information, see Using service roles for IoT SiteWise Monitor in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @id : String,
          @name : String,
          @start_url : String,
          @status : Types::PortalStatus,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @last_update_date : Time? = nil,
          @portal_type : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The configuration entry associated with the specific portal type. The portalTypeConfiguration is a
      # map of the portalTypeKey to the PortalTypeEntry .

      struct PortalTypeEntry
        include JSON::Serializable

        # The array of tools associated with the specified portal type. The possible values are ASSISTANT and
        # DASHBOARD .

        @[JSON::Field(key: "portalTools")]
        getter portal_tools : Array(String)?

        def initialize(
          @portal_tools : Array(String)? = nil
        )
        end
      end

      # The precondition in one or more of the request-header fields evaluated to FALSE .

      struct PreconditionFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ARN of the resource on which precondition failed with this operation.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ID of the resource on which precondition failed with this operation.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_arn : String,
          @resource_id : String
        )
        end
      end

      # Identifies a specific IoT SiteWise Monitor project.

      struct ProjectResource
        include JSON::Serializable

        # The ID of the project.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Contains project summary information.

      struct ProjectSummary
        include JSON::Serializable

        # The ID of the project.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project.

        @[JSON::Field(key: "name")]
        getter name : String

        # The date the project was created, in Unix epoch time.

        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The project's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date the project was last updated, in Unix epoch time.

        @[JSON::Field(key: "lastUpdateDate")]
        getter last_update_date : Time?

        def initialize(
          @id : String,
          @name : String,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @last_update_date : Time? = nil
        )
        end
      end

      # Contains asset property information.

      struct Property
        include JSON::Serializable

        # The property data type.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The ID of the asset property.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the property.

        @[JSON::Field(key: "name")]
        getter name : String

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The external ID of the asset property. For more information, see Using external IDs in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The asset property's notification topic and state. For more information, see UpdateAssetProperty .

        @[JSON::Field(key: "notification")]
        getter notification : Types::PropertyNotification?

        # The structured path to the property from the root of the asset.

        @[JSON::Field(key: "path")]
        getter path : Array(Types::AssetPropertyPathSegment)?

        # The property type (see PropertyType ). A property contains one type.

        @[JSON::Field(key: "type")]
        getter type : Types::PropertyType?

        # The unit (such as Newtons or RPM ) of the asset property.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @id : String,
          @name : String,
          @alias : String? = nil,
          @external_id : String? = nil,
          @notification : Types::PropertyNotification? = nil,
          @path : Array(Types::AssetPropertyPathSegment)? = nil,
          @type : Types::PropertyType? = nil,
          @unit : String? = nil
        )
        end
      end

      # Maps a property from an interface asset model to a property in the asset model where the interface
      # is applied.

      struct PropertyMapping
        include JSON::Serializable

        # The ID of the property in the asset model where the interface is applied.

        @[JSON::Field(key: "assetModelPropertyId")]
        getter asset_model_property_id : String

        # The ID of the property in the interface asset model.

        @[JSON::Field(key: "interfaceAssetModelPropertyId")]
        getter interface_asset_model_property_id : String

        def initialize(
          @asset_model_property_id : String,
          @interface_asset_model_property_id : String
        )
        end
      end

      # Contains configuration options for mapping properties from an interface asset model to an asset
      # model where the interface is applied.

      struct PropertyMappingConfiguration
        include JSON::Serializable

        # If true, missing properties from the interface asset model are automatically created in the asset
        # model where the interface is applied.

        @[JSON::Field(key: "createMissingProperty")]
        getter create_missing_property : Bool?

        # If true, properties are matched by name between the interface asset model and the asset model where
        # the interface is applied.

        @[JSON::Field(key: "matchByPropertyName")]
        getter match_by_property_name : Bool?

        # A list of specific property mappings that override the automatic mapping by name when an interface
        # is applied to an asset model.

        @[JSON::Field(key: "overrides")]
        getter overrides : Array(Types::PropertyMapping)?

        def initialize(
          @create_missing_property : Bool? = nil,
          @match_by_property_name : Bool? = nil,
          @overrides : Array(Types::PropertyMapping)? = nil
        )
        end
      end

      # Contains asset property value notification information. When the notification state is enabled, IoT
      # SiteWise publishes property value updates to a unique MQTT topic. For more information, see
      # Interacting with other services in the IoT SiteWise User Guide .

      struct PropertyNotification
        include JSON::Serializable

        # The current notification state.

        @[JSON::Field(key: "state")]
        getter state : String

        # The MQTT topic to which IoT SiteWise publishes property value update notifications.

        @[JSON::Field(key: "topic")]
        getter topic : String

        def initialize(
          @state : String,
          @topic : String
        )
        end
      end

      # Contains a property type, which can be one of attribute , measurement , metric , or transform .

      struct PropertyType
        include JSON::Serializable

        # Specifies an asset attribute property. An attribute generally contains static information, such as
        # the serial number of an IIoT wind turbine.

        @[JSON::Field(key: "attribute")]
        getter attribute : Types::Attribute?

        # Specifies an asset measurement property. A measurement represents a device's raw sensor data stream,
        # such as timestamped temperature values or timestamped power values.

        @[JSON::Field(key: "measurement")]
        getter measurement : Types::Measurement?

        # Specifies an asset metric property. A metric contains a mathematical expression that uses aggregate
        # functions to process all input data points over a time interval and output a single data point, such
        # as to calculate the average hourly temperature.

        @[JSON::Field(key: "metric")]
        getter metric : Types::Metric?

        # Specifies an asset transform property. A transform contains a mathematical expression that maps a
        # property's data points from one form to another, such as a unit conversion from Celsius to
        # Fahrenheit.

        @[JSON::Field(key: "transform")]
        getter transform : Types::Transform?

        def initialize(
          @attribute : Types::Attribute? = nil,
          @measurement : Types::Measurement? = nil,
          @metric : Types::Metric? = nil,
          @transform : Types::Transform? = nil
        )
        end
      end

      # The value type of null asset property data with BAD and UNCERTAIN qualities.

      struct PropertyValueNullValue
        include JSON::Serializable

        # The type of null asset property data.

        @[JSON::Field(key: "valueType")]
        getter value_type : String

        def initialize(
          @value_type : String
        )
        end
      end


      struct PutAssetModelInterfaceRelationshipRequest
        include JSON::Serializable

        # The ID of the asset model. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # The ID of the interface asset model. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        # The configuration for mapping properties from the interface asset model to the asset model where the
        # interface is applied. This configuration controls how properties are matched and created during the
        # interface application process.

        @[JSON::Field(key: "propertyMappingConfiguration")]
        getter property_mapping_configuration : Types::PropertyMappingConfiguration

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_model_id : String,
          @interface_asset_model_id : String,
          @property_mapping_configuration : Types::PropertyMappingConfiguration,
          @client_token : String? = nil
        )
        end
      end


      struct PutAssetModelInterfaceRelationshipResponse
        include JSON::Serializable

        # The ARN of the asset model, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}

        @[JSON::Field(key: "assetModelArn")]
        getter asset_model_arn : String

        # The ID of the asset model.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String


        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        # The ID of the interface asset model.

        @[JSON::Field(key: "interfaceAssetModelId")]
        getter interface_asset_model_id : String

        def initialize(
          @asset_model_arn : String,
          @asset_model_id : String,
          @asset_model_status : Types::AssetModelStatus,
          @interface_asset_model_id : String
        )
        end
      end

      # Contains a list of value updates for an asset property in the list of asset entries consumed by the
      # BatchPutAssetPropertyValue API operation.

      struct PutAssetPropertyValueEntry
        include JSON::Serializable

        # The user specified ID for the entry. You can use this ID to identify which entries failed.

        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # The list of property values to upload. You can specify up to 10 propertyValues array elements.

        @[JSON::Field(key: "propertyValues")]
        getter property_values : Array(Types::AssetPropertyValue)

        # The ID of the asset to update.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset property for this entry.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @entry_id : String,
          @property_values : Array(Types::AssetPropertyValue),
          @asset_id : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil
        )
        end
      end


      struct PutDefaultEncryptionConfigurationRequest
        include JSON::Serializable

        # The type of encryption used for the encryption configuration.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The Key ID of the customer managed key used for KMS encryption. This is required if you use
        # KMS_BASED_ENCRYPTION .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @encryption_type : String,
          @kms_key_id : String? = nil
        )
        end
      end


      struct PutDefaultEncryptionConfigurationResponse
        include JSON::Serializable

        # The status of the account configuration. This contains the ConfigurationState . If there is an
        # error, it also contains the ErrorDetails .

        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : Types::ConfigurationStatus

        # The type of encryption used for the encryption configuration.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The Key ARN of the KMS key used for KMS encryption if you use KMS_BASED_ENCRYPTION .

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @configuration_status : Types::ConfigurationStatus,
          @encryption_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct PutLoggingOptionsRequest
        include JSON::Serializable

        # The logging options to set.

        @[JSON::Field(key: "loggingOptions")]
        getter logging_options : Types::LoggingOptions

        def initialize(
          @logging_options : Types::LoggingOptions
        )
        end
      end


      struct PutLoggingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutStorageConfigurationRequest
        include JSON::Serializable

        # The storage tier that you specified for your data. The storageType parameter can be one of the
        # following values: SITEWISE_DEFAULT_STORAGE – IoT SiteWise saves your data into the hot tier. The hot
        # tier is a service-managed database. MULTI_LAYER_STORAGE – IoT SiteWise saves your data in both the
        # cold tier and the hot tier. The cold tier is a customer-managed Amazon S3 bucket.

        @[JSON::Field(key: "storageType")]
        getter storage_type : String

        # Describes the configuration for ingesting NULL and NaN data. By default the feature is allowed. The
        # feature is disallowed if the value is true .

        @[JSON::Field(key: "disallowIngestNullNaN")]
        getter disallow_ingest_null_na_n : Bool?

        # Contains the storage configuration for time series (data streams) that aren't associated with asset
        # properties. The disassociatedDataStorage can be one of the following values: ENABLED – IoT SiteWise
        # accepts time series that aren't associated with asset properties. After the disassociatedDataStorage
        # is enabled, you can't disable it. DISABLED – IoT SiteWise doesn't accept time series (data streams)
        # that aren't associated with asset properties. For more information, see Data streams in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "disassociatedDataStorage")]
        getter disassociated_data_storage : String?

        # Identifies a storage destination. If you specified MULTI_LAYER_STORAGE for the storage type, you
        # must specify a MultiLayerStorage object.

        @[JSON::Field(key: "multiLayerStorage")]
        getter multi_layer_storage : Types::MultiLayerStorage?


        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # A service managed storage tier optimized for analytical queries. It stores periodically uploaded,
        # buffered and historical data ingested with the CreaeBulkImportJob API.

        @[JSON::Field(key: "warmTier")]
        getter warm_tier : String?

        # Set this period to specify how long your data is stored in the warm tier before it is deleted. You
        # can set this only if cold tier is enabled.

        @[JSON::Field(key: "warmTierRetentionPeriod")]
        getter warm_tier_retention_period : Types::WarmTierRetentionPeriod?

        def initialize(
          @storage_type : String,
          @disallow_ingest_null_na_n : Bool? = nil,
          @disassociated_data_storage : String? = nil,
          @multi_layer_storage : Types::MultiLayerStorage? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @warm_tier : String? = nil,
          @warm_tier_retention_period : Types::WarmTierRetentionPeriod? = nil
        )
        end
      end


      struct PutStorageConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : Types::ConfigurationStatus

        # The storage tier that you specified for your data. The storageType parameter can be one of the
        # following values: SITEWISE_DEFAULT_STORAGE – IoT SiteWise saves your data into the hot tier. The hot
        # tier is a service-managed database. MULTI_LAYER_STORAGE – IoT SiteWise saves your data in both the
        # cold tier and the hot tier. The cold tier is a customer-managed Amazon S3 bucket.

        @[JSON::Field(key: "storageType")]
        getter storage_type : String

        # Describes the configuration for ingesting NULL and NaN data. By default the feature is allowed. The
        # feature is disallowed if the value is true .

        @[JSON::Field(key: "disallowIngestNullNaN")]
        getter disallow_ingest_null_na_n : Bool?

        # Contains the storage configuration for time series (data streams) that aren't associated with asset
        # properties. The disassociatedDataStorage can be one of the following values: ENABLED – IoT SiteWise
        # accepts time series that aren't associated with asset properties. After the disassociatedDataStorage
        # is enabled, you can't disable it. DISABLED – IoT SiteWise doesn't accept time series (data streams)
        # that aren't associated with asset properties. For more information, see Data streams in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "disassociatedDataStorage")]
        getter disassociated_data_storage : String?

        # Contains information about the storage destination.

        @[JSON::Field(key: "multiLayerStorage")]
        getter multi_layer_storage : Types::MultiLayerStorage?


        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # A service managed storage tier optimized for analytical queries. It stores periodically uploaded,
        # buffered and historical data ingested with the CreaeBulkImportJob API.

        @[JSON::Field(key: "warmTier")]
        getter warm_tier : String?

        # Set this period to specify how long your data is stored in the warm tier before it is deleted. You
        # can set this only if cold tier is enabled.

        @[JSON::Field(key: "warmTierRetentionPeriod")]
        getter warm_tier_retention_period : Types::WarmTierRetentionPeriod?

        def initialize(
          @configuration_status : Types::ConfigurationStatus,
          @storage_type : String,
          @disallow_ingest_null_na_n : Bool? = nil,
          @disassociated_data_storage : String? = nil,
          @multi_layer_storage : Types::MultiLayerStorage? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @warm_tier : String? = nil,
          @warm_tier_retention_period : Types::WarmTierRetentionPeriod? = nil
        )
        end
      end

      # The query timed out.

      struct QueryTimeoutException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the reference information.

      struct Reference
        include JSON::Serializable

        # Contains the dataset reference information.

        @[JSON::Field(key: "dataset")]
        getter dataset : Types::DataSetReference?

        def initialize(
          @dataset : Types::DataSetReference? = nil
        )
        end
      end

      # The detailed resource this execution summary resolves to.

      struct ResolveTo
        include JSON::Serializable

        # The ID of the asset that the resource resolves to.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        def initialize(
          @asset_id : String
        )
        end
      end

      # Contains an IoT SiteWise Monitor resource ID for a portal or project.

      struct Resource
        include JSON::Serializable

        # A portal resource.

        @[JSON::Field(key: "portal")]
        getter portal : Types::PortalResource?

        # A project resource.

        @[JSON::Field(key: "project")]
        getter project : Types::ProjectResource?

        def initialize(
          @portal : Types::PortalResource? = nil,
          @project : Types::ProjectResource? = nil
        )
        end
      end

      # The resource already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ARN of the resource that already exists.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ID of the resource that already exists.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_arn : String,
          @resource_id : String
        )
        end
      end

      # The requested resource can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains the response, citation, and trace from the SiteWise Assistant.

      struct ResponseStream
        include JSON::Serializable


        @[JSON::Field(key: "accessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?


        @[JSON::Field(key: "conflictingOperationException")]
        getter conflicting_operation_exception : Types::ConflictingOperationException?


        @[JSON::Field(key: "internalFailureException")]
        getter internal_failure_exception : Types::InternalFailureException?


        @[JSON::Field(key: "invalidRequestException")]
        getter invalid_request_exception : Types::InvalidRequestException?


        @[JSON::Field(key: "limitExceededException")]
        getter limit_exceeded_exception : Types::LimitExceededException?

        # Contains the SiteWise Assistant's response.

        @[JSON::Field(key: "output")]
        getter output : Types::InvocationOutput?


        @[JSON::Field(key: "resourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?


        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # Contains tracing information of the SiteWise Assistant's reasoning and data access.

        @[JSON::Field(key: "trace")]
        getter trace : Types::Trace?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @conflicting_operation_exception : Types::ConflictingOperationException? = nil,
          @internal_failure_exception : Types::InternalFailureException? = nil,
          @invalid_request_exception : Types::InvalidRequestException? = nil,
          @limit_exceeded_exception : Types::LimitExceededException? = nil,
          @output : Types::InvocationOutput? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @trace : Types::Trace? = nil
        )
        end
      end

      # The number of days your data is kept in the hot tier. By default, your data is kept indefinitely in
      # the hot tier.

      struct RetentionPeriod
        include JSON::Serializable

        # The number of days that your data is kept. If you specified a value for this parameter, the
        # unlimited parameter must be false .

        @[JSON::Field(key: "numberOfDays")]
        getter number_of_days : Int32?

        # If true, your data is kept indefinitely. If configured to true , you must not specify a value for
        # the numberOfDays parameter.

        @[JSON::Field(key: "unlimited")]
        getter unlimited : Bool?

        def initialize(
          @number_of_days : Int32? = nil,
          @unlimited : Bool? = nil
        )
        end
      end

      # Represents a single row in the query results.

      struct Row
        include JSON::Serializable

        # List of data points in a single row of the result set.

        @[JSON::Field(key: "data")]
        getter data : Array(Types::Datum)

        def initialize(
          @data : Array(Types::Datum)
        )
        end
      end

      # The requested service is unavailable.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains details for a SiteWise Edge gateway that runs on a Siemens Industrial Edge Device.

      struct SiemensIE
        include JSON::Serializable

        # The name of the IoT Thing for your SiteWise Edge gateway.

        @[JSON::Field(key: "iotCoreThingName")]
        getter iot_core_thing_name : String

        def initialize(
          @iot_core_thing_name : String
        )
        end
      end

      # The data source for the dataset.

      struct Source
        include JSON::Serializable

        # Contains the ARN of the dataset. If the source is Kendra, it's the ARN of the Kendra index.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Contains the location information where the cited text is originally stored. For example, if the
        # data source is Kendra, and the text synchronized is from an S3 bucket, then the location refers to
        # an S3 object.

        @[JSON::Field(key: "location")]
        getter location : Types::Location?

        def initialize(
          @arn : String? = nil,
          @location : Types::Location? = nil
        )
        end
      end

      # The details of the dataset source associated with the dataset.

      struct SourceDetail
        include JSON::Serializable

        # Contains details about the Kendra dataset source.

        @[JSON::Field(key: "kendra")]
        getter kendra : Types::KendraSourceDetail?

        def initialize(
          @kendra : Types::KendraSourceDetail? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tagging
        # your IoT SiteWise resources in the IoT SiteWise User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The resource the action will be taken on. This can include asset-based resources and computation
      # model resources.

      struct TargetResource
        include JSON::Serializable

        # The ID of the asset, in UUID format.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String?

        def initialize(
          @asset_id : String? = nil,
          @computation_model_id : String? = nil
        )
        end
      end

      # Your request exceeded a rate limit. For example, you might have exceeded the number of IoT SiteWise
      # assets that can be created per second, the allowed number of messages per second, and so on. For
      # more information, see Quotas in the IoT SiteWise User Guide .

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains a timestamp with optional nanosecond granularity.

      struct TimeInNanos
        include JSON::Serializable

        # The timestamp date, in seconds, in the Unix epoch format. Fractional nanosecond data is provided by
        # offsetInNanos .

        @[JSON::Field(key: "timeInSeconds")]
        getter time_in_seconds : Int64

        # The nanosecond offset from timeInSeconds .

        @[JSON::Field(key: "offsetInNanos")]
        getter offset_in_nanos : Int32?

        def initialize(
          @time_in_seconds : Int64,
          @offset_in_nanos : Int32? = nil
        )
        end
      end

      # Contains a summary of a time series (data stream).

      struct TimeSeriesSummary
        include JSON::Serializable

        # The data type of the time series. If you specify STRUCT , you must also specify dataTypeSpec to
        # identify the type of the structure for this time series.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The ARN of the time series, which has the following format.
        # arn:${Partition}:iotsitewise:${Region}:${Account}:time-series/${TimeSeriesId}

        @[JSON::Field(key: "timeSeriesArn")]
        getter time_series_arn : String

        # The date that the time series was created, in Unix epoch time.

        @[JSON::Field(key: "timeSeriesCreationDate")]
        getter time_series_creation_date : Time

        # The ID of the time series.

        @[JSON::Field(key: "timeSeriesId")]
        getter time_series_id : String

        # The date that the time series was last updated, in Unix epoch time.

        @[JSON::Field(key: "timeSeriesLastUpdateDate")]
        getter time_series_last_update_date : Time

        # The alias that identifies the time series.

        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The ID of the asset in which the asset property was created.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The data type of the structure for this time series. This parameter is required for time series that
        # have the STRUCT data type. The options for this parameter depend on the type of the composite model
        # in which you created the asset property that is associated with your time series. Use
        # AWS/ALARM_STATE for alarm state in alarm composite models.

        @[JSON::Field(key: "dataTypeSpec")]
        getter data_type_spec : String?

        # The ID of the asset property, in UUID format.

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @data_type : String,
          @time_series_arn : String,
          @time_series_creation_date : Time,
          @time_series_id : String,
          @time_series_last_update_date : Time,
          @alias : String? = nil,
          @asset_id : String? = nil,
          @data_type_spec : String? = nil,
          @property_id : String? = nil
        )
        end
      end

      # You've reached the quota for the number of tags allowed for a resource. For more information, see
      # Tag naming limits and requirements in the Amazon Web Services General Reference .

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the resource with too many tags.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Contains tracing information of the SiteWise Assistant's reasoning and data access.

      struct Trace
        include JSON::Serializable

        # The cited text from the data source.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Contains an asset transform property. A transform is a one-to-one mapping of a property's data
      # points from one form to another. For example, you can use a transform to convert a Celsius data
      # stream to Fahrenheit by applying the transformation expression to each data point of the Celsius
      # stream. A transform can only have a data type of DOUBLE and consume properties with data types of
      # INTEGER or DOUBLE . For more information, see Transforms in the IoT SiteWise User Guide .

      struct Transform
        include JSON::Serializable

        # The mathematical expression that defines the transformation function. You can specify up to 10
        # variables per expression. You can specify up to 10 functions per expression. For more information,
        # see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The list of variables used in the expression.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::ExpressionVariable)

        # The processing configuration for the given transform property. You can configure transforms to be
        # kept at the edge or forwarded to the Amazon Web Services Cloud. You can also configure transforms to
        # be computed at the edge or in the cloud.

        @[JSON::Field(key: "processingConfig")]
        getter processing_config : Types::TransformProcessingConfig?

        def initialize(
          @expression : String,
          @variables : Array(Types::ExpressionVariable),
          @processing_config : Types::TransformProcessingConfig? = nil
        )
        end
      end

      # The processing configuration for the given transform property. You can configure transforms to be
      # kept at the edge or forwarded to the Amazon Web Services Cloud. You can also configure transforms to
      # be computed at the edge or in the cloud.

      struct TransformProcessingConfig
        include JSON::Serializable

        # The compute location for the given transform property.

        @[JSON::Field(key: "computeLocation")]
        getter compute_location : String


        @[JSON::Field(key: "forwardingConfig")]
        getter forwarding_config : Types::ForwardingConfig?

        def initialize(
          @compute_location : String,
          @forwarding_config : Types::ForwardingConfig? = nil
        )
        end
      end

      # Contains a tumbling window, which is a repeating fixed-sized, non-overlapping, and contiguous time
      # window. You can use this window in metrics to aggregate data from properties and other assets. You
      # can use m , h , d , and w when you specify an interval or offset. Note that m represents minutes, h
      # represents hours, d represents days, and w represents weeks. You can also use s to represent seconds
      # in offset . The interval and offset parameters support the ISO 8601 format . For example, PT5S
      # represents 5 seconds, PT5M represents 5 minutes, and PT5H represents 5 hours.

      struct TumblingWindow
        include JSON::Serializable

        # The time interval for the tumbling window. The interval time must be between 1 minute and 1 week.
        # IoT SiteWise computes the 1w interval the end of Sunday at midnight each week (UTC), the 1d interval
        # at the end of each day at midnight (UTC), the 1h interval at the end of each hour, and so on. When
        # IoT SiteWise aggregates data points for metric computations, the start of each interval is exclusive
        # and the end of each interval is inclusive. IoT SiteWise places the computed data point at the end of
        # the interval.

        @[JSON::Field(key: "interval")]
        getter interval : String

        # The offset for the tumbling window. The offset parameter accepts the following: The offset time. For
        # example, if you specify 18h for offset and 1d for interval , IoT SiteWise aggregates data in one of
        # the following ways: If you create the metric before or at 6 PM (UTC), you get the first aggregation
        # result at 6 PM (UTC) on the day when you create the metric. If you create the metric after 6 PM
        # (UTC), you get the first aggregation result at 6 PM (UTC) the next day. The ISO 8601 format. For
        # example, if you specify PT18H for offset and 1d for interval , IoT SiteWise aggregates data in one
        # of the following ways: If you create the metric before or at 6 PM (UTC), you get the first
        # aggregation result at 6 PM (UTC) on the day when you create the metric. If you create the metric
        # after 6 PM (UTC), you get the first aggregation result at 6 PM (UTC) the next day. The 24-hour
        # clock. For example, if you specify 00:03:00 for offset , 5m for interval , and you create the metric
        # at 2 PM (UTC), you get the first aggregation result at 2:03 PM (UTC). You get the second aggregation
        # result at 2:08 PM (UTC). The offset time zone. For example, if you specify 2021-07-23T18:00-08 for
        # offset and 1d for interval , IoT SiteWise aggregates data in one of the following ways: If you
        # create the metric before or at 6 PM (PST), you get the first aggregation result at 6 PM (PST) on the
        # day when you create the metric. If you create the metric after 6 PM (PST), you get the first
        # aggregation result at 6 PM (PST) the next day.

        @[JSON::Field(key: "offset")]
        getter offset : String?

        def initialize(
          @interval : String,
          @offset : String? = nil
        )
        end
      end

      # You are not authorized.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to untag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of keys for tags to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAccessPolicyRequest
        include JSON::Serializable

        # The ID of the access policy.

        @[JSON::Field(key: "accessPolicyId")]
        getter access_policy_id : String

        # The identity for this access policy. Choose an IAM Identity Center user, an IAM Identity Center
        # group, or an IAM user.

        @[JSON::Field(key: "accessPolicyIdentity")]
        getter access_policy_identity : Types::Identity

        # The permission level for this access policy. Note that a project ADMINISTRATOR is also known as a
        # project owner.

        @[JSON::Field(key: "accessPolicyPermission")]
        getter access_policy_permission : String

        # The IoT SiteWise Monitor resource for this access policy. Choose either a portal or a project.

        @[JSON::Field(key: "accessPolicyResource")]
        getter access_policy_resource : Types::Resource

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @access_policy_id : String,
          @access_policy_identity : Types::Identity,
          @access_policy_permission : String,
          @access_policy_resource : Types::Resource,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateAccessPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAssetModelCompositeModelRequest
        include JSON::Serializable

        # The ID of a composite model on this asset model.

        @[JSON::Field(key: "assetModelCompositeModelId")]
        getter asset_model_composite_model_id : String

        # A unique name for the composite model.

        @[JSON::Field(key: "assetModelCompositeModelName")]
        getter asset_model_composite_model_name : String

        # The ID of the asset model, in UUID format.

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # A description for the composite model.

        @[JSON::Field(key: "assetModelCompositeModelDescription")]
        getter asset_model_composite_model_description : String?

        # An external ID to assign to the asset model. You can only set the external ID of the asset model if
        # it wasn't set when it was created, or you're setting it to the exact same thing as when it was
        # created.

        @[JSON::Field(key: "assetModelCompositeModelExternalId")]
        getter asset_model_composite_model_external_id : String?

        # The property definitions of the composite model. For more information, see Inline custom composite
        # models in the IoT SiteWise User Guide . You can specify up to 200 properties per composite model.
        # For more information, see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelCompositeModelProperties")]
        getter asset_model_composite_model_properties : Array(Types::AssetModelProperty)?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The expected current entity tag (ETag) for the asset model’s latest or active version (specified
        # using matchForVersionType ). The update request is rejected if the tag does not match the latest or
        # active version's current entity tag. See Optimistic locking for asset model writes in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Accepts * to reject the update request if an active version (specified using matchForVersionType as
        # ACTIVE ) already exists for the asset model.

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # Specifies the asset model version type ( LATEST or ACTIVE ) used in conjunction with If-Match or
        # If-None-Match headers to determine the target ETag for the update operation.

        @[JSON::Field(key: "Match-For-Version-Type")]
        getter match_for_version_type : String?

        def initialize(
          @asset_model_composite_model_id : String,
          @asset_model_composite_model_name : String,
          @asset_model_id : String,
          @asset_model_composite_model_description : String? = nil,
          @asset_model_composite_model_external_id : String? = nil,
          @asset_model_composite_model_properties : Array(Types::AssetModelProperty)? = nil,
          @client_token : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @match_for_version_type : String? = nil
        )
        end
      end


      struct UpdateAssetModelCompositeModelResponse
        include JSON::Serializable

        # The path to the composite model listing the parent composite models.

        @[JSON::Field(key: "assetModelCompositeModelPath")]
        getter asset_model_composite_model_path : Array(Types::AssetModelCompositeModelPathSegment)


        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        def initialize(
          @asset_model_composite_model_path : Array(Types::AssetModelCompositeModelPathSegment),
          @asset_model_status : Types::AssetModelStatus
        )
        end
      end


      struct UpdateAssetModelRequest
        include JSON::Serializable

        # The ID of the asset model to update. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String

        # A unique name for the asset model.

        @[JSON::Field(key: "assetModelName")]
        getter asset_model_name : String

        # The composite models that are part of this asset model. It groups properties (such as attributes,
        # measurements, transforms, and metrics) and child composite models that model parts of your
        # industrial equipment. Each composite model has a type that defines the properties that the composite
        # model supports. Use composite models to define alarms on this asset model. When creating custom
        # composite models, you need to use CreateAssetModelCompositeModel . For more information, see
        # Creating custom composite models (Components) in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelCompositeModels")]
        getter asset_model_composite_models : Array(Types::AssetModelCompositeModel)?

        # A description for the asset model.

        @[JSON::Field(key: "assetModelDescription")]
        getter asset_model_description : String?

        # An external ID to assign to the asset model. The asset model must not already have an external ID.
        # The external ID must be unique within your Amazon Web Services account. For more information, see
        # Using external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelExternalId")]
        getter asset_model_external_id : String?

        # The updated hierarchy definitions of the asset model. Each hierarchy specifies an asset model whose
        # assets can be children of any other assets created from this asset model. For more information, see
        # Asset hierarchies in the IoT SiteWise User Guide . You can specify up to 10 hierarchies per asset
        # model. For more information, see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelHierarchies")]
        getter asset_model_hierarchies : Array(Types::AssetModelHierarchy)?

        # The updated property definitions of the asset model. For more information, see Asset properties in
        # the IoT SiteWise User Guide . You can specify up to 200 properties per asset model. For more
        # information, see Quotas in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetModelProperties")]
        getter asset_model_properties : Array(Types::AssetModelProperty)?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The expected current entity tag (ETag) for the asset model’s latest or active version (specified
        # using matchForVersionType ). The update request is rejected if the tag does not match the latest or
        # active version's current entity tag. See Optimistic locking for asset model writes in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Accepts * to reject the update request if an active version (specified using matchForVersionType as
        # ACTIVE ) already exists for the asset model.

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # Specifies the asset model version type ( LATEST or ACTIVE ) used in conjunction with If-Match or
        # If-None-Match headers to determine the target ETag for the update operation.

        @[JSON::Field(key: "Match-For-Version-Type")]
        getter match_for_version_type : String?

        def initialize(
          @asset_model_id : String,
          @asset_model_name : String,
          @asset_model_composite_models : Array(Types::AssetModelCompositeModel)? = nil,
          @asset_model_description : String? = nil,
          @asset_model_external_id : String? = nil,
          @asset_model_hierarchies : Array(Types::AssetModelHierarchy)? = nil,
          @asset_model_properties : Array(Types::AssetModelProperty)? = nil,
          @client_token : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @match_for_version_type : String? = nil
        )
        end
      end


      struct UpdateAssetModelResponse
        include JSON::Serializable

        # The status of the asset model, which contains a state ( UPDATING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "assetModelStatus")]
        getter asset_model_status : Types::AssetModelStatus

        def initialize(
          @asset_model_status : Types::AssetModelStatus
        )
        end
      end


      struct UpdateAssetPropertyRequest
        include JSON::Serializable

        # The ID of the asset to be updated. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the asset property to be updated. This can be either the actual ID in UUID format, or else
        # externalId: followed by the external ID, if it has one. For more information, see Referencing
        # objects with external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyId")]
        getter property_id : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The alias that identifies the property, such as an OPC-UA server data stream path (for example,
        # /company/windfarm/3/turbine/7/temperature ). For more information, see Mapping industrial data
        # streams to asset properties in the IoT SiteWise User Guide . If you omit this parameter, the alias
        # is removed from the property.

        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The MQTT notification state (enabled or disabled) for this asset property. When the notification
        # state is enabled, IoT SiteWise publishes property value updates to a unique MQTT topic. For more
        # information, see Interacting with other services in the IoT SiteWise User Guide . If you omit this
        # parameter, the notification state is set to DISABLED .

        @[JSON::Field(key: "propertyNotificationState")]
        getter property_notification_state : String?

        # The unit of measure (such as Newtons or RPM) of the asset property. If you don't specify a value for
        # this parameter, the service uses the value of the assetModelProperty in the asset model.

        @[JSON::Field(key: "propertyUnit")]
        getter property_unit : String?

        def initialize(
          @asset_id : String,
          @property_id : String,
          @client_token : String? = nil,
          @property_alias : String? = nil,
          @property_notification_state : String? = nil,
          @property_unit : String? = nil
        )
        end
      end


      struct UpdateAssetRequest
        include JSON::Serializable

        # The ID of the asset to update. This can be either the actual ID in UUID format, or else externalId:
        # followed by the external ID, if it has one. For more information, see Referencing objects with
        # external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # A friendly name for the asset.

        @[JSON::Field(key: "assetName")]
        getter asset_name : String

        # A description for the asset.

        @[JSON::Field(key: "assetDescription")]
        getter asset_description : String?

        # An external ID to assign to the asset. The asset must not already have an external ID. The external
        # ID must be unique within your Amazon Web Services account. For more information, see Using external
        # IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "assetExternalId")]
        getter asset_external_id : String?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @asset_id : String,
          @asset_name : String,
          @asset_description : String? = nil,
          @asset_external_id : String? = nil,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateAssetResponse
        include JSON::Serializable

        # The status of the asset, which contains a state ( UPDATING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "assetStatus")]
        getter asset_status : Types::AssetStatus

        def initialize(
          @asset_status : Types::AssetStatus
        )
        end
      end


      struct UpdateComputationModelRequest
        include JSON::Serializable

        # The configuration for the computation model.

        @[JSON::Field(key: "computationModelConfiguration")]
        getter computation_model_configuration : Types::ComputationModelConfiguration

        # The data binding for the computation model. Key is a variable name defined in configuration. Value
        # is a ComputationModelDataBindingValue referenced by the variable.

        @[JSON::Field(key: "computationModelDataBinding")]
        getter computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue)

        # The ID of the computation model.

        @[JSON::Field(key: "computationModelId")]
        getter computation_model_id : String

        # The name of the computation model.

        @[JSON::Field(key: "computationModelName")]
        getter computation_model_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the computation model.

        @[JSON::Field(key: "computationModelDescription")]
        getter computation_model_description : String?

        def initialize(
          @computation_model_configuration : Types::ComputationModelConfiguration,
          @computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue),
          @computation_model_id : String,
          @computation_model_name : String,
          @client_token : String? = nil,
          @computation_model_description : String? = nil
        )
        end
      end


      struct UpdateComputationModelResponse
        include JSON::Serializable

        # The status of the computation model. It contains a state (UPDATING after successfully calling this
        # operation) and an error message if any.

        @[JSON::Field(key: "computationModelStatus")]
        getter computation_model_status : Types::ComputationModelStatus

        def initialize(
          @computation_model_status : Types::ComputationModelStatus
        )
        end
      end


      struct UpdateDashboardRequest
        include JSON::Serializable

        # The new dashboard definition, as specified in a JSON literal. IoT SiteWise Monitor (Classic) see
        # Create dashboards (CLI) IoT SiteWise Monitor (AI-aware) see Create dashboards (CLI) in the IoT
        # SiteWise User Guide

        @[JSON::Field(key: "dashboardDefinition")]
        getter dashboard_definition : String

        # The ID of the dashboard to update.

        @[JSON::Field(key: "dashboardId")]
        getter dashboard_id : String

        # A new friendly name for the dashboard.

        @[JSON::Field(key: "dashboardName")]
        getter dashboard_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A new description for the dashboard.

        @[JSON::Field(key: "dashboardDescription")]
        getter dashboard_description : String?

        def initialize(
          @dashboard_definition : String,
          @dashboard_id : String,
          @dashboard_name : String,
          @client_token : String? = nil,
          @dashboard_description : String? = nil
        )
        end
      end


      struct UpdateDashboardResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDatasetRequest
        include JSON::Serializable

        # The ID of the dataset.

        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # The name of the dataset.

        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The data source for the dataset.

        @[JSON::Field(key: "datasetSource")]
        getter dataset_source : Types::DatasetSource

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description about the dataset, and its functionality.

        @[JSON::Field(key: "datasetDescription")]
        getter dataset_description : String?

        def initialize(
          @dataset_id : String,
          @dataset_name : String,
          @dataset_source : Types::DatasetSource,
          @client_token : String? = nil,
          @dataset_description : String? = nil
        )
        end
      end


      struct UpdateDatasetResponse
        include JSON::Serializable

        # The ARN of the dataset. The format is
        # arn:${Partition}:iotsitewise:${Region}:${Account}:dataset/${DatasetId} .

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The ID of the dataset.

        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # The status of the dataset. This contains the state and any error messages. State is UPDATING after a
        # successfull call to this API, and any associated error message. The state is ACTIVE when ready to
        # use.

        @[JSON::Field(key: "datasetStatus")]
        getter dataset_status : Types::DatasetStatus?

        def initialize(
          @dataset_arn : String? = nil,
          @dataset_id : String? = nil,
          @dataset_status : Types::DatasetStatus? = nil
        )
        end
      end


      struct UpdateGatewayCapabilityConfigurationRequest
        include JSON::Serializable

        # The JSON document that defines the configuration for the gateway capability. For more information,
        # see Configuring data sources (CLI) in the IoT SiteWise User Guide .

        @[JSON::Field(key: "capabilityConfiguration")]
        getter capability_configuration : String

        # The namespace of the gateway capability configuration to be updated. For example, if you configure
        # OPC UA sources for an MQTT-enabled gateway, your OPC-UA capability configuration has the namespace
        # iotsitewise:opcuacollector:3 .

        @[JSON::Field(key: "capabilityNamespace")]
        getter capability_namespace : String

        # The ID of the gateway to be updated.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @capability_configuration : String,
          @capability_namespace : String,
          @gateway_id : String
        )
        end
      end


      struct UpdateGatewayCapabilityConfigurationResponse
        include JSON::Serializable

        # The namespace of the gateway capability.

        @[JSON::Field(key: "capabilityNamespace")]
        getter capability_namespace : String

        # The synchronization status of the gateway capability configuration. The sync status can be one of
        # the following: IN_SYNC - The gateway is running with the latest configuration. OUT_OF_SYNC - The
        # gateway hasn't received the latest configuration. SYNC_FAILED - The gateway rejected the latest
        # configuration. UNKNOWN - The gateway hasn't reported its sync status. NOT_APPLICABLE - The gateway
        # doesn't support this capability. This is most common when integrating partner data sources, because
        # the data integration is handled externally by the partner. After you update a capability
        # configuration, its sync status is OUT_OF_SYNC until the gateway receives and applies or rejects the
        # updated configuration.

        @[JSON::Field(key: "capabilitySyncStatus")]
        getter capability_sync_status : String

        def initialize(
          @capability_namespace : String,
          @capability_sync_status : String
        )
        end
      end


      struct UpdateGatewayRequest
        include JSON::Serializable

        # The ID of the gateway to update.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # A unique name for the gateway.

        @[JSON::Field(key: "gatewayName")]
        getter gateway_name : String

        def initialize(
          @gateway_id : String,
          @gateway_name : String
        )
        end
      end


      struct UpdatePortalRequest
        include JSON::Serializable

        # The Amazon Web Services administrator's contact email address.

        @[JSON::Field(key: "portalContactEmail")]
        getter portal_contact_email : String

        # The ID of the portal to update.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # A new friendly name for the portal.

        @[JSON::Field(key: "portalName")]
        getter portal_name : String

        # The ARN of a service role that allows the portal's users to access your IoT SiteWise resources on
        # your behalf. For more information, see Using service roles for IoT SiteWise Monitor in the IoT
        # SiteWise User Guide .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Contains the configuration information of an alarm created in an IoT SiteWise Monitor portal. You
        # can use the alarm to monitor an asset property and get notified when the asset property value is
        # outside a specified range. For more information, see Monitoring with alarms in the IoT SiteWise
        # Application Guide .

        @[JSON::Field(key: "alarms")]
        getter alarms : Types::Alarms?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The email address that sends alarm notifications.

        @[JSON::Field(key: "notificationSenderEmail")]
        getter notification_sender_email : String?

        # A new description for the portal.

        @[JSON::Field(key: "portalDescription")]
        getter portal_description : String?


        @[JSON::Field(key: "portalLogoImage")]
        getter portal_logo_image : Types::Image?

        # Define the type of portal. The value for IoT SiteWise Monitor (Classic) is SITEWISE_PORTAL_V1 . The
        # value for IoT SiteWise Monitor (AI-aware) is SITEWISE_PORTAL_V2 .

        @[JSON::Field(key: "portalType")]
        getter portal_type : String?

        # The configuration entry associated with the specific portal type. The value for IoT SiteWise Monitor
        # (Classic) is SITEWISE_PORTAL_V1 . The value for IoT SiteWise Monitor (AI-aware) is
        # SITEWISE_PORTAL_V2 .

        @[JSON::Field(key: "portalTypeConfiguration")]
        getter portal_type_configuration : Hash(String, Types::PortalTypeEntry)?

        def initialize(
          @portal_contact_email : String,
          @portal_id : String,
          @portal_name : String,
          @role_arn : String,
          @alarms : Types::Alarms? = nil,
          @client_token : String? = nil,
          @notification_sender_email : String? = nil,
          @portal_description : String? = nil,
          @portal_logo_image : Types::Image? = nil,
          @portal_type : String? = nil,
          @portal_type_configuration : Hash(String, Types::PortalTypeEntry)? = nil
        )
        end
      end


      struct UpdatePortalResponse
        include JSON::Serializable

        # The status of the portal, which contains a state ( UPDATING after successfully calling this
        # operation) and any error message.

        @[JSON::Field(key: "portalStatus")]
        getter portal_status : Types::PortalStatus

        def initialize(
          @portal_status : Types::PortalStatus
        )
        end
      end


      struct UpdateProjectRequest
        include JSON::Serializable

        # The ID of the project to update.

        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # A new friendly name for the project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A new description for the project.

        @[JSON::Field(key: "projectDescription")]
        getter project_description : String?

        def initialize(
          @project_id : String,
          @project_name : String,
          @client_token : String? = nil,
          @project_description : String? = nil
        )
        end
      end


      struct UpdateProjectResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information for a user identity in an access policy.

      struct UserIdentity
        include JSON::Serializable

        # The IAM Identity Center ID of the user.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The validation failed for this query.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Identifies a property value used in an expression.

      struct VariableValue
        include JSON::Serializable

        # The ID of the hierarchy to query for the property ID. You can use the hierarchy's name instead of
        # the hierarchy's ID. If the hierarchy has an external ID, you can specify externalId: followed by the
        # external ID. For more information, see Using external IDs in the IoT SiteWise User Guide . You use a
        # hierarchy ID instead of a model ID because you can have several hierarchies using the same model and
        # therefore the same propertyId . For example, you might have separately grouped assets that come from
        # the same asset model. For more information, see Asset hierarchies in the IoT SiteWise User Guide .

        @[JSON::Field(key: "hierarchyId")]
        getter hierarchy_id : String?

        # The ID of the property to use as the variable. You can use the property name if it's from the same
        # asset model. If the property has an external ID, you can specify externalId: followed by the
        # external ID. For more information, see Using external IDs in the IoT SiteWise User Guide .

        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        # The path of the property.

        @[JSON::Field(key: "propertyPath")]
        getter property_path : Array(Types::AssetModelPropertyPathSegment)?

        def initialize(
          @hierarchy_id : String? = nil,
          @property_id : String? = nil,
          @property_path : Array(Types::AssetModelPropertyPathSegment)? = nil
        )
        end
      end

      # Contains an asset property value (of a single type only).

      struct Variant
        include JSON::Serializable

        # Asset property data of type Boolean (true or false).

        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # Asset property data of type double (floating point number). The min value is -10^10. The max value
        # is 10^10. Double.NaN is allowed.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # Asset property data of type integer (whole number).

        @[JSON::Field(key: "integerValue")]
        getter integer_value : Int32?

        # The type of null asset property data with BAD and UNCERTAIN qualities.

        @[JSON::Field(key: "nullValue")]
        getter null_value : Types::PropertyValueNullValue?

        # Asset property data of type string (sequence of characters). The allowed pattern:
        # "^$|[^\u0000-\u001F\u007F]+". The max length is 1024.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @integer_value : Int32? = nil,
          @null_value : Types::PropertyValueNullValue? = nil,
          @string_value : String? = nil
        )
        end
      end

      # Set this period to specify how long your data is stored in the warm tier before it is deleted. You
      # can set this only if cold tier is enabled.

      struct WarmTierRetentionPeriod
        include JSON::Serializable

        # The number of days the data is stored in the warm tier.

        @[JSON::Field(key: "numberOfDays")]
        getter number_of_days : Int32?

        # If set to true, the data is stored indefinitely in the warm tier.

        @[JSON::Field(key: "unlimited")]
        getter unlimited : Bool?

        def initialize(
          @number_of_days : Int32? = nil,
          @unlimited : Bool? = nil
        )
        end
      end
    end
  end
end
