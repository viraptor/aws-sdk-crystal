module AwsSdk
  module DataPipeline
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does not pass
      # validation, activation fails. If you need to pause the pipeline to investigate an issue with a
      # component, such as a data source or script, call DeactivatePipeline . To activate a finished
      # pipeline, modify the end date for the pipeline and then activate it.
      def activate_pipeline(
        pipeline_id : String,
        parameter_values : Array(Types::ParameterValue)? = nil,
        start_timestamp : Time? = nil
      ) : Types::ActivatePipelineOutput
        input = Types::ActivatePipelineInput.new(pipeline_id: pipeline_id, parameter_values: parameter_values, start_timestamp: start_timestamp)
        activate_pipeline(input)
      end
      def activate_pipeline(input : Types::ActivatePipelineInput) : Types::ActivatePipelineOutput
        request = Protocol::JsonRpc.build_request(Model::ACTIVATE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ActivatePipelineOutput, "ActivatePipeline")
      end

      # Adds or modifies tags for the specified pipeline.
      def add_tags(
        pipeline_id : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsOutput
        input = Types::AddTagsInput.new(pipeline_id: pipeline_id, tags: tags)
        add_tags(input)
      end
      def add_tags(input : Types::AddTagsInput) : Types::AddTagsOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsOutput, "AddTags")
      end

      # Creates a new, empty pipeline. Use PutPipelineDefinition to populate the pipeline.
      def create_pipeline(
        name : String,
        unique_id : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePipelineOutput
        input = Types::CreatePipelineInput.new(name: name, unique_id: unique_id, description: description, tags: tags)
        create_pipeline(input)
      end
      def create_pipeline(input : Types::CreatePipelineInput) : Types::CreatePipelineOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePipelineOutput, "CreatePipeline")
      end

      # Deactivates the specified running pipeline. The pipeline is set to the DEACTIVATING state until the
      # deactivation process completes. To resume a deactivated pipeline, use ActivatePipeline . By default,
      # the pipeline resumes from the last completed execution. Optionally, you can specify the date and
      # time to resume the pipeline.
      def deactivate_pipeline(
        pipeline_id : String,
        cancel_active : Bool? = nil
      ) : Types::DeactivatePipelineOutput
        input = Types::DeactivatePipelineInput.new(pipeline_id: pipeline_id, cancel_active: cancel_active)
        deactivate_pipeline(input)
      end
      def deactivate_pipeline(input : Types::DeactivatePipelineInput) : Types::DeactivatePipelineOutput
        request = Protocol::JsonRpc.build_request(Model::DEACTIVATE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeactivatePipelineOutput, "DeactivatePipeline")
      end

      # Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline attempts to
      # cancel instances associated with the pipeline that are currently being processed by task runners.
      # Deleting a pipeline cannot be undone. You cannot query or restore a deleted pipeline. To temporarily
      # pause a pipeline instead of deleting it, call SetStatus with the status set to PAUSE on individual
      # components. Components that are paused by SetStatus can be resumed.
      def delete_pipeline(
        pipeline_id : String
      ) : Nil
        input = Types::DeletePipelineInput.new(pipeline_id: pipeline_id)
        delete_pipeline(input)
      end
      def delete_pipeline(input : Types::DeletePipelineInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets the object definitions for a set of objects associated with the pipeline. Object definitions
      # are composed of a set of fields that define the properties of the object.
      def describe_objects(
        object_ids : Array(String),
        pipeline_id : String,
        evaluate_expressions : Bool? = nil,
        marker : String? = nil
      ) : Types::DescribeObjectsOutput
        input = Types::DescribeObjectsInput.new(object_ids: object_ids, pipeline_id: pipeline_id, evaluate_expressions: evaluate_expressions, marker: marker)
        describe_objects(input)
      end
      def describe_objects(input : Types::DescribeObjectsInput) : Types::DescribeObjectsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_OBJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeObjectsOutput, "DescribeObjects")
      end

      # Retrieves metadata about one or more pipelines. The information retrieved includes the name of the
      # pipeline, the pipeline identifier, its current state, and the user account that owns the pipeline.
      # Using account credentials, you can retrieve metadata about pipelines that you or your IAM users have
      # created. If you are using an IAM user account, you can retrieve metadata about only those pipelines
      # for which you have read permissions. To retrieve the full pipeline definition instead of metadata
      # about the pipeline, call GetPipelineDefinition .
      def describe_pipelines(
        pipeline_ids : Array(String)
      ) : Types::DescribePipelinesOutput
        input = Types::DescribePipelinesInput.new(pipeline_ids: pipeline_ids)
        describe_pipelines(input)
      end
      def describe_pipelines(input : Types::DescribePipelinesInput) : Types::DescribePipelinesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PIPELINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePipelinesOutput, "DescribePipelines")
      end

      # Task runners call EvaluateExpression to evaluate a string in the context of the specified object.
      # For example, a task runner can evaluate SQL queries stored in Amazon S3.
      def evaluate_expression(
        expression : String,
        object_id : String,
        pipeline_id : String
      ) : Types::EvaluateExpressionOutput
        input = Types::EvaluateExpressionInput.new(expression: expression, object_id: object_id, pipeline_id: pipeline_id)
        evaluate_expression(input)
      end
      def evaluate_expression(input : Types::EvaluateExpressionInput) : Types::EvaluateExpressionOutput
        request = Protocol::JsonRpc.build_request(Model::EVALUATE_EXPRESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EvaluateExpressionOutput, "EvaluateExpression")
      end

      # Gets the definition of the specified pipeline. You can call GetPipelineDefinition to retrieve the
      # pipeline definition that you provided using PutPipelineDefinition .
      def get_pipeline_definition(
        pipeline_id : String,
        version : String? = nil
      ) : Types::GetPipelineDefinitionOutput
        input = Types::GetPipelineDefinitionInput.new(pipeline_id: pipeline_id, version: version)
        get_pipeline_definition(input)
      end
      def get_pipeline_definition(input : Types::GetPipelineDefinitionInput) : Types::GetPipelineDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PIPELINE_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPipelineDefinitionOutput, "GetPipelineDefinition")
      end

      # Lists the pipeline identifiers for all active pipelines that you have permission to access.
      def list_pipelines(
        marker : String? = nil
      ) : Types::ListPipelinesOutput
        input = Types::ListPipelinesInput.new(marker: marker)
        list_pipelines(input)
      end
      def list_pipelines(input : Types::ListPipelinesInput) : Types::ListPipelinesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelinesOutput, "ListPipelines")
      end

      # Task runners call PollForTask to receive a task to perform from AWS Data Pipeline. The task runner
      # specifies which tasks it can perform by setting a value for the workerGroup parameter. The task
      # returned can come from any of the pipelines that match the workerGroup value passed in by the task
      # runner and that was launched using the IAM user credentials specified by the task runner. If tasks
      # are ready in the work queue, PollForTask returns a response immediately. If no tasks are available
      # in the queue, PollForTask uses long-polling and holds on to a poll connection for up to a 90
      # seconds, during which time the first newly scheduled task is handed to the task runner. To
      # accomodate this, set the socket timeout in your task runner to 90 seconds. The task runner should
      # not call PollForTask again on the same workerGroup until it receives a response, and this can take
      # up to 90 seconds.
      def poll_for_task(
        worker_group : String,
        hostname : String? = nil,
        instance_identity : Types::InstanceIdentity? = nil
      ) : Types::PollForTaskOutput
        input = Types::PollForTaskInput.new(worker_group: worker_group, hostname: hostname, instance_identity: instance_identity)
        poll_for_task(input)
      end
      def poll_for_task(input : Types::PollForTaskInput) : Types::PollForTaskOutput
        request = Protocol::JsonRpc.build_request(Model::POLL_FOR_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PollForTaskOutput, "PollForTask")
      end

      # Adds tasks, schedules, and preconditions to the specified pipeline. You can use
      # PutPipelineDefinition to populate a new pipeline. PutPipelineDefinition also validates the
      # configuration as it adds it to the pipeline. Changes to the pipeline are saved unless one of the
      # following three validation errors exists in the pipeline. An object is missing a name or identifier
      # field. A string or reference field is empty. The number of objects in the pipeline exceeds the
      # maximum allowed objects. The pipeline is in a FINISHED state. Pipeline object definitions are passed
      # to the PutPipelineDefinition action and returned by the GetPipelineDefinition action.
      def put_pipeline_definition(
        pipeline_id : String,
        pipeline_objects : Array(Types::PipelineObject),
        parameter_objects : Array(Types::ParameterObject)? = nil,
        parameter_values : Array(Types::ParameterValue)? = nil
      ) : Types::PutPipelineDefinitionOutput
        input = Types::PutPipelineDefinitionInput.new(pipeline_id: pipeline_id, pipeline_objects: pipeline_objects, parameter_objects: parameter_objects, parameter_values: parameter_values)
        put_pipeline_definition(input)
      end
      def put_pipeline_definition(input : Types::PutPipelineDefinitionInput) : Types::PutPipelineDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_PIPELINE_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutPipelineDefinitionOutput, "PutPipelineDefinition")
      end

      # Queries the specified pipeline for the names of objects that match the specified set of conditions.
      def query_objects(
        pipeline_id : String,
        sphere : String,
        limit : Int32? = nil,
        marker : String? = nil,
        query : Types::Query? = nil
      ) : Types::QueryObjectsOutput
        input = Types::QueryObjectsInput.new(pipeline_id: pipeline_id, sphere: sphere, limit: limit, marker: marker, query: query)
        query_objects(input)
      end
      def query_objects(input : Types::QueryObjectsInput) : Types::QueryObjectsOutput
        request = Protocol::JsonRpc.build_request(Model::QUERY_OBJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::QueryObjectsOutput, "QueryObjects")
      end

      # Removes existing tags from the specified pipeline.
      def remove_tags(
        pipeline_id : String,
        tag_keys : Array(String)
      ) : Types::RemoveTagsOutput
        input = Types::RemoveTagsInput.new(pipeline_id: pipeline_id, tag_keys: tag_keys)
        remove_tags(input)
      end
      def remove_tags(input : Types::RemoveTagsInput) : Types::RemoveTagsOutput
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsOutput, "RemoveTags")
      end

      # Task runners call ReportTaskProgress when assigned a task to acknowledge that it has the task. If
      # the web service does not receive this acknowledgement within 2 minutes, it assigns the task in a
      # subsequent PollForTask call. After this initial acknowledgement, the task runner only needs to
      # report progress every 15 minutes to maintain its ownership of the task. You can change this
      # reporting time from 15 minutes by specifying a reportProgressTimeout field in your pipeline. If a
      # task runner does not report its status after 5 minutes, AWS Data Pipeline assumes that the task
      # runner is unable to process the task and reassigns the task in a subsequent response to PollForTask
      # . Task runners should call ReportTaskProgress every 60 seconds.
      def report_task_progress(
        task_id : String,
        fields : Array(Types::Field)? = nil
      ) : Types::ReportTaskProgressOutput
        input = Types::ReportTaskProgressInput.new(task_id: task_id, fields: fields)
        report_task_progress(input)
      end
      def report_task_progress(input : Types::ReportTaskProgressInput) : Types::ReportTaskProgressOutput
        request = Protocol::JsonRpc.build_request(Model::REPORT_TASK_PROGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReportTaskProgressOutput, "ReportTaskProgress")
      end

      # Task runners call ReportTaskRunnerHeartbeat every 15 minutes to indicate that they are operational.
      # If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS Data Pipeline, the web
      # service can use this call to detect when the task runner application has failed and restart a new
      # instance.
      def report_task_runner_heartbeat(
        taskrunner_id : String,
        hostname : String? = nil,
        worker_group : String? = nil
      ) : Types::ReportTaskRunnerHeartbeatOutput
        input = Types::ReportTaskRunnerHeartbeatInput.new(taskrunner_id: taskrunner_id, hostname: hostname, worker_group: worker_group)
        report_task_runner_heartbeat(input)
      end
      def report_task_runner_heartbeat(input : Types::ReportTaskRunnerHeartbeatInput) : Types::ReportTaskRunnerHeartbeatOutput
        request = Protocol::JsonRpc.build_request(Model::REPORT_TASK_RUNNER_HEARTBEAT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReportTaskRunnerHeartbeatOutput, "ReportTaskRunnerHeartbeat")
      end

      # Requests that the status of the specified physical or logical pipeline objects be updated in the
      # specified pipeline. This update might not occur immediately, but is eventually consistent. The
      # status that can be set depends on the type of object (for example, DataNode or Activity). You cannot
      # perform this operation on FINISHED pipelines and attempting to do so returns InvalidRequestException
      # .
      def set_status(
        object_ids : Array(String),
        pipeline_id : String,
        status : String
      ) : Nil
        input = Types::SetStatusInput.new(object_ids: object_ids, pipeline_id: pipeline_id, status: status)
        set_status(input)
      end
      def set_status(input : Types::SetStatusInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SET_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Task runners call SetTaskStatus to notify AWS Data Pipeline that a task is completed and provide
      # information about the final status. A task runner makes this call regardless of whether the task was
      # sucessful. A task runner does not need to call SetTaskStatus for tasks that are canceled by the web
      # service during a call to ReportTaskProgress .
      def set_task_status(
        task_id : String,
        task_status : String,
        error_id : String? = nil,
        error_message : String? = nil,
        error_stack_trace : String? = nil
      ) : Types::SetTaskStatusOutput
        input = Types::SetTaskStatusInput.new(task_id: task_id, task_status: task_status, error_id: error_id, error_message: error_message, error_stack_trace: error_stack_trace)
        set_task_status(input)
      end
      def set_task_status(input : Types::SetTaskStatusInput) : Types::SetTaskStatusOutput
        request = Protocol::JsonRpc.build_request(Model::SET_TASK_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetTaskStatusOutput, "SetTaskStatus")
      end

      # Validates the specified pipeline definition to ensure that it is well formed and can be run without
      # error.
      def validate_pipeline_definition(
        pipeline_id : String,
        pipeline_objects : Array(Types::PipelineObject),
        parameter_objects : Array(Types::ParameterObject)? = nil,
        parameter_values : Array(Types::ParameterValue)? = nil
      ) : Types::ValidatePipelineDefinitionOutput
        input = Types::ValidatePipelineDefinitionInput.new(pipeline_id: pipeline_id, pipeline_objects: pipeline_objects, parameter_objects: parameter_objects, parameter_values: parameter_values)
        validate_pipeline_definition(input)
      end
      def validate_pipeline_definition(input : Types::ValidatePipelineDefinitionInput) : Types::ValidatePipelineDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::VALIDATE_PIPELINE_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ValidatePipelineDefinitionOutput, "ValidatePipelineDefinition")
      end
    end
  end
end
