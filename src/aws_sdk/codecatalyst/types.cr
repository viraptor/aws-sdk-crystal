require "json"
require "time"

module AwsSdk
  module CodeCatalyst
    module Types

      # The request was denied because you don't have sufficient access to perform this action. Verify that
      # you are a member of a role that allows this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about a specified personal access token (PAT).
      struct AccessTokenSummary
        include JSON::Serializable

        # The system-generated ID of the personal access token.
        @[JSON::Field(key: "id")]
        getter id : String

        # The friendly name of the personal access token.
        @[JSON::Field(key: "name")]
        getter name : String

        # The date and time when the personal access token will expire, in coordinated universal time (UTC)
        # timestamp format as specified in RFC 3339 .
        @[JSON::Field(key: "expiresTime")]
        getter expires_time : Time?

        def initialize(
          @id : String,
          @name : String,
          @expires_time : Time? = nil
        )
        end
      end

      # The request was denied because the requested operation would cause a conflict with the current state
      # of a service resource associated with the request. Another user might have updated the resource.
      # Reload, make sure you have the latest data, and then try again.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateAccessTokenRequest
        include JSON::Serializable

        # The friendly name of the personal access token.
        @[JSON::Field(key: "name")]
        getter name : String

        # The date and time the personal access token expires, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339 .
        @[JSON::Field(key: "expiresTime")]
        getter expires_time : Time?

        def initialize(
          @name : String,
          @expires_time : Time? = nil
        )
        end
      end

      struct CreateAccessTokenResponse
        include JSON::Serializable

        # The system-generated unique ID of the access token.
        @[JSON::Field(key: "accessTokenId")]
        getter access_token_id : String

        # The date and time the personal access token expires, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339 . If not specified, the default is one year from creation.
        @[JSON::Field(key: "expiresTime")]
        getter expires_time : Time

        # The friendly name of the personal access token.
        @[JSON::Field(key: "name")]
        getter name : String

        # The secret value of the personal access token.
        @[JSON::Field(key: "secret")]
        getter secret : String

        def initialize(
          @access_token_id : String,
          @expires_time : Time,
          @name : String,
          @secret : String
        )
        end
      end

      struct CreateDevEnvironmentRequest
        include JSON::Serializable

        # The Amazon EC2 instace type to use for the Dev Environment.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # Information about the amount of storage allocated to the Dev Environment. By default, a Dev
        # Environment is configured to have 16GB of persistent storage when created from the Amazon
        # CodeCatalyst console, but there is no default when programmatically creating a Dev Environment.
        # Valid values for persistent storage are based on memory sizes in 16GB increments. Valid values are
        # 16, 32, and 64.
        @[JSON::Field(key: "persistentStorage")]
        getter persistent_storage : Types::PersistentStorageConfiguration

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The user-defined alias for a Dev Environment.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A user-specified idempotency token. Idempotency ensures that an API request completes only once.
        # With an idempotent request, if the original request completes successfully, the subsequent retries
        # return the result from the original successful request and have no additional effect.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Information about the integrated development environment (IDE) configured for a Dev Environment. An
        # IDE is required to create a Dev Environment. For Dev Environment creation, this field contains
        # configuration information and must be provided.
        @[JSON::Field(key: "ides")]
        getter ides : Array(Types::IdeConfiguration)?

        # The amount of time the Dev Environment will run without any activity detected before stopping, in
        # minutes. Only whole integers are allowed. Dev Environments consume compute minutes when running.
        @[JSON::Field(key: "inactivityTimeoutMinutes")]
        getter inactivity_timeout_minutes : Int32?

        # The source repository that contains the branch to clone into the Dev Environment.
        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::RepositoryInput)?

        # The name of the connection that will be used to connect to Amazon VPC, if any.
        @[JSON::Field(key: "vpcConnectionName")]
        getter vpc_connection_name : String?

        def initialize(
          @instance_type : String,
          @persistent_storage : Types::PersistentStorageConfiguration,
          @project_name : String,
          @space_name : String,
          @alias : String? = nil,
          @client_token : String? = nil,
          @ides : Array(Types::IdeConfiguration)? = nil,
          @inactivity_timeout_minutes : Int32? = nil,
          @repositories : Array(Types::RepositoryInput)? = nil,
          @vpc_connection_name : String? = nil
        )
        end
      end

      struct CreateDevEnvironmentResponse
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The name of the connection used to connect to Amazon VPC used when the Dev Environment was created,
        # if any.
        @[JSON::Field(key: "vpcConnectionName")]
        getter vpc_connection_name : String?

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String,
          @vpc_connection_name : String? = nil
        )
        end
      end

      struct CreateProjectRequest
        include JSON::Serializable

        # The friendly name of the project that will be displayed to users.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The description of the project. This description will be displayed to all users of the project. We
        # recommend providing a brief description of the project and its intended purpose.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @display_name : String,
          @space_name : String,
          @description : String? = nil
        )
        end
      end

      struct CreateProjectResponse
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The friendly name of the project.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @space_name : String? = nil
        )
        end
      end

      struct CreateSourceRepositoryBranchRequest
        include JSON::Serializable

        # The name for the branch you're creating.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the repository where you want to create a branch.
        @[JSON::Field(key: "sourceRepositoryName")]
        getter source_repository_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The commit ID in an existing branch from which you want to create the new branch.
        @[JSON::Field(key: "headCommitId")]
        getter head_commit_id : String?

        def initialize(
          @name : String,
          @project_name : String,
          @source_repository_name : String,
          @space_name : String,
          @head_commit_id : String? = nil
        )
        end
      end

      struct CreateSourceRepositoryBranchResponse
        include JSON::Serializable

        # The commit ID of the tip of the newly created branch.
        @[JSON::Field(key: "headCommitId")]
        getter head_commit_id : String?

        # The time the branch was last updated, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339 .
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the newly created branch.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Git reference name of the branch.
        @[JSON::Field(key: "ref")]
        getter ref : String?

        def initialize(
          @head_commit_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @ref : String? = nil
        )
        end
      end

      struct CreateSourceRepositoryRequest
        include JSON::Serializable

        # The name of the source repository. For more information about name requirements, see Quotas for
        # source repositories .
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The description of the source repository.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @project_name : String,
          @space_name : String,
          @description : String? = nil
        )
        end
      end

      struct CreateSourceRepositoryResponse
        include JSON::Serializable

        # The name of the source repository.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The description of the source repository.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @project_name : String,
          @space_name : String,
          @description : String? = nil
        )
        end
      end

      struct DeleteAccessTokenRequest
        include JSON::Serializable

        # The ID of the personal access token to delete. You can find the IDs of all PATs associated with your
        # Amazon Web Services Builder ID in a space by calling ListAccessTokens .
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteAccessTokenResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDevEnvironmentRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment you want to delete. To retrieve a list of Dev
        # Environment IDs, use ListDevEnvironments .
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct DeleteDevEnvironmentResponse
        include JSON::Serializable

        # The system-generated unique ID of the deleted Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct DeleteProjectRequest
        include JSON::Serializable

        # The name of the project in the space. To retrieve a list of project names, use ListProjects .
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @name : String,
          @space_name : String
        )
        end
      end

      struct DeleteProjectResponse
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The friendly name displayed to users of the project in Amazon CodeCatalyst.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @name : String,
          @space_name : String,
          @display_name : String? = nil
        )
        end
      end

      struct DeleteSourceRepositoryRequest
        include JSON::Serializable

        # The name of the source repository.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @name : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct DeleteSourceRepositoryResponse
        include JSON::Serializable

        # The name of the repository.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @name : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct DeleteSpaceRequest
        include JSON::Serializable

        # The name of the space. To retrieve a list of space names, use ListSpaces .
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteSpaceResponse
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The friendly name of the space displayed to users of the space in Amazon CodeCatalyst.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @name : String,
          @display_name : String? = nil
        )
        end
      end

      # Information about connection details for a Dev Environment.
      struct DevEnvironmentAccessDetails
        include JSON::Serializable

        # The URL used to send commands to and from the Dev Environment.
        @[JSON::Field(key: "streamUrl")]
        getter stream_url : String

        # An encrypted token value that contains session and caller information used to authenticate the
        # connection.
        @[JSON::Field(key: "tokenValue")]
        getter token_value : String

        def initialize(
          @stream_url : String,
          @token_value : String
        )
        end
      end

      # Information about the source repsitory for a Dev Environment.
      struct DevEnvironmentRepositorySummary
        include JSON::Serializable

        # The name of the source repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The name of the branch in a source repository cloned into the Dev Environment.
        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        def initialize(
          @repository_name : String,
          @branch_name : String? = nil
        )
        end
      end

      # Information about the configuration of a Dev Environment session.
      struct DevEnvironmentSessionConfiguration
        include JSON::Serializable

        # The type of the session.
        @[JSON::Field(key: "sessionType")]
        getter session_type : String

        # Information about optional commands that will be run on the Dev Environment when the SSH session
        # begins.
        @[JSON::Field(key: "executeCommandSessionConfiguration")]
        getter execute_command_session_configuration : Types::ExecuteCommandSessionConfiguration?

        def initialize(
          @session_type : String,
          @execute_command_session_configuration : Types::ExecuteCommandSessionConfiguration? = nil
        )
        end
      end

      # Information about active sessions for a Dev Environment.
      struct DevEnvironmentSessionSummary
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "devEnvironmentId")]
        getter dev_environment_id : String

        # The system-generated unique ID of the Dev Environment session.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The date and time the session started, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339
        @[JSON::Field(key: "startedTime")]
        getter started_time : Time

        def initialize(
          @dev_environment_id : String,
          @id : String,
          @project_name : String,
          @space_name : String,
          @started_time : Time
        )
        end
      end

      # Information about a Dev Environment.
      struct DevEnvironmentSummary
        include JSON::Serializable

        # The system-generated unique ID of the user who created the Dev Environment.
        @[JSON::Field(key: "creatorId")]
        getter creator_id : String

        # The system-generated unique ID for the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The amount of time the Dev Environment will run without any activity detected before stopping, in
        # minutes. Dev Environments consume compute minutes when running.
        @[JSON::Field(key: "inactivityTimeoutMinutes")]
        getter inactivity_timeout_minutes : Int32

        # The Amazon EC2 instace type used for the Dev Environment.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The time when the Dev Environment was last updated, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339 .
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # Information about the configuration of persistent storage for the Dev Environment.
        @[JSON::Field(key: "persistentStorage")]
        getter persistent_storage : Types::PersistentStorage

        # Information about the repositories that will be cloned into the Dev Environment. If no rvalue is
        # specified, no repository is cloned.
        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::DevEnvironmentRepositorySummary)

        # The status of the Dev Environment.
        @[JSON::Field(key: "status")]
        getter status : String

        # The user-specified alias for the Dev Environment.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # Information about the integrated development environment (IDE) configured for a Dev Environment.
        @[JSON::Field(key: "ides")]
        getter ides : Array(Types::Ide)?

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String?

        # The reason for the status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The name of the connection used to connect to Amazon VPC used when the Dev Environment was created,
        # if any.
        @[JSON::Field(key: "vpcConnectionName")]
        getter vpc_connection_name : String?

        def initialize(
          @creator_id : String,
          @id : String,
          @inactivity_timeout_minutes : Int32,
          @instance_type : String,
          @last_updated_time : Time,
          @persistent_storage : Types::PersistentStorage,
          @repositories : Array(Types::DevEnvironmentRepositorySummary),
          @status : String,
          @alias : String? = nil,
          @ides : Array(Types::Ide)? = nil,
          @project_name : String? = nil,
          @space_name : String? = nil,
          @status_reason : String? = nil,
          @vpc_connection_name : String? = nil
        )
        end
      end

      # Information about an email address.
      struct EmailAddress
        include JSON::Serializable

        # The email address.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Whether the email address has been verified.
        @[JSON::Field(key: "verified")]
        getter verified : Bool?

        def initialize(
          @email : String? = nil,
          @verified : Bool? = nil
        )
        end
      end

      # Information about an entry in an event log of Amazon CodeCatalyst activity.
      struct EventLogEntry
        include JSON::Serializable

        # The category for the event.
        @[JSON::Field(key: "eventCategory")]
        getter event_category : String

        # The name of the event.
        @[JSON::Field(key: "eventName")]
        getter event_name : String

        # The source of the event.
        @[JSON::Field(key: "eventSource")]
        getter event_source : String

        # The time the event took place, in coordinated universal time (UTC) timestamp format as specified in
        # RFC 3339 .
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time

        # The type of the event.
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The system-generated unique ID of the event.
        @[JSON::Field(key: "id")]
        getter id : String

        # The type of the event.
        @[JSON::Field(key: "operationType")]
        getter operation_type : String

        # The system-generated unique ID of the user whose actions are recorded in the event.
        @[JSON::Field(key: "userIdentity")]
        getter user_identity : Types::UserIdentity

        # The code of the error, if any.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # Information about the project where the event occurred.
        @[JSON::Field(key: "projectInformation")]
        getter project_information : Types::ProjectInformation?

        # The system-generated unique ID of the request.
        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # Information about the payload of the request.
        @[JSON::Field(key: "requestPayload")]
        getter request_payload : Types::EventPayload?

        # Information about the payload of the response, if any.
        @[JSON::Field(key: "responsePayload")]
        getter response_payload : Types::EventPayload?

        # The IP address of the user whose actions are recorded in the event.
        @[JSON::Field(key: "sourceIpAddress")]
        getter source_ip_address : String?

        # The user agent whose actions are recorded in the event.
        @[JSON::Field(key: "userAgent")]
        getter user_agent : String?

        def initialize(
          @event_category : String,
          @event_name : String,
          @event_source : String,
          @event_time : Time,
          @event_type : String,
          @id : String,
          @operation_type : String,
          @user_identity : Types::UserIdentity,
          @error_code : String? = nil,
          @project_information : Types::ProjectInformation? = nil,
          @request_id : String? = nil,
          @request_payload : Types::EventPayload? = nil,
          @response_payload : Types::EventPayload? = nil,
          @source_ip_address : String? = nil,
          @user_agent : String? = nil
        )
        end
      end

      # Information about the payload of an event recording Amazon CodeCatalyst activity.
      struct EventPayload
        include JSON::Serializable

        # The type of content in the event payload.
        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The data included in the event payload.
        @[JSON::Field(key: "data")]
        getter data : String?

        def initialize(
          @content_type : String? = nil,
          @data : String? = nil
        )
        end
      end

      # Information about the commands that will be run on a Dev Environment when an SSH session begins.
      struct ExecuteCommandSessionConfiguration
        include JSON::Serializable

        # The command used at the beginning of the SSH session to a Dev Environment.
        @[JSON::Field(key: "command")]
        getter command : String

        # An array of arguments containing arguments and members.
        @[JSON::Field(key: "arguments")]
        getter arguments : Array(String)?

        def initialize(
          @command : String,
          @arguments : Array(String)? = nil
        )
        end
      end

      # Information about a filter used to limit results of a query.
      struct Filter
        include JSON::Serializable

        # A key that can be used to sort results.
        @[JSON::Field(key: "key")]
        getter key : String

        # The values of the key.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The operator used to compare the fields.
        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?

        def initialize(
          @key : String,
          @values : Array(String),
          @comparison_operator : String? = nil
        )
        end
      end

      struct GetDevEnvironmentRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment for which you want to view information. To
        # retrieve a list of Dev Environment IDs, use ListDevEnvironments .
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct GetDevEnvironmentResponse
        include JSON::Serializable

        # The system-generated unique ID of the user who created the Dev Environment.
        @[JSON::Field(key: "creatorId")]
        getter creator_id : String

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The amount of time the Dev Environment will run without any activity detected before stopping, in
        # minutes.
        @[JSON::Field(key: "inactivityTimeoutMinutes")]
        getter inactivity_timeout_minutes : Int32

        # The Amazon EC2 instace type to use for the Dev Environment.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The time when the Dev Environment was last updated, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339 .
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # Information about the amount of storage allocated to the Dev Environment. By default, a Dev
        # Environment is configured to have 16GB of persistent storage.
        @[JSON::Field(key: "persistentStorage")]
        getter persistent_storage : Types::PersistentStorage

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The source repository that contains the branch cloned into the Dev Environment.
        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::DevEnvironmentRepositorySummary)

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The current status of the Dev Environment.
        @[JSON::Field(key: "status")]
        getter status : String

        # The user-specified alias for the Dev Environment.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # Information about the integrated development environment (IDE) configured for the Dev Environment.
        @[JSON::Field(key: "ides")]
        getter ides : Array(Types::Ide)?

        # The reason for the status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The name of the connection used to connect to Amazon VPC used when the Dev Environment was created,
        # if any.
        @[JSON::Field(key: "vpcConnectionName")]
        getter vpc_connection_name : String?

        def initialize(
          @creator_id : String,
          @id : String,
          @inactivity_timeout_minutes : Int32,
          @instance_type : String,
          @last_updated_time : Time,
          @persistent_storage : Types::PersistentStorage,
          @project_name : String,
          @repositories : Array(Types::DevEnvironmentRepositorySummary),
          @space_name : String,
          @status : String,
          @alias : String? = nil,
          @ides : Array(Types::Ide)? = nil,
          @status_reason : String? = nil,
          @vpc_connection_name : String? = nil
        )
        end
      end

      struct GetProjectRequest
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @name : String,
          @space_name : String
        )
        end
      end

      struct GetProjectResponse
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The friendly name of the project displayed to users in Amazon CodeCatalyst.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @space_name : String? = nil
        )
        end
      end

      struct GetSourceRepositoryCloneUrlsRequest
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the source repository.
        @[JSON::Field(key: "sourceRepositoryName")]
        getter source_repository_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @project_name : String,
          @source_repository_name : String,
          @space_name : String
        )
        end
      end

      struct GetSourceRepositoryCloneUrlsResponse
        include JSON::Serializable

        # The HTTPS URL to use when cloning the source repository.
        @[JSON::Field(key: "https")]
        getter https : String

        def initialize(
          @https : String
        )
        end
      end

      struct GetSourceRepositoryRequest
        include JSON::Serializable

        # The name of the source repository.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @name : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct GetSourceRepositoryResponse
        include JSON::Serializable

        # The time the source repository was created, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339 .
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The time the source repository was last updated, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339 .
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the source repository.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The description of the source repository.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @project_name : String,
          @space_name : String,
          @description : String? = nil
        )
        end
      end

      struct GetSpaceRequest
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetSpaceResponse
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services Region where the space exists.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The description of the space.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The friendly name of the space displayed to users.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @name : String,
          @region_name : String,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      struct GetSubscriptionRequest
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @space_name : String
        )
        end
      end

      struct GetSubscriptionResponse
        include JSON::Serializable

        # The display name of the Amazon Web Services account used for billing for the space.
        @[JSON::Field(key: "awsAccountName")]
        getter aws_account_name : String?

        # The day and time the pending change will be applied to the space, in coordinated universal time
        # (UTC) timestamp format as specified in RFC 3339 .
        @[JSON::Field(key: "pendingSubscriptionStartTime")]
        getter pending_subscription_start_time : Time?

        # The type of the billing plan that the space will be changed to at the start of the next billing
        # cycle. This applies only to changes that reduce the functionality available for the space. Billing
        # plan changes that increase functionality are applied immediately. For more information, see Pricing
        # .
        @[JSON::Field(key: "pendingSubscriptionType")]
        getter pending_subscription_type : String?

        # The type of the billing plan for the space.
        @[JSON::Field(key: "subscriptionType")]
        getter subscription_type : String?

        def initialize(
          @aws_account_name : String? = nil,
          @pending_subscription_start_time : Time? = nil,
          @pending_subscription_type : String? = nil,
          @subscription_type : String? = nil
        )
        end
      end

      struct GetUserDetailsRequest
        include JSON::Serializable

        # The system-generated unique ID of the user.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the user as displayed in Amazon CodeCatalyst.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @id : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      struct GetUserDetailsResponse
        include JSON::Serializable

        # The friendly name displayed for the user in Amazon CodeCatalyst.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The email address provided by the user when they signed up.
        @[JSON::Field(key: "primaryEmail")]
        getter primary_email : Types::EmailAddress?

        # The system-generated unique ID of the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        # The name of the user as displayed in Amazon CodeCatalyst.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @display_name : String? = nil,
          @primary_email : Types::EmailAddress? = nil,
          @user_id : String? = nil,
          @user_name : String? = nil,
          @version : String? = nil
        )
        end
      end

      struct GetWorkflowRequest
        include JSON::Serializable

        # The ID of the workflow. To rerieve a list of workflow IDs, use ListWorkflows .
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct GetWorkflowResponse
        include JSON::Serializable

        # The date and time the workflow was created, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # Information about the workflow definition file for the workflow.
        @[JSON::Field(key: "definition")]
        getter definition : Types::WorkflowDefinition

        # The ID of the workflow.
        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the workflow was last updated, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the workflow.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The behavior to use when multiple workflows occur at the same time. For more information, see
        # https://docs.aws.amazon.com/codecatalyst/latest/userguide/workflows-configure-runs.html in the
        # Amazon CodeCatalyst User Guide.
        @[JSON::Field(key: "runMode")]
        getter run_mode : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The status of the workflow.
        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the branch that contains the workflow YAML.
        @[JSON::Field(key: "sourceBranchName")]
        getter source_branch_name : String?

        # The name of the source repository where the workflow YAML is stored.
        @[JSON::Field(key: "sourceRepositoryName")]
        getter source_repository_name : String?

        def initialize(
          @created_time : Time,
          @definition : Types::WorkflowDefinition,
          @id : String,
          @last_updated_time : Time,
          @name : String,
          @project_name : String,
          @run_mode : String,
          @space_name : String,
          @status : String,
          @source_branch_name : String? = nil,
          @source_repository_name : String? = nil
        )
        end
      end

      struct GetWorkflowRunRequest
        include JSON::Serializable

        # The ID of the workflow run. To retrieve a list of workflow run IDs, use ListWorkflowRuns .
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct GetWorkflowRunResponse
        include JSON::Serializable

        # The ID of the workflow run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the workflow run status was last updated, in coordinated universal time (UTC)
        # timestamp format as specified in RFC 3339
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The date and time the workflow run began, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The status of the workflow run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The ID of the workflow.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The date and time the workflow run ended, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339 .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Information about the reasons for the status of the workflow run.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(Types::WorkflowRunStatusReason)?

        def initialize(
          @id : String,
          @last_updated_time : Time,
          @project_name : String,
          @space_name : String,
          @start_time : Time,
          @status : String,
          @workflow_id : String,
          @end_time : Time? = nil,
          @status_reasons : Array(Types::WorkflowRunStatusReason)? = nil
        )
        end
      end

      # Information about an integrated development environment (IDE) used in a Dev Environment.
      struct Ide
        include JSON::Serializable

        # The name of the IDE.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A link to the IDE runtime image.
        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        def initialize(
          @name : String? = nil,
          @runtime : String? = nil
        )
        end
      end

      # Information about the configuration of an integrated development environment (IDE) for a Dev
      # Environment.
      struct IdeConfiguration
        include JSON::Serializable

        # The name of the IDE. Valid values include Cloud9 , IntelliJ , PyCharm , GoLand , and VSCode .
        @[JSON::Field(key: "name")]
        getter name : String?

        # A link to the IDE runtime image. This parameter is not required for VSCode .
        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        def initialize(
          @name : String? = nil,
          @runtime : String? = nil
        )
        end
      end

      struct ListAccessTokensRequest
        include JSON::Serializable

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccessTokensResponse
        include JSON::Serializable

        # A list of personal access tokens (PATs) associated with the calling user identity.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AccessTokenSummary)

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AccessTokenSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDevEnvironmentSessionsRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "devEnvironmentId")]
        getter dev_environment_id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dev_environment_id : String,
          @project_name : String,
          @space_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDevEnvironmentSessionsResponse
        include JSON::Serializable

        # Information about each session retrieved in the list.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DevEnvironmentSessionSummary)

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DevEnvironmentSessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDevEnvironmentsRequest
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # Information about filters to apply to narrow the results returned in the list.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        def initialize(
          @space_name : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @project_name : String? = nil
        )
        end
      end

      struct ListDevEnvironmentsResponse
        include JSON::Serializable

        # Information about the Dev Environments in a project.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DevEnvironmentSummary)

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DevEnvironmentSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListEventLogsRequest
        include JSON::Serializable

        # The time after which you do not want any events retrieved, in coordinated universal time (UTC)
        # timestamp format as specified in RFC 3339 .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The date and time when you want to start retrieving events, in coordinated universal time (UTC)
        # timestamp format as specified in RFC 3339 .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The name of the event.
        @[JSON::Field(key: "eventName")]
        getter event_name : String?

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @space_name : String,
          @start_time : Time,
          @event_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventLogsResponse
        include JSON::Serializable

        # Information about each event retrieved in the list.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::EventLogEntry)

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EventLogEntry),
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectsRequest
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # Information about filters to apply to narrow the results returned in the list.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ProjectListFilter)?

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @space_name : String,
          @filters : Array(Types::ProjectListFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectsResponse
        include JSON::Serializable

        # Information about the projects.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProjectSummary)?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProjectSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about a source repository returned in a list of source repositories.
      struct ListSourceRepositoriesItem
        include JSON::Serializable

        # The time the source repository was created, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339 .
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The system-generated unique ID of the source repository.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time the source repository was last updated, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339 .
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the source repository.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the repository, if any.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_time : Time,
          @id : String,
          @last_updated_time : Time,
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct ListSourceRepositoriesRequest
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @project_name : String,
          @space_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSourceRepositoriesResponse
        include JSON::Serializable

        # Information about the source repositories.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListSourceRepositoriesItem)?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListSourceRepositoriesItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about a branch of a source repository returned in a list of branches.
      struct ListSourceRepositoryBranchesItem
        include JSON::Serializable

        # The commit ID of the tip of the branch at the time of the request, also known as the head commit.
        @[JSON::Field(key: "headCommitId")]
        getter head_commit_id : String?

        # The time the branch was last updated, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339 .
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the branch.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Git reference name of the branch.
        @[JSON::Field(key: "ref")]
        getter ref : String?

        def initialize(
          @head_commit_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @ref : String? = nil
        )
        end
      end

      struct ListSourceRepositoryBranchesRequest
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the source repository.
        @[JSON::Field(key: "sourceRepositoryName")]
        getter source_repository_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @project_name : String,
          @source_repository_name : String,
          @space_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSourceRepositoryBranchesResponse
        include JSON::Serializable

        # Information about the source branches.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListSourceRepositoryBranchesItem)

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListSourceRepositoryBranchesItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListSpacesRequest
        include JSON::Serializable

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct ListSpacesResponse
        include JSON::Serializable

        # Information about the spaces.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SpaceSummary)?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SpaceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowRunsRequest
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information used to sort the items in the returned list.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : Array(Types::WorkflowRunSortCriteria)?

        # The ID of the workflow. To retrieve a list of workflow IDs, use ListWorkflows .
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @project_name : String,
          @space_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Array(Types::WorkflowRunSortCriteria)? = nil,
          @workflow_id : String? = nil
        )
        end
      end

      struct ListWorkflowRunsResponse
        include JSON::Serializable

        # Information about the runs of a workflow.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::WorkflowRunSummary)?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::WorkflowRunSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowsRequest
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The maximum number of results to show in a single call to this API. If the number of results is
        # larger than the number you specified, the response will include a NextToken element, which you can
        # use to obtain additional results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information used to sort the items in the returned list.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : Array(Types::WorkflowSortCriteria)?

        def initialize(
          @project_name : String,
          @space_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Array(Types::WorkflowSortCriteria)? = nil
        )
        end
      end

      struct ListWorkflowsResponse
        include JSON::Serializable

        # Information about the workflows in a project.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::WorkflowSummary)?

        # A token returned from a call to this API to indicate the next batch of results to return, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::WorkflowSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about the persistent storage for a Dev Environment.
      struct PersistentStorage
        include JSON::Serializable

        # The size of the persistent storage in gigabytes (specifically GiB). Valid values for storage are
        # based on memory sizes in 16GB increments. Valid values are 16, 32, and 64.
        @[JSON::Field(key: "sizeInGiB")]
        getter size_in_gi_b : Int32

        def initialize(
          @size_in_gi_b : Int32
        )
        end
      end

      # Information about the configuration of persistent storage for a Dev Environment.
      struct PersistentStorageConfiguration
        include JSON::Serializable

        # The size of the persistent storage in gigabytes (specifically GiB). Valid values for storage are
        # based on memory sizes in 16GB increments. Valid values are 16, 32, and 64.
        @[JSON::Field(key: "sizeInGiB")]
        getter size_in_gi_b : Int32

        def initialize(
          @size_in_gi_b : Int32
        )
        end
      end

      # Information about a project in a space.
      struct ProjectInformation
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The system-generated unique ID of the project.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        def initialize(
          @name : String? = nil,
          @project_id : String? = nil
        )
        end
      end

      # nformation about the filter used to narrow the results returned in a list of projects.
      struct ProjectListFilter
        include JSON::Serializable

        # A key that can be used to sort results.
        @[JSON::Field(key: "key")]
        getter key : String

        # The values of the key.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The operator used to compare the fields.
        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?

        def initialize(
          @key : String,
          @values : Array(String),
          @comparison_operator : String? = nil
        )
        end
      end

      # Information about a project.
      struct ProjectSummary
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The friendly name displayed to users of the project in Amazon CodeCatalyst.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      # Information about a repository that will be cloned to a Dev Environment.
      struct RepositoryInput
        include JSON::Serializable

        # The name of the source repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The name of the branch in a source repository.
        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        def initialize(
          @repository_name : String,
          @branch_name : String? = nil
        )
        end
      end

      # The request was denied because the specified resource was not found. Verify that the spelling is
      # correct and that you have access to the resource.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request was denied because one or more resources has reached its limits for the tier the space
      # belongs to. Either reduce the number of resources, or change the tier if applicable.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about an space.
      struct SpaceSummary
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services Region where the space exists.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The description of the space.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The friendly name of the space displayed to users.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @name : String,
          @region_name : String,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      struct StartDevEnvironmentRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # Information about the integrated development environment (IDE) configured for a Dev Environment.
        @[JSON::Field(key: "ides")]
        getter ides : Array(Types::IdeConfiguration)?

        # The amount of time the Dev Environment will run without any activity detected before stopping, in
        # minutes. Only whole integers are allowed. Dev Environments consume compute minutes when running.
        @[JSON::Field(key: "inactivityTimeoutMinutes")]
        getter inactivity_timeout_minutes : Int32?

        # The Amazon EC2 instace type to use for the Dev Environment.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String,
          @ides : Array(Types::IdeConfiguration)? = nil,
          @inactivity_timeout_minutes : Int32? = nil,
          @instance_type : String? = nil
        )
        end
      end

      struct StartDevEnvironmentResponse
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The status of the Dev Environment.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String,
          @status : String
        )
        end
      end

      struct StartDevEnvironmentSessionRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        @[JSON::Field(key: "sessionConfiguration")]
        getter session_configuration : Types::DevEnvironmentSessionConfiguration

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @session_configuration : Types::DevEnvironmentSessionConfiguration,
          @space_name : String
        )
        end
      end

      struct StartDevEnvironmentSessionResponse
        include JSON::Serializable

        @[JSON::Field(key: "accessDetails")]
        getter access_details : Types::DevEnvironmentAccessDetails

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The system-generated unique ID of the Dev Environment session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @access_details : Types::DevEnvironmentAccessDetails,
          @id : String,
          @project_name : String,
          @space_name : String,
          @session_id : String? = nil
        )
        end
      end

      struct StartWorkflowRunRequest
        include JSON::Serializable

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The system-generated unique ID of the workflow. To retrieve a list of workflow IDs, use
        # ListWorkflows .
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # A user-specified idempotency token. Idempotency ensures that an API request completes only once.
        # With an idempotent request, if the original request completes successfully, the subsequent retries
        # return the result from the original successful request and have no additional effect.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @project_name : String,
          @space_name : String,
          @workflow_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct StartWorkflowRunResponse
        include JSON::Serializable

        # The system-generated unique ID of the workflow run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The system-generated unique ID of the workflow.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String,
          @workflow_id : String
        )
        end
      end

      struct StopDevEnvironmentRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String
        )
        end
      end

      struct StopDevEnvironmentResponse
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The status of the Dev Environment.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String,
          @status : String
        )
        end
      end

      struct StopDevEnvironmentSessionRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment. To obtain this ID, use ListDevEnvironments .
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The system-generated unique ID of the Dev Environment session. This ID is returned by
        # StartDevEnvironmentSession .
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @session_id : String,
          @space_name : String
        )
        end
      end

      struct StopDevEnvironmentSessionResponse
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The system-generated unique ID of the Dev Environment session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        def initialize(
          @id : String,
          @project_name : String,
          @session_id : String,
          @space_name : String
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UpdateDevEnvironmentRequest
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The user-specified alias for the Dev Environment. Changing this value will not cause a restart.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A user-specified idempotency token. Idempotency ensures that an API request completes only once.
        # With an idempotent request, if the original request completes successfully, the subsequent retries
        # return the result from the original successful request and have no additional effect.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Information about the integrated development environment (IDE) configured for a Dev Environment.
        @[JSON::Field(key: "ides")]
        getter ides : Array(Types::IdeConfiguration)?

        # The amount of time the Dev Environment will run without any activity detected before stopping, in
        # minutes. Only whole integers are allowed. Dev Environments consume compute minutes when running.
        # Changing this value will cause a restart of the Dev Environment if it is running.
        @[JSON::Field(key: "inactivityTimeoutMinutes")]
        getter inactivity_timeout_minutes : Int32?

        # The Amazon EC2 instace type to use for the Dev Environment. Changing this value will cause a restart
        # of the Dev Environment if it is running.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String,
          @alias : String? = nil,
          @client_token : String? = nil,
          @ides : Array(Types::IdeConfiguration)? = nil,
          @inactivity_timeout_minutes : Int32? = nil,
          @instance_type : String? = nil
        )
        end
      end

      struct UpdateDevEnvironmentResponse
        include JSON::Serializable

        # The system-generated unique ID of the Dev Environment.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project in the space.
        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The user-specified alias for the Dev Environment.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A user-specified idempotency token. Idempotency ensures that an API request completes only once.
        # With an idempotent request, if the original request completes successfully, the subsequent retries
        # return the result from the original successful request and have no additional effect.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Information about the integrated development environment (IDE) configured for the Dev Environment.
        @[JSON::Field(key: "ides")]
        getter ides : Array(Types::IdeConfiguration)?

        # The amount of time the Dev Environment will run without any activity detected before stopping, in
        # minutes.
        @[JSON::Field(key: "inactivityTimeoutMinutes")]
        getter inactivity_timeout_minutes : Int32?

        # The Amazon EC2 instace type to use for the Dev Environment.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        def initialize(
          @id : String,
          @project_name : String,
          @space_name : String,
          @alias : String? = nil,
          @client_token : String? = nil,
          @ides : Array(Types::IdeConfiguration)? = nil,
          @inactivity_timeout_minutes : Int32? = nil,
          @instance_type : String? = nil
        )
        end
      end

      struct UpdateProjectRequest
        include JSON::Serializable

        # The name of the project.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String

        # The description of the project.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @space_name : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateProjectResponse
        include JSON::Serializable

        # The description of the project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The friendly name of the project displayed to users in Amazon CodeCatalyst.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The name of the project.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The name of the space.
        @[JSON::Field(key: "spaceName")]
        getter space_name : String?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @name : String? = nil,
          @space_name : String? = nil
        )
        end
      end

      struct UpdateSpaceRequest
        include JSON::Serializable

        # The name of the space.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the space.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateSpaceResponse
        include JSON::Serializable

        # The description of the space.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The friendly name of the space displayed to users in Amazon CodeCatalyst.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The name of the space.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about a user whose activity is recorded in an event for a space.
      struct UserIdentity
        include JSON::Serializable

        # The ID of the Amazon CodeCatalyst service principal.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The role assigned to the user in a Amazon CodeCatalyst space or project when the event occurred.
        @[JSON::Field(key: "userType")]
        getter user_type : String

        # The Amazon Web Services account number of the user in Amazon Web Services, if any.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The display name of the user in Amazon CodeCatalyst.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @principal_id : String,
          @user_type : String,
          @aws_account_id : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # The request was denied because an input failed to satisfy the constraints specified by the service.
      # Check the spelling and input requirements, and then try again.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct VerifySessionResponse
        include JSON::Serializable

        # The system-generated unique ID of the user in Amazon CodeCatalyst.
        @[JSON::Field(key: "identity")]
        getter identity : String?

        def initialize(
          @identity : String? = nil
        )
        end
      end

      # Information about a workflow definition file.
      struct WorkflowDefinition
        include JSON::Serializable

        # The path to the workflow definition file stored in the source repository for the project, including
        # the file name.
        @[JSON::Field(key: "path")]
        getter path : String

        def initialize(
          @path : String
        )
        end
      end

      # Information about a workflow definition.
      struct WorkflowDefinitionSummary
        include JSON::Serializable

        # The path to the workflow definition file stored in the source repository for the project, including
        # the file name.
        @[JSON::Field(key: "path")]
        getter path : String

        def initialize(
          @path : String
        )
        end
      end

      # Information used to sort workflow runs in the returned list.
      struct WorkflowRunSortCriteria
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the status of a workflow run.
      struct WorkflowRunStatusReason
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a workflow run.
      struct WorkflowRunSummary
        include JSON::Serializable

        # The system-generated unique ID of the workflow run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the workflow was last updated, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The date and time the workflow run began, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339 .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The status of the workflow run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The system-generated unique ID of the workflow.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The name of the workflow.
        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # The date and time the workflow run ended, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The reasons for the workflow run status.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(Types::WorkflowRunStatusReason)?

        def initialize(
          @id : String,
          @last_updated_time : Time,
          @start_time : Time,
          @status : String,
          @workflow_id : String,
          @workflow_name : String,
          @end_time : Time? = nil,
          @status_reasons : Array(Types::WorkflowRunStatusReason)? = nil
        )
        end
      end

      # Information used to sort workflows in the returned list.
      struct WorkflowSortCriteria
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a workflow.
      struct WorkflowSummary
        include JSON::Serializable

        # The date and time the workflow was created, in coordinated universal time (UTC) timestamp format as
        # specified in RFC 3339
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # Information about the workflow definition file.
        @[JSON::Field(key: "definition")]
        getter definition : Types::WorkflowDefinitionSummary

        # The system-generated unique ID of a workflow.
        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the workflow was last updated, in coordinated universal time (UTC) timestamp
        # format as specified in RFC 3339
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the workflow.
        @[JSON::Field(key: "name")]
        getter name : String

        # The run mode of the workflow.
        @[JSON::Field(key: "runMode")]
        getter run_mode : String

        # The name of the branch of the source repository where the workflow definition file is stored.
        @[JSON::Field(key: "sourceBranchName")]
        getter source_branch_name : String

        # The name of the source repository where the workflow definition file is stored.
        @[JSON::Field(key: "sourceRepositoryName")]
        getter source_repository_name : String

        # The status of the workflow.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @created_time : Time,
          @definition : Types::WorkflowDefinitionSummary,
          @id : String,
          @last_updated_time : Time,
          @name : String,
          @run_mode : String,
          @source_branch_name : String,
          @source_repository_name : String,
          @status : String
        )
        end
      end
    end
  end
end
