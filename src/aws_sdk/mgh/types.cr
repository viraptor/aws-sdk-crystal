require "json"
require "time"

module AwsSdk
  module MigrationHub
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

      # The state of an application discovered through Migration Hub import, the AWS Agentless Discovery
      # Connector, or the AWS Application Discovery Agent.
      struct ApplicationState
        include JSON::Serializable

        # The configurationId from the Application Discovery Service that uniquely identifies an application.
        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The current status of an application.
        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String?

        # The timestamp when the application status was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        def initialize(
          @application_id : String? = nil,
          @application_status : String? = nil,
          @last_updated_time : Time? = nil
        )
        end
      end

      struct AssociateCreatedArtifactRequest
        include JSON::Serializable

        # An ARN of the AWS resource related to the migration (e.g., AMI, EC2 instance, RDS instance, etc.)
        @[JSON::Field(key: "CreatedArtifact")]
        getter created_artifact : Types::CreatedArtifact

        # Unique identifier that references the migration task. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @created_artifact : Types::CreatedArtifact,
          @migration_task_name : String,
          @progress_update_stream : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct AssociateCreatedArtifactResult
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateDiscoveredResourceRequest
        include JSON::Serializable

        # Object representing a Resource.
        @[JSON::Field(key: "DiscoveredResource")]
        getter discovered_resource : Types::DiscoveredResource

        # The identifier given to the MigrationTask. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @discovered_resource : Types::DiscoveredResource,
          @migration_task_name : String,
          @progress_update_stream : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct AssociateDiscoveredResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateSourceResourceRequest
        include JSON::Serializable

        # A unique identifier that references the migration task. Do not include sensitive data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the progress-update stream, which is used for access control as well as a namespace for
        # migration-task names that is implicitly linked to your AWS account. The progress-update stream must
        # uniquely identify the migration tool as it is used for all updates made by the tool; however, it
        # does not need to be unique for each AWS account because it is scoped to the AWS account.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # The source resource that you want to associate.
        @[JSON::Field(key: "SourceResource")]
        getter source_resource : Types::SourceResource

        # This is an optional parameter that you can use to test whether the call will succeed. Set this
        # parameter to true to verify that you have the permissions that are required to make the call, and
        # that you have specified the other parameters in the call correctly.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @source_resource : Types::SourceResource,
          @dry_run : Bool? = nil
        )
        end
      end

      struct AssociateSourceResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateProgressUpdateStreamRequest
        include JSON::Serializable

        # The name of the ProgressUpdateStream. Do not store personal data in this field.
        @[JSON::Field(key: "ProgressUpdateStreamName")]
        getter progress_update_stream_name : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @progress_update_stream_name : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct CreateProgressUpdateStreamResult
        include JSON::Serializable

        def initialize
        end
      end

      # An ARN of the AWS cloud resource target receiving the migration (e.g., AMI, EC2 instance, RDS
      # instance, etc.).
      struct CreatedArtifact
        include JSON::Serializable

        # An ARN that uniquely identifies the result of a migration task.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A description that can be free-form text to record additional detail about the artifact for clarity
        # or for later reference.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct DeleteProgressUpdateStreamRequest
        include JSON::Serializable

        # The name of the ProgressUpdateStream. Do not store personal data in this field.
        @[JSON::Field(key: "ProgressUpdateStreamName")]
        getter progress_update_stream_name : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @progress_update_stream_name : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct DeleteProgressUpdateStreamResult
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeApplicationStateRequest
        include JSON::Serializable

        # The configurationId in Application Discovery Service that uniquely identifies the grouped
        # application.
        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end

      struct DescribeApplicationStateResult
        include JSON::Serializable

        # Status of the application - Not Started, In-Progress, Complete.
        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String?

        # The timestamp when the application status was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        def initialize(
          @application_status : String? = nil,
          @last_updated_time : Time? = nil
        )
        end
      end

      struct DescribeMigrationTaskRequest
        include JSON::Serializable

        # The identifier given to the MigrationTask. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String
        )
        end
      end

      struct DescribeMigrationTaskResult
        include JSON::Serializable

        # Object encapsulating information about the migration task.
        @[JSON::Field(key: "MigrationTask")]
        getter migration_task : Types::MigrationTask?

        def initialize(
          @migration_task : Types::MigrationTask? = nil
        )
        end
      end

      struct DisassociateCreatedArtifactRequest
        include JSON::Serializable

        # An ARN of the AWS resource related to the migration (e.g., AMI, EC2 instance, RDS instance, etc.)
        @[JSON::Field(key: "CreatedArtifactName")]
        getter created_artifact_name : String

        # Unique identifier that references the migration task to be disassociated with the artifact. Do not
        # store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @created_artifact_name : String,
          @migration_task_name : String,
          @progress_update_stream : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct DisassociateCreatedArtifactResult
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateDiscoveredResourceRequest
        include JSON::Serializable

        # ConfigurationId of the Application Discovery Service resource to be disassociated.
        @[JSON::Field(key: "ConfigurationId")]
        getter configuration_id : String

        # The identifier given to the MigrationTask. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @configuration_id : String,
          @migration_task_name : String,
          @progress_update_stream : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct DisassociateDiscoveredResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateSourceResourceRequest
        include JSON::Serializable

        # A unique identifier that references the migration task. Do not include sensitive data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the progress-update stream, which is used for access control as well as a namespace for
        # migration-task names that is implicitly linked to your AWS account. The progress-update stream must
        # uniquely identify the migration tool as it is used for all updates made by the tool; however, it
        # does not need to be unique for each AWS account because it is scoped to the AWS account.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # The name that was specified for the source resource.
        @[JSON::Field(key: "SourceResourceName")]
        getter source_resource_name : String

        # This is an optional parameter that you can use to test whether the call will succeed. Set this
        # parameter to true to verify that you have the permissions that are required to make the call, and
        # that you have specified the other parameters in the call correctly.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @source_resource_name : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct DisassociateSourceResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # Object representing the on-premises resource being migrated.
      struct DiscoveredResource
        include JSON::Serializable

        # The configurationId in Application Discovery Service that uniquely identifies the on-premise
        # resource.
        @[JSON::Field(key: "ConfigurationId")]
        getter configuration_id : String

        # A description that can be free-form text to record additional detail about the discovered resource
        # for clarity or later reference.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @configuration_id : String,
          @description : String? = nil
        )
        end
      end

      # Exception raised to indicate a successfully authorized action when the DryRun flag is set to "true".
      struct DryRunOperation
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The home region is not set. Set the home region to continue.
      struct HomeRegionNotSetException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ImportMigrationTaskRequest
        include JSON::Serializable

        # Unique identifier that references the migration task. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream. &gt;
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @dry_run : Bool? = nil
        )
        end
      end

      struct ImportMigrationTaskResult
        include JSON::Serializable

        def initialize
        end
      end

      # Exception raised when an internal, configuration, or dependency error is encountered.
      struct InternalServerError
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception raised when the provided input violates a policy constraint or is entered in the wrong
      # format or data type.
      struct InvalidInputException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListApplicationStatesRequest
        include JSON::Serializable

        # The configurationIds from the Application Discovery Service that uniquely identifies your
        # applications.
        @[JSON::Field(key: "ApplicationIds")]
        getter application_ids : Array(String)?

        # Maximum number of results to be returned per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If a NextToken was returned by a previous call, there are more results available. To retrieve the
        # next page of results, make the call again using the returned token in NextToken .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationStatesResult
        include JSON::Serializable

        # A list of Applications that exist in Application Discovery Service.
        @[JSON::Field(key: "ApplicationStateList")]
        getter application_state_list : Array(Types::ApplicationState)?

        # If a NextToken was returned by a previous call, there are more results available. To retrieve the
        # next page of results, make the call again using the returned token in NextToken .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_state_list : Array(Types::ApplicationState)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCreatedArtifactsRequest
        include JSON::Serializable

        # Unique identifier that references the migration task. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Maximum number of results to be returned per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If a NextToken was returned by a previous call, there are more results available. To retrieve the
        # next page of results, make the call again using the returned token in NextToken .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCreatedArtifactsResult
        include JSON::Serializable

        # List of created artifacts up to the maximum number of results specified in the request.
        @[JSON::Field(key: "CreatedArtifactList")]
        getter created_artifact_list : Array(Types::CreatedArtifact)?

        # If there are more created artifacts than the max result, return the next token to be passed to the
        # next call as a bookmark of where to start from.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @created_artifact_list : Array(Types::CreatedArtifact)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDiscoveredResourcesRequest
        include JSON::Serializable

        # The name of the MigrationTask. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # The maximum number of results returned per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If a NextToken was returned by a previous call, there are more results available. To retrieve the
        # next page of results, make the call again using the returned token in NextToken .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDiscoveredResourcesResult
        include JSON::Serializable

        # Returned list of discovered resources associated with the given MigrationTask.
        @[JSON::Field(key: "DiscoveredResourceList")]
        getter discovered_resource_list : Array(Types::DiscoveredResource)?

        # If there are more discovered resources than the max result, return the next token to be passed to
        # the next call as a bookmark of where to start from.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @discovered_resource_list : Array(Types::DiscoveredResource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMigrationTaskUpdatesRequest
        include JSON::Serializable

        # A unique identifier that references the migration task. Do not include sensitive data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the progress-update stream, which is used for access control as well as a namespace for
        # migration-task names that is implicitly linked to your AWS account. The progress-update stream must
        # uniquely identify the migration tool as it is used for all updates made by the tool; however, it
        # does not need to be unique for each AWS account because it is scoped to the AWS account.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # The maximum number of results to include in the response. If more results exist than the value that
        # you specify here for MaxResults , the response will include a token that you can use to retrieve the
        # next set of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken was returned by a previous call, there are more results available. The value of
        # NextToken is a unique pagination token for each page. To retrieve the next page of results, specify
        # the NextToken value that the previous call returned. Keep all other arguments unchanged. Each
        # pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400
        # InvalidToken error.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMigrationTaskUpdatesResult
        include JSON::Serializable

        # The list of migration-task updates.
        @[JSON::Field(key: "MigrationTaskUpdateList")]
        getter migration_task_update_list : Array(Types::MigrationTaskUpdate)?

        # If the response includes a NextToken value, that means that there are more results available. The
        # value of NextToken is a unique pagination token for each page. To retrieve the next page of results,
        # call this API again and specify this NextToken value in the request. Keep all other arguments
        # unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will
        # return an HTTP 400 InvalidToken error.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @migration_task_update_list : Array(Types::MigrationTaskUpdate)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMigrationTasksRequest
        include JSON::Serializable

        # Value to specify how many results are returned per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If a NextToken was returned by a previous call, there are more results available. To retrieve the
        # next page of results, make the call again using the returned token in NextToken .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter migration tasks by discovered resource name.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct ListMigrationTasksResult
        include JSON::Serializable

        # Lists the migration task's summary which includes: MigrationTaskName , ProgressPercent ,
        # ProgressUpdateStream , Status , and the UpdateDateTime for each task.
        @[JSON::Field(key: "MigrationTaskSummaryList")]
        getter migration_task_summary_list : Array(Types::MigrationTaskSummary)?

        # If there are more migration tasks than the max result, return the next token to be passed to the
        # next call as a bookmark of where to start from.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @migration_task_summary_list : Array(Types::MigrationTaskSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProgressUpdateStreamsRequest
        include JSON::Serializable

        # Filter to limit the maximum number of results to list per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If a NextToken was returned by a previous call, there are more results available. To retrieve the
        # next page of results, make the call again using the returned token in NextToken .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProgressUpdateStreamsResult
        include JSON::Serializable

        # If there are more streams created than the max result, return the next token to be passed to the
        # next call as a bookmark of where to start from.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of progress update streams up to the max number of results passed in the input.
        @[JSON::Field(key: "ProgressUpdateStreamSummaryList")]
        getter progress_update_stream_summary_list : Array(Types::ProgressUpdateStreamSummary)?

        def initialize(
          @next_token : String? = nil,
          @progress_update_stream_summary_list : Array(Types::ProgressUpdateStreamSummary)? = nil
        )
        end
      end

      struct ListSourceResourcesRequest
        include JSON::Serializable

        # A unique identifier that references the migration task. Do not store confidential data in this
        # field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the progress-update stream, which is used for access control as well as a namespace for
        # migration-task names that is implicitly linked to your AWS account. The progress-update stream must
        # uniquely identify the migration tool as it is used for all updates made by the tool; however, it
        # does not need to be unique for each AWS account because it is scoped to the AWS account.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # The maximum number of results to include in the response. If more results exist than the value that
        # you specify here for MaxResults , the response will include a token that you can use to retrieve the
        # next set of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken was returned by a previous call, there are more results available. The value of
        # NextToken is a unique pagination token for each page. To retrieve the next page of results, specify
        # the NextToken value that the previous call returned. Keep all other arguments unchanged. Each
        # pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400
        # InvalidToken error.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSourceResourcesResult
        include JSON::Serializable

        # If the response includes a NextToken value, that means that there are more results available. The
        # value of NextToken is a unique pagination token for each page. To retrieve the next page of results,
        # call this API again and specify this NextToken value in the request. Keep all other arguments
        # unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will
        # return an HTTP 400 InvalidToken error.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of source resources.
        @[JSON::Field(key: "SourceResourceList")]
        getter source_resource_list : Array(Types::SourceResource)?

        def initialize(
          @next_token : String? = nil,
          @source_resource_list : Array(Types::SourceResource)? = nil
        )
        end
      end

      # Represents a migration task in a migration tool.
      struct MigrationTask
        include JSON::Serializable

        # Unique identifier that references the migration task. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String?

        # A name that identifies the vendor of the migration tool being used.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String?

        # Information about the resource that is being migrated. This data will be used to map the task to a
        # resource in the Application Discovery Service repository.
        @[JSON::Field(key: "ResourceAttributeList")]
        getter resource_attribute_list : Array(Types::ResourceAttribute)?

        # Task object encapsulating task information.
        @[JSON::Field(key: "Task")]
        getter task : Types::Task?

        # The timestamp when the task was gathered.
        @[JSON::Field(key: "UpdateDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date_time : Time?

        def initialize(
          @migration_task_name : String? = nil,
          @progress_update_stream : String? = nil,
          @resource_attribute_list : Array(Types::ResourceAttribute)? = nil,
          @task : Types::Task? = nil,
          @update_date_time : Time? = nil
        )
        end
      end

      # MigrationTaskSummary includes MigrationTaskName , ProgressPercent , ProgressUpdateStream , Status ,
      # and UpdateDateTime for each task.
      struct MigrationTaskSummary
        include JSON::Serializable

        # Unique identifier that references the migration task. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String?

        # Indication of the percentage completion of the task.
        @[JSON::Field(key: "ProgressPercent")]
        getter progress_percent : Int32?

        # An AWS resource used for access control. It should uniquely identify the migration tool as it is
        # used for all updates made by the tool.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String?

        # Status of the task.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Detail information of what is being done within the overall status state.
        @[JSON::Field(key: "StatusDetail")]
        getter status_detail : String?

        # The timestamp when the task was gathered.
        @[JSON::Field(key: "UpdateDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date_time : Time?

        def initialize(
          @migration_task_name : String? = nil,
          @progress_percent : Int32? = nil,
          @progress_update_stream : String? = nil,
          @status : String? = nil,
          @status_detail : String? = nil,
          @update_date_time : Time? = nil
        )
        end
      end

      # A migration-task progress update.
      struct MigrationTaskUpdate
        include JSON::Serializable

        @[JSON::Field(key: "MigrationTaskState")]
        getter migration_task_state : Types::Task?

        # The timestamp for the update.
        @[JSON::Field(key: "UpdateDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date_time : Time?

        # The type of the update.
        @[JSON::Field(key: "UpdateType")]
        getter update_type : String?

        def initialize(
          @migration_task_state : Types::Task? = nil,
          @update_date_time : Time? = nil,
          @update_type : String? = nil
        )
        end
      end

      struct NotifyApplicationStateRequest
        include JSON::Serializable

        # The configurationId in Application Discovery Service that uniquely identifies the grouped
        # application.
        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # Status of the application - Not Started, In-Progress, Complete.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # The timestamp when the application state changed.
        @[JSON::Field(key: "UpdateDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date_time : Time?

        def initialize(
          @application_id : String,
          @status : String,
          @dry_run : Bool? = nil,
          @update_date_time : Time? = nil
        )
        end
      end

      struct NotifyApplicationStateResult
        include JSON::Serializable

        def initialize
        end
      end

      struct NotifyMigrationTaskStateRequest
        include JSON::Serializable

        # Unique identifier that references the migration task. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # Number of seconds after the UpdateDateTime within which the Migration Hub can expect an update. If
        # Migration Hub does not receive an update within the specified interval, then the migration task will
        # be considered stale.
        @[JSON::Field(key: "NextUpdateSeconds")]
        getter next_update_seconds : Int32

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Information about the task's progress and status.
        @[JSON::Field(key: "Task")]
        getter task : Types::Task

        # The timestamp when the task was gathered.
        @[JSON::Field(key: "UpdateDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date_time : Time

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @migration_task_name : String,
          @next_update_seconds : Int32,
          @progress_update_stream : String,
          @task : Types::Task,
          @update_date_time : Time,
          @dry_run : Bool? = nil
        )
        end
      end

      struct NotifyMigrationTaskStateResult
        include JSON::Serializable

        def initialize
        end
      end

      # Exception raised when there are problems accessing Application Discovery Service (Application
      # Discovery Service); most likely due to a misconfigured policy or the migrationhub-discovery role is
      # missing or not configured correctly.
      struct PolicyErrorException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Summary of the AWS resource used for access control that is implicitly linked to your AWS account.
      struct ProgressUpdateStreamSummary
        include JSON::Serializable

        # The name of the ProgressUpdateStream. Do not store personal data in this field.
        @[JSON::Field(key: "ProgressUpdateStreamName")]
        getter progress_update_stream_name : String?

        def initialize(
          @progress_update_stream_name : String? = nil
        )
        end
      end

      struct PutResourceAttributesRequest
        include JSON::Serializable

        # Unique identifier that references the migration task. Do not store personal data in this field.
        @[JSON::Field(key: "MigrationTaskName")]
        getter migration_task_name : String

        # The name of the ProgressUpdateStream.
        @[JSON::Field(key: "ProgressUpdateStream")]
        getter progress_update_stream : String

        # Information about the resource that is being migrated. This data will be used to map the task to a
        # resource in the Application Discovery Service repository. Takes the object array of
        # ResourceAttribute where the Type field is reserved for the following values: IPV4_ADDRESS |
        # IPV6_ADDRESS | MAC_ADDRESS | FQDN | VM_MANAGER_ID | VM_MANAGED_OBJECT_REFERENCE | VM_NAME | VM_PATH
        # | BIOS_ID | MOTHERBOARD_SERIAL_NUMBER where the identifying value can be a string up to 256
        # characters. If any "VM" related value is set for a ResourceAttribute object, it is required that
        # VM_MANAGER_ID , as a minimum, is always set. If VM_MANAGER_ID is not set, then all "VM" fields will
        # be discarded and "VM" fields will not be used for matching the migration task to a server in
        # Application Discovery Service repository. See the Example section below for a use case of specifying
        # "VM" related values. If a server you are trying to match has multiple IP or MAC addresses, you
        # should provide as many as you know in separate type/value pairs passed to the ResourceAttributeList
        # parameter to maximize the chances of matching.
        @[JSON::Field(key: "ResourceAttributeList")]
        getter resource_attribute_list : Array(Types::ResourceAttribute)

        # Optional boolean flag to indicate whether any effect should take place. Used to test if the caller
        # has permission to make the call.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @migration_task_name : String,
          @progress_update_stream : String,
          @resource_attribute_list : Array(Types::ResourceAttribute),
          @dry_run : Bool? = nil
        )
        end
      end

      struct PutResourceAttributesResult
        include JSON::Serializable

        def initialize
        end
      end

      # Attribute associated with a resource. Note the corresponding format required per type listed below:
      # IPV4 x.x.x.x where x is an integer in the range [0,255] IPV6 y : y : y : y : y : y : y : y where y
      # is a hexadecimal between 0 and FFFF. [0, FFFF] MAC_ADDRESS ^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$
      # FQDN ^[^&lt;&gt;{}\\\\/?,=\\p{Cntrl}]{1,256}$
      struct ResourceAttribute
        include JSON::Serializable

        # Type of resource.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Value of the resource type.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # Exception raised when the request references a resource (Application Discovery Service
      # configuration, update stream, migration task, etc.) that does not exist in Application Discovery
      # Service (Application Discovery Service) or in Migration Hub's repository.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception raised when there is an internal, configuration, or dependency error encountered.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A source resource can be a source server, a migration wave, an application, or any other resource
      # that you track.
      struct SourceResource
        include JSON::Serializable

        # This is the name that you want to use to identify the resource. If the resource is an AWS resource,
        # we recommend that you set this parameter to the ARN of the resource.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A description that can be free-form text to record additional detail about the resource for clarity
        # or later reference.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A free-form description of the status of the resource.
        @[JSON::Field(key: "StatusDetail")]
        getter status_detail : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @status_detail : String? = nil
        )
        end
      end

      # Task object encapsulating task information.
      struct Task
        include JSON::Serializable

        # Status of the task - Not Started, In-Progress, Complete.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Indication of the percentage completion of the task.
        @[JSON::Field(key: "ProgressPercent")]
        getter progress_percent : Int32?

        # Details of task status as notified by a migration tool. A tool might use this field to provide
        # clarifying information about the status that is unique to that tool or that explains an error state.
        @[JSON::Field(key: "StatusDetail")]
        getter status_detail : String?

        def initialize(
          @status : String,
          @progress_percent : Int32? = nil,
          @status_detail : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        # A message that provides information about the exception.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The number of seconds the caller should wait before retrying.
        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Exception raised to indicate a request was not authorized when the DryRun flag is set to "true".
      struct UnauthorizedOperation
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
