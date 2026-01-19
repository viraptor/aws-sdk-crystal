require "json"
require "time"

module AwsSdk
  module MigrationHubStrategy
    module Types

      # The user does not have permission to perform the action. Check the AWS Identity and Access
      # Management (IAM) policy associated with this user.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A combination of existing analysis statuses.
      struct AnalysisStatusUnion
        include JSON::Serializable

        # The status of the analysis.
        @[JSON::Field(key: "runtimeAnalysisStatus")]
        getter runtime_analysis_status : String?

        # The status of the source code or database analysis.
        @[JSON::Field(key: "srcCodeOrDbAnalysisStatus")]
        getter src_code_or_db_analysis_status : String?

        def initialize(
          @runtime_analysis_status : String? = nil,
          @src_code_or_db_analysis_status : String? = nil
        )
        end
      end

      # Summary information about an analyzable server.
      struct AnalyzableServerSummary
        include JSON::Serializable

        # The host name of the analyzable server.
        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # The ip address of the analyzable server.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The data source of the analyzable server.
        @[JSON::Field(key: "source")]
        getter source : String?

        # The virtual machine id of the analyzable server.
        @[JSON::Field(key: "vmId")]
        getter vm_id : String?

        def initialize(
          @hostname : String? = nil,
          @ip_address : String? = nil,
          @source : String? = nil,
          @vm_id : String? = nil
        )
        end
      end

      # The combination of the existing analyzers.
      struct AnalyzerNameUnion
        include JSON::Serializable

        # The binary analyzer names.
        @[JSON::Field(key: "binaryAnalyzerName")]
        getter binary_analyzer_name : String?

        # The assessment analyzer names.
        @[JSON::Field(key: "runTimeAnalyzerName")]
        getter run_time_analyzer_name : String?

        # The source code analyzer names.
        @[JSON::Field(key: "sourceCodeAnalyzerName")]
        getter source_code_analyzer_name : String?

        def initialize(
          @binary_analyzer_name : String? = nil,
          @run_time_analyzer_name : String? = nil,
          @source_code_analyzer_name : String? = nil
        )
        end
      end

      # The anti-pattern report result.
      struct AntipatternReportResult
        include JSON::Serializable

        # The analyzer name.
        @[JSON::Field(key: "analyzerName")]
        getter analyzer_name : Types::AnalyzerNameUnion?

        @[JSON::Field(key: "antiPatternReportS3Object")]
        getter anti_pattern_report_s3_object : Types::S3Object?

        # The status of the anti-pattern report generation.
        @[JSON::Field(key: "antipatternReportStatus")]
        getter antipattern_report_status : String?

        # The status message for the anti-pattern.
        @[JSON::Field(key: "antipatternReportStatusMessage")]
        getter antipattern_report_status_message : String?

        def initialize(
          @analyzer_name : Types::AnalyzerNameUnion? = nil,
          @anti_pattern_report_s3_object : Types::S3Object? = nil,
          @antipattern_report_status : String? = nil,
          @antipattern_report_status_message : String? = nil
        )
        end
      end

      # Contains the summary of anti-patterns and their severity.
      struct AntipatternSeveritySummary
        include JSON::Serializable

        # Contains the count of anti-patterns.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # Contains the severity of anti-patterns.
        @[JSON::Field(key: "severity")]
        getter severity : String?

        def initialize(
          @count : Int32? = nil,
          @severity : String? = nil
        )
        end
      end

      # Error in the analysis of the application unit.
      struct AppUnitError
        include JSON::Serializable

        # The category of the error.
        @[JSON::Field(key: "appUnitErrorCategory")]
        getter app_unit_error_category : String?

        def initialize(
          @app_unit_error_category : String? = nil
        )
        end
      end

      # Contains detailed information about an application component.
      struct ApplicationComponentDetail
        include JSON::Serializable

        # The status of analysis, if the application component has source code or an associated database.
        @[JSON::Field(key: "analysisStatus")]
        getter analysis_status : String?

        # The S3 bucket name and the Amazon S3 key name for the anti-pattern report.
        @[JSON::Field(key: "antipatternReportS3Object")]
        getter antipattern_report_s3_object : Types::S3Object?

        # The status of the anti-pattern report generation.
        @[JSON::Field(key: "antipatternReportStatus")]
        getter antipattern_report_status : String?

        # The status message for the anti-pattern.
        @[JSON::Field(key: "antipatternReportStatusMessage")]
        getter antipattern_report_status_message : String?

        # The type of application component.
        @[JSON::Field(key: "appType")]
        getter app_type : String?

        # The error in the analysis of the source code or database.
        @[JSON::Field(key: "appUnitError")]
        getter app_unit_error : Types::AppUnitError?

        # The ID of the server that the application component is running on.
        @[JSON::Field(key: "associatedServerId")]
        getter associated_server_id : String?

        # Configuration details for the database associated with the application component.
        @[JSON::Field(key: "databaseConfigDetail")]
        getter database_config_detail : Types::DatabaseConfigDetail?

        # The ID of the application component.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates whether the application component has been included for server recommendation or not.
        @[JSON::Field(key: "inclusionStatus")]
        getter inclusion_status : String?

        # The timestamp of when the application component was assessed.
        @[JSON::Field(key: "lastAnalyzedTimestamp")]
        getter last_analyzed_timestamp : Time?

        # A list of anti-pattern severity summaries.
        @[JSON::Field(key: "listAntipatternSeveritySummary")]
        getter list_antipattern_severity_summary : Array(Types::AntipatternSeveritySummary)?

        # Set to true if the application component is running on multiple servers.
        @[JSON::Field(key: "moreServerAssociationExists")]
        getter more_server_association_exists : Bool?

        # The name of application component.
        @[JSON::Field(key: "name")]
        getter name : String?

        # OS driver.
        @[JSON::Field(key: "osDriver")]
        getter os_driver : String?

        # OS version.
        @[JSON::Field(key: "osVersion")]
        getter os_version : String?

        # The top recommendation set for the application component.
        @[JSON::Field(key: "recommendationSet")]
        getter recommendation_set : Types::RecommendationSet?

        # The application component subtype.
        @[JSON::Field(key: "resourceSubType")]
        getter resource_sub_type : String?

        # A list of the analysis results.
        @[JSON::Field(key: "resultList")]
        getter result_list : Array(Types::Result)?

        # The status of the application unit.
        @[JSON::Field(key: "runtimeStatus")]
        getter runtime_status : String?

        # The status message for the application unit.
        @[JSON::Field(key: "runtimeStatusMessage")]
        getter runtime_status_message : String?

        # Details about the source code repository associated with the application component.
        @[JSON::Field(key: "sourceCodeRepositories")]
        getter source_code_repositories : Array(Types::SourceCodeRepository)?

        # A detailed description of the analysis status and any failure message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @analysis_status : String? = nil,
          @antipattern_report_s3_object : Types::S3Object? = nil,
          @antipattern_report_status : String? = nil,
          @antipattern_report_status_message : String? = nil,
          @app_type : String? = nil,
          @app_unit_error : Types::AppUnitError? = nil,
          @associated_server_id : String? = nil,
          @database_config_detail : Types::DatabaseConfigDetail? = nil,
          @id : String? = nil,
          @inclusion_status : String? = nil,
          @last_analyzed_timestamp : Time? = nil,
          @list_antipattern_severity_summary : Array(Types::AntipatternSeveritySummary)? = nil,
          @more_server_association_exists : Bool? = nil,
          @name : String? = nil,
          @os_driver : String? = nil,
          @os_version : String? = nil,
          @recommendation_set : Types::RecommendationSet? = nil,
          @resource_sub_type : String? = nil,
          @result_list : Array(Types::Result)? = nil,
          @runtime_status : String? = nil,
          @runtime_status_message : String? = nil,
          @source_code_repositories : Array(Types::SourceCodeRepository)? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Summary of the analysis status of the application component.
      struct ApplicationComponentStatusSummary
        include JSON::Serializable

        # The number of application components successfully analyzed, partially successful or failed analysis.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The status of database analysis.
        @[JSON::Field(key: "srcCodeOrDbAnalysisStatus")]
        getter src_code_or_db_analysis_status : String?

        def initialize(
          @count : Int32? = nil,
          @src_code_or_db_analysis_status : String? = nil
        )
        end
      end

      # Contains information about a strategy recommendation for an application component.
      struct ApplicationComponentStrategy
        include JSON::Serializable

        # Set to true if the recommendation is set as preferred.
        @[JSON::Field(key: "isPreferred")]
        getter is_preferred : Bool?

        # Strategy recommendation for the application component.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RecommendationSet?

        # The recommendation status of a strategy for an application component.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @is_preferred : Bool? = nil,
          @recommendation : Types::RecommendationSet? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains the summary of application components.
      struct ApplicationComponentSummary
        include JSON::Serializable

        # Contains the name of application types.
        @[JSON::Field(key: "appType")]
        getter app_type : String?

        # Contains the count of application type.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        def initialize(
          @app_type : String? = nil,
          @count : Int32? = nil
        )
        end
      end

      # Application preferences that you specify.
      struct ApplicationPreferences
        include JSON::Serializable

        # Application preferences that you specify to prefer managed environment.
        @[JSON::Field(key: "managementPreference")]
        getter management_preference : Types::ManagementPreference?

        def initialize(
          @management_preference : Types::ManagementPreference? = nil
        )
        end
      end

      # Contains the summary of the assessment results.
      struct AssessmentSummary
        include JSON::Serializable

        # The Amazon S3 object containing the anti-pattern report.
        @[JSON::Field(key: "antipatternReportS3Object")]
        getter antipattern_report_s3_object : Types::S3Object?

        # The status of the anti-pattern report.
        @[JSON::Field(key: "antipatternReportStatus")]
        getter antipattern_report_status : String?

        # The status message of the anti-pattern report.
        @[JSON::Field(key: "antipatternReportStatusMessage")]
        getter antipattern_report_status_message : String?

        # The time the assessment was performed.
        @[JSON::Field(key: "lastAnalyzedTimestamp")]
        getter last_analyzed_timestamp : Time?

        # List of AntipatternSeveritySummary.
        @[JSON::Field(key: "listAntipatternSeveritySummary")]
        getter list_antipattern_severity_summary : Array(Types::AntipatternSeveritySummary)?

        # List of status summaries of the analyzed application components.
        @[JSON::Field(key: "listApplicationComponentStatusSummary")]
        getter list_application_component_status_summary : Array(Types::ApplicationComponentStatusSummary)?

        # List of ApplicationComponentStrategySummary.
        @[JSON::Field(key: "listApplicationComponentStrategySummary")]
        getter list_application_component_strategy_summary : Array(Types::StrategySummary)?

        # List of ApplicationComponentSummary.
        @[JSON::Field(key: "listApplicationComponentSummary")]
        getter list_application_component_summary : Array(Types::ApplicationComponentSummary)?

        # List of status summaries of the analyzed servers.
        @[JSON::Field(key: "listServerStatusSummary")]
        getter list_server_status_summary : Array(Types::ServerStatusSummary)?

        # List of ServerStrategySummary.
        @[JSON::Field(key: "listServerStrategySummary")]
        getter list_server_strategy_summary : Array(Types::StrategySummary)?

        # List of ServerSummary.
        @[JSON::Field(key: "listServerSummary")]
        getter list_server_summary : Array(Types::ServerSummary)?

        def initialize(
          @antipattern_report_s3_object : Types::S3Object? = nil,
          @antipattern_report_status : String? = nil,
          @antipattern_report_status_message : String? = nil,
          @last_analyzed_timestamp : Time? = nil,
          @list_antipattern_severity_summary : Array(Types::AntipatternSeveritySummary)? = nil,
          @list_application_component_status_summary : Array(Types::ApplicationComponentStatusSummary)? = nil,
          @list_application_component_strategy_summary : Array(Types::StrategySummary)? = nil,
          @list_application_component_summary : Array(Types::ApplicationComponentSummary)? = nil,
          @list_server_status_summary : Array(Types::ServerStatusSummary)? = nil,
          @list_server_strategy_summary : Array(Types::StrategySummary)? = nil,
          @list_server_summary : Array(Types::ServerSummary)? = nil
        )
        end
      end

      # Defines the criteria of assessment.
      struct AssessmentTarget
        include JSON::Serializable

        # Condition of an assessment.
        @[JSON::Field(key: "condition")]
        getter condition : String

        # Name of an assessment.
        @[JSON::Field(key: "name")]
        getter name : String

        # Values of an assessment.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @condition : String,
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Object containing details about applications as defined in Application Discovery Service.
      struct AssociatedApplication
        include JSON::Serializable

        # ID of the application as defined in Application Discovery Service.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Name of the application as defined in Application Discovery Service.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Object containing the choice of application destination that you specify.
      struct AwsManagedResources
        include JSON::Serializable

        # The choice of application destination that you specify.
        @[JSON::Field(key: "targetDestination")]
        getter target_destination : Array(String)

        def initialize(
          @target_destination : Array(String)
        )
        end
      end

      # Business goals that you specify.
      struct BusinessGoals
        include JSON::Serializable

        # Business goal to reduce license costs.
        @[JSON::Field(key: "licenseCostReduction")]
        getter license_cost_reduction : Int32?

        # Business goal to modernize infrastructure by moving to cloud native technologies.
        @[JSON::Field(key: "modernizeInfrastructureWithCloudNativeTechnologies")]
        getter modernize_infrastructure_with_cloud_native_technologies : Int32?

        # Business goal to reduce the operational overhead on the team by moving into managed services.
        @[JSON::Field(key: "reduceOperationalOverheadWithManagedServices")]
        getter reduce_operational_overhead_with_managed_services : Int32?

        # Business goal to achieve migration at a fast pace.
        @[JSON::Field(key: "speedOfMigration")]
        getter speed_of_migration : Int32?

        def initialize(
          @license_cost_reduction : Int32? = nil,
          @modernize_infrastructure_with_cloud_native_technologies : Int32? = nil,
          @reduce_operational_overhead_with_managed_services : Int32? = nil,
          @speed_of_migration : Int32? = nil
        )
        end
      end

      # Process data collector that runs in the environment that you specify.
      struct Collector
        include JSON::Serializable

        # Indicates the health of a collector.
        @[JSON::Field(key: "collectorHealth")]
        getter collector_health : String?

        # The ID of the collector.
        @[JSON::Field(key: "collectorId")]
        getter collector_id : String?

        # Current version of the collector that is running in the environment that you specify.
        @[JSON::Field(key: "collectorVersion")]
        getter collector_version : String?

        # Summary of the collector configuration.
        @[JSON::Field(key: "configurationSummary")]
        getter configuration_summary : Types::ConfigurationSummary?

        # Hostname of the server that is hosting the collector.
        @[JSON::Field(key: "hostName")]
        getter host_name : String?

        # IP address of the server that is hosting the collector.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # Time when the collector last pinged the service.
        @[JSON::Field(key: "lastActivityTimeStamp")]
        getter last_activity_time_stamp : String?

        # Time when the collector registered with the service.
        @[JSON::Field(key: "registeredTimeStamp")]
        getter registered_time_stamp : String?

        def initialize(
          @collector_health : String? = nil,
          @collector_id : String? = nil,
          @collector_version : String? = nil,
          @configuration_summary : Types::ConfigurationSummary? = nil,
          @host_name : String? = nil,
          @ip_address : String? = nil,
          @last_activity_time_stamp : String? = nil,
          @registered_time_stamp : String? = nil
        )
        end
      end

      # Summary of the collector configuration.
      struct ConfigurationSummary
        include JSON::Serializable

        # IP address based configurations.
        @[JSON::Field(key: "ipAddressBasedRemoteInfoList")]
        getter ip_address_based_remote_info_list : Array(Types::IPAddressBasedRemoteInfo)?

        # The list of pipeline info configurations.
        @[JSON::Field(key: "pipelineInfoList")]
        getter pipeline_info_list : Array(Types::PipelineInfo)?

        # Info about the remote server source code configuration.
        @[JSON::Field(key: "remoteSourceCodeAnalysisServerInfo")]
        getter remote_source_code_analysis_server_info : Types::RemoteSourceCodeAnalysisServerInfo?

        # The list of vCenter configurations.
        @[JSON::Field(key: "vcenterBasedRemoteInfoList")]
        getter vcenter_based_remote_info_list : Array(Types::VcenterBasedRemoteInfo)?

        # The list of the version control configurations.
        @[JSON::Field(key: "versionControlInfoList")]
        getter version_control_info_list : Array(Types::VersionControlInfo)?

        def initialize(
          @ip_address_based_remote_info_list : Array(Types::IPAddressBasedRemoteInfo)? = nil,
          @pipeline_info_list : Array(Types::PipelineInfo)? = nil,
          @remote_source_code_analysis_server_info : Types::RemoteSourceCodeAnalysisServerInfo? = nil,
          @vcenter_based_remote_info_list : Array(Types::VcenterBasedRemoteInfo)? = nil,
          @version_control_info_list : Array(Types::VersionControlInfo)? = nil
        )
        end
      end

      # Exception to indicate that there is an ongoing task when a new task is created. Return when once the
      # existing tasks are complete.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Detailed information about an assessment.
      struct DataCollectionDetails
        include JSON::Serializable

        # The time the assessment completes.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The number of failed servers in the assessment.
        @[JSON::Field(key: "failed")]
        getter failed : Int32?

        # The number of servers with the assessment status IN_PROGESS .
        @[JSON::Field(key: "inProgress")]
        getter in_progress : Int32?

        # The total number of servers in the assessment.
        @[JSON::Field(key: "servers")]
        getter servers : Int32?

        # The start time of assessment.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of the assessment.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the assessment.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The number of successful servers in the assessment.
        @[JSON::Field(key: "success")]
        getter success : Int32?

        def initialize(
          @completion_time : Time? = nil,
          @failed : Int32? = nil,
          @in_progress : Int32? = nil,
          @servers : Int32? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @success : Int32? = nil
        )
        end
      end

      # Configuration information used for assessing databases.
      struct DatabaseConfigDetail
        include JSON::Serializable

        # AWS Secrets Manager key that holds the credentials that you use to connect to a database.
        @[JSON::Field(key: "secretName")]
        getter secret_name : String?

        def initialize(
          @secret_name : String? = nil
        )
        end
      end

      # Preferences for migrating a database to AWS.
      struct DatabaseMigrationPreference
        include JSON::Serializable

        # Indicates whether you are interested in moving from one type of database to another. For example,
        # from SQL Server to Amazon Aurora MySQL-Compatible Edition.
        @[JSON::Field(key: "heterogeneous")]
        getter heterogeneous : Types::Heterogeneous?

        # Indicates whether you are interested in moving to the same type of database into AWS. For example,
        # from SQL Server in your environment to SQL Server on AWS.
        @[JSON::Field(key: "homogeneous")]
        getter homogeneous : Types::Homogeneous?

        # Indicated that you do not prefer heterogeneous or homogeneous.
        @[JSON::Field(key: "noPreference")]
        getter no_preference : Types::NoDatabaseMigrationPreference?

        def initialize(
          @heterogeneous : Types::Heterogeneous? = nil,
          @homogeneous : Types::Homogeneous? = nil,
          @no_preference : Types::NoDatabaseMigrationPreference? = nil
        )
        end
      end

      # Preferences on managing your databases on AWS.
      struct DatabasePreferences
        include JSON::Serializable

        # Specifies whether you're interested in self-managed databases or databases managed by AWS.
        @[JSON::Field(key: "databaseManagementPreference")]
        getter database_management_preference : String?

        # Specifies your preferred migration path.
        @[JSON::Field(key: "databaseMigrationPreference")]
        getter database_migration_preference : Types::DatabaseMigrationPreference?

        def initialize(
          @database_management_preference : String? = nil,
          @database_migration_preference : Types::DatabaseMigrationPreference? = nil
        )
        end
      end

      # Dependency encountered an error.
      struct DependencyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct GetApplicationComponentDetailsRequest
        include JSON::Serializable

        # The ID of the application component. The ID is unique within an AWS account.
        @[JSON::Field(key: "applicationComponentId")]
        getter application_component_id : String

        def initialize(
          @application_component_id : String
        )
        end
      end

      struct GetApplicationComponentDetailsResponse
        include JSON::Serializable

        # Detailed information about an application component.
        @[JSON::Field(key: "applicationComponentDetail")]
        getter application_component_detail : Types::ApplicationComponentDetail?

        # The associated application group as defined in AWS Application Discovery Service.
        @[JSON::Field(key: "associatedApplications")]
        getter associated_applications : Array(Types::AssociatedApplication)?

        # A list of the IDs of the servers on which the application component is running.
        @[JSON::Field(key: "associatedServerIds")]
        getter associated_server_ids : Array(String)?

        # Set to true if the application component belongs to more than one application group.
        @[JSON::Field(key: "moreApplicationResource")]
        getter more_application_resource : Bool?

        def initialize(
          @application_component_detail : Types::ApplicationComponentDetail? = nil,
          @associated_applications : Array(Types::AssociatedApplication)? = nil,
          @associated_server_ids : Array(String)? = nil,
          @more_application_resource : Bool? = nil
        )
        end
      end

      struct GetApplicationComponentStrategiesRequest
        include JSON::Serializable

        # The ID of the application component. The ID is unique within an AWS account.
        @[JSON::Field(key: "applicationComponentId")]
        getter application_component_id : String

        def initialize(
          @application_component_id : String
        )
        end
      end

      struct GetApplicationComponentStrategiesResponse
        include JSON::Serializable

        # A list of application component strategy recommendations.
        @[JSON::Field(key: "applicationComponentStrategies")]
        getter application_component_strategies : Array(Types::ApplicationComponentStrategy)?

        def initialize(
          @application_component_strategies : Array(Types::ApplicationComponentStrategy)? = nil
        )
        end
      end

      struct GetAssessmentRequest
        include JSON::Serializable

        # The assessmentid returned by StartAssessment .
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetAssessmentResponse
        include JSON::Serializable

        # List of criteria for assessment.
        @[JSON::Field(key: "assessmentTargets")]
        getter assessment_targets : Array(Types::AssessmentTarget)?

        # Detailed information about the assessment.
        @[JSON::Field(key: "dataCollectionDetails")]
        getter data_collection_details : Types::DataCollectionDetails?

        # The ID for the specific assessment task.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @assessment_targets : Array(Types::AssessmentTarget)? = nil,
          @data_collection_details : Types::DataCollectionDetails? = nil,
          @id : String? = nil
        )
        end
      end

      struct GetImportFileTaskRequest
        include JSON::Serializable

        # The ID of the import file task. This ID is returned in the response of StartImportFileTask .
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetImportFileTaskResponse
        include JSON::Serializable

        # The time that the import task completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The import file task id returned in the response of StartImportFileTask .
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the import task given in StartImportFileTask .
        @[JSON::Field(key: "importName")]
        getter import_name : String?

        # The S3 bucket where import file is located.
        @[JSON::Field(key: "inputS3Bucket")]
        getter input_s3_bucket : String?

        # The Amazon S3 key name of the import file.
        @[JSON::Field(key: "inputS3Key")]
        getter input_s3_key : String?

        # The number of records that failed to be imported.
        @[JSON::Field(key: "numberOfRecordsFailed")]
        getter number_of_records_failed : Int32?

        # The number of records successfully imported.
        @[JSON::Field(key: "numberOfRecordsSuccess")]
        getter number_of_records_success : Int32?

        # Start time of the import task.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Status of import file task.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The S3 bucket name for status report of import task.
        @[JSON::Field(key: "statusReportS3Bucket")]
        getter status_report_s3_bucket : String?

        # The Amazon S3 key name for status report of import task. The report contains details about whether
        # each record imported successfully or why it did not.
        @[JSON::Field(key: "statusReportS3Key")]
        getter status_report_s3_key : String?

        def initialize(
          @completion_time : Time? = nil,
          @id : String? = nil,
          @import_name : String? = nil,
          @input_s3_bucket : String? = nil,
          @input_s3_key : String? = nil,
          @number_of_records_failed : Int32? = nil,
          @number_of_records_success : Int32? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_report_s3_bucket : String? = nil,
          @status_report_s3_key : String? = nil
        )
        end
      end

      struct GetLatestAssessmentIdRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetLatestAssessmentIdResponse
        include JSON::Serializable

        # The latest ID for the specific assessment task.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      struct GetPortfolioPreferencesRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetPortfolioPreferencesResponse
        include JSON::Serializable

        # The classification for application component types.
        @[JSON::Field(key: "applicationMode")]
        getter application_mode : String?

        # The transformation preferences for non-database applications.
        @[JSON::Field(key: "applicationPreferences")]
        getter application_preferences : Types::ApplicationPreferences?

        # The transformation preferences for database applications.
        @[JSON::Field(key: "databasePreferences")]
        getter database_preferences : Types::DatabasePreferences?

        # The rank of business goals based on priority.
        @[JSON::Field(key: "prioritizeBusinessGoals")]
        getter prioritize_business_goals : Types::PrioritizeBusinessGoals?

        def initialize(
          @application_mode : String? = nil,
          @application_preferences : Types::ApplicationPreferences? = nil,
          @database_preferences : Types::DatabasePreferences? = nil,
          @prioritize_business_goals : Types::PrioritizeBusinessGoals? = nil
        )
        end
      end

      struct GetPortfolioSummaryRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetPortfolioSummaryResponse
        include JSON::Serializable

        # An assessment summary for the portfolio including the number of servers to rehost and the overall
        # number of anti-patterns.
        @[JSON::Field(key: "assessmentSummary")]
        getter assessment_summary : Types::AssessmentSummary?

        def initialize(
          @assessment_summary : Types::AssessmentSummary? = nil
        )
        end
      end

      struct GetRecommendationReportDetailsRequest
        include JSON::Serializable

        # The recommendation report generation task id returned by StartRecommendationReportGeneration .
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetRecommendationReportDetailsResponse
        include JSON::Serializable

        # The ID of the recommendation report generation task. See the response of
        # StartRecommendationReportGeneration .
        @[JSON::Field(key: "id")]
        getter id : String?

        # Detailed information about the recommendation report.
        @[JSON::Field(key: "recommendationReportDetails")]
        getter recommendation_report_details : Types::RecommendationReportDetails?

        def initialize(
          @id : String? = nil,
          @recommendation_report_details : Types::RecommendationReportDetails? = nil
        )
        end
      end

      struct GetServerDetailsRequest
        include JSON::Serializable

        # The ID of the server.
        @[JSON::Field(key: "serverId")]
        getter server_id : String

        # The maximum number of items to include in the response. The maximum value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from a previous call that you use to retrieve the next set of results. For example, if a
        # previous call to this action returned 100 items, but you set maxResults to 10. You'll receive a set
        # of 10 results along with a token. You then use the returned token to retrieve the next set of 10.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @server_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetServerDetailsResponse
        include JSON::Serializable

        # The associated application group the server belongs to, as defined in AWS Application Discovery
        # Service.
        @[JSON::Field(key: "associatedApplications")]
        getter associated_applications : Array(Types::AssociatedApplication)?

        # The token you use to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Detailed information about the server.
        @[JSON::Field(key: "serverDetail")]
        getter server_detail : Types::ServerDetail?

        def initialize(
          @associated_applications : Array(Types::AssociatedApplication)? = nil,
          @next_token : String? = nil,
          @server_detail : Types::ServerDetail? = nil
        )
        end
      end

      struct GetServerStrategiesRequest
        include JSON::Serializable

        # The ID of the server.
        @[JSON::Field(key: "serverId")]
        getter server_id : String

        def initialize(
          @server_id : String
        )
        end
      end

      struct GetServerStrategiesResponse
        include JSON::Serializable

        # A list of strategy recommendations for the server.
        @[JSON::Field(key: "serverStrategies")]
        getter server_strategies : Array(Types::ServerStrategy)?

        def initialize(
          @server_strategies : Array(Types::ServerStrategy)? = nil
        )
        end
      end

      # The object containing information about distinct imports or groups for Strategy Recommendations.
      struct Group
        include JSON::Serializable

        # The key of the specific import group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the specific import group.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The object containing details about heterogeneous database preferences.
      struct Heterogeneous
        include JSON::Serializable

        # The target database engine for heterogeneous database migration preference.
        @[JSON::Field(key: "targetDatabaseEngine")]
        getter target_database_engine : Array(String)

        def initialize(
          @target_database_engine : Array(String)
        )
        end
      end

      # The object containing details about homogeneous database preferences.
      struct Homogeneous
        include JSON::Serializable

        # The target database engine for homogeneous database migration preferences.
        @[JSON::Field(key: "targetDatabaseEngine")]
        getter target_database_engine : Array(String)?

        def initialize(
          @target_database_engine : Array(String)? = nil
        )
        end
      end

      # IP address based configurations.
      struct IPAddressBasedRemoteInfo
        include JSON::Serializable

        # The type of authorization.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The time stamp of the configuration.
        @[JSON::Field(key: "ipAddressConfigurationTimeStamp")]
        getter ip_address_configuration_time_stamp : String?

        # The type of the operating system.
        @[JSON::Field(key: "osType")]
        getter os_type : String?

        def initialize(
          @auth_type : String? = nil,
          @ip_address_configuration_time_stamp : String? = nil,
          @os_type : String? = nil
        )
        end
      end

      # Information about the import file tasks you request.
      struct ImportFileTaskInformation
        include JSON::Serializable

        # The time that the import task completes.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The ID of the import file task.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the import task given in StartImportFileTask .
        @[JSON::Field(key: "importName")]
        getter import_name : String?

        # The S3 bucket where the import file is located.
        @[JSON::Field(key: "inputS3Bucket")]
        getter input_s3_bucket : String?

        # The Amazon S3 key name of the import file.
        @[JSON::Field(key: "inputS3Key")]
        getter input_s3_key : String?

        # The number of records that failed to be imported.
        @[JSON::Field(key: "numberOfRecordsFailed")]
        getter number_of_records_failed : Int32?

        # The number of records successfully imported.
        @[JSON::Field(key: "numberOfRecordsSuccess")]
        getter number_of_records_success : Int32?

        # Start time of the import task.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Status of import file task.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The S3 bucket name for status report of import task.
        @[JSON::Field(key: "statusReportS3Bucket")]
        getter status_report_s3_bucket : String?

        # The Amazon S3 key name for status report of import task. The report contains details about whether
        # each record imported successfully or why it did not.
        @[JSON::Field(key: "statusReportS3Key")]
        getter status_report_s3_key : String?

        def initialize(
          @completion_time : Time? = nil,
          @id : String? = nil,
          @import_name : String? = nil,
          @input_s3_bucket : String? = nil,
          @input_s3_key : String? = nil,
          @number_of_records_failed : Int32? = nil,
          @number_of_records_success : Int32? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_report_s3_bucket : String? = nil,
          @status_report_s3_key : String? = nil
        )
        end
      end

      # The server experienced an internal error. Try again.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents input for ListAnalyzableServers operation.
      struct ListAnalyzableServersRequest
        include JSON::Serializable

        # The maximum number of items to include in the response. The maximum value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from a previous call that you use to retrieve the next set of results. For example, if a
        # previous call to this action returned 100 items, but you set maxResults to 10. You'll receive a set
        # of 10 results along with a token. You then use the returned token to retrieve the next set of 10.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies whether to sort by ascending (ASC) or descending (DESC) order.
        @[JSON::Field(key: "sort")]
        getter sort : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : String? = nil
        )
        end
      end

      # Represents output for ListAnalyzableServers operation.
      struct ListAnalyzableServersResponse
        include JSON::Serializable

        # The list of analyzable servers with summary information about each server.
        @[JSON::Field(key: "analyzableServers")]
        getter analyzable_servers : Array(Types::AnalyzableServerSummary)?

        # The token you use to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @analyzable_servers : Array(Types::AnalyzableServerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationComponentsRequest
        include JSON::Serializable

        # Criteria for filtering the list of application components.
        @[JSON::Field(key: "applicationComponentCriteria")]
        getter application_component_criteria : String?

        # Specify the value based on the application component criteria type. For example, if
        # applicationComponentCriteria is set to SERVER_ID and filterValue is set to server1 , then
        # ListApplicationComponents returns all the application components running on server1.
        @[JSON::Field(key: "filterValue")]
        getter filter_value : String?

        # The group ID specified in to filter on.
        @[JSON::Field(key: "groupIdFilter")]
        getter group_id_filter : Array(Types::Group)?

        # The maximum number of items to include in the response. The maximum value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from a previous call that you use to retrieve the next set of results. For example, if a
        # previous call to this action returned 100 items, but you set maxResults to 10. You'll receive a set
        # of 10 results along with a token. You then use the returned token to retrieve the next set of 10.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies whether to sort by ascending ( ASC ) or descending ( DESC ) order.
        @[JSON::Field(key: "sort")]
        getter sort : String?

        def initialize(
          @application_component_criteria : String? = nil,
          @filter_value : String? = nil,
          @group_id_filter : Array(Types::Group)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : String? = nil
        )
        end
      end

      struct ListApplicationComponentsResponse
        include JSON::Serializable

        # The list of application components with detailed information about each component.
        @[JSON::Field(key: "applicationComponentInfos")]
        getter application_component_infos : Array(Types::ApplicationComponentDetail)?

        # The token you use to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_component_infos : Array(Types::ApplicationComponentDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCollectorsRequest
        include JSON::Serializable

        # The maximum number of items to include in the response. The maximum value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from a previous call that you use to retrieve the next set of results. For example, if a
        # previous call to this action returned 100 items, but you set maxResults to 10. You'll receive a set
        # of 10 results along with a token. You then use the returned token to retrieve the next set of 10.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCollectorsResponse
        include JSON::Serializable

        # The list of all the installed collectors.
        @[JSON::Field(key: "Collectors")]
        getter collectors : Array(Types::Collector)?

        # The token you use to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collectors : Array(Types::Collector)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListImportFileTaskRequest
        include JSON::Serializable

        # The total number of items to return. The maximum value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from a previous call that you use to retrieve the next set of results. For example, if a
        # previous call to this action returned 100 items, but you set maxResults to 10. You'll receive a set
        # of 10 results along with a token. You then use the returned token to retrieve the next set of 10.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListImportFileTaskResponse
        include JSON::Serializable

        # The token you use to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Lists information about the files you import.
        @[JSON::Field(key: "taskInfos")]
        getter task_infos : Array(Types::ImportFileTaskInformation)?

        def initialize(
          @next_token : String? = nil,
          @task_infos : Array(Types::ImportFileTaskInformation)? = nil
        )
        end
      end

      struct ListServersRequest
        include JSON::Serializable

        # Specifies the filter value, which is based on the type of server criteria. For example, if
        # serverCriteria is OS_NAME , and the filterValue is equal to WindowsServer , then ListServers returns
        # all of the servers matching the OS name WindowsServer .
        @[JSON::Field(key: "filterValue")]
        getter filter_value : String?

        # Specifies the group ID to filter on.
        @[JSON::Field(key: "groupIdFilter")]
        getter group_id_filter : Array(Types::Group)?

        # The maximum number of items to include in the response. The maximum value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token from a previous call that you use to retrieve the next set of results. For example, if a
        # previous call to this action returned 100 items, but you set maxResults to 10. You'll receive a set
        # of 10 results along with a token. You then use the returned token to retrieve the next set of 10.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Criteria for filtering servers.
        @[JSON::Field(key: "serverCriteria")]
        getter server_criteria : String?

        # Specifies whether to sort by ascending ( ASC ) or descending ( DESC ) order.
        @[JSON::Field(key: "sort")]
        getter sort : String?

        def initialize(
          @filter_value : String? = nil,
          @group_id_filter : Array(Types::Group)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @server_criteria : String? = nil,
          @sort : String? = nil
        )
        end
      end

      struct ListServersResponse
        include JSON::Serializable

        # The token you use to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of servers with detailed information about each server.
        @[JSON::Field(key: "serverInfos")]
        getter server_infos : Array(Types::ServerDetail)?

        def initialize(
          @next_token : String? = nil,
          @server_infos : Array(Types::ServerDetail)? = nil
        )
        end
      end

      # Preferences for migrating an application to AWS.
      struct ManagementPreference
        include JSON::Serializable

        # Indicates interest in solutions that are managed by AWS.
        @[JSON::Field(key: "awsManagedResources")]
        getter aws_managed_resources : Types::AwsManagedResources?

        # No specific preference.
        @[JSON::Field(key: "noPreference")]
        getter no_preference : Types::NoManagementPreference?

        # Indicates interest in managing your own resources on AWS.
        @[JSON::Field(key: "selfManageResources")]
        getter self_manage_resources : Types::SelfManageResources?

        def initialize(
          @aws_managed_resources : Types::AwsManagedResources? = nil,
          @no_preference : Types::NoManagementPreference? = nil,
          @self_manage_resources : Types::SelfManageResources? = nil
        )
        end
      end

      # Information about the server's network for which the assessment was run.
      struct NetworkInfo
        include JSON::Serializable

        # Information about the name of the interface of the server for which the assessment was run.
        @[JSON::Field(key: "interfaceName")]
        getter interface_name : String

        # Information about the IP address of the server for which the assessment was run.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String

        # Information about the MAC address of the server for which the assessment was run.
        @[JSON::Field(key: "macAddress")]
        getter mac_address : String

        # Information about the subnet mask of the server for which the assessment was run.
        @[JSON::Field(key: "netMask")]
        getter net_mask : String

        def initialize(
          @interface_name : String,
          @ip_address : String,
          @mac_address : String,
          @net_mask : String
        )
        end
      end

      # The object containing details about database migration preferences, when you have no particular
      # preference.
      struct NoDatabaseMigrationPreference
        include JSON::Serializable

        # The target database engine for database migration preference that you specify.
        @[JSON::Field(key: "targetDatabaseEngine")]
        getter target_database_engine : Array(String)

        def initialize(
          @target_database_engine : Array(String)
        )
        end
      end

      # Object containing the choice of application destination that you specify.
      struct NoManagementPreference
        include JSON::Serializable

        # The choice of application destination that you specify.
        @[JSON::Field(key: "targetDestination")]
        getter target_destination : Array(String)

        def initialize(
          @target_destination : Array(String)
        )
        end
      end

      # Information about the operating system.
      struct OSInfo
        include JSON::Serializable

        # Information about the type of operating system.
        @[JSON::Field(key: "type")]
        getter type : String?

        # Information about the version of operating system.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Detailed information of the pipeline.
      struct PipelineInfo
        include JSON::Serializable

        # The time when the pipeline info was configured.
        @[JSON::Field(key: "pipelineConfigurationTimeStamp")]
        getter pipeline_configuration_time_stamp : String?

        # The type of pipeline.
        @[JSON::Field(key: "pipelineType")]
        getter pipeline_type : String?

        def initialize(
          @pipeline_configuration_time_stamp : String? = nil,
          @pipeline_type : String? = nil
        )
        end
      end

      # Rank of business goals based on priority.
      struct PrioritizeBusinessGoals
        include JSON::Serializable

        # Rank of business goals based on priority.
        @[JSON::Field(key: "businessGoals")]
        getter business_goals : Types::BusinessGoals?

        def initialize(
          @business_goals : Types::BusinessGoals? = nil
        )
        end
      end

      struct PutPortfolioPreferencesRequest
        include JSON::Serializable

        # The classification for application component types.
        @[JSON::Field(key: "applicationMode")]
        getter application_mode : String?

        # The transformation preferences for non-database applications.
        @[JSON::Field(key: "applicationPreferences")]
        getter application_preferences : Types::ApplicationPreferences?

        # The transformation preferences for database applications.
        @[JSON::Field(key: "databasePreferences")]
        getter database_preferences : Types::DatabasePreferences?

        # The rank of the business goals based on priority.
        @[JSON::Field(key: "prioritizeBusinessGoals")]
        getter prioritize_business_goals : Types::PrioritizeBusinessGoals?

        def initialize(
          @application_mode : String? = nil,
          @application_preferences : Types::ApplicationPreferences? = nil,
          @database_preferences : Types::DatabasePreferences? = nil,
          @prioritize_business_goals : Types::PrioritizeBusinessGoals? = nil
        )
        end
      end

      struct PutPortfolioPreferencesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains detailed information about a recommendation report.
      struct RecommendationReportDetails
        include JSON::Serializable

        # The time that the recommendation report generation task completes.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The S3 bucket where the report file is located.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 key name of the report file.
        @[JSON::Field(key: "s3Keys")]
        getter s3_keys : Array(String)?

        # The time that the recommendation report generation task starts.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of the recommendation report generation task.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message for recommendation report generation.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @completion_time : Time? = nil,
          @s3_bucket : String? = nil,
          @s3_keys : Array(String)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains a recommendation set.
      struct RecommendationSet
        include JSON::Serializable

        # The recommended strategy.
        @[JSON::Field(key: "strategy")]
        getter strategy : String?

        # The recommended target destination.
        @[JSON::Field(key: "targetDestination")]
        getter target_destination : String?

        # The target destination for the recommendation set.
        @[JSON::Field(key: "transformationTool")]
        getter transformation_tool : Types::TransformationTool?

        def initialize(
          @strategy : String? = nil,
          @target_destination : String? = nil,
          @transformation_tool : Types::TransformationTool? = nil
        )
        end
      end

      # Information about the server configured for source code analysis.
      struct RemoteSourceCodeAnalysisServerInfo
        include JSON::Serializable

        # The time when the remote source code server was configured.
        @[JSON::Field(key: "remoteSourceCodeAnalysisServerConfigurationTimestamp")]
        getter remote_source_code_analysis_server_configuration_timestamp : String?

        def initialize(
          @remote_source_code_analysis_server_configuration_timestamp : String? = nil
        )
        end
      end

      # The specified ID in the request is not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The error in server analysis.
      struct Result
        include JSON::Serializable

        # The error in server analysis.
        @[JSON::Field(key: "analysisStatus")]
        getter analysis_status : Types::AnalysisStatusUnion?

        # The error in server analysis.
        @[JSON::Field(key: "analysisType")]
        getter analysis_type : String?

        # The error in server analysis.
        @[JSON::Field(key: "antipatternReportResultList")]
        getter antipattern_report_result_list : Array(Types::AntipatternReportResult)?

        # The error in server analysis.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @analysis_status : Types::AnalysisStatusUnion? = nil,
          @analysis_type : String? = nil,
          @antipattern_report_result_list : Array(Types::AntipatternReportResult)? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains the S3 bucket name and the Amazon S3 key name.
      struct S3Object
        include JSON::Serializable

        # The S3 bucket name.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 key name.
        @[JSON::Field(key: "s3key")]
        getter s3key : String?

        def initialize(
          @s3_bucket : String? = nil,
          @s3key : String? = nil
        )
        end
      end

      # Self-managed resources.
      struct SelfManageResources
        include JSON::Serializable

        # Self-managed resources target destination.
        @[JSON::Field(key: "targetDestination")]
        getter target_destination : Array(String)

        def initialize(
          @target_destination : Array(String)
        )
        end
      end

      # Detailed information about a server.
      struct ServerDetail
        include JSON::Serializable

        # The S3 bucket name and Amazon S3 key name for anti-pattern report.
        @[JSON::Field(key: "antipatternReportS3Object")]
        getter antipattern_report_s3_object : Types::S3Object?

        # The status of the anti-pattern report generation.
        @[JSON::Field(key: "antipatternReportStatus")]
        getter antipattern_report_status : String?

        # A message about the status of the anti-pattern report generation.
        @[JSON::Field(key: "antipatternReportStatusMessage")]
        getter antipattern_report_status_message : String?

        # A list of strategy summaries.
        @[JSON::Field(key: "applicationComponentStrategySummary")]
        getter application_component_strategy_summary : Array(Types::StrategySummary)?

        # The status of assessment for the server.
        @[JSON::Field(key: "dataCollectionStatus")]
        getter data_collection_status : String?

        # The server ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of when the server was assessed.
        @[JSON::Field(key: "lastAnalyzedTimestamp")]
        getter last_analyzed_timestamp : Time?

        # A list of anti-pattern severity summaries.
        @[JSON::Field(key: "listAntipatternSeveritySummary")]
        getter list_antipattern_severity_summary : Array(Types::AntipatternSeveritySummary)?

        # The name of the server.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A set of recommendations.
        @[JSON::Field(key: "recommendationSet")]
        getter recommendation_set : Types::RecommendationSet?

        # The error in server analysis.
        @[JSON::Field(key: "serverError")]
        getter server_error : Types::ServerError?

        # The type of server.
        @[JSON::Field(key: "serverType")]
        getter server_type : String?

        # A message about the status of data collection, which contains detailed descriptions of any error
        # messages.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # System information about the server.
        @[JSON::Field(key: "systemInfo")]
        getter system_info : Types::SystemInfo?

        def initialize(
          @antipattern_report_s3_object : Types::S3Object? = nil,
          @antipattern_report_status : String? = nil,
          @antipattern_report_status_message : String? = nil,
          @application_component_strategy_summary : Array(Types::StrategySummary)? = nil,
          @data_collection_status : String? = nil,
          @id : String? = nil,
          @last_analyzed_timestamp : Time? = nil,
          @list_antipattern_severity_summary : Array(Types::AntipatternSeveritySummary)? = nil,
          @name : String? = nil,
          @recommendation_set : Types::RecommendationSet? = nil,
          @server_error : Types::ServerError? = nil,
          @server_type : String? = nil,
          @status_message : String? = nil,
          @system_info : Types::SystemInfo? = nil
        )
        end
      end

      # The error in server analysis.
      struct ServerError
        include JSON::Serializable

        # The error category of server analysis.
        @[JSON::Field(key: "serverErrorCategory")]
        getter server_error_category : String?

        def initialize(
          @server_error_category : String? = nil
        )
        end
      end

      # The status summary of the server analysis.
      struct ServerStatusSummary
        include JSON::Serializable

        # The number of servers successfully analyzed, partially successful or failed analysis.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The status of the run time.
        @[JSON::Field(key: "runTimeAssessmentStatus")]
        getter run_time_assessment_status : String?

        def initialize(
          @count : Int32? = nil,
          @run_time_assessment_status : String? = nil
        )
        end
      end

      # Contains information about a strategy recommendation for a server.
      struct ServerStrategy
        include JSON::Serializable

        # Set to true if the recommendation is set as preferred.
        @[JSON::Field(key: "isPreferred")]
        getter is_preferred : Bool?

        # The number of application components with this strategy recommendation running on the server.
        @[JSON::Field(key: "numberOfApplicationComponents")]
        getter number_of_application_components : Int32?

        # Strategy recommendation for the server.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RecommendationSet?

        # The recommendation status of the strategy for the server.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @is_preferred : Bool? = nil,
          @number_of_application_components : Int32? = nil,
          @recommendation : Types::RecommendationSet? = nil,
          @status : String? = nil
        )
        end
      end

      # Object containing details about the servers imported by Application Discovery Service
      struct ServerSummary
        include JSON::Serializable

        # Type of operating system for the servers.
        @[JSON::Field(key: "ServerOsType")]
        getter server_os_type : String?

        # Number of servers.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        def initialize(
          @server_os_type : String? = nil,
          @count : Int32? = nil
        )
        end
      end

      # Exception to indicate that the service-linked role (SLR) is locked.
      struct ServiceLinkedRoleLockClientException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The AWS account has reached its quota of imports. Contact AWS Support to increase the quota for this
      # account.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Object containing source code information that is linked to an application component.
      struct SourceCode
        include JSON::Serializable

        # The repository name for the source code.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The name of the project.
        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # The branch of the source code.
        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # The type of repository to use for the source code.
        @[JSON::Field(key: "versionControl")]
        getter version_control : String?

        def initialize(
          @location : String? = nil,
          @project_name : String? = nil,
          @source_version : String? = nil,
          @version_control : String? = nil
        )
        end
      end

      # Object containing source code information that is linked to an application component.
      struct SourceCodeRepository
        include JSON::Serializable

        # The branch of the source code.
        @[JSON::Field(key: "branch")]
        getter branch : String?

        # The name of the project.
        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # The repository name for the source code.
        @[JSON::Field(key: "repository")]
        getter repository : String?

        # The type of repository to use for the source code.
        @[JSON::Field(key: "versionControlType")]
        getter version_control_type : String?

        def initialize(
          @branch : String? = nil,
          @project_name : String? = nil,
          @repository : String? = nil,
          @version_control_type : String? = nil
        )
        end
      end

      struct StartAssessmentRequest
        include JSON::Serializable

        # The data source type of an assessment to be started.
        @[JSON::Field(key: "assessmentDataSourceType")]
        getter assessment_data_source_type : String?

        # List of criteria for assessment.
        @[JSON::Field(key: "assessmentTargets")]
        getter assessment_targets : Array(Types::AssessmentTarget)?

        # The S3 bucket used by the collectors to send analysis data to the service. The bucket name must
        # begin with migrationhub-strategy- .
        @[JSON::Field(key: "s3bucketForAnalysisData")]
        getter s3bucket_for_analysis_data : String?

        # The S3 bucket where all the reports generated by the service are stored. The bucket name must begin
        # with migrationhub-strategy- .
        @[JSON::Field(key: "s3bucketForReportData")]
        getter s3bucket_for_report_data : String?

        def initialize(
          @assessment_data_source_type : String? = nil,
          @assessment_targets : Array(Types::AssessmentTarget)? = nil,
          @s3bucket_for_analysis_data : String? = nil,
          @s3bucket_for_report_data : String? = nil
        )
        end
      end

      struct StartAssessmentResponse
        include JSON::Serializable

        # The ID of the assessment.
        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String?

        def initialize(
          @assessment_id : String? = nil
        )
        end
      end

      struct StartImportFileTaskRequest
        include JSON::Serializable

        # The S3 bucket where the import file is located. The bucket name is required to begin with
        # migrationhub-strategy- .
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # A descriptive name for the request.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon S3 key name of the import file.
        @[JSON::Field(key: "s3key")]
        getter s3key : String

        # Specifies the source that the servers are coming from. By default, Strategy Recommendations assumes
        # that the servers specified in the import file are available in AWS Application Discovery Service.
        @[JSON::Field(key: "dataSourceType")]
        getter data_source_type : String?

        # Groups the resources in the import file together with a unique name. This ID can be as filter in
        # ListApplicationComponents and ListServers .
        @[JSON::Field(key: "groupId")]
        getter group_id : Array(Types::Group)?

        # The S3 bucket where Strategy Recommendations uploads import results. The bucket name is required to
        # begin with migrationhub-strategy-.
        @[JSON::Field(key: "s3bucketForReportData")]
        getter s3bucket_for_report_data : String?

        def initialize(
          @s3_bucket : String,
          @name : String,
          @s3key : String,
          @data_source_type : String? = nil,
          @group_id : Array(Types::Group)? = nil,
          @s3bucket_for_report_data : String? = nil
        )
        end
      end

      struct StartImportFileTaskResponse
        include JSON::Serializable

        # The ID for a specific import task. The ID is unique within an AWS account.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      struct StartRecommendationReportGenerationRequest
        include JSON::Serializable

        # Groups the resources in the recommendation report with a unique name.
        @[JSON::Field(key: "groupIdFilter")]
        getter group_id_filter : Array(Types::Group)?

        # The output format for the recommendation report file. The default format is Microsoft Excel.
        @[JSON::Field(key: "outputFormat")]
        getter output_format : String?

        def initialize(
          @group_id_filter : Array(Types::Group)? = nil,
          @output_format : String? = nil
        )
        end
      end

      struct StartRecommendationReportGenerationResponse
        include JSON::Serializable

        # The ID of the recommendation report generation task.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      struct StopAssessmentRequest
        include JSON::Serializable

        # The assessmentId returned by StartAssessment .
        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        def initialize(
          @assessment_id : String
        )
        end
      end

      struct StopAssessmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about all the available strategy options for migrating and modernizing an application
      # component.
      struct StrategyOption
        include JSON::Serializable

        # Indicates if a specific strategy is preferred for the application component.
        @[JSON::Field(key: "isPreferred")]
        getter is_preferred : Bool?

        # Type of transformation. For example, Rehost, Replatform, and so on.
        @[JSON::Field(key: "strategy")]
        getter strategy : String?

        # Destination information about where the application component can migrate to. For example, EC2 , ECS
        # , and so on.
        @[JSON::Field(key: "targetDestination")]
        getter target_destination : String?

        # The name of the tool that can be used to transform an application component using this strategy.
        @[JSON::Field(key: "toolName")]
        getter tool_name : String?

        def initialize(
          @is_preferred : Bool? = nil,
          @strategy : String? = nil,
          @target_destination : String? = nil,
          @tool_name : String? = nil
        )
        end
      end

      # Object containing the summary of the strategy recommendations.
      struct StrategySummary
        include JSON::Serializable

        # The count of recommendations per strategy.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The name of recommended strategy.
        @[JSON::Field(key: "strategy")]
        getter strategy : String?

        def initialize(
          @count : Int32? = nil,
          @strategy : String? = nil
        )
        end
      end

      # Information about the server that hosts application components.
      struct SystemInfo
        include JSON::Serializable

        # CPU architecture type for the server.
        @[JSON::Field(key: "cpuArchitecture")]
        getter cpu_architecture : String?

        # File system type for the server.
        @[JSON::Field(key: "fileSystemType")]
        getter file_system_type : String?

        # Networking information related to a server.
        @[JSON::Field(key: "networkInfoList")]
        getter network_info_list : Array(Types::NetworkInfo)?

        # Operating system corresponding to a server.
        @[JSON::Field(key: "osInfo")]
        getter os_info : Types::OSInfo?

        def initialize(
          @cpu_architecture : String? = nil,
          @file_system_type : String? = nil,
          @network_info_list : Array(Types::NetworkInfo)? = nil,
          @os_info : Types::OSInfo? = nil
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

      # Information of the transformation tool that can be used to migrate and modernize the application.
      struct TransformationTool
        include JSON::Serializable

        # Description of the tool.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Name of the tool.
        @[JSON::Field(key: "name")]
        getter name : String?

        # URL for installing the tool.
        @[JSON::Field(key: "tranformationToolInstallationLink")]
        getter tranformation_tool_installation_link : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @tranformation_tool_installation_link : String? = nil
        )
        end
      end

      struct UpdateApplicationComponentConfigRequest
        include JSON::Serializable

        # The ID of the application component. The ID is unique within an AWS account.
        @[JSON::Field(key: "applicationComponentId")]
        getter application_component_id : String

        # The type of known component.
        @[JSON::Field(key: "appType")]
        getter app_type : String?

        # Update the configuration request of an application component. If it is set to true, the source code
        # and/or database credentials are updated. If it is set to false, the source code and/or database
        # credentials are updated and an analysis is initiated.
        @[JSON::Field(key: "configureOnly")]
        getter configure_only : Bool?

        # Indicates whether the application component has been included for server recommendation or not.
        @[JSON::Field(key: "inclusionStatus")]
        getter inclusion_status : String?

        # Database credentials.
        @[JSON::Field(key: "secretsManagerKey")]
        getter secrets_manager_key : String?

        # The list of source code configurations to update for the application component.
        @[JSON::Field(key: "sourceCodeList")]
        getter source_code_list : Array(Types::SourceCode)?

        # The preferred strategy options for the application component. Use values from the
        # GetApplicationComponentStrategies response.
        @[JSON::Field(key: "strategyOption")]
        getter strategy_option : Types::StrategyOption?

        def initialize(
          @application_component_id : String,
          @app_type : String? = nil,
          @configure_only : Bool? = nil,
          @inclusion_status : String? = nil,
          @secrets_manager_key : String? = nil,
          @source_code_list : Array(Types::SourceCode)? = nil,
          @strategy_option : Types::StrategyOption? = nil
        )
        end
      end

      struct UpdateApplicationComponentConfigResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateServerConfigRequest
        include JSON::Serializable

        # The ID of the server.
        @[JSON::Field(key: "serverId")]
        getter server_id : String

        # The preferred strategy options for the application component. See the response from
        # GetServerStrategies .
        @[JSON::Field(key: "strategyOption")]
        getter strategy_option : Types::StrategyOption?

        def initialize(
          @server_id : String,
          @strategy_option : Types::StrategyOption? = nil
        )
        end
      end

      struct UpdateServerConfigResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request body isn't valid.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about the server in vCenter.
      struct VcenterBasedRemoteInfo
        include JSON::Serializable

        # The type of the operating system.
        @[JSON::Field(key: "osType")]
        getter os_type : String?

        # The time when the remote server based on vCenter was last configured.
        @[JSON::Field(key: "vcenterConfigurationTimeStamp")]
        getter vcenter_configuration_time_stamp : String?

        def initialize(
          @os_type : String? = nil,
          @vcenter_configuration_time_stamp : String? = nil
        )
        end
      end

      # Details about the version control configuration.
      struct VersionControlInfo
        include JSON::Serializable

        # The time when the version control system was last configured.
        @[JSON::Field(key: "versionControlConfigurationTimeStamp")]
        getter version_control_configuration_time_stamp : String?

        # The type of version control.
        @[JSON::Field(key: "versionControlType")]
        getter version_control_type : String?

        def initialize(
          @version_control_configuration_time_stamp : String? = nil,
          @version_control_type : String? = nil
        )
        end
      end
    end
  end
end
