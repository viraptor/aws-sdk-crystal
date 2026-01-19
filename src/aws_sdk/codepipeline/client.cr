module AwsSdk
  module CodePipeline
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

      # Returns information about a specified job and whether that job has been received by the job worker.
      # Used for custom actions only.
      def acknowledge_job(
        job_id : String,
        nonce : String
      ) : Types::AcknowledgeJobOutput
        input = Types::AcknowledgeJobInput.new(job_id: job_id, nonce: nonce)
        acknowledge_job(input)
      end
      def acknowledge_job(input : Types::AcknowledgeJobInput) : Types::AcknowledgeJobOutput
        request = Protocol::JsonRpc.build_request(Model::ACKNOWLEDGE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcknowledgeJobOutput, "AcknowledgeJob")
      end

      # Confirms a job worker has received the specified job. Used for partner actions only.
      def acknowledge_third_party_job(
        client_token : String,
        job_id : String,
        nonce : String
      ) : Types::AcknowledgeThirdPartyJobOutput
        input = Types::AcknowledgeThirdPartyJobInput.new(client_token: client_token, job_id: job_id, nonce: nonce)
        acknowledge_third_party_job(input)
      end
      def acknowledge_third_party_job(input : Types::AcknowledgeThirdPartyJobInput) : Types::AcknowledgeThirdPartyJobOutput
        request = Protocol::JsonRpc.build_request(Model::ACKNOWLEDGE_THIRD_PARTY_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcknowledgeThirdPartyJobOutput, "AcknowledgeThirdPartyJob")
      end

      # Creates a new custom action that can be used in all pipelines associated with the Amazon Web
      # Services account. Only used for custom actions.
      def create_custom_action_type(
        category : String,
        input_artifact_details : Types::ArtifactDetails,
        output_artifact_details : Types::ArtifactDetails,
        provider : String,
        version : String,
        configuration_properties : Array(Types::ActionConfigurationProperty)? = nil,
        settings : Types::ActionTypeSettings? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCustomActionTypeOutput
        input = Types::CreateCustomActionTypeInput.new(category: category, input_artifact_details: input_artifact_details, output_artifact_details: output_artifact_details, provider: provider, version: version, configuration_properties: configuration_properties, settings: settings, tags: tags)
        create_custom_action_type(input)
      end
      def create_custom_action_type(input : Types::CreateCustomActionTypeInput) : Types::CreateCustomActionTypeOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CUSTOM_ACTION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCustomActionTypeOutput, "CreateCustomActionType")
      end

      # Creates a pipeline. In the pipeline structure, you must include either artifactStore or
      # artifactStores in your pipeline, but you cannot use both. If you create a cross-region action in
      # your pipeline, you must use artifactStores .
      def create_pipeline(
        pipeline : Types::PipelineDeclaration,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePipelineOutput
        input = Types::CreatePipelineInput.new(pipeline: pipeline, tags: tags)
        create_pipeline(input)
      end
      def create_pipeline(input : Types::CreatePipelineInput) : Types::CreatePipelineOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePipelineOutput, "CreatePipeline")
      end

      # Marks a custom action as deleted. PollForJobs for the custom action fails after the action is marked
      # for deletion. Used for custom actions only. To re-create a custom action after it has been deleted
      # you must use a string in the version field that has never been used before. This string can be an
      # incremented version number, for example. To restore a deleted custom action, use a JSON file that is
      # identical to the deleted action, including the original string in the version field.
      def delete_custom_action_type(
        category : String,
        provider : String,
        version : String
      ) : Nil
        input = Types::DeleteCustomActionTypeInput.new(category: category, provider: provider, version: version)
        delete_custom_action_type(input)
      end
      def delete_custom_action_type(input : Types::DeleteCustomActionTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CUSTOM_ACTION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified pipeline.
      def delete_pipeline(
        name : String
      ) : Nil
        input = Types::DeletePipelineInput.new(name: name)
        delete_pipeline(input)
      end
      def delete_pipeline(input : Types::DeletePipelineInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a previously created webhook by name. Deleting the webhook stops CodePipeline from starting
      # a pipeline every time an external event occurs. The API returns successfully when trying to delete a
      # webhook that is already deleted. If a deleted webhook is re-created by calling PutWebhook with the
      # same name, it will have a different URL.
      def delete_webhook(
        name : String
      ) : Types::DeleteWebhookOutput
        input = Types::DeleteWebhookInput.new(name: name)
        delete_webhook(input)
      end
      def delete_webhook(input : Types::DeleteWebhookInput) : Types::DeleteWebhookOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_WEBHOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWebhookOutput, "DeleteWebhook")
      end

      # Removes the connection between the webhook that was created by CodePipeline and the external tool
      # with events to be detected. Currently supported only for webhooks that target an action type of
      # GitHub.
      def deregister_webhook_with_third_party(
        webhook_name : String? = nil
      ) : Types::DeregisterWebhookWithThirdPartyOutput
        input = Types::DeregisterWebhookWithThirdPartyInput.new(webhook_name: webhook_name)
        deregister_webhook_with_third_party(input)
      end
      def deregister_webhook_with_third_party(input : Types::DeregisterWebhookWithThirdPartyInput) : Types::DeregisterWebhookWithThirdPartyOutput
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_WEBHOOK_WITH_THIRD_PARTY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterWebhookWithThirdPartyOutput, "DeregisterWebhookWithThirdParty")
      end

      # Prevents artifacts in a pipeline from transitioning to the next stage in the pipeline.
      def disable_stage_transition(
        pipeline_name : String,
        reason : String,
        stage_name : String,
        transition_type : String
      ) : Nil
        input = Types::DisableStageTransitionInput.new(pipeline_name: pipeline_name, reason: reason, stage_name: stage_name, transition_type: transition_type)
        disable_stage_transition(input)
      end
      def disable_stage_transition(input : Types::DisableStageTransitionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DISABLE_STAGE_TRANSITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables artifacts in a pipeline to transition to a stage in a pipeline.
      def enable_stage_transition(
        pipeline_name : String,
        stage_name : String,
        transition_type : String
      ) : Nil
        input = Types::EnableStageTransitionInput.new(pipeline_name: pipeline_name, stage_name: stage_name, transition_type: transition_type)
        enable_stage_transition(input)
      end
      def enable_stage_transition(input : Types::EnableStageTransitionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::ENABLE_STAGE_TRANSITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Returns information about an action type created for an external provider, where the action is to be
      # used by customers of the external provider. The action can be created with any supported integration
      # model.
      def get_action_type(
        category : String,
        owner : String,
        provider : String,
        version : String
      ) : Types::GetActionTypeOutput
        input = Types::GetActionTypeInput.new(category: category, owner: owner, provider: provider, version: version)
        get_action_type(input)
      end
      def get_action_type(input : Types::GetActionTypeInput) : Types::GetActionTypeOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ACTION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetActionTypeOutput, "GetActionType")
      end

      # Returns information about a job. Used for custom actions only. When this API is called, CodePipeline
      # returns temporary credentials for the S3 bucket used to store artifacts for the pipeline, if the
      # action requires access to that S3 bucket for input or output artifacts. This API also returns any
      # secret values defined for the action.
      def get_job_details(
        job_id : String
      ) : Types::GetJobDetailsOutput
        input = Types::GetJobDetailsInput.new(job_id: job_id)
        get_job_details(input)
      end
      def get_job_details(input : Types::GetJobDetailsInput) : Types::GetJobDetailsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_JOB_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobDetailsOutput, "GetJobDetails")
      end

      # Returns the metadata, structure, stages, and actions of a pipeline. Can be used to return the entire
      # structure of a pipeline in JSON format, which can then be modified and used to update the pipeline
      # structure with UpdatePipeline .
      def get_pipeline(
        name : String,
        version : Int32? = nil
      ) : Types::GetPipelineOutput
        input = Types::GetPipelineInput.new(name: name, version: version)
        get_pipeline(input)
      end
      def get_pipeline(input : Types::GetPipelineInput) : Types::GetPipelineOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPipelineOutput, "GetPipeline")
      end

      # Returns information about an execution of a pipeline, including details about artifacts, the
      # pipeline execution ID, and the name, version, and status of the pipeline.
      def get_pipeline_execution(
        pipeline_execution_id : String,
        pipeline_name : String
      ) : Types::GetPipelineExecutionOutput
        input = Types::GetPipelineExecutionInput.new(pipeline_execution_id: pipeline_execution_id, pipeline_name: pipeline_name)
        get_pipeline_execution(input)
      end
      def get_pipeline_execution(input : Types::GetPipelineExecutionInput) : Types::GetPipelineExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPipelineExecutionOutput, "GetPipelineExecution")
      end

      # Returns information about the state of a pipeline, including the stages and actions. Values returned
      # in the revisionId and revisionUrl fields indicate the source revision information, such as the
      # commit ID, for the current state.
      def get_pipeline_state(
        name : String
      ) : Types::GetPipelineStateOutput
        input = Types::GetPipelineStateInput.new(name: name)
        get_pipeline_state(input)
      end
      def get_pipeline_state(input : Types::GetPipelineStateInput) : Types::GetPipelineStateOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PIPELINE_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPipelineStateOutput, "GetPipelineState")
      end

      # Requests the details of a job for a third party action. Used for partner actions only. When this API
      # is called, CodePipeline returns temporary credentials for the S3 bucket used to store artifacts for
      # the pipeline, if the action requires access to that S3 bucket for input or output artifacts. This
      # API also returns any secret values defined for the action.
      def get_third_party_job_details(
        client_token : String,
        job_id : String
      ) : Types::GetThirdPartyJobDetailsOutput
        input = Types::GetThirdPartyJobDetailsInput.new(client_token: client_token, job_id: job_id)
        get_third_party_job_details(input)
      end
      def get_third_party_job_details(input : Types::GetThirdPartyJobDetailsInput) : Types::GetThirdPartyJobDetailsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_THIRD_PARTY_JOB_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetThirdPartyJobDetailsOutput, "GetThirdPartyJobDetails")
      end

      # Lists the action executions that have occurred in a pipeline.
      def list_action_executions(
        pipeline_name : String,
        filter : Types::ActionExecutionFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListActionExecutionsOutput
        input = Types::ListActionExecutionsInput.new(pipeline_name: pipeline_name, filter: filter, max_results: max_results, next_token: next_token)
        list_action_executions(input)
      end
      def list_action_executions(input : Types::ListActionExecutionsInput) : Types::ListActionExecutionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ACTION_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListActionExecutionsOutput, "ListActionExecutions")
      end

      # Gets a summary of all CodePipeline action types associated with your account.
      def list_action_types(
        action_owner_filter : String? = nil,
        next_token : String? = nil,
        region_filter : String? = nil
      ) : Types::ListActionTypesOutput
        input = Types::ListActionTypesInput.new(action_owner_filter: action_owner_filter, next_token: next_token, region_filter: region_filter)
        list_action_types(input)
      end
      def list_action_types(input : Types::ListActionTypesInput) : Types::ListActionTypesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ACTION_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListActionTypesOutput, "ListActionTypes")
      end

      # Lists the targets for the deploy action.
      def list_deploy_action_execution_targets(
        action_execution_id : String,
        filters : Array(Types::TargetFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pipeline_name : String? = nil
      ) : Types::ListDeployActionExecutionTargetsOutput
        input = Types::ListDeployActionExecutionTargetsInput.new(action_execution_id: action_execution_id, filters: filters, max_results: max_results, next_token: next_token, pipeline_name: pipeline_name)
        list_deploy_action_execution_targets(input)
      end
      def list_deploy_action_execution_targets(input : Types::ListDeployActionExecutionTargetsInput) : Types::ListDeployActionExecutionTargetsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DEPLOY_ACTION_EXECUTION_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeployActionExecutionTargetsOutput, "ListDeployActionExecutionTargets")
      end

      # Gets a summary of the most recent executions for a pipeline. When applying the filter for pipeline
      # executions that have succeeded in the stage, the operation returns all executions in the current
      # pipeline version beginning on February 1, 2024.
      def list_pipeline_executions(
        pipeline_name : String,
        filter : Types::PipelineExecutionFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPipelineExecutionsOutput
        input = Types::ListPipelineExecutionsInput.new(pipeline_name: pipeline_name, filter: filter, max_results: max_results, next_token: next_token)
        list_pipeline_executions(input)
      end
      def list_pipeline_executions(input : Types::ListPipelineExecutionsInput) : Types::ListPipelineExecutionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINE_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelineExecutionsOutput, "ListPipelineExecutions")
      end

      # Gets a summary of all of the pipelines associated with your account.
      def list_pipelines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPipelinesOutput
        input = Types::ListPipelinesInput.new(max_results: max_results, next_token: next_token)
        list_pipelines(input)
      end
      def list_pipelines(input : Types::ListPipelinesInput) : Types::ListPipelinesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelinesOutput, "ListPipelines")
      end

      # Lists the rule executions that have occurred in a pipeline configured for conditions with rules.
      def list_rule_executions(
        pipeline_name : String,
        filter : Types::RuleExecutionFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRuleExecutionsOutput
        input = Types::ListRuleExecutionsInput.new(pipeline_name: pipeline_name, filter: filter, max_results: max_results, next_token: next_token)
        list_rule_executions(input)
      end
      def list_rule_executions(input : Types::ListRuleExecutionsInput) : Types::ListRuleExecutionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_RULE_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRuleExecutionsOutput, "ListRuleExecutions")
      end

      # Lists the rules for the condition. For more information about conditions, see Stage conditions and
      # How do stage conditions work? .For more information about rules, see the CodePipeline rule reference
      # .
      def list_rule_types(
        region_filter : String? = nil,
        rule_owner_filter : String? = nil
      ) : Types::ListRuleTypesOutput
        input = Types::ListRuleTypesInput.new(region_filter: region_filter, rule_owner_filter: rule_owner_filter)
        list_rule_types(input)
      end
      def list_rule_types(input : Types::ListRuleTypesInput) : Types::ListRuleTypesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_RULE_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRuleTypesOutput, "ListRuleTypes")
      end

      # Gets the set of key-value pairs (metadata) that are used to manage the resource.
      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Gets a listing of all the webhooks in this Amazon Web Services Region for this account. The output
      # lists all webhooks and includes the webhook URL and ARN and the configuration for each webhook. If a
      # secret token was provided, it will be redacted in the response.
      def list_webhooks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWebhooksOutput
        input = Types::ListWebhooksInput.new(max_results: max_results, next_token: next_token)
        list_webhooks(input)
      end
      def list_webhooks(input : Types::ListWebhooksInput) : Types::ListWebhooksOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_WEBHOOKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWebhooksOutput, "ListWebhooks")
      end

      # Used to override a stage condition. For more information about conditions, see Stage conditions and
      # How do stage conditions work? .
      def override_stage_condition(
        condition_type : String,
        pipeline_execution_id : String,
        pipeline_name : String,
        stage_name : String
      ) : Nil
        input = Types::OverrideStageConditionInput.new(condition_type: condition_type, pipeline_execution_id: pipeline_execution_id, pipeline_name: pipeline_name, stage_name: stage_name)
        override_stage_condition(input)
      end
      def override_stage_condition(input : Types::OverrideStageConditionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::OVERRIDE_STAGE_CONDITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Returns information about any jobs for CodePipeline to act on. PollForJobs is valid only for action
      # types with "Custom" in the owner field. If the action type contains AWS or ThirdParty in the owner
      # field, the PollForJobs action returns an error. When this API is called, CodePipeline returns
      # temporary credentials for the S3 bucket used to store artifacts for the pipeline, if the action
      # requires access to that S3 bucket for input or output artifacts. This API also returns any secret
      # values defined for the action.
      def poll_for_jobs(
        action_type_id : Types::ActionTypeId,
        max_batch_size : Int32? = nil,
        query_param : Hash(String, String)? = nil
      ) : Types::PollForJobsOutput
        input = Types::PollForJobsInput.new(action_type_id: action_type_id, max_batch_size: max_batch_size, query_param: query_param)
        poll_for_jobs(input)
      end
      def poll_for_jobs(input : Types::PollForJobsInput) : Types::PollForJobsOutput
        request = Protocol::JsonRpc.build_request(Model::POLL_FOR_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PollForJobsOutput, "PollForJobs")
      end

      # Determines whether there are any third party jobs for a job worker to act on. Used for partner
      # actions only. When this API is called, CodePipeline returns temporary credentials for the S3 bucket
      # used to store artifacts for the pipeline, if the action requires access to that S3 bucket for input
      # or output artifacts.
      def poll_for_third_party_jobs(
        action_type_id : Types::ActionTypeId,
        max_batch_size : Int32? = nil
      ) : Types::PollForThirdPartyJobsOutput
        input = Types::PollForThirdPartyJobsInput.new(action_type_id: action_type_id, max_batch_size: max_batch_size)
        poll_for_third_party_jobs(input)
      end
      def poll_for_third_party_jobs(input : Types::PollForThirdPartyJobsInput) : Types::PollForThirdPartyJobsOutput
        request = Protocol::JsonRpc.build_request(Model::POLL_FOR_THIRD_PARTY_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PollForThirdPartyJobsOutput, "PollForThirdPartyJobs")
      end

      # Provides information to CodePipeline about new revisions to a source.
      def put_action_revision(
        action_name : String,
        action_revision : Types::ActionRevision,
        pipeline_name : String,
        stage_name : String
      ) : Types::PutActionRevisionOutput
        input = Types::PutActionRevisionInput.new(action_name: action_name, action_revision: action_revision, pipeline_name: pipeline_name, stage_name: stage_name)
        put_action_revision(input)
      end
      def put_action_revision(input : Types::PutActionRevisionInput) : Types::PutActionRevisionOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_ACTION_REVISION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutActionRevisionOutput, "PutActionRevision")
      end

      # Provides the response to a manual approval request to CodePipeline. Valid responses include Approved
      # and Rejected.
      def put_approval_result(
        action_name : String,
        pipeline_name : String,
        result : Types::ApprovalResult,
        stage_name : String,
        token : String
      ) : Types::PutApprovalResultOutput
        input = Types::PutApprovalResultInput.new(action_name: action_name, pipeline_name: pipeline_name, result: result, stage_name: stage_name, token: token)
        put_approval_result(input)
      end
      def put_approval_result(input : Types::PutApprovalResultInput) : Types::PutApprovalResultOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_APPROVAL_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutApprovalResultOutput, "PutApprovalResult")
      end

      # Represents the failure of a job as returned to the pipeline by a job worker. Used for custom actions
      # only.
      def put_job_failure_result(
        failure_details : Types::FailureDetails,
        job_id : String
      ) : Nil
        input = Types::PutJobFailureResultInput.new(failure_details: failure_details, job_id: job_id)
        put_job_failure_result(input)
      end
      def put_job_failure_result(input : Types::PutJobFailureResultInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_JOB_FAILURE_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Represents the success of a job as returned to the pipeline by a job worker. Used for custom actions
      # only.
      def put_job_success_result(
        job_id : String,
        continuation_token : String? = nil,
        current_revision : Types::CurrentRevision? = nil,
        execution_details : Types::ExecutionDetails? = nil,
        output_variables : Hash(String, String)? = nil
      ) : Nil
        input = Types::PutJobSuccessResultInput.new(job_id: job_id, continuation_token: continuation_token, current_revision: current_revision, execution_details: execution_details, output_variables: output_variables)
        put_job_success_result(input)
      end
      def put_job_success_result(input : Types::PutJobSuccessResultInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_JOB_SUCCESS_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Represents the failure of a third party job as returned to the pipeline by a job worker. Used for
      # partner actions only.
      def put_third_party_job_failure_result(
        client_token : String,
        failure_details : Types::FailureDetails,
        job_id : String
      ) : Nil
        input = Types::PutThirdPartyJobFailureResultInput.new(client_token: client_token, failure_details: failure_details, job_id: job_id)
        put_third_party_job_failure_result(input)
      end
      def put_third_party_job_failure_result(input : Types::PutThirdPartyJobFailureResultInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_THIRD_PARTY_JOB_FAILURE_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Represents the success of a third party job as returned to the pipeline by a job worker. Used for
      # partner actions only.
      def put_third_party_job_success_result(
        client_token : String,
        job_id : String,
        continuation_token : String? = nil,
        current_revision : Types::CurrentRevision? = nil,
        execution_details : Types::ExecutionDetails? = nil
      ) : Nil
        input = Types::PutThirdPartyJobSuccessResultInput.new(client_token: client_token, job_id: job_id, continuation_token: continuation_token, current_revision: current_revision, execution_details: execution_details)
        put_third_party_job_success_result(input)
      end
      def put_third_party_job_success_result(input : Types::PutThirdPartyJobSuccessResultInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_THIRD_PARTY_JOB_SUCCESS_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Defines a webhook and returns a unique webhook URL generated by CodePipeline. This URL can be
      # supplied to third party source hosting providers to call every time there's a code change. When
      # CodePipeline receives a POST request on this URL, the pipeline defined in the webhook is started as
      # long as the POST request satisfied the authentication and filtering requirements supplied when
      # defining the webhook. RegisterWebhookWithThirdParty and DeregisterWebhookWithThirdParty APIs can be
      # used to automatically configure supported third parties to call the generated webhook URL. When
      # creating CodePipeline webhooks, do not use your own credentials or reuse the same secret token
      # across multiple webhooks. For optimal security, generate a unique secret token for each webhook you
      # create. The secret token is an arbitrary string that you provide, which GitHub uses to compute and
      # sign the webhook payloads sent to CodePipeline, for protecting the integrity and authenticity of the
      # webhook payloads. Using your own credentials or reusing the same token across multiple webhooks can
      # lead to security vulnerabilities. If a secret token was provided, it will be redacted in the
      # response.
      def put_webhook(
        webhook : Types::WebhookDefinition,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutWebhookOutput
        input = Types::PutWebhookInput.new(webhook: webhook, tags: tags)
        put_webhook(input)
      end
      def put_webhook(input : Types::PutWebhookInput) : Types::PutWebhookOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_WEBHOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutWebhookOutput, "PutWebhook")
      end

      # Configures a connection between the webhook that was created and the external tool with events to be
      # detected.
      def register_webhook_with_third_party(
        webhook_name : String? = nil
      ) : Types::RegisterWebhookWithThirdPartyOutput
        input = Types::RegisterWebhookWithThirdPartyInput.new(webhook_name: webhook_name)
        register_webhook_with_third_party(input)
      end
      def register_webhook_with_third_party(input : Types::RegisterWebhookWithThirdPartyInput) : Types::RegisterWebhookWithThirdPartyOutput
        request = Protocol::JsonRpc.build_request(Model::REGISTER_WEBHOOK_WITH_THIRD_PARTY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterWebhookWithThirdPartyOutput, "RegisterWebhookWithThirdParty")
      end

      # You can retry a stage that has failed without having to run a pipeline again from the beginning. You
      # do this by either retrying the failed actions in a stage or by retrying all actions in the stage
      # starting from the first action in the stage. When you retry the failed actions in a stage, all
      # actions that are still in progress continue working, and failed actions are triggered again. When
      # you retry a failed stage from the first action in the stage, the stage cannot have any actions in
      # progress. Before a stage can be retried, it must either have all actions failed or some actions
      # failed and some succeeded.
      def retry_stage_execution(
        pipeline_execution_id : String,
        pipeline_name : String,
        retry_mode : String,
        stage_name : String
      ) : Types::RetryStageExecutionOutput
        input = Types::RetryStageExecutionInput.new(pipeline_execution_id: pipeline_execution_id, pipeline_name: pipeline_name, retry_mode: retry_mode, stage_name: stage_name)
        retry_stage_execution(input)
      end
      def retry_stage_execution(input : Types::RetryStageExecutionInput) : Types::RetryStageExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::RETRY_STAGE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetryStageExecutionOutput, "RetryStageExecution")
      end

      # Rolls back a stage execution.
      def rollback_stage(
        pipeline_name : String,
        stage_name : String,
        target_pipeline_execution_id : String
      ) : Types::RollbackStageOutput
        input = Types::RollbackStageInput.new(pipeline_name: pipeline_name, stage_name: stage_name, target_pipeline_execution_id: target_pipeline_execution_id)
        rollback_stage(input)
      end
      def rollback_stage(input : Types::RollbackStageInput) : Types::RollbackStageOutput
        request = Protocol::JsonRpc.build_request(Model::ROLLBACK_STAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RollbackStageOutput, "RollbackStage")
      end

      # Starts the specified pipeline. Specifically, it begins processing the latest commit to the source
      # location specified as part of the pipeline.
      def start_pipeline_execution(
        name : String,
        client_request_token : String? = nil,
        source_revisions : Array(Types::SourceRevisionOverride)? = nil,
        variables : Array(Types::PipelineVariable)? = nil
      ) : Types::StartPipelineExecutionOutput
        input = Types::StartPipelineExecutionInput.new(name: name, client_request_token: client_request_token, source_revisions: source_revisions, variables: variables)
        start_pipeline_execution(input)
      end
      def start_pipeline_execution(input : Types::StartPipelineExecutionInput) : Types::StartPipelineExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::START_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartPipelineExecutionOutput, "StartPipelineExecution")
      end

      # Stops the specified pipeline execution. You choose to either stop the pipeline execution by
      # completing in-progress actions without starting subsequent actions, or by abandoning in-progress
      # actions. While completing or abandoning in-progress actions, the pipeline execution is in a Stopping
      # state. After all in-progress actions are completed or abandoned, the pipeline execution is in a
      # Stopped state.
      def stop_pipeline_execution(
        pipeline_execution_id : String,
        pipeline_name : String,
        abandon : Bool? = nil,
        reason : String? = nil
      ) : Types::StopPipelineExecutionOutput
        input = Types::StopPipelineExecutionInput.new(pipeline_execution_id: pipeline_execution_id, pipeline_name: pipeline_name, abandon: abandon, reason: reason)
        stop_pipeline_execution(input)
      end
      def stop_pipeline_execution(input : Types::StopPipelineExecutionInput) : Types::StopPipelineExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopPipelineExecutionOutput, "StopPipelineExecution")
      end

      # Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a
      # resource.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceOutput
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Removes tags from an Amazon Web Services resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end

      # Updates an action type that was created with any supported integration model, where the action type
      # is to be used by customers of the action type provider. Use a JSON file with the action definition
      # and UpdateActionType to provide the full structure.
      def update_action_type(
        action_type : Types::ActionTypeDeclaration
      ) : Nil
        input = Types::UpdateActionTypeInput.new(action_type: action_type)
        update_action_type(input)
      end
      def update_action_type(input : Types::UpdateActionTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACTION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a specified pipeline with edits or changes to its structure. Use a JSON file with the
      # pipeline structure and UpdatePipeline to provide the full structure of the pipeline. Updating the
      # pipeline increases the version number of the pipeline by 1.
      def update_pipeline(
        pipeline : Types::PipelineDeclaration
      ) : Types::UpdatePipelineOutput
        input = Types::UpdatePipelineInput.new(pipeline: pipeline)
        update_pipeline(input)
      end
      def update_pipeline(input : Types::UpdatePipelineInput) : Types::UpdatePipelineOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePipelineOutput, "UpdatePipeline")
      end
    end
  end
end
