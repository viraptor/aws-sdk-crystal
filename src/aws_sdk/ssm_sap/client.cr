module AwsSdk
  module SsmSap
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

      # Removes permissions associated with the target database.
      def delete_resource_permission(
        resource_arn : String,
        action_type : String? = nil,
        source_resource_arn : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourcePermissionInput.new(resource_arn: resource_arn, action_type: action_type, source_resource_arn: source_resource_arn)
        delete_resource_permission(input)
      end
      def delete_resource_permission(input : Types::DeleteResourcePermissionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregister an SAP application with AWS Systems Manager for SAP. This action does not aﬀect the
      # existing setup of your SAP workloads on Amazon EC2.
      def deregister_application(
        application_id : String
      ) : Protocol::Request
        input = Types::DeregisterApplicationInput.new(application_id: application_id)
        deregister_application(input)
      end
      def deregister_application(input : Types::DeregisterApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an application registered with AWS Systems Manager for SAP. It also returns the components of
      # the application.
      def get_application(
        app_registry_arn : String? = nil,
        application_arn : String? = nil,
        application_id : String? = nil
      ) : Protocol::Request
        input = Types::GetApplicationInput.new(app_registry_arn: app_registry_arn, application_arn: application_arn, application_id: application_id)
        get_application(input)
      end
      def get_application(input : Types::GetApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the component of an application registered with AWS Systems Manager for SAP.
      def get_component(
        application_id : String,
        component_id : String
      ) : Protocol::Request
        input = Types::GetComponentInput.new(application_id: application_id, component_id: component_id)
        get_component(input)
      end
      def get_component(input : Types::GetComponentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a configuration check operation by specifying the operation ID.
      def get_configuration_check_operation(
        operation_id : String
      ) : Protocol::Request
        input = Types::GetConfigurationCheckOperationInput.new(operation_id: operation_id)
        get_configuration_check_operation(input)
      end
      def get_configuration_check_operation(input : Types::GetConfigurationCheckOperationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_CHECK_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the SAP HANA database of an application registered with AWS Systems Manager for SAP.
      def get_database(
        application_id : String? = nil,
        component_id : String? = nil,
        database_arn : String? = nil,
        database_id : String? = nil
      ) : Protocol::Request
        input = Types::GetDatabaseInput.new(application_id: application_id, component_id: component_id, database_arn: database_arn, database_id: database_id)
        get_database(input)
      end
      def get_database(input : Types::GetDatabaseInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATABASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of an operation by specifying the operation ID.
      def get_operation(
        operation_id : String
      ) : Protocol::Request
        input = Types::GetOperationInput.new(operation_id: operation_id)
        get_operation(input)
      end
      def get_operation(input : Types::GetOperationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets permissions associated with the target database.
      def get_resource_permission(
        resource_arn : String,
        action_type : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcePermissionInput.new(resource_arn: resource_arn, action_type: action_type)
        get_resource_permission(input)
      end
      def get_resource_permission(input : Types::GetResourcePermissionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the applications registered with AWS Systems Manager for SAP.
      def list_applications(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsInput.new(filters: filters, max_results: max_results, next_token: next_token)
        list_applications(input)
      end
      def list_applications(input : Types::ListApplicationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the components registered with AWS Systems Manager for SAP.
      def list_components(
        application_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentsInput.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_components(input)
      end
      def list_components(input : Types::ListComponentsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all configuration check types supported by AWS Systems Manager for SAP.
      def list_configuration_check_definitions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationCheckDefinitionsInput.new(max_results: max_results, next_token: next_token)
        list_configuration_check_definitions(input)
      end
      def list_configuration_check_definitions(input : Types::ListConfigurationCheckDefinitionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_CHECK_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the configuration check operations performed by AWS Systems Manager for SAP.
      def list_configuration_check_operations(
        application_id : String,
        filters : Array(Types::Filter)? = nil,
        list_mode : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationCheckOperationsInput.new(application_id: application_id, filters: filters, list_mode: list_mode, max_results: max_results, next_token: next_token)
        list_configuration_check_operations(input)
      end
      def list_configuration_check_operations(input : Types::ListConfigurationCheckOperationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_CHECK_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the SAP HANA databases of an application registered with AWS Systems Manager for SAP.
      def list_databases(
        application_id : String? = nil,
        component_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatabasesInput.new(application_id: application_id, component_id: component_id, max_results: max_results, next_token: next_token)
        list_databases(input)
      end
      def list_databases(input : Types::ListDatabasesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATABASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of operations events. Available parameters include OperationID , as well as optional
      # parameters MaxResults , NextToken , and Filters .
      def list_operation_events(
        operation_id : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOperationEventsInput.new(operation_id: operation_id, filters: filters, max_results: max_results, next_token: next_token)
        list_operation_events(input)
      end
      def list_operation_events(input : Types::ListOperationEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OPERATION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the operations performed by AWS Systems Manager for SAP.
      def list_operations(
        application_id : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOperationsInput.new(application_id: application_id, filters: filters, max_results: max_results, next_token: next_token)
        list_operations(input)
      end
      def list_operations(input : Types::ListOperationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the sub-check results of a specified configuration check operation.
      def list_sub_check_results(
        operation_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubCheckResultsInput.new(operation_id: operation_id, max_results: max_results, next_token: next_token)
        list_sub_check_results(input)
      end
      def list_sub_check_results(input : Types::ListSubCheckResultsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUB_CHECK_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the rules of a specified sub-check belonging to a configuration check operation.
      def list_sub_check_rule_results(
        sub_check_result_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubCheckRuleResultsInput.new(sub_check_result_id: sub_check_result_id, max_results: max_results, next_token: next_token)
        list_sub_check_rule_results(input)
      end
      def list_sub_check_rule_results(input : Types::ListSubCheckRuleResultsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUB_CHECK_RULE_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags on an SAP HANA application and/or database registered with AWS Systems Manager for
      # SAP.
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

      # Adds permissions to the target database.
      def put_resource_permission(
        action_type : String,
        resource_arn : String,
        source_resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePermissionInput.new(action_type: action_type, resource_arn: resource_arn, source_resource_arn: source_resource_arn)
        put_resource_permission(input)
      end
      def put_resource_permission(input : Types::PutResourcePermissionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Register an SAP application with AWS Systems Manager for SAP. You must meet the following
      # requirements before registering. The SAP application you want to register with AWS Systems Manager
      # for SAP is running on Amazon EC2. AWS Systems Manager Agent must be setup on an Amazon EC2 instance
      # along with the required IAM permissions. Amazon EC2 instance(s) must have access to the secrets
      # created in AWS Secrets Manager to manage SAP applications and components.
      def register_application(
        application_id : String,
        application_type : String,
        instances : Array(String),
        components_info : Array(Types::ComponentInfo)? = nil,
        credentials : Array(Types::ApplicationCredential)? = nil,
        database_arn : String? = nil,
        sap_instance_number : String? = nil,
        sid : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::RegisterApplicationInput.new(application_id: application_id, application_type: application_type, instances: instances, components_info: components_info, credentials: credentials, database_arn: database_arn, sap_instance_number: sap_instance_number, sid: sid, tags: tags)
        register_application(input)
      end
      def register_application(input : Types::RegisterApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Request is an operation which starts an application. Parameter ApplicationId is required.
      def start_application(
        application_id : String
      ) : Protocol::Request
        input = Types::StartApplicationInput.new(application_id: application_id)
        start_application(input)
      end
      def start_application(input : Types::StartApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Refreshes a registered application.
      def start_application_refresh(
        application_id : String
      ) : Protocol::Request
        input = Types::StartApplicationRefreshInput.new(application_id: application_id)
        start_application_refresh(input)
      end
      def start_application_refresh(input : Types::StartApplicationRefreshInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_APPLICATION_REFRESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates configuration check operations against a specified application.
      def start_configuration_checks(
        application_id : String,
        configuration_check_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::StartConfigurationChecksInput.new(application_id: application_id, configuration_check_ids: configuration_check_ids)
        start_configuration_checks(input)
      end
      def start_configuration_checks(input : Types::StartConfigurationChecksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONFIGURATION_CHECKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Request is an operation to stop an application. Parameter ApplicationId is required. Parameters
      # StopConnectedEntity and IncludeEc2InstanceShutdown are optional.
      def stop_application(
        application_id : String,
        include_ec2_instance_shutdown : Bool? = nil,
        stop_connected_entity : String? = nil
      ) : Protocol::Request
        input = Types::StopApplicationInput.new(application_id: application_id, include_ec2_instance_shutdown: include_ec2_instance_shutdown, stop_connected_entity: stop_connected_entity)
        stop_application(input)
      end
      def stop_application(input : Types::StopApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates tag for a resource by specifying the ARN.
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

      # Delete the tags for a resource.
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

      # Updates the settings of an application registered with AWS Systems Manager for SAP.
      def update_application_settings(
        application_id : String,
        backint : Types::BackintConfig? = nil,
        credentials_to_add_or_update : Array(Types::ApplicationCredential)? = nil,
        credentials_to_remove : Array(Types::ApplicationCredential)? = nil,
        database_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationSettingsInput.new(application_id: application_id, backint: backint, credentials_to_add_or_update: credentials_to_add_or_update, credentials_to_remove: credentials_to_remove, database_arn: database_arn)
        update_application_settings(input)
      end
      def update_application_settings(input : Types::UpdateApplicationSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
