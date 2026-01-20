require "json"
require "time"

module AwsSdk
  module Appflow
    module Types

      # AppFlow/Requester has invalid or missing permissions.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The aggregation settings that you can use to customize the output format of your flow data.

      struct AggregationConfig
        include JSON::Serializable

        # Specifies whether Amazon AppFlow aggregates the flow records into a single file, or leave them
        # unaggregated.

        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : String?

        # The desired file size, in MB, for each output file that Amazon AppFlow writes to the flow
        # destination. For each file, Amazon AppFlow attempts to achieve the size that you specify. The actual
        # file sizes might differ from this target based on the number and size of the records that each file
        # contains.

        @[JSON::Field(key: "targetFileSize")]
        getter target_file_size : Int64?

        def initialize(
          @aggregation_type : String? = nil,
          @target_file_size : Int64? = nil
        )
        end
      end

      # The connector-specific credentials required when using Amplitude.

      struct AmplitudeConnectorProfileCredentials
        include JSON::Serializable

        # A unique alphanumeric identifier used to authenticate a user, developer, or calling program to your
        # API.

        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        # The Secret Access Key portion of the credentials.

        @[JSON::Field(key: "secretKey")]
        getter secret_key : String

        def initialize(
          @api_key : String,
          @secret_key : String
        )
        end
      end

      # The connector-specific profile properties required when using Amplitude.

      struct AmplitudeConnectorProfileProperties
        include JSON::Serializable

        def initialize
        end
      end

      # The connector metadata specific to Amplitude.

      struct AmplitudeMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Amplitude is being used as a source.

      struct AmplitudeSourceProperties
        include JSON::Serializable

        # The object specified in the Amplitude flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The API key credentials required for API key authentication.

      struct ApiKeyCredentials
        include JSON::Serializable

        # The API key required for API key authentication.

        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        # The API secret key required for API key authentication.

        @[JSON::Field(key: "apiSecretKey")]
        getter api_secret_key : String?

        def initialize(
          @api_key : String,
          @api_secret_key : String? = nil
        )
        end
      end

      # Information about required authentication parameters.

      struct AuthParameter
        include JSON::Serializable

        # Contains default values for this authentication parameter that are supplied by the connector.

        @[JSON::Field(key: "connectorSuppliedValues")]
        getter connector_supplied_values : Array(String)?

        # A description about the authentication parameter.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether this authentication parameter is required.

        @[JSON::Field(key: "isRequired")]
        getter is_required : Bool?

        # Indicates whether this authentication parameter is a sensitive field.

        @[JSON::Field(key: "isSensitiveField")]
        getter is_sensitive_field : Bool?

        # The authentication key required to authenticate with the connector.

        @[JSON::Field(key: "key")]
        getter key : String?

        # Label used for authentication parameter.

        @[JSON::Field(key: "label")]
        getter label : String?

        def initialize(
          @connector_supplied_values : Array(String)? = nil,
          @description : String? = nil,
          @is_required : Bool? = nil,
          @is_sensitive_field : Bool? = nil,
          @key : String? = nil,
          @label : String? = nil
        )
        end
      end

      # Contains information about the authentication config that the connector supports.

      struct AuthenticationConfig
        include JSON::Serializable

        # Contains information required for custom authentication.

        @[JSON::Field(key: "customAuthConfigs")]
        getter custom_auth_configs : Array(Types::CustomAuthConfig)?

        # Indicates whether API key authentication is supported by the connector

        @[JSON::Field(key: "isApiKeyAuthSupported")]
        getter is_api_key_auth_supported : Bool?

        # Indicates whether basic authentication is supported by the connector.

        @[JSON::Field(key: "isBasicAuthSupported")]
        getter is_basic_auth_supported : Bool?

        # Indicates whether custom authentication is supported by the connector

        @[JSON::Field(key: "isCustomAuthSupported")]
        getter is_custom_auth_supported : Bool?

        # Indicates whether OAuth 2.0 authentication is supported by the connector.

        @[JSON::Field(key: "isOAuth2Supported")]
        getter is_o_auth2_supported : Bool?

        # Contains the default values required for OAuth 2.0 authentication.

        @[JSON::Field(key: "oAuth2Defaults")]
        getter o_auth2_defaults : Types::OAuth2Defaults?

        def initialize(
          @custom_auth_configs : Array(Types::CustomAuthConfig)? = nil,
          @is_api_key_auth_supported : Bool? = nil,
          @is_basic_auth_supported : Bool? = nil,
          @is_custom_auth_supported : Bool? = nil,
          @is_o_auth2_supported : Bool? = nil,
          @o_auth2_defaults : Types::OAuth2Defaults? = nil
        )
        end
      end

      # The basic auth credentials required for basic authentication.

      struct BasicAuthCredentials
        include JSON::Serializable

        # The password to use to connect to a resource.

        @[JSON::Field(key: "password")]
        getter password : String

        # The username to use to connect to a resource.

        @[JSON::Field(key: "username")]
        getter username : String

        def initialize(
          @password : String,
          @username : String
        )
        end
      end


      struct CancelFlowExecutionsRequest
        include JSON::Serializable

        # The name of a flow with active runs that you want to cancel.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # The ID of each active run to cancel. These runs must belong to the flow you specify in your request.
        # If you omit this parameter, your request ends all active runs that belong to the flow.

        @[JSON::Field(key: "executionIds")]
        getter execution_ids : Array(String)?

        def initialize(
          @flow_name : String,
          @execution_ids : Array(String)? = nil
        )
        end
      end


      struct CancelFlowExecutionsResponse
        include JSON::Serializable

        # The IDs of runs that Amazon AppFlow couldn't cancel. These runs might be ineligible for canceling
        # because they haven't started yet or have already completed.

        @[JSON::Field(key: "invalidExecutions")]
        getter invalid_executions : Array(String)?

        def initialize(
          @invalid_executions : Array(String)? = nil
        )
        end
      end

      # There was a conflict when processing the request (for example, a flow with the given name already
      # exists within the account. Check for conflicting resource names and try again.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An error occurred when authenticating with the connector endpoint.

      struct ConnectorAuthenticationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration settings related to a given connector.

      struct ConnectorConfiguration
        include JSON::Serializable

        # The authentication config required for the connector.

        @[JSON::Field(key: "authenticationConfig")]
        getter authentication_config : Types::AuthenticationConfig?

        # Specifies whether the connector can be used as a destination.

        @[JSON::Field(key: "canUseAsDestination")]
        getter can_use_as_destination : Bool?

        # Specifies whether the connector can be used as a source.

        @[JSON::Field(key: "canUseAsSource")]
        getter can_use_as_source : Bool?

        # The Amazon Resource Name (ARN) for the registered connector.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # A description about the connector.

        @[JSON::Field(key: "connectorDescription")]
        getter connector_description : String?

        # The label used for registering the connector.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String?

        # Specifies connector-specific metadata such as oAuthScopes , supportedRegions , privateLinkServiceUrl
        # , and so on.

        @[JSON::Field(key: "connectorMetadata")]
        getter connector_metadata : Types::ConnectorMetadata?

        # The connection modes that the connector supports.

        @[JSON::Field(key: "connectorModes")]
        getter connector_modes : Array(String)?

        # The connector name.

        @[JSON::Field(key: "connectorName")]
        getter connector_name : String?

        # The owner who developed the connector.

        @[JSON::Field(key: "connectorOwner")]
        getter connector_owner : String?

        # The configuration required for registering the connector.

        @[JSON::Field(key: "connectorProvisioningConfig")]
        getter connector_provisioning_config : Types::ConnectorProvisioningConfig?

        # The provisioning type used to register the connector.

        @[JSON::Field(key: "connectorProvisioningType")]
        getter connector_provisioning_type : String?

        # The required connector runtime settings.

        @[JSON::Field(key: "connectorRuntimeSettings")]
        getter connector_runtime_settings : Array(Types::ConnectorRuntimeSetting)?

        # The connector type.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String?

        # The connector version.

        @[JSON::Field(key: "connectorVersion")]
        getter connector_version : String?

        # Specifies if PrivateLink is enabled for that connector.

        @[JSON::Field(key: "isPrivateLinkEnabled")]
        getter is_private_link_enabled : Bool?

        # Specifies if a PrivateLink endpoint URL is required.

        @[JSON::Field(key: "isPrivateLinkEndpointUrlRequired")]
        getter is_private_link_endpoint_url_required : Bool?

        # Logo URL of the connector.

        @[JSON::Field(key: "logoURL")]
        getter logo_url : String?

        # The date on which the connector was registered.

        @[JSON::Field(key: "registeredAt")]
        getter registered_at : Time?

        # Information about who registered the connector.

        @[JSON::Field(key: "registeredBy")]
        getter registered_by : String?

        # A list of API versions that are supported by the connector.

        @[JSON::Field(key: "supportedApiVersions")]
        getter supported_api_versions : Array(String)?

        # The APIs of the connector application that Amazon AppFlow can use to transfer your data.

        @[JSON::Field(key: "supportedDataTransferApis")]
        getter supported_data_transfer_apis : Array(Types::DataTransferApi)?

        # The data transfer types that the connector supports. RECORD Structured records. FILE Files or binary
        # data.

        @[JSON::Field(key: "supportedDataTransferTypes")]
        getter supported_data_transfer_types : Array(String)?

        # Lists the connectors that are available for use as destinations.

        @[JSON::Field(key: "supportedDestinationConnectors")]
        getter supported_destination_connectors : Array(String)?

        # A list of operators supported by the connector.

        @[JSON::Field(key: "supportedOperators")]
        getter supported_operators : Array(String)?

        # Specifies the supported flow frequency for that connector.

        @[JSON::Field(key: "supportedSchedulingFrequencies")]
        getter supported_scheduling_frequencies : Array(String)?

        # Specifies the supported trigger types for the flow.

        @[JSON::Field(key: "supportedTriggerTypes")]
        getter supported_trigger_types : Array(String)?

        # A list of write operations supported by the connector.

        @[JSON::Field(key: "supportedWriteOperations")]
        getter supported_write_operations : Array(String)?

        def initialize(
          @authentication_config : Types::AuthenticationConfig? = nil,
          @can_use_as_destination : Bool? = nil,
          @can_use_as_source : Bool? = nil,
          @connector_arn : String? = nil,
          @connector_description : String? = nil,
          @connector_label : String? = nil,
          @connector_metadata : Types::ConnectorMetadata? = nil,
          @connector_modes : Array(String)? = nil,
          @connector_name : String? = nil,
          @connector_owner : String? = nil,
          @connector_provisioning_config : Types::ConnectorProvisioningConfig? = nil,
          @connector_provisioning_type : String? = nil,
          @connector_runtime_settings : Array(Types::ConnectorRuntimeSetting)? = nil,
          @connector_type : String? = nil,
          @connector_version : String? = nil,
          @is_private_link_enabled : Bool? = nil,
          @is_private_link_endpoint_url_required : Bool? = nil,
          @logo_url : String? = nil,
          @registered_at : Time? = nil,
          @registered_by : String? = nil,
          @supported_api_versions : Array(String)? = nil,
          @supported_data_transfer_apis : Array(Types::DataTransferApi)? = nil,
          @supported_data_transfer_types : Array(String)? = nil,
          @supported_destination_connectors : Array(String)? = nil,
          @supported_operators : Array(String)? = nil,
          @supported_scheduling_frequencies : Array(String)? = nil,
          @supported_trigger_types : Array(String)? = nil,
          @supported_write_operations : Array(String)? = nil
        )
        end
      end

      # Information about the registered connector.

      struct ConnectorDetail
        include JSON::Serializable

        # The application type of the connector.

        @[JSON::Field(key: "applicationType")]
        getter application_type : String?

        # A description about the registered connector.

        @[JSON::Field(key: "connectorDescription")]
        getter connector_description : String?

        # A label used for the connector.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String?

        # The connection mode that the connector supports.

        @[JSON::Field(key: "connectorModes")]
        getter connector_modes : Array(String)?

        # The name of the connector.

        @[JSON::Field(key: "connectorName")]
        getter connector_name : String?

        # The owner of the connector.

        @[JSON::Field(key: "connectorOwner")]
        getter connector_owner : String?

        # The provisioning type that the connector uses.

        @[JSON::Field(key: "connectorProvisioningType")]
        getter connector_provisioning_type : String?

        # The connector type.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String?

        # The connector version.

        @[JSON::Field(key: "connectorVersion")]
        getter connector_version : String?

        # The time at which the connector was registered.

        @[JSON::Field(key: "registeredAt")]
        getter registered_at : Time?

        # The user who registered the connector.

        @[JSON::Field(key: "registeredBy")]
        getter registered_by : String?

        # The data transfer types that the connector supports. RECORD Structured records. FILE Files or binary
        # data.

        @[JSON::Field(key: "supportedDataTransferTypes")]
        getter supported_data_transfer_types : Array(String)?

        def initialize(
          @application_type : String? = nil,
          @connector_description : String? = nil,
          @connector_label : String? = nil,
          @connector_modes : Array(String)? = nil,
          @connector_name : String? = nil,
          @connector_owner : String? = nil,
          @connector_provisioning_type : String? = nil,
          @connector_type : String? = nil,
          @connector_version : String? = nil,
          @registered_at : Time? = nil,
          @registered_by : String? = nil,
          @supported_data_transfer_types : Array(String)? = nil
        )
        end
      end

      # The high-level entity that can be queried in Amazon AppFlow. For example, a Salesforce entity might
      # be an Account or Opportunity , whereas a ServiceNow entity might be an Incident .

      struct ConnectorEntity
        include JSON::Serializable

        # The name of the connector entity.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether the connector entity is a parent or a category and has more entities nested
        # underneath it. If another call is made with entitiesPath =
        # "the_current_entity_name_with_hasNestedEntities_true" , then it returns the nested entities
        # underneath it. This provides a way to retrieve all supported entities in a recursive fashion.

        @[JSON::Field(key: "hasNestedEntities")]
        getter has_nested_entities : Bool?

        # The label applied to the connector entity.

        @[JSON::Field(key: "label")]
        getter label : String?

        def initialize(
          @name : String,
          @has_nested_entities : Bool? = nil,
          @label : String? = nil
        )
        end
      end

      # Describes the data model of a connector field. For example, for an account entity, the fields would
      # be account name , account ID , and so on.

      struct ConnectorEntityField
        include JSON::Serializable

        # The unique identifier of the connector field.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A map that has specific properties related to the ConnectorEntityField.

        @[JSON::Field(key: "customProperties")]
        getter custom_properties : Hash(String, String)?

        # Default value that can be assigned to this field.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # A description of the connector entity field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The properties applied to a field when the connector is being used as a destination.

        @[JSON::Field(key: "destinationProperties")]
        getter destination_properties : Types::DestinationFieldProperties?

        # Booelan value that indicates whether this field is deprecated or not.

        @[JSON::Field(key: "isDeprecated")]
        getter is_deprecated : Bool?

        # Booelan value that indicates whether this field can be used as a primary key.

        @[JSON::Field(key: "isPrimaryKey")]
        getter is_primary_key : Bool?

        # The label applied to a connector entity field.

        @[JSON::Field(key: "label")]
        getter label : String?

        # The parent identifier of the connector field.

        @[JSON::Field(key: "parentIdentifier")]
        getter parent_identifier : String?

        # The properties that can be applied to a field when the connector is being used as a source.

        @[JSON::Field(key: "sourceProperties")]
        getter source_properties : Types::SourceFieldProperties?

        # Contains details regarding the supported FieldType , including the corresponding filterOperators and
        # supportedValues .

        @[JSON::Field(key: "supportedFieldTypeDetails")]
        getter supported_field_type_details : Types::SupportedFieldTypeDetails?

        def initialize(
          @identifier : String,
          @custom_properties : Hash(String, String)? = nil,
          @default_value : String? = nil,
          @description : String? = nil,
          @destination_properties : Types::DestinationFieldProperties? = nil,
          @is_deprecated : Bool? = nil,
          @is_primary_key : Bool? = nil,
          @label : String? = nil,
          @parent_identifier : String? = nil,
          @source_properties : Types::SourceFieldProperties? = nil,
          @supported_field_type_details : Types::SupportedFieldTypeDetails? = nil
        )
        end
      end

      # A structure to specify connector-specific metadata such as oAuthScopes , supportedRegions ,
      # privateLinkServiceUrl , and so on.

      struct ConnectorMetadata
        include JSON::Serializable

        # The connector metadata specific to Amplitude.

        @[JSON::Field(key: "Amplitude")]
        getter amplitude : Types::AmplitudeMetadata?

        # The connector metadata specific to Amazon Connect Customer Profiles.

        @[JSON::Field(key: "CustomerProfiles")]
        getter customer_profiles : Types::CustomerProfilesMetadata?

        # The connector metadata specific to Datadog.

        @[JSON::Field(key: "Datadog")]
        getter datadog : Types::DatadogMetadata?

        # The connector metadata specific to Dynatrace.

        @[JSON::Field(key: "Dynatrace")]
        getter dynatrace : Types::DynatraceMetadata?

        # The connector metadata specific to Amazon EventBridge.

        @[JSON::Field(key: "EventBridge")]
        getter event_bridge : Types::EventBridgeMetadata?

        # The connector metadata specific to Google Analytics.

        @[JSON::Field(key: "GoogleAnalytics")]
        getter google_analytics : Types::GoogleAnalyticsMetadata?

        # The connector metadata specific to Amazon Honeycode.

        @[JSON::Field(key: "Honeycode")]
        getter honeycode : Types::HoneycodeMetadata?

        # The connector metadata specific to Infor Nexus.

        @[JSON::Field(key: "InforNexus")]
        getter infor_nexus : Types::InforNexusMetadata?

        # The connector metadata specific to Marketo.

        @[JSON::Field(key: "Marketo")]
        getter marketo : Types::MarketoMetadata?

        # The connector metadata specific to Salesforce Pardot.

        @[JSON::Field(key: "Pardot")]
        getter pardot : Types::PardotMetadata?

        # The connector metadata specific to Amazon Redshift.

        @[JSON::Field(key: "Redshift")]
        getter redshift : Types::RedshiftMetadata?

        # The connector metadata specific to Amazon S3.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3Metadata?


        @[JSON::Field(key: "SAPOData")]
        getter sapo_data : Types::SAPODataMetadata?

        # The connector metadata specific to Salesforce.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : Types::SalesforceMetadata?

        # The connector metadata specific to ServiceNow.

        @[JSON::Field(key: "ServiceNow")]
        getter service_now : Types::ServiceNowMetadata?

        # The connector metadata specific to Singular.

        @[JSON::Field(key: "Singular")]
        getter singular : Types::SingularMetadata?

        # The connector metadata specific to Slack.

        @[JSON::Field(key: "Slack")]
        getter slack : Types::SlackMetadata?

        # The connector metadata specific to Snowflake.

        @[JSON::Field(key: "Snowflake")]
        getter snowflake : Types::SnowflakeMetadata?

        # The connector metadata specific to Trend Micro.

        @[JSON::Field(key: "Trendmicro")]
        getter trendmicro : Types::TrendmicroMetadata?

        # The connector metadata specific to Upsolver.

        @[JSON::Field(key: "Upsolver")]
        getter upsolver : Types::UpsolverMetadata?

        # The connector metadata specific to Veeva.

        @[JSON::Field(key: "Veeva")]
        getter veeva : Types::VeevaMetadata?

        # The connector metadata specific to Zendesk.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : Types::ZendeskMetadata?

        def initialize(
          @amplitude : Types::AmplitudeMetadata? = nil,
          @customer_profiles : Types::CustomerProfilesMetadata? = nil,
          @datadog : Types::DatadogMetadata? = nil,
          @dynatrace : Types::DynatraceMetadata? = nil,
          @event_bridge : Types::EventBridgeMetadata? = nil,
          @google_analytics : Types::GoogleAnalyticsMetadata? = nil,
          @honeycode : Types::HoneycodeMetadata? = nil,
          @infor_nexus : Types::InforNexusMetadata? = nil,
          @marketo : Types::MarketoMetadata? = nil,
          @pardot : Types::PardotMetadata? = nil,
          @redshift : Types::RedshiftMetadata? = nil,
          @s3 : Types::S3Metadata? = nil,
          @sapo_data : Types::SAPODataMetadata? = nil,
          @salesforce : Types::SalesforceMetadata? = nil,
          @service_now : Types::ServiceNowMetadata? = nil,
          @singular : Types::SingularMetadata? = nil,
          @slack : Types::SlackMetadata? = nil,
          @snowflake : Types::SnowflakeMetadata? = nil,
          @trendmicro : Types::TrendmicroMetadata? = nil,
          @upsolver : Types::UpsolverMetadata? = nil,
          @veeva : Types::VeevaMetadata? = nil,
          @zendesk : Types::ZendeskMetadata? = nil
        )
        end
      end

      # Used by select connectors for which the OAuth workflow is supported, such as Salesforce, Google
      # Analytics, Marketo, Zendesk, and Slack.

      struct ConnectorOAuthRequest
        include JSON::Serializable

        # The code provided by the connector when it has been authenticated via the connected app.

        @[JSON::Field(key: "authCode")]
        getter auth_code : String?

        # The URL to which the authentication server redirects the browser after authorization has been
        # granted.

        @[JSON::Field(key: "redirectUri")]
        getter redirect_uri : String?

        def initialize(
          @auth_code : String? = nil,
          @redirect_uri : String? = nil
        )
        end
      end

      # The operation to be performed on the provided source fields.

      struct ConnectorOperator
        include JSON::Serializable

        # The operation to be performed on the provided Amplitude source fields.

        @[JSON::Field(key: "Amplitude")]
        getter amplitude : String?

        # Operators supported by the custom connector.

        @[JSON::Field(key: "CustomConnector")]
        getter custom_connector : String?

        # The operation to be performed on the provided Datadog source fields.

        @[JSON::Field(key: "Datadog")]
        getter datadog : String?

        # The operation to be performed on the provided Dynatrace source fields.

        @[JSON::Field(key: "Dynatrace")]
        getter dynatrace : String?

        # The operation to be performed on the provided Google Analytics source fields.

        @[JSON::Field(key: "GoogleAnalytics")]
        getter google_analytics : String?

        # The operation to be performed on the provided Infor Nexus source fields.

        @[JSON::Field(key: "InforNexus")]
        getter infor_nexus : String?

        # The operation to be performed on the provided Marketo source fields.

        @[JSON::Field(key: "Marketo")]
        getter marketo : String?

        # The operation to be performed on the provided Salesforce Pardot source fields.

        @[JSON::Field(key: "Pardot")]
        getter pardot : String?

        # The operation to be performed on the provided Amazon S3 source fields.

        @[JSON::Field(key: "S3")]
        getter s3 : String?

        # The operation to be performed on the provided SAPOData source fields.

        @[JSON::Field(key: "SAPOData")]
        getter sapo_data : String?

        # The operation to be performed on the provided Salesforce source fields.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : String?

        # The operation to be performed on the provided ServiceNow source fields.

        @[JSON::Field(key: "ServiceNow")]
        getter service_now : String?

        # The operation to be performed on the provided Singular source fields.

        @[JSON::Field(key: "Singular")]
        getter singular : String?

        # The operation to be performed on the provided Slack source fields.

        @[JSON::Field(key: "Slack")]
        getter slack : String?

        # The operation to be performed on the provided Trend Micro source fields.

        @[JSON::Field(key: "Trendmicro")]
        getter trendmicro : String?

        # The operation to be performed on the provided Veeva source fields.

        @[JSON::Field(key: "Veeva")]
        getter veeva : String?

        # The operation to be performed on the provided Zendesk source fields.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : String?

        def initialize(
          @amplitude : String? = nil,
          @custom_connector : String? = nil,
          @datadog : String? = nil,
          @dynatrace : String? = nil,
          @google_analytics : String? = nil,
          @infor_nexus : String? = nil,
          @marketo : String? = nil,
          @pardot : String? = nil,
          @s3 : String? = nil,
          @sapo_data : String? = nil,
          @salesforce : String? = nil,
          @service_now : String? = nil,
          @singular : String? = nil,
          @slack : String? = nil,
          @trendmicro : String? = nil,
          @veeva : String? = nil,
          @zendesk : String? = nil
        )
        end
      end

      # Describes an instance of a connector. This includes the provided name, credentials ARN,
      # connection-mode, and so on. To keep the API intuitive and extensible, the fields that are common to
      # all types of connector profiles are explicitly specified at the top level. The rest of the
      # connector-specific properties are available via the connectorProfileProperties field.

      struct ConnectorProfile
        include JSON::Serializable

        # Indicates the connection mode and if it is public or private.

        @[JSON::Field(key: "connectionMode")]
        getter connection_mode : String?

        # The label for the connector profile being created.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String?

        # The Amazon Resource Name (ARN) of the connector profile.

        @[JSON::Field(key: "connectorProfileArn")]
        getter connector_profile_arn : String?

        # The name of the connector profile. The name is unique for each ConnectorProfile in the Amazon Web
        # Services account.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String?

        # The connector-specific properties of the profile configuration.

        @[JSON::Field(key: "connectorProfileProperties")]
        getter connector_profile_properties : Types::ConnectorProfileProperties?

        # The type of connector, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String?

        # Specifies when the connector profile was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the connector profile credentials.

        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?

        # Specifies when the connector profile was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Specifies the private connection provisioning state.

        @[JSON::Field(key: "privateConnectionProvisioningState")]
        getter private_connection_provisioning_state : Types::PrivateConnectionProvisioningState?

        def initialize(
          @connection_mode : String? = nil,
          @connector_label : String? = nil,
          @connector_profile_arn : String? = nil,
          @connector_profile_name : String? = nil,
          @connector_profile_properties : Types::ConnectorProfileProperties? = nil,
          @connector_type : String? = nil,
          @created_at : Time? = nil,
          @credentials_arn : String? = nil,
          @last_updated_at : Time? = nil,
          @private_connection_provisioning_state : Types::PrivateConnectionProvisioningState? = nil
        )
        end
      end

      # Defines the connector-specific configuration and credentials for the connector profile.

      struct ConnectorProfileConfig
        include JSON::Serializable

        # The connector-specific properties of the profile configuration.

        @[JSON::Field(key: "connectorProfileProperties")]
        getter connector_profile_properties : Types::ConnectorProfileProperties

        # The connector-specific credentials required by each connector.

        @[JSON::Field(key: "connectorProfileCredentials")]
        getter connector_profile_credentials : Types::ConnectorProfileCredentials?

        def initialize(
          @connector_profile_properties : Types::ConnectorProfileProperties,
          @connector_profile_credentials : Types::ConnectorProfileCredentials? = nil
        )
        end
      end

      # The connector-specific credentials required by a connector.

      struct ConnectorProfileCredentials
        include JSON::Serializable

        # The connector-specific credentials required when using Amplitude.

        @[JSON::Field(key: "Amplitude")]
        getter amplitude : Types::AmplitudeConnectorProfileCredentials?


        @[JSON::Field(key: "CustomConnector")]
        getter custom_connector : Types::CustomConnectorProfileCredentials?

        # The connector-specific credentials required when using Datadog.

        @[JSON::Field(key: "Datadog")]
        getter datadog : Types::DatadogConnectorProfileCredentials?

        # The connector-specific credentials required when using Dynatrace.

        @[JSON::Field(key: "Dynatrace")]
        getter dynatrace : Types::DynatraceConnectorProfileCredentials?

        # The connector-specific credentials required when using Google Analytics.

        @[JSON::Field(key: "GoogleAnalytics")]
        getter google_analytics : Types::GoogleAnalyticsConnectorProfileCredentials?

        # The connector-specific credentials required when using Amazon Honeycode.

        @[JSON::Field(key: "Honeycode")]
        getter honeycode : Types::HoneycodeConnectorProfileCredentials?

        # The connector-specific credentials required when using Infor Nexus.

        @[JSON::Field(key: "InforNexus")]
        getter infor_nexus : Types::InforNexusConnectorProfileCredentials?

        # The connector-specific credentials required when using Marketo.

        @[JSON::Field(key: "Marketo")]
        getter marketo : Types::MarketoConnectorProfileCredentials?

        # The connector-specific credentials required when using Salesforce Pardot.

        @[JSON::Field(key: "Pardot")]
        getter pardot : Types::PardotConnectorProfileCredentials?

        # The connector-specific credentials required when using Amazon Redshift.

        @[JSON::Field(key: "Redshift")]
        getter redshift : Types::RedshiftConnectorProfileCredentials?


        @[JSON::Field(key: "SAPOData")]
        getter sapo_data : Types::SAPODataConnectorProfileCredentials?

        # The connector-specific credentials required when using Salesforce.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : Types::SalesforceConnectorProfileCredentials?

        # The connector-specific credentials required when using ServiceNow.

        @[JSON::Field(key: "ServiceNow")]
        getter service_now : Types::ServiceNowConnectorProfileCredentials?

        # The connector-specific credentials required when using Singular.

        @[JSON::Field(key: "Singular")]
        getter singular : Types::SingularConnectorProfileCredentials?

        # The connector-specific credentials required when using Slack.

        @[JSON::Field(key: "Slack")]
        getter slack : Types::SlackConnectorProfileCredentials?

        # The connector-specific credentials required when using Snowflake.

        @[JSON::Field(key: "Snowflake")]
        getter snowflake : Types::SnowflakeConnectorProfileCredentials?

        # The connector-specific credentials required when using Trend Micro.

        @[JSON::Field(key: "Trendmicro")]
        getter trendmicro : Types::TrendmicroConnectorProfileCredentials?

        # The connector-specific credentials required when using Veeva.

        @[JSON::Field(key: "Veeva")]
        getter veeva : Types::VeevaConnectorProfileCredentials?

        # The connector-specific credentials required when using Zendesk.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : Types::ZendeskConnectorProfileCredentials?

        def initialize(
          @amplitude : Types::AmplitudeConnectorProfileCredentials? = nil,
          @custom_connector : Types::CustomConnectorProfileCredentials? = nil,
          @datadog : Types::DatadogConnectorProfileCredentials? = nil,
          @dynatrace : Types::DynatraceConnectorProfileCredentials? = nil,
          @google_analytics : Types::GoogleAnalyticsConnectorProfileCredentials? = nil,
          @honeycode : Types::HoneycodeConnectorProfileCredentials? = nil,
          @infor_nexus : Types::InforNexusConnectorProfileCredentials? = nil,
          @marketo : Types::MarketoConnectorProfileCredentials? = nil,
          @pardot : Types::PardotConnectorProfileCredentials? = nil,
          @redshift : Types::RedshiftConnectorProfileCredentials? = nil,
          @sapo_data : Types::SAPODataConnectorProfileCredentials? = nil,
          @salesforce : Types::SalesforceConnectorProfileCredentials? = nil,
          @service_now : Types::ServiceNowConnectorProfileCredentials? = nil,
          @singular : Types::SingularConnectorProfileCredentials? = nil,
          @slack : Types::SlackConnectorProfileCredentials? = nil,
          @snowflake : Types::SnowflakeConnectorProfileCredentials? = nil,
          @trendmicro : Types::TrendmicroConnectorProfileCredentials? = nil,
          @veeva : Types::VeevaConnectorProfileCredentials? = nil,
          @zendesk : Types::ZendeskConnectorProfileCredentials? = nil
        )
        end
      end

      # The connector-specific profile properties required by each connector.

      struct ConnectorProfileProperties
        include JSON::Serializable

        # The connector-specific properties required by Amplitude.

        @[JSON::Field(key: "Amplitude")]
        getter amplitude : Types::AmplitudeConnectorProfileProperties?

        # The properties required by the custom connector.

        @[JSON::Field(key: "CustomConnector")]
        getter custom_connector : Types::CustomConnectorProfileProperties?

        # The connector-specific properties required by Datadog.

        @[JSON::Field(key: "Datadog")]
        getter datadog : Types::DatadogConnectorProfileProperties?

        # The connector-specific properties required by Dynatrace.

        @[JSON::Field(key: "Dynatrace")]
        getter dynatrace : Types::DynatraceConnectorProfileProperties?

        # The connector-specific properties required Google Analytics.

        @[JSON::Field(key: "GoogleAnalytics")]
        getter google_analytics : Types::GoogleAnalyticsConnectorProfileProperties?

        # The connector-specific properties required by Amazon Honeycode.

        @[JSON::Field(key: "Honeycode")]
        getter honeycode : Types::HoneycodeConnectorProfileProperties?

        # The connector-specific properties required by Infor Nexus.

        @[JSON::Field(key: "InforNexus")]
        getter infor_nexus : Types::InforNexusConnectorProfileProperties?

        # The connector-specific properties required by Marketo.

        @[JSON::Field(key: "Marketo")]
        getter marketo : Types::MarketoConnectorProfileProperties?

        # The connector-specific properties required by Salesforce Pardot.

        @[JSON::Field(key: "Pardot")]
        getter pardot : Types::PardotConnectorProfileProperties?

        # The connector-specific properties required by Amazon Redshift.

        @[JSON::Field(key: "Redshift")]
        getter redshift : Types::RedshiftConnectorProfileProperties?


        @[JSON::Field(key: "SAPOData")]
        getter sapo_data : Types::SAPODataConnectorProfileProperties?

        # The connector-specific properties required by Salesforce.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : Types::SalesforceConnectorProfileProperties?

        # The connector-specific properties required by serviceNow.

        @[JSON::Field(key: "ServiceNow")]
        getter service_now : Types::ServiceNowConnectorProfileProperties?

        # The connector-specific properties required by Singular.

        @[JSON::Field(key: "Singular")]
        getter singular : Types::SingularConnectorProfileProperties?

        # The connector-specific properties required by Slack.

        @[JSON::Field(key: "Slack")]
        getter slack : Types::SlackConnectorProfileProperties?

        # The connector-specific properties required by Snowflake.

        @[JSON::Field(key: "Snowflake")]
        getter snowflake : Types::SnowflakeConnectorProfileProperties?

        # The connector-specific properties required by Trend Micro.

        @[JSON::Field(key: "Trendmicro")]
        getter trendmicro : Types::TrendmicroConnectorProfileProperties?

        # The connector-specific properties required by Veeva.

        @[JSON::Field(key: "Veeva")]
        getter veeva : Types::VeevaConnectorProfileProperties?

        # The connector-specific properties required by Zendesk.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : Types::ZendeskConnectorProfileProperties?

        def initialize(
          @amplitude : Types::AmplitudeConnectorProfileProperties? = nil,
          @custom_connector : Types::CustomConnectorProfileProperties? = nil,
          @datadog : Types::DatadogConnectorProfileProperties? = nil,
          @dynatrace : Types::DynatraceConnectorProfileProperties? = nil,
          @google_analytics : Types::GoogleAnalyticsConnectorProfileProperties? = nil,
          @honeycode : Types::HoneycodeConnectorProfileProperties? = nil,
          @infor_nexus : Types::InforNexusConnectorProfileProperties? = nil,
          @marketo : Types::MarketoConnectorProfileProperties? = nil,
          @pardot : Types::PardotConnectorProfileProperties? = nil,
          @redshift : Types::RedshiftConnectorProfileProperties? = nil,
          @sapo_data : Types::SAPODataConnectorProfileProperties? = nil,
          @salesforce : Types::SalesforceConnectorProfileProperties? = nil,
          @service_now : Types::ServiceNowConnectorProfileProperties? = nil,
          @singular : Types::SingularConnectorProfileProperties? = nil,
          @slack : Types::SlackConnectorProfileProperties? = nil,
          @snowflake : Types::SnowflakeConnectorProfileProperties? = nil,
          @trendmicro : Types::TrendmicroConnectorProfileProperties? = nil,
          @veeva : Types::VeevaConnectorProfileProperties? = nil,
          @zendesk : Types::ZendeskConnectorProfileProperties? = nil
        )
        end
      end

      # Contains information about the configuration of the connector being registered.

      struct ConnectorProvisioningConfig
        include JSON::Serializable

        # Contains information about the configuration of the lambda which is being registered as the
        # connector.

        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaConnectorProvisioningConfig?

        def initialize(
          @lambda : Types::LambdaConnectorProvisioningConfig? = nil
        )
        end
      end

      # Contains information about the connector runtime settings that are required for flow execution.

      struct ConnectorRuntimeSetting
        include JSON::Serializable

        # Contains default values for the connector runtime setting that are supplied by the connector.

        @[JSON::Field(key: "connectorSuppliedValueOptions")]
        getter connector_supplied_value_options : Array(String)?

        # Data type of the connector runtime setting.

        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        # A description about the connector runtime setting.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether this connector runtime setting is required.

        @[JSON::Field(key: "isRequired")]
        getter is_required : Bool?

        # Contains value information about the connector runtime setting.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A label used for connector runtime setting.

        @[JSON::Field(key: "label")]
        getter label : String?

        # Indicates the scope of the connector runtime setting.

        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @connector_supplied_value_options : Array(String)? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @is_required : Bool? = nil,
          @key : String? = nil,
          @label : String? = nil,
          @scope : String? = nil
        )
        end
      end

      # An error occurred when retrieving data from the connector endpoint.

      struct ConnectorServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateConnectorProfileRequest
        include JSON::Serializable

        # Indicates the connection mode and specifies whether it is public or private. Private flows use
        # Amazon Web Services PrivateLink to route data over Amazon Web Services infrastructure without
        # exposing it to the public internet.

        @[JSON::Field(key: "connectionMode")]
        getter connection_mode : String

        # Defines the connector-specific configuration and credentials.

        @[JSON::Field(key: "connectorProfileConfig")]
        getter connector_profile_config : Types::ConnectorProfileConfig

        # The name of the connector profile. The name is unique for each ConnectorProfile in your Amazon Web
        # Services account.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String

        # The type of connector, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String

        # The clientToken parameter is an idempotency token. It ensures that your CreateConnectorProfile
        # request completes only once. You choose the value to pass. For example, if you don't receive a
        # response from your request, you can safely retry the request with the same clientToken parameter
        # value. If you omit a clientToken value, the Amazon Web Services SDK that you are using inserts a
        # value for you. This way, the SDK can safely retry requests multiple times after a network error. You
        # must provide your own value for other use cases. If you specify input parameters that differ from
        # your first request, an error occurs. If you use a different value for clientToken , Amazon AppFlow
        # considers it a new call to CreateConnectorProfile . The token is active for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The label of the connector. The label is unique for each ConnectorRegistration in your Amazon Web
        # Services account. Only needed if calling for CUSTOMCONNECTOR connector type/.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String?

        # The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you provide for encryption.
        # This is required if you do not want to use the Amazon AppFlow-managed KMS key. If you don't provide
        # anything here, Amazon AppFlow uses the Amazon AppFlow-managed KMS key.

        @[JSON::Field(key: "kmsArn")]
        getter kms_arn : String?

        def initialize(
          @connection_mode : String,
          @connector_profile_config : Types::ConnectorProfileConfig,
          @connector_profile_name : String,
          @connector_type : String,
          @client_token : String? = nil,
          @connector_label : String? = nil,
          @kms_arn : String? = nil
        )
        end
      end


      struct CreateConnectorProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector profile.

        @[JSON::Field(key: "connectorProfileArn")]
        getter connector_profile_arn : String?

        def initialize(
          @connector_profile_arn : String? = nil
        )
        end
      end


      struct CreateFlowRequest
        include JSON::Serializable

        # The configuration that controls how Amazon AppFlow places data in the destination connector.

        @[JSON::Field(key: "destinationFlowConfigList")]
        getter destination_flow_config_list : Array(Types::DestinationFlowConfig)

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # The configuration that controls how Amazon AppFlow retrieves data from the source connector.

        @[JSON::Field(key: "sourceFlowConfig")]
        getter source_flow_config : Types::SourceFlowConfig

        # A list of tasks that Amazon AppFlow performs while transferring the data in the flow run.

        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::Task)

        # The trigger settings that determine how and when the flow runs.

        @[JSON::Field(key: "triggerConfig")]
        getter trigger_config : Types::TriggerConfig

        # The clientToken parameter is an idempotency token. It ensures that your CreateFlow request completes
        # only once. You choose the value to pass. For example, if you don't receive a response from your
        # request, you can safely retry the request with the same clientToken parameter value. If you omit a
        # clientToken value, the Amazon Web Services SDK that you are using inserts a value for you. This way,
        # the SDK can safely retry requests multiple times after a network error. You must provide your own
        # value for other use cases. If you specify input parameters that differ from your first request, an
        # error occurs. If you use a different value for clientToken , Amazon AppFlow considers it a new call
        # to CreateFlow . The token is active for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the flow you want to create.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you provide for encryption.
        # This is required if you do not want to use the Amazon AppFlow-managed KMS key. If you don't provide
        # anything here, Amazon AppFlow uses the Amazon AppFlow-managed KMS key.

        @[JSON::Field(key: "kmsArn")]
        getter kms_arn : String?

        # Specifies the configuration that Amazon AppFlow uses when it catalogs the data that's transferred by
        # the associated flow. When Amazon AppFlow catalogs the data from a flow, it stores metadata in a data
        # catalog.

        @[JSON::Field(key: "metadataCatalogConfig")]
        getter metadata_catalog_config : Types::MetadataCatalogConfig?

        # The tags used to organize, track, or control access for your flow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination_flow_config_list : Array(Types::DestinationFlowConfig),
          @flow_name : String,
          @source_flow_config : Types::SourceFlowConfig,
          @tasks : Array(Types::Task),
          @trigger_config : Types::TriggerConfig,
          @client_token : String? = nil,
          @description : String? = nil,
          @kms_arn : String? = nil,
          @metadata_catalog_config : Types::MetadataCatalogConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFlowResponse
        include JSON::Serializable

        # The flow's Amazon Resource Name (ARN).

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # Indicates the current status of the flow.

        @[JSON::Field(key: "flowStatus")]
        getter flow_status : String?

        def initialize(
          @flow_arn : String? = nil,
          @flow_status : String? = nil
        )
        end
      end

      # Configuration information required for custom authentication.

      struct CustomAuthConfig
        include JSON::Serializable

        # Information about authentication parameters required for authentication.

        @[JSON::Field(key: "authParameters")]
        getter auth_parameters : Array(Types::AuthParameter)?

        # The authentication type that the custom connector uses.

        @[JSON::Field(key: "customAuthenticationType")]
        getter custom_authentication_type : String?

        def initialize(
          @auth_parameters : Array(Types::AuthParameter)? = nil,
          @custom_authentication_type : String? = nil
        )
        end
      end

      # The custom credentials required for custom authentication.

      struct CustomAuthCredentials
        include JSON::Serializable

        # The custom authentication type that the connector uses.

        @[JSON::Field(key: "customAuthenticationType")]
        getter custom_authentication_type : String

        # A map that holds custom authentication credentials.

        @[JSON::Field(key: "credentialsMap")]
        getter credentials_map : Hash(String, String)?

        def initialize(
          @custom_authentication_type : String,
          @credentials_map : Hash(String, String)? = nil
        )
        end
      end

      # The properties that are applied when the custom connector is being used as a destination.

      struct CustomConnectorDestinationProperties
        include JSON::Serializable

        # The entity specified in the custom connector as a destination in the flow.

        @[JSON::Field(key: "entityName")]
        getter entity_name : String

        # The custom properties that are specific to the connector when it's used as a destination in the
        # flow.

        @[JSON::Field(key: "customProperties")]
        getter custom_properties : Hash(String, String)?

        # The settings that determine how Amazon AppFlow handles an error when placing data in the custom
        # connector as destination.

        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?

        # The name of the field that Amazon AppFlow uses as an ID when performing a write operation such as
        # update, delete, or upsert.

        @[JSON::Field(key: "idFieldNames")]
        getter id_field_names : Array(String)?

        # Specifies the type of write operation to be performed in the custom connector when it's used as
        # destination.

        @[JSON::Field(key: "writeOperationType")]
        getter write_operation_type : String?

        def initialize(
          @entity_name : String,
          @custom_properties : Hash(String, String)? = nil,
          @error_handling_config : Types::ErrorHandlingConfig? = nil,
          @id_field_names : Array(String)? = nil,
          @write_operation_type : String? = nil
        )
        end
      end

      # The connector-specific profile credentials that are required when using the custom connector.

      struct CustomConnectorProfileCredentials
        include JSON::Serializable

        # The authentication type that the custom connector uses for authenticating while creating a connector
        # profile.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String

        # The API keys required for the authentication of the user.

        @[JSON::Field(key: "apiKey")]
        getter api_key : Types::ApiKeyCredentials?

        # The basic credentials that are required for the authentication of the user.

        @[JSON::Field(key: "basic")]
        getter basic : Types::BasicAuthCredentials?

        # If the connector uses the custom authentication mechanism, this holds the required credentials.

        @[JSON::Field(key: "custom")]
        getter custom : Types::CustomAuthCredentials?

        # The OAuth 2.0 credentials required for the authentication of the user.

        @[JSON::Field(key: "oauth2")]
        getter oauth2 : Types::OAuth2Credentials?

        def initialize(
          @authentication_type : String,
          @api_key : Types::ApiKeyCredentials? = nil,
          @basic : Types::BasicAuthCredentials? = nil,
          @custom : Types::CustomAuthCredentials? = nil,
          @oauth2 : Types::OAuth2Credentials? = nil
        )
        end
      end

      # The profile properties required by the custom connector.

      struct CustomConnectorProfileProperties
        include JSON::Serializable


        @[JSON::Field(key: "oAuth2Properties")]
        getter o_auth2_properties : Types::OAuth2Properties?

        # A map of properties that are required to create a profile for the custom connector.

        @[JSON::Field(key: "profileProperties")]
        getter profile_properties : Hash(String, String)?

        def initialize(
          @o_auth2_properties : Types::OAuth2Properties? = nil,
          @profile_properties : Hash(String, String)? = nil
        )
        end
      end

      # The properties that are applied when the custom connector is being used as a source.

      struct CustomConnectorSourceProperties
        include JSON::Serializable

        # The entity specified in the custom connector as a source in the flow.

        @[JSON::Field(key: "entityName")]
        getter entity_name : String

        # Custom properties that are required to use the custom connector as a source.

        @[JSON::Field(key: "customProperties")]
        getter custom_properties : Hash(String, String)?

        # The API of the connector application that Amazon AppFlow uses to transfer your data.

        @[JSON::Field(key: "dataTransferApi")]
        getter data_transfer_api : Types::DataTransferApi?

        def initialize(
          @entity_name : String,
          @custom_properties : Hash(String, String)? = nil,
          @data_transfer_api : Types::DataTransferApi? = nil
        )
        end
      end

      # The properties that are applied when Amazon Connect Customer Profiles is used as a destination.

      struct CustomerProfilesDestinationProperties
        include JSON::Serializable

        # The unique name of the Amazon Connect Customer Profiles domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The object specified in the Amazon Connect Customer Profiles flow destination.

        @[JSON::Field(key: "objectTypeName")]
        getter object_type_name : String?

        def initialize(
          @domain_name : String,
          @object_type_name : String? = nil
        )
        end
      end

      # The connector metadata specific to Amazon Connect Customer Profiles.

      struct CustomerProfilesMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The API of the connector application that Amazon AppFlow uses to transfer your data.

      struct DataTransferApi
        include JSON::Serializable

        # The name of the connector application API.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # You can specify one of the following types: AUTOMATIC The default. Optimizes a flow for datasets
        # that fluctuate in size from small to large. For each flow run, Amazon AppFlow chooses to use the
        # SYNC or ASYNC API type based on the amount of data that the run transfers. SYNC A synchronous API.
        # This type of API optimizes a flow for small to medium-sized datasets. ASYNC An asynchronous API.
        # This type of API optimizes a flow for large datasets.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The connector-specific credentials required by Datadog.

      struct DatadogConnectorProfileCredentials
        include JSON::Serializable

        # A unique alphanumeric identifier used to authenticate a user, developer, or calling program to your
        # API.

        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        # Application keys, in conjunction with your API key, give you full access to Datadog’s programmatic
        # API. Application keys are associated with the user account that created them. The application key is
        # used to log all requests made to the API.

        @[JSON::Field(key: "applicationKey")]
        getter application_key : String

        def initialize(
          @api_key : String,
          @application_key : String
        )
        end
      end

      # The connector-specific profile properties required by Datadog.

      struct DatadogConnectorProfileProperties
        include JSON::Serializable

        # The location of the Datadog resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The connector metadata specific to Datadog.

      struct DatadogMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Datadog is being used as a source.

      struct DatadogSourceProperties
        include JSON::Serializable

        # The object specified in the Datadog flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end


      struct DeleteConnectorProfileRequest
        include JSON::Serializable

        # The name of the connector profile. The name is unique for each ConnectorProfile in your account.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String

        # Indicates whether Amazon AppFlow should delete the profile, even if it is currently in use in one or
        # more flows.

        @[JSON::Field(key: "forceDelete")]
        getter force_delete : Bool?

        def initialize(
          @connector_profile_name : String,
          @force_delete : Bool? = nil
        )
        end
      end


      struct DeleteConnectorProfileResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFlowRequest
        include JSON::Serializable

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # Indicates whether Amazon AppFlow should delete the flow, even if it is currently in use.

        @[JSON::Field(key: "forceDelete")]
        getter force_delete : Bool?

        def initialize(
          @flow_name : String,
          @force_delete : Bool? = nil
        )
        end
      end


      struct DeleteFlowResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeConnectorEntityRequest
        include JSON::Serializable

        # The entity name for that connector.

        @[JSON::Field(key: "connectorEntityName")]
        getter connector_entity_name : String

        # The version of the API that's used by the connector.

        @[JSON::Field(key: "apiVersion")]
        getter api_version : String?

        # The name of the connector profile. The name is unique for each ConnectorProfile in the Amazon Web
        # Services account.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String?

        # The type of connector application, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String?

        def initialize(
          @connector_entity_name : String,
          @api_version : String? = nil,
          @connector_profile_name : String? = nil,
          @connector_type : String? = nil
        )
        end
      end


      struct DescribeConnectorEntityResponse
        include JSON::Serializable

        # Describes the fields for that connector entity. For example, for an account entity, the fields would
        # be account name , account ID , and so on.

        @[JSON::Field(key: "connectorEntityFields")]
        getter connector_entity_fields : Array(Types::ConnectorEntityField)

        def initialize(
          @connector_entity_fields : Array(Types::ConnectorEntityField)
        )
        end
      end


      struct DescribeConnectorProfilesRequest
        include JSON::Serializable

        # The name of the connector. The name is unique for each ConnectorRegistration in your Amazon Web
        # Services account. Only needed if calling for CUSTOMCONNECTOR connector type/.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String?

        # The name of the connector profile. The name is unique for each ConnectorProfile in the Amazon Web
        # Services account.

        @[JSON::Field(key: "connectorProfileNames")]
        getter connector_profile_names : Array(String)?

        # The type of connector, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String?

        # Specifies the maximum number of items that should be returned in the result set. The default for
        # maxResults is 20 (for all paginated API operations).

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_label : String? = nil,
          @connector_profile_names : Array(String)? = nil,
          @connector_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConnectorProfilesResponse
        include JSON::Serializable

        # Returns information about the connector profiles associated with the flow.

        @[JSON::Field(key: "connectorProfileDetails")]
        getter connector_profile_details : Array(Types::ConnectorProfile)?

        # The pagination token for the next page of data. If nextToken=null , this means that all records have
        # been fetched.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_profile_details : Array(Types::ConnectorProfile)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConnectorRequest
        include JSON::Serializable

        # The connector type, such as CUSTOMCONNECTOR, Saleforce, Marketo. Please choose CUSTOMCONNECTOR for
        # Lambda based custom connectors.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String

        # The label of the connector. The label is unique for each ConnectorRegistration in your Amazon Web
        # Services account. Only needed if calling for CUSTOMCONNECTOR connector type/.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String?

        def initialize(
          @connector_type : String,
          @connector_label : String? = nil
        )
        end
      end


      struct DescribeConnectorResponse
        include JSON::Serializable

        # Configuration info of all the connectors that the user requested.

        @[JSON::Field(key: "connectorConfiguration")]
        getter connector_configuration : Types::ConnectorConfiguration?

        def initialize(
          @connector_configuration : Types::ConnectorConfiguration? = nil
        )
        end
      end


      struct DescribeConnectorsRequest
        include JSON::Serializable

        # The type of connector, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorTypes")]
        getter connector_types : Array(String)?

        # The maximum number of items that should be returned in the result set. The default is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_types : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConnectorsResponse
        include JSON::Serializable

        # The configuration that is applied to the connectors used in the flow.

        @[JSON::Field(key: "connectorConfigurations")]
        getter connector_configurations : Hash(String, Types::ConnectorConfiguration)?

        # Information about the connectors supported in Amazon AppFlow.

        @[JSON::Field(key: "connectors")]
        getter connectors : Array(Types::ConnectorDetail)?

        # The pagination token for the next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_configurations : Hash(String, Types::ConnectorConfiguration)? = nil,
          @connectors : Array(Types::ConnectorDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFlowExecutionRecordsRequest
        include JSON::Serializable

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # Specifies the maximum number of items that should be returned in the result set. The default for
        # maxResults is 20 (for all paginated API operations).

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFlowExecutionRecordsResponse
        include JSON::Serializable

        # Returns a list of all instances when this flow was run.

        @[JSON::Field(key: "flowExecutions")]
        getter flow_executions : Array(Types::ExecutionRecord)?

        # The pagination token for the next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_executions : Array(Types::ExecutionRecord)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFlowRequest
        include JSON::Serializable

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        def initialize(
          @flow_name : String
        )
        end
      end


      struct DescribeFlowResponse
        include JSON::Serializable

        # Specifies when the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ARN of the user who created the flow.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # A description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration that controls how Amazon AppFlow transfers data to the destination connector.

        @[JSON::Field(key: "destinationFlowConfigList")]
        getter destination_flow_config_list : Array(Types::DestinationFlowConfig)?

        # The flow's Amazon Resource Name (ARN).

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String?

        # Indicates the current status of the flow.

        @[JSON::Field(key: "flowStatus")]
        getter flow_status : String?

        # Contains an error message if the flow status is in a suspended or error state. This applies only to
        # scheduled or event-triggered flows.

        @[JSON::Field(key: "flowStatusMessage")]
        getter flow_status_message : String?

        # The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you provide for encryption.
        # This is required if you do not want to use the Amazon AppFlow-managed KMS key. If you don't provide
        # anything here, Amazon AppFlow uses the Amazon AppFlow-managed KMS key.

        @[JSON::Field(key: "kmsArn")]
        getter kms_arn : String?

        # Describes the details of the most recent flow run.

        @[JSON::Field(key: "lastRunExecutionDetails")]
        getter last_run_execution_details : Types::ExecutionDetails?

        # Describes the metadata catalog, metadata table, and data partitions that Amazon AppFlow used for the
        # associated flow run.

        @[JSON::Field(key: "lastRunMetadataCatalogDetails")]
        getter last_run_metadata_catalog_details : Array(Types::MetadataCatalogDetail)?

        # Specifies when the flow was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Specifies the user name of the account that performed the most recent update.

        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # Specifies the configuration that Amazon AppFlow uses when it catalogs the data that's transferred by
        # the associated flow. When Amazon AppFlow catalogs the data from a flow, it stores metadata in a data
        # catalog.

        @[JSON::Field(key: "metadataCatalogConfig")]
        getter metadata_catalog_config : Types::MetadataCatalogConfig?

        # The version number of your data schema. Amazon AppFlow assigns this version number. The version
        # number increases by one when you change any of the following settings in your flow configuration:
        # Source-to-destination field mappings Field data types Partition keys

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : Int64?

        # The configuration that controls how Amazon AppFlow retrieves data from the source connector.

        @[JSON::Field(key: "sourceFlowConfig")]
        getter source_flow_config : Types::SourceFlowConfig?

        # The tags used to organize, track, or control access for your flow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A list of tasks that Amazon AppFlow performs while transferring the data in the flow run.

        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::Task)?

        # The trigger settings that determine how and when the flow runs.

        @[JSON::Field(key: "triggerConfig")]
        getter trigger_config : Types::TriggerConfig?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @destination_flow_config_list : Array(Types::DestinationFlowConfig)? = nil,
          @flow_arn : String? = nil,
          @flow_name : String? = nil,
          @flow_status : String? = nil,
          @flow_status_message : String? = nil,
          @kms_arn : String? = nil,
          @last_run_execution_details : Types::ExecutionDetails? = nil,
          @last_run_metadata_catalog_details : Array(Types::MetadataCatalogDetail)? = nil,
          @last_updated_at : Time? = nil,
          @last_updated_by : String? = nil,
          @metadata_catalog_config : Types::MetadataCatalogConfig? = nil,
          @schema_version : Int64? = nil,
          @source_flow_config : Types::SourceFlowConfig? = nil,
          @tags : Hash(String, String)? = nil,
          @tasks : Array(Types::Task)? = nil,
          @trigger_config : Types::TriggerConfig? = nil
        )
        end
      end

      # This stores the information that is required to query a particular connector.

      struct DestinationConnectorProperties
        include JSON::Serializable

        # The properties that are required to query the custom Connector.

        @[JSON::Field(key: "CustomConnector")]
        getter custom_connector : Types::CustomConnectorDestinationProperties?

        # The properties required to query Amazon Connect Customer Profiles.

        @[JSON::Field(key: "CustomerProfiles")]
        getter customer_profiles : Types::CustomerProfilesDestinationProperties?

        # The properties required to query Amazon EventBridge.

        @[JSON::Field(key: "EventBridge")]
        getter event_bridge : Types::EventBridgeDestinationProperties?

        # The properties required to query Amazon Honeycode.

        @[JSON::Field(key: "Honeycode")]
        getter honeycode : Types::HoneycodeDestinationProperties?

        # The properties required to query Amazon Lookout for Metrics.

        @[JSON::Field(key: "LookoutMetrics")]
        getter lookout_metrics : Types::LookoutMetricsDestinationProperties?

        # The properties required to query Marketo.

        @[JSON::Field(key: "Marketo")]
        getter marketo : Types::MarketoDestinationProperties?

        # The properties required to query Amazon Redshift.

        @[JSON::Field(key: "Redshift")]
        getter redshift : Types::RedshiftDestinationProperties?

        # The properties required to query Amazon S3.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3DestinationProperties?

        # The properties required to query SAPOData.

        @[JSON::Field(key: "SAPOData")]
        getter sapo_data : Types::SAPODataDestinationProperties?

        # The properties required to query Salesforce.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : Types::SalesforceDestinationProperties?

        # The properties required to query Snowflake.

        @[JSON::Field(key: "Snowflake")]
        getter snowflake : Types::SnowflakeDestinationProperties?

        # The properties required to query Upsolver.

        @[JSON::Field(key: "Upsolver")]
        getter upsolver : Types::UpsolverDestinationProperties?

        # The properties required to query Zendesk.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : Types::ZendeskDestinationProperties?

        def initialize(
          @custom_connector : Types::CustomConnectorDestinationProperties? = nil,
          @customer_profiles : Types::CustomerProfilesDestinationProperties? = nil,
          @event_bridge : Types::EventBridgeDestinationProperties? = nil,
          @honeycode : Types::HoneycodeDestinationProperties? = nil,
          @lookout_metrics : Types::LookoutMetricsDestinationProperties? = nil,
          @marketo : Types::MarketoDestinationProperties? = nil,
          @redshift : Types::RedshiftDestinationProperties? = nil,
          @s3 : Types::S3DestinationProperties? = nil,
          @sapo_data : Types::SAPODataDestinationProperties? = nil,
          @salesforce : Types::SalesforceDestinationProperties? = nil,
          @snowflake : Types::SnowflakeDestinationProperties? = nil,
          @upsolver : Types::UpsolverDestinationProperties? = nil,
          @zendesk : Types::ZendeskDestinationProperties? = nil
        )
        end
      end

      # The properties that can be applied to a field when connector is being used as a destination.

      struct DestinationFieldProperties
        include JSON::Serializable

        # Specifies if the destination field can be created by the current user.

        @[JSON::Field(key: "isCreatable")]
        getter is_creatable : Bool?

        # Specifies whether the field can use the default value during a Create operation.

        @[JSON::Field(key: "isDefaultedOnCreate")]
        getter is_defaulted_on_create : Bool?

        # Specifies if the destination field can have a null value.

        @[JSON::Field(key: "isNullable")]
        getter is_nullable : Bool?

        # Specifies whether the field can be updated during an UPDATE or UPSERT write operation.

        @[JSON::Field(key: "isUpdatable")]
        getter is_updatable : Bool?

        # Specifies if the flow run can either insert new rows in the destination field if they do not already
        # exist, or update them if they do.

        @[JSON::Field(key: "isUpsertable")]
        getter is_upsertable : Bool?

        # A list of supported write operations. For each write operation listed, this field can be used in
        # idFieldNames when that write operation is present as a destination option.

        @[JSON::Field(key: "supportedWriteOperations")]
        getter supported_write_operations : Array(String)?

        def initialize(
          @is_creatable : Bool? = nil,
          @is_defaulted_on_create : Bool? = nil,
          @is_nullable : Bool? = nil,
          @is_updatable : Bool? = nil,
          @is_upsertable : Bool? = nil,
          @supported_write_operations : Array(String)? = nil
        )
        end
      end

      # Contains information about the configuration of destination connectors present in the flow.

      struct DestinationFlowConfig
        include JSON::Serializable

        # The type of connector, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String

        # This stores the information that is required to query a particular connector.

        @[JSON::Field(key: "destinationConnectorProperties")]
        getter destination_connector_properties : Types::DestinationConnectorProperties

        # The API version that the destination connector uses.

        @[JSON::Field(key: "apiVersion")]
        getter api_version : String?

        # The name of the connector profile. This name must be unique for each connector profile in the Amazon
        # Web Services account.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String?

        def initialize(
          @connector_type : String,
          @destination_connector_properties : Types::DestinationConnectorProperties,
          @api_version : String? = nil,
          @connector_profile_name : String? = nil
        )
        end
      end

      # The connector-specific profile credentials required by Dynatrace.

      struct DynatraceConnectorProfileCredentials
        include JSON::Serializable

        # The API tokens used by Dynatrace API to authenticate various API calls.

        @[JSON::Field(key: "apiToken")]
        getter api_token : String

        def initialize(
          @api_token : String
        )
        end
      end

      # The connector-specific profile properties required by Dynatrace.

      struct DynatraceConnectorProfileProperties
        include JSON::Serializable

        # The location of the Dynatrace resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The connector metadata specific to Dynatrace.

      struct DynatraceMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Dynatrace is being used as a source.

      struct DynatraceSourceProperties
        include JSON::Serializable

        # The object specified in the Dynatrace flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The settings that determine how Amazon AppFlow handles an error when placing data in the
      # destination. For example, this setting would determine if the flow should fail after one insertion
      # error, or continue and attempt to insert every record regardless of the initial failure.
      # ErrorHandlingConfig is a part of the destination connector details.

      struct ErrorHandlingConfig
        include JSON::Serializable

        # Specifies the name of the Amazon S3 bucket.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # Specifies the Amazon S3 bucket prefix.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?

        # Specifies if the flow should fail after the first instance of a failure when attempting to place
        # data in the destination.

        @[JSON::Field(key: "failOnFirstDestinationError")]
        getter fail_on_first_destination_error : Bool?

        def initialize(
          @bucket_name : String? = nil,
          @bucket_prefix : String? = nil,
          @fail_on_first_destination_error : Bool? = nil
        )
        end
      end

      # Provides details in the event of a failed flow, including the failure count and the related error
      # messages.

      struct ErrorInfo
        include JSON::Serializable

        # Specifies the error message that appears if a flow fails.

        @[JSON::Field(key: "executionMessage")]
        getter execution_message : String?

        # Specifies the failure count for the attempted flow.

        @[JSON::Field(key: "putFailuresCount")]
        getter put_failures_count : Int64?

        def initialize(
          @execution_message : String? = nil,
          @put_failures_count : Int64? = nil
        )
        end
      end

      # The properties that are applied when Amazon EventBridge is being used as a destination.

      struct EventBridgeDestinationProperties
        include JSON::Serializable

        # The object specified in the Amazon EventBridge flow destination.

        @[JSON::Field(key: "object")]
        getter object : String


        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?

        def initialize(
          @object : String,
          @error_handling_config : Types::ErrorHandlingConfig? = nil
        )
        end
      end

      # The connector metadata specific to Amazon EventBridge.

      struct EventBridgeMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the details of the flow run, including the timestamp, status, and message.

      struct ExecutionDetails
        include JSON::Serializable

        # Describes the details of the most recent flow run.

        @[JSON::Field(key: "mostRecentExecutionMessage")]
        getter most_recent_execution_message : String?

        # Specifies the status of the most recent flow run.

        @[JSON::Field(key: "mostRecentExecutionStatus")]
        getter most_recent_execution_status : String?

        # Specifies the time of the most recent flow run.

        @[JSON::Field(key: "mostRecentExecutionTime")]
        getter most_recent_execution_time : Time?

        def initialize(
          @most_recent_execution_message : String? = nil,
          @most_recent_execution_status : String? = nil,
          @most_recent_execution_time : Time? = nil
        )
        end
      end

      # Specifies information about the past flow run instances for a given flow.

      struct ExecutionRecord
        include JSON::Serializable

        # The timestamp that indicates the last new or updated record to be transferred in the flow run.

        @[JSON::Field(key: "dataPullEndTime")]
        getter data_pull_end_time : Time?

        # The timestamp that determines the first new or updated record to be transferred in the flow run.

        @[JSON::Field(key: "dataPullStartTime")]
        getter data_pull_start_time : Time?

        # Specifies the identifier of the given flow run.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # Describes the result of the given flow run.

        @[JSON::Field(key: "executionResult")]
        getter execution_result : Types::ExecutionResult?

        # Specifies the flow run status and whether it is in progress, has completed successfully, or has
        # failed.

        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String?

        # Specifies the time of the most recent update.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Describes the metadata catalog, metadata table, and data partitions that Amazon AppFlow used for the
        # associated flow run.

        @[JSON::Field(key: "metadataCatalogDetails")]
        getter metadata_catalog_details : Array(Types::MetadataCatalogDetail)?

        # Specifies the start time of the flow run.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        def initialize(
          @data_pull_end_time : Time? = nil,
          @data_pull_start_time : Time? = nil,
          @execution_id : String? = nil,
          @execution_result : Types::ExecutionResult? = nil,
          @execution_status : String? = nil,
          @last_updated_at : Time? = nil,
          @metadata_catalog_details : Array(Types::MetadataCatalogDetail)? = nil,
          @started_at : Time? = nil
        )
        end
      end

      # Specifies the end result of the flow run.

      struct ExecutionResult
        include JSON::Serializable

        # The total number of bytes processed by the flow run.

        @[JSON::Field(key: "bytesProcessed")]
        getter bytes_processed : Int64?

        # The total number of bytes written as a result of the flow run.

        @[JSON::Field(key: "bytesWritten")]
        getter bytes_written : Int64?

        # Provides any error message information related to the flow run.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::ErrorInfo?

        # The maximum number of records that Amazon AppFlow receives in each page of the response from your
        # SAP application.

        @[JSON::Field(key: "maxPageSize")]
        getter max_page_size : Int64?

        # The number of processes that Amazon AppFlow ran at the same time when it retrieved your data.

        @[JSON::Field(key: "numParallelProcesses")]
        getter num_parallel_processes : Int64?

        # The number of records processed in the flow run.

        @[JSON::Field(key: "recordsProcessed")]
        getter records_processed : Int64?

        def initialize(
          @bytes_processed : Int64? = nil,
          @bytes_written : Int64? = nil,
          @error_info : Types::ErrorInfo? = nil,
          @max_page_size : Int64? = nil,
          @num_parallel_processes : Int64? = nil,
          @records_processed : Int64? = nil
        )
        end
      end

      # Contains details regarding the supported field type and the operators that can be applied for
      # filtering.

      struct FieldTypeDetails
        include JSON::Serializable

        # The type of field, such as string, integer, date, and so on.

        @[JSON::Field(key: "fieldType")]
        getter field_type : String

        # The list of operators supported by a field.

        @[JSON::Field(key: "filterOperators")]
        getter filter_operators : Array(String)

        # This is the allowable length range for this field's value.

        @[JSON::Field(key: "fieldLengthRange")]
        getter field_length_range : Types::Range?

        # The range of values this field can hold.

        @[JSON::Field(key: "fieldValueRange")]
        getter field_value_range : Types::Range?

        # The date format that the field supports.

        @[JSON::Field(key: "supportedDateFormat")]
        getter supported_date_format : String?

        # The list of values that a field can contain. For example, a Boolean fieldType can have two values:
        # "true" and "false".

        @[JSON::Field(key: "supportedValues")]
        getter supported_values : Array(String)?

        # The regular expression pattern for the field name.

        @[JSON::Field(key: "valueRegexPattern")]
        getter value_regex_pattern : String?

        def initialize(
          @field_type : String,
          @filter_operators : Array(String),
          @field_length_range : Types::Range? = nil,
          @field_value_range : Types::Range? = nil,
          @supported_date_format : String? = nil,
          @supported_values : Array(String)? = nil,
          @value_regex_pattern : String? = nil
        )
        end
      end

      # The properties of the flow, such as its source, destination, trigger type, and so on.

      struct FlowDefinition
        include JSON::Serializable

        # Specifies when the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ARN of the user who created the flow.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # A user-entered description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The label of the destination connector in the flow.

        @[JSON::Field(key: "destinationConnectorLabel")]
        getter destination_connector_label : String?

        # Specifies the destination connector type, such as Salesforce, Amazon S3, Amplitude, and so on.

        @[JSON::Field(key: "destinationConnectorType")]
        getter destination_connector_type : String?

        # The flow's Amazon Resource Name (ARN).

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String?

        # Indicates the current status of the flow.

        @[JSON::Field(key: "flowStatus")]
        getter flow_status : String?

        # Describes the details of the most recent flow run.

        @[JSON::Field(key: "lastRunExecutionDetails")]
        getter last_run_execution_details : Types::ExecutionDetails?

        # Specifies when the flow was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Specifies the account user name that most recently updated the flow.

        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The label of the source connector in the flow.

        @[JSON::Field(key: "sourceConnectorLabel")]
        getter source_connector_label : String?

        # Specifies the source connector type, such as Salesforce, Amazon S3, Amplitude, and so on.

        @[JSON::Field(key: "sourceConnectorType")]
        getter source_connector_type : String?

        # The tags used to organize, track, or control access for your flow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies the type of flow trigger. This can be OnDemand , Scheduled , or Event .

        @[JSON::Field(key: "triggerType")]
        getter trigger_type : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @destination_connector_label : String? = nil,
          @destination_connector_type : String? = nil,
          @flow_arn : String? = nil,
          @flow_name : String? = nil,
          @flow_status : String? = nil,
          @last_run_execution_details : Types::ExecutionDetails? = nil,
          @last_updated_at : Time? = nil,
          @last_updated_by : String? = nil,
          @source_connector_label : String? = nil,
          @source_connector_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @trigger_type : String? = nil
        )
        end
      end

      # Specifies the configuration that Amazon AppFlow uses when it catalogs your data with the Glue Data
      # Catalog. When Amazon AppFlow catalogs your data, it stores metadata in Data Catalog tables. This
      # metadata represents the data that's transferred by the flow that you configure with these settings.
      # You can configure a flow with these settings only when the flow destination is Amazon S3.

      struct GlueDataCatalogConfig
        include JSON::Serializable

        # The name of the Data Catalog database that stores the metadata tables that Amazon AppFlow creates in
        # your Amazon Web Services account. These tables contain metadata for the data that's transferred by
        # the flow that you configure with this parameter. When you configure a new flow with this parameter,
        # you must specify an existing database.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The Amazon Resource Name (ARN) of an IAM role that grants Amazon AppFlow the permissions it needs to
        # create Data Catalog tables, databases, and partitions. For an example IAM policy that has the
        # required permissions, see Identity-based policy examples for Amazon AppFlow .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A naming prefix for each Data Catalog table that Amazon AppFlow creates for the flow that you
        # configure with this setting. Amazon AppFlow adds the prefix to the beginning of the each table name.

        @[JSON::Field(key: "tablePrefix")]
        getter table_prefix : String

        def initialize(
          @database_name : String,
          @role_arn : String,
          @table_prefix : String
        )
        end
      end

      # The connector-specific profile credentials required by Google Analytics.

      struct GoogleAnalyticsConnectorProfileCredentials
        include JSON::Serializable

        # The identifier for the desired client.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret used by the OAuth client to authenticate to the authorization server.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # The credentials used to access protected Google Analytics resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The OAuth requirement needed to request security tokens from the connector endpoint.

        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        # The credentials used to acquire new access tokens. This is required only for OAuth2 access tokens,
        # and is not required for OAuth1 access tokens.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @access_token : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # The connector-specific profile properties required by Google Analytics.

      struct GoogleAnalyticsConnectorProfileProperties
        include JSON::Serializable

        def initialize
        end
      end

      # The connector metadata specific to Google Analytics.

      struct GoogleAnalyticsMetadata
        include JSON::Serializable

        # The desired authorization scope for the Google Analytics account.

        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)?

        def initialize(
          @o_auth_scopes : Array(String)? = nil
        )
        end
      end

      # The properties that are applied when Google Analytics is being used as a source.

      struct GoogleAnalyticsSourceProperties
        include JSON::Serializable

        # The object specified in the Google Analytics flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The connector-specific credentials required when using Amazon Honeycode.

      struct HoneycodeConnectorProfileCredentials
        include JSON::Serializable

        # The credentials used to access protected Amazon Honeycode resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?


        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        # The credentials used to acquire new access tokens.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        def initialize(
          @access_token : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # The connector-specific properties required when using Amazon Honeycode.

      struct HoneycodeConnectorProfileProperties
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Amazon Honeycode is used as a destination.

      struct HoneycodeDestinationProperties
        include JSON::Serializable

        # The object specified in the Amazon Honeycode flow destination.

        @[JSON::Field(key: "object")]
        getter object : String


        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?

        def initialize(
          @object : String,
          @error_handling_config : Types::ErrorHandlingConfig? = nil
        )
        end
      end

      # The connector metadata specific to Amazon Honeycode.

      struct HoneycodeMetadata
        include JSON::Serializable

        # The desired authorization scope for the Amazon Honeycode account.

        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)?

        def initialize(
          @o_auth_scopes : Array(String)? = nil
        )
        end
      end

      # Specifies the configuration used when importing incremental records from the source.

      struct IncrementalPullConfig
        include JSON::Serializable

        # A field that specifies the date time or timestamp field as the criteria to use when importing
        # incremental records from the source.

        @[JSON::Field(key: "datetimeTypeFieldName")]
        getter datetime_type_field_name : String?

        def initialize(
          @datetime_type_field_name : String? = nil
        )
        end
      end

      # The connector-specific profile credentials required by Infor Nexus.

      struct InforNexusConnectorProfileCredentials
        include JSON::Serializable

        # The Access Key portion of the credentials.

        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String

        # The encryption keys used to encrypt data.

        @[JSON::Field(key: "datakey")]
        getter datakey : String

        # The secret key used to sign requests.

        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String

        # The identifier for the user.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @access_key_id : String,
          @datakey : String,
          @secret_access_key : String,
          @user_id : String
        )
        end
      end

      # The connector-specific profile properties required by Infor Nexus.

      struct InforNexusConnectorProfileProperties
        include JSON::Serializable

        # The location of the Infor Nexus resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The connector metadata specific to Infor Nexus.

      struct InforNexusMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Infor Nexus is being used as a source.

      struct InforNexusSourceProperties
        include JSON::Serializable

        # The object specified in the Infor Nexus flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # An internal service error occurred during the processing of your request. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about the configuration of the lambda which is being registered as the
      # connector.

      struct LambdaConnectorProvisioningConfig
        include JSON::Serializable

        # Lambda ARN of the connector being registered.

        @[JSON::Field(key: "lambdaArn")]
        getter lambda_arn : String

        def initialize(
          @lambda_arn : String
        )
        end
      end


      struct ListConnectorEntitiesRequest
        include JSON::Serializable

        # The version of the API that's used by the connector.

        @[JSON::Field(key: "apiVersion")]
        getter api_version : String?

        # The name of the connector profile. The name is unique for each ConnectorProfile in the Amazon Web
        # Services account, and is used to query the downstream connector.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String?

        # The type of connector, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String?

        # This optional parameter is specific to connector implementation. Some connectors support multiple
        # levels or categories of entities. You can find out the list of roots for such providers by sending a
        # request without the entitiesPath parameter. If the connector supports entities at different roots,
        # this initial request returns the list of roots. Otherwise, this request returns all entities
        # supported by the provider.

        @[JSON::Field(key: "entitiesPath")]
        getter entities_path : String?

        # The maximum number of items that the operation returns in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that was provided by your prior ListConnectorEntities operation if the response was too big
        # for the page size. You specify this token to get the next page of results in paginated response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_version : String? = nil,
          @connector_profile_name : String? = nil,
          @connector_type : String? = nil,
          @entities_path : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorEntitiesResponse
        include JSON::Serializable

        # The response of ListConnectorEntities lists entities grouped by category. This map's key represents
        # the group name, and its value contains the list of entities belonging to that group.

        @[JSON::Field(key: "connectorEntityMap")]
        getter connector_entity_map : Hash(String, Array(Types::ConnectorEntity))

        # A token that you specify in your next ListConnectorEntities operation to get the next page of
        # results in paginated response. The ListConnectorEntities operation provides this token if the
        # response is too big for the page size.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_entity_map : Hash(String, Array(Types::ConnectorEntity)),
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorsRequest
        include JSON::Serializable

        # Specifies the maximum number of items that should be returned in the result set. The default for
        # maxResults is 20 (for all paginated API operations).

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorsResponse
        include JSON::Serializable

        # Contains information about the connectors supported by Amazon AppFlow.

        @[JSON::Field(key: "connectors")]
        getter connectors : Array(Types::ConnectorDetail)?

        # The pagination token for the next page of data. If nextToken=null, this means that all records have
        # been fetched.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connectors : Array(Types::ConnectorDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowsRequest
        include JSON::Serializable

        # Specifies the maximum number of items that should be returned in the result set.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowsResponse
        include JSON::Serializable

        # The list of flows associated with your account.

        @[JSON::Field(key: "flows")]
        getter flows : Array(Types::FlowDefinition)?

        # The pagination token for next page of data.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flows : Array(Types::FlowDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified flow.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags used to organize, track, or control access for your flow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The properties that are applied when Amazon Lookout for Metrics is used as a destination.

      struct LookoutMetricsDestinationProperties
        include JSON::Serializable

        def initialize
        end
      end

      # The connector-specific profile credentials required by Marketo.

      struct MarketoConnectorProfileCredentials
        include JSON::Serializable

        # The identifier for the desired client.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret used by the OAuth client to authenticate to the authorization server.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # The credentials used to access protected Marketo resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The OAuth requirement needed to request security tokens from the connector endpoint.

        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @access_token : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil
        )
        end
      end

      # The connector-specific profile properties required when using Marketo.

      struct MarketoConnectorProfileProperties
        include JSON::Serializable

        # The location of the Marketo resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The properties that Amazon AppFlow applies when you use Marketo as a flow destination.

      struct MarketoDestinationProperties
        include JSON::Serializable

        # The object specified in the Marketo flow destination.

        @[JSON::Field(key: "object")]
        getter object : String


        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?

        def initialize(
          @object : String,
          @error_handling_config : Types::ErrorHandlingConfig? = nil
        )
        end
      end

      # The connector metadata specific to Marketo.

      struct MarketoMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Marketo is being used as a source.

      struct MarketoSourceProperties
        include JSON::Serializable

        # The object specified in the Marketo flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # Specifies the configuration that Amazon AppFlow uses when it catalogs your data. When Amazon AppFlow
      # catalogs your data, it stores metadata in a data catalog.

      struct MetadataCatalogConfig
        include JSON::Serializable

        # Specifies the configuration that Amazon AppFlow uses when it catalogs your data with the Glue Data
        # Catalog.

        @[JSON::Field(key: "glueDataCatalog")]
        getter glue_data_catalog : Types::GlueDataCatalogConfig?

        def initialize(
          @glue_data_catalog : Types::GlueDataCatalogConfig? = nil
        )
        end
      end

      # Describes the metadata catalog, metadata table, and data partitions that Amazon AppFlow used for the
      # associated flow run.

      struct MetadataCatalogDetail
        include JSON::Serializable

        # The type of metadata catalog that Amazon AppFlow used for the associated flow run. This parameter
        # returns the following value: GLUE The metadata catalog is provided by the Glue Data Catalog. Glue
        # includes the Glue Data Catalog as a component.

        @[JSON::Field(key: "catalogType")]
        getter catalog_type : String?

        # Describes the status of the attempt from Amazon AppFlow to register the data partitions with the
        # metadata catalog. The data partitions organize the flow output into a hierarchical path, such as a
        # folder path in an S3 bucket. Amazon AppFlow creates the partitions (if they don't already exist)
        # based on your flow configuration.

        @[JSON::Field(key: "partitionRegistrationOutput")]
        getter partition_registration_output : Types::RegistrationOutput?

        # The name of the table that stores the metadata for the associated flow run. The table stores
        # metadata that represents the data that the flow transferred. Amazon AppFlow stores the table in the
        # metadata catalog.

        @[JSON::Field(key: "tableName")]
        getter table_name : String?

        # Describes the status of the attempt from Amazon AppFlow to register the metadata table with the
        # metadata catalog. Amazon AppFlow creates or updates this table for the associated flow run.

        @[JSON::Field(key: "tableRegistrationOutput")]
        getter table_registration_output : Types::RegistrationOutput?

        def initialize(
          @catalog_type : String? = nil,
          @partition_registration_output : Types::RegistrationOutput? = nil,
          @table_name : String? = nil,
          @table_registration_output : Types::RegistrationOutput? = nil
        )
        end
      end

      # The OAuth 2.0 credentials required for OAuth 2.0 authentication.

      struct OAuth2Credentials
        include JSON::Serializable

        # The access token used to access the connector on your behalf.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The identifier for the desired client.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The client secret used by the OAuth client to authenticate to the authorization server.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String?


        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        # The refresh token used to refresh an expired access token.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        def initialize(
          @access_token : String? = nil,
          @client_id : String? = nil,
          @client_secret : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # Custom parameter required for OAuth 2.0 authentication.

      struct OAuth2CustomParameter
        include JSON::Serializable

        # Contains default values for this authentication parameter that are supplied by the connector.

        @[JSON::Field(key: "connectorSuppliedValues")]
        getter connector_supplied_values : Array(String)?

        # A description about the custom parameter used for OAuth 2.0 authentication.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the custom parameter for OAuth 2.0 authentication is required.

        @[JSON::Field(key: "isRequired")]
        getter is_required : Bool?

        # Indicates whether this authentication custom parameter is a sensitive field.

        @[JSON::Field(key: "isSensitiveField")]
        getter is_sensitive_field : Bool?

        # The key of the custom parameter required for OAuth 2.0 authentication.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The label of the custom parameter used for OAuth 2.0 authentication.

        @[JSON::Field(key: "label")]
        getter label : String?

        # Indicates whether custom parameter is used with TokenUrl or AuthUrl.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @connector_supplied_values : Array(String)? = nil,
          @description : String? = nil,
          @is_required : Bool? = nil,
          @is_sensitive_field : Bool? = nil,
          @key : String? = nil,
          @label : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains the default values required for OAuth 2.0 authentication.

      struct OAuth2Defaults
        include JSON::Serializable

        # Auth code URLs that can be used for OAuth 2.0 authentication.

        @[JSON::Field(key: "authCodeUrls")]
        getter auth_code_urls : Array(String)?

        # List of custom parameters required for OAuth 2.0 authentication.

        @[JSON::Field(key: "oauth2CustomProperties")]
        getter oauth2_custom_properties : Array(Types::OAuth2CustomParameter)?

        # OAuth 2.0 grant types supported by the connector.

        @[JSON::Field(key: "oauth2GrantTypesSupported")]
        getter oauth2_grant_types_supported : Array(String)?

        # OAuth 2.0 scopes that the connector supports.

        @[JSON::Field(key: "oauthScopes")]
        getter oauth_scopes : Array(String)?

        # Token URLs that can be used for OAuth 2.0 authentication.

        @[JSON::Field(key: "tokenUrls")]
        getter token_urls : Array(String)?

        def initialize(
          @auth_code_urls : Array(String)? = nil,
          @oauth2_custom_properties : Array(Types::OAuth2CustomParameter)? = nil,
          @oauth2_grant_types_supported : Array(String)? = nil,
          @oauth_scopes : Array(String)? = nil,
          @token_urls : Array(String)? = nil
        )
        end
      end

      # The OAuth 2.0 properties required for OAuth 2.0 authentication.

      struct OAuth2Properties
        include JSON::Serializable

        # The OAuth 2.0 grant type used by connector for OAuth 2.0 authentication.

        @[JSON::Field(key: "oAuth2GrantType")]
        getter o_auth2_grant_type : String

        # The token URL required for OAuth 2.0 authentication.

        @[JSON::Field(key: "tokenUrl")]
        getter token_url : String

        # Associates your token URL with a map of properties that you define. Use this parameter to provide
        # any additional details that the connector requires to authenticate your request.

        @[JSON::Field(key: "tokenUrlCustomProperties")]
        getter token_url_custom_properties : Hash(String, String)?

        def initialize(
          @o_auth2_grant_type : String,
          @token_url : String,
          @token_url_custom_properties : Hash(String, String)? = nil
        )
        end
      end

      # The OAuth credentials required for OAuth type authentication.

      struct OAuthCredentials
        include JSON::Serializable

        # The identifier for the desired client.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret used by the OAuth client to authenticate to the authorization server.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # The access token used to access protected SAPOData resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The OAuth requirement needed to request security tokens from the connector endpoint.

        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        # The refresh token used to refresh expired access token.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @access_token : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # The OAuth properties required for OAuth type authentication.

      struct OAuthProperties
        include JSON::Serializable

        # The authorization code url required to redirect to SAP Login Page to fetch authorization code for
        # OAuth type authentication.

        @[JSON::Field(key: "authCodeUrl")]
        getter auth_code_url : String

        # The OAuth scopes required for OAuth type authentication.

        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)

        # The token url required to fetch access/refresh tokens using authorization code and also to refresh
        # expired access token using refresh token.

        @[JSON::Field(key: "tokenUrl")]
        getter token_url : String

        def initialize(
          @auth_code_url : String,
          @o_auth_scopes : Array(String),
          @token_url : String
        )
        end
      end

      # The connector-specific profile credentials required when using Salesforce Pardot.

      struct PardotConnectorProfileCredentials
        include JSON::Serializable

        # The credentials used to access protected Salesforce Pardot resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The secret manager ARN, which contains the client ID and client secret of the connected app.

        @[JSON::Field(key: "clientCredentialsArn")]
        getter client_credentials_arn : String?


        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        # The credentials used to acquire new access tokens.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        def initialize(
          @access_token : String? = nil,
          @client_credentials_arn : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # The connector-specific profile properties required when using Salesforce Pardot.

      struct PardotConnectorProfileProperties
        include JSON::Serializable

        # The business unit id of Salesforce Pardot instance.

        @[JSON::Field(key: "businessUnitId")]
        getter business_unit_id : String?

        # The location of the Salesforce Pardot resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String?

        # Indicates whether the connector profile applies to a sandbox or production environment.

        @[JSON::Field(key: "isSandboxEnvironment")]
        getter is_sandbox_environment : Bool?

        def initialize(
          @business_unit_id : String? = nil,
          @instance_url : String? = nil,
          @is_sandbox_environment : Bool? = nil
        )
        end
      end

      # The connector metadata specific to Salesforce Pardot.

      struct PardotMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Salesforce Pardot is being used as a source.

      struct PardotSourceProperties
        include JSON::Serializable

        # The object specified in the Salesforce Pardot flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # Specifies elements that Amazon AppFlow includes in the file and folder names in the flow
      # destination.

      struct PrefixConfig
        include JSON::Serializable

        # Specifies whether the destination file path includes either or both of the following elements:
        # EXECUTION_ID The ID that Amazon AppFlow assigns to the flow run. SCHEMA_VERSION The version number
        # of your data schema. Amazon AppFlow assigns this version number. The version number increases by one
        # when you change any of the following settings in your flow configuration: Source-to-destination
        # field mappings Field data types Partition keys

        @[JSON::Field(key: "pathPrefixHierarchy")]
        getter path_prefix_hierarchy : Array(String)?

        # Determines the level of granularity for the date and time that's included in the prefix.

        @[JSON::Field(key: "prefixFormat")]
        getter prefix_format : String?

        # Determines the format of the prefix, and whether it applies to the file name, file path, or both.

        @[JSON::Field(key: "prefixType")]
        getter prefix_type : String?

        def initialize(
          @path_prefix_hierarchy : Array(String)? = nil,
          @prefix_format : String? = nil,
          @prefix_type : String? = nil
        )
        end
      end

      # Specifies the private connection provisioning state.

      struct PrivateConnectionProvisioningState
        include JSON::Serializable

        # Specifies the private connection provisioning failure cause.

        @[JSON::Field(key: "failureCause")]
        getter failure_cause : String?

        # Specifies the private connection provisioning failure reason.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # Specifies the private connection provisioning status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @failure_cause : String? = nil,
          @failure_message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The range of values that the property supports.

      struct Range
        include JSON::Serializable

        # Maximum value supported by the field.

        @[JSON::Field(key: "maximum")]
        getter maximum : Float64?

        # Minimum value supported by the field.

        @[JSON::Field(key: "minimum")]
        getter minimum : Float64?

        def initialize(
          @maximum : Float64? = nil,
          @minimum : Float64? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using Amazon Redshift.

      struct RedshiftConnectorProfileCredentials
        include JSON::Serializable

        # The password that corresponds to the user name.

        @[JSON::Field(key: "password")]
        getter password : String?

        # The name of the user.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @password : String? = nil,
          @username : String? = nil
        )
        end
      end

      # The connector-specific profile properties when using Amazon Redshift.

      struct RedshiftConnectorProfileProperties
        include JSON::Serializable

        # A name for the associated Amazon S3 bucket.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The Amazon Resource Name (ARN) of IAM role that grants Amazon Redshift read-only access to Amazon
        # S3. For more information, and for the polices that you attach to this role, see Allow Amazon
        # Redshift to access your Amazon AppFlow data in Amazon S3 .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The object key for the destination bucket in which Amazon AppFlow places the files.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?

        # The unique ID that's assigned to an Amazon Redshift cluster.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String?

        # The Amazon Resource Name (ARN) of an IAM role that permits Amazon AppFlow to access your Amazon
        # Redshift database through the Data API. For more information, and for the polices that you attach to
        # this role, see Allow Amazon AppFlow to access Amazon Redshift databases with the Data API .

        @[JSON::Field(key: "dataApiRoleArn")]
        getter data_api_role_arn : String?

        # The name of an Amazon Redshift database.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # The JDBC URL of the Amazon Redshift cluster.

        @[JSON::Field(key: "databaseUrl")]
        getter database_url : String?

        # Indicates whether the connector profile defines a connection to an Amazon Redshift Serverless data
        # warehouse.

        @[JSON::Field(key: "isRedshiftServerless")]
        getter is_redshift_serverless : Bool?

        # The name of an Amazon Redshift workgroup.

        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @bucket_name : String,
          @role_arn : String,
          @bucket_prefix : String? = nil,
          @cluster_identifier : String? = nil,
          @data_api_role_arn : String? = nil,
          @database_name : String? = nil,
          @database_url : String? = nil,
          @is_redshift_serverless : Bool? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      # The properties that are applied when Amazon Redshift is being used as a destination.

      struct RedshiftDestinationProperties
        include JSON::Serializable

        # The intermediate bucket that Amazon AppFlow uses when moving data into Amazon Redshift.

        @[JSON::Field(key: "intermediateBucketName")]
        getter intermediate_bucket_name : String

        # The object specified in the Amazon Redshift flow destination.

        @[JSON::Field(key: "object")]
        getter object : String

        # The object key for the bucket in which Amazon AppFlow places the destination files.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?

        # The settings that determine how Amazon AppFlow handles an error when placing data in the Amazon
        # Redshift destination. For example, this setting would determine if the flow should fail after one
        # insertion error, or continue and attempt to insert every record regardless of the initial failure.
        # ErrorHandlingConfig is a part of the destination connector details.

        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?

        def initialize(
          @intermediate_bucket_name : String,
          @object : String,
          @bucket_prefix : String? = nil,
          @error_handling_config : Types::ErrorHandlingConfig? = nil
        )
        end
      end

      # The connector metadata specific to Amazon Redshift.

      struct RedshiftMetadata
        include JSON::Serializable

        def initialize
        end
      end


      struct RegisterConnectorRequest
        include JSON::Serializable

        # The clientToken parameter is an idempotency token. It ensures that your RegisterConnector request
        # completes only once. You choose the value to pass. For example, if you don't receive a response from
        # your request, you can safely retry the request with the same clientToken parameter value. If you
        # omit a clientToken value, the Amazon Web Services SDK that you are using inserts a value for you.
        # This way, the SDK can safely retry requests multiple times after a network error. You must provide
        # your own value for other use cases. If you specify input parameters that differ from your first
        # request, an error occurs. If you use a different value for clientToken , Amazon AppFlow considers it
        # a new call to RegisterConnector . The token is active for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the connector. The name is unique for each ConnectorRegistration in your Amazon Web
        # Services account.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String?

        # The provisioning type of the connector. Currently the only supported value is LAMBDA.

        @[JSON::Field(key: "connectorProvisioningConfig")]
        getter connector_provisioning_config : Types::ConnectorProvisioningConfig?

        # The provisioning type of the connector. Currently the only supported value is LAMBDA.

        @[JSON::Field(key: "connectorProvisioningType")]
        getter connector_provisioning_type : String?

        # A description about the connector that's being registered.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @client_token : String? = nil,
          @connector_label : String? = nil,
          @connector_provisioning_config : Types::ConnectorProvisioningConfig? = nil,
          @connector_provisioning_type : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct RegisterConnectorResponse
        include JSON::Serializable

        # The ARN of the connector being registered.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        def initialize(
          @connector_arn : String? = nil
        )
        end
      end

      # Describes the status of an attempt from Amazon AppFlow to register a resource. When you run a flow
      # that you've configured to use a metadata catalog, Amazon AppFlow registers a metadata table and data
      # partitions with that catalog. This operation provides the status of that registration attempt. The
      # operation also indicates how many related resources Amazon AppFlow created or updated.

      struct RegistrationOutput
        include JSON::Serializable

        # Explains the status of the registration attempt from Amazon AppFlow. If the attempt fails, the
        # message explains why.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Indicates the number of resources that Amazon AppFlow created or updated. Possible resources include
        # metadata tables and data partitions.

        @[JSON::Field(key: "result")]
        getter result : String?

        # Indicates the status of the registration attempt from Amazon AppFlow.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @message : String? = nil,
          @result : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ResetConnectorMetadataCacheRequest
        include JSON::Serializable

        # The API version that you specified in the connector profile that you’re resetting cached metadata
        # for. You must use this parameter only if the connector supports multiple API versions or if the
        # connector type is CustomConnector. To look up how many versions a connector supports, use the
        # DescribeConnectors action. In the response, find the value that Amazon AppFlow returns for the
        # connectorVersion parameter. To look up the connector type, use the DescribeConnectorProfiles action.
        # In the response, find the value that Amazon AppFlow returns for the connectorType parameter. To look
        # up the API version that you specified in a connector profile, use the DescribeConnectorProfiles
        # action.

        @[JSON::Field(key: "apiVersion")]
        getter api_version : String?

        # Use this parameter if you want to reset cached metadata about the details for an individual entity.
        # If you don't include this parameter in your request, Amazon AppFlow only resets cached metadata
        # about entity names, not entity details.

        @[JSON::Field(key: "connectorEntityName")]
        getter connector_entity_name : String?

        # The name of the connector profile that you want to reset cached metadata for. You can omit this
        # parameter if you're resetting the cache for any of the following connectors: Amazon Connect, Amazon
        # EventBridge, Amazon Lookout for Metrics, Amazon S3, or Upsolver. If you're resetting the cache for
        # any other connector, you must include this parameter in your request.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String?

        # The type of connector to reset cached metadata for. You must include this parameter in your request
        # if you're resetting the cache for any of the following connectors: Amazon Connect, Amazon
        # EventBridge, Amazon Lookout for Metrics, Amazon S3, or Upsolver. If you're resetting the cache for
        # any other connector, you can omit this parameter from your request.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String?

        # Use this parameter only if you’re resetting the cached metadata about a nested entity. Only some
        # connectors support nested entities. A nested entity is one that has another entity as a parent. To
        # use this parameter, specify the name of the parent entity. To look up the parent-child relationship
        # of entities, you can send a ListConnectorEntities request that omits the entitiesPath parameter.
        # Amazon AppFlow will return a list of top-level entities. For each one, it indicates whether the
        # entity has nested entities. Then, in a subsequent ListConnectorEntities request, you can specify a
        # parent entity name for the entitiesPath parameter. Amazon AppFlow will return a list of the child
        # entities for that parent.

        @[JSON::Field(key: "entitiesPath")]
        getter entities_path : String?

        def initialize(
          @api_version : String? = nil,
          @connector_entity_name : String? = nil,
          @connector_profile_name : String? = nil,
          @connector_type : String? = nil,
          @entities_path : String? = nil
        )
        end
      end


      struct ResetConnectorMetadataCacheResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The resource specified in the request (such as the source or destination connector profile) is not
      # found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The properties that are applied when Amazon S3 is used as a destination.

      struct S3DestinationProperties
        include JSON::Serializable

        # The Amazon S3 bucket name in which Amazon AppFlow places the transferred data.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The object key for the destination bucket in which Amazon AppFlow places the files.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?


        @[JSON::Field(key: "s3OutputFormatConfig")]
        getter s3_output_format_config : Types::S3OutputFormatConfig?

        def initialize(
          @bucket_name : String,
          @bucket_prefix : String? = nil,
          @s3_output_format_config : Types::S3OutputFormatConfig? = nil
        )
        end
      end

      # When you use Amazon S3 as the source, the configuration format that you provide the flow input data.

      struct S3InputFormatConfig
        include JSON::Serializable

        # The file type that Amazon AppFlow gets from your Amazon S3 bucket.

        @[JSON::Field(key: "s3InputFileType")]
        getter s3_input_file_type : String?

        def initialize(
          @s3_input_file_type : String? = nil
        )
        end
      end

      # The connector metadata specific to Amazon S3.

      struct S3Metadata
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration that determines how Amazon AppFlow should format the flow output data when Amazon
      # S3 is used as the destination.

      struct S3OutputFormatConfig
        include JSON::Serializable


        @[JSON::Field(key: "aggregationConfig")]
        getter aggregation_config : Types::AggregationConfig?

        # Indicates the file type that Amazon AppFlow places in the Amazon S3 bucket.

        @[JSON::Field(key: "fileType")]
        getter file_type : String?

        # Determines the prefix that Amazon AppFlow applies to the folder name in the Amazon S3 bucket. You
        # can name folders according to the flow frequency and date.

        @[JSON::Field(key: "prefixConfig")]
        getter prefix_config : Types::PrefixConfig?

        # If your file output format is Parquet, use this parameter to set whether Amazon AppFlow preserves
        # the data types in your source data when it writes the output to Amazon S3. true : Amazon AppFlow
        # preserves the data types when it writes to Amazon S3. For example, an integer or 1 in your source
        # data is still an integer in your output. false : Amazon AppFlow converts all of the source data into
        # strings when it writes to Amazon S3. For example, an integer of 1 in your source data becomes the
        # string "1" in the output.

        @[JSON::Field(key: "preserveSourceDataTyping")]
        getter preserve_source_data_typing : Bool?

        def initialize(
          @aggregation_config : Types::AggregationConfig? = nil,
          @file_type : String? = nil,
          @prefix_config : Types::PrefixConfig? = nil,
          @preserve_source_data_typing : Bool? = nil
        )
        end
      end

      # The properties that are applied when Amazon S3 is being used as the flow source.

      struct S3SourceProperties
        include JSON::Serializable

        # The Amazon S3 bucket name where the source files are stored.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The object key for the Amazon S3 bucket in which the source files are stored.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?


        @[JSON::Field(key: "s3InputFormatConfig")]
        getter s3_input_format_config : Types::S3InputFormatConfig?

        def initialize(
          @bucket_name : String,
          @bucket_prefix : String? = nil,
          @s3_input_format_config : Types::S3InputFormatConfig? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using SAPOData.

      struct SAPODataConnectorProfileCredentials
        include JSON::Serializable

        # The SAPOData basic authentication credentials.

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : Types::BasicAuthCredentials?

        # The SAPOData OAuth type authentication credentials.

        @[JSON::Field(key: "oAuthCredentials")]
        getter o_auth_credentials : Types::OAuthCredentials?

        def initialize(
          @basic_auth_credentials : Types::BasicAuthCredentials? = nil,
          @o_auth_credentials : Types::OAuthCredentials? = nil
        )
        end
      end

      # The connector-specific profile properties required when using SAPOData.

      struct SAPODataConnectorProfileProperties
        include JSON::Serializable

        # The location of the SAPOData resource.

        @[JSON::Field(key: "applicationHostUrl")]
        getter application_host_url : String

        # The application path to catalog service.

        @[JSON::Field(key: "applicationServicePath")]
        getter application_service_path : String

        # The client number for the client creating the connection.

        @[JSON::Field(key: "clientNumber")]
        getter client_number : String

        # The port number of the SAPOData instance.

        @[JSON::Field(key: "portNumber")]
        getter port_number : Int32

        # If you set this parameter to true , Amazon AppFlow bypasses the single sign-on (SSO) settings in
        # your SAP account when it accesses your SAP OData instance. Whether you need this option depends on
        # the types of credentials that you applied to your SAP OData connection profile. If your profile uses
        # basic authentication credentials, SAP SSO can prevent Amazon AppFlow from connecting to your account
        # with your username and password. In this case, bypassing SSO makes it possible for Amazon AppFlow to
        # connect successfully. However, if your profile uses OAuth credentials, this parameter has no affect.

        @[JSON::Field(key: "disableSSO")]
        getter disable_sso : Bool?

        # The logon language of SAPOData instance.

        @[JSON::Field(key: "logonLanguage")]
        getter logon_language : String?

        # The SAPOData OAuth properties required for OAuth type authentication.

        @[JSON::Field(key: "oAuthProperties")]
        getter o_auth_properties : Types::OAuthProperties?

        # The SAPOData Private Link service name to be used for private data transfers.

        @[JSON::Field(key: "privateLinkServiceName")]
        getter private_link_service_name : String?

        def initialize(
          @application_host_url : String,
          @application_service_path : String,
          @client_number : String,
          @port_number : Int32,
          @disable_sso : Bool? = nil,
          @logon_language : String? = nil,
          @o_auth_properties : Types::OAuthProperties? = nil,
          @private_link_service_name : String? = nil
        )
        end
      end

      # The properties that are applied when using SAPOData as a flow destination

      struct SAPODataDestinationProperties
        include JSON::Serializable

        # The object path specified in the SAPOData flow destination.

        @[JSON::Field(key: "objectPath")]
        getter object_path : String


        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?


        @[JSON::Field(key: "idFieldNames")]
        getter id_field_names : Array(String)?

        # Determines how Amazon AppFlow handles the success response that it gets from the connector after
        # placing data. For example, this setting would determine where to write the response from a
        # destination connector upon a successful insert operation.

        @[JSON::Field(key: "successResponseHandlingConfig")]
        getter success_response_handling_config : Types::SuccessResponseHandlingConfig?


        @[JSON::Field(key: "writeOperationType")]
        getter write_operation_type : String?

        def initialize(
          @object_path : String,
          @error_handling_config : Types::ErrorHandlingConfig? = nil,
          @id_field_names : Array(String)? = nil,
          @success_response_handling_config : Types::SuccessResponseHandlingConfig? = nil,
          @write_operation_type : String? = nil
        )
        end
      end

      # The connector metadata specific to SAPOData.

      struct SAPODataMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # Sets the page size for each concurrent process that transfers OData records from your SAP instance.
      # A concurrent process is query that retrieves a batch of records as part of a flow run. Amazon
      # AppFlow can run multiple concurrent processes in parallel to transfer data faster.

      struct SAPODataPaginationConfig
        include JSON::Serializable

        # The maximum number of records that Amazon AppFlow receives in each page of the response from your
        # SAP application. For transfers of OData records, the maximum page size is 3,000. For transfers of
        # data that comes from an ODP provider, the maximum page size is 10,000.

        @[JSON::Field(key: "maxPageSize")]
        getter max_page_size : Int32

        def initialize(
          @max_page_size : Int32
        )
        end
      end

      # Sets the number of concurrent processes that transfer OData records from your SAP instance. A
      # concurrent process is query that retrieves a batch of records as part of a flow run. Amazon AppFlow
      # can run multiple concurrent processes in parallel to transfer data faster.

      struct SAPODataParallelismConfig
        include JSON::Serializable

        # The maximum number of processes that Amazon AppFlow runs at the same time when it retrieves your
        # data from your SAP application.

        @[JSON::Field(key: "maxParallelism")]
        getter max_parallelism : Int32

        def initialize(
          @max_parallelism : Int32
        )
        end
      end

      # The properties that are applied when using SAPOData as a flow source.

      struct SAPODataSourceProperties
        include JSON::Serializable

        # The object path specified in the SAPOData flow source.

        @[JSON::Field(key: "objectPath")]
        getter object_path : String?

        # Sets the page size for each concurrent process that transfers OData records from your SAP instance.

        @[JSON::Field(key: "paginationConfig")]
        getter pagination_config : Types::SAPODataPaginationConfig?

        # Sets the number of concurrent processes that transfers OData records from your SAP instance.

        @[JSON::Field(key: "parallelismConfig")]
        getter parallelism_config : Types::SAPODataParallelismConfig?

        def initialize(
          @object_path : String? = nil,
          @pagination_config : Types::SAPODataPaginationConfig? = nil,
          @parallelism_config : Types::SAPODataParallelismConfig? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using Salesforce.

      struct SalesforceConnectorProfileCredentials
        include JSON::Serializable

        # The credentials used to access protected Salesforce resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The secret manager ARN, which contains the client ID and client secret of the connected app.

        @[JSON::Field(key: "clientCredentialsArn")]
        getter client_credentials_arn : String?

        # A JSON web token (JWT) that authorizes Amazon AppFlow to access your Salesforce records.

        @[JSON::Field(key: "jwtToken")]
        getter jwt_token : String?

        # Specifies the OAuth 2.0 grant type that Amazon AppFlow uses when it requests an access token from
        # Salesforce. Amazon AppFlow requires an access token each time it attempts to access your Salesforce
        # records. You can specify one of the following values: AUTHORIZATION_CODE Amazon AppFlow passes an
        # authorization code when it requests the access token from Salesforce. Amazon AppFlow receives the
        # authorization code from Salesforce after you log in to your Salesforce account and authorize Amazon
        # AppFlow to access your records. JWT_BEARER Amazon AppFlow passes a JSON web token (JWT) when it
        # requests the access token from Salesforce. You provide the JWT to Amazon AppFlow when you define the
        # connection to your Salesforce account. When you use this grant type, you don't need to log in to
        # your Salesforce account to authorize Amazon AppFlow to access your records. The CLIENT_CREDENTIALS
        # value is not supported for Salesforce.

        @[JSON::Field(key: "oAuth2GrantType")]
        getter o_auth2_grant_type : String?

        # The OAuth requirement needed to request security tokens from the connector endpoint.

        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        # The credentials used to acquire new access tokens.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        def initialize(
          @access_token : String? = nil,
          @client_credentials_arn : String? = nil,
          @jwt_token : String? = nil,
          @o_auth2_grant_type : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # The connector-specific profile properties required when using Salesforce.

      struct SalesforceConnectorProfileProperties
        include JSON::Serializable

        # The location of the Salesforce resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String?

        # Indicates whether the connector profile applies to a sandbox or production environment.

        @[JSON::Field(key: "isSandboxEnvironment")]
        getter is_sandbox_environment : Bool?

        # If the connection mode for the connector profile is private, this parameter sets whether Amazon
        # AppFlow uses the private network to send metadata and authorization calls to Salesforce. Amazon
        # AppFlow sends private calls through Amazon Web Services PrivateLink. These calls travel through
        # Amazon Web Services infrastructure without being exposed to the public internet. Set either of the
        # following values: true Amazon AppFlow sends all calls to Salesforce over the private network. These
        # private calls are: Calls to get metadata about your Salesforce records. This metadata describes your
        # Salesforce objects and their fields. Calls to get or refresh access tokens that allow Amazon AppFlow
        # to access your Salesforce records. Calls to transfer your Salesforce records as part of a flow run.
        # false The default value. Amazon AppFlow sends some calls to Salesforce privately and other calls
        # over the public internet. The public calls are: Calls to get metadata about your Salesforce records.
        # Calls to get or refresh access tokens. The private calls are: Calls to transfer your Salesforce
        # records as part of a flow run.

        @[JSON::Field(key: "usePrivateLinkForMetadataAndAuthorization")]
        getter use_private_link_for_metadata_and_authorization : Bool?

        def initialize(
          @instance_url : String? = nil,
          @is_sandbox_environment : Bool? = nil,
          @use_private_link_for_metadata_and_authorization : Bool? = nil
        )
        end
      end

      # The properties that are applied when Salesforce is being used as a destination.

      struct SalesforceDestinationProperties
        include JSON::Serializable

        # The object specified in the Salesforce flow destination.

        @[JSON::Field(key: "object")]
        getter object : String

        # Specifies which Salesforce API is used by Amazon AppFlow when your flow transfers data to
        # Salesforce. AUTOMATIC The default. Amazon AppFlow selects which API to use based on the number of
        # records that your flow transfers to Salesforce. If your flow transfers fewer than 1,000 records,
        # Amazon AppFlow uses Salesforce REST API. If your flow transfers 1,000 records or more, Amazon
        # AppFlow uses Salesforce Bulk API 2.0. Each of these Salesforce APIs structures data differently. If
        # Amazon AppFlow selects the API automatically, be aware that, for recurring flows, the data output
        # might vary from one flow run to the next. For example, if a flow runs daily, it might use REST API
        # on one day to transfer 900 records, and it might use Bulk API 2.0 on the next day to transfer 1,100
        # records. For each of these flow runs, the respective Salesforce API formats the data differently.
        # Some of the differences include how dates are formatted and null values are represented. Also, Bulk
        # API 2.0 doesn't transfer Salesforce compound fields. By choosing this option, you optimize flow
        # performance for both small and large data transfers, but the tradeoff is inconsistent formatting in
        # the output. BULKV2 Amazon AppFlow uses only Salesforce Bulk API 2.0. This API runs asynchronous data
        # transfers, and it's optimal for large sets of data. By choosing this option, you ensure that your
        # flow writes consistent output, but you optimize performance only for large data transfers. Note that
        # Bulk API 2.0 does not transfer Salesforce compound fields. REST_SYNC Amazon AppFlow uses only
        # Salesforce REST API. By choosing this option, you ensure that your flow writes consistent output,
        # but you decrease performance for large data transfers that are better suited for Bulk API 2.0. In
        # some cases, if your flow attempts to transfer a vary large set of data, it might fail with a timed
        # out error.

        @[JSON::Field(key: "dataTransferApi")]
        getter data_transfer_api : String?

        # The settings that determine how Amazon AppFlow handles an error when placing data in the Salesforce
        # destination. For example, this setting would determine if the flow should fail after one insertion
        # error, or continue and attempt to insert every record regardless of the initial failure.
        # ErrorHandlingConfig is a part of the destination connector details.

        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?

        # The name of the field that Amazon AppFlow uses as an ID when performing a write operation such as
        # update or delete.

        @[JSON::Field(key: "idFieldNames")]
        getter id_field_names : Array(String)?

        # This specifies the type of write operation to be performed in Salesforce. When the value is UPSERT ,
        # then idFieldNames is required.

        @[JSON::Field(key: "writeOperationType")]
        getter write_operation_type : String?

        def initialize(
          @object : String,
          @data_transfer_api : String? = nil,
          @error_handling_config : Types::ErrorHandlingConfig? = nil,
          @id_field_names : Array(String)? = nil,
          @write_operation_type : String? = nil
        )
        end
      end

      # The connector metadata specific to Salesforce.

      struct SalesforceMetadata
        include JSON::Serializable

        # The Salesforce APIs that you can have Amazon AppFlow use when your flows transfers data to or from
        # Salesforce.

        @[JSON::Field(key: "dataTransferApis")]
        getter data_transfer_apis : Array(String)?

        # The desired authorization scope for the Salesforce account.

        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)?

        # The OAuth 2.0 grant types that Amazon AppFlow can use when it requests an access token from
        # Salesforce. Amazon AppFlow requires an access token each time it attempts to access your Salesforce
        # records. AUTHORIZATION_CODE Amazon AppFlow passes an authorization code when it requests the access
        # token from Salesforce. Amazon AppFlow receives the authorization code from Salesforce after you log
        # in to your Salesforce account and authorize Amazon AppFlow to access your records. JWT_BEARER Amazon
        # AppFlow passes a JSON web token (JWT) when it requests the access token from Salesforce. You provide
        # the JWT to Amazon AppFlow when you define the connection to your Salesforce account. When you use
        # this grant type, you don't need to log in to your Salesforce account to authorize Amazon AppFlow to
        # access your records. The CLIENT_CREDENTIALS value is not supported for Salesforce.

        @[JSON::Field(key: "oauth2GrantTypesSupported")]
        getter oauth2_grant_types_supported : Array(String)?

        def initialize(
          @data_transfer_apis : Array(String)? = nil,
          @o_auth_scopes : Array(String)? = nil,
          @oauth2_grant_types_supported : Array(String)? = nil
        )
        end
      end

      # The properties that are applied when Salesforce is being used as a source.

      struct SalesforceSourceProperties
        include JSON::Serializable

        # The object specified in the Salesforce flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        # Specifies which Salesforce API is used by Amazon AppFlow when your flow transfers data from
        # Salesforce. AUTOMATIC The default. Amazon AppFlow selects which API to use based on the number of
        # records that your flow transfers from Salesforce. If your flow transfers fewer than 1,000,000
        # records, Amazon AppFlow uses Salesforce REST API. If your flow transfers 1,000,000 records or more,
        # Amazon AppFlow uses Salesforce Bulk API 2.0. Each of these Salesforce APIs structures data
        # differently. If Amazon AppFlow selects the API automatically, be aware that, for recurring flows,
        # the data output might vary from one flow run to the next. For example, if a flow runs daily, it
        # might use REST API on one day to transfer 900,000 records, and it might use Bulk API 2.0 on the next
        # day to transfer 1,100,000 records. For each of these flow runs, the respective Salesforce API
        # formats the data differently. Some of the differences include how dates are formatted and null
        # values are represented. Also, Bulk API 2.0 doesn't transfer Salesforce compound fields. By choosing
        # this option, you optimize flow performance for both small and large data transfers, but the tradeoff
        # is inconsistent formatting in the output. BULKV2 Amazon AppFlow uses only Salesforce Bulk API 2.0.
        # This API runs asynchronous data transfers, and it's optimal for large sets of data. By choosing this
        # option, you ensure that your flow writes consistent output, but you optimize performance only for
        # large data transfers. Note that Bulk API 2.0 does not transfer Salesforce compound fields. REST_SYNC
        # Amazon AppFlow uses only Salesforce REST API. By choosing this option, you ensure that your flow
        # writes consistent output, but you decrease performance for large data transfers that are better
        # suited for Bulk API 2.0. In some cases, if your flow attempts to transfer a vary large set of data,
        # it might fail wituh a timed out error.

        @[JSON::Field(key: "dataTransferApi")]
        getter data_transfer_api : String?

        # The flag that enables dynamic fetching of new (recently added) fields in the Salesforce objects
        # while running a flow.

        @[JSON::Field(key: "enableDynamicFieldUpdate")]
        getter enable_dynamic_field_update : Bool?

        # Indicates whether Amazon AppFlow includes deleted files in the flow run.

        @[JSON::Field(key: "includeDeletedRecords")]
        getter include_deleted_records : Bool?

        def initialize(
          @object : String,
          @data_transfer_api : String? = nil,
          @enable_dynamic_field_update : Bool? = nil,
          @include_deleted_records : Bool? = nil
        )
        end
      end

      # Specifies the configuration details of a schedule-triggered flow as defined by the user. Currently,
      # these settings only apply to the Scheduled trigger type.

      struct ScheduledTriggerProperties
        include JSON::Serializable

        # The scheduling expression that determines the rate at which the schedule will run, for example
        # rate(5minutes) .

        @[JSON::Field(key: "scheduleExpression")]
        getter schedule_expression : String

        # Specifies whether a scheduled flow has an incremental data transfer or a complete data transfer for
        # each flow run.

        @[JSON::Field(key: "dataPullMode")]
        getter data_pull_mode : String?

        # Specifies the date range for the records to import from the connector in the first flow run.

        @[JSON::Field(key: "firstExecutionFrom")]
        getter first_execution_from : Time?

        # Defines how many times a scheduled flow fails consecutively before Amazon AppFlow deactivates it.

        @[JSON::Field(key: "flowErrorDeactivationThreshold")]
        getter flow_error_deactivation_threshold : Int32?

        # The time at which the scheduled flow ends. The time is formatted as a timestamp that follows the ISO
        # 8601 standard, such as 2022-04-27T13:00:00-07:00 .

        @[JSON::Field(key: "scheduleEndTime")]
        getter schedule_end_time : Time?

        # Specifies the optional offset that is added to the time interval for a schedule-triggered flow.

        @[JSON::Field(key: "scheduleOffset")]
        getter schedule_offset : Int64?

        # The time at which the scheduled flow starts. The time is formatted as a timestamp that follows the
        # ISO 8601 standard, such as 2022-04-26T13:00:00-07:00 .

        @[JSON::Field(key: "scheduleStartTime")]
        getter schedule_start_time : Time?

        # Specifies the time zone used when referring to the dates and times of a scheduled flow, such as
        # America/New_York . This time zone is only a descriptive label. It doesn't affect how Amazon AppFlow
        # interprets the timestamps that you specify to schedule the flow. If you want to schedule a flow by
        # using times in a particular time zone, indicate the time zone as a UTC offset in your timestamps.
        # For example, the UTC offsets for the America/New_York timezone are -04:00 EDT and -05:00 EST .

        @[JSON::Field(key: "timezone")]
        getter timezone : String?

        def initialize(
          @schedule_expression : String,
          @data_pull_mode : String? = nil,
          @first_execution_from : Time? = nil,
          @flow_error_deactivation_threshold : Int32? = nil,
          @schedule_end_time : Time? = nil,
          @schedule_offset : Int64? = nil,
          @schedule_start_time : Time? = nil,
          @timezone : String? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using ServiceNow.

      struct ServiceNowConnectorProfileCredentials
        include JSON::Serializable

        # The OAuth 2.0 credentials required to authenticate the user.

        @[JSON::Field(key: "oAuth2Credentials")]
        getter o_auth2_credentials : Types::OAuth2Credentials?

        # The password that corresponds to the user name.

        @[JSON::Field(key: "password")]
        getter password : String?

        # The name of the user.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @o_auth2_credentials : Types::OAuth2Credentials? = nil,
          @password : String? = nil,
          @username : String? = nil
        )
        end
      end

      # The connector-specific profile properties required when using ServiceNow.

      struct ServiceNowConnectorProfileProperties
        include JSON::Serializable

        # The location of the ServiceNow resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The connector metadata specific to ServiceNow.

      struct ServiceNowMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when ServiceNow is being used as a source.

      struct ServiceNowSourceProperties
        include JSON::Serializable

        # The object specified in the ServiceNow flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The request would cause a service quota (such as the number of flows) to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using Singular.

      struct SingularConnectorProfileCredentials
        include JSON::Serializable

        # A unique alphanumeric identifier used to authenticate a user, developer, or calling program to your
        # API.

        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        def initialize(
          @api_key : String
        )
        end
      end

      # The connector-specific profile properties required when using Singular.

      struct SingularConnectorProfileProperties
        include JSON::Serializable

        def initialize
        end
      end

      # The connector metadata specific to Singular.

      struct SingularMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when Singular is being used as a source.

      struct SingularSourceProperties
        include JSON::Serializable

        # The object specified in the Singular flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The connector-specific profile credentials required when using Slack.

      struct SlackConnectorProfileCredentials
        include JSON::Serializable

        # The identifier for the client.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret used by the OAuth client to authenticate to the authorization server.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # The credentials used to access protected Slack resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The OAuth requirement needed to request security tokens from the connector endpoint.

        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @access_token : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil
        )
        end
      end

      # The connector-specific profile properties required when using Slack.

      struct SlackConnectorProfileProperties
        include JSON::Serializable

        # The location of the Slack resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The connector metadata specific to Slack.

      struct SlackMetadata
        include JSON::Serializable

        # The desired authorization scope for the Slack account.

        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)?

        def initialize(
          @o_auth_scopes : Array(String)? = nil
        )
        end
      end

      # The properties that are applied when Slack is being used as a source.

      struct SlackSourceProperties
        include JSON::Serializable

        # The object specified in the Slack flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The connector-specific profile credentials required when using Snowflake.

      struct SnowflakeConnectorProfileCredentials
        include JSON::Serializable

        # The password that corresponds to the user name.

        @[JSON::Field(key: "password")]
        getter password : String

        # The name of the user.

        @[JSON::Field(key: "username")]
        getter username : String

        def initialize(
          @password : String,
          @username : String
        )
        end
      end

      # The connector-specific profile properties required when using Snowflake.

      struct SnowflakeConnectorProfileProperties
        include JSON::Serializable

        # The name of the Amazon S3 bucket associated with Snowflake.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The name of the Amazon S3 stage that was created while setting up an Amazon S3 stage in the
        # Snowflake account. This is written in the following format: &lt; Database&gt;&lt;
        # Schema&gt;&lt;Stage Name&gt;.

        @[JSON::Field(key: "stage")]
        getter stage : String

        # The name of the Snowflake warehouse.

        @[JSON::Field(key: "warehouse")]
        getter warehouse : String

        # The name of the account.

        @[JSON::Field(key: "accountName")]
        getter account_name : String?

        # The bucket path that refers to the Amazon S3 bucket associated with Snowflake.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?

        # The Snowflake Private Link service name to be used for private data transfers.

        @[JSON::Field(key: "privateLinkServiceName")]
        getter private_link_service_name : String?

        # The Amazon Web Services Region of the Snowflake account.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @bucket_name : String,
          @stage : String,
          @warehouse : String,
          @account_name : String? = nil,
          @bucket_prefix : String? = nil,
          @private_link_service_name : String? = nil,
          @region : String? = nil
        )
        end
      end

      # The properties that are applied when Snowflake is being used as a destination.

      struct SnowflakeDestinationProperties
        include JSON::Serializable

        # The intermediate bucket that Amazon AppFlow uses when moving data into Snowflake.

        @[JSON::Field(key: "intermediateBucketName")]
        getter intermediate_bucket_name : String

        # The object specified in the Snowflake flow destination.

        @[JSON::Field(key: "object")]
        getter object : String

        # The object key for the destination bucket in which Amazon AppFlow places the files.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?

        # The settings that determine how Amazon AppFlow handles an error when placing data in the Snowflake
        # destination. For example, this setting would determine if the flow should fail after one insertion
        # error, or continue and attempt to insert every record regardless of the initial failure.
        # ErrorHandlingConfig is a part of the destination connector details.

        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?

        def initialize(
          @intermediate_bucket_name : String,
          @object : String,
          @bucket_prefix : String? = nil,
          @error_handling_config : Types::ErrorHandlingConfig? = nil
        )
        end
      end

      # The connector metadata specific to Snowflake.

      struct SnowflakeMetadata
        include JSON::Serializable

        # Specifies the supported Amazon Web Services Regions when using Snowflake.

        @[JSON::Field(key: "supportedRegions")]
        getter supported_regions : Array(String)?

        def initialize(
          @supported_regions : Array(String)? = nil
        )
        end
      end

      # Specifies the information that is required to query a particular connector.

      struct SourceConnectorProperties
        include JSON::Serializable

        # Specifies the information that is required for querying Amplitude.

        @[JSON::Field(key: "Amplitude")]
        getter amplitude : Types::AmplitudeSourceProperties?


        @[JSON::Field(key: "CustomConnector")]
        getter custom_connector : Types::CustomConnectorSourceProperties?

        # Specifies the information that is required for querying Datadog.

        @[JSON::Field(key: "Datadog")]
        getter datadog : Types::DatadogSourceProperties?

        # Specifies the information that is required for querying Dynatrace.

        @[JSON::Field(key: "Dynatrace")]
        getter dynatrace : Types::DynatraceSourceProperties?

        # Specifies the information that is required for querying Google Analytics.

        @[JSON::Field(key: "GoogleAnalytics")]
        getter google_analytics : Types::GoogleAnalyticsSourceProperties?

        # Specifies the information that is required for querying Infor Nexus.

        @[JSON::Field(key: "InforNexus")]
        getter infor_nexus : Types::InforNexusSourceProperties?

        # Specifies the information that is required for querying Marketo.

        @[JSON::Field(key: "Marketo")]
        getter marketo : Types::MarketoSourceProperties?

        # Specifies the information that is required for querying Salesforce Pardot.

        @[JSON::Field(key: "Pardot")]
        getter pardot : Types::PardotSourceProperties?

        # Specifies the information that is required for querying Amazon S3.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3SourceProperties?


        @[JSON::Field(key: "SAPOData")]
        getter sapo_data : Types::SAPODataSourceProperties?

        # Specifies the information that is required for querying Salesforce.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : Types::SalesforceSourceProperties?

        # Specifies the information that is required for querying ServiceNow.

        @[JSON::Field(key: "ServiceNow")]
        getter service_now : Types::ServiceNowSourceProperties?

        # Specifies the information that is required for querying Singular.

        @[JSON::Field(key: "Singular")]
        getter singular : Types::SingularSourceProperties?

        # Specifies the information that is required for querying Slack.

        @[JSON::Field(key: "Slack")]
        getter slack : Types::SlackSourceProperties?

        # Specifies the information that is required for querying Trend Micro.

        @[JSON::Field(key: "Trendmicro")]
        getter trendmicro : Types::TrendmicroSourceProperties?

        # Specifies the information that is required for querying Veeva.

        @[JSON::Field(key: "Veeva")]
        getter veeva : Types::VeevaSourceProperties?

        # Specifies the information that is required for querying Zendesk.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : Types::ZendeskSourceProperties?

        def initialize(
          @amplitude : Types::AmplitudeSourceProperties? = nil,
          @custom_connector : Types::CustomConnectorSourceProperties? = nil,
          @datadog : Types::DatadogSourceProperties? = nil,
          @dynatrace : Types::DynatraceSourceProperties? = nil,
          @google_analytics : Types::GoogleAnalyticsSourceProperties? = nil,
          @infor_nexus : Types::InforNexusSourceProperties? = nil,
          @marketo : Types::MarketoSourceProperties? = nil,
          @pardot : Types::PardotSourceProperties? = nil,
          @s3 : Types::S3SourceProperties? = nil,
          @sapo_data : Types::SAPODataSourceProperties? = nil,
          @salesforce : Types::SalesforceSourceProperties? = nil,
          @service_now : Types::ServiceNowSourceProperties? = nil,
          @singular : Types::SingularSourceProperties? = nil,
          @slack : Types::SlackSourceProperties? = nil,
          @trendmicro : Types::TrendmicroSourceProperties? = nil,
          @veeva : Types::VeevaSourceProperties? = nil,
          @zendesk : Types::ZendeskSourceProperties? = nil
        )
        end
      end

      # The properties that can be applied to a field when the connector is being used as a source.

      struct SourceFieldProperties
        include JSON::Serializable

        # Indicates if the field can be queried.

        @[JSON::Field(key: "isQueryable")]
        getter is_queryable : Bool?

        # Indicates whether the field can be returned in a search result.

        @[JSON::Field(key: "isRetrievable")]
        getter is_retrievable : Bool?

        # Indicates if this timestamp field can be used for incremental queries.

        @[JSON::Field(key: "isTimestampFieldForIncrementalQueries")]
        getter is_timestamp_field_for_incremental_queries : Bool?

        def initialize(
          @is_queryable : Bool? = nil,
          @is_retrievable : Bool? = nil,
          @is_timestamp_field_for_incremental_queries : Bool? = nil
        )
        end
      end

      # Contains information about the configuration of the source connector used in the flow.

      struct SourceFlowConfig
        include JSON::Serializable

        # The type of connector, such as Salesforce, Amplitude, and so on.

        @[JSON::Field(key: "connectorType")]
        getter connector_type : String

        # Specifies the information that is required to query a particular source connector.

        @[JSON::Field(key: "sourceConnectorProperties")]
        getter source_connector_properties : Types::SourceConnectorProperties

        # The API version of the connector when it's used as a source in the flow.

        @[JSON::Field(key: "apiVersion")]
        getter api_version : String?

        # The name of the connector profile. This name must be unique for each connector profile in the Amazon
        # Web Services account.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String?

        # Defines the configuration for a scheduled incremental data pull. If a valid configuration is
        # provided, the fields specified in the configuration are used when querying for the incremental data
        # pull.

        @[JSON::Field(key: "incrementalPullConfig")]
        getter incremental_pull_config : Types::IncrementalPullConfig?

        def initialize(
          @connector_type : String,
          @source_connector_properties : Types::SourceConnectorProperties,
          @api_version : String? = nil,
          @connector_profile_name : String? = nil,
          @incremental_pull_config : Types::IncrementalPullConfig? = nil
        )
        end
      end


      struct StartFlowRequest
        include JSON::Serializable

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # The clientToken parameter is an idempotency token. It ensures that your StartFlow request completes
        # only once. You choose the value to pass. For example, if you don't receive a response from your
        # request, you can safely retry the request with the same clientToken parameter value. If you omit a
        # clientToken value, the Amazon Web Services SDK that you are using inserts a value for you. This way,
        # the SDK can safely retry requests multiple times after a network error. You must provide your own
        # value for other use cases. If you specify input parameters that differ from your first request, an
        # error occurs for flows that run on a schedule or based on an event. However, the error doesn't occur
        # for flows that run on demand. You set the conditions that initiate your flow for the triggerConfig
        # parameter. If you use a different value for clientToken , Amazon AppFlow considers it a new call to
        # StartFlow . The token is active for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @flow_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct StartFlowResponse
        include JSON::Serializable

        # Returns the internal execution ID of an on-demand flow when the flow is started. For scheduled or
        # event-triggered flows, this value is null.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # The flow's Amazon Resource Name (ARN).

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # Indicates the current status of the flow.

        @[JSON::Field(key: "flowStatus")]
        getter flow_status : String?

        def initialize(
          @execution_id : String? = nil,
          @flow_arn : String? = nil,
          @flow_status : String? = nil
        )
        end
      end


      struct StopFlowRequest
        include JSON::Serializable

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        def initialize(
          @flow_name : String
        )
        end
      end


      struct StopFlowResponse
        include JSON::Serializable

        # The flow's Amazon Resource Name (ARN).

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # Indicates the current status of the flow.

        @[JSON::Field(key: "flowStatus")]
        getter flow_status : String?

        def initialize(
          @flow_arn : String? = nil,
          @flow_status : String? = nil
        )
        end
      end

      # Determines how Amazon AppFlow handles the success response that it gets from the connector after
      # placing data. For example, this setting would determine where to write the response from the
      # destination connector upon a successful insert operation.

      struct SuccessResponseHandlingConfig
        include JSON::Serializable

        # The name of the Amazon S3 bucket.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # The Amazon S3 bucket prefix.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @bucket_prefix : String? = nil
        )
        end
      end

      # Contains details regarding all the supported FieldTypes and their corresponding filterOperators and
      # supportedValues .

      struct SupportedFieldTypeDetails
        include JSON::Serializable

        # The initial supported version for fieldType . If this is later changed to a different version, v2
        # will be introduced.

        @[JSON::Field(key: "v1")]
        getter v1 : Types::FieldTypeDetails

        def initialize(
          @v1 : Types::FieldTypeDetails
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that you want to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags used to organize, track, or control access for your flow.

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

      # A class for modeling different type of tasks. Task implementation varies based on the TaskType .

      struct Task
        include JSON::Serializable

        # The source fields to which a particular task is applied.

        @[JSON::Field(key: "sourceFields")]
        getter source_fields : Array(String)

        # Specifies the particular task implementation that Amazon AppFlow performs.

        @[JSON::Field(key: "taskType")]
        getter task_type : String

        # The operation to be performed on the provided source fields.

        @[JSON::Field(key: "connectorOperator")]
        getter connector_operator : Types::ConnectorOperator?

        # A field in a destination connector, or a field value against which Amazon AppFlow validates a source
        # field.

        @[JSON::Field(key: "destinationField")]
        getter destination_field : String?

        # A map used to store task-related information. The execution service looks for particular information
        # based on the TaskType .

        @[JSON::Field(key: "taskProperties")]
        getter task_properties : Hash(String, String)?

        def initialize(
          @source_fields : Array(String),
          @task_type : String,
          @connector_operator : Types::ConnectorOperator? = nil,
          @destination_field : String? = nil,
          @task_properties : Hash(String, String)? = nil
        )
        end
      end

      # API calls have exceeded the maximum allowed API request rate per account and per Region.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using Trend Micro.

      struct TrendmicroConnectorProfileCredentials
        include JSON::Serializable

        # The Secret Access Key portion of the credentials.

        @[JSON::Field(key: "apiSecretKey")]
        getter api_secret_key : String

        def initialize(
          @api_secret_key : String
        )
        end
      end

      # The connector-specific profile properties required when using Trend Micro.

      struct TrendmicroConnectorProfileProperties
        include JSON::Serializable

        def initialize
        end
      end

      # The connector metadata specific to Trend Micro.

      struct TrendmicroMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when using Trend Micro as a flow source.

      struct TrendmicroSourceProperties
        include JSON::Serializable

        # The object specified in the Trend Micro flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The trigger settings that determine how and when Amazon AppFlow runs the specified flow.

      struct TriggerConfig
        include JSON::Serializable

        # Specifies the type of flow trigger. This can be OnDemand , Scheduled , or Event .

        @[JSON::Field(key: "triggerType")]
        getter trigger_type : String

        # Specifies the configuration details of a schedule-triggered flow as defined by the user. Currently,
        # these settings only apply to the Scheduled trigger type.

        @[JSON::Field(key: "triggerProperties")]
        getter trigger_properties : Types::TriggerProperties?

        def initialize(
          @trigger_type : String,
          @trigger_properties : Types::TriggerProperties? = nil
        )
        end
      end

      # Specifies the configuration details that control the trigger for a flow. Currently, these settings
      # only apply to the Scheduled trigger type.

      struct TriggerProperties
        include JSON::Serializable

        # Specifies the configuration details of a schedule-triggered flow as defined by the user.

        @[JSON::Field(key: "Scheduled")]
        getter scheduled : Types::ScheduledTriggerProperties?

        def initialize(
          @scheduled : Types::ScheduledTriggerProperties? = nil
        )
        end
      end


      struct UnregisterConnectorRequest
        include JSON::Serializable

        # The label of the connector. The label is unique for each ConnectorRegistration in your Amazon Web
        # Services account.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String

        # Indicates whether Amazon AppFlow should unregister the connector, even if it is currently in use in
        # one or more connector profiles. The default value is false.

        @[JSON::Field(key: "forceDelete")]
        getter force_delete : Bool?

        def initialize(
          @connector_label : String,
          @force_delete : Bool? = nil
        )
        end
      end


      struct UnregisterConnectorResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation is not supported for the current flow.

      struct UnsupportedOperationException
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

        # The Amazon Resource Name (ARN) of the flow that you want to untag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys associated with the tag that you want to remove from your flow.

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


      struct UpdateConnectorProfileRequest
        include JSON::Serializable

        # Indicates the connection mode and if it is public or private.

        @[JSON::Field(key: "connectionMode")]
        getter connection_mode : String

        # Defines the connector-specific profile configuration and credentials.

        @[JSON::Field(key: "connectorProfileConfig")]
        getter connector_profile_config : Types::ConnectorProfileConfig

        # The name of the connector profile and is unique for each ConnectorProfile in the Amazon Web Services
        # account.

        @[JSON::Field(key: "connectorProfileName")]
        getter connector_profile_name : String

        # The clientToken parameter is an idempotency token. It ensures that your UpdateConnectorProfile
        # request completes only once. You choose the value to pass. For example, if you don't receive a
        # response from your request, you can safely retry the request with the same clientToken parameter
        # value. If you omit a clientToken value, the Amazon Web Services SDK that you are using inserts a
        # value for you. This way, the SDK can safely retry requests multiple times after a network error. You
        # must provide your own value for other use cases. If you specify input parameters that differ from
        # your first request, an error occurs. If you use a different value for clientToken , Amazon AppFlow
        # considers it a new call to UpdateConnectorProfile . The token is active for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @connection_mode : String,
          @connector_profile_config : Types::ConnectorProfileConfig,
          @connector_profile_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateConnectorProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector profile.

        @[JSON::Field(key: "connectorProfileArn")]
        getter connector_profile_arn : String?

        def initialize(
          @connector_profile_arn : String? = nil
        )
        end
      end


      struct UpdateConnectorRegistrationRequest
        include JSON::Serializable

        # The name of the connector. The name is unique for each connector registration in your AWS account.

        @[JSON::Field(key: "connectorLabel")]
        getter connector_label : String

        # The clientToken parameter is an idempotency token. It ensures that your UpdateConnectorRegistration
        # request completes only once. You choose the value to pass. For example, if you don't receive a
        # response from your request, you can safely retry the request with the same clientToken parameter
        # value. If you omit a clientToken value, the Amazon Web Services SDK that you are using inserts a
        # value for you. This way, the SDK can safely retry requests multiple times after a network error. You
        # must provide your own value for other use cases. If you specify input parameters that differ from
        # your first request, an error occurs. If you use a different value for clientToken , Amazon AppFlow
        # considers it a new call to UpdateConnectorRegistration . The token is active for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "connectorProvisioningConfig")]
        getter connector_provisioning_config : Types::ConnectorProvisioningConfig?

        # A description about the update that you're applying to the connector.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @connector_label : String,
          @client_token : String? = nil,
          @connector_provisioning_config : Types::ConnectorProvisioningConfig? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateConnectorRegistrationResponse
        include JSON::Serializable

        # The ARN of the connector being updated.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        def initialize(
          @connector_arn : String? = nil
        )
        end
      end


      struct UpdateFlowRequest
        include JSON::Serializable

        # The configuration that controls how Amazon AppFlow transfers data to the destination connector.

        @[JSON::Field(key: "destinationFlowConfigList")]
        getter destination_flow_config_list : Array(Types::DestinationFlowConfig)

        # The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String


        @[JSON::Field(key: "sourceFlowConfig")]
        getter source_flow_config : Types::SourceFlowConfig

        # A list of tasks that Amazon AppFlow performs while transferring the data in the flow run.

        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::Task)

        # The trigger settings that determine how and when the flow runs.

        @[JSON::Field(key: "triggerConfig")]
        getter trigger_config : Types::TriggerConfig

        # The clientToken parameter is an idempotency token. It ensures that your UpdateFlow request completes
        # only once. You choose the value to pass. For example, if you don't receive a response from your
        # request, you can safely retry the request with the same clientToken parameter value. If you omit a
        # clientToken value, the Amazon Web Services SDK that you are using inserts a value for you. This way,
        # the SDK can safely retry requests multiple times after a network error. You must provide your own
        # value for other use cases. If you specify input parameters that differ from your first request, an
        # error occurs. If you use a different value for clientToken , Amazon AppFlow considers it a new call
        # to UpdateFlow . The token is active for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the configuration that Amazon AppFlow uses when it catalogs the data that's transferred by
        # the associated flow. When Amazon AppFlow catalogs the data from a flow, it stores metadata in a data
        # catalog.

        @[JSON::Field(key: "metadataCatalogConfig")]
        getter metadata_catalog_config : Types::MetadataCatalogConfig?

        def initialize(
          @destination_flow_config_list : Array(Types::DestinationFlowConfig),
          @flow_name : String,
          @source_flow_config : Types::SourceFlowConfig,
          @tasks : Array(Types::Task),
          @trigger_config : Types::TriggerConfig,
          @client_token : String? = nil,
          @description : String? = nil,
          @metadata_catalog_config : Types::MetadataCatalogConfig? = nil
        )
        end
      end


      struct UpdateFlowResponse
        include JSON::Serializable

        # Indicates the current status of the flow.

        @[JSON::Field(key: "flowStatus")]
        getter flow_status : String?

        def initialize(
          @flow_status : String? = nil
        )
        end
      end

      # The properties that are applied when Upsolver is used as a destination.

      struct UpsolverDestinationProperties
        include JSON::Serializable

        # The Upsolver Amazon S3 bucket name in which Amazon AppFlow places the transferred data.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The configuration that determines how data is formatted when Upsolver is used as the flow
        # destination.

        @[JSON::Field(key: "s3OutputFormatConfig")]
        getter s3_output_format_config : Types::UpsolverS3OutputFormatConfig

        # The object key for the destination Upsolver Amazon S3 bucket in which Amazon AppFlow places the
        # files.

        @[JSON::Field(key: "bucketPrefix")]
        getter bucket_prefix : String?

        def initialize(
          @bucket_name : String,
          @s3_output_format_config : Types::UpsolverS3OutputFormatConfig,
          @bucket_prefix : String? = nil
        )
        end
      end

      # The connector metadata specific to Upsolver.

      struct UpsolverMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration that determines how Amazon AppFlow formats the flow output data when Upsolver is
      # used as the destination.

      struct UpsolverS3OutputFormatConfig
        include JSON::Serializable


        @[JSON::Field(key: "prefixConfig")]
        getter prefix_config : Types::PrefixConfig


        @[JSON::Field(key: "aggregationConfig")]
        getter aggregation_config : Types::AggregationConfig?

        # Indicates the file type that Amazon AppFlow places in the Upsolver Amazon S3 bucket.

        @[JSON::Field(key: "fileType")]
        getter file_type : String?

        def initialize(
          @prefix_config : Types::PrefixConfig,
          @aggregation_config : Types::AggregationConfig? = nil,
          @file_type : String? = nil
        )
        end
      end

      # The request has invalid or missing parameters.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using Veeva.

      struct VeevaConnectorProfileCredentials
        include JSON::Serializable

        # The password that corresponds to the user name.

        @[JSON::Field(key: "password")]
        getter password : String

        # The name of the user.

        @[JSON::Field(key: "username")]
        getter username : String

        def initialize(
          @password : String,
          @username : String
        )
        end
      end

      # The connector-specific profile properties required when using Veeva.

      struct VeevaConnectorProfileProperties
        include JSON::Serializable

        # The location of the Veeva resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The connector metadata specific to Veeva.

      struct VeevaMetadata
        include JSON::Serializable

        def initialize
        end
      end

      # The properties that are applied when using Veeva as a flow source.

      struct VeevaSourceProperties
        include JSON::Serializable

        # The object specified in the Veeva flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        # The document type specified in the Veeva document extract flow.

        @[JSON::Field(key: "documentType")]
        getter document_type : String?

        # Boolean value to include All Versions of files in Veeva document extract flow.

        @[JSON::Field(key: "includeAllVersions")]
        getter include_all_versions : Bool?

        # Boolean value to include file renditions in Veeva document extract flow.

        @[JSON::Field(key: "includeRenditions")]
        getter include_renditions : Bool?

        # Boolean value to include source files in Veeva document extract flow.

        @[JSON::Field(key: "includeSourceFiles")]
        getter include_source_files : Bool?

        def initialize(
          @object : String,
          @document_type : String? = nil,
          @include_all_versions : Bool? = nil,
          @include_renditions : Bool? = nil,
          @include_source_files : Bool? = nil
        )
        end
      end

      # The connector-specific profile credentials required when using Zendesk.

      struct ZendeskConnectorProfileCredentials
        include JSON::Serializable

        # The identifier for the desired client.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret used by the OAuth client to authenticate to the authorization server.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # The credentials used to access protected Zendesk resources.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The OAuth requirement needed to request security tokens from the connector endpoint.

        @[JSON::Field(key: "oAuthRequest")]
        getter o_auth_request : Types::ConnectorOAuthRequest?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @access_token : String? = nil,
          @o_auth_request : Types::ConnectorOAuthRequest? = nil
        )
        end
      end

      # The connector-specific profile properties required when using Zendesk.

      struct ZendeskConnectorProfileProperties
        include JSON::Serializable

        # The location of the Zendesk resource.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @instance_url : String
        )
        end
      end

      # The properties that are applied when Zendesk is used as a destination.

      struct ZendeskDestinationProperties
        include JSON::Serializable

        # The object specified in the Zendesk flow destination.

        @[JSON::Field(key: "object")]
        getter object : String


        @[JSON::Field(key: "errorHandlingConfig")]
        getter error_handling_config : Types::ErrorHandlingConfig?


        @[JSON::Field(key: "idFieldNames")]
        getter id_field_names : Array(String)?


        @[JSON::Field(key: "writeOperationType")]
        getter write_operation_type : String?

        def initialize(
          @object : String,
          @error_handling_config : Types::ErrorHandlingConfig? = nil,
          @id_field_names : Array(String)? = nil,
          @write_operation_type : String? = nil
        )
        end
      end

      # The connector metadata specific to Zendesk.

      struct ZendeskMetadata
        include JSON::Serializable

        # The desired authorization scope for the Zendesk account.

        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)?

        def initialize(
          @o_auth_scopes : Array(String)? = nil
        )
        end
      end

      # The properties that are applied when using Zendesk as a flow source.

      struct ZendeskSourceProperties
        include JSON::Serializable

        # The object specified in the Zendesk flow source.

        @[JSON::Field(key: "object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end
    end
  end
end
