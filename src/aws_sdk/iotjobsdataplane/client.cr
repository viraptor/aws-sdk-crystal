module AwsSdk
  module IoTJobsDataPlane
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

      # Gets details of a job execution. Requires permission to access the DescribeJobExecution action.

      def describe_job_execution(
        job_id : String,
        thing_name : String,
        execution_number : Int64? = nil,
        include_job_document : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeJobExecutionRequest.new(job_id: job_id, thing_name: thing_name, execution_number: execution_number, include_job_document: include_job_document)
        describe_job_execution(input)
      end

      def describe_job_execution(input : Types::DescribeJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the list of all jobs for a thing that are not in a terminal status. Requires permission to
      # access the GetPendingJobExecutions action.

      def get_pending_job_executions(
        thing_name : String
      ) : Protocol::Request
        input = Types::GetPendingJobExecutionsRequest.new(thing_name: thing_name)
        get_pending_job_executions(input)
      end

      def get_pending_job_executions(input : Types::GetPendingJobExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PENDING_JOB_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Using the command created with the CreateCommand API, start a command execution on a specific
      # device.

      def start_command_execution(
        command_arn : String,
        target_arn : String,
        client_token : String? = nil,
        execution_timeout_seconds : Int64? = nil,
        parameters : Hash(String, Types::CommandParameterValue)? = nil
      ) : Protocol::Request
        input = Types::StartCommandExecutionRequest.new(command_arn: command_arn, target_arn: target_arn, client_token: client_token, execution_timeout_seconds: execution_timeout_seconds, parameters: parameters)
        start_command_execution(input)
      end

      def start_command_execution(input : Types::StartCommandExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_COMMAND_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets and starts the next pending (status IN_PROGRESS or QUEUED) job execution for a thing. Requires
      # permission to access the StartNextPendingJobExecution action.

      def start_next_pending_job_execution(
        thing_name : String,
        status_details : Hash(String, String)? = nil,
        step_timeout_in_minutes : Int64? = nil
      ) : Protocol::Request
        input = Types::StartNextPendingJobExecutionRequest.new(thing_name: thing_name, status_details: status_details, step_timeout_in_minutes: step_timeout_in_minutes)
        start_next_pending_job_execution(input)
      end

      def start_next_pending_job_execution(input : Types::StartNextPendingJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_NEXT_PENDING_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of a job execution. Requires permission to access the UpdateJobExecution action.

      def update_job_execution(
        job_id : String,
        status : String,
        thing_name : String,
        execution_number : Int64? = nil,
        expected_version : Int64? = nil,
        include_job_document : Bool? = nil,
        include_job_execution_state : Bool? = nil,
        status_details : Hash(String, String)? = nil,
        step_timeout_in_minutes : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateJobExecutionRequest.new(job_id: job_id, status: status, thing_name: thing_name, execution_number: execution_number, expected_version: expected_version, include_job_document: include_job_document, include_job_execution_state: include_job_execution_state, status_details: status_details, step_timeout_in_minutes: step_timeout_in_minutes)
        update_job_execution(input)
      end

      def update_job_execution(input : Types::UpdateJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
