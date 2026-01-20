require "json"
require "time"

module Aws
  module Greengrass
    module Types


      struct AssociateRoleToGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The ARN of the role you wish to associate with this group. The existence of the role is not
        # validated.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @group_id : String,
          @role_arn : String
        )
        end
      end


      struct AssociateRoleToGroupResponse
        include JSON::Serializable

        # The time, in milliseconds since the epoch, when the role ARN was associated with the group.

        @[JSON::Field(key: "AssociatedAt")]
        getter associated_at : String?

        def initialize(
          @associated_at : String? = nil
        )
        end
      end


      struct AssociateServiceRoleToAccountRequest
        include JSON::Serializable

        # The ARN of the service role you wish to associate with your account.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end


      struct AssociateServiceRoleToAccountResponse
        include JSON::Serializable

        # The time when the service role was associated with the account.

        @[JSON::Field(key: "AssociatedAt")]
        getter associated_at : String?

        def initialize(
          @associated_at : String? = nil
        )
        end
      end

      # General error information.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetail)?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_details : Array(Types::ErrorDetail)? = nil,
          @message : String? = nil
        )
        end
      end

      # Information about a bulk deployment. You cannot start a new bulk deployment while another one is
      # still running or in a non-terminal state.

      struct BulkDeployment
        include JSON::Serializable

        # The ARN of the bulk deployment.

        @[JSON::Field(key: "BulkDeploymentArn")]
        getter bulk_deployment_arn : String?

        # The ID of the bulk deployment.

        @[JSON::Field(key: "BulkDeploymentId")]
        getter bulk_deployment_id : String?

        # The time, in ISO format, when the deployment was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : String?

        def initialize(
          @bulk_deployment_arn : String? = nil,
          @bulk_deployment_id : String? = nil,
          @created_at : String? = nil
        )
        end
      end

      # Relevant metrics on input records processed during bulk deployment.

      struct BulkDeploymentMetrics
        include JSON::Serializable

        # The total number of records that returned a non-retryable error. For example, this can occur if a
        # group record from the input file uses an invalid format or specifies a nonexistent group version, or
        # if the execution role doesn't grant permission to deploy a group or group version.

        @[JSON::Field(key: "InvalidInputRecords")]
        getter invalid_input_records : Int32?

        # The total number of group records from the input file that have been processed so far, or attempted.

        @[JSON::Field(key: "RecordsProcessed")]
        getter records_processed : Int32?

        # The total number of deployment attempts that returned a retryable error. For example, a retry is
        # triggered if the attempt to deploy a group returns a throttling error. ''StartBulkDeployment''
        # retries a group deployment up to five times.

        @[JSON::Field(key: "RetryAttempts")]
        getter retry_attempts : Int32?

        def initialize(
          @invalid_input_records : Int32? = nil,
          @records_processed : Int32? = nil,
          @retry_attempts : Int32? = nil
        )
        end
      end

      # Information about an individual group deployment in a bulk deployment operation.

      struct BulkDeploymentResult
        include JSON::Serializable

        # The time, in ISO format, when the deployment was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : String?

        # The ARN of the group deployment.

        @[JSON::Field(key: "DeploymentArn")]
        getter deployment_arn : String?

        # The ID of the group deployment.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String?

        # The current status of the group deployment: ''InProgress'', ''Building'', ''Success'', or
        # ''Failure''.

        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # The type of the deployment.

        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # Details about the error.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetail)?

        # The error message for a failed deployment

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ARN of the Greengrass group.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String?

        def initialize(
          @created_at : String? = nil,
          @deployment_arn : String? = nil,
          @deployment_id : String? = nil,
          @deployment_status : String? = nil,
          @deployment_type : String? = nil,
          @error_details : Array(Types::ErrorDetail)? = nil,
          @error_message : String? = nil,
          @group_arn : String? = nil
        )
        end
      end

      # Information about a Greengrass core's connectivity.

      struct ConnectivityInfo
        include JSON::Serializable

        # The endpoint for the Greengrass core. Can be an IP address or DNS.

        @[JSON::Field(key: "HostAddress")]
        getter host_address : String?

        # The ID of the connectivity information.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Metadata for this endpoint.

        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The port of the Greengrass core. Usually 8883.

        @[JSON::Field(key: "PortNumber")]
        getter port_number : Int32?

        def initialize(
          @host_address : String? = nil,
          @id : String? = nil,
          @metadata : String? = nil,
          @port_number : Int32? = nil
        )
        end
      end

      # Information about a connector. Connectors run on the Greengrass core and contain built-in
      # integration with local infrastructure, device protocols, AWS, and other cloud services.

      struct Connector
        include JSON::Serializable

        # The ARN of the connector.

        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # A descriptive or arbitrary ID for the connector. This value must be unique within the connector
        # definition version. Max length is 128 characters with pattern [a-zA-Z0-9:_-]+.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The parameters or configuration that the connector uses.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @connector_arn : String,
          @id : String,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # Information about the connector definition version, which is a container for connectors.

      struct ConnectorDefinitionVersion
        include JSON::Serializable

        # A list of references to connectors in this version, with their corresponding configuration settings.

        @[JSON::Field(key: "Connectors")]
        getter connectors : Array(Types::Connector)?

        def initialize(
          @connectors : Array(Types::Connector)? = nil
        )
        end
      end

      # Information about a core.

      struct Core
        include JSON::Serializable

        # The ARN of the certificate associated with the core.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # A descriptive or arbitrary ID for the core. This value must be unique within the core definition
        # version. Max length is 128 characters with pattern ''[a-zA-Z0-9:_-]+''.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ARN of the thing which is the core.

        @[JSON::Field(key: "ThingArn")]
        getter thing_arn : String

        # If true, the core's local shadow is automatically synced with the cloud.

        @[JSON::Field(key: "SyncShadow")]
        getter sync_shadow : Bool?

        def initialize(
          @certificate_arn : String,
          @id : String,
          @thing_arn : String,
          @sync_shadow : Bool? = nil
        )
        end
      end

      # Information about a core definition version.

      struct CoreDefinitionVersion
        include JSON::Serializable

        # A list of cores in the core definition version.

        @[JSON::Field(key: "Cores")]
        getter cores : Array(Types::Core)?

        def initialize(
          @cores : Array(Types::Core)? = nil
        )
        end
      end


      struct CreateConnectorDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::ConnectorDefinitionVersion?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @amzn_client_token : String? = nil,
          @initial_version : Types::ConnectorDefinitionVersion? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConnectorDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateConnectorDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConnectorDefinitionId")]
        getter connector_definition_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "Connectors")]
        getter connectors : Array(Types::Connector)?

        def initialize(
          @connector_definition_id : String,
          @amzn_client_token : String? = nil,
          @connectors : Array(Types::Connector)? = nil
        )
        end
      end


      struct CreateConnectorDefinitionVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateCoreDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::CoreDefinitionVersion?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @amzn_client_token : String? = nil,
          @initial_version : Types::CoreDefinitionVersion? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCoreDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateCoreDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "CoreDefinitionId")]
        getter core_definition_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "Cores")]
        getter cores : Array(Types::Core)?

        def initialize(
          @core_definition_id : String,
          @amzn_client_token : String? = nil,
          @cores : Array(Types::Core)? = nil
        )
        end
      end


      struct CreateCoreDefinitionVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Information about a deployment.

      struct CreateDeploymentRequest
        include JSON::Serializable

        # The type of deployment. When used for ''CreateDeployment'', only ''NewDeployment'' and
        # ''Redeployment'' are valid.

        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?

        # The ID of the deployment if you wish to redeploy a previous deployment.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String?

        # The ID of the group version to be deployed.

        @[JSON::Field(key: "GroupVersionId")]
        getter group_version_id : String?

        def initialize(
          @deployment_type : String,
          @group_id : String,
          @amzn_client_token : String? = nil,
          @deployment_id : String? = nil,
          @group_version_id : String? = nil
        )
        end
      end


      struct CreateDeploymentResponse
        include JSON::Serializable

        # The ARN of the deployment.

        @[JSON::Field(key: "DeploymentArn")]
        getter deployment_arn : String?

        # The ID of the deployment.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String?

        def initialize(
          @deployment_arn : String? = nil,
          @deployment_id : String? = nil
        )
        end
      end


      struct CreateDeviceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::DeviceDefinitionVersion?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @amzn_client_token : String? = nil,
          @initial_version : Types::DeviceDefinitionVersion? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDeviceDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateDeviceDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeviceDefinitionId")]
        getter device_definition_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "Devices")]
        getter devices : Array(Types::Device)?

        def initialize(
          @device_definition_id : String,
          @amzn_client_token : String? = nil,
          @devices : Array(Types::Device)? = nil
        )
        end
      end


      struct CreateDeviceDefinitionVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateFunctionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::FunctionDefinitionVersion?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @amzn_client_token : String? = nil,
          @initial_version : Types::FunctionDefinitionVersion? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFunctionDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateFunctionDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "FunctionDefinitionId")]
        getter function_definition_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "DefaultConfig")]
        getter default_config : Types::FunctionDefaultConfig?


        @[JSON::Field(key: "Functions")]
        getter functions : Array(Types::Function)?

        def initialize(
          @function_definition_id : String,
          @amzn_client_token : String? = nil,
          @default_config : Types::FunctionDefaultConfig? = nil,
          @functions : Array(Types::Function)? = nil
        )
        end
      end


      struct CreateFunctionDefinitionVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateGroupCertificateAuthorityRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?

        def initialize(
          @group_id : String,
          @amzn_client_token : String? = nil
        )
        end
      end


      struct CreateGroupCertificateAuthorityResponse
        include JSON::Serializable

        # The ARN of the group certificate authority.

        @[JSON::Field(key: "GroupCertificateAuthorityArn")]
        getter group_certificate_authority_arn : String?

        def initialize(
          @group_certificate_authority_arn : String? = nil
        )
        end
      end


      struct CreateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::GroupVersion?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @amzn_client_token : String? = nil,
          @initial_version : Types::GroupVersion? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateGroupVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "ConnectorDefinitionVersionArn")]
        getter connector_definition_version_arn : String?


        @[JSON::Field(key: "CoreDefinitionVersionArn")]
        getter core_definition_version_arn : String?


        @[JSON::Field(key: "DeviceDefinitionVersionArn")]
        getter device_definition_version_arn : String?


        @[JSON::Field(key: "FunctionDefinitionVersionArn")]
        getter function_definition_version_arn : String?


        @[JSON::Field(key: "LoggerDefinitionVersionArn")]
        getter logger_definition_version_arn : String?


        @[JSON::Field(key: "ResourceDefinitionVersionArn")]
        getter resource_definition_version_arn : String?


        @[JSON::Field(key: "SubscriptionDefinitionVersionArn")]
        getter subscription_definition_version_arn : String?

        def initialize(
          @group_id : String,
          @amzn_client_token : String? = nil,
          @connector_definition_version_arn : String? = nil,
          @core_definition_version_arn : String? = nil,
          @device_definition_version_arn : String? = nil,
          @function_definition_version_arn : String? = nil,
          @logger_definition_version_arn : String? = nil,
          @resource_definition_version_arn : String? = nil,
          @subscription_definition_version_arn : String? = nil
        )
        end
      end


      struct CreateGroupVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateLoggerDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::LoggerDefinitionVersion?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @amzn_client_token : String? = nil,
          @initial_version : Types::LoggerDefinitionVersion? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLoggerDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateLoggerDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoggerDefinitionId")]
        getter logger_definition_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "Loggers")]
        getter loggers : Array(Types::Logger)?

        def initialize(
          @logger_definition_id : String,
          @amzn_client_token : String? = nil,
          @loggers : Array(Types::Logger)? = nil
        )
        end
      end


      struct CreateLoggerDefinitionVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateResourceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::ResourceDefinitionVersion?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @amzn_client_token : String? = nil,
          @initial_version : Types::ResourceDefinitionVersion? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateResourceDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateResourceDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceDefinitionId")]
        getter resource_definition_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        def initialize(
          @resource_definition_id : String,
          @amzn_client_token : String? = nil,
          @resources : Array(Types::Resource)? = nil
        )
        end
      end


      struct CreateResourceDefinitionVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Request for the CreateSoftwareUpdateJob API.

      struct CreateSoftwareUpdateJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "S3UrlSignerRole")]
        getter s3_url_signer_role : String


        @[JSON::Field(key: "SoftwareToUpdate")]
        getter software_to_update : String


        @[JSON::Field(key: "UpdateTargets")]
        getter update_targets : Array(String)


        @[JSON::Field(key: "UpdateTargetsArchitecture")]
        getter update_targets_architecture : String


        @[JSON::Field(key: "UpdateTargetsOperatingSystem")]
        getter update_targets_operating_system : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "UpdateAgentLogLevel")]
        getter update_agent_log_level : String?

        def initialize(
          @s3_url_signer_role : String,
          @software_to_update : String,
          @update_targets : Array(String),
          @update_targets_architecture : String,
          @update_targets_operating_system : String,
          @amzn_client_token : String? = nil,
          @update_agent_log_level : String? = nil
        )
        end
      end


      struct CreateSoftwareUpdateJobResponse
        include JSON::Serializable

        # The IoT Job ARN corresponding to this update.

        @[JSON::Field(key: "IotJobArn")]
        getter iot_job_arn : String?

        # The IoT Job Id corresponding to this update.

        @[JSON::Field(key: "IotJobId")]
        getter iot_job_id : String?

        # The software version installed on the device or devices after the update.

        @[JSON::Field(key: "PlatformSoftwareVersion")]
        getter platform_software_version : String?

        def initialize(
          @iot_job_arn : String? = nil,
          @iot_job_id : String? = nil,
          @platform_software_version : String? = nil
        )
        end
      end


      struct CreateSubscriptionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "InitialVersion")]
        getter initial_version : Types::SubscriptionDefinitionVersion?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @amzn_client_token : String? = nil,
          @initial_version : Types::SubscriptionDefinitionVersion? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSubscriptionDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateSubscriptionDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "SubscriptionDefinitionId")]
        getter subscription_definition_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @subscription_definition_id : String,
          @amzn_client_token : String? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end


      struct CreateSubscriptionDefinitionVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Information about a definition.

      struct DefinitionInformation
        include JSON::Serializable

        # The ARN of the definition.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the definition was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # The ID of the definition.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The time, in milliseconds since the epoch, when the definition was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?

        # The ID of the latest version associated with the definition.

        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?

        # The ARN of the latest version associated with the definition.

        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?

        # The name of the definition.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Tag(s) attached to the resource arn.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DeleteConnectorDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConnectorDefinitionId")]
        getter connector_definition_id : String

        def initialize(
          @connector_definition_id : String
        )
        end
      end


      struct DeleteConnectorDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCoreDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "CoreDefinitionId")]
        getter core_definition_id : String

        def initialize(
          @core_definition_id : String
        )
        end
      end


      struct DeleteCoreDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDeviceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeviceDefinitionId")]
        getter device_definition_id : String

        def initialize(
          @device_definition_id : String
        )
        end
      end


      struct DeleteDeviceDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFunctionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "FunctionDefinitionId")]
        getter function_definition_id : String

        def initialize(
          @function_definition_id : String
        )
        end
      end


      struct DeleteFunctionDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end


      struct DeleteGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLoggerDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoggerDefinitionId")]
        getter logger_definition_id : String

        def initialize(
          @logger_definition_id : String
        )
        end
      end


      struct DeleteLoggerDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteResourceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceDefinitionId")]
        getter resource_definition_id : String

        def initialize(
          @resource_definition_id : String
        )
        end
      end


      struct DeleteResourceDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSubscriptionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "SubscriptionDefinitionId")]
        getter subscription_definition_id : String

        def initialize(
          @subscription_definition_id : String
        )
        end
      end


      struct DeleteSubscriptionDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a deployment.

      struct Deployment
        include JSON::Serializable

        # The time, in milliseconds since the epoch, when the deployment was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : String?

        # The ARN of the deployment.

        @[JSON::Field(key: "DeploymentArn")]
        getter deployment_arn : String?

        # The ID of the deployment.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String?

        # The type of the deployment.

        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # The ARN of the group for this deployment.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String?

        def initialize(
          @created_at : String? = nil,
          @deployment_arn : String? = nil,
          @deployment_id : String? = nil,
          @deployment_type : String? = nil,
          @group_arn : String? = nil
        )
        end
      end

      # Information about a device.

      struct Device
        include JSON::Serializable

        # The ARN of the certificate associated with the device.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # A descriptive or arbitrary ID for the device. This value must be unique within the device definition
        # version. Max length is 128 characters with pattern ''[a-zA-Z0-9:_-]+''.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The thing ARN of the device.

        @[JSON::Field(key: "ThingArn")]
        getter thing_arn : String

        # If true, the device's local shadow will be automatically synced with the cloud.

        @[JSON::Field(key: "SyncShadow")]
        getter sync_shadow : Bool?

        def initialize(
          @certificate_arn : String,
          @id : String,
          @thing_arn : String,
          @sync_shadow : Bool? = nil
        )
        end
      end

      # Information about a device definition version.

      struct DeviceDefinitionVersion
        include JSON::Serializable

        # A list of devices in the definition version.

        @[JSON::Field(key: "Devices")]
        getter devices : Array(Types::Device)?

        def initialize(
          @devices : Array(Types::Device)? = nil
        )
        end
      end


      struct DisassociateRoleFromGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end


      struct DisassociateRoleFromGroupResponse
        include JSON::Serializable

        # The time, in milliseconds since the epoch, when the role was disassociated from the group.

        @[JSON::Field(key: "DisassociatedAt")]
        getter disassociated_at : String?

        def initialize(
          @disassociated_at : String? = nil
        )
        end
      end


      struct DisassociateServiceRoleFromAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateServiceRoleFromAccountResponse
        include JSON::Serializable

        # The time when the service role was disassociated from the account.

        @[JSON::Field(key: "DisassociatedAt")]
        getter disassociated_at : String?

        def initialize(
          @disassociated_at : String? = nil
        )
        end
      end

      # Empty

      struct Empty
        include JSON::Serializable

        def initialize
        end
      end

      # Details about the error.

      struct ErrorDetail
        include JSON::Serializable

        # A detailed error code.

        @[JSON::Field(key: "DetailedErrorCode")]
        getter detailed_error_code : String?

        # A detailed error message.

        @[JSON::Field(key: "DetailedErrorMessage")]
        getter detailed_error_message : String?

        def initialize(
          @detailed_error_code : String? = nil,
          @detailed_error_message : String? = nil
        )
        end
      end

      # Information about a Lambda function.

      struct Function
        include JSON::Serializable

        # A descriptive or arbitrary ID for the function. This value must be unique within the function
        # definition version. Max length is 128 characters with pattern ''[a-zA-Z0-9:_-]+''.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ARN of the Lambda function.

        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # The configuration of the Lambda function.

        @[JSON::Field(key: "FunctionConfiguration")]
        getter function_configuration : Types::FunctionConfiguration?

        def initialize(
          @id : String,
          @function_arn : String? = nil,
          @function_configuration : Types::FunctionConfiguration? = nil
        )
        end
      end

      # The configuration of the Lambda function.

      struct FunctionConfiguration
        include JSON::Serializable

        # The expected encoding type of the input payload for the function. The default is ''json''.

        @[JSON::Field(key: "EncodingType")]
        getter encoding_type : String?

        # The environment configuration of the function.

        @[JSON::Field(key: "Environment")]
        getter environment : Types::FunctionConfigurationEnvironment?

        # The execution arguments.

        @[JSON::Field(key: "ExecArgs")]
        getter exec_args : String?

        # The name of the function executable.

        @[JSON::Field(key: "Executable")]
        getter executable : String?

        # The Lambda runtime supported by Greengrass which is to be used instead of the one specified in the
        # Lambda function.

        @[JSON::Field(key: "FunctionRuntimeOverride")]
        getter function_runtime_override : String?

        # The memory size, in KB, which the function requires. This setting is not applicable and should be
        # cleared when you run the Lambda function without containerization.

        @[JSON::Field(key: "MemorySize")]
        getter memory_size : Int32?

        # True if the function is pinned. Pinned means the function is long-lived and starts when the core
        # starts.

        @[JSON::Field(key: "Pinned")]
        getter pinned : Bool?

        # The allowed function execution time, after which Lambda should terminate the function. This timeout
        # still applies to pinned Lambda functions for each request.

        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        def initialize(
          @encoding_type : String? = nil,
          @environment : Types::FunctionConfigurationEnvironment? = nil,
          @exec_args : String? = nil,
          @executable : String? = nil,
          @function_runtime_override : String? = nil,
          @memory_size : Int32? = nil,
          @pinned : Bool? = nil,
          @timeout : Int32? = nil
        )
        end
      end

      # The environment configuration of the function.

      struct FunctionConfigurationEnvironment
        include JSON::Serializable

        # If true, the Lambda function is allowed to access the host's /sys folder. Use this when the Lambda
        # function needs to read device information from /sys. This setting applies only when you run the
        # Lambda function in a Greengrass container.

        @[JSON::Field(key: "AccessSysfs")]
        getter access_sysfs : Bool?

        # Configuration related to executing the Lambda function

        @[JSON::Field(key: "Execution")]
        getter execution : Types::FunctionExecutionConfig?

        # A list of the resources, with their permissions, to which the Lambda function will be granted
        # access. A Lambda function can have at most 10 resources. ResourceAccessPolicies apply only when you
        # run the Lambda function in a Greengrass container.

        @[JSON::Field(key: "ResourceAccessPolicies")]
        getter resource_access_policies : Array(Types::ResourceAccessPolicy)?

        # Environment variables for the Lambda function's configuration.

        @[JSON::Field(key: "Variables")]
        getter variables : Hash(String, String)?

        def initialize(
          @access_sysfs : Bool? = nil,
          @execution : Types::FunctionExecutionConfig? = nil,
          @resource_access_policies : Array(Types::ResourceAccessPolicy)? = nil,
          @variables : Hash(String, String)? = nil
        )
        end
      end

      # The default configuration that applies to all Lambda functions in the group. Individual Lambda
      # functions can override these settings.

      struct FunctionDefaultConfig
        include JSON::Serializable


        @[JSON::Field(key: "Execution")]
        getter execution : Types::FunctionDefaultExecutionConfig?

        def initialize(
          @execution : Types::FunctionDefaultExecutionConfig? = nil
        )
        end
      end

      # Configuration information that specifies how a Lambda function runs.

      struct FunctionDefaultExecutionConfig
        include JSON::Serializable


        @[JSON::Field(key: "IsolationMode")]
        getter isolation_mode : String?


        @[JSON::Field(key: "RunAs")]
        getter run_as : Types::FunctionRunAsConfig?

        def initialize(
          @isolation_mode : String? = nil,
          @run_as : Types::FunctionRunAsConfig? = nil
        )
        end
      end

      # Information about a function definition version.

      struct FunctionDefinitionVersion
        include JSON::Serializable

        # The default configuration that applies to all Lambda functions in this function definition version.
        # Individual Lambda functions can override these settings.

        @[JSON::Field(key: "DefaultConfig")]
        getter default_config : Types::FunctionDefaultConfig?

        # A list of Lambda functions in this function definition version.

        @[JSON::Field(key: "Functions")]
        getter functions : Array(Types::Function)?

        def initialize(
          @default_config : Types::FunctionDefaultConfig? = nil,
          @functions : Array(Types::Function)? = nil
        )
        end
      end

      # Configuration information that specifies how a Lambda function runs.

      struct FunctionExecutionConfig
        include JSON::Serializable


        @[JSON::Field(key: "IsolationMode")]
        getter isolation_mode : String?


        @[JSON::Field(key: "RunAs")]
        getter run_as : Types::FunctionRunAsConfig?

        def initialize(
          @isolation_mode : String? = nil,
          @run_as : Types::FunctionRunAsConfig? = nil
        )
        end
      end

      # Specifies the user and group whose permissions are used when running the Lambda function. You can
      # specify one or both values to override the default values. We recommend that you avoid running as
      # root unless absolutely necessary to minimize the risk of unintended changes or malicious attacks. To
      # run as root, you must set ''IsolationMode'' to ''NoContainer'' and update config.json in
      # ''greengrass-root/config'' to set ''allowFunctionsToRunAsRoot'' to ''yes''.

      struct FunctionRunAsConfig
        include JSON::Serializable

        # The group ID whose permissions are used to run a Lambda function.

        @[JSON::Field(key: "Gid")]
        getter gid : Int32?

        # The user ID whose permissions are used to run a Lambda function.

        @[JSON::Field(key: "Uid")]
        getter uid : Int32?

        def initialize(
          @gid : Int32? = nil,
          @uid : Int32? = nil
        )
        end
      end

      # General error information.

      struct GeneralError
        include JSON::Serializable

        # Details about the error.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetail)?

        # A message containing information about the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_details : Array(Types::ErrorDetail)? = nil,
          @message : String? = nil
        )
        end
      end


      struct GetAssociatedRoleRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end


      struct GetAssociatedRoleResponse
        include JSON::Serializable

        # The time when the role was associated with the group.

        @[JSON::Field(key: "AssociatedAt")]
        getter associated_at : String?

        # The ARN of the role that is associated with the group.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @associated_at : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct GetBulkDeploymentStatusRequest
        include JSON::Serializable


        @[JSON::Field(key: "BulkDeploymentId")]
        getter bulk_deployment_id : String

        def initialize(
          @bulk_deployment_id : String
        )
        end
      end

      # Information about the status of a bulk deployment at the time of the request.

      struct GetBulkDeploymentStatusResponse
        include JSON::Serializable

        # Relevant metrics on input records processed during bulk deployment.

        @[JSON::Field(key: "BulkDeploymentMetrics")]
        getter bulk_deployment_metrics : Types::BulkDeploymentMetrics?

        # The status of the bulk deployment.

        @[JSON::Field(key: "BulkDeploymentStatus")]
        getter bulk_deployment_status : String?

        # The time, in ISO format, when the deployment was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : String?

        # Error details

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetail)?

        # Error message

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @bulk_deployment_metrics : Types::BulkDeploymentMetrics? = nil,
          @bulk_deployment_status : String? = nil,
          @created_at : String? = nil,
          @error_details : Array(Types::ErrorDetail)? = nil,
          @error_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetConnectivityInfoRequest
        include JSON::Serializable


        @[JSON::Field(key: "ThingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end

      # Information about a Greengrass core's connectivity.

      struct GetConnectivityInfoResponse
        include JSON::Serializable

        # Connectivity info list.

        @[JSON::Field(key: "ConnectivityInfo")]
        getter connectivity_info : Array(Types::ConnectivityInfo)?

        # A message about the connectivity info request.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @connectivity_info : Array(Types::ConnectivityInfo)? = nil,
          @message : String? = nil
        )
        end
      end


      struct GetConnectorDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConnectorDefinitionId")]
        getter connector_definition_id : String

        def initialize(
          @connector_definition_id : String
        )
        end
      end


      struct GetConnectorDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetConnectorDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConnectorDefinitionId")]
        getter connector_definition_id : String


        @[JSON::Field(key: "ConnectorDefinitionVersionId")]
        getter connector_definition_version_id : String


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connector_definition_id : String,
          @connector_definition_version_id : String,
          @next_token : String? = nil
        )
        end
      end

      # Information about a connector definition version.

      struct GetConnectorDefinitionVersionResponse
        include JSON::Serializable

        # The ARN of the connector definition version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the connector definition version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information about the connector definition version.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::ConnectorDefinitionVersion?

        # The ID of the connector definition version.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The version of the connector definition version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::ConnectorDefinitionVersion? = nil,
          @id : String? = nil,
          @next_token : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetCoreDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "CoreDefinitionId")]
        getter core_definition_id : String

        def initialize(
          @core_definition_id : String
        )
        end
      end


      struct GetCoreDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCoreDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "CoreDefinitionId")]
        getter core_definition_id : String


        @[JSON::Field(key: "CoreDefinitionVersionId")]
        getter core_definition_version_id : String

        def initialize(
          @core_definition_id : String,
          @core_definition_version_id : String
        )
        end
      end


      struct GetCoreDefinitionVersionResponse
        include JSON::Serializable

        # The ARN of the core definition version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the core definition version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information about the core definition version.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::CoreDefinitionVersion?

        # The ID of the core definition version.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The version of the core definition version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::CoreDefinitionVersion? = nil,
          @id : String? = nil,
          @next_token : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetDeploymentStatusRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @deployment_id : String,
          @group_id : String
        )
        end
      end

      # Information about the status of a deployment for a group.

      struct GetDeploymentStatusResponse
        include JSON::Serializable

        # The status of the deployment: ''InProgress'', ''Building'', ''Success'', or ''Failure''.

        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # The type of the deployment.

        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # Error details

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetail)?

        # Error message

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The time, in milliseconds since the epoch, when the deployment status was updated.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : String?

        def initialize(
          @deployment_status : String? = nil,
          @deployment_type : String? = nil,
          @error_details : Array(Types::ErrorDetail)? = nil,
          @error_message : String? = nil,
          @updated_at : String? = nil
        )
        end
      end


      struct GetDeviceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeviceDefinitionId")]
        getter device_definition_id : String

        def initialize(
          @device_definition_id : String
        )
        end
      end


      struct GetDeviceDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetDeviceDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeviceDefinitionId")]
        getter device_definition_id : String


        @[JSON::Field(key: "DeviceDefinitionVersionId")]
        getter device_definition_version_id : String


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @device_definition_id : String,
          @device_definition_version_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct GetDeviceDefinitionVersionResponse
        include JSON::Serializable

        # The ARN of the device definition version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the device definition version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information about the device definition version.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::DeviceDefinitionVersion?

        # The ID of the device definition version.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The version of the device definition version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::DeviceDefinitionVersion? = nil,
          @id : String? = nil,
          @next_token : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetFunctionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "FunctionDefinitionId")]
        getter function_definition_id : String

        def initialize(
          @function_definition_id : String
        )
        end
      end


      struct GetFunctionDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetFunctionDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "FunctionDefinitionId")]
        getter function_definition_id : String


        @[JSON::Field(key: "FunctionDefinitionVersionId")]
        getter function_definition_version_id : String


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @function_definition_id : String,
          @function_definition_version_id : String,
          @next_token : String? = nil
        )
        end
      end

      # Information about a function definition version.

      struct GetFunctionDefinitionVersionResponse
        include JSON::Serializable

        # The ARN of the function definition version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the function definition version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information on the definition.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::FunctionDefinitionVersion?

        # The ID of the function definition version.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The version of the function definition version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::FunctionDefinitionVersion? = nil,
          @id : String? = nil,
          @next_token : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetGroupCertificateAuthorityRequest
        include JSON::Serializable


        @[JSON::Field(key: "CertificateAuthorityId")]
        getter certificate_authority_id : String


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @certificate_authority_id : String,
          @group_id : String
        )
        end
      end

      # Information about a certificate authority for a group.

      struct GetGroupCertificateAuthorityResponse
        include JSON::Serializable

        # The ARN of the certificate authority for the group.

        @[JSON::Field(key: "GroupCertificateAuthorityArn")]
        getter group_certificate_authority_arn : String?

        # The ID of the certificate authority for the group.

        @[JSON::Field(key: "GroupCertificateAuthorityId")]
        getter group_certificate_authority_id : String?

        # The PEM encoded certificate for the group.

        @[JSON::Field(key: "PemEncodedCertificate")]
        getter pem_encoded_certificate : String?

        def initialize(
          @group_certificate_authority_arn : String? = nil,
          @group_certificate_authority_id : String? = nil,
          @pem_encoded_certificate : String? = nil
        )
        end
      end


      struct GetGroupCertificateConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end


      struct GetGroupCertificateConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "CertificateAuthorityExpiryInMilliseconds")]
        getter certificate_authority_expiry_in_milliseconds : String?


        @[JSON::Field(key: "CertificateExpiryInMilliseconds")]
        getter certificate_expiry_in_milliseconds : String?


        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        def initialize(
          @certificate_authority_expiry_in_milliseconds : String? = nil,
          @certificate_expiry_in_milliseconds : String? = nil,
          @group_id : String? = nil
        )
        end
      end


      struct GetGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end


      struct GetGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetGroupVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "GroupVersionId")]
        getter group_version_id : String

        def initialize(
          @group_id : String,
          @group_version_id : String
        )
        end
      end

      # Information about a group version.

      struct GetGroupVersionResponse
        include JSON::Serializable

        # The ARN of the group version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the group version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information about the group version definition.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::GroupVersion?

        # The ID of the group that the version is associated with.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ID of the group version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::GroupVersion? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetLoggerDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoggerDefinitionId")]
        getter logger_definition_id : String

        def initialize(
          @logger_definition_id : String
        )
        end
      end


      struct GetLoggerDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetLoggerDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoggerDefinitionId")]
        getter logger_definition_id : String


        @[JSON::Field(key: "LoggerDefinitionVersionId")]
        getter logger_definition_version_id : String


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @logger_definition_id : String,
          @logger_definition_version_id : String,
          @next_token : String? = nil
        )
        end
      end

      # Information about a logger definition version.

      struct GetLoggerDefinitionVersionResponse
        include JSON::Serializable

        # The ARN of the logger definition version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the logger definition version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information about the logger definition version.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::LoggerDefinitionVersion?

        # The ID of the logger definition version.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The version of the logger definition version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::LoggerDefinitionVersion? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetResourceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceDefinitionId")]
        getter resource_definition_id : String

        def initialize(
          @resource_definition_id : String
        )
        end
      end


      struct GetResourceDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetResourceDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceDefinitionId")]
        getter resource_definition_id : String


        @[JSON::Field(key: "ResourceDefinitionVersionId")]
        getter resource_definition_version_id : String

        def initialize(
          @resource_definition_id : String,
          @resource_definition_version_id : String
        )
        end
      end

      # Information about a resource definition version.

      struct GetResourceDefinitionVersionResponse
        include JSON::Serializable

        # Arn of the resource definition version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the resource definition version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information about the definition.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::ResourceDefinitionVersion?

        # The ID of the resource definition version.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The version of the resource definition version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::ResourceDefinitionVersion? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetServiceRoleForAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetServiceRoleForAccountResponse
        include JSON::Serializable

        # The time when the service role was associated with the account.

        @[JSON::Field(key: "AssociatedAt")]
        getter associated_at : String?

        # The ARN of the role which is associated with the account.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @associated_at : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct GetSubscriptionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "SubscriptionDefinitionId")]
        getter subscription_definition_id : String

        def initialize(
          @subscription_definition_id : String
        )
        end
      end


      struct GetSubscriptionDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?


        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?


        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?


        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetSubscriptionDefinitionVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "SubscriptionDefinitionId")]
        getter subscription_definition_id : String


        @[JSON::Field(key: "SubscriptionDefinitionVersionId")]
        getter subscription_definition_version_id : String


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @subscription_definition_id : String,
          @subscription_definition_version_id : String,
          @next_token : String? = nil
        )
        end
      end

      # Information about a subscription definition version.

      struct GetSubscriptionDefinitionVersionResponse
        include JSON::Serializable

        # The ARN of the subscription definition version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the subscription definition version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # Information about the subscription definition version.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::SubscriptionDefinitionVersion?

        # The ID of the subscription definition version.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The version of the subscription definition version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @definition : Types::SubscriptionDefinitionVersion? = nil,
          @id : String? = nil,
          @next_token : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetThingRuntimeConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ThingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end

      # The runtime configuration for a thing.

      struct GetThingRuntimeConfigurationResponse
        include JSON::Serializable

        # Runtime configuration for a thing.

        @[JSON::Field(key: "RuntimeConfiguration")]
        getter runtime_configuration : Types::RuntimeConfiguration?

        def initialize(
          @runtime_configuration : Types::RuntimeConfiguration? = nil
        )
        end
      end

      # Information about a certificate authority for a group.

      struct GroupCertificateAuthorityProperties
        include JSON::Serializable

        # The ARN of the certificate authority for the group.

        @[JSON::Field(key: "GroupCertificateAuthorityArn")]
        getter group_certificate_authority_arn : String?

        # The ID of the certificate authority for the group.

        @[JSON::Field(key: "GroupCertificateAuthorityId")]
        getter group_certificate_authority_id : String?

        def initialize(
          @group_certificate_authority_arn : String? = nil,
          @group_certificate_authority_id : String? = nil
        )
        end
      end

      # Information about a group certificate configuration.

      struct GroupCertificateConfiguration
        include JSON::Serializable

        # The amount of time remaining before the certificate authority expires, in milliseconds.

        @[JSON::Field(key: "CertificateAuthorityExpiryInMilliseconds")]
        getter certificate_authority_expiry_in_milliseconds : String?

        # The amount of time remaining before the certificate expires, in milliseconds.

        @[JSON::Field(key: "CertificateExpiryInMilliseconds")]
        getter certificate_expiry_in_milliseconds : String?

        # The ID of the group certificate configuration.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        def initialize(
          @certificate_authority_expiry_in_milliseconds : String? = nil,
          @certificate_expiry_in_milliseconds : String? = nil,
          @group_id : String? = nil
        )
        end
      end

      # Information about a group.

      struct GroupInformation
        include JSON::Serializable

        # The ARN of the group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the group was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # The ID of the group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The time, in milliseconds since the epoch, when the group was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : String?

        # The ID of the latest version associated with the group.

        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?

        # The ARN of the latest version associated with the group.

        @[JSON::Field(key: "LatestVersionArn")]
        getter latest_version_arn : String?

        # The name of the group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @last_updated_timestamp : String? = nil,
          @latest_version : String? = nil,
          @latest_version_arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Group owner related settings for local resources.

      struct GroupOwnerSetting
        include JSON::Serializable

        # If true, AWS IoT Greengrass automatically adds the specified Linux OS group owner of the resource to
        # the Lambda process privileges. Thus the Lambda process will have the file access permissions of the
        # added Linux group.

        @[JSON::Field(key: "AutoAddGroupOwner")]
        getter auto_add_group_owner : Bool?

        # The name of the Linux OS group whose privileges will be added to the Lambda process. This field is
        # optional.

        @[JSON::Field(key: "GroupOwner")]
        getter group_owner : String?

        def initialize(
          @auto_add_group_owner : Bool? = nil,
          @group_owner : String? = nil
        )
        end
      end

      # Information about a group version.

      struct GroupVersion
        include JSON::Serializable

        # The ARN of the connector definition version for this group.

        @[JSON::Field(key: "ConnectorDefinitionVersionArn")]
        getter connector_definition_version_arn : String?

        # The ARN of the core definition version for this group.

        @[JSON::Field(key: "CoreDefinitionVersionArn")]
        getter core_definition_version_arn : String?

        # The ARN of the device definition version for this group.

        @[JSON::Field(key: "DeviceDefinitionVersionArn")]
        getter device_definition_version_arn : String?

        # The ARN of the function definition version for this group.

        @[JSON::Field(key: "FunctionDefinitionVersionArn")]
        getter function_definition_version_arn : String?

        # The ARN of the logger definition version for this group.

        @[JSON::Field(key: "LoggerDefinitionVersionArn")]
        getter logger_definition_version_arn : String?

        # The ARN of the resource definition version for this group.

        @[JSON::Field(key: "ResourceDefinitionVersionArn")]
        getter resource_definition_version_arn : String?

        # The ARN of the subscription definition version for this group.

        @[JSON::Field(key: "SubscriptionDefinitionVersionArn")]
        getter subscription_definition_version_arn : String?

        def initialize(
          @connector_definition_version_arn : String? = nil,
          @core_definition_version_arn : String? = nil,
          @device_definition_version_arn : String? = nil,
          @function_definition_version_arn : String? = nil,
          @logger_definition_version_arn : String? = nil,
          @resource_definition_version_arn : String? = nil,
          @subscription_definition_version_arn : String? = nil
        )
        end
      end

      # General error information.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetail)?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_details : Array(Types::ErrorDetail)? = nil,
          @message : String? = nil
        )
        end
      end


      struct ListBulkDeploymentDetailedReportsRequest
        include JSON::Serializable


        @[JSON::Field(key: "BulkDeploymentId")]
        getter bulk_deployment_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @bulk_deployment_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBulkDeploymentDetailedReportsResponse
        include JSON::Serializable

        # A list of the individual group deployments in the bulk deployment operation.

        @[JSON::Field(key: "Deployments")]
        getter deployments : Array(Types::BulkDeploymentResult)?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @deployments : Array(Types::BulkDeploymentResult)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBulkDeploymentsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBulkDeploymentsResponse
        include JSON::Serializable

        # A list of bulk deployments.

        @[JSON::Field(key: "BulkDeployments")]
        getter bulk_deployments : Array(Types::BulkDeployment)?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @bulk_deployments : Array(Types::BulkDeployment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorDefinitionVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConnectorDefinitionId")]
        getter connector_definition_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connector_definition_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorDefinitionVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListConnectorDefinitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorDefinitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCoreDefinitionVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "CoreDefinitionId")]
        getter core_definition_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @core_definition_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCoreDefinitionVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListCoreDefinitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCoreDefinitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A list of definitions.

      struct ListDefinitionsResponse
        include JSON::Serializable

        # Information about a definition.

        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsResponse
        include JSON::Serializable

        # A list of deployments for the requested groups.

        @[JSON::Field(key: "Deployments")]
        getter deployments : Array(Types::Deployment)?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @deployments : Array(Types::Deployment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeviceDefinitionVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeviceDefinitionId")]
        getter device_definition_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @device_definition_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeviceDefinitionVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListDeviceDefinitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeviceDefinitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFunctionDefinitionVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "FunctionDefinitionId")]
        getter function_definition_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @function_definition_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFunctionDefinitionVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListFunctionDefinitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFunctionDefinitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupCertificateAuthoritiesRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end


      struct ListGroupCertificateAuthoritiesResponse
        include JSON::Serializable

        # A list of certificate authorities associated with the group.

        @[JSON::Field(key: "GroupCertificateAuthorities")]
        getter group_certificate_authorities : Array(Types::GroupCertificateAuthorityProperties)?

        def initialize(
          @group_certificate_authorities : Array(Types::GroupCertificateAuthorityProperties)? = nil
        )
        end
      end


      struct ListGroupVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListGroupsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsResponse
        include JSON::Serializable

        # Information about a group.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupInformation)?

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::GroupInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLoggerDefinitionVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoggerDefinitionId")]
        getter logger_definition_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @logger_definition_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLoggerDefinitionVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListLoggerDefinitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLoggerDefinitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceDefinitionVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceDefinitionId")]
        getter resource_definition_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_definition_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceDefinitionVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListResourceDefinitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceDefinitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubscriptionDefinitionVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "SubscriptionDefinitionId")]
        getter subscription_definition_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @subscription_definition_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubscriptionDefinitionVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end


      struct ListSubscriptionDefinitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubscriptionDefinitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::DefinitionInformation)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @definitions : Array(Types::DefinitionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A list of versions.

      struct ListVersionsResponse
        include JSON::Serializable

        # The token for the next set of results, or ''null'' if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about a version.

        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::VersionInformation)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionInformation)? = nil
        )
        end
      end

      # Attributes that define a local device resource.

      struct LocalDeviceResourceData
        include JSON::Serializable

        # Group/owner related settings for local resources.

        @[JSON::Field(key: "GroupOwnerSetting")]
        getter group_owner_setting : Types::GroupOwnerSetting?

        # The local absolute path of the device resource. The source path for a device resource can refer only
        # to a character device or block device under ''/dev''.

        @[JSON::Field(key: "SourcePath")]
        getter source_path : String?

        def initialize(
          @group_owner_setting : Types::GroupOwnerSetting? = nil,
          @source_path : String? = nil
        )
        end
      end

      # Attributes that define a local volume resource.

      struct LocalVolumeResourceData
        include JSON::Serializable

        # The absolute local path of the resource inside the Lambda environment.

        @[JSON::Field(key: "DestinationPath")]
        getter destination_path : String?

        # Allows you to configure additional group privileges for the Lambda process. This field is optional.

        @[JSON::Field(key: "GroupOwnerSetting")]
        getter group_owner_setting : Types::GroupOwnerSetting?

        # The local absolute path of the volume resource on the host. The source path for a volume resource
        # type cannot start with ''/sys''.

        @[JSON::Field(key: "SourcePath")]
        getter source_path : String?

        def initialize(
          @destination_path : String? = nil,
          @group_owner_setting : Types::GroupOwnerSetting? = nil,
          @source_path : String? = nil
        )
        end
      end

      # Information about a logger

      struct Logger
        include JSON::Serializable

        # The component that will be subject to logging.

        @[JSON::Field(key: "Component")]
        getter component : String

        # A descriptive or arbitrary ID for the logger. This value must be unique within the logger definition
        # version. Max length is 128 characters with pattern ''[a-zA-Z0-9:_-]+''.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The level of the logs.

        @[JSON::Field(key: "Level")]
        getter level : String

        # The type of log output which will be used.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The amount of file space, in KB, to use if the local file system is used for logging purposes.

        @[JSON::Field(key: "Space")]
        getter space : Int32?

        def initialize(
          @component : String,
          @id : String,
          @level : String,
          @type : String,
          @space : Int32? = nil
        )
        end
      end

      # Information about a logger definition version.

      struct LoggerDefinitionVersion
        include JSON::Serializable

        # A list of loggers.

        @[JSON::Field(key: "Loggers")]
        getter loggers : Array(Types::Logger)?

        def initialize(
          @loggers : Array(Types::Logger)? = nil
        )
        end
      end

      # Information about a group reset request.

      struct ResetDeploymentsRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?

        # If true, performs a best-effort only core reset.

        @[JSON::Field(key: "Force")]
        getter force : Bool?

        def initialize(
          @group_id : String,
          @amzn_client_token : String? = nil,
          @force : Bool? = nil
        )
        end
      end


      struct ResetDeploymentsResponse
        include JSON::Serializable

        # The ARN of the deployment.

        @[JSON::Field(key: "DeploymentArn")]
        getter deployment_arn : String?

        # The ID of the deployment.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String?

        def initialize(
          @deployment_arn : String? = nil,
          @deployment_id : String? = nil
        )
        end
      end

      # Information about a resource.

      struct Resource
        include JSON::Serializable

        # The resource ID, used to refer to a resource in the Lambda function configuration. Max length is 128
        # characters with pattern ''[a-zA-Z0-9:_-]+''. This must be unique within a Greengrass group.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The descriptive resource name, which is displayed on the AWS IoT Greengrass console. Max length 128
        # characters with pattern ''[a-zA-Z0-9:_-]+''. This must be unique within a Greengrass group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A container of data for all resource types.

        @[JSON::Field(key: "ResourceDataContainer")]
        getter resource_data_container : Types::ResourceDataContainer

        def initialize(
          @id : String,
          @name : String,
          @resource_data_container : Types::ResourceDataContainer
        )
        end
      end

      # A policy used by the function to access a resource.

      struct ResourceAccessPolicy
        include JSON::Serializable

        # The ID of the resource. (This ID is assigned to the resource when you create the resource
        # definiton.)

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The permissions that the Lambda function has to the resource. Can be one of ''rw'' (read/write) or
        # ''ro'' (read-only).

        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @resource_id : String,
          @permission : String? = nil
        )
        end
      end

      # A container for resource data. The container takes only one of the following supported resource data
      # types: ''LocalDeviceResourceData'', ''LocalVolumeResourceData'',
      # ''SageMakerMachineLearningModelResourceData'', ''S3MachineLearningModelResourceData'',
      # ''SecretsManagerSecretResourceData''.

      struct ResourceDataContainer
        include JSON::Serializable

        # Attributes that define the local device resource.

        @[JSON::Field(key: "LocalDeviceResourceData")]
        getter local_device_resource_data : Types::LocalDeviceResourceData?

        # Attributes that define the local volume resource.

        @[JSON::Field(key: "LocalVolumeResourceData")]
        getter local_volume_resource_data : Types::LocalVolumeResourceData?

        # Attributes that define an Amazon S3 machine learning resource.

        @[JSON::Field(key: "S3MachineLearningModelResourceData")]
        getter s3_machine_learning_model_resource_data : Types::S3MachineLearningModelResourceData?

        # Attributes that define an Amazon SageMaker machine learning resource.

        @[JSON::Field(key: "SageMakerMachineLearningModelResourceData")]
        getter sage_maker_machine_learning_model_resource_data : Types::SageMakerMachineLearningModelResourceData?

        # Attributes that define a secret resource, which references a secret from AWS Secrets Manager.

        @[JSON::Field(key: "SecretsManagerSecretResourceData")]
        getter secrets_manager_secret_resource_data : Types::SecretsManagerSecretResourceData?

        def initialize(
          @local_device_resource_data : Types::LocalDeviceResourceData? = nil,
          @local_volume_resource_data : Types::LocalVolumeResourceData? = nil,
          @s3_machine_learning_model_resource_data : Types::S3MachineLearningModelResourceData? = nil,
          @sage_maker_machine_learning_model_resource_data : Types::SageMakerMachineLearningModelResourceData? = nil,
          @secrets_manager_secret_resource_data : Types::SecretsManagerSecretResourceData? = nil
        )
        end
      end

      # Information about a resource definition version.

      struct ResourceDefinitionVersion
        include JSON::Serializable

        # A list of resources.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        def initialize(
          @resources : Array(Types::Resource)? = nil
        )
        end
      end

      # The owner setting for downloaded machine learning resources.

      struct ResourceDownloadOwnerSetting
        include JSON::Serializable

        # The group owner of the resource. This is the name of an existing Linux OS group on the system or a
        # GID. The group's permissions are added to the Lambda process.

        @[JSON::Field(key: "GroupOwner")]
        getter group_owner : String

        # The permissions that the group owner has to the resource. Valid values are ''rw'' (read/write) or
        # ''ro'' (read-only).

        @[JSON::Field(key: "GroupPermission")]
        getter group_permission : String

        def initialize(
          @group_owner : String,
          @group_permission : String
        )
        end
      end

      # Runtime configuration for a thing.

      struct RuntimeConfiguration
        include JSON::Serializable

        # Configuration for telemetry service.

        @[JSON::Field(key: "TelemetryConfiguration")]
        getter telemetry_configuration : Types::TelemetryConfiguration?

        def initialize(
          @telemetry_configuration : Types::TelemetryConfiguration? = nil
        )
        end
      end

      # Runtime configuration for a thing.

      struct RuntimeConfigurationUpdate
        include JSON::Serializable

        # Configuration for telemetry service.

        @[JSON::Field(key: "TelemetryConfiguration")]
        getter telemetry_configuration : Types::TelemetryConfigurationUpdate?

        def initialize(
          @telemetry_configuration : Types::TelemetryConfigurationUpdate? = nil
        )
        end
      end

      # Attributes that define an Amazon S3 machine learning resource.

      struct S3MachineLearningModelResourceData
        include JSON::Serializable

        # The absolute local path of the resource inside the Lambda environment.

        @[JSON::Field(key: "DestinationPath")]
        getter destination_path : String?


        @[JSON::Field(key: "OwnerSetting")]
        getter owner_setting : Types::ResourceDownloadOwnerSetting?

        # The URI of the source model in an S3 bucket. The model package must be in tar.gz or .zip format.

        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String?

        def initialize(
          @destination_path : String? = nil,
          @owner_setting : Types::ResourceDownloadOwnerSetting? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # Attributes that define an Amazon SageMaker machine learning resource.

      struct SageMakerMachineLearningModelResourceData
        include JSON::Serializable

        # The absolute local path of the resource inside the Lambda environment.

        @[JSON::Field(key: "DestinationPath")]
        getter destination_path : String?


        @[JSON::Field(key: "OwnerSetting")]
        getter owner_setting : Types::ResourceDownloadOwnerSetting?

        # The ARN of the Amazon SageMaker training job that represents the source model.

        @[JSON::Field(key: "SageMakerJobArn")]
        getter sage_maker_job_arn : String?

        def initialize(
          @destination_path : String? = nil,
          @owner_setting : Types::ResourceDownloadOwnerSetting? = nil,
          @sage_maker_job_arn : String? = nil
        )
        end
      end

      # Attributes that define a secret resource, which references a secret from AWS Secrets Manager. AWS
      # IoT Greengrass stores a local, encrypted copy of the secret on the Greengrass core, where it can be
      # securely accessed by connectors and Lambda functions.

      struct SecretsManagerSecretResourceData
        include JSON::Serializable

        # The ARN of the Secrets Manager secret to make available on the core. The value of the secret's
        # latest version (represented by the ''AWSCURRENT'' staging label) is included by default.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # Optional. The staging labels whose values you want to make available on the core, in addition to
        # ''AWSCURRENT''.

        @[JSON::Field(key: "AdditionalStagingLabelsToDownload")]
        getter additional_staging_labels_to_download : Array(String)?

        def initialize(
          @arn : String? = nil,
          @additional_staging_labels_to_download : Array(String)? = nil
        )
        end
      end

      # Information about a bulk deployment. You cannot start a new bulk deployment while another one is
      # still running or in a non-terminal state.

      struct StartBulkDeploymentRequest
        include JSON::Serializable

        # The ARN of the execution role to associate with the bulk deployment operation. This IAM role must
        # allow the ''greengrass:CreateDeployment'' action for all group versions that are listed in the input
        # file. This IAM role must have access to the S3 bucket containing the input file.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # The URI of the input file contained in the S3 bucket. The execution role must have ''getObject''
        # permissions on this bucket to access the input file. The input file is a JSON-serialized, line
        # delimited file with UTF-8 encoding that provides a list of group and version IDs and the deployment
        # type. This file must be less than 100 MB. Currently, AWS IoT Greengrass supports only
        # ''NewDeployment'' deployment types.

        @[JSON::Field(key: "InputFileUri")]
        getter input_file_uri : String


        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter amzn_client_token : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @execution_role_arn : String,
          @input_file_uri : String,
          @amzn_client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartBulkDeploymentResponse
        include JSON::Serializable

        # The ARN of the bulk deployment.

        @[JSON::Field(key: "BulkDeploymentArn")]
        getter bulk_deployment_arn : String?

        # The ID of the bulk deployment.

        @[JSON::Field(key: "BulkDeploymentId")]
        getter bulk_deployment_id : String?

        def initialize(
          @bulk_deployment_arn : String? = nil,
          @bulk_deployment_id : String? = nil
        )
        end
      end


      struct StopBulkDeploymentRequest
        include JSON::Serializable


        @[JSON::Field(key: "BulkDeploymentId")]
        getter bulk_deployment_id : String

        def initialize(
          @bulk_deployment_id : String
        )
        end
      end


      struct StopBulkDeploymentResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a subscription.

      struct Subscription
        include JSON::Serializable

        # A descriptive or arbitrary ID for the subscription. This value must be unique within the
        # subscription definition version. Max length is 128 characters with pattern ''[a-zA-Z0-9:_-]+''.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The source of the subscription. Can be a thing ARN, a Lambda function ARN, a connector ARN, 'cloud'
        # (which represents the AWS IoT cloud), or 'GGShadowService'.

        @[JSON::Field(key: "Source")]
        getter source : String

        # The MQTT topic used to route the message.

        @[JSON::Field(key: "Subject")]
        getter subject : String

        # Where the message is sent to. Can be a thing ARN, a Lambda function ARN, a connector ARN, 'cloud'
        # (which represents the AWS IoT cloud), or 'GGShadowService'.

        @[JSON::Field(key: "Target")]
        getter target : String

        def initialize(
          @id : String,
          @source : String,
          @subject : String,
          @target : String
        )
        end
      end

      # Information about a subscription definition version.

      struct SubscriptionDefinitionVersion
        include JSON::Serializable

        # A list of subscriptions.

        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration settings for running telemetry.

      struct TelemetryConfiguration
        include JSON::Serializable

        # Configure telemetry to be on or off.

        @[JSON::Field(key: "Telemetry")]
        getter telemetry : String

        # Synchronization status of the device reported configuration with the desired configuration.

        @[JSON::Field(key: "ConfigurationSyncStatus")]
        getter configuration_sync_status : String?

        def initialize(
          @telemetry : String,
          @configuration_sync_status : String? = nil
        )
        end
      end

      # Configuration settings for running telemetry.

      struct TelemetryConfigurationUpdate
        include JSON::Serializable

        # Configure telemetry to be on or off.

        @[JSON::Field(key: "Telemetry")]
        getter telemetry : String

        def initialize(
          @telemetry : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Information required to update a Greengrass core's connectivity.

      struct UpdateConnectivityInfoRequest
        include JSON::Serializable


        @[JSON::Field(key: "ThingName")]
        getter thing_name : String

        # A list of connectivity info.

        @[JSON::Field(key: "ConnectivityInfo")]
        getter connectivity_info : Array(Types::ConnectivityInfo)?

        def initialize(
          @thing_name : String,
          @connectivity_info : Array(Types::ConnectivityInfo)? = nil
        )
        end
      end


      struct UpdateConnectivityInfoResponse
        include JSON::Serializable

        # A message about the connectivity info update request.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The new version of the connectivity info.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @message : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateConnectorDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ConnectorDefinitionId")]
        getter connector_definition_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @connector_definition_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateConnectorDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateCoreDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "CoreDefinitionId")]
        getter core_definition_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @core_definition_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateCoreDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDeviceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeviceDefinitionId")]
        getter device_definition_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @device_definition_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateDeviceDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateFunctionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "FunctionDefinitionId")]
        getter function_definition_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @function_definition_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateFunctionDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateGroupCertificateConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The amount of time remaining before the certificate expires, in milliseconds.

        @[JSON::Field(key: "CertificateExpiryInMilliseconds")]
        getter certificate_expiry_in_milliseconds : String?

        def initialize(
          @group_id : String,
          @certificate_expiry_in_milliseconds : String? = nil
        )
        end
      end


      struct UpdateGroupCertificateConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "CertificateAuthorityExpiryInMilliseconds")]
        getter certificate_authority_expiry_in_milliseconds : String?


        @[JSON::Field(key: "CertificateExpiryInMilliseconds")]
        getter certificate_expiry_in_milliseconds : String?


        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        def initialize(
          @certificate_authority_expiry_in_milliseconds : String? = nil,
          @certificate_expiry_in_milliseconds : String? = nil,
          @group_id : String? = nil
        )
        end
      end


      struct UpdateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "GroupId")]
        getter group_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @group_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLoggerDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoggerDefinitionId")]
        getter logger_definition_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @logger_definition_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateLoggerDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateResourceDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceDefinitionId")]
        getter resource_definition_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @resource_definition_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateResourceDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateSubscriptionDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "SubscriptionDefinitionId")]
        getter subscription_definition_id : String


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @subscription_definition_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateSubscriptionDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateThingRuntimeConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ThingName")]
        getter thing_name : String


        @[JSON::Field(key: "TelemetryConfiguration")]
        getter telemetry_configuration : Types::TelemetryConfigurationUpdate?

        def initialize(
          @thing_name : String,
          @telemetry_configuration : Types::TelemetryConfigurationUpdate? = nil
        )
        end
      end


      struct UpdateThingRuntimeConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a version.

      struct VersionInformation
        include JSON::Serializable

        # The ARN of the version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time, in milliseconds since the epoch, when the version was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : String?

        # The ID of the parent definition that the version is associated with.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ID of the version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_timestamp : String? = nil,
          @id : String? = nil,
          @version : String? = nil
        )
        end
      end
    end
  end
end
