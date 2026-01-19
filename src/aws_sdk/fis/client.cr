module AwsSdk
  module Fis
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

      # Creates an experiment template. An experiment template includes the following components: Targets :
      # A target can be a specific resource in your Amazon Web Services environment, or one or more
      # resources that match criteria that you specify, for example, resources that have specific tags.
      # Actions : The actions to carry out on the target. You can specify multiple actions, the duration of
      # each action, and when to start each action during an experiment. Stop conditions : If a stop
      # condition is triggered while an experiment is running, the experiment is automatically stopped. You
      # can define a stop condition as a CloudWatch alarm. For more information, see experiment templates in
      # the Fault Injection Service User Guide .
      def create_experiment_template(
        actions : Hash(String, Types::CreateExperimentTemplateActionInput),
        client_token : String,
        description : String,
        role_arn : String,
        stop_conditions : Array(Types::CreateExperimentTemplateStopConditionInput),
        experiment_options : Types::CreateExperimentTemplateExperimentOptionsInput? = nil,
        experiment_report_configuration : Types::CreateExperimentTemplateReportConfigurationInput? = nil,
        log_configuration : Types::CreateExperimentTemplateLogConfigurationInput? = nil,
        tags : Hash(String, String)? = nil,
        targets : Hash(String, Types::CreateExperimentTemplateTargetInput)? = nil
      ) : Protocol::Request
        input = Types::CreateExperimentTemplateRequest.new(actions: actions, client_token: client_token, description: description, role_arn: role_arn, stop_conditions: stop_conditions, experiment_options: experiment_options, experiment_report_configuration: experiment_report_configuration, log_configuration: log_configuration, tags: tags, targets: targets)
        create_experiment_template(input)
      end
      def create_experiment_template(input : Types::CreateExperimentTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXPERIMENT_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a target account configuration for the experiment template. A target account configuration
      # is required when accountTargeting of experimentOptions is set to multi-account . For more
      # information, see experiment options in the Fault Injection Service User Guide .
      def create_target_account_configuration(
        account_id : String,
        experiment_template_id : String,
        role_arn : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateTargetAccountConfigurationRequest.new(account_id: account_id, experiment_template_id: experiment_template_id, role_arn: role_arn, client_token: client_token, description: description)
        create_target_account_configuration(input)
      end
      def create_target_account_configuration(input : Types::CreateTargetAccountConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TARGET_ACCOUNT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified experiment template.
      def delete_experiment_template(
        id : String
      ) : Protocol::Request
        input = Types::DeleteExperimentTemplateRequest.new(id: id)
        delete_experiment_template(input)
      end
      def delete_experiment_template(input : Types::DeleteExperimentTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EXPERIMENT_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified target account configuration of the experiment template.
      def delete_target_account_configuration(
        account_id : String,
        experiment_template_id : String
      ) : Protocol::Request
        input = Types::DeleteTargetAccountConfigurationRequest.new(account_id: account_id, experiment_template_id: experiment_template_id)
        delete_target_account_configuration(input)
      end
      def delete_target_account_configuration(input : Types::DeleteTargetAccountConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TARGET_ACCOUNT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified FIS action.
      def get_action(
        id : String
      ) : Protocol::Request
        input = Types::GetActionRequest.new(id: id)
        get_action(input)
      end
      def get_action(input : Types::GetActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified experiment.
      def get_experiment(
        id : String
      ) : Protocol::Request
        input = Types::GetExperimentRequest.new(id: id)
        get_experiment(input)
      end
      def get_experiment(input : Types::GetExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified target account configuration of the experiment.
      def get_experiment_target_account_configuration(
        account_id : String,
        experiment_id : String
      ) : Protocol::Request
        input = Types::GetExperimentTargetAccountConfigurationRequest.new(account_id: account_id, experiment_id: experiment_id)
        get_experiment_target_account_configuration(input)
      end
      def get_experiment_target_account_configuration(input : Types::GetExperimentTargetAccountConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPERIMENT_TARGET_ACCOUNT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified experiment template.
      def get_experiment_template(
        id : String
      ) : Protocol::Request
        input = Types::GetExperimentTemplateRequest.new(id: id)
        get_experiment_template(input)
      end
      def get_experiment_template(input : Types::GetExperimentTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPERIMENT_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified safety lever.
      def get_safety_lever(
        id : String
      ) : Protocol::Request
        input = Types::GetSafetyLeverRequest.new(id: id)
        get_safety_lever(input)
      end
      def get_safety_lever(input : Types::GetSafetyLeverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SAFETY_LEVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified target account configuration of the experiment template.
      def get_target_account_configuration(
        account_id : String,
        experiment_template_id : String
      ) : Protocol::Request
        input = Types::GetTargetAccountConfigurationRequest.new(account_id: account_id, experiment_template_id: experiment_template_id)
        get_target_account_configuration(input)
      end
      def get_target_account_configuration(input : Types::GetTargetAccountConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TARGET_ACCOUNT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified resource type.
      def get_target_resource_type(
        resource_type : String
      ) : Protocol::Request
        input = Types::GetTargetResourceTypeRequest.new(resource_type: resource_type)
        get_target_resource_type(input)
      end
      def get_target_resource_type(input : Types::GetTargetResourceTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TARGET_RESOURCE_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available FIS actions.
      def list_actions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListActionsRequest.new(max_results: max_results, next_token: next_token)
        list_actions(input)
      end
      def list_actions(input : Types::ListActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resolved targets information of the specified experiment.
      def list_experiment_resolved_targets(
        experiment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        target_name : String? = nil
      ) : Protocol::Request
        input = Types::ListExperimentResolvedTargetsRequest.new(experiment_id: experiment_id, max_results: max_results, next_token: next_token, target_name: target_name)
        list_experiment_resolved_targets(input)
      end
      def list_experiment_resolved_targets(input : Types::ListExperimentResolvedTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPERIMENT_RESOLVED_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the target account configurations of the specified experiment.
      def list_experiment_target_account_configurations(
        experiment_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExperimentTargetAccountConfigurationsRequest.new(experiment_id: experiment_id, next_token: next_token)
        list_experiment_target_account_configurations(input)
      end
      def list_experiment_target_account_configurations(input : Types::ListExperimentTargetAccountConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPERIMENT_TARGET_ACCOUNT_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your experiment templates.
      def list_experiment_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExperimentTemplatesRequest.new(max_results: max_results, next_token: next_token)
        list_experiment_templates(input)
      end
      def list_experiment_templates(input : Types::ListExperimentTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPERIMENT_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your experiments.
      def list_experiments(
        experiment_template_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExperimentsRequest.new(experiment_template_id: experiment_template_id, max_results: max_results, next_token: next_token)
        list_experiments(input)
      end
      def list_experiments(input : Types::ListExperimentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPERIMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.
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

      # Lists the target account configurations of the specified experiment template.
      def list_target_account_configurations(
        experiment_template_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTargetAccountConfigurationsRequest.new(experiment_template_id: experiment_template_id, max_results: max_results, next_token: next_token)
        list_target_account_configurations(input)
      end
      def list_target_account_configurations(input : Types::ListTargetAccountConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TARGET_ACCOUNT_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the target resource types.
      def list_target_resource_types(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTargetResourceTypesRequest.new(max_results: max_results, next_token: next_token)
        list_target_resource_types(input)
      end
      def list_target_resource_types(input : Types::ListTargetResourceTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TARGET_RESOURCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts running an experiment from the specified experiment template.
      def start_experiment(
        client_token : String,
        experiment_template_id : String,
        experiment_options : Types::StartExperimentExperimentOptionsInput? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartExperimentRequest.new(client_token: client_token, experiment_template_id: experiment_template_id, experiment_options: experiment_options, tags: tags)
        start_experiment(input)
      end
      def start_experiment(input : Types::StartExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the specified experiment.
      def stop_experiment(
        id : String
      ) : Protocol::Request
        input = Types::StopExperimentRequest.new(id: id)
        stop_experiment(input)
      end
      def stop_experiment(input : Types::StopExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies the specified tags to the specified resource.
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

      # Removes the specified tags from the specified resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified experiment template.
      def update_experiment_template(
        id : String,
        actions : Hash(String, Types::UpdateExperimentTemplateActionInputItem)? = nil,
        description : String? = nil,
        experiment_options : Types::UpdateExperimentTemplateExperimentOptionsInput? = nil,
        experiment_report_configuration : Types::UpdateExperimentTemplateReportConfigurationInput? = nil,
        log_configuration : Types::UpdateExperimentTemplateLogConfigurationInput? = nil,
        role_arn : String? = nil,
        stop_conditions : Array(Types::UpdateExperimentTemplateStopConditionInput)? = nil,
        targets : Hash(String, Types::UpdateExperimentTemplateTargetInput)? = nil
      ) : Protocol::Request
        input = Types::UpdateExperimentTemplateRequest.new(id: id, actions: actions, description: description, experiment_options: experiment_options, experiment_report_configuration: experiment_report_configuration, log_configuration: log_configuration, role_arn: role_arn, stop_conditions: stop_conditions, targets: targets)
        update_experiment_template(input)
      end
      def update_experiment_template(input : Types::UpdateExperimentTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EXPERIMENT_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified safety lever state.
      def update_safety_lever_state(
        id : String,
        state : Types::UpdateSafetyLeverStateInput
      ) : Protocol::Request
        input = Types::UpdateSafetyLeverStateRequest.new(id: id, state: state)
        update_safety_lever_state(input)
      end
      def update_safety_lever_state(input : Types::UpdateSafetyLeverStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SAFETY_LEVER_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the target account configuration for the specified experiment template.
      def update_target_account_configuration(
        account_id : String,
        experiment_template_id : String,
        description : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTargetAccountConfigurationRequest.new(account_id: account_id, experiment_template_id: experiment_template_id, description: description, role_arn: role_arn)
        update_target_account_configuration(input)
      end
      def update_target_account_configuration(input : Types::UpdateTargetAccountConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TARGET_ACCOUNT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
