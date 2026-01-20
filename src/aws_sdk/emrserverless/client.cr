module AwsSdk
  module EMRServerless
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

      # Cancels a job run.

      def cancel_job_run(
        application_id : String,
        job_run_id : String,
        shutdown_grace_period_in_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::CancelJobRunRequest.new(application_id: application_id, job_run_id: job_run_id, shutdown_grace_period_in_seconds: shutdown_grace_period_in_seconds)
        cancel_job_run(input)
      end

      def cancel_job_run(input : Types::CancelJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an application.

      def create_application(
        client_token : String,
        release_label : String,
        type : String,
        architecture : String? = nil,
        auto_start_configuration : Types::AutoStartConfig? = nil,
        auto_stop_configuration : Types::AutoStopConfig? = nil,
        disk_encryption_configuration : Types::DiskEncryptionConfiguration? = nil,
        identity_center_configuration : Types::IdentityCenterConfigurationInput? = nil,
        image_configuration : Types::ImageConfigurationInput? = nil,
        initial_capacity : Hash(String, Types::InitialCapacityConfig)? = nil,
        interactive_configuration : Types::InteractiveConfiguration? = nil,
        job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration? = nil,
        maximum_capacity : Types::MaximumAllowedResources? = nil,
        monitoring_configuration : Types::MonitoringConfiguration? = nil,
        name : String? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        runtime_configuration : Array(Types::Configuration)? = nil,
        scheduler_configuration : Types::SchedulerConfiguration? = nil,
        tags : Hash(String, String)? = nil,
        worker_type_specifications : Hash(String, Types::WorkerTypeSpecificationInput)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(client_token: client_token, release_label: release_label, type: type, architecture: architecture, auto_start_configuration: auto_start_configuration, auto_stop_configuration: auto_stop_configuration, disk_encryption_configuration: disk_encryption_configuration, identity_center_configuration: identity_center_configuration, image_configuration: image_configuration, initial_capacity: initial_capacity, interactive_configuration: interactive_configuration, job_level_cost_allocation_configuration: job_level_cost_allocation_configuration, maximum_capacity: maximum_capacity, monitoring_configuration: monitoring_configuration, name: name, network_configuration: network_configuration, runtime_configuration: runtime_configuration, scheduler_configuration: scheduler_configuration, tags: tags, worker_type_specifications: worker_type_specifications)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an application. An application has to be in a stopped or created state in order to be
      # deleted.

      def delete_application(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application_id: application_id)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays detailed information about a specified application.

      def get_application(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(application_id: application_id)
        get_application(input)
      end

      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and returns a URL that you can use to access the application UIs for a job run. For jobs in
      # a running state, the application UI is a live user interface such as the Spark or Tez web UI. For
      # completed jobs, the application UI is a persistent application user interface such as the Spark
      # History Server or persistent Tez UI. The URL is valid for one hour after you generate it. To access
      # the application UI after that hour elapses, you must invoke the API again to generate a new URL.

      def get_dashboard_for_job_run(
        application_id : String,
        job_run_id : String,
        access_system_profile_logs : Bool? = nil,
        attempt : Int32? = nil
      ) : Protocol::Request
        input = Types::GetDashboardForJobRunRequest.new(application_id: application_id, job_run_id: job_run_id, access_system_profile_logs: access_system_profile_logs, attempt: attempt)
        get_dashboard_for_job_run(input)
      end

      def get_dashboard_for_job_run(input : Types::GetDashboardForJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DASHBOARD_FOR_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays detailed information about a job run.

      def get_job_run(
        application_id : String,
        job_run_id : String,
        attempt : Int32? = nil
      ) : Protocol::Request
        input = Types::GetJobRunRequest.new(application_id: application_id, job_run_id: job_run_id, attempt: attempt)
        get_job_run(input)
      end

      def get_job_run(input : Types::GetJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists applications based on a set of parameters.

      def list_applications(
        max_results : Int32? = nil,
        next_token : String? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(max_results: max_results, next_token: next_token, states: states)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all attempt of a job run.

      def list_job_run_attempts(
        application_id : String,
        job_run_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobRunAttemptsRequest.new(application_id: application_id, job_run_id: job_run_id, max_results: max_results, next_token: next_token)
        list_job_run_attempts(input)
      end

      def list_job_run_attempts(input : Types::ListJobRunAttemptsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_RUN_ATTEMPTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists job runs based on a set of parameters.

      def list_job_runs(
        application_id : String,
        created_at_after : Time? = nil,
        created_at_before : Time? = nil,
        max_results : Int32? = nil,
        mode : String? = nil,
        next_token : String? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListJobRunsRequest.new(application_id: application_id, created_at_after: created_at_after, created_at_before: created_at_before, max_results: max_results, mode: mode, next_token: next_token, states: states)
        list_job_runs(input)
      end

      def list_job_runs(input : Types::ListJobRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags assigned to the resources.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a specified application and initializes initial capacity if configured.

      def start_application(
        application_id : String
      ) : Protocol::Request
        input = Types::StartApplicationRequest.new(application_id: application_id)
        start_application(input)
      end

      def start_application(input : Types::StartApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a job run.

      def start_job_run(
        application_id : String,
        client_token : String,
        execution_role_arn : String,
        configuration_overrides : Types::ConfigurationOverrides? = nil,
        execution_iam_policy : Types::JobRunExecutionIamPolicy? = nil,
        execution_timeout_minutes : Int64? = nil,
        job_driver : Types::JobDriver? = nil,
        mode : String? = nil,
        name : String? = nil,
        retry_policy : Types::RetryPolicy? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartJobRunRequest.new(application_id: application_id, client_token: client_token, execution_role_arn: execution_role_arn, configuration_overrides: configuration_overrides, execution_iam_policy: execution_iam_policy, execution_timeout_minutes: execution_timeout_minutes, job_driver: job_driver, mode: mode, name: name, retry_policy: retry_policy, tags: tags)
        start_job_run(input)
      end

      def start_job_run(input : Types::StartJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a specified application and releases initial capacity if configured. All scheduled and running
      # jobs must be completed or cancelled before stopping an application.

      def stop_application(
        application_id : String
      ) : Protocol::Request
        input = Types::StopApplicationRequest.new(application_id: application_id)
        stop_application(input)
      end

      def stop_application(input : Types::StopApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns tags to resources. A tag is a label that you assign to an Amazon Web Services resource. Each
      # tag consists of a key and an optional value, both of which you define. Tags enable you to categorize
      # your Amazon Web Services resources by attributes such as purpose, owner, or environment. When you
      # have many resources of the same type, you can quickly identify a specific resource based on the tags
      # you've assigned to it.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from resources.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a specified application. An application has to be in a stopped or created state in order to
      # be updated.

      def update_application(
        application_id : String,
        client_token : String,
        architecture : String? = nil,
        auto_start_configuration : Types::AutoStartConfig? = nil,
        auto_stop_configuration : Types::AutoStopConfig? = nil,
        disk_encryption_configuration : Types::DiskEncryptionConfiguration? = nil,
        identity_center_configuration : Types::IdentityCenterConfigurationInput? = nil,
        image_configuration : Types::ImageConfigurationInput? = nil,
        initial_capacity : Hash(String, Types::InitialCapacityConfig)? = nil,
        interactive_configuration : Types::InteractiveConfiguration? = nil,
        job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration? = nil,
        maximum_capacity : Types::MaximumAllowedResources? = nil,
        monitoring_configuration : Types::MonitoringConfiguration? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        release_label : String? = nil,
        runtime_configuration : Array(Types::Configuration)? = nil,
        scheduler_configuration : Types::SchedulerConfiguration? = nil,
        worker_type_specifications : Hash(String, Types::WorkerTypeSpecificationInput)? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(application_id: application_id, client_token: client_token, architecture: architecture, auto_start_configuration: auto_start_configuration, auto_stop_configuration: auto_stop_configuration, disk_encryption_configuration: disk_encryption_configuration, identity_center_configuration: identity_center_configuration, image_configuration: image_configuration, initial_capacity: initial_capacity, interactive_configuration: interactive_configuration, job_level_cost_allocation_configuration: job_level_cost_allocation_configuration, maximum_capacity: maximum_capacity, monitoring_configuration: monitoring_configuration, network_configuration: network_configuration, release_label: release_label, runtime_configuration: runtime_configuration, scheduler_configuration: scheduler_configuration, worker_type_specifications: worker_type_specifications)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
