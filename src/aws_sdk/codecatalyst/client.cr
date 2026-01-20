module AwsSdk
  module CodeCatalyst
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a personal access token (PAT) for the current user. A personal access token (PAT) is similar
      # to a password. It is associated with your user identity for use across all spaces and projects in
      # Amazon CodeCatalyst. You use PATs to access CodeCatalyst from resources that include integrated
      # development environments (IDEs) and Git-based source repositories. PATs represent you in Amazon
      # CodeCatalyst and you can manage them in your user settings.For more information, see Managing
      # personal access tokens in Amazon CodeCatalyst .

      def create_access_token(
        name : String,
        expires_time : Time? = nil
      ) : Protocol::Request
        input = Types::CreateAccessTokenRequest.new(name: name, expires_time: expires_time)
        create_access_token(input)
      end

      def create_access_token(input : Types::CreateAccessTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Dev Environment in Amazon CodeCatalyst, a cloud-based development environment that you can
      # use to quickly work on the code stored in the source repositories of your project. When created in
      # the Amazon CodeCatalyst console, by default a Dev Environment is configured to have a 2 core
      # processor, 4GB of RAM, and 16GB of persistent storage. None of these defaults apply to a Dev
      # Environment created programmatically.

      def create_dev_environment(
        instance_type : String,
        persistent_storage : Types::PersistentStorageConfiguration,
        project_name : String,
        space_name : String,
        alias_ : String? = nil,
        client_token : String? = nil,
        ides : Array(Types::IdeConfiguration)? = nil,
        inactivity_timeout_minutes : Int32? = nil,
        repositories : Array(Types::RepositoryInput)? = nil,
        vpc_connection_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateDevEnvironmentRequest.new(instance_type: instance_type, persistent_storage: persistent_storage, project_name: project_name, space_name: space_name, alias_: alias_, client_token: client_token, ides: ides, inactivity_timeout_minutes: inactivity_timeout_minutes, repositories: repositories, vpc_connection_name: vpc_connection_name)
        create_dev_environment(input)
      end

      def create_dev_environment(input : Types::CreateDevEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEV_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a project in a specified space.

      def create_project(
        display_name : String,
        space_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateProjectRequest.new(display_name: display_name, space_name: space_name, description: description)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an empty Git-based source repository in a specified project. The repository is created with
      # an initial empty commit with a default branch named main .

      def create_source_repository(
        name : String,
        project_name : String,
        space_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateSourceRepositoryRequest.new(name: name, project_name: project_name, space_name: space_name, description: description)
        create_source_repository(input)
      end

      def create_source_repository(input : Types::CreateSourceRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOURCE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a branch in a specified source repository in Amazon CodeCatalyst. This API only creates a
      # branch in a source repository hosted in Amazon CodeCatalyst. You cannot use this API to create a
      # branch in a linked repository.

      def create_source_repository_branch(
        name : String,
        project_name : String,
        source_repository_name : String,
        space_name : String,
        head_commit_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateSourceRepositoryBranchRequest.new(name: name, project_name: project_name, source_repository_name: source_repository_name, space_name: space_name, head_commit_id: head_commit_id)
        create_source_repository_branch(input)
      end

      def create_source_repository_branch(input : Types::CreateSourceRepositoryBranchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOURCE_REPOSITORY_BRANCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified personal access token (PAT). A personal access token can only be deleted by the
      # user who created it.

      def delete_access_token(
        id : String
      ) : Protocol::Request
        input = Types::DeleteAccessTokenRequest.new(id: id)
        delete_access_token(input)
      end

      def delete_access_token(input : Types::DeleteAccessTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Dev Environment.

      def delete_dev_environment(
        id : String,
        project_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::DeleteDevEnvironmentRequest.new(id: id, project_name: project_name, space_name: space_name)
        delete_dev_environment(input)
      end

      def delete_dev_environment(input : Types::DeleteDevEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEV_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a project in a space.

      def delete_project(
        name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::DeleteProjectRequest.new(name: name, space_name: space_name)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a source repository in Amazon CodeCatalyst. You cannot use this API to delete a linked
      # repository. It can only be used to delete a Amazon CodeCatalyst source repository.

      def delete_source_repository(
        name : String,
        project_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::DeleteSourceRepositoryRequest.new(name: name, project_name: project_name, space_name: space_name)
        delete_source_repository(input)
      end

      def delete_source_repository(input : Types::DeleteSourceRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOURCE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a space. Deleting a space cannot be undone. Additionally, since space names must be unique
      # across Amazon CodeCatalyst, you cannot reuse names of deleted spaces.

      def delete_space(
        name : String
      ) : Protocol::Request
        input = Types::DeleteSpaceRequest.new(name: name)
        delete_space(input)
      end

      def delete_space(input : Types::DeleteSpaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a Dev Environment for a source repository in a project. Dev Environments
      # are specific to the user who creates them.

      def get_dev_environment(
        id : String,
        project_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::GetDevEnvironmentRequest.new(id: id, project_name: project_name, space_name: space_name)
        get_dev_environment(input)
      end

      def get_dev_environment(input : Types::GetDevEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEV_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a project.

      def get_project(
        name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::GetProjectRequest.new(name: name, space_name: space_name)
        get_project(input)
      end

      def get_project(input : Types::GetProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a source repository.

      def get_source_repository(
        name : String,
        project_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::GetSourceRepositoryRequest.new(name: name, project_name: project_name, space_name: space_name)
        get_source_repository(input)
      end

      def get_source_repository(input : Types::GetSourceRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOURCE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the URLs that can be used with a Git client to clone a source repository.

      def get_source_repository_clone_urls(
        project_name : String,
        source_repository_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::GetSourceRepositoryCloneUrlsRequest.new(project_name: project_name, source_repository_name: source_repository_name, space_name: space_name)
        get_source_repository_clone_urls(input)
      end

      def get_source_repository_clone_urls(input : Types::GetSourceRepositoryCloneUrlsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOURCE_REPOSITORY_CLONE_URLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an space.

      def get_space(
        name : String
      ) : Protocol::Request
        input = Types::GetSpaceRequest.new(name: name)
        get_space(input)
      end

      def get_space(input : Types::GetSpaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the Amazon Web Services account used for billing purposes and the billing
      # plan for the space.

      def get_subscription(
        space_name : String
      ) : Protocol::Request
        input = Types::GetSubscriptionRequest.new(space_name: space_name)
        get_subscription(input)
      end

      def get_subscription(input : Types::GetSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a user.

      def get_user_details(
        id : String? = nil,
        user_name : String? = nil
      ) : Protocol::Request
        input = Types::GetUserDetailsRequest.new(id: id, user_name: user_name)
        get_user_details(input)
      end

      def get_user_details(input : Types::GetUserDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a workflow.

      def get_workflow(
        id : String,
        project_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::GetWorkflowRequest.new(id: id, project_name: project_name, space_name: space_name)
        get_workflow(input)
      end

      def get_workflow(input : Types::GetWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specified run of a workflow.

      def get_workflow_run(
        id : String,
        project_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::GetWorkflowRunRequest.new(id: id, project_name: project_name, space_name: space_name)
        get_workflow_run(input)
      end

      def get_workflow_run(input : Types::GetWorkflowRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all personal access tokens (PATs) associated with the user who calls the API. You can only
      # list PATs associated with your Amazon Web Services Builder ID.

      def list_access_tokens(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessTokensRequest.new(max_results: max_results, next_token: next_token)
        list_access_tokens(input)
      end

      def list_access_tokens(input : Types::ListAccessTokensRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_TOKENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of active sessions for a Dev Environment in a project.

      def list_dev_environment_sessions(
        dev_environment_id : String,
        project_name : String,
        space_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDevEnvironmentSessionsRequest.new(dev_environment_id: dev_environment_id, project_name: project_name, space_name: space_name, max_results: max_results, next_token: next_token)
        list_dev_environment_sessions(input)
      end

      def list_dev_environment_sessions(input : Types::ListDevEnvironmentSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEV_ENVIRONMENT_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of Dev Environments in a project.

      def list_dev_environments(
        space_name : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        project_name : String? = nil
      ) : Protocol::Request
        input = Types::ListDevEnvironmentsRequest.new(space_name: space_name, filters: filters, max_results: max_results, next_token: next_token, project_name: project_name)
        list_dev_environments(input)
      end

      def list_dev_environments(input : Types::ListDevEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEV_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of events that occurred during a specific time in a space. You can use these events
      # to audit user and system activity in a space. For more information, see Monitoring in the Amazon
      # CodeCatalyst User Guide . ListEventLogs guarantees events for the last 30 days in a given space. You
      # can also view and retrieve a list of management events over the last 90 days for Amazon CodeCatalyst
      # in the CloudTrail console by viewing Event history, or by creating a trail to create and maintain a
      # record of events that extends past 90 days. For more information, see Working with CloudTrail Event
      # History and Working with CloudTrail trails .

      def list_event_logs(
        end_time : Time,
        space_name : String,
        start_time : Time,
        event_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventLogsRequest.new(end_time: end_time, space_name: space_name, start_time: start_time, event_name: event_name, max_results: max_results, next_token: next_token)
        list_event_logs(input)
      end

      def list_event_logs(input : Types::ListEventLogsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_LOGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of projects.

      def list_projects(
        space_name : String,
        filters : Array(Types::ProjectListFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectsRequest.new(space_name: space_name, filters: filters, max_results: max_results, next_token: next_token)
        list_projects(input)
      end

      def list_projects(input : Types::ListProjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of source repositories in a project.

      def list_source_repositories(
        project_name : String,
        space_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSourceRepositoriesRequest.new(project_name: project_name, space_name: space_name, max_results: max_results, next_token: next_token)
        list_source_repositories(input)
      end

      def list_source_repositories(input : Types::ListSourceRepositoriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOURCE_REPOSITORIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of branches in a specified source repository.

      def list_source_repository_branches(
        project_name : String,
        source_repository_name : String,
        space_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSourceRepositoryBranchesRequest.new(project_name: project_name, source_repository_name: source_repository_name, space_name: space_name, max_results: max_results, next_token: next_token)
        list_source_repository_branches(input)
      end

      def list_source_repository_branches(input : Types::ListSourceRepositoryBranchesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOURCE_REPOSITORY_BRANCHES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of spaces.

      def list_spaces(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSpacesRequest.new(next_token: next_token)
        list_spaces(input)
      end

      def list_spaces(input : Types::ListSpacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of workflow runs of a specified workflow.

      def list_workflow_runs(
        project_name : String,
        space_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Array(Types::WorkflowRunSortCriteria)? = nil,
        workflow_id : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowRunsRequest.new(project_name: project_name, space_name: space_name, max_results: max_results, next_token: next_token, sort_by: sort_by, workflow_id: workflow_id)
        list_workflow_runs(input)
      end

      def list_workflow_runs(input : Types::ListWorkflowRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of workflows in a specified project.

      def list_workflows(
        project_name : String,
        space_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Array(Types::WorkflowSortCriteria)? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowsRequest.new(project_name: project_name, space_name: space_name, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_workflows(input)
      end

      def list_workflows(input : Types::ListWorkflowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a specified Dev Environment and puts it into an active state.

      def start_dev_environment(
        id : String,
        project_name : String,
        space_name : String,
        ides : Array(Types::IdeConfiguration)? = nil,
        inactivity_timeout_minutes : Int32? = nil,
        instance_type : String? = nil
      ) : Protocol::Request
        input = Types::StartDevEnvironmentRequest.new(id: id, project_name: project_name, space_name: space_name, ides: ides, inactivity_timeout_minutes: inactivity_timeout_minutes, instance_type: instance_type)
        start_dev_environment(input)
      end

      def start_dev_environment(input : Types::StartDevEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DEV_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a session for a specified Dev Environment.

      def start_dev_environment_session(
        id : String,
        project_name : String,
        session_configuration : Types::DevEnvironmentSessionConfiguration,
        space_name : String
      ) : Protocol::Request
        input = Types::StartDevEnvironmentSessionRequest.new(id: id, project_name: project_name, session_configuration: session_configuration, space_name: space_name)
        start_dev_environment_session(input)
      end

      def start_dev_environment_session(input : Types::StartDevEnvironmentSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DEV_ENVIRONMENT_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Begins a run of a specified workflow.

      def start_workflow_run(
        project_name : String,
        space_name : String,
        workflow_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartWorkflowRunRequest.new(project_name: project_name, space_name: space_name, workflow_id: workflow_id, client_token: client_token)
        start_workflow_run(input)
      end

      def start_workflow_run(input : Types::StartWorkflowRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_WORKFLOW_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Pauses a specified Dev Environment and places it in a non-running state. Stopped Dev Environments do
      # not consume compute minutes.

      def stop_dev_environment(
        id : String,
        project_name : String,
        space_name : String
      ) : Protocol::Request
        input = Types::StopDevEnvironmentRequest.new(id: id, project_name: project_name, space_name: space_name)
        stop_dev_environment(input)
      end

      def stop_dev_environment(input : Types::StopDevEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_DEV_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a session for a specified Dev Environment.

      def stop_dev_environment_session(
        id : String,
        project_name : String,
        session_id : String,
        space_name : String
      ) : Protocol::Request
        input = Types::StopDevEnvironmentSessionRequest.new(id: id, project_name: project_name, session_id: session_id, space_name: space_name)
        stop_dev_environment_session(input)
      end

      def stop_dev_environment_session(input : Types::StopDevEnvironmentSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_DEV_ENVIRONMENT_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes one or more values for a Dev Environment. Updating certain values of the Dev Environment
      # will cause a restart.

      def update_dev_environment(
        id : String,
        project_name : String,
        space_name : String,
        alias_ : String? = nil,
        client_token : String? = nil,
        ides : Array(Types::IdeConfiguration)? = nil,
        inactivity_timeout_minutes : Int32? = nil,
        instance_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDevEnvironmentRequest.new(id: id, project_name: project_name, space_name: space_name, alias_: alias_, client_token: client_token, ides: ides, inactivity_timeout_minutes: inactivity_timeout_minutes, instance_type: instance_type)
        update_dev_environment(input)
      end

      def update_dev_environment(input : Types::UpdateDevEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEV_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes one or more values for a project.

      def update_project(
        name : String,
        space_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProjectRequest.new(name: name, space_name: space_name, description: description)
        update_project(input)
      end

      def update_project(input : Types::UpdateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes one or more values for a space.

      def update_space(
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSpaceRequest.new(name: name, description: description)
        update_space(input)
      end

      def update_space(input : Types::UpdateSpaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies whether the calling user has a valid Amazon CodeCatalyst login and session. If successful,
      # this returns the ID of the user in Amazon CodeCatalyst.


      def verify_session : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VERIFY_SESSION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
