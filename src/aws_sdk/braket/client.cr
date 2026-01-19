module AwsSdk
  module Braket
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

      # Cancels an Amazon Braket hybrid job.
      def cancel_job(
        job_arn : String
      ) : Protocol::Request
        input = Types::CancelJobRequest.new(job_arn: job_arn)
        cancel_job(input)
      end
      def cancel_job(input : Types::CancelJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the specified task.
      def cancel_quantum_task(
        client_token : String,
        quantum_task_arn : String
      ) : Protocol::Request
        input = Types::CancelQuantumTaskRequest.new(client_token: client_token, quantum_task_arn: quantum_task_arn)
        cancel_quantum_task(input)
      end
      def cancel_quantum_task(input : Types::CancelQuantumTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_QUANTUM_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Braket hybrid job.
      def create_job(
        algorithm_specification : Types::AlgorithmSpecification,
        client_token : String,
        device_config : Types::DeviceConfig,
        instance_config : Types::InstanceConfig,
        job_name : String,
        output_data_config : Types::JobOutputDataConfig,
        role_arn : String,
        associations : Array(Types::Association)? = nil,
        checkpoint_config : Types::JobCheckpointConfig? = nil,
        hyper_parameters : Hash(String, String)? = nil,
        input_data_config : Array(Types::InputFileConfig)? = nil,
        stopping_condition : Types::JobStoppingCondition? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateJobRequest.new(algorithm_specification: algorithm_specification, client_token: client_token, device_config: device_config, instance_config: instance_config, job_name: job_name, output_data_config: output_data_config, role_arn: role_arn, associations: associations, checkpoint_config: checkpoint_config, hyper_parameters: hyper_parameters, input_data_config: input_data_config, stopping_condition: stopping_condition, tags: tags)
        create_job(input)
      end
      def create_job(input : Types::CreateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a quantum task.
      def create_quantum_task(
        action : String,
        client_token : String,
        device_arn : String,
        output_s3_bucket : String,
        output_s3_key_prefix : String,
        shots : Int64,
        associations : Array(Types::Association)? = nil,
        device_parameters : String? = nil,
        experimental_capabilities : Types::ExperimentalCapabilities? = nil,
        job_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateQuantumTaskRequest.new(action: action, client_token: client_token, device_arn: device_arn, output_s3_bucket: output_s3_bucket, output_s3_key_prefix: output_s3_key_prefix, shots: shots, associations: associations, device_parameters: device_parameters, experimental_capabilities: experimental_capabilities, job_token: job_token, tags: tags)
        create_quantum_task(input)
      end
      def create_quantum_task(input : Types::CreateQuantumTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUANTUM_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a spending limit for a specified quantum device. Spending limits help you control costs by
      # setting maximum amounts that can be spent on quantum computing tasks within a specified time period.
      # Simulators do not support spending limits.
      def create_spending_limit(
        client_token : String,
        device_arn : String,
        spending_limit : String,
        tags : Hash(String, String)? = nil,
        time_period : Types::TimePeriod? = nil
      ) : Protocol::Request
        input = Types::CreateSpendingLimitRequest.new(client_token: client_token, device_arn: device_arn, spending_limit: spending_limit, tags: tags, time_period: time_period)
        create_spending_limit(input)
      end
      def create_spending_limit(input : Types::CreateSpendingLimitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SPENDING_LIMIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing spending limit. This operation permanently removes the spending limit and cannot
      # be undone. After deletion, the associated device becomes unrestricted for spending.
      def delete_spending_limit(
        spending_limit_arn : String
      ) : Protocol::Request
        input = Types::DeleteSpendingLimitRequest.new(spending_limit_arn: spending_limit_arn)
        delete_spending_limit(input)
      end
      def delete_spending_limit(input : Types::DeleteSpendingLimitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SPENDING_LIMIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the devices available in Amazon Braket. For backwards compatibility with older versions of
      # BraketSchemas, OpenQASM information is omitted from GetDevice API calls. To get this information the
      # user-agent needs to present a recent version of the BraketSchemas (1.8.0 or later). The Braket SDK
      # automatically reports this for you. If you do not see OpenQASM results in the GetDevice response
      # when using a Braket SDK, you may need to set AWS_EXECUTION_ENV environment variable to configure
      # user-agent. See the code examples provided below for how to do this for the AWS CLI, Boto3, and the
      # Go, Java, and JavaScript/TypeScript SDKs.
      def get_device(
        device_arn : String
      ) : Protocol::Request
        input = Types::GetDeviceRequest.new(device_arn: device_arn)
        get_device(input)
      end
      def get_device(input : Types::GetDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified Amazon Braket hybrid job.
      def get_job(
        job_arn : String,
        additional_attribute_names : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetJobRequest.new(job_arn: job_arn, additional_attribute_names: additional_attribute_names)
        get_job(input)
      end
      def get_job(input : Types::GetJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified quantum task.
      def get_quantum_task(
        quantum_task_arn : String,
        additional_attribute_names : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetQuantumTaskRequest.new(quantum_task_arn: quantum_task_arn, additional_attribute_names: additional_attribute_names)
        get_quantum_task(input)
      end
      def get_quantum_task(input : Types::GetQuantumTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUANTUM_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Shows the tags associated with this resource.
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

      # Searches for devices using the specified filters.
      def search_devices(
        filters : Array(Types::SearchDevicesFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchDevicesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        search_devices(input)
      end
      def search_devices(input : Types::SearchDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for Amazon Braket hybrid jobs that match the specified filter values.
      def search_jobs(
        filters : Array(Types::SearchJobsFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchJobsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        search_jobs(input)
      end
      def search_jobs(input : Types::SearchJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for tasks that match the specified filter values.
      def search_quantum_tasks(
        filters : Array(Types::SearchQuantumTasksFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchQuantumTasksRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        search_quantum_tasks(input)
      end
      def search_quantum_tasks(input : Types::SearchQuantumTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_QUANTUM_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches and lists spending limits based on specified filters. This operation supports pagination
      # and allows filtering by various criteria to find specific spending limits. We recommend using
      # pagination to ensure that the operation returns quickly and successfully.
      def search_spending_limits(
        filters : Array(Types::SearchSpendingLimitsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchSpendingLimitsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        search_spending_limits(input)
      end
      def search_spending_limits(input : Types::SearchSpendingLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_SPENDING_LIMITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add a tag to the specified resource.
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

      # Remove tags from a resource.
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

      # Updates an existing spending limit. You can modify the spending amount or time period. Changes take
      # effect immediately.
      def update_spending_limit(
        client_token : String,
        spending_limit_arn : String,
        spending_limit : String? = nil,
        time_period : Types::TimePeriod? = nil
      ) : Protocol::Request
        input = Types::UpdateSpendingLimitRequest.new(client_token: client_token, spending_limit_arn: spending_limit_arn, spending_limit: spending_limit, time_period: time_period)
        update_spending_limit(input)
      end
      def update_spending_limit(input : Types::UpdateSpendingLimitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SPENDING_LIMIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
