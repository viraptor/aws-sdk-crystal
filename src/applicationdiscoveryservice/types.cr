require "json"
require "time"

module Aws
  module ApplicationDiscoveryService
    module Types

      # Information about agents that were instructed to start collecting data. Information includes the
      # agent ID, a description of the operation, and whether the agent configuration was updated.

      struct AgentConfigurationStatus
        include JSON::Serializable

        # The agent ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # A description of the operation performed.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about the status of the StartDataCollection and StopDataCollection operations. The
        # system has recorded the data collection operation. The agent receives this command the next time it
        # polls for a new command.

        @[JSON::Field(key: "operationSucceeded")]
        getter operation_succeeded : Bool?

        def initialize(
          @agent_id : String? = nil,
          @description : String? = nil,
          @operation_succeeded : Bool? = nil
        )
        end
      end

      # Information about agents associated with the user’s Amazon Web Services account. Information
      # includes agent IDs, IP addresses, media access control (MAC) addresses, agent or collector status,
      # hostname where the agent resides, and agent version for each agent.

      struct AgentInfo
        include JSON::Serializable

        # The agent or collector ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # Network details about the host where the agent or collector resides.

        @[JSON::Field(key: "agentNetworkInfoList")]
        getter agent_network_info_list : Array(Types::AgentNetworkInfo)?

        # Type of agent.

        @[JSON::Field(key: "agentType")]
        getter agent_type : String?

        # Status of the collection process for an agent.

        @[JSON::Field(key: "collectionStatus")]
        getter collection_status : String?

        # The ID of the connector.

        @[JSON::Field(key: "connectorId")]
        getter connector_id : String?

        # The health of the agent.

        @[JSON::Field(key: "health")]
        getter health : String?

        # The name of the host where the agent or collector resides. The host can be a server or virtual
        # machine.

        @[JSON::Field(key: "hostName")]
        getter host_name : String?

        # Time since agent health was reported.

        @[JSON::Field(key: "lastHealthPingTime")]
        getter last_health_ping_time : String?

        # Agent's first registration timestamp in UTC.

        @[JSON::Field(key: "registeredTime")]
        getter registered_time : String?

        # The agent or collector version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @agent_id : String? = nil,
          @agent_network_info_list : Array(Types::AgentNetworkInfo)? = nil,
          @agent_type : String? = nil,
          @collection_status : String? = nil,
          @connector_id : String? = nil,
          @health : String? = nil,
          @host_name : String? = nil,
          @last_health_ping_time : String? = nil,
          @registered_time : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Network details about the host where the agent/collector resides.

      struct AgentNetworkInfo
        include JSON::Serializable

        # The IP address for the host where the agent/collector resides.

        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The MAC address for the host where the agent/collector resides.

        @[JSON::Field(key: "macAddress")]
        getter mac_address : String?

        def initialize(
          @ip_address : String? = nil,
          @mac_address : String? = nil
        )
        end
      end


      struct AssociateConfigurationItemsToApplicationRequest
        include JSON::Serializable

        # The configuration ID of an application with which items are to be associated.

        @[JSON::Field(key: "applicationConfigurationId")]
        getter application_configuration_id : String

        # The ID of each configuration item to be associated with an application.

        @[JSON::Field(key: "configurationIds")]
        getter configuration_ids : Array(String)

        def initialize(
          @application_configuration_id : String,
          @configuration_ids : Array(String)
        )
        end
      end


      struct AssociateConfigurationItemsToApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The user does not have permission to perform the action. Check the IAM policy associated with this
      # user.

      struct AuthorizationErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing the agent or data collector that failed to delete, each containing agentId,
      # errorMessage, and errorCode.

      struct BatchDeleteAgentError
        include JSON::Serializable

        # The ID of the agent or data collector to delete.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The type of error that occurred for the delete failed agent. Valid status are: AGENT_IN_USE |
        # NOT_FOUND | INTERNAL_SERVER_ERROR.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The description of the error that occurred for the delete failed agent.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @agent_id : String,
          @error_code : String,
          @error_message : String
        )
        end
      end


      struct BatchDeleteAgentsRequest
        include JSON::Serializable

        # The list of agents to delete.

        @[JSON::Field(key: "deleteAgents")]
        getter delete_agents : Array(Types::DeleteAgent)

        def initialize(
          @delete_agents : Array(Types::DeleteAgent)
        )
        end
      end


      struct BatchDeleteAgentsResponse
        include JSON::Serializable

        # A list of agent IDs that failed to delete during the deletion task, each paired with an error
        # message.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteAgentError)?

        def initialize(
          @errors : Array(Types::BatchDeleteAgentError)? = nil
        )
        end
      end

      # A metadata object that represents the deletion task being executed.

      struct BatchDeleteConfigurationTask
        include JSON::Serializable

        # The type of configuration item to delete. Supported types are: SERVER.

        @[JSON::Field(key: "configurationType")]
        getter configuration_type : String?

        # The list of configuration IDs that were successfully deleted by the deletion task.

        @[JSON::Field(key: "deletedConfigurations")]
        getter deleted_configurations : Array(String)?

        # A list of configuration IDs that produced warnings regarding their deletion, paired with a warning
        # message.

        @[JSON::Field(key: "deletionWarnings")]
        getter deletion_warnings : Array(Types::DeletionWarning)?

        # An epoch seconds timestamp (UTC) of when the deletion task was completed or failed.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # A list of configuration IDs that failed to delete during the deletion task, each paired with an
        # error message.

        @[JSON::Field(key: "failedConfigurations")]
        getter failed_configurations : Array(Types::FailedConfiguration)?

        # The list of configuration IDs that were originally requested to be deleted by the deletion task.

        @[JSON::Field(key: "requestedConfigurations")]
        getter requested_configurations : Array(String)?

        # An epoch seconds timestamp (UTC) of when the deletion task was started.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The current execution status of the deletion task. Valid status are: INITIALIZING | VALIDATING |
        # DELETING | COMPLETED | FAILED.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The deletion task's unique identifier.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @configuration_type : String? = nil,
          @deleted_configurations : Array(String)? = nil,
          @deletion_warnings : Array(Types::DeletionWarning)? = nil,
          @end_time : Time? = nil,
          @failed_configurations : Array(Types::FailedConfiguration)? = nil,
          @requested_configurations : Array(String)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      # Error messages returned for each import task that you deleted as a response for this command.

      struct BatchDeleteImportDataError
        include JSON::Serializable

        # The type of error that occurred for a specific import task.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The description of the error that occurred for a specific import task.

        @[JSON::Field(key: "errorDescription")]
        getter error_description : String?

        # The unique import ID associated with the error that occurred.

        @[JSON::Field(key: "importTaskId")]
        getter import_task_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_description : String? = nil,
          @import_task_id : String? = nil
        )
        end
      end


      struct BatchDeleteImportDataRequest
        include JSON::Serializable

        # The IDs for the import tasks that you want to delete.

        @[JSON::Field(key: "importTaskIds")]
        getter import_task_ids : Array(String)

        # Set to true to remove the deleted import task from DescribeImportTasks .

        @[JSON::Field(key: "deleteHistory")]
        getter delete_history : Bool?

        def initialize(
          @import_task_ids : Array(String),
          @delete_history : Bool? = nil
        )
        end
      end


      struct BatchDeleteImportDataResponse
        include JSON::Serializable

        # Error messages returned for each import task that you deleted as a response for this command.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteImportDataError)?

        def initialize(
          @errors : Array(Types::BatchDeleteImportDataError)? = nil
        )
        end
      end

      # Tags for a configuration item. Tags are metadata that help you categorize IT assets.

      struct ConfigurationTag
        include JSON::Serializable

        # The configuration ID for the item to tag. You can specify a list of keys and values.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        # A type of IT asset to tag.

        @[JSON::Field(key: "configurationType")]
        getter configuration_type : String?

        # A type of tag on which to filter. For example, serverType .

        @[JSON::Field(key: "key")]
        getter key : String?

        # The time the configuration tag was created in Coordinated Universal Time (UTC).

        @[JSON::Field(key: "timeOfCreation", converter: Aws::Runtime::UnixTimestampConverter)]
        getter time_of_creation : Time?

        # A value on which to filter. For example key = serverType and value = web server .

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @configuration_id : String? = nil,
          @configuration_type : String? = nil,
          @key : String? = nil,
          @time_of_creation : Time? = nil,
          @value : String? = nil
        )
        end
      end

      # Conflict error.

      struct ConflictErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of continuous export descriptions.

      struct ContinuousExportDescription
        include JSON::Serializable

        # The type of data collector used to gather this data (currently only offered for AGENT).

        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # The unique ID assigned to this export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        # The name of the s3 bucket where the export data parquet files are stored.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # An object which describes how the data is stored. databaseName - the name of the Glue database used
        # to store the schema.

        @[JSON::Field(key: "schemaStorageConfig")]
        getter schema_storage_config : Hash(String, String)?

        # The timestamp representing when the continuous export was started.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Describes the status of the export. Can be one of the following values: START_IN_PROGRESS - setting
        # up resources to start continuous export. START_FAILED - an error occurred setting up continuous
        # export. To recover, call start-continuous-export again. ACTIVE - data is being exported to the
        # customer bucket. ERROR - an error occurred during export. To fix the issue, call
        # stop-continuous-export and start-continuous-export. STOP_IN_PROGRESS - stopping the export.
        # STOP_FAILED - an error occurred stopping the export. To recover, call stop-continuous-export again.
        # INACTIVE - the continuous export has been stopped. Data is no longer being exported to the customer
        # bucket.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Contains information about any errors that have occurred. This data type can have the following
        # values: ACCESS_DENIED - You don’t have permission to start Data Exploration in Amazon Athena.
        # Contact your Amazon Web Services administrator for help. For more information, see Setting Up Amazon
        # Web Services Application Discovery Service in the Application Discovery Service User Guide.
        # DELIVERY_STREAM_LIMIT_FAILURE - You reached the limit for Amazon Kinesis Data Firehose delivery
        # streams. Reduce the number of streams or request a limit increase and try again. For more
        # information, see Kinesis Data Streams Limits in the Amazon Kinesis Data Streams Developer Guide.
        # FIREHOSE_ROLE_MISSING - The Data Exploration feature is in an error state because your user is
        # missing the Amazon Web ServicesApplicationDiscoveryServiceFirehose role. Turn on Data Exploration in
        # Amazon Athena and try again. For more information, see Creating the Amazon Web
        # ServicesApplicationDiscoveryServiceFirehose Role in the Application Discovery Service User Guide.
        # FIREHOSE_STREAM_DOES_NOT_EXIST - The Data Exploration feature is in an error state because your user
        # is missing one or more of the Kinesis data delivery streams. INTERNAL_FAILURE - The Data Exploration
        # feature is in an error state because of an internal failure. Try again later. If this problem
        # persists, contact Amazon Web Services Support. LAKE_FORMATION_ACCESS_DENIED - You don't have
        # sufficient lake formation permissions to start continuous export. For more information, see
        # Upgrading Amazon Web Services Glue Data Permissions to the Amazon Web Services Lake Formation Model
        # in the Amazon Web Services Lake Formation Developer Guide . You can use one of the following two
        # ways to resolve this issue. If you don’t want to use the Lake Formation permission model, you can
        # change the default Data Catalog settings to use only Amazon Web Services Identity and Access
        # Management (IAM) access control for new databases. For more information, see Change Data Catalog
        # Settings in the Lake Formation Developer Guide . You can give the service-linked IAM roles
        # AWSServiceRoleForApplicationDiscoveryServiceContinuousExport and
        # AWSApplicationDiscoveryServiceFirehose the required Lake Formation permissions. For more
        # information, see Granting Database Permissions in the Lake Formation Developer Guide .
        # AWSServiceRoleForApplicationDiscoveryServiceContinuousExport - Grant database creator permissions,
        # which gives the role database creation ability and implicit permissions for any created tables. For
        # more information, see Implicit Lake Formation Permissions in the Lake Formation Developer Guide .
        # AWSApplicationDiscoveryServiceFirehose - Grant describe permissions for all tables in the database.
        # S3_BUCKET_LIMIT_FAILURE - You reached the limit for Amazon S3 buckets. Reduce the number of S3
        # buckets or request a limit increase and try again. For more information, see Bucket Restrictions and
        # Limitations in the Amazon Simple Storage Service Developer Guide. S3_NOT_SIGNED_UP - Your account is
        # not signed up for the Amazon S3 service. You must sign up before you can use Amazon S3. You can sign
        # up at the following URL: https://aws.amazon.com/s3 .

        @[JSON::Field(key: "statusDetail")]
        getter status_detail : String?

        # The timestamp that represents when this continuous export was stopped.

        @[JSON::Field(key: "stopTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stop_time : Time?

        def initialize(
          @data_source : String? = nil,
          @export_id : String? = nil,
          @s3_bucket : String? = nil,
          @schema_storage_config : Hash(String, String)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_detail : String? = nil,
          @stop_time : Time? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # The name of the application to be created.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the application to be created.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the migration wave of the application to be created.

        @[JSON::Field(key: "wave")]
        getter wave : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @wave : String? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # The configuration ID of an application to be created.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        def initialize(
          @configuration_id : String? = nil
        )
        end
      end


      struct CreateTagsRequest
        include JSON::Serializable

        # A list of configuration items that you want to tag.

        @[JSON::Field(key: "configurationIds")]
        getter configuration_ids : Array(String)

        # Tags that you want to associate with one or more configuration items. Specify the tags that you want
        # to create in a key - value format. For example: {"key": "serverType", "value": "webServer"}

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @configuration_ids : Array(String),
          @tags : Array(Types::Tag)
        )
        end
      end


      struct CreateTagsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Inventory data for installed discovery agents.

      struct CustomerAgentInfo
        include JSON::Serializable

        # Number of active discovery agents.

        @[JSON::Field(key: "activeAgents")]
        getter active_agents : Int32

        # Number of blacklisted discovery agents.

        @[JSON::Field(key: "blackListedAgents")]
        getter black_listed_agents : Int32

        # Number of healthy discovery agents

        @[JSON::Field(key: "healthyAgents")]
        getter healthy_agents : Int32

        # Number of discovery agents with status SHUTDOWN.

        @[JSON::Field(key: "shutdownAgents")]
        getter shutdown_agents : Int32

        # Total number of discovery agents.

        @[JSON::Field(key: "totalAgents")]
        getter total_agents : Int32

        # Number of unhealthy discovery agents.

        @[JSON::Field(key: "unhealthyAgents")]
        getter unhealthy_agents : Int32

        # Number of unknown discovery agents.

        @[JSON::Field(key: "unknownAgents")]
        getter unknown_agents : Int32

        def initialize(
          @active_agents : Int32,
          @black_listed_agents : Int32,
          @healthy_agents : Int32,
          @shutdown_agents : Int32,
          @total_agents : Int32,
          @unhealthy_agents : Int32,
          @unknown_agents : Int32
        )
        end
      end

      # The inventory data for installed Agentless Collector collectors.

      struct CustomerAgentlessCollectorInfo
        include JSON::Serializable

        # The number of active Agentless Collector collectors.

        @[JSON::Field(key: "activeAgentlessCollectors")]
        getter active_agentless_collectors : Int32

        # The number of deny-listed Agentless Collector collectors.

        @[JSON::Field(key: "denyListedAgentlessCollectors")]
        getter deny_listed_agentless_collectors : Int32

        # The number of healthy Agentless Collector collectors.

        @[JSON::Field(key: "healthyAgentlessCollectors")]
        getter healthy_agentless_collectors : Int32

        # The number of Agentless Collector collectors with SHUTDOWN status.

        @[JSON::Field(key: "shutdownAgentlessCollectors")]
        getter shutdown_agentless_collectors : Int32

        # The total number of Agentless Collector collectors.

        @[JSON::Field(key: "totalAgentlessCollectors")]
        getter total_agentless_collectors : Int32

        # The number of unhealthy Agentless Collector collectors.

        @[JSON::Field(key: "unhealthyAgentlessCollectors")]
        getter unhealthy_agentless_collectors : Int32

        # The number of unknown Agentless Collector collectors.

        @[JSON::Field(key: "unknownAgentlessCollectors")]
        getter unknown_agentless_collectors : Int32

        def initialize(
          @active_agentless_collectors : Int32,
          @deny_listed_agentless_collectors : Int32,
          @healthy_agentless_collectors : Int32,
          @shutdown_agentless_collectors : Int32,
          @total_agentless_collectors : Int32,
          @unhealthy_agentless_collectors : Int32,
          @unknown_agentless_collectors : Int32
        )
        end
      end

      # Inventory data for installed discovery connectors.

      struct CustomerConnectorInfo
        include JSON::Serializable

        # Number of active discovery connectors.

        @[JSON::Field(key: "activeConnectors")]
        getter active_connectors : Int32

        # Number of blacklisted discovery connectors.

        @[JSON::Field(key: "blackListedConnectors")]
        getter black_listed_connectors : Int32

        # Number of healthy discovery connectors.

        @[JSON::Field(key: "healthyConnectors")]
        getter healthy_connectors : Int32

        # Number of discovery connectors with status SHUTDOWN,

        @[JSON::Field(key: "shutdownConnectors")]
        getter shutdown_connectors : Int32

        # Total number of discovery connectors.

        @[JSON::Field(key: "totalConnectors")]
        getter total_connectors : Int32

        # Number of unhealthy discovery connectors.

        @[JSON::Field(key: "unhealthyConnectors")]
        getter unhealthy_connectors : Int32

        # Number of unknown discovery connectors.

        @[JSON::Field(key: "unknownConnectors")]
        getter unknown_connectors : Int32

        def initialize(
          @active_connectors : Int32,
          @black_listed_connectors : Int32,
          @healthy_connectors : Int32,
          @shutdown_connectors : Int32,
          @total_connectors : Int32,
          @unhealthy_connectors : Int32,
          @unknown_connectors : Int32
        )
        end
      end

      # The inventory data for installed Migration Evaluator collectors.

      struct CustomerMeCollectorInfo
        include JSON::Serializable

        # The number of active Migration Evaluator collectors.

        @[JSON::Field(key: "activeMeCollectors")]
        getter active_me_collectors : Int32

        # The number of deny-listed Migration Evaluator collectors.

        @[JSON::Field(key: "denyListedMeCollectors")]
        getter deny_listed_me_collectors : Int32

        # The number of healthy Migration Evaluator collectors.

        @[JSON::Field(key: "healthyMeCollectors")]
        getter healthy_me_collectors : Int32

        # The number of Migration Evaluator collectors with SHUTDOWN status.

        @[JSON::Field(key: "shutdownMeCollectors")]
        getter shutdown_me_collectors : Int32

        # The total number of Migration Evaluator collectors.

        @[JSON::Field(key: "totalMeCollectors")]
        getter total_me_collectors : Int32

        # The number of unhealthy Migration Evaluator collectors.

        @[JSON::Field(key: "unhealthyMeCollectors")]
        getter unhealthy_me_collectors : Int32

        # The number of unknown Migration Evaluator collectors.

        @[JSON::Field(key: "unknownMeCollectors")]
        getter unknown_me_collectors : Int32

        def initialize(
          @active_me_collectors : Int32,
          @deny_listed_me_collectors : Int32,
          @healthy_me_collectors : Int32,
          @shutdown_me_collectors : Int32,
          @total_me_collectors : Int32,
          @unhealthy_me_collectors : Int32,
          @unknown_me_collectors : Int32
        )
        end
      end

      # An object representing the agent or data collector to be deleted along with the optional
      # configurations for error handling.

      struct DeleteAgent
        include JSON::Serializable

        # The ID of the agent or data collector to delete.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # Optional flag used to force delete an agent or data collector. It is needed to delete any agent in
        # HEALTHY/UNHEALTHY/RUNNING status. Note that deleting an agent that is actively reporting health
        # causes it to be re-registered with a different agent ID after data collector re-connects with Amazon
        # Web Services.

        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @agent_id : String,
          @force : Bool? = nil
        )
        end
      end


      struct DeleteApplicationsRequest
        include JSON::Serializable

        # Configuration ID of an application to be deleted.

        @[JSON::Field(key: "configurationIds")]
        getter configuration_ids : Array(String)

        def initialize(
          @configuration_ids : Array(String)
        )
        end
      end


      struct DeleteApplicationsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTagsRequest
        include JSON::Serializable

        # A list of configuration items with tags that you want to delete.

        @[JSON::Field(key: "configurationIds")]
        getter configuration_ids : Array(String)

        # Tags that you want to delete from one or more configuration items. Specify the tags that you want to
        # delete in a key - value format. For example: {"key": "serverType", "value": "webServer"}

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration_ids : Array(String),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct DeleteTagsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A configuration ID paired with a warning message.

      struct DeletionWarning
        include JSON::Serializable

        # The unique identifier of the configuration that produced a warning.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        # The integer warning code associated with the warning message.

        @[JSON::Field(key: "warningCode")]
        getter warning_code : Int32?

        # A descriptive message of the warning the associated configuration ID produced.

        @[JSON::Field(key: "warningText")]
        getter warning_text : String?

        def initialize(
          @configuration_id : String? = nil,
          @warning_code : Int32? = nil,
          @warning_text : String? = nil
        )
        end
      end


      struct DescribeAgentsRequest
        include JSON::Serializable

        # The agent or the collector IDs for which you want information. If you specify no IDs, the system
        # returns information about all agents/collectors associated with your user.

        @[JSON::Field(key: "agentIds")]
        getter agent_ids : Array(String)?

        # You can filter the request using various logical operators and a key - value format. For example:
        # {"key": "collectionStatus", "value": "STARTED"}

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The total number of agents/collectors to return in a single page of output. The maximum value is
        # 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Token to retrieve the next set of results. For example, if you previously specified 100 IDs for
        # DescribeAgentsRequest$agentIds but set DescribeAgentsRequest$maxResults to 10, you received a set of
        # 10 results along with a token. Use that token in this query to get the next set of 10.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_ids : Array(String)? = nil,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAgentsResponse
        include JSON::Serializable

        # Lists agents or the collector by ID or lists all agents/collectors associated with your user, if you
        # did not specify an agent/collector ID. The output includes agent/collector IDs, IP addresses, media
        # access control (MAC) addresses, agent/collector health, host name where the agent/collector resides,
        # and the version number of each agent/collector.

        @[JSON::Field(key: "agentsInfo")]
        getter agents_info : Array(Types::AgentInfo)?

        # Token to retrieve the next set of results. For example, if you specified 100 IDs for
        # DescribeAgentsRequest$agentIds but set DescribeAgentsRequest$maxResults to 10, you received a set of
        # 10 results along with this token. Use this token in the next query to retrieve the next set of 10.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agents_info : Array(Types::AgentInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeBatchDeleteConfigurationTaskRequest
        include JSON::Serializable

        # The ID of the task to delete.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct DescribeBatchDeleteConfigurationTaskResponse
        include JSON::Serializable

        # The BatchDeleteConfigurationTask that represents the deletion task being executed.

        @[JSON::Field(key: "task")]
        getter task : Types::BatchDeleteConfigurationTask?

        def initialize(
          @task : Types::BatchDeleteConfigurationTask? = nil
        )
        end
      end


      struct DescribeConfigurationsRequest
        include JSON::Serializable

        # One or more configuration IDs.

        @[JSON::Field(key: "configurationIds")]
        getter configuration_ids : Array(String)

        def initialize(
          @configuration_ids : Array(String)
        )
        end
      end


      struct DescribeConfigurationsResponse
        include JSON::Serializable

        # A key in the response map. The value is an array of data.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Hash(String, String))?

        def initialize(
          @configurations : Array(Hash(String, String))? = nil
        )
        end
      end


      struct DescribeContinuousExportsRequest
        include JSON::Serializable

        # The unique IDs assigned to the exports.

        @[JSON::Field(key: "exportIds")]
        getter export_ids : Array(String)?

        # A number between 1 and 100 specifying the maximum number of continuous export descriptions returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from the previous call to DescribeExportTasks .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @export_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeContinuousExportsResponse
        include JSON::Serializable

        # A list of continuous export descriptions.

        @[JSON::Field(key: "descriptions")]
        getter descriptions : Array(Types::ContinuousExportDescription)?

        # The token from the previous call to DescribeExportTasks .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @descriptions : Array(Types::ContinuousExportDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeExportConfigurationsRequest
        include JSON::Serializable

        # A list of continuous export IDs to search for.

        @[JSON::Field(key: "exportIds")]
        getter export_ids : Array(String)?

        # A number between 1 and 100 specifying the maximum number of continuous export descriptions returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from the previous call to describe-export-tasks.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @export_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeExportConfigurationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "exportsInfo")]
        getter exports_info : Array(Types::ExportInfo)?

        # The token from the previous call to describe-export-tasks.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @exports_info : Array(Types::ExportInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeExportTasksRequest
        include JSON::Serializable

        # One or more unique identifiers used to query the status of an export request.

        @[JSON::Field(key: "exportIds")]
        getter export_ids : Array(String)?

        # One or more filters. AgentId - ID of the agent whose collected data will be exported

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ExportFilter)?

        # The maximum number of volume results returned by DescribeExportTasks in paginated output. When this
        # parameter is used, DescribeExportTasks only returns maxResults results in a single page along with a
        # nextToken response element.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeExportTasks request where maxResults
        # was used and the results exceeded the value of that parameter. Pagination continues from the end of
        # the previous results that returned the nextToken value. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @export_ids : Array(String)? = nil,
          @filters : Array(Types::ExportFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeExportTasksResponse
        include JSON::Serializable

        # Contains one or more sets of export request details. When the status of a request is SUCCEEDED , the
        # response includes a URL for an Amazon S3 bucket where you can view the data in a CSV file.

        @[JSON::Field(key: "exportsInfo")]
        getter exports_info : Array(Types::ExportInfo)?

        # The nextToken value to include in a future DescribeExportTasks request. When the results of a
        # DescribeExportTasks request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @exports_info : Array(Types::ExportInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeImportTasksRequest
        include JSON::Serializable

        # An array of name-value pairs that you provide to filter the results for the DescribeImportTask
        # request to a specific subset of results. Currently, wildcard values aren't supported for filters.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ImportTaskFilter)?

        # The maximum number of results that you want this request to return, up to 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request a specific page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ImportTaskFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeImportTasksResponse
        include JSON::Serializable

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A returned array of import tasks that match any applied filters, up to the specified number of
        # maximum results.

        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::ImportTask)?

        def initialize(
          @next_token : String? = nil,
          @tasks : Array(Types::ImportTask)? = nil
        )
        end
      end


      struct DescribeTagsRequest
        include JSON::Serializable

        # You can filter the list using a key - value format. You can separate these items by using logical
        # operators. Allowed filters include tagKey , tagValue , and configurationId .

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::TagFilter)?

        # The total number of items to return in a single page of output. The maximum value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::TagFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeTagsResponse
        include JSON::Serializable

        # The call returns a token. Use this token to get the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Depending on the input, this is a list of configuration items tagged with a specific tag, or a list
        # of tags for a specific configuration item.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::ConfigurationTag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::ConfigurationTag)? = nil
        )
        end
      end


      struct DisassociateConfigurationItemsFromApplicationRequest
        include JSON::Serializable

        # Configuration ID of an application from which each item is disassociated.

        @[JSON::Field(key: "applicationConfigurationId")]
        getter application_configuration_id : String

        # Configuration ID of each item to be disassociated from an application.

        @[JSON::Field(key: "configurationIds")]
        getter configuration_ids : Array(String)

        def initialize(
          @application_configuration_id : String,
          @configuration_ids : Array(String)
        )
        end
      end


      struct DisassociateConfigurationItemsFromApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that the exported data must include EC2 instance type matches for on-premises servers that
      # are discovered through Amazon Web Services Application Discovery Service.

      struct Ec2RecommendationsExportPreferences
        include JSON::Serializable

        # The recommended EC2 instance type that matches the CPU usage metric of server performance data.

        @[JSON::Field(key: "cpuPerformanceMetricBasis")]
        getter cpu_performance_metric_basis : Types::UsageMetricBasis?

        # If set to true, the export preferences is set to Ec2RecommendationsExportPreferences .

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # An array of instance types to exclude from recommendations.

        @[JSON::Field(key: "excludedInstanceTypes")]
        getter excluded_instance_types : Array(String)?

        # The target Amazon Web Services Region for the recommendations. You can use any of the Region codes
        # available for the chosen service, as listed in Amazon Web Services service endpoints in the Amazon
        # Web Services General Reference .

        @[JSON::Field(key: "preferredRegion")]
        getter preferred_region : String?

        # The recommended EC2 instance type that matches the Memory usage metric of server performance data.

        @[JSON::Field(key: "ramPerformanceMetricBasis")]
        getter ram_performance_metric_basis : Types::UsageMetricBasis?

        # The contract type for a reserved instance. If blank, we assume an On-Demand instance is preferred.

        @[JSON::Field(key: "reservedInstanceOptions")]
        getter reserved_instance_options : Types::ReservedInstanceOptions?

        # The target tenancy to use for your recommended EC2 instances.

        @[JSON::Field(key: "tenancy")]
        getter tenancy : String?

        def initialize(
          @cpu_performance_metric_basis : Types::UsageMetricBasis? = nil,
          @enabled : Bool? = nil,
          @excluded_instance_types : Array(String)? = nil,
          @preferred_region : String? = nil,
          @ram_performance_metric_basis : Types::UsageMetricBasis? = nil,
          @reserved_instance_options : Types::ReservedInstanceOptions? = nil,
          @tenancy : String? = nil
        )
        end
      end


      struct ExportConfigurationsResponse
        include JSON::Serializable

        # A unique identifier that you can use to query the export status.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        def initialize(
          @export_id : String? = nil
        )
        end
      end

      # Used to select which agent's data is to be exported. A single agent ID may be selected for export
      # using the StartExportTask action.

      struct ExportFilter
        include JSON::Serializable

        # Supported condition: EQUALS

        @[JSON::Field(key: "condition")]
        getter condition : String

        # A single ExportFilter name. Supported filters: agentIds .

        @[JSON::Field(key: "name")]
        getter name : String

        # A single agent ID for a Discovery Agent. An agent ID can be found using the DescribeAgents action.
        # Typically an ADS agent ID is in the form o-0123456789abcdef0 .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @condition : String,
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Information regarding the export status of discovered data. The value is an array of objects.

      struct ExportInfo
        include JSON::Serializable

        # A unique identifier used to query an export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String

        # The time that the data export was initiated.

        @[JSON::Field(key: "exportRequestTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter export_request_time : Time

        # The status of the data export job.

        @[JSON::Field(key: "exportStatus")]
        getter export_status : String

        # A status message provided for API callers.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # A URL for an Amazon S3 bucket where you can review the exported data. The URL is displayed only if
        # the export succeeded.

        @[JSON::Field(key: "configurationsDownloadUrl")]
        getter configurations_download_url : String?

        # If true, the export of agent information exceeded the size limit for a single export and the
        # exported data is incomplete for the requested time range. To address this, select a smaller time
        # range for the export by using startDate and endDate .

        @[JSON::Field(key: "isTruncated")]
        getter is_truncated : Bool?

        # The endTime used in the StartExportTask request. If no endTime was requested, this result does not
        # appear in ExportInfo .

        @[JSON::Field(key: "requestedEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter requested_end_time : Time?

        # The value of startTime parameter in the StartExportTask request. If no startTime was requested, this
        # result does not appear in ExportInfo .

        @[JSON::Field(key: "requestedStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter requested_start_time : Time?

        def initialize(
          @export_id : String,
          @export_request_time : Time,
          @export_status : String,
          @status_message : String,
          @configurations_download_url : String? = nil,
          @is_truncated : Bool? = nil,
          @requested_end_time : Time? = nil,
          @requested_start_time : Time? = nil
        )
        end
      end

      # Indicates the type of data that is being exported. Only one ExportPreferences can be enabled for a
      # StartExportTask action.

      struct ExportPreferences
        include JSON::Serializable

        # If enabled, exported data includes EC2 instance type matches for on-premises servers discovered
        # through Amazon Web Services Application Discovery Service.

        @[JSON::Field(key: "ec2RecommendationsPreferences")]
        getter ec2_recommendations_preferences : Types::Ec2RecommendationsExportPreferences?

        def initialize(
          @ec2_recommendations_preferences : Types::Ec2RecommendationsExportPreferences? = nil
        )
        end
      end

      # A configuration ID paired with an error message.

      struct FailedConfiguration
        include JSON::Serializable

        # The unique identifier of the configuration the failed to delete.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        # A descriptive message indicating why the associated configuration failed to delete.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The integer error code associated with the error message.

        @[JSON::Field(key: "errorStatusCode")]
        getter error_status_code : Int32?

        def initialize(
          @configuration_id : String? = nil,
          @error_message : String? = nil,
          @error_status_code : Int32? = nil
        )
        end
      end

      # A filter that can use conditional operators. For more information about filters, see Querying
      # Discovered Configuration Items in the Amazon Web Services Application Discovery Service User Guide .

      struct Filter
        include JSON::Serializable

        # A conditional operator. The following operators are valid: EQUALS, NOT_EQUALS, CONTAINS,
        # NOT_CONTAINS. If you specify multiple filters, the system utilizes all filters as though
        # concatenated by AND . If you specify multiple values for a particular filter, the system
        # differentiates the values using OR . Calling either DescribeConfigurations or ListConfigurations
        # returns attributes of matching configuration items.

        @[JSON::Field(key: "condition")]
        getter condition : String

        # The name of the filter.

        @[JSON::Field(key: "name")]
        getter name : String

        # A string value on which to filter. For example, if you choose the destinationServer.osVersion filter
        # name, you could specify Ubuntu for the value.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @condition : String,
          @name : String,
          @values : Array(String)
        )
        end
      end


      struct GetDiscoverySummaryRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDiscoverySummaryResponse
        include JSON::Serializable

        # Details about discovered agents, including agent status and health.

        @[JSON::Field(key: "agentSummary")]
        getter agent_summary : Types::CustomerAgentInfo?

        # Details about Agentless Collector collectors, including status.

        @[JSON::Field(key: "agentlessCollectorSummary")]
        getter agentless_collector_summary : Types::CustomerAgentlessCollectorInfo?

        # The number of applications discovered.

        @[JSON::Field(key: "applications")]
        getter applications : Int64?

        # Details about discovered connectors, including connector status and health.

        @[JSON::Field(key: "connectorSummary")]
        getter connector_summary : Types::CustomerConnectorInfo?

        # Details about Migration Evaluator collectors, including collector status and health.

        @[JSON::Field(key: "meCollectorSummary")]
        getter me_collector_summary : Types::CustomerMeCollectorInfo?

        # The number of servers discovered.

        @[JSON::Field(key: "servers")]
        getter servers : Int64?

        # The number of servers mapped to applications.

        @[JSON::Field(key: "serversMappedToApplications")]
        getter servers_mapped_to_applications : Int64?

        # The number of servers mapped to tags.

        @[JSON::Field(key: "serversMappedtoTags")]
        getter servers_mappedto_tags : Int64?

        def initialize(
          @agent_summary : Types::CustomerAgentInfo? = nil,
          @agentless_collector_summary : Types::CustomerAgentlessCollectorInfo? = nil,
          @applications : Int64? = nil,
          @connector_summary : Types::CustomerConnectorInfo? = nil,
          @me_collector_summary : Types::CustomerMeCollectorInfo? = nil,
          @servers : Int64? = nil,
          @servers_mapped_to_applications : Int64? = nil,
          @servers_mappedto_tags : Int64? = nil
        )
        end
      end

      # The home Region is not set. Set the home Region to continue.

      struct HomeRegionNotSetException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An array of information related to the import task request that includes status information, times,
      # IDs, the Amazon S3 Object URL for the import file, and more.

      struct ImportTask
        include JSON::Serializable

        # The total number of application records in the import file that failed to be imported.

        @[JSON::Field(key: "applicationImportFailure")]
        getter application_import_failure : Int32?

        # The total number of application records in the import file that were successfully imported.

        @[JSON::Field(key: "applicationImportSuccess")]
        getter application_import_success : Int32?

        # A unique token used to prevent the same import request from occurring more than once. If you didn't
        # provide a token, a token was automatically generated when the import task request was sent.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A link to a compressed archive folder (in the ZIP format) that contains an error log and a file of
        # failed records. You can use these two files to quickly identify records that failed, why they
        # failed, and correct those records. Afterward, you can upload the corrected file to your Amazon S3
        # bucket and create another import task request. This field also includes authorization information so
        # you can confirm the authenticity of the compressed archive before you download it. If some records
        # failed to be imported we recommend that you correct the records in the failed entries file and then
        # imports that failed entries file. This prevents you from having to correct and update the larger
        # original file and attempt importing it again.

        @[JSON::Field(key: "errorsAndFailedEntriesZip")]
        getter errors_and_failed_entries_zip : String?

        # The type of file detected by the import task.

        @[JSON::Field(key: "fileClassification")]
        getter file_classification : String?

        # The time that the import task request finished, presented in the Unix time stamp format.

        @[JSON::Field(key: "importCompletionTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter import_completion_time : Time?

        # The time that the import task request was deleted, presented in the Unix time stamp format.

        @[JSON::Field(key: "importDeletedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter import_deleted_time : Time?

        # The time that the import task request was made, presented in the Unix time stamp format.

        @[JSON::Field(key: "importRequestTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter import_request_time : Time?

        # The unique ID for a specific import task. These IDs aren't globally unique, but they are unique
        # within an Amazon Web Services account.

        @[JSON::Field(key: "importTaskId")]
        getter import_task_id : String?

        # The URL for your import file that you've uploaded to Amazon S3.

        @[JSON::Field(key: "importUrl")]
        getter import_url : String?

        # A descriptive name for an import task. You can use this name to filter future requests related to
        # this import task, such as identifying applications and servers that were included in this import
        # task. We recommend that you use a meaningful name for each import task.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The total number of server records in the import file that failed to be imported.

        @[JSON::Field(key: "serverImportFailure")]
        getter server_import_failure : Int32?

        # The total number of server records in the import file that were successfully imported.

        @[JSON::Field(key: "serverImportSuccess")]
        getter server_import_success : Int32?

        # The status of the import task. An import can have the status of IMPORT_COMPLETE and still have some
        # records fail to import from the overall request. More information can be found in the downloadable
        # archive defined in the errorsAndFailedEntriesZip field, or in the Migration Hub management console.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @application_import_failure : Int32? = nil,
          @application_import_success : Int32? = nil,
          @client_request_token : String? = nil,
          @errors_and_failed_entries_zip : String? = nil,
          @file_classification : String? = nil,
          @import_completion_time : Time? = nil,
          @import_deleted_time : Time? = nil,
          @import_request_time : Time? = nil,
          @import_task_id : String? = nil,
          @import_url : String? = nil,
          @name : String? = nil,
          @server_import_failure : Int32? = nil,
          @server_import_success : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # A name-values pair of elements you can use to filter the results when querying your import tasks.
      # Currently, wildcards are not supported for filters. When filtering by import status, all other
      # filter values are ignored.

      struct ImportTaskFilter
        include JSON::Serializable

        # The name, status, or import task ID for a specific import task.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of strings that you can provide to match against a specific name, status, or import task ID
        # to filter the results for your import task queries.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # One or more parameters are not valid. Verify the parameters and try again.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value of one or more parameters are either invalid or out of range. Verify the parameter values
      # and try again.

      struct InvalidParameterValueException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The limit of 200 configuration IDs per request has been exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListConfigurationsRequest
        include JSON::Serializable

        # A valid configuration identified by Application Discovery Service.

        @[JSON::Field(key: "configurationType")]
        getter configuration_type : String

        # You can filter the request using various logical operators and a key - value format. For example:
        # {"key": "serverType", "value": "webServer"} For a complete list of filter options and guidance about
        # using them with this action, see Using the ListConfigurations Action in the Amazon Web Services
        # Application Discovery Service User Guide .

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The total number of items to return. The maximum value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Token to retrieve the next set of results. For example, if a previous call to ListConfigurations
        # returned 100 items, but you set ListConfigurationsRequest$maxResults to 10, you received a set of 10
        # results along with a token. Use that token in this query to get the next set of 10.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Certain filter criteria return output that can be sorted in ascending or descending order. For a
        # list of output characteristics for each filter, see Using the ListConfigurations Action in the
        # Amazon Web Services Application Discovery Service User Guide .

        @[JSON::Field(key: "orderBy")]
        getter order_by : Array(Types::OrderByElement)?

        def initialize(
          @configuration_type : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order_by : Array(Types::OrderByElement)? = nil
        )
        end
      end


      struct ListConfigurationsResponse
        include JSON::Serializable

        # Returns configuration details, including the configuration ID, attribute names, and attribute
        # values.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Hash(String, String))?

        # Token to retrieve the next set of results. For example, if your call to ListConfigurations returned
        # 100 items, but you set ListConfigurationsRequest$maxResults to 10, you received a set of 10 results
        # along with this token. Use this token in the next query to retrieve the next set of 10.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configurations : Array(Hash(String, String))? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServerNeighborsRequest
        include JSON::Serializable

        # Configuration ID of the server for which neighbors are being listed.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String

        # Maximum number of results to return in a single page of output.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # List of configuration IDs to test for one-hop-away.

        @[JSON::Field(key: "neighborConfigurationIds")]
        getter neighbor_configuration_ids : Array(String)?

        # Token to retrieve the next set of results. For example, if you previously specified 100 IDs for
        # ListServerNeighborsRequest$neighborConfigurationIds but set ListServerNeighborsRequest$maxResults to
        # 10, you received a set of 10 results along with a token. Use that token in this query to get the
        # next set of 10.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Flag to indicate if port and protocol information is needed as part of the response.

        @[JSON::Field(key: "portInformationNeeded")]
        getter port_information_needed : Bool?

        def initialize(
          @configuration_id : String,
          @max_results : Int32? = nil,
          @neighbor_configuration_ids : Array(String)? = nil,
          @next_token : String? = nil,
          @port_information_needed : Bool? = nil
        )
        end
      end


      struct ListServerNeighborsResponse
        include JSON::Serializable

        # List of distinct servers that are one hop away from the given server.

        @[JSON::Field(key: "neighbors")]
        getter neighbors : Array(Types::NeighborConnectionDetail)

        # Count of distinct servers that are one hop away from the given server.

        @[JSON::Field(key: "knownDependencyCount")]
        getter known_dependency_count : Int64?

        # Token to retrieve the next set of results. For example, if you specified 100 IDs for
        # ListServerNeighborsRequest$neighborConfigurationIds but set ListServerNeighborsRequest$maxResults to
        # 10, you received a set of 10 results along with this token. Use this token in the next query to
        # retrieve the next set of 10.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @neighbors : Array(Types::NeighborConnectionDetail),
          @known_dependency_count : Int64? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Details about neighboring servers.

      struct NeighborConnectionDetail
        include JSON::Serializable

        # The number of open network connections with the neighboring server.

        @[JSON::Field(key: "connectionsCount")]
        getter connections_count : Int64

        # The ID of the server that accepted the network connection.

        @[JSON::Field(key: "destinationServerId")]
        getter destination_server_id : String

        # The ID of the server that opened the network connection.

        @[JSON::Field(key: "sourceServerId")]
        getter source_server_id : String

        # The destination network port for the connection.

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # The network protocol used for the connection.

        @[JSON::Field(key: "transportProtocol")]
        getter transport_protocol : String?

        def initialize(
          @connections_count : Int64,
          @destination_server_id : String,
          @source_server_id : String,
          @destination_port : Int32? = nil,
          @transport_protocol : String? = nil
        )
        end
      end

      # This operation is not permitted.

      struct OperationNotPermittedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A field and direction for ordered output.

      struct OrderByElement
        include JSON::Serializable

        # The field on which to order.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # Ordering direction.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @field_name : String,
          @sort_order : String? = nil
        )
        end
      end

      # Used to provide Reserved Instance preferences for the recommendation.

      struct ReservedInstanceOptions
        include JSON::Serializable

        # The flexibility to change the instance types needed for your Reserved Instance.

        @[JSON::Field(key: "offeringClass")]
        getter offering_class : String

        # The payment plan to use for your Reserved Instance.

        @[JSON::Field(key: "purchasingOption")]
        getter purchasing_option : String

        # The preferred duration of the Reserved Instance term.

        @[JSON::Field(key: "termLength")]
        getter term_length : String

        def initialize(
          @offering_class : String,
          @purchasing_option : String,
          @term_length : String
        )
        end
      end

      # This issue occurs when the same clientRequestToken is used with the StartImportTask action, but with
      # different parameters. For example, you use the same request token but have two different import
      # URLs, you can encounter this issue. If the import tasks are meant to be different, use a different
      # clientRequestToken , and try again.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified configuration ID was not located. Verify the configuration ID and try again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The server experienced an internal error. Try again.

      struct ServerInternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartBatchDeleteConfigurationTaskRequest
        include JSON::Serializable

        # The list of configuration IDs that will be deleted by the task.

        @[JSON::Field(key: "configurationIds")]
        getter configuration_ids : Array(String)

        # The type of configuration item to delete. Supported types are: SERVER.

        @[JSON::Field(key: "configurationType")]
        getter configuration_type : String

        def initialize(
          @configuration_ids : Array(String),
          @configuration_type : String
        )
        end
      end


      struct StartBatchDeleteConfigurationTaskResponse
        include JSON::Serializable

        # The unique identifier associated with the newly started deletion task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @task_id : String? = nil
        )
        end
      end


      struct StartContinuousExportRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct StartContinuousExportResponse
        include JSON::Serializable

        # The type of data collector used to gather this data (currently only offered for AGENT).

        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # The unique ID assigned to this export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        # The name of the s3 bucket where the export data parquet files are stored.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # A dictionary which describes how the data is stored. databaseName - the name of the Glue database
        # used to store the schema.

        @[JSON::Field(key: "schemaStorageConfig")]
        getter schema_storage_config : Hash(String, String)?

        # The timestamp representing when the continuous export was started.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @data_source : String? = nil,
          @export_id : String? = nil,
          @s3_bucket : String? = nil,
          @schema_storage_config : Hash(String, String)? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct StartDataCollectionByAgentIdsRequest
        include JSON::Serializable

        # The IDs of the agents from which to start collecting data. If you send a request to an agent ID that
        # you do not have permission to contact, according to your Amazon Web Services account, the service
        # does not throw an exception. Instead, it returns the error in the Description field. If you send a
        # request to multiple agents and you do not have permission to contact some of those agents, the
        # system does not throw an exception. Instead, the system shows Failed in the Description field.

        @[JSON::Field(key: "agentIds")]
        getter agent_ids : Array(String)

        def initialize(
          @agent_ids : Array(String)
        )
        end
      end


      struct StartDataCollectionByAgentIdsResponse
        include JSON::Serializable

        # Information about agents that were instructed to start collecting data. Information includes the
        # agent ID, a description of the operation performed, and whether the agent configuration was updated.

        @[JSON::Field(key: "agentsConfigurationStatus")]
        getter agents_configuration_status : Array(Types::AgentConfigurationStatus)?

        def initialize(
          @agents_configuration_status : Array(Types::AgentConfigurationStatus)? = nil
        )
        end
      end


      struct StartExportTaskRequest
        include JSON::Serializable

        # The end timestamp for exported data from the single Application Discovery Agent selected in the
        # filters. If no value is specified, exported data includes the most recent data collected by the
        # agent.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The file format for the returned export data. Default value is CSV . Note: The GRAPHML option has
        # been deprecated.

        @[JSON::Field(key: "exportDataFormat")]
        getter export_data_format : Array(String)?

        # If a filter is present, it selects the single agentId of the Application Discovery Agent for which
        # data is exported. The agentId can be found in the results of the DescribeAgents API or CLI. If no
        # filter is present, startTime and endTime are ignored and exported data includes both Amazon Web
        # Services Application Discovery Service Agentless Collector collectors data and summary data from
        # Application Discovery Agent agents.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ExportFilter)?

        # Indicates the type of data that needs to be exported. Only one ExportPreferences can be enabled at
        # any time.

        @[JSON::Field(key: "preferences")]
        getter preferences : Types::ExportPreferences?

        # The start timestamp for exported data from the single Application Discovery Agent selected in the
        # filters. If no value is specified, data is exported starting from the first data collected by the
        # agent.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @export_data_format : Array(String)? = nil,
          @filters : Array(Types::ExportFilter)? = nil,
          @preferences : Types::ExportPreferences? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct StartExportTaskResponse
        include JSON::Serializable

        # A unique identifier used to query the status of an export request.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        def initialize(
          @export_id : String? = nil
        )
        end
      end


      struct StartImportTaskRequest
        include JSON::Serializable

        # The URL for your import file that you've uploaded to Amazon S3. If you're using the Amazon Web
        # Services CLI, this URL is structured as follows: s3://BucketName/ImportFileName.CSV

        @[JSON::Field(key: "importUrl")]
        getter import_url : String

        # A descriptive name for this request. You can use this name to filter future requests related to this
        # import task, such as identifying applications and servers that were included in this import task. We
        # recommend that you use a meaningful name for each import task.

        @[JSON::Field(key: "name")]
        getter name : String

        # Optional. A unique token that you can provide to prevent the same import request from occurring more
        # than once. If you don't provide a token, a token is automatically generated. Sending more than one
        # StartImportTask request with the same client request token will return information about the
        # original import task with that client request token.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @import_url : String,
          @name : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct StartImportTaskResponse
        include JSON::Serializable

        # An array of information related to the import task request including status information, times, IDs,
        # the Amazon S3 Object URL for the import file, and more.

        @[JSON::Field(key: "task")]
        getter task : Types::ImportTask?

        def initialize(
          @task : Types::ImportTask? = nil
        )
        end
      end


      struct StopContinuousExportRequest
        include JSON::Serializable

        # The unique ID assigned to this export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String

        def initialize(
          @export_id : String
        )
        end
      end


      struct StopContinuousExportResponse
        include JSON::Serializable

        # Timestamp that represents when this continuous export started collecting data.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Timestamp that represents when this continuous export was stopped.

        @[JSON::Field(key: "stopTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stop_time : Time?

        def initialize(
          @start_time : Time? = nil,
          @stop_time : Time? = nil
        )
        end
      end


      struct StopDataCollectionByAgentIdsRequest
        include JSON::Serializable

        # The IDs of the agents from which to stop collecting data.

        @[JSON::Field(key: "agentIds")]
        getter agent_ids : Array(String)

        def initialize(
          @agent_ids : Array(String)
        )
        end
      end


      struct StopDataCollectionByAgentIdsResponse
        include JSON::Serializable

        # Information about the agents that were instructed to stop collecting data. Information includes the
        # agent ID, a description of the operation performed, and whether the agent configuration was updated.

        @[JSON::Field(key: "agentsConfigurationStatus")]
        getter agents_configuration_status : Array(Types::AgentConfigurationStatus)?

        def initialize(
          @agents_configuration_status : Array(Types::AgentConfigurationStatus)? = nil
        )
        end
      end

      # Metadata that help you categorize IT assets. Do not store sensitive information (like personal data)
      # in tags.

      struct Tag
        include JSON::Serializable

        # The type of tag on which to filter.

        @[JSON::Field(key: "key")]
        getter key : String

        # A value for a tag key on which to filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The tag filter. Valid names are: tagKey , tagValue , configurationId .

      struct TagFilter
        include JSON::Serializable

        # A name of the tag filter.

        @[JSON::Field(key: "name")]
        getter name : String

        # Values for the tag filter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # Configuration ID of the application to be updated.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String

        # New description of the application to be updated.

        @[JSON::Field(key: "description")]
        getter description : String?

        # New name of the application to be updated.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The new migration wave of the application that you want to update.

        @[JSON::Field(key: "wave")]
        getter wave : String?

        def initialize(
          @configuration_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @wave : String? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the performance metrics to use for the server that is used for recommendations.

      struct UsageMetricBasis
        include JSON::Serializable

        # A utilization metric that is used by the recommendations.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies the percentage of the specified utilization metric that is used by the recommendations.

        @[JSON::Field(key: "percentageAdjust")]
        getter percentage_adjust : Float64?

        def initialize(
          @name : String? = nil,
          @percentage_adjust : Float64? = nil
        )
        end
      end
    end
  end
end
