module Aws
  module CloudFormation
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

      # Activate trusted access with Organizations. With trusted access between StackSets and Organizations
      # activated, the management account has permissions to create and manage StackSets for your
      # organization.

      def activate_organizations_access : Types::ActivateOrganizationsAccessOutput
        input = Types::ActivateOrganizationsAccessInput.new
        activate_organizations_access(input)
      end

      def activate_organizations_access(input : Types::ActivateOrganizationsAccessInput) : Types::ActivateOrganizationsAccessOutput
        request = Protocol::Query.build_request(Model::ACTIVATE_ORGANIZATIONS_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ActivateOrganizationsAccessOutput, "ActivateOrganizationsAccess")
      end

      # Activates a public third-party extension, such as a resource or module, to make it available for use
      # in stack templates in your current account and Region. It can also create CloudFormation Hooks,
      # which allow you to evaluate resource configurations before CloudFormation provisions them. Hooks
      # integrate with both CloudFormation and Cloud Control API operations. After you activate an
      # extension, you can use SetTypeConfiguration to set specific properties for the extension. To see
      # which extensions have been activated, use ListTypes . To see configuration details for an extension,
      # use DescribeType . For more information, see Activate a third-party public extension in your account
      # in the CloudFormation User Guide . For information about creating Hooks, see the CloudFormation
      # Hooks User Guide .

      def activate_type(
        auto_update : Bool? = nil,
        execution_role_arn : String? = nil,
        logging_config : Types::LoggingConfig? = nil,
        major_version : Int64? = nil,
        public_type_arn : String? = nil,
        publisher_id : String? = nil,
        type : String? = nil,
        type_name : String? = nil,
        type_name_alias : String? = nil,
        version_bump : String? = nil
      ) : Types::ActivateTypeOutput

        input = Types::ActivateTypeInput.new(auto_update: auto_update, execution_role_arn: execution_role_arn, logging_config: logging_config, major_version: major_version, public_type_arn: public_type_arn, publisher_id: publisher_id, type: type, type_name: type_name, type_name_alias: type_name_alias, version_bump: version_bump)
        activate_type(input)
      end

      def activate_type(input : Types::ActivateTypeInput) : Types::ActivateTypeOutput
        request = Protocol::Query.build_request(Model::ACTIVATE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ActivateTypeOutput, "ActivateType")
      end

      # Returns configuration data for the specified CloudFormation extensions, from the CloudFormation
      # registry in your current account and Region. For more information, see Edit configuration data for
      # extensions in your account in the CloudFormation User Guide .

      def batch_describe_type_configurations(
        type_configuration_identifiers : Array(Types::TypeConfigurationIdentifier)
      ) : Types::BatchDescribeTypeConfigurationsOutput

        input = Types::BatchDescribeTypeConfigurationsInput.new(type_configuration_identifiers: type_configuration_identifiers)
        batch_describe_type_configurations(input)
      end

      def batch_describe_type_configurations(input : Types::BatchDescribeTypeConfigurationsInput) : Types::BatchDescribeTypeConfigurationsOutput
        request = Protocol::Query.build_request(Model::BATCH_DESCRIBE_TYPE_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::BatchDescribeTypeConfigurationsOutput, "BatchDescribeTypeConfigurations")
      end

      # Cancels an update on the specified stack. If the call completes successfully, the stack rolls back
      # the update and reverts to the previous stack configuration. You can cancel only stacks that are in
      # the UPDATE_IN_PROGRESS state.

      def cancel_update_stack(
        stack_name : String,
        client_request_token : String? = nil
      ) : Nil

        input = Types::CancelUpdateStackInput.new(stack_name: stack_name, client_request_token: client_request_token)
        cancel_update_stack(input)
      end

      def cancel_update_stack(input : Types::CancelUpdateStackInput) : Nil
        request = Protocol::Query.build_request(Model::CANCEL_UPDATE_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Continues rolling back a stack from UPDATE_ROLLBACK_FAILED to UPDATE_ROLLBACK_COMPLETE state.
      # Depending on the cause of the failure, you can manually fix the error and continue the rollback. By
      # continuing the rollback, you can return your stack to a working state (the UPDATE_ROLLBACK_COMPLETE
      # state) and then try to update the stack again. A stack enters the UPDATE_ROLLBACK_FAILED state when
      # CloudFormation can't roll back all changes after a failed stack update. For example, this might
      # occur when a stack attempts to roll back to an old database that was deleted outside of
      # CloudFormation. Because CloudFormation doesn't know the instance was deleted, it assumes the
      # instance still exists and attempts to roll back to it, causing the update rollback to fail. For more
      # information, see Continue rolling back an update in the CloudFormation User Guide . For information
      # for troubleshooting a failed update rollback, see Update rollback failed .

      def continue_update_rollback(
        stack_name : String,
        client_request_token : String? = nil,
        resources_to_skip : Array(String)? = nil,
        role_arn : String? = nil
      ) : Types::ContinueUpdateRollbackOutput

        input = Types::ContinueUpdateRollbackInput.new(stack_name: stack_name, client_request_token: client_request_token, resources_to_skip: resources_to_skip, role_arn: role_arn)
        continue_update_rollback(input)
      end

      def continue_update_rollback(input : Types::ContinueUpdateRollbackInput) : Types::ContinueUpdateRollbackOutput
        request = Protocol::Query.build_request(Model::CONTINUE_UPDATE_ROLLBACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ContinueUpdateRollbackOutput, "ContinueUpdateRollback")
      end

      # Creates a list of changes that will be applied to a stack so that you can review the changes before
      # executing them. You can create a change set for a stack that doesn't exist or an existing stack. If
      # you create a change set for a stack that doesn't exist, the change set shows all of the resources
      # that CloudFormation will create. If you create a change set for an existing stack, CloudFormation
      # compares the stack's information with the information that you submit in the change set and lists
      # the differences. Use change sets to understand which resources CloudFormation will create or change,
      # and how it will change resources in an existing stack, before you create or update a stack. To
      # create a change set for a stack that doesn't exist, for the ChangeSetType parameter, specify CREATE
      # . To create a change set for an existing stack, specify UPDATE for the ChangeSetType parameter. To
      # create a change set for an import operation, specify IMPORT for the ChangeSetType parameter. After
      # the CreateChangeSet call successfully completes, CloudFormation starts creating the change set. To
      # check the status of the change set or to review it, use the DescribeChangeSet action. When you are
      # satisfied with the changes the change set will make, execute the change set by using the
      # ExecuteChangeSet action. CloudFormation doesn't make changes until you execute the change set. To
      # create a change set for the entire stack hierarchy, set IncludeNestedStacks to True .

      def create_change_set(
        change_set_name : String,
        stack_name : String,
        capabilities : Array(String)? = nil,
        change_set_type : String? = nil,
        client_token : String? = nil,
        deployment_mode : String? = nil,
        description : String? = nil,
        import_existing_resources : Bool? = nil,
        include_nested_stacks : Bool? = nil,
        notification_ar_ns : Array(String)? = nil,
        on_stack_failure : String? = nil,
        parameters : Array(Types::Parameter)? = nil,
        resource_types : Array(String)? = nil,
        resources_to_import : Array(Types::ResourceToImport)? = nil,
        role_arn : String? = nil,
        rollback_configuration : Types::RollbackConfiguration? = nil,
        tags : Array(Types::Tag)? = nil,
        template_body : String? = nil,
        template_url : String? = nil,
        use_previous_template : Bool? = nil
      ) : Types::CreateChangeSetOutput

        input = Types::CreateChangeSetInput.new(change_set_name: change_set_name, stack_name: stack_name, capabilities: capabilities, change_set_type: change_set_type, client_token: client_token, deployment_mode: deployment_mode, description: description, import_existing_resources: import_existing_resources, include_nested_stacks: include_nested_stacks, notification_ar_ns: notification_ar_ns, on_stack_failure: on_stack_failure, parameters: parameters, resource_types: resource_types, resources_to_import: resources_to_import, role_arn: role_arn, rollback_configuration: rollback_configuration, tags: tags, template_body: template_body, template_url: template_url, use_previous_template: use_previous_template)
        create_change_set(input)
      end

      def create_change_set(input : Types::CreateChangeSetInput) : Types::CreateChangeSetOutput
        request = Protocol::Query.build_request(Model::CREATE_CHANGE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateChangeSetOutput, "CreateChangeSet")
      end

      # Creates a template from existing resources that are not already managed with CloudFormation. You can
      # check the status of the template generation using the DescribeGeneratedTemplate API action.

      def create_generated_template(
        generated_template_name : String,
        resources : Array(Types::ResourceDefinition)? = nil,
        stack_name : String? = nil,
        template_configuration : Types::TemplateConfiguration? = nil
      ) : Types::CreateGeneratedTemplateOutput

        input = Types::CreateGeneratedTemplateInput.new(generated_template_name: generated_template_name, resources: resources, stack_name: stack_name, template_configuration: template_configuration)
        create_generated_template(input)
      end

      def create_generated_template(input : Types::CreateGeneratedTemplateInput) : Types::CreateGeneratedTemplateOutput
        request = Protocol::Query.build_request(Model::CREATE_GENERATED_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateGeneratedTemplateOutput, "CreateGeneratedTemplate")
      end

      # Creates a stack as specified in the template. After the call completes successfully, the stack
      # creation starts. You can check the status of the stack through the DescribeStacks operation. For
      # more information about creating a stack and monitoring stack progress, see Managing Amazon Web
      # Services resources as a single unit with CloudFormation stacks in the CloudFormation User Guide .

      def create_stack(
        stack_name : String,
        capabilities : Array(String)? = nil,
        client_request_token : String? = nil,
        disable_rollback : Bool? = nil,
        enable_termination_protection : Bool? = nil,
        notification_ar_ns : Array(String)? = nil,
        on_failure : String? = nil,
        parameters : Array(Types::Parameter)? = nil,
        resource_types : Array(String)? = nil,
        retain_except_on_create : Bool? = nil,
        role_arn : String? = nil,
        rollback_configuration : Types::RollbackConfiguration? = nil,
        stack_policy_body : String? = nil,
        stack_policy_url : String? = nil,
        tags : Array(Types::Tag)? = nil,
        template_body : String? = nil,
        template_url : String? = nil,
        timeout_in_minutes : Int32? = nil
      ) : Types::CreateStackOutput

        input = Types::CreateStackInput.new(stack_name: stack_name, capabilities: capabilities, client_request_token: client_request_token, disable_rollback: disable_rollback, enable_termination_protection: enable_termination_protection, notification_ar_ns: notification_ar_ns, on_failure: on_failure, parameters: parameters, resource_types: resource_types, retain_except_on_create: retain_except_on_create, role_arn: role_arn, rollback_configuration: rollback_configuration, stack_policy_body: stack_policy_body, stack_policy_url: stack_policy_url, tags: tags, template_body: template_body, template_url: template_url, timeout_in_minutes: timeout_in_minutes)
        create_stack(input)
      end

      def create_stack(input : Types::CreateStackInput) : Types::CreateStackOutput
        request = Protocol::Query.build_request(Model::CREATE_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateStackOutput, "CreateStack")
      end

      # Creates stack instances for the specified accounts, within the specified Amazon Web Services
      # Regions. A stack instance refers to a stack in a specific account and Region. You must specify at
      # least one value for either Accounts or DeploymentTargets , and you must specify at least one value
      # for Regions . The maximum number of organizational unit (OUs) supported by a CreateStackInstances
      # operation is 50. If you need more than 50, consider the following options: Batch processing: If you
      # don't want to expose your OU hierarchy, split up the operations into multiple calls with less than
      # 50 OUs each. Parent OU strategy: If you don't mind exposing the OU hierarchy, target a parent OU
      # that contains all desired child OUs.

      def create_stack_instances(
        regions : Array(String),
        stack_set_name : String,
        accounts : Array(String)? = nil,
        call_as : String? = nil,
        deployment_targets : Types::DeploymentTargets? = nil,
        operation_id : String? = nil,
        operation_preferences : Types::StackSetOperationPreferences? = nil,
        parameter_overrides : Array(Types::Parameter)? = nil
      ) : Types::CreateStackInstancesOutput

        input = Types::CreateStackInstancesInput.new(regions: regions, stack_set_name: stack_set_name, accounts: accounts, call_as: call_as, deployment_targets: deployment_targets, operation_id: operation_id, operation_preferences: operation_preferences, parameter_overrides: parameter_overrides)
        create_stack_instances(input)
      end

      def create_stack_instances(input : Types::CreateStackInstancesInput) : Types::CreateStackInstancesOutput
        request = Protocol::Query.build_request(Model::CREATE_STACK_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateStackInstancesOutput, "CreateStackInstances")
      end

      # Creates a refactor across multiple stacks, with the list of stacks and resources that are affected.

      def create_stack_refactor(
        stack_definitions : Array(Types::StackDefinition),
        description : String? = nil,
        enable_stack_creation : Bool? = nil,
        resource_mappings : Array(Types::ResourceMapping)? = nil
      ) : Types::CreateStackRefactorOutput

        input = Types::CreateStackRefactorInput.new(stack_definitions: stack_definitions, description: description, enable_stack_creation: enable_stack_creation, resource_mappings: resource_mappings)
        create_stack_refactor(input)
      end

      def create_stack_refactor(input : Types::CreateStackRefactorInput) : Types::CreateStackRefactorOutput
        request = Protocol::Query.build_request(Model::CREATE_STACK_REFACTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateStackRefactorOutput, "CreateStackRefactor")
      end

      # Creates a StackSet.

      def create_stack_set(
        stack_set_name : String,
        administration_role_arn : String? = nil,
        auto_deployment : Types::AutoDeployment? = nil,
        call_as : String? = nil,
        capabilities : Array(String)? = nil,
        client_request_token : String? = nil,
        description : String? = nil,
        execution_role_name : String? = nil,
        managed_execution : Types::ManagedExecution? = nil,
        parameters : Array(Types::Parameter)? = nil,
        permission_model : String? = nil,
        stack_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        template_body : String? = nil,
        template_url : String? = nil
      ) : Types::CreateStackSetOutput

        input = Types::CreateStackSetInput.new(stack_set_name: stack_set_name, administration_role_arn: administration_role_arn, auto_deployment: auto_deployment, call_as: call_as, capabilities: capabilities, client_request_token: client_request_token, description: description, execution_role_name: execution_role_name, managed_execution: managed_execution, parameters: parameters, permission_model: permission_model, stack_id: stack_id, tags: tags, template_body: template_body, template_url: template_url)
        create_stack_set(input)
      end

      def create_stack_set(input : Types::CreateStackSetInput) : Types::CreateStackSetOutput
        request = Protocol::Query.build_request(Model::CREATE_STACK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateStackSetOutput, "CreateStackSet")
      end

      # Deactivates trusted access with Organizations. If trusted access is deactivated, the management
      # account does not have permissions to create and manage service-managed StackSets for your
      # organization.

      def deactivate_organizations_access : Types::DeactivateOrganizationsAccessOutput
        input = Types::DeactivateOrganizationsAccessInput.new
        deactivate_organizations_access(input)
      end

      def deactivate_organizations_access(input : Types::DeactivateOrganizationsAccessInput) : Types::DeactivateOrganizationsAccessOutput
        request = Protocol::Query.build_request(Model::DEACTIVATE_ORGANIZATIONS_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeactivateOrganizationsAccessOutput, "DeactivateOrganizationsAccess")
      end

      # Deactivates a public third-party extension, such as a resource or module, or a CloudFormation Hook
      # when you no longer use it. Deactivating an extension deletes the configuration details that are
      # associated with it. To temporarily disable a CloudFormation Hook instead, you can use
      # SetTypeConfiguration . Once deactivated, an extension can't be used in any CloudFormation operation.
      # This includes stack update operations where the stack template includes the extension, even if no
      # updates are being made to the extension. In addition, deactivated extensions aren't automatically
      # updated if a new version of the extension is released. To see which extensions are currently
      # activated, use ListTypes .

      def deactivate_type(
        arn : String? = nil,
        type : String? = nil,
        type_name : String? = nil
      ) : Types::DeactivateTypeOutput

        input = Types::DeactivateTypeInput.new(arn: arn, type: type, type_name: type_name)
        deactivate_type(input)
      end

      def deactivate_type(input : Types::DeactivateTypeInput) : Types::DeactivateTypeOutput
        request = Protocol::Query.build_request(Model::DEACTIVATE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeactivateTypeOutput, "DeactivateType")
      end

      # Deletes the specified change set. Deleting change sets ensures that no one executes the wrong change
      # set. If the call successfully completes, CloudFormation successfully deleted the change set. If
      # IncludeNestedStacks specifies True during the creation of the nested change set, then
      # DeleteChangeSet will delete all change sets that belong to the stacks hierarchy and will also delete
      # all change sets for nested stacks with the status of REVIEW_IN_PROGRESS .

      def delete_change_set(
        change_set_name : String,
        stack_name : String? = nil
      ) : Types::DeleteChangeSetOutput

        input = Types::DeleteChangeSetInput.new(change_set_name: change_set_name, stack_name: stack_name)
        delete_change_set(input)
      end

      def delete_change_set(input : Types::DeleteChangeSetInput) : Types::DeleteChangeSetOutput
        request = Protocol::Query.build_request(Model::DELETE_CHANGE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteChangeSetOutput, "DeleteChangeSet")
      end

      # Deleted a generated template.

      def delete_generated_template(
        generated_template_name : String
      ) : Nil

        input = Types::DeleteGeneratedTemplateInput.new(generated_template_name: generated_template_name)
        delete_generated_template(input)
      end

      def delete_generated_template(input : Types::DeleteGeneratedTemplateInput) : Nil
        request = Protocol::Query.build_request(Model::DELETE_GENERATED_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a specified stack. Once the call completes successfully, stack deletion starts. Deleted
      # stacks don't show up in the DescribeStacks operation if the deletion has been completed
      # successfully. For more information about deleting a stack, see Delete a stack from the
      # CloudFormation console in the CloudFormation User Guide .

      def delete_stack(
        stack_name : String,
        client_request_token : String? = nil,
        deletion_mode : String? = nil,
        retain_resources : Array(String)? = nil,
        role_arn : String? = nil
      ) : Nil

        input = Types::DeleteStackInput.new(stack_name: stack_name, client_request_token: client_request_token, deletion_mode: deletion_mode, retain_resources: retain_resources, role_arn: role_arn)
        delete_stack(input)
      end

      def delete_stack(input : Types::DeleteStackInput) : Nil
        request = Protocol::Query.build_request(Model::DELETE_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes stack instances for the specified accounts, in the specified Amazon Web Services Regions.
      # The maximum number of organizational unit (OUs) supported by a DeleteStackInstances operation is 50.
      # If you need more than 50, consider the following options: Batch processing: If you don't want to
      # expose your OU hierarchy, split up the operations into multiple calls with less than 50 OUs each.
      # Parent OU strategy: If you don't mind exposing the OU hierarchy, target a parent OU that contains
      # all desired child OUs.

      def delete_stack_instances(
        regions : Array(String),
        retain_stacks : Bool,
        stack_set_name : String,
        accounts : Array(String)? = nil,
        call_as : String? = nil,
        deployment_targets : Types::DeploymentTargets? = nil,
        operation_id : String? = nil,
        operation_preferences : Types::StackSetOperationPreferences? = nil
      ) : Types::DeleteStackInstancesOutput

        input = Types::DeleteStackInstancesInput.new(regions: regions, retain_stacks: retain_stacks, stack_set_name: stack_set_name, accounts: accounts, call_as: call_as, deployment_targets: deployment_targets, operation_id: operation_id, operation_preferences: operation_preferences)
        delete_stack_instances(input)
      end

      def delete_stack_instances(input : Types::DeleteStackInstancesInput) : Types::DeleteStackInstancesOutput
        request = Protocol::Query.build_request(Model::DELETE_STACK_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteStackInstancesOutput, "DeleteStackInstances")
      end

      # Deletes a StackSet. Before you can delete a StackSet, all its member stack instances must be
      # deleted. For more information about how to complete this, see DeleteStackInstances .

      def delete_stack_set(
        stack_set_name : String,
        call_as : String? = nil
      ) : Types::DeleteStackSetOutput

        input = Types::DeleteStackSetInput.new(stack_set_name: stack_set_name, call_as: call_as)
        delete_stack_set(input)
      end

      def delete_stack_set(input : Types::DeleteStackSetInput) : Types::DeleteStackSetOutput
        request = Protocol::Query.build_request(Model::DELETE_STACK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteStackSetOutput, "DeleteStackSet")
      end

      # Marks an extension or extension version as DEPRECATED in the CloudFormation registry, removing it
      # from active use. Deprecated extensions or extension versions cannot be used in CloudFormation
      # operations. To deregister an entire extension, you must individually deregister all active versions
      # of that extension. If an extension has only a single active version, deregistering that version
      # results in the extension itself being deregistered and marked as deprecated in the registry. You
      # can't deregister the default version of an extension if there are other active version of that
      # extension. If you do deregister the default version of an extension, the extension type itself is
      # deregistered as well and marked as deprecated. To view the deprecation status of an extension or
      # extension version, use DescribeType . For more information, see Remove third-party private
      # extensions from your account in the CloudFormation User Guide .

      def deregister_type(
        arn : String? = nil,
        type : String? = nil,
        type_name : String? = nil,
        version_id : String? = nil
      ) : Types::DeregisterTypeOutput

        input = Types::DeregisterTypeInput.new(arn: arn, type: type, type_name: type_name, version_id: version_id)
        deregister_type(input)
      end

      def deregister_type(input : Types::DeregisterTypeInput) : Types::DeregisterTypeOutput
        request = Protocol::Query.build_request(Model::DEREGISTER_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeregisterTypeOutput, "DeregisterType")
      end

      # Retrieves your account's CloudFormation limits, such as the maximum number of stacks that you can
      # create in your account. For more information about account limits, see Understand CloudFormation
      # quotas in the CloudFormation User Guide .

      def describe_account_limits(
        next_token : String? = nil
      ) : Types::DescribeAccountLimitsOutput

        input = Types::DescribeAccountLimitsInput.new(next_token: next_token)
        describe_account_limits(input)
      end

      def describe_account_limits(input : Types::DescribeAccountLimitsInput) : Types::DescribeAccountLimitsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_ACCOUNT_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAccountLimitsOutput, "DescribeAccountLimits")
      end

      # Returns the inputs for the change set and a list of changes that CloudFormation will make if you
      # execute the change set. For more information, see Update CloudFormation stacks using change sets in
      # the CloudFormation User Guide .

      def describe_change_set(
        change_set_name : String,
        include_property_values : Bool? = nil,
        next_token : String? = nil,
        stack_name : String? = nil
      ) : Types::DescribeChangeSetOutput

        input = Types::DescribeChangeSetInput.new(change_set_name: change_set_name, include_property_values: include_property_values, next_token: next_token, stack_name: stack_name)
        describe_change_set(input)
      end

      def describe_change_set(input : Types::DescribeChangeSetInput) : Types::DescribeChangeSetOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_CHANGE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeChangeSetOutput, "DescribeChangeSet")
      end

      # Returns Hook-related information for the change set and a list of changes that CloudFormation makes
      # when you run the change set.

      def describe_change_set_hooks(
        change_set_name : String,
        logical_resource_id : String? = nil,
        next_token : String? = nil,
        stack_name : String? = nil
      ) : Types::DescribeChangeSetHooksOutput

        input = Types::DescribeChangeSetHooksInput.new(change_set_name: change_set_name, logical_resource_id: logical_resource_id, next_token: next_token, stack_name: stack_name)
        describe_change_set_hooks(input)
      end

      def describe_change_set_hooks(input : Types::DescribeChangeSetHooksInput) : Types::DescribeChangeSetHooksOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_CHANGE_SET_HOOKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeChangeSetHooksOutput, "DescribeChangeSetHooks")
      end

      # Returns CloudFormation events based on flexible query criteria. Groups events by operation ID,
      # enabling you to focus on individual stack operations during deployment. An operation is any action
      # performed on a stack, including stack lifecycle actions (Create, Update, Delete, Rollback), change
      # set creation, nested stack creation, and automatic rollbacks triggered by failures. Each operation
      # has a unique identifier (Operation ID) and represents a discrete change attempt on the stack.
      # Returns different types of events including: Progress events - Status updates during stack operation
      # execution. Validation errors - Failures from CloudFormation Early Validations. Provisioning errors -
      # Resource creation and update failures. Hook invocation errors - Failures from CloudFormation Hook
      # during stack operations. One of ChangeSetName , OperationId or StackName must be specified as input.

      def describe_events(
        change_set_name : String? = nil,
        filters : Types::EventFilter? = nil,
        next_token : String? = nil,
        operation_id : String? = nil,
        stack_name : String? = nil
      ) : Types::DescribeEventsOutput

        input = Types::DescribeEventsInput.new(change_set_name: change_set_name, filters: filters, next_token: next_token, operation_id: operation_id, stack_name: stack_name)
        describe_events(input)
      end

      def describe_events(input : Types::DescribeEventsInput) : Types::DescribeEventsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEventsOutput, "DescribeEvents")
      end

      # Describes a generated template. The output includes details about the progress of the creation of a
      # generated template started by a CreateGeneratedTemplate API action or the update of a generated
      # template started with an UpdateGeneratedTemplate API action.

      def describe_generated_template(
        generated_template_name : String
      ) : Types::DescribeGeneratedTemplateOutput

        input = Types::DescribeGeneratedTemplateInput.new(generated_template_name: generated_template_name)
        describe_generated_template(input)
      end

      def describe_generated_template(input : Types::DescribeGeneratedTemplateInput) : Types::DescribeGeneratedTemplateOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_GENERATED_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeGeneratedTemplateOutput, "DescribeGeneratedTemplate")
      end

      # Retrieves information about the account's OrganizationAccess status. This API can be called either
      # by the management account or the delegated administrator by using the CallAs parameter. This API can
      # also be called without the CallAs parameter by the management account.

      def describe_organizations_access(
        call_as : String? = nil
      ) : Types::DescribeOrganizationsAccessOutput

        input = Types::DescribeOrganizationsAccessInput.new(call_as: call_as)
        describe_organizations_access(input)
      end

      def describe_organizations_access(input : Types::DescribeOrganizationsAccessInput) : Types::DescribeOrganizationsAccessOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_ORGANIZATIONS_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeOrganizationsAccessOutput, "DescribeOrganizationsAccess")
      end

      # Returns information about a CloudFormation extension publisher. If you don't supply a PublisherId ,
      # and you have registered as an extension publisher, DescribePublisher returns information about your
      # own publisher account. For more information about registering as a publisher, see: RegisterPublisher
      # Publishing extensions to make them available for public use in the CloudFormation Command Line
      # Interface (CLI) User Guide

      def describe_publisher(
        publisher_id : String? = nil
      ) : Types::DescribePublisherOutput

        input = Types::DescribePublisherInput.new(publisher_id: publisher_id)
        describe_publisher(input)
      end

      def describe_publisher(input : Types::DescribePublisherInput) : Types::DescribePublisherOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_PUBLISHER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribePublisherOutput, "DescribePublisher")
      end

      # Describes details of a resource scan.

      def describe_resource_scan(
        resource_scan_id : String
      ) : Types::DescribeResourceScanOutput

        input = Types::DescribeResourceScanInput.new(resource_scan_id: resource_scan_id)
        describe_resource_scan(input)
      end

      def describe_resource_scan(input : Types::DescribeResourceScanInput) : Types::DescribeResourceScanOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_RESOURCE_SCAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeResourceScanOutput, "DescribeResourceScan")
      end

      # Returns information about a stack drift detection operation. A stack drift detection operation
      # detects whether a stack's actual configuration differs, or has drifted , from its expected
      # configuration, as defined in the stack template and any values specified as template parameters. A
      # stack is considered to have drifted if one or more of its resources have drifted. For more
      # information about stack and resource drift, see Detect unmanaged configuration changes to stacks and
      # resources with drift detection . Use DetectStackDrift to initiate a stack drift detection operation.
      # DetectStackDrift returns a StackDriftDetectionId you can use to monitor the progress of the
      # operation using DescribeStackDriftDetectionStatus . Once the drift detection operation has
      # completed, use DescribeStackResourceDrifts to return drift information about the stack and its
      # resources.

      def describe_stack_drift_detection_status(
        stack_drift_detection_id : String
      ) : Types::DescribeStackDriftDetectionStatusOutput

        input = Types::DescribeStackDriftDetectionStatusInput.new(stack_drift_detection_id: stack_drift_detection_id)
        describe_stack_drift_detection_status(input)
      end

      def describe_stack_drift_detection_status(input : Types::DescribeStackDriftDetectionStatusInput) : Types::DescribeStackDriftDetectionStatusOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_DRIFT_DETECTION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackDriftDetectionStatusOutput, "DescribeStackDriftDetectionStatus")
      end

      # Returns all stack related events for a specified stack in reverse chronological order. For more
      # information about a stack's event history, see Understand CloudFormation stack creation events in
      # the CloudFormation User Guide . You can list events for stacks that have failed to create or have
      # been deleted by specifying the unique stack identifier (stack ID).

      def describe_stack_events(
        stack_name : String,
        next_token : String? = nil
      ) : Types::DescribeStackEventsOutput

        input = Types::DescribeStackEventsInput.new(stack_name: stack_name, next_token: next_token)
        describe_stack_events(input)
      end

      def describe_stack_events(input : Types::DescribeStackEventsInput) : Types::DescribeStackEventsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackEventsOutput, "DescribeStackEvents")
      end

      # Returns the stack instance that's associated with the specified StackSet, Amazon Web Services
      # account, and Amazon Web Services Region. For a list of stack instances that are associated with a
      # specific StackSet, use ListStackInstances .

      def describe_stack_instance(
        stack_instance_account : String,
        stack_instance_region : String,
        stack_set_name : String,
        call_as : String? = nil
      ) : Types::DescribeStackInstanceOutput

        input = Types::DescribeStackInstanceInput.new(stack_instance_account: stack_instance_account, stack_instance_region: stack_instance_region, stack_set_name: stack_set_name, call_as: call_as)
        describe_stack_instance(input)
      end

      def describe_stack_instance(input : Types::DescribeStackInstanceInput) : Types::DescribeStackInstanceOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackInstanceOutput, "DescribeStackInstance")
      end

      # Describes the stack refactor status.

      def describe_stack_refactor(
        stack_refactor_id : String
      ) : Types::DescribeStackRefactorOutput

        input = Types::DescribeStackRefactorInput.new(stack_refactor_id: stack_refactor_id)
        describe_stack_refactor(input)
      end

      def describe_stack_refactor(input : Types::DescribeStackRefactorInput) : Types::DescribeStackRefactorOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_REFACTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackRefactorOutput, "DescribeStackRefactor")
      end

      # Returns a description of the specified resource in the specified stack. For deleted stacks,
      # DescribeStackResource returns resource information for up to 90 days after the stack has been
      # deleted.

      def describe_stack_resource(
        logical_resource_id : String,
        stack_name : String
      ) : Types::DescribeStackResourceOutput

        input = Types::DescribeStackResourceInput.new(logical_resource_id: logical_resource_id, stack_name: stack_name)
        describe_stack_resource(input)
      end

      def describe_stack_resource(input : Types::DescribeStackResourceInput) : Types::DescribeStackResourceOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackResourceOutput, "DescribeStackResource")
      end

      # Returns drift information for the resources that have been checked for drift in the specified stack.
      # This includes actual and expected configuration values for resources where CloudFormation detects
      # configuration drift. For a given stack, there will be one StackResourceDrift for each stack resource
      # that has been checked for drift. Resources that haven't yet been checked for drift aren't included.
      # Resources that don't currently support drift detection aren't checked, and so not included. For a
      # list of resources that support drift detection, see Resource type support for imports and drift
      # detection . Use DetectStackResourceDrift to detect drift on individual resources, or
      # DetectStackDrift to detect drift on all supported resources for a given stack.

      def describe_stack_resource_drifts(
        stack_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        stack_resource_drift_status_filters : Array(String)? = nil
      ) : Types::DescribeStackResourceDriftsOutput

        input = Types::DescribeStackResourceDriftsInput.new(stack_name: stack_name, max_results: max_results, next_token: next_token, stack_resource_drift_status_filters: stack_resource_drift_status_filters)
        describe_stack_resource_drifts(input)
      end

      def describe_stack_resource_drifts(input : Types::DescribeStackResourceDriftsInput) : Types::DescribeStackResourceDriftsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_RESOURCE_DRIFTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackResourceDriftsOutput, "DescribeStackResourceDrifts")
      end

      # Returns Amazon Web Services resource descriptions for running and deleted stacks. If StackName is
      # specified, all the associated resources that are part of the stack are returned. If
      # PhysicalResourceId is specified, the associated resources of the stack that the resource belongs to
      # are returned. Only the first 100 resources will be returned. If your stack has more resources than
      # this, you should use ListStackResources instead. For deleted stacks, DescribeStackResources returns
      # resource information for up to 90 days after the stack has been deleted. You must specify either
      # StackName or PhysicalResourceId , but not both. In addition, you can specify LogicalResourceId to
      # filter the returned result. For more information about resources, the LogicalResourceId and
      # PhysicalResourceId , see the CloudFormation User Guide . A ValidationError is returned if you
      # specify both StackName and PhysicalResourceId in the same request.

      def describe_stack_resources(
        logical_resource_id : String? = nil,
        physical_resource_id : String? = nil,
        stack_name : String? = nil
      ) : Types::DescribeStackResourcesOutput

        input = Types::DescribeStackResourcesInput.new(logical_resource_id: logical_resource_id, physical_resource_id: physical_resource_id, stack_name: stack_name)
        describe_stack_resources(input)
      end

      def describe_stack_resources(input : Types::DescribeStackResourcesInput) : Types::DescribeStackResourcesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackResourcesOutput, "DescribeStackResources")
      end

      # Returns the description of the specified StackSet. This API provides strongly consistent reads
      # meaning it will always return the most up-to-date data.

      def describe_stack_set(
        stack_set_name : String,
        call_as : String? = nil
      ) : Types::DescribeStackSetOutput

        input = Types::DescribeStackSetInput.new(stack_set_name: stack_set_name, call_as: call_as)
        describe_stack_set(input)
      end

      def describe_stack_set(input : Types::DescribeStackSetInput) : Types::DescribeStackSetOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackSetOutput, "DescribeStackSet")
      end

      # Returns the description of the specified StackSet operation. This API provides strongly consistent
      # reads meaning it will always return the most up-to-date data.

      def describe_stack_set_operation(
        operation_id : String,
        stack_set_name : String,
        call_as : String? = nil
      ) : Types::DescribeStackSetOperationOutput

        input = Types::DescribeStackSetOperationInput.new(operation_id: operation_id, stack_set_name: stack_set_name, call_as: call_as)
        describe_stack_set_operation(input)
      end

      def describe_stack_set_operation(input : Types::DescribeStackSetOperationInput) : Types::DescribeStackSetOperationOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACK_SET_OPERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStackSetOperationOutput, "DescribeStackSetOperation")
      end

      # Returns the description for the specified stack; if no stack name was specified, then it returns the
      # description for all the stacks created. For more information about a stack's event history, see
      # Understand CloudFormation stack creation events in the CloudFormation User Guide . If the stack
      # doesn't exist, a ValidationError is returned.

      def describe_stacks(
        next_token : String? = nil,
        stack_name : String? = nil
      ) : Types::DescribeStacksOutput

        input = Types::DescribeStacksInput.new(next_token: next_token, stack_name: stack_name)
        describe_stacks(input)
      end

      def describe_stacks(input : Types::DescribeStacksInput) : Types::DescribeStacksOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_STACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeStacksOutput, "DescribeStacks")
      end

      # Returns detailed information about an extension from the CloudFormation registry in your current
      # account and Region. If you specify a VersionId , DescribeType returns information about that
      # specific extension version. Otherwise, it returns information about the default extension version.
      # For more information, see Edit configuration data for extensions in your account in the
      # CloudFormation User Guide .

      def describe_type(
        arn : String? = nil,
        public_version_number : String? = nil,
        publisher_id : String? = nil,
        type : String? = nil,
        type_name : String? = nil,
        version_id : String? = nil
      ) : Types::DescribeTypeOutput

        input = Types::DescribeTypeInput.new(arn: arn, public_version_number: public_version_number, publisher_id: publisher_id, type: type, type_name: type_name, version_id: version_id)
        describe_type(input)
      end

      def describe_type(input : Types::DescribeTypeInput) : Types::DescribeTypeOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTypeOutput, "DescribeType")
      end

      # Returns information about an extension's registration, including its current status and type and
      # version identifiers. When you initiate a registration request using RegisterType , you can then use
      # DescribeTypeRegistration to monitor the progress of that registration request. Once the registration
      # request has completed, use DescribeType to return detailed information about an extension.

      def describe_type_registration(
        registration_token : String
      ) : Types::DescribeTypeRegistrationOutput

        input = Types::DescribeTypeRegistrationInput.new(registration_token: registration_token)
        describe_type_registration(input)
      end

      def describe_type_registration(input : Types::DescribeTypeRegistrationInput) : Types::DescribeTypeRegistrationOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TYPE_REGISTRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTypeRegistrationOutput, "DescribeTypeRegistration")
      end

      # Detects whether a stack's actual configuration differs, or has drifted , from its expected
      # configuration, as defined in the stack template and any values specified as template parameters. For
      # each resource in the stack that supports drift detection, CloudFormation compares the actual
      # configuration of the resource with its expected template configuration. Only resource properties
      # explicitly defined in the stack template are checked for drift. A stack is considered to have
      # drifted if one or more of its resources differ from their expected template configurations. For more
      # information, see Detect unmanaged configuration changes to stacks and resources with drift detection
      # . Use DetectStackDrift to detect drift on all supported resources for a given stack, or
      # DetectStackResourceDrift to detect drift on individual resources. For a list of stack resources that
      # currently support drift detection, see Resource type support for imports and drift detection .
      # DetectStackDrift can take up to several minutes, depending on the number of resources contained
      # within the stack. Use DescribeStackDriftDetectionStatus to monitor the progress of a detect stack
      # drift operation. Once the drift detection operation has completed, use DescribeStackResourceDrifts
      # to return drift information about the stack and its resources. When detecting drift on a stack,
      # CloudFormation doesn't detect drift on any nested stacks belonging to that stack. Perform
      # DetectStackDrift directly on the nested stack itself.

      def detect_stack_drift(
        stack_name : String,
        logical_resource_ids : Array(String)? = nil
      ) : Types::DetectStackDriftOutput

        input = Types::DetectStackDriftInput.new(stack_name: stack_name, logical_resource_ids: logical_resource_ids)
        detect_stack_drift(input)
      end

      def detect_stack_drift(input : Types::DetectStackDriftInput) : Types::DetectStackDriftOutput
        request = Protocol::Query.build_request(Model::DETECT_STACK_DRIFT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetectStackDriftOutput, "DetectStackDrift")
      end

      # Returns information about whether a resource's actual configuration differs, or has drifted , from
      # its expected configuration, as defined in the stack template and any values specified as template
      # parameters. This information includes actual and expected property values for resources in which
      # CloudFormation detects drift. Only resource properties explicitly defined in the stack template are
      # checked for drift. For more information about stack and resource drift, see Detect unmanaged
      # configuration changes to stacks and resources with drift detection . Use DetectStackResourceDrift to
      # detect drift on individual resources, or DetectStackDrift to detect drift on all resources in a
      # given stack that support drift detection. Resources that don't currently support drift detection
      # can't be checked. For a list of resources that support drift detection, see Resource type support
      # for imports and drift detection .

      def detect_stack_resource_drift(
        logical_resource_id : String,
        stack_name : String
      ) : Types::DetectStackResourceDriftOutput

        input = Types::DetectStackResourceDriftInput.new(logical_resource_id: logical_resource_id, stack_name: stack_name)
        detect_stack_resource_drift(input)
      end

      def detect_stack_resource_drift(input : Types::DetectStackResourceDriftInput) : Types::DetectStackResourceDriftOutput
        request = Protocol::Query.build_request(Model::DETECT_STACK_RESOURCE_DRIFT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetectStackResourceDriftOutput, "DetectStackResourceDrift")
      end

      # Detect drift on a StackSet. When CloudFormation performs drift detection on a StackSet, it performs
      # drift detection on the stack associated with each stack instance in the StackSet. For more
      # information, see Performing drift detection on CloudFormation StackSets . DetectStackSetDrift
      # returns the OperationId of the StackSet drift detection operation. Use this operation id with
      # DescribeStackSetOperation to monitor the progress of the drift detection operation. The drift
      # detection operation may take some time, depending on the number of stack instances included in the
      # StackSet, in addition to the number of resources included in each stack. Once the operation has
      # completed, use the following actions to return drift information: Use DescribeStackSet to return
      # detailed information about the stack set, including detailed information about the last completed
      # drift operation performed on the StackSet. (Information about drift operations that are in progress
      # isn't included.) Use ListStackInstances to return a list of stack instances belonging to the
      # StackSet, including the drift status and last drift time checked of each instance. Use
      # DescribeStackInstance to return detailed information about a specific stack instance, including its
      # drift status and last drift time checked. You can only run a single drift detection operation on a
      # given StackSet at one time. To stop a drift detection StackSet operation, use StopStackSetOperation
      # .

      def detect_stack_set_drift(
        stack_set_name : String,
        call_as : String? = nil,
        operation_id : String? = nil,
        operation_preferences : Types::StackSetOperationPreferences? = nil
      ) : Types::DetectStackSetDriftOutput

        input = Types::DetectStackSetDriftInput.new(stack_set_name: stack_set_name, call_as: call_as, operation_id: operation_id, operation_preferences: operation_preferences)
        detect_stack_set_drift(input)
      end

      def detect_stack_set_drift(input : Types::DetectStackSetDriftInput) : Types::DetectStackSetDriftOutput
        request = Protocol::Query.build_request(Model::DETECT_STACK_SET_DRIFT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetectStackSetDriftOutput, "DetectStackSetDrift")
      end

      # Returns the estimated monthly cost of a template. The return value is an Amazon Web Services Simple
      # Monthly Calculator URL with a query string that describes the resources required to run the
      # template.

      def estimate_template_cost(
        parameters : Array(Types::Parameter)? = nil,
        template_body : String? = nil,
        template_url : String? = nil
      ) : Types::EstimateTemplateCostOutput

        input = Types::EstimateTemplateCostInput.new(parameters: parameters, template_body: template_body, template_url: template_url)
        estimate_template_cost(input)
      end

      def estimate_template_cost(input : Types::EstimateTemplateCostInput) : Types::EstimateTemplateCostOutput
        request = Protocol::Query.build_request(Model::ESTIMATE_TEMPLATE_COST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EstimateTemplateCostOutput, "EstimateTemplateCost")
      end

      # Updates a stack using the input information that was provided when the specified change set was
      # created. After the call successfully completes, CloudFormation starts updating the stack. Use the
      # DescribeStacks action to view the status of the update. When you execute a change set,
      # CloudFormation deletes all other change sets associated with the stack because they aren't valid for
      # the updated stack. If a stack policy is associated with the stack, CloudFormation enforces the
      # policy during the update. You can't specify a temporary stack policy that overrides the current
      # policy. To create a change set for the entire stack hierarchy, IncludeNestedStacks must have been
      # set to True .

      def execute_change_set(
        change_set_name : String,
        client_request_token : String? = nil,
        disable_rollback : Bool? = nil,
        retain_except_on_create : Bool? = nil,
        stack_name : String? = nil
      ) : Types::ExecuteChangeSetOutput

        input = Types::ExecuteChangeSetInput.new(change_set_name: change_set_name, client_request_token: client_request_token, disable_rollback: disable_rollback, retain_except_on_create: retain_except_on_create, stack_name: stack_name)
        execute_change_set(input)
      end

      def execute_change_set(input : Types::ExecuteChangeSetInput) : Types::ExecuteChangeSetOutput
        request = Protocol::Query.build_request(Model::EXECUTE_CHANGE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ExecuteChangeSetOutput, "ExecuteChangeSet")
      end

      # Executes the stack refactor operation.

      def execute_stack_refactor(
        stack_refactor_id : String
      ) : Nil

        input = Types::ExecuteStackRefactorInput.new(stack_refactor_id: stack_refactor_id)
        execute_stack_refactor(input)
      end

      def execute_stack_refactor(input : Types::ExecuteStackRefactorInput) : Nil
        request = Protocol::Query.build_request(Model::EXECUTE_STACK_REFACTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves a generated template. If the template is in an InProgress or Pending status then the
      # template returned will be the template when the template was last in a Complete status. If the
      # template has not yet been in a Complete status then an empty template will be returned.

      def get_generated_template(
        generated_template_name : String,
        format : String? = nil
      ) : Types::GetGeneratedTemplateOutput

        input = Types::GetGeneratedTemplateInput.new(generated_template_name: generated_template_name, format: format)
        get_generated_template(input)
      end

      def get_generated_template(input : Types::GetGeneratedTemplateInput) : Types::GetGeneratedTemplateOutput
        request = Protocol::Query.build_request(Model::GET_GENERATED_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetGeneratedTemplateOutput, "GetGeneratedTemplate")
      end

      # Retrieves detailed information and remediation guidance for a Hook invocation result. If the Hook
      # uses a KMS key to encrypt annotations, callers of the GetHookResult operation must have kms:Decrypt
      # permissions. For more information, see KMS key policy and permissions for encrypting CloudFormation
      # Hooks results at rest in the CloudFormation Hooks User Guide .

      def get_hook_result(
        hook_result_id : String? = nil
      ) : Types::GetHookResultOutput

        input = Types::GetHookResultInput.new(hook_result_id: hook_result_id)
        get_hook_result(input)
      end

      def get_hook_result(input : Types::GetHookResultInput) : Types::GetHookResultOutput
        request = Protocol::Query.build_request(Model::GET_HOOK_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetHookResultOutput, "GetHookResult")
      end

      # Returns the stack policy for a specified stack. If a stack doesn't have a policy, a null value is
      # returned.

      def get_stack_policy(
        stack_name : String
      ) : Types::GetStackPolicyOutput

        input = Types::GetStackPolicyInput.new(stack_name: stack_name)
        get_stack_policy(input)
      end

      def get_stack_policy(input : Types::GetStackPolicyInput) : Types::GetStackPolicyOutput
        request = Protocol::Query.build_request(Model::GET_STACK_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetStackPolicyOutput, "GetStackPolicy")
      end

      # Returns the template body for a specified stack. You can get the template for running or deleted
      # stacks. For deleted stacks, GetTemplate returns the template for up to 90 days after the stack has
      # been deleted. If the template doesn't exist, a ValidationError is returned.

      def get_template(
        change_set_name : String? = nil,
        stack_name : String? = nil,
        template_stage : String? = nil
      ) : Types::GetTemplateOutput

        input = Types::GetTemplateInput.new(change_set_name: change_set_name, stack_name: stack_name, template_stage: template_stage)
        get_template(input)
      end

      def get_template(input : Types::GetTemplateInput) : Types::GetTemplateOutput
        request = Protocol::Query.build_request(Model::GET_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetTemplateOutput, "GetTemplate")
      end

      # Returns information about a new or existing template. The GetTemplateSummary action is useful for
      # viewing parameter information, such as default parameter values and parameter types, before you
      # create or update a stack or StackSet. You can use the GetTemplateSummary action when you submit a
      # template, or you can get template information for a StackSet, or a running or deleted stack. For
      # deleted stacks, GetTemplateSummary returns the template information for up to 90 days after the
      # stack has been deleted. If the template doesn't exist, a ValidationError is returned.

      def get_template_summary(
        call_as : String? = nil,
        stack_name : String? = nil,
        stack_set_name : String? = nil,
        template_body : String? = nil,
        template_summary_config : Types::TemplateSummaryConfig? = nil,
        template_url : String? = nil
      ) : Types::GetTemplateSummaryOutput

        input = Types::GetTemplateSummaryInput.new(call_as: call_as, stack_name: stack_name, stack_set_name: stack_set_name, template_body: template_body, template_summary_config: template_summary_config, template_url: template_url)
        get_template_summary(input)
      end

      def get_template_summary(input : Types::GetTemplateSummaryInput) : Types::GetTemplateSummaryOutput
        request = Protocol::Query.build_request(Model::GET_TEMPLATE_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetTemplateSummaryOutput, "GetTemplateSummary")
      end

      # Import existing stacks into a new StackSets. Use the stack import operation to import up to 10
      # stacks into a new StackSet in the same account as the source stack or in a different administrator
      # account and Region, by specifying the stack ID of the stack you intend to import.

      def import_stacks_to_stack_set(
        stack_set_name : String,
        call_as : String? = nil,
        operation_id : String? = nil,
        operation_preferences : Types::StackSetOperationPreferences? = nil,
        organizational_unit_ids : Array(String)? = nil,
        stack_ids : Array(String)? = nil,
        stack_ids_url : String? = nil
      ) : Types::ImportStacksToStackSetOutput

        input = Types::ImportStacksToStackSetInput.new(stack_set_name: stack_set_name, call_as: call_as, operation_id: operation_id, operation_preferences: operation_preferences, organizational_unit_ids: organizational_unit_ids, stack_ids: stack_ids, stack_ids_url: stack_ids_url)
        import_stacks_to_stack_set(input)
      end

      def import_stacks_to_stack_set(input : Types::ImportStacksToStackSetInput) : Types::ImportStacksToStackSetOutput
        request = Protocol::Query.build_request(Model::IMPORT_STACKS_TO_STACK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ImportStacksToStackSetOutput, "ImportStacksToStackSet")
      end

      # Returns the ID and status of each active change set for a stack. For example, CloudFormation lists
      # change sets that are in the CREATE_IN_PROGRESS or CREATE_PENDING state.

      def list_change_sets(
        stack_name : String,
        next_token : String? = nil
      ) : Types::ListChangeSetsOutput

        input = Types::ListChangeSetsInput.new(stack_name: stack_name, next_token: next_token)
        list_change_sets(input)
      end

      def list_change_sets(input : Types::ListChangeSetsInput) : Types::ListChangeSetsOutput
        request = Protocol::Query.build_request(Model::LIST_CHANGE_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListChangeSetsOutput, "ListChangeSets")
      end

      # Lists all exported output values in the account and Region in which you call this action. Use this
      # action to see the exported output values that you can import into other stacks. To import values,
      # use the Fn::ImportValue function. For more information, see Get exported outputs from a deployed
      # CloudFormation stack .

      def list_exports(
        next_token : String? = nil
      ) : Types::ListExportsOutput

        input = Types::ListExportsInput.new(next_token: next_token)
        list_exports(input)
      end

      def list_exports(input : Types::ListExportsInput) : Types::ListExportsOutput
        request = Protocol::Query.build_request(Model::LIST_EXPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListExportsOutput, "ListExports")
      end

      # Lists your generated templates in this Region.

      def list_generated_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGeneratedTemplatesOutput

        input = Types::ListGeneratedTemplatesInput.new(max_results: max_results, next_token: next_token)
        list_generated_templates(input)
      end

      def list_generated_templates(input : Types::ListGeneratedTemplatesInput) : Types::ListGeneratedTemplatesOutput
        request = Protocol::Query.build_request(Model::LIST_GENERATED_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListGeneratedTemplatesOutput, "ListGeneratedTemplates")
      end

      # Returns summaries of invoked Hooks. For more information, see View invocation summaries for
      # CloudFormation Hooks in the CloudFormation Hooks User Guide . This operation supports the following
      # parameter combinations: No parameters: Returns all Hook invocation summaries. TypeArn only: Returns
      # summaries for a specific Hook. TypeArn and Status : Returns summaries for a specific Hook filtered
      # by status. TargetId and TargetType : Returns summaries for a specific Hook invocation target.

      def list_hook_results(
        next_token : String? = nil,
        status : String? = nil,
        target_id : String? = nil,
        target_type : String? = nil,
        type_arn : String? = nil
      ) : Types::ListHookResultsOutput

        input = Types::ListHookResultsInput.new(next_token: next_token, status: status, target_id: target_id, target_type: target_type, type_arn: type_arn)
        list_hook_results(input)
      end

      def list_hook_results(input : Types::ListHookResultsInput) : Types::ListHookResultsOutput
        request = Protocol::Query.build_request(Model::LIST_HOOK_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListHookResultsOutput, "ListHookResults")
      end

      # Lists all stacks that are importing an exported output value. To modify or remove an exported output
      # value, first use this action to see which stacks are using it. To see the exported output values in
      # your account, see ListExports . For more information about importing an exported output value, see
      # the Fn::ImportValue function.

      def list_imports(
        export_name : String,
        next_token : String? = nil
      ) : Types::ListImportsOutput

        input = Types::ListImportsInput.new(export_name: export_name, next_token: next_token)
        list_imports(input)
      end

      def list_imports(input : Types::ListImportsInput) : Types::ListImportsOutput
        request = Protocol::Query.build_request(Model::LIST_IMPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListImportsOutput, "ListImports")
      end

      # Lists the related resources for a list of resources from a resource scan. The response indicates
      # whether each returned resource is already managed by CloudFormation.

      def list_resource_scan_related_resources(
        resource_scan_id : String,
        resources : Array(Types::ScannedResourceIdentifier),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceScanRelatedResourcesOutput

        input = Types::ListResourceScanRelatedResourcesInput.new(resource_scan_id: resource_scan_id, resources: resources, max_results: max_results, next_token: next_token)
        list_resource_scan_related_resources(input)
      end

      def list_resource_scan_related_resources(input : Types::ListResourceScanRelatedResourcesInput) : Types::ListResourceScanRelatedResourcesOutput
        request = Protocol::Query.build_request(Model::LIST_RESOURCE_SCAN_RELATED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListResourceScanRelatedResourcesOutput, "ListResourceScanRelatedResources")
      end

      # Lists the resources from a resource scan. The results can be filtered by resource identifier,
      # resource type prefix, tag key, and tag value. Only resources that match all specified filters are
      # returned. The response indicates whether each returned resource is already managed by
      # CloudFormation.

      def list_resource_scan_resources(
        resource_scan_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier : String? = nil,
        resource_type_prefix : String? = nil,
        tag_key : String? = nil,
        tag_value : String? = nil
      ) : Types::ListResourceScanResourcesOutput

        input = Types::ListResourceScanResourcesInput.new(resource_scan_id: resource_scan_id, max_results: max_results, next_token: next_token, resource_identifier: resource_identifier, resource_type_prefix: resource_type_prefix, tag_key: tag_key, tag_value: tag_value)
        list_resource_scan_resources(input)
      end

      def list_resource_scan_resources(input : Types::ListResourceScanResourcesInput) : Types::ListResourceScanResourcesOutput
        request = Protocol::Query.build_request(Model::LIST_RESOURCE_SCAN_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListResourceScanResourcesOutput, "ListResourceScanResources")
      end

      # List the resource scans from newest to oldest. By default it will return up to 10 resource scans.

      def list_resource_scans(
        max_results : Int32? = nil,
        next_token : String? = nil,
        scan_type_filter : String? = nil
      ) : Types::ListResourceScansOutput

        input = Types::ListResourceScansInput.new(max_results: max_results, next_token: next_token, scan_type_filter: scan_type_filter)
        list_resource_scans(input)
      end

      def list_resource_scans(input : Types::ListResourceScansInput) : Types::ListResourceScansOutput
        request = Protocol::Query.build_request(Model::LIST_RESOURCE_SCANS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListResourceScansOutput, "ListResourceScans")
      end

      # Returns drift information for resources in a stack instance. ListStackInstanceResourceDrifts returns
      # drift information for the most recent drift detection operation. If an operation is in progress, it
      # may only return partial results.

      def list_stack_instance_resource_drifts(
        operation_id : String,
        stack_instance_account : String,
        stack_instance_region : String,
        stack_set_name : String,
        call_as : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        stack_instance_resource_drift_statuses : Array(String)? = nil
      ) : Types::ListStackInstanceResourceDriftsOutput

        input = Types::ListStackInstanceResourceDriftsInput.new(operation_id: operation_id, stack_instance_account: stack_instance_account, stack_instance_region: stack_instance_region, stack_set_name: stack_set_name, call_as: call_as, max_results: max_results, next_token: next_token, stack_instance_resource_drift_statuses: stack_instance_resource_drift_statuses)
        list_stack_instance_resource_drifts(input)
      end

      def list_stack_instance_resource_drifts(input : Types::ListStackInstanceResourceDriftsInput) : Types::ListStackInstanceResourceDriftsOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_INSTANCE_RESOURCE_DRIFTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackInstanceResourceDriftsOutput, "ListStackInstanceResourceDrifts")
      end

      # Returns summary information about stack instances that are associated with the specified StackSet.
      # You can filter for stack instances that are associated with a specific Amazon Web Services account
      # name or Region, or that have a specific status.

      def list_stack_instances(
        stack_set_name : String,
        call_as : String? = nil,
        filters : Array(Types::StackInstanceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        stack_instance_account : String? = nil,
        stack_instance_region : String? = nil
      ) : Types::ListStackInstancesOutput

        input = Types::ListStackInstancesInput.new(stack_set_name: stack_set_name, call_as: call_as, filters: filters, max_results: max_results, next_token: next_token, stack_instance_account: stack_instance_account, stack_instance_region: stack_instance_region)
        list_stack_instances(input)
      end

      def list_stack_instances(input : Types::ListStackInstancesInput) : Types::ListStackInstancesOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackInstancesOutput, "ListStackInstances")
      end

      # Lists the stack refactor actions that will be taken after calling the ExecuteStackRefactor action.

      def list_stack_refactor_actions(
        stack_refactor_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStackRefactorActionsOutput

        input = Types::ListStackRefactorActionsInput.new(stack_refactor_id: stack_refactor_id, max_results: max_results, next_token: next_token)
        list_stack_refactor_actions(input)
      end

      def list_stack_refactor_actions(input : Types::ListStackRefactorActionsInput) : Types::ListStackRefactorActionsOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_REFACTOR_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackRefactorActionsOutput, "ListStackRefactorActions")
      end

      # Lists all account stack refactor operations and their statuses.

      def list_stack_refactors(
        execution_status_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStackRefactorsOutput

        input = Types::ListStackRefactorsInput.new(execution_status_filter: execution_status_filter, max_results: max_results, next_token: next_token)
        list_stack_refactors(input)
      end

      def list_stack_refactors(input : Types::ListStackRefactorsInput) : Types::ListStackRefactorsOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_REFACTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackRefactorsOutput, "ListStackRefactors")
      end

      # Returns descriptions of all resources of the specified stack. For deleted stacks, ListStackResources
      # returns resource information for up to 90 days after the stack has been deleted.

      def list_stack_resources(
        stack_name : String,
        next_token : String? = nil
      ) : Types::ListStackResourcesOutput

        input = Types::ListStackResourcesInput.new(stack_name: stack_name, next_token: next_token)
        list_stack_resources(input)
      end

      def list_stack_resources(input : Types::ListStackResourcesInput) : Types::ListStackResourcesOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackResourcesOutput, "ListStackResources")
      end

      # Returns summary information about deployment targets for a StackSet.

      def list_stack_set_auto_deployment_targets(
        stack_set_name : String,
        call_as : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStackSetAutoDeploymentTargetsOutput

        input = Types::ListStackSetAutoDeploymentTargetsInput.new(stack_set_name: stack_set_name, call_as: call_as, max_results: max_results, next_token: next_token)
        list_stack_set_auto_deployment_targets(input)
      end

      def list_stack_set_auto_deployment_targets(input : Types::ListStackSetAutoDeploymentTargetsInput) : Types::ListStackSetAutoDeploymentTargetsOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_SET_AUTO_DEPLOYMENT_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackSetAutoDeploymentTargetsOutput, "ListStackSetAutoDeploymentTargets")
      end

      # Returns summary information about the results of a StackSet operation. This API provides eventually
      # consistent reads meaning it may take some time but will eventually return the most up-to-date data.

      def list_stack_set_operation_results(
        operation_id : String,
        stack_set_name : String,
        call_as : String? = nil,
        filters : Array(Types::OperationResultFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStackSetOperationResultsOutput

        input = Types::ListStackSetOperationResultsInput.new(operation_id: operation_id, stack_set_name: stack_set_name, call_as: call_as, filters: filters, max_results: max_results, next_token: next_token)
        list_stack_set_operation_results(input)
      end

      def list_stack_set_operation_results(input : Types::ListStackSetOperationResultsInput) : Types::ListStackSetOperationResultsOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_SET_OPERATION_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackSetOperationResultsOutput, "ListStackSetOperationResults")
      end

      # Returns summary information about operations performed on a StackSet. This API provides eventually
      # consistent reads meaning it may take some time but will eventually return the most up-to-date data.

      def list_stack_set_operations(
        stack_set_name : String,
        call_as : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStackSetOperationsOutput

        input = Types::ListStackSetOperationsInput.new(stack_set_name: stack_set_name, call_as: call_as, max_results: max_results, next_token: next_token)
        list_stack_set_operations(input)
      end

      def list_stack_set_operations(input : Types::ListStackSetOperationsInput) : Types::ListStackSetOperationsOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_SET_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackSetOperationsOutput, "ListStackSetOperations")
      end

      # Returns summary information about StackSets that are associated with the user. This API provides
      # strongly consistent reads meaning it will always return the most up-to-date data. [Self-managed
      # permissions] If you set the CallAs parameter to SELF while signed in to your Amazon Web Services
      # account, ListStackSets returns all self-managed StackSets in your Amazon Web Services account.
      # [Service-managed permissions] If you set the CallAs parameter to SELF while signed in to the
      # organization's management account, ListStackSets returns all StackSets in the management account.
      # [Service-managed permissions] If you set the CallAs parameter to DELEGATED_ADMIN while signed in to
      # your member account, ListStackSets returns all StackSets with service-managed permissions in the
      # management account.

      def list_stack_sets(
        call_as : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListStackSetsOutput

        input = Types::ListStackSetsInput.new(call_as: call_as, max_results: max_results, next_token: next_token, status: status)
        list_stack_sets(input)
      end

      def list_stack_sets(input : Types::ListStackSetsInput) : Types::ListStackSetsOutput
        request = Protocol::Query.build_request(Model::LIST_STACK_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStackSetsOutput, "ListStackSets")
      end

      # Returns the summary information for stacks whose status matches the specified StackStatusFilter .
      # Summary information for stacks that have been deleted is kept for 90 days after the stack is
      # deleted. If no StackStatusFilter is specified, summary information for all stacks is returned
      # (including existing stacks and stacks that have been deleted).

      def list_stacks(
        next_token : String? = nil,
        stack_status_filter : Array(String)? = nil
      ) : Types::ListStacksOutput

        input = Types::ListStacksInput.new(next_token: next_token, stack_status_filter: stack_status_filter)
        list_stacks(input)
      end

      def list_stacks(input : Types::ListStacksInput) : Types::ListStacksOutput
        request = Protocol::Query.build_request(Model::LIST_STACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListStacksOutput, "ListStacks")
      end

      # Returns a list of registration tokens for the specified extension(s).

      def list_type_registrations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        registration_status_filter : String? = nil,
        type : String? = nil,
        type_arn : String? = nil,
        type_name : String? = nil
      ) : Types::ListTypeRegistrationsOutput

        input = Types::ListTypeRegistrationsInput.new(max_results: max_results, next_token: next_token, registration_status_filter: registration_status_filter, type: type, type_arn: type_arn, type_name: type_name)
        list_type_registrations(input)
      end

      def list_type_registrations(input : Types::ListTypeRegistrationsInput) : Types::ListTypeRegistrationsOutput
        request = Protocol::Query.build_request(Model::LIST_TYPE_REGISTRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListTypeRegistrationsOutput, "ListTypeRegistrations")
      end

      # Returns summary information about the versions of an extension.

      def list_type_versions(
        arn : String? = nil,
        deprecated_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        publisher_id : String? = nil,
        type : String? = nil,
        type_name : String? = nil
      ) : Types::ListTypeVersionsOutput

        input = Types::ListTypeVersionsInput.new(arn: arn, deprecated_status: deprecated_status, max_results: max_results, next_token: next_token, publisher_id: publisher_id, type: type, type_name: type_name)
        list_type_versions(input)
      end

      def list_type_versions(input : Types::ListTypeVersionsInput) : Types::ListTypeVersionsOutput
        request = Protocol::Query.build_request(Model::LIST_TYPE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListTypeVersionsOutput, "ListTypeVersions")
      end

      # Returns summary information about all extensions, including your private resource types, modules,
      # and Hooks as well as all public extensions from Amazon Web Services and third-party publishers.

      def list_types(
        deprecated_status : String? = nil,
        filters : Types::TypeFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        provisioning_type : String? = nil,
        type : String? = nil,
        visibility : String? = nil
      ) : Types::ListTypesOutput

        input = Types::ListTypesInput.new(deprecated_status: deprecated_status, filters: filters, max_results: max_results, next_token: next_token, provisioning_type: provisioning_type, type: type, visibility: visibility)
        list_types(input)
      end

      def list_types(input : Types::ListTypesInput) : Types::ListTypesOutput
        request = Protocol::Query.build_request(Model::LIST_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListTypesOutput, "ListTypes")
      end

      # Publishes the specified extension to the CloudFormation registry as a public extension in this
      # Region. Public extensions are available for use by all CloudFormation users. For more information
      # about publishing extensions, see Publishing extensions to make them available for public use in the
      # CloudFormation Command Line Interface (CLI) User Guide . To publish an extension, you must be
      # registered as a publisher with CloudFormation. For more information, see RegisterPublisher .

      def publish_type(
        arn : String? = nil,
        public_version_number : String? = nil,
        type : String? = nil,
        type_name : String? = nil
      ) : Types::PublishTypeOutput

        input = Types::PublishTypeInput.new(arn: arn, public_version_number: public_version_number, type: type, type_name: type_name)
        publish_type(input)
      end

      def publish_type(input : Types::PublishTypeInput) : Types::PublishTypeOutput
        request = Protocol::Query.build_request(Model::PUBLISH_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PublishTypeOutput, "PublishType")
      end

      # Reports progress of a resource handler to CloudFormation. Reserved for use by the CloudFormation CLI
      # . Don't use this API in your code.

      def record_handler_progress(
        bearer_token : String,
        operation_status : String,
        client_request_token : String? = nil,
        current_operation_status : String? = nil,
        error_code : String? = nil,
        resource_model : String? = nil,
        status_message : String? = nil
      ) : Types::RecordHandlerProgressOutput

        input = Types::RecordHandlerProgressInput.new(bearer_token: bearer_token, operation_status: operation_status, client_request_token: client_request_token, current_operation_status: current_operation_status, error_code: error_code, resource_model: resource_model, status_message: status_message)
        record_handler_progress(input)
      end

      def record_handler_progress(input : Types::RecordHandlerProgressInput) : Types::RecordHandlerProgressOutput
        request = Protocol::Query.build_request(Model::RECORD_HANDLER_PROGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RecordHandlerProgressOutput, "RecordHandlerProgress")
      end

      # Registers your account as a publisher of public extensions in the CloudFormation registry. Public
      # extensions are available for use by all CloudFormation users. This publisher ID applies to your
      # account in all Amazon Web Services Regions. For information about requirements for registering as a
      # public extension publisher, see Prerequisite: Registering your account to publish CloudFormation
      # extensions in the CloudFormation Command Line Interface (CLI) User Guide .

      def register_publisher(
        accept_terms_and_conditions : Bool? = nil,
        connection_arn : String? = nil
      ) : Types::RegisterPublisherOutput

        input = Types::RegisterPublisherInput.new(accept_terms_and_conditions: accept_terms_and_conditions, connection_arn: connection_arn)
        register_publisher(input)
      end

      def register_publisher(input : Types::RegisterPublisherInput) : Types::RegisterPublisherOutput
        request = Protocol::Query.build_request(Model::REGISTER_PUBLISHER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RegisterPublisherOutput, "RegisterPublisher")
      end

      # Registers an extension with the CloudFormation service. Registering an extension makes it available
      # for use in CloudFormation templates in your Amazon Web Services account, and includes: Validating
      # the extension schema. Determining which handlers, if any, have been specified for the extension.
      # Making the extension available for use in your account. For more information about how to develop
      # extensions and ready them for registration, see Creating resource types using the CloudFormation CLI
      # in the CloudFormation Command Line Interface (CLI) User Guide . You can have a maximum of 50
      # resource extension versions registered at a time. This maximum is per account and per Region. Use
      # DeregisterType to deregister specific extension versions if necessary. Once you have initiated a
      # registration request using RegisterType , you can use DescribeTypeRegistration to monitor the
      # progress of the registration request. Once you have registered a private extension in your account
      # and Region, use SetTypeConfiguration to specify configuration properties for the extension. For more
      # information, see Edit configuration data for extensions in your account in the CloudFormation User
      # Guide .

      def register_type(
        schema_handler_package : String,
        type_name : String,
        client_request_token : String? = nil,
        execution_role_arn : String? = nil,
        logging_config : Types::LoggingConfig? = nil,
        type : String? = nil
      ) : Types::RegisterTypeOutput

        input = Types::RegisterTypeInput.new(schema_handler_package: schema_handler_package, type_name: type_name, client_request_token: client_request_token, execution_role_arn: execution_role_arn, logging_config: logging_config, type: type)
        register_type(input)
      end

      def register_type(input : Types::RegisterTypeInput) : Types::RegisterTypeOutput
        request = Protocol::Query.build_request(Model::REGISTER_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RegisterTypeOutput, "RegisterType")
      end

      # When specifying RollbackStack , you preserve the state of previously provisioned resources when an
      # operation fails. You can check the status of the stack through the DescribeStacks operation. Rolls
      # back the specified stack to the last known stable state from CREATE_FAILED or UPDATE_FAILED stack
      # statuses. This operation will delete a stack if it doesn't contain a last known stable state. A last
      # known stable state includes any status in a *_COMPLETE . This includes the following stack statuses.
      # CREATE_COMPLETE UPDATE_COMPLETE UPDATE_ROLLBACK_COMPLETE IMPORT_COMPLETE IMPORT_ROLLBACK_COMPLETE

      def rollback_stack(
        stack_name : String,
        client_request_token : String? = nil,
        retain_except_on_create : Bool? = nil,
        role_arn : String? = nil
      ) : Types::RollbackStackOutput

        input = Types::RollbackStackInput.new(stack_name: stack_name, client_request_token: client_request_token, retain_except_on_create: retain_except_on_create, role_arn: role_arn)
        rollback_stack(input)
      end

      def rollback_stack(input : Types::RollbackStackInput) : Types::RollbackStackOutput
        request = Protocol::Query.build_request(Model::ROLLBACK_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RollbackStackOutput, "RollbackStack")
      end

      # Sets a stack policy for a specified stack.

      def set_stack_policy(
        stack_name : String,
        stack_policy_body : String? = nil,
        stack_policy_url : String? = nil
      ) : Nil

        input = Types::SetStackPolicyInput.new(stack_name: stack_name, stack_policy_body: stack_policy_body, stack_policy_url: stack_policy_url)
        set_stack_policy(input)
      end

      def set_stack_policy(input : Types::SetStackPolicyInput) : Nil
        request = Protocol::Query.build_request(Model::SET_STACK_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Specifies the configuration data for a CloudFormation extension, such as a resource or Hook, in the
      # given account and Region. For more information, see Edit configuration data for extensions in your
      # account in the CloudFormation User Guide . To view the current configuration data for an extension,
      # refer to the ConfigurationSchema element of DescribeType . It's strongly recommended that you use
      # dynamic references to restrict sensitive configuration definitions, such as third-party credentials.
      # For more information, see Specify values stored in other services using dynamic references in the
      # CloudFormation User Guide . For more information about setting the configuration data for resource
      # types, see Defining the account-level configuration of an extension in the CloudFormation Command
      # Line Interface (CLI) User Guide . For more information about setting the configuration data for
      # Hooks, see the CloudFormation Hooks User Guide .

      def set_type_configuration(
        configuration : String,
        configuration_alias : String? = nil,
        type : String? = nil,
        type_arn : String? = nil,
        type_name : String? = nil
      ) : Types::SetTypeConfigurationOutput

        input = Types::SetTypeConfigurationInput.new(configuration: configuration, configuration_alias: configuration_alias, type: type, type_arn: type_arn, type_name: type_name)
        set_type_configuration(input)
      end

      def set_type_configuration(input : Types::SetTypeConfigurationInput) : Types::SetTypeConfigurationOutput
        request = Protocol::Query.build_request(Model::SET_TYPE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetTypeConfigurationOutput, "SetTypeConfiguration")
      end

      # Specify the default version of an extension. The default version of an extension will be used in
      # CloudFormation operations.

      def set_type_default_version(
        arn : String? = nil,
        type : String? = nil,
        type_name : String? = nil,
        version_id : String? = nil
      ) : Types::SetTypeDefaultVersionOutput

        input = Types::SetTypeDefaultVersionInput.new(arn: arn, type: type, type_name: type_name, version_id: version_id)
        set_type_default_version(input)
      end

      def set_type_default_version(input : Types::SetTypeDefaultVersionInput) : Types::SetTypeDefaultVersionOutput
        request = Protocol::Query.build_request(Model::SET_TYPE_DEFAULT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetTypeDefaultVersionOutput, "SetTypeDefaultVersion")
      end

      # Sends a signal to the specified resource with a success or failure status. You can use the
      # SignalResource operation in conjunction with a creation policy or update policy. CloudFormation
      # doesn't proceed with a stack creation or update until resources receive the required number of
      # signals or the timeout period is exceeded. The SignalResource operation is useful in cases where you
      # want to send signals from anywhere other than an Amazon EC2 instance.

      def signal_resource(
        logical_resource_id : String,
        stack_name : String,
        status : String,
        unique_id : String
      ) : Nil

        input = Types::SignalResourceInput.new(logical_resource_id: logical_resource_id, stack_name: stack_name, status: status, unique_id: unique_id)
        signal_resource(input)
      end

      def signal_resource(input : Types::SignalResourceInput) : Nil
        request = Protocol::Query.build_request(Model::SIGNAL_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Starts a scan of the resources in this account in this Region. You can the status of a scan using
      # the ListResourceScans API action.

      def start_resource_scan(
        client_request_token : String? = nil,
        scan_filters : Array(Types::ScanFilter)? = nil
      ) : Types::StartResourceScanOutput

        input = Types::StartResourceScanInput.new(client_request_token: client_request_token, scan_filters: scan_filters)
        start_resource_scan(input)
      end

      def start_resource_scan(input : Types::StartResourceScanInput) : Types::StartResourceScanOutput
        request = Protocol::Query.build_request(Model::START_RESOURCE_SCAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StartResourceScanOutput, "StartResourceScan")
      end

      # Stops an in-progress operation on a StackSet and its associated stack instances. StackSets will
      # cancel all the unstarted stack instance deployments and wait for those are in-progress to complete.

      def stop_stack_set_operation(
        operation_id : String,
        stack_set_name : String,
        call_as : String? = nil
      ) : Types::StopStackSetOperationOutput

        input = Types::StopStackSetOperationInput.new(operation_id: operation_id, stack_set_name: stack_set_name, call_as: call_as)
        stop_stack_set_operation(input)
      end

      def stop_stack_set_operation(input : Types::StopStackSetOperationInput) : Types::StopStackSetOperationOutput
        request = Protocol::Query.build_request(Model::STOP_STACK_SET_OPERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StopStackSetOperationOutput, "StopStackSetOperation")
      end

      # Tests a registered extension to make sure it meets all necessary requirements for being published in
      # the CloudFormation registry. For resource types, this includes passing all contracts tests defined
      # for the type. For modules, this includes determining if the module's model meets all necessary
      # requirements. For more information, see Testing your public extension before publishing in the
      # CloudFormation Command Line Interface (CLI) User Guide . If you don't specify a version,
      # CloudFormation uses the default version of the extension in your account and Region for testing. To
      # perform testing, CloudFormation assumes the execution role specified when the type was registered.
      # For more information, see RegisterType . Once you've initiated testing on an extension using
      # TestType , you can pass the returned TypeVersionArn into DescribeType to monitor the current test
      # status and test status description for the extension. An extension must have a test status of PASSED
      # before it can be published. For more information, see Publishing extensions to make them available
      # for public use in the CloudFormation Command Line Interface (CLI) User Guide .

      def test_type(
        arn : String? = nil,
        log_delivery_bucket : String? = nil,
        type : String? = nil,
        type_name : String? = nil,
        version_id : String? = nil
      ) : Types::TestTypeOutput

        input = Types::TestTypeInput.new(arn: arn, log_delivery_bucket: log_delivery_bucket, type: type, type_name: type_name, version_id: version_id)
        test_type(input)
      end

      def test_type(input : Types::TestTypeInput) : Types::TestTypeOutput
        request = Protocol::Query.build_request(Model::TEST_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TestTypeOutput, "TestType")
      end

      # Updates a generated template. This can be used to change the name, add and remove resources, refresh
      # resources, and change the DeletionPolicy and UpdateReplacePolicy settings. You can check the status
      # of the update to the generated template using the DescribeGeneratedTemplate API action.

      def update_generated_template(
        generated_template_name : String,
        add_resources : Array(Types::ResourceDefinition)? = nil,
        new_generated_template_name : String? = nil,
        refresh_all_resources : Bool? = nil,
        remove_resources : Array(String)? = nil,
        template_configuration : Types::TemplateConfiguration? = nil
      ) : Types::UpdateGeneratedTemplateOutput

        input = Types::UpdateGeneratedTemplateInput.new(generated_template_name: generated_template_name, add_resources: add_resources, new_generated_template_name: new_generated_template_name, refresh_all_resources: refresh_all_resources, remove_resources: remove_resources, template_configuration: template_configuration)
        update_generated_template(input)
      end

      def update_generated_template(input : Types::UpdateGeneratedTemplateInput) : Types::UpdateGeneratedTemplateOutput
        request = Protocol::Query.build_request(Model::UPDATE_GENERATED_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateGeneratedTemplateOutput, "UpdateGeneratedTemplate")
      end

      # Updates a stack as specified in the template. After the call completes successfully, the stack
      # update starts. You can check the status of the stack through the DescribeStacks action. To get a
      # copy of the template for an existing stack, you can use the GetTemplate action. For more information
      # about updating a stack and monitoring the progress of the update, see Managing Amazon Web Services
      # resources as a single unit with CloudFormation stacks in the CloudFormation User Guide .

      def update_stack(
        stack_name : String,
        capabilities : Array(String)? = nil,
        client_request_token : String? = nil,
        disable_rollback : Bool? = nil,
        notification_ar_ns : Array(String)? = nil,
        parameters : Array(Types::Parameter)? = nil,
        resource_types : Array(String)? = nil,
        retain_except_on_create : Bool? = nil,
        role_arn : String? = nil,
        rollback_configuration : Types::RollbackConfiguration? = nil,
        stack_policy_body : String? = nil,
        stack_policy_during_update_body : String? = nil,
        stack_policy_during_update_url : String? = nil,
        stack_policy_url : String? = nil,
        tags : Array(Types::Tag)? = nil,
        template_body : String? = nil,
        template_url : String? = nil,
        use_previous_template : Bool? = nil
      ) : Types::UpdateStackOutput

        input = Types::UpdateStackInput.new(stack_name: stack_name, capabilities: capabilities, client_request_token: client_request_token, disable_rollback: disable_rollback, notification_ar_ns: notification_ar_ns, parameters: parameters, resource_types: resource_types, retain_except_on_create: retain_except_on_create, role_arn: role_arn, rollback_configuration: rollback_configuration, stack_policy_body: stack_policy_body, stack_policy_during_update_body: stack_policy_during_update_body, stack_policy_during_update_url: stack_policy_during_update_url, stack_policy_url: stack_policy_url, tags: tags, template_body: template_body, template_url: template_url, use_previous_template: use_previous_template)
        update_stack(input)
      end

      def update_stack(input : Types::UpdateStackInput) : Types::UpdateStackOutput
        request = Protocol::Query.build_request(Model::UPDATE_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateStackOutput, "UpdateStack")
      end

      # Updates the parameter values for stack instances for the specified accounts, within the specified
      # Amazon Web Services Regions. A stack instance refers to a stack in a specific account and Region.
      # You can only update stack instances in Amazon Web Services Regions and accounts where they already
      # exist; to create additional stack instances, use CreateStackInstances . During StackSet updates, any
      # parameters overridden for a stack instance aren't updated, but retain their overridden value. You
      # can only update the parameter values that are specified in the StackSet. To add or delete a
      # parameter itself, use UpdateStackSet to update the StackSet template. If you add a parameter to a
      # template, before you can override the parameter value specified in the StackSet you must first use
      # UpdateStackSet to update all stack instances with the updated template and parameter value specified
      # in the StackSet. Once a stack instance has been updated with the new parameter, you can then
      # override the parameter value using UpdateStackInstances . The maximum number of organizational unit
      # (OUs) supported by a UpdateStackInstances operation is 50. If you need more than 50, consider the
      # following options: Batch processing: If you don't want to expose your OU hierarchy, split up the
      # operations into multiple calls with less than 50 OUs each. Parent OU strategy: If you don't mind
      # exposing the OU hierarchy, target a parent OU that contains all desired child OUs.

      def update_stack_instances(
        regions : Array(String),
        stack_set_name : String,
        accounts : Array(String)? = nil,
        call_as : String? = nil,
        deployment_targets : Types::DeploymentTargets? = nil,
        operation_id : String? = nil,
        operation_preferences : Types::StackSetOperationPreferences? = nil,
        parameter_overrides : Array(Types::Parameter)? = nil
      ) : Types::UpdateStackInstancesOutput

        input = Types::UpdateStackInstancesInput.new(regions: regions, stack_set_name: stack_set_name, accounts: accounts, call_as: call_as, deployment_targets: deployment_targets, operation_id: operation_id, operation_preferences: operation_preferences, parameter_overrides: parameter_overrides)
        update_stack_instances(input)
      end

      def update_stack_instances(input : Types::UpdateStackInstancesInput) : Types::UpdateStackInstancesOutput
        request = Protocol::Query.build_request(Model::UPDATE_STACK_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateStackInstancesOutput, "UpdateStackInstances")
      end

      # Updates the StackSet and associated stack instances in the specified accounts and Amazon Web
      # Services Regions. Even if the StackSet operation created by updating the StackSet fails (completely
      # or partially, below or above a specified failure tolerance), the StackSet is updated with your
      # changes. Subsequent CreateStackInstances calls on the specified StackSet use the updated StackSet.
      # The maximum number of organizational unit (OUs) supported by a UpdateStackSet operation is 50. If
      # you need more than 50, consider the following options: Batch processing: If you don't want to expose
      # your OU hierarchy, split up the operations into multiple calls with less than 50 OUs each. Parent OU
      # strategy: If you don't mind exposing the OU hierarchy, target a parent OU that contains all desired
      # child OUs.

      def update_stack_set(
        stack_set_name : String,
        accounts : Array(String)? = nil,
        administration_role_arn : String? = nil,
        auto_deployment : Types::AutoDeployment? = nil,
        call_as : String? = nil,
        capabilities : Array(String)? = nil,
        deployment_targets : Types::DeploymentTargets? = nil,
        description : String? = nil,
        execution_role_name : String? = nil,
        managed_execution : Types::ManagedExecution? = nil,
        operation_id : String? = nil,
        operation_preferences : Types::StackSetOperationPreferences? = nil,
        parameters : Array(Types::Parameter)? = nil,
        permission_model : String? = nil,
        regions : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        template_body : String? = nil,
        template_url : String? = nil,
        use_previous_template : Bool? = nil
      ) : Types::UpdateStackSetOutput

        input = Types::UpdateStackSetInput.new(stack_set_name: stack_set_name, accounts: accounts, administration_role_arn: administration_role_arn, auto_deployment: auto_deployment, call_as: call_as, capabilities: capabilities, deployment_targets: deployment_targets, description: description, execution_role_name: execution_role_name, managed_execution: managed_execution, operation_id: operation_id, operation_preferences: operation_preferences, parameters: parameters, permission_model: permission_model, regions: regions, tags: tags, template_body: template_body, template_url: template_url, use_previous_template: use_previous_template)
        update_stack_set(input)
      end

      def update_stack_set(input : Types::UpdateStackSetInput) : Types::UpdateStackSetOutput
        request = Protocol::Query.build_request(Model::UPDATE_STACK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateStackSetOutput, "UpdateStackSet")
      end

      # Updates termination protection for the specified stack. If a user attempts to delete a stack with
      # termination protection enabled, the operation fails and the stack remains unchanged. For more
      # information, see Protect a CloudFormation stack from being deleted in the CloudFormation User Guide
      # . For nested stacks , termination protection is set on the root stack and can't be changed directly
      # on the nested stack.

      def update_termination_protection(
        enable_termination_protection : Bool,
        stack_name : String
      ) : Types::UpdateTerminationProtectionOutput

        input = Types::UpdateTerminationProtectionInput.new(enable_termination_protection: enable_termination_protection, stack_name: stack_name)
        update_termination_protection(input)
      end

      def update_termination_protection(input : Types::UpdateTerminationProtectionInput) : Types::UpdateTerminationProtectionOutput
        request = Protocol::Query.build_request(Model::UPDATE_TERMINATION_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateTerminationProtectionOutput, "UpdateTerminationProtection")
      end

      # Validates a specified template. CloudFormation first checks if the template is valid JSON. If it
      # isn't, CloudFormation checks if the template is valid YAML. If both these checks fail,
      # CloudFormation returns a template validation error.

      def validate_template(
        template_body : String? = nil,
        template_url : String? = nil
      ) : Types::ValidateTemplateOutput

        input = Types::ValidateTemplateInput.new(template_body: template_body, template_url: template_url)
        validate_template(input)
      end

      def validate_template(input : Types::ValidateTemplateInput) : Types::ValidateTemplateOutput
        request = Protocol::Query.build_request(Model::VALIDATE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ValidateTemplateOutput, "ValidateTemplate")
      end
    end
  end
end
