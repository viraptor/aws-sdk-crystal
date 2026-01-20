module AwsSdk
  module Bedrock
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

      # Deletes a batch of evaluation jobs. An evaluation job can only be deleted if it has following status
      # FAILED , COMPLETED , and STOPPED . You can request up to 25 model evaluation jobs be deleted in a
      # single request.

      def batch_delete_evaluation_job(
        job_identifiers : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeleteEvaluationJobRequest.new(job_identifiers: job_identifiers)
        batch_delete_evaluation_job(input)
      end

      def batch_delete_evaluation_job(input : Types::BatchDeleteEvaluationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_EVALUATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a running Automated Reasoning policy build workflow. This stops the policy generation
      # process and prevents further processing of the source documents.

      def cancel_automated_reasoning_policy_build_workflow(
        build_workflow_id : String,
        policy_arn : String
      ) : Protocol::Request
        input = Types::CancelAutomatedReasoningPolicyBuildWorkflowRequest.new(build_workflow_id: build_workflow_id, policy_arn: policy_arn)
        cancel_automated_reasoning_policy_build_workflow(input)
      end

      def cancel_automated_reasoning_policy_build_workflow(input : Types::CancelAutomatedReasoningPolicyBuildWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Automated Reasoning policy for Amazon Bedrock Guardrails. Automated Reasoning policies
      # use mathematical techniques to detect hallucinations, suggest corrections, and highlight unstated
      # assumptions in the responses of your GenAI application. To create a policy, you upload a source
      # document that describes the rules that you're encoding. Automated Reasoning extracts important
      # concepts from the source document that will become variables in the policy and infers policy rules.

      def create_automated_reasoning_policy(
        name : String,
        client_request_token : String? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        policy_definition : Types::AutomatedReasoningPolicyDefinition? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAutomatedReasoningPolicyRequest.new(name: name, client_request_token: client_request_token, description: description, kms_key_id: kms_key_id, policy_definition: policy_definition, tags: tags)
        create_automated_reasoning_policy(input)
      end

      def create_automated_reasoning_policy(input : Types::CreateAutomatedReasoningPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTOMATED_REASONING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a test for an Automated Reasoning policy. Tests validate that your policy works as expected
      # by providing sample inputs and expected outcomes. Use tests to verify policy behavior before
      # deploying to production.

      def create_automated_reasoning_policy_test_case(
        expected_aggregated_findings_result : String,
        guard_content : String,
        policy_arn : String,
        client_request_token : String? = nil,
        confidence_threshold : Float64? = nil,
        query_content : String? = nil
      ) : Protocol::Request
        input = Types::CreateAutomatedReasoningPolicyTestCaseRequest.new(expected_aggregated_findings_result: expected_aggregated_findings_result, guard_content: guard_content, policy_arn: policy_arn, client_request_token: client_request_token, confidence_threshold: confidence_threshold, query_content: query_content)
        create_automated_reasoning_policy_test_case(input)
      end

      def create_automated_reasoning_policy_test_case(input : Types::CreateAutomatedReasoningPolicyTestCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTOMATED_REASONING_POLICY_TEST_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of an existing Automated Reasoning policy. This allows you to iterate on your
      # policy rules while maintaining previous versions for rollback or comparison purposes.

      def create_automated_reasoning_policy_version(
        last_updated_definition_hash : String,
        policy_arn : String,
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAutomatedReasoningPolicyVersionRequest.new(last_updated_definition_hash: last_updated_definition_hash, policy_arn: policy_arn, client_request_token: client_request_token, tags: tags)
        create_automated_reasoning_policy_version(input)
      end

      def create_automated_reasoning_policy_version(input : Types::CreateAutomatedReasoningPolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTOMATED_REASONING_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new custom model in Amazon Bedrock. After the model is active, you can use it for
      # inference. To use the model for inference, you must purchase Provisioned Throughput for it. You
      # can't use On-demand inference with these custom models. For more information about Provisioned
      # Throughput, see Provisioned Throughput . The model appears in ListCustomModels with a
      # customizationType of imported . To track the status of the new model, you use the GetCustomModel API
      # operation. The model can be in the following states: Creating - Initial state during validation and
      # registration Active - Model is ready for use in inference Failed - Creation process encountered an
      # error Related APIs GetCustomModel ListCustomModels DeleteCustomModel

      def create_custom_model(
        model_name : String,
        model_source_config : Types::ModelDataSource,
        client_request_token : String? = nil,
        model_kms_key_arn : String? = nil,
        model_tags : Array(Types::Tag)? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateCustomModelRequest.new(model_name: model_name, model_source_config: model_source_config, client_request_token: client_request_token, model_kms_key_arn: model_kms_key_arn, model_tags: model_tags, role_arn: role_arn)
        create_custom_model(input)
      end

      def create_custom_model(input : Types::CreateCustomModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deploys a custom model for on-demand inference in Amazon Bedrock. After you deploy your custom
      # model, you use the deployment's Amazon Resource Name (ARN) as the modelId parameter when you submit
      # prompts and generate responses with model inference. For more information about setting up on-demand
      # inference for custom models, see Set up inference for a custom model . The following actions are
      # related to the CreateCustomModelDeployment operation: GetCustomModelDeployment
      # ListCustomModelDeployments DeleteCustomModelDeployment

      def create_custom_model_deployment(
        model_arn : String,
        model_deployment_name : String,
        client_request_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomModelDeploymentRequest.new(model_arn: model_arn, model_deployment_name: model_deployment_name, client_request_token: client_request_token, description: description, tags: tags)
        create_custom_model_deployment(input)
      end

      def create_custom_model_deployment(input : Types::CreateCustomModelDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_MODEL_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an evaluation job.

      def create_evaluation_job(
        evaluation_config : Types::EvaluationConfig,
        inference_config : Types::EvaluationInferenceConfig,
        job_name : String,
        output_data_config : Types::EvaluationOutputDataConfig,
        role_arn : String,
        application_type : String? = nil,
        client_request_token : String? = nil,
        customer_encryption_key_id : String? = nil,
        job_description : String? = nil,
        job_tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateEvaluationJobRequest.new(evaluation_config: evaluation_config, inference_config: inference_config, job_name: job_name, output_data_config: output_data_config, role_arn: role_arn, application_type: application_type, client_request_token: client_request_token, customer_encryption_key_id: customer_encryption_key_id, job_description: job_description, job_tags: job_tags)
        create_evaluation_job(input)
      end

      def create_evaluation_job(input : Types::CreateEvaluationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVALUATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Request a model access agreement for the specified model.

      def create_foundation_model_agreement(
        model_id : String,
        offer_token : String
      ) : Protocol::Request
        input = Types::CreateFoundationModelAgreementRequest.new(model_id: model_id, offer_token: offer_token)
        create_foundation_model_agreement(input)
      end

      def create_foundation_model_agreement(input : Types::CreateFoundationModelAgreementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FOUNDATION_MODEL_AGREEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a guardrail to block topics and to implement safeguards for your generative AI applications.
      # You can configure the following policies in a guardrail to avoid undesirable and harmful content,
      # filter out denied topics and words, and remove sensitive information for privacy protection. Content
      # filters - Adjust filter strengths to block input prompts or model responses containing harmful
      # content. Denied topics - Define a set of topics that are undesirable in the context of your
      # application. These topics will be blocked if detected in user queries or model responses. Word
      # filters - Configure filters to block undesirable words, phrases, and profanity. Such words can
      # include offensive terms, competitor names etc. Sensitive information filters - Block or mask
      # sensitive information such as personally identifiable information (PII) or custom regex in user
      # inputs and model responses. In addition to the above policies, you can also configure the messages
      # to be returned to the user if a user input or model response is in violation of the policies defined
      # in the guardrail. For more information, see Amazon Bedrock Guardrails in the Amazon Bedrock User
      # Guide .

      def create_guardrail(
        blocked_input_messaging : String,
        blocked_outputs_messaging : String,
        name : String,
        automated_reasoning_policy_config : Types::GuardrailAutomatedReasoningPolicyConfig? = nil,
        client_request_token : String? = nil,
        content_policy_config : Types::GuardrailContentPolicyConfig? = nil,
        contextual_grounding_policy_config : Types::GuardrailContextualGroundingPolicyConfig? = nil,
        cross_region_config : Types::GuardrailCrossRegionConfig? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        sensitive_information_policy_config : Types::GuardrailSensitiveInformationPolicyConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        topic_policy_config : Types::GuardrailTopicPolicyConfig? = nil,
        word_policy_config : Types::GuardrailWordPolicyConfig? = nil
      ) : Protocol::Request
        input = Types::CreateGuardrailRequest.new(blocked_input_messaging: blocked_input_messaging, blocked_outputs_messaging: blocked_outputs_messaging, name: name, automated_reasoning_policy_config: automated_reasoning_policy_config, client_request_token: client_request_token, content_policy_config: content_policy_config, contextual_grounding_policy_config: contextual_grounding_policy_config, cross_region_config: cross_region_config, description: description, kms_key_id: kms_key_id, sensitive_information_policy_config: sensitive_information_policy_config, tags: tags, topic_policy_config: topic_policy_config, word_policy_config: word_policy_config)
        create_guardrail(input)
      end

      def create_guardrail(input : Types::CreateGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of the guardrail. Use this API to create a snapshot of the guardrail when you are
      # satisfied with a configuration, or to compare the configuration with another version.

      def create_guardrail_version(
        guardrail_identifier : String,
        client_request_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateGuardrailVersionRequest.new(guardrail_identifier: guardrail_identifier, client_request_token: client_request_token, description: description)
        create_guardrail_version(input)
      end

      def create_guardrail_version(input : Types::CreateGuardrailVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GUARDRAIL_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an application inference profile to track metrics and costs when invoking a model. To create
      # an application inference profile for a foundation model in one region, specify the ARN of the model
      # in that region. To create an application inference profile for a foundation model across multiple
      # regions, specify the ARN of the system-defined inference profile that contains the regions that you
      # want to route requests to. For more information, see Increase throughput and resilience with
      # cross-region inference in Amazon Bedrock . in the Amazon Bedrock User Guide.

      def create_inference_profile(
        inference_profile_name : String,
        model_source : Types::InferenceProfileModelSource,
        client_request_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateInferenceProfileRequest.new(inference_profile_name: inference_profile_name, model_source: model_source, client_request_token: client_request_token, description: description, tags: tags)
        create_inference_profile(input)
      end

      def create_inference_profile(input : Types::CreateInferenceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INFERENCE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an endpoint for a model from Amazon Bedrock Marketplace. The endpoint is hosted by Amazon
      # SageMaker.

      def create_marketplace_model_endpoint(
        endpoint_config : Types::EndpointConfig,
        endpoint_name : String,
        model_source_identifier : String,
        accept_eula : Bool? = nil,
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMarketplaceModelEndpointRequest.new(endpoint_config: endpoint_config, endpoint_name: endpoint_name, model_source_identifier: model_source_identifier, accept_eula: accept_eula, client_request_token: client_request_token, tags: tags)
        create_marketplace_model_endpoint(input)
      end

      def create_marketplace_model_endpoint(input : Types::CreateMarketplaceModelEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MARKETPLACE_MODEL_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Copies a model to another region so that it can be used there. For more information, see Copy models
      # to be used in other regions in the Amazon Bedrock User Guide .

      def create_model_copy_job(
        source_model_arn : String,
        target_model_name : String,
        client_request_token : String? = nil,
        model_kms_key_id : String? = nil,
        target_model_tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateModelCopyJobRequest.new(source_model_arn: source_model_arn, target_model_name: target_model_name, client_request_token: client_request_token, model_kms_key_id: model_kms_key_id, target_model_tags: target_model_tags)
        create_model_copy_job(input)
      end

      def create_model_copy_job(input : Types::CreateModelCopyJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MODEL_COPY_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a fine-tuning job to customize a base model. You specify the base foundation model and the
      # location of the training data. After the model-customization job completes successfully, your custom
      # model resource will be ready to use. Amazon Bedrock returns validation loss metrics and output
      # generations after the job completes. For information on the format of training and validation data,
      # see Prepare the datasets . Model-customization jobs are asynchronous and the completion time depends
      # on the base model and the training/validation data size. To monitor a job, use the
      # GetModelCustomizationJob operation to retrieve the job status. For more information, see Custom
      # models in the Amazon Bedrock User Guide .

      def create_model_customization_job(
        base_model_identifier : String,
        custom_model_name : String,
        job_name : String,
        output_data_config : Types::OutputDataConfig,
        role_arn : String,
        training_data_config : Types::TrainingDataConfig,
        client_request_token : String? = nil,
        custom_model_kms_key_id : String? = nil,
        custom_model_tags : Array(Types::Tag)? = nil,
        customization_config : Types::CustomizationConfig? = nil,
        customization_type : String? = nil,
        hyper_parameters : Hash(String, String)? = nil,
        job_tags : Array(Types::Tag)? = nil,
        validation_data_config : Types::ValidationDataConfig? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Protocol::Request
        input = Types::CreateModelCustomizationJobRequest.new(base_model_identifier: base_model_identifier, custom_model_name: custom_model_name, job_name: job_name, output_data_config: output_data_config, role_arn: role_arn, training_data_config: training_data_config, client_request_token: client_request_token, custom_model_kms_key_id: custom_model_kms_key_id, custom_model_tags: custom_model_tags, customization_config: customization_config, customization_type: customization_type, hyper_parameters: hyper_parameters, job_tags: job_tags, validation_data_config: validation_data_config, vpc_config: vpc_config)
        create_model_customization_job(input)
      end

      def create_model_customization_job(input : Types::CreateModelCustomizationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MODEL_CUSTOMIZATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a model import job to import model that you have customized in other environments, such as
      # Amazon SageMaker. For more information, see Import a customized model

      def create_model_import_job(
        imported_model_name : String,
        job_name : String,
        model_data_source : Types::ModelDataSource,
        role_arn : String,
        client_request_token : String? = nil,
        imported_model_kms_key_id : String? = nil,
        imported_model_tags : Array(Types::Tag)? = nil,
        job_tags : Array(Types::Tag)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Protocol::Request
        input = Types::CreateModelImportJobRequest.new(imported_model_name: imported_model_name, job_name: job_name, model_data_source: model_data_source, role_arn: role_arn, client_request_token: client_request_token, imported_model_kms_key_id: imported_model_kms_key_id, imported_model_tags: imported_model_tags, job_tags: job_tags, vpc_config: vpc_config)
        create_model_import_job(input)
      end

      def create_model_import_job(input : Types::CreateModelImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MODEL_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a batch inference job to invoke a model on multiple prompts. Format your data according to
      # Format your inference data and upload it to an Amazon S3 bucket. For more information, see Process
      # multiple prompts with batch inference . The response returns a jobArn that you can use to stop or
      # get details about the job.

      def create_model_invocation_job(
        input_data_config : Types::ModelInvocationJobInputDataConfig,
        job_name : String,
        model_id : String,
        output_data_config : Types::ModelInvocationJobOutputDataConfig,
        role_arn : String,
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout_duration_in_hours : Int32? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Protocol::Request
        input = Types::CreateModelInvocationJobRequest.new(input_data_config: input_data_config, job_name: job_name, model_id: model_id, output_data_config: output_data_config, role_arn: role_arn, client_request_token: client_request_token, tags: tags, timeout_duration_in_hours: timeout_duration_in_hours, vpc_config: vpc_config)
        create_model_invocation_job(input)
      end

      def create_model_invocation_job(input : Types::CreateModelInvocationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MODEL_INVOCATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a prompt router that manages the routing of requests between multiple foundation models
      # based on the routing criteria.

      def create_prompt_router(
        fallback_model : Types::PromptRouterTargetModel,
        models : Array(Types::PromptRouterTargetModel),
        prompt_router_name : String,
        routing_criteria : Types::RoutingCriteria,
        client_request_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreatePromptRouterRequest.new(fallback_model: fallback_model, models: models, prompt_router_name: prompt_router_name, routing_criteria: routing_criteria, client_request_token: client_request_token, description: description, tags: tags)
        create_prompt_router(input)
      end

      def create_prompt_router(input : Types::CreatePromptRouterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROMPT_ROUTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates dedicated throughput for a base or custom model with the model units and for the duration
      # that you specify. For pricing details, see Amazon Bedrock Pricing . For more information, see
      # Provisioned Throughput in the Amazon Bedrock User Guide .

      def create_provisioned_model_throughput(
        model_id : String,
        model_units : Int32,
        provisioned_model_name : String,
        client_request_token : String? = nil,
        commitment_duration : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateProvisionedModelThroughputRequest.new(model_id: model_id, model_units: model_units, provisioned_model_name: provisioned_model_name, client_request_token: client_request_token, commitment_duration: commitment_duration, tags: tags)
        create_provisioned_model_throughput(input)
      end

      def create_provisioned_model_throughput(input : Types::CreateProvisionedModelThroughputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROVISIONED_MODEL_THROUGHPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Automated Reasoning policy or policy version. This operation is idempotent. If you delete
      # a policy more than once, each call succeeds. Deleting a policy removes it permanently and cannot be
      # undone.

      def delete_automated_reasoning_policy(
        policy_arn : String,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAutomatedReasoningPolicyRequest.new(policy_arn: policy_arn, force: force)
        delete_automated_reasoning_policy(input)
      end

      def delete_automated_reasoning_policy(input : Types::DeleteAutomatedReasoningPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTOMATED_REASONING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Automated Reasoning policy build workflow and its associated artifacts. This permanently
      # removes the workflow history and any generated assets.

      def delete_automated_reasoning_policy_build_workflow(
        build_workflow_id : String,
        last_updated_at : Time,
        policy_arn : String
      ) : Protocol::Request
        input = Types::DeleteAutomatedReasoningPolicyBuildWorkflowRequest.new(build_workflow_id: build_workflow_id, last_updated_at: last_updated_at, policy_arn: policy_arn)
        delete_automated_reasoning_policy_build_workflow(input)
      end

      def delete_automated_reasoning_policy_build_workflow(input : Types::DeleteAutomatedReasoningPolicyBuildWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Automated Reasoning policy test. This operation is idempotent; if you delete a test more
      # than once, each call succeeds.

      def delete_automated_reasoning_policy_test_case(
        last_updated_at : Time,
        policy_arn : String,
        test_case_id : String
      ) : Protocol::Request
        input = Types::DeleteAutomatedReasoningPolicyTestCaseRequest.new(last_updated_at: last_updated_at, policy_arn: policy_arn, test_case_id: test_case_id)
        delete_automated_reasoning_policy_test_case(input)
      end

      def delete_automated_reasoning_policy_test_case(input : Types::DeleteAutomatedReasoningPolicyTestCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTOMATED_REASONING_POLICY_TEST_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom model that you created earlier. For more information, see Custom models in the
      # Amazon Bedrock User Guide .

      def delete_custom_model(
        model_identifier : String
      ) : Protocol::Request
        input = Types::DeleteCustomModelRequest.new(model_identifier: model_identifier)
        delete_custom_model(input)
      end

      def delete_custom_model(input : Types::DeleteCustomModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom model deployment. This operation stops the deployment and removes it from your
      # account. After deletion, the deployment ARN can no longer be used for inference requests. The
      # following actions are related to the DeleteCustomModelDeployment operation:
      # CreateCustomModelDeployment GetCustomModelDeployment ListCustomModelDeployments

      def delete_custom_model_deployment(
        custom_model_deployment_identifier : String
      ) : Protocol::Request
        input = Types::DeleteCustomModelDeploymentRequest.new(custom_model_deployment_identifier: custom_model_deployment_identifier)
        delete_custom_model_deployment(input)
      end

      def delete_custom_model_deployment(input : Types::DeleteCustomModelDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_MODEL_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the account-level enforced guardrail configuration.

      def delete_enforced_guardrail_configuration(
        config_id : String
      ) : Protocol::Request
        input = Types::DeleteEnforcedGuardrailConfigurationRequest.new(config_id: config_id)
        delete_enforced_guardrail_configuration(input)
      end

      def delete_enforced_guardrail_configuration(input : Types::DeleteEnforcedGuardrailConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENFORCED_GUARDRAIL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the model access agreement for the specified model.

      def delete_foundation_model_agreement(
        model_id : String
      ) : Protocol::Request
        input = Types::DeleteFoundationModelAgreementRequest.new(model_id: model_id)
        delete_foundation_model_agreement(input)
      end

      def delete_foundation_model_agreement(input : Types::DeleteFoundationModelAgreementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FOUNDATION_MODEL_AGREEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a guardrail. To delete a guardrail, only specify the ARN of the guardrail in the
      # guardrailIdentifier field. If you delete a guardrail, all of its versions will be deleted. To delete
      # a version of a guardrail, specify the ARN of the guardrail in the guardrailIdentifier field and the
      # version in the guardrailVersion field.

      def delete_guardrail(
        guardrail_identifier : String,
        guardrail_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteGuardrailRequest.new(guardrail_identifier: guardrail_identifier, guardrail_version: guardrail_version)
        delete_guardrail(input)
      end

      def delete_guardrail(input : Types::DeleteGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom model that you imported earlier. For more information, see Import a customized
      # model in the Amazon Bedrock User Guide .

      def delete_imported_model(
        model_identifier : String
      ) : Protocol::Request
        input = Types::DeleteImportedModelRequest.new(model_identifier: model_identifier)
        delete_imported_model(input)
      end

      def delete_imported_model(input : Types::DeleteImportedModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IMPORTED_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an application inference profile. For more information, see Increase throughput and
      # resilience with cross-region inference in Amazon Bedrock . in the Amazon Bedrock User Guide.

      def delete_inference_profile(
        inference_profile_identifier : String
      ) : Protocol::Request
        input = Types::DeleteInferenceProfileRequest.new(inference_profile_identifier: inference_profile_identifier)
        delete_inference_profile(input)
      end

      def delete_inference_profile(input : Types::DeleteInferenceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INFERENCE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an endpoint for a model from Amazon Bedrock Marketplace.

      def delete_marketplace_model_endpoint(
        endpoint_arn : String
      ) : Protocol::Request
        input = Types::DeleteMarketplaceModelEndpointRequest.new(endpoint_arn: endpoint_arn)
        delete_marketplace_model_endpoint(input)
      end

      def delete_marketplace_model_endpoint(input : Types::DeleteMarketplaceModelEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MARKETPLACE_MODEL_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the invocation logging.

      def delete_model_invocation_logging_configuration : Protocol::Request
        input = Types::DeleteModelInvocationLoggingConfigurationRequest.new
        delete_model_invocation_logging_configuration(input)
      end

      def delete_model_invocation_logging_configuration(input : Types::DeleteModelInvocationLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MODEL_INVOCATION_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified prompt router. This action cannot be undone.

      def delete_prompt_router(
        prompt_router_arn : String
      ) : Protocol::Request
        input = Types::DeletePromptRouterRequest.new(prompt_router_arn: prompt_router_arn)
        delete_prompt_router(input)
      end

      def delete_prompt_router(input : Types::DeletePromptRouterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROMPT_ROUTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Provisioned Throughput. You can't delete a Provisioned Throughput before the commitment
      # term is over. For more information, see Provisioned Throughput in the Amazon Bedrock User Guide .

      def delete_provisioned_model_throughput(
        provisioned_model_id : String
      ) : Protocol::Request
        input = Types::DeleteProvisionedModelThroughputRequest.new(provisioned_model_id: provisioned_model_id)
        delete_provisioned_model_throughput(input)
      end

      def delete_provisioned_model_throughput(input : Types::DeleteProvisionedModelThroughputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROVISIONED_MODEL_THROUGHPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters an endpoint for a model from Amazon Bedrock Marketplace. This operation removes the
      # endpoint's association with Amazon Bedrock but does not delete the underlying Amazon SageMaker
      # endpoint.

      def deregister_marketplace_model_endpoint(
        endpoint_arn : String
      ) : Protocol::Request
        input = Types::DeregisterMarketplaceModelEndpointRequest.new(endpoint_arn: endpoint_arn)
        deregister_marketplace_model_endpoint(input)
      end

      def deregister_marketplace_model_endpoint(input : Types::DeregisterMarketplaceModelEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_MARKETPLACE_MODEL_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports the policy definition for an Automated Reasoning policy version. Returns the complete policy
      # definition including rules, variables, and custom variable types in a structured format.

      def export_automated_reasoning_policy_version(
        policy_arn : String
      ) : Protocol::Request
        input = Types::ExportAutomatedReasoningPolicyVersionRequest.new(policy_arn: policy_arn)
        export_automated_reasoning_policy_version(input)
      end

      def export_automated_reasoning_policy_version(input : Types::ExportAutomatedReasoningPolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_AUTOMATED_REASONING_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about an Automated Reasoning policy or policy version. Returns information
      # including the policy definition, metadata, and timestamps.

      def get_automated_reasoning_policy(
        policy_arn : String
      ) : Protocol::Request
        input = Types::GetAutomatedReasoningPolicyRequest.new(policy_arn: policy_arn)
        get_automated_reasoning_policy(input)
      end

      def get_automated_reasoning_policy(input : Types::GetAutomatedReasoningPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_REASONING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current annotations for an Automated Reasoning policy build workflow. Annotations
      # contain corrections to the rules, variables and types to be applied to the policy.

      def get_automated_reasoning_policy_annotations(
        build_workflow_id : String,
        policy_arn : String
      ) : Protocol::Request
        input = Types::GetAutomatedReasoningPolicyAnnotationsRequest.new(build_workflow_id: build_workflow_id, policy_arn: policy_arn)
        get_automated_reasoning_policy_annotations(input)
      end

      def get_automated_reasoning_policy_annotations(input : Types::GetAutomatedReasoningPolicyAnnotationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_REASONING_POLICY_ANNOTATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about an Automated Reasoning policy build workflow, including its
      # status, configuration, and metadata.

      def get_automated_reasoning_policy_build_workflow(
        build_workflow_id : String,
        policy_arn : String
      ) : Protocol::Request
        input = Types::GetAutomatedReasoningPolicyBuildWorkflowRequest.new(build_workflow_id: build_workflow_id, policy_arn: policy_arn)
        get_automated_reasoning_policy_build_workflow(input)
      end

      def get_automated_reasoning_policy_build_workflow(input : Types::GetAutomatedReasoningPolicyBuildWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resulting assets from a completed Automated Reasoning policy build workflow, including
      # build logs, quality reports, and generated policy artifacts.

      def get_automated_reasoning_policy_build_workflow_result_assets(
        asset_type : String,
        build_workflow_id : String,
        policy_arn : String
      ) : Protocol::Request
        input = Types::GetAutomatedReasoningPolicyBuildWorkflowResultAssetsRequest.new(asset_type: asset_type, build_workflow_id: build_workflow_id, policy_arn: policy_arn)
        get_automated_reasoning_policy_build_workflow_result_assets(input)
      end

      def get_automated_reasoning_policy_build_workflow_result_assets(input : Types::GetAutomatedReasoningPolicyBuildWorkflowResultAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW_RESULT_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the next test scenario for validating an Automated Reasoning policy. This is used during
      # the interactive policy refinement process to test policy behavior.

      def get_automated_reasoning_policy_next_scenario(
        build_workflow_id : String,
        policy_arn : String
      ) : Protocol::Request
        input = Types::GetAutomatedReasoningPolicyNextScenarioRequest.new(build_workflow_id: build_workflow_id, policy_arn: policy_arn)
        get_automated_reasoning_policy_next_scenario(input)
      end

      def get_automated_reasoning_policy_next_scenario(input : Types::GetAutomatedReasoningPolicyNextScenarioRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_REASONING_POLICY_NEXT_SCENARIO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a specific Automated Reasoning policy test.

      def get_automated_reasoning_policy_test_case(
        policy_arn : String,
        test_case_id : String
      ) : Protocol::Request
        input = Types::GetAutomatedReasoningPolicyTestCaseRequest.new(policy_arn: policy_arn, test_case_id: test_case_id)
        get_automated_reasoning_policy_test_case(input)
      end

      def get_automated_reasoning_policy_test_case(input : Types::GetAutomatedReasoningPolicyTestCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_REASONING_POLICY_TEST_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the test result for a specific Automated Reasoning policy test. Returns detailed
      # validation findings and execution status.

      def get_automated_reasoning_policy_test_result(
        build_workflow_id : String,
        policy_arn : String,
        test_case_id : String
      ) : Protocol::Request
        input = Types::GetAutomatedReasoningPolicyTestResultRequest.new(build_workflow_id: build_workflow_id, policy_arn: policy_arn, test_case_id: test_case_id)
        get_automated_reasoning_policy_test_result(input)
      end

      def get_automated_reasoning_policy_test_result(input : Types::GetAutomatedReasoningPolicyTestResultRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_REASONING_POLICY_TEST_RESULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the properties associated with a Amazon Bedrock custom model that you have created. For more
      # information, see Custom models in the Amazon Bedrock User Guide .

      def get_custom_model(
        model_identifier : String
      ) : Protocol::Request
        input = Types::GetCustomModelRequest.new(model_identifier: model_identifier)
        get_custom_model(input)
      end

      def get_custom_model(input : Types::GetCustomModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CUSTOM_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a custom model deployment, including its status, configuration, and
      # metadata. Use this operation to monitor the deployment status and retrieve details needed for
      # inference requests. The following actions are related to the GetCustomModelDeployment operation:
      # CreateCustomModelDeployment ListCustomModelDeployments DeleteCustomModelDeployment

      def get_custom_model_deployment(
        custom_model_deployment_identifier : String
      ) : Protocol::Request
        input = Types::GetCustomModelDeploymentRequest.new(custom_model_deployment_identifier: custom_model_deployment_identifier)
        get_custom_model_deployment(input)
      end

      def get_custom_model_deployment(input : Types::GetCustomModelDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CUSTOM_MODEL_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an evaluation job, such as the status of the job.

      def get_evaluation_job(
        job_identifier : String
      ) : Protocol::Request
        input = Types::GetEvaluationJobRequest.new(job_identifier: job_identifier)
        get_evaluation_job(input)
      end

      def get_evaluation_job(input : Types::GetEvaluationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVALUATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details about a Amazon Bedrock foundation model.

      def get_foundation_model(
        model_identifier : String
      ) : Protocol::Request
        input = Types::GetFoundationModelRequest.new(model_identifier: model_identifier)
        get_foundation_model(input)
      end

      def get_foundation_model(input : Types::GetFoundationModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FOUNDATION_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about the Foundation model availability.

      def get_foundation_model_availability(
        model_id : String
      ) : Protocol::Request
        input = Types::GetFoundationModelAvailabilityRequest.new(model_id: model_id)
        get_foundation_model_availability(input)
      end

      def get_foundation_model_availability(input : Types::GetFoundationModelAvailabilityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FOUNDATION_MODEL_AVAILABILITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a guardrail. If you don't specify a version, the response returns details for the
      # DRAFT version.

      def get_guardrail(
        guardrail_identifier : String,
        guardrail_version : String? = nil
      ) : Protocol::Request
        input = Types::GetGuardrailRequest.new(guardrail_identifier: guardrail_identifier, guardrail_version: guardrail_version)
        get_guardrail(input)
      end

      def get_guardrail(input : Types::GetGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets properties associated with a customized model you imported.

      def get_imported_model(
        model_identifier : String
      ) : Protocol::Request
        input = Types::GetImportedModelRequest.new(model_identifier: model_identifier)
        get_imported_model(input)
      end

      def get_imported_model(input : Types::GetImportedModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORTED_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an inference profile. For more information, see Increase throughput and
      # resilience with cross-region inference in Amazon Bedrock . in the Amazon Bedrock User Guide.

      def get_inference_profile(
        inference_profile_identifier : String
      ) : Protocol::Request
        input = Types::GetInferenceProfileRequest.new(inference_profile_identifier: inference_profile_identifier)
        get_inference_profile(input)
      end

      def get_inference_profile(input : Types::GetInferenceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INFERENCE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a specific endpoint for a model from Amazon Bedrock Marketplace.

      def get_marketplace_model_endpoint(
        endpoint_arn : String
      ) : Protocol::Request
        input = Types::GetMarketplaceModelEndpointRequest.new(endpoint_arn: endpoint_arn)
        get_marketplace_model_endpoint(input)
      end

      def get_marketplace_model_endpoint(input : Types::GetMarketplaceModelEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MARKETPLACE_MODEL_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a model copy job. For more information, see Copy models to be used in
      # other regions in the Amazon Bedrock User Guide .

      def get_model_copy_job(
        job_arn : String
      ) : Protocol::Request
        input = Types::GetModelCopyJobRequest.new(job_arn: job_arn)
        get_model_copy_job(input)
      end

      def get_model_copy_job(input : Types::GetModelCopyJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL_COPY_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the properties associated with a model-customization job, including the status of the job.
      # For more information, see Custom models in the Amazon Bedrock User Guide .

      def get_model_customization_job(
        job_identifier : String
      ) : Protocol::Request
        input = Types::GetModelCustomizationJobRequest.new(job_identifier: job_identifier)
        get_model_customization_job(input)
      end

      def get_model_customization_job(input : Types::GetModelCustomizationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL_CUSTOMIZATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the properties associated with import model job, including the status of the job. For more
      # information, see Import a customized model in the Amazon Bedrock User Guide .

      def get_model_import_job(
        job_identifier : String
      ) : Protocol::Request
        input = Types::GetModelImportJobRequest.new(job_identifier: job_identifier)
        get_model_import_job(input)
      end

      def get_model_import_job(input : Types::GetModelImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a batch inference job. For more information, see Monitor batch inference jobs

      def get_model_invocation_job(
        job_identifier : String
      ) : Protocol::Request
        input = Types::GetModelInvocationJobRequest.new(job_identifier: job_identifier)
        get_model_invocation_job(input)
      end

      def get_model_invocation_job(input : Types::GetModelInvocationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL_INVOCATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the current configuration values for model invocation logging.

      def get_model_invocation_logging_configuration : Protocol::Request
        input = Types::GetModelInvocationLoggingConfigurationRequest.new
        get_model_invocation_logging_configuration(input)
      end

      def get_model_invocation_logging_configuration(input : Types::GetModelInvocationLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL_INVOCATION_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a prompt router.

      def get_prompt_router(
        prompt_router_arn : String
      ) : Protocol::Request
        input = Types::GetPromptRouterRequest.new(prompt_router_arn: prompt_router_arn)
        get_prompt_router(input)
      end

      def get_prompt_router(input : Types::GetPromptRouterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROMPT_ROUTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details for a Provisioned Throughput. For more information, see Provisioned Throughput in
      # the Amazon Bedrock User Guide .

      def get_provisioned_model_throughput(
        provisioned_model_id : String
      ) : Protocol::Request
        input = Types::GetProvisionedModelThroughputRequest.new(provisioned_model_id: provisioned_model_id)
        get_provisioned_model_throughput(input)
      end

      def get_provisioned_model_throughput(input : Types::GetProvisionedModelThroughputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROVISIONED_MODEL_THROUGHPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get usecase for model access.

      def get_use_case_for_model_access : Protocol::Request
        input = Types::GetUseCaseForModelAccessRequest.new
        get_use_case_for_model_access(input)
      end

      def get_use_case_for_model_access(input : Types::GetUseCaseForModelAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USE_CASE_FOR_MODEL_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Automated Reasoning policies in your account, with optional filtering by policy ARN. This
      # helps you manage and discover existing policies.

      def list_automated_reasoning_policies(
        max_results : Int32? = nil,
        next_token : String? = nil,
        policy_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListAutomatedReasoningPoliciesRequest.new(max_results: max_results, next_token: next_token, policy_arn: policy_arn)
        list_automated_reasoning_policies(input)
      end

      def list_automated_reasoning_policies(input : Types::ListAutomatedReasoningPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOMATED_REASONING_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all build workflows for an Automated Reasoning policy, showing the history of policy creation
      # and modification attempts.

      def list_automated_reasoning_policy_build_workflows(
        policy_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAutomatedReasoningPolicyBuildWorkflowsRequest.new(policy_arn: policy_arn, max_results: max_results, next_token: next_token)
        list_automated_reasoning_policy_build_workflows(input)
      end

      def list_automated_reasoning_policy_build_workflows(input : Types::ListAutomatedReasoningPolicyBuildWorkflowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tests for an Automated Reasoning policy. We recommend using pagination to ensure that the
      # operation returns quickly and successfully.

      def list_automated_reasoning_policy_test_cases(
        policy_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAutomatedReasoningPolicyTestCasesRequest.new(policy_arn: policy_arn, max_results: max_results, next_token: next_token)
        list_automated_reasoning_policy_test_cases(input)
      end

      def list_automated_reasoning_policy_test_cases(input : Types::ListAutomatedReasoningPolicyTestCasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOMATED_REASONING_POLICY_TEST_CASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists test results for an Automated Reasoning policy, showing how the policy performed against
      # various test scenarios and validation checks.

      def list_automated_reasoning_policy_test_results(
        build_workflow_id : String,
        policy_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAutomatedReasoningPolicyTestResultsRequest.new(build_workflow_id: build_workflow_id, policy_arn: policy_arn, max_results: max_results, next_token: next_token)
        list_automated_reasoning_policy_test_results(input)
      end

      def list_automated_reasoning_policy_test_results(input : Types::ListAutomatedReasoningPolicyTestResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOMATED_REASONING_POLICY_TEST_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists custom model deployments in your account. You can filter the results by creation time, name,
      # status, and associated model. Use this operation to manage and monitor your custom model
      # deployments. We recommend using pagination to ensure that the operation returns quickly and
      # successfully. The following actions are related to the ListCustomModelDeployments operation:
      # CreateCustomModelDeployment GetCustomModelDeployment DeleteCustomModelDeployment

      def list_custom_model_deployments(
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        model_arn_equals : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomModelDeploymentsRequest.new(created_after: created_after, created_before: created_before, max_results: max_results, model_arn_equals: model_arn_equals, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_custom_model_deployments(input)
      end

      def list_custom_model_deployments(input : Types::ListCustomModelDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_MODEL_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the custom models that you have created with the CreateModelCustomizationJob
      # operation. For more information, see Custom models in the Amazon Bedrock User Guide .

      def list_custom_models(
        base_model_arn_equals : String? = nil,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        foundation_model_arn_equals : String? = nil,
        is_owned : Bool? = nil,
        max_results : Int32? = nil,
        model_status : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomModelsRequest.new(base_model_arn_equals: base_model_arn_equals, creation_time_after: creation_time_after, creation_time_before: creation_time_before, foundation_model_arn_equals: foundation_model_arn_equals, is_owned: is_owned, max_results: max_results, model_status: model_status, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_custom_models(input)
      end

      def list_custom_models(input : Types::ListCustomModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the account-level enforced guardrail configurations.

      def list_enforced_guardrails_configuration(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnforcedGuardrailsConfigurationRequest.new(next_token: next_token)
        list_enforced_guardrails_configuration(input)
      end

      def list_enforced_guardrails_configuration(input : Types::ListEnforcedGuardrailsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENFORCED_GUARDRAILS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all existing evaluation jobs.

      def list_evaluation_jobs(
        application_type_equals : String? = nil,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListEvaluationJobsRequest.new(application_type_equals: application_type_equals, creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_evaluation_jobs(input)
      end

      def list_evaluation_jobs(input : Types::ListEvaluationJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVALUATION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the offers associated with the specified model.

      def list_foundation_model_agreement_offers(
        model_id : String,
        offer_type : String? = nil
      ) : Protocol::Request
        input = Types::ListFoundationModelAgreementOffersRequest.new(model_id: model_id, offer_type: offer_type)
        list_foundation_model_agreement_offers(input)
      end

      def list_foundation_model_agreement_offers(input : Types::ListFoundationModelAgreementOffersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FOUNDATION_MODEL_AGREEMENT_OFFERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon Bedrock foundation models that you can use. You can filter the results with the request
      # parameters. For more information, see Foundation models in the Amazon Bedrock User Guide .

      def list_foundation_models(
        by_customization_type : String? = nil,
        by_inference_type : String? = nil,
        by_output_modality : String? = nil,
        by_provider : String? = nil
      ) : Protocol::Request
        input = Types::ListFoundationModelsRequest.new(by_customization_type: by_customization_type, by_inference_type: by_inference_type, by_output_modality: by_output_modality, by_provider: by_provider)
        list_foundation_models(input)
      end

      def list_foundation_models(input : Types::ListFoundationModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FOUNDATION_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists details about all the guardrails in an account. To list the DRAFT version of all your
      # guardrails, don't specify the guardrailIdentifier field. To list all versions of a guardrail,
      # specify the ARN of the guardrail in the guardrailIdentifier field. You can set the maximum number of
      # results to return in a response in the maxResults field. If there are more results than the number
      # you set, the response returns a nextToken that you can send in another ListGuardrails request to see
      # the next batch of results.

      def list_guardrails(
        guardrail_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGuardrailsRequest.new(guardrail_identifier: guardrail_identifier, max_results: max_results, next_token: next_token)
        list_guardrails(input)
      end

      def list_guardrails(input : Types::ListGuardrailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GUARDRAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of models you've imported. You can filter the results to return based on one or more
      # criteria. For more information, see Import a customized model in the Amazon Bedrock User Guide .

      def list_imported_models(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListImportedModelsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_imported_models(input)
      end

      def list_imported_models(input : Types::ListImportedModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORTED_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of inference profiles that you can use. For more information, see Increase throughput
      # and resilience with cross-region inference in Amazon Bedrock . in the Amazon Bedrock User Guide.

      def list_inference_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil,
        type_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListInferenceProfilesRequest.new(max_results: max_results, next_token: next_token, type_equals: type_equals)
        list_inference_profiles(input)
      end

      def list_inference_profiles(input : Types::ListInferenceProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INFERENCE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the endpoints for models from Amazon Bedrock Marketplace in your Amazon Web Services account.

      def list_marketplace_model_endpoints(
        max_results : Int32? = nil,
        model_source_equals : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMarketplaceModelEndpointsRequest.new(max_results: max_results, model_source_equals: model_source_equals, next_token: next_token)
        list_marketplace_model_endpoints(input)
      end

      def list_marketplace_model_endpoints(input : Types::ListMarketplaceModelEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MARKETPLACE_MODEL_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of model copy jobs that you have submitted. You can filter the jobs to return based
      # on one or more criteria. For more information, see Copy models to be used in other regions in the
      # Amazon Bedrock User Guide .

      def list_model_copy_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        source_account_equals : String? = nil,
        source_model_arn_equals : String? = nil,
        status_equals : String? = nil,
        target_model_name_contains : String? = nil
      ) : Protocol::Request
        input = Types::ListModelCopyJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, source_account_equals: source_account_equals, source_model_arn_equals: source_model_arn_equals, status_equals: status_equals, target_model_name_contains: target_model_name_contains)
        list_model_copy_jobs(input)
      end

      def list_model_copy_jobs(input : Types::ListModelCopyJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MODEL_COPY_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of model customization jobs that you have submitted. You can filter the jobs to
      # return based on one or more criteria. For more information, see Custom models in the Amazon Bedrock
      # User Guide .

      def list_model_customization_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListModelCustomizationJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_model_customization_jobs(input)
      end

      def list_model_customization_jobs(input : Types::ListModelCustomizationJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MODEL_CUSTOMIZATION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of import jobs you've submitted. You can filter the results to return based on one or
      # more criteria. For more information, see Import a customized model in the Amazon Bedrock User Guide
      # .

      def list_model_import_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListModelImportJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_model_import_jobs(input)
      end

      def list_model_import_jobs(input : Types::ListModelImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MODEL_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all batch inference jobs in the account. For more information, see View details about a batch
      # inference job .

      def list_model_invocation_jobs(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil,
        submit_time_after : Time? = nil,
        submit_time_before : Time? = nil
      ) : Protocol::Request
        input = Types::ListModelInvocationJobsRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals, submit_time_after: submit_time_after, submit_time_before: submit_time_before)
        list_model_invocation_jobs(input)
      end

      def list_model_invocation_jobs(input : Types::ListModelInvocationJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MODEL_INVOCATION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of prompt routers.

      def list_prompt_routers(
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListPromptRoutersRequest.new(max_results: max_results, next_token: next_token, type: type)
        list_prompt_routers(input)
      end

      def list_prompt_routers(input : Types::ListPromptRoutersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROMPT_ROUTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Provisioned Throughputs in the account. For more information, see Provisioned Throughput
      # in the Amazon Bedrock User Guide .

      def list_provisioned_model_throughputs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        model_arn_equals : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListProvisionedModelThroughputsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, model_arn_equals: model_arn_equals, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_provisioned_model_throughputs(input)
      end

      def list_provisioned_model_throughputs(input : Types::ListProvisionedModelThroughputsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROVISIONED_MODEL_THROUGHPUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the tags associated with the specified resource. For more information, see Tagging resources in
      # the Amazon Bedrock User Guide .

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

      # Sets the account-level enforced guardrail configuration.

      def put_enforced_guardrail_configuration(
        guardrail_inference_config : Types::AccountEnforcedGuardrailInferenceInputConfiguration,
        config_id : String? = nil
      ) : Protocol::Request
        input = Types::PutEnforcedGuardrailConfigurationRequest.new(guardrail_inference_config: guardrail_inference_config, config_id: config_id)
        put_enforced_guardrail_configuration(input)
      end

      def put_enforced_guardrail_configuration(input : Types::PutEnforcedGuardrailConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ENFORCED_GUARDRAIL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Set the configuration values for model invocation logging.

      def put_model_invocation_logging_configuration(
        logging_config : Types::LoggingConfig
      ) : Protocol::Request
        input = Types::PutModelInvocationLoggingConfigurationRequest.new(logging_config: logging_config)
        put_model_invocation_logging_configuration(input)
      end

      def put_model_invocation_logging_configuration(input : Types::PutModelInvocationLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_MODEL_INVOCATION_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Put usecase for model access.

      def put_use_case_for_model_access(
        form_data : Bytes
      ) : Protocol::Request
        input = Types::PutUseCaseForModelAccessRequest.new(form_data: form_data)
        put_use_case_for_model_access(input)
      end

      def put_use_case_for_model_access(input : Types::PutUseCaseForModelAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_USE_CASE_FOR_MODEL_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers an existing Amazon SageMaker endpoint with Amazon Bedrock Marketplace, allowing it to be
      # used with Amazon Bedrock APIs.

      def register_marketplace_model_endpoint(
        endpoint_identifier : String,
        model_source_identifier : String
      ) : Protocol::Request
        input = Types::RegisterMarketplaceModelEndpointRequest.new(endpoint_identifier: endpoint_identifier, model_source_identifier: model_source_identifier)
        register_marketplace_model_endpoint(input)
      end

      def register_marketplace_model_endpoint(input : Types::RegisterMarketplaceModelEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_MARKETPLACE_MODEL_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a new build workflow for an Automated Reasoning policy. This initiates the process of
      # analyzing source documents and generating policy rules, variables, and types.

      def start_automated_reasoning_policy_build_workflow(
        build_workflow_type : String,
        policy_arn : String,
        source_content : Types::AutomatedReasoningPolicyBuildWorkflowSource,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::StartAutomatedReasoningPolicyBuildWorkflowRequest.new(build_workflow_type: build_workflow_type, policy_arn: policy_arn, source_content: source_content, client_request_token: client_request_token)
        start_automated_reasoning_policy_build_workflow(input)
      end

      def start_automated_reasoning_policy_build_workflow(input : Types::StartAutomatedReasoningPolicyBuildWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a test workflow to validate Automated Reasoning policy tests. The workflow executes the
      # specified tests against the policy and generates validation results.

      def start_automated_reasoning_policy_test_workflow(
        build_workflow_id : String,
        policy_arn : String,
        client_request_token : String? = nil,
        test_case_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::StartAutomatedReasoningPolicyTestWorkflowRequest.new(build_workflow_id: build_workflow_id, policy_arn: policy_arn, client_request_token: client_request_token, test_case_ids: test_case_ids)
        start_automated_reasoning_policy_test_workflow(input)
      end

      def start_automated_reasoning_policy_test_workflow(input : Types::StartAutomatedReasoningPolicyTestWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_AUTOMATED_REASONING_POLICY_TEST_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops an evaluation job that is current being created or running.

      def stop_evaluation_job(
        job_identifier : String
      ) : Protocol::Request
        input = Types::StopEvaluationJobRequest.new(job_identifier: job_identifier)
        stop_evaluation_job(input)
      end

      def stop_evaluation_job(input : Types::StopEvaluationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_EVALUATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops an active model customization job. For more information, see Custom models in the Amazon
      # Bedrock User Guide .

      def stop_model_customization_job(
        job_identifier : String
      ) : Protocol::Request
        input = Types::StopModelCustomizationJobRequest.new(job_identifier: job_identifier)
        stop_model_customization_job(input)
      end

      def stop_model_customization_job(input : Types::StopModelCustomizationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_MODEL_CUSTOMIZATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a batch inference job. You're only charged for tokens that were already processed. For more
      # information, see Stop a batch inference job .

      def stop_model_invocation_job(
        job_identifier : String
      ) : Protocol::Request
        input = Types::StopModelInvocationJobRequest.new(job_identifier: job_identifier)
        stop_model_invocation_job(input)
      end

      def stop_model_invocation_job(input : Types::StopModelInvocationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_MODEL_INVOCATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate tags with a resource. For more information, see Tagging resources in the Amazon Bedrock
      # User Guide .

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove one or more tags from a resource. For more information, see Tagging resources in the Amazon
      # Bedrock User Guide .

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

      # Updates an existing Automated Reasoning policy with new rules, variables, or configuration. This
      # creates a new version of the policy while preserving the previous version.

      def update_automated_reasoning_policy(
        policy_arn : String,
        policy_definition : Types::AutomatedReasoningPolicyDefinition,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAutomatedReasoningPolicyRequest.new(policy_arn: policy_arn, policy_definition: policy_definition, description: description, name: name)
        update_automated_reasoning_policy(input)
      end

      def update_automated_reasoning_policy(input : Types::UpdateAutomatedReasoningPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTOMATED_REASONING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the annotations for an Automated Reasoning policy build workflow. This allows you to modify
      # extracted rules, variables, and types before finalizing the policy.

      def update_automated_reasoning_policy_annotations(
        annotations : Array(Types::AutomatedReasoningPolicyAnnotation),
        build_workflow_id : String,
        last_updated_annotation_set_hash : String,
        policy_arn : String
      ) : Protocol::Request
        input = Types::UpdateAutomatedReasoningPolicyAnnotationsRequest.new(annotations: annotations, build_workflow_id: build_workflow_id, last_updated_annotation_set_hash: last_updated_annotation_set_hash, policy_arn: policy_arn)
        update_automated_reasoning_policy_annotations(input)
      end

      def update_automated_reasoning_policy_annotations(input : Types::UpdateAutomatedReasoningPolicyAnnotationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTOMATED_REASONING_POLICY_ANNOTATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Automated Reasoning policy test. You can modify the content, query, expected
      # result, and confidence threshold.

      def update_automated_reasoning_policy_test_case(
        expected_aggregated_findings_result : String,
        guard_content : String,
        last_updated_at : Time,
        policy_arn : String,
        test_case_id : String,
        client_request_token : String? = nil,
        confidence_threshold : Float64? = nil,
        query_content : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAutomatedReasoningPolicyTestCaseRequest.new(expected_aggregated_findings_result: expected_aggregated_findings_result, guard_content: guard_content, last_updated_at: last_updated_at, policy_arn: policy_arn, test_case_id: test_case_id, client_request_token: client_request_token, confidence_threshold: confidence_threshold, query_content: query_content)
        update_automated_reasoning_policy_test_case(input)
      end

      def update_automated_reasoning_policy_test_case(input : Types::UpdateAutomatedReasoningPolicyTestCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTOMATED_REASONING_POLICY_TEST_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom model deployment with a new custom model. This allows you to deploy updated models
      # without creating new deployment endpoints.

      def update_custom_model_deployment(
        custom_model_deployment_identifier : String,
        model_arn : String
      ) : Protocol::Request
        input = Types::UpdateCustomModelDeploymentRequest.new(custom_model_deployment_identifier: custom_model_deployment_identifier, model_arn: model_arn)
        update_custom_model_deployment(input)
      end

      def update_custom_model_deployment(input : Types::UpdateCustomModelDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CUSTOM_MODEL_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a guardrail with the values you specify. Specify a name and optional description . Specify
      # messages for when the guardrail successfully blocks a prompt or a model response in the
      # blockedInputMessaging and blockedOutputsMessaging fields. Specify topics for the guardrail to deny
      # in the topicPolicyConfig object. Each GuardrailTopicConfig object in the topicsConfig list pertains
      # to one topic. Give a name and description so that the guardrail can properly identify the topic.
      # Specify DENY in the type field. (Optional) Provide up to five prompts that you would categorize as
      # belonging to the topic in the examples list. Specify filter strengths for the harmful categories
      # defined in Amazon Bedrock in the contentPolicyConfig object. Each GuardrailContentFilterConfig
      # object in the filtersConfig list pertains to a harmful category. For more information, see Content
      # filters . For more information about the fields in a content filter, see
      # GuardrailContentFilterConfig . Specify the category in the type field. Specify the strength of the
      # filter for prompts in the inputStrength field and for model responses in the strength field of the
      # GuardrailContentFilterConfig . (Optional) For security, include the ARN of a KMS key in the kmsKeyId
      # field.

      def update_guardrail(
        blocked_input_messaging : String,
        blocked_outputs_messaging : String,
        guardrail_identifier : String,
        name : String,
        automated_reasoning_policy_config : Types::GuardrailAutomatedReasoningPolicyConfig? = nil,
        content_policy_config : Types::GuardrailContentPolicyConfig? = nil,
        contextual_grounding_policy_config : Types::GuardrailContextualGroundingPolicyConfig? = nil,
        cross_region_config : Types::GuardrailCrossRegionConfig? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        sensitive_information_policy_config : Types::GuardrailSensitiveInformationPolicyConfig? = nil,
        topic_policy_config : Types::GuardrailTopicPolicyConfig? = nil,
        word_policy_config : Types::GuardrailWordPolicyConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateGuardrailRequest.new(blocked_input_messaging: blocked_input_messaging, blocked_outputs_messaging: blocked_outputs_messaging, guardrail_identifier: guardrail_identifier, name: name, automated_reasoning_policy_config: automated_reasoning_policy_config, content_policy_config: content_policy_config, contextual_grounding_policy_config: contextual_grounding_policy_config, cross_region_config: cross_region_config, description: description, kms_key_id: kms_key_id, sensitive_information_policy_config: sensitive_information_policy_config, topic_policy_config: topic_policy_config, word_policy_config: word_policy_config)
        update_guardrail(input)
      end

      def update_guardrail(input : Types::UpdateGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing endpoint for a model from Amazon Bedrock Marketplace.

      def update_marketplace_model_endpoint(
        endpoint_arn : String,
        endpoint_config : Types::EndpointConfig,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMarketplaceModelEndpointRequest.new(endpoint_arn: endpoint_arn, endpoint_config: endpoint_config, client_request_token: client_request_token)
        update_marketplace_model_endpoint(input)
      end

      def update_marketplace_model_endpoint(input : Types::UpdateMarketplaceModelEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MARKETPLACE_MODEL_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name or associated model for a Provisioned Throughput. For more information, see
      # Provisioned Throughput in the Amazon Bedrock User Guide .

      def update_provisioned_model_throughput(
        provisioned_model_id : String,
        desired_model_id : String? = nil,
        desired_provisioned_model_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProvisionedModelThroughputRequest.new(provisioned_model_id: provisioned_model_id, desired_model_id: desired_model_id, desired_provisioned_model_name: desired_provisioned_model_name)
        update_provisioned_model_throughput(input)
      end

      def update_provisioned_model_throughput(input : Types::UpdateProvisionedModelThroughputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROVISIONED_MODEL_THROUGHPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
