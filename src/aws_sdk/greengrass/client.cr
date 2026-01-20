module AwsSdk
  module Greengrass
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

      # Associates a role with a group. Your Greengrass core will use the role to access AWS cloud services.
      # The role's permissions should allow Greengrass core Lambda functions to perform actions against the
      # cloud.

      def associate_role_to_group(
        group_id : String,
        role_arn : String
      ) : Protocol::Request
        input = Types::AssociateRoleToGroupRequest.new(group_id: group_id, role_arn: role_arn)
        associate_role_to_group(input)
      end

      def associate_role_to_group(input : Types::AssociateRoleToGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ROLE_TO_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a role with your account. AWS IoT Greengrass will use the role to access your Lambda
      # functions and AWS IoT resources. This is necessary for deployments to succeed. The role must have at
      # least minimum permissions in the policy ''AWSGreengrassResourceAccessRolePolicy''.

      def associate_service_role_to_account(
        role_arn : String
      ) : Protocol::Request
        input = Types::AssociateServiceRoleToAccountRequest.new(role_arn: role_arn)
        associate_service_role_to_account(input)
      end

      def associate_service_role_to_account(input : Types::AssociateServiceRoleToAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SERVICE_ROLE_TO_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a connector definition. You may provide the initial version of the connector definition now
      # or use ''CreateConnectorDefinitionVersion'' at a later time.

      def create_connector_definition(
        amzn_client_token : String? = nil,
        initial_version : Types::ConnectorDefinitionVersion? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorDefinitionRequest.new(amzn_client_token: amzn_client_token, initial_version: initial_version, name: name, tags: tags)
        create_connector_definition(input)
      end

      def create_connector_definition(input : Types::CreateConnectorDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a connector definition which has already been defined.

      def create_connector_definition_version(
        connector_definition_id : String,
        amzn_client_token : String? = nil,
        connectors : Array(Types::Connector)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorDefinitionVersionRequest.new(connector_definition_id: connector_definition_id, amzn_client_token: amzn_client_token, connectors: connectors)
        create_connector_definition_version(input)
      end

      def create_connector_definition_version(input : Types::CreateConnectorDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a core definition. You may provide the initial version of the core definition now or use
      # ''CreateCoreDefinitionVersion'' at a later time. Greengrass groups must each contain exactly one
      # Greengrass core.

      def create_core_definition(
        amzn_client_token : String? = nil,
        initial_version : Types::CoreDefinitionVersion? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCoreDefinitionRequest.new(amzn_client_token: amzn_client_token, initial_version: initial_version, name: name, tags: tags)
        create_core_definition(input)
      end

      def create_core_definition(input : Types::CreateCoreDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CORE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a core definition that has already been defined. Greengrass groups must each
      # contain exactly one Greengrass core.

      def create_core_definition_version(
        core_definition_id : String,
        amzn_client_token : String? = nil,
        cores : Array(Types::Core)? = nil
      ) : Protocol::Request
        input = Types::CreateCoreDefinitionVersionRequest.new(core_definition_id: core_definition_id, amzn_client_token: amzn_client_token, cores: cores)
        create_core_definition_version(input)
      end

      def create_core_definition_version(input : Types::CreateCoreDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CORE_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a deployment. ''CreateDeployment'' requests are idempotent with respect to the
      # ''X-Amzn-Client-Token'' token and the request parameters.

      def create_deployment(
        deployment_type : String,
        group_id : String,
        amzn_client_token : String? = nil,
        deployment_id : String? = nil,
        group_version_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentRequest.new(deployment_type: deployment_type, group_id: group_id, amzn_client_token: amzn_client_token, deployment_id: deployment_id, group_version_id: group_version_id)
        create_deployment(input)
      end

      def create_deployment(input : Types::CreateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a device definition. You may provide the initial version of the device definition now or use
      # ''CreateDeviceDefinitionVersion'' at a later time.

      def create_device_definition(
        amzn_client_token : String? = nil,
        initial_version : Types::DeviceDefinitionVersion? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDeviceDefinitionRequest.new(amzn_client_token: amzn_client_token, initial_version: initial_version, name: name, tags: tags)
        create_device_definition(input)
      end

      def create_device_definition(input : Types::CreateDeviceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEVICE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a device definition that has already been defined.

      def create_device_definition_version(
        device_definition_id : String,
        amzn_client_token : String? = nil,
        devices : Array(Types::Device)? = nil
      ) : Protocol::Request
        input = Types::CreateDeviceDefinitionVersionRequest.new(device_definition_id: device_definition_id, amzn_client_token: amzn_client_token, devices: devices)
        create_device_definition_version(input)
      end

      def create_device_definition_version(input : Types::CreateDeviceDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEVICE_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Lambda function definition which contains a list of Lambda functions and their
      # configurations to be used in a group. You can create an initial version of the definition by
      # providing a list of Lambda functions and their configurations now, or use
      # ''CreateFunctionDefinitionVersion'' later.

      def create_function_definition(
        amzn_client_token : String? = nil,
        initial_version : Types::FunctionDefinitionVersion? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFunctionDefinitionRequest.new(amzn_client_token: amzn_client_token, initial_version: initial_version, name: name, tags: tags)
        create_function_definition(input)
      end

      def create_function_definition(input : Types::CreateFunctionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FUNCTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a Lambda function definition that has already been defined.

      def create_function_definition_version(
        function_definition_id : String,
        amzn_client_token : String? = nil,
        default_config : Types::FunctionDefaultConfig? = nil,
        functions : Array(Types::Function)? = nil
      ) : Protocol::Request
        input = Types::CreateFunctionDefinitionVersionRequest.new(function_definition_id: function_definition_id, amzn_client_token: amzn_client_token, default_config: default_config, functions: functions)
        create_function_definition_version(input)
      end

      def create_function_definition_version(input : Types::CreateFunctionDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FUNCTION_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a group. You may provide the initial version of the group or use ''CreateGroupVersion'' at a
      # later time. Tip: You can use the ''gg_group_setup'' package
      # (https://github.com/awslabs/aws-greengrass-group-setup) as a library or command-line application to
      # create and deploy Greengrass groups.

      def create_group(
        name : String,
        amzn_client_token : String? = nil,
        initial_version : Types::GroupVersion? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGroupRequest.new(name: name, amzn_client_token: amzn_client_token, initial_version: initial_version, tags: tags)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a CA for the group. If a CA already exists, it will rotate the existing CA.

      def create_group_certificate_authority(
        group_id : String,
        amzn_client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateGroupCertificateAuthorityRequest.new(group_id: group_id, amzn_client_token: amzn_client_token)
        create_group_certificate_authority(input)
      end

      def create_group_certificate_authority(input : Types::CreateGroupCertificateAuthorityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP_CERTIFICATE_AUTHORITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a group which has already been defined.

      def create_group_version(
        group_id : String,
        amzn_client_token : String? = nil,
        connector_definition_version_arn : String? = nil,
        core_definition_version_arn : String? = nil,
        device_definition_version_arn : String? = nil,
        function_definition_version_arn : String? = nil,
        logger_definition_version_arn : String? = nil,
        resource_definition_version_arn : String? = nil,
        subscription_definition_version_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateGroupVersionRequest.new(group_id: group_id, amzn_client_token: amzn_client_token, connector_definition_version_arn: connector_definition_version_arn, core_definition_version_arn: core_definition_version_arn, device_definition_version_arn: device_definition_version_arn, function_definition_version_arn: function_definition_version_arn, logger_definition_version_arn: logger_definition_version_arn, resource_definition_version_arn: resource_definition_version_arn, subscription_definition_version_arn: subscription_definition_version_arn)
        create_group_version(input)
      end

      def create_group_version(input : Types::CreateGroupVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a logger definition. You may provide the initial version of the logger definition now or use
      # ''CreateLoggerDefinitionVersion'' at a later time.

      def create_logger_definition(
        amzn_client_token : String? = nil,
        initial_version : Types::LoggerDefinitionVersion? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLoggerDefinitionRequest.new(amzn_client_token: amzn_client_token, initial_version: initial_version, name: name, tags: tags)
        create_logger_definition(input)
      end

      def create_logger_definition(input : Types::CreateLoggerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LOGGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a logger definition that has already been defined.

      def create_logger_definition_version(
        logger_definition_id : String,
        amzn_client_token : String? = nil,
        loggers : Array(Types::Logger)? = nil
      ) : Protocol::Request
        input = Types::CreateLoggerDefinitionVersionRequest.new(logger_definition_id: logger_definition_id, amzn_client_token: amzn_client_token, loggers: loggers)
        create_logger_definition_version(input)
      end

      def create_logger_definition_version(input : Types::CreateLoggerDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LOGGER_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a resource definition which contains a list of resources to be used in a group. You can
      # create an initial version of the definition by providing a list of resources now, or use
      # ''CreateResourceDefinitionVersion'' later.

      def create_resource_definition(
        amzn_client_token : String? = nil,
        initial_version : Types::ResourceDefinitionVersion? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateResourceDefinitionRequest.new(amzn_client_token: amzn_client_token, initial_version: initial_version, name: name, tags: tags)
        create_resource_definition(input)
      end

      def create_resource_definition(input : Types::CreateResourceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a resource definition that has already been defined.

      def create_resource_definition_version(
        resource_definition_id : String,
        amzn_client_token : String? = nil,
        resources : Array(Types::Resource)? = nil
      ) : Protocol::Request
        input = Types::CreateResourceDefinitionVersionRequest.new(resource_definition_id: resource_definition_id, amzn_client_token: amzn_client_token, resources: resources)
        create_resource_definition_version(input)
      end

      def create_resource_definition_version(input : Types::CreateResourceDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a software update for a core or group of cores (specified as an IoT thing group.) Use this
      # to update the OTA Agent as well as the Greengrass core software. It makes use of the IoT Jobs
      # feature which provides additional commands to manage a Greengrass core software update job.

      def create_software_update_job(
        s3_url_signer_role : String,
        software_to_update : String,
        update_targets : Array(String),
        update_targets_architecture : String,
        update_targets_operating_system : String,
        amzn_client_token : String? = nil,
        update_agent_log_level : String? = nil
      ) : Protocol::Request
        input = Types::CreateSoftwareUpdateJobRequest.new(s3_url_signer_role: s3_url_signer_role, software_to_update: software_to_update, update_targets: update_targets, update_targets_architecture: update_targets_architecture, update_targets_operating_system: update_targets_operating_system, amzn_client_token: amzn_client_token, update_agent_log_level: update_agent_log_level)
        create_software_update_job(input)
      end

      def create_software_update_job(input : Types::CreateSoftwareUpdateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOFTWARE_UPDATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a subscription definition. You may provide the initial version of the subscription
      # definition now or use ''CreateSubscriptionDefinitionVersion'' at a later time.

      def create_subscription_definition(
        amzn_client_token : String? = nil,
        initial_version : Types::SubscriptionDefinitionVersion? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSubscriptionDefinitionRequest.new(amzn_client_token: amzn_client_token, initial_version: initial_version, name: name, tags: tags)
        create_subscription_definition(input)
      end

      def create_subscription_definition(input : Types::CreateSubscriptionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIPTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of a subscription definition which has already been defined.

      def create_subscription_definition_version(
        subscription_definition_id : String,
        amzn_client_token : String? = nil,
        subscriptions : Array(Types::Subscription)? = nil
      ) : Protocol::Request
        input = Types::CreateSubscriptionDefinitionVersionRequest.new(subscription_definition_id: subscription_definition_id, amzn_client_token: amzn_client_token, subscriptions: subscriptions)
        create_subscription_definition_version(input)
      end

      def create_subscription_definition_version(input : Types::CreateSubscriptionDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIPTION_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a connector definition.

      def delete_connector_definition(
        connector_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteConnectorDefinitionRequest.new(connector_definition_id: connector_definition_id)
        delete_connector_definition(input)
      end

      def delete_connector_definition(input : Types::DeleteConnectorDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a core definition.

      def delete_core_definition(
        core_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteCoreDefinitionRequest.new(core_definition_id: core_definition_id)
        delete_core_definition(input)
      end

      def delete_core_definition(input : Types::DeleteCoreDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CORE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a device definition.

      def delete_device_definition(
        device_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteDeviceDefinitionRequest.new(device_definition_id: device_definition_id)
        delete_device_definition(input)
      end

      def delete_device_definition(input : Types::DeleteDeviceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEVICE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Lambda function definition.

      def delete_function_definition(
        function_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteFunctionDefinitionRequest.new(function_definition_id: function_definition_id)
        delete_function_definition(input)
      end

      def delete_function_definition(input : Types::DeleteFunctionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUNCTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a group.

      def delete_group(
        group_id : String
      ) : Protocol::Request
        input = Types::DeleteGroupRequest.new(group_id: group_id)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a logger definition.

      def delete_logger_definition(
        logger_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteLoggerDefinitionRequest.new(logger_definition_id: logger_definition_id)
        delete_logger_definition(input)
      end

      def delete_logger_definition(input : Types::DeleteLoggerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LOGGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource definition.

      def delete_resource_definition(
        resource_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteResourceDefinitionRequest.new(resource_definition_id: resource_definition_id)
        delete_resource_definition(input)
      end

      def delete_resource_definition(input : Types::DeleteResourceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a subscription definition.

      def delete_subscription_definition(
        subscription_definition_id : String
      ) : Protocol::Request
        input = Types::DeleteSubscriptionDefinitionRequest.new(subscription_definition_id: subscription_definition_id)
        delete_subscription_definition(input)
      end

      def delete_subscription_definition(input : Types::DeleteSubscriptionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUBSCRIPTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the role from a group.

      def disassociate_role_from_group(
        group_id : String
      ) : Protocol::Request
        input = Types::DisassociateRoleFromGroupRequest.new(group_id: group_id)
        disassociate_role_from_group(input)
      end

      def disassociate_role_from_group(input : Types::DisassociateRoleFromGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ROLE_FROM_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the service role from your account. Without a service role, deployments will not work.

      def disassociate_service_role_from_account : Protocol::Request
        input = Types::DisassociateServiceRoleFromAccountRequest.new
        disassociate_service_role_from_account(input)
      end

      def disassociate_service_role_from_account(input : Types::DisassociateServiceRoleFromAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SERVICE_ROLE_FROM_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the role associated with a particular group.

      def get_associated_role(
        group_id : String
      ) : Protocol::Request
        input = Types::GetAssociatedRoleRequest.new(group_id: group_id)
        get_associated_role(input)
      end

      def get_associated_role(input : Types::GetAssociatedRoleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSOCIATED_ROLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of a bulk deployment.

      def get_bulk_deployment_status(
        bulk_deployment_id : String
      ) : Protocol::Request
        input = Types::GetBulkDeploymentStatusRequest.new(bulk_deployment_id: bulk_deployment_id)
        get_bulk_deployment_status(input)
      end

      def get_bulk_deployment_status(input : Types::GetBulkDeploymentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BULK_DEPLOYMENT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the connectivity information for a core.

      def get_connectivity_info(
        thing_name : String
      ) : Protocol::Request
        input = Types::GetConnectivityInfoRequest.new(thing_name: thing_name)
        get_connectivity_info(input)
      end

      def get_connectivity_info(input : Types::GetConnectivityInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTIVITY_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a connector definition.

      def get_connector_definition(
        connector_definition_id : String
      ) : Protocol::Request
        input = Types::GetConnectorDefinitionRequest.new(connector_definition_id: connector_definition_id)
        get_connector_definition(input)
      end

      def get_connector_definition(input : Types::GetConnectorDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTOR_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a connector definition version, including the connectors that the
      # version contains. Connectors are prebuilt modules that interact with local infrastructure, device
      # protocols, AWS, and other cloud services.

      def get_connector_definition_version(
        connector_definition_id : String,
        connector_definition_version_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetConnectorDefinitionVersionRequest.new(connector_definition_id: connector_definition_id, connector_definition_version_id: connector_definition_version_id, next_token: next_token)
        get_connector_definition_version(input)
      end

      def get_connector_definition_version(input : Types::GetConnectorDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTOR_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a core definition version.

      def get_core_definition(
        core_definition_id : String
      ) : Protocol::Request
        input = Types::GetCoreDefinitionRequest.new(core_definition_id: core_definition_id)
        get_core_definition(input)
      end

      def get_core_definition(input : Types::GetCoreDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CORE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a core definition version.

      def get_core_definition_version(
        core_definition_id : String,
        core_definition_version_id : String
      ) : Protocol::Request
        input = Types::GetCoreDefinitionVersionRequest.new(core_definition_id: core_definition_id, core_definition_version_id: core_definition_version_id)
        get_core_definition_version(input)
      end

      def get_core_definition_version(input : Types::GetCoreDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CORE_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of a deployment.

      def get_deployment_status(
        deployment_id : String,
        group_id : String
      ) : Protocol::Request
        input = Types::GetDeploymentStatusRequest.new(deployment_id: deployment_id, group_id: group_id)
        get_deployment_status(input)
      end

      def get_deployment_status(input : Types::GetDeploymentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a device definition.

      def get_device_definition(
        device_definition_id : String
      ) : Protocol::Request
        input = Types::GetDeviceDefinitionRequest.new(device_definition_id: device_definition_id)
        get_device_definition(input)
      end

      def get_device_definition(input : Types::GetDeviceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a device definition version.

      def get_device_definition_version(
        device_definition_id : String,
        device_definition_version_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetDeviceDefinitionVersionRequest.new(device_definition_id: device_definition_id, device_definition_version_id: device_definition_version_id, next_token: next_token)
        get_device_definition_version(input)
      end

      def get_device_definition_version(input : Types::GetDeviceDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a Lambda function definition, including its creation time and latest
      # version.

      def get_function_definition(
        function_definition_id : String
      ) : Protocol::Request
        input = Types::GetFunctionDefinitionRequest.new(function_definition_id: function_definition_id)
        get_function_definition(input)
      end

      def get_function_definition(input : Types::GetFunctionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a Lambda function definition version, including which Lambda functions
      # are included in the version and their configurations.

      def get_function_definition_version(
        function_definition_id : String,
        function_definition_version_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetFunctionDefinitionVersionRequest.new(function_definition_id: function_definition_id, function_definition_version_id: function_definition_version_id, next_token: next_token)
        get_function_definition_version(input)
      end

      def get_function_definition_version(input : Types::GetFunctionDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a group.

      def get_group(
        group_id : String
      ) : Protocol::Request
        input = Types::GetGroupRequest.new(group_id: group_id)
        get_group(input)
      end

      def get_group(input : Types::GetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retreives the CA associated with a group. Returns the public key of the CA.

      def get_group_certificate_authority(
        certificate_authority_id : String,
        group_id : String
      ) : Protocol::Request
        input = Types::GetGroupCertificateAuthorityRequest.new(certificate_authority_id: certificate_authority_id, group_id: group_id)
        get_group_certificate_authority(input)
      end

      def get_group_certificate_authority(input : Types::GetGroupCertificateAuthorityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP_CERTIFICATE_AUTHORITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current configuration for the CA used by the group.

      def get_group_certificate_configuration(
        group_id : String
      ) : Protocol::Request
        input = Types::GetGroupCertificateConfigurationRequest.new(group_id: group_id)
        get_group_certificate_configuration(input)
      end

      def get_group_certificate_configuration(input : Types::GetGroupCertificateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP_CERTIFICATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a group version.

      def get_group_version(
        group_id : String,
        group_version_id : String
      ) : Protocol::Request
        input = Types::GetGroupVersionRequest.new(group_id: group_id, group_version_id: group_version_id)
        get_group_version(input)
      end

      def get_group_version(input : Types::GetGroupVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a logger definition.

      def get_logger_definition(
        logger_definition_id : String
      ) : Protocol::Request
        input = Types::GetLoggerDefinitionRequest.new(logger_definition_id: logger_definition_id)
        get_logger_definition(input)
      end

      def get_logger_definition(input : Types::GetLoggerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LOGGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a logger definition version.

      def get_logger_definition_version(
        logger_definition_id : String,
        logger_definition_version_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetLoggerDefinitionVersionRequest.new(logger_definition_id: logger_definition_id, logger_definition_version_id: logger_definition_version_id, next_token: next_token)
        get_logger_definition_version(input)
      end

      def get_logger_definition_version(input : Types::GetLoggerDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LOGGER_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a resource definition, including its creation time and latest version.

      def get_resource_definition(
        resource_definition_id : String
      ) : Protocol::Request
        input = Types::GetResourceDefinitionRequest.new(resource_definition_id: resource_definition_id)
        get_resource_definition(input)
      end

      def get_resource_definition(input : Types::GetResourceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a resource definition version, including which resources are included in
      # the version.

      def get_resource_definition_version(
        resource_definition_id : String,
        resource_definition_version_id : String
      ) : Protocol::Request
        input = Types::GetResourceDefinitionVersionRequest.new(resource_definition_id: resource_definition_id, resource_definition_version_id: resource_definition_version_id)
        get_resource_definition_version(input)
      end

      def get_resource_definition_version(input : Types::GetResourceDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the service role that is attached to your account.

      def get_service_role_for_account : Protocol::Request
        input = Types::GetServiceRoleForAccountRequest.new
        get_service_role_for_account(input)
      end

      def get_service_role_for_account(input : Types::GetServiceRoleForAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_ROLE_FOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a subscription definition.

      def get_subscription_definition(
        subscription_definition_id : String
      ) : Protocol::Request
        input = Types::GetSubscriptionDefinitionRequest.new(subscription_definition_id: subscription_definition_id)
        get_subscription_definition(input)
      end

      def get_subscription_definition(input : Types::GetSubscriptionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIPTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a subscription definition version.

      def get_subscription_definition_version(
        subscription_definition_id : String,
        subscription_definition_version_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetSubscriptionDefinitionVersionRequest.new(subscription_definition_id: subscription_definition_id, subscription_definition_version_id: subscription_definition_version_id, next_token: next_token)
        get_subscription_definition_version(input)
      end

      def get_subscription_definition_version(input : Types::GetSubscriptionDefinitionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIPTION_DEFINITION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the runtime configuration of a thing.

      def get_thing_runtime_configuration(
        thing_name : String
      ) : Protocol::Request
        input = Types::GetThingRuntimeConfigurationRequest.new(thing_name: thing_name)
        get_thing_runtime_configuration(input)
      end

      def get_thing_runtime_configuration(input : Types::GetThingRuntimeConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_THING_RUNTIME_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a paginated list of the deployments that have been started in a bulk deployment operation, and
      # their current deployment status.

      def list_bulk_deployment_detailed_reports(
        bulk_deployment_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBulkDeploymentDetailedReportsRequest.new(bulk_deployment_id: bulk_deployment_id, max_results: max_results, next_token: next_token)
        list_bulk_deployment_detailed_reports(input)
      end

      def list_bulk_deployment_detailed_reports(input : Types::ListBulkDeploymentDetailedReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BULK_DEPLOYMENT_DETAILED_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of bulk deployments.

      def list_bulk_deployments(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBulkDeploymentsRequest.new(max_results: max_results, next_token: next_token)
        list_bulk_deployments(input)
      end

      def list_bulk_deployments(input : Types::ListBulkDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BULK_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a connector definition, which are containers for connectors. Connectors run on
      # the Greengrass core and contain built-in integration with local infrastructure, device protocols,
      # AWS, and other cloud services.

      def list_connector_definition_versions(
        connector_definition_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorDefinitionVersionsRequest.new(connector_definition_id: connector_definition_id, max_results: max_results, next_token: next_token)
        list_connector_definition_versions(input)
      end

      def list_connector_definition_versions(input : Types::ListConnectorDefinitionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTOR_DEFINITION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of connector definitions.

      def list_connector_definitions(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_connector_definitions(input)
      end

      def list_connector_definitions(input : Types::ListConnectorDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTOR_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a core definition.

      def list_core_definition_versions(
        core_definition_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCoreDefinitionVersionsRequest.new(core_definition_id: core_definition_id, max_results: max_results, next_token: next_token)
        list_core_definition_versions(input)
      end

      def list_core_definition_versions(input : Types::ListCoreDefinitionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CORE_DEFINITION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of core definitions.

      def list_core_definitions(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCoreDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_core_definitions(input)
      end

      def list_core_definitions(input : Types::ListCoreDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CORE_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a history of deployments for the group.

      def list_deployments(
        group_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentsRequest.new(group_id: group_id, max_results: max_results, next_token: next_token)
        list_deployments(input)
      end

      def list_deployments(input : Types::ListDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a device definition.

      def list_device_definition_versions(
        device_definition_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeviceDefinitionVersionsRequest.new(device_definition_id: device_definition_id, max_results: max_results, next_token: next_token)
        list_device_definition_versions(input)
      end

      def list_device_definition_versions(input : Types::ListDeviceDefinitionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICE_DEFINITION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of device definitions.

      def list_device_definitions(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeviceDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_device_definitions(input)
      end

      def list_device_definitions(input : Types::ListDeviceDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICE_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a Lambda function definition.

      def list_function_definition_versions(
        function_definition_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFunctionDefinitionVersionsRequest.new(function_definition_id: function_definition_id, max_results: max_results, next_token: next_token)
        list_function_definition_versions(input)
      end

      def list_function_definition_versions(input : Types::ListFunctionDefinitionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTION_DEFINITION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of Lambda function definitions.

      def list_function_definitions(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFunctionDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_function_definitions(input)
      end

      def list_function_definitions(input : Types::ListFunctionDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTION_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current CAs for a group.

      def list_group_certificate_authorities(
        group_id : String
      ) : Protocol::Request
        input = Types::ListGroupCertificateAuthoritiesRequest.new(group_id: group_id)
        list_group_certificate_authorities(input)
      end

      def list_group_certificate_authorities(input : Types::ListGroupCertificateAuthoritiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUP_CERTIFICATE_AUTHORITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a group.

      def list_group_versions(
        group_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupVersionsRequest.new(group_id: group_id, max_results: max_results, next_token: next_token)
        list_group_versions(input)
      end

      def list_group_versions(input : Types::ListGroupVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUP_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of groups.

      def list_groups(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a logger definition.

      def list_logger_definition_versions(
        logger_definition_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLoggerDefinitionVersionsRequest.new(logger_definition_id: logger_definition_id, max_results: max_results, next_token: next_token)
        list_logger_definition_versions(input)
      end

      def list_logger_definition_versions(input : Types::ListLoggerDefinitionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LOGGER_DEFINITION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of logger definitions.

      def list_logger_definitions(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLoggerDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_logger_definitions(input)
      end

      def list_logger_definitions(input : Types::ListLoggerDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LOGGER_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a resource definition.

      def list_resource_definition_versions(
        resource_definition_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceDefinitionVersionsRequest.new(resource_definition_id: resource_definition_id, max_results: max_results, next_token: next_token)
        list_resource_definition_versions(input)
      end

      def list_resource_definition_versions(input : Types::ListResourceDefinitionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_DEFINITION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of resource definitions.

      def list_resource_definitions(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_resource_definitions(input)
      end

      def list_resource_definitions(input : Types::ListResourceDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of a subscription definition.

      def list_subscription_definition_versions(
        subscription_definition_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscriptionDefinitionVersionsRequest.new(subscription_definition_id: subscription_definition_id, max_results: max_results, next_token: next_token)
        list_subscription_definition_versions(input)
      end

      def list_subscription_definition_versions(input : Types::ListSubscriptionDefinitionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIPTION_DEFINITION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of subscription definitions.

      def list_subscription_definitions(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscriptionDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_subscription_definitions(input)
      end

      def list_subscription_definitions(input : Types::ListSubscriptionDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIPTION_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of resource tags for a resource arn.

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

      # Resets a group's deployments.

      def reset_deployments(
        group_id : String,
        amzn_client_token : String? = nil,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::ResetDeploymentsRequest.new(group_id: group_id, amzn_client_token: amzn_client_token, force: force)
        reset_deployments(input)
      end

      def reset_deployments(input : Types::ResetDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deploys multiple groups in one operation. This action starts the bulk deployment of a specified set
      # of group versions. Each group version deployment will be triggered with an adaptive rate that has a
      # fixed upper limit. We recommend that you include an ''X-Amzn-Client-Token'' token in every
      # ''StartBulkDeployment'' request. These requests are idempotent with respect to the token and the
      # request parameters.

      def start_bulk_deployment(
        execution_role_arn : String,
        input_file_uri : String,
        amzn_client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartBulkDeploymentRequest.new(execution_role_arn: execution_role_arn, input_file_uri: input_file_uri, amzn_client_token: amzn_client_token, tags: tags)
        start_bulk_deployment(input)
      end

      def start_bulk_deployment(input : Types::StartBulkDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BULK_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the execution of a bulk deployment. This action returns a status of ''Stopping'' until the
      # deployment is stopped. You cannot start a new bulk deployment while a previous deployment is in the
      # ''Stopping'' state. This action doesn't rollback completed deployments or cancel pending
      # deployments.

      def stop_bulk_deployment(
        bulk_deployment_id : String
      ) : Protocol::Request
        input = Types::StopBulkDeploymentRequest.new(bulk_deployment_id: bulk_deployment_id)
        stop_bulk_deployment(input)
      end

      def stop_bulk_deployment(input : Types::StopBulkDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_BULK_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a Greengrass resource. Valid resources are 'Group', 'ConnectorDefinition',
      # 'CoreDefinition', 'DeviceDefinition', 'FunctionDefinition', 'LoggerDefinition',
      # 'SubscriptionDefinition', 'ResourceDefinition', and 'BulkDeployment'.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove resource tags from a Greengrass Resource.

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

      # Updates the connectivity information for the core. Any devices that belong to the group which has
      # this core will receive this information in order to find the location of the core and connect to it.

      def update_connectivity_info(
        thing_name : String,
        connectivity_info : Array(Types::ConnectivityInfo)? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectivityInfoRequest.new(thing_name: thing_name, connectivity_info: connectivity_info)
        update_connectivity_info(input)
      end

      def update_connectivity_info(input : Types::UpdateConnectivityInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTIVITY_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a connector definition.

      def update_connector_definition(
        connector_definition_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectorDefinitionRequest.new(connector_definition_id: connector_definition_id, name: name)
        update_connector_definition(input)
      end

      def update_connector_definition(input : Types::UpdateConnectorDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTOR_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a core definition.

      def update_core_definition(
        core_definition_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCoreDefinitionRequest.new(core_definition_id: core_definition_id, name: name)
        update_core_definition(input)
      end

      def update_core_definition(input : Types::UpdateCoreDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CORE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a device definition.

      def update_device_definition(
        device_definition_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeviceDefinitionRequest.new(device_definition_id: device_definition_id, name: name)
        update_device_definition(input)
      end

      def update_device_definition(input : Types::UpdateDeviceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEVICE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Lambda function definition.

      def update_function_definition(
        function_definition_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFunctionDefinitionRequest.new(function_definition_id: function_definition_id, name: name)
        update_function_definition(input)
      end

      def update_function_definition(input : Types::UpdateFunctionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FUNCTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a group.

      def update_group(
        group_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGroupRequest.new(group_id: group_id, name: name)
        update_group(input)
      end

      def update_group(input : Types::UpdateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Certificate expiry time for a group.

      def update_group_certificate_configuration(
        group_id : String,
        certificate_expiry_in_milliseconds : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGroupCertificateConfigurationRequest.new(group_id: group_id, certificate_expiry_in_milliseconds: certificate_expiry_in_milliseconds)
        update_group_certificate_configuration(input)
      end

      def update_group_certificate_configuration(input : Types::UpdateGroupCertificateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP_CERTIFICATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a logger definition.

      def update_logger_definition(
        logger_definition_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLoggerDefinitionRequest.new(logger_definition_id: logger_definition_id, name: name)
        update_logger_definition(input)
      end

      def update_logger_definition(input : Types::UpdateLoggerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LOGGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a resource definition.

      def update_resource_definition(
        resource_definition_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceDefinitionRequest.new(resource_definition_id: resource_definition_id, name: name)
        update_resource_definition(input)
      end

      def update_resource_definition(input : Types::UpdateResourceDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a subscription definition.

      def update_subscription_definition(
        subscription_definition_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSubscriptionDefinitionRequest.new(subscription_definition_id: subscription_definition_id, name: name)
        update_subscription_definition(input)
      end

      def update_subscription_definition(input : Types::UpdateSubscriptionDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUBSCRIPTION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the runtime configuration of a thing.

      def update_thing_runtime_configuration(
        thing_name : String,
        telemetry_configuration : Types::TelemetryConfigurationUpdate? = nil
      ) : Protocol::Request
        input = Types::UpdateThingRuntimeConfigurationRequest.new(thing_name: thing_name, telemetry_configuration: telemetry_configuration)
        update_thing_runtime_configuration(input)
      end

      def update_thing_runtime_configuration(input : Types::UpdateThingRuntimeConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THING_RUNTIME_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
