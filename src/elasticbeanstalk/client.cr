module Aws
  module ElasticBeanstalk
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

      # Cancels in-progress environment configuration update or application version deployment.

      def abort_environment_update(
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Nil

        input = Types::AbortEnvironmentUpdateMessage.new(environment_id: environment_id, environment_name: environment_name)
        abort_environment_update(input)
      end

      def abort_environment_update(input : Types::AbortEnvironmentUpdateMessage) : Nil
        request = Protocol::Query.build_request(Model::ABORT_ENVIRONMENT_UPDATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Applies a scheduled managed action immediately. A managed action can be applied only if its status
      # is Scheduled . Get the status and action ID of a managed action with
      # DescribeEnvironmentManagedActions .

      def apply_environment_managed_action(
        action_id : String,
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Types::ApplyEnvironmentManagedActionResult

        input = Types::ApplyEnvironmentManagedActionRequest.new(action_id: action_id, environment_id: environment_id, environment_name: environment_name)
        apply_environment_managed_action(input)
      end

      def apply_environment_managed_action(input : Types::ApplyEnvironmentManagedActionRequest) : Types::ApplyEnvironmentManagedActionResult
        request = Protocol::Query.build_request(Model::APPLY_ENVIRONMENT_MANAGED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplyEnvironmentManagedActionResult, "ApplyEnvironmentManagedAction")
      end

      # Add or change the operations role used by an environment. After this call is made, Elastic Beanstalk
      # uses the associated operations role for permissions to downstream services during subsequent calls
      # acting on this environment. For more information, see Operations roles in the AWS Elastic Beanstalk
      # Developer Guide .

      def associate_environment_operations_role(
        environment_name : String,
        operations_role : String
      ) : Nil

        input = Types::AssociateEnvironmentOperationsRoleMessage.new(environment_name: environment_name, operations_role: operations_role)
        associate_environment_operations_role(input)
      end

      def associate_environment_operations_role(input : Types::AssociateEnvironmentOperationsRoleMessage) : Nil
        request = Protocol::Query.build_request(Model::ASSOCIATE_ENVIRONMENT_OPERATIONS_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Checks if the specified CNAME is available.

      def check_dns_availability(
        cname_prefix : String
      ) : Types::CheckDNSAvailabilityResultMessage

        input = Types::CheckDNSAvailabilityMessage.new(cname_prefix: cname_prefix)
        check_dns_availability(input)
      end

      def check_dns_availability(input : Types::CheckDNSAvailabilityMessage) : Types::CheckDNSAvailabilityResultMessage
        request = Protocol::Query.build_request(Model::CHECK_DNS_AVAILABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CheckDNSAvailabilityResultMessage, "CheckDNSAvailability")
      end

      # Create or update a group of environments that each run a separate component of a single application.
      # Takes a list of version labels that specify application source bundles for each of the environments
      # to create or update. The name of each environment and other required information must be included in
      # the source bundles in an environment manifest named env.yaml . See Compose Environments for details.

      def compose_environments(
        application_name : String? = nil,
        group_name : String? = nil,
        version_labels : Array(String)? = nil
      ) : Types::EnvironmentDescriptionsMessage

        input = Types::ComposeEnvironmentsMessage.new(application_name: application_name, group_name: group_name, version_labels: version_labels)
        compose_environments(input)
      end

      def compose_environments(input : Types::ComposeEnvironmentsMessage) : Types::EnvironmentDescriptionsMessage
        request = Protocol::Query.build_request(Model::COMPOSE_ENVIRONMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnvironmentDescriptionsMessage, "ComposeEnvironments")
      end

      # Creates an application that has one configuration template named default and no application
      # versions.

      def create_application(
        application_name : String,
        description : String? = nil,
        resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ApplicationDescriptionMessage

        input = Types::CreateApplicationMessage.new(application_name: application_name, description: description, resource_lifecycle_config: resource_lifecycle_config, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationMessage) : Types::ApplicationDescriptionMessage
        request = Protocol::Query.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplicationDescriptionMessage, "CreateApplication")
      end

      # Creates an application version for the specified application. You can create an application version
      # from a source bundle in Amazon S3, a commit in AWS CodeCommit, or the output of an AWS CodeBuild
      # build as follows: Specify a commit in an AWS CodeCommit repository with SourceBuildInformation .
      # Specify a build in an AWS CodeBuild with SourceBuildInformation and BuildConfiguration . Specify a
      # source bundle in S3 with SourceBundle Omit both SourceBuildInformation and SourceBundle to use the
      # default sample application. After you create an application version with a specified Amazon S3
      # bucket and key location, you can't change that Amazon S3 location. If you change the Amazon S3
      # location, you receive an exception when you attempt to launch an environment from the application
      # version.

      def create_application_version(
        application_name : String,
        version_label : String,
        auto_create_application : Bool? = nil,
        build_configuration : Types::BuildConfiguration? = nil,
        description : String? = nil,
        process : Bool? = nil,
        source_build_information : Types::SourceBuildInformation? = nil,
        source_bundle : Types::S3Location? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ApplicationVersionDescriptionMessage

        input = Types::CreateApplicationVersionMessage.new(application_name: application_name, version_label: version_label, auto_create_application: auto_create_application, build_configuration: build_configuration, description: description, process: process, source_build_information: source_build_information, source_bundle: source_bundle, tags: tags)
        create_application_version(input)
      end

      def create_application_version(input : Types::CreateApplicationVersionMessage) : Types::ApplicationVersionDescriptionMessage
        request = Protocol::Query.build_request(Model::CREATE_APPLICATION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplicationVersionDescriptionMessage, "CreateApplicationVersion")
      end

      # Creates an AWS Elastic Beanstalk configuration template, associated with a specific Elastic
      # Beanstalk application. You define application configuration settings in a configuration template.
      # You can then use the configuration template to deploy different versions of the application with the
      # same configuration settings. Templates aren't associated with any environment. The EnvironmentName
      # response element is always null . Related Topics DescribeConfigurationOptions
      # DescribeConfigurationSettings ListAvailableSolutionStacks

      def create_configuration_template(
        application_name : String,
        template_name : String,
        description : String? = nil,
        environment_id : String? = nil,
        option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
        platform_arn : String? = nil,
        solution_stack_name : String? = nil,
        source_configuration : Types::SourceConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ConfigurationSettingsDescription

        input = Types::CreateConfigurationTemplateMessage.new(application_name: application_name, template_name: template_name, description: description, environment_id: environment_id, option_settings: option_settings, platform_arn: platform_arn, solution_stack_name: solution_stack_name, source_configuration: source_configuration, tags: tags)
        create_configuration_template(input)
      end

      def create_configuration_template(input : Types::CreateConfigurationTemplateMessage) : Types::ConfigurationSettingsDescription
        request = Protocol::Query.build_request(Model::CREATE_CONFIGURATION_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ConfigurationSettingsDescription, "CreateConfigurationTemplate")
      end

      # Launches an AWS Elastic Beanstalk environment for the specified application using the specified
      # configuration.

      def create_environment(
        application_name : String,
        cname_prefix : String? = nil,
        description : String? = nil,
        environment_name : String? = nil,
        group_name : String? = nil,
        operations_role : String? = nil,
        option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
        options_to_remove : Array(Types::OptionSpecification)? = nil,
        platform_arn : String? = nil,
        solution_stack_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        template_name : String? = nil,
        tier : Types::EnvironmentTier? = nil,
        version_label : String? = nil
      ) : Types::EnvironmentDescription

        input = Types::CreateEnvironmentMessage.new(application_name: application_name, cname_prefix: cname_prefix, description: description, environment_name: environment_name, group_name: group_name, operations_role: operations_role, option_settings: option_settings, options_to_remove: options_to_remove, platform_arn: platform_arn, solution_stack_name: solution_stack_name, tags: tags, template_name: template_name, tier: tier, version_label: version_label)
        create_environment(input)
      end

      def create_environment(input : Types::CreateEnvironmentMessage) : Types::EnvironmentDescription
        request = Protocol::Query.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnvironmentDescription, "CreateEnvironment")
      end

      # Create a new version of your custom platform.

      def create_platform_version(
        platform_definition_bundle : Types::S3Location,
        platform_name : String,
        platform_version : String,
        environment_name : String? = nil,
        option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePlatformVersionResult

        input = Types::CreatePlatformVersionRequest.new(platform_definition_bundle: platform_definition_bundle, platform_name: platform_name, platform_version: platform_version, environment_name: environment_name, option_settings: option_settings, tags: tags)
        create_platform_version(input)
      end

      def create_platform_version(input : Types::CreatePlatformVersionRequest) : Types::CreatePlatformVersionResult
        request = Protocol::Query.build_request(Model::CREATE_PLATFORM_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreatePlatformVersionResult, "CreatePlatformVersion")
      end

      # Creates a bucket in Amazon S3 to store application versions, logs, and other files used by Elastic
      # Beanstalk environments. The Elastic Beanstalk console and EB CLI call this API the first time you
      # create an environment in a region. If the storage location already exists, CreateStorageLocation
      # still returns the bucket name but does not create a new bucket.


      def create_storage_location : Types::CreateStorageLocationResultMessage
        request = Protocol::Query.build_request(Model::CREATE_STORAGE_LOCATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateStorageLocationResultMessage, "CreateStorageLocation")
      end

      # Deletes the specified application along with all associated versions and configurations. The
      # application versions will not be deleted from your Amazon S3 bucket. You cannot delete an
      # application that has a running environment.

      def delete_application(
        application_name : String,
        terminate_env_by_force : Bool? = nil
      ) : Nil

        input = Types::DeleteApplicationMessage.new(application_name: application_name, terminate_env_by_force: terminate_env_by_force)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified version from the specified application. You cannot delete an application
      # version that is associated with a running environment.

      def delete_application_version(
        application_name : String,
        version_label : String,
        delete_source_bundle : Bool? = nil
      ) : Nil

        input = Types::DeleteApplicationVersionMessage.new(application_name: application_name, version_label: version_label, delete_source_bundle: delete_source_bundle)
        delete_application_version(input)
      end

      def delete_application_version(input : Types::DeleteApplicationVersionMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_APPLICATION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified configuration template. When you launch an environment using a configuration
      # template, the environment gets a copy of the template. You can delete or modify the environment's
      # copy of the template without affecting the running environment.

      def delete_configuration_template(
        application_name : String,
        template_name : String
      ) : Nil

        input = Types::DeleteConfigurationTemplateMessage.new(application_name: application_name, template_name: template_name)
        delete_configuration_template(input)
      end

      def delete_configuration_template(input : Types::DeleteConfigurationTemplateMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CONFIGURATION_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the draft configuration associated with the running environment. Updating a running
      # environment with any configuration changes creates a draft configuration set. You can get the draft
      # configuration using DescribeConfigurationSettings while the update is in progress or if the update
      # fails. The DeploymentStatus for the draft configuration indicates whether the deployment is in
      # process or has failed. The draft configuration remains in existence until it is deleted with this
      # action.

      def delete_environment_configuration(
        application_name : String,
        environment_name : String
      ) : Nil

        input = Types::DeleteEnvironmentConfigurationMessage.new(application_name: application_name, environment_name: environment_name)
        delete_environment_configuration(input)
      end

      def delete_environment_configuration(input : Types::DeleteEnvironmentConfigurationMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ENVIRONMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified version of a custom platform.

      def delete_platform_version(
        platform_arn : String? = nil
      ) : Types::DeletePlatformVersionResult

        input = Types::DeletePlatformVersionRequest.new(platform_arn: platform_arn)
        delete_platform_version(input)
      end

      def delete_platform_version(input : Types::DeletePlatformVersionRequest) : Types::DeletePlatformVersionResult
        request = Protocol::Query.build_request(Model::DELETE_PLATFORM_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeletePlatformVersionResult, "DeletePlatformVersion")
      end

      # Returns attributes related to AWS Elastic Beanstalk that are associated with the calling AWS
      # account. The result currently has one set of attributes—resource quotas.


      def describe_account_attributes : Types::DescribeAccountAttributesResult
        request = Protocol::Query.build_request(Model::DESCRIBE_ACCOUNT_ATTRIBUTES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAccountAttributesResult, "DescribeAccountAttributes")
      end

      # Retrieve a list of application versions.

      def describe_application_versions(
        application_name : String? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil,
        version_labels : Array(String)? = nil
      ) : Types::ApplicationVersionDescriptionsMessage

        input = Types::DescribeApplicationVersionsMessage.new(application_name: application_name, max_records: max_records, next_token: next_token, version_labels: version_labels)
        describe_application_versions(input)
      end

      def describe_application_versions(input : Types::DescribeApplicationVersionsMessage) : Types::ApplicationVersionDescriptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_APPLICATION_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplicationVersionDescriptionsMessage, "DescribeApplicationVersions")
      end

      # Returns the descriptions of existing applications.

      def describe_applications(
        application_names : Array(String)? = nil
      ) : Types::ApplicationDescriptionsMessage

        input = Types::DescribeApplicationsMessage.new(application_names: application_names)
        describe_applications(input)
      end

      def describe_applications(input : Types::DescribeApplicationsMessage) : Types::ApplicationDescriptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplicationDescriptionsMessage, "DescribeApplications")
      end

      # Describes the configuration options that are used in a particular configuration template or
      # environment, or that a specified solution stack defines. The description includes the values the
      # options, their default values, and an indication of the required action on a running environment if
      # an option value is changed.

      def describe_configuration_options(
        application_name : String? = nil,
        environment_name : String? = nil,
        options : Array(Types::OptionSpecification)? = nil,
        platform_arn : String? = nil,
        solution_stack_name : String? = nil,
        template_name : String? = nil
      ) : Types::ConfigurationOptionsDescription

        input = Types::DescribeConfigurationOptionsMessage.new(application_name: application_name, environment_name: environment_name, options: options, platform_arn: platform_arn, solution_stack_name: solution_stack_name, template_name: template_name)
        describe_configuration_options(input)
      end

      def describe_configuration_options(input : Types::DescribeConfigurationOptionsMessage) : Types::ConfigurationOptionsDescription
        request = Protocol::Query.build_request(Model::DESCRIBE_CONFIGURATION_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ConfigurationOptionsDescription, "DescribeConfigurationOptions")
      end

      # Returns a description of the settings for the specified configuration set, that is, either a
      # configuration template or the configuration set associated with a running environment. When
      # describing the settings for the configuration set associated with a running environment, it is
      # possible to receive two sets of setting descriptions. One is the deployed configuration set, and the
      # other is a draft configuration of an environment that is either in the process of deployment or that
      # failed to deploy. Related Topics DeleteEnvironmentConfiguration

      def describe_configuration_settings(
        application_name : String,
        environment_name : String? = nil,
        template_name : String? = nil
      ) : Types::ConfigurationSettingsDescriptions

        input = Types::DescribeConfigurationSettingsMessage.new(application_name: application_name, environment_name: environment_name, template_name: template_name)
        describe_configuration_settings(input)
      end

      def describe_configuration_settings(input : Types::DescribeConfigurationSettingsMessage) : Types::ConfigurationSettingsDescriptions
        request = Protocol::Query.build_request(Model::DESCRIBE_CONFIGURATION_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ConfigurationSettingsDescriptions, "DescribeConfigurationSettings")
      end

      # Returns information about the overall health of the specified environment. The
      # DescribeEnvironmentHealth operation is only available with AWS Elastic Beanstalk Enhanced Health.

      def describe_environment_health(
        attribute_names : Array(String)? = nil,
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Types::DescribeEnvironmentHealthResult

        input = Types::DescribeEnvironmentHealthRequest.new(attribute_names: attribute_names, environment_id: environment_id, environment_name: environment_name)
        describe_environment_health(input)
      end

      def describe_environment_health(input : Types::DescribeEnvironmentHealthRequest) : Types::DescribeEnvironmentHealthResult
        request = Protocol::Query.build_request(Model::DESCRIBE_ENVIRONMENT_HEALTH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEnvironmentHealthResult, "DescribeEnvironmentHealth")
      end

      # Lists an environment's completed and failed managed actions.

      def describe_environment_managed_action_history(
        environment_id : String? = nil,
        environment_name : String? = nil,
        max_items : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEnvironmentManagedActionHistoryResult

        input = Types::DescribeEnvironmentManagedActionHistoryRequest.new(environment_id: environment_id, environment_name: environment_name, max_items: max_items, next_token: next_token)
        describe_environment_managed_action_history(input)
      end

      def describe_environment_managed_action_history(input : Types::DescribeEnvironmentManagedActionHistoryRequest) : Types::DescribeEnvironmentManagedActionHistoryResult
        request = Protocol::Query.build_request(Model::DESCRIBE_ENVIRONMENT_MANAGED_ACTION_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEnvironmentManagedActionHistoryResult, "DescribeEnvironmentManagedActionHistory")
      end

      # Lists an environment's upcoming and in-progress managed actions.

      def describe_environment_managed_actions(
        environment_id : String? = nil,
        environment_name : String? = nil,
        status : String? = nil
      ) : Types::DescribeEnvironmentManagedActionsResult

        input = Types::DescribeEnvironmentManagedActionsRequest.new(environment_id: environment_id, environment_name: environment_name, status: status)
        describe_environment_managed_actions(input)
      end

      def describe_environment_managed_actions(input : Types::DescribeEnvironmentManagedActionsRequest) : Types::DescribeEnvironmentManagedActionsResult
        request = Protocol::Query.build_request(Model::DESCRIBE_ENVIRONMENT_MANAGED_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEnvironmentManagedActionsResult, "DescribeEnvironmentManagedActions")
      end

      # Returns AWS resources for this environment.

      def describe_environment_resources(
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Types::EnvironmentResourceDescriptionsMessage

        input = Types::DescribeEnvironmentResourcesMessage.new(environment_id: environment_id, environment_name: environment_name)
        describe_environment_resources(input)
      end

      def describe_environment_resources(input : Types::DescribeEnvironmentResourcesMessage) : Types::EnvironmentResourceDescriptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_ENVIRONMENT_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnvironmentResourceDescriptionsMessage, "DescribeEnvironmentResources")
      end

      # Returns descriptions for existing environments.

      def describe_environments(
        application_name : String? = nil,
        environment_ids : Array(String)? = nil,
        environment_names : Array(String)? = nil,
        include_deleted : Bool? = nil,
        included_deleted_back_to : Time? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil,
        version_label : String? = nil
      ) : Types::EnvironmentDescriptionsMessage

        input = Types::DescribeEnvironmentsMessage.new(application_name: application_name, environment_ids: environment_ids, environment_names: environment_names, include_deleted: include_deleted, included_deleted_back_to: included_deleted_back_to, max_records: max_records, next_token: next_token, version_label: version_label)
        describe_environments(input)
      end

      def describe_environments(input : Types::DescribeEnvironmentsMessage) : Types::EnvironmentDescriptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_ENVIRONMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnvironmentDescriptionsMessage, "DescribeEnvironments")
      end

      # Returns list of event descriptions matching criteria up to the last 6 weeks. This action returns the
      # most recent 1,000 events from the specified NextToken .

      def describe_events(
        application_name : String? = nil,
        end_time : Time? = nil,
        environment_id : String? = nil,
        environment_name : String? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil,
        platform_arn : String? = nil,
        request_id : String? = nil,
        severity : String? = nil,
        start_time : Time? = nil,
        template_name : String? = nil,
        version_label : String? = nil
      ) : Types::EventDescriptionsMessage

        input = Types::DescribeEventsMessage.new(application_name: application_name, end_time: end_time, environment_id: environment_id, environment_name: environment_name, max_records: max_records, next_token: next_token, platform_arn: platform_arn, request_id: request_id, severity: severity, start_time: start_time, template_name: template_name, version_label: version_label)
        describe_events(input)
      end

      def describe_events(input : Types::DescribeEventsMessage) : Types::EventDescriptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventDescriptionsMessage, "DescribeEvents")
      end

      # Retrieves detailed information about the health of instances in your AWS Elastic Beanstalk. This
      # operation requires enhanced health reporting .

      def describe_instances_health(
        attribute_names : Array(String)? = nil,
        environment_id : String? = nil,
        environment_name : String? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstancesHealthResult

        input = Types::DescribeInstancesHealthRequest.new(attribute_names: attribute_names, environment_id: environment_id, environment_name: environment_name, next_token: next_token)
        describe_instances_health(input)
      end

      def describe_instances_health(input : Types::DescribeInstancesHealthRequest) : Types::DescribeInstancesHealthResult
        request = Protocol::Query.build_request(Model::DESCRIBE_INSTANCES_HEALTH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeInstancesHealthResult, "DescribeInstancesHealth")
      end

      # Describes a platform version. Provides full details. Compare to ListPlatformVersions , which
      # provides summary information about a list of platform versions. For definitions of platform version
      # and other platform-related terms, see AWS Elastic Beanstalk Platforms Glossary .

      def describe_platform_version(
        platform_arn : String? = nil
      ) : Types::DescribePlatformVersionResult

        input = Types::DescribePlatformVersionRequest.new(platform_arn: platform_arn)
        describe_platform_version(input)
      end

      def describe_platform_version(input : Types::DescribePlatformVersionRequest) : Types::DescribePlatformVersionResult
        request = Protocol::Query.build_request(Model::DESCRIBE_PLATFORM_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribePlatformVersionResult, "DescribePlatformVersion")
      end

      # Disassociate the operations role from an environment. After this call is made, Elastic Beanstalk
      # uses the caller's permissions for permissions to downstream services during subsequent calls acting
      # on this environment. For more information, see Operations roles in the AWS Elastic Beanstalk
      # Developer Guide .

      def disassociate_environment_operations_role(
        environment_name : String
      ) : Nil

        input = Types::DisassociateEnvironmentOperationsRoleMessage.new(environment_name: environment_name)
        disassociate_environment_operations_role(input)
      end

      def disassociate_environment_operations_role(input : Types::DisassociateEnvironmentOperationsRoleMessage) : Nil
        request = Protocol::Query.build_request(Model::DISASSOCIATE_ENVIRONMENT_OPERATIONS_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Returns a list of the available solution stack names, with the public version first and then in
      # reverse chronological order.


      def list_available_solution_stacks : Types::ListAvailableSolutionStacksResultMessage
        request = Protocol::Query.build_request(Model::LIST_AVAILABLE_SOLUTION_STACKS, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListAvailableSolutionStacksResultMessage, "ListAvailableSolutionStacks")
      end

      # Lists the platform branches available for your account in an AWS Region. Provides summary
      # information about each platform branch. For definitions of platform branch and other
      # platform-related terms, see AWS Elastic Beanstalk Platforms Glossary .

      def list_platform_branches(
        filters : Array(Types::SearchFilter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPlatformBranchesResult

        input = Types::ListPlatformBranchesRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        list_platform_branches(input)
      end

      def list_platform_branches(input : Types::ListPlatformBranchesRequest) : Types::ListPlatformBranchesResult
        request = Protocol::Query.build_request(Model::LIST_PLATFORM_BRANCHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPlatformBranchesResult, "ListPlatformBranches")
      end

      # Lists the platform versions available for your account in an AWS Region. Provides summary
      # information about each platform version. Compare to DescribePlatformVersion , which provides full
      # details about a single platform version. For definitions of platform version and other
      # platform-related terms, see AWS Elastic Beanstalk Platforms Glossary .

      def list_platform_versions(
        filters : Array(Types::PlatformFilter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPlatformVersionsResult

        input = Types::ListPlatformVersionsRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        list_platform_versions(input)
      end

      def list_platform_versions(input : Types::ListPlatformVersionsRequest) : Types::ListPlatformVersionsResult
        request = Protocol::Query.build_request(Model::LIST_PLATFORM_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPlatformVersionsResult, "ListPlatformVersions")
      end

      # Return the tags applied to an AWS Elastic Beanstalk resource. The response contains a list of tag
      # key-value pairs. Elastic Beanstalk supports tagging of all of its resources. For details about
      # resource tagging, see Tagging Application Resources .

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ResourceTagsDescriptionMessage

        input = Types::ListTagsForResourceMessage.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceMessage) : Types::ResourceTagsDescriptionMessage
        request = Protocol::Query.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ResourceTagsDescriptionMessage, "ListTagsForResource")
      end

      # Deletes and recreates all of the AWS resources (for example: the Auto Scaling group, load balancer,
      # etc.) for a specified environment and forces a restart.

      def rebuild_environment(
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Nil

        input = Types::RebuildEnvironmentMessage.new(environment_id: environment_id, environment_name: environment_name)
        rebuild_environment(input)
      end

      def rebuild_environment(input : Types::RebuildEnvironmentMessage) : Nil
        request = Protocol::Query.build_request(Model::REBUILD_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Initiates a request to compile the specified type of information of the deployed environment.
      # Setting the InfoType to tail compiles the last lines from the application server log files of every
      # Amazon EC2 instance in your environment. Setting the InfoType to bundle compresses the application
      # server log files for every Amazon EC2 instance into a .zip file. Legacy and .NET containers do not
      # support bundle logs. Use RetrieveEnvironmentInfo to obtain the set of logs. Related Topics
      # RetrieveEnvironmentInfo

      def request_environment_info(
        info_type : String,
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Nil

        input = Types::RequestEnvironmentInfoMessage.new(info_type: info_type, environment_id: environment_id, environment_name: environment_name)
        request_environment_info(input)
      end

      def request_environment_info(input : Types::RequestEnvironmentInfoMessage) : Nil
        request = Protocol::Query.build_request(Model::REQUEST_ENVIRONMENT_INFO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Causes the environment to restart the application container server running on each Amazon EC2
      # instance.

      def restart_app_server(
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Nil

        input = Types::RestartAppServerMessage.new(environment_id: environment_id, environment_name: environment_name)
        restart_app_server(input)
      end

      def restart_app_server(input : Types::RestartAppServerMessage) : Nil
        request = Protocol::Query.build_request(Model::RESTART_APP_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves the compiled information from a RequestEnvironmentInfo request. Related Topics
      # RequestEnvironmentInfo

      def retrieve_environment_info(
        info_type : String,
        environment_id : String? = nil,
        environment_name : String? = nil
      ) : Types::RetrieveEnvironmentInfoResultMessage

        input = Types::RetrieveEnvironmentInfoMessage.new(info_type: info_type, environment_id: environment_id, environment_name: environment_name)
        retrieve_environment_info(input)
      end

      def retrieve_environment_info(input : Types::RetrieveEnvironmentInfoMessage) : Types::RetrieveEnvironmentInfoResultMessage
        request = Protocol::Query.build_request(Model::RETRIEVE_ENVIRONMENT_INFO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RetrieveEnvironmentInfoResultMessage, "RetrieveEnvironmentInfo")
      end

      # Swaps the CNAMEs of two environments.

      def swap_environment_cnam_es(
        destination_environment_id : String? = nil,
        destination_environment_name : String? = nil,
        source_environment_id : String? = nil,
        source_environment_name : String? = nil
      ) : Nil

        input = Types::SwapEnvironmentCNAMEsMessage.new(destination_environment_id: destination_environment_id, destination_environment_name: destination_environment_name, source_environment_id: source_environment_id, source_environment_name: source_environment_name)
        swap_environment_cnam_es(input)
      end

      def swap_environment_cnam_es(input : Types::SwapEnvironmentCNAMEsMessage) : Nil
        request = Protocol::Query.build_request(Model::SWAP_ENVIRONMENT_CNAM_ES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Terminates the specified environment.

      def terminate_environment(
        environment_id : String? = nil,
        environment_name : String? = nil,
        force_terminate : Bool? = nil,
        terminate_resources : Bool? = nil
      ) : Types::EnvironmentDescription

        input = Types::TerminateEnvironmentMessage.new(environment_id: environment_id, environment_name: environment_name, force_terminate: force_terminate, terminate_resources: terminate_resources)
        terminate_environment(input)
      end

      def terminate_environment(input : Types::TerminateEnvironmentMessage) : Types::EnvironmentDescription
        request = Protocol::Query.build_request(Model::TERMINATE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnvironmentDescription, "TerminateEnvironment")
      end

      # Updates the specified application to have the specified properties. If a property (for example,
      # description ) is not provided, the value remains unchanged. To clear these properties, specify an
      # empty string.

      def update_application(
        application_name : String,
        description : String? = nil
      ) : Types::ApplicationDescriptionMessage

        input = Types::UpdateApplicationMessage.new(application_name: application_name, description: description)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationMessage) : Types::ApplicationDescriptionMessage
        request = Protocol::Query.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplicationDescriptionMessage, "UpdateApplication")
      end

      # Modifies lifecycle settings for an application.

      def update_application_resource_lifecycle(
        application_name : String,
        resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig
      ) : Types::ApplicationResourceLifecycleDescriptionMessage

        input = Types::UpdateApplicationResourceLifecycleMessage.new(application_name: application_name, resource_lifecycle_config: resource_lifecycle_config)
        update_application_resource_lifecycle(input)
      end

      def update_application_resource_lifecycle(input : Types::UpdateApplicationResourceLifecycleMessage) : Types::ApplicationResourceLifecycleDescriptionMessage
        request = Protocol::Query.build_request(Model::UPDATE_APPLICATION_RESOURCE_LIFECYCLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplicationResourceLifecycleDescriptionMessage, "UpdateApplicationResourceLifecycle")
      end

      # Updates the specified application version to have the specified properties. If a property (for
      # example, description ) is not provided, the value remains unchanged. To clear properties, specify an
      # empty string.

      def update_application_version(
        application_name : String,
        version_label : String,
        description : String? = nil
      ) : Types::ApplicationVersionDescriptionMessage

        input = Types::UpdateApplicationVersionMessage.new(application_name: application_name, version_label: version_label, description: description)
        update_application_version(input)
      end

      def update_application_version(input : Types::UpdateApplicationVersionMessage) : Types::ApplicationVersionDescriptionMessage
        request = Protocol::Query.build_request(Model::UPDATE_APPLICATION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplicationVersionDescriptionMessage, "UpdateApplicationVersion")
      end

      # Updates the specified configuration template to have the specified properties or configuration
      # option values. If a property (for example, ApplicationName ) is not provided, its value remains
      # unchanged. To clear such properties, specify an empty string. Related Topics
      # DescribeConfigurationOptions

      def update_configuration_template(
        application_name : String,
        template_name : String,
        description : String? = nil,
        option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
        options_to_remove : Array(Types::OptionSpecification)? = nil
      ) : Types::ConfigurationSettingsDescription

        input = Types::UpdateConfigurationTemplateMessage.new(application_name: application_name, template_name: template_name, description: description, option_settings: option_settings, options_to_remove: options_to_remove)
        update_configuration_template(input)
      end

      def update_configuration_template(input : Types::UpdateConfigurationTemplateMessage) : Types::ConfigurationSettingsDescription
        request = Protocol::Query.build_request(Model::UPDATE_CONFIGURATION_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ConfigurationSettingsDescription, "UpdateConfigurationTemplate")
      end

      # Updates the environment description, deploys a new application version, updates the configuration
      # settings to an entirely new configuration template, or updates select configuration option values in
      # the running environment. Attempting to update both the release and configuration is not allowed and
      # AWS Elastic Beanstalk returns an InvalidParameterCombination error. When updating the configuration
      # settings to a new template or individual settings, a draft configuration is created and
      # DescribeConfigurationSettings for this environment returns two setting descriptions with different
      # DeploymentStatus values.

      def update_environment(
        application_name : String? = nil,
        description : String? = nil,
        environment_id : String? = nil,
        environment_name : String? = nil,
        group_name : String? = nil,
        option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
        options_to_remove : Array(Types::OptionSpecification)? = nil,
        platform_arn : String? = nil,
        solution_stack_name : String? = nil,
        template_name : String? = nil,
        tier : Types::EnvironmentTier? = nil,
        version_label : String? = nil
      ) : Types::EnvironmentDescription

        input = Types::UpdateEnvironmentMessage.new(application_name: application_name, description: description, environment_id: environment_id, environment_name: environment_name, group_name: group_name, option_settings: option_settings, options_to_remove: options_to_remove, platform_arn: platform_arn, solution_stack_name: solution_stack_name, template_name: template_name, tier: tier, version_label: version_label)
        update_environment(input)
      end

      def update_environment(input : Types::UpdateEnvironmentMessage) : Types::EnvironmentDescription
        request = Protocol::Query.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnvironmentDescription, "UpdateEnvironment")
      end

      # Update the list of tags applied to an AWS Elastic Beanstalk resource. Two lists can be passed:
      # TagsToAdd for tags to add or update, and TagsToRemove . Elastic Beanstalk supports tagging of all of
      # its resources. For details about resource tagging, see Tagging Application Resources . If you create
      # a custom IAM user policy to control permission to this operation, specify one of the following two
      # virtual actions (or both) instead of the API operation name: elasticbeanstalk:AddTags Controls
      # permission to call UpdateTagsForResource and pass a list of tags to add in the TagsToAdd parameter.
      # elasticbeanstalk:RemoveTags Controls permission to call UpdateTagsForResource and pass a list of tag
      # keys to remove in the TagsToRemove parameter. For details about creating a custom user policy, see
      # Creating a Custom User Policy .

      def update_tags_for_resource(
        resource_arn : String,
        tags_to_add : Array(Types::Tag)? = nil,
        tags_to_remove : Array(String)? = nil
      ) : Nil

        input = Types::UpdateTagsForResourceMessage.new(resource_arn: resource_arn, tags_to_add: tags_to_add, tags_to_remove: tags_to_remove)
        update_tags_for_resource(input)
      end

      def update_tags_for_resource(input : Types::UpdateTagsForResourceMessage) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Takes a set of configuration settings and either a configuration template or environment, and
      # determines whether those values are valid. This action returns a list of messages indicating any
      # errors or warnings associated with the selection of option values.

      def validate_configuration_settings(
        application_name : String,
        option_settings : Array(Types::ConfigurationOptionSetting),
        environment_name : String? = nil,
        template_name : String? = nil
      ) : Types::ConfigurationSettingsValidationMessages

        input = Types::ValidateConfigurationSettingsMessage.new(application_name: application_name, option_settings: option_settings, environment_name: environment_name, template_name: template_name)
        validate_configuration_settings(input)
      end

      def validate_configuration_settings(input : Types::ValidateConfigurationSettingsMessage) : Types::ConfigurationSettingsValidationMessages
        request = Protocol::Query.build_request(Model::VALIDATE_CONFIGURATION_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ConfigurationSettingsValidationMessages, "ValidateConfigurationSettings")
      end
    end
  end
end
