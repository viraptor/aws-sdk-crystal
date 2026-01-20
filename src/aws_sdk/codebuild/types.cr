require "json"
require "time"

module AwsSdk
  module CodeBuild
    module Types

      # An Amazon Web Services service limit was exceeded for the calling Amazon Web Services account.

      struct AccountLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The CodeBuild access has been suspended for the calling Amazon Web Services account.

      struct AccountSuspendedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the auto-retry configuration for the build.

      struct AutoRetryConfig
        include JSON::Serializable

        # The maximum number of additional automatic retries after a failed build. For example, if the
        # auto-retry limit is set to 2, CodeBuild will call the RetryBuild API to automatically retry your
        # build for up to 2 additional times.

        @[JSON::Field(key: "autoRetryLimit")]
        getter auto_retry_limit : Int32?

        # The number of times that the build has been retried. The initial build will have an auto-retry
        # number of 0.

        @[JSON::Field(key: "autoRetryNumber")]
        getter auto_retry_number : Int32?

        # The build ARN of the auto-retried build triggered by the current build. The next auto-retry will be
        # null for builds that don't trigger an auto-retry.

        @[JSON::Field(key: "nextAutoRetry")]
        getter next_auto_retry : String?

        # The build ARN of the build that triggered the current auto-retry build. The previous auto-retry will
        # be null for the initial build.

        @[JSON::Field(key: "previousAutoRetry")]
        getter previous_auto_retry : String?

        def initialize(
          @auto_retry_limit : Int32? = nil,
          @auto_retry_number : Int32? = nil,
          @next_auto_retry : String? = nil,
          @previous_auto_retry : String? = nil
        )
        end
      end


      struct BatchDeleteBuildsInput
        include JSON::Serializable

        # The IDs of the builds to delete.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        def initialize(
          @ids : Array(String)
        )
        end
      end


      struct BatchDeleteBuildsOutput
        include JSON::Serializable

        # The IDs of the builds that were successfully deleted.

        @[JSON::Field(key: "buildsDeleted")]
        getter builds_deleted : Array(String)?

        # Information about any builds that could not be successfully deleted.

        @[JSON::Field(key: "buildsNotDeleted")]
        getter builds_not_deleted : Array(Types::BuildNotDeleted)?

        def initialize(
          @builds_deleted : Array(String)? = nil,
          @builds_not_deleted : Array(Types::BuildNotDeleted)? = nil
        )
        end
      end


      struct BatchGetBuildBatchesInput
        include JSON::Serializable

        # An array that contains the batch build identifiers to retrieve.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        def initialize(
          @ids : Array(String)
        )
        end
      end


      struct BatchGetBuildBatchesOutput
        include JSON::Serializable

        # An array of BuildBatch objects that represent the retrieved batch builds.

        @[JSON::Field(key: "buildBatches")]
        getter build_batches : Array(Types::BuildBatch)?

        # An array that contains the identifiers of any batch builds that are not found.

        @[JSON::Field(key: "buildBatchesNotFound")]
        getter build_batches_not_found : Array(String)?

        def initialize(
          @build_batches : Array(Types::BuildBatch)? = nil,
          @build_batches_not_found : Array(String)? = nil
        )
        end
      end


      struct BatchGetBuildsInput
        include JSON::Serializable

        # The IDs of the builds.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        def initialize(
          @ids : Array(String)
        )
        end
      end


      struct BatchGetBuildsOutput
        include JSON::Serializable

        # Information about the requested builds.

        @[JSON::Field(key: "builds")]
        getter builds : Array(Types::Build)?

        # The IDs of builds for which information could not be found.

        @[JSON::Field(key: "buildsNotFound")]
        getter builds_not_found : Array(String)?

        def initialize(
          @builds : Array(Types::Build)? = nil,
          @builds_not_found : Array(String)? = nil
        )
        end
      end


      struct BatchGetCommandExecutionsInput
        include JSON::Serializable

        # A comma separated list of commandExecutionIds .

        @[JSON::Field(key: "commandExecutionIds")]
        getter command_execution_ids : Array(String)

        # A sandboxId or sandboxArn .

        @[JSON::Field(key: "sandboxId")]
        getter sandbox_id : String

        def initialize(
          @command_execution_ids : Array(String),
          @sandbox_id : String
        )
        end
      end


      struct BatchGetCommandExecutionsOutput
        include JSON::Serializable

        # Information about the requested command executions.

        @[JSON::Field(key: "commandExecutions")]
        getter command_executions : Array(Types::CommandExecution)?

        # The IDs of command executions for which information could not be found.

        @[JSON::Field(key: "commandExecutionsNotFound")]
        getter command_executions_not_found : Array(String)?

        def initialize(
          @command_executions : Array(Types::CommandExecution)? = nil,
          @command_executions_not_found : Array(String)? = nil
        )
        end
      end


      struct BatchGetFleetsInput
        include JSON::Serializable

        # The names or ARNs of the compute fleets.

        @[JSON::Field(key: "names")]
        getter names : Array(String)

        def initialize(
          @names : Array(String)
        )
        end
      end


      struct BatchGetFleetsOutput
        include JSON::Serializable

        # Information about the requested compute fleets.

        @[JSON::Field(key: "fleets")]
        getter fleets : Array(Types::Fleet)?

        # The names of compute fleets for which information could not be found.

        @[JSON::Field(key: "fleetsNotFound")]
        getter fleets_not_found : Array(String)?

        def initialize(
          @fleets : Array(Types::Fleet)? = nil,
          @fleets_not_found : Array(String)? = nil
        )
        end
      end


      struct BatchGetProjectsInput
        include JSON::Serializable

        # The names or ARNs of the build projects. To get information about a project shared with your Amazon
        # Web Services account, its ARN must be specified. You cannot specify a shared project using its name.

        @[JSON::Field(key: "names")]
        getter names : Array(String)

        def initialize(
          @names : Array(String)
        )
        end
      end


      struct BatchGetProjectsOutput
        include JSON::Serializable

        # Information about the requested build projects.

        @[JSON::Field(key: "projects")]
        getter projects : Array(Types::Project)?

        # The names of build projects for which information could not be found.

        @[JSON::Field(key: "projectsNotFound")]
        getter projects_not_found : Array(String)?

        def initialize(
          @projects : Array(Types::Project)? = nil,
          @projects_not_found : Array(String)? = nil
        )
        end
      end


      struct BatchGetReportGroupsInput
        include JSON::Serializable

        # An array of report group ARNs that identify the report groups to return.

        @[JSON::Field(key: "reportGroupArns")]
        getter report_group_arns : Array(String)

        def initialize(
          @report_group_arns : Array(String)
        )
        end
      end


      struct BatchGetReportGroupsOutput
        include JSON::Serializable

        # The array of report groups returned by BatchGetReportGroups .

        @[JSON::Field(key: "reportGroups")]
        getter report_groups : Array(Types::ReportGroup)?

        # An array of ARNs passed to BatchGetReportGroups that are not associated with a ReportGroup .

        @[JSON::Field(key: "reportGroupsNotFound")]
        getter report_groups_not_found : Array(String)?

        def initialize(
          @report_groups : Array(Types::ReportGroup)? = nil,
          @report_groups_not_found : Array(String)? = nil
        )
        end
      end


      struct BatchGetReportsInput
        include JSON::Serializable

        # An array of ARNs that identify the Report objects to return.

        @[JSON::Field(key: "reportArns")]
        getter report_arns : Array(String)

        def initialize(
          @report_arns : Array(String)
        )
        end
      end


      struct BatchGetReportsOutput
        include JSON::Serializable

        # The array of Report objects returned by BatchGetReports .

        @[JSON::Field(key: "reports")]
        getter reports : Array(Types::Report)?

        # An array of ARNs passed to BatchGetReportGroups that are not associated with a Report .

        @[JSON::Field(key: "reportsNotFound")]
        getter reports_not_found : Array(String)?

        def initialize(
          @reports : Array(Types::Report)? = nil,
          @reports_not_found : Array(String)? = nil
        )
        end
      end


      struct BatchGetSandboxesInput
        include JSON::Serializable

        # A comma separated list of sandboxIds or sandboxArns .

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        def initialize(
          @ids : Array(String)
        )
        end
      end


      struct BatchGetSandboxesOutput
        include JSON::Serializable

        # Information about the requested sandboxes.

        @[JSON::Field(key: "sandboxes")]
        getter sandboxes : Array(Types::Sandbox)?

        # The IDs of sandboxes for which information could not be found.

        @[JSON::Field(key: "sandboxesNotFound")]
        getter sandboxes_not_found : Array(String)?

        def initialize(
          @sandboxes : Array(Types::Sandbox)? = nil,
          @sandboxes_not_found : Array(String)? = nil
        )
        end
      end

      # Specifies restrictions for the batch build.

      struct BatchRestrictions
        include JSON::Serializable

        # An array of strings that specify the compute types that are allowed for the batch build. See Build
        # environment compute types in the CodeBuild User Guide for these values.

        @[JSON::Field(key: "computeTypesAllowed")]
        getter compute_types_allowed : Array(String)?

        # An array of strings that specify the fleets that are allowed for the batch build. See Run builds on
        # reserved capacity fleets in the CodeBuild User Guide for more information.

        @[JSON::Field(key: "fleetsAllowed")]
        getter fleets_allowed : Array(String)?

        # Specifies the maximum number of builds allowed.

        @[JSON::Field(key: "maximumBuildsAllowed")]
        getter maximum_builds_allowed : Int32?

        def initialize(
          @compute_types_allowed : Array(String)? = nil,
          @fleets_allowed : Array(String)? = nil,
          @maximum_builds_allowed : Int32? = nil
        )
        end
      end

      # Information about a build.

      struct Build
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the build.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about the output artifacts for the build.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Types::BuildArtifacts?

        # Information about the auto-retry configuration for the build.

        @[JSON::Field(key: "autoRetryConfig")]
        getter auto_retry_config : Types::AutoRetryConfig?

        # The ARN of the batch build that this build is a member of, if applicable.

        @[JSON::Field(key: "buildBatchArn")]
        getter build_batch_arn : String?

        # Whether the build is complete. True if complete; otherwise, false.

        @[JSON::Field(key: "buildComplete")]
        getter build_complete : Bool?

        # The number of the build. For each project, the buildNumber of its first build is 1 . The buildNumber
        # of each subsequent build is incremented by 1 . If a build is deleted, the buildNumber of other
        # builds does not change.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : Int64?

        # The current status of the build. Valid values include: FAILED : The build failed. FAULT : The build
        # faulted. IN_PROGRESS : The build is still in progress. STOPPED : The build stopped. SUCCEEDED : The
        # build succeeded. TIMED_OUT : The build timed out.

        @[JSON::Field(key: "buildStatus")]
        getter build_status : String?

        # Information about the cache for the build.

        @[JSON::Field(key: "cache")]
        getter cache : Types::ProjectCache?

        # The current build phase.

        @[JSON::Field(key: "currentPhase")]
        getter current_phase : String?

        # Contains information about the debug session for this build.

        @[JSON::Field(key: "debugSession")]
        getter debug_session : Types::DebugSession?

        # The Key Management Service customer master key (CMK) to be used for encrypting the build output
        # artifacts. You can use a cross-account KMS key to encrypt the build output artifacts if your service
        # role has permission to that key. You can specify either the Amazon Resource Name (ARN) of the CMK
        # or, if available, the CMK's alias (using the format alias/&lt;alias-name&gt; ).

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # When the build process ended, expressed in Unix time format.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Information about the build environment for this build.

        @[JSON::Field(key: "environment")]
        getter environment : Types::ProjectEnvironment?

        # A list of exported environment variables for this build. Exported environment variables are used in
        # conjunction with CodePipeline to export environment variables from the current build stage to
        # subsequent stages in the pipeline. For more information, see Working with variables in the
        # CodePipeline User Guide .

        @[JSON::Field(key: "exportedEnvironmentVariables")]
        getter exported_environment_variables : Array(Types::ExportedEnvironmentVariable)?

        # An array of ProjectFileSystemLocation objects for a CodeBuild build project. A
        # ProjectFileSystemLocation object specifies the identifier , location , mountOptions , mountPoint ,
        # and type of a file system created using Amazon Elastic File System.

        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::ProjectFileSystemLocation)?

        # The unique ID for the build.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The entity that started the build. Valid values include: If CodePipeline started the build, the
        # pipeline's name (for example, codepipeline/my-demo-pipeline ). If a user started the build, the
        # user's name (for example, MyUserName ). If the Jenkins plugin for CodeBuild started the build, the
        # string CodeBuild-Jenkins-Plugin .

        @[JSON::Field(key: "initiator")]
        getter initiator : String?

        # Information about the build's logs in CloudWatch Logs.

        @[JSON::Field(key: "logs")]
        getter logs : Types::LogsLocation?

        # Describes a network interface.

        @[JSON::Field(key: "networkInterface")]
        getter network_interface : Types::NetworkInterface?

        # Information about all previous build phases that are complete and information about any current
        # build phase that is not yet complete.

        @[JSON::Field(key: "phases")]
        getter phases : Array(Types::BuildPhase)?

        # The name of the CodeBuild project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # The number of minutes a build is allowed to be queued before it times out.

        @[JSON::Field(key: "queuedTimeoutInMinutes")]
        getter queued_timeout_in_minutes : Int32?

        # An array of the ARNs associated with this build's reports.

        @[JSON::Field(key: "reportArns")]
        getter report_arns : Array(String)?

        # An identifier for the version of this build's source code. For CodeCommit, GitHub, GitHub
        # Enterprise, and BitBucket, the commit ID. For CodePipeline, the source revision provided by
        # CodePipeline. For Amazon S3, this does not apply.

        @[JSON::Field(key: "resolvedSourceVersion")]
        getter resolved_source_version : String?

        # An array of ProjectArtifacts objects.

        @[JSON::Field(key: "secondaryArtifacts")]
        getter secondary_artifacts : Array(Types::BuildArtifacts)?

        # An array of ProjectSourceVersion objects. Each ProjectSourceVersion must be one of: For CodeCommit:
        # the commit ID, branch, or Git tag to use. For GitHub: the commit ID, pull request ID, branch name,
        # or tag name that corresponds to the version of the source code you want to build. If a pull request
        # ID is specified, it must use the format pr/pull-request-ID (for example, pr/25 ). If a branch name
        # is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD
        # commit ID is used. For Bitbucket: the commit ID, branch name, or tag name that corresponds to the
        # version of the source code you want to build. If a branch name is specified, the branch's HEAD
        # commit ID is used. If not specified, the default branch's HEAD commit ID is used. For Amazon S3: the
        # version ID of the object that represents the build input ZIP file to use.

        @[JSON::Field(key: "secondarySourceVersions")]
        getter secondary_source_versions : Array(Types::ProjectSourceVersion)?

        # An array of ProjectSource objects.

        @[JSON::Field(key: "secondarySources")]
        getter secondary_sources : Array(Types::ProjectSource)?

        # The name of a service role used for this build.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # Information about the source code to be built.

        @[JSON::Field(key: "source")]
        getter source : Types::ProjectSource?

        # Any version identifier for the version of the source code to be built. If sourceVersion is specified
        # at the project level, then this sourceVersion (at the build level) takes precedence. For more
        # information, see Source Version Sample with CodeBuild in the CodeBuild User Guide .

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # When the build process started, expressed in Unix time format.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before timing out this build
        # if it does not get marked as completed.

        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        # If your CodeBuild project accesses resources in an Amazon VPC, you provide this parameter that
        # identifies the VPC ID and the list of security group IDs and subnet IDs. The security groups and
        # subnets must belong to the same VPC. You must provide at least one security group and one subnet ID.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @arn : String? = nil,
          @artifacts : Types::BuildArtifacts? = nil,
          @auto_retry_config : Types::AutoRetryConfig? = nil,
          @build_batch_arn : String? = nil,
          @build_complete : Bool? = nil,
          @build_number : Int64? = nil,
          @build_status : String? = nil,
          @cache : Types::ProjectCache? = nil,
          @current_phase : String? = nil,
          @debug_session : Types::DebugSession? = nil,
          @encryption_key : String? = nil,
          @end_time : Time? = nil,
          @environment : Types::ProjectEnvironment? = nil,
          @exported_environment_variables : Array(Types::ExportedEnvironmentVariable)? = nil,
          @file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
          @id : String? = nil,
          @initiator : String? = nil,
          @logs : Types::LogsLocation? = nil,
          @network_interface : Types::NetworkInterface? = nil,
          @phases : Array(Types::BuildPhase)? = nil,
          @project_name : String? = nil,
          @queued_timeout_in_minutes : Int32? = nil,
          @report_arns : Array(String)? = nil,
          @resolved_source_version : String? = nil,
          @secondary_artifacts : Array(Types::BuildArtifacts)? = nil,
          @secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
          @secondary_sources : Array(Types::ProjectSource)? = nil,
          @service_role : String? = nil,
          @source : Types::ProjectSource? = nil,
          @source_version : String? = nil,
          @start_time : Time? = nil,
          @timeout_in_minutes : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Information about build output artifacts.

      struct BuildArtifacts
        include JSON::Serializable

        # An identifier for this artifact definition.

        @[JSON::Field(key: "artifactIdentifier")]
        getter artifact_identifier : String?


        @[JSON::Field(key: "bucketOwnerAccess")]
        getter bucket_owner_access : String?

        # Information that tells you if encryption for build artifacts is disabled.

        @[JSON::Field(key: "encryptionDisabled")]
        getter encryption_disabled : Bool?

        # Information about the location of the build artifacts.

        @[JSON::Field(key: "location")]
        getter location : String?

        # The MD5 hash of the build artifact. You can use this hash along with a checksum tool to confirm file
        # integrity and authenticity. This value is available only if the build project's packaging value is
        # set to ZIP .

        @[JSON::Field(key: "md5sum")]
        getter md5sum : String?

        # If this flag is set, a name specified in the buildspec file overrides the artifact name. The name
        # specified in a buildspec file is calculated at build time and uses the Shell Command Language. For
        # example, you can append a date and time to your artifact name so that it is always unique.

        @[JSON::Field(key: "overrideArtifactName")]
        getter override_artifact_name : Bool?

        # The SHA-256 hash of the build artifact. You can use this hash along with a checksum tool to confirm
        # file integrity and authenticity. This value is available only if the build project's packaging value
        # is set to ZIP .

        @[JSON::Field(key: "sha256sum")]
        getter sha256sum : String?

        def initialize(
          @artifact_identifier : String? = nil,
          @bucket_owner_access : String? = nil,
          @encryption_disabled : Bool? = nil,
          @location : String? = nil,
          @md5sum : String? = nil,
          @override_artifact_name : Bool? = nil,
          @sha256sum : String? = nil
        )
        end
      end

      # Contains information about a batch build.

      struct BuildBatch
        include JSON::Serializable

        # The ARN of the batch build.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A BuildArtifacts object the defines the build artifacts for this batch build.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Types::BuildArtifacts?


        @[JSON::Field(key: "buildBatchConfig")]
        getter build_batch_config : Types::ProjectBuildBatchConfig?

        # The number of the batch build. For each project, the buildBatchNumber of its first batch build is 1
        # . The buildBatchNumber of each subsequent batch build is incremented by 1 . If a batch build is
        # deleted, the buildBatchNumber of other batch builds does not change.

        @[JSON::Field(key: "buildBatchNumber")]
        getter build_batch_number : Int64?

        # The status of the batch build.

        @[JSON::Field(key: "buildBatchStatus")]
        getter build_batch_status : String?

        # An array of BuildGroup objects that define the build groups for the batch build.

        @[JSON::Field(key: "buildGroups")]
        getter build_groups : Array(Types::BuildGroup)?

        # Specifies the maximum amount of time, in minutes, that the build in a batch must be completed in.

        @[JSON::Field(key: "buildTimeoutInMinutes")]
        getter build_timeout_in_minutes : Int32?


        @[JSON::Field(key: "cache")]
        getter cache : Types::ProjectCache?

        # Indicates if the batch build is complete.

        @[JSON::Field(key: "complete")]
        getter complete : Bool?

        # The current phase of the batch build.

        @[JSON::Field(key: "currentPhase")]
        getter current_phase : String?

        # Specifies if session debugging is enabled for this batch build. For more information, see Viewing a
        # running build in Session Manager . Batch session debugging is not supported for matrix batch builds.

        @[JSON::Field(key: "debugSessionEnabled")]
        getter debug_session_enabled : Bool?

        # The Key Management Service customer master key (CMK) to be used for encrypting the batch build
        # output artifacts. You can use a cross-account KMS key to encrypt the build output artifacts if your
        # service role has permission to that key. You can specify either the Amazon Resource Name (ARN) of
        # the CMK or, if available, the CMK's alias (using the format alias/&lt;alias-name&gt; ).

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # The date and time that the batch build ended.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?


        @[JSON::Field(key: "environment")]
        getter environment : Types::ProjectEnvironment?

        # An array of ProjectFileSystemLocation objects for the batch build project. A
        # ProjectFileSystemLocation object specifies the identifier , location , mountOptions , mountPoint ,
        # and type of a file system created using Amazon Elastic File System.

        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::ProjectFileSystemLocation)?

        # The identifier of the batch build.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The entity that started the batch build. Valid values include: If CodePipeline started the build,
        # the pipeline's name (for example, codepipeline/my-demo-pipeline ). If a user started the build, the
        # user's name. If the Jenkins plugin for CodeBuild started the build, the string
        # CodeBuild-Jenkins-Plugin .

        @[JSON::Field(key: "initiator")]
        getter initiator : String?


        @[JSON::Field(key: "logConfig")]
        getter log_config : Types::LogsConfig?

        # An array of BuildBatchPhase objects the specify the phases of the batch build.

        @[JSON::Field(key: "phases")]
        getter phases : Array(Types::BuildBatchPhase)?

        # The name of the batch build project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # Specifies the amount of time, in minutes, that the batch build is allowed to be queued before it
        # times out.

        @[JSON::Field(key: "queuedTimeoutInMinutes")]
        getter queued_timeout_in_minutes : Int32?

        # An array that contains the ARNs of reports created by merging reports from builds associated with
        # this batch build.

        @[JSON::Field(key: "reportArns")]
        getter report_arns : Array(String)?

        # The identifier of the resolved version of this batch build's source code. For CodeCommit, GitHub,
        # GitHub Enterprise, and BitBucket, the commit ID. For CodePipeline, the source revision provided by
        # CodePipeline. For Amazon S3, this does not apply.

        @[JSON::Field(key: "resolvedSourceVersion")]
        getter resolved_source_version : String?

        # An array of BuildArtifacts objects the define the build artifacts for this batch build.

        @[JSON::Field(key: "secondaryArtifacts")]
        getter secondary_artifacts : Array(Types::BuildArtifacts)?

        # An array of ProjectSourceVersion objects. Each ProjectSourceVersion must be one of: For CodeCommit:
        # the commit ID, branch, or Git tag to use. For GitHub: the commit ID, pull request ID, branch name,
        # or tag name that corresponds to the version of the source code you want to build. If a pull request
        # ID is specified, it must use the format pr/pull-request-ID (for example, pr/25 ). If a branch name
        # is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD
        # commit ID is used. For Bitbucket: the commit ID, branch name, or tag name that corresponds to the
        # version of the source code you want to build. If a branch name is specified, the branch's HEAD
        # commit ID is used. If not specified, the default branch's HEAD commit ID is used. For Amazon S3: the
        # version ID of the object that represents the build input ZIP file to use.

        @[JSON::Field(key: "secondarySourceVersions")]
        getter secondary_source_versions : Array(Types::ProjectSourceVersion)?

        # An array of ProjectSource objects that define the sources for the batch build.

        @[JSON::Field(key: "secondarySources")]
        getter secondary_sources : Array(Types::ProjectSource)?

        # The name of a service role used for builds in the batch.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?


        @[JSON::Field(key: "source")]
        getter source : Types::ProjectSource?

        # The identifier of the version of the source code to be built.

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # The date and time that the batch build started.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?


        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @arn : String? = nil,
          @artifacts : Types::BuildArtifacts? = nil,
          @build_batch_config : Types::ProjectBuildBatchConfig? = nil,
          @build_batch_number : Int64? = nil,
          @build_batch_status : String? = nil,
          @build_groups : Array(Types::BuildGroup)? = nil,
          @build_timeout_in_minutes : Int32? = nil,
          @cache : Types::ProjectCache? = nil,
          @complete : Bool? = nil,
          @current_phase : String? = nil,
          @debug_session_enabled : Bool? = nil,
          @encryption_key : String? = nil,
          @end_time : Time? = nil,
          @environment : Types::ProjectEnvironment? = nil,
          @file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
          @id : String? = nil,
          @initiator : String? = nil,
          @log_config : Types::LogsConfig? = nil,
          @phases : Array(Types::BuildBatchPhase)? = nil,
          @project_name : String? = nil,
          @queued_timeout_in_minutes : Int32? = nil,
          @report_arns : Array(String)? = nil,
          @resolved_source_version : String? = nil,
          @secondary_artifacts : Array(Types::BuildArtifacts)? = nil,
          @secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
          @secondary_sources : Array(Types::ProjectSource)? = nil,
          @service_role : String? = nil,
          @source : Types::ProjectSource? = nil,
          @source_version : String? = nil,
          @start_time : Time? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Specifies filters when retrieving batch builds.

      struct BuildBatchFilter
        include JSON::Serializable

        # The status of the batch builds to retrieve. Only batch builds that have this status will be
        # retrieved.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Contains information about a stage for a batch build.

      struct BuildBatchPhase
        include JSON::Serializable

        # Additional information about the batch build phase. Especially to help troubleshoot a failed batch
        # build.

        @[JSON::Field(key: "contexts")]
        getter contexts : Array(Types::PhaseContext)?

        # How long, in seconds, between the starting and ending times of the batch build's phase.

        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int64?

        # When the batch build phase ended, expressed in Unix time format.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The current status of the batch build phase. Valid values include: FAILED The build phase failed.
        # FAULT The build phase faulted. IN_PROGRESS The build phase is still in progress. STOPPED The build
        # phase stopped. SUCCEEDED The build phase succeeded. TIMED_OUT The build phase timed out.

        @[JSON::Field(key: "phaseStatus")]
        getter phase_status : String?

        # The name of the batch build phase. Valid values include: COMBINE_ARTIFACTS Build output artifacts
        # are being combined and uploaded to the output location. DOWNLOAD_BATCHSPEC The batch build
        # specification is being downloaded. FAILED One or more of the builds failed. IN_PROGRESS The batch
        # build is in progress. STOPPED The batch build was stopped. SUBMITTED The btach build has been
        # submitted. SUCCEEDED The batch build succeeded.

        @[JSON::Field(key: "phaseType")]
        getter phase_type : String?

        # When the batch build phase started, expressed in Unix time format.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @contexts : Array(Types::PhaseContext)? = nil,
          @duration_in_seconds : Int64? = nil,
          @end_time : Time? = nil,
          @phase_status : String? = nil,
          @phase_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Contains information about a batch build build group. Build groups are used to combine builds that
      # can run in parallel, while still being able to set dependencies on other build groups.

      struct BuildGroup
        include JSON::Serializable

        # A BuildSummary object that contains a summary of the current build group.

        @[JSON::Field(key: "currentBuildSummary")]
        getter current_build_summary : Types::BuildSummary?

        # An array of strings that contain the identifiers of the build groups that this build group depends
        # on.

        @[JSON::Field(key: "dependsOn")]
        getter depends_on : Array(String)?

        # Contains the identifier of the build group.

        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # Specifies if failures in this build group can be ignored.

        @[JSON::Field(key: "ignoreFailure")]
        getter ignore_failure : Bool?

        # An array of BuildSummary objects that contain summaries of previous build groups.

        @[JSON::Field(key: "priorBuildSummaryList")]
        getter prior_build_summary_list : Array(Types::BuildSummary)?

        def initialize(
          @current_build_summary : Types::BuildSummary? = nil,
          @depends_on : Array(String)? = nil,
          @identifier : String? = nil,
          @ignore_failure : Bool? = nil,
          @prior_build_summary_list : Array(Types::BuildSummary)? = nil
        )
        end
      end

      # Information about a build that could not be successfully deleted.

      struct BuildNotDeleted
        include JSON::Serializable

        # The ID of the build that could not be successfully deleted.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Additional information about the build that could not be successfully deleted.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @id : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # Information about a stage for a build.

      struct BuildPhase
        include JSON::Serializable

        # Additional information about a build phase, especially to help troubleshoot a failed build.

        @[JSON::Field(key: "contexts")]
        getter contexts : Array(Types::PhaseContext)?

        # How long, in seconds, between the starting and ending times of the build's phase.

        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int64?

        # When the build phase ended, expressed in Unix time format.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The current status of the build phase. Valid values include: FAILED The build phase failed. FAULT
        # The build phase faulted. IN_PROGRESS The build phase is still in progress. STOPPED The build phase
        # stopped. SUCCEEDED The build phase succeeded. TIMED_OUT The build phase timed out.

        @[JSON::Field(key: "phaseStatus")]
        getter phase_status : String?

        # The name of the build phase. Valid values include: BUILD Core build activities typically occur in
        # this build phase. COMPLETED The build has been completed. DOWNLOAD_SOURCE Source code is being
        # downloaded in this build phase. FINALIZING The build process is completing in this build phase.
        # INSTALL Installation activities typically occur in this build phase. POST_BUILD Post-build
        # activities typically occur in this build phase. PRE_BUILD Pre-build activities typically occur in
        # this build phase. PROVISIONING The build environment is being set up. QUEUED The build has been
        # submitted and is queued behind other submitted builds. SUBMITTED The build has been submitted.
        # UPLOAD_ARTIFACTS Build output artifacts are being uploaded to the output location.

        @[JSON::Field(key: "phaseType")]
        getter phase_type : String?

        # When the build phase started, expressed in Unix time format.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @contexts : Array(Types::PhaseContext)? = nil,
          @duration_in_seconds : Int64? = nil,
          @end_time : Time? = nil,
          @phase_status : String? = nil,
          @phase_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Contains information that defines how the CodeBuild build project reports the build status to the
      # source provider.

      struct BuildStatusConfig
        include JSON::Serializable

        # Specifies the context of the build status CodeBuild sends to the source provider. The usage of this
        # parameter depends on the source provider. Bitbucket This parameter is used for the name parameter in
        # the Bitbucket commit status. For more information, see build in the Bitbucket API documentation.
        # GitHub/GitHub Enterprise Server This parameter is used for the context parameter in the GitHub
        # commit status. For more information, see Create a commit status in the GitHub developer guide.

        @[JSON::Field(key: "context")]
        getter context : String?

        # Specifies the target url of the build status CodeBuild sends to the source provider. The usage of
        # this parameter depends on the source provider. Bitbucket This parameter is used for the url
        # parameter in the Bitbucket commit status. For more information, see build in the Bitbucket API
        # documentation. GitHub/GitHub Enterprise Server This parameter is used for the target_url parameter
        # in the GitHub commit status. For more information, see Create a commit status in the GitHub
        # developer guide.

        @[JSON::Field(key: "targetUrl")]
        getter target_url : String?

        def initialize(
          @context : String? = nil,
          @target_url : String? = nil
        )
        end
      end

      # Contains summary information about a batch build group.

      struct BuildSummary
        include JSON::Serializable

        # The batch build ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The status of the build group. FAILED The build group failed. FAULT The build group faulted.
        # IN_PROGRESS The build group is still in progress. STOPPED The build group stopped. SUCCEEDED The
        # build group succeeded. TIMED_OUT The build group timed out.

        @[JSON::Field(key: "buildStatus")]
        getter build_status : String?

        # A ResolvedArtifact object that represents the primary build artifacts for the build group.

        @[JSON::Field(key: "primaryArtifact")]
        getter primary_artifact : Types::ResolvedArtifact?

        # When the build was started, expressed in Unix time format.

        @[JSON::Field(key: "requestedOn", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter requested_on : Time?

        # An array of ResolvedArtifact objects that represents the secondary build artifacts for the build
        # group.

        @[JSON::Field(key: "secondaryArtifacts")]
        getter secondary_artifacts : Array(Types::ResolvedArtifact)?

        def initialize(
          @arn : String? = nil,
          @build_status : String? = nil,
          @primary_artifact : Types::ResolvedArtifact? = nil,
          @requested_on : Time? = nil,
          @secondary_artifacts : Array(Types::ResolvedArtifact)? = nil
        )
        end
      end

      # Information about CloudWatch Logs for a build project.

      struct CloudWatchLogsConfig
        include JSON::Serializable

        # The current status of the logs in CloudWatch Logs for a build project. Valid values are: ENABLED :
        # CloudWatch Logs are enabled for this build project. DISABLED : CloudWatch Logs are not enabled for
        # this build project.

        @[JSON::Field(key: "status")]
        getter status : String

        # The group name of the logs in CloudWatch Logs. For more information, see Working with Log Groups and
        # Log Streams .

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # The prefix of the stream name of the CloudWatch Logs. For more information, see Working with Log
        # Groups and Log Streams .

        @[JSON::Field(key: "streamName")]
        getter stream_name : String?

        def initialize(
          @status : String,
          @group_name : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Contains code coverage report information. Line coverage measures how many statements your tests
      # cover. A statement is a single instruction, not including comments, conditionals, etc. Branch
      # coverage determines if your tests cover every possible branch of a control structure, such as an if
      # or case statement.

      struct CodeCoverage
        include JSON::Serializable

        # The percentage of branches that are covered by your tests.

        @[JSON::Field(key: "branchCoveragePercentage")]
        getter branch_coverage_percentage : Float64?

        # The number of conditional branches that are covered by your tests.

        @[JSON::Field(key: "branchesCovered")]
        getter branches_covered : Int32?

        # The number of conditional branches that are not covered by your tests.

        @[JSON::Field(key: "branchesMissed")]
        getter branches_missed : Int32?

        # The date and time that the tests were run.

        @[JSON::Field(key: "expired", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expired : Time?

        # The path of the test report file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String?

        # The identifier of the code coverage report.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The percentage of lines that are covered by your tests.

        @[JSON::Field(key: "lineCoveragePercentage")]
        getter line_coverage_percentage : Float64?

        # The number of lines that are covered by your tests.

        @[JSON::Field(key: "linesCovered")]
        getter lines_covered : Int32?

        # The number of lines that are not covered by your tests.

        @[JSON::Field(key: "linesMissed")]
        getter lines_missed : Int32?

        # The ARN of the report.

        @[JSON::Field(key: "reportARN")]
        getter report_arn : String?

        def initialize(
          @branch_coverage_percentage : Float64? = nil,
          @branches_covered : Int32? = nil,
          @branches_missed : Int32? = nil,
          @expired : Time? = nil,
          @file_path : String? = nil,
          @id : String? = nil,
          @line_coverage_percentage : Float64? = nil,
          @lines_covered : Int32? = nil,
          @lines_missed : Int32? = nil,
          @report_arn : String? = nil
        )
        end
      end

      # Contains a summary of a code coverage report. Line coverage measures how many statements your tests
      # cover. A statement is a single instruction, not including comments, conditionals, etc. Branch
      # coverage determines if your tests cover every possible branch of a control structure, such as an if
      # or case statement.

      struct CodeCoverageReportSummary
        include JSON::Serializable

        # The percentage of branches that are covered by your tests.

        @[JSON::Field(key: "branchCoveragePercentage")]
        getter branch_coverage_percentage : Float64?

        # The number of conditional branches that are covered by your tests.

        @[JSON::Field(key: "branchesCovered")]
        getter branches_covered : Int32?

        # The number of conditional branches that are not covered by your tests.

        @[JSON::Field(key: "branchesMissed")]
        getter branches_missed : Int32?

        # The percentage of lines that are covered by your tests.

        @[JSON::Field(key: "lineCoveragePercentage")]
        getter line_coverage_percentage : Float64?

        # The number of lines that are covered by your tests.

        @[JSON::Field(key: "linesCovered")]
        getter lines_covered : Int32?

        # The number of lines that are not covered by your tests.

        @[JSON::Field(key: "linesMissed")]
        getter lines_missed : Int32?

        def initialize(
          @branch_coverage_percentage : Float64? = nil,
          @branches_covered : Int32? = nil,
          @branches_missed : Int32? = nil,
          @line_coverage_percentage : Float64? = nil,
          @lines_covered : Int32? = nil,
          @lines_missed : Int32? = nil
        )
        end
      end

      # Contains command execution information.

      struct CommandExecution
        include JSON::Serializable

        # The command that needs to be executed.

        @[JSON::Field(key: "command")]
        getter command : String?

        # When the command execution process ended, expressed in Unix time format.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The exit code to return upon completion.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : String?

        # The ID of the command execution.

        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "logs")]
        getter logs : Types::LogsLocation?

        # A sandboxArn .

        @[JSON::Field(key: "sandboxArn")]
        getter sandbox_arn : String?

        # A sandboxId .

        @[JSON::Field(key: "sandboxId")]
        getter sandbox_id : String?

        # The text written by the command to stderr.

        @[JSON::Field(key: "standardErrContent")]
        getter standard_err_content : String?

        # The text written by the command to stdout.

        @[JSON::Field(key: "standardOutputContent")]
        getter standard_output_content : String?

        # When the command execution process started, expressed in Unix time format.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the command execution.

        @[JSON::Field(key: "status")]
        getter status : String?

        # When the command execution process was initially submitted, expressed in Unix time format.

        @[JSON::Field(key: "submitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # The command type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @command : String? = nil,
          @end_time : Time? = nil,
          @exit_code : String? = nil,
          @id : String? = nil,
          @logs : Types::LogsLocation? = nil,
          @sandbox_arn : String? = nil,
          @sandbox_id : String? = nil,
          @standard_err_content : String? = nil,
          @standard_output_content : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @submit_time : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains compute attributes. These attributes only need be specified when your project's or fleet's
      # computeType is set to ATTRIBUTE_BASED_COMPUTE or CUSTOM_INSTANCE_TYPE .

      struct ComputeConfiguration
        include JSON::Serializable

        # The amount of disk space of the instance type included in your fleet.

        @[JSON::Field(key: "disk")]
        getter disk : Int64?

        # The EC2 instance type to be launched in your fleet.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The machine type of the instance type included in your fleet.

        @[JSON::Field(key: "machineType")]
        getter machine_type : String?

        # The amount of memory of the instance type included in your fleet.

        @[JSON::Field(key: "memory")]
        getter memory : Int64?

        # The number of vCPUs of the instance type included in your fleet.

        @[JSON::Field(key: "vCpu")]
        getter v_cpu : Int64?

        def initialize(
          @disk : Int64? = nil,
          @instance_type : String? = nil,
          @machine_type : String? = nil,
          @memory : Int64? = nil,
          @v_cpu : Int64? = nil
        )
        end
      end


      struct CreateFleetInput
        include JSON::Serializable

        # The initial number of machines allocated to the ﬂeet, which deﬁnes the number of builds that can run
        # in parallel.

        @[JSON::Field(key: "baseCapacity")]
        getter base_capacity : Int32

        # Information about the compute resources the compute fleet uses. Available values include:
        # ATTRIBUTE_BASED_COMPUTE : Specify the amount of vCPUs, memory, disk space, and the type of machine.
        # If you use ATTRIBUTE_BASED_COMPUTE , you must define your attributes by using computeConfiguration .
        # CodeBuild will select the cheapest instance that satisfies your specified attributes. For more
        # information, see Reserved capacity environment types in the CodeBuild User Guide .
        # CUSTOM_INSTANCE_TYPE : Specify the instance type for your compute fleet. For a list of supported
        # instance types, see Supported instance families in the CodeBuild User Guide . BUILD_GENERAL1_SMALL :
        # Use up to 4 GiB memory and 2 vCPUs for builds. BUILD_GENERAL1_MEDIUM : Use up to 8 GiB memory and 4
        # vCPUs for builds. BUILD_GENERAL1_LARGE : Use up to 16 GiB memory and 8 vCPUs for builds, depending
        # on your environment type. BUILD_GENERAL1_XLARGE : Use up to 72 GiB memory and 36 vCPUs for builds,
        # depending on your environment type. BUILD_GENERAL1_2XLARGE : Use up to 144 GiB memory, 72 vCPUs, and
        # 824 GB of SSD storage for builds. This compute type supports Docker images up to 100 GB
        # uncompressed. BUILD_LAMBDA_1GB : Use up to 1 GiB memory for builds. Only available for environment
        # type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_2GB : Use up to 2 GiB memory for
        # builds. Only available for environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER .
        # BUILD_LAMBDA_4GB : Use up to 4 GiB memory for builds. Only available for environment type
        # LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_8GB : Use up to 8 GiB memory for
        # builds. Only available for environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER .
        # BUILD_LAMBDA_10GB : Use up to 10 GiB memory for builds. Only available for environment type
        # LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . If you use BUILD_GENERAL1_SMALL : For environment
        # type LINUX_CONTAINER , you can use up to 4 GiB memory and 2 vCPUs for builds. For environment type
        # LINUX_GPU_CONTAINER , you can use up to 16 GiB memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU
        # for builds. For environment type ARM_CONTAINER , you can use up to 4 GiB memory and 2 vCPUs on
        # ARM-based processors for builds. If you use BUILD_GENERAL1_LARGE : For environment type
        # LINUX_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs for builds. For environment type
        # LINUX_GPU_CONTAINER , you can use up to 255 GiB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for
        # builds. For environment type ARM_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs on
        # ARM-based processors for builds. For more information, see On-demand environment types in the
        # CodeBuild User Guide.

        @[JSON::Field(key: "computeType")]
        getter compute_type : String

        # The environment type of the compute fleet. The environment type ARM_CONTAINER is available only in
        # regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia Pacific
        # (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and
        # South America (São Paulo). The environment type ARM_EC2 is available only in regions US East (N.
        # Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo),
        # Asia Pacific (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific
        # (Mumbai). The environment type LINUX_CONTAINER is available only in regions US East (N. Virginia),
        # US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific
        # (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific (Mumbai). The
        # environment type LINUX_EC2 is available only in regions US East (N. Virginia), US East (Ohio), US
        # West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Singapore), Asia
        # Pacific (Sydney), South America (São Paulo), and Asia Pacific (Mumbai). The environment type
        # LINUX_GPU_CONTAINER is available only in regions US East (N. Virginia), US East (Ohio), US West
        # (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), and Asia Pacific (Sydney). The
        # environment type MAC_ARM is available for Medium fleets only in regions US East (N. Virginia), US
        # East (Ohio), US West (Oregon), Asia Pacific (Sydney), and EU (Frankfurt) The environment type
        # MAC_ARM is available for Large fleets only in regions US East (N. Virginia), US East (Ohio), US West
        # (Oregon), and Asia Pacific (Sydney). The environment type WINDOWS_EC2 is available only in regions
        # US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific
        # (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia
        # Pacific (Mumbai). The environment type WINDOWS_SERVER_2019_CONTAINER is available only in regions US
        # East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), Asia Pacific (Tokyo),
        # Asia Pacific (Mumbai) and EU (Ireland). The environment type WINDOWS_SERVER_2022_CONTAINER is
        # available only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU
        # (Frankfurt), Asia Pacific (Sydney), Asia Pacific (Singapore), Asia Pacific (Tokyo), South America
        # (São Paulo) and Asia Pacific (Mumbai). For more information, see Build environment compute types in
        # the CodeBuild user guide .

        @[JSON::Field(key: "environmentType")]
        getter environment_type : String

        # The name of the compute fleet.

        @[JSON::Field(key: "name")]
        getter name : String

        # The compute configuration of the compute fleet. This is only required if computeType is set to
        # ATTRIBUTE_BASED_COMPUTE or CUSTOM_INSTANCE_TYPE .

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ComputeConfiguration?

        # The service role associated with the compute fleet. For more information, see Allow a user to add a
        # permission policy for a fleet service role in the CodeBuild User Guide .

        @[JSON::Field(key: "fleetServiceRole")]
        getter fleet_service_role : String?

        # The Amazon Machine Image (AMI) of the compute fleet.

        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The compute fleet overflow behavior. For overflow behavior QUEUE , your overflow builds need to wait
        # on the existing fleet instance to become available. For overflow behavior ON_DEMAND , your overflow
        # builds run on CodeBuild on-demand. If you choose to set your overflow behavior to on-demand while
        # creating a VPC-connected fleet, make sure that you add the required VPC permissions to your project
        # service role. For more information, see Example policy statement to allow CodeBuild access to Amazon
        # Web Services services required to create a VPC network interface .

        @[JSON::Field(key: "overflowBehavior")]
        getter overflow_behavior : String?

        # The proxy configuration of the compute fleet.

        @[JSON::Field(key: "proxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # The scaling configuration of the compute fleet.

        @[JSON::Field(key: "scalingConfiguration")]
        getter scaling_configuration : Types::ScalingConfigurationInput?

        # A list of tag key and value pairs associated with this compute fleet. These tags are available for
        # use by Amazon Web Services services that support CodeBuild build project tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?


        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @base_capacity : Int32,
          @compute_type : String,
          @environment_type : String,
          @name : String,
          @compute_configuration : Types::ComputeConfiguration? = nil,
          @fleet_service_role : String? = nil,
          @image_id : String? = nil,
          @overflow_behavior : String? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @scaling_configuration : Types::ScalingConfigurationInput? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct CreateFleetOutput
        include JSON::Serializable

        # Information about the compute fleet

        @[JSON::Field(key: "fleet")]
        getter fleet : Types::Fleet?

        def initialize(
          @fleet : Types::Fleet? = nil
        )
        end
      end


      struct CreateProjectInput
        include JSON::Serializable

        # Information about the build output artifacts for the build project.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Types::ProjectArtifacts

        # Information about the build environment for the build project.

        @[JSON::Field(key: "environment")]
        getter environment : Types::ProjectEnvironment

        # The name of the build project.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the IAM role that enables CodeBuild to interact with dependent Amazon Web Services
        # services on behalf of the Amazon Web Services account.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String

        # Information about the build input source code for the build project.

        @[JSON::Field(key: "source")]
        getter source : Types::ProjectSource

        # The maximum number of additional automatic retries after a failed build. For example, if the
        # auto-retry limit is set to 2, CodeBuild will call the RetryBuild API to automatically retry your
        # build for up to 2 additional times.

        @[JSON::Field(key: "autoRetryLimit")]
        getter auto_retry_limit : Int32?

        # Set this to true to generate a publicly accessible URL for your project's build badge.

        @[JSON::Field(key: "badgeEnabled")]
        getter badge_enabled : Bool?

        # A ProjectBuildBatchConfig object that defines the batch build options for the project.

        @[JSON::Field(key: "buildBatchConfig")]
        getter build_batch_config : Types::ProjectBuildBatchConfig?

        # Stores recently used information so that it can be quickly accessed at a later time.

        @[JSON::Field(key: "cache")]
        getter cache : Types::ProjectCache?

        # The maximum number of concurrent builds that are allowed for this project. New builds are only
        # started if the current number of builds is less than or equal to this limit. If the current build
        # count meets this limit, new builds are throttled and are not run.

        @[JSON::Field(key: "concurrentBuildLimit")]
        getter concurrent_build_limit : Int32?

        # A description that makes the build project easy to identify.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Key Management Service customer master key (CMK) to be used for encrypting the build output
        # artifacts. You can use a cross-account KMS key to encrypt the build output artifacts if your service
        # role has permission to that key. You can specify either the Amazon Resource Name (ARN) of the CMK
        # or, if available, the CMK's alias (using the format alias/&lt;alias-name&gt; ).

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # An array of ProjectFileSystemLocation objects for a CodeBuild build project. A
        # ProjectFileSystemLocation object specifies the identifier , location , mountOptions , mountPoint ,
        # and type of a file system created using Amazon Elastic File System.

        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::ProjectFileSystemLocation)?

        # Information about logs for the build project. These can be logs in CloudWatch Logs, logs uploaded to
        # a specified S3 bucket, or both.

        @[JSON::Field(key: "logsConfig")]
        getter logs_config : Types::LogsConfig?

        # The number of minutes a build is allowed to be queued before it times out.

        @[JSON::Field(key: "queuedTimeoutInMinutes")]
        getter queued_timeout_in_minutes : Int32?

        # An array of ProjectArtifacts objects.

        @[JSON::Field(key: "secondaryArtifacts")]
        getter secondary_artifacts : Array(Types::ProjectArtifacts)?

        # An array of ProjectSourceVersion objects. If secondarySourceVersions is specified at the build
        # level, then they take precedence over these secondarySourceVersions (at the project level).

        @[JSON::Field(key: "secondarySourceVersions")]
        getter secondary_source_versions : Array(Types::ProjectSourceVersion)?

        # An array of ProjectSource objects.

        @[JSON::Field(key: "secondarySources")]
        getter secondary_sources : Array(Types::ProjectSource)?

        # A version of the build input to be built for this project. If not specified, the latest version is
        # used. If specified, it must be one of: For CodeCommit: the commit ID, branch, or Git tag to use. For
        # GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of
        # the source code you want to build. If a pull request ID is specified, it must use the format
        # pr/pull-request-ID (for example pr/25 ). If a branch name is specified, the branch's HEAD commit ID
        # is used. If not specified, the default branch's HEAD commit ID is used. For GitLab: the commit ID,
        # branch, or Git tag to use. For Bitbucket: the commit ID, branch name, or tag name that corresponds
        # to the version of the source code you want to build. If a branch name is specified, the branch's
        # HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used. For Amazon
        # S3: the version ID of the object that represents the build input ZIP file to use. If sourceVersion
        # is specified at the build level, then that version takes precedence over this sourceVersion (at the
        # project level). For more information, see Source Version Sample with CodeBuild in the CodeBuild User
        # Guide .

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # A list of tag key and value pairs associated with this build project. These tags are available for
        # use by Amazon Web Services services that support CodeBuild build project tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before it times out any build
        # that has not been marked as completed. The default is 60 minutes.

        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        # VpcConfig enables CodeBuild to access resources in an Amazon VPC. If you're using compute fleets
        # during project creation, do not provide vpcConfig.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @artifacts : Types::ProjectArtifacts,
          @environment : Types::ProjectEnvironment,
          @name : String,
          @service_role : String,
          @source : Types::ProjectSource,
          @auto_retry_limit : Int32? = nil,
          @badge_enabled : Bool? = nil,
          @build_batch_config : Types::ProjectBuildBatchConfig? = nil,
          @cache : Types::ProjectCache? = nil,
          @concurrent_build_limit : Int32? = nil,
          @description : String? = nil,
          @encryption_key : String? = nil,
          @file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
          @logs_config : Types::LogsConfig? = nil,
          @queued_timeout_in_minutes : Int32? = nil,
          @secondary_artifacts : Array(Types::ProjectArtifacts)? = nil,
          @secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
          @secondary_sources : Array(Types::ProjectSource)? = nil,
          @source_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_in_minutes : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct CreateProjectOutput
        include JSON::Serializable

        # Information about the build project that was created.

        @[JSON::Field(key: "project")]
        getter project : Types::Project?

        def initialize(
          @project : Types::Project? = nil
        )
        end
      end


      struct CreateReportGroupInput
        include JSON::Serializable

        # A ReportExportConfig object that contains information about where the report group test results are
        # exported.

        @[JSON::Field(key: "exportConfig")]
        getter export_config : Types::ReportExportConfig

        # The name of the report group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of report group.

        @[JSON::Field(key: "type")]
        getter type : String

        # A list of tag key and value pairs associated with this report group. These tags are available for
        # use by Amazon Web Services services that support CodeBuild report group tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @export_config : Types::ReportExportConfig,
          @name : String,
          @type : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateReportGroupOutput
        include JSON::Serializable

        # Information about the report group that was created.

        @[JSON::Field(key: "reportGroup")]
        getter report_group : Types::ReportGroup?

        def initialize(
          @report_group : Types::ReportGroup? = nil
        )
        end
      end


      struct CreateWebhookInput
        include JSON::Serializable

        # The name of the CodeBuild project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # A regular expression used to determine which repository branches are built when a webhook is
        # triggered. If the name of a branch matches the regular expression, then it is built. If branchFilter
        # is empty, then all branches are built. It is recommended that you use filterGroups instead of
        # branchFilter .

        @[JSON::Field(key: "branchFilter")]
        getter branch_filter : String?

        # Specifies the type of build this webhook will trigger. RUNNER_BUILDKITE_BUILD is only available for
        # NO_SOURCE source type projects configured for Buildkite runner builds. For more information about
        # CodeBuild-hosted Buildkite runner builds, see Tutorial: Configure a CodeBuild-hosted Buildkite
        # runner in the CodeBuild user guide .

        @[JSON::Field(key: "buildType")]
        getter build_type : String?

        # An array of arrays of WebhookFilter objects used to determine which webhooks are triggered. At least
        # one WebhookFilter in the array must specify EVENT as its type . For a build to be triggered, at
        # least one filter group in the filterGroups array must pass. For a filter group to pass, each of its
        # filters must pass.

        @[JSON::Field(key: "filterGroups")]
        getter filter_groups : Array(Array(Types::WebhookFilter))?

        # If manualCreation is true, CodeBuild doesn't create a webhook in GitHub and instead returns
        # payloadUrl and secret values for the webhook. The payloadUrl and secret values in the output can be
        # used to manually create a webhook within GitHub. manualCreation is only available for GitHub
        # webhooks.

        @[JSON::Field(key: "manualCreation")]
        getter manual_creation : Bool?

        # A PullRequestBuildPolicy object that defines comment-based approval requirements for triggering
        # builds on pull requests. This policy helps control when automated builds are executed based on
        # contributor permissions and approval workflows.

        @[JSON::Field(key: "pullRequestBuildPolicy")]
        getter pull_request_build_policy : Types::PullRequestBuildPolicy?

        # The scope configuration for global or organization webhooks. Global or organization webhooks are
        # only available for GitHub and Github Enterprise webhooks.

        @[JSON::Field(key: "scopeConfiguration")]
        getter scope_configuration : Types::ScopeConfiguration?

        def initialize(
          @project_name : String,
          @branch_filter : String? = nil,
          @build_type : String? = nil,
          @filter_groups : Array(Array(Types::WebhookFilter))? = nil,
          @manual_creation : Bool? = nil,
          @pull_request_build_policy : Types::PullRequestBuildPolicy? = nil,
          @scope_configuration : Types::ScopeConfiguration? = nil
        )
        end
      end


      struct CreateWebhookOutput
        include JSON::Serializable

        # Information about a webhook that connects repository events to a build project in CodeBuild.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::Webhook?

        def initialize(
          @webhook : Types::Webhook? = nil
        )
        end
      end

      # Contains information about the debug session for a build. For more information, see Viewing a
      # running build in Session Manager .

      struct DebugSession
        include JSON::Serializable

        # Specifies if session debugging is enabled for this build.

        @[JSON::Field(key: "sessionEnabled")]
        getter session_enabled : Bool?

        # Contains the identifier of the Session Manager session used for the build. To work with the paused
        # build, you open this session to examine, control, and resume the build.

        @[JSON::Field(key: "sessionTarget")]
        getter session_target : String?

        def initialize(
          @session_enabled : Bool? = nil,
          @session_target : String? = nil
        )
        end
      end


      struct DeleteBuildBatchInput
        include JSON::Serializable

        # The identifier of the batch build to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteBuildBatchOutput
        include JSON::Serializable

        # An array of strings that contain the identifiers of the builds that were deleted.

        @[JSON::Field(key: "buildsDeleted")]
        getter builds_deleted : Array(String)?

        # An array of BuildNotDeleted objects that specify the builds that could not be deleted.

        @[JSON::Field(key: "buildsNotDeleted")]
        getter builds_not_deleted : Array(Types::BuildNotDeleted)?

        # The status code.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @builds_deleted : Array(String)? = nil,
          @builds_not_deleted : Array(Types::BuildNotDeleted)? = nil,
          @status_code : String? = nil
        )
        end
      end


      struct DeleteFleetInput
        include JSON::Serializable

        # The ARN of the compute fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteFleetOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteProjectInput
        include JSON::Serializable

        # The name of the build project.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteProjectOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteReportGroupInput
        include JSON::Serializable

        # The ARN of the report group to delete.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # If true , deletes any reports that belong to a report group before deleting the report group. If
        # false , you must delete any reports in the report group. Use ListReportsForReportGroup to get the
        # reports in a report group. Use DeleteReport to delete the reports. If you call DeleteReportGroup for
        # a report group that contains one or more reports, an exception is thrown.

        @[JSON::Field(key: "deleteReports")]
        getter delete_reports : Bool?

        def initialize(
          @arn : String,
          @delete_reports : Bool? = nil
        )
        end
      end


      struct DeleteReportGroupOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteReportInput
        include JSON::Serializable

        # The ARN of the report to delete.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteReportOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteResourcePolicyInput
        include JSON::Serializable

        # The ARN of the resource that is associated with the resource policy.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DeleteResourcePolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSourceCredentialsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the token.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteSourceCredentialsOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the token.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct DeleteWebhookInput
        include JSON::Serializable

        # The name of the CodeBuild project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        def initialize(
          @project_name : String
        )
        end
      end


      struct DeleteWebhookOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeCodeCoveragesInput
        include JSON::Serializable

        # The ARN of the report for which test cases are returned.

        @[JSON::Field(key: "reportArn")]
        getter report_arn : String

        # The maximum line coverage percentage to report.

        @[JSON::Field(key: "maxLineCoveragePercentage")]
        getter max_line_coverage_percentage : Float64?

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The minimum line coverage percentage to report.

        @[JSON::Field(key: "minLineCoveragePercentage")]
        getter min_line_coverage_percentage : Float64?

        # The nextToken value returned from a previous call to DescribeCodeCoverages . This specifies the next
        # item to return. To return the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies how the results are sorted. Possible values are: FILE_PATH The results are sorted by file
        # path. LINE_COVERAGE_PERCENTAGE The results are sorted by the percentage of lines that are covered.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies if the results are sorted in ascending or descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @report_arn : String,
          @max_line_coverage_percentage : Float64? = nil,
          @max_results : Int32? = nil,
          @min_line_coverage_percentage : Float64? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct DescribeCodeCoveragesOutput
        include JSON::Serializable

        # An array of CodeCoverage objects that contain the results.

        @[JSON::Field(key: "codeCoverages")]
        getter code_coverages : Array(Types::CodeCoverage)?

        # If there are more items to return, this contains a token that is passed to a subsequent call to
        # DescribeCodeCoverages to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @code_coverages : Array(Types::CodeCoverage)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeTestCasesInput
        include JSON::Serializable

        # The ARN of the report for which test cases are returned.

        @[JSON::Field(key: "reportArn")]
        getter report_arn : String

        # A TestCaseFilter object used to filter the returned reports.

        @[JSON::Field(key: "filter")]
        getter filter : Types::TestCaseFilter?

        # The maximum number of paginated test cases returned per response. Use nextToken to iterate pages in
        # the list of returned TestCase objects. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @report_arn : String,
          @filter : Types::TestCaseFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeTestCasesOutput
        include JSON::Serializable

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The returned list of test cases.

        @[JSON::Field(key: "testCases")]
        getter test_cases : Array(Types::TestCase)?

        def initialize(
          @next_token : String? = nil,
          @test_cases : Array(Types::TestCase)? = nil
        )
        end
      end

      # Contains docker server information.

      struct DockerServer
        include JSON::Serializable

        # Information about the compute resources the docker server uses. Available values include:
        # BUILD_GENERAL1_SMALL : Use up to 4 GiB memory and 2 vCPUs for your docker server.
        # BUILD_GENERAL1_MEDIUM : Use up to 8 GiB memory and 4 vCPUs for your docker server.
        # BUILD_GENERAL1_LARGE : Use up to 16 GiB memory and 8 vCPUs for your docker server.
        # BUILD_GENERAL1_XLARGE : Use up to 64 GiB memory and 32 vCPUs for your docker server.
        # BUILD_GENERAL1_2XLARGE : Use up to 128 GiB memory and 64 vCPUs for your docker server.

        @[JSON::Field(key: "computeType")]
        getter compute_type : String

        # A list of one or more security groups IDs. Security groups configured for Docker servers should
        # allow ingress network traffic from the VPC configured in the project. They should allow ingress on
        # port 9876.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # A DockerServerStatus object to use for this docker server.

        @[JSON::Field(key: "status")]
        getter status : Types::DockerServerStatus?

        def initialize(
          @compute_type : String,
          @security_group_ids : Array(String)? = nil,
          @status : Types::DockerServerStatus? = nil
        )
        end
      end

      # Contains information about the status of the docker server.

      struct DockerServerStatus
        include JSON::Serializable

        # A message associated with the status of a docker server.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The status of the docker server.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a Docker image that is managed by CodeBuild.

      struct EnvironmentImage
        include JSON::Serializable

        # The description of the Docker image.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the Docker image.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of environment image versions.

        @[JSON::Field(key: "versions")]
        getter versions : Array(String)?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @versions : Array(String)? = nil
        )
        end
      end

      # A set of Docker images that are related by programming language and are managed by CodeBuild.

      struct EnvironmentLanguage
        include JSON::Serializable

        # The list of Docker images that are related by the specified programming language.

        @[JSON::Field(key: "images")]
        getter images : Array(Types::EnvironmentImage)?

        # The programming language for the Docker images.

        @[JSON::Field(key: "language")]
        getter language : String?

        def initialize(
          @images : Array(Types::EnvironmentImage)? = nil,
          @language : String? = nil
        )
        end
      end

      # A set of Docker images that are related by platform and are managed by CodeBuild.

      struct EnvironmentPlatform
        include JSON::Serializable

        # The list of programming languages that are available for the specified platform.

        @[JSON::Field(key: "languages")]
        getter languages : Array(Types::EnvironmentLanguage)?

        # The platform's name.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        def initialize(
          @languages : Array(Types::EnvironmentLanguage)? = nil,
          @platform : String? = nil
        )
        end
      end

      # Information about an environment variable for a build project or a build.

      struct EnvironmentVariable
        include JSON::Serializable

        # The name or key of the environment variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the environment variable. We strongly discourage the use of PLAINTEXT environment
        # variables to store sensitive values, especially Amazon Web Services secret key IDs. PLAINTEXT
        # environment variables can be displayed in plain text using the CodeBuild console and the CLI. For
        # sensitive values, we recommend you use an environment variable of type PARAMETER_STORE or
        # SECRETS_MANAGER .

        @[JSON::Field(key: "value")]
        getter value : String

        # The type of environment variable. Valid values include: PARAMETER_STORE : An environment variable
        # stored in Systems Manager Parameter Store. For environment variables of this type, specify the name
        # of the parameter as the value of the EnvironmentVariable. The parameter value will be substituted
        # for the name at runtime. You can also define Parameter Store environment variables in the buildspec.
        # To learn how to do so, see env/parameter-store in the CodeBuild User Guide . PLAINTEXT : An
        # environment variable in plain text format. This is the default value. SECRETS_MANAGER : An
        # environment variable stored in Secrets Manager. For environment variables of this type, specify the
        # name of the secret as the value of the EnvironmentVariable. The secret value will be substituted for
        # the name at runtime. You can also define Secrets Manager environment variables in the buildspec. To
        # learn how to do so, see env/secrets-manager in the CodeBuild User Guide .

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String,
          @value : String,
          @type : String? = nil
        )
        end
      end

      # Contains information about an exported environment variable. Exported environment variables are used
      # in conjunction with CodePipeline to export environment variables from the current build stage to
      # subsequent stages in the pipeline. For more information, see Working with variables in the
      # CodePipeline User Guide . During a build, the value of a variable is available starting with the
      # install phase. It can be updated between the start of the install phase and the end of the
      # post_build phase. After the post_build phase ends, the value of exported variables cannot change.

      struct ExportedEnvironmentVariable
        include JSON::Serializable

        # The name of the exported environment variable.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The value assigned to the exported environment variable.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # A set of dedicated instances for your build environment.

      struct Fleet
        include JSON::Serializable

        # The ARN of the compute fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The initial number of machines allocated to the compute ﬂeet, which deﬁnes the number of builds that
        # can run in parallel.

        @[JSON::Field(key: "baseCapacity")]
        getter base_capacity : Int32?

        # The compute configuration of the compute fleet. This is only required if computeType is set to
        # ATTRIBUTE_BASED_COMPUTE or CUSTOM_INSTANCE_TYPE .

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ComputeConfiguration?

        # Information about the compute resources the compute fleet uses. Available values include:
        # ATTRIBUTE_BASED_COMPUTE : Specify the amount of vCPUs, memory, disk space, and the type of machine.
        # If you use ATTRIBUTE_BASED_COMPUTE , you must define your attributes by using computeConfiguration .
        # CodeBuild will select the cheapest instance that satisfies your specified attributes. For more
        # information, see Reserved capacity environment types in the CodeBuild User Guide .
        # CUSTOM_INSTANCE_TYPE : Specify the instance type for your compute fleet. For a list of supported
        # instance types, see Supported instance families in the CodeBuild User Guide . BUILD_GENERAL1_SMALL :
        # Use up to 4 GiB memory and 2 vCPUs for builds. BUILD_GENERAL1_MEDIUM : Use up to 8 GiB memory and 4
        # vCPUs for builds. BUILD_GENERAL1_LARGE : Use up to 16 GiB memory and 8 vCPUs for builds, depending
        # on your environment type. BUILD_GENERAL1_XLARGE : Use up to 72 GiB memory and 36 vCPUs for builds,
        # depending on your environment type. BUILD_GENERAL1_2XLARGE : Use up to 144 GiB memory, 72 vCPUs, and
        # 824 GB of SSD storage for builds. This compute type supports Docker images up to 100 GB
        # uncompressed. BUILD_LAMBDA_1GB : Use up to 1 GiB memory for builds. Only available for environment
        # type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_2GB : Use up to 2 GiB memory for
        # builds. Only available for environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER .
        # BUILD_LAMBDA_4GB : Use up to 4 GiB memory for builds. Only available for environment type
        # LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_8GB : Use up to 8 GiB memory for
        # builds. Only available for environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER .
        # BUILD_LAMBDA_10GB : Use up to 10 GiB memory for builds. Only available for environment type
        # LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . If you use BUILD_GENERAL1_SMALL : For environment
        # type LINUX_CONTAINER , you can use up to 4 GiB memory and 2 vCPUs for builds. For environment type
        # LINUX_GPU_CONTAINER , you can use up to 16 GiB memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU
        # for builds. For environment type ARM_CONTAINER , you can use up to 4 GiB memory and 2 vCPUs on
        # ARM-based processors for builds. If you use BUILD_GENERAL1_LARGE : For environment type
        # LINUX_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs for builds. For environment type
        # LINUX_GPU_CONTAINER , you can use up to 255 GiB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for
        # builds. For environment type ARM_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs on
        # ARM-based processors for builds. For more information, see On-demand environment types in the
        # CodeBuild User Guide.

        @[JSON::Field(key: "computeType")]
        getter compute_type : String?

        # The time at which the compute fleet was created.

        @[JSON::Field(key: "created", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The environment type of the compute fleet. The environment type ARM_CONTAINER is available only in
        # regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia Pacific
        # (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and
        # South America (São Paulo). The environment type ARM_EC2 is available only in regions US East (N.
        # Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo),
        # Asia Pacific (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific
        # (Mumbai). The environment type LINUX_CONTAINER is available only in regions US East (N. Virginia),
        # US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific
        # (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific (Mumbai). The
        # environment type LINUX_EC2 is available only in regions US East (N. Virginia), US East (Ohio), US
        # West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Singapore), Asia
        # Pacific (Sydney), South America (São Paulo), and Asia Pacific (Mumbai). The environment type
        # LINUX_GPU_CONTAINER is available only in regions US East (N. Virginia), US East (Ohio), US West
        # (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), and Asia Pacific (Sydney). The
        # environment type MAC_ARM is available for Medium fleets only in regions US East (N. Virginia), US
        # East (Ohio), US West (Oregon), Asia Pacific (Sydney), and EU (Frankfurt) The environment type
        # MAC_ARM is available for Large fleets only in regions US East (N. Virginia), US East (Ohio), US West
        # (Oregon), and Asia Pacific (Sydney). The environment type WINDOWS_EC2 is available only in regions
        # US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific
        # (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia
        # Pacific (Mumbai). The environment type WINDOWS_SERVER_2019_CONTAINER is available only in regions US
        # East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), Asia Pacific (Tokyo),
        # Asia Pacific (Mumbai) and EU (Ireland). The environment type WINDOWS_SERVER_2022_CONTAINER is
        # available only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU
        # (Frankfurt), Asia Pacific (Sydney), Asia Pacific (Singapore), Asia Pacific (Tokyo), South America
        # (São Paulo) and Asia Pacific (Mumbai). For more information, see Build environment compute types in
        # the CodeBuild user guide .

        @[JSON::Field(key: "environmentType")]
        getter environment_type : String?

        # The service role associated with the compute fleet. For more information, see Allow a user to add a
        # permission policy for a fleet service role in the CodeBuild User Guide .

        @[JSON::Field(key: "fleetServiceRole")]
        getter fleet_service_role : String?

        # The ID of the compute fleet.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Machine Image (AMI) of the compute fleet.

        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The time at which the compute fleet was last modified.

        @[JSON::Field(key: "lastModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified : Time?

        # The name of the compute fleet.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The compute fleet overflow behavior. For overflow behavior QUEUE , your overflow builds need to wait
        # on the existing fleet instance to become available. For overflow behavior ON_DEMAND , your overflow
        # builds run on CodeBuild on-demand. If you choose to set your overflow behavior to on-demand while
        # creating a VPC-connected fleet, make sure that you add the required VPC permissions to your project
        # service role. For more information, see Example policy statement to allow CodeBuild access to Amazon
        # Web Services services required to create a VPC network interface .

        @[JSON::Field(key: "overflowBehavior")]
        getter overflow_behavior : String?

        # The proxy configuration of the compute fleet.

        @[JSON::Field(key: "proxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # The scaling configuration of the compute fleet.

        @[JSON::Field(key: "scalingConfiguration")]
        getter scaling_configuration : Types::ScalingConfigurationOutput?

        # The status of the compute fleet.

        @[JSON::Field(key: "status")]
        getter status : Types::FleetStatus?

        # A list of tag key and value pairs associated with this compute fleet. These tags are available for
        # use by Amazon Web Services services that support CodeBuild build project tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?


        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @arn : String? = nil,
          @base_capacity : Int32? = nil,
          @compute_configuration : Types::ComputeConfiguration? = nil,
          @compute_type : String? = nil,
          @created : Time? = nil,
          @environment_type : String? = nil,
          @fleet_service_role : String? = nil,
          @id : String? = nil,
          @image_id : String? = nil,
          @last_modified : Time? = nil,
          @name : String? = nil,
          @overflow_behavior : String? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @scaling_configuration : Types::ScalingConfigurationOutput? = nil,
          @status : Types::FleetStatus? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Information about the proxy rule for your reserved capacity instances.

      struct FleetProxyRule
        include JSON::Serializable

        # The behavior of the proxy rule.

        @[JSON::Field(key: "effect")]
        getter effect : String

        # The destination of the proxy rule.

        @[JSON::Field(key: "entities")]
        getter entities : Array(String)

        # The type of proxy rule.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @effect : String,
          @entities : Array(String),
          @type : String
        )
        end
      end

      # The status of the compute fleet.

      struct FleetStatus
        include JSON::Serializable

        # Additional information about a compute fleet. Valid values include: CREATE_FAILED : The compute
        # fleet has failed to create. UPDATE_FAILED : The compute fleet has failed to update.

        @[JSON::Field(key: "context")]
        getter context : String?

        # A message associated with the status of a compute fleet.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The status code of the compute fleet. Valid values include: CREATING : The compute fleet is being
        # created. UPDATING : The compute fleet is being updated. ROTATING : The compute fleet is being
        # rotated. PENDING_DELETION : The compute fleet is pending deletion. DELETING : The compute fleet is
        # being deleted. CREATE_FAILED : The compute fleet has failed to create. UPDATE_ROLLBACK_FAILED : The
        # compute fleet has failed to update and could not rollback to previous state. ACTIVE : The compute
        # fleet has succeeded and is active.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @context : String? = nil,
          @message : String? = nil,
          @status_code : String? = nil
        )
        end
      end


      struct GetReportGroupTrendInput
        include JSON::Serializable

        # The ARN of the report group that contains the reports to analyze.

        @[JSON::Field(key: "reportGroupArn")]
        getter report_group_arn : String

        # The test report value to accumulate. This must be one of the following values: Test reports:
        # DURATION Accumulate the test run times for the specified reports. PASS_RATE Accumulate the
        # percentage of tests that passed for the specified test reports. TOTAL Accumulate the total number of
        # tests for the specified test reports. Code coverage reports: BRANCH_COVERAGE Accumulate the branch
        # coverage percentages for the specified test reports. BRANCHES_COVERED Accumulate the branches
        # covered values for the specified test reports. BRANCHES_MISSED Accumulate the branches missed values
        # for the specified test reports. LINE_COVERAGE Accumulate the line coverage percentages for the
        # specified test reports. LINES_COVERED Accumulate the lines covered values for the specified test
        # reports. LINES_MISSED Accumulate the lines not covered values for the specified test reports.

        @[JSON::Field(key: "trendField")]
        getter trend_field : String

        # The number of reports to analyze. This operation always retrieves the most recent reports. If this
        # parameter is omitted, the most recent 100 reports are analyzed.

        @[JSON::Field(key: "numOfReports")]
        getter num_of_reports : Int32?

        def initialize(
          @report_group_arn : String,
          @trend_field : String,
          @num_of_reports : Int32? = nil
        )
        end
      end


      struct GetReportGroupTrendOutput
        include JSON::Serializable

        # An array that contains the raw data for each report.

        @[JSON::Field(key: "rawData")]
        getter raw_data : Array(Types::ReportWithRawData)?

        # Contains the accumulated trend data.

        @[JSON::Field(key: "stats")]
        getter stats : Types::ReportGroupTrendStats?

        def initialize(
          @raw_data : Array(Types::ReportWithRawData)? = nil,
          @stats : Types::ReportGroupTrendStats? = nil
        )
        end
      end


      struct GetResourcePolicyInput
        include JSON::Serializable

        # The ARN of the resource that is associated with the resource policy.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyOutput
        include JSON::Serializable

        # The resource policy for the resource identified by the input ARN parameter.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # Information about the Git submodules configuration for an CodeBuild build project.

      struct GitSubmodulesConfig
        include JSON::Serializable

        # Set to true to fetch Git submodules for your CodeBuild build project.

        @[JSON::Field(key: "fetchSubmodules")]
        getter fetch_submodules : Bool

        def initialize(
          @fetch_submodules : Bool
        )
        end
      end


      struct ImportSourceCredentialsInput
        include JSON::Serializable

        # The type of authentication used to connect to a GitHub, GitHub Enterprise, GitLab, GitLab Self
        # Managed, or Bitbucket repository. An OAUTH connection is not supported by the API and must be
        # created using the CodeBuild console.

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The source provider used for this project.

        @[JSON::Field(key: "serverType")]
        getter server_type : String

        # For GitHub or GitHub Enterprise, this is the personal access token. For Bitbucket, this is either
        # the access token or the app password. For the authType CODECONNECTIONS, this is the connectionArn .
        # For the authType SECRETS_MANAGER, this is the secretArn .

        @[JSON::Field(key: "token")]
        getter token : String

        # Set to false to prevent overwriting the repository source credentials. Set to true to overwrite the
        # repository source credentials. The default value is true .

        @[JSON::Field(key: "shouldOverwrite")]
        getter should_overwrite : Bool?

        # The Bitbucket username when the authType is BASIC_AUTH. This parameter is not valid for other types
        # of source providers or connections.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @auth_type : String,
          @server_type : String,
          @token : String,
          @should_overwrite : Bool? = nil,
          @username : String? = nil
        )
        end
      end


      struct ImportSourceCredentialsOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the token.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The input value that was provided is not valid.

      struct InvalidInputException
        include JSON::Serializable

        def initialize
        end
      end


      struct InvalidateProjectCacheInput
        include JSON::Serializable

        # The name of the CodeBuild build project that the cache is reset for.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        def initialize(
          @project_name : String
        )
        end
      end


      struct InvalidateProjectCacheOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct ListBuildBatchesForProjectInput
        include JSON::Serializable

        # A BuildBatchFilter object that specifies the filters for the search.

        @[JSON::Field(key: "filter")]
        getter filter : Types::BuildBatchFilter?

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous call to ListBuildBatchesForProject . This specifies the
        # next item to return. To return the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # Specifies the sort order of the returned items. Valid values include: ASCENDING : List the batch
        # build identifiers in ascending order by identifier. DESCENDING : List the batch build identifiers in
        # descending order by identifier.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @filter : Types::BuildBatchFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @project_name : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListBuildBatchesForProjectOutput
        include JSON::Serializable

        # An array of strings that contains the batch build identifiers.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # If there are more items to return, this contains a token that is passed to a subsequent call to
        # ListBuildBatchesForProject to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBuildBatchesInput
        include JSON::Serializable

        # A BuildBatchFilter object that specifies the filters for the search.

        @[JSON::Field(key: "filter")]
        getter filter : Types::BuildBatchFilter?

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous call to ListBuildBatches . This specifies the next item
        # to return. To return the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the sort order of the returned items. Valid values include: ASCENDING : List the batch
        # build identifiers in ascending order by identifier. DESCENDING : List the batch build identifiers in
        # descending order by identifier.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @filter : Types::BuildBatchFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListBuildBatchesOutput
        include JSON::Serializable

        # An array of strings that contains the batch build identifiers.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # If there are more items to return, this contains a token that is passed to a subsequent call to
        # ListBuildBatches to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBuildsForProjectInput
        include JSON::Serializable

        # The name of the CodeBuild project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # During a previous call, if there are more than 100 items in the list, only the first 100 items are
        # returned, along with a unique string called a nextToken . To get the next batch of items in the
        # list, call this operation again, adding the next token to the call. To get all of the items in the
        # list, keep calling this operation with each subsequent next token that is returned, until no more
        # next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order to sort the results in. The results are sorted by build number, not the build identifier.
        # If this is not specified, the results are sorted in descending order. Valid values include:
        # ASCENDING : List the build identifiers in ascending order, by build number. DESCENDING : List the
        # build identifiers in descending order, by build number. If the project has more than 100 builds,
        # setting the sort order will result in an error.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @project_name : String,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListBuildsForProjectOutput
        include JSON::Serializable

        # A list of build identifiers for the specified build project, with each build ID representing a
        # single build.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # If there are more than 100 items in the list, only the first 100 items are returned, along with a
        # unique string called a nextToken . To get the next batch of items in the list, call this operation
        # again, adding the next token to the call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBuildsInput
        include JSON::Serializable

        # During a previous call, if there are more than 100 items in the list, only the first 100 items are
        # returned, along with a unique string called a nextToken . To get the next batch of items in the
        # list, call this operation again, adding the next token to the call. To get all of the items in the
        # list, keep calling this operation with each subsequent next token that is returned, until no more
        # next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order to list build IDs. Valid values include: ASCENDING : List the build IDs in ascending order
        # by build ID. DESCENDING : List the build IDs in descending order by build ID.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListBuildsOutput
        include JSON::Serializable

        # A list of build IDs, with each build ID representing a single build.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # If there are more than 100 items in the list, only the first 100 items are returned, along with a
        # unique string called a nextToken . To get the next batch of items in the list, call this operation
        # again, adding the next token to the call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCommandExecutionsForSandboxInput
        include JSON::Serializable

        # A sandboxId or sandboxArn .

        @[JSON::Field(key: "sandboxId")]
        getter sandbox_id : String

        # The maximum number of sandbox records to be retrieved.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token, if any, to get paginated results. You will get this value from previous execution of
        # list sandboxes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order in which sandbox records should be retrieved.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @sandbox_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListCommandExecutionsForSandboxOutput
        include JSON::Serializable

        # Information about the requested command executions.

        @[JSON::Field(key: "commandExecutions")]
        getter command_executions : Array(Types::CommandExecution)?

        # Information about the next token to get paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @command_executions : Array(Types::CommandExecution)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCuratedEnvironmentImagesInput
        include JSON::Serializable

        def initialize
        end
      end


      struct ListCuratedEnvironmentImagesOutput
        include JSON::Serializable

        # Information about supported platforms for Docker images that are managed by CodeBuild.

        @[JSON::Field(key: "platforms")]
        getter platforms : Array(Types::EnvironmentPlatform)?

        def initialize(
          @platforms : Array(Types::EnvironmentPlatform)? = nil
        )
        end
      end


      struct ListFleetsInput
        include JSON::Serializable

        # The maximum number of paginated compute fleets returned per response. Use nextToken to iterate pages
        # in the list of returned compute fleets.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, if there are more than 100 items in the list, only the first 100 items are
        # returned, along with a unique string called a nextToken . To get the next batch of items in the
        # list, call this operation again, adding the next token to the call. To get all of the items in the
        # list, keep calling this operation with each subsequent next token that is returned, until no more
        # next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The criterion to be used to list compute fleet names. Valid values include: CREATED_TIME : List
        # based on when each compute fleet was created. LAST_MODIFIED_TIME : List based on when information
        # about each compute fleet was last changed. NAME : List based on each compute fleet's name. Use
        # sortOrder to specify in what order to list the compute fleet names based on the preceding criteria.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order in which to list compute fleets. Valid values include: ASCENDING : List in ascending
        # order. DESCENDING : List in descending order. Use sortBy to specify the criterion to be used to list
        # compute fleet names.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListFleetsOutput
        include JSON::Serializable

        # The list of compute fleet names.

        @[JSON::Field(key: "fleets")]
        getter fleets : Array(String)?

        # If there are more than 100 items in the list, only the first 100 items are returned, along with a
        # unique string called a nextToken . To get the next batch of items in the list, call this operation
        # again, adding the next token to the call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fleets : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProjectsInput
        include JSON::Serializable

        # During a previous call, if there are more than 100 items in the list, only the first 100 items are
        # returned, along with a unique string called a nextToken . To get the next batch of items in the
        # list, call this operation again, adding the next token to the call. To get all of the items in the
        # list, keep calling this operation with each subsequent next token that is returned, until no more
        # next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The criterion to be used to list build project names. Valid values include: CREATED_TIME : List
        # based on when each build project was created. LAST_MODIFIED_TIME : List based on when information
        # about each build project was last changed. NAME : List based on each build project's name. Use
        # sortOrder to specify in what order to list the build project names based on the preceding criteria.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order in which to list build projects. Valid values include: ASCENDING : List in ascending
        # order. DESCENDING : List in descending order. Use sortBy to specify the criterion to be used to list
        # build project names.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListProjectsOutput
        include JSON::Serializable

        # If there are more than 100 items in the list, only the first 100 items are returned, along with a
        # unique string called a nextToken . To get the next batch of items in the list, call this operation
        # again, adding the next token to the call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of build project names, with each build project name representing a single build project.

        @[JSON::Field(key: "projects")]
        getter projects : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @projects : Array(String)? = nil
        )
        end
      end


      struct ListReportGroupsInput
        include JSON::Serializable

        # The maximum number of paginated report groups returned per response. Use nextToken to iterate pages
        # in the list of returned ReportGroup objects. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The criterion to be used to list build report groups. Valid values include: CREATED_TIME : List
        # based on when each report group was created. LAST_MODIFIED_TIME : List based on when each report
        # group was last changed. NAME : List based on each report group's name.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Used to specify the order to sort the list of returned report groups. Valid values are ASCENDING and
        # DESCENDING .

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListReportGroupsOutput
        include JSON::Serializable

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of ARNs for the report groups in the current Amazon Web Services account.

        @[JSON::Field(key: "reportGroups")]
        getter report_groups : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @report_groups : Array(String)? = nil
        )
        end
      end


      struct ListReportsForReportGroupInput
        include JSON::Serializable

        # The ARN of the report group for which you want to return report ARNs.

        @[JSON::Field(key: "reportGroupArn")]
        getter report_group_arn : String

        # A ReportFilter object used to filter the returned reports.

        @[JSON::Field(key: "filter")]
        getter filter : Types::ReportFilter?

        # The maximum number of paginated reports in this report group returned per response. Use nextToken to
        # iterate pages in the list of returned Report objects. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Use to specify whether the results are returned in ascending or descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @report_group_arn : String,
          @filter : Types::ReportFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListReportsForReportGroupOutput
        include JSON::Serializable

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of report ARNs.

        @[JSON::Field(key: "reports")]
        getter reports : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @reports : Array(String)? = nil
        )
        end
      end


      struct ListReportsInput
        include JSON::Serializable

        # A ReportFilter object used to filter the returned reports.

        @[JSON::Field(key: "filter")]
        getter filter : Types::ReportFilter?

        # The maximum number of paginated reports returned per response. Use nextToken to iterate pages in the
        # list of returned Report objects. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the sort order for the list of returned reports. Valid values are: ASCENDING : return
        # reports in chronological order based on their creation date. DESCENDING : return reports in the
        # reverse chronological order based on their creation date.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @filter : Types::ReportFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListReportsOutput
        include JSON::Serializable

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of returned ARNs for the reports in the current Amazon Web Services account.

        @[JSON::Field(key: "reports")]
        getter reports : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @reports : Array(String)? = nil
        )
        end
      end


      struct ListSandboxesForProjectInput
        include JSON::Serializable

        # The CodeBuild project name.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The maximum number of sandbox records to be retrieved.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token, if any, to get paginated results. You will get this value from previous execution of
        # list sandboxes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order in which sandbox records should be retrieved.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @project_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListSandboxesForProjectOutput
        include JSON::Serializable

        # Information about the requested sandbox IDs.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # Information about the next token to get paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSandboxesInput
        include JSON::Serializable

        # The maximum number of sandbox records to be retrieved.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token, if any, to get paginated results. You will get this value from previous execution of
        # list sandboxes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order in which sandbox records should be retrieved.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListSandboxesOutput
        include JSON::Serializable

        # Information about the requested sandbox IDs.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # Information about the next token to get paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSharedProjectsInput
        include JSON::Serializable

        # The maximum number of paginated shared build projects returned per response. Use nextToken to
        # iterate pages in the list of returned Project objects. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The criterion to be used to list build projects shared with the current Amazon Web Services account
        # or user. Valid values include: ARN : List based on the ARN. MODIFIED_TIME : List based on when
        # information about the shared project was last changed.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order in which to list shared build projects. Valid values include: ASCENDING : List in
        # ascending order. DESCENDING : List in descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListSharedProjectsOutput
        include JSON::Serializable

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of ARNs for the build projects shared with the current Amazon Web Services account or user.

        @[JSON::Field(key: "projects")]
        getter projects : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @projects : Array(String)? = nil
        )
        end
      end


      struct ListSharedReportGroupsInput
        include JSON::Serializable

        # The maximum number of paginated shared report groups per response. Use nextToken to iterate pages in
        # the list of returned ReportGroup objects. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The criterion to be used to list report groups shared with the current Amazon Web Services account
        # or user. Valid values include: ARN : List based on the ARN. MODIFIED_TIME : List based on when
        # information about the shared report group was last changed.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order in which to list shared report groups. Valid values include: ASCENDING : List in ascending
        # order. DESCENDING : List in descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListSharedReportGroupsOutput
        include JSON::Serializable

        # During a previous call, the maximum number of items that can be returned is the value specified in
        # maxResults . If there more items in the list, then a unique string called a nextToken is returned.
        # To get the next batch of items in the list, call this operation again, adding the next token to the
        # call. To get all of the items in the list, keep calling this operation with each subsequent next
        # token that is returned, until no more next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of ARNs for the report groups shared with the current Amazon Web Services account or user.

        @[JSON::Field(key: "reportGroups")]
        getter report_groups : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @report_groups : Array(String)? = nil
        )
        end
      end


      struct ListSourceCredentialsInput
        include JSON::Serializable

        def initialize
        end
      end


      struct ListSourceCredentialsOutput
        include JSON::Serializable

        # A list of SourceCredentialsInfo objects. Each SourceCredentialsInfo object includes the
        # authentication type, token ARN, and type of source provider for one set of credentials.

        @[JSON::Field(key: "sourceCredentialsInfos")]
        getter source_credentials_infos : Array(Types::SourceCredentialsInfo)?

        def initialize(
          @source_credentials_infos : Array(Types::SourceCredentialsInfo)? = nil
        )
        end
      end

      # Information about logs for a build project. These can be logs in CloudWatch Logs, built in a
      # specified S3 bucket, or both.

      struct LogsConfig
        include JSON::Serializable

        # Information about CloudWatch Logs for a build project. CloudWatch Logs are enabled by default.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsConfig?

        # Information about logs built to an S3 bucket for a build project. S3 logs are not enabled by
        # default.

        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::S3LogsConfig?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsConfig? = nil,
          @s3_logs : Types::S3LogsConfig? = nil
        )
        end
      end

      # Information about build logs in CloudWatch Logs.

      struct LogsLocation
        include JSON::Serializable

        # Information about CloudWatch Logs for a build project.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsConfig?

        # The ARN of the CloudWatch Logs stream for a build execution. Its format is
        # arn:${Partition}:logs:${Region}:${Account}:log-group:${LogGroupName}:log-stream:${LogStreamName} .
        # The CloudWatch Logs stream is created during the PROVISIONING phase of a build and the ARN will not
        # be valid until it is created. For more information, see Resources Defined by CloudWatch Logs .

        @[JSON::Field(key: "cloudWatchLogsArn")]
        getter cloud_watch_logs_arn : String?

        # The URL to an individual build log in CloudWatch Logs. The log stream is created during the
        # PROVISIONING phase of a build and the deeplink will not be valid until it is created.

        @[JSON::Field(key: "deepLink")]
        getter deep_link : String?

        # The name of the CloudWatch Logs group for the build logs.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # The URL to a build log in an S3 bucket.

        @[JSON::Field(key: "s3DeepLink")]
        getter s3_deep_link : String?

        # Information about S3 logs for a build project.

        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::S3LogsConfig?

        # The ARN of S3 logs for a build project. Its format is
        # arn:${Partition}:s3:::${BucketName}/${ObjectName} . For more information, see Resources Defined by
        # Amazon S3 .

        @[JSON::Field(key: "s3LogsArn")]
        getter s3_logs_arn : String?

        # The name of the CloudWatch Logs stream for the build logs.

        @[JSON::Field(key: "streamName")]
        getter stream_name : String?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsConfig? = nil,
          @cloud_watch_logs_arn : String? = nil,
          @deep_link : String? = nil,
          @group_name : String? = nil,
          @s3_deep_link : String? = nil,
          @s3_logs : Types::S3LogsConfig? = nil,
          @s3_logs_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Describes a network interface.

      struct NetworkInterface
        include JSON::Serializable

        # The ID of the network interface.

        @[JSON::Field(key: "networkInterfaceId")]
        getter network_interface_id : String?

        # The ID of the subnet.

        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        def initialize(
          @network_interface_id : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # There was a problem with the underlying OAuth provider.

      struct OAuthProviderException
        include JSON::Serializable

        def initialize
        end
      end

      # Additional information about a build phase that has an error. You can use this information for
      # troubleshooting.

      struct PhaseContext
        include JSON::Serializable

        # An explanation of the build phase's context. This might include a command ID and an exit code.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The status code for the context of the build phase.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @message : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # Information about a build project.

      struct Project
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the build project.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about the build output artifacts for the build project.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Types::ProjectArtifacts?

        # The maximum number of additional automatic retries after a failed build. For example, if the
        # auto-retry limit is set to 2, CodeBuild will call the RetryBuild API to automatically retry your
        # build for up to 2 additional times.

        @[JSON::Field(key: "autoRetryLimit")]
        getter auto_retry_limit : Int32?

        # Information about the build badge for the build project.

        @[JSON::Field(key: "badge")]
        getter badge : Types::ProjectBadge?

        # A ProjectBuildBatchConfig object that defines the batch build options for the project.

        @[JSON::Field(key: "buildBatchConfig")]
        getter build_batch_config : Types::ProjectBuildBatchConfig?

        # Information about the cache for the build project.

        @[JSON::Field(key: "cache")]
        getter cache : Types::ProjectCache?

        # The maximum number of concurrent builds that are allowed for this project. New builds are only
        # started if the current number of builds is less than or equal to this limit. If the current build
        # count meets this limit, new builds are throttled and are not run.

        @[JSON::Field(key: "concurrentBuildLimit")]
        getter concurrent_build_limit : Int32?

        # When the build project was created, expressed in Unix time format.

        @[JSON::Field(key: "created", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # A description that makes the build project easy to identify.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Key Management Service customer master key (CMK) to be used for encrypting the build output
        # artifacts. You can use a cross-account KMS key to encrypt the build output artifacts if your service
        # role has permission to that key. You can specify either the Amazon Resource Name (ARN) of the CMK
        # or, if available, the CMK's alias (using the format alias/&lt;alias-name&gt; ). If you don't specify
        # a value, CodeBuild uses the managed CMK for Amazon Simple Storage Service (Amazon S3).

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # Information about the build environment for this build project.

        @[JSON::Field(key: "environment")]
        getter environment : Types::ProjectEnvironment?

        # An array of ProjectFileSystemLocation objects for a CodeBuild build project. A
        # ProjectFileSystemLocation object specifies the identifier , location , mountOptions , mountPoint ,
        # and type of a file system created using Amazon Elastic File System.

        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::ProjectFileSystemLocation)?

        # When the build project's settings were last modified, expressed in Unix time format.

        @[JSON::Field(key: "lastModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified : Time?

        # Information about logs for the build project. A project can create logs in CloudWatch Logs, an S3
        # bucket, or both.

        @[JSON::Field(key: "logsConfig")]
        getter logs_config : Types::LogsConfig?

        # The name of the build project.

        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "projectVisibility")]
        getter project_visibility : String?

        # Contains the project identifier used with the public build APIs.

        @[JSON::Field(key: "publicProjectAlias")]
        getter public_project_alias : String?

        # The number of minutes a build is allowed to be queued before it times out.

        @[JSON::Field(key: "queuedTimeoutInMinutes")]
        getter queued_timeout_in_minutes : Int32?

        # The ARN of the IAM role that enables CodeBuild to access the CloudWatch Logs and Amazon S3 artifacts
        # for the project's builds.

        @[JSON::Field(key: "resourceAccessRole")]
        getter resource_access_role : String?

        # An array of ProjectArtifacts objects.

        @[JSON::Field(key: "secondaryArtifacts")]
        getter secondary_artifacts : Array(Types::ProjectArtifacts)?

        # An array of ProjectSourceVersion objects. If secondarySourceVersions is specified at the build
        # level, then they take over these secondarySourceVersions (at the project level).

        @[JSON::Field(key: "secondarySourceVersions")]
        getter secondary_source_versions : Array(Types::ProjectSourceVersion)?

        # An array of ProjectSource objects.

        @[JSON::Field(key: "secondarySources")]
        getter secondary_sources : Array(Types::ProjectSource)?

        # The ARN of the IAM role that enables CodeBuild to interact with dependent Amazon Web Services
        # services on behalf of the Amazon Web Services account.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # Information about the build input source code for this build project.

        @[JSON::Field(key: "source")]
        getter source : Types::ProjectSource?

        # A version of the build input to be built for this project. If not specified, the latest version is
        # used. If specified, it must be one of: For CodeCommit: the commit ID, branch, or Git tag to use. For
        # GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of
        # the source code you want to build. If a pull request ID is specified, it must use the format
        # pr/pull-request-ID (for example pr/25 ). If a branch name is specified, the branch's HEAD commit ID
        # is used. If not specified, the default branch's HEAD commit ID is used. For GitLab: the commit ID,
        # branch, or Git tag to use. For Bitbucket: the commit ID, branch name, or tag name that corresponds
        # to the version of the source code you want to build. If a branch name is specified, the branch's
        # HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used. For Amazon
        # S3: the version ID of the object that represents the build input ZIP file to use. If sourceVersion
        # is specified at the build level, then that version takes precedence over this sourceVersion (at the
        # project level). For more information, see Source Version Sample with CodeBuild in the CodeBuild User
        # Guide .

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # A list of tag key and value pairs associated with this build project. These tags are available for
        # use by Amazon Web Services services that support CodeBuild build project tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before timing out any related
        # build that did not get marked as completed. The default is 60 minutes.

        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        # Information about the VPC configuration that CodeBuild accesses.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        # Information about a webhook that connects repository events to a build project in CodeBuild.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::Webhook?

        def initialize(
          @arn : String? = nil,
          @artifacts : Types::ProjectArtifacts? = nil,
          @auto_retry_limit : Int32? = nil,
          @badge : Types::ProjectBadge? = nil,
          @build_batch_config : Types::ProjectBuildBatchConfig? = nil,
          @cache : Types::ProjectCache? = nil,
          @concurrent_build_limit : Int32? = nil,
          @created : Time? = nil,
          @description : String? = nil,
          @encryption_key : String? = nil,
          @environment : Types::ProjectEnvironment? = nil,
          @file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
          @last_modified : Time? = nil,
          @logs_config : Types::LogsConfig? = nil,
          @name : String? = nil,
          @project_visibility : String? = nil,
          @public_project_alias : String? = nil,
          @queued_timeout_in_minutes : Int32? = nil,
          @resource_access_role : String? = nil,
          @secondary_artifacts : Array(Types::ProjectArtifacts)? = nil,
          @secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
          @secondary_sources : Array(Types::ProjectSource)? = nil,
          @service_role : String? = nil,
          @source : Types::ProjectSource? = nil,
          @source_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_in_minutes : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil,
          @webhook : Types::Webhook? = nil
        )
        end
      end

      # Information about the build output artifacts for the build project.

      struct ProjectArtifacts
        include JSON::Serializable

        # The type of build output artifact. Valid values include: CODEPIPELINE : The build project has build
        # output generated through CodePipeline. The CODEPIPELINE type is not supported for secondaryArtifacts
        # . NO_ARTIFACTS : The build project does not produce any build output. S3 : The build project stores
        # build output in Amazon S3.

        @[JSON::Field(key: "type")]
        getter type : String

        # An identifier for this artifact definition.

        @[JSON::Field(key: "artifactIdentifier")]
        getter artifact_identifier : String?


        @[JSON::Field(key: "bucketOwnerAccess")]
        getter bucket_owner_access : String?

        # Set to true if you do not want your output artifacts encrypted. This option is valid only if your
        # artifacts type is Amazon S3. If this is set with another artifacts type, an invalidInputException is
        # thrown.

        @[JSON::Field(key: "encryptionDisabled")]
        getter encryption_disabled : Bool?

        # Information about the build output artifact location: If type is set to CODEPIPELINE , CodePipeline
        # ignores this value if specified. This is because CodePipeline manages its build output locations
        # instead of CodeBuild. If type is set to NO_ARTIFACTS , this value is ignored if specified, because
        # no build output is produced. If type is set to S3 , this is the name of the output bucket.

        @[JSON::Field(key: "location")]
        getter location : String?

        # Along with path and namespaceType , the pattern that CodeBuild uses to name and store the output
        # artifact: If type is set to CODEPIPELINE , CodePipeline ignores this value if specified. This is
        # because CodePipeline manages its build output names instead of CodeBuild. If type is set to
        # NO_ARTIFACTS , this value is ignored if specified, because no build output is produced. If type is
        # set to S3 , this is the name of the output artifact object. If you set the name to be a forward
        # slash ("/"), the artifact is stored in the root of the output bucket. For example: If path is set to
        # MyArtifacts , namespaceType is set to BUILD_ID , and name is set to MyArtifact.zip , then the output
        # artifact is stored in MyArtifacts/&lt;build-ID&gt;/MyArtifact.zip . If path is empty, namespaceType
        # is set to NONE , and name is set to " / ", the output artifact is stored in the root of the output
        # bucket. If path is set to MyArtifacts , namespaceType is set to BUILD_ID , and name is set to " / ",
        # the output artifact is stored in MyArtifacts/&lt;build-ID&gt; .

        @[JSON::Field(key: "name")]
        getter name : String?

        # Along with path and name , the pattern that CodeBuild uses to determine the name and location to
        # store the output artifact: If type is set to CODEPIPELINE , CodePipeline ignores this value if
        # specified. This is because CodePipeline manages its build output names instead of CodeBuild. If type
        # is set to NO_ARTIFACTS , this value is ignored if specified, because no build output is produced. If
        # type is set to S3 , valid values include: BUILD_ID : Include the build ID in the location of the
        # build output artifact. NONE : Do not include the build ID. This is the default if namespaceType is
        # not specified. For example, if path is set to MyArtifacts , namespaceType is set to BUILD_ID , and
        # name is set to MyArtifact.zip , the output artifact is stored in
        # MyArtifacts/&lt;build-ID&gt;/MyArtifact.zip .

        @[JSON::Field(key: "namespaceType")]
        getter namespace_type : String?

        # If this flag is set, a name specified in the buildspec file overrides the artifact name. The name
        # specified in a buildspec file is calculated at build time and uses the Shell Command Language. For
        # example, you can append a date and time to your artifact name so that it is always unique.

        @[JSON::Field(key: "overrideArtifactName")]
        getter override_artifact_name : Bool?

        # The type of build output artifact to create: If type is set to CODEPIPELINE , CodePipeline ignores
        # this value if specified. This is because CodePipeline manages its build output artifacts instead of
        # CodeBuild. If type is set to NO_ARTIFACTS , this value is ignored if specified, because no build
        # output is produced. If type is set to S3 , valid values include: NONE : CodeBuild creates in the
        # output bucket a folder that contains the build output. This is the default if packaging is not
        # specified. ZIP : CodeBuild creates in the output bucket a ZIP file that contains the build output.

        @[JSON::Field(key: "packaging")]
        getter packaging : String?

        # Along with namespaceType and name , the pattern that CodeBuild uses to name and store the output
        # artifact: If type is set to CODEPIPELINE , CodePipeline ignores this value if specified. This is
        # because CodePipeline manages its build output names instead of CodeBuild. If type is set to
        # NO_ARTIFACTS , this value is ignored if specified, because no build output is produced. If type is
        # set to S3 , this is the path to the output artifact. If path is not specified, path is not used. For
        # example, if path is set to MyArtifacts , namespaceType is set to NONE , and name is set to
        # MyArtifact.zip , the output artifact is stored in the output bucket at MyArtifacts/MyArtifact.zip .

        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @type : String,
          @artifact_identifier : String? = nil,
          @bucket_owner_access : String? = nil,
          @encryption_disabled : Bool? = nil,
          @location : String? = nil,
          @name : String? = nil,
          @namespace_type : String? = nil,
          @override_artifact_name : Bool? = nil,
          @packaging : String? = nil,
          @path : String? = nil
        )
        end
      end

      # Information about the build badge for the build project.

      struct ProjectBadge
        include JSON::Serializable

        # Set this to true to generate a publicly accessible URL for your project's build badge.

        @[JSON::Field(key: "badgeEnabled")]
        getter badge_enabled : Bool?

        # The publicly-accessible URL through which you can access the build badge for your project.

        @[JSON::Field(key: "badgeRequestUrl")]
        getter badge_request_url : String?

        def initialize(
          @badge_enabled : Bool? = nil,
          @badge_request_url : String? = nil
        )
        end
      end

      # Contains configuration information about a batch build project.

      struct ProjectBuildBatchConfig
        include JSON::Serializable

        # Specifies how build status reports are sent to the source provider for the batch build. This
        # property is only used when the source provider for your project is Bitbucket, GitHub, or GitHub
        # Enterprise, and your project is configured to report build statuses to the source provider.
        # REPORT_AGGREGATED_BATCH (Default) Aggregate all of the build statuses into a single status report.
        # REPORT_INDIVIDUAL_BUILDS Send a separate status report for each individual build.

        @[JSON::Field(key: "batchReportMode")]
        getter batch_report_mode : String?

        # Specifies if the build artifacts for the batch build should be combined into a single artifact
        # location.

        @[JSON::Field(key: "combineArtifacts")]
        getter combine_artifacts : Bool?

        # A BatchRestrictions object that specifies the restrictions for the batch build.

        @[JSON::Field(key: "restrictions")]
        getter restrictions : Types::BatchRestrictions?

        # Specifies the service role ARN for the batch build project.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # Specifies the maximum amount of time, in minutes, that the batch build must be completed in.

        @[JSON::Field(key: "timeoutInMins")]
        getter timeout_in_mins : Int32?

        def initialize(
          @batch_report_mode : String? = nil,
          @combine_artifacts : Bool? = nil,
          @restrictions : Types::BatchRestrictions? = nil,
          @service_role : String? = nil,
          @timeout_in_mins : Int32? = nil
        )
        end
      end

      # Information about the cache for the build project.

      struct ProjectCache
        include JSON::Serializable

        # The type of cache used by the build project. Valid values include: NO_CACHE : The build project does
        # not use any cache. S3 : The build project reads and writes from and to S3. LOCAL : The build project
        # stores a cache locally on a build host that is only available to that build host.

        @[JSON::Field(key: "type")]
        getter type : String

        # Defines the scope of the cache. You can use this namespace to share a cache across multiple
        # projects. For more information, see Cache sharing between projects in the CodeBuild User Guide .

        @[JSON::Field(key: "cacheNamespace")]
        getter cache_namespace : String?

        # Information about the cache location: NO_CACHE or LOCAL : This value is ignored. S3 : This is the S3
        # bucket name/prefix.

        @[JSON::Field(key: "location")]
        getter location : String?

        # An array of strings that specify the local cache modes. You can use one or more local cache modes at
        # the same time. This is only used for LOCAL cache types. Possible values are: LOCAL_SOURCE_CACHE
        # Caches Git metadata for primary and secondary sources. After the cache is created, subsequent builds
        # pull only the change between commits. This mode is a good choice for projects with a clean working
        # directory and a source that is a large Git repository. If you choose this option and your project
        # does not use a Git repository (GitHub, GitHub Enterprise, or Bitbucket), the option is ignored.
        # LOCAL_DOCKER_LAYER_CACHE Caches existing Docker layers. This mode is a good choice for projects that
        # build or pull large Docker images. It can prevent the performance issues caused by pulling large
        # Docker images down from the network. You can use a Docker layer cache in the Linux environment only.
        # The privileged flag must be set so that your project has the required Docker permissions. You should
        # consider the security implications before you use a Docker layer cache. LOCAL_CUSTOM_CACHE Caches
        # directories you specify in the buildspec file. This mode is a good choice if your build scenario is
        # not suited to one of the other three local cache modes. If you use a custom cache: Only directories
        # can be specified for caching. You cannot specify individual files. Symlinks are used to reference
        # cached directories. Cached directories are linked to your build before it downloads its project
        # sources. Cached items are overridden if a source item has the same name. Directories are specified
        # using cache paths in the buildspec file.

        @[JSON::Field(key: "modes")]
        getter modes : Array(String)?

        def initialize(
          @type : String,
          @cache_namespace : String? = nil,
          @location : String? = nil,
          @modes : Array(String)? = nil
        )
        end
      end

      # Information about the build environment of the build project.

      struct ProjectEnvironment
        include JSON::Serializable

        # Information about the compute resources the build project uses. Available values include:
        # ATTRIBUTE_BASED_COMPUTE : Specify the amount of vCPUs, memory, disk space, and the type of machine.
        # If you use ATTRIBUTE_BASED_COMPUTE , you must define your attributes by using computeConfiguration .
        # CodeBuild will select the cheapest instance that satisfies your specified attributes. For more
        # information, see Reserved capacity environment types in the CodeBuild User Guide .
        # BUILD_GENERAL1_SMALL : Use up to 4 GiB memory and 2 vCPUs for builds. BUILD_GENERAL1_MEDIUM : Use up
        # to 8 GiB memory and 4 vCPUs for builds. BUILD_GENERAL1_LARGE : Use up to 16 GiB memory and 8 vCPUs
        # for builds, depending on your environment type. BUILD_GENERAL1_XLARGE : Use up to 72 GiB memory and
        # 36 vCPUs for builds, depending on your environment type. BUILD_GENERAL1_2XLARGE : Use up to 144 GiB
        # memory, 72 vCPUs, and 824 GB of SSD storage for builds. This compute type supports Docker images up
        # to 100 GB uncompressed. BUILD_LAMBDA_1GB : Use up to 1 GiB memory for builds. Only available for
        # environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_2GB : Use up to 2
        # GiB memory for builds. Only available for environment type LINUX_LAMBDA_CONTAINER and
        # ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_4GB : Use up to 4 GiB memory for builds. Only available for
        # environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_8GB : Use up to 8
        # GiB memory for builds. Only available for environment type LINUX_LAMBDA_CONTAINER and
        # ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_10GB : Use up to 10 GiB memory for builds. Only available for
        # environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . If you use BUILD_GENERAL1_SMALL :
        # For environment type LINUX_CONTAINER , you can use up to 4 GiB memory and 2 vCPUs for builds. For
        # environment type LINUX_GPU_CONTAINER , you can use up to 16 GiB memory, 4 vCPUs, and 1 NVIDIA A10G
        # Tensor Core GPU for builds. For environment type ARM_CONTAINER , you can use up to 4 GiB memory and
        # 2 vCPUs on ARM-based processors for builds. If you use BUILD_GENERAL1_LARGE : For environment type
        # LINUX_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs for builds. For environment type
        # LINUX_GPU_CONTAINER , you can use up to 255 GiB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for
        # builds. For environment type ARM_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs on
        # ARM-based processors for builds. For more information, see On-demand environment types in the
        # CodeBuild User Guide.

        @[JSON::Field(key: "computeType")]
        getter compute_type : String

        # The image tag or image digest that identifies the Docker image to use for this build project. Use
        # the following formats: For an image tag: &lt;registry&gt;/&lt;repository&gt;:&lt;tag&gt; . For
        # example, in the Docker repository that CodeBuild uses to manage its Docker images, this would be
        # aws/codebuild/standard:4.0 . For an image digest: &lt;registry&gt;/&lt;repository&gt;@&lt;digest&gt;
        # . For example, to specify an image with the digest
        # "sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf," use
        # &lt;registry&gt;/&lt;repository&gt;@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf
        # . For more information, see Docker images provided by CodeBuild in the CodeBuild user guide .

        @[JSON::Field(key: "image")]
        getter image : String

        # The type of build environment to use for related builds. If you're using compute fleets during
        # project creation, type will be ignored. For more information, see Build environment compute types in
        # the CodeBuild user guide .

        @[JSON::Field(key: "type")]
        getter type : String

        # The ARN of the Amazon S3 bucket, path prefix, and object key that contains the PEM-encoded
        # certificate for the build project. For more information, see certificate in the CodeBuild User Guide
        # .

        @[JSON::Field(key: "certificate")]
        getter certificate : String?

        # The compute configuration of the build project. This is only required if computeType is set to
        # ATTRIBUTE_BASED_COMPUTE .

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ComputeConfiguration?

        # A DockerServer object to use for this build project.

        @[JSON::Field(key: "dockerServer")]
        getter docker_server : Types::DockerServer?

        # A set of environment variables to make available to builds for this build project.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Array(Types::EnvironmentVariable)?

        # A ProjectFleet object to use for this build project.

        @[JSON::Field(key: "fleet")]
        getter fleet : Types::ProjectFleet?

        # The type of credentials CodeBuild uses to pull images in your build. There are two valid values:
        # CODEBUILD specifies that CodeBuild uses its own credentials. This requires that you modify your ECR
        # repository policy to trust CodeBuild service principal. SERVICE_ROLE specifies that CodeBuild uses
        # your build project's service role. When you use a cross-account or private registry image, you must
        # use SERVICE_ROLE credentials. When you use an CodeBuild curated image, you must use CODEBUILD
        # credentials.

        @[JSON::Field(key: "imagePullCredentialsType")]
        getter image_pull_credentials_type : String?

        # Enables running the Docker daemon inside a Docker container. Set to true only if the build project
        # is used to build Docker images. Otherwise, a build that attempts to interact with the Docker daemon
        # fails. The default setting is false . You can initialize the Docker daemon during the install phase
        # of your build by adding one of the following sets of commands to the install phase of your buildspec
        # file: If the operating system's base image is Ubuntu Linux: - nohup /usr/local/bin/dockerd
        # --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay&amp; - timeout
        # 15 sh -c "until docker info; do echo .; sleep 1; done" If the operating system's base image is
        # Alpine Linux and the previous command does not work, add the -t argument to timeout : - nohup
        # /usr/local/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375
        # --storage-driver=overlay&amp; - timeout -t 15 sh -c "until docker info; do echo .; sleep 1; done"

        @[JSON::Field(key: "privilegedMode")]
        getter privileged_mode : Bool?

        # The credentials for access to a private registry.

        @[JSON::Field(key: "registryCredential")]
        getter registry_credential : Types::RegistryCredential?

        def initialize(
          @compute_type : String,
          @image : String,
          @type : String,
          @certificate : String? = nil,
          @compute_configuration : Types::ComputeConfiguration? = nil,
          @docker_server : Types::DockerServer? = nil,
          @environment_variables : Array(Types::EnvironmentVariable)? = nil,
          @fleet : Types::ProjectFleet? = nil,
          @image_pull_credentials_type : String? = nil,
          @privileged_mode : Bool? = nil,
          @registry_credential : Types::RegistryCredential? = nil
        )
        end
      end

      # Information about a file system created by Amazon Elastic File System (EFS). For more information,
      # see What Is Amazon Elastic File System?

      struct ProjectFileSystemLocation
        include JSON::Serializable

        # The name used to access a file system created by Amazon EFS. CodeBuild creates an environment
        # variable by appending the identifier in all capital letters to CODEBUILD_ . For example, if you
        # specify my_efs for identifier , a new environment variable is create named CODEBUILD_MY_EFS . The
        # identifier is used to mount your file system.

        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # A string that specifies the location of the file system created by Amazon EFS. Its format is
        # efs-dns-name:/directory-path . You can find the DNS name of file system when you view it in the
        # Amazon EFS console. The directory path is a path to a directory in the file system that CodeBuild
        # mounts. For example, if the DNS name of a file system is fs-abcd1234.efs.us-west-2.amazonaws.com ,
        # and its mount directory is my-efs-mount-directory , then the location is
        # fs-abcd1234.efs.us-west-2.amazonaws.com:/my-efs-mount-directory . The directory path in the format
        # efs-dns-name:/directory-path is optional. If you do not specify a directory path, the location is
        # only the DNS name and CodeBuild mounts the entire file system.

        @[JSON::Field(key: "location")]
        getter location : String?

        # The mount options for a file system created by Amazon EFS. The default mount options used by
        # CodeBuild are nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 . For more
        # information, see Recommended NFS Mount Options .

        @[JSON::Field(key: "mountOptions")]
        getter mount_options : String?

        # The location in the container where you mount the file system.

        @[JSON::Field(key: "mountPoint")]
        getter mount_point : String?

        # The type of the file system. The one supported type is EFS .

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @identifier : String? = nil,
          @location : String? = nil,
          @mount_options : String? = nil,
          @mount_point : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the compute fleet of the build project. For more information, see Working with
      # reserved capacity in CodeBuild .

      struct ProjectFleet
        include JSON::Serializable

        # Specifies the compute fleet ARN for the build project.

        @[JSON::Field(key: "fleetArn")]
        getter fleet_arn : String?

        def initialize(
          @fleet_arn : String? = nil
        )
        end
      end

      # Information about the build input source code for the build project.

      struct ProjectSource
        include JSON::Serializable

        # The type of repository that contains the source code to be built. Valid values include: BITBUCKET :
        # The source code is in a Bitbucket repository. CODECOMMIT : The source code is in an CodeCommit
        # repository. CODEPIPELINE : The source code settings are specified in the source action of a pipeline
        # in CodePipeline. GITHUB : The source code is in a GitHub repository. GITHUB_ENTERPRISE : The source
        # code is in a GitHub Enterprise Server repository. GITLAB : The source code is in a GitLab
        # repository. GITLAB_SELF_MANAGED : The source code is in a self-managed GitLab repository. NO_SOURCE
        # : The project does not have input source code. S3 : The source code is in an Amazon S3 bucket.

        @[JSON::Field(key: "type")]
        getter type : String

        # Information about the authorization settings for CodeBuild to access the source code to be built.

        @[JSON::Field(key: "auth")]
        getter auth : Types::SourceAuth?

        # Contains information that defines how the build project reports the build status to the source
        # provider. This option is only used when the source provider is GITHUB , GITHUB_ENTERPRISE , or
        # BITBUCKET .

        @[JSON::Field(key: "buildStatusConfig")]
        getter build_status_config : Types::BuildStatusConfig?

        # The buildspec file declaration to use for the builds in this build project. If this value is set, it
        # can be either an inline buildspec definition, the path to an alternate buildspec file relative to
        # the value of the built-in CODEBUILD_SRC_DIR environment variable, or the path to an S3 bucket. The
        # bucket must be in the same Amazon Web Services Region as the build project. Specify the buildspec
        # file using its ARN (for example, arn:aws:s3:::my-codebuild-sample2/buildspec.yml ). If this value is
        # not provided or is set to an empty string, the source code must contain a buildspec file in its root
        # directory. For more information, see Buildspec File Name and Storage Location .

        @[JSON::Field(key: "buildspec")]
        getter buildspec : String?

        # Information about the Git clone depth for the build project.

        @[JSON::Field(key: "gitCloneDepth")]
        getter git_clone_depth : Int32?

        # Information about the Git submodules configuration for the build project.

        @[JSON::Field(key: "gitSubmodulesConfig")]
        getter git_submodules_config : Types::GitSubmodulesConfig?

        # Enable this flag to ignore SSL warnings while connecting to the project source code.

        @[JSON::Field(key: "insecureSsl")]
        getter insecure_ssl : Bool?

        # Information about the location of the source code to be built. Valid values include: For source code
        # settings that are specified in the source action of a pipeline in CodePipeline, location should not
        # be specified. If it is specified, CodePipeline ignores it. This is because CodePipeline uses the
        # settings in a pipeline's source action instead of this value. For source code in an CodeCommit
        # repository, the HTTPS clone URL to the repository that contains the source code and the buildspec
        # file (for example, https://git-codecommit.&lt;region-ID&gt;.amazonaws.com/v1/repos/&lt;repo-name&gt;
        # ). For source code in an Amazon S3 input bucket, one of the following. The path to the ZIP file that
        # contains the source code (for example, &lt;bucket-name&gt;/&lt;path&gt;/&lt;object-name&gt;.zip ).
        # The path to the folder that contains the source code (for example,
        # &lt;bucket-name&gt;/&lt;path-to-source-code&gt;/&lt;folder&gt;/ ). For source code in a GitHub
        # repository, the HTTPS clone URL to the repository that contains the source and the buildspec file.
        # You must connect your Amazon Web Services account to your GitHub account. Use the CodeBuild console
        # to start creating a build project. When you use the console to connect (or reconnect) with GitHub,
        # on the GitHub Authorize application page, for Organization access , choose Request access next to
        # each repository you want to allow CodeBuild to have access to, and then choose Authorize application
        # . (After you have connected to your GitHub account, you do not need to finish creating the build
        # project. You can leave the CodeBuild console.) To instruct CodeBuild to use this connection, in the
        # source object, set the auth object's type value to OAUTH . For source code in an GitLab or
        # self-managed GitLab repository, the HTTPS clone URL to the repository that contains the source and
        # the buildspec file. You must connect your Amazon Web Services account to your GitLab account. Use
        # the CodeBuild console to start creating a build project. When you use the console to connect (or
        # reconnect) with GitLab, on the Connections Authorize application page, choose Authorize . Then on
        # the CodeConnections Create GitLab connection page, choose Connect to GitLab . (After you have
        # connected to your GitLab account, you do not need to finish creating the build project. You can
        # leave the CodeBuild console.) To instruct CodeBuild to override the default connection and use this
        # connection instead, set the auth object's type value to CODECONNECTIONS in the source object. For
        # source code in a Bitbucket repository, the HTTPS clone URL to the repository that contains the
        # source and the buildspec file. You must connect your Amazon Web Services account to your Bitbucket
        # account. Use the CodeBuild console to start creating a build project. When you use the console to
        # connect (or reconnect) with Bitbucket, on the Bitbucket Confirm access to your account page, choose
        # Grant access . (After you have connected to your Bitbucket account, you do not need to finish
        # creating the build project. You can leave the CodeBuild console.) To instruct CodeBuild to use this
        # connection, in the source object, set the auth object's type value to OAUTH . If you specify
        # CODEPIPELINE for the Type property, don't specify this property. For all of the other types, you
        # must specify Location .

        @[JSON::Field(key: "location")]
        getter location : String?

        # Set to true to report the status of a build's start and finish to your source provider. This option
        # is valid only when your source provider is GitHub, GitHub Enterprise, GitLab, GitLab Self Managed,
        # GitLab, GitLab Self Managed, or Bitbucket. If this is set and you use a different source provider,
        # an invalidInputException is thrown. To be able to report the build status to the source provider,
        # the user associated with the source provider must have write access to the repo. If the user does
        # not have write access, the build status cannot be updated. For more information, see Source provider
        # access in the CodeBuild User Guide . The status of a build triggered by a webhook is always reported
        # to your source provider. If your project's builds are triggered by a webhook, you must push a new
        # commit to the repo for a change to this property to take effect.

        @[JSON::Field(key: "reportBuildStatus")]
        getter report_build_status : Bool?

        # An identifier for this project source. The identifier can only contain alphanumeric characters and
        # underscores, and must be less than 128 characters in length.

        @[JSON::Field(key: "sourceIdentifier")]
        getter source_identifier : String?

        def initialize(
          @type : String,
          @auth : Types::SourceAuth? = nil,
          @build_status_config : Types::BuildStatusConfig? = nil,
          @buildspec : String? = nil,
          @git_clone_depth : Int32? = nil,
          @git_submodules_config : Types::GitSubmodulesConfig? = nil,
          @insecure_ssl : Bool? = nil,
          @location : String? = nil,
          @report_build_status : Bool? = nil,
          @source_identifier : String? = nil
        )
        end
      end

      # A source identifier and its corresponding version.

      struct ProjectSourceVersion
        include JSON::Serializable

        # An identifier for a source in the build project. The identifier can only contain alphanumeric
        # characters and underscores, and must be less than 128 characters in length.

        @[JSON::Field(key: "sourceIdentifier")]
        getter source_identifier : String

        # The source version for the corresponding source identifier. If specified, must be one of: For
        # CodeCommit: the commit ID, branch, or Git tag to use. For GitHub: the commit ID, pull request ID,
        # branch name, or tag name that corresponds to the version of the source code you want to build. If a
        # pull request ID is specified, it must use the format pr/pull-request-ID (for example, pr/25 ). If a
        # branch name is specified, the branch's HEAD commit ID is used. If not specified, the default
        # branch's HEAD commit ID is used. For GitLab: the commit ID, branch, or Git tag to use. For
        # Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source
        # code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not
        # specified, the default branch's HEAD commit ID is used. For Amazon S3: the version ID of the object
        # that represents the build input ZIP file to use. For more information, see Source Version Sample
        # with CodeBuild in the CodeBuild User Guide .

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String

        def initialize(
          @source_identifier : String,
          @source_version : String
        )
        end
      end

      # Information about the proxy configurations that apply network access control to your reserved
      # capacity instances.

      struct ProxyConfiguration
        include JSON::Serializable

        # The default behavior of outgoing traffic.

        @[JSON::Field(key: "defaultBehavior")]
        getter default_behavior : String?

        # An array of FleetProxyRule objects that represent the specified destination domains or IPs to allow
        # or deny network access control to.

        @[JSON::Field(key: "orderedProxyRules")]
        getter ordered_proxy_rules : Array(Types::FleetProxyRule)?

        def initialize(
          @default_behavior : String? = nil,
          @ordered_proxy_rules : Array(Types::FleetProxyRule)? = nil
        )
        end
      end

      # A PullRequestBuildPolicy object that defines comment-based approval requirements for triggering
      # builds on pull requests. This policy helps control when automated builds are executed based on
      # contributor permissions and approval workflows.

      struct PullRequestBuildPolicy
        include JSON::Serializable

        # Specifies when comment-based approval is required before triggering a build on pull requests. This
        # setting determines whether builds run automatically or require explicit approval through comments.
        # DISABLED : Builds trigger automatically without requiring comment approval ALL_PULL_REQUESTS : All
        # pull requests require comment approval before builds execute (unless contributor is one of the
        # approver roles) FORK_PULL_REQUESTS : Only pull requests from forked repositories require comment
        # approval (unless contributor is one of the approver roles)

        @[JSON::Field(key: "requiresCommentApproval")]
        getter requires_comment_approval : String

        # List of repository roles that have approval privileges for pull request builds when comment approval
        # is required. Only users with these roles can provide valid comment approvals. If a pull request
        # contributor is one of these roles, their pull request builds will trigger automatically. This field
        # is only applicable when requiresCommentApproval is not DISABLED .

        @[JSON::Field(key: "approverRoles")]
        getter approver_roles : Array(String)?

        def initialize(
          @requires_comment_approval : String,
          @approver_roles : Array(String)? = nil
        )
        end
      end


      struct PutResourcePolicyInput
        include JSON::Serializable

        # A JSON-formatted resource policy. For more information, see Sharing a Project and Sharing a Report
        # Group in the CodeBuild User Guide .

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The ARN of the Project or ReportGroup resource you want to associate with a resource policy.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end


      struct PutResourcePolicyOutput
        include JSON::Serializable

        # The ARN of the Project or ReportGroup resource that is associated with a resource policy.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end

      # Information about credentials that provide access to a private Docker registry. When this is set:
      # imagePullCredentialsType must be set to SERVICE_ROLE . images cannot be curated or an Amazon ECR
      # image. For more information, see Private Registry with Secrets Manager Sample for CodeBuild .

      struct RegistryCredential
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of credentials created using Secrets Manager. The credential
        # can use the name of the credentials only if they exist in your current Amazon Web Services Region.

        @[JSON::Field(key: "credential")]
        getter credential : String

        # The service that created the credentials to access a private Docker registry. The valid value,
        # SECRETS_MANAGER, is for Secrets Manager.

        @[JSON::Field(key: "credentialProvider")]
        getter credential_provider : String

        def initialize(
          @credential : String,
          @credential_provider : String
        )
        end
      end

      # Information about the results from running a series of test cases during the run of a build project.
      # The test cases are specified in the buildspec for the build project using one or more paths to the
      # test case files. You can specify any type of tests you want, such as unit tests, integration tests,
      # and functional tests.

      struct Report
        include JSON::Serializable

        # The ARN of the report run.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A CodeCoverageReportSummary object that contains a code coverage summary for this report.

        @[JSON::Field(key: "codeCoverageSummary")]
        getter code_coverage_summary : Types::CodeCoverageReportSummary?

        # The date and time this report run occurred.

        @[JSON::Field(key: "created", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The ARN of the build run that generated this report.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # The date and time a report expires. A report expires 30 days after it is created. An expired report
        # is not available to view in CodeBuild.

        @[JSON::Field(key: "expired", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expired : Time?

        # Information about where the raw data used to generate this report was exported.

        @[JSON::Field(key: "exportConfig")]
        getter export_config : Types::ReportExportConfig?

        # The name of the report that was run.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the report group associated with this report.

        @[JSON::Field(key: "reportGroupArn")]
        getter report_group_arn : String?

        # The status of this report.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A TestReportSummary object that contains information about this test report.

        @[JSON::Field(key: "testSummary")]
        getter test_summary : Types::TestReportSummary?

        # A boolean that specifies if this report run is truncated. The list of test cases is truncated after
        # the maximum number of test cases is reached.

        @[JSON::Field(key: "truncated")]
        getter truncated : Bool?

        # The type of the report that was run. CODE_COVERAGE A code coverage report. TEST A test report.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @code_coverage_summary : Types::CodeCoverageReportSummary? = nil,
          @created : Time? = nil,
          @execution_id : String? = nil,
          @expired : Time? = nil,
          @export_config : Types::ReportExportConfig? = nil,
          @name : String? = nil,
          @report_group_arn : String? = nil,
          @status : String? = nil,
          @test_summary : Types::TestReportSummary? = nil,
          @truncated : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the location where the run of a report is exported.

      struct ReportExportConfig
        include JSON::Serializable

        # The export configuration type. Valid values are: S3 : The report results are exported to an S3
        # bucket. NO_EXPORT : The report results are not exported.

        @[JSON::Field(key: "exportConfigType")]
        getter export_config_type : String?

        # A S3ReportExportConfig object that contains information about the S3 bucket where the run of a
        # report is exported.

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3ReportExportConfig?

        def initialize(
          @export_config_type : String? = nil,
          @s3_destination : Types::S3ReportExportConfig? = nil
        )
        end
      end

      # A filter used to return reports with the status specified by the input status parameter.

      struct ReportFilter
        include JSON::Serializable

        # The status used to filter reports. You can filter using one status only.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # A series of reports. Each report contains information about the results from running a series of
      # test cases. You specify the test cases for a report group in the buildspec for a build project using
      # one or more paths to the test case files.

      struct ReportGroup
        include JSON::Serializable

        # The ARN of the ReportGroup .

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time this ReportGroup was created.

        @[JSON::Field(key: "created", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # Information about the destination where the raw data of this ReportGroup is exported.

        @[JSON::Field(key: "exportConfig")]
        getter export_config : Types::ReportExportConfig?

        # The date and time this ReportGroup was last modified.

        @[JSON::Field(key: "lastModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified : Time?

        # The name of the ReportGroup .

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the report group. This property is read-only. This can be one of the following values:
        # ACTIVE The report group is active. DELETING The report group is in the process of being deleted.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of tag key and value pairs associated with this report group. These tags are available for
        # use by Amazon Web Services services that support CodeBuild report group tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The type of the ReportGroup . This can be one of the following values: CODE_COVERAGE The report
        # group contains code coverage reports. TEST The report group contains test reports.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @created : Time? = nil,
          @export_config : Types::ReportExportConfig? = nil,
          @last_modified : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains trend statistics for a set of reports. The actual values depend on the type of trend being
      # collected. For more information, see .

      struct ReportGroupTrendStats
        include JSON::Serializable

        # Contains the average of all values analyzed.

        @[JSON::Field(key: "average")]
        getter average : String?

        # Contains the maximum value analyzed.

        @[JSON::Field(key: "max")]
        getter max : String?

        # Contains the minimum value analyzed.

        @[JSON::Field(key: "min")]
        getter min : String?

        def initialize(
          @average : String? = nil,
          @max : String? = nil,
          @min : String? = nil
        )
        end
      end

      # Contains the unmodified data for the report. For more information, see .

      struct ReportWithRawData
        include JSON::Serializable

        # The value of the requested data field from the report.

        @[JSON::Field(key: "data")]
        getter data : String?

        # The ARN of the report.

        @[JSON::Field(key: "reportArn")]
        getter report_arn : String?

        def initialize(
          @data : String? = nil,
          @report_arn : String? = nil
        )
        end
      end

      # Represents a resolved build artifact. A resolved artifact is an artifact that is built and deployed
      # to the destination, such as Amazon S3.

      struct ResolvedArtifact
        include JSON::Serializable

        # The identifier of the artifact.

        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # The location of the artifact.

        @[JSON::Field(key: "location")]
        getter location : String?

        # Specifies the type of artifact.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @identifier : String? = nil,
          @location : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified Amazon Web Services resource cannot be created, because an Amazon Web Services
      # resource with the same settings already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified Amazon Web Services resource cannot be found.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end


      struct RetryBuildBatchInput
        include JSON::Serializable

        # Specifies the identifier of the batch build to restart.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A unique, case sensitive identifier you provide to ensure the idempotency of the RetryBuildBatch
        # request. The token is included in the RetryBuildBatch request and is valid for five minutes. If you
        # repeat the RetryBuildBatch request with the same token, but change a parameter, CodeBuild returns a
        # parameter mismatch error.

        @[JSON::Field(key: "idempotencyToken")]
        getter idempotency_token : String?

        # Specifies the type of retry to perform.

        @[JSON::Field(key: "retryType")]
        getter retry_type : String?

        def initialize(
          @id : String? = nil,
          @idempotency_token : String? = nil,
          @retry_type : String? = nil
        )
        end
      end


      struct RetryBuildBatchOutput
        include JSON::Serializable


        @[JSON::Field(key: "buildBatch")]
        getter build_batch : Types::BuildBatch?

        def initialize(
          @build_batch : Types::BuildBatch? = nil
        )
        end
      end


      struct RetryBuildInput
        include JSON::Serializable

        # Specifies the identifier of the build to restart.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A unique, case sensitive identifier you provide to ensure the idempotency of the RetryBuild request.
        # The token is included in the RetryBuild request and is valid for five minutes. If you repeat the
        # RetryBuild request with the same token, but change a parameter, CodeBuild returns a parameter
        # mismatch error.

        @[JSON::Field(key: "idempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @id : String? = nil,
          @idempotency_token : String? = nil
        )
        end
      end


      struct RetryBuildOutput
        include JSON::Serializable


        @[JSON::Field(key: "build")]
        getter build : Types::Build?

        def initialize(
          @build : Types::Build? = nil
        )
        end
      end

      # Information about S3 logs for a build project.

      struct S3LogsConfig
        include JSON::Serializable

        # The current status of the S3 build logs. Valid values are: ENABLED : S3 build logs are enabled for
        # this build project. DISABLED : S3 build logs are not enabled for this build project.

        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "bucketOwnerAccess")]
        getter bucket_owner_access : String?

        # Set to true if you do not want your S3 build log output encrypted. By default S3 build logs are
        # encrypted.

        @[JSON::Field(key: "encryptionDisabled")]
        getter encryption_disabled : Bool?

        # The ARN of an S3 bucket and the path prefix for S3 logs. If your Amazon S3 bucket name is my-bucket
        # , and your path prefix is build-log , then acceptable formats are my-bucket/build-log or
        # arn:aws:s3:::my-bucket/build-log .

        @[JSON::Field(key: "location")]
        getter location : String?

        def initialize(
          @status : String,
          @bucket_owner_access : String? = nil,
          @encryption_disabled : Bool? = nil,
          @location : String? = nil
        )
        end
      end

      # Information about the S3 bucket where the raw data of a report are exported.

      struct S3ReportExportConfig
        include JSON::Serializable

        # The name of the S3 bucket where the raw data of a report are exported.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The Amazon Web Services account identifier of the owner of the Amazon S3 bucket. This allows report
        # data to be exported to an Amazon S3 bucket that is owned by an account other than the account
        # running the build.

        @[JSON::Field(key: "bucketOwner")]
        getter bucket_owner : String?

        # A boolean value that specifies if the results of a report are encrypted.

        @[JSON::Field(key: "encryptionDisabled")]
        getter encryption_disabled : Bool?

        # The encryption key for the report's encrypted raw data.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # The type of build output artifact to create. Valid values include: NONE : CodeBuild creates the raw
        # data in the output bucket. This is the default if packaging is not specified. ZIP : CodeBuild
        # creates a ZIP file with the raw data in the output bucket.

        @[JSON::Field(key: "packaging")]
        getter packaging : String?

        # The path to the exported report's raw data results.

        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @bucket : String? = nil,
          @bucket_owner : String? = nil,
          @encryption_disabled : Bool? = nil,
          @encryption_key : String? = nil,
          @packaging : String? = nil,
          @path : String? = nil
        )
        end
      end

      # Contains information about the Session Manager session.

      struct SSMSession
        include JSON::Serializable

        # The ID of the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # A URL back to SSM Agent on the managed node that the Session Manager client uses to send commands
        # and receive output from the node.

        @[JSON::Field(key: "streamUrl")]
        getter stream_url : String?

        # An encrypted token value containing session and caller information.

        @[JSON::Field(key: "tokenValue")]
        getter token_value : String?

        def initialize(
          @session_id : String? = nil,
          @stream_url : String? = nil,
          @token_value : String? = nil
        )
        end
      end

      # Contains sandbox information.

      struct Sandbox
        include JSON::Serializable

        # The ARN of the sandbox.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The current session for the sandbox.

        @[JSON::Field(key: "currentSession")]
        getter current_session : Types::SandboxSession?

        # The Key Management Service customer master key (CMK) to be used for encrypting the sandbox output
        # artifacts.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # When the sandbox process ended, expressed in Unix time format.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?


        @[JSON::Field(key: "environment")]
        getter environment : Types::ProjectEnvironment?

        # An array of ProjectFileSystemLocation objects for a CodeBuild build project. A
        # ProjectFileSystemLocation object specifies the identifier , location , mountOptions , mountPoint ,
        # and type of a file system created using Amazon Elastic File System.

        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::ProjectFileSystemLocation)?

        # The ID of the sandbox.

        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "logConfig")]
        getter log_config : Types::LogsConfig?

        # The CodeBuild project name.

        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # The number of minutes a sandbox is allowed to be queued before it times out.

        @[JSON::Field(key: "queuedTimeoutInMinutes")]
        getter queued_timeout_in_minutes : Int32?

        # When the sandbox process was initially requested, expressed in Unix time format.

        @[JSON::Field(key: "requestTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter request_time : Time?

        # An array of ProjectSourceVersion objects.

        @[JSON::Field(key: "secondarySourceVersions")]
        getter secondary_source_versions : Array(Types::ProjectSourceVersion)?

        # An array of ProjectSource objects.

        @[JSON::Field(key: "secondarySources")]
        getter secondary_sources : Array(Types::ProjectSource)?

        # The name of a service role used for this sandbox.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?


        @[JSON::Field(key: "source")]
        getter source : Types::ProjectSource?

        # Any version identifier for the version of the sandbox to be built.

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # When the sandbox process started, expressed in Unix time format.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the sandbox.

        @[JSON::Field(key: "status")]
        getter status : String?

        # How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before timing out this
        # sandbox if it does not get marked as completed.

        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32?


        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @arn : String? = nil,
          @current_session : Types::SandboxSession? = nil,
          @encryption_key : String? = nil,
          @end_time : Time? = nil,
          @environment : Types::ProjectEnvironment? = nil,
          @file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
          @id : String? = nil,
          @log_config : Types::LogsConfig? = nil,
          @project_name : String? = nil,
          @queued_timeout_in_minutes : Int32? = nil,
          @request_time : Time? = nil,
          @secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
          @secondary_sources : Array(Types::ProjectSource)? = nil,
          @service_role : String? = nil,
          @source : Types::ProjectSource? = nil,
          @source_version : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @timeout_in_minutes : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Contains information about the sandbox session.

      struct SandboxSession
        include JSON::Serializable

        # The current phase for the sandbox.

        @[JSON::Field(key: "currentPhase")]
        getter current_phase : String?

        # When the sandbox session ended, expressed in Unix time format.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The ID of the sandbox session.

        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "logs")]
        getter logs : Types::LogsLocation?


        @[JSON::Field(key: "networkInterface")]
        getter network_interface : Types::NetworkInterface?

        # An array of SandboxSessionPhase objects.

        @[JSON::Field(key: "phases")]
        getter phases : Array(Types::SandboxSessionPhase)?

        # An identifier for the version of this sandbox's source code.

        @[JSON::Field(key: "resolvedSourceVersion")]
        getter resolved_source_version : String?

        # When the sandbox session started, expressed in Unix time format.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the sandbox session.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @current_phase : String? = nil,
          @end_time : Time? = nil,
          @id : String? = nil,
          @logs : Types::LogsLocation? = nil,
          @network_interface : Types::NetworkInterface? = nil,
          @phases : Array(Types::SandboxSessionPhase)? = nil,
          @resolved_source_version : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about the sandbox phase.

      struct SandboxSessionPhase
        include JSON::Serializable

        # An array of PhaseContext objects.

        @[JSON::Field(key: "contexts")]
        getter contexts : Array(Types::PhaseContext)?

        # How long, in seconds, between the starting and ending times of the sandbox's phase.

        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int64?

        # When the sandbox phase ended, expressed in Unix time format.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The current status of the sandbox phase. Valid values include: FAILED The sandbox phase failed.
        # FAULT The sandbox phase faulted. IN_PROGRESS The sandbox phase is still in progress. STOPPED The
        # sandbox phase stopped. SUCCEEDED The sandbox phase succeeded. TIMED_OUT The sandbox phase timed out.

        @[JSON::Field(key: "phaseStatus")]
        getter phase_status : String?

        # The name of the sandbox phase.

        @[JSON::Field(key: "phaseType")]
        getter phase_type : String?

        # When the sandbox phase started, expressed in Unix time format.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @contexts : Array(Types::PhaseContext)? = nil,
          @duration_in_seconds : Int64? = nil,
          @end_time : Time? = nil,
          @phase_status : String? = nil,
          @phase_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # The scaling configuration input of a compute fleet.

      struct ScalingConfigurationInput
        include JSON::Serializable

        # The maximum number of instances in the ﬂeet when auto-scaling.

        @[JSON::Field(key: "maxCapacity")]
        getter max_capacity : Int32?

        # The scaling type for a compute fleet.

        @[JSON::Field(key: "scalingType")]
        getter scaling_type : String?

        # A list of TargetTrackingScalingConfiguration objects.

        @[JSON::Field(key: "targetTrackingScalingConfigs")]
        getter target_tracking_scaling_configs : Array(Types::TargetTrackingScalingConfiguration)?

        def initialize(
          @max_capacity : Int32? = nil,
          @scaling_type : String? = nil,
          @target_tracking_scaling_configs : Array(Types::TargetTrackingScalingConfiguration)? = nil
        )
        end
      end

      # The scaling configuration output of a compute fleet.

      struct ScalingConfigurationOutput
        include JSON::Serializable

        # The desired number of instances in the ﬂeet when auto-scaling.

        @[JSON::Field(key: "desiredCapacity")]
        getter desired_capacity : Int32?

        # The maximum number of instances in the ﬂeet when auto-scaling.

        @[JSON::Field(key: "maxCapacity")]
        getter max_capacity : Int32?

        # The scaling type for a compute fleet.

        @[JSON::Field(key: "scalingType")]
        getter scaling_type : String?

        # A list of TargetTrackingScalingConfiguration objects.

        @[JSON::Field(key: "targetTrackingScalingConfigs")]
        getter target_tracking_scaling_configs : Array(Types::TargetTrackingScalingConfiguration)?

        def initialize(
          @desired_capacity : Int32? = nil,
          @max_capacity : Int32? = nil,
          @scaling_type : String? = nil,
          @target_tracking_scaling_configs : Array(Types::TargetTrackingScalingConfiguration)? = nil
        )
        end
      end

      # Contains configuration information about the scope for a webhook.

      struct ScopeConfiguration
        include JSON::Serializable

        # The name of either the group, enterprise, or organization that will send webhook events to
        # CodeBuild, depending on the type of webhook.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of scope for a GitHub or GitLab webhook. The scope default is GITHUB_ORGANIZATION.

        @[JSON::Field(key: "scope")]
        getter scope : String

        # The domain of the GitHub Enterprise organization or the GitLab Self Managed group. Note that this
        # parameter is only required if your project's source type is GITHUB_ENTERPRISE or
        # GITLAB_SELF_MANAGED.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        def initialize(
          @name : String,
          @scope : String,
          @domain : String? = nil
        )
        end
      end

      # Information about the authorization settings for CodeBuild to access the source code to be built.

      struct SourceAuth
        include JSON::Serializable

        # The authorization type to use. Valid options are OAUTH, CODECONNECTIONS, or SECRETS_MANAGER.

        @[JSON::Field(key: "type")]
        getter type : String

        # The resource value that applies to the specified authorization type.

        @[JSON::Field(key: "resource")]
        getter resource : String?

        def initialize(
          @type : String,
          @resource : String? = nil
        )
        end
      end

      # Information about the credentials for a GitHub, GitHub Enterprise, GitLab, GitLab Self Managed, or
      # Bitbucket repository.

      struct SourceCredentialsInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the token.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of authentication used by the credentials. Valid options are OAUTH, BASIC_AUTH,
        # PERSONAL_ACCESS_TOKEN, CODECONNECTIONS, or SECRETS_MANAGER.

        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The connection ARN if your authType is CODECONNECTIONS or SECRETS_MANAGER.

        @[JSON::Field(key: "resource")]
        getter resource : String?

        # The type of source provider. The valid options are GITHUB, GITHUB_ENTERPRISE, GITLAB,
        # GITLAB_SELF_MANAGED, or BITBUCKET.

        @[JSON::Field(key: "serverType")]
        getter server_type : String?

        def initialize(
          @arn : String? = nil,
          @auth_type : String? = nil,
          @resource : String? = nil,
          @server_type : String? = nil
        )
        end
      end


      struct StartBuildBatchInput
        include JSON::Serializable

        # The name of the project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # An array of ProjectArtifacts objects that contains information about the build output artifact
        # overrides for the build project.

        @[JSON::Field(key: "artifactsOverride")]
        getter artifacts_override : Types::ProjectArtifacts?

        # A BuildBatchConfigOverride object that contains batch build configuration overrides.

        @[JSON::Field(key: "buildBatchConfigOverride")]
        getter build_batch_config_override : Types::ProjectBuildBatchConfig?

        # Overrides the build timeout specified in the batch build project.

        @[JSON::Field(key: "buildTimeoutInMinutesOverride")]
        getter build_timeout_in_minutes_override : Int32?

        # A buildspec file declaration that overrides, for this build only, the latest one already defined in
        # the build project. If this value is set, it can be either an inline buildspec definition, the path
        # to an alternate buildspec file relative to the value of the built-in CODEBUILD_SRC_DIR environment
        # variable, or the path to an S3 bucket. The bucket must be in the same Amazon Web Services Region as
        # the build project. Specify the buildspec file using its ARN (for example,
        # arn:aws:s3:::my-codebuild-sample2/buildspec.yml ). If this value is not provided or is set to an
        # empty string, the source code must contain a buildspec file in its root directory. For more
        # information, see Buildspec File Name and Storage Location .

        @[JSON::Field(key: "buildspecOverride")]
        getter buildspec_override : String?

        # A ProjectCache object that specifies cache overrides.

        @[JSON::Field(key: "cacheOverride")]
        getter cache_override : Types::ProjectCache?

        # The name of a certificate for this batch build that overrides the one specified in the batch build
        # project.

        @[JSON::Field(key: "certificateOverride")]
        getter certificate_override : String?

        # The name of a compute type for this batch build that overrides the one specified in the batch build
        # project.

        @[JSON::Field(key: "computeTypeOverride")]
        getter compute_type_override : String?

        # Specifies if session debugging is enabled for this batch build. For more information, see Viewing a
        # running build in Session Manager . Batch session debugging is not supported for matrix batch builds.

        @[JSON::Field(key: "debugSessionEnabled")]
        getter debug_session_enabled : Bool?

        # The Key Management Service customer master key (CMK) that overrides the one specified in the batch
        # build project. The CMK key encrypts the build output artifacts. You can use a cross-account KMS key
        # to encrypt the build output artifacts if your service role has permission to that key. You can
        # specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using
        # the format alias/&lt;alias-name&gt; ).

        @[JSON::Field(key: "encryptionKeyOverride")]
        getter encryption_key_override : String?

        # A container type for this batch build that overrides the one specified in the batch build project.

        @[JSON::Field(key: "environmentTypeOverride")]
        getter environment_type_override : String?

        # An array of EnvironmentVariable objects that override, or add to, the environment variables defined
        # in the batch build project.

        @[JSON::Field(key: "environmentVariablesOverride")]
        getter environment_variables_override : Array(Types::EnvironmentVariable)?

        # The user-defined depth of history, with a minimum value of 0, that overrides, for this batch build
        # only, any previous depth of history defined in the batch build project.

        @[JSON::Field(key: "gitCloneDepthOverride")]
        getter git_clone_depth_override : Int32?

        # A GitSubmodulesConfig object that overrides the Git submodules configuration for this batch build.

        @[JSON::Field(key: "gitSubmodulesConfigOverride")]
        getter git_submodules_config_override : Types::GitSubmodulesConfig?

        # A unique, case sensitive identifier you provide to ensure the idempotency of the StartBuildBatch
        # request. The token is included in the StartBuildBatch request and is valid for five minutes. If you
        # repeat the StartBuildBatch request with the same token, but change a parameter, CodeBuild returns a
        # parameter mismatch error.

        @[JSON::Field(key: "idempotencyToken")]
        getter idempotency_token : String?

        # The name of an image for this batch build that overrides the one specified in the batch build
        # project.

        @[JSON::Field(key: "imageOverride")]
        getter image_override : String?

        # The type of credentials CodeBuild uses to pull images in your batch build. There are two valid
        # values: CODEBUILD Specifies that CodeBuild uses its own credentials. This requires that you modify
        # your ECR repository policy to trust CodeBuild's service principal. SERVICE_ROLE Specifies that
        # CodeBuild uses your build project's service role. When using a cross-account or private registry
        # image, you must use SERVICE_ROLE credentials. When using an CodeBuild curated image, you must use
        # CODEBUILD credentials.

        @[JSON::Field(key: "imagePullCredentialsTypeOverride")]
        getter image_pull_credentials_type_override : String?

        # Enable this flag to override the insecure SSL setting that is specified in the batch build project.
        # The insecure SSL setting determines whether to ignore SSL warnings while connecting to the project
        # source code. This override applies only if the build's source is GitHub Enterprise.

        @[JSON::Field(key: "insecureSslOverride")]
        getter insecure_ssl_override : Bool?

        # A LogsConfig object that override the log settings defined in the batch build project.

        @[JSON::Field(key: "logsConfigOverride")]
        getter logs_config_override : Types::LogsConfig?

        # Enable this flag to override privileged mode in the batch build project.

        @[JSON::Field(key: "privilegedModeOverride")]
        getter privileged_mode_override : Bool?

        # The number of minutes a batch build is allowed to be queued before it times out.

        @[JSON::Field(key: "queuedTimeoutInMinutesOverride")]
        getter queued_timeout_in_minutes_override : Int32?

        # A RegistryCredential object that overrides credentials for access to a private registry.

        @[JSON::Field(key: "registryCredentialOverride")]
        getter registry_credential_override : Types::RegistryCredential?

        # Set to true to report to your source provider the status of a batch build's start and completion. If
        # you use this option with a source provider other than GitHub, GitHub Enterprise, or Bitbucket, an
        # invalidInputException is thrown. The status of a build triggered by a webhook is always reported to
        # your source provider.

        @[JSON::Field(key: "reportBuildBatchStatusOverride")]
        getter report_build_batch_status_override : Bool?

        # An array of ProjectArtifacts objects that override the secondary artifacts defined in the batch
        # build project.

        @[JSON::Field(key: "secondaryArtifactsOverride")]
        getter secondary_artifacts_override : Array(Types::ProjectArtifacts)?

        # An array of ProjectSource objects that override the secondary sources defined in the batch build
        # project.

        @[JSON::Field(key: "secondarySourcesOverride")]
        getter secondary_sources_override : Array(Types::ProjectSource)?

        # An array of ProjectSourceVersion objects that override the secondary source versions in the batch
        # build project.

        @[JSON::Field(key: "secondarySourcesVersionOverride")]
        getter secondary_sources_version_override : Array(Types::ProjectSourceVersion)?

        # The name of a service role for this batch build that overrides the one specified in the batch build
        # project.

        @[JSON::Field(key: "serviceRoleOverride")]
        getter service_role_override : String?

        # A SourceAuth object that overrides the one defined in the batch build project. This override applies
        # only if the build project's source is BitBucket or GitHub.

        @[JSON::Field(key: "sourceAuthOverride")]
        getter source_auth_override : Types::SourceAuth?

        # A location that overrides, for this batch build, the source location defined in the batch build
        # project.

        @[JSON::Field(key: "sourceLocationOverride")]
        getter source_location_override : String?

        # The source input type that overrides the source input defined in the batch build project.

        @[JSON::Field(key: "sourceTypeOverride")]
        getter source_type_override : String?

        # The version of the batch build input to be built, for this build only. If not specified, the latest
        # version is used. If specified, the contents depends on the source provider: CodeCommit The commit
        # ID, branch, or Git tag to use. GitHub The commit ID, pull request ID, branch name, or tag name that
        # corresponds to the version of the source code you want to build. If a pull request ID is specified,
        # it must use the format pr/pull-request-ID (for example pr/25 ). If a branch name is specified, the
        # branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.
        # Bitbucket The commit ID, branch name, or tag name that corresponds to the version of the source code
        # you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not
        # specified, the default branch's HEAD commit ID is used. Amazon S3 The version ID of the object that
        # represents the build input ZIP file to use. If sourceVersion is specified at the project level, then
        # this sourceVersion (at the build level) takes precedence. For more information, see Source Version
        # Sample with CodeBuild in the CodeBuild User Guide .

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        def initialize(
          @project_name : String,
          @artifacts_override : Types::ProjectArtifacts? = nil,
          @build_batch_config_override : Types::ProjectBuildBatchConfig? = nil,
          @build_timeout_in_minutes_override : Int32? = nil,
          @buildspec_override : String? = nil,
          @cache_override : Types::ProjectCache? = nil,
          @certificate_override : String? = nil,
          @compute_type_override : String? = nil,
          @debug_session_enabled : Bool? = nil,
          @encryption_key_override : String? = nil,
          @environment_type_override : String? = nil,
          @environment_variables_override : Array(Types::EnvironmentVariable)? = nil,
          @git_clone_depth_override : Int32? = nil,
          @git_submodules_config_override : Types::GitSubmodulesConfig? = nil,
          @idempotency_token : String? = nil,
          @image_override : String? = nil,
          @image_pull_credentials_type_override : String? = nil,
          @insecure_ssl_override : Bool? = nil,
          @logs_config_override : Types::LogsConfig? = nil,
          @privileged_mode_override : Bool? = nil,
          @queued_timeout_in_minutes_override : Int32? = nil,
          @registry_credential_override : Types::RegistryCredential? = nil,
          @report_build_batch_status_override : Bool? = nil,
          @secondary_artifacts_override : Array(Types::ProjectArtifacts)? = nil,
          @secondary_sources_override : Array(Types::ProjectSource)? = nil,
          @secondary_sources_version_override : Array(Types::ProjectSourceVersion)? = nil,
          @service_role_override : String? = nil,
          @source_auth_override : Types::SourceAuth? = nil,
          @source_location_override : String? = nil,
          @source_type_override : String? = nil,
          @source_version : String? = nil
        )
        end
      end


      struct StartBuildBatchOutput
        include JSON::Serializable

        # A BuildBatch object that contains information about the batch build.

        @[JSON::Field(key: "buildBatch")]
        getter build_batch : Types::BuildBatch?

        def initialize(
          @build_batch : Types::BuildBatch? = nil
        )
        end
      end


      struct StartBuildInput
        include JSON::Serializable

        # The name of the CodeBuild build project to start running a build.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # Build output artifact settings that override, for this build only, the latest ones already defined
        # in the build project.

        @[JSON::Field(key: "artifactsOverride")]
        getter artifacts_override : Types::ProjectArtifacts?

        # The maximum number of additional automatic retries after a failed build. For example, if the
        # auto-retry limit is set to 2, CodeBuild will call the RetryBuild API to automatically retry your
        # build for up to 2 additional times.

        @[JSON::Field(key: "autoRetryLimitOverride")]
        getter auto_retry_limit_override : Int32?

        # Contains information that defines how the build project reports the build status to the source
        # provider. This option is only used when the source provider is GITHUB , GITHUB_ENTERPRISE , or
        # BITBUCKET .

        @[JSON::Field(key: "buildStatusConfigOverride")]
        getter build_status_config_override : Types::BuildStatusConfig?

        # A buildspec file declaration that overrides the latest one defined in the build project, for this
        # build only. The buildspec defined on the project is not changed. If this value is set, it can be
        # either an inline buildspec definition, the path to an alternate buildspec file relative to the value
        # of the built-in CODEBUILD_SRC_DIR environment variable, or the path to an S3 bucket. The bucket must
        # be in the same Amazon Web Services Region as the build project. Specify the buildspec file using its
        # ARN (for example, arn:aws:s3:::my-codebuild-sample2/buildspec.yml ). If this value is not provided
        # or is set to an empty string, the source code must contain a buildspec file in its root directory.
        # For more information, see Buildspec File Name and Storage Location . Since this property allows you
        # to change the build commands that will run in the container, you should note that an IAM principal
        # with the ability to call this API and set this parameter can override the default settings.
        # Moreover, we encourage that you use a trustworthy buildspec location like a file in your source
        # repository or a Amazon S3 bucket. Alternatively, you can restrict overrides to the buildspec by
        # using a condition key: Prevent unauthorized modifications to project buildspec .

        @[JSON::Field(key: "buildspecOverride")]
        getter buildspec_override : String?

        # A ProjectCache object specified for this build that overrides the one defined in the build project.

        @[JSON::Field(key: "cacheOverride")]
        getter cache_override : Types::ProjectCache?

        # The name of a certificate for this build that overrides the one specified in the build project.

        @[JSON::Field(key: "certificateOverride")]
        getter certificate_override : String?

        # The name of a compute type for this build that overrides the one specified in the build project.

        @[JSON::Field(key: "computeTypeOverride")]
        getter compute_type_override : String?

        # Specifies if session debugging is enabled for this build. For more information, see Viewing a
        # running build in Session Manager .

        @[JSON::Field(key: "debugSessionEnabled")]
        getter debug_session_enabled : Bool?

        # The Key Management Service customer master key (CMK) that overrides the one specified in the build
        # project. The CMK key encrypts the build output artifacts. You can use a cross-account KMS key to
        # encrypt the build output artifacts if your service role has permission to that key. You can specify
        # either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format
        # alias/&lt;alias-name&gt; ).

        @[JSON::Field(key: "encryptionKeyOverride")]
        getter encryption_key_override : String?

        # A container type for this build that overrides the one specified in the build project.

        @[JSON::Field(key: "environmentTypeOverride")]
        getter environment_type_override : String?

        # A set of environment variables that overrides, for this build only, the latest ones already defined
        # in the build project.

        @[JSON::Field(key: "environmentVariablesOverride")]
        getter environment_variables_override : Array(Types::EnvironmentVariable)?

        # A ProjectFleet object specified for this build that overrides the one defined in the build project.

        @[JSON::Field(key: "fleetOverride")]
        getter fleet_override : Types::ProjectFleet?

        # The user-defined depth of history, with a minimum value of 0, that overrides, for this build only,
        # any previous depth of history defined in the build project.

        @[JSON::Field(key: "gitCloneDepthOverride")]
        getter git_clone_depth_override : Int32?

        # Information about the Git submodules configuration for this build of an CodeBuild build project.

        @[JSON::Field(key: "gitSubmodulesConfigOverride")]
        getter git_submodules_config_override : Types::GitSubmodulesConfig?

        # A unique, case sensitive identifier you provide to ensure the idempotency of the StartBuild request.
        # The token is included in the StartBuild request and is valid for 5 minutes. If you repeat the
        # StartBuild request with the same token, but change a parameter, CodeBuild returns a parameter
        # mismatch error.

        @[JSON::Field(key: "idempotencyToken")]
        getter idempotency_token : String?

        # The name of an image for this build that overrides the one specified in the build project.

        @[JSON::Field(key: "imageOverride")]
        getter image_override : String?

        # The type of credentials CodeBuild uses to pull images in your build. There are two valid values:
        # CODEBUILD Specifies that CodeBuild uses its own credentials. This requires that you modify your ECR
        # repository policy to trust CodeBuild's service principal. SERVICE_ROLE Specifies that CodeBuild uses
        # your build project's service role. When using a cross-account or private registry image, you must
        # use SERVICE_ROLE credentials. When using an CodeBuild curated image, you must use CODEBUILD
        # credentials.

        @[JSON::Field(key: "imagePullCredentialsTypeOverride")]
        getter image_pull_credentials_type_override : String?

        # Enable this flag to override the insecure SSL setting that is specified in the build project. The
        # insecure SSL setting determines whether to ignore SSL warnings while connecting to the project
        # source code. This override applies only if the build's source is GitHub Enterprise.

        @[JSON::Field(key: "insecureSslOverride")]
        getter insecure_ssl_override : Bool?

        # Log settings for this build that override the log settings defined in the build project.

        @[JSON::Field(key: "logsConfigOverride")]
        getter logs_config_override : Types::LogsConfig?

        # Enable this flag to override privileged mode in the build project.

        @[JSON::Field(key: "privilegedModeOverride")]
        getter privileged_mode_override : Bool?

        # The number of minutes a build is allowed to be queued before it times out.

        @[JSON::Field(key: "queuedTimeoutInMinutesOverride")]
        getter queued_timeout_in_minutes_override : Int32?

        # The credentials for access to a private registry.

        @[JSON::Field(key: "registryCredentialOverride")]
        getter registry_credential_override : Types::RegistryCredential?

        # Set to true to report to your source provider the status of a build's start and completion. If you
        # use this option with a source provider other than GitHub, GitHub Enterprise, GitLab, GitLab Self
        # Managed, or Bitbucket, an invalidInputException is thrown. To be able to report the build status to
        # the source provider, the user associated with the source provider must have write access to the
        # repo. If the user does not have write access, the build status cannot be updated. For more
        # information, see Source provider access in the CodeBuild User Guide . The status of a build
        # triggered by a webhook is always reported to your source provider.

        @[JSON::Field(key: "reportBuildStatusOverride")]
        getter report_build_status_override : Bool?

        # An array of ProjectArtifacts objects.

        @[JSON::Field(key: "secondaryArtifactsOverride")]
        getter secondary_artifacts_override : Array(Types::ProjectArtifacts)?

        # An array of ProjectSource objects.

        @[JSON::Field(key: "secondarySourcesOverride")]
        getter secondary_sources_override : Array(Types::ProjectSource)?

        # An array of ProjectSourceVersion objects that specify one or more versions of the project's
        # secondary sources to be used for this build only.

        @[JSON::Field(key: "secondarySourcesVersionOverride")]
        getter secondary_sources_version_override : Array(Types::ProjectSourceVersion)?

        # The name of a service role for this build that overrides the one specified in the build project.

        @[JSON::Field(key: "serviceRoleOverride")]
        getter service_role_override : String?

        # An authorization type for this build that overrides the one defined in the build project. This
        # override applies only if the build project's source is BitBucket, GitHub, GitLab, or GitLab Self
        # Managed.

        @[JSON::Field(key: "sourceAuthOverride")]
        getter source_auth_override : Types::SourceAuth?

        # A location that overrides, for this build, the source location for the one defined in the build
        # project.

        @[JSON::Field(key: "sourceLocationOverride")]
        getter source_location_override : String?

        # A source input type, for this build, that overrides the source input defined in the build project.

        @[JSON::Field(key: "sourceTypeOverride")]
        getter source_type_override : String?

        # The version of the build input to be built, for this build only. If not specified, the latest
        # version is used. If specified, the contents depends on the source provider: CodeCommit The commit
        # ID, branch, or Git tag to use. GitHub The commit ID, pull request ID, branch name, or tag name that
        # corresponds to the version of the source code you want to build. If a pull request ID is specified,
        # it must use the format pr/pull-request-ID (for example pr/25 ). If a branch name is specified, the
        # branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.
        # GitLab The commit ID, branch, or Git tag to use. Bitbucket The commit ID, branch name, or tag name
        # that corresponds to the version of the source code you want to build. If a branch name is specified,
        # the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.
        # Amazon S3 The version ID of the object that represents the build input ZIP file to use. If
        # sourceVersion is specified at the project level, then this sourceVersion (at the build level) takes
        # precedence. For more information, see Source Version Sample with CodeBuild in the CodeBuild User
        # Guide .

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # The number of build timeout minutes, from 5 to 2160 (36 hours), that overrides, for this build only,
        # the latest setting already defined in the build project.

        @[JSON::Field(key: "timeoutInMinutesOverride")]
        getter timeout_in_minutes_override : Int32?

        def initialize(
          @project_name : String,
          @artifacts_override : Types::ProjectArtifacts? = nil,
          @auto_retry_limit_override : Int32? = nil,
          @build_status_config_override : Types::BuildStatusConfig? = nil,
          @buildspec_override : String? = nil,
          @cache_override : Types::ProjectCache? = nil,
          @certificate_override : String? = nil,
          @compute_type_override : String? = nil,
          @debug_session_enabled : Bool? = nil,
          @encryption_key_override : String? = nil,
          @environment_type_override : String? = nil,
          @environment_variables_override : Array(Types::EnvironmentVariable)? = nil,
          @fleet_override : Types::ProjectFleet? = nil,
          @git_clone_depth_override : Int32? = nil,
          @git_submodules_config_override : Types::GitSubmodulesConfig? = nil,
          @idempotency_token : String? = nil,
          @image_override : String? = nil,
          @image_pull_credentials_type_override : String? = nil,
          @insecure_ssl_override : Bool? = nil,
          @logs_config_override : Types::LogsConfig? = nil,
          @privileged_mode_override : Bool? = nil,
          @queued_timeout_in_minutes_override : Int32? = nil,
          @registry_credential_override : Types::RegistryCredential? = nil,
          @report_build_status_override : Bool? = nil,
          @secondary_artifacts_override : Array(Types::ProjectArtifacts)? = nil,
          @secondary_sources_override : Array(Types::ProjectSource)? = nil,
          @secondary_sources_version_override : Array(Types::ProjectSourceVersion)? = nil,
          @service_role_override : String? = nil,
          @source_auth_override : Types::SourceAuth? = nil,
          @source_location_override : String? = nil,
          @source_type_override : String? = nil,
          @source_version : String? = nil,
          @timeout_in_minutes_override : Int32? = nil
        )
        end
      end


      struct StartBuildOutput
        include JSON::Serializable

        # Information about the build to be run.

        @[JSON::Field(key: "build")]
        getter build : Types::Build?

        def initialize(
          @build : Types::Build? = nil
        )
        end
      end


      struct StartCommandExecutionInput
        include JSON::Serializable

        # The command that needs to be executed.

        @[JSON::Field(key: "command")]
        getter command : String

        # A sandboxId or sandboxArn .

        @[JSON::Field(key: "sandboxId")]
        getter sandbox_id : String

        # The command type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @command : String,
          @sandbox_id : String,
          @type : String? = nil
        )
        end
      end


      struct StartCommandExecutionOutput
        include JSON::Serializable

        # Information about the requested command executions.

        @[JSON::Field(key: "commandExecution")]
        getter command_execution : Types::CommandExecution?

        def initialize(
          @command_execution : Types::CommandExecution? = nil
        )
        end
      end


      struct StartSandboxConnectionInput
        include JSON::Serializable

        # A sandboxId or sandboxArn .

        @[JSON::Field(key: "sandboxId")]
        getter sandbox_id : String

        def initialize(
          @sandbox_id : String
        )
        end
      end


      struct StartSandboxConnectionOutput
        include JSON::Serializable

        # Information about the Session Manager session.

        @[JSON::Field(key: "ssmSession")]
        getter ssm_session : Types::SSMSession?

        def initialize(
          @ssm_session : Types::SSMSession? = nil
        )
        end
      end


      struct StartSandboxInput
        include JSON::Serializable

        # A unique client token.

        @[JSON::Field(key: "idempotencyToken")]
        getter idempotency_token : String?

        # The CodeBuild project name.

        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        def initialize(
          @idempotency_token : String? = nil,
          @project_name : String? = nil
        )
        end
      end


      struct StartSandboxOutput
        include JSON::Serializable

        # Information about the requested sandbox.

        @[JSON::Field(key: "sandbox")]
        getter sandbox : Types::Sandbox?

        def initialize(
          @sandbox : Types::Sandbox? = nil
        )
        end
      end


      struct StopBuildBatchInput
        include JSON::Serializable

        # The identifier of the batch build to stop.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct StopBuildBatchOutput
        include JSON::Serializable


        @[JSON::Field(key: "buildBatch")]
        getter build_batch : Types::BuildBatch?

        def initialize(
          @build_batch : Types::BuildBatch? = nil
        )
        end
      end


      struct StopBuildInput
        include JSON::Serializable

        # The ID of the build.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct StopBuildOutput
        include JSON::Serializable

        # Information about the build.

        @[JSON::Field(key: "build")]
        getter build : Types::Build?

        def initialize(
          @build : Types::Build? = nil
        )
        end
      end


      struct StopSandboxInput
        include JSON::Serializable

        # Information about the requested sandbox ID.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct StopSandboxOutput
        include JSON::Serializable

        # Information about the requested sandbox.

        @[JSON::Field(key: "sandbox")]
        getter sandbox : Types::Sandbox?

        def initialize(
          @sandbox : Types::Sandbox? = nil
        )
        end
      end

      # A tag, consisting of a key and a value. This tag is available for use by Amazon Web Services
      # services that support tags in CodeBuild.

      struct Tag
        include JSON::Serializable

        # The tag's key.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The tag's value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Defines when a new instance is auto-scaled into the compute fleet.

      struct TargetTrackingScalingConfiguration
        include JSON::Serializable

        # The metric type to determine auto-scaling.

        @[JSON::Field(key: "metricType")]
        getter metric_type : String?

        # The value of metricType when to start scaling.

        @[JSON::Field(key: "targetValue")]
        getter target_value : Float64?

        def initialize(
          @metric_type : String? = nil,
          @target_value : Float64? = nil
        )
        end
      end

      # Information about a test case created using a framework such as NUnit or Cucumber. A test case might
      # be a unit test or a configuration test.

      struct TestCase
        include JSON::Serializable

        # The number of nanoseconds it took to run this test case.

        @[JSON::Field(key: "durationInNanoSeconds")]
        getter duration_in_nano_seconds : Int64?

        # The date and time a test case expires. A test case expires 30 days after it is created. An expired
        # test case is not available to view in CodeBuild.

        @[JSON::Field(key: "expired", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expired : Time?

        # A message associated with a test case. For example, an error message or stack trace.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the test case.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A string that is applied to a series of related test cases. CodeBuild generates the prefix. The
        # prefix depends on the framework used to generate the tests.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # The ARN of the report to which the test case belongs.

        @[JSON::Field(key: "reportArn")]
        getter report_arn : String?

        # The status returned by the test case after it was run. Valid statuses are SUCCEEDED , FAILED , ERROR
        # , SKIPPED , and UNKNOWN .

        @[JSON::Field(key: "status")]
        getter status : String?

        # The path to the raw data file that contains the test result.

        @[JSON::Field(key: "testRawDataPath")]
        getter test_raw_data_path : String?

        # The name of the test suite that the test case is a part of.

        @[JSON::Field(key: "testSuiteName")]
        getter test_suite_name : String?

        def initialize(
          @duration_in_nano_seconds : Int64? = nil,
          @expired : Time? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @prefix : String? = nil,
          @report_arn : String? = nil,
          @status : String? = nil,
          @test_raw_data_path : String? = nil,
          @test_suite_name : String? = nil
        )
        end
      end

      # A filter used to return specific types of test cases. In order to pass the filter, the report must
      # meet all of the filter properties.

      struct TestCaseFilter
        include JSON::Serializable

        # A keyword that is used to filter on the name or the prefix of the test cases. Only test cases where
        # the keyword is a substring of the name or the prefix will be returned.

        @[JSON::Field(key: "keyword")]
        getter keyword : String?

        # The status used to filter test cases. A TestCaseFilter can have one status. Valid values are:
        # SUCCEEDED FAILED ERROR SKIPPED UNKNOWN

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @keyword : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a test report.

      struct TestReportSummary
        include JSON::Serializable

        # The number of nanoseconds it took to run all of the test cases in this report.

        @[JSON::Field(key: "durationInNanoSeconds")]
        getter duration_in_nano_seconds : Int64

        # A map that contains the number of each type of status returned by the test results in this
        # TestReportSummary .

        @[JSON::Field(key: "statusCounts")]
        getter status_counts : Hash(String, Int32)

        # The number of test cases in this TestReportSummary . The total includes truncated test cases.

        @[JSON::Field(key: "total")]
        getter total : Int32

        def initialize(
          @duration_in_nano_seconds : Int64,
          @status_counts : Hash(String, Int32),
          @total : Int32
        )
        end
      end


      struct UpdateFleetInput
        include JSON::Serializable

        # The ARN of the compute fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The initial number of machines allocated to the compute ﬂeet, which deﬁnes the number of builds that
        # can run in parallel.

        @[JSON::Field(key: "baseCapacity")]
        getter base_capacity : Int32?

        # The compute configuration of the compute fleet. This is only required if computeType is set to
        # ATTRIBUTE_BASED_COMPUTE or CUSTOM_INSTANCE_TYPE .

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ComputeConfiguration?

        # Information about the compute resources the compute fleet uses. Available values include:
        # ATTRIBUTE_BASED_COMPUTE : Specify the amount of vCPUs, memory, disk space, and the type of machine.
        # If you use ATTRIBUTE_BASED_COMPUTE , you must define your attributes by using computeConfiguration .
        # CodeBuild will select the cheapest instance that satisfies your specified attributes. For more
        # information, see Reserved capacity environment types in the CodeBuild User Guide .
        # CUSTOM_INSTANCE_TYPE : Specify the instance type for your compute fleet. For a list of supported
        # instance types, see Supported instance families in the CodeBuild User Guide . BUILD_GENERAL1_SMALL :
        # Use up to 4 GiB memory and 2 vCPUs for builds. BUILD_GENERAL1_MEDIUM : Use up to 8 GiB memory and 4
        # vCPUs for builds. BUILD_GENERAL1_LARGE : Use up to 16 GiB memory and 8 vCPUs for builds, depending
        # on your environment type. BUILD_GENERAL1_XLARGE : Use up to 72 GiB memory and 36 vCPUs for builds,
        # depending on your environment type. BUILD_GENERAL1_2XLARGE : Use up to 144 GiB memory, 72 vCPUs, and
        # 824 GB of SSD storage for builds. This compute type supports Docker images up to 100 GB
        # uncompressed. BUILD_LAMBDA_1GB : Use up to 1 GiB memory for builds. Only available for environment
        # type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_2GB : Use up to 2 GiB memory for
        # builds. Only available for environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER .
        # BUILD_LAMBDA_4GB : Use up to 4 GiB memory for builds. Only available for environment type
        # LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . BUILD_LAMBDA_8GB : Use up to 8 GiB memory for
        # builds. Only available for environment type LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER .
        # BUILD_LAMBDA_10GB : Use up to 10 GiB memory for builds. Only available for environment type
        # LINUX_LAMBDA_CONTAINER and ARM_LAMBDA_CONTAINER . If you use BUILD_GENERAL1_SMALL : For environment
        # type LINUX_CONTAINER , you can use up to 4 GiB memory and 2 vCPUs for builds. For environment type
        # LINUX_GPU_CONTAINER , you can use up to 16 GiB memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU
        # for builds. For environment type ARM_CONTAINER , you can use up to 4 GiB memory and 2 vCPUs on
        # ARM-based processors for builds. If you use BUILD_GENERAL1_LARGE : For environment type
        # LINUX_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs for builds. For environment type
        # LINUX_GPU_CONTAINER , you can use up to 255 GiB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for
        # builds. For environment type ARM_CONTAINER , you can use up to 16 GiB memory and 8 vCPUs on
        # ARM-based processors for builds. For more information, see On-demand environment types in the
        # CodeBuild User Guide.

        @[JSON::Field(key: "computeType")]
        getter compute_type : String?

        # The environment type of the compute fleet. The environment type ARM_CONTAINER is available only in
        # regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia Pacific
        # (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and
        # South America (São Paulo). The environment type ARM_EC2 is available only in regions US East (N.
        # Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo),
        # Asia Pacific (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific
        # (Mumbai). The environment type LINUX_CONTAINER is available only in regions US East (N. Virginia),
        # US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific
        # (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific (Mumbai). The
        # environment type LINUX_EC2 is available only in regions US East (N. Virginia), US East (Ohio), US
        # West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Singapore), Asia
        # Pacific (Sydney), South America (São Paulo), and Asia Pacific (Mumbai). The environment type
        # LINUX_GPU_CONTAINER is available only in regions US East (N. Virginia), US East (Ohio), US West
        # (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), and Asia Pacific (Sydney). The
        # environment type MAC_ARM is available for Medium fleets only in regions US East (N. Virginia), US
        # East (Ohio), US West (Oregon), Asia Pacific (Sydney), and EU (Frankfurt) The environment type
        # MAC_ARM is available for Large fleets only in regions US East (N. Virginia), US East (Ohio), US West
        # (Oregon), and Asia Pacific (Sydney). The environment type WINDOWS_EC2 is available only in regions
        # US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific
        # (Tokyo), Asia Pacific (Singapore), Asia Pacific (Sydney), South America (São Paulo), and Asia
        # Pacific (Mumbai). The environment type WINDOWS_SERVER_2019_CONTAINER is available only in regions US
        # East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Sydney), Asia Pacific (Tokyo),
        # Asia Pacific (Mumbai) and EU (Ireland). The environment type WINDOWS_SERVER_2022_CONTAINER is
        # available only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), EU
        # (Frankfurt), Asia Pacific (Sydney), Asia Pacific (Singapore), Asia Pacific (Tokyo), South America
        # (São Paulo) and Asia Pacific (Mumbai). For more information, see Build environment compute types in
        # the CodeBuild user guide .

        @[JSON::Field(key: "environmentType")]
        getter environment_type : String?

        # The service role associated with the compute fleet. For more information, see Allow a user to add a
        # permission policy for a fleet service role in the CodeBuild User Guide .

        @[JSON::Field(key: "fleetServiceRole")]
        getter fleet_service_role : String?

        # The Amazon Machine Image (AMI) of the compute fleet.

        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The compute fleet overflow behavior. For overflow behavior QUEUE , your overflow builds need to wait
        # on the existing fleet instance to become available. For overflow behavior ON_DEMAND , your overflow
        # builds run on CodeBuild on-demand. If you choose to set your overflow behavior to on-demand while
        # creating a VPC-connected fleet, make sure that you add the required VPC permissions to your project
        # service role. For more information, see Example policy statement to allow CodeBuild access to Amazon
        # Web Services services required to create a VPC network interface .

        @[JSON::Field(key: "overflowBehavior")]
        getter overflow_behavior : String?

        # The proxy configuration of the compute fleet.

        @[JSON::Field(key: "proxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # The scaling configuration of the compute fleet.

        @[JSON::Field(key: "scalingConfiguration")]
        getter scaling_configuration : Types::ScalingConfigurationInput?

        # A list of tag key and value pairs associated with this compute fleet. These tags are available for
        # use by Amazon Web Services services that support CodeBuild build project tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?


        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @arn : String,
          @base_capacity : Int32? = nil,
          @compute_configuration : Types::ComputeConfiguration? = nil,
          @compute_type : String? = nil,
          @environment_type : String? = nil,
          @fleet_service_role : String? = nil,
          @image_id : String? = nil,
          @overflow_behavior : String? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @scaling_configuration : Types::ScalingConfigurationInput? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct UpdateFleetOutput
        include JSON::Serializable

        # A Fleet object.

        @[JSON::Field(key: "fleet")]
        getter fleet : Types::Fleet?

        def initialize(
          @fleet : Types::Fleet? = nil
        )
        end
      end


      struct UpdateProjectInput
        include JSON::Serializable

        # The name of the build project. You cannot change a build project's name.

        @[JSON::Field(key: "name")]
        getter name : String

        # Information to be changed about the build output artifacts for the build project.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Types::ProjectArtifacts?

        # The maximum number of additional automatic retries after a failed build. For example, if the
        # auto-retry limit is set to 2, CodeBuild will call the RetryBuild API to automatically retry your
        # build for up to 2 additional times.

        @[JSON::Field(key: "autoRetryLimit")]
        getter auto_retry_limit : Int32?

        # Set this to true to generate a publicly accessible URL for your project's build badge.

        @[JSON::Field(key: "badgeEnabled")]
        getter badge_enabled : Bool?


        @[JSON::Field(key: "buildBatchConfig")]
        getter build_batch_config : Types::ProjectBuildBatchConfig?

        # Stores recently used information so that it can be quickly accessed at a later time.

        @[JSON::Field(key: "cache")]
        getter cache : Types::ProjectCache?

        # The maximum number of concurrent builds that are allowed for this project. New builds are only
        # started if the current number of builds is less than or equal to this limit. If the current build
        # count meets this limit, new builds are throttled and are not run. To remove this limit, set this
        # value to -1.

        @[JSON::Field(key: "concurrentBuildLimit")]
        getter concurrent_build_limit : Int32?

        # A new or replacement description of the build project.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Key Management Service customer master key (CMK) to be used for encrypting the build output
        # artifacts. You can use a cross-account KMS key to encrypt the build output artifacts if your service
        # role has permission to that key. You can specify either the Amazon Resource Name (ARN) of the CMK
        # or, if available, the CMK's alias (using the format alias/&lt;alias-name&gt; ).

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # Information to be changed about the build environment for the build project.

        @[JSON::Field(key: "environment")]
        getter environment : Types::ProjectEnvironment?

        # An array of ProjectFileSystemLocation objects for a CodeBuild build project. A
        # ProjectFileSystemLocation object specifies the identifier , location , mountOptions , mountPoint ,
        # and type of a file system created using Amazon Elastic File System.

        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::ProjectFileSystemLocation)?

        # Information about logs for the build project. A project can create logs in CloudWatch Logs, logs in
        # an S3 bucket, or both.

        @[JSON::Field(key: "logsConfig")]
        getter logs_config : Types::LogsConfig?

        # The number of minutes a build is allowed to be queued before it times out.

        @[JSON::Field(key: "queuedTimeoutInMinutes")]
        getter queued_timeout_in_minutes : Int32?

        # An array of ProjectArtifact objects.

        @[JSON::Field(key: "secondaryArtifacts")]
        getter secondary_artifacts : Array(Types::ProjectArtifacts)?

        # An array of ProjectSourceVersion objects. If secondarySourceVersions is specified at the build
        # level, then they take over these secondarySourceVersions (at the project level).

        @[JSON::Field(key: "secondarySourceVersions")]
        getter secondary_source_versions : Array(Types::ProjectSourceVersion)?

        # An array of ProjectSource objects.

        @[JSON::Field(key: "secondarySources")]
        getter secondary_sources : Array(Types::ProjectSource)?

        # The replacement ARN of the IAM role that enables CodeBuild to interact with dependent Amazon Web
        # Services services on behalf of the Amazon Web Services account.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # Information to be changed about the build input source code for the build project.

        @[JSON::Field(key: "source")]
        getter source : Types::ProjectSource?

        # A version of the build input to be built for this project. If not specified, the latest version is
        # used. If specified, it must be one of: For CodeCommit: the commit ID, branch, or Git tag to use. For
        # GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of
        # the source code you want to build. If a pull request ID is specified, it must use the format
        # pr/pull-request-ID (for example pr/25 ). If a branch name is specified, the branch's HEAD commit ID
        # is used. If not specified, the default branch's HEAD commit ID is used. For GitLab: the commit ID,
        # branch, or Git tag to use. For Bitbucket: the commit ID, branch name, or tag name that corresponds
        # to the version of the source code you want to build. If a branch name is specified, the branch's
        # HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used. For Amazon
        # S3: the version ID of the object that represents the build input ZIP file to use. If sourceVersion
        # is specified at the build level, then that version takes precedence over this sourceVersion (at the
        # project level). For more information, see Source Version Sample with CodeBuild in the CodeBuild User
        # Guide .

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        # An updated list of tag key and value pairs associated with this build project. These tags are
        # available for use by Amazon Web Services services that support CodeBuild build project tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The replacement value in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait before timing out
        # any related build that did not get marked as completed.

        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        # VpcConfig enables CodeBuild to access resources in an Amazon VPC.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @name : String,
          @artifacts : Types::ProjectArtifacts? = nil,
          @auto_retry_limit : Int32? = nil,
          @badge_enabled : Bool? = nil,
          @build_batch_config : Types::ProjectBuildBatchConfig? = nil,
          @cache : Types::ProjectCache? = nil,
          @concurrent_build_limit : Int32? = nil,
          @description : String? = nil,
          @encryption_key : String? = nil,
          @environment : Types::ProjectEnvironment? = nil,
          @file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
          @logs_config : Types::LogsConfig? = nil,
          @queued_timeout_in_minutes : Int32? = nil,
          @secondary_artifacts : Array(Types::ProjectArtifacts)? = nil,
          @secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
          @secondary_sources : Array(Types::ProjectSource)? = nil,
          @service_role : String? = nil,
          @source : Types::ProjectSource? = nil,
          @source_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_in_minutes : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct UpdateProjectOutput
        include JSON::Serializable

        # Information about the build project that was changed.

        @[JSON::Field(key: "project")]
        getter project : Types::Project?

        def initialize(
          @project : Types::Project? = nil
        )
        end
      end


      struct UpdateProjectVisibilityInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the build project.

        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "projectVisibility")]
        getter project_visibility : String

        # The ARN of the IAM role that enables CodeBuild to access the CloudWatch Logs and Amazon S3 artifacts
        # for the project's builds.

        @[JSON::Field(key: "resourceAccessRole")]
        getter resource_access_role : String?

        def initialize(
          @project_arn : String,
          @project_visibility : String,
          @resource_access_role : String? = nil
        )
        end
      end


      struct UpdateProjectVisibilityOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the build project.

        @[JSON::Field(key: "projectArn")]
        getter project_arn : String?


        @[JSON::Field(key: "projectVisibility")]
        getter project_visibility : String?

        # Contains the project identifier used with the public build APIs.

        @[JSON::Field(key: "publicProjectAlias")]
        getter public_project_alias : String?

        def initialize(
          @project_arn : String? = nil,
          @project_visibility : String? = nil,
          @public_project_alias : String? = nil
        )
        end
      end


      struct UpdateReportGroupInput
        include JSON::Serializable

        # The ARN of the report group to update.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # Used to specify an updated export type. Valid values are: S3 : The report results are exported to an
        # S3 bucket. NO_EXPORT : The report results are not exported.

        @[JSON::Field(key: "exportConfig")]
        getter export_config : Types::ReportExportConfig?

        # An updated list of tag key and value pairs associated with this report group. These tags are
        # available for use by Amazon Web Services services that support CodeBuild report group tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String,
          @export_config : Types::ReportExportConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct UpdateReportGroupOutput
        include JSON::Serializable

        # Information about the updated report group.

        @[JSON::Field(key: "reportGroup")]
        getter report_group : Types::ReportGroup?

        def initialize(
          @report_group : Types::ReportGroup? = nil
        )
        end
      end


      struct UpdateWebhookInput
        include JSON::Serializable

        # The name of the CodeBuild project.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # A regular expression used to determine which repository branches are built when a webhook is
        # triggered. If the name of a branch matches the regular expression, then it is built. If branchFilter
        # is empty, then all branches are built. It is recommended that you use filterGroups instead of
        # branchFilter .

        @[JSON::Field(key: "branchFilter")]
        getter branch_filter : String?

        # Specifies the type of build this webhook will trigger. RUNNER_BUILDKITE_BUILD is only available for
        # NO_SOURCE source type projects configured for Buildkite runner builds. For more information about
        # CodeBuild-hosted Buildkite runner builds, see Tutorial: Configure a CodeBuild-hosted Buildkite
        # runner in the CodeBuild user guide .

        @[JSON::Field(key: "buildType")]
        getter build_type : String?

        # An array of arrays of WebhookFilter objects used to determine if a webhook event can trigger a
        # build. A filter group must contain at least one EVENT WebhookFilter .

        @[JSON::Field(key: "filterGroups")]
        getter filter_groups : Array(Array(Types::WebhookFilter))?

        # A PullRequestBuildPolicy object that defines comment-based approval requirements for triggering
        # builds on pull requests. This policy helps control when automated builds are executed based on
        # contributor permissions and approval workflows.

        @[JSON::Field(key: "pullRequestBuildPolicy")]
        getter pull_request_build_policy : Types::PullRequestBuildPolicy?

        # A boolean value that specifies whether the associated GitHub repository's secret token should be
        # updated. If you use Bitbucket for your repository, rotateSecret is ignored.

        @[JSON::Field(key: "rotateSecret")]
        getter rotate_secret : Bool?

        def initialize(
          @project_name : String,
          @branch_filter : String? = nil,
          @build_type : String? = nil,
          @filter_groups : Array(Array(Types::WebhookFilter))? = nil,
          @pull_request_build_policy : Types::PullRequestBuildPolicy? = nil,
          @rotate_secret : Bool? = nil
        )
        end
      end


      struct UpdateWebhookOutput
        include JSON::Serializable

        # Information about a repository's webhook that is associated with a project in CodeBuild.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::Webhook?

        def initialize(
          @webhook : Types::Webhook? = nil
        )
        end
      end

      # Information about the VPC configuration that CodeBuild accesses.

      struct VpcConfig
        include JSON::Serializable

        # A list of one or more security groups IDs in your Amazon VPC.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of one or more subnet IDs in your Amazon VPC.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # The ID of the Amazon VPC.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnets : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Information about a webhook that connects repository events to a build project in CodeBuild.

      struct Webhook
        include JSON::Serializable

        # A regular expression used to determine which repository branches are built when a webhook is
        # triggered. If the name of a branch matches the regular expression, then it is built. If branchFilter
        # is empty, then all branches are built. It is recommended that you use filterGroups instead of
        # branchFilter .

        @[JSON::Field(key: "branchFilter")]
        getter branch_filter : String?

        # Specifies the type of build this webhook will trigger. RUNNER_BUILDKITE_BUILD is only available for
        # NO_SOURCE source type projects configured for Buildkite runner builds. For more information about
        # CodeBuild-hosted Buildkite runner builds, see Tutorial: Configure a CodeBuild-hosted Buildkite
        # runner in the CodeBuild user guide .

        @[JSON::Field(key: "buildType")]
        getter build_type : String?

        # An array of arrays of WebhookFilter objects used to determine which webhooks are triggered. At least
        # one WebhookFilter in the array must specify EVENT as its type . For a build to be triggered, at
        # least one filter group in the filterGroups array must pass. For a filter group to pass, each of its
        # filters must pass.

        @[JSON::Field(key: "filterGroups")]
        getter filter_groups : Array(Array(Types::WebhookFilter))?

        # A timestamp that indicates the last time a repository's secret token was modified.

        @[JSON::Field(key: "lastModifiedSecret", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_secret : Time?

        # If manualCreation is true, CodeBuild doesn't create a webhook in GitHub and instead returns
        # payloadUrl and secret values for the webhook. The payloadUrl and secret values in the output can be
        # used to manually create a webhook within GitHub. manualCreation is only available for GitHub
        # webhooks.

        @[JSON::Field(key: "manualCreation")]
        getter manual_creation : Bool?

        # The CodeBuild endpoint where webhook events are sent.

        @[JSON::Field(key: "payloadUrl")]
        getter payload_url : String?


        @[JSON::Field(key: "pullRequestBuildPolicy")]
        getter pull_request_build_policy : Types::PullRequestBuildPolicy?

        # The scope configuration for global or organization webhooks. Global or organization webhooks are
        # only available for GitHub and Github Enterprise webhooks.

        @[JSON::Field(key: "scopeConfiguration")]
        getter scope_configuration : Types::ScopeConfiguration?

        # The secret token of the associated repository. A Bitbucket webhook does not support secret .

        @[JSON::Field(key: "secret")]
        getter secret : String?

        # The status of the webhook. Valid values include: CREATING : The webhook is being created.
        # CREATE_FAILED : The webhook has failed to create. ACTIVE : The webhook has succeeded and is active.
        # DELETING : The webhook is being deleted.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A message associated with the status of a webhook.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The URL to the webhook.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @branch_filter : String? = nil,
          @build_type : String? = nil,
          @filter_groups : Array(Array(Types::WebhookFilter))? = nil,
          @last_modified_secret : Time? = nil,
          @manual_creation : Bool? = nil,
          @payload_url : String? = nil,
          @pull_request_build_policy : Types::PullRequestBuildPolicy? = nil,
          @scope_configuration : Types::ScopeConfiguration? = nil,
          @secret : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @url : String? = nil
        )
        end
      end

      # A filter used to determine which webhooks trigger a build.

      struct WebhookFilter
        include JSON::Serializable

        # For a WebHookFilter that uses EVENT type, a comma-separated string that specifies one or more
        # events. For example, the webhook filter PUSH, PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED allows all
        # push, pull request created, and pull request updated events to trigger a build. For a WebHookFilter
        # that uses any of the other filter types, a regular expression pattern. For example, a WebHookFilter
        # that uses HEAD_REF for its type and the pattern ^refs/heads/ triggers a build when the head
        # reference is a branch with a reference name refs/heads/branch-name .

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        # The type of webhook filter. There are 11 webhook filter types: EVENT , ACTOR_ACCOUNT_ID , HEAD_REF ,
        # BASE_REF , FILE_PATH , COMMIT_MESSAGE , TAG_NAME , RELEASE_NAME , REPOSITORY_NAME ,
        # ORGANIZATION_NAME , and WORKFLOW_NAME . EVENT A webhook event triggers a build when the provided
        # pattern matches one of nine event types: PUSH , PULL_REQUEST_CREATED , PULL_REQUEST_UPDATED ,
        # PULL_REQUEST_CLOSED , PULL_REQUEST_REOPENED , PULL_REQUEST_MERGED , RELEASED , PRERELEASED , and
        # WORKFLOW_JOB_QUEUED . The EVENT patterns are specified as a comma-separated string. For example,
        # PUSH, PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED filters all push, pull request created, and pull
        # request updated events. Types PULL_REQUEST_REOPENED and WORKFLOW_JOB_QUEUED work with GitHub and
        # GitHub Enterprise only. Types RELEASED and PRERELEASED work with GitHub only. ACTOR_ACCOUNT_ID A
        # webhook event triggers a build when a GitHub, GitHub Enterprise, or Bitbucket account ID matches the
        # regular expression pattern . HEAD_REF A webhook event triggers a build when the head reference
        # matches the regular expression pattern . For example, refs/heads/branch-name and refs/tags/tag-name
        # . Works with GitHub and GitHub Enterprise push, GitHub and GitHub Enterprise pull request, Bitbucket
        # push, and Bitbucket pull request events. BASE_REF A webhook event triggers a build when the base
        # reference matches the regular expression pattern . For example, refs/heads/branch-name . Works with
        # pull request events only. FILE_PATH A webhook triggers a build when the path of a changed file
        # matches the regular expression pattern . Works with push and pull request events only.
        # COMMIT_MESSAGE A webhook triggers a build when the head commit message matches the regular
        # expression pattern . Works with push and pull request events only. TAG_NAME A webhook triggers a
        # build when the tag name of the release matches the regular expression pattern . Works with RELEASED
        # and PRERELEASED events only. RELEASE_NAME A webhook triggers a build when the release name matches
        # the regular expression pattern . Works with RELEASED and PRERELEASED events only. REPOSITORY_NAME A
        # webhook triggers a build when the repository name matches the regular expression pattern . Works
        # with GitHub global or organization webhooks only. ORGANIZATION_NAME A webhook triggers a build when
        # the organization name matches the regular expression pattern . Works with GitHub global webhooks
        # only. WORKFLOW_NAME A webhook triggers a build when the workflow name matches the regular expression
        # pattern . Works with WORKFLOW_JOB_QUEUED events only. For CodeBuild-hosted Buildkite runner builds,
        # WORKFLOW_NAME filters will filter by pipeline name.

        @[JSON::Field(key: "type")]
        getter type : String

        # Used to indicate that the pattern determines which webhook events do not trigger a build. If true,
        # then a webhook event that does not match the pattern triggers a build. If false, then a webhook
        # event that matches the pattern triggers a build.

        @[JSON::Field(key: "excludeMatchedPattern")]
        getter exclude_matched_pattern : Bool?

        def initialize(
          @pattern : String,
          @type : String,
          @exclude_matched_pattern : Bool? = nil
        )
        end
      end
    end
  end
end
