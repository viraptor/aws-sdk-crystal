require "json"
require "time"

module AwsSdk
  module AmplifyUIBuilder
    module Types

      # Represents the event action configuration for an element of a Component or ComponentChild . Use for
      # the workflow feature in Amplify Studio that allows you to bind events and actions to components.
      # ActionParameters defines the action that is performed when an event occurs on the component.

      struct ActionParameters
        include JSON::Serializable

        # The HTML anchor link to the location to open. Specify this value for a navigation action.

        @[JSON::Field(key: "anchor")]
        getter anchor : Types::ComponentProperty?

        # A dictionary of key-value pairs mapping Amplify Studio properties to fields in a data model. Use
        # when the action performs an operation on an Amplify DataStore model.

        @[JSON::Field(key: "fields")]
        getter fields : Hash(String, Types::ComponentProperty)?

        # Specifies whether the user should be signed out globally. Specify this value for an auth sign out
        # action.

        @[JSON::Field(key: "global")]
        getter global : Types::ComponentProperty?

        # The unique ID of the component that the ActionParameters apply to.

        @[JSON::Field(key: "id")]
        getter id : Types::ComponentProperty?

        # The name of the data model. Use when the action performs an operation on an Amplify DataStore model.

        @[JSON::Field(key: "model")]
        getter model : String?

        # A key-value pair that specifies the state property name and its initial value.

        @[JSON::Field(key: "state")]
        getter state : Types::MutationActionSetStateParameter?

        # The element within the same component to modify when the action occurs.

        @[JSON::Field(key: "target")]
        getter target : Types::ComponentProperty?

        # The type of navigation action. Valid values are url and anchor . This value is required for a
        # navigation action.

        @[JSON::Field(key: "type")]
        getter type : Types::ComponentProperty?

        # The URL to the location to open. Specify this value for a navigation action.

        @[JSON::Field(key: "url")]
        getter url : Types::ComponentProperty?

        def initialize(
          @anchor : Types::ComponentProperty? = nil,
          @fields : Hash(String, Types::ComponentProperty)? = nil,
          @global : Types::ComponentProperty? = nil,
          @id : Types::ComponentProperty? = nil,
          @model : String? = nil,
          @state : Types::MutationActionSetStateParameter? = nil,
          @target : Types::ComponentProperty? = nil,
          @type : Types::ComponentProperty? = nil,
          @url : Types::ComponentProperty? = nil
        )
        end
      end

      # Describes the API configuration for a code generation job.

      struct ApiConfiguration
        include JSON::Serializable

        # The configuration for an application using DataStore APIs.

        @[JSON::Field(key: "dataStoreConfig")]
        getter data_store_config : Types::DataStoreRenderConfig?

        # The configuration for an application using GraphQL APIs.

        @[JSON::Field(key: "graphQLConfig")]
        getter graph_ql_config : Types::GraphQLRenderConfig?

        # The configuration for an application with no API being used.

        @[JSON::Field(key: "noApiConfig")]
        getter no_api_config : Types::NoApiRenderConfig?

        def initialize(
          @data_store_config : Types::DataStoreRenderConfig? = nil,
          @graph_ql_config : Types::GraphQLRenderConfig? = nil,
          @no_api_config : Types::NoApiRenderConfig? = nil
        )
        end
      end

      # Dependency package that may be required for the project code to run.

      struct CodegenDependency
        include JSON::Serializable

        # Determines if the dependency package is using Semantic versioning. If set to true, it indicates that
        # the dependency package uses Semantic versioning.

        @[JSON::Field(key: "isSemVer")]
        getter is_sem_ver : Bool?

        # Name of the dependency package.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates the reason to include the dependency package in your project code.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # Indicates the version of the supported dependency package.

        @[JSON::Field(key: "supportedVersion")]
        getter supported_version : String?

        def initialize(
          @is_sem_ver : Bool? = nil,
          @name : String? = nil,
          @reason : String? = nil,
          @supported_version : String? = nil
        )
        end
      end

      # Describes the feature flags that you can specify for a code generation job.

      struct CodegenFeatureFlags
        include JSON::Serializable

        # Specifies whether a code generation job supports non models.

        @[JSON::Field(key: "isNonModelSupported")]
        getter is_non_model_supported : Bool?

        # Specifes whether a code generation job supports data relationships.

        @[JSON::Field(key: "isRelationshipSupported")]
        getter is_relationship_supported : Bool?

        def initialize(
          @is_non_model_supported : Bool? = nil,
          @is_relationship_supported : Bool? = nil
        )
        end
      end

      # Describes the enums in a generic data schema.

      struct CodegenGenericDataEnum
        include JSON::Serializable

        # The list of enum values in the generic data schema.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @values : Array(String)
        )
        end
      end

      # Describes a field in a generic data schema.

      struct CodegenGenericDataField
        include JSON::Serializable

        # The data type for the generic data field.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The value of the data type for the generic data field.

        @[JSON::Field(key: "dataTypeValue")]
        getter data_type_value : String

        # Specifies whether the generic data field is an array.

        @[JSON::Field(key: "isArray")]
        getter is_array : Bool

        # Specifies whether the generic data field is read-only.

        @[JSON::Field(key: "readOnly")]
        getter read_only : Bool

        # Specifies whether the generic data field is required.

        @[JSON::Field(key: "required")]
        getter required : Bool

        # The relationship of the generic data schema.

        @[JSON::Field(key: "relationship")]
        getter relationship : Types::CodegenGenericDataRelationshipType?

        def initialize(
          @data_type : String,
          @data_type_value : String,
          @is_array : Bool,
          @read_only : Bool,
          @required : Bool,
          @relationship : Types::CodegenGenericDataRelationshipType? = nil
        )
        end
      end

      # Describes a model in a generic data schema.

      struct CodegenGenericDataModel
        include JSON::Serializable

        # The fields in the generic data model.

        @[JSON::Field(key: "fields")]
        getter fields : Hash(String, Types::CodegenGenericDataField)

        # The primary keys of the generic data model.

        @[JSON::Field(key: "primaryKeys")]
        getter primary_keys : Array(String)

        # Specifies whether the generic data model is a join table.

        @[JSON::Field(key: "isJoinTable")]
        getter is_join_table : Bool?

        def initialize(
          @fields : Hash(String, Types::CodegenGenericDataField),
          @primary_keys : Array(String),
          @is_join_table : Bool? = nil
        )
        end
      end

      # Describes a non-model in a generic data schema.

      struct CodegenGenericDataNonModel
        include JSON::Serializable

        # The fields in a generic data schema non model.

        @[JSON::Field(key: "fields")]
        getter fields : Hash(String, Types::CodegenGenericDataField)

        def initialize(
          @fields : Hash(String, Types::CodegenGenericDataField)
        )
        end
      end

      # Describes the relationship between generic data models.

      struct CodegenGenericDataRelationshipType
        include JSON::Serializable

        # The name of the related model in the data relationship.

        @[JSON::Field(key: "relatedModelName")]
        getter related_model_name : String

        # The data relationship type.

        @[JSON::Field(key: "type")]
        getter type : String

        # The associated fields of the data relationship.

        @[JSON::Field(key: "associatedFields")]
        getter associated_fields : Array(String)?

        # The value of the belongsTo field on the related data model.

        @[JSON::Field(key: "belongsToFieldOnRelatedModel")]
        getter belongs_to_field_on_related_model : String?

        # Specifies whether the relationship can unlink the associated model.

        @[JSON::Field(key: "canUnlinkAssociatedModel")]
        getter can_unlink_associated_model : Bool?

        # Specifies whether the @index directive is supported for a hasMany data relationship.

        @[JSON::Field(key: "isHasManyIndex")]
        getter is_has_many_index : Bool?

        # The name of the related join field in the data relationship.

        @[JSON::Field(key: "relatedJoinFieldName")]
        getter related_join_field_name : String?

        # The name of the related join table in the data relationship.

        @[JSON::Field(key: "relatedJoinTableName")]
        getter related_join_table_name : String?

        # The related model fields in the data relationship.

        @[JSON::Field(key: "relatedModelFields")]
        getter related_model_fields : Array(String)?

        def initialize(
          @related_model_name : String,
          @type : String,
          @associated_fields : Array(String)? = nil,
          @belongs_to_field_on_related_model : String? = nil,
          @can_unlink_associated_model : Bool? = nil,
          @is_has_many_index : Bool? = nil,
          @related_join_field_name : String? = nil,
          @related_join_table_name : String? = nil,
          @related_model_fields : Array(String)? = nil
        )
        end
      end

      # Describes the configuration for a code generation job that is associated with an Amplify app.

      struct CodegenJob
        include JSON::Serializable

        # The ID of the Amplify app associated with the code generation job.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment associated with the code generation job.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID for the code generation job.

        @[JSON::Field(key: "id")]
        getter id : String

        # The CodegenJobAsset to use for the code generation job.

        @[JSON::Field(key: "asset")]
        getter asset : Types::CodegenJobAsset?

        # Specifies whether to autogenerate forms in the code generation job.

        @[JSON::Field(key: "autoGenerateForms")]
        getter auto_generate_forms : Bool?

        # The time that the code generation job was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Lists the dependency packages that may be required for the project code to run.

        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(Types::CodegenDependency)?


        @[JSON::Field(key: "features")]
        getter features : Types::CodegenFeatureFlags?


        @[JSON::Field(key: "genericDataSchema")]
        getter generic_data_schema : Types::CodegenJobGenericDataSchema?

        # The time that the code generation job was modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "renderConfig")]
        getter render_config : Types::CodegenJobRenderConfig?

        # The status of the code generation job.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The customized status message for the code generation job.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # One or more key-value pairs to use when tagging the code generation job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String,
          @asset : Types::CodegenJobAsset? = nil,
          @auto_generate_forms : Bool? = nil,
          @created_at : Time? = nil,
          @dependencies : Array(Types::CodegenDependency)? = nil,
          @features : Types::CodegenFeatureFlags? = nil,
          @generic_data_schema : Types::CodegenJobGenericDataSchema? = nil,
          @modified_at : Time? = nil,
          @render_config : Types::CodegenJobRenderConfig? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes an asset for a code generation job.

      struct CodegenJobAsset
        include JSON::Serializable

        # The URL to use to access the asset.

        @[JSON::Field(key: "downloadUrl")]
        getter download_url : String?

        def initialize(
          @download_url : String? = nil
        )
        end
      end

      # Describes the data schema for a code generation job.

      struct CodegenJobGenericDataSchema
        include JSON::Serializable

        # The type of the data source for the schema. Currently, the only valid value is an Amplify DataStore
        # .

        @[JSON::Field(key: "dataSourceType")]
        getter data_source_type : String

        # The name of a CodegenGenericDataEnum .

        @[JSON::Field(key: "enums")]
        getter enums : Hash(String, Types::CodegenGenericDataEnum)

        # The name of a CodegenGenericDataModel .

        @[JSON::Field(key: "models")]
        getter models : Hash(String, Types::CodegenGenericDataModel)

        # The name of a CodegenGenericDataNonModel .

        @[JSON::Field(key: "nonModels")]
        getter non_models : Hash(String, Types::CodegenGenericDataNonModel)

        def initialize(
          @data_source_type : String,
          @enums : Hash(String, Types::CodegenGenericDataEnum),
          @models : Hash(String, Types::CodegenGenericDataModel),
          @non_models : Hash(String, Types::CodegenGenericDataNonModel)
        )
        end
      end

      # Describes the configuration information for rendering the UI component associated with the code
      # generation job.

      struct CodegenJobRenderConfig
        include JSON::Serializable

        # The name of the ReactStartCodegenJobData object.

        @[JSON::Field(key: "react")]
        getter react : Types::ReactStartCodegenJobData?

        def initialize(
          @react : Types::ReactStartCodegenJobData? = nil
        )
        end
      end

      # A summary of the basic information about the code generation job.

      struct CodegenJobSummary
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the code generation job.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment associated with the code generation job.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID for the code generation job summary.

        @[JSON::Field(key: "id")]
        getter id : String

        # The time that the code generation job summary was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The time that the code generation job summary was modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String,
          @created_at : Time? = nil,
          @modified_at : Time? = nil
        )
        end
      end

      # Contains the configuration settings for a user interface (UI) element for an Amplify app. A
      # component is configured as a primary, stand-alone UI element. Use ComponentChild to configure an
      # instance of a Component . A ComponentChild instance inherits the configuration of the main Component
      # .

      struct Component
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the component.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The information to connect a component's properties to data at runtime. You can't specify tags as a
        # valid property for bindingProperties .

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Hash(String, Types::ComponentBindingPropertiesValue)

        # The type of the component. This can be an Amplify custom UI component or another custom component.

        @[JSON::Field(key: "componentType")]
        getter component_type : String

        # The time that the component was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the component.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String

        # Describes the component's properties that can be overriden in a customized instance of the
        # component. You can't specify tags as a valid property for overrides .

        @[JSON::Field(key: "overrides")]
        getter overrides : Hash(String, Hash(String, String))

        # Describes the component's properties. You can't specify tags as a valid property for properties .

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::ComponentProperty)

        # A list of the component's variants. A variant is a unique style configuration of a main component.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::ComponentVariant)

        # A list of the component's ComponentChild instances.

        @[JSON::Field(key: "children")]
        getter children : Array(Types::ComponentChild)?

        # The data binding configuration for the component's properties. Use this for a collection component.
        # You can't specify tags as a valid property for collectionProperties .

        @[JSON::Field(key: "collectionProperties")]
        getter collection_properties : Hash(String, Types::ComponentDataConfiguration)?

        # Describes the events that can be raised on the component. Use for the workflow feature in Amplify
        # Studio that allows you to bind events and actions to components.

        @[JSON::Field(key: "events")]
        getter events : Hash(String, Types::ComponentEvent)?

        # The time that the component was modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The schema version of the component when it was imported.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        # The unique ID of the component in its original source system, such as Figma.

        @[JSON::Field(key: "sourceId")]
        getter source_id : String?

        # One or more key-value pairs to use when tagging the component.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_id : String,
          @binding_properties : Hash(String, Types::ComponentBindingPropertiesValue),
          @component_type : String,
          @created_at : Time,
          @environment_name : String,
          @id : String,
          @name : String,
          @overrides : Hash(String, Hash(String, String)),
          @properties : Hash(String, Types::ComponentProperty),
          @variants : Array(Types::ComponentVariant),
          @children : Array(Types::ComponentChild)? = nil,
          @collection_properties : Hash(String, Types::ComponentDataConfiguration)? = nil,
          @events : Hash(String, Types::ComponentEvent)? = nil,
          @modified_at : Time? = nil,
          @schema_version : String? = nil,
          @source_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the data binding configuration for a component at runtime. You can use
      # ComponentBindingPropertiesValue to add exposed properties to a component to allow different values
      # to be entered when a component is reused in different places in an app.

      struct ComponentBindingPropertiesValue
        include JSON::Serializable

        # Describes the properties to customize with data at runtime.

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Types::ComponentBindingPropertiesValueProperties?

        # The default value of the property.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The property type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @binding_properties : Types::ComponentBindingPropertiesValueProperties? = nil,
          @default_value : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the data binding configuration for a specific property using data stored in Amazon Web
      # Services. For Amazon Web Services connected properties, you can bind a property to data stored in an
      # Amazon S3 bucket, an Amplify DataStore model or an authenticated user attribute.

      struct ComponentBindingPropertiesValueProperties
        include JSON::Serializable

        # An Amazon S3 bucket.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The default value to assign to the property.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The field to bind the data to.

        @[JSON::Field(key: "field")]
        getter field : String?

        # The storage key for an Amazon S3 bucket.

        @[JSON::Field(key: "key")]
        getter key : String?

        # An Amplify DataStore model.

        @[JSON::Field(key: "model")]
        getter model : String?

        # A list of predicates for binding a component's properties to data.

        @[JSON::Field(key: "predicates")]
        getter predicates : Array(Types::Predicate)?

        # The name of a component slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String?

        # An authenticated user attribute.

        @[JSON::Field(key: "userAttribute")]
        getter user_attribute : String?

        def initialize(
          @bucket : String? = nil,
          @default_value : String? = nil,
          @field : String? = nil,
          @key : String? = nil,
          @model : String? = nil,
          @predicates : Array(Types::Predicate)? = nil,
          @slot_name : String? = nil,
          @user_attribute : String? = nil
        )
        end
      end

      # A nested UI configuration within a parent Component .

      struct ComponentChild
        include JSON::Serializable

        # The type of the child component.

        @[JSON::Field(key: "componentType")]
        getter component_type : String

        # The name of the child component.

        @[JSON::Field(key: "name")]
        getter name : String

        # Describes the properties of the child component. You can't specify tags as a valid property for
        # properties .

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::ComponentProperty)

        # The list of ComponentChild instances for this component.

        @[JSON::Field(key: "children")]
        getter children : Array(Types::ComponentChild)?

        # Describes the events that can be raised on the child component. Use for the workflow feature in
        # Amplify Studio that allows you to bind events and actions to components.

        @[JSON::Field(key: "events")]
        getter events : Hash(String, Types::ComponentEvent)?

        # The unique ID of the child component in its original source system, such as Figma.

        @[JSON::Field(key: "sourceId")]
        getter source_id : String?

        def initialize(
          @component_type : String,
          @name : String,
          @properties : Hash(String, Types::ComponentProperty),
          @children : Array(Types::ComponentChild)? = nil,
          @events : Hash(String, Types::ComponentEvent)? = nil,
          @source_id : String? = nil
        )
        end
      end

      # Represents a conditional expression to set a component property. Use ComponentConditionProperty to
      # set a property to different values conditionally, based on the value of another property.

      struct ComponentConditionProperty
        include JSON::Serializable

        # The value to assign to the property if the condition is not met.

        @[JSON::Field(key: "else")]
        getter else : Types::ComponentProperty?

        # The name of a field. Specify this when the property is a data model.

        @[JSON::Field(key: "field")]
        getter field : String?

        # The value of the property to evaluate.

        @[JSON::Field(key: "operand")]
        getter operand : String?

        # The type of the property to evaluate.

        @[JSON::Field(key: "operandType")]
        getter operand_type : String?

        # The operator to use to perform the evaluation, such as eq to represent equals.

        @[JSON::Field(key: "operator")]
        getter operator : String?

        # The name of the conditional property.

        @[JSON::Field(key: "property")]
        getter property : String?

        # The value to assign to the property if the condition is met.

        @[JSON::Field(key: "then")]
        getter then : Types::ComponentProperty?

        def initialize(
          @else : Types::ComponentProperty? = nil,
          @field : String? = nil,
          @operand : String? = nil,
          @operand_type : String? = nil,
          @operator : String? = nil,
          @property : String? = nil,
          @then : Types::ComponentProperty? = nil
        )
        end
      end

      # Describes the configuration for binding a component's properties to data.

      struct ComponentDataConfiguration
        include JSON::Serializable

        # The name of the data model to use to bind data to a component.

        @[JSON::Field(key: "model")]
        getter model : String

        # A list of IDs to use to bind data to a component. Use this property to bind specifically chosen
        # data, rather than data retrieved from a query.

        @[JSON::Field(key: "identifiers")]
        getter identifiers : Array(String)?

        # Represents the conditional logic to use when binding data to a component. Use this property to
        # retrieve only a subset of the data in a collection.

        @[JSON::Field(key: "predicate")]
        getter predicate : Types::Predicate?

        # Describes how to sort the component's properties.

        @[JSON::Field(key: "sort")]
        getter sort : Array(Types::SortProperty)?

        def initialize(
          @model : String,
          @identifiers : Array(String)? = nil,
          @predicate : Types::Predicate? = nil,
          @sort : Array(Types::SortProperty)? = nil
        )
        end
      end

      # Describes the configuration of an event. You can bind an event and a corresponding action to a
      # Component or a ComponentChild . A button click is an example of an event.

      struct ComponentEvent
        include JSON::Serializable

        # The action to perform when a specific event is raised.

        @[JSON::Field(key: "action")]
        getter action : String?

        # Binds an event to an action on a component. When you specify a bindingEvent , the event is called
        # when the action is performed.

        @[JSON::Field(key: "bindingEvent")]
        getter binding_event : String?

        # Describes information about the action.

        @[JSON::Field(key: "parameters")]
        getter parameters : Types::ActionParameters?

        def initialize(
          @action : String? = nil,
          @binding_event : String? = nil,
          @parameters : Types::ActionParameters? = nil
        )
        end
      end

      # Describes the configuration for all of a component's properties. Use ComponentProperty to specify
      # the values to render or bind by default.

      struct ComponentProperty
        include JSON::Serializable

        # The information to bind the component property to data at runtime.

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Types::ComponentPropertyBindingProperties?

        # The information to bind the component property to form data.

        @[JSON::Field(key: "bindings")]
        getter bindings : Hash(String, Types::FormBindingElement)?

        # The information to bind the component property to data at runtime. Use this for collection
        # components.

        @[JSON::Field(key: "collectionBindingProperties")]
        getter collection_binding_properties : Types::ComponentPropertyBindingProperties?

        # The name of the component that is affected by an event.

        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # A list of component properties to concatenate to create the value to assign to this component
        # property.

        @[JSON::Field(key: "concat")]
        getter concat : Array(Types::ComponentProperty)?

        # The conditional expression to use to assign a value to the component property.

        @[JSON::Field(key: "condition")]
        getter condition : Types::ComponentConditionProperty?

        # Specifies whether the user configured the property in Amplify Studio after importing it.

        @[JSON::Field(key: "configured")]
        getter configured : Bool?

        # The default value to assign to the component property.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # An event that occurs in your app. Use this for workflow data binding.

        @[JSON::Field(key: "event")]
        getter event : String?

        # The default value assigned to the property when the component is imported into an app.

        @[JSON::Field(key: "importedValue")]
        getter imported_value : String?

        # The data model to use to assign a value to the component property.

        @[JSON::Field(key: "model")]
        getter model : String?

        # The name of the component's property that is affected by an event.

        @[JSON::Field(key: "property")]
        getter property : String?

        # The component type.

        @[JSON::Field(key: "type")]
        getter type : String?

        # An authenticated user attribute to use to assign a value to the component property.

        @[JSON::Field(key: "userAttribute")]
        getter user_attribute : String?

        # The value to assign to the component property.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @binding_properties : Types::ComponentPropertyBindingProperties? = nil,
          @bindings : Hash(String, Types::FormBindingElement)? = nil,
          @collection_binding_properties : Types::ComponentPropertyBindingProperties? = nil,
          @component_name : String? = nil,
          @concat : Array(Types::ComponentProperty)? = nil,
          @condition : Types::ComponentConditionProperty? = nil,
          @configured : Bool? = nil,
          @default_value : String? = nil,
          @event : String? = nil,
          @imported_value : String? = nil,
          @model : String? = nil,
          @property : String? = nil,
          @type : String? = nil,
          @user_attribute : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Associates a component property to a binding property. This enables exposed properties on the top
      # level component to propagate data to the component's property values.

      struct ComponentPropertyBindingProperties
        include JSON::Serializable

        # The component property to bind to the data field.

        @[JSON::Field(key: "property")]
        getter property : String

        # The data field to bind the property to.

        @[JSON::Field(key: "field")]
        getter field : String?

        def initialize(
          @property : String,
          @field : String? = nil
        )
        end
      end

      # Contains a summary of a component. This is a read-only data type that is returned by ListComponents
      # .

      struct ComponentSummary
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the component.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The component type.

        @[JSON::Field(key: "componentType")]
        getter component_type : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the component.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @app_id : String,
          @component_type : String,
          @environment_name : String,
          @id : String,
          @name : String
        )
        end
      end

      # Describes the style configuration of a unique variation of a main component.

      struct ComponentVariant
        include JSON::Serializable

        # The properties of the component variant that can be overriden when customizing an instance of the
        # component. You can't specify tags as a valid property for overrides .

        @[JSON::Field(key: "overrides")]
        getter overrides : Hash(String, Hash(String, String))?

        # The combination of variants that comprise this variant. You can't specify tags as a valid property
        # for variantValues .

        @[JSON::Field(key: "variantValues")]
        getter variant_values : Hash(String, String)?

        def initialize(
          @overrides : Hash(String, Hash(String, String))? = nil,
          @variant_values : Hash(String, String)? = nil
        )
        end
      end

      # Represents all of the information that is required to create a component.

      struct CreateComponentData
        include JSON::Serializable

        # The data binding information for the component's properties.

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Hash(String, Types::ComponentBindingPropertiesValue)

        # The component type. This can be an Amplify custom UI component or another custom component.

        @[JSON::Field(key: "componentType")]
        getter component_type : String

        # The name of the component

        @[JSON::Field(key: "name")]
        getter name : String

        # Describes the component properties that can be overriden to customize an instance of the component.

        @[JSON::Field(key: "overrides")]
        getter overrides : Hash(String, Hash(String, String))

        # Describes the component's properties.

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::ComponentProperty)

        # A list of the unique variants of this component.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::ComponentVariant)

        # A list of child components that are instances of the main component.

        @[JSON::Field(key: "children")]
        getter children : Array(Types::ComponentChild)?

        # The data binding configuration for customizing a component's properties. Use this for a collection
        # component.

        @[JSON::Field(key: "collectionProperties")]
        getter collection_properties : Hash(String, Types::ComponentDataConfiguration)?

        # The event configuration for the component. Use for the workflow feature in Amplify Studio that
        # allows you to bind events and actions to components.

        @[JSON::Field(key: "events")]
        getter events : Hash(String, Types::ComponentEvent)?

        # The schema version of the component when it was imported.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        # The unique ID of the component in its original source system, such as Figma.

        @[JSON::Field(key: "sourceId")]
        getter source_id : String?

        # One or more key-value pairs to use when tagging the component data.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @binding_properties : Hash(String, Types::ComponentBindingPropertiesValue),
          @component_type : String,
          @name : String,
          @overrides : Hash(String, Hash(String, String)),
          @properties : Hash(String, Types::ComponentProperty),
          @variants : Array(Types::ComponentVariant),
          @children : Array(Types::ComponentChild)? = nil,
          @collection_properties : Hash(String, Types::ComponentDataConfiguration)? = nil,
          @events : Hash(String, Types::ComponentEvent)? = nil,
          @schema_version : String? = nil,
          @source_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateComponentRequest
        include JSON::Serializable

        # The unique ID of the Amplify app to associate with the component.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # Represents the configuration of the component to create.

        @[JSON::Field(key: "componentToCreate")]
        getter component_to_create : Types::CreateComponentData

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_id : String,
          @component_to_create : Types::CreateComponentData,
          @environment_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateComponentResponse
        include JSON::Serializable

        # Describes the configuration of the new component.

        @[JSON::Field(key: "entity")]
        getter entity : Types::Component?

        def initialize(
          @entity : Types::Component? = nil
        )
        end
      end

      # Represents all of the information that is required to create a form.

      struct CreateFormData
        include JSON::Serializable

        # The type of data source to use to create the form.

        @[JSON::Field(key: "dataType")]
        getter data_type : Types::FormDataTypeConfig

        # The configuration information for the form's fields.

        @[JSON::Field(key: "fields")]
        getter fields : Hash(String, Types::FieldConfig)

        # Specifies whether to perform a create or update action on the form.

        @[JSON::Field(key: "formActionType")]
        getter form_action_type : String

        # The name of the form.

        @[JSON::Field(key: "name")]
        getter name : String

        # The schema version of the form.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # The configuration information for the visual helper elements for the form. These elements are not
        # associated with any data.

        @[JSON::Field(key: "sectionalElements")]
        getter sectional_elements : Hash(String, Types::SectionalElement)

        # The configuration for the form's style.

        @[JSON::Field(key: "style")]
        getter style : Types::FormStyle

        # The FormCTA object that stores the call to action configuration for the form.

        @[JSON::Field(key: "cta")]
        getter cta : Types::FormCTA?

        # Specifies an icon or decoration to display on the form.

        @[JSON::Field(key: "labelDecorator")]
        getter label_decorator : String?

        # One or more key-value pairs to use when tagging the form data.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @data_type : Types::FormDataTypeConfig,
          @fields : Hash(String, Types::FieldConfig),
          @form_action_type : String,
          @name : String,
          @schema_version : String,
          @sectional_elements : Hash(String, Types::SectionalElement),
          @style : Types::FormStyle,
          @cta : Types::FormCTA? = nil,
          @label_decorator : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFormRequest
        include JSON::Serializable

        # The unique ID of the Amplify app to associate with the form.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # Represents the configuration of the form to create.

        @[JSON::Field(key: "formToCreate")]
        getter form_to_create : Types::CreateFormData

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @form_to_create : Types::CreateFormData,
          @client_token : String? = nil
        )
        end
      end


      struct CreateFormResponse
        include JSON::Serializable

        # Describes the configuration of the new form.

        @[JSON::Field(key: "entity")]
        getter entity : Types::Form?

        def initialize(
          @entity : Types::Form? = nil
        )
        end
      end

      # Represents all of the information that is required to create a theme.

      struct CreateThemeData
        include JSON::Serializable

        # The name of the theme.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of key-value pairs that deﬁnes the properties of the theme.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::ThemeValues)

        # Describes the properties that can be overriden to customize an instance of the theme.

        @[JSON::Field(key: "overrides")]
        getter overrides : Array(Types::ThemeValues)?

        # One or more key-value pairs to use when tagging the theme data.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @values : Array(Types::ThemeValues),
          @overrides : Array(Types::ThemeValues)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateThemeRequest
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the theme.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # Represents the configuration of the theme to create.

        @[JSON::Field(key: "themeToCreate")]
        getter theme_to_create : Types::CreateThemeData

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @theme_to_create : Types::CreateThemeData,
          @client_token : String? = nil
        )
        end
      end


      struct CreateThemeResponse
        include JSON::Serializable

        # Describes the configuration of the new theme.

        @[JSON::Field(key: "entity")]
        getter entity : Types::Theme?

        def initialize(
          @entity : Types::Theme? = nil
        )
        end
      end

      # Describes the DataStore configuration for an API for a code generation job.

      struct DataStoreRenderConfig
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteComponentRequest
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the component to delete.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the component to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String
        )
        end
      end


      struct DeleteFormRequest
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the form to delete.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the form to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String
        )
        end
      end


      struct DeleteThemeRequest
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the theme to delete.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the theme to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String
        )
        end
      end


      struct ExchangeCodeForTokenRequest
        include JSON::Serializable

        # The third-party provider for the token. The only valid value is figma .

        @[JSON::Field(key: "provider")]
        getter provider : String

        # Describes the configuration of the request.

        @[JSON::Field(key: "request")]
        getter request : Types::ExchangeCodeForTokenRequestBody

        def initialize(
          @provider : String,
          @request : Types::ExchangeCodeForTokenRequestBody
        )
        end
      end

      # Describes the configuration of a request to exchange an access code for a token.

      struct ExchangeCodeForTokenRequestBody
        include JSON::Serializable

        # The access code to send in the request.

        @[JSON::Field(key: "code")]
        getter code : String

        # The location of the application that will receive the access code.

        @[JSON::Field(key: "redirectUri")]
        getter redirect_uri : String

        # The ID of the client to request the token from.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @code : String,
          @redirect_uri : String,
          @client_id : String? = nil
        )
        end
      end


      struct ExchangeCodeForTokenResponse
        include JSON::Serializable

        # The access token.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String

        # The date and time when the new access token expires.

        @[JSON::Field(key: "expiresIn")]
        getter expires_in : Int32

        # The token to use to refresh a previously issued access token that might have expired.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String

        def initialize(
          @access_token : String,
          @expires_in : Int32,
          @refresh_token : String
        )
        end
      end


      struct ExportComponentsRequest
        include JSON::Serializable

        # The unique ID of the Amplify app to export components to.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ExportComponentsResponse
        include JSON::Serializable

        # Represents the configuration of the exported components.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::Component)

        # The pagination token that's included if more results are available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::Component),
          @next_token : String? = nil
        )
        end
      end


      struct ExportFormsRequest
        include JSON::Serializable

        # The unique ID of the Amplify app to export forms to.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ExportFormsResponse
        include JSON::Serializable

        # Represents the configuration of the exported forms.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::Form)

        # The pagination token that's included if more results are available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::Form),
          @next_token : String? = nil
        )
        end
      end


      struct ExportThemesRequest
        include JSON::Serializable

        # The unique ID of the Amplify app to export the themes to.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ExportThemesResponse
        include JSON::Serializable

        # Represents the configuration of the exported themes.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::Theme)

        # The pagination token that's included if more results are available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::Theme),
          @next_token : String? = nil
        )
        end
      end

      # Describes the configuration information for a field in a table.

      struct FieldConfig
        include JSON::Serializable

        # Specifies whether to hide a field.

        @[JSON::Field(key: "excluded")]
        getter excluded : Bool?

        # Describes the configuration for the default input value to display for a field.

        @[JSON::Field(key: "inputType")]
        getter input_type : Types::FieldInputConfig?

        # The label for the field.

        @[JSON::Field(key: "label")]
        getter label : String?

        # Specifies the field position.

        @[JSON::Field(key: "position")]
        getter position : Types::FieldPosition?

        # The validations to perform on the value in the field.

        @[JSON::Field(key: "validations")]
        getter validations : Array(Types::FieldValidationConfiguration)?

        def initialize(
          @excluded : Bool? = nil,
          @input_type : Types::FieldInputConfig? = nil,
          @label : String? = nil,
          @position : Types::FieldPosition? = nil,
          @validations : Array(Types::FieldValidationConfiguration)? = nil
        )
        end
      end

      # Describes the configuration for the default input values to display for a field.

      struct FieldInputConfig
        include JSON::Serializable

        # The input type for the field.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies whether a field has a default value.

        @[JSON::Field(key: "defaultChecked")]
        getter default_checked : Bool?

        # The default country code for a phone number.

        @[JSON::Field(key: "defaultCountryCode")]
        getter default_country_code : String?

        # The default value for the field.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The text to display to describe the field.

        @[JSON::Field(key: "descriptiveText")]
        getter descriptive_text : String?

        # The configuration for the file uploader field.

        @[JSON::Field(key: "fileUploaderConfig")]
        getter file_uploader_config : Types::FileUploaderFieldConfig?

        # Specifies whether to render the field as an array. This property is ignored if the dataSourceType
        # for the form is a Data Store.

        @[JSON::Field(key: "isArray")]
        getter is_array : Bool?

        # The maximum value to display for the field.

        @[JSON::Field(key: "maxValue")]
        getter max_value : Float64?

        # The minimum value to display for the field.

        @[JSON::Field(key: "minValue")]
        getter min_value : Float64?

        # The name of the field.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The text to display as a placeholder for the field.

        @[JSON::Field(key: "placeholder")]
        getter placeholder : String?

        # Specifies a read only field.

        @[JSON::Field(key: "readOnly")]
        getter read_only : Bool?

        # Specifies a field that requires input.

        @[JSON::Field(key: "required")]
        getter required : Bool?

        # The stepping increment for a numeric value in a field.

        @[JSON::Field(key: "step")]
        getter step : Float64?

        # The value for the field.

        @[JSON::Field(key: "value")]
        getter value : String?

        # The information to use to customize the input fields with data at runtime.

        @[JSON::Field(key: "valueMappings")]
        getter value_mappings : Types::ValueMappings?

        def initialize(
          @type : String,
          @default_checked : Bool? = nil,
          @default_country_code : String? = nil,
          @default_value : String? = nil,
          @descriptive_text : String? = nil,
          @file_uploader_config : Types::FileUploaderFieldConfig? = nil,
          @is_array : Bool? = nil,
          @max_value : Float64? = nil,
          @min_value : Float64? = nil,
          @name : String? = nil,
          @placeholder : String? = nil,
          @read_only : Bool? = nil,
          @required : Bool? = nil,
          @step : Float64? = nil,
          @value : String? = nil,
          @value_mappings : Types::ValueMappings? = nil
        )
        end
      end

      # Describes the field position.

      struct FieldPosition
        include JSON::Serializable

        # The field position is below the field specified by the string.

        @[JSON::Field(key: "below")]
        getter below : String?

        # The field position is fixed and doesn't change in relation to other fields.

        @[JSON::Field(key: "fixed")]
        getter fixed : String?

        # The field position is to the right of the field specified by the string.

        @[JSON::Field(key: "rightOf")]
        getter right_of : String?

        def initialize(
          @below : String? = nil,
          @fixed : String? = nil,
          @right_of : String? = nil
        )
        end
      end

      # Describes the validation configuration for a field.

      struct FieldValidationConfiguration
        include JSON::Serializable

        # The validation to perform on an object type.

        @[JSON::Field(key: "type")]
        getter type : String

        # The validation to perform on a number value.

        @[JSON::Field(key: "numValues")]
        getter num_values : Array(Int32)?

        # The validation to perform on a string value.

        @[JSON::Field(key: "strValues")]
        getter str_values : Array(String)?

        # The validation message to display.

        @[JSON::Field(key: "validationMessage")]
        getter validation_message : String?

        def initialize(
          @type : String,
          @num_values : Array(Int32)? = nil,
          @str_values : Array(String)? = nil,
          @validation_message : String? = nil
        )
        end
      end

      # Describes the configuration for the file uploader field.

      struct FileUploaderFieldConfig
        include JSON::Serializable

        # The file types that are allowed to be uploaded by the file uploader. Provide this information in an
        # array of strings specifying the valid file extensions.

        @[JSON::Field(key: "acceptedFileTypes")]
        getter accepted_file_types : Array(String)

        # The access level to assign to the uploaded files in the Amazon S3 bucket where they are stored. The
        # valid values for this property are private , protected , or public . For detailed information about
        # the permissions associated with each access level, see File access levels in the Amplify
        # documentation .

        @[JSON::Field(key: "accessLevel")]
        getter access_level : String

        # Allows the file upload operation to be paused and resumed. The default value is false . When
        # isResumable is set to true , the file uploader uses a multipart upload to break the files into
        # chunks before upload. The progress of the upload isn't continuous, because the file uploader uploads
        # a chunk at a time.

        @[JSON::Field(key: "isResumable")]
        getter is_resumable : Bool?

        # Specifies the maximum number of files that can be selected to upload. The default value is an
        # unlimited number of files.

        @[JSON::Field(key: "maxFileCount")]
        getter max_file_count : Int32?

        # The maximum file size in bytes that the file uploader will accept. The default value is an unlimited
        # file size.

        @[JSON::Field(key: "maxSize")]
        getter max_size : Int32?

        # Specifies whether to display or hide the image preview after selecting a file for upload. The
        # default value is true to display the image preview.

        @[JSON::Field(key: "showThumbnails")]
        getter show_thumbnails : Bool?

        def initialize(
          @accepted_file_types : Array(String),
          @access_level : String,
          @is_resumable : Bool? = nil,
          @max_file_count : Int32? = nil,
          @max_size : Int32? = nil,
          @show_thumbnails : Bool? = nil
        )
        end
      end

      # Contains the configuration settings for a Form user interface (UI) element for an Amplify app. A
      # form is a component you can add to your project by specifying a data source as the default
      # configuration for the form.

      struct Form
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the form.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The type of data source to use to create the form.

        @[JSON::Field(key: "dataType")]
        getter data_type : Types::FormDataTypeConfig

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # Stores the information about the form's fields.

        @[JSON::Field(key: "fields")]
        getter fields : Hash(String, Types::FieldConfig)

        # The operation to perform on the specified form.

        @[JSON::Field(key: "formActionType")]
        getter form_action_type : String

        # The unique ID of the form.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the form.

        @[JSON::Field(key: "name")]
        getter name : String

        # The schema version of the form when it was imported.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # Stores the visual helper elements for the form that are not associated with any data.

        @[JSON::Field(key: "sectionalElements")]
        getter sectional_elements : Hash(String, Types::SectionalElement)

        # Stores the configuration for the form's style.

        @[JSON::Field(key: "style")]
        getter style : Types::FormStyle

        # Stores the call to action configuration for the form.

        @[JSON::Field(key: "cta")]
        getter cta : Types::FormCTA?

        # Specifies an icon or decoration to display on the form.

        @[JSON::Field(key: "labelDecorator")]
        getter label_decorator : String?

        # One or more key-value pairs to use when tagging the form.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_id : String,
          @data_type : Types::FormDataTypeConfig,
          @environment_name : String,
          @fields : Hash(String, Types::FieldConfig),
          @form_action_type : String,
          @id : String,
          @name : String,
          @schema_version : String,
          @sectional_elements : Hash(String, Types::SectionalElement),
          @style : Types::FormStyle,
          @cta : Types::FormCTA? = nil,
          @label_decorator : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes how to bind a component property to form data.

      struct FormBindingElement
        include JSON::Serializable

        # The name of the component to retrieve a value from.

        @[JSON::Field(key: "element")]
        getter element : String

        # The property to retrieve a value from.

        @[JSON::Field(key: "property")]
        getter property : String

        def initialize(
          @element : String,
          @property : String
        )
        end
      end

      # Describes the configuration for a button UI element that is a part of a form.

      struct FormButton
        include JSON::Serializable

        # Describes the button's properties.

        @[JSON::Field(key: "children")]
        getter children : String?

        # Specifies whether the button is visible on the form.

        @[JSON::Field(key: "excluded")]
        getter excluded : Bool?

        # The position of the button.

        @[JSON::Field(key: "position")]
        getter position : Types::FieldPosition?

        def initialize(
          @children : String? = nil,
          @excluded : Bool? = nil,
          @position : Types::FieldPosition? = nil
        )
        end
      end

      # Describes the call to action button configuration for the form.

      struct FormCTA
        include JSON::Serializable

        # Displays a cancel button.

        @[JSON::Field(key: "cancel")]
        getter cancel : Types::FormButton?

        # Displays a clear button.

        @[JSON::Field(key: "clear")]
        getter clear : Types::FormButton?

        # The position of the button.

        @[JSON::Field(key: "position")]
        getter position : String?

        # Displays a submit button.

        @[JSON::Field(key: "submit")]
        getter submit : Types::FormButton?

        def initialize(
          @cancel : Types::FormButton? = nil,
          @clear : Types::FormButton? = nil,
          @position : String? = nil,
          @submit : Types::FormButton? = nil
        )
        end
      end

      # Describes the data type configuration for the data source associated with a form.

      struct FormDataTypeConfig
        include JSON::Serializable

        # The data source type, either an Amplify DataStore model or a custom data type.

        @[JSON::Field(key: "dataSourceType")]
        getter data_source_type : String

        # The unique name of the data type you are using as the data source for the form.

        @[JSON::Field(key: "dataTypeName")]
        getter data_type_name : String

        def initialize(
          @data_source_type : String,
          @data_type_name : String
        )
        end
      end

      # Represents the data binding configuration for a form's input fields at runtime.You can use
      # FormInputBindingPropertiesValue to add exposed properties to a form to allow different values to be
      # entered when a form is reused in different places in an app.

      struct FormInputBindingPropertiesValue
        include JSON::Serializable

        # Describes the properties to customize with data at runtime.

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Types::FormInputBindingPropertiesValueProperties?

        # The property type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @binding_properties : Types::FormInputBindingPropertiesValueProperties? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the data binding configuration for a specific property using data stored in Amazon Web
      # Services. For Amazon Web Services connected properties, you can bind a property to data stored in an
      # Amplify DataStore model.

      struct FormInputBindingPropertiesValueProperties
        include JSON::Serializable

        # An Amplify DataStore model.

        @[JSON::Field(key: "model")]
        getter model : String?

        def initialize(
          @model : String? = nil
        )
        end
      end

      # Describes the configuration for an input field on a form. Use FormInputValueProperty to specify the
      # values to render or bind by default.

      struct FormInputValueProperty
        include JSON::Serializable

        # The information to bind fields to data at runtime.

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Types::FormInputValuePropertyBindingProperties?

        # A list of form properties to concatenate to create the value to assign to this field property.

        @[JSON::Field(key: "concat")]
        getter concat : Array(Types::FormInputValueProperty)?

        # The value to assign to the input field.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @binding_properties : Types::FormInputValuePropertyBindingProperties? = nil,
          @concat : Array(Types::FormInputValueProperty)? = nil,
          @value : String? = nil
        )
        end
      end

      # Associates a form property to a binding property. This enables exposed properties on the top level
      # form to propagate data to the form's property values.

      struct FormInputValuePropertyBindingProperties
        include JSON::Serializable

        # The form property to bind to the data field.

        @[JSON::Field(key: "property")]
        getter property : String

        # The data field to bind the property to.

        @[JSON::Field(key: "field")]
        getter field : String?

        def initialize(
          @property : String,
          @field : String? = nil
        )
        end
      end

      # Describes the configuration for the form's style.

      struct FormStyle
        include JSON::Serializable

        # The spacing for the horizontal gap.

        @[JSON::Field(key: "horizontalGap")]
        getter horizontal_gap : Types::FormStyleConfig?

        # The size of the outer padding for the form.

        @[JSON::Field(key: "outerPadding")]
        getter outer_padding : Types::FormStyleConfig?

        # The spacing for the vertical gap.

        @[JSON::Field(key: "verticalGap")]
        getter vertical_gap : Types::FormStyleConfig?

        def initialize(
          @horizontal_gap : Types::FormStyleConfig? = nil,
          @outer_padding : Types::FormStyleConfig? = nil,
          @vertical_gap : Types::FormStyleConfig? = nil
        )
        end
      end

      # Describes the configuration settings for the form's style properties.

      struct FormStyleConfig
        include JSON::Serializable

        # A reference to a design token to use to bind the form's style properties to an existing theme.

        @[JSON::Field(key: "tokenReference")]
        getter token_reference : String?

        # The value of the style setting.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @token_reference : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Describes the basic information about a form.

      struct FormSummary
        include JSON::Serializable

        # The unique ID for the app associated with the form summary.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The form's data source type.

        @[JSON::Field(key: "dataType")]
        getter data_type : Types::FormDataTypeConfig

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The type of operation to perform on the form.

        @[JSON::Field(key: "formActionType")]
        getter form_action_type : String

        # The ID of the form.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the form.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @app_id : String,
          @data_type : Types::FormDataTypeConfig,
          @environment_name : String,
          @form_action_type : String,
          @id : String,
          @name : String
        )
        end
      end


      struct GetCodegenJobRequest
        include JSON::Serializable

        # The unique ID of the Amplify app associated with the code generation job.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app associated with the code
        # generation job.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the code generation job.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String
        )
        end
      end


      struct GetCodegenJobResponse
        include JSON::Serializable

        # The configuration settings for the code generation job.

        @[JSON::Field(key: "job")]
        getter job : Types::CodegenJob?

        def initialize(
          @job : Types::CodegenJob? = nil
        )
        end
      end


      struct GetComponentRequest
        include JSON::Serializable

        # The unique ID of the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the component.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String
        )
        end
      end


      struct GetComponentResponse
        include JSON::Serializable

        # Represents the configuration settings for the component.

        @[JSON::Field(key: "component")]
        getter component : Types::Component?

        def initialize(
          @component : Types::Component? = nil
        )
        end
      end


      struct GetFormRequest
        include JSON::Serializable

        # The unique ID of the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID of the form.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String
        )
        end
      end


      struct GetFormResponse
        include JSON::Serializable

        # Represents the configuration settings for the form.

        @[JSON::Field(key: "form")]
        getter form : Types::Form?

        def initialize(
          @form : Types::Form? = nil
        )
        end
      end


      struct GetMetadataRequest
        include JSON::Serializable

        # The unique ID of the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        def initialize(
          @app_id : String,
          @environment_name : String
        )
        end
      end


      struct GetMetadataResponse
        include JSON::Serializable

        # Represents the configuration settings for the features metadata.

        @[JSON::Field(key: "features")]
        getter features : Hash(String, String)

        def initialize(
          @features : Hash(String, String)
        )
        end
      end


      struct GetThemeRequest
        include JSON::Serializable

        # The unique ID of the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID for the theme.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String
        )
        end
      end


      struct GetThemeResponse
        include JSON::Serializable

        # Represents the configuration settings for the theme.

        @[JSON::Field(key: "theme")]
        getter theme : Types::Theme?

        def initialize(
          @theme : Types::Theme? = nil
        )
        end
      end

      # Describes the GraphQL configuration for an API for a code generation job.

      struct GraphQLRenderConfig
        include JSON::Serializable

        # The path to the GraphQL fragments file, relative to the component output directory.

        @[JSON::Field(key: "fragmentsFilePath")]
        getter fragments_file_path : String

        # The path to the GraphQL mutations file, relative to the component output directory.

        @[JSON::Field(key: "mutationsFilePath")]
        getter mutations_file_path : String

        # The path to the GraphQL queries file, relative to the component output directory.

        @[JSON::Field(key: "queriesFilePath")]
        getter queries_file_path : String

        # The path to the GraphQL subscriptions file, relative to the component output directory.

        @[JSON::Field(key: "subscriptionsFilePath")]
        getter subscriptions_file_path : String

        # The path to the GraphQL types file, relative to the component output directory.

        @[JSON::Field(key: "typesFilePath")]
        getter types_file_path : String

        def initialize(
          @fragments_file_path : String,
          @mutations_file_path : String,
          @queries_file_path : String,
          @subscriptions_file_path : String,
          @types_file_path : String
        )
        end
      end

      # An internal error has occurred. Please retry your request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An invalid or out-of-range value was supplied for the input parameter.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListCodegenJobsRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The maximum number of jobs to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCodegenJobsResponse
        include JSON::Serializable

        # The list of code generation jobs for the Amplify app.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::CodegenJobSummary)

        # The pagination token that's included if more results are available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::CodegenJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentsRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The maximum number of components to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentsResponse
        include JSON::Serializable

        # The list of components for the Amplify app.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::ComponentSummary)

        # The pagination token that's included if more results are available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::ComponentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListFormsRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The maximum number of forms to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFormsResponse
        include JSON::Serializable

        # The list of forms for the Amplify app.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::FormSummary)

        # The pagination token that's included if more results are available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::FormSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to list tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tag key value pairs for a specified Amazon Resource Name (ARN).

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end


      struct ListThemesRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The maximum number of theme results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListThemesResponse
        include JSON::Serializable

        # The list of themes for the Amplify app.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::ThemeSummary)

        # The pagination token that's returned if more results are available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::ThemeSummary),
          @next_token : String? = nil
        )
        end
      end

      # Represents the state configuration when an action modifies a property of another element within the
      # same component.

      struct MutationActionSetStateParameter
        include JSON::Serializable

        # The name of the component that is being modified.

        @[JSON::Field(key: "componentName")]
        getter component_name : String

        # The name of the component property to apply the state configuration to.

        @[JSON::Field(key: "property")]
        getter property : String

        # The state configuration to assign to the property.

        @[JSON::Field(key: "set")]
        getter set : Types::ComponentProperty

        def initialize(
          @component_name : String,
          @property : String,
          @set : Types::ComponentProperty
        )
        end
      end

      # Describes the configuration for an application with no API being used.

      struct NoApiRenderConfig
        include JSON::Serializable

        def initialize
        end
      end

      # Stores information for generating Amplify DataStore queries. Use a Predicate to retrieve a subset of
      # the data in a collection.

      struct Predicate
        include JSON::Serializable

        # A list of predicates to combine logically.

        @[JSON::Field(key: "and")]
        getter and : Array(Types::Predicate)?

        # The field to query.

        @[JSON::Field(key: "field")]
        getter field : String?

        # The value to use when performing the evaluation.

        @[JSON::Field(key: "operand")]
        getter operand : String?

        # The type of value to use when performing the evaluation.

        @[JSON::Field(key: "operandType")]
        getter operand_type : String?

        # The operator to use to perform the evaluation.

        @[JSON::Field(key: "operator")]
        getter operator : String?

        # A list of predicates to combine logically.

        @[JSON::Field(key: "or")]
        getter or : Array(Types::Predicate)?

        def initialize(
          @and : Array(Types::Predicate)? = nil,
          @field : String? = nil,
          @operand : String? = nil,
          @operand_type : String? = nil,
          @operator : String? = nil,
          @or : Array(Types::Predicate)? = nil
        )
        end
      end

      # Stores the metadata information about a feature on a form.

      struct PutMetadataFlagBody
        include JSON::Serializable

        # The new information to store.

        @[JSON::Field(key: "newValue")]
        getter new_value : String

        def initialize(
          @new_value : String
        )
        end
      end


      struct PutMetadataFlagRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The metadata information to store.

        @[JSON::Field(key: "body")]
        getter body : Types::PutMetadataFlagBody

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The name of the feature associated with the metadata.

        @[JSON::Field(key: "featureName")]
        getter feature_name : String

        def initialize(
          @app_id : String,
          @body : Types::PutMetadataFlagBody,
          @environment_name : String,
          @feature_name : String
        )
        end
      end

      # Describes the code generation job configuration for a React project.

      struct ReactStartCodegenJobData
        include JSON::Serializable

        # The API configuration for the code generation job.

        @[JSON::Field(key: "apiConfiguration")]
        getter api_configuration : Types::ApiConfiguration?

        # Lists the dependency packages that may be required for the project code to run.

        @[JSON::Field(key: "dependencies")]
        getter dependencies : Hash(String, String)?

        # Specifies whether the code generation job should render inline source maps.

        @[JSON::Field(key: "inlineSourceMap")]
        getter inline_source_map : Bool?

        # The JavaScript module type.

        @[JSON::Field(key: "module")]
        getter module : String?

        # Specifies whether the code generation job should render type declaration files.

        @[JSON::Field(key: "renderTypeDeclarations")]
        getter render_type_declarations : Bool?

        # The file type to use for a JavaScript project.

        @[JSON::Field(key: "script")]
        getter script : String?

        # The ECMAScript specification to use.

        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @api_configuration : Types::ApiConfiguration? = nil,
          @dependencies : Hash(String, String)? = nil,
          @inline_source_map : Bool? = nil,
          @module : String? = nil,
          @render_type_declarations : Bool? = nil,
          @script : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct RefreshTokenRequest
        include JSON::Serializable

        # The third-party provider for the token. The only valid value is figma .

        @[JSON::Field(key: "provider")]
        getter provider : String

        # Information about the refresh token request.

        @[JSON::Field(key: "refreshTokenBody")]
        getter refresh_token_body : Types::RefreshTokenRequestBody

        def initialize(
          @provider : String,
          @refresh_token_body : Types::RefreshTokenRequestBody
        )
        end
      end

      # Describes a refresh token.

      struct RefreshTokenRequestBody
        include JSON::Serializable

        # The token to use to refresh a previously issued access token that might have expired.

        @[JSON::Field(key: "token")]
        getter token : String

        # The ID of the client to request the token from.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @token : String,
          @client_id : String? = nil
        )
        end
      end


      struct RefreshTokenResponse
        include JSON::Serializable

        # The access token.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String

        # The date and time when the new access token expires.

        @[JSON::Field(key: "expiresIn")]
        getter expires_in : Int32

        def initialize(
          @access_token : String,
          @expires_in : Int32
        )
        end
      end

      # The resource specified in the request conflicts with an existing resource.

      struct ResourceConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested resource does not exist, or access was denied.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Stores the configuration information for a visual helper element for a form. A sectional element can
      # be a header, a text block, or a divider. These elements are static and not associated with any data.

      struct SectionalElement
        include JSON::Serializable

        # The type of sectional element. Valid values are Heading , Text , and Divider .

        @[JSON::Field(key: "type")]
        getter type : String

        # Excludes a sectional element that was generated by default for a specified data model.

        @[JSON::Field(key: "excluded")]
        getter excluded : Bool?

        # Specifies the size of the font for a Heading sectional element. Valid values are 1 | 2 | 3 | 4 | 5 |
        # 6 .

        @[JSON::Field(key: "level")]
        getter level : Int32?

        # Specifies the orientation for a Divider sectional element. Valid values are horizontal or vertical .

        @[JSON::Field(key: "orientation")]
        getter orientation : String?

        # Specifies the position of the text in a field for a Text sectional element.

        @[JSON::Field(key: "position")]
        getter position : Types::FieldPosition?

        # The text for a Text sectional element.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @type : String,
          @excluded : Bool? = nil,
          @level : Int32? = nil,
          @orientation : String? = nil,
          @position : Types::FieldPosition? = nil,
          @text : String? = nil
        )
        end
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your Amazon Web Services account.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes how to sort the data that you bind to a component.

      struct SortProperty
        include JSON::Serializable

        # The direction of the sort, either ascending or descending.

        @[JSON::Field(key: "direction")]
        getter direction : String

        # The field to perform the sort on.

        @[JSON::Field(key: "field")]
        getter field : String

        def initialize(
          @direction : String,
          @field : String
        )
        end
      end

      # The code generation job resource configuration.

      struct StartCodegenJobData
        include JSON::Serializable

        # The code generation configuration for the codegen job.

        @[JSON::Field(key: "renderConfig")]
        getter render_config : Types::CodegenJobRenderConfig

        # Specifies whether to autogenerate forms in the code generation job.

        @[JSON::Field(key: "autoGenerateForms")]
        getter auto_generate_forms : Bool?

        # The feature flags for a code generation job.

        @[JSON::Field(key: "features")]
        getter features : Types::CodegenFeatureFlags?

        # The data schema to use for a code generation job.

        @[JSON::Field(key: "genericDataSchema")]
        getter generic_data_schema : Types::CodegenJobGenericDataSchema?

        # One or more key-value pairs to use when tagging the code generation job data.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @render_config : Types::CodegenJobRenderConfig,
          @auto_generate_forms : Bool? = nil,
          @features : Types::CodegenFeatureFlags? = nil,
          @generic_data_schema : Types::CodegenJobGenericDataSchema? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartCodegenJobRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The code generation job resource configuration.

        @[JSON::Field(key: "codegenJobToCreate")]
        getter codegen_job_to_create : Types::StartCodegenJobData

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The idempotency token used to ensure that the code generation job request completes only once.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_id : String,
          @codegen_job_to_create : Types::StartCodegenJobData,
          @environment_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct StartCodegenJobResponse
        include JSON::Serializable

        # The code generation job for a UI component that is associated with an Amplify app.

        @[JSON::Field(key: "entity")]
        getter entity : Types::CodegenJob?

        def initialize(
          @entity : Types::CodegenJob? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to tag a resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag key value pairs for a specified Amazon Resource Name (ARN).

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

      # A theme is a collection of style settings that apply globally to the components associated with an
      # Amplify application.

      struct Theme
        include JSON::Serializable

        # The unique ID for the Amplify app associated with the theme.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The time that the theme was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the backend environment that is a part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID for the theme.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the theme.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of key-value pairs that defines the properties of the theme.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::ThemeValues)

        # The time that the theme was modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # Describes the properties that can be overriden to customize a theme.

        @[JSON::Field(key: "overrides")]
        getter overrides : Array(Types::ThemeValues)?

        # One or more key-value pairs to use when tagging the theme.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_id : String,
          @created_at : Time,
          @environment_name : String,
          @id : String,
          @name : String,
          @values : Array(Types::ThemeValues),
          @modified_at : Time? = nil,
          @overrides : Array(Types::ThemeValues)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes the basic information about a theme.

      struct ThemeSummary
        include JSON::Serializable

        # The unique ID for the app associated with the theme summary.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID of the theme.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the theme.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String,
          @name : String
        )
        end
      end

      # Describes the configuration of a theme's properties.

      struct ThemeValue
        include JSON::Serializable

        # A list of key-value pairs that define the theme's properties.

        @[JSON::Field(key: "children")]
        getter children : Array(Types::ThemeValues)?

        # The value of a theme property.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @children : Array(Types::ThemeValues)? = nil,
          @value : String? = nil
        )
        end
      end

      # A key-value pair that defines a property of a theme.

      struct ThemeValues
        include JSON::Serializable

        # The name of the property.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The value of the property.

        @[JSON::Field(key: "value")]
        getter value : Types::ThemeValue?

        def initialize(
          @key : String? = nil,
          @value : Types::ThemeValue? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You don't have permission to perform this operation.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to untag a resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to use to untag a resource.

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

      # Updates and saves all of the information about a component, based on component ID.

      struct UpdateComponentData
        include JSON::Serializable

        # The data binding information for the component's properties.

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Hash(String, Types::ComponentBindingPropertiesValue)?

        # The components that are instances of the main component.

        @[JSON::Field(key: "children")]
        getter children : Array(Types::ComponentChild)?

        # The configuration for binding a component's properties to a data model. Use this for a collection
        # component.

        @[JSON::Field(key: "collectionProperties")]
        getter collection_properties : Hash(String, Types::ComponentDataConfiguration)?

        # The type of the component. This can be an Amplify custom UI component or another custom component.

        @[JSON::Field(key: "componentType")]
        getter component_type : String?

        # The event configuration for the component. Use for the workflow feature in Amplify Studio that
        # allows you to bind events and actions to components.

        @[JSON::Field(key: "events")]
        getter events : Hash(String, Types::ComponentEvent)?

        # The unique ID of the component to update.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the component to update.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Describes the properties that can be overriden to customize the component.

        @[JSON::Field(key: "overrides")]
        getter overrides : Hash(String, Hash(String, String))?

        # Describes the component's properties.

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::ComponentProperty)?

        # The schema version of the component when it was imported.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        # The unique ID of the component in its original source system, such as Figma.

        @[JSON::Field(key: "sourceId")]
        getter source_id : String?

        # A list of the unique variants of the main component being updated.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::ComponentVariant)?

        def initialize(
          @binding_properties : Hash(String, Types::ComponentBindingPropertiesValue)? = nil,
          @children : Array(Types::ComponentChild)? = nil,
          @collection_properties : Hash(String, Types::ComponentDataConfiguration)? = nil,
          @component_type : String? = nil,
          @events : Hash(String, Types::ComponentEvent)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @overrides : Hash(String, Hash(String, String))? = nil,
          @properties : Hash(String, Types::ComponentProperty)? = nil,
          @schema_version : String? = nil,
          @source_id : String? = nil,
          @variants : Array(Types::ComponentVariant)? = nil
        )
        end
      end


      struct UpdateComponentRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID for the component.

        @[JSON::Field(key: "id")]
        getter id : String

        # The configuration of the updated component.

        @[JSON::Field(key: "updatedComponent")]
        getter updated_component : Types::UpdateComponentData

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String,
          @updated_component : Types::UpdateComponentData,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateComponentResponse
        include JSON::Serializable

        # Describes the configuration of the updated component.

        @[JSON::Field(key: "entity")]
        getter entity : Types::Component?

        def initialize(
          @entity : Types::Component? = nil
        )
        end
      end

      # Updates and saves all of the information about a form, based on form ID.

      struct UpdateFormData
        include JSON::Serializable

        # The FormCTA object that stores the call to action configuration for the form.

        @[JSON::Field(key: "cta")]
        getter cta : Types::FormCTA?

        # The type of data source to use to create the form.

        @[JSON::Field(key: "dataType")]
        getter data_type : Types::FormDataTypeConfig?

        # The configuration information for the form's fields.

        @[JSON::Field(key: "fields")]
        getter fields : Hash(String, Types::FieldConfig)?

        # Specifies whether to perform a create or update action on the form.

        @[JSON::Field(key: "formActionType")]
        getter form_action_type : String?

        # Specifies an icon or decoration to display on the form.

        @[JSON::Field(key: "labelDecorator")]
        getter label_decorator : String?

        # The name of the form.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The schema version of the form.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        # The configuration information for the visual helper elements for the form. These elements are not
        # associated with any data.

        @[JSON::Field(key: "sectionalElements")]
        getter sectional_elements : Hash(String, Types::SectionalElement)?

        # The configuration for the form's style.

        @[JSON::Field(key: "style")]
        getter style : Types::FormStyle?

        def initialize(
          @cta : Types::FormCTA? = nil,
          @data_type : Types::FormDataTypeConfig? = nil,
          @fields : Hash(String, Types::FieldConfig)? = nil,
          @form_action_type : String? = nil,
          @label_decorator : String? = nil,
          @name : String? = nil,
          @schema_version : String? = nil,
          @sectional_elements : Hash(String, Types::SectionalElement)? = nil,
          @style : Types::FormStyle? = nil
        )
        end
      end


      struct UpdateFormRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID for the form.

        @[JSON::Field(key: "id")]
        getter id : String

        # The request accepts the following data in JSON format.

        @[JSON::Field(key: "updatedForm")]
        getter updated_form : Types::UpdateFormData

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String,
          @updated_form : Types::UpdateFormData,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateFormResponse
        include JSON::Serializable

        # Describes the configuration of the updated form.

        @[JSON::Field(key: "entity")]
        getter entity : Types::Form?

        def initialize(
          @entity : Types::Form? = nil
        )
        end
      end

      # Saves the data binding information for a theme.

      struct UpdateThemeData
        include JSON::Serializable

        # A list of key-value pairs that define the theme's properties.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::ThemeValues)

        # The unique ID of the theme to update.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the theme to update.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Describes the properties that can be overriden to customize the theme.

        @[JSON::Field(key: "overrides")]
        getter overrides : Array(Types::ThemeValues)?

        def initialize(
          @values : Array(Types::ThemeValues),
          @id : String? = nil,
          @name : String? = nil,
          @overrides : Array(Types::ThemeValues)? = nil
        )
        end
      end


      struct UpdateThemeRequest
        include JSON::Serializable

        # The unique ID for the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment that is part of the Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The unique ID for the theme.

        @[JSON::Field(key: "id")]
        getter id : String

        # The configuration of the updated theme.

        @[JSON::Field(key: "updatedTheme")]
        getter updated_theme : Types::UpdateThemeData

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @id : String,
          @updated_theme : Types::UpdateThemeData,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateThemeResponse
        include JSON::Serializable

        # Describes the configuration of the updated theme.

        @[JSON::Field(key: "entity")]
        getter entity : Types::Theme?

        def initialize(
          @entity : Types::Theme? = nil
        )
        end
      end

      # Associates a complex object with a display value. Use ValueMapping to store how to represent complex
      # objects when they are displayed.

      struct ValueMapping
        include JSON::Serializable

        # The complex object.

        @[JSON::Field(key: "value")]
        getter value : Types::FormInputValueProperty

        # The value to display for the complex object.

        @[JSON::Field(key: "displayValue")]
        getter display_value : Types::FormInputValueProperty?

        def initialize(
          @value : Types::FormInputValueProperty,
          @display_value : Types::FormInputValueProperty? = nil
        )
        end
      end

      # Represents the data binding configuration for a value map.

      struct ValueMappings
        include JSON::Serializable

        # The value and display value pairs.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::ValueMapping)

        # The information to bind fields to data at runtime.

        @[JSON::Field(key: "bindingProperties")]
        getter binding_properties : Hash(String, Types::FormInputBindingPropertiesValue)?

        def initialize(
          @values : Array(Types::ValueMapping),
          @binding_properties : Hash(String, Types::FormInputBindingPropertiesValue)? = nil
        )
        end
      end
    end
  end
end
