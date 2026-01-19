require "json"
require "time"

module AwsSdk
  module IoTTwinMaker
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

      # An error returned by the BatchPutProperty action.
      struct BatchPutPropertyError
        include JSON::Serializable

        # An object that contains information about errors returned by the BatchPutProperty action.
        @[JSON::Field(key: "entry")]
        getter entry : Types::PropertyValueEntry

        # The error code.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The error message.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @entry : Types::PropertyValueEntry,
          @error_code : String,
          @error_message : String
        )
        end
      end

      # An object that contains information about errors returned by the BatchPutProperty action.
      struct BatchPutPropertyErrorEntry
        include JSON::Serializable

        # A list of objects that contain information about errors returned by the BatchPutProperty action.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchPutPropertyError)

        def initialize(
          @errors : Array(Types::BatchPutPropertyError)
        )
        end
      end

      struct BatchPutPropertyValuesRequest
        include JSON::Serializable

        # An object that maps strings to the property value entries to set. Each string in the mapping must be
        # unique to this object.
        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::PropertyValueEntry)

        # The ID of the workspace that contains the properties to set.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @entries : Array(Types::PropertyValueEntry),
          @workspace_id : String
        )
        end
      end

      struct BatchPutPropertyValuesResponse
        include JSON::Serializable

        # Entries that caused errors in the batch put operation.
        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::BatchPutPropertyErrorEntry)

        def initialize(
          @error_entries : Array(Types::BatchPutPropertyErrorEntry)
        )
        end
      end

      # Information about the pricing bundle.
      struct BundleInformation
        include JSON::Serializable

        # The bundle names.
        @[JSON::Field(key: "bundleNames")]
        getter bundle_names : Array(String)

        # The pricing tier.
        @[JSON::Field(key: "pricingTier")]
        getter pricing_tier : String?

        def initialize(
          @bundle_names : Array(String),
          @pricing_tier : String? = nil
        )
        end
      end

      struct CancelMetadataTransferJobRequest
        include JSON::Serializable

        # The metadata transfer job Id.
        @[JSON::Field(key: "metadataTransferJobId")]
        getter metadata_transfer_job_id : String

        def initialize(
          @metadata_transfer_job_id : String
        )
        end
      end

      struct CancelMetadataTransferJobResponse
        include JSON::Serializable

        # The metadata transfer job ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The metadata transfer job Id.
        @[JSON::Field(key: "metadataTransferJobId")]
        getter metadata_transfer_job_id : String

        # The metadata transfer job's status.
        @[JSON::Field(key: "status")]
        getter status : Types::MetadataTransferJobStatus

        # Used to update the DateTime property.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The metadata transfer job's progress.
        @[JSON::Field(key: "progress")]
        getter progress : Types::MetadataTransferJobProgress?

        def initialize(
          @arn : String,
          @metadata_transfer_job_id : String,
          @status : Types::MetadataTransferJobStatus,
          @update_date_time : Time,
          @progress : Types::MetadataTransferJobProgress? = nil
        )
        end
      end

      # A description of the column in the query results.
      struct ColumnDescription
        include JSON::Serializable

        # The name of the column description.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the column description.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The component property group request.
      struct ComponentPropertyGroupRequest
        include JSON::Serializable

        # The group type.
        @[JSON::Field(key: "groupType")]
        getter group_type : String?

        # The property names.
        @[JSON::Field(key: "propertyNames")]
        getter property_names : Array(String)?

        # The update type.
        @[JSON::Field(key: "updateType")]
        getter update_type : String?

        def initialize(
          @group_type : String? = nil,
          @property_names : Array(String)? = nil,
          @update_type : String? = nil
        )
        end
      end

      # The component property group response.
      struct ComponentPropertyGroupResponse
        include JSON::Serializable

        # The group type.
        @[JSON::Field(key: "groupType")]
        getter group_type : String

        # A Boolean value that specifies whether the property group is inherited from a parent entity
        @[JSON::Field(key: "isInherited")]
        getter is_inherited : Bool

        # The names of properties
        @[JSON::Field(key: "propertyNames")]
        getter property_names : Array(String)

        def initialize(
          @group_type : String,
          @is_inherited : Bool,
          @property_names : Array(String)
        )
        end
      end

      # An object that sets information about a component type create or update request.
      struct ComponentRequest
        include JSON::Serializable

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        # The description of the component request.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An object that maps strings to the properties to set in the component type. Each string in the
        # mapping must be unique to this object.
        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::PropertyRequest)?

        # The property groups.
        @[JSON::Field(key: "propertyGroups")]
        getter property_groups : Hash(String, Types::ComponentPropertyGroupRequest)?

        def initialize(
          @component_type_id : String? = nil,
          @description : String? = nil,
          @properties : Hash(String, Types::PropertyRequest)? = nil,
          @property_groups : Hash(String, Types::ComponentPropertyGroupRequest)? = nil
        )
        end
      end

      # An object that returns information about a component type create or update request.
      struct ComponentResponse
        include JSON::Serializable

        # This flag notes whether all compositeComponents are returned in the API response.
        @[JSON::Field(key: "areAllCompositeComponentsReturned")]
        getter are_all_composite_components_returned : Bool?

        # This flag notes whether all properties of the component are returned in the API response. The
        # maximum number of properties returned is 800.
        @[JSON::Field(key: "areAllPropertiesReturned")]
        getter are_all_properties_returned : Bool?

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        # This lists objects that contain information about the compositeComponents .
        @[JSON::Field(key: "compositeComponents")]
        getter composite_components : Hash(String, Types::ComponentSummary)?

        # The name of the property definition set in the request.
        @[JSON::Field(key: "definedIn")]
        getter defined_in : String?

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An object that maps strings to the properties to set in the component type. Each string in the
        # mapping must be unique to this object.
        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::PropertyResponse)?

        # The property groups.
        @[JSON::Field(key: "propertyGroups")]
        getter property_groups : Hash(String, Types::ComponentPropertyGroupResponse)?

        # The status of the component type.
        @[JSON::Field(key: "status")]
        getter status : Types::Status?

        # The syncSource of the sync job, if this entity was created by a sync job.
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String?

        def initialize(
          @are_all_composite_components_returned : Bool? = nil,
          @are_all_properties_returned : Bool? = nil,
          @component_name : String? = nil,
          @component_type_id : String? = nil,
          @composite_components : Hash(String, Types::ComponentSummary)? = nil,
          @defined_in : String? = nil,
          @description : String? = nil,
          @properties : Hash(String, Types::PropertyResponse)? = nil,
          @property_groups : Hash(String, Types::ComponentPropertyGroupResponse)? = nil,
          @status : Types::Status? = nil,
          @sync_source : String? = nil
        )
        end
      end

      # An object that returns information about a component summary.
      struct ComponentSummary
        include JSON::Serializable

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The status of the component type.
        @[JSON::Field(key: "status")]
        getter status : Types::Status

        # This string specifies the path to the composite component, starting from the top-level component.
        @[JSON::Field(key: "componentPath")]
        getter component_path : String?

        # The name of the property definition set in the request.
        @[JSON::Field(key: "definedIn")]
        getter defined_in : String?

        # The description of the component request.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The property groups.
        @[JSON::Field(key: "propertyGroups")]
        getter property_groups : Hash(String, Types::ComponentPropertyGroupResponse)?

        # The syncSource of the sync job, if this entity was created by a sync job.
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String?

        def initialize(
          @component_name : String,
          @component_type_id : String,
          @status : Types::Status,
          @component_path : String? = nil,
          @defined_in : String? = nil,
          @description : String? = nil,
          @property_groups : Hash(String, Types::ComponentPropertyGroupResponse)? = nil,
          @sync_source : String? = nil
        )
        end
      end

      # An object that contains information about a component type.
      struct ComponentTypeSummary
        include JSON::Serializable

        # The ARN of the component type.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The date and time when the component type was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The date and time when the component type was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The component type name.
        @[JSON::Field(key: "componentTypeName")]
        getter component_type_name : String?

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The current status of the component type.
        @[JSON::Field(key: "status")]
        getter status : Types::Status?

        def initialize(
          @arn : String,
          @component_type_id : String,
          @creation_date_time : Time,
          @update_date_time : Time,
          @component_type_name : String? = nil,
          @description : String? = nil,
          @status : Types::Status? = nil
        )
        end
      end

      # The component update request.
      struct ComponentUpdateRequest
        include JSON::Serializable

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The property group updates.
        @[JSON::Field(key: "propertyGroupUpdates")]
        getter property_group_updates : Hash(String, Types::ComponentPropertyGroupRequest)?

        # An object that maps strings to the properties to set in the component type update. Each string in
        # the mapping must be unique to this object.
        @[JSON::Field(key: "propertyUpdates")]
        getter property_updates : Hash(String, Types::PropertyRequest)?

        # The update type of the component update request.
        @[JSON::Field(key: "updateType")]
        getter update_type : String?

        def initialize(
          @component_type_id : String? = nil,
          @description : String? = nil,
          @property_group_updates : Hash(String, Types::ComponentPropertyGroupRequest)? = nil,
          @property_updates : Hash(String, Types::PropertyRequest)? = nil,
          @update_type : String? = nil
        )
        end
      end

      # An object that sets information about the composite component update request.
      struct CompositeComponentRequest
        include JSON::Serializable

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # This is an object that maps strings to the properties to set in the component type. Each string in
        # the mapping must be unique to this object.
        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::PropertyRequest)?

        # The property groups.
        @[JSON::Field(key: "propertyGroups")]
        getter property_groups : Hash(String, Types::ComponentPropertyGroupRequest)?

        def initialize(
          @description : String? = nil,
          @properties : Hash(String, Types::PropertyRequest)? = nil,
          @property_groups : Hash(String, Types::ComponentPropertyGroupRequest)? = nil
        )
        end
      end

      # An object that sets information about the composite component types of a component type.
      struct CompositeComponentTypeRequest
        include JSON::Serializable

        # This is the componentTypeId that the compositeComponentType refers to.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        def initialize(
          @component_type_id : String? = nil
        )
        end
      end

      # An object that returns information about the composite component types of a component type.
      struct CompositeComponentTypeResponse
        include JSON::Serializable

        # This is the componentTypeId that this compositeComponentType refers to.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        # This boolean indicates whether this compositeComponentType is inherited from its parent.
        @[JSON::Field(key: "isInherited")]
        getter is_inherited : Bool?

        def initialize(
          @component_type_id : String? = nil,
          @is_inherited : Bool? = nil
        )
        end
      end

      # An object that sets information about the composite component update request.
      struct CompositeComponentUpdateRequest
        include JSON::Serializable

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The property group updates.
        @[JSON::Field(key: "propertyGroupUpdates")]
        getter property_group_updates : Hash(String, Types::ComponentPropertyGroupRequest)?

        # An object that maps strings to the properties to set in the component type update. Each string in
        # the mapping must be unique to this object.
        @[JSON::Field(key: "propertyUpdates")]
        getter property_updates : Hash(String, Types::PropertyRequest)?

        # The update type of the component update request.
        @[JSON::Field(key: "updateType")]
        getter update_type : String?

        def initialize(
          @description : String? = nil,
          @property_group_updates : Hash(String, Types::ComponentPropertyGroupRequest)? = nil,
          @property_updates : Hash(String, Types::PropertyRequest)? = nil,
          @update_type : String? = nil
        )
        end
      end

      # A conflict occurred.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The connector failed.
      struct ConnectorFailureException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The connector timed out.
      struct ConnectorTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateComponentTypeRequest
        include JSON::Serializable

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The ID of the workspace that contains the component type.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A friendly name for the component type.
        @[JSON::Field(key: "componentTypeName")]
        getter component_type_name : String?

        # This is an object that maps strings to compositeComponentTypes of the componentType .
        # CompositeComponentType is referenced by componentTypeId .
        @[JSON::Field(key: "compositeComponentTypes")]
        getter composite_component_types : Hash(String, Types::CompositeComponentTypeRequest)?

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the parent component type to extend.
        @[JSON::Field(key: "extendsFrom")]
        getter extends_from : Array(String)?

        # An object that maps strings to the functions in the component type. Each string in the mapping must
        # be unique to this object.
        @[JSON::Field(key: "functions")]
        getter functions : Hash(String, Types::FunctionRequest)?

        # A Boolean value that specifies whether an entity can have more than one component of this type.
        @[JSON::Field(key: "isSingleton")]
        getter is_singleton : Bool?

        # An object that maps strings to the property definitions in the component type. Each string in the
        # mapping must be unique to this object.
        @[JSON::Field(key: "propertyDefinitions")]
        getter property_definitions : Hash(String, Types::PropertyDefinitionRequest)?

        @[JSON::Field(key: "propertyGroups")]
        getter property_groups : Hash(String, Types::PropertyGroupRequest)?

        # Metadata that you can use to manage the component type.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @component_type_id : String,
          @workspace_id : String,
          @component_type_name : String? = nil,
          @composite_component_types : Hash(String, Types::CompositeComponentTypeRequest)? = nil,
          @description : String? = nil,
          @extends_from : Array(String)? = nil,
          @functions : Hash(String, Types::FunctionRequest)? = nil,
          @is_singleton : Bool? = nil,
          @property_definitions : Hash(String, Types::PropertyDefinitionRequest)? = nil,
          @property_groups : Hash(String, Types::PropertyGroupRequest)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateComponentTypeResponse
        include JSON::Serializable

        # The ARN of the component type.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the entity was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The current state of the component type.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @state : String
        )
        end
      end

      struct CreateEntityRequest
        include JSON::Serializable

        # The name of the entity.
        @[JSON::Field(key: "entityName")]
        getter entity_name : String

        # The ID of the workspace that contains the entity.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # An object that maps strings to the components in the entity. Each string in the mapping must be
        # unique to this object.
        @[JSON::Field(key: "components")]
        getter components : Hash(String, Types::ComponentRequest)?

        # This is an object that maps strings to compositeComponent updates in the request. Each key of the
        # map represents the componentPath of the compositeComponent .
        @[JSON::Field(key: "compositeComponents")]
        getter composite_components : Hash(String, Types::CompositeComponentRequest)?

        # The description of the entity.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The ID of the entity's parent entity.
        @[JSON::Field(key: "parentEntityId")]
        getter parent_entity_id : String?

        # Metadata that you can use to manage the entity.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @entity_name : String,
          @workspace_id : String,
          @components : Hash(String, Types::ComponentRequest)? = nil,
          @composite_components : Hash(String, Types::CompositeComponentRequest)? = nil,
          @description : String? = nil,
          @entity_id : String? = nil,
          @parent_entity_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateEntityResponse
        include JSON::Serializable

        # The ARN of the entity.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the entity was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The current state of the entity.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @entity_id : String,
          @state : String
        )
        end
      end

      struct CreateMetadataTransferJobRequest
        include JSON::Serializable

        # The metadata transfer job destination.
        @[JSON::Field(key: "destination")]
        getter destination : Types::DestinationConfiguration

        # The metadata transfer job sources.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::SourceConfiguration)

        # The metadata transfer job description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The metadata transfer job Id.
        @[JSON::Field(key: "metadataTransferJobId")]
        getter metadata_transfer_job_id : String?

        def initialize(
          @destination : Types::DestinationConfiguration,
          @sources : Array(Types::SourceConfiguration),
          @description : String? = nil,
          @metadata_transfer_job_id : String? = nil
        )
        end
      end

      struct CreateMetadataTransferJobResponse
        include JSON::Serializable

        # The metadata transfer job ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The The metadata transfer job creation DateTime property.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The metadata transfer job Id.
        @[JSON::Field(key: "metadataTransferJobId")]
        getter metadata_transfer_job_id : String

        # The metadata transfer job response status.
        @[JSON::Field(key: "status")]
        getter status : Types::MetadataTransferJobStatus

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @metadata_transfer_job_id : String,
          @status : Types::MetadataTransferJobStatus
        )
        end
      end

      struct CreateSceneRequest
        include JSON::Serializable

        # The relative path that specifies the location of the content definition file.
        @[JSON::Field(key: "contentLocation")]
        getter content_location : String

        # The ID of the scene.
        @[JSON::Field(key: "sceneId")]
        getter scene_id : String

        # The ID of the workspace that contains the scene.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A list of capabilities that the scene uses to render itself.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # The description for this scene.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The request metadata.
        @[JSON::Field(key: "sceneMetadata")]
        getter scene_metadata : Hash(String, String)?

        # Metadata that you can use to manage the scene.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_location : String,
          @scene_id : String,
          @workspace_id : String,
          @capabilities : Array(String)? = nil,
          @description : String? = nil,
          @scene_metadata : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSceneResponse
        include JSON::Serializable

        # The ARN of the scene.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the scene was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        def initialize(
          @arn : String,
          @creation_date_time : Time
        )
        end
      end

      struct CreateSyncJobRequest
        include JSON::Serializable

        # The SyncJob IAM role. This IAM role is used by the SyncJob to read from the syncSource, and create,
        # update, or delete the corresponding resources.
        @[JSON::Field(key: "syncRole")]
        getter sync_role : String

        # The sync source. Currently the only supported syncSoource is SITEWISE .
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String

        # The workspace ID.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The SyncJob tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @sync_role : String,
          @sync_source : String,
          @workspace_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSyncJobResponse
        include JSON::Serializable

        # The SyncJob ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time for the SyncJob creation.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The SyncJob response state.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @state : String
        )
        end
      end

      struct CreateWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The description of the workspace.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the execution role associated with the workspace.
        @[JSON::Field(key: "role")]
        getter role : String?

        # The ARN of the S3 bucket where resources associated with the workspace are stored.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : String?

        # Metadata that you can use to manage the workspace
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @workspace_id : String,
          @description : String? = nil,
          @role : String? = nil,
          @s3_location : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateWorkspaceResponse
        include JSON::Serializable

        # The ARN of the workspace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the workspace was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        def initialize(
          @arn : String,
          @creation_date_time : Time
        )
        end
      end

      # The data connector.
      struct DataConnector
        include JSON::Serializable

        # A Boolean value that specifies whether the data connector is native to IoT TwinMaker.
        @[JSON::Field(key: "isNative")]
        getter is_native : Bool?

        # The Lambda function associated with this data connector.
        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaFunction?

        def initialize(
          @is_native : Bool? = nil,
          @lambda : Types::LambdaFunction? = nil
        )
        end
      end

      # An object that specifies the data type of a property.
      struct DataType
        include JSON::Serializable

        # The underlying type of the data type.
        @[JSON::Field(key: "type")]
        getter type : String

        # The allowed values for this data type.
        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(Types::DataValue)?

        # The nested type in the data type.
        @[JSON::Field(key: "nestedType")]
        getter nested_type : Types::DataType?

        # A relationship that associates a component with another component.
        @[JSON::Field(key: "relationship")]
        getter relationship : Types::Relationship?

        # The unit of measure used in this data type.
        @[JSON::Field(key: "unitOfMeasure")]
        getter unit_of_measure : String?

        def initialize(
          @type : String,
          @allowed_values : Array(Types::DataValue)? = nil,
          @nested_type : Types::DataType? = nil,
          @relationship : Types::Relationship? = nil,
          @unit_of_measure : String? = nil
        )
        end
      end

      # An object that specifies a value for a property.
      struct DataValue
        include JSON::Serializable

        # A Boolean value.
        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # A double value.
        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # An expression that produces the value.
        @[JSON::Field(key: "expression")]
        getter expression : String?

        # An integer value.
        @[JSON::Field(key: "integerValue")]
        getter integer_value : Int32?

        # A list of multiple values.
        @[JSON::Field(key: "listValue")]
        getter list_value : Array(Types::DataValue)?

        # A long value.
        @[JSON::Field(key: "longValue")]
        getter long_value : Int64?

        # An object that maps strings to multiple DataValue objects.
        @[JSON::Field(key: "mapValue")]
        getter map_value : Hash(String, Types::DataValue)?

        # A value that relates a component to another component.
        @[JSON::Field(key: "relationshipValue")]
        getter relationship_value : Types::RelationshipValue?

        # A string value.
        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @expression : String? = nil,
          @integer_value : Int32? = nil,
          @list_value : Array(Types::DataValue)? = nil,
          @long_value : Int64? = nil,
          @map_value : Hash(String, Types::DataValue)? = nil,
          @relationship_value : Types::RelationshipValue? = nil,
          @string_value : String? = nil
        )
        end
      end

      struct DeleteComponentTypeRequest
        include JSON::Serializable

        # The ID of the component type to delete.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The ID of the workspace that contains the component type.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @component_type_id : String,
          @workspace_id : String
        )
        end
      end

      struct DeleteComponentTypeResponse
        include JSON::Serializable

        # The current state of the component type to be deleted.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      struct DeleteEntityRequest
        include JSON::Serializable

        # The ID of the entity to delete.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The ID of the workspace that contains the entity to delete.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A Boolean value that specifies whether the operation deletes child entities.
        @[JSON::Field(key: "isRecursive")]
        getter is_recursive : Bool?

        def initialize(
          @entity_id : String,
          @workspace_id : String,
          @is_recursive : Bool? = nil
        )
        end
      end

      struct DeleteEntityResponse
        include JSON::Serializable

        # The current state of the deleted entity.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      struct DeleteSceneRequest
        include JSON::Serializable

        # The ID of the scene to delete.
        @[JSON::Field(key: "sceneId")]
        getter scene_id : String

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @scene_id : String,
          @workspace_id : String
        )
        end
      end

      struct DeleteSceneResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSyncJobRequest
        include JSON::Serializable

        # The sync source. Currently the only supported syncSource is SITEWISE .
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String

        # The workspace ID.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @sync_source : String,
          @workspace_id : String
        )
        end
      end

      struct DeleteSyncJobResponse
        include JSON::Serializable

        # The SyncJob response state.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      struct DeleteWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace to delete.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      struct DeleteWorkspaceResponse
        include JSON::Serializable

        # The string that specifies the delete result for the workspace.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The [link to action] metadata transfer job destination configuration.
      struct DestinationConfiguration
        include JSON::Serializable

        # The destination type.
        @[JSON::Field(key: "type")]
        getter type : String

        # The metadata transfer job Amazon Web Services IoT TwinMaker configuration.
        @[JSON::Field(key: "iotTwinMakerConfiguration")]
        getter iot_twin_maker_configuration : Types::IotTwinMakerDestinationConfiguration?

        # The metadata transfer job S3 configuration. [need to add S3 entity]
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration?

        def initialize(
          @type : String,
          @iot_twin_maker_configuration : Types::IotTwinMakerDestinationConfiguration? = nil,
          @s3_configuration : Types::S3DestinationConfiguration? = nil
        )
        end
      end

      # An object that uniquely identifies an entity property.
      struct EntityPropertyReference
        include JSON::Serializable

        # The name of the property.
        @[JSON::Field(key: "propertyName")]
        getter property_name : String

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # This string specifies the path to the composite component, starting from the top-level component.
        @[JSON::Field(key: "componentPath")]
        getter component_path : String?

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # A mapping of external IDs to property names. External IDs uniquely identify properties from external
        # data stores.
        @[JSON::Field(key: "externalIdProperty")]
        getter external_id_property : Hash(String, String)?

        def initialize(
          @property_name : String,
          @component_name : String? = nil,
          @component_path : String? = nil,
          @entity_id : String? = nil,
          @external_id_property : Hash(String, String)? = nil
        )
        end
      end

      # An object that contains information about an entity.
      struct EntitySummary
        include JSON::Serializable

        # The ARN of the entity.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the entity was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The name of the entity.
        @[JSON::Field(key: "entityName")]
        getter entity_name : String

        # The current status of the entity.
        @[JSON::Field(key: "status")]
        getter status : Types::Status

        # The last date and time when the entity was updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The description of the entity.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An eventual Boolean value that specifies whether the entity has child entities or not.
        @[JSON::Field(key: "hasChildEntities")]
        getter has_child_entities : Bool?

        # The ID of the parent entity.
        @[JSON::Field(key: "parentEntityId")]
        getter parent_entity_id : String?

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @entity_id : String,
          @entity_name : String,
          @status : Types::Status,
          @update_date_time : Time,
          @description : String? = nil,
          @has_child_entities : Bool? = nil,
          @parent_entity_id : String? = nil
        )
        end
      end

      # The error details.
      struct ErrorDetails
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

      struct ExecuteQueryRequest
        include JSON::Serializable

        # The query statement.
        @[JSON::Field(key: "queryStatement")]
        getter query_statement : String

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The maximum number of results to return at one time. The default is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @query_statement : String,
          @workspace_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ExecuteQueryResponse
        include JSON::Serializable

        # A list of ColumnDescription objects.
        @[JSON::Field(key: "columnDescriptions")]
        getter column_descriptions : Array(Types::ColumnDescription)?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Represents a single row in the query results.
        @[JSON::Field(key: "rows")]
        getter rows : Array(Types::Row)?

        def initialize(
          @column_descriptions : Array(Types::ColumnDescription)? = nil,
          @next_token : String? = nil,
          @rows : Array(Types::Row)? = nil
        )
        end
      end

      # Filter by asset. [TwinMaker asset]
      struct FilterByAsset
        include JSON::Serializable

        # The external-Id property of an asset.
        @[JSON::Field(key: "assetExternalId")]
        getter asset_external_id : String?

        # Filter by asset Id.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # Boolean to include the asset model.
        @[JSON::Field(key: "includeAssetModel")]
        getter include_asset_model : Bool?

        # Includes sub-assets.[need description hekp for this]
        @[JSON::Field(key: "includeOffspring")]
        getter include_offspring : Bool?

        def initialize(
          @asset_external_id : String? = nil,
          @asset_id : String? = nil,
          @include_asset_model : Bool? = nil,
          @include_offspring : Bool? = nil
        )
        end
      end

      # Filter by asset model.
      struct FilterByAssetModel
        include JSON::Serializable

        # The external-Id property of an asset model.
        @[JSON::Field(key: "assetModelExternalId")]
        getter asset_model_external_id : String?

        # The asset model Id.
        @[JSON::Field(key: "assetModelId")]
        getter asset_model_id : String?

        # Bolean to include assets.
        @[JSON::Field(key: "includeAssets")]
        getter include_assets : Bool?

        # Include asset offspring. [need desc.]
        @[JSON::Field(key: "includeOffspring")]
        getter include_offspring : Bool?

        def initialize(
          @asset_model_external_id : String? = nil,
          @asset_model_id : String? = nil,
          @include_assets : Bool? = nil,
          @include_offspring : Bool? = nil
        )
        end
      end

      # Filter by component type.
      struct FilterByComponentType
        include JSON::Serializable

        # The component type Id.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        def initialize(
          @component_type_id : String
        )
        end
      end

      # Vilter by entity.
      struct FilterByEntity
        include JSON::Serializable

        # The entity Id.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        def initialize(
          @entity_id : String
        )
        end
      end

      # The function request body.
      struct FunctionRequest
        include JSON::Serializable

        # The data connector.
        @[JSON::Field(key: "implementedBy")]
        getter implemented_by : Types::DataConnector?

        # The required properties of the function.
        @[JSON::Field(key: "requiredProperties")]
        getter required_properties : Array(String)?

        # The scope of the function.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @implemented_by : Types::DataConnector? = nil,
          @required_properties : Array(String)? = nil,
          @scope : String? = nil
        )
        end
      end

      # The function response.
      struct FunctionResponse
        include JSON::Serializable

        # The data connector.
        @[JSON::Field(key: "implementedBy")]
        getter implemented_by : Types::DataConnector?

        # Indicates whether this function is inherited.
        @[JSON::Field(key: "isInherited")]
        getter is_inherited : Bool?

        # The required properties of the function.
        @[JSON::Field(key: "requiredProperties")]
        getter required_properties : Array(String)?

        # The scope of the function.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @implemented_by : Types::DataConnector? = nil,
          @is_inherited : Bool? = nil,
          @required_properties : Array(String)? = nil,
          @scope : String? = nil
        )
        end
      end

      struct GetComponentTypeRequest
        include JSON::Serializable

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The ID of the workspace that contains the component type.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @component_type_id : String,
          @workspace_id : String
        )
        end
      end

      struct GetComponentTypeResponse
        include JSON::Serializable

        # The ARN of the component type.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The date and time when the component type was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The date and time when the component was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The ID of the workspace that contains the component type.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The component type name.
        @[JSON::Field(key: "componentTypeName")]
        getter component_type_name : String?

        # This is an object that maps strings to compositeComponentTypes of the componentType .
        # CompositeComponentType is referenced by componentTypeId .
        @[JSON::Field(key: "compositeComponentTypes")]
        getter composite_component_types : Hash(String, Types::CompositeComponentTypeResponse)?

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the parent component type that this component type extends.
        @[JSON::Field(key: "extendsFrom")]
        getter extends_from : Array(String)?

        # An object that maps strings to the functions in the component type. Each string in the mapping must
        # be unique to this object.
        @[JSON::Field(key: "functions")]
        getter functions : Hash(String, Types::FunctionResponse)?

        # A Boolean value that specifies whether the component type is abstract.
        @[JSON::Field(key: "isAbstract")]
        getter is_abstract : Bool?

        # A Boolean value that specifies whether the component type has a schema initializer and that the
        # schema initializer has run.
        @[JSON::Field(key: "isSchemaInitialized")]
        getter is_schema_initialized : Bool?

        # A Boolean value that specifies whether an entity can have more than one component of this type.
        @[JSON::Field(key: "isSingleton")]
        getter is_singleton : Bool?

        # An object that maps strings to the property definitions in the component type. Each string in the
        # mapping must be unique to this object.
        @[JSON::Field(key: "propertyDefinitions")]
        getter property_definitions : Hash(String, Types::PropertyDefinitionResponse)?

        # The maximum number of results to return at one time. The default is 25. Valid Range: Minimum value
        # of 1. Maximum value of 250.
        @[JSON::Field(key: "propertyGroups")]
        getter property_groups : Hash(String, Types::PropertyGroupResponse)?

        # The current status of the component type.
        @[JSON::Field(key: "status")]
        getter status : Types::Status?

        # The syncSource of the SyncJob, if this entity was created by a SyncJob.
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String?

        def initialize(
          @arn : String,
          @component_type_id : String,
          @creation_date_time : Time,
          @update_date_time : Time,
          @workspace_id : String,
          @component_type_name : String? = nil,
          @composite_component_types : Hash(String, Types::CompositeComponentTypeResponse)? = nil,
          @description : String? = nil,
          @extends_from : Array(String)? = nil,
          @functions : Hash(String, Types::FunctionResponse)? = nil,
          @is_abstract : Bool? = nil,
          @is_schema_initialized : Bool? = nil,
          @is_singleton : Bool? = nil,
          @property_definitions : Hash(String, Types::PropertyDefinitionResponse)? = nil,
          @property_groups : Hash(String, Types::PropertyGroupResponse)? = nil,
          @status : Types::Status? = nil,
          @sync_source : String? = nil
        )
        end
      end

      struct GetEntityRequest
        include JSON::Serializable

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @entity_id : String,
          @workspace_id : String
        )
        end
      end

      struct GetEntityResponse
        include JSON::Serializable

        # The ARN of the entity.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the entity was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The name of the entity.
        @[JSON::Field(key: "entityName")]
        getter entity_name : String

        # A Boolean value that specifies whether the entity has associated child entities.
        @[JSON::Field(key: "hasChildEntities")]
        getter has_child_entities : Bool

        # The ID of the parent entity for this entity.
        @[JSON::Field(key: "parentEntityId")]
        getter parent_entity_id : String

        # The current status of the entity.
        @[JSON::Field(key: "status")]
        getter status : Types::Status

        # The date and time when the entity was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # This flag notes whether all components are returned in the API response. The maximum number of
        # components returned is 30.
        @[JSON::Field(key: "areAllComponentsReturned")]
        getter are_all_components_returned : Bool?

        # An object that maps strings to the components in the entity. Each string in the mapping must be
        # unique to this object.
        @[JSON::Field(key: "components")]
        getter components : Hash(String, Types::ComponentResponse)?

        # The description of the entity.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The syncSource of the sync job, if this entity was created by a sync job.
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String?

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @entity_id : String,
          @entity_name : String,
          @has_child_entities : Bool,
          @parent_entity_id : String,
          @status : Types::Status,
          @update_date_time : Time,
          @workspace_id : String,
          @are_all_components_returned : Bool? = nil,
          @components : Hash(String, Types::ComponentResponse)? = nil,
          @description : String? = nil,
          @sync_source : String? = nil
        )
        end
      end

      struct GetMetadataTransferJobRequest
        include JSON::Serializable

        # The metadata transfer job Id.
        @[JSON::Field(key: "metadataTransferJobId")]
        getter metadata_transfer_job_id : String

        def initialize(
          @metadata_transfer_job_id : String
        )
        end
      end

      struct GetMetadataTransferJobResponse
        include JSON::Serializable

        # The metadata transfer job ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The metadata transfer job's creation DateTime property.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The metadata transfer job's destination.
        @[JSON::Field(key: "destination")]
        getter destination : Types::DestinationConfiguration

        # The metadata transfer job Id.
        @[JSON::Field(key: "metadataTransferJobId")]
        getter metadata_transfer_job_id : String

        # The metadata transfer job's role.
        @[JSON::Field(key: "metadataTransferJobRole")]
        getter metadata_transfer_job_role : String

        # The metadata transfer job's sources.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::SourceConfiguration)

        # The metadata transfer job's status.
        @[JSON::Field(key: "status")]
        getter status : Types::MetadataTransferJobStatus

        # The metadata transfer job's update DateTime property.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The metadata transfer job description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The metadata transfer job's progress.
        @[JSON::Field(key: "progress")]
        getter progress : Types::MetadataTransferJobProgress?

        # The metadata transfer job's report URL.
        @[JSON::Field(key: "reportUrl")]
        getter report_url : String?

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @destination : Types::DestinationConfiguration,
          @metadata_transfer_job_id : String,
          @metadata_transfer_job_role : String,
          @sources : Array(Types::SourceConfiguration),
          @status : Types::MetadataTransferJobStatus,
          @update_date_time : Time,
          @description : String? = nil,
          @progress : Types::MetadataTransferJobProgress? = nil,
          @report_url : String? = nil
        )
        end
      end

      struct GetPricingPlanRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetPricingPlanResponse
        include JSON::Serializable

        # The chosen pricing plan for the current billing cycle.
        @[JSON::Field(key: "currentPricingPlan")]
        getter current_pricing_plan : Types::PricingPlan

        # The pending pricing plan.
        @[JSON::Field(key: "pendingPricingPlan")]
        getter pending_pricing_plan : Types::PricingPlan?

        def initialize(
          @current_pricing_plan : Types::PricingPlan,
          @pending_pricing_plan : Types::PricingPlan? = nil
        )
        end
      end

      struct GetPropertyValueHistoryRequest
        include JSON::Serializable

        # A list of properties whose value histories the request retrieves.
        @[JSON::Field(key: "selectedProperties")]
        getter selected_properties : Array(String)

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # This string specifies the path to the composite component, starting from the top-level component.
        @[JSON::Field(key: "componentPath")]
        getter component_path : String?

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        # The date and time of the latest property value to return.
        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time?

        # The ISO8601 DateTime of the latest property value to return. For more information about the ISO8601
        # DateTime format, see the data type PropertyValue .
        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # An object that specifies the interpolation type and the interval over which to interpolate data.
        @[JSON::Field(key: "interpolation")]
        getter interpolation : Types::InterpolationParameters?

        # The maximum number of results to return at one time. The default is 25. Valid Range: Minimum value
        # of 1. Maximum value of 250.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The time direction to use in the result order.
        @[JSON::Field(key: "orderByTime")]
        getter order_by_time : String?

        # A list of objects that filter the property value history request.
        @[JSON::Field(key: "propertyFilters")]
        getter property_filters : Array(Types::PropertyFilter)?

        # The date and time of the earliest property value to return.
        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time?

        # The ISO8601 DateTime of the earliest property value to return. For more information about the
        # ISO8601 DateTime format, see the data type PropertyValue .
        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        def initialize(
          @selected_properties : Array(String),
          @workspace_id : String,
          @component_name : String? = nil,
          @component_path : String? = nil,
          @component_type_id : String? = nil,
          @end_date_time : Time? = nil,
          @end_time : String? = nil,
          @entity_id : String? = nil,
          @interpolation : Types::InterpolationParameters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order_by_time : String? = nil,
          @property_filters : Array(Types::PropertyFilter)? = nil,
          @start_date_time : Time? = nil,
          @start_time : String? = nil
        )
        end
      end

      struct GetPropertyValueHistoryResponse
        include JSON::Serializable

        # An object that maps strings to the property definitions in the component type. Each string in the
        # mapping must be unique to this object.
        @[JSON::Field(key: "propertyValues")]
        getter property_values : Array(Types::PropertyValueHistory)

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @property_values : Array(Types::PropertyValueHistory),
          @next_token : String? = nil
        )
        end
      end

      struct GetPropertyValueRequest
        include JSON::Serializable

        # The properties whose values the operation returns.
        @[JSON::Field(key: "selectedProperties")]
        getter selected_properties : Array(String)

        # The ID of the workspace whose values the operation returns.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The name of the component whose property values the operation returns.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # This string specifies the path to the composite component, starting from the top-level component.
        @[JSON::Field(key: "componentPath")]
        getter component_path : String?

        # The ID of the component type whose property values the operation returns.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        # The ID of the entity whose property values the operation returns.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The maximum number of results to return at one time. The default is 25. Valid Range: Minimum value
        # of 1. Maximum value of 250.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The property group name.
        @[JSON::Field(key: "propertyGroupName")]
        getter property_group_name : String?

        # The tabular conditions.
        @[JSON::Field(key: "tabularConditions")]
        getter tabular_conditions : Types::TabularConditions?

        def initialize(
          @selected_properties : Array(String),
          @workspace_id : String,
          @component_name : String? = nil,
          @component_path : String? = nil,
          @component_type_id : String? = nil,
          @entity_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @property_group_name : String? = nil,
          @tabular_conditions : Types::TabularConditions? = nil
        )
        end
      end

      struct GetPropertyValueResponse
        include JSON::Serializable

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object that maps strings to the properties and latest property values in the response. Each
        # string in the mapping must be unique to this object.
        @[JSON::Field(key: "propertyValues")]
        getter property_values : Hash(String, Types::PropertyLatestValue)?

        # A table of property values.
        @[JSON::Field(key: "tabularPropertyValues")]
        getter tabular_property_values : Array(Array(Hash(String, Types::DataValue)))?

        def initialize(
          @next_token : String? = nil,
          @property_values : Hash(String, Types::PropertyLatestValue)? = nil,
          @tabular_property_values : Array(Array(Hash(String, Types::DataValue)))? = nil
        )
        end
      end

      struct GetSceneRequest
        include JSON::Serializable

        # The ID of the scene.
        @[JSON::Field(key: "sceneId")]
        getter scene_id : String

        # The ID of the workspace that contains the scene.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @scene_id : String,
          @workspace_id : String
        )
        end
      end

      struct GetSceneResponse
        include JSON::Serializable

        # The ARN of the scene.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The relative path that specifies the location of the content definition file.
        @[JSON::Field(key: "contentLocation")]
        getter content_location : String

        # The date and time when the scene was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The ID of the scene.
        @[JSON::Field(key: "sceneId")]
        getter scene_id : String

        # The date and time when the scene was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The ID of the workspace that contains the scene.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A list of capabilities that the scene uses to render.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # The description of the scene.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The SceneResponse error.
        @[JSON::Field(key: "error")]
        getter error : Types::SceneError?

        # The generated scene metadata.
        @[JSON::Field(key: "generatedSceneMetadata")]
        getter generated_scene_metadata : Hash(String, String)?

        # The response metadata.
        @[JSON::Field(key: "sceneMetadata")]
        getter scene_metadata : Hash(String, String)?

        def initialize(
          @arn : String,
          @content_location : String,
          @creation_date_time : Time,
          @scene_id : String,
          @update_date_time : Time,
          @workspace_id : String,
          @capabilities : Array(String)? = nil,
          @description : String? = nil,
          @error : Types::SceneError? = nil,
          @generated_scene_metadata : Hash(String, String)? = nil,
          @scene_metadata : Hash(String, String)? = nil
        )
        end
      end

      struct GetSyncJobRequest
        include JSON::Serializable

        # The sync source. Currently the only supported syncSource is SITEWISE .
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String

        # The workspace ID.
        @[JSON::Field(key: "workspace")]
        getter workspace_id : String?

        def initialize(
          @sync_source : String,
          @workspace_id : String? = nil
        )
        end
      end

      struct GetSyncJobResponse
        include JSON::Serializable

        # The sync job ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation date and time.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The SyncJob response status.
        @[JSON::Field(key: "status")]
        getter status : Types::SyncJobStatus

        # The sync IAM role.
        @[JSON::Field(key: "syncRole")]
        getter sync_role : String

        # The sync soucre. Currently the only supported syncSource is SITEWISE .
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String

        # The update date and time.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The ID of the workspace that contains the sync job.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @status : Types::SyncJobStatus,
          @sync_role : String,
          @sync_source : String,
          @update_date_time : Time,
          @workspace_id : String
        )
        end
      end

      struct GetWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      struct GetWorkspaceResponse
        include JSON::Serializable

        # The ARN of the workspace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the workspace was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The date and time when the workspace was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The description of the workspace.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of services that are linked to the workspace.
        @[JSON::Field(key: "linkedServices")]
        getter linked_services : Array(String)?

        # The ARN of the execution role associated with the workspace.
        @[JSON::Field(key: "role")]
        getter role : String?

        # The ARN of the S3 bucket where resources associated with the workspace are stored.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : String?

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @update_date_time : Time,
          @workspace_id : String,
          @description : String? = nil,
          @linked_services : Array(String)? = nil,
          @role : String? = nil,
          @s3_location : String? = nil
        )
        end
      end

      # An unexpected error has occurred.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that specifies how to interpolate data in a list.
      struct InterpolationParameters
        include JSON::Serializable

        # The interpolation type.
        @[JSON::Field(key: "interpolationType")]
        getter interpolation_type : String?

        # The interpolation time interval in seconds.
        @[JSON::Field(key: "intervalInSeconds")]
        getter interval_in_seconds : Int64?

        def initialize(
          @interpolation_type : String? = nil,
          @interval_in_seconds : Int64? = nil
        )
        end
      end

      # The metadata transfer job AWS IoT SiteWise source configuration.
      struct IotSiteWiseSourceConfiguration
        include JSON::Serializable

        # The AWS IoT SiteWise soucre configuration filters.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::IotSiteWiseSourceConfigurationFilter)?

        def initialize(
          @filters : Array(Types::IotSiteWiseSourceConfigurationFilter)? = nil
        )
        end
      end

      # The AWS IoT SiteWise soucre configuration filter.[need held with desc here]
      struct IotSiteWiseSourceConfigurationFilter
        include JSON::Serializable

        # Filter by asset.
        @[JSON::Field(key: "filterByAsset")]
        getter filter_by_asset : Types::FilterByAsset?

        # Filter by asset model.
        @[JSON::Field(key: "filterByAssetModel")]
        getter filter_by_asset_model : Types::FilterByAssetModel?

        def initialize(
          @filter_by_asset : Types::FilterByAsset? = nil,
          @filter_by_asset_model : Types::FilterByAssetModel? = nil
        )
        end
      end

      # The metadata transfer job AWS IoT TwinMaker destination configuration.
      struct IotTwinMakerDestinationConfiguration
        include JSON::Serializable

        # The IoT TwinMaker workspace.
        @[JSON::Field(key: "workspace")]
        getter workspace : String

        def initialize(
          @workspace : String
        )
        end
      end

      # The metadata transfer job AWS IoT TwinMaker source configuration.
      struct IotTwinMakerSourceConfiguration
        include JSON::Serializable

        # The IoT TwinMaker workspace.
        @[JSON::Field(key: "workspace")]
        getter workspace : String

        # The metadata transfer job AWS IoT TwinMaker source configuration filters.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::IotTwinMakerSourceConfigurationFilter)?

        def initialize(
          @workspace : String,
          @filters : Array(Types::IotTwinMakerSourceConfigurationFilter)? = nil
        )
        end
      end

      # The metadata transfer job AWS IoT TwinMaker source configuration filter.
      struct IotTwinMakerSourceConfigurationFilter
        include JSON::Serializable

        # Filter by component type.
        @[JSON::Field(key: "filterByComponentType")]
        getter filter_by_component_type : Types::FilterByComponentType?

        # Filter by entity.
        @[JSON::Field(key: "filterByEntity")]
        getter filter_by_entity : Types::FilterByEntity?

        def initialize(
          @filter_by_component_type : Types::FilterByComponentType? = nil,
          @filter_by_entity : Types::FilterByEntity? = nil
        )
        end
      end

      # The Lambda function.
      struct LambdaFunction
        include JSON::Serializable

        # The ARN of the Lambda function.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # An object that filters items in a list of component types. Only one object is accepted as a valid
      # input.
      struct ListComponentTypesFilter
        include JSON::Serializable

        # The component type that the component types in the list extend.
        @[JSON::Field(key: "extendsFrom")]
        getter extends_from : String?

        # A Boolean value that specifies whether the component types in the list are abstract.
        @[JSON::Field(key: "isAbstract")]
        getter is_abstract : Bool?

        # The namespace to which the component types in the list belong.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @extends_from : String? = nil,
          @is_abstract : Bool? = nil,
          @namespace : String? = nil
        )
        end
      end

      struct ListComponentTypesRequest
        include JSON::Serializable

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A list of objects that filter the request.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListComponentTypesFilter)?

        # The maximum number of results to return at one time. The default is 25. Valid Range: Minimum value
        # of 1. Maximum value of 250.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspace_id : String,
          @filters : Array(Types::ListComponentTypesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComponentTypesResponse
        include JSON::Serializable

        # A list of objects that contain information about the component types.
        @[JSON::Field(key: "componentTypeSummaries")]
        getter component_type_summaries : Array(Types::ComponentTypeSummary)

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # Specifies the maximum number of results to display.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_type_summaries : Array(Types::ComponentTypeSummary),
          @workspace_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComponentsRequest
        include JSON::Serializable

        # The ID for the entity whose metadata (component/properties) is returned by the operation.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The workspace ID.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # This string specifies the path to the composite component, starting from the top-level component.
        @[JSON::Field(key: "componentPath")]
        getter component_path : String?

        # The maximum number of results returned at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entity_id : String,
          @workspace_id : String,
          @component_path : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComponentsResponse
        include JSON::Serializable

        # A list of objects that contain information about the components.
        @[JSON::Field(key: "componentSummaries")]
        getter component_summaries : Array(Types::ComponentSummary)

        # The string that specifies the next page of component results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_summaries : Array(Types::ComponentSummary),
          @next_token : String? = nil
        )
        end
      end

      # An object that filters items in a list of entities.
      struct ListEntitiesFilter
        include JSON::Serializable

        # The ID of the component type in the entities in the list.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String?

        # The external-Id property of a component. The external-Id property is the primary key of an external
        # storage system.
        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The parent of the entities in the list.
        @[JSON::Field(key: "parentEntityId")]
        getter parent_entity_id : String?

        def initialize(
          @component_type_id : String? = nil,
          @external_id : String? = nil,
          @parent_entity_id : String? = nil
        )
        end
      end

      struct ListEntitiesRequest
        include JSON::Serializable

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A list of objects that filter the request. Only one object is accepted as a valid input.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListEntitiesFilter)?

        # The maximum number of results to return at one time. The default is 25. Valid Range: Minimum value
        # of 1. Maximum value of 250.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspace_id : String,
          @filters : Array(Types::ListEntitiesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntitiesResponse
        include JSON::Serializable

        # A list of objects that contain information about the entities.
        @[JSON::Field(key: "entitySummaries")]
        getter entity_summaries : Array(Types::EntitySummary)?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entity_summaries : Array(Types::EntitySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The ListMetadataTransferJobs filter.
      struct ListMetadataTransferJobsFilter
        include JSON::Serializable

        # The filter state.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The workspace Id.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String?

        def initialize(
          @state : String? = nil,
          @workspace_id : String? = nil
        )
        end
      end

      struct ListMetadataTransferJobsRequest
        include JSON::Serializable

        # The metadata transfer job's destination type.
        @[JSON::Field(key: "destinationType")]
        getter destination_type : String

        # The metadata transfer job's source type.
        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # An object that filters metadata transfer jobs.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListMetadataTransferJobsFilter)?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @destination_type : String,
          @source_type : String,
          @filters : Array(Types::ListMetadataTransferJobsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMetadataTransferJobsResponse
        include JSON::Serializable

        # The metadata transfer job summaries.
        @[JSON::Field(key: "metadataTransferJobSummaries")]
        getter metadata_transfer_job_summaries : Array(Types::MetadataTransferJobSummary)

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @metadata_transfer_job_summaries : Array(Types::MetadataTransferJobSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListPropertiesRequest
        include JSON::Serializable

        # The ID for the entity whose metadata (component/properties) is returned by the operation.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The workspace ID.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The name of the component whose properties are returned by the operation.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # This string specifies the path to the composite component, starting from the top-level component.
        @[JSON::Field(key: "componentPath")]
        getter component_path : String?

        # The maximum number of results returned at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entity_id : String,
          @workspace_id : String,
          @component_name : String? = nil,
          @component_path : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPropertiesResponse
        include JSON::Serializable

        # A list of objects that contain information about the properties.
        @[JSON::Field(key: "propertySummaries")]
        getter property_summaries : Array(Types::PropertySummary)

        # The string that specifies the next page of property results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @property_summaries : Array(Types::PropertySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListScenesRequest
        include JSON::Serializable

        # The ID of the workspace that contains the scenes.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # Specifies the maximum number of results to display.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspace_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListScenesResponse
        include JSON::Serializable

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of objects that contain information about the scenes.
        @[JSON::Field(key: "sceneSummaries")]
        getter scene_summaries : Array(Types::SceneSummary)?

        def initialize(
          @next_token : String? = nil,
          @scene_summaries : Array(Types::SceneSummary)? = nil
        )
        end
      end

      struct ListSyncJobsRequest
        include JSON::Serializable

        # The ID of the workspace that contains the sync job.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The maximum number of results to return at one time. The default is 50. Valid Range: Minimum value
        # of 0. Maximum value of 200.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspace_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSyncJobsResponse
        include JSON::Serializable

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The listed SyncJob summaries.
        @[JSON::Field(key: "syncJobSummaries")]
        getter sync_job_summaries : Array(Types::SyncJobSummary)?

        def initialize(
          @next_token : String? = nil,
          @sync_job_summaries : Array(Types::SyncJobSummary)? = nil
        )
        end
      end

      struct ListSyncResourcesRequest
        include JSON::Serializable

        # The sync source. Currently the only supported syncSource is SITEWISE .
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String

        # The ID of the workspace that contains the sync job.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A list of objects that filter the request. The following filter combinations are supported: Filter
        # with state Filter with ResourceType and ResourceId Filter with ResourceType and ExternalId
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SyncResourceFilter)?

        # The maximum number of results to return at one time. The default is 50. Valid Range: Minimum value
        # of 0. Maximum value of 200.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sync_source : String,
          @workspace_id : String,
          @filters : Array(Types::SyncResourceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSyncResourcesResponse
        include JSON::Serializable

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sync resources.
        @[JSON::Field(key: "syncResources")]
        getter sync_resources : Array(Types::SyncResourceSummary)?

        def initialize(
          @next_token : String? = nil,
          @sync_resources : Array(Types::SyncResourceSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # The maximum number of results to return at one time. The default is 25. Valid Range: Minimum value
        # of 1. Maximum value of 250.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Metadata that you can use to manage a resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @next_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListWorkspacesRequest
        include JSON::Serializable

        # The maximum number of results to return at one time. The default is 25. Valid Range: Minimum value
        # of 1. Maximum value of 250.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkspacesResponse
        include JSON::Serializable

        # The string that specifies the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of objects that contain information about the workspaces.
        @[JSON::Field(key: "workspaceSummaries")]
        getter workspace_summaries : Array(Types::WorkspaceSummary)?

        def initialize(
          @next_token : String? = nil,
          @workspace_summaries : Array(Types::WorkspaceSummary)? = nil
        )
        end
      end

      # The metadata transfer job's progress.
      struct MetadataTransferJobProgress
        include JSON::Serializable

        # The failed count.
        @[JSON::Field(key: "failedCount")]
        getter failed_count : Int32?

        # The skipped count.
        @[JSON::Field(key: "skippedCount")]
        getter skipped_count : Int32?

        # The succeeded count.
        @[JSON::Field(key: "succeededCount")]
        getter succeeded_count : Int32?

        # The total count. [of what]
        @[JSON::Field(key: "totalCount")]
        getter total_count : Int32?

        def initialize(
          @failed_count : Int32? = nil,
          @skipped_count : Int32? = nil,
          @succeeded_count : Int32? = nil,
          @total_count : Int32? = nil
        )
        end
      end

      # The metadata transfer job status.
      struct MetadataTransferJobStatus
        include JSON::Serializable

        # The metadata transfer job error.
        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        # The queued position.
        @[JSON::Field(key: "queuedPosition")]
        getter queued_position : Int32?

        # The metadata transfer job state.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @error : Types::ErrorDetails? = nil,
          @queued_position : Int32? = nil,
          @state : String? = nil
        )
        end
      end

      # The metadata transfer job summary.
      struct MetadataTransferJobSummary
        include JSON::Serializable

        # The metadata transfer job summary ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The metadata transfer job summary creation DateTime object.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The metadata transfer job summary Id.
        @[JSON::Field(key: "metadataTransferJobId")]
        getter metadata_transfer_job_id : String

        # The metadata transfer job summary status.
        @[JSON::Field(key: "status")]
        getter status : Types::MetadataTransferJobStatus

        # The metadata transfer job summary update DateTime object
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The metadata transfer job summary progess.
        @[JSON::Field(key: "progress")]
        getter progress : Types::MetadataTransferJobProgress?

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @metadata_transfer_job_id : String,
          @status : Types::MetadataTransferJobStatus,
          @update_date_time : Time,
          @progress : Types::MetadataTransferJobProgress? = nil
        )
        end
      end

      # Filter criteria that orders the return output. It can be sorted in ascending or descending order.
      struct OrderBy
        include JSON::Serializable

        # The property name.
        @[JSON::Field(key: "propertyName")]
        getter property_name : String

        # The set order that filters results.
        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @property_name : String,
          @order : String? = nil
        )
        end
      end

      # The parent entity update request.
      struct ParentEntityUpdateRequest
        include JSON::Serializable

        # The type of the update.
        @[JSON::Field(key: "updateType")]
        getter update_type : String

        # The ID of the parent entity.
        @[JSON::Field(key: "parentEntityId")]
        getter parent_entity_id : String?

        def initialize(
          @update_type : String,
          @parent_entity_id : String? = nil
        )
        end
      end

      # The pricing plan.
      struct PricingPlan
        include JSON::Serializable

        # The effective date and time of the pricing plan.
        @[JSON::Field(key: "effectiveDateTime")]
        getter effective_date_time : Time

        # The pricing mode.
        @[JSON::Field(key: "pricingMode")]
        getter pricing_mode : String

        # The set date and time for updating a pricing plan.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The update reason for changing a pricing plan.
        @[JSON::Field(key: "updateReason")]
        getter update_reason : String

        # The billable entity count.
        @[JSON::Field(key: "billableEntityCount")]
        getter billable_entity_count : Int64?

        # The pricing plan's bundle information.
        @[JSON::Field(key: "bundleInformation")]
        getter bundle_information : Types::BundleInformation?

        def initialize(
          @effective_date_time : Time,
          @pricing_mode : String,
          @update_date_time : Time,
          @update_reason : String,
          @billable_entity_count : Int64? = nil,
          @bundle_information : Types::BundleInformation? = nil
        )
        end
      end

      # An object that sets information about a property.
      struct PropertyDefinitionRequest
        include JSON::Serializable

        # A mapping that specifies configuration information about the property. Use this field to specify
        # information that you read from and write to an external source.
        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        # An object that contains information about the data type.
        @[JSON::Field(key: "dataType")]
        getter data_type : Types::DataType?

        # An object that contains the default value.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : Types::DataValue?

        # A friendly name for the property.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # A Boolean value that specifies whether the property ID comes from an external data store.
        @[JSON::Field(key: "isExternalId")]
        getter is_external_id : Bool?

        # A Boolean value that specifies whether the property is required.
        @[JSON::Field(key: "isRequiredInEntity")]
        getter is_required_in_entity : Bool?

        # A Boolean value that specifies whether the property is stored externally.
        @[JSON::Field(key: "isStoredExternally")]
        getter is_stored_externally : Bool?

        # A Boolean value that specifies whether the property consists of time series data.
        @[JSON::Field(key: "isTimeSeries")]
        getter is_time_series : Bool?

        def initialize(
          @configuration : Hash(String, String)? = nil,
          @data_type : Types::DataType? = nil,
          @default_value : Types::DataValue? = nil,
          @display_name : String? = nil,
          @is_external_id : Bool? = nil,
          @is_required_in_entity : Bool? = nil,
          @is_stored_externally : Bool? = nil,
          @is_time_series : Bool? = nil
        )
        end
      end

      # An object that contains response data from a property definition request.
      struct PropertyDefinitionResponse
        include JSON::Serializable

        # An object that contains information about the data type.
        @[JSON::Field(key: "dataType")]
        getter data_type : Types::DataType

        # A Boolean value that specifies whether the property ID comes from an external data store.
        @[JSON::Field(key: "isExternalId")]
        getter is_external_id : Bool

        # A Boolean value that specifies whether the property definition can be updated.
        @[JSON::Field(key: "isFinal")]
        getter is_final : Bool

        # A Boolean value that specifies whether the property definition is imported from an external data
        # store.
        @[JSON::Field(key: "isImported")]
        getter is_imported : Bool

        # A Boolean value that specifies whether the property definition is inherited from a parent entity.
        @[JSON::Field(key: "isInherited")]
        getter is_inherited : Bool

        # A Boolean value that specifies whether the property is required in an entity.
        @[JSON::Field(key: "isRequiredInEntity")]
        getter is_required_in_entity : Bool

        # A Boolean value that specifies whether the property is stored externally.
        @[JSON::Field(key: "isStoredExternally")]
        getter is_stored_externally : Bool

        # A Boolean value that specifies whether the property consists of time series data.
        @[JSON::Field(key: "isTimeSeries")]
        getter is_time_series : Bool

        # A mapping that specifies configuration information about the property.
        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        # An object that contains the default value.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : Types::DataValue?

        # A friendly name for the property.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @data_type : Types::DataType,
          @is_external_id : Bool,
          @is_final : Bool,
          @is_imported : Bool,
          @is_inherited : Bool,
          @is_required_in_entity : Bool,
          @is_stored_externally : Bool,
          @is_time_series : Bool,
          @configuration : Hash(String, String)? = nil,
          @default_value : Types::DataValue? = nil,
          @display_name : String? = nil
        )
        end
      end

      # An object that filters items returned by a property request.
      struct PropertyFilter
        include JSON::Serializable

        # The operator associated with this property filter.
        @[JSON::Field(key: "operator")]
        getter operator : String?

        # The property name associated with this property filter.
        @[JSON::Field(key: "propertyName")]
        getter property_name : String?

        # The value associated with this property filter.
        @[JSON::Field(key: "value")]
        getter value : Types::DataValue?

        def initialize(
          @operator : String? = nil,
          @property_name : String? = nil,
          @value : Types::DataValue? = nil
        )
        end
      end

      struct PropertyGroupRequest
        include JSON::Serializable

        # The group type.
        @[JSON::Field(key: "groupType")]
        getter group_type : String?

        # The names of properties.
        @[JSON::Field(key: "propertyNames")]
        getter property_names : Array(String)?

        def initialize(
          @group_type : String? = nil,
          @property_names : Array(String)? = nil
        )
        end
      end

      # The property group response
      struct PropertyGroupResponse
        include JSON::Serializable

        # The group types.
        @[JSON::Field(key: "groupType")]
        getter group_type : String

        # A Boolean value that specifies whether the property group is inherited from a parent entity
        @[JSON::Field(key: "isInherited")]
        getter is_inherited : Bool

        # The names of properties.
        @[JSON::Field(key: "propertyNames")]
        getter property_names : Array(String)

        def initialize(
          @group_type : String,
          @is_inherited : Bool,
          @property_names : Array(String)
        )
        end
      end

      # The latest value of the property.
      struct PropertyLatestValue
        include JSON::Serializable

        # An object that specifies information about a property.
        @[JSON::Field(key: "propertyReference")]
        getter property_reference : Types::EntityPropertyReference

        # The value of the property.
        @[JSON::Field(key: "propertyValue")]
        getter property_value : Types::DataValue?

        def initialize(
          @property_reference : Types::EntityPropertyReference,
          @property_value : Types::DataValue? = nil
        )
        end
      end

      # An object that sets information about a property.
      struct PropertyRequest
        include JSON::Serializable

        # An object that specifies information about a property.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PropertyDefinitionRequest?

        # The update type of the update property request.
        @[JSON::Field(key: "updateType")]
        getter update_type : String?

        # The value of the property.
        @[JSON::Field(key: "value")]
        getter value : Types::DataValue?

        def initialize(
          @definition : Types::PropertyDefinitionRequest? = nil,
          @update_type : String? = nil,
          @value : Types::DataValue? = nil
        )
        end
      end

      # An object that contains information about a property response.
      struct PropertyResponse
        include JSON::Serializable

        # This flag notes whether all values of a list or map type property are returned in the API response.
        # The maximum number of values per property returned is 50.
        @[JSON::Field(key: "areAllPropertyValuesReturned")]
        getter are_all_property_values_returned : Bool?

        # An object that specifies information about a property.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PropertyDefinitionResponse?

        # The value of the property.
        @[JSON::Field(key: "value")]
        getter value : Types::DataValue?

        def initialize(
          @are_all_property_values_returned : Bool? = nil,
          @definition : Types::PropertyDefinitionResponse? = nil,
          @value : Types::DataValue? = nil
        )
        end
      end

      # This is an object that contains the information of a property.
      struct PropertySummary
        include JSON::Serializable

        # This is the name of the property.
        @[JSON::Field(key: "propertyName")]
        getter property_name : String

        # This flag notes whether all values of a list or map type property are returned in the API response.
        # The maximum number of values per property returned is 50.
        @[JSON::Field(key: "areAllPropertyValuesReturned")]
        getter are_all_property_values_returned : Bool?

        # This is the schema for the property.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PropertyDefinitionResponse?

        # This is the value for the property.
        @[JSON::Field(key: "value")]
        getter value : Types::DataValue?

        def initialize(
          @property_name : String,
          @are_all_property_values_returned : Bool? = nil,
          @definition : Types::PropertyDefinitionResponse? = nil,
          @value : Types::DataValue? = nil
        )
        end
      end

      # An object that contains information about a value for a time series property.
      struct PropertyValue
        include JSON::Serializable

        # An object that specifies a value for a time series property.
        @[JSON::Field(key: "value")]
        getter value : Types::DataValue

        # ISO8601 DateTime of a value for a time series property. The time for when the property value was
        # recorded in ISO 8601 format: YYYY-MM-DDThh:mm:ss[.SSSSSSSSS][Z/±HH:mm] . [YYYY] : year [MM] : month
        # [DD] : day [hh] : hour [mm] : minute [ss] : seconds [.SSSSSSSSS] : additional precision, where
        # precedence is maintained. For example: [.573123] is equal to 573123000 nanoseconds. Z : default
        # timezone UTC ± HH:mm : time zone offset in Hours and Minutes. Required sub-fields :
        # YYYY-MM-DDThh:mm:ss and [Z/±HH:mm]
        @[JSON::Field(key: "time")]
        getter time : String?

        # The timestamp of a value for a time series property.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @value : Types::DataValue,
          @time : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # An object that specifies information about time series property values. This object is used and
      # consumed by the BatchPutPropertyValues action.
      struct PropertyValueEntry
        include JSON::Serializable

        # An object that contains information about the entity that has the property.
        @[JSON::Field(key: "entityPropertyReference")]
        getter entity_property_reference : Types::EntityPropertyReference

        # A list of objects that specify time series property values.
        @[JSON::Field(key: "propertyValues")]
        getter property_values : Array(Types::PropertyValue)?

        def initialize(
          @entity_property_reference : Types::EntityPropertyReference,
          @property_values : Array(Types::PropertyValue)? = nil
        )
        end
      end

      # The history of values for a time series property.
      struct PropertyValueHistory
        include JSON::Serializable

        # An object that uniquely identifies an entity property.
        @[JSON::Field(key: "entityPropertyReference")]
        getter entity_property_reference : Types::EntityPropertyReference

        # A list of objects that contain information about the values in the history of a time series
        # property.
        @[JSON::Field(key: "values")]
        getter values : Array(Types::PropertyValue)?

        def initialize(
          @entity_property_reference : Types::EntityPropertyReference,
          @values : Array(Types::PropertyValue)? = nil
        )
        end
      end

      struct QueryResultValue
        include JSON::Serializable

        def initialize
        end
      end

      # The query timeout exception.
      struct QueryTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that specifies a relationship with another component type.
      struct Relationship
        include JSON::Serializable

        # The type of the relationship.
        @[JSON::Field(key: "relationshipType")]
        getter relationship_type : String?

        # The ID of the target component type associated with this relationship.
        @[JSON::Field(key: "targetComponentTypeId")]
        getter target_component_type_id : String?

        def initialize(
          @relationship_type : String? = nil,
          @target_component_type_id : String? = nil
        )
        end
      end

      # A value that associates a component and an entity.
      struct RelationshipValue
        include JSON::Serializable

        # The name of the target component associated with the relationship value.
        @[JSON::Field(key: "targetComponentName")]
        getter target_component_name : String?

        # The ID of the target entity associated with this relationship value.
        @[JSON::Field(key: "targetEntityId")]
        getter target_entity_id : String?

        def initialize(
          @target_component_name : String? = nil,
          @target_entity_id : String? = nil
        )
        end
      end

      # The resource wasn't found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a single row in the query results.
      struct Row
        include JSON::Serializable

        # The data in a row of query results.
        @[JSON::Field(key: "rowData")]
        getter row_data : Array(Types::QueryResultValue)?

        def initialize(
          @row_data : Array(Types::QueryResultValue)? = nil
        )
        end
      end

      # The S3 destination configuration.
      struct S3DestinationConfiguration
        include JSON::Serializable

        # The S3 destination configuration location.
        @[JSON::Field(key: "location")]
        getter location : String

        def initialize(
          @location : String
        )
        end
      end

      # The S3 destination source configuration.
      struct S3SourceConfiguration
        include JSON::Serializable

        # The S3 destination source configuration location.
        @[JSON::Field(key: "location")]
        getter location : String

        def initialize(
          @location : String
        )
        end
      end

      # The scene error.
      struct SceneError
        include JSON::Serializable

        # The SceneError code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The SceneError message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # An object that contains information about a scene.
      struct SceneSummary
        include JSON::Serializable

        # The ARN of the scene.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The relative path that specifies the location of the content definition file.
        @[JSON::Field(key: "contentLocation")]
        getter content_location : String

        # The date and time when the scene was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The ID of the scene.
        @[JSON::Field(key: "sceneId")]
        getter scene_id : String

        # The date and time when the scene was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The scene description.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @content_location : String,
          @creation_date_time : Time,
          @scene_id : String,
          @update_date_time : Time,
          @description : String? = nil
        )
        end
      end

      # The service quota was exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The source configuration.
      struct SourceConfiguration
        include JSON::Serializable

        # The source configuration type.
        @[JSON::Field(key: "type")]
        getter type : String

        # The source configuration IoT SiteWise configuration.
        @[JSON::Field(key: "iotSiteWiseConfiguration")]
        getter iot_site_wise_configuration : Types::IotSiteWiseSourceConfiguration?

        # The source configuration IoT TwinMaker configuration.
        @[JSON::Field(key: "iotTwinMakerConfiguration")]
        getter iot_twin_maker_configuration : Types::IotTwinMakerSourceConfiguration?

        # The source configuration S3 configuration.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::S3SourceConfiguration?

        def initialize(
          @type : String,
          @iot_site_wise_configuration : Types::IotSiteWiseSourceConfiguration? = nil,
          @iot_twin_maker_configuration : Types::IotTwinMakerSourceConfiguration? = nil,
          @s3_configuration : Types::S3SourceConfiguration? = nil
        )
        end
      end

      # An object that represents the status of an entity, component, component type, or workspace.
      struct Status
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        # The current state of the entity, component, component type, or workspace.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @error : Types::ErrorDetails? = nil,
          @state : String? = nil
        )
        end
      end

      # The SyncJob status.
      struct SyncJobStatus
        include JSON::Serializable

        # The SyncJob error.
        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        # The SyncJob status state.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @error : Types::ErrorDetails? = nil,
          @state : String? = nil
        )
        end
      end

      # The SyncJob summary.
      struct SyncJobSummary
        include JSON::Serializable

        # The SyncJob summary ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The creation date and time.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The SyncJob summaries status.
        @[JSON::Field(key: "status")]
        getter status : Types::SyncJobStatus?

        # The sync source.
        @[JSON::Field(key: "syncSource")]
        getter sync_source : String?

        # The update date and time.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time?

        # The ID of the workspace that contains the sync job.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String?

        def initialize(
          @arn : String? = nil,
          @creation_date_time : Time? = nil,
          @status : Types::SyncJobStatus? = nil,
          @sync_source : String? = nil,
          @update_date_time : Time? = nil,
          @workspace_id : String? = nil
        )
        end
      end

      # The sync resource filter.
      struct SyncResourceFilter
        include JSON::Serializable

        # The external ID.
        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The sync resource filter resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The sync resource filter resource type
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The sync resource filter's state.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @external_id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The sync resource status.
      struct SyncResourceStatus
        include JSON::Serializable

        # The status error.
        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetails?

        # The sync resource status state.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @error : Types::ErrorDetails? = nil,
          @state : String? = nil
        )
        end
      end

      # The sync resource summary.
      struct SyncResourceSummary
        include JSON::Serializable

        # The external ID.
        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The sync resource summary status.
        @[JSON::Field(key: "status")]
        getter status : Types::SyncResourceStatus?

        # The update date and time.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time?

        def initialize(
          @external_id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @status : Types::SyncResourceStatus? = nil,
          @update_date_time : Time? = nil
        )
        end
      end

      # The tabular conditions.
      struct TabularConditions
        include JSON::Serializable

        # Filter criteria that orders the output. It can be sorted in ascending or descending order.
        @[JSON::Field(key: "orderBy")]
        getter order_by : Array(Types::OrderBy)?

        # You can filter the request using various logical operators and a key-value format. For example:
        # {"key": "serverType", "value": "webServer"}
        @[JSON::Field(key: "propertyFilters")]
        getter property_filters : Array(Types::PropertyFilter)?

        def initialize(
          @order_by : Array(Types::OrderBy)? = nil,
          @property_filters : Array(Types::PropertyFilter)? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # Metadata to add to this resource.
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

      # The rate exceeds the limit.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of tags exceeds the limit.
      struct TooManyTagsException
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

        # The ARN of the resource.
        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # A list of tag key names to remove from the resource. You don't specify the value. Both the key and
        # its associated value are removed.
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

      struct UpdateComponentTypeRequest
        include JSON::Serializable

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The component type name.
        @[JSON::Field(key: "componentTypeName")]
        getter component_type_name : String?

        # This is an object that maps strings to compositeComponentTypes of the componentType .
        # CompositeComponentType is referenced by componentTypeId .
        @[JSON::Field(key: "compositeComponentTypes")]
        getter composite_component_types : Hash(String, Types::CompositeComponentTypeRequest)?

        # The description of the component type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the component type that this component type extends.
        @[JSON::Field(key: "extendsFrom")]
        getter extends_from : Array(String)?

        # An object that maps strings to the functions in the component type. Each string in the mapping must
        # be unique to this object.
        @[JSON::Field(key: "functions")]
        getter functions : Hash(String, Types::FunctionRequest)?

        # A Boolean value that specifies whether an entity can have more than one component of this type.
        @[JSON::Field(key: "isSingleton")]
        getter is_singleton : Bool?

        # An object that maps strings to the property definitions in the component type. Each string in the
        # mapping must be unique to this object.
        @[JSON::Field(key: "propertyDefinitions")]
        getter property_definitions : Hash(String, Types::PropertyDefinitionRequest)?

        # The property groups.
        @[JSON::Field(key: "propertyGroups")]
        getter property_groups : Hash(String, Types::PropertyGroupRequest)?

        def initialize(
          @component_type_id : String,
          @workspace_id : String,
          @component_type_name : String? = nil,
          @composite_component_types : Hash(String, Types::CompositeComponentTypeRequest)? = nil,
          @description : String? = nil,
          @extends_from : Array(String)? = nil,
          @functions : Hash(String, Types::FunctionRequest)? = nil,
          @is_singleton : Bool? = nil,
          @property_definitions : Hash(String, Types::PropertyDefinitionRequest)? = nil,
          @property_groups : Hash(String, Types::PropertyGroupRequest)? = nil
        )
        end
      end

      struct UpdateComponentTypeResponse
        include JSON::Serializable

        # The ARN of the component type.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the component type.
        @[JSON::Field(key: "componentTypeId")]
        getter component_type_id : String

        # The current state of the component type.
        @[JSON::Field(key: "state")]
        getter state : String

        # The ID of the workspace that contains the component type.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @arn : String,
          @component_type_id : String,
          @state : String,
          @workspace_id : String
        )
        end
      end

      struct UpdateEntityRequest
        include JSON::Serializable

        # The ID of the entity.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The ID of the workspace that contains the entity.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # An object that maps strings to the component updates in the request. Each string in the mapping must
        # be unique to this object.
        @[JSON::Field(key: "componentUpdates")]
        getter component_updates : Hash(String, Types::ComponentUpdateRequest)?

        # This is an object that maps strings to compositeComponent updates in the request. Each key of the
        # map represents the componentPath of the compositeComponent .
        @[JSON::Field(key: "compositeComponentUpdates")]
        getter composite_component_updates : Hash(String, Types::CompositeComponentUpdateRequest)?

        # The description of the entity.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the entity.
        @[JSON::Field(key: "entityName")]
        getter entity_name : String?

        # An object that describes the update request for a parent entity.
        @[JSON::Field(key: "parentEntityUpdate")]
        getter parent_entity_update : Types::ParentEntityUpdateRequest?

        def initialize(
          @entity_id : String,
          @workspace_id : String,
          @component_updates : Hash(String, Types::ComponentUpdateRequest)? = nil,
          @composite_component_updates : Hash(String, Types::CompositeComponentUpdateRequest)? = nil,
          @description : String? = nil,
          @entity_name : String? = nil,
          @parent_entity_update : Types::ParentEntityUpdateRequest? = nil
        )
        end
      end

      struct UpdateEntityResponse
        include JSON::Serializable

        # The current state of the entity update.
        @[JSON::Field(key: "state")]
        getter state : String

        # The date and time when the entity was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        def initialize(
          @state : String,
          @update_date_time : Time
        )
        end
      end

      struct UpdatePricingPlanRequest
        include JSON::Serializable

        # The pricing mode.
        @[JSON::Field(key: "pricingMode")]
        getter pricing_mode : String

        # The bundle names.
        @[JSON::Field(key: "bundleNames")]
        getter bundle_names : Array(String)?

        def initialize(
          @pricing_mode : String,
          @bundle_names : Array(String)? = nil
        )
        end
      end

      struct UpdatePricingPlanResponse
        include JSON::Serializable

        # Update the current pricing plan.
        @[JSON::Field(key: "currentPricingPlan")]
        getter current_pricing_plan : Types::PricingPlan

        # Update the pending pricing plan.
        @[JSON::Field(key: "pendingPricingPlan")]
        getter pending_pricing_plan : Types::PricingPlan?

        def initialize(
          @current_pricing_plan : Types::PricingPlan,
          @pending_pricing_plan : Types::PricingPlan? = nil
        )
        end
      end

      struct UpdateSceneRequest
        include JSON::Serializable

        # The ID of the scene.
        @[JSON::Field(key: "sceneId")]
        getter scene_id : String

        # The ID of the workspace that contains the scene.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A list of capabilities that the scene uses to render.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # The relative path that specifies the location of the content definition file.
        @[JSON::Field(key: "contentLocation")]
        getter content_location : String?

        # The description of this scene.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The scene metadata.
        @[JSON::Field(key: "sceneMetadata")]
        getter scene_metadata : Hash(String, String)?

        def initialize(
          @scene_id : String,
          @workspace_id : String,
          @capabilities : Array(String)? = nil,
          @content_location : String? = nil,
          @description : String? = nil,
          @scene_metadata : Hash(String, String)? = nil
        )
        end
      end

      struct UpdateSceneResponse
        include JSON::Serializable

        # The date and time when the scene was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        def initialize(
          @update_date_time : Time
        )
        end
      end

      struct UpdateWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The description of the workspace.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the execution role associated with the workspace.
        @[JSON::Field(key: "role")]
        getter role : String?

        # The ARN of the S3 bucket where resources associated with the workspace are stored.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : String?

        def initialize(
          @workspace_id : String,
          @description : String? = nil,
          @role : String? = nil,
          @s3_location : String? = nil
        )
        end
      end

      struct UpdateWorkspaceResponse
        include JSON::Serializable

        # The date and time of the current update.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        def initialize(
          @update_date_time : Time
        )
        end
      end

      # Failed
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains information about a workspace.
      struct WorkspaceSummary
        include JSON::Serializable

        # The ARN of the workspace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the workspace was created.
        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time

        # The date and time when the workspace was last updated.
        @[JSON::Field(key: "updateDateTime")]
        getter update_date_time : Time

        # The ID of the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The description of the workspace.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of services that are linked to the workspace.
        @[JSON::Field(key: "linkedServices")]
        getter linked_services : Array(String)?

        def initialize(
          @arn : String,
          @creation_date_time : Time,
          @update_date_time : Time,
          @workspace_id : String,
          @description : String? = nil,
          @linked_services : Array(String)? = nil
        )
        end
      end
    end
  end
end
