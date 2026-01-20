module AwsSdk
  module AppConfig
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

      # Creates an application. In AppConfig, an application is simply an organizational construct like a
      # folder. This organizational construct has a relationship with some unit of executable code. For
      # example, you could create an application called MyMobileApp to organize and manage configuration
      # data for a mobile application installed by your users.

      def create_application(
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(name: name, description: description, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a configuration profile, which is information that enables AppConfig to access the
      # configuration source. Valid configuration sources include the following: Configuration data in YAML,
      # JSON, and other formats stored in the AppConfig hosted configuration store Configuration data stored
      # as objects in an Amazon Simple Storage Service (Amazon S3) bucket Pipelines stored in CodePipeline
      # Secrets stored in Secrets Manager Standard and secure string parameters stored in Amazon Web
      # Services Systems Manager Parameter Store Configuration data in SSM documents stored in the Systems
      # Manager document store A configuration profile includes the following information: The URI location
      # of the configuration data. The Identity and Access Management (IAM) role that provides access to the
      # configuration data. A validator for the configuration data. Available validators include either a
      # JSON Schema or an Amazon Web Services Lambda function. For more information, see Create a
      # Configuration and a Configuration Profile in the AppConfig User Guide .

      def create_configuration_profile(
        application_id : String,
        location_uri : String,
        name : String,
        description : String? = nil,
        kms_key_identifier : String? = nil,
        retrieval_role_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        type : String? = nil,
        validators : Array(Types::Validator)? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationProfileRequest.new(application_id: application_id, location_uri: location_uri, name: name, description: description, kms_key_identifier: kms_key_identifier, retrieval_role_arn: retrieval_role_arn, tags: tags, type: type, validators: validators)
        create_configuration_profile(input)
      end

      def create_configuration_profile(input : Types::CreateConfigurationProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a deployment strategy that defines important criteria for rolling out your configuration to
      # the designated targets. A deployment strategy includes the overall duration required, a percentage
      # of targets to receive the deployment during each interval, an algorithm that defines how percentage
      # grows, and bake time.

      def create_deployment_strategy(
        deployment_duration_in_minutes : Int32,
        growth_factor : Float64,
        name : String,
        description : String? = nil,
        final_bake_time_in_minutes : Int32? = nil,
        growth_type : String? = nil,
        replicate_to : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentStrategyRequest.new(deployment_duration_in_minutes: deployment_duration_in_minutes, growth_factor: growth_factor, name: name, description: description, final_bake_time_in_minutes: final_bake_time_in_minutes, growth_type: growth_type, replicate_to: replicate_to, tags: tags)
        create_deployment_strategy(input)
      end

      def create_deployment_strategy(input : Types::CreateDeploymentStrategyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT_STRATEGY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an environment. For each application, you define one or more environments. An environment is
      # a deployment group of AppConfig targets, such as applications in a Beta or Production environment.
      # You can also define environments for application subcomponents such as the Web , Mobile and Back-end
      # components for your application. You can configure Amazon CloudWatch alarms for each environment.
      # The system monitors alarms during a configuration deployment. If an alarm is triggered, the system
      # rolls back the configuration.

      def create_environment(
        application_id : String,
        name : String,
        description : String? = nil,
        monitors : Array(Types::Monitor)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentRequest.new(application_id: application_id, name: name, description: description, monitors: monitors, tags: tags)
        create_environment(input)
      end

      def create_environment(input : Types::CreateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AppConfig extension. An extension augments your ability to inject logic or behavior at
      # different points during the AppConfig workflow of creating or deploying a configuration. You can
      # create your own extensions or use the Amazon Web Services authored extensions provided by AppConfig.
      # For an AppConfig extension that uses Lambda, you must create a Lambda function to perform any
      # computation and processing defined in the extension. If you plan to create custom versions of the
      # Amazon Web Services authored notification extensions, you only need to specify an Amazon Resource
      # Name (ARN) in the Uri field for the new extension version. For a custom EventBridge notification
      # extension, enter the ARN of the EventBridge default events in the Uri field. For a custom Amazon SNS
      # notification extension, enter the ARN of an Amazon SNS topic in the Uri field. For a custom Amazon
      # SQS notification extension, enter the ARN of an Amazon SQS message queue in the Uri field. For more
      # information about extensions, see Extending workflows in the AppConfig User Guide .

      def create_extension(
        actions : Hash(String, Array(Types::Action)),
        name : String,
        description : String? = nil,
        latest_version_number : Int32? = nil,
        parameters : Hash(String, Types::Parameter)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateExtensionRequest.new(actions: actions, name: name, description: description, latest_version_number: latest_version_number, parameters: parameters, tags: tags)
        create_extension(input)
      end

      def create_extension(input : Types::CreateExtensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXTENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you create an extension or configure an Amazon Web Services authored extension, you associate
      # the extension with an AppConfig application, environment, or configuration profile. For example, you
      # can choose to run the AppConfig deployment events to Amazon SNS Amazon Web Services authored
      # extension and receive notifications on an Amazon SNS topic anytime a configuration deployment is
      # started for a specific application. Defining which extension to associate with an AppConfig resource
      # is called an extension association . An extension association is a specified relationship between an
      # extension and an AppConfig resource, such as an application or a configuration profile. For more
      # information about extensions and associations, see Extending workflows in the AppConfig User Guide .

      def create_extension_association(
        extension_identifier : String,
        resource_identifier : String,
        extension_version_number : Int32? = nil,
        parameters : Hash(String, String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateExtensionAssociationRequest.new(extension_identifier: extension_identifier, resource_identifier: resource_identifier, extension_version_number: extension_version_number, parameters: parameters, tags: tags)
        create_extension_association(input)
      end

      def create_extension_association(input : Types::CreateExtensionAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXTENSION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new configuration in the AppConfig hosted configuration store. If you're creating a
      # feature flag, we recommend you familiarize yourself with the JSON schema for feature flag data. For
      # more information, see Type reference for AWS.AppConfig.FeatureFlags in the AppConfig User Guide .

      def create_hosted_configuration_version(
        application_id : String,
        configuration_profile_id : String,
        content : Bytes,
        content_type : String,
        description : String? = nil,
        latest_version_number : Int32? = nil,
        version_label : String? = nil
      ) : Protocol::Request
        input = Types::CreateHostedConfigurationVersionRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, content: content, content_type: content_type, description: description, latest_version_number: latest_version_number, version_label: version_label)
        create_hosted_configuration_version(input)
      end

      def create_hosted_configuration_version(input : Types::CreateHostedConfigurationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_HOSTED_CONFIGURATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an application.

      def delete_application(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application_id: application_id)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configuration profile. To prevent users from unintentionally deleting actively-used
      # configuration profiles, enable deletion protection .

      def delete_configuration_profile(
        application_id : String,
        configuration_profile_id : String,
        deletion_protection_check : String? = nil
      ) : Protocol::Request
        input = Types::DeleteConfigurationProfileRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, deletion_protection_check: deletion_protection_check)
        delete_configuration_profile(input)
      end

      def delete_configuration_profile(input : Types::DeleteConfigurationProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a deployment strategy.

      def delete_deployment_strategy(
        deployment_strategy_id : String
      ) : Protocol::Request
        input = Types::DeleteDeploymentStrategyRequest.new(deployment_strategy_id: deployment_strategy_id)
        delete_deployment_strategy(input)
      end

      def delete_deployment_strategy(input : Types::DeleteDeploymentStrategyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEPLOYMENT_STRATEGY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an environment. To prevent users from unintentionally deleting actively-used environments,
      # enable deletion protection .

      def delete_environment(
        application_id : String,
        environment_id : String,
        deletion_protection_check : String? = nil
      ) : Protocol::Request
        input = Types::DeleteEnvironmentRequest.new(application_id: application_id, environment_id: environment_id, deletion_protection_check: deletion_protection_check)
        delete_environment(input)
      end

      def delete_environment(input : Types::DeleteEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an AppConfig extension. You must delete all associations to an extension before you delete
      # the extension.

      def delete_extension(
        extension_identifier : String,
        version_number : Int32? = nil
      ) : Protocol::Request
        input = Types::DeleteExtensionRequest.new(extension_identifier: extension_identifier, version_number: version_number)
        delete_extension(input)
      end

      def delete_extension(input : Types::DeleteExtensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EXTENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an extension association. This action doesn't delete extensions defined in the association.

      def delete_extension_association(
        extension_association_id : String
      ) : Protocol::Request
        input = Types::DeleteExtensionAssociationRequest.new(extension_association_id: extension_association_id)
        delete_extension_association(input)
      end

      def delete_extension_association(input : Types::DeleteExtensionAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EXTENSION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a version of a configuration from the AppConfig hosted configuration store.

      def delete_hosted_configuration_version(
        application_id : String,
        configuration_profile_id : String,
        version_number : Int32
      ) : Protocol::Request
        input = Types::DeleteHostedConfigurationVersionRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, version_number: version_number)
        delete_hosted_configuration_version(input)
      end

      def delete_hosted_configuration_version(input : Types::DeleteHostedConfigurationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_HOSTED_CONFIGURATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the status of the DeletionProtection parameter.


      def get_account_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an application.

      def get_application(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(application_id: application_id)
        get_application(input)
      end

      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # (Deprecated) Retrieves the latest deployed configuration. Note the following important information.
      # This API action is deprecated. Calls to receive configuration data should use the
      # StartConfigurationSession and GetLatestConfiguration APIs instead. GetConfiguration is a priced
      # call. For more information, see Pricing .

      def get_configuration(
        application : String,
        client_id : String,
        configuration : String,
        environment : String,
        client_configuration_version : String? = nil
      ) : Protocol::Request
        input = Types::GetConfigurationRequest.new(application: application, client_id: client_id, configuration: configuration, environment: environment, client_configuration_version: client_configuration_version)
        get_configuration(input)
      end

      def get_configuration(input : Types::GetConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a configuration profile.

      def get_configuration_profile(
        application_id : String,
        configuration_profile_id : String
      ) : Protocol::Request
        input = Types::GetConfigurationProfileRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id)
        get_configuration_profile(input)
      end

      def get_configuration_profile(input : Types::GetConfigurationProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a configuration deployment.

      def get_deployment(
        application_id : String,
        deployment_number : Int32,
        environment_id : String
      ) : Protocol::Request
        input = Types::GetDeploymentRequest.new(application_id: application_id, deployment_number: deployment_number, environment_id: environment_id)
        get_deployment(input)
      end

      def get_deployment(input : Types::GetDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a deployment strategy. A deployment strategy defines important criteria
      # for rolling out your configuration to the designated targets. A deployment strategy includes the
      # overall duration required, a percentage of targets to receive the deployment during each interval,
      # an algorithm that defines how percentage grows, and bake time.

      def get_deployment_strategy(
        deployment_strategy_id : String
      ) : Protocol::Request
        input = Types::GetDeploymentStrategyRequest.new(deployment_strategy_id: deployment_strategy_id)
        get_deployment_strategy(input)
      end

      def get_deployment_strategy(input : Types::GetDeploymentStrategyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT_STRATEGY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an environment. An environment is a deployment group of AppConfig
      # applications, such as applications in a Production environment or in an EU_Region environment. Each
      # configuration deployment targets an environment. You can enable one or more Amazon CloudWatch alarms
      # for an environment. If an alarm is triggered during a deployment, AppConfig roles back the
      # configuration.

      def get_environment(
        application_id : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::GetEnvironmentRequest.new(application_id: application_id, environment_id: environment_id)
        get_environment(input)
      end

      def get_environment(input : Types::GetEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an AppConfig extension.

      def get_extension(
        extension_identifier : String,
        version_number : Int32? = nil
      ) : Protocol::Request
        input = Types::GetExtensionRequest.new(extension_identifier: extension_identifier, version_number: version_number)
        get_extension(input)
      end

      def get_extension(input : Types::GetExtensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXTENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an AppConfig extension association. For more information about extensions
      # and associations, see Extending workflows in the AppConfig User Guide .

      def get_extension_association(
        extension_association_id : String
      ) : Protocol::Request
        input = Types::GetExtensionAssociationRequest.new(extension_association_id: extension_association_id)
        get_extension_association(input)
      end

      def get_extension_association(input : Types::GetExtensionAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXTENSION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific configuration version.

      def get_hosted_configuration_version(
        application_id : String,
        configuration_profile_id : String,
        version_number : Int32
      ) : Protocol::Request
        input = Types::GetHostedConfigurationVersionRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, version_number: version_number)
        get_hosted_configuration_version(input)
      end

      def get_hosted_configuration_version(input : Types::GetHostedConfigurationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_HOSTED_CONFIGURATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all applications in your Amazon Web Services account.

      def list_applications(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(max_results: max_results, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the configuration profiles for an application.

      def list_configuration_profiles(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationProfilesRequest.new(application_id: application_id, max_results: max_results, next_token: next_token, type: type)
        list_configuration_profiles(input)
      end

      def list_configuration_profiles(input : Types::ListConfigurationProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists deployment strategies.

      def list_deployment_strategies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentStrategiesRequest.new(max_results: max_results, next_token: next_token)
        list_deployment_strategies(input)
      end

      def list_deployment_strategies(input : Types::ListDeploymentStrategiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENT_STRATEGIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the deployments for an environment in descending deployment number order.

      def list_deployments(
        application_id : String,
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentsRequest.new(application_id: application_id, environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_deployments(input)
      end

      def list_deployments(input : Types::ListDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the environments for an application.

      def list_environments(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_environments(input)
      end

      def list_environments(input : Types::ListEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all AppConfig extension associations in the account. For more information about extensions and
      # associations, see Extending workflows in the AppConfig User Guide .

      def list_extension_associations(
        extension_identifier : String? = nil,
        extension_version_number : Int32? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListExtensionAssociationsRequest.new(extension_identifier: extension_identifier, extension_version_number: extension_version_number, max_results: max_results, next_token: next_token, resource_identifier: resource_identifier)
        list_extension_associations(input)
      end

      def list_extension_associations(input : Types::ListExtensionAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXTENSION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all custom and Amazon Web Services authored AppConfig extensions in the account. For more
      # information about extensions, see Extending workflows in the AppConfig User Guide .

      def list_extensions(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExtensionsRequest.new(max_results: max_results, name: name, next_token: next_token)
        list_extensions(input)
      end

      def list_extensions(input : Types::ListExtensionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXTENSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists configurations stored in the AppConfig hosted configuration store by version.

      def list_hosted_configuration_versions(
        application_id : String,
        configuration_profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        version_label : String? = nil
      ) : Protocol::Request
        input = Types::ListHostedConfigurationVersionsRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, max_results: max_results, next_token: next_token, version_label: version_label)
        list_hosted_configuration_versions(input)
      end

      def list_hosted_configuration_versions(input : Types::ListHostedConfigurationVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HOSTED_CONFIGURATION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of key-value tags assigned to the resource.

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

      # Starts a deployment.

      def start_deployment(
        application_id : String,
        configuration_profile_id : String,
        configuration_version : String,
        deployment_strategy_id : String,
        environment_id : String,
        description : String? = nil,
        dynamic_extension_parameters : Hash(String, String)? = nil,
        kms_key_identifier : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartDeploymentRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, configuration_version: configuration_version, deployment_strategy_id: deployment_strategy_id, environment_id: environment_id, description: description, dynamic_extension_parameters: dynamic_extension_parameters, kms_key_identifier: kms_key_identifier, tags: tags)
        start_deployment(input)
      end

      def start_deployment(input : Types::StartDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a deployment. This API action works only on deployments that have a status of DEPLOYING ,
      # unless an AllowRevert parameter is supplied. If the AllowRevert parameter is supplied, the status of
      # an in-progress deployment will be ROLLED_BACK . The status of a completed deployment will be
      # REVERTED . AppConfig only allows a revert within 72 hours of deployment completion.

      def stop_deployment(
        application_id : String,
        deployment_number : Int32,
        environment_id : String,
        allow_revert : Bool? = nil
      ) : Protocol::Request
        input = Types::StopDeploymentRequest.new(application_id: application_id, deployment_number: deployment_number, environment_id: environment_id, allow_revert: allow_revert)
        stop_deployment(input)
      end

      def stop_deployment(input : Types::StopDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns metadata to an AppConfig resource. Tags help organize and categorize your AppConfig
      # resources. Each tag consists of a key and an optional value, both of which you define. You can
      # specify a maximum of 50 tags for a resource.

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

      # Deletes a tag key and value from an AppConfig resource.

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

      # Updates the value of the DeletionProtection parameter.

      def update_account_settings(
        deletion_protection : Types::DeletionProtectionSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountSettingsRequest.new(deletion_protection: deletion_protection)
        update_account_settings(input)
      end

      def update_account_settings(input : Types::UpdateAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an application.

      def update_application(
        application_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(application_id: application_id, description: description, name: name)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a configuration profile.

      def update_configuration_profile(
        application_id : String,
        configuration_profile_id : String,
        description : String? = nil,
        kms_key_identifier : String? = nil,
        name : String? = nil,
        retrieval_role_arn : String? = nil,
        validators : Array(Types::Validator)? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationProfileRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, description: description, kms_key_identifier: kms_key_identifier, name: name, retrieval_role_arn: retrieval_role_arn, validators: validators)
        update_configuration_profile(input)
      end

      def update_configuration_profile(input : Types::UpdateConfigurationProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a deployment strategy.

      def update_deployment_strategy(
        deployment_strategy_id : String,
        deployment_duration_in_minutes : Int32? = nil,
        description : String? = nil,
        final_bake_time_in_minutes : Int32? = nil,
        growth_factor : Float64? = nil,
        growth_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeploymentStrategyRequest.new(deployment_strategy_id: deployment_strategy_id, deployment_duration_in_minutes: deployment_duration_in_minutes, description: description, final_bake_time_in_minutes: final_bake_time_in_minutes, growth_factor: growth_factor, growth_type: growth_type)
        update_deployment_strategy(input)
      end

      def update_deployment_strategy(input : Types::UpdateDeploymentStrategyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEPLOYMENT_STRATEGY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an environment.

      def update_environment(
        application_id : String,
        environment_id : String,
        description : String? = nil,
        monitors : Array(Types::Monitor)? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentRequest.new(application_id: application_id, environment_id: environment_id, description: description, monitors: monitors, name: name)
        update_environment(input)
      end

      def update_environment(input : Types::UpdateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an AppConfig extension. For more information about extensions, see Extending workflows in
      # the AppConfig User Guide .

      def update_extension(
        extension_identifier : String,
        actions : Hash(String, Array(Types::Action))? = nil,
        description : String? = nil,
        parameters : Hash(String, Types::Parameter)? = nil,
        version_number : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateExtensionRequest.new(extension_identifier: extension_identifier, actions: actions, description: description, parameters: parameters, version_number: version_number)
        update_extension(input)
      end

      def update_extension(input : Types::UpdateExtensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EXTENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an association. For more information about extensions and associations, see Extending
      # workflows in the AppConfig User Guide .

      def update_extension_association(
        extension_association_id : String,
        parameters : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateExtensionAssociationRequest.new(extension_association_id: extension_association_id, parameters: parameters)
        update_extension_association(input)
      end

      def update_extension_association(input : Types::UpdateExtensionAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EXTENSION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uses the validators in a configuration profile to validate a configuration.

      def validate_configuration(
        application_id : String,
        configuration_profile_id : String,
        configuration_version : String
      ) : Protocol::Request
        input = Types::ValidateConfigurationRequest.new(application_id: application_id, configuration_profile_id: configuration_profile_id, configuration_version: configuration_version)
        validate_configuration(input)
      end

      def validate_configuration(input : Types::ValidateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
