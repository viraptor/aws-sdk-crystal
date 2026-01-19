require "json"
require "time"

module AwsSdk
  module AppIntegrations
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Summary information about the Application Association.
      struct ApplicationAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Application.
        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The Amazon Resource Name (ARN) of the Application Association.
        @[JSON::Field(key: "ApplicationAssociationArn")]
        getter application_association_arn : String?

        # The identifier for the client that is associated with the Application Association.
        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        def initialize(
          @application_arn : String? = nil,
          @application_association_arn : String? = nil,
          @client_id : String? = nil
        )
        end
      end

      # The configuration settings for the application.
      struct ApplicationConfig
        include JSON::Serializable

        # The contact handling configuration for the application.
        @[JSON::Field(key: "ContactHandling")]
        getter contact_handling : Types::ContactHandling?

        def initialize(
          @contact_handling : Types::ContactHandling? = nil
        )
        end
      end

      # The configuration for where the application should be loaded from.
      struct ApplicationSourceConfig
        include JSON::Serializable

        # The external URL source for the application.
        @[JSON::Field(key: "ExternalUrlConfig")]
        getter external_url_config : Types::ExternalUrlConfig?

        def initialize(
          @external_url_config : Types::ExternalUrlConfig? = nil
        )
        end
      end

      # Summary information about the Application.
      struct ApplicationSummary
        include JSON::Serializable

        # The type of application.
        @[JSON::Field(key: "ApplicationType")]
        getter application_type : String?

        # The Amazon Resource Name (ARN) of the Application.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time when the application was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # A unique identifier for the Application.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Indicates whether the application is a service.
        @[JSON::Field(key: "IsService")]
        getter is_service : Bool?

        # The time when the application was last modified.
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the application.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The namespace of the application.
        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        def initialize(
          @application_type : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @id : String? = nil,
          @is_service : Bool? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # The contact handling configuration for the application.
      struct ContactHandling
        include JSON::Serializable

        # Indicates whether the application refreshes for each contact or refreshes only with each new browser
        # session.
        @[JSON::Field(key: "Scope")]
        getter scope : String?

        def initialize(
          @scope : String? = nil
        )
        end
      end

      struct CreateApplicationRequest
        include JSON::Serializable

        # The configuration for where the application should be loaded from.
        @[JSON::Field(key: "ApplicationSourceConfig")]
        getter application_source_config : Types::ApplicationSourceConfig

        # The name of the application.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The namespace of the application.
        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # The configuration settings for the application.
        @[JSON::Field(key: "ApplicationConfig")]
        getter application_config : Types::ApplicationConfig?

        # The type of application.
        @[JSON::Field(key: "ApplicationType")]
        getter application_type : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the application.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The iframe configuration for the application.
        @[JSON::Field(key: "IframeConfig")]
        getter iframe_config : Types::IframeConfig?

        # The maximum time in milliseconds allowed to establish a connection with the workspace.
        @[JSON::Field(key: "InitializationTimeout")]
        getter initialization_timeout : Int32?

        # Indicates whether the application is a service.
        @[JSON::Field(key: "IsService")]
        getter is_service : Bool?

        # The configuration of events or requests that the application has access to.
        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # The events that the application publishes.
        @[JSON::Field(key: "Publications")]
        getter publications : Array(Types::Publication)?

        # The events that the application subscribes.
        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_source_config : Types::ApplicationSourceConfig,
          @name : String,
          @namespace : String,
          @application_config : Types::ApplicationConfig? = nil,
          @application_type : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @iframe_config : Types::IframeConfig? = nil,
          @initialization_timeout : Int32? = nil,
          @is_service : Bool? = nil,
          @permissions : Array(String)? = nil,
          @publications : Array(Types::Publication)? = nil,
          @subscriptions : Array(Types::Subscription)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateApplicationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Application.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A unique identifier for the Application.
        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct CreateDataIntegrationAssociationRequest
        include JSON::Serializable

        # A unique identifier for the DataIntegration.
        @[JSON::Field(key: "Identifier")]
        getter data_integration_identifier : String

        # The mapping of metadata to be extracted from the data.
        @[JSON::Field(key: "ClientAssociationMetadata")]
        getter client_association_metadata : Hash(String, String)?

        # The identifier for the client that is associated with the DataIntegration association.
        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The URI of the data destination.
        @[JSON::Field(key: "DestinationURI")]
        getter destination_uri : String?

        # The configuration for how the files should be pulled from the source.
        @[JSON::Field(key: "ExecutionConfiguration")]
        getter execution_configuration : Types::ExecutionConfiguration?

        @[JSON::Field(key: "ObjectConfiguration")]
        getter object_configuration : Hash(String, Hash(String, Array(String)))?

        def initialize(
          @data_integration_identifier : String,
          @client_association_metadata : Hash(String, String)? = nil,
          @client_id : String? = nil,
          @client_token : String? = nil,
          @destination_uri : String? = nil,
          @execution_configuration : Types::ExecutionConfiguration? = nil,
          @object_configuration : Hash(String, Hash(String, Array(String)))? = nil
        )
        end
      end

      struct CreateDataIntegrationAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the DataIntegration.
        @[JSON::Field(key: "DataIntegrationArn")]
        getter data_integration_arn : String?

        # A unique identifier. for the DataIntegrationAssociation.
        @[JSON::Field(key: "DataIntegrationAssociationId")]
        getter data_integration_association_id : String?

        def initialize(
          @data_integration_arn : String? = nil,
          @data_integration_association_id : String? = nil
        )
        end
      end

      struct CreateDataIntegrationRequest
        include JSON::Serializable

        # The KMS key ARN for the DataIntegration.
        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String

        # The name of the DataIntegration.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description of the DataIntegration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The configuration for what files should be pulled from the source.
        @[JSON::Field(key: "FileConfiguration")]
        getter file_configuration : Types::FileConfiguration?

        # The configuration for what data should be pulled from the source.
        @[JSON::Field(key: "ObjectConfiguration")]
        getter object_configuration : Hash(String, Hash(String, Array(String)))?

        # The name of the data and how often it should be pulled from the source.
        @[JSON::Field(key: "ScheduleConfig")]
        getter schedule_config : Types::ScheduleConfiguration?

        # The URI of the data source.
        @[JSON::Field(key: "SourceURI")]
        getter source_uri : String?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @kms_key : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @file_configuration : Types::FileConfiguration? = nil,
          @object_configuration : Hash(String, Hash(String, Array(String)))? = nil,
          @schedule_config : Types::ScheduleConfiguration? = nil,
          @source_uri : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDataIntegrationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN)
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description of the DataIntegration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The configuration for what files should be pulled from the source.
        @[JSON::Field(key: "FileConfiguration")]
        getter file_configuration : Types::FileConfiguration?

        # A unique identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The KMS key ARN for the DataIntegration.
        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String?

        # The name of the DataIntegration.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The configuration for what data should be pulled from the source.
        @[JSON::Field(key: "ObjectConfiguration")]
        getter object_configuration : Hash(String, Hash(String, Array(String)))?

        # The name of the data and how often it should be pulled from the source.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration?

        # The URI of the data source.
        @[JSON::Field(key: "SourceURI")]
        getter source_uri : String?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @file_configuration : Types::FileConfiguration? = nil,
          @id : String? = nil,
          @kms_key : String? = nil,
          @name : String? = nil,
          @object_configuration : Hash(String, Hash(String, Array(String)))? = nil,
          @schedule_configuration : Types::ScheduleConfiguration? = nil,
          @source_uri : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateEventIntegrationRequest
        include JSON::Serializable

        # The EventBridge bus.
        @[JSON::Field(key: "EventBridgeBus")]
        getter event_bridge_bus : String

        # The event filter.
        @[JSON::Field(key: "EventFilter")]
        getter event_filter : Types::EventFilter

        # The name of the event integration.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the event integration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @event_bridge_bus : String,
          @event_filter : Types::EventFilter,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateEventIntegrationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the event integration.
        @[JSON::Field(key: "EventIntegrationArn")]
        getter event_integration_arn : String?

        def initialize(
          @event_integration_arn : String? = nil
        )
        end
      end

      # Summary information about the DataIntegration association.
      struct DataIntegrationAssociationSummary
        include JSON::Serializable

        # The identifier for the client that is associated with the DataIntegration association.
        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The Amazon Resource Name (ARN) of the DataIntegration.
        @[JSON::Field(key: "DataIntegrationArn")]
        getter data_integration_arn : String?

        # The Amazon Resource Name (ARN) of the DataIntegration association.
        @[JSON::Field(key: "DataIntegrationAssociationArn")]
        getter data_integration_association_arn : String?

        # The URI of the data destination.
        @[JSON::Field(key: "DestinationURI")]
        getter destination_uri : String?

        @[JSON::Field(key: "ExecutionConfiguration")]
        getter execution_configuration : Types::ExecutionConfiguration?

        # The execution status of the last job.
        @[JSON::Field(key: "LastExecutionStatus")]
        getter last_execution_status : Types::LastExecutionStatus?

        def initialize(
          @client_id : String? = nil,
          @data_integration_arn : String? = nil,
          @data_integration_association_arn : String? = nil,
          @destination_uri : String? = nil,
          @execution_configuration : Types::ExecutionConfiguration? = nil,
          @last_execution_status : Types::LastExecutionStatus? = nil
        )
        end
      end

      # Summary information about the DataIntegration.
      struct DataIntegrationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DataIntegration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the DataIntegration.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The URI of the data source.
        @[JSON::Field(key: "SourceURI")]
        getter source_uri : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @source_uri : String? = nil
        )
        end
      end

      struct DeleteApplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Application.
        @[JSON::Field(key: "ApplicationIdentifier")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDataIntegrationRequest
        include JSON::Serializable

        # A unique identifier for the DataIntegration.
        @[JSON::Field(key: "Identifier")]
        getter data_integration_identifier : String

        def initialize(
          @data_integration_identifier : String
        )
        end
      end

      struct DeleteDataIntegrationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEventIntegrationRequest
        include JSON::Serializable

        # The name of the event integration.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteEventIntegrationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A resource with the specified name already exists.
      struct DuplicateResourceException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The event filter.
      struct EventFilter
        include JSON::Serializable

        # The source of the events.
        @[JSON::Field(key: "Source")]
        getter source : String

        def initialize(
          @source : String
        )
        end
      end

      # The event integration.
      struct EventIntegration
        include JSON::Serializable

        # The event integration description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon EventBridge bus for the event integration.
        @[JSON::Field(key: "EventBridgeBus")]
        getter event_bridge_bus : String?

        # The event integration filter.
        @[JSON::Field(key: "EventFilter")]
        getter event_filter : Types::EventFilter?

        # The Amazon Resource Name (ARN) of the event integration.
        @[JSON::Field(key: "EventIntegrationArn")]
        getter event_integration_arn : String?

        # The name of the event integration.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @event_bridge_bus : String? = nil,
          @event_filter : Types::EventFilter? = nil,
          @event_integration_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The event integration association.
      struct EventIntegrationAssociation
        include JSON::Serializable

        # The metadata associated with the client.
        @[JSON::Field(key: "ClientAssociationMetadata")]
        getter client_association_metadata : Hash(String, String)?

        # The identifier for the client that is associated with the event integration.
        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The name of the EventBridge rule.
        @[JSON::Field(key: "EventBridgeRuleName")]
        getter event_bridge_rule_name : String?

        # The Amazon Resource Name (ARN) for the event integration association.
        @[JSON::Field(key: "EventIntegrationAssociationArn")]
        getter event_integration_association_arn : String?

        # The identifier for the event integration association.
        @[JSON::Field(key: "EventIntegrationAssociationId")]
        getter event_integration_association_id : String?

        # The name of the event integration.
        @[JSON::Field(key: "EventIntegrationName")]
        getter event_integration_name : String?

        def initialize(
          @client_association_metadata : Hash(String, String)? = nil,
          @client_id : String? = nil,
          @event_bridge_rule_name : String? = nil,
          @event_integration_association_arn : String? = nil,
          @event_integration_association_id : String? = nil,
          @event_integration_name : String? = nil
        )
        end
      end

      # The configuration for how the files should be pulled from the source.
      struct ExecutionConfiguration
        include JSON::Serializable

        # The mode for data import/export execution.
        @[JSON::Field(key: "ExecutionMode")]
        getter execution_mode : String

        @[JSON::Field(key: "OnDemandConfiguration")]
        getter on_demand_configuration : Types::OnDemandConfiguration?

        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration?

        def initialize(
          @execution_mode : String,
          @on_demand_configuration : Types::OnDemandConfiguration? = nil,
          @schedule_configuration : Types::ScheduleConfiguration? = nil
        )
        end
      end

      # The external URL source for the application.
      struct ExternalUrlConfig
        include JSON::Serializable

        # The URL to access the application.
        @[JSON::Field(key: "AccessUrl")]
        getter access_url : String

        # Additional URLs to allow list if different than the access URL.
        @[JSON::Field(key: "ApprovedOrigins")]
        getter approved_origins : Array(String)?

        def initialize(
          @access_url : String,
          @approved_origins : Array(String)? = nil
        )
        end
      end

      # The configuration for what files should be pulled from the source.
      struct FileConfiguration
        include JSON::Serializable

        # Identifiers for the source folders to pull all files from recursively.
        @[JSON::Field(key: "Folders")]
        getter folders : Array(String)

        # Restrictions for what files should be pulled from the source.
        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, Array(String))?

        def initialize(
          @folders : Array(String),
          @filters : Hash(String, Array(String))? = nil
        )
        end
      end

      struct GetApplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Application.
        @[JSON::Field(key: "ApplicationIdentifier")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetApplicationResponse
        include JSON::Serializable

        # The configuration settings for the application.
        @[JSON::Field(key: "ApplicationConfig")]
        getter application_config : Types::ApplicationConfig?

        # The configuration for where the application should be loaded from.
        @[JSON::Field(key: "ApplicationSourceConfig")]
        getter application_source_config : Types::ApplicationSourceConfig?

        # The type of application.
        @[JSON::Field(key: "ApplicationType")]
        getter application_type : String?

        # The Amazon Resource Name (ARN) of the Application.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The created time of the Application.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The description of the application.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the Application.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The iframe configuration for the application.
        @[JSON::Field(key: "IframeConfig")]
        getter iframe_config : Types::IframeConfig?

        # The maximum time in milliseconds allowed to establish a connection with the workspace.
        @[JSON::Field(key: "InitializationTimeout")]
        getter initialization_timeout : Int32?

        # Indicates whether the application is a service.
        @[JSON::Field(key: "IsService")]
        getter is_service : Bool?

        # The last modified time of the Application.
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the application.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The namespace of the application.
        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The configuration of events or requests that the application has access to.
        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # The events that the application publishes.
        @[JSON::Field(key: "Publications")]
        getter publications : Array(Types::Publication)?

        # The events that the application subscribes.
        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_config : Types::ApplicationConfig? = nil,
          @application_source_config : Types::ApplicationSourceConfig? = nil,
          @application_type : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @iframe_config : Types::IframeConfig? = nil,
          @initialization_timeout : Int32? = nil,
          @is_service : Bool? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @namespace : String? = nil,
          @permissions : Array(String)? = nil,
          @publications : Array(Types::Publication)? = nil,
          @subscriptions : Array(Types::Subscription)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetDataIntegrationRequest
        include JSON::Serializable

        # A unique identifier.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetDataIntegrationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the DataIntegration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The KMS key ARN for the DataIntegration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The configuration for what files should be pulled from the source.
        @[JSON::Field(key: "FileConfiguration")]
        getter file_configuration : Types::FileConfiguration?

        # A unique identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The KMS key ARN for the DataIntegration.
        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String?

        # The name of the DataIntegration.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The configuration for what data should be pulled from the source.
        @[JSON::Field(key: "ObjectConfiguration")]
        getter object_configuration : Hash(String, Hash(String, Array(String)))?

        # The name of the data and how often it should be pulled from the source.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration?

        # The URI of the data source.
        @[JSON::Field(key: "SourceURI")]
        getter source_uri : String?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @file_configuration : Types::FileConfiguration? = nil,
          @id : String? = nil,
          @kms_key : String? = nil,
          @name : String? = nil,
          @object_configuration : Hash(String, Hash(String, Array(String)))? = nil,
          @schedule_configuration : Types::ScheduleConfiguration? = nil,
          @source_uri : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetEventIntegrationRequest
        include JSON::Serializable

        # The name of the event integration.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetEventIntegrationResponse
        include JSON::Serializable

        # The description of the event integration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The EventBridge bus.
        @[JSON::Field(key: "EventBridgeBus")]
        getter event_bridge_bus : String?

        # The event filter.
        @[JSON::Field(key: "EventFilter")]
        getter event_filter : Types::EventFilter?

        # The Amazon Resource Name (ARN) for the event integration.
        @[JSON::Field(key: "EventIntegrationArn")]
        getter event_integration_arn : String?

        # The name of the event integration.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @event_bridge_bus : String? = nil,
          @event_filter : Types::EventFilter? = nil,
          @event_integration_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The iframe configuration for the application.
      struct IframeConfig
        include JSON::Serializable

        # The list of features that are allowed in the iframe.
        @[JSON::Field(key: "Allow")]
        getter allow : Array(String)?

        # The list of sandbox attributes for the iframe.
        @[JSON::Field(key: "Sandbox")]
        getter sandbox : Array(String)?

        def initialize(
          @allow : Array(String)? = nil,
          @sandbox : Array(String)? = nil
        )
        end
      end

      # Request processing failed due to an error or failure with the service.
      struct InternalServiceError
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is not valid.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The execution status of the last job.
      struct LastExecutionStatus
        include JSON::Serializable

        # The job status enum string.
        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : String?

        # The status message of a job.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @execution_status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct ListApplicationAssociationsRequest
        include JSON::Serializable

        # A unique identifier for the Application.
        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationAssociationsResponse
        include JSON::Serializable

        # List of Application Associations for the Application.
        @[JSON::Field(key: "ApplicationAssociations")]
        getter application_associations : Array(Types::ApplicationAssociationSummary)?

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_associations : Array(Types::ApplicationAssociationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationsRequest
        include JSON::Serializable

        # The type of application.
        @[JSON::Field(key: "applicationType")]
        getter application_type : String?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationsResponse
        include JSON::Serializable

        # The Applications associated with this account.
        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::ApplicationSummary)?

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::ApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataIntegrationAssociationsRequest
        include JSON::Serializable

        # A unique identifier for the DataIntegration.
        @[JSON::Field(key: "Identifier")]
        getter data_integration_identifier : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_integration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataIntegrationAssociationsResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) and unique ID of the DataIntegration association.
        @[JSON::Field(key: "DataIntegrationAssociations")]
        getter data_integration_associations : Array(Types::DataIntegrationAssociationSummary)?

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_integration_associations : Array(Types::DataIntegrationAssociationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataIntegrationsRequest
        include JSON::Serializable

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataIntegrationsResponse
        include JSON::Serializable

        # The DataIntegrations associated with this account.
        @[JSON::Field(key: "DataIntegrations")]
        getter data_integrations : Array(Types::DataIntegrationSummary)?

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_integrations : Array(Types::DataIntegrationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventIntegrationAssociationsRequest
        include JSON::Serializable

        # The name of the event integration.
        @[JSON::Field(key: "Name")]
        getter event_integration_name : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_integration_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventIntegrationAssociationsResponse
        include JSON::Serializable

        # The event integration associations.
        @[JSON::Field(key: "EventIntegrationAssociations")]
        getter event_integration_associations : Array(Types::EventIntegrationAssociation)?

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_integration_associations : Array(Types::EventIntegrationAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventIntegrationsRequest
        include JSON::Serializable

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventIntegrationsResponse
        include JSON::Serializable

        # The event integrations.
        @[JSON::Field(key: "EventIntegrations")]
        getter event_integrations : Array(Types::EventIntegration)?

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_integrations : Array(Types::EventIntegration)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Information about the tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The start and end time for data pull from the source.
      struct OnDemandConfiguration
        include JSON::Serializable

        # The start time for data pull from the source as an Unix/epoch string in milliseconds
        @[JSON::Field(key: "StartTime")]
        getter start_time : String

        # The end time for data pull from the source as an Unix/epoch string in milliseconds
        @[JSON::Field(key: "EndTime")]
        getter end_time : String?

        def initialize(
          @start_time : String,
          @end_time : String? = nil
        )
        end
      end

      # The configuration of an event that the application publishes.
      struct Publication
        include JSON::Serializable

        # The name of the publication.
        @[JSON::Field(key: "Event")]
        getter event : String

        # The JSON schema of the publication event.
        @[JSON::Field(key: "Schema")]
        getter schema : String

        # The description of the publication.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @event : String,
          @schema : String,
          @description : String? = nil
        )
        end
      end

      # The specified resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The allowed quota for the resource has been exceeded.
      struct ResourceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The name of the data and how often it should be pulled from the source.
      struct ScheduleConfiguration
        include JSON::Serializable

        # How often the data should be pulled from data source.
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        # The start date for objects to import in the first flow run as an Unix/epoch timestamp in
        # milliseconds or in ISO-8601 format.
        @[JSON::Field(key: "FirstExecutionFrom")]
        getter first_execution_from : String?

        # The name of the object to pull from the data source.
        @[JSON::Field(key: "Object")]
        getter object : String?

        def initialize(
          @schedule_expression : String,
          @first_execution_from : String? = nil,
          @object : String? = nil
        )
        end
      end

      # The configuration of an event that the application subscribes.
      struct Subscription
        include JSON::Serializable

        # The name of the subscription.
        @[JSON::Field(key: "Event")]
        getter event : String

        # The description of the subscription.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @event : String,
          @description : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags used to organize, track, or control access for this resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.
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

      # The throttling limit has been exceeded.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation is not supported.
      struct UnsupportedOperationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys.
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

      struct UpdateApplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Application.
        @[JSON::Field(key: "ApplicationIdentifier")]
        getter arn : String

        # The configuration settings for the application.
        @[JSON::Field(key: "ApplicationConfig")]
        getter application_config : Types::ApplicationConfig?

        # The configuration for where the application should be loaded from.
        @[JSON::Field(key: "ApplicationSourceConfig")]
        getter application_source_config : Types::ApplicationSourceConfig?

        # The type of application.
        @[JSON::Field(key: "ApplicationType")]
        getter application_type : String?

        # The description of the application.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The iframe configuration for the application.
        @[JSON::Field(key: "IframeConfig")]
        getter iframe_config : Types::IframeConfig?

        # The maximum time in milliseconds allowed to establish a connection with the workspace.
        @[JSON::Field(key: "InitializationTimeout")]
        getter initialization_timeout : Int32?

        # Indicates whether the application is a service.
        @[JSON::Field(key: "IsService")]
        getter is_service : Bool?

        # The name of the application.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The configuration of events or requests that the application has access to.
        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # The events that the application publishes.
        @[JSON::Field(key: "Publications")]
        getter publications : Array(Types::Publication)?

        # The events that the application subscribes.
        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @arn : String,
          @application_config : Types::ApplicationConfig? = nil,
          @application_source_config : Types::ApplicationSourceConfig? = nil,
          @application_type : String? = nil,
          @description : String? = nil,
          @iframe_config : Types::IframeConfig? = nil,
          @initialization_timeout : Int32? = nil,
          @is_service : Bool? = nil,
          @name : String? = nil,
          @permissions : Array(String)? = nil,
          @publications : Array(Types::Publication)? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end

      struct UpdateApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateDataIntegrationAssociationRequest
        include JSON::Serializable

        # A unique identifier. of the DataIntegrationAssociation resource
        @[JSON::Field(key: "DataIntegrationAssociationIdentifier")]
        getter data_integration_association_identifier : String

        # A unique identifier for the DataIntegration.
        @[JSON::Field(key: "Identifier")]
        getter data_integration_identifier : String

        # The configuration for how the files should be pulled from the source.
        @[JSON::Field(key: "ExecutionConfiguration")]
        getter execution_configuration : Types::ExecutionConfiguration

        def initialize(
          @data_integration_association_identifier : String,
          @data_integration_identifier : String,
          @execution_configuration : Types::ExecutionConfiguration
        )
        end
      end

      struct UpdateDataIntegrationAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateDataIntegrationRequest
        include JSON::Serializable

        # A unique identifier for the DataIntegration.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A description of the DataIntegration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the DataIntegration.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateDataIntegrationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateEventIntegrationRequest
        include JSON::Serializable

        # The name of the event integration.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The description of the event integration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateEventIntegrationResponse
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
