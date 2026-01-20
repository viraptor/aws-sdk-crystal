require "json"
require "time"

module AwsSdk
  module IoTManagedIntegrations
    module Types

      # Structure representing one abort config criteria.

      struct AbortConfigCriteria
        include JSON::Serializable

        # The action taken by the abort configuration.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # Over-the-air (OTA) task abort criteria failure type.

        @[JSON::Field(key: "FailureType")]
        getter failure_type : String?

        # The minimum number of things that must receive task execution notifications before the task can be
        # aborted.

        @[JSON::Field(key: "MinNumberOfExecutedThings")]
        getter min_number_of_executed_things : Int32?

        # The minimum percentage of over-the-air (OTA) task execution failures that must occur to initiate the
        # last abort.

        @[JSON::Field(key: "ThresholdPercentage")]
        getter threshold_percentage : Float64?

        def initialize(
          @action : String? = nil,
          @failure_type : String? = nil,
          @min_number_of_executed_things : Int32? = nil,
          @threshold_percentage : Float64? = nil
        )
        end
      end

      # User is not authorized.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Structure containing information about an account association, including its identifier, state, and
      # related metadata.

      struct AccountAssociationItem
        include JSON::Serializable

        # The unique identifier of the account association.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        # The current state of the account association, indicating its status in the association lifecycle.

        @[JSON::Field(key: "AssociationState")]
        getter association_state : String

        # The Amazon Resource Name (ARN) of the account association.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The identifier of the connector destination associated with this account association.

        @[JSON::Field(key: "ConnectorDestinationId")]
        getter connector_destination_id : String?

        # A description of the account association.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The error message explaining any issues with the account association, if applicable.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The name of the account association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @account_association_id : String,
          @association_state : String,
          @arn : String? = nil,
          @connector_destination_id : String? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The authentication configuration details for a connector destination, including OAuth settings and
      # other authentication parameters.

      struct AuthConfig
        include JSON::Serializable

        # The OAuth configuration settings used for authentication with the third-party service.

        @[JSON::Field(key: "oAuth")]
        getter o_auth : Types::OAuthConfig?

        def initialize(
          @o_auth : Types::OAuthConfig? = nil
        )
        end
      end

      # The updated authentication configuration details for a connector destination.

      struct AuthConfigUpdate
        include JSON::Serializable

        # The updated OAuth configuration settings for the authentication configuration.

        @[JSON::Field(key: "oAuthUpdate")]
        getter o_auth_update : Types::OAuthUpdate?

        def initialize(
          @o_auth_update : Types::OAuthUpdate? = nil
        )
        end
      end

      # Action for an Amazon Web Services capability, containing the action parameters for control.

      struct CapabilityAction
        include JSON::Serializable

        # Describe a capability action with a name.

        @[JSON::Field(key: "name")]
        getter name : String

        # Describe a capability action with an actionTraceId for a response command.

        @[JSON::Field(key: "actionTraceId")]
        getter action_trace_id : String?

        # Describe a capability action with a capability property.

        @[JSON::Field(key: "parameters")]
        getter parameters : Types::CapabilityProperties?

        # Describe a capability action with an reference.

        @[JSON::Field(key: "ref")]
        getter ref : String?

        def initialize(
          @name : String,
          @action_trace_id : String? = nil,
          @parameters : Types::CapabilityProperties? = nil,
          @ref : String? = nil
        )
        end
      end


      struct CapabilityProperties
        include JSON::Serializable

        def initialize
        end
      end

      # Report of all capabilities supported by the device.

      struct CapabilityReport
        include JSON::Serializable

        # The endpoints used in the capability report.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::CapabilityReportEndpoint)

        # The version of the capability report.

        @[JSON::Field(key: "version")]
        getter version : String

        # The numeric identifier of the node.

        @[JSON::Field(key: "nodeId")]
        getter node_id : String?

        def initialize(
          @endpoints : Array(Types::CapabilityReportEndpoint),
          @version : String,
          @node_id : String? = nil
        )
        end
      end

      # The capability used in capability report.

      struct CapabilityReportCapability
        include JSON::Serializable

        # The capability actions used in the capability report.

        @[JSON::Field(key: "actions")]
        getter actions : Array(String)

        # The capability events used in the capability report.

        @[JSON::Field(key: "events")]
        getter events : Array(String)

        # The id of the schema version.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the capability.

        @[JSON::Field(key: "name")]
        getter name : String

        # The capability properties used in the capability report.

        @[JSON::Field(key: "properties")]
        getter properties : Array(String)

        # The version of the capability.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @actions : Array(String),
          @events : Array(String),
          @id : String,
          @name : String,
          @properties : Array(String),
          @version : String
        )
        end
      end

      # The endpoint used in the capability report.

      struct CapabilityReportEndpoint
        include JSON::Serializable

        # The capabilities used in the capability report.

        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(Types::CapabilityReportCapability)

        # The type of device.

        @[JSON::Field(key: "deviceTypes")]
        getter device_types : Array(String)

        # The id of the endpoint used in the capability report.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @capabilities : Array(Types::CapabilityReportCapability),
          @device_types : Array(String),
          @id : String
        )
        end
      end

      # Structure representing a capability schema item that defines the functionality and features
      # supported by a managed thing.

      struct CapabilitySchemaItem
        include JSON::Serializable

        # The unique identifier of the capability defined in the schema.

        @[JSON::Field(key: "CapabilityId")]
        getter capability_id : String

        # The external identifier for the capability, used when referencing the capability outside of the AWS
        # ecosystem.

        @[JSON::Field(key: "ExtrinsicId")]
        getter extrinsic_id : String

        # The version of the external capability definition, used to track compatibility with external
        # systems.

        @[JSON::Field(key: "ExtrinsicVersion")]
        getter extrinsic_version : Int32

        # The format of the capability schema, which defines how the schema is structured and interpreted.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The actual schema definition that describes the capability's properties, actions, and events.

        @[JSON::Field(key: "Schema")]
        getter schema : Types::ValidationSchema

        def initialize(
          @capability_id : String,
          @extrinsic_id : String,
          @extrinsic_version : Int32,
          @format : String,
          @schema : Types::ValidationSchema
        )
        end
      end

      # The command capabilities added for the managed thing

      struct CommandCapability
        include JSON::Serializable

        # Describe the command capability with the actions it supports.

        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::CapabilityAction)

        # Describe the capability with an id.

        @[JSON::Field(key: "id")]
        getter id : String

        # Describe the capability with an name.

        @[JSON::Field(key: "name")]
        getter name : String

        # Describe the capability with a version.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @actions : Array(Types::CapabilityAction),
          @id : String,
          @name : String,
          @version : String
        )
        end
      end

      # The endpoint for a managed thing when sending a command.

      struct CommandEndpoint
        include JSON::Serializable

        # Describe the endpoint with an id, a name, and the relevant capabilities for sending commands.

        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(Types::CommandCapability)

        # The id of the endpoint for a managed thing.

        @[JSON::Field(key: "endpointId")]
        getter endpoint_id : String

        def initialize(
          @capabilities : Array(Types::CommandCapability),
          @endpoint_id : String
        )
        end
      end

      # Provides the default encryption configuration error update details.

      struct ConfigurationError
        include JSON::Serializable

        # The error code returned when the default encryption configuration update fails.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The error message returned when the default encryption configuration update fails.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Provides the status of the default encryption configuration for an Amazon Web Services account.

      struct ConfigurationStatus
        include JSON::Serializable

        # The status state describing the default encryption configuration update.

        @[JSON::Field(key: "state")]
        getter state : String

        # The error details describing a failed default encryption configuration update.

        @[JSON::Field(key: "error")]
        getter error : Types::ConfigurationError?

        def initialize(
          @state : String,
          @error : Types::ConfigurationError? = nil
        )
        end
      end

      # There is a conflict with the request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Structure containing summary information about a connector destination, which defines how a
      # cloud-to-cloud connector connects to a customer's AWS account.

      struct ConnectorDestinationSummary
        include JSON::Serializable

        # The identifier of the cloud connector associated with this connector destination.

        @[JSON::Field(key: "CloudConnectorId")]
        getter cloud_connector_id : String?

        # A description of the connector destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the connector destination.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The display name of the connector destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @cloud_connector_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Structure describing a connector.

      struct ConnectorItem
        include JSON::Serializable

        # The configuration details for the cloud connector endpoint, including connection parameters and
        # authentication requirements.

        @[JSON::Field(key: "EndpointConfig")]
        getter endpoint_config : Types::EndpointConfig

        # The display name of the C2C connector.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the C2C connector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of endpoint used for the C2C connector.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The identifier of the C2C connector.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The type of cloud connector created.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @endpoint_config : Types::EndpointConfig,
          @name : String,
          @description : String? = nil,
          @endpoint_type : String? = nil,
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct CreateAccountAssociationRequest
        include JSON::Serializable

        # The identifier of the connector destination.

        @[JSON::Field(key: "ConnectorDestinationId")]
        getter connector_destination_id : String

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description of the account association request.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the destination for the new account association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A set of key/value pairs that are used to manage the account association.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @connector_destination_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAccountAssociationResponse
        include JSON::Serializable

        # The identifier for the account association request.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        # The current state of the account association request.

        @[JSON::Field(key: "AssociationState")]
        getter association_state : String

        # Third-party IoT platform OAuth authorization server URL backed with all the required parameters to
        # perform end-user authentication.

        @[JSON::Field(key: "OAuthAuthorizationUrl")]
        getter o_auth_authorization_url : String

        # The Amazon Resource Name (ARN) of the account association.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @account_association_id : String,
          @association_state : String,
          @o_auth_authorization_url : String,
          @arn : String? = nil
        )
        end
      end


      struct CreateCloudConnectorRequest
        include JSON::Serializable

        # The configuration details for the cloud connector endpoint, including connection parameters and
        # authentication requirements.

        @[JSON::Field(key: "EndpointConfig")]
        getter endpoint_config : Types::EndpointConfig

        # The display name of the C2C connector.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description of the C2C connector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of endpoint used for the cloud connector, which defines how the connector communicates with
        # external services.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        def initialize(
          @endpoint_config : Types::EndpointConfig,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @endpoint_type : String? = nil
        )
        end
      end


      struct CreateCloudConnectorResponse
        include JSON::Serializable

        # The unique identifier assigned to the newly created cloud connector.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct CreateConnectorDestinationRequest
        include JSON::Serializable

        # The authentication configuration details for the connector destination, including OAuth settings and
        # other authentication parameters.

        @[JSON::Field(key: "AuthConfig")]
        getter auth_config : Types::AuthConfig

        # The authentication type used for the connector destination, which determines how credentials and
        # access are managed.

        @[JSON::Field(key: "AuthType")]
        getter auth_type : String

        # The identifier of the C2C connector.

        @[JSON::Field(key: "CloudConnectorId")]
        getter cloud_connector_id : String

        # The AWS Secrets Manager configuration used to securely store and manage sensitive information for
        # the connector destination.

        @[JSON::Field(key: "SecretsManager")]
        getter secrets_manager : Types::SecretsManager

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description of the connector destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the connector destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @auth_config : Types::AuthConfig,
          @auth_type : String,
          @cloud_connector_id : String,
          @secrets_manager : Types::SecretsManager,
          @client_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateConnectorDestinationResponse
        include JSON::Serializable

        # The identifier of the C2C connector destination creation request.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct CreateCredentialLockerRequest
        include JSON::Serializable

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The name of the credential locker.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A set of key/value pairs that are used to manage the credential locker.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCredentialLockerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the credential locker.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp value of when the credential locker request occurred.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the credential locker creation request.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateDestinationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationArn")]
        getter delivery_destination_arn : String

        # The destination type for the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationType")]
        getter delivery_destination_type : String

        # The name of the customer-managed destination.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the delivery destination role.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the customer-managed destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A set of key/value pairs that are used to manage the destination.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @delivery_destination_arn : String,
          @delivery_destination_type : String,
          @name : String,
          @role_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDestinationResponse
        include JSON::Serializable

        # The name of the customer-managed destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct CreateEventLogConfigurationRequest
        include JSON::Serializable

        # The logging level for the event log configuration.

        @[JSON::Field(key: "EventLogLevel")]
        getter event_log_level : String

        # The type of resource for the event log configuration.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The identifier of the resource for the event log configuration.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @event_log_level : String,
          @resource_type : String,
          @client_token : String? = nil,
          @resource_id : String? = nil
        )
        end
      end


      struct CreateEventLogConfigurationResponse
        include JSON::Serializable

        # The identifier of the event log configuration request.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct CreateManagedThingRequest
        include JSON::Serializable

        # The authentication material defining the device connectivity setup requests. The authentication
        # materials used are the device bar code.

        @[JSON::Field(key: "AuthenticationMaterial")]
        getter authentication_material : String

        # The type of authentication material used for device connectivity setup requests.

        @[JSON::Field(key: "AuthenticationMaterialType")]
        getter authentication_material_type : String

        # The type of device used. This will be the hub controller, cloud device, or AWS IoT device.

        @[JSON::Field(key: "Role")]
        getter role : String

        # The brand of the device.

        @[JSON::Field(key: "Brand")]
        getter brand : String?

        # The capabilities of the device such as light bulb.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : String?

        # A report of the capabilities for the managed thing.

        @[JSON::Field(key: "CapabilityReport")]
        getter capability_report : Types::CapabilityReport?

        # The capability schemas that define the functionality and features supported by the managed thing,
        # including device capabilities and their associated properties.

        @[JSON::Field(key: "CapabilitySchemas")]
        getter capability_schemas : Array(Types::CapabilitySchemaItem)?

        # The classification of the managed thing such as light bulb or thermostat.

        @[JSON::Field(key: "Classification")]
        getter classification : String?

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The identifier of the credential for the managed thing.

        @[JSON::Field(key: "CredentialLockerId")]
        getter credential_locker_id : String?

        # The metadata for the managed thing. The managedThing metadata parameter is used for associating
        # attributes with a managedThing that can be used for grouping over-the-air (OTA) tasks. Name value
        # pairs in metadata can be used in the OtaTargetQueryString parameter for the CreateOtaTask API
        # operation.

        @[JSON::Field(key: "MetaData")]
        getter meta_data : Hash(String, String)?

        # The model of the device.

        @[JSON::Field(key: "Model")]
        getter model : String?

        # The name of the managed thing representing the physical device.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Owner of the device, usually an indication of whom the device belongs to. This value should not
        # contain personal identifiable information.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The serial number of the device.

        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # A set of key/value pairs that are used to manage the managed thing.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The Wi-Fi Simple Setup configuration for the managed thing, which defines provisioning capabilities
        # and timeout settings.

        @[JSON::Field(key: "WiFiSimpleSetupConfiguration")]
        getter wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration?

        def initialize(
          @authentication_material : String,
          @authentication_material_type : String,
          @role : String,
          @brand : String? = nil,
          @capabilities : String? = nil,
          @capability_report : Types::CapabilityReport? = nil,
          @capability_schemas : Array(Types::CapabilitySchemaItem)? = nil,
          @classification : String? = nil,
          @client_token : String? = nil,
          @credential_locker_id : String? = nil,
          @meta_data : Hash(String, String)? = nil,
          @model : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @serial_number : String? = nil,
          @tags : Hash(String, String)? = nil,
          @wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration? = nil
        )
        end
      end


      struct CreateManagedThingResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the managed thing.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp value of when the device creation request occurred.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The id of the managed thing.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateNotificationConfigurationRequest
        include JSON::Serializable

        # The name of the destination for the notification configuration.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String

        # The type of event triggering a device notification to the customer-managed destination.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A set of key/value pairs that are used to manage the notification configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination_name : String,
          @event_type : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateNotificationConfigurationResponse
        include JSON::Serializable

        # The type of event triggering a device notification to the customer-managed destination.

        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        def initialize(
          @event_type : String? = nil
        )
        end
      end


      struct CreateOtaTaskConfigurationRequest
        include JSON::Serializable

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description of the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the over-the-air (OTA) task.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Describes the type of configuration used for the over-the-air (OTA) task.

        @[JSON::Field(key: "PushConfig")]
        getter push_config : Types::PushConfig?

        def initialize(
          @client_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @push_config : Types::PushConfig? = nil
        )
        end
      end


      struct CreateOtaTaskConfigurationResponse
        include JSON::Serializable

        # The identifier of the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "TaskConfigurationId")]
        getter task_configuration_id : String?

        def initialize(
          @task_configuration_id : String? = nil
        )
        end
      end


      struct CreateOtaTaskRequest
        include JSON::Serializable

        # The frequency type for the over-the-air (OTA) task.

        @[JSON::Field(key: "OtaType")]
        getter ota_type : String

        # The URL to the Amazon S3 bucket where the over-the-air (OTA) task is stored.

        @[JSON::Field(key: "S3Url")]
        getter s3_url : String

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the over-the-air (OTA) task.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The deployment mechanism for the over-the-air (OTA) task.

        @[JSON::Field(key: "OtaMechanism")]
        getter ota_mechanism : String?


        @[JSON::Field(key: "OtaSchedulingConfig")]
        getter ota_scheduling_config : Types::OtaTaskSchedulingConfig?

        # The query string to add things to the thing group.

        @[JSON::Field(key: "OtaTargetQueryString")]
        getter ota_target_query_string : String?


        @[JSON::Field(key: "OtaTaskExecutionRetryConfig")]
        getter ota_task_execution_retry_config : Types::OtaTaskExecutionRetryConfig?

        # The connection protocol the over-the-air (OTA) task uses to update the device.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # A set of key/value pairs that are used to manage the over-the-air (OTA) task.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The device targeted for the over-the-air (OTA) task.

        @[JSON::Field(key: "Target")]
        getter target : Array(String)?

        # The identifier for the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "TaskConfigurationId")]
        getter task_configuration_id : String?

        def initialize(
          @ota_type : String,
          @s3_url : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @ota_mechanism : String? = nil,
          @ota_scheduling_config : Types::OtaTaskSchedulingConfig? = nil,
          @ota_target_query_string : String? = nil,
          @ota_task_execution_retry_config : Types::OtaTaskExecutionRetryConfig? = nil,
          @protocol : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target : Array(String)? = nil,
          @task_configuration_id : String? = nil
        )
        end
      end


      struct CreateOtaTaskResponse
        include JSON::Serializable

        # A description of the over-the-air (OTA) task.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the over-the-air (OTA) task.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The identifier of the over-the-air (OTA) task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        def initialize(
          @description : String? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil
        )
        end
      end


      struct CreateProvisioningProfileRequest
        include JSON::Serializable

        # The type of provisioning workflow the device uses for onboarding to IoT managed integrations.

        @[JSON::Field(key: "ProvisioningType")]
        getter provisioning_type : String

        # The id of the certificate authority (CA) certificate.

        @[JSON::Field(key: "CaCertificate")]
        getter ca_certificate : String?

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The name of the provisioning template.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A set of key/value pairs that are used to manage the provisioning profile.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @provisioning_type : String,
          @ca_certificate : String? = nil,
          @client_token : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateProvisioningProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the provisioning template used in the provisioning profile.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The id of the claim certificate.

        @[JSON::Field(key: "ClaimCertificate")]
        getter claim_certificate : String?

        # The private key of the claim certificate. This is stored securely on the device for validating the
        # connection endpoint with IoT managed integrations using the public key.

        @[JSON::Field(key: "ClaimCertificatePrivateKey")]
        getter claim_certificate_private_key : String?

        # The identifier of the provisioning profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the provisioning template.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of provisioning workflow the device uses for onboarding to IoT managed integrations.

        @[JSON::Field(key: "ProvisioningType")]
        getter provisioning_type : String?

        def initialize(
          @arn : String? = nil,
          @claim_certificate : String? = nil,
          @claim_certificate_private_key : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @provisioning_type : String? = nil
        )
        end
      end

      # Structure describing one Credential Locker.

      struct CredentialLockerSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the credential locker.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestampe value of when the credential locker was created at.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The id of the credential locker.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the credential locker.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteAccountAssociationRequest
        include JSON::Serializable

        # The unique identifier of the account association to be deleted.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        def initialize(
          @account_association_id : String
        )
        end
      end


      struct DeleteCloudConnectorRequest
        include JSON::Serializable

        # The identifier of the cloud connector.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteConnectorDestinationRequest
        include JSON::Serializable

        # The identifier of the connector destination.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteCredentialLockerRequest
        include JSON::Serializable

        # The identifier of the credential locker.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteDestinationRequest
        include JSON::Serializable

        # The id of the customer-managed destination.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteEventLogConfigurationRequest
        include JSON::Serializable

        # The identifier of the event log configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteManagedThingRequest
        include JSON::Serializable

        # The id of the managed thing.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # When set to TRUE , a forceful deteletion of the managed thing will occur. When set to FALSE , a
        # non-forceful deletion of the managed thing will occur.

        @[JSON::Field(key: "Force")]
        getter force : Bool?

        def initialize(
          @identifier : String,
          @force : Bool? = nil
        )
        end
      end


      struct DeleteNotificationConfigurationRequest
        include JSON::Serializable

        # The type of event triggering a device notification to the customer-managed destination.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        def initialize(
          @event_type : String
        )
        end
      end


      struct DeleteOtaTaskConfigurationRequest
        include JSON::Serializable

        # The identifier of the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteOtaTaskRequest
        include JSON::Serializable

        # The identifier of the over-the-air (OTA) task.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteProvisioningProfileRequest
        include JSON::Serializable

        # The name of the provisioning template.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # Request for deregister a managed thing from account association

      struct DeregisterAccountAssociationRequest
        include JSON::Serializable

        # The unique identifier of the account association to be deregistered.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        # The identifier of the managed thing to be deregistered from the account association.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String

        def initialize(
          @account_association_id : String,
          @managed_thing_id : String
        )
        end
      end

      # Structure describing a destination for IoT managed integrations to deliver notifications for a
      # device.

      struct DestinationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationArn")]
        getter delivery_destination_arn : String?

        # The destination type for the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationType")]
        getter delivery_destination_type : String?

        # The description of the customer-managed destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the customer-managed destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the delivery destination.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @delivery_destination_arn : String? = nil,
          @delivery_destination_type : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Describe the device using the relevant metadata and supported clusters for device discovery.

      struct Device
        include JSON::Serializable

        # The capability report for the device.

        @[JSON::Field(key: "CapabilityReport")]
        getter capability_report : Types::MatterCapabilityReport

        # The device id as defined by the connector. This parameter is used for cloud-to-cloud devices only.

        @[JSON::Field(key: "ConnectorDeviceId")]
        getter connector_device_id : String

        # Report of all capabilities supported by the device.

        @[JSON::Field(key: "CapabilitySchemas")]
        getter capability_schemas : Array(Types::CapabilitySchemaItem)?

        # The name of the device as defined by the connector.

        @[JSON::Field(key: "ConnectorDeviceName")]
        getter connector_device_name : String?

        # The metadata attributes for a device.

        @[JSON::Field(key: "DeviceMetadata")]
        getter device_metadata : Types::DeviceMetadata?

        def initialize(
          @capability_report : Types::MatterCapabilityReport,
          @connector_device_id : String,
          @capability_schemas : Array(Types::CapabilitySchemaItem)? = nil,
          @connector_device_name : String? = nil,
          @device_metadata : Types::DeviceMetadata? = nil
        )
        end
      end

      # Structure containing summary information about a device discovery job, including its identifier,
      # type, and status.

      struct DeviceDiscoverySummary
        include JSON::Serializable

        # The type of discovery process used to find devices.

        @[JSON::Field(key: "DiscoveryType")]
        getter discovery_type : String?

        # The unique identifier of the device discovery job.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The current status of the device discovery job.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @discovery_type : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeviceMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # Structure containing summary information about a device discovered during a device discovery job.

      struct DiscoveredDeviceSummary
        include JSON::Serializable

        # The authentication material required for connecting to the discovered device, such as credentials or
        # tokens.

        @[JSON::Field(key: "AuthenticationMaterial")]
        getter authentication_material : String?

        # The brand of the discovered device.

        @[JSON::Field(key: "Brand")]
        getter brand : String?

        # The third-party device identifier as defined by the connector. This identifier must not contain
        # personal identifiable information (PII).

        @[JSON::Field(key: "ConnectorDeviceId")]
        getter connector_device_id : String?

        # The name of the device as defined by the connector or third-party system.

        @[JSON::Field(key: "ConnectorDeviceName")]
        getter connector_device_name : String?

        # The list of device types or categories that the discovered device belongs to.

        @[JSON::Field(key: "DeviceTypes")]
        getter device_types : Array(String)?

        # The timestamp indicating when the device was discovered.

        @[JSON::Field(key: "DiscoveredAt")]
        getter discovered_at : Time?

        # The identifier of the managed thing created for this discovered device, if one exists.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        # The model of the discovered device.

        @[JSON::Field(key: "Model")]
        getter model : String?

        # The status of the discovered device, indicating whether it has been added, removed, or modified
        # since the last discovery.

        @[JSON::Field(key: "Modification")]
        getter modification : String?

        def initialize(
          @authentication_material : String? = nil,
          @brand : String? = nil,
          @connector_device_id : String? = nil,
          @connector_device_name : String? = nil,
          @device_types : Array(String)? = nil,
          @discovered_at : Time? = nil,
          @managed_thing_id : String? = nil,
          @model : String? = nil,
          @modification : String? = nil
        )
        end
      end

      # The configuration details for an endpoint, which defines how to connect to and communicate with
      # external services.

      struct EndpointConfig
        include JSON::Serializable

        # The Lambda function configuration for the endpoint, used when the endpoint communicates through an
        # AWS Lambda function.

        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaConfig?

        def initialize(
          @lambda : Types::LambdaConfig? = nil
        )
        end
      end

      # List of event log configurations.

      struct EventLogConfigurationSummary
        include JSON::Serializable

        # The logging level for the event log configuration.

        @[JSON::Field(key: "EventLogLevel")]
        getter event_log_level : String?

        # The identifier of the event log configuration.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The identifier of the resource for the event log configuration.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource for the event log configuration.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @event_log_level : String? = nil,
          @id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Structure representing exponential rate of rollout for an over-the-air (OTA) task.

      struct ExponentialRolloutRate
        include JSON::Serializable

        # The base rate per minute for the rollout of an over-the-air (OTA) task.

        @[JSON::Field(key: "BaseRatePerMinute")]
        getter base_rate_per_minute : Int32?

        # The incremental factor for increasing the rollout rate of an over-the-air (OTA) task.

        @[JSON::Field(key: "IncrementFactor")]
        getter increment_factor : Float64?

        # The criteria for increasing the rollout rate of an over-the-air (OTA) task.

        @[JSON::Field(key: "RateIncreaseCriteria")]
        getter rate_increase_criteria : Types::RolloutRateIncreaseCriteria?

        def initialize(
          @base_rate_per_minute : Int32? = nil,
          @increment_factor : Float64? = nil,
          @rate_increase_criteria : Types::RolloutRateIncreaseCriteria? = nil
        )
        end
      end


      struct GetAccountAssociationRequest
        include JSON::Serializable

        # The unique identifier of the account association to retrieve.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        def initialize(
          @account_association_id : String
        )
        end
      end


      struct GetAccountAssociationResponse
        include JSON::Serializable

        # The unique identifier of the retrieved account association.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        # The current status state for the account association.

        @[JSON::Field(key: "AssociationState")]
        getter association_state : String

        # Third party IoT platform OAuth authorization server URL backed with all the required parameters to
        # perform end-user authentication.

        @[JSON::Field(key: "OAuthAuthorizationUrl")]
        getter o_auth_authorization_url : String

        # The Amazon Resource Name (ARN) of the account association.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The identifier of the connector destination associated with this account association.

        @[JSON::Field(key: "ConnectorDestinationId")]
        getter connector_destination_id : String?

        # The description of the account association.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The error message explaining the current account association error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The name of the account association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A set of key/value pairs that are used to manage the account association.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @account_association_id : String,
          @association_state : String,
          @o_auth_authorization_url : String,
          @arn : String? = nil,
          @connector_destination_id : String? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCloudConnectorRequest
        include JSON::Serializable

        # The identifier of the C2C connector.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetCloudConnectorResponse
        include JSON::Serializable

        # The configuration details for the cloud connector endpoint, including connection parameters and
        # authentication requirements.

        @[JSON::Field(key: "EndpointConfig")]
        getter endpoint_config : Types::EndpointConfig

        # The display name of the C2C connector.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the C2C connector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of endpoint used for the cloud connector, which defines how the connector communicates with
        # external services.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The unique identifier of the cloud connector.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The type of cloud connector created.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @endpoint_config : Types::EndpointConfig,
          @name : String,
          @description : String? = nil,
          @endpoint_type : String? = nil,
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetConnectorDestinationRequest
        include JSON::Serializable

        # The identifier of the C2C connector destination.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetConnectorDestinationResponse
        include JSON::Serializable

        # The authentication configuration details for the connector destination, including OAuth settings and
        # other authentication parameters.

        @[JSON::Field(key: "AuthConfig")]
        getter auth_config : Types::AuthConfig?

        # The authentication type used for the connector destination, which determines how credentials and
        # access are managed.

        @[JSON::Field(key: "AuthType")]
        getter auth_type : String?

        # The identifier of the C2C connector.

        @[JSON::Field(key: "CloudConnectorId")]
        getter cloud_connector_id : String?

        # A description of the connector destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the connector destination.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The display name of the connector destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The URL where users are redirected after completing the OAuth authorization process for the
        # connector destination.

        @[JSON::Field(key: "OAuthCompleteRedirectUrl")]
        getter o_auth_complete_redirect_url : String?

        # The AWS Secrets Manager configuration used to securely store and manage sensitive information for
        # the connector destination.

        @[JSON::Field(key: "SecretsManager")]
        getter secrets_manager : Types::SecretsManager?

        def initialize(
          @auth_config : Types::AuthConfig? = nil,
          @auth_type : String? = nil,
          @cloud_connector_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @o_auth_complete_redirect_url : String? = nil,
          @secrets_manager : Types::SecretsManager? = nil
        )
        end
      end


      struct GetCredentialLockerRequest
        include JSON::Serializable

        # The identifier of the credential locker.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetCredentialLockerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the credential locker.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp value of when the credential locker requset occurred.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the credential locker.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the credential locker.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A set of key/value pairs that are used to manage the credential locker.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCustomEndpointRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetCustomEndpointResponse
        include JSON::Serializable

        # The IoT managed integrations dedicated, custom endpoint for the device to route traffic through.

        @[JSON::Field(key: "EndpointAddress")]
        getter endpoint_address : String

        def initialize(
          @endpoint_address : String
        )
        end
      end


      struct GetDefaultEncryptionConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDefaultEncryptionConfigurationResponse
        include JSON::Serializable

        # Provides the status of the default encryption configuration for an Amazon Web Services account.

        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : Types::ConfigurationStatus

        # The type of encryption used for the encryption configuration.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The Key Amazon Resource Name (ARN) of the AWS KMS key used for KMS encryption if you use
        # KMS_BASED_ENCRYPTION .

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @configuration_status : Types::ConfigurationStatus,
          @encryption_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct GetDestinationRequest
        include JSON::Serializable

        # The name of the customer-managed destination.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetDestinationResponse
        include JSON::Serializable

        # The timestamp value of when the destination creation requset occurred.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationArn")]
        getter delivery_destination_arn : String?

        # The destination type for the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationType")]
        getter delivery_destination_type : String?

        # The description of the customer-managed destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the customer-managed destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the delivery destination role.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # A set of key/value pairs that are used to manage the customer-managed destination.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The timestamp value of when the destination update requset occurred.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @delivery_destination_arn : String? = nil,
          @delivery_destination_type : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetDeviceDiscoveryRequest
        include JSON::Serializable

        # The id of the device discovery job request.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetDeviceDiscoveryResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the device discovery job request.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The discovery type supporting the type of device to be discovered in the device discovery job
        # request.

        @[JSON::Field(key: "DiscoveryType")]
        getter discovery_type : String

        # The id of the device discovery job request.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The timestamp value for the start time of the device discovery.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time

        # The status of the device discovery job request.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The identifier of the account association used for the device discovery.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String?

        # The ID tracking the current discovery process for one connector association.

        @[JSON::Field(key: "ConnectorAssociationId")]
        getter connector_association_id : String?

        # The id of the end-user's IoT hub.

        @[JSON::Field(key: "ControllerId")]
        getter controller_id : String?

        # The timestamp value for the completion time of the device discovery.

        @[JSON::Field(key: "FinishedAt")]
        getter finished_at : Time?

        # A set of key/value pairs that are used to manage the device discovery request.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @discovery_type : String,
          @id : String,
          @started_at : Time,
          @status : String,
          @account_association_id : String? = nil,
          @connector_association_id : String? = nil,
          @controller_id : String? = nil,
          @finished_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetEventLogConfigurationRequest
        include JSON::Serializable

        # The identifier of the event log configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetEventLogConfigurationResponse
        include JSON::Serializable

        # The logging level for the event log configuration.

        @[JSON::Field(key: "EventLogLevel")]
        getter event_log_level : String?

        # The identifier of the event log configuration.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The identifier of the resource for the event log configuration.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource for the event log configuration.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @event_log_level : String? = nil,
          @id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct GetHubConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetHubConfigurationResponse
        include JSON::Serializable

        # A user-defined integer value that represents the hub token timer expiry setting in seconds.

        @[JSON::Field(key: "HubTokenTimerExpirySettingInSeconds")]
        getter hub_token_timer_expiry_setting_in_seconds : Int64?

        # The timestamp value of when the hub configuration was updated.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @hub_token_timer_expiry_setting_in_seconds : Int64? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetManagedThingCapabilitiesRequest
        include JSON::Serializable

        # The id of the device.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetManagedThingCapabilitiesResponse
        include JSON::Serializable

        # The capabilities of the device such as light bulb.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : String?

        # A report of the capabilities for the managed thing.

        @[JSON::Field(key: "CapabilityReport")]
        getter capability_report : Types::CapabilityReport?

        # The id of the device.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        def initialize(
          @capabilities : String? = nil,
          @capability_report : Types::CapabilityReport? = nil,
          @managed_thing_id : String? = nil
        )
        end
      end


      struct GetManagedThingCertificateRequest
        include JSON::Serializable

        # The identifier of the managed thing.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetManagedThingCertificateResponse
        include JSON::Serializable

        # The PEM-encoded certificate for the managed thing.

        @[JSON::Field(key: "CertificatePem")]
        getter certificate_pem : String?

        # The identifier of the managed thing.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        def initialize(
          @certificate_pem : String? = nil,
          @managed_thing_id : String? = nil
        )
        end
      end


      struct GetManagedThingConnectivityDataRequest
        include JSON::Serializable

        # The identifier of a managed thing.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetManagedThingConnectivityDataResponse
        include JSON::Serializable

        # The connectivity status for a managed thing.

        @[JSON::Field(key: "Connected")]
        getter connected : Bool?

        # The reason for the connectivity disconnect with the managed thing.

        @[JSON::Field(key: "DisconnectReason")]
        getter disconnect_reason : String?

        # The id of a managed thing.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        # The timestamp value of when the connectivity status for a managed thing was last taken.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @connected : Bool? = nil,
          @disconnect_reason : String? = nil,
          @managed_thing_id : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end


      struct GetManagedThingMetaDataRequest
        include JSON::Serializable

        # The managed thing id.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetManagedThingMetaDataResponse
        include JSON::Serializable

        # The managed thing id.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        # The metadata for the managed thing.

        @[JSON::Field(key: "MetaData")]
        getter meta_data : Hash(String, String)?

        def initialize(
          @managed_thing_id : String? = nil,
          @meta_data : Hash(String, String)? = nil
        )
        end
      end


      struct GetManagedThingRequest
        include JSON::Serializable

        # The id of the managed thing.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetManagedThingResponse
        include JSON::Serializable

        # The timestampe value of when the device was activated.

        @[JSON::Field(key: "ActivatedAt")]
        getter activated_at : Time?

        # The id of the advertised product.

        @[JSON::Field(key: "AdvertisedProductId")]
        getter advertised_product_id : String?

        # The Amazon Resource Name (ARN) of the managed thing.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The brand of the device.

        @[JSON::Field(key: "Brand")]
        getter brand : String?

        # The classification of the managed thing such as light bulb or thermostat.

        @[JSON::Field(key: "Classification")]
        getter classification : String?

        # The identifier of the connector destination associated with this managed thing.

        @[JSON::Field(key: "ConnectorDestinationId")]
        getter connector_destination_id : String?

        # The third-party device id as defined by the connector. This device id must not contain personal
        # identifiable information (PII). This parameter is used for cloud-to-cloud devices only.

        @[JSON::Field(key: "ConnectorDeviceId")]
        getter connector_device_id : String?

        # The id of the connector policy. This parameter is used for cloud-to-cloud devices only.

        @[JSON::Field(key: "ConnectorPolicyId")]
        getter connector_policy_id : String?

        # The timestamp value of when the device creation request occurred.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the credential locker for the managed thing.

        @[JSON::Field(key: "CredentialLockerId")]
        getter credential_locker_id : String?

        # A Zwave device-specific key used during device activation. This parameter is used for Zwave devices
        # only.

        @[JSON::Field(key: "DeviceSpecificKey")]
        getter device_specific_key : String?

        # The network mode for the hub-connected device.

        @[JSON::Field(key: "HubNetworkMode")]
        getter hub_network_mode : String?

        # The id of the managed thing.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The unique 13 digit number that identifies the managed thing.

        @[JSON::Field(key: "InternationalArticleNumber")]
        getter international_article_number : String?

        # The media access control (MAC) address for the device represented by the managed thing. This
        # parameter is used for Zigbee devices only.

        @[JSON::Field(key: "MacAddress")]
        getter mac_address : String?

        # The metadata for the managed thing.

        @[JSON::Field(key: "MetaData")]
        getter meta_data : Hash(String, String)?

        # The model of the device.

        @[JSON::Field(key: "Model")]
        getter model : String?

        # The name of the managed thing representing the physical device.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Owner of the device, usually an indication of whom the device belongs to. This value should not
        # contain personal identifiable information.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # Id of the controller device used for the discovery job.

        @[JSON::Field(key: "ParentControllerId")]
        getter parent_controller_id : String?

        # The provisioning status of the device in the provisioning workflow for onboarding to IoT managed
        # integrations. For more information, see Device Provisioning .

        @[JSON::Field(key: "ProvisioningStatus")]
        getter provisioning_status : String?

        # The type of device used. This will be the Amazon Web Services hub controller, cloud device, or IoT
        # device.

        @[JSON::Field(key: "Role")]
        getter role : String?

        # The serial number of the device.

        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # A set of key/value pairs that are used to manage the managed thing.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The universal product code (UPC) of the device model. The UPC is typically used in the United States
        # of America and Canada.

        @[JSON::Field(key: "UniversalProductCode")]
        getter universal_product_code : String?

        # The timestamp value of when the managed thing was last updated at.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        # The Wi-Fi Simple Setup configuration for the managed thing, which defines provisioning capabilities
        # and timeout settings.

        @[JSON::Field(key: "WiFiSimpleSetupConfiguration")]
        getter wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration?

        def initialize(
          @activated_at : Time? = nil,
          @advertised_product_id : String? = nil,
          @arn : String? = nil,
          @brand : String? = nil,
          @classification : String? = nil,
          @connector_destination_id : String? = nil,
          @connector_device_id : String? = nil,
          @connector_policy_id : String? = nil,
          @created_at : Time? = nil,
          @credential_locker_id : String? = nil,
          @device_specific_key : String? = nil,
          @hub_network_mode : String? = nil,
          @id : String? = nil,
          @international_article_number : String? = nil,
          @mac_address : String? = nil,
          @meta_data : Hash(String, String)? = nil,
          @model : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parent_controller_id : String? = nil,
          @provisioning_status : String? = nil,
          @role : String? = nil,
          @serial_number : String? = nil,
          @tags : Hash(String, String)? = nil,
          @universal_product_code : String? = nil,
          @updated_at : Time? = nil,
          @wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration? = nil
        )
        end
      end


      struct GetManagedThingStateRequest
        include JSON::Serializable

        # The id of the device.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String

        def initialize(
          @managed_thing_id : String
        )
        end
      end


      struct GetManagedThingStateResponse
        include JSON::Serializable

        # The device endpoint.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::StateEndpoint)

        def initialize(
          @endpoints : Array(Types::StateEndpoint)
        )
        end
      end


      struct GetNotificationConfigurationRequest
        include JSON::Serializable

        # The type of event triggering a device notification to the customer-managed destination.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        def initialize(
          @event_type : String
        )
        end
      end


      struct GetNotificationConfigurationResponse
        include JSON::Serializable

        # The timestamp value of when the notification configuration was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The name of the destination for the notification configuration.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        # The type of event triggering a device notification to the customer-managed destination.

        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        # A set of key/value pairs that are used to manage the notification configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The timestamp value of when the notification configuration was last updated.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @destination_name : String? = nil,
          @event_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetOtaTaskConfigurationRequest
        include JSON::Serializable

        # The over-the-air (OTA) task configuration id.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetOtaTaskConfigurationResponse
        include JSON::Serializable

        # The timestamp value of when the over-the-air (OTA) task configuration was created at.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A description of the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Describes the type of configuration used for the over-the-air (OTA) task.

        @[JSON::Field(key: "PushConfig")]
        getter push_config : Types::PushConfig?

        # The over-the-air (OTA) task configuration id.

        @[JSON::Field(key: "TaskConfigurationId")]
        getter task_configuration_id : String?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @push_config : Types::PushConfig? = nil,
          @task_configuration_id : String? = nil
        )
        end
      end


      struct GetOtaTaskRequest
        include JSON::Serializable

        # The over-the-air (OTA) task id.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetOtaTaskResponse
        include JSON::Serializable

        # The timestamp value of when the over-the-air (OTA) task was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the over-the-air (OTA) task.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp value of when the over-the-air (OTA) task was last updated at.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The deployment mechanism for the over-the-air (OTA) task.

        @[JSON::Field(key: "OtaMechanism")]
        getter ota_mechanism : String?


        @[JSON::Field(key: "OtaSchedulingConfig")]
        getter ota_scheduling_config : Types::OtaTaskSchedulingConfig?

        # The query string to add things to the thing group.

        @[JSON::Field(key: "OtaTargetQueryString")]
        getter ota_target_query_string : String?


        @[JSON::Field(key: "OtaTaskExecutionRetryConfig")]
        getter ota_task_execution_retry_config : Types::OtaTaskExecutionRetryConfig?

        # The frequency type for the over-the-air (OTA) task.

        @[JSON::Field(key: "OtaType")]
        getter ota_type : String?

        # The connection protocol the over-the-air (OTA) task uses to update the device.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The URL to the Amazon S3 bucket where the over-the-air (OTA) task is stored.

        @[JSON::Field(key: "S3Url")]
        getter s3_url : String?

        # The status of the over-the-air (OTA) task.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A set of key/value pairs that are used to manage the over-the-air (OTA) task.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The device targeted for the over-the-air (OTA) task.

        @[JSON::Field(key: "Target")]
        getter target : Array(String)?

        # The Amazon Resource Name (ARN) of the over-the-air (OTA) task

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The identifier for the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "TaskConfigurationId")]
        getter task_configuration_id : String?

        # The id of the over-the-air (OTA) task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # The processing details of all over-the-air (OTA) tasks.

        @[JSON::Field(key: "TaskProcessingDetails")]
        getter task_processing_details : Types::TaskProcessingDetails?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @ota_mechanism : String? = nil,
          @ota_scheduling_config : Types::OtaTaskSchedulingConfig? = nil,
          @ota_target_query_string : String? = nil,
          @ota_task_execution_retry_config : Types::OtaTaskExecutionRetryConfig? = nil,
          @ota_type : String? = nil,
          @protocol : String? = nil,
          @s3_url : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target : Array(String)? = nil,
          @task_arn : String? = nil,
          @task_configuration_id : String? = nil,
          @task_id : String? = nil,
          @task_processing_details : Types::TaskProcessingDetails? = nil
        )
        end
      end


      struct GetProvisioningProfileRequest
        include JSON::Serializable

        # The provisioning template the device uses for the provisioning process.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetProvisioningProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the provisioning template used in the provisioning profile.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The id of the claim certificate.

        @[JSON::Field(key: "ClaimCertificate")]
        getter claim_certificate : String?

        # The provisioning profile id.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the provisioning template.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of provisioning workflow the device uses for onboarding to IoT managed integrations.

        @[JSON::Field(key: "ProvisioningType")]
        getter provisioning_type : String?

        # A set of key/value pairs that are used to manage the provisioning profile.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @claim_certificate : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @provisioning_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetRuntimeLogConfigurationRequest
        include JSON::Serializable

        # The id for a managed thing.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String

        def initialize(
          @managed_thing_id : String
        )
        end
      end


      struct GetRuntimeLogConfigurationResponse
        include JSON::Serializable

        # The id for a managed thing.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        # The runtime log configuration for a managed thing.

        @[JSON::Field(key: "RuntimeLogConfigurations")]
        getter runtime_log_configurations : Types::RuntimeLogConfigurations?

        def initialize(
          @managed_thing_id : String? = nil,
          @runtime_log_configurations : Types::RuntimeLogConfigurations? = nil
        )
        end
      end


      struct GetSchemaVersionRequest
        include JSON::Serializable

        # Schema id with a version specified. If the version is missing, it defaults to latest version.

        @[JSON::Field(key: "SchemaVersionedId")]
        getter schema_versioned_id : String

        # The type of schema version.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The format of the schema version.

        @[JSON::Field(key: "Format")]
        getter format : String?

        def initialize(
          @schema_versioned_id : String,
          @type : String,
          @format : String? = nil
        )
        end
      end


      struct GetSchemaVersionResponse
        include JSON::Serializable

        # The description of the schema version.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the schema version.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The schema of the schema version.

        @[JSON::Field(key: "Schema")]
        getter schema : Types::SchemaVersionSchema?

        # The id of the schema version.

        @[JSON::Field(key: "SchemaId")]
        getter schema_id : String?

        # The schema version. If this is left blank, it defaults to the latest version.

        @[JSON::Field(key: "SemanticVersion")]
        getter semantic_version : String?

        # The type of schema version.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The visibility of the schema version.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @description : String? = nil,
          @namespace : String? = nil,
          @schema : Types::SchemaVersionSchema? = nil,
          @schema_id : String? = nil,
          @semantic_version : String? = nil,
          @type : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # An unexpected error has occurred.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Internal error from the service that indicates an unexpected error or that the service is
      # unavailable.

      struct InternalServerException
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

      # Configuration details for an AWS Lambda function used as an endpoint for a cloud connector.

      struct LambdaConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function used as an endpoint.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The request exceeds a service limit or quota. Adjust your request parameters and try again.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAccountAssociationsRequest
        include JSON::Serializable

        # The identifier of the connector destination to filter account associations by.

        @[JSON::Field(key: "ConnectorDestinationId")]
        getter connector_destination_id : String?

        # The maximum number of account associations to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token used for pagination of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connector_destination_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssociationsResponse
        include JSON::Serializable

        # The list of account associations that match the specified criteria.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::AccountAssociationItem)?

        # A token used for pagination of results when there are more account associations than can be returned
        # in a single response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AccountAssociationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCloudConnectorsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function to filter cloud connectors by.

        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String?

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of cloud connectors to filter by when listing available connectors.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @lambda_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListCloudConnectorsResponse
        include JSON::Serializable

        # The list of connectors.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ConnectorItem)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ConnectorItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorDestinationsRequest
        include JSON::Serializable

        # The identifier of the cloud connector to filter connector destinations by.

        @[JSON::Field(key: "CloudConnectorId")]
        getter cloud_connector_id : String?

        # The maximum number of connector destinations to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token used for pagination of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cloud_connector_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorDestinationsResponse
        include JSON::Serializable

        # The list of connector destinations that match the specified criteria.

        @[JSON::Field(key: "ConnectorDestinationList")]
        getter connector_destination_list : Array(Types::ConnectorDestinationSummary)?

        # A token used for pagination of results when there are more connector destinations than can be
        # returned in a single response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connector_destination_list : Array(Types::ConnectorDestinationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCredentialLockersRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCredentialLockersResponse
        include JSON::Serializable

        # The list of credential lockers.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::CredentialLockerSummary)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::CredentialLockerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDestinationsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDestinationsResponse
        include JSON::Serializable

        # The list of destinations.

        @[JSON::Field(key: "DestinationList")]
        getter destination_list : Array(Types::DestinationSummary)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @destination_list : Array(Types::DestinationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeviceDiscoveriesRequest
        include JSON::Serializable

        # The maximum number of device discovery jobs to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token used for pagination of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status to filter device discovery jobs by.

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : String?

        # The discovery type to filter device discovery jobs by.

        @[JSON::Field(key: "TypeFilter")]
        getter type_filter : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status_filter : String? = nil,
          @type_filter : String? = nil
        )
        end
      end


      struct ListDeviceDiscoveriesResponse
        include JSON::Serializable

        # The list of device discovery jobs that match the specified criteria.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DeviceDiscoverySummary)?

        # A token used for pagination of results when there are more device discovery jobs than can be
        # returned in a single response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DeviceDiscoverySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDiscoveredDevicesRequest
        include JSON::Serializable

        # The identifier of the device discovery job to list discovered devices for.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The maximum number of discovered devices to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token used for pagination of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDiscoveredDevicesResponse
        include JSON::Serializable

        # The list of discovered devices that match the specified criteria.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DiscoveredDeviceSummary)?

        # A token used for pagination of results when there are more discovered devices than can be returned
        # in a single response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DiscoveredDeviceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventLogConfigurationsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventLogConfigurationsResponse
        include JSON::Serializable

        # A list of each event log configuration and pertinent information.

        @[JSON::Field(key: "EventLogConfigurationList")]
        getter event_log_configuration_list : Array(Types::EventLogConfigurationSummary)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_log_configuration_list : Array(Types::EventLogConfigurationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedThingAccountAssociationsRequest
        include JSON::Serializable

        # The identifier of the account association to filter results by. When specified, only associations
        # with this account association ID will be returned.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String?

        # The identifier of the managed thing to list account associations for.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        # The maximum number of account associations to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token used for pagination of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_association_id : String? = nil,
          @managed_thing_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedThingAccountAssociationsResponse
        include JSON::Serializable

        # The list of managed thing associations that match the specified criteria, including the managed
        # thing ID and account association ID for each association.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ManagedThingAssociation)?

        # A token used for pagination of results when there are more account associations than can be returned
        # in a single response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ManagedThingAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedThingSchemasRequest
        include JSON::Serializable

        # The managed thing id.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Filter on a capability id.

        @[JSON::Field(key: "CapabilityIdFilter")]
        getter capability_id_filter : String?

        # Filter on an endpoint id.

        @[JSON::Field(key: "EndpointIdFilter")]
        getter endpoint_id_filter : String?

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identifier : String,
          @capability_id_filter : String? = nil,
          @endpoint_id_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedThingSchemasResponse
        include JSON::Serializable

        # The list of managed thing schemas.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ManagedThingSchemaListItem)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ManagedThingSchemaListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedThingsRequest
        include JSON::Serializable

        # Filter managed things by the connector destination ID they are associated with.

        @[JSON::Field(key: "ConnectorDestinationIdFilter")]
        getter connector_destination_id_filter : String?

        # Filter managed things by the connector device ID they are associated with. When specified, only
        # managed things with this connector device ID will be returned.

        @[JSON::Field(key: "ConnectorDeviceIdFilter")]
        getter connector_device_id_filter : String?

        # Filter on a connector policy id for a managed thing.

        @[JSON::Field(key: "ConnectorPolicyIdFilter")]
        getter connector_policy_id_filter : String?

        # Filter on a credential locker for a managed thing.

        @[JSON::Field(key: "CredentialLockerFilter")]
        getter credential_locker_filter : String?

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter on device owners when listing managed things.

        @[JSON::Field(key: "OwnerFilter")]
        getter owner_filter : String?

        # Filter on a parent controller id for a managed thing.

        @[JSON::Field(key: "ParentControllerIdentifierFilter")]
        getter parent_controller_identifier_filter : String?

        # Filter on the status of the device. For more information, see Device Provisioning .

        @[JSON::Field(key: "ProvisioningStatusFilter")]
        getter provisioning_status_filter : String?

        # Filter on the type of device used. This will be the Amazon Web Services hub controller, cloud
        # device, or IoT device.

        @[JSON::Field(key: "RoleFilter")]
        getter role_filter : String?

        # Filter on the serial number of the device.

        @[JSON::Field(key: "SerialNumberFilter")]
        getter serial_number_filter : String?

        def initialize(
          @connector_destination_id_filter : String? = nil,
          @connector_device_id_filter : String? = nil,
          @connector_policy_id_filter : String? = nil,
          @credential_locker_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner_filter : String? = nil,
          @parent_controller_identifier_filter : String? = nil,
          @provisioning_status_filter : String? = nil,
          @role_filter : String? = nil,
          @serial_number_filter : String? = nil
        )
        end
      end


      struct ListManagedThingsResponse
        include JSON::Serializable

        # The list of managed things.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ManagedThingSummary)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ManagedThingSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationConfigurationsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationConfigurationsResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of notification configurations.

        @[JSON::Field(key: "NotificationConfigurationList")]
        getter notification_configuration_list : Array(Types::NotificationConfigurationSummary)?

        def initialize(
          @next_token : String? = nil,
          @notification_configuration_list : Array(Types::NotificationConfigurationSummary)? = nil
        )
        end
      end


      struct ListOtaTaskConfigurationsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOtaTaskConfigurationsResponse
        include JSON::Serializable

        # The list of the over-the-air (OTA) task configurations.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::OtaTaskConfigurationSummary)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::OtaTaskConfigurationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOtaTaskExecutionsRequest
        include JSON::Serializable

        # The over-the-air (OTA) task id.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOtaTaskExecutionsResponse
        include JSON::Serializable

        # A list of all of the over-the-air (OTA) task executions.

        @[JSON::Field(key: "ExecutionSummaries")]
        getter execution_summaries : Array(Types::OtaTaskExecutionSummaries)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @execution_summaries : Array(Types::OtaTaskExecutionSummaries)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOtaTasksRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOtaTasksResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of all of the over-the-air (OTA) tasks.

        @[JSON::Field(key: "Tasks")]
        getter tasks : Array(Types::OtaTaskSummary)?

        def initialize(
          @next_token : String? = nil,
          @tasks : Array(Types::OtaTaskSummary)? = nil
        )
        end
      end


      struct ListProvisioningProfilesRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProvisioningProfilesResponse
        include JSON::Serializable

        # The list of provisioning profiles.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ProvisioningProfileSummary)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProvisioningProfileSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemaVersionsRequest
        include JSON::Serializable

        # Filter on the type of schema version.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Filter on the name of the schema version.

        @[JSON::Field(key: "NamespaceFilter")]
        getter namespace : String?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter on the id of the schema version.

        @[JSON::Field(key: "SchemaIdFilter")]
        getter schema_id : String?

        # The schema version. If this is left blank, it defaults to the latest version.

        @[JSON::Field(key: "SemanticVersionFilter")]
        getter semantic_version : String?

        # The visibility of the schema version.

        @[JSON::Field(key: "VisibilityFilter")]
        getter visibility : String?

        def initialize(
          @type : String,
          @max_results : Int32? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @schema_id : String? = nil,
          @semantic_version : String? = nil,
          @visibility : String? = nil
        )
        end
      end


      struct ListSchemaVersionsResponse
        include JSON::Serializable

        # The list of schema versions.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::SchemaVersionListItem)?

        # A token that can be used to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SchemaVersionListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource for which to list tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A set of key/value pairs that are used to manage the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Structure representing an association between a managed thing and an account association, which
      # connects a device to a third-party account.

      struct ManagedThingAssociation
        include JSON::Serializable

        # The identifier of the account association in the association.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String?

        # The identifier of the managed thing in the association.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        def initialize(
          @account_association_id : String? = nil,
          @managed_thing_id : String? = nil
        )
        end
      end

      # Structure representing one schema item associated with a managed thing.

      struct ManagedThingSchemaListItem
        include JSON::Serializable

        # The id of the capability for a managed thing.

        @[JSON::Field(key: "CapabilityId")]
        getter capability_id : String?

        # The id of the endpoint for a managed thing.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The validation schema for one schema item associated with a managed thing.

        @[JSON::Field(key: "Schema")]
        getter schema : Types::ValidationSchema?

        def initialize(
          @capability_id : String? = nil,
          @endpoint_id : String? = nil,
          @schema : Types::ValidationSchema? = nil
        )
        end
      end

      # Structure representing one managed thing.

      struct ManagedThingSummary
        include JSON::Serializable

        # The timestampe value of when the managed thing was activated at.

        @[JSON::Field(key: "ActivatedAt")]
        getter activated_at : Time?

        # The id of the advertised product.

        @[JSON::Field(key: "AdvertisedProductId")]
        getter advertised_product_id : String?

        # The Amazon Resource Name (ARN) of the managed thing.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The brand of the device.

        @[JSON::Field(key: "Brand")]
        getter brand : String?

        # The classification of the managed thing such as light bulb or thermostat.

        @[JSON::Field(key: "Classification")]
        getter classification : String?

        # The identifier of the connector destination associated with this managed thing, if applicable.

        @[JSON::Field(key: "ConnectorDestinationId")]
        getter connector_destination_id : String?

        # The third-party device id as defined by the connector. This device id must not contain personal
        # identifiable information (PII). This parameter is used for cloud-to-cloud devices only.

        @[JSON::Field(key: "ConnectorDeviceId")]
        getter connector_device_id : String?

        # The id of the connector policy. This parameter is used for cloud-to-cloud devices only.

        @[JSON::Field(key: "ConnectorPolicyId")]
        getter connector_policy_id : String?

        # The timestamp value of when the device creation request occurred.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the credential locker for the managed thing.

        @[JSON::Field(key: "CredentialLockerId")]
        getter credential_locker_id : String?

        # The id of the device.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The model of the device.

        @[JSON::Field(key: "Model")]
        getter model : String?

        # The name of the managed thing representing the physical device.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Owner of the device, usually an indication of whom the device belongs to. This value should not
        # contain personal identifiable information.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # Id of the controller device used for the discovery job.

        @[JSON::Field(key: "ParentControllerId")]
        getter parent_controller_id : String?

        # The provisioning status of the device in the provisioning workflow for onboarding to IoT managed
        # integrations. For more information, see Device Provisioning .

        @[JSON::Field(key: "ProvisioningStatus")]
        getter provisioning_status : String?

        # The type of device used. This will be the Amazon Web Services hub controller, cloud device, or IoT
        # device.

        @[JSON::Field(key: "Role")]
        getter role : String?

        # The serial number of the device.

        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # The timestamp value of when the managed thing was last updated at.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @activated_at : Time? = nil,
          @advertised_product_id : String? = nil,
          @arn : String? = nil,
          @brand : String? = nil,
          @classification : String? = nil,
          @connector_destination_id : String? = nil,
          @connector_device_id : String? = nil,
          @connector_policy_id : String? = nil,
          @created_at : Time? = nil,
          @credential_locker_id : String? = nil,
          @id : String? = nil,
          @model : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parent_controller_id : String? = nil,
          @provisioning_status : String? = nil,
          @role : String? = nil,
          @serial_number : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct MatterAttributes
        include JSON::Serializable

        def initialize
        end
      end

      # Matter based capability report.

      struct MatterCapabilityReport
        include JSON::Serializable

        # The endpoints used in the capability report.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::MatterCapabilityReportEndpoint)

        # The version of the capability report.

        @[JSON::Field(key: "version")]
        getter version : String

        # The numeric identifier of the node.

        @[JSON::Field(key: "nodeId")]
        getter node_id : String?

        def initialize(
          @endpoints : Array(Types::MatterCapabilityReportEndpoint),
          @version : String,
          @node_id : String? = nil
        )
        end
      end

      # Matter attribute used in capability report.

      struct MatterCapabilityReportAttribute
        include JSON::Serializable

        # The id of the Matter attribute.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Name for the Amazon Web Services Matter capability report attribute.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Value for the Amazon Web Services Matter capability report attribute.

        @[JSON::Field(key: "value")]
        getter value : Types::MatterCapabilityReportAttributeValue?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @value : Types::MatterCapabilityReportAttributeValue? = nil
        )
        end
      end


      struct MatterCapabilityReportAttributeValue
        include JSON::Serializable

        def initialize
        end
      end

      # Capability used in Matter capability report.

      struct MatterCapabilityReportCluster
        include JSON::Serializable

        # The id of the Amazon Web Services Matter capability report cluster.

        @[JSON::Field(key: "id")]
        getter id : String

        # The id of the revision for the Amazon Web Services Matter capability report.

        @[JSON::Field(key: "revision")]
        getter revision : Int32

        # The attributes of the Amazon Web Services Matter capability report.

        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::MatterCapabilityReportAttribute)?

        # The commands used with the Amazon Web Services Matter capability report.

        @[JSON::Field(key: "commands")]
        getter commands : Array(String)?

        # The events used with the Amazon Web Services Matter capability report.

        @[JSON::Field(key: "events")]
        getter events : Array(String)?

        # The fabric index for the Amazon Web Services Matter capability report.

        @[JSON::Field(key: "fabricIndex")]
        getter fabric_index : Int32?

        # 32 bit-map used to indicate which features a cluster supports.

        @[JSON::Field(key: "featureMap")]
        getter feature_map : Int64?

        # Matter clusters used in capability report.

        @[JSON::Field(key: "generatedCommands")]
        getter generated_commands : Array(String)?

        # The capability name used in the Amazon Web Services Matter capability report.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The id of the schema version.

        @[JSON::Field(key: "publicId")]
        getter public_id : String?

        # The spec version used in the Amazon Web Services Matter capability report.

        @[JSON::Field(key: "specVersion")]
        getter spec_version : String?

        def initialize(
          @id : String,
          @revision : Int32,
          @attributes : Array(Types::MatterCapabilityReportAttribute)? = nil,
          @commands : Array(String)? = nil,
          @events : Array(String)? = nil,
          @fabric_index : Int32? = nil,
          @feature_map : Int64? = nil,
          @generated_commands : Array(String)? = nil,
          @name : String? = nil,
          @public_id : String? = nil,
          @spec_version : String? = nil
        )
        end
      end

      # Matter endpoint used in capability report.

      struct MatterCapabilityReportEndpoint
        include JSON::Serializable

        # Matter clusters used in capability report.

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::MatterCapabilityReportCluster)

        # The type of device.

        @[JSON::Field(key: "deviceTypes")]
        getter device_types : Array(String)

        # The id of the Amazon Web Services Matter capability report endpoint.

        @[JSON::Field(key: "id")]
        getter id : String

        # Semantic information related to endpoint.

        @[JSON::Field(key: "clientClusters")]
        getter client_clusters : Array(String)?

        # Heirachy of child endpoints contained in the given endpoint.

        @[JSON::Field(key: "parts")]
        getter parts : Array(String)?

        # Semantic information related to endpoint.

        @[JSON::Field(key: "semanticTags")]
        getter semantic_tags : Array(String)?

        def initialize(
          @clusters : Array(Types::MatterCapabilityReportCluster),
          @device_types : Array(String),
          @id : String,
          @client_clusters : Array(String)? = nil,
          @parts : Array(String)? = nil,
          @semantic_tags : Array(String)? = nil
        )
        end
      end

      # Describe a Matter cluster with an id, and the relevant attributes, commands, and events.

      struct MatterCluster
        include JSON::Serializable

        # The Matter attributes.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::MatterAttributes?

        # Describe the Matter commands with the Matter command identifier mapped to the command fields.

        @[JSON::Field(key: "commands")]
        getter commands : Hash(String, Types::MatterFields)?

        # Describe the Matter events with the Matter event identifier mapped to the event fields.

        @[JSON::Field(key: "events")]
        getter events : Hash(String, Types::MatterFields)?

        # The cluster id.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @attributes : Types::MatterAttributes? = nil,
          @commands : Hash(String, Types::MatterFields)? = nil,
          @events : Hash(String, Types::MatterFields)? = nil,
          @id : String? = nil
        )
        end
      end

      # Structure describing a managed thing.

      struct MatterEndpoint
        include JSON::Serializable

        # A list of Matter clusters for a managed thing.

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::MatterCluster)?

        # The Matter endpoint id.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @clusters : Array(Types::MatterCluster)? = nil,
          @id : String? = nil
        )
        end
      end


      struct MatterFields
        include JSON::Serializable

        def initialize
        end
      end

      # Structure describing a notification configuration.

      struct NotificationConfigurationSummary
        include JSON::Serializable

        # The name of the destination for the notification configuration.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String?

        # The type of event triggering a device notification to the customer-managed destination.

        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        def initialize(
          @destination_name : String? = nil,
          @event_type : String? = nil
        )
        end
      end

      # Configuration details for OAuth authentication with a third-party service.

      struct OAuthConfig
        include JSON::Serializable

        # The authorization URL for the OAuth service, where users are directed to authenticate and authorize
        # access.

        @[JSON::Field(key: "authUrl")]
        getter auth_url : String

        # The authentication scheme used when requesting tokens from the token endpoint.

        @[JSON::Field(key: "tokenEndpointAuthenticationScheme")]
        getter token_endpoint_authentication_scheme : String

        # The token URL for the OAuth service, where authorization codes are exchanged for access tokens.

        @[JSON::Field(key: "tokenUrl")]
        getter token_url : String

        # The URL where users are redirected after completing the OAuth authorization process.

        @[JSON::Field(key: "oAuthCompleteRedirectUrl")]
        getter o_auth_complete_redirect_url : String?

        # Configuration for proactively refreshing OAuth tokens before they expire.

        @[JSON::Field(key: "proactiveRefreshTokenRenewal")]
        getter proactive_refresh_token_renewal : Types::ProactiveRefreshTokenRenewal?

        # The OAuth scopes requested during authorization, which define the permissions granted to the
        # application.

        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @auth_url : String,
          @token_endpoint_authentication_scheme : String,
          @token_url : String,
          @o_auth_complete_redirect_url : String? = nil,
          @proactive_refresh_token_renewal : Types::ProactiveRefreshTokenRenewal? = nil,
          @scope : String? = nil
        )
        end
      end

      # Structure containing updated OAuth configuration settings.

      struct OAuthUpdate
        include JSON::Serializable

        # The updated URL where users are redirected after completing the OAuth authorization process.

        @[JSON::Field(key: "oAuthCompleteRedirectUrl")]
        getter o_auth_complete_redirect_url : String?

        # Updated configuration for proactively refreshing OAuth tokens before they expire.

        @[JSON::Field(key: "proactiveRefreshTokenRenewal")]
        getter proactive_refresh_token_renewal : Types::ProactiveRefreshTokenRenewal?

        def initialize(
          @o_auth_complete_redirect_url : String? = nil,
          @proactive_refresh_token_renewal : Types::ProactiveRefreshTokenRenewal? = nil
        )
        end
      end

      # Over-the-air (OTA) task abort config.

      struct OtaTaskAbortConfig
        include JSON::Serializable

        # The list of criteria for the abort config.

        @[JSON::Field(key: "AbortConfigCriteriaList")]
        getter abort_config_criteria_list : Array(Types::AbortConfigCriteria)?

        def initialize(
          @abort_config_criteria_list : Array(Types::AbortConfigCriteria)? = nil
        )
        end
      end

      # Structure representing one over-the-air (OTA) task configuration.

      struct OtaTaskConfigurationSummary
        include JSON::Serializable

        # The timestamp value of when the over-the-air (OTA) task configuration was created at.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The name of the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The id of the over-the-air (OTA) task configuration

        @[JSON::Field(key: "TaskConfigurationId")]
        getter task_configuration_id : String?

        def initialize(
          @created_at : Time? = nil,
          @name : String? = nil,
          @task_configuration_id : String? = nil
        )
        end
      end

      # Over-the-air (OTA) task retry config.

      struct OtaTaskExecutionRetryConfig
        include JSON::Serializable

        # The list of retry config criteria.

        @[JSON::Field(key: "RetryConfigCriteria")]
        getter retry_config_criteria : Array(Types::RetryConfigCriteria)?

        def initialize(
          @retry_config_criteria : Array(Types::RetryConfigCriteria)? = nil
        )
        end
      end

      # Over-the-air (OTA) task rollout config.

      struct OtaTaskExecutionRolloutConfig
        include JSON::Serializable

        # Structure representing exponential rate of rollout for an over-the-air (OTA) task.

        @[JSON::Field(key: "ExponentialRolloutRate")]
        getter exponential_rollout_rate : Types::ExponentialRolloutRate?

        # The maximum number of things that will be notified of a pending task, per minute.

        @[JSON::Field(key: "MaximumPerMinute")]
        getter maximum_per_minute : Int32?

        def initialize(
          @exponential_rollout_rate : Types::ExponentialRolloutRate? = nil,
          @maximum_per_minute : Int32? = nil
        )
        end
      end

      # Structure representing one execution summary.

      struct OtaTaskExecutionSummaries
        include JSON::Serializable

        # The id of a managed thing.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        # Structure representing one over-the-air (OTA) task execution summary

        @[JSON::Field(key: "TaskExecutionSummary")]
        getter task_execution_summary : Types::OtaTaskExecutionSummary?

        def initialize(
          @managed_thing_id : String? = nil,
          @task_execution_summary : Types::OtaTaskExecutionSummary? = nil
        )
        end
      end

      # Structure representing one over-the-air (OTA) task execution summary.

      struct OtaTaskExecutionSummary
        include JSON::Serializable

        # The execution number of the over-the-air (OTA) task execution summary.

        @[JSON::Field(key: "ExecutionNumber")]
        getter execution_number : Int64?

        # The timestamp value of when the over-the-air (OTA) task execution summary was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The timestamp value of when the over-the-air (OTA) task execution summary is targeted to start.

        @[JSON::Field(key: "QueuedAt")]
        getter queued_at : Time?

        # The number of retry attempts for starting the over-the-air (OTA) task execution summary after a
        # failed attempt.

        @[JSON::Field(key: "RetryAttempt")]
        getter retry_attempt : Int32?

        # The timestamp value of when the over-the-air (OTA) task execution summary started.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time?

        # The status of the over-the-air (OTA) task execution summary.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @execution_number : Int64? = nil,
          @last_updated_at : Time? = nil,
          @queued_at : Time? = nil,
          @retry_attempt : Int32? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Over-the-air (OTA) task scheduling config.

      struct OtaTaskSchedulingConfig
        include JSON::Serializable

        # Specifies the end behavior for all task executions after a task reaches the selected endTime . If
        # endTime is not selected when creating the task, then endBehavior does not apply.

        @[JSON::Field(key: "EndBehavior")]
        getter end_behavior : String?

        # The time an over-the-air (OTA) task will stop.

        @[JSON::Field(key: "EndTime")]
        getter end_time : String?

        # Maintenance window list for over-the-air (OTA) task scheduling config.

        @[JSON::Field(key: "MaintenanceWindows")]
        getter maintenance_windows : Array(Types::ScheduleMaintenanceWindow)?

        # The time an over-the-air (OTA) task will start.

        @[JSON::Field(key: "StartTime")]
        getter start_time : String?

        def initialize(
          @end_behavior : String? = nil,
          @end_time : String? = nil,
          @maintenance_windows : Array(Types::ScheduleMaintenanceWindow)? = nil,
          @start_time : String? = nil
        )
        end
      end

      # Structure representing one over-the-air (OTA) task.

      struct OtaTaskSummary
        include JSON::Serializable

        # The timestamp value of when the over-the-air (OTA) task was created at.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The timestamp value of when the over-the-air (OTA) task was last updated at.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The status of the over-the-air (OTA) task summary.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the over-the-air (OTA) task.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The identifier for the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "TaskConfigurationId")]
        getter task_configuration_id : String?

        # The id of the over-the-air (OTA) task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        def initialize(
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil,
          @task_arn : String? = nil,
          @task_configuration_id : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      # Over-the-air (OTA) task timeout config.

      struct OtaTaskTimeoutConfig
        include JSON::Serializable

        # Specifies the amount of time the device has to finish execution of this task. The timeout interval
        # can be anywhere between 1 minute and 7 days.

        @[JSON::Field(key: "InProgressTimeoutInMinutes")]
        getter in_progress_timeout_in_minutes : Int64?

        def initialize(
          @in_progress_timeout_in_minutes : Int64? = nil
        )
        end
      end

      # Configuration settings for proactively refreshing OAuth tokens before they expire.

      struct ProactiveRefreshTokenRenewal
        include JSON::Serializable

        # The days before token expiration when the system should attempt to renew the token, specified in
        # days.

        @[JSON::Field(key: "DaysBeforeRenewal")]
        getter days_before_renewal : Int32?

        # Indicates whether proactive refresh token renewal is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @days_before_renewal : Int32? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # Structure describing a provisioning profile.

      struct ProvisioningProfileSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the provisioning template used in the provisioning profile.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The identifier of the provisioning profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the provisioning template.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of provisioning workflow the device uses for onboarding to IoT managed integrations.

        @[JSON::Field(key: "ProvisioningType")]
        getter provisioning_type : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @provisioning_type : String? = nil
        )
        end
      end

      # Structure representing a push config.

      struct PushConfig
        include JSON::Serializable

        # Structure representing one abort config.

        @[JSON::Field(key: "AbortConfig")]
        getter abort_config : Types::OtaTaskAbortConfig?

        # Structure representing one rollout config.

        @[JSON::Field(key: "RolloutConfig")]
        getter rollout_config : Types::OtaTaskExecutionRolloutConfig?

        # Structure representing one timeout config.

        @[JSON::Field(key: "TimeoutConfig")]
        getter timeout_config : Types::OtaTaskTimeoutConfig?

        def initialize(
          @abort_config : Types::OtaTaskAbortConfig? = nil,
          @rollout_config : Types::OtaTaskExecutionRolloutConfig? = nil,
          @timeout_config : Types::OtaTaskTimeoutConfig? = nil
        )
        end
      end


      struct PutDefaultEncryptionConfigurationRequest
        include JSON::Serializable

        # The type of encryption used for the encryption configuration.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The Key Amazon Resource Name (ARN) of the AWS KMS key used for KMS encryption if you use
        # KMS_BASED_ENCRYPTION .

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @encryption_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct PutDefaultEncryptionConfigurationResponse
        include JSON::Serializable

        # Provides the status of the default encryption configuration for an Amazon Web Services account.

        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : Types::ConfigurationStatus

        # The type of encryption used for the encryption configuration.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The Key Amazon Resource Name (ARN) of the AWS KMS key used for KMS encryption if you use
        # KMS_BASED_ENCRYPTION .

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @configuration_status : Types::ConfigurationStatus,
          @encryption_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct PutHubConfigurationRequest
        include JSON::Serializable

        # A user-defined integer value that represents the hub token timer expiry setting in seconds.

        @[JSON::Field(key: "HubTokenTimerExpirySettingInSeconds")]
        getter hub_token_timer_expiry_setting_in_seconds : Int64

        def initialize(
          @hub_token_timer_expiry_setting_in_seconds : Int64
        )
        end
      end


      struct PutHubConfigurationResponse
        include JSON::Serializable

        # A user-defined integer value that represents the hub token timer expiry setting in seconds.

        @[JSON::Field(key: "HubTokenTimerExpirySettingInSeconds")]
        getter hub_token_timer_expiry_setting_in_seconds : Int64?

        def initialize(
          @hub_token_timer_expiry_setting_in_seconds : Int64? = nil
        )
        end
      end


      struct PutRuntimeLogConfigurationRequest
        include JSON::Serializable

        # The id for a managed thing.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String

        # The runtime log configuration for a managed thing.

        @[JSON::Field(key: "RuntimeLogConfigurations")]
        getter runtime_log_configurations : Types::RuntimeLogConfigurations

        def initialize(
          @managed_thing_id : String,
          @runtime_log_configurations : Types::RuntimeLogConfigurations
        )
        end
      end


      struct RegisterAccountAssociationRequest
        include JSON::Serializable

        # The identifier of the account association to register with the managed thing.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        # The identifier of the device discovery job associated with this registration.

        @[JSON::Field(key: "DeviceDiscoveryId")]
        getter device_discovery_id : String

        # The identifier of the managed thing to register with the account association.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String

        def initialize(
          @account_association_id : String,
          @device_discovery_id : String,
          @managed_thing_id : String
        )
        end
      end


      struct RegisterAccountAssociationResponse
        include JSON::Serializable

        # The identifier of the account association that was registered.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String?

        # The identifier of the device discovery job associated with this registration.

        @[JSON::Field(key: "DeviceDiscoveryId")]
        getter device_discovery_id : String?

        # The identifier of the managed thing that was registered with the account association.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String?

        def initialize(
          @account_association_id : String? = nil,
          @device_discovery_id : String? = nil,
          @managed_thing_id : String? = nil
        )
        end
      end


      struct RegisterCustomEndpointRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct RegisterCustomEndpointResponse
        include JSON::Serializable

        # The IoT managed integrations dedicated, custom endpoint for the device to route traffic through.

        @[JSON::Field(key: "EndpointAddress")]
        getter endpoint_address : String

        def initialize(
          @endpoint_address : String
        )
        end
      end


      struct ResetRuntimeLogConfigurationRequest
        include JSON::Serializable

        # The id of a managed thing.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String

        def initialize(
          @managed_thing_id : String
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Id of the affected resource

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Type of the affected resource

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Structure representing one retry config criteria.

      struct RetryConfigCriteria
        include JSON::Serializable

        # Over-the-air (OTA) retry criteria failure type.

        @[JSON::Field(key: "FailureType")]
        getter failure_type : String?

        # The number of retries allowed for a failure type for the over-the-air (OTA) task.

        @[JSON::Field(key: "MinNumberOfRetries")]
        getter min_number_of_retries : Int32?

        def initialize(
          @failure_type : String? = nil,
          @min_number_of_retries : Int32? = nil
        )
        end
      end

      # Structure representing rollout config criteria.

      struct RolloutRateIncreaseCriteria
        include JSON::Serializable

        # The threshold for number of notified things that will initiate the increase in rate of rollout.

        @[JSON::Field(key: "numberOfNotifiedThings")]
        getter number_of_notified_things : Int32?

        # The threshold for number of succeeded things that will initiate the increase in rate of rollout.

        @[JSON::Field(key: "numberOfSucceededThings")]
        getter number_of_succeeded_things : Int32?

        def initialize(
          @number_of_notified_things : Int32? = nil,
          @number_of_succeeded_things : Int32? = nil
        )
        end
      end

      # The different configurations for runtime logs.

      struct RuntimeLogConfigurations
        include JSON::Serializable

        # Configuration to enable or disable deleting of runtime logs in the device once uploaded to the
        # cloud.

        @[JSON::Field(key: "DeleteLocalStoreAfterUpload")]
        getter delete_local_store_after_upload : Bool?

        # Configuration to set the maximum bytes of runtime logs that can be stored on the device before the
        # oldest logs are deleted or overwritten.

        @[JSON::Field(key: "LocalStoreFileRotationMaxBytes")]
        getter local_store_file_rotation_max_bytes : Int32?

        # Configuration to set the maximum number of runtime log files that can be stored on the device before
        # the oldest files are deleted or overwritten.

        @[JSON::Field(key: "LocalStoreFileRotationMaxFiles")]
        getter local_store_file_rotation_max_files : Int32?

        # Configuration of where to store runtime logs in the device.

        @[JSON::Field(key: "LocalStoreLocation")]
        getter local_store_location : String?

        # The different log levels available for configuration.

        @[JSON::Field(key: "LogFlushLevel")]
        getter log_flush_level : String?

        # The different log levels available for configuration.

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String?

        # Configuration to enable or disable uploading of runtime logs to the cloud.

        @[JSON::Field(key: "UploadLog")]
        getter upload_log : Bool?

        # Configuration to set the time interval in minutes between each batch of runtime logs that the device
        # uploads to the cloud.

        @[JSON::Field(key: "UploadPeriodMinutes")]
        getter upload_period_minutes : Int32?

        def initialize(
          @delete_local_store_after_upload : Bool? = nil,
          @local_store_file_rotation_max_bytes : Int32? = nil,
          @local_store_file_rotation_max_files : Int32? = nil,
          @local_store_location : String? = nil,
          @log_flush_level : String? = nil,
          @log_level : String? = nil,
          @upload_log : Bool? = nil,
          @upload_period_minutes : Int32? = nil
        )
        end
      end

      # Structure representing scheduling maintenance window.

      struct ScheduleMaintenanceWindow
        include JSON::Serializable

        # Displays the duration of the next maintenance window.

        @[JSON::Field(key: "DurationInMinutes")]
        getter duration_in_minutes : Int32?

        # Displays the start time of the next maintenance window.

        @[JSON::Field(key: "StartTime")]
        getter start_time : String?

        def initialize(
          @duration_in_minutes : Int32? = nil,
          @start_time : String? = nil
        )
        end
      end

      # List item describing a schema version.

      struct SchemaVersionListItem
        include JSON::Serializable

        # A description of the schema version.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the schema version.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The identifier of the schema version.

        @[JSON::Field(key: "SchemaId")]
        getter schema_id : String?

        # The schema version. If this is left blank, it defaults to the latest version.

        @[JSON::Field(key: "SemanticVersion")]
        getter semantic_version : String?

        # The type of schema version.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The visibility of the schema version.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @description : String? = nil,
          @namespace : String? = nil,
          @schema_id : String? = nil,
          @semantic_version : String? = nil,
          @type : String? = nil,
          @visibility : String? = nil
        )
        end
      end


      struct SchemaVersionSchema
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration for AWS Secrets Manager, used to securely store and manage sensitive information for
      # connector destinations.

      struct SecretsManager
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Secrets Manager secret.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The version ID of the AWS Secrets Manager secret.

        @[JSON::Field(key: "versionId")]
        getter version_id : String

        def initialize(
          @arn : String,
          @version_id : String
        )
        end
      end


      struct SendConnectorEventRequest
        include JSON::Serializable

        # The id of the connector between the third-party cloud provider and IoT managed integrations.

        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        # The Open Connectivity Foundation (OCF) operation requested to be performed on the managed thing. The
        # field op can have a value of "I" or "U". The field "cn" will contain the capability types.

        @[JSON::Field(key: "Operation")]
        getter operation : String

        # The third-party device id as defined by the connector. This device id must not contain personal
        # identifiable information (PII). This parameter is used for cloud-to-cloud devices only.

        @[JSON::Field(key: "ConnectorDeviceId")]
        getter connector_device_id : String?

        # The id for the device discovery job.

        @[JSON::Field(key: "DeviceDiscoveryId")]
        getter device_discovery_id : String?

        # The list of devices.

        @[JSON::Field(key: "Devices")]
        getter devices : Array(Types::Device)?

        # The device endpoint.

        @[JSON::Field(key: "MatterEndpoint")]
        getter matter_endpoint : Types::MatterEndpoint?

        # The device state change event payload. This parameter will include the following three fields: uri :
        # schema auc://&lt;PARTNER-DEVICE-ID&gt;/ResourcePath (The Resourcepath corresponds to an OCF
        # resource.) op : For device state changes, this field must populate as n+d . cn : The content depends
        # on the OCF resource referenced in ResourcePath .

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Open Connectivity Foundation (OCF) security specification version for the operation being
        # requested on the managed thing. For more information, see OCF Security Specification .

        @[JSON::Field(key: "OperationVersion")]
        getter operation_version : String?

        # The status code of the Open Connectivity Foundation (OCF) operation being performed on the managed
        # thing.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        # The trace request identifier. This is generated by IoT managed integrations and can be used to trace
        # this command and its related operations in CloudWatch.

        @[JSON::Field(key: "TraceId")]
        getter trace_id : String?

        # The id of the third-party cloud provider.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @connector_id : String,
          @operation : String,
          @connector_device_id : String? = nil,
          @device_discovery_id : String? = nil,
          @devices : Array(Types::Device)? = nil,
          @matter_endpoint : Types::MatterEndpoint? = nil,
          @message : String? = nil,
          @operation_version : String? = nil,
          @status_code : Int32? = nil,
          @trace_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct SendConnectorEventResponse
        include JSON::Serializable

        # The id of the connector between the third-party cloud provider and IoT managed integrations.

        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        def initialize(
          @connector_id : String
        )
        end
      end


      struct SendManagedThingCommandRequest
        include JSON::Serializable

        # The device endpoint.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::CommandEndpoint)

        # The id of the device.

        @[JSON::Field(key: "ManagedThingId")]
        getter managed_thing_id : String

        # The identifier of the account association to use when sending a command to a managed thing.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String?

        # The ID tracking the current discovery process for one connector association.

        @[JSON::Field(key: "ConnectorAssociationId")]
        getter connector_association_id : String?

        def initialize(
          @endpoints : Array(Types::CommandEndpoint),
          @managed_thing_id : String,
          @account_association_id : String? = nil,
          @connector_association_id : String? = nil
        )
        end
      end


      struct SendManagedThingCommandResponse
        include JSON::Serializable

        # The trace request identifier. This is generated by IoT managed integrations and can be used to trace
        # this command and its related operations in CloudWatch.

        @[JSON::Field(key: "TraceId")]
        getter trace_id : String?

        def initialize(
          @trace_id : String? = nil
        )
        end
      end

      # The service quota has been exceeded for this request.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service is temporarily unavailable.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartAccountAssociationRefreshRequest
        include JSON::Serializable

        # The unique identifier of the account association to refresh.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        def initialize(
          @account_association_id : String
        )
        end
      end


      struct StartAccountAssociationRefreshResponse
        include JSON::Serializable

        # Third-party IoT platform OAuth authorization server URL with all required parameters to perform
        # end-user authentication during the refresh process.

        @[JSON::Field(key: "OAuthAuthorizationUrl")]
        getter o_auth_authorization_url : String

        def initialize(
          @o_auth_authorization_url : String
        )
        end
      end


      struct StartDeviceDiscoveryRequest
        include JSON::Serializable

        # The discovery type supporting the type of device to be discovered in the device discovery task
        # request.

        @[JSON::Field(key: "DiscoveryType")]
        getter discovery_type : String

        # The identifier of the cloud-to-cloud account association to use for discovery of third-party
        # devices.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String?

        # The authentication material required to start the local device discovery job request.

        @[JSON::Field(key: "AuthenticationMaterial")]
        getter authentication_material : String?

        # The type of authentication material used for device discovery jobs.

        @[JSON::Field(key: "AuthenticationMaterialType")]
        getter authentication_material_type : String?

        # An idempotency token. If you retry a request that completed successfully initially using the same
        # client token and parameters, then the retry attempt will succeed without performing any further
        # actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The id of the connector association.

        @[JSON::Field(key: "ConnectorAssociationIdentifier")]
        getter connector_association_identifier : String?

        # The id of the end-user's IoT hub.

        @[JSON::Field(key: "ControllerIdentifier")]
        getter controller_identifier : String?

        # Additional protocol-specific details required for device discovery, which vary based on the
        # discovery type. For a DiscoveryType of CUSTOM , the string-to-string map must have a key value of
        # Name set to a non-empty-string.

        @[JSON::Field(key: "CustomProtocolDetail")]
        getter custom_protocol_detail : Hash(String, String)?

        # The unique id of the end device for capability rediscovery. This parameter is only available when
        # the discovery type is CONTROLLER_CAPABILITY_REDISCOVERY.

        @[JSON::Field(key: "EndDeviceIdentifier")]
        getter end_device_identifier : String?

        # The protocol type for capability rediscovery (ZWAVE, ZIGBEE, or CUSTOM). This parameter is only
        # available when the discovery type is CONTROLLER_CAPABILITY_REDISCOVERY.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # A set of key/value pairs that are used to manage the device discovery request.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @discovery_type : String,
          @account_association_id : String? = nil,
          @authentication_material : String? = nil,
          @authentication_material_type : String? = nil,
          @client_token : String? = nil,
          @connector_association_identifier : String? = nil,
          @controller_identifier : String? = nil,
          @custom_protocol_detail : Hash(String, String)? = nil,
          @end_device_identifier : String? = nil,
          @protocol : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartDeviceDiscoveryResponse
        include JSON::Serializable

        # The id of the device discovery job request.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The timestamp value for the start time of the device discovery.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time?

        def initialize(
          @id : String? = nil,
          @started_at : Time? = nil
        )
        end
      end

      # State capabilities added for the managed thing.

      struct StateCapability
        include JSON::Serializable

        # The id of the managed thing in the capability report.

        @[JSON::Field(key: "id")]
        getter id : String

        # Name for the Amazon Web Services capability.

        @[JSON::Field(key: "name")]
        getter name : String

        # Version for the Amazon Web Services capability.

        @[JSON::Field(key: "version")]
        getter version : String

        # Describe the command capability with the properties it supports.

        @[JSON::Field(key: "properties")]
        getter properties : Types::CapabilityProperties?

        def initialize(
          @id : String,
          @name : String,
          @version : String,
          @properties : Types::CapabilityProperties? = nil
        )
        end
      end

      # Describe the endpoint with an Id, a name, and the relevant capabilities for reporting state

      struct StateEndpoint
        include JSON::Serializable

        # Describe the endpoint with an id, a name, and the relevant capabilities for the reporting state.

        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(Types::StateCapability)

        # Numeric identifier of the endpoint

        @[JSON::Field(key: "endpointId")]
        getter endpoint_id : String

        def initialize(
          @capabilities : Array(Types::StateCapability),
          @endpoint_id : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to which to add tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A set of key/value pairs that are used to manage the resource

        @[JSON::Field(key: "Tags")]
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

      # Details about the over-the-air (OTA) task process.

      struct TaskProcessingDetails
        include JSON::Serializable

        # The number of canceled things in an over-the-air (OTA) task.

        @[JSON::Field(key: "NumberOfCanceledThings")]
        getter number_of_canceled_things : Int32?

        # The number of failed things in an over-the-air (OTA) task.

        @[JSON::Field(key: "NumberOfFailedThings")]
        getter number_of_failed_things : Int32?

        # The number of in progress things in an over-the-air (OTA) task.

        @[JSON::Field(key: "NumberOfInProgressThings")]
        getter number_of_in_progress_things : Int32?

        # The number of queued things in an over-the-air (OTA) task.

        @[JSON::Field(key: "numberOfQueuedThings")]
        getter number_of_queued_things : Int32?

        # The number of rejected things in an over-the-air (OTA) task.

        @[JSON::Field(key: "numberOfRejectedThings")]
        getter number_of_rejected_things : Int32?

        # The number of removed things in an over-the-air (OTA) task.

        @[JSON::Field(key: "numberOfRemovedThings")]
        getter number_of_removed_things : Int32?

        # The number of succeeded things in an over-the-air (OTA) task.

        @[JSON::Field(key: "numberOfSucceededThings")]
        getter number_of_succeeded_things : Int32?

        # The number of timed out things in an over-the-air (OTA) task.

        @[JSON::Field(key: "numberOfTimedOutThings")]
        getter number_of_timed_out_things : Int32?

        # The targets of the over-the-air (OTA) task.

        @[JSON::Field(key: "processingTargets")]
        getter processing_targets : Array(String)?

        def initialize(
          @number_of_canceled_things : Int32? = nil,
          @number_of_failed_things : Int32? = nil,
          @number_of_in_progress_things : Int32? = nil,
          @number_of_queued_things : Int32? = nil,
          @number_of_rejected_things : Int32? = nil,
          @number_of_removed_things : Int32? = nil,
          @number_of_succeeded_things : Int32? = nil,
          @number_of_timed_out_things : Int32? = nil,
          @processing_targets : Array(String)? = nil
        )
        end
      end

      # The rate exceeds the limit.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You are not authorized to perform this operation.

      struct UnauthorizedException
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

        # The ARN of the resource to which to add tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys to remove from the resource.

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


      struct UpdateAccountAssociationRequest
        include JSON::Serializable

        # The unique identifier of the account association to update.

        @[JSON::Field(key: "AccountAssociationId")]
        getter account_association_id : String

        # The new description to assign to the account association.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new name to assign to the account association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @account_association_id : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateCloudConnectorRequest
        include JSON::Serializable

        # The unique identifier of the cloud connector to update.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The new description to assign to the cloud connector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new display name to assign to the cloud connector.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateConnectorDestinationRequest
        include JSON::Serializable

        # The unique identifier of the connector destination to update.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The updated authentication configuration details for the connector destination.

        @[JSON::Field(key: "AuthConfig")]
        getter auth_config : Types::AuthConfigUpdate?

        # The new authentication type to use for the connector destination.

        @[JSON::Field(key: "AuthType")]
        getter auth_type : String?

        # The new description to assign to the connector destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new display name to assign to the connector destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The updated AWS Secrets Manager configuration for the connector destination.

        @[JSON::Field(key: "SecretsManager")]
        getter secrets_manager : Types::SecretsManager?

        def initialize(
          @identifier : String,
          @auth_config : Types::AuthConfigUpdate? = nil,
          @auth_type : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @secrets_manager : Types::SecretsManager? = nil
        )
        end
      end


      struct UpdateDestinationRequest
        include JSON::Serializable

        # The name of the customer-managed destination.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationArn")]
        getter delivery_destination_arn : String?

        # The destination type for the customer-managed destination.

        @[JSON::Field(key: "DeliveryDestinationType")]
        getter delivery_destination_type : String?

        # The description of the customer-managed destination.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the delivery destination role.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @name : String,
          @delivery_destination_arn : String? = nil,
          @delivery_destination_type : String? = nil,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateEventLogConfigurationRequest
        include JSON::Serializable

        # The log level for the event in terms of severity.

        @[JSON::Field(key: "EventLogLevel")]
        getter event_log_level : String

        # The log configuration id.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @event_log_level : String,
          @id : String
        )
        end
      end


      struct UpdateManagedThingRequest
        include JSON::Serializable

        # The id of the managed thing.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The brand of the device.

        @[JSON::Field(key: "Brand")]
        getter brand : String?

        # The capabilities of the device such as light bulb.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : String?

        # A report of the capabilities for the managed thing.

        @[JSON::Field(key: "CapabilityReport")]
        getter capability_report : Types::CapabilityReport?

        # The updated capability schemas that define the functionality and features supported by the managed
        # thing.

        @[JSON::Field(key: "CapabilitySchemas")]
        getter capability_schemas : Array(Types::CapabilitySchemaItem)?

        # The classification of the managed thing such as light bulb or thermostat.

        @[JSON::Field(key: "Classification")]
        getter classification : String?

        # The identifier of the credential for the managed thing.

        @[JSON::Field(key: "CredentialLockerId")]
        getter credential_locker_id : String?

        # The network mode for the hub-connected device.

        @[JSON::Field(key: "HubNetworkMode")]
        getter hub_network_mode : String?

        # The metadata for the managed thing.

        @[JSON::Field(key: "MetaData")]
        getter meta_data : Hash(String, String)?

        # The model of the device.

        @[JSON::Field(key: "Model")]
        getter model : String?

        # The name of the managed thing representing the physical device.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Owner of the device, usually an indication of whom the device belongs to. This value should not
        # contain personal identifiable information.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The serial number of the device.

        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # The Wi-Fi Simple Setup configuration for the managed thing, which defines provisioning capabilities
        # and timeout settings.

        @[JSON::Field(key: "WiFiSimpleSetupConfiguration")]
        getter wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration?

        def initialize(
          @identifier : String,
          @brand : String? = nil,
          @capabilities : String? = nil,
          @capability_report : Types::CapabilityReport? = nil,
          @capability_schemas : Array(Types::CapabilitySchemaItem)? = nil,
          @classification : String? = nil,
          @credential_locker_id : String? = nil,
          @hub_network_mode : String? = nil,
          @meta_data : Hash(String, String)? = nil,
          @model : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @serial_number : String? = nil,
          @wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration? = nil
        )
        end
      end


      struct UpdateNotificationConfigurationRequest
        include JSON::Serializable

        # The name of the destination for the notification configuration.

        @[JSON::Field(key: "DestinationName")]
        getter destination_name : String

        # The type of event triggering a device notification to the customer-managed destination.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        def initialize(
          @destination_name : String,
          @event_type : String
        )
        end
      end


      struct UpdateOtaTaskRequest
        include JSON::Serializable

        # The over-the-air (OTA) task id.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The description of the over-the-air (OTA) task.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier for the over-the-air (OTA) task configuration.

        @[JSON::Field(key: "TaskConfigurationId")]
        getter task_configuration_id : String?

        def initialize(
          @identifier : String,
          @description : String? = nil,
          @task_configuration_id : String? = nil
        )
        end
      end

      # A validation error occurred when performing the API request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ValidationSchema
        include JSON::Serializable

        def initialize
        end
      end

      # The Wi-Fi Simple Setup configuration for the managed thing, which defines provisioning capabilities
      # and timeout settings.

      struct WiFiSimpleSetupConfiguration
        include JSON::Serializable

        # Indicates whether the device can act as a provisionee in Wi-Fi Simple Setup, allowing it to be
        # configured by other devices.

        @[JSON::Field(key: "EnableAsProvisionee")]
        getter enable_as_provisionee : Bool?

        # Indicates whether the device can act as a provisioner in Wi-Fi Simple Setup, allowing it to
        # configure other devices.

        @[JSON::Field(key: "EnableAsProvisioner")]
        getter enable_as_provisioner : Bool?

        # The timeout duration in minutes for Wi-Fi Simple Setup. Valid range is 5 to 15 minutes.

        @[JSON::Field(key: "TimeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        def initialize(
          @enable_as_provisionee : Bool? = nil,
          @enable_as_provisioner : Bool? = nil,
          @timeout_in_minutes : Int32? = nil
        )
        end
      end
    end
  end
end
