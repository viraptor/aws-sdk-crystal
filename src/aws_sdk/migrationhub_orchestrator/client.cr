module AwsSdk
  module MigrationHubOrchestrator
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

      # Creates a migration workflow template.
      def create_template(
        template_name : String,
        template_source : Types::TemplateSource,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil,
        template_description : String? = nil
      ) : Protocol::Request
        input = Types::CreateTemplateRequest.new(template_name: template_name, template_source: template_source, client_token: client_token, tags: tags, template_description: template_description)
        create_template(input)
      end
      def create_template(input : Types::CreateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a workflow to orchestrate your migrations.
      def create_workflow(
        input_parameters : Hash(String, Types::StepInput),
        name : String,
        template_id : String,
        application_configuration_id : String? = nil,
        description : String? = nil,
        step_targets : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMigrationWorkflowRequest.new(input_parameters: input_parameters, name: name, template_id: template_id, application_configuration_id: application_configuration_id, description: description, step_targets: step_targets, tags: tags)
        create_workflow(input)
      end
      def create_workflow(input : Types::CreateMigrationWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a step in the migration workflow.
      def create_workflow_step(
        name : String,
        step_action_type : String,
        step_group_id : String,
        workflow_id : String,
        description : String? = nil,
        next : Array(String)? = nil,
        outputs : Array(Types::WorkflowStepOutput)? = nil,
        previous : Array(String)? = nil,
        step_target : Array(String)? = nil,
        workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateWorkflowStepRequest.new(name: name, step_action_type: step_action_type, step_group_id: step_group_id, workflow_id: workflow_id, description: description, next: next, outputs: outputs, previous: previous, step_target: step_target, workflow_step_automation_configuration: workflow_step_automation_configuration)
        create_workflow_step(input)
      end
      def create_workflow_step(input : Types::CreateWorkflowStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a step group in a migration workflow.
      def create_workflow_step_group(
        name : String,
        workflow_id : String,
        description : String? = nil,
        next : Array(String)? = nil,
        previous : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateWorkflowStepGroupRequest.new(name: name, workflow_id: workflow_id, description: description, next: next, previous: previous)
        create_workflow_step_group(input)
      end
      def create_workflow_step_group(input : Types::CreateWorkflowStepGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW_STEP_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a migration workflow template.
      def delete_template(
        id : String
      ) : Protocol::Request
        input = Types::DeleteTemplateRequest.new(id: id)
        delete_template(input)
      end
      def delete_template(input : Types::DeleteTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a migration workflow. You must pause a running workflow in Migration Hub Orchestrator console
      # to delete it.
      def delete_workflow(
        id : String
      ) : Protocol::Request
        input = Types::DeleteMigrationWorkflowRequest.new(id: id)
        delete_workflow(input)
      end
      def delete_workflow(input : Types::DeleteMigrationWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a step in a migration workflow. Pause the workflow to delete a running step.
      def delete_workflow_step(
        id : String,
        step_group_id : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowStepRequest.new(id: id, step_group_id: step_group_id, workflow_id: workflow_id)
        delete_workflow_step(input)
      end
      def delete_workflow_step(input : Types::DeleteWorkflowStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a step group in a migration workflow.
      def delete_workflow_step_group(
        id : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowStepGroupRequest.new(id: id, workflow_id: workflow_id)
        delete_workflow_step_group(input)
      end
      def delete_workflow_step_group(input : Types::DeleteWorkflowStepGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW_STEP_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the template you want to use for creating a migration workflow.
      def get_template(
        id : String
      ) : Protocol::Request
        input = Types::GetMigrationWorkflowTemplateRequest.new(id: id)
        get_template(input)
      end
      def get_template(input : Types::GetMigrationWorkflowTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a specific step in a template.
      def get_template_step(
        id : String,
        step_group_id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::GetTemplateStepRequest.new(id: id, step_group_id: step_group_id, template_id: template_id)
        get_template_step(input)
      end
      def get_template_step(input : Types::GetTemplateStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPLATE_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a step group in a template.
      def get_template_step_group(
        id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::GetTemplateStepGroupRequest.new(id: id, template_id: template_id)
        get_template_step_group(input)
      end
      def get_template_step_group(input : Types::GetTemplateStepGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPLATE_STEP_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get migration workflow.
      def get_workflow(
        id : String
      ) : Protocol::Request
        input = Types::GetMigrationWorkflowRequest.new(id: id)
        get_workflow(input)
      end
      def get_workflow(input : Types::GetMigrationWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a step in the migration workflow.
      def get_workflow_step(
        id : String,
        step_group_id : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::GetWorkflowStepRequest.new(id: id, step_group_id: step_group_id, workflow_id: workflow_id)
        get_workflow_step(input)
      end
      def get_workflow_step(input : Types::GetWorkflowStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the step group of a migration workflow.
      def get_workflow_step_group(
        id : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::GetWorkflowStepGroupRequest.new(id: id, workflow_id: workflow_id)
        get_workflow_step_group(input)
      end
      def get_workflow_step_group(input : Types::GetWorkflowStepGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_STEP_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List AWS Migration Hub Orchestrator plugins.
      def list_plugins(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPluginsRequest.new(max_results: max_results, next_token: next_token)
        list_plugins(input)
      end
      def list_plugins(input : Types::ListPluginsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLUGINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the tags added to a resource.
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

      # List the step groups in a template.
      def list_template_step_groups(
        template_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateStepGroupsRequest.new(template_id: template_id, max_results: max_results, next_token: next_token)
        list_template_step_groups(input)
      end
      def list_template_step_groups(input : Types::ListTemplateStepGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_STEP_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the steps in a template.
      def list_template_steps(
        step_group_id : String,
        template_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateStepsRequest.new(step_group_id: step_group_id, template_id: template_id, max_results: max_results, next_token: next_token)
        list_template_steps(input)
      end
      def list_template_steps(input : Types::ListTemplateStepsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_STEPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the templates available in Migration Hub Orchestrator to create a migration workflow.
      def list_templates(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMigrationWorkflowTemplatesRequest.new(max_results: max_results, name: name, next_token: next_token)
        list_templates(input)
      end
      def list_templates(input : Types::ListMigrationWorkflowTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the step groups in a migration workflow.
      def list_workflow_step_groups(
        workflow_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowStepGroupsRequest.new(workflow_id: workflow_id, max_results: max_results, next_token: next_token)
        list_workflow_step_groups(input)
      end
      def list_workflow_step_groups(input : Types::ListWorkflowStepGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_STEP_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the steps in a workflow.
      def list_workflow_steps(
        step_group_id : String,
        workflow_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowStepsRequest.new(step_group_id: step_group_id, workflow_id: workflow_id, max_results: max_results, next_token: next_token)
        list_workflow_steps(input)
      end
      def list_workflow_steps(input : Types::ListWorkflowStepsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_STEPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the migration workflows.
      def list_workflows(
        ads_application_configuration_name : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        status : String? = nil,
        template_id : String? = nil
      ) : Protocol::Request
        input = Types::ListMigrationWorkflowsRequest.new(ads_application_configuration_name: ads_application_configuration_name, max_results: max_results, name: name, next_token: next_token, status: status, template_id: template_id)
        list_workflows(input)
      end
      def list_workflows(input : Types::ListMigrationWorkflowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retry a failed step in a migration workflow.
      def retry_workflow_step(
        id : String,
        step_group_id : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::RetryWorkflowStepRequest.new(id: id, step_group_id: step_group_id, workflow_id: workflow_id)
        retry_workflow_step(input)
      end
      def retry_workflow_step(input : Types::RetryWorkflowStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRY_WORKFLOW_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start a migration workflow.
      def start_workflow(
        id : String
      ) : Protocol::Request
        input = Types::StartMigrationWorkflowRequest.new(id: id)
        start_workflow(input)
      end
      def start_workflow(input : Types::StartMigrationWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop an ongoing migration workflow.
      def stop_workflow(
        id : String
      ) : Protocol::Request
        input = Types::StopMigrationWorkflowRequest.new(id: id)
        stop_workflow(input)
      end
      def stop_workflow(input : Types::StopMigrationWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tag a resource by specifying its Amazon Resource Name (ARN).
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

      # Deletes the tags for a resource.
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

      # Updates a migration workflow template.
      def update_template(
        id : String,
        client_token : String? = nil,
        template_description : String? = nil,
        template_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTemplateRequest.new(id: id, client_token: client_token, template_description: template_description, template_name: template_name)
        update_template(input)
      end
      def update_template(input : Types::UpdateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a migration workflow.
      def update_workflow(
        id : String,
        description : String? = nil,
        input_parameters : Hash(String, Types::StepInput)? = nil,
        name : String? = nil,
        step_targets : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateMigrationWorkflowRequest.new(id: id, description: description, input_parameters: input_parameters, name: name, step_targets: step_targets)
        update_workflow(input)
      end
      def update_workflow(input : Types::UpdateMigrationWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a step in a migration workflow.
      def update_workflow_step(
        id : String,
        step_group_id : String,
        workflow_id : String,
        description : String? = nil,
        name : String? = nil,
        next : Array(String)? = nil,
        outputs : Array(Types::WorkflowStepOutput)? = nil,
        previous : Array(String)? = nil,
        status : String? = nil,
        step_action_type : String? = nil,
        step_target : Array(String)? = nil,
        workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkflowStepRequest.new(id: id, step_group_id: step_group_id, workflow_id: workflow_id, description: description, name: name, next: next, outputs: outputs, previous: previous, status: status, step_action_type: step_action_type, step_target: step_target, workflow_step_automation_configuration: workflow_step_automation_configuration)
        update_workflow_step(input)
      end
      def update_workflow_step(input : Types::UpdateWorkflowStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKFLOW_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the step group in a migration workflow.
      def update_workflow_step_group(
        id : String,
        workflow_id : String,
        description : String? = nil,
        name : String? = nil,
        next : Array(String)? = nil,
        previous : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkflowStepGroupRequest.new(id: id, workflow_id: workflow_id, description: description, name: name, next: next, previous: previous)
        update_workflow_step_group(input)
      end
      def update_workflow_step_group(input : Types::UpdateWorkflowStepGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKFLOW_STEP_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
