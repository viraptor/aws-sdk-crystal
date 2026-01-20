module Aws
  module CodeBuild
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Deletes one or more builds.

      def batch_delete_builds(
        ids : Array(String)
      ) : Types::BatchDeleteBuildsOutput

        input = Types::BatchDeleteBuildsInput.new(ids: ids)
        batch_delete_builds(input)
      end

      def batch_delete_builds(input : Types::BatchDeleteBuildsInput) : Types::BatchDeleteBuildsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_BUILDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteBuildsOutput, "BatchDeleteBuilds")
      end

      # Retrieves information about one or more batch builds.

      def batch_get_build_batches(
        ids : Array(String)
      ) : Types::BatchGetBuildBatchesOutput

        input = Types::BatchGetBuildBatchesInput.new(ids: ids)
        batch_get_build_batches(input)
      end

      def batch_get_build_batches(input : Types::BatchGetBuildBatchesInput) : Types::BatchGetBuildBatchesOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_BUILD_BATCHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetBuildBatchesOutput, "BatchGetBuildBatches")
      end

      # Gets information about one or more builds.

      def batch_get_builds(
        ids : Array(String)
      ) : Types::BatchGetBuildsOutput

        input = Types::BatchGetBuildsInput.new(ids: ids)
        batch_get_builds(input)
      end

      def batch_get_builds(input : Types::BatchGetBuildsInput) : Types::BatchGetBuildsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_BUILDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetBuildsOutput, "BatchGetBuilds")
      end

      # Gets information about the command executions.

      def batch_get_command_executions(
        command_execution_ids : Array(String),
        sandbox_id : String
      ) : Types::BatchGetCommandExecutionsOutput

        input = Types::BatchGetCommandExecutionsInput.new(command_execution_ids: command_execution_ids, sandbox_id: sandbox_id)
        batch_get_command_executions(input)
      end

      def batch_get_command_executions(input : Types::BatchGetCommandExecutionsInput) : Types::BatchGetCommandExecutionsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_COMMAND_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetCommandExecutionsOutput, "BatchGetCommandExecutions")
      end

      # Gets information about one or more compute fleets.

      def batch_get_fleets(
        names : Array(String)
      ) : Types::BatchGetFleetsOutput

        input = Types::BatchGetFleetsInput.new(names: names)
        batch_get_fleets(input)
      end

      def batch_get_fleets(input : Types::BatchGetFleetsInput) : Types::BatchGetFleetsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetFleetsOutput, "BatchGetFleets")
      end

      # Gets information about one or more build projects.

      def batch_get_projects(
        names : Array(String)
      ) : Types::BatchGetProjectsOutput

        input = Types::BatchGetProjectsInput.new(names: names)
        batch_get_projects(input)
      end

      def batch_get_projects(input : Types::BatchGetProjectsInput) : Types::BatchGetProjectsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetProjectsOutput, "BatchGetProjects")
      end

      # Returns an array of report groups.

      def batch_get_report_groups(
        report_group_arns : Array(String)
      ) : Types::BatchGetReportGroupsOutput

        input = Types::BatchGetReportGroupsInput.new(report_group_arns: report_group_arns)
        batch_get_report_groups(input)
      end

      def batch_get_report_groups(input : Types::BatchGetReportGroupsInput) : Types::BatchGetReportGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_REPORT_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetReportGroupsOutput, "BatchGetReportGroups")
      end

      # Returns an array of reports.

      def batch_get_reports(
        report_arns : Array(String)
      ) : Types::BatchGetReportsOutput

        input = Types::BatchGetReportsInput.new(report_arns: report_arns)
        batch_get_reports(input)
      end

      def batch_get_reports(input : Types::BatchGetReportsInput) : Types::BatchGetReportsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_REPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetReportsOutput, "BatchGetReports")
      end

      # Gets information about the sandbox status.

      def batch_get_sandboxes(
        ids : Array(String)
      ) : Types::BatchGetSandboxesOutput

        input = Types::BatchGetSandboxesInput.new(ids: ids)
        batch_get_sandboxes(input)
      end

      def batch_get_sandboxes(input : Types::BatchGetSandboxesInput) : Types::BatchGetSandboxesOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_SANDBOXES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetSandboxesOutput, "BatchGetSandboxes")
      end

      # Creates a compute fleet.

      def create_fleet(
        base_capacity : Int32,
        compute_type : String,
        environment_type : String,
        name : String,
        compute_configuration : Types::ComputeConfiguration? = nil,
        fleet_service_role : String? = nil,
        image_id : String? = nil,
        overflow_behavior : String? = nil,
        proxy_configuration : Types::ProxyConfiguration? = nil,
        scaling_configuration : Types::ScalingConfigurationInput? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateFleetOutput

        input = Types::CreateFleetInput.new(base_capacity: base_capacity, compute_type: compute_type, environment_type: environment_type, name: name, compute_configuration: compute_configuration, fleet_service_role: fleet_service_role, image_id: image_id, overflow_behavior: overflow_behavior, proxy_configuration: proxy_configuration, scaling_configuration: scaling_configuration, tags: tags, vpc_config: vpc_config)
        create_fleet(input)
      end

      def create_fleet(input : Types::CreateFleetInput) : Types::CreateFleetOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFleetOutput, "CreateFleet")
      end

      # Creates a build project.

      def create_project(
        artifacts : Types::ProjectArtifacts,
        environment : Types::ProjectEnvironment,
        name : String,
        service_role : String,
        source : Types::ProjectSource,
        auto_retry_limit : Int32? = nil,
        badge_enabled : Bool? = nil,
        build_batch_config : Types::ProjectBuildBatchConfig? = nil,
        cache : Types::ProjectCache? = nil,
        concurrent_build_limit : Int32? = nil,
        description : String? = nil,
        encryption_key : String? = nil,
        file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
        logs_config : Types::LogsConfig? = nil,
        queued_timeout_in_minutes : Int32? = nil,
        secondary_artifacts : Array(Types::ProjectArtifacts)? = nil,
        secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
        secondary_sources : Array(Types::ProjectSource)? = nil,
        source_version : String? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout_in_minutes : Int32? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateProjectOutput

        input = Types::CreateProjectInput.new(artifacts: artifacts, environment: environment, name: name, service_role: service_role, source: source, auto_retry_limit: auto_retry_limit, badge_enabled: badge_enabled, build_batch_config: build_batch_config, cache: cache, concurrent_build_limit: concurrent_build_limit, description: description, encryption_key: encryption_key, file_system_locations: file_system_locations, logs_config: logs_config, queued_timeout_in_minutes: queued_timeout_in_minutes, secondary_artifacts: secondary_artifacts, secondary_source_versions: secondary_source_versions, secondary_sources: secondary_sources, source_version: source_version, tags: tags, timeout_in_minutes: timeout_in_minutes, vpc_config: vpc_config)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectInput) : Types::CreateProjectOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProjectOutput, "CreateProject")
      end

      # Creates a report group. A report group contains a collection of reports.

      def create_report_group(
        export_config : Types::ReportExportConfig,
        name : String,
        type : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateReportGroupOutput

        input = Types::CreateReportGroupInput.new(export_config: export_config, name: name, type: type, tags: tags)
        create_report_group(input)
      end

      def create_report_group(input : Types::CreateReportGroupInput) : Types::CreateReportGroupOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPORT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateReportGroupOutput, "CreateReportGroup")
      end

      # For an existing CodeBuild build project that has its source code stored in a GitHub or Bitbucket
      # repository, enables CodeBuild to start rebuilding the source code every time a code change is pushed
      # to the repository. If you enable webhooks for an CodeBuild project, and the project is used as a
      # build step in CodePipeline, then two identical builds are created for each commit. One build is
      # triggered through webhooks, and one through CodePipeline. Because billing is on a per-build basis,
      # you are billed for both builds. Therefore, if you are using CodePipeline, we recommend that you
      # disable webhooks in CodeBuild. In the CodeBuild console, clear the Webhook box. For more
      # information, see step 5 in Change a Build Project's Settings .

      def create_webhook(
        project_name : String,
        branch_filter : String? = nil,
        build_type : String? = nil,
        filter_groups : Array(Array(Types::WebhookFilter))? = nil,
        manual_creation : Bool? = nil,
        pull_request_build_policy : Types::PullRequestBuildPolicy? = nil,
        scope_configuration : Types::ScopeConfiguration? = nil
      ) : Types::CreateWebhookOutput

        input = Types::CreateWebhookInput.new(project_name: project_name, branch_filter: branch_filter, build_type: build_type, filter_groups: filter_groups, manual_creation: manual_creation, pull_request_build_policy: pull_request_build_policy, scope_configuration: scope_configuration)
        create_webhook(input)
      end

      def create_webhook(input : Types::CreateWebhookInput) : Types::CreateWebhookOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_WEBHOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWebhookOutput, "CreateWebhook")
      end

      # Deletes a batch build.

      def delete_build_batch(
        id : String
      ) : Types::DeleteBuildBatchOutput

        input = Types::DeleteBuildBatchInput.new(id: id)
        delete_build_batch(input)
      end

      def delete_build_batch(input : Types::DeleteBuildBatchInput) : Types::DeleteBuildBatchOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_BUILD_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBuildBatchOutput, "DeleteBuildBatch")
      end

      # Deletes a compute fleet. When you delete a compute fleet, its builds are not deleted.

      def delete_fleet(
        arn : String
      ) : Types::DeleteFleetOutput

        input = Types::DeleteFleetInput.new(arn: arn)
        delete_fleet(input)
      end

      def delete_fleet(input : Types::DeleteFleetInput) : Types::DeleteFleetOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFleetOutput, "DeleteFleet")
      end

      # Deletes a build project. When you delete a project, its builds are not deleted.

      def delete_project(
        name : String
      ) : Types::DeleteProjectOutput

        input = Types::DeleteProjectInput.new(name: name)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectInput) : Types::DeleteProjectOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProjectOutput, "DeleteProject")
      end

      # Deletes a report.

      def delete_report(
        arn : String
      ) : Types::DeleteReportOutput

        input = Types::DeleteReportInput.new(arn: arn)
        delete_report(input)
      end

      def delete_report(input : Types::DeleteReportInput) : Types::DeleteReportOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReportOutput, "DeleteReport")
      end

      # Deletes a report group. Before you delete a report group, you must delete its reports.

      def delete_report_group(
        arn : String,
        delete_reports : Bool? = nil
      ) : Types::DeleteReportGroupOutput

        input = Types::DeleteReportGroupInput.new(arn: arn, delete_reports: delete_reports)
        delete_report_group(input)
      end

      def delete_report_group(input : Types::DeleteReportGroupInput) : Types::DeleteReportGroupOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPORT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReportGroupOutput, "DeleteReportGroup")
      end

      # Deletes a resource policy that is identified by its resource ARN.

      def delete_resource_policy(
        resource_arn : String
      ) : Types::DeleteResourcePolicyOutput

        input = Types::DeleteResourcePolicyInput.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyInput) : Types::DeleteResourcePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyOutput, "DeleteResourcePolicy")
      end

      # Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials.

      def delete_source_credentials(
        arn : String
      ) : Types::DeleteSourceCredentialsOutput

        input = Types::DeleteSourceCredentialsInput.new(arn: arn)
        delete_source_credentials(input)
      end

      def delete_source_credentials(input : Types::DeleteSourceCredentialsInput) : Types::DeleteSourceCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SOURCE_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSourceCredentialsOutput, "DeleteSourceCredentials")
      end

      # For an existing CodeBuild build project that has its source code stored in a GitHub or Bitbucket
      # repository, stops CodeBuild from rebuilding the source code every time a code change is pushed to
      # the repository.

      def delete_webhook(
        project_name : String
      ) : Types::DeleteWebhookOutput

        input = Types::DeleteWebhookInput.new(project_name: project_name)
        delete_webhook(input)
      end

      def delete_webhook(input : Types::DeleteWebhookInput) : Types::DeleteWebhookOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_WEBHOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWebhookOutput, "DeleteWebhook")
      end

      # Retrieves one or more code coverage reports.

      def describe_code_coverages(
        report_arn : String,
        max_line_coverage_percentage : Float64? = nil,
        max_results : Int32? = nil,
        min_line_coverage_percentage : Float64? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::DescribeCodeCoveragesOutput

        input = Types::DescribeCodeCoveragesInput.new(report_arn: report_arn, max_line_coverage_percentage: max_line_coverage_percentage, max_results: max_results, min_line_coverage_percentage: min_line_coverage_percentage, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        describe_code_coverages(input)
      end

      def describe_code_coverages(input : Types::DescribeCodeCoveragesInput) : Types::DescribeCodeCoveragesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CODE_COVERAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCodeCoveragesOutput, "DescribeCodeCoverages")
      end

      # Returns a list of details about test cases for a report.

      def describe_test_cases(
        report_arn : String,
        filter : Types::TestCaseFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeTestCasesOutput

        input = Types::DescribeTestCasesInput.new(report_arn: report_arn, filter: filter, max_results: max_results, next_token: next_token)
        describe_test_cases(input)
      end

      def describe_test_cases(input : Types::DescribeTestCasesInput) : Types::DescribeTestCasesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TEST_CASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTestCasesOutput, "DescribeTestCases")
      end

      # Analyzes and accumulates test report values for the specified test reports.

      def get_report_group_trend(
        report_group_arn : String,
        trend_field : String,
        num_of_reports : Int32? = nil
      ) : Types::GetReportGroupTrendOutput

        input = Types::GetReportGroupTrendInput.new(report_group_arn: report_group_arn, trend_field: trend_field, num_of_reports: num_of_reports)
        get_report_group_trend(input)
      end

      def get_report_group_trend(input : Types::GetReportGroupTrendInput) : Types::GetReportGroupTrendOutput
        request = Protocol::JsonRpc.build_request(Model::GET_REPORT_GROUP_TREND, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetReportGroupTrendOutput, "GetReportGroupTrend")
      end

      # Gets a resource policy that is identified by its resource ARN.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyOutput

        input = Types::GetResourcePolicyInput.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyInput) : Types::GetResourcePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyOutput, "GetResourcePolicy")
      end

      # Imports the source repository credentials for an CodeBuild project that has its source code stored
      # in a GitHub, GitHub Enterprise, GitLab, GitLab Self Managed, or Bitbucket repository.

      def import_source_credentials(
        auth_type : String,
        server_type : String,
        token : String,
        should_overwrite : Bool? = nil,
        username : String? = nil
      ) : Types::ImportSourceCredentialsOutput

        input = Types::ImportSourceCredentialsInput.new(auth_type: auth_type, server_type: server_type, token: token, should_overwrite: should_overwrite, username: username)
        import_source_credentials(input)
      end

      def import_source_credentials(input : Types::ImportSourceCredentialsInput) : Types::ImportSourceCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::IMPORT_SOURCE_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportSourceCredentialsOutput, "ImportSourceCredentials")
      end

      # Resets the cache for a project.

      def invalidate_project_cache(
        project_name : String
      ) : Types::InvalidateProjectCacheOutput

        input = Types::InvalidateProjectCacheInput.new(project_name: project_name)
        invalidate_project_cache(input)
      end

      def invalidate_project_cache(input : Types::InvalidateProjectCacheInput) : Types::InvalidateProjectCacheOutput
        request = Protocol::JsonRpc.build_request(Model::INVALIDATE_PROJECT_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InvalidateProjectCacheOutput, "InvalidateProjectCache")
      end

      # Retrieves the identifiers of your build batches in the current region.

      def list_build_batches(
        filter : Types::BuildBatchFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListBuildBatchesOutput

        input = Types::ListBuildBatchesInput.new(filter: filter, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_build_batches(input)
      end

      def list_build_batches(input : Types::ListBuildBatchesInput) : Types::ListBuildBatchesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BUILD_BATCHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBuildBatchesOutput, "ListBuildBatches")
      end

      # Retrieves the identifiers of the build batches for a specific project.

      def list_build_batches_for_project(
        filter : Types::BuildBatchFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        project_name : String? = nil,
        sort_order : String? = nil
      ) : Types::ListBuildBatchesForProjectOutput

        input = Types::ListBuildBatchesForProjectInput.new(filter: filter, max_results: max_results, next_token: next_token, project_name: project_name, sort_order: sort_order)
        list_build_batches_for_project(input)
      end

      def list_build_batches_for_project(input : Types::ListBuildBatchesForProjectInput) : Types::ListBuildBatchesForProjectOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BUILD_BATCHES_FOR_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBuildBatchesForProjectOutput, "ListBuildBatchesForProject")
      end

      # Gets a list of build IDs, with each build ID representing a single build.

      def list_builds(
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListBuildsOutput

        input = Types::ListBuildsInput.new(next_token: next_token, sort_order: sort_order)
        list_builds(input)
      end

      def list_builds(input : Types::ListBuildsInput) : Types::ListBuildsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BUILDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBuildsOutput, "ListBuilds")
      end

      # Gets a list of build identifiers for the specified build project, with each build identifier
      # representing a single build.

      def list_builds_for_project(
        project_name : String,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListBuildsForProjectOutput

        input = Types::ListBuildsForProjectInput.new(project_name: project_name, next_token: next_token, sort_order: sort_order)
        list_builds_for_project(input)
      end

      def list_builds_for_project(input : Types::ListBuildsForProjectInput) : Types::ListBuildsForProjectOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BUILDS_FOR_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBuildsForProjectOutput, "ListBuildsForProject")
      end

      # Gets a list of command executions for a sandbox.

      def list_command_executions_for_sandbox(
        sandbox_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListCommandExecutionsForSandboxOutput

        input = Types::ListCommandExecutionsForSandboxInput.new(sandbox_id: sandbox_id, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_command_executions_for_sandbox(input)
      end

      def list_command_executions_for_sandbox(input : Types::ListCommandExecutionsForSandboxInput) : Types::ListCommandExecutionsForSandboxOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_COMMAND_EXECUTIONS_FOR_SANDBOX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCommandExecutionsForSandboxOutput, "ListCommandExecutionsForSandbox")
      end

      # Gets information about Docker images that are managed by CodeBuild.

      def list_curated_environment_images : Types::ListCuratedEnvironmentImagesOutput
        input = Types::ListCuratedEnvironmentImagesInput.new
        list_curated_environment_images(input)
      end

      def list_curated_environment_images(input : Types::ListCuratedEnvironmentImagesInput) : Types::ListCuratedEnvironmentImagesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CURATED_ENVIRONMENT_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCuratedEnvironmentImagesOutput, "ListCuratedEnvironmentImages")
      end

      # Gets a list of compute fleet names with each compute fleet name representing a single compute fleet.

      def list_fleets(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListFleetsOutput

        input = Types::ListFleetsInput.new(max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_fleets(input)
      end

      def list_fleets(input : Types::ListFleetsInput) : Types::ListFleetsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFleetsOutput, "ListFleets")
      end

      # Gets a list of build project names, with each build project name representing a single build
      # project.

      def list_projects(
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListProjectsOutput

        input = Types::ListProjectsInput.new(next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_projects(input)
      end

      def list_projects(input : Types::ListProjectsInput) : Types::ListProjectsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProjectsOutput, "ListProjects")
      end

      # Gets a list ARNs for the report groups in the current Amazon Web Services account.

      def list_report_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListReportGroupsOutput

        input = Types::ListReportGroupsInput.new(max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_report_groups(input)
      end

      def list_report_groups(input : Types::ListReportGroupsInput) : Types::ListReportGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPORT_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReportGroupsOutput, "ListReportGroups")
      end

      # Returns a list of ARNs for the reports in the current Amazon Web Services account.

      def list_reports(
        filter : Types::ReportFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListReportsOutput

        input = Types::ListReportsInput.new(filter: filter, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_reports(input)
      end

      def list_reports(input : Types::ListReportsInput) : Types::ListReportsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReportsOutput, "ListReports")
      end

      # Returns a list of ARNs for the reports that belong to a ReportGroup .

      def list_reports_for_report_group(
        report_group_arn : String,
        filter : Types::ReportFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListReportsForReportGroupOutput

        input = Types::ListReportsForReportGroupInput.new(report_group_arn: report_group_arn, filter: filter, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_reports_for_report_group(input)
      end

      def list_reports_for_report_group(input : Types::ListReportsForReportGroupInput) : Types::ListReportsForReportGroupOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPORTS_FOR_REPORT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReportsForReportGroupOutput, "ListReportsForReportGroup")
      end

      # Gets a list of sandboxes.

      def list_sandboxes(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListSandboxesOutput

        input = Types::ListSandboxesInput.new(max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_sandboxes(input)
      end

      def list_sandboxes(input : Types::ListSandboxesInput) : Types::ListSandboxesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SANDBOXES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSandboxesOutput, "ListSandboxes")
      end

      # Gets a list of sandboxes for a given project.

      def list_sandboxes_for_project(
        project_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListSandboxesForProjectOutput

        input = Types::ListSandboxesForProjectInput.new(project_name: project_name, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_sandboxes_for_project(input)
      end

      def list_sandboxes_for_project(input : Types::ListSandboxesForProjectInput) : Types::ListSandboxesForProjectOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SANDBOXES_FOR_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSandboxesForProjectOutput, "ListSandboxesForProject")
      end

      # Gets a list of projects that are shared with other Amazon Web Services accounts or users.

      def list_shared_projects(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListSharedProjectsOutput

        input = Types::ListSharedProjectsInput.new(max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_shared_projects(input)
      end

      def list_shared_projects(input : Types::ListSharedProjectsInput) : Types::ListSharedProjectsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SHARED_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSharedProjectsOutput, "ListSharedProjects")
      end

      # Gets a list of report groups that are shared with other Amazon Web Services accounts or users.

      def list_shared_report_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListSharedReportGroupsOutput

        input = Types::ListSharedReportGroupsInput.new(max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_shared_report_groups(input)
      end

      def list_shared_report_groups(input : Types::ListSharedReportGroupsInput) : Types::ListSharedReportGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SHARED_REPORT_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSharedReportGroupsOutput, "ListSharedReportGroups")
      end

      # Returns a list of SourceCredentialsInfo objects.

      def list_source_credentials : Types::ListSourceCredentialsOutput
        input = Types::ListSourceCredentialsInput.new
        list_source_credentials(input)
      end

      def list_source_credentials(input : Types::ListSourceCredentialsInput) : Types::ListSourceCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SOURCE_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSourceCredentialsOutput, "ListSourceCredentials")
      end

      # Stores a resource policy for the ARN of a Project or ReportGroup object.

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Types::PutResourcePolicyOutput

        input = Types::PutResourcePolicyInput.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyInput) : Types::PutResourcePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyOutput, "PutResourcePolicy")
      end

      # Restarts a build.

      def retry_build(
        id : String? = nil,
        idempotency_token : String? = nil
      ) : Types::RetryBuildOutput

        input = Types::RetryBuildInput.new(id: id, idempotency_token: idempotency_token)
        retry_build(input)
      end

      def retry_build(input : Types::RetryBuildInput) : Types::RetryBuildOutput
        request = Protocol::JsonRpc.build_request(Model::RETRY_BUILD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetryBuildOutput, "RetryBuild")
      end

      # Restarts a failed batch build. Only batch builds that have failed can be retried.

      def retry_build_batch(
        id : String? = nil,
        idempotency_token : String? = nil,
        retry_type : String? = nil
      ) : Types::RetryBuildBatchOutput

        input = Types::RetryBuildBatchInput.new(id: id, idempotency_token: idempotency_token, retry_type: retry_type)
        retry_build_batch(input)
      end

      def retry_build_batch(input : Types::RetryBuildBatchInput) : Types::RetryBuildBatchOutput
        request = Protocol::JsonRpc.build_request(Model::RETRY_BUILD_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetryBuildBatchOutput, "RetryBuildBatch")
      end

      # Starts running a build with the settings defined in the project. These setting include: how to run a
      # build, where to get the source code, which build environment to use, which build commands to run,
      # and where to store the build output. You can also start a build run by overriding some of the build
      # settings in the project. The overrides only apply for that specific start build request. The
      # settings in the project are unaltered.

      def start_build(
        project_name : String,
        artifacts_override : Types::ProjectArtifacts? = nil,
        auto_retry_limit_override : Int32? = nil,
        build_status_config_override : Types::BuildStatusConfig? = nil,
        buildspec_override : String? = nil,
        cache_override : Types::ProjectCache? = nil,
        certificate_override : String? = nil,
        compute_type_override : String? = nil,
        debug_session_enabled : Bool? = nil,
        encryption_key_override : String? = nil,
        environment_type_override : String? = nil,
        environment_variables_override : Array(Types::EnvironmentVariable)? = nil,
        fleet_override : Types::ProjectFleet? = nil,
        git_clone_depth_override : Int32? = nil,
        git_submodules_config_override : Types::GitSubmodulesConfig? = nil,
        idempotency_token : String? = nil,
        image_override : String? = nil,
        image_pull_credentials_type_override : String? = nil,
        insecure_ssl_override : Bool? = nil,
        logs_config_override : Types::LogsConfig? = nil,
        privileged_mode_override : Bool? = nil,
        queued_timeout_in_minutes_override : Int32? = nil,
        registry_credential_override : Types::RegistryCredential? = nil,
        report_build_status_override : Bool? = nil,
        secondary_artifacts_override : Array(Types::ProjectArtifacts)? = nil,
        secondary_sources_override : Array(Types::ProjectSource)? = nil,
        secondary_sources_version_override : Array(Types::ProjectSourceVersion)? = nil,
        service_role_override : String? = nil,
        source_auth_override : Types::SourceAuth? = nil,
        source_location_override : String? = nil,
        source_type_override : String? = nil,
        source_version : String? = nil,
        timeout_in_minutes_override : Int32? = nil
      ) : Types::StartBuildOutput

        input = Types::StartBuildInput.new(project_name: project_name, artifacts_override: artifacts_override, auto_retry_limit_override: auto_retry_limit_override, build_status_config_override: build_status_config_override, buildspec_override: buildspec_override, cache_override: cache_override, certificate_override: certificate_override, compute_type_override: compute_type_override, debug_session_enabled: debug_session_enabled, encryption_key_override: encryption_key_override, environment_type_override: environment_type_override, environment_variables_override: environment_variables_override, fleet_override: fleet_override, git_clone_depth_override: git_clone_depth_override, git_submodules_config_override: git_submodules_config_override, idempotency_token: idempotency_token, image_override: image_override, image_pull_credentials_type_override: image_pull_credentials_type_override, insecure_ssl_override: insecure_ssl_override, logs_config_override: logs_config_override, privileged_mode_override: privileged_mode_override, queued_timeout_in_minutes_override: queued_timeout_in_minutes_override, registry_credential_override: registry_credential_override, report_build_status_override: report_build_status_override, secondary_artifacts_override: secondary_artifacts_override, secondary_sources_override: secondary_sources_override, secondary_sources_version_override: secondary_sources_version_override, service_role_override: service_role_override, source_auth_override: source_auth_override, source_location_override: source_location_override, source_type_override: source_type_override, source_version: source_version, timeout_in_minutes_override: timeout_in_minutes_override)
        start_build(input)
      end

      def start_build(input : Types::StartBuildInput) : Types::StartBuildOutput
        request = Protocol::JsonRpc.build_request(Model::START_BUILD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartBuildOutput, "StartBuild")
      end

      # Starts a batch build for a project.

      def start_build_batch(
        project_name : String,
        artifacts_override : Types::ProjectArtifacts? = nil,
        build_batch_config_override : Types::ProjectBuildBatchConfig? = nil,
        build_timeout_in_minutes_override : Int32? = nil,
        buildspec_override : String? = nil,
        cache_override : Types::ProjectCache? = nil,
        certificate_override : String? = nil,
        compute_type_override : String? = nil,
        debug_session_enabled : Bool? = nil,
        encryption_key_override : String? = nil,
        environment_type_override : String? = nil,
        environment_variables_override : Array(Types::EnvironmentVariable)? = nil,
        git_clone_depth_override : Int32? = nil,
        git_submodules_config_override : Types::GitSubmodulesConfig? = nil,
        idempotency_token : String? = nil,
        image_override : String? = nil,
        image_pull_credentials_type_override : String? = nil,
        insecure_ssl_override : Bool? = nil,
        logs_config_override : Types::LogsConfig? = nil,
        privileged_mode_override : Bool? = nil,
        queued_timeout_in_minutes_override : Int32? = nil,
        registry_credential_override : Types::RegistryCredential? = nil,
        report_build_batch_status_override : Bool? = nil,
        secondary_artifacts_override : Array(Types::ProjectArtifacts)? = nil,
        secondary_sources_override : Array(Types::ProjectSource)? = nil,
        secondary_sources_version_override : Array(Types::ProjectSourceVersion)? = nil,
        service_role_override : String? = nil,
        source_auth_override : Types::SourceAuth? = nil,
        source_location_override : String? = nil,
        source_type_override : String? = nil,
        source_version : String? = nil
      ) : Types::StartBuildBatchOutput

        input = Types::StartBuildBatchInput.new(project_name: project_name, artifacts_override: artifacts_override, build_batch_config_override: build_batch_config_override, build_timeout_in_minutes_override: build_timeout_in_minutes_override, buildspec_override: buildspec_override, cache_override: cache_override, certificate_override: certificate_override, compute_type_override: compute_type_override, debug_session_enabled: debug_session_enabled, encryption_key_override: encryption_key_override, environment_type_override: environment_type_override, environment_variables_override: environment_variables_override, git_clone_depth_override: git_clone_depth_override, git_submodules_config_override: git_submodules_config_override, idempotency_token: idempotency_token, image_override: image_override, image_pull_credentials_type_override: image_pull_credentials_type_override, insecure_ssl_override: insecure_ssl_override, logs_config_override: logs_config_override, privileged_mode_override: privileged_mode_override, queued_timeout_in_minutes_override: queued_timeout_in_minutes_override, registry_credential_override: registry_credential_override, report_build_batch_status_override: report_build_batch_status_override, secondary_artifacts_override: secondary_artifacts_override, secondary_sources_override: secondary_sources_override, secondary_sources_version_override: secondary_sources_version_override, service_role_override: service_role_override, source_auth_override: source_auth_override, source_location_override: source_location_override, source_type_override: source_type_override, source_version: source_version)
        start_build_batch(input)
      end

      def start_build_batch(input : Types::StartBuildBatchInput) : Types::StartBuildBatchOutput
        request = Protocol::JsonRpc.build_request(Model::START_BUILD_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartBuildBatchOutput, "StartBuildBatch")
      end

      # Starts a command execution.

      def start_command_execution(
        command : String,
        sandbox_id : String,
        type : String? = nil
      ) : Types::StartCommandExecutionOutput

        input = Types::StartCommandExecutionInput.new(command: command, sandbox_id: sandbox_id, type: type)
        start_command_execution(input)
      end

      def start_command_execution(input : Types::StartCommandExecutionInput) : Types::StartCommandExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::START_COMMAND_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCommandExecutionOutput, "StartCommandExecution")
      end

      # Starts a sandbox.

      def start_sandbox(
        idempotency_token : String? = nil,
        project_name : String? = nil
      ) : Types::StartSandboxOutput

        input = Types::StartSandboxInput.new(idempotency_token: idempotency_token, project_name: project_name)
        start_sandbox(input)
      end

      def start_sandbox(input : Types::StartSandboxInput) : Types::StartSandboxOutput
        request = Protocol::JsonRpc.build_request(Model::START_SANDBOX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSandboxOutput, "StartSandbox")
      end

      # Starts a sandbox connection.

      def start_sandbox_connection(
        sandbox_id : String
      ) : Types::StartSandboxConnectionOutput

        input = Types::StartSandboxConnectionInput.new(sandbox_id: sandbox_id)
        start_sandbox_connection(input)
      end

      def start_sandbox_connection(input : Types::StartSandboxConnectionInput) : Types::StartSandboxConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::START_SANDBOX_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSandboxConnectionOutput, "StartSandboxConnection")
      end

      # Attempts to stop running a build.

      def stop_build(
        id : String
      ) : Types::StopBuildOutput

        input = Types::StopBuildInput.new(id: id)
        stop_build(input)
      end

      def stop_build(input : Types::StopBuildInput) : Types::StopBuildOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_BUILD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopBuildOutput, "StopBuild")
      end

      # Stops a running batch build.

      def stop_build_batch(
        id : String
      ) : Types::StopBuildBatchOutput

        input = Types::StopBuildBatchInput.new(id: id)
        stop_build_batch(input)
      end

      def stop_build_batch(input : Types::StopBuildBatchInput) : Types::StopBuildBatchOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_BUILD_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopBuildBatchOutput, "StopBuildBatch")
      end

      # Stops a sandbox.

      def stop_sandbox(
        id : String
      ) : Types::StopSandboxOutput

        input = Types::StopSandboxInput.new(id: id)
        stop_sandbox(input)
      end

      def stop_sandbox(input : Types::StopSandboxInput) : Types::StopSandboxOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_SANDBOX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopSandboxOutput, "StopSandbox")
      end

      # Updates a compute fleet.

      def update_fleet(
        arn : String,
        base_capacity : Int32? = nil,
        compute_configuration : Types::ComputeConfiguration? = nil,
        compute_type : String? = nil,
        environment_type : String? = nil,
        fleet_service_role : String? = nil,
        image_id : String? = nil,
        overflow_behavior : String? = nil,
        proxy_configuration : Types::ProxyConfiguration? = nil,
        scaling_configuration : Types::ScalingConfigurationInput? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::UpdateFleetOutput

        input = Types::UpdateFleetInput.new(arn: arn, base_capacity: base_capacity, compute_configuration: compute_configuration, compute_type: compute_type, environment_type: environment_type, fleet_service_role: fleet_service_role, image_id: image_id, overflow_behavior: overflow_behavior, proxy_configuration: proxy_configuration, scaling_configuration: scaling_configuration, tags: tags, vpc_config: vpc_config)
        update_fleet(input)
      end

      def update_fleet(input : Types::UpdateFleetInput) : Types::UpdateFleetOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFleetOutput, "UpdateFleet")
      end

      # Changes the settings of a build project.

      def update_project(
        name : String,
        artifacts : Types::ProjectArtifacts? = nil,
        auto_retry_limit : Int32? = nil,
        badge_enabled : Bool? = nil,
        build_batch_config : Types::ProjectBuildBatchConfig? = nil,
        cache : Types::ProjectCache? = nil,
        concurrent_build_limit : Int32? = nil,
        description : String? = nil,
        encryption_key : String? = nil,
        environment : Types::ProjectEnvironment? = nil,
        file_system_locations : Array(Types::ProjectFileSystemLocation)? = nil,
        logs_config : Types::LogsConfig? = nil,
        queued_timeout_in_minutes : Int32? = nil,
        secondary_artifacts : Array(Types::ProjectArtifacts)? = nil,
        secondary_source_versions : Array(Types::ProjectSourceVersion)? = nil,
        secondary_sources : Array(Types::ProjectSource)? = nil,
        service_role : String? = nil,
        source : Types::ProjectSource? = nil,
        source_version : String? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout_in_minutes : Int32? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::UpdateProjectOutput

        input = Types::UpdateProjectInput.new(name: name, artifacts: artifacts, auto_retry_limit: auto_retry_limit, badge_enabled: badge_enabled, build_batch_config: build_batch_config, cache: cache, concurrent_build_limit: concurrent_build_limit, description: description, encryption_key: encryption_key, environment: environment, file_system_locations: file_system_locations, logs_config: logs_config, queued_timeout_in_minutes: queued_timeout_in_minutes, secondary_artifacts: secondary_artifacts, secondary_source_versions: secondary_source_versions, secondary_sources: secondary_sources, service_role: service_role, source: source, source_version: source_version, tags: tags, timeout_in_minutes: timeout_in_minutes, vpc_config: vpc_config)
        update_project(input)
      end

      def update_project(input : Types::UpdateProjectInput) : Types::UpdateProjectOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProjectOutput, "UpdateProject")
      end

      # Changes the public visibility for a project. The project's build results, logs, and artifacts are
      # available to the general public. For more information, see Public build projects in the CodeBuild
      # User Guide . The following should be kept in mind when making your projects public: All of a
      # project's build results, logs, and artifacts, including builds that were run when the project was
      # private, are available to the general public. All build logs and artifacts are available to the
      # public. Environment variables, source code, and other sensitive information may have been output to
      # the build logs and artifacts. You must be careful about what information is output to the build
      # logs. Some best practice are: Do not store sensitive values in environment variables. We recommend
      # that you use an Amazon EC2 Systems Manager Parameter Store or Secrets Manager to store sensitive
      # values. Follow Best practices for using webhooks in the CodeBuild User Guide to limit which entities
      # can trigger a build, and do not store the buildspec in the project itself, to ensure that your
      # webhooks are as secure as possible. A malicious user can use public builds to distribute malicious
      # artifacts. We recommend that you review all pull requests to verify that the pull request is a
      # legitimate change. We also recommend that you validate any artifacts with their checksums to make
      # sure that the correct artifacts are being downloaded.

      def update_project_visibility(
        project_arn : String,
        project_visibility : String,
        resource_access_role : String? = nil
      ) : Types::UpdateProjectVisibilityOutput

        input = Types::UpdateProjectVisibilityInput.new(project_arn: project_arn, project_visibility: project_visibility, resource_access_role: resource_access_role)
        update_project_visibility(input)
      end

      def update_project_visibility(input : Types::UpdateProjectVisibilityInput) : Types::UpdateProjectVisibilityOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROJECT_VISIBILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProjectVisibilityOutput, "UpdateProjectVisibility")
      end

      # Updates a report group.

      def update_report_group(
        arn : String,
        export_config : Types::ReportExportConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::UpdateReportGroupOutput

        input = Types::UpdateReportGroupInput.new(arn: arn, export_config: export_config, tags: tags)
        update_report_group(input)
      end

      def update_report_group(input : Types::UpdateReportGroupInput) : Types::UpdateReportGroupOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REPORT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateReportGroupOutput, "UpdateReportGroup")
      end

      # Updates the webhook associated with an CodeBuild build project. If you use Bitbucket for your
      # repository, rotateSecret is ignored.

      def update_webhook(
        project_name : String,
        branch_filter : String? = nil,
        build_type : String? = nil,
        filter_groups : Array(Array(Types::WebhookFilter))? = nil,
        pull_request_build_policy : Types::PullRequestBuildPolicy? = nil,
        rotate_secret : Bool? = nil
      ) : Types::UpdateWebhookOutput

        input = Types::UpdateWebhookInput.new(project_name: project_name, branch_filter: branch_filter, build_type: build_type, filter_groups: filter_groups, pull_request_build_policy: pull_request_build_policy, rotate_secret: rotate_secret)
        update_webhook(input)
      end

      def update_webhook(input : Types::UpdateWebhookInput) : Types::UpdateWebhookOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WEBHOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWebhookOutput, "UpdateWebhook")
      end
    end
  end
end
