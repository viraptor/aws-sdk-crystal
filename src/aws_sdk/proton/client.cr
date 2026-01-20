module AwsSdk
  module Proton
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

      # In a management account, an environment account connection request is accepted. When the environment
      # account connection request is accepted, Proton can use the associated IAM role to provision
      # environment infrastructure resources in the associated environment account. For more information,
      # see Environment account connections in the Proton User guide .

      def accept_environment_account_connection(
        id : String
      ) : Types::AcceptEnvironmentAccountConnectionOutput

        input = Types::AcceptEnvironmentAccountConnectionInput.new(id: id)
        accept_environment_account_connection(input)
      end

      def accept_environment_account_connection(input : Types::AcceptEnvironmentAccountConnectionInput) : Types::AcceptEnvironmentAccountConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_ENVIRONMENT_ACCOUNT_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptEnvironmentAccountConnectionOutput, "AcceptEnvironmentAccountConnection")
      end

      # Attempts to cancel a component deployment (for a component that is in the IN_PROGRESS deployment
      # status). For more information about components, see Proton components in the Proton User Guide .

      def cancel_component_deployment(
        component_name : String
      ) : Types::CancelComponentDeploymentOutput

        input = Types::CancelComponentDeploymentInput.new(component_name: component_name)
        cancel_component_deployment(input)
      end

      def cancel_component_deployment(input : Types::CancelComponentDeploymentInput) : Types::CancelComponentDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_COMPONENT_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelComponentDeploymentOutput, "CancelComponentDeployment")
      end

      # Attempts to cancel an environment deployment on an UpdateEnvironment action, if the deployment is
      # IN_PROGRESS . For more information, see Update an environment in the Proton User guide . The
      # following list includes potential cancellation scenarios. If the cancellation attempt succeeds, the
      # resulting deployment state is CANCELLED . If the cancellation attempt fails, the resulting
      # deployment state is FAILED . If the current UpdateEnvironment action succeeds before the
      # cancellation attempt starts, the resulting deployment state is SUCCEEDED and the cancellation
      # attempt has no effect.

      def cancel_environment_deployment(
        environment_name : String
      ) : Types::CancelEnvironmentDeploymentOutput

        input = Types::CancelEnvironmentDeploymentInput.new(environment_name: environment_name)
        cancel_environment_deployment(input)
      end

      def cancel_environment_deployment(input : Types::CancelEnvironmentDeploymentInput) : Types::CancelEnvironmentDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_ENVIRONMENT_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelEnvironmentDeploymentOutput, "CancelEnvironmentDeployment")
      end

      # Attempts to cancel a service instance deployment on an UpdateServiceInstance action, if the
      # deployment is IN_PROGRESS . For more information, see Update a service instance in the Proton User
      # guide . The following list includes potential cancellation scenarios. If the cancellation attempt
      # succeeds, the resulting deployment state is CANCELLED . If the cancellation attempt fails, the
      # resulting deployment state is FAILED . If the current UpdateServiceInstance action succeeds before
      # the cancellation attempt starts, the resulting deployment state is SUCCEEDED and the cancellation
      # attempt has no effect.

      def cancel_service_instance_deployment(
        service_instance_name : String,
        service_name : String
      ) : Types::CancelServiceInstanceDeploymentOutput

        input = Types::CancelServiceInstanceDeploymentInput.new(service_instance_name: service_instance_name, service_name: service_name)
        cancel_service_instance_deployment(input)
      end

      def cancel_service_instance_deployment(input : Types::CancelServiceInstanceDeploymentInput) : Types::CancelServiceInstanceDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_SERVICE_INSTANCE_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelServiceInstanceDeploymentOutput, "CancelServiceInstanceDeployment")
      end

      # Attempts to cancel a service pipeline deployment on an UpdateServicePipeline action, if the
      # deployment is IN_PROGRESS . For more information, see Update a service pipeline in the Proton User
      # guide . The following list includes potential cancellation scenarios. If the cancellation attempt
      # succeeds, the resulting deployment state is CANCELLED . If the cancellation attempt fails, the
      # resulting deployment state is FAILED . If the current UpdateServicePipeline action succeeds before
      # the cancellation attempt starts, the resulting deployment state is SUCCEEDED and the cancellation
      # attempt has no effect.

      def cancel_service_pipeline_deployment(
        service_name : String
      ) : Types::CancelServicePipelineDeploymentOutput

        input = Types::CancelServicePipelineDeploymentInput.new(service_name: service_name)
        cancel_service_pipeline_deployment(input)
      end

      def cancel_service_pipeline_deployment(input : Types::CancelServicePipelineDeploymentInput) : Types::CancelServicePipelineDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_SERVICE_PIPELINE_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelServicePipelineDeploymentOutput, "CancelServicePipelineDeployment")
      end

      # Create an Proton component. A component is an infrastructure extension for a service instance. For
      # more information about components, see Proton components in the Proton User Guide .

      def create_component(
        manifest : String,
        name : String,
        template_file : String,
        client_token : String? = nil,
        description : String? = nil,
        environment_name : String? = nil,
        service_instance_name : String? = nil,
        service_name : String? = nil,
        service_spec : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateComponentOutput

        input = Types::CreateComponentInput.new(manifest: manifest, name: name, template_file: template_file, client_token: client_token, description: description, environment_name: environment_name, service_instance_name: service_instance_name, service_name: service_name, service_spec: service_spec, tags: tags)
        create_component(input)
      end

      def create_component(input : Types::CreateComponentInput) : Types::CreateComponentOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateComponentOutput, "CreateComponent")
      end

      # Deploy a new environment. An Proton environment is created from an environment template that defines
      # infrastructure and resources that can be shared across services. You can provision environments
      # using the following methods: Amazon Web Services-managed provisioning: Proton makes direct calls to
      # provision your resources. Self-managed provisioning: Proton makes pull requests on your repository
      # to provide compiled infrastructure as code (IaC) files that your IaC engine uses to provision
      # resources. For more information, see Environments and Provisioning methods in the Proton User Guide
      # .

      def create_environment(
        name : String,
        spec : String,
        template_major_version : String,
        template_name : String,
        codebuild_role_arn : String? = nil,
        component_role_arn : String? = nil,
        description : String? = nil,
        environment_account_connection_id : String? = nil,
        proton_service_role_arn : String? = nil,
        provisioning_repository : Types::RepositoryBranchInput? = nil,
        tags : Array(Types::Tag)? = nil,
        template_minor_version : String? = nil
      ) : Types::CreateEnvironmentOutput

        input = Types::CreateEnvironmentInput.new(name: name, spec: spec, template_major_version: template_major_version, template_name: template_name, codebuild_role_arn: codebuild_role_arn, component_role_arn: component_role_arn, description: description, environment_account_connection_id: environment_account_connection_id, proton_service_role_arn: proton_service_role_arn, provisioning_repository: provisioning_repository, tags: tags, template_minor_version: template_minor_version)
        create_environment(input)
      end

      def create_environment(input : Types::CreateEnvironmentInput) : Types::CreateEnvironmentOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentOutput, "CreateEnvironment")
      end

      # Create an environment account connection in an environment account so that environment
      # infrastructure resources can be provisioned in the environment account from a management account. An
      # environment account connection is a secure bi-directional connection between a management account
      # and an environment account that maintains authorization and permissions. For more information, see
      # Environment account connections in the Proton User guide .

      def create_environment_account_connection(
        environment_name : String,
        management_account_id : String,
        client_token : String? = nil,
        codebuild_role_arn : String? = nil,
        component_role_arn : String? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEnvironmentAccountConnectionOutput

        input = Types::CreateEnvironmentAccountConnectionInput.new(environment_name: environment_name, management_account_id: management_account_id, client_token: client_token, codebuild_role_arn: codebuild_role_arn, component_role_arn: component_role_arn, role_arn: role_arn, tags: tags)
        create_environment_account_connection(input)
      end

      def create_environment_account_connection(input : Types::CreateEnvironmentAccountConnectionInput) : Types::CreateEnvironmentAccountConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT_ACCOUNT_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentAccountConnectionOutput, "CreateEnvironmentAccountConnection")
      end

      # Create an environment template for Proton. For more information, see Environment Templates in the
      # Proton User Guide . You can create an environment template in one of the two following ways:
      # Register and publish a standard environment template that instructs Proton to deploy and manage
      # environment infrastructure. Register and publish a customer managed environment template that
      # connects Proton to your existing provisioned infrastructure that you manage. Proton doesn't manage
      # your existing provisioned infrastructure. To create an environment template for customer provisioned
      # and managed infrastructure, include the provisioning parameter and set the value to CUSTOMER_MANAGED
      # . For more information, see Register and publish an environment template in the Proton User Guide .

      def create_environment_template(
        name : String,
        description : String? = nil,
        display_name : String? = nil,
        encryption_key : String? = nil,
        provisioning : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEnvironmentTemplateOutput

        input = Types::CreateEnvironmentTemplateInput.new(name: name, description: description, display_name: display_name, encryption_key: encryption_key, provisioning: provisioning, tags: tags)
        create_environment_template(input)
      end

      def create_environment_template(input : Types::CreateEnvironmentTemplateInput) : Types::CreateEnvironmentTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentTemplateOutput, "CreateEnvironmentTemplate")
      end

      # Create a new major or minor version of an environment template. A major version of an environment
      # template is a version that isn't backwards compatible. A minor version of an environment template is
      # a version that's backwards compatible within its major version.

      def create_environment_template_version(
        source : Types::TemplateVersionSourceInput,
        template_name : String,
        client_token : String? = nil,
        description : String? = nil,
        major_version : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEnvironmentTemplateVersionOutput

        input = Types::CreateEnvironmentTemplateVersionInput.new(source: source, template_name: template_name, client_token: client_token, description: description, major_version: major_version, tags: tags)
        create_environment_template_version(input)
      end

      def create_environment_template_version(input : Types::CreateEnvironmentTemplateVersionInput) : Types::CreateEnvironmentTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentTemplateVersionOutput, "CreateEnvironmentTemplateVersion")
      end

      # Create and register a link to a repository. Proton uses the link to repeatedly access the
      # repository, to either push to it (self-managed provisioning) or pull from it (template sync). You
      # can share a linked repository across multiple resources (like environments using self-managed
      # provisioning, or synced templates). When you create a repository link, Proton creates a
      # service-linked role for you. For more information, see Self-managed provisioning , Template bundles
      # , and Template sync configurations in the Proton User Guide .

      def create_repository(
        connection_arn : String,
        name : String,
        provider : String,
        encryption_key : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRepositoryOutput

        input = Types::CreateRepositoryInput.new(connection_arn: connection_arn, name: name, provider: provider, encryption_key: encryption_key, tags: tags)
        create_repository(input)
      end

      def create_repository(input : Types::CreateRepositoryInput) : Types::CreateRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRepositoryOutput, "CreateRepository")
      end

      # Create an Proton service. An Proton service is an instantiation of a service template and often
      # includes several service instances and pipeline. For more information, see Services in the Proton
      # User Guide .

      def create_service(
        name : String,
        spec : String,
        template_major_version : String,
        template_name : String,
        branch_name : String? = nil,
        description : String? = nil,
        repository_connection_arn : String? = nil,
        repository_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        template_minor_version : String? = nil
      ) : Types::CreateServiceOutput

        input = Types::CreateServiceInput.new(name: name, spec: spec, template_major_version: template_major_version, template_name: template_name, branch_name: branch_name, description: description, repository_connection_arn: repository_connection_arn, repository_id: repository_id, tags: tags, template_minor_version: template_minor_version)
        create_service(input)
      end

      def create_service(input : Types::CreateServiceInput) : Types::CreateServiceOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceOutput, "CreateService")
      end

      # Create a service instance.

      def create_service_instance(
        name : String,
        service_name : String,
        spec : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil,
        template_major_version : String? = nil,
        template_minor_version : String? = nil
      ) : Types::CreateServiceInstanceOutput

        input = Types::CreateServiceInstanceInput.new(name: name, service_name: service_name, spec: spec, client_token: client_token, tags: tags, template_major_version: template_major_version, template_minor_version: template_minor_version)
        create_service_instance(input)
      end

      def create_service_instance(input : Types::CreateServiceInstanceInput) : Types::CreateServiceInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceInstanceOutput, "CreateServiceInstance")
      end

      # Create the Proton Ops configuration file.

      def create_service_sync_config(
        branch : String,
        file_path : String,
        repository_name : String,
        repository_provider : String,
        service_name : String
      ) : Types::CreateServiceSyncConfigOutput

        input = Types::CreateServiceSyncConfigInput.new(branch: branch, file_path: file_path, repository_name: repository_name, repository_provider: repository_provider, service_name: service_name)
        create_service_sync_config(input)
      end

      def create_service_sync_config(input : Types::CreateServiceSyncConfigInput) : Types::CreateServiceSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceSyncConfigOutput, "CreateServiceSyncConfig")
      end

      # Create a service template. The administrator creates a service template to define standardized
      # infrastructure and an optional CI/CD service pipeline. Developers, in turn, select the service
      # template from Proton. If the selected service template includes a service pipeline definition, they
      # provide a link to their source code repository. Proton then deploys and manages the infrastructure
      # defined by the selected service template. For more information, see Proton templates in the Proton
      # User Guide .

      def create_service_template(
        name : String,
        description : String? = nil,
        display_name : String? = nil,
        encryption_key : String? = nil,
        pipeline_provisioning : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateServiceTemplateOutput

        input = Types::CreateServiceTemplateInput.new(name: name, description: description, display_name: display_name, encryption_key: encryption_key, pipeline_provisioning: pipeline_provisioning, tags: tags)
        create_service_template(input)
      end

      def create_service_template(input : Types::CreateServiceTemplateInput) : Types::CreateServiceTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceTemplateOutput, "CreateServiceTemplate")
      end

      # Create a new major or minor version of a service template. A major version of a service template is
      # a version that isn't backward compatible. A minor version of a service template is a version that's
      # backward compatible within its major version.

      def create_service_template_version(
        compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplateInput),
        source : Types::TemplateVersionSourceInput,
        template_name : String,
        client_token : String? = nil,
        description : String? = nil,
        major_version : String? = nil,
        supported_component_sources : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateServiceTemplateVersionOutput

        input = Types::CreateServiceTemplateVersionInput.new(compatible_environment_templates: compatible_environment_templates, source: source, template_name: template_name, client_token: client_token, description: description, major_version: major_version, supported_component_sources: supported_component_sources, tags: tags)
        create_service_template_version(input)
      end

      def create_service_template_version(input : Types::CreateServiceTemplateVersionInput) : Types::CreateServiceTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceTemplateVersionOutput, "CreateServiceTemplateVersion")
      end

      # Set up a template to create new template versions automatically by tracking a linked repository. A
      # linked repository is a repository that has been registered with Proton. For more information, see
      # CreateRepository . When a commit is pushed to your linked repository, Proton checks for changes to
      # your repository template bundles. If it detects a template bundle change, a new major or minor
      # version of its template is created, if the version doesn’t already exist. For more information, see
      # Template sync configurations in the Proton User Guide .

      def create_template_sync_config(
        branch : String,
        repository_name : String,
        repository_provider : String,
        template_name : String,
        template_type : String,
        subdirectory : String? = nil
      ) : Types::CreateTemplateSyncConfigOutput

        input = Types::CreateTemplateSyncConfigInput.new(branch: branch, repository_name: repository_name, repository_provider: repository_provider, template_name: template_name, template_type: template_type, subdirectory: subdirectory)
        create_template_sync_config(input)
      end

      def create_template_sync_config(input : Types::CreateTemplateSyncConfigInput) : Types::CreateTemplateSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_TEMPLATE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTemplateSyncConfigOutput, "CreateTemplateSyncConfig")
      end

      # Delete an Proton component resource. For more information about components, see Proton components in
      # the Proton User Guide .

      def delete_component(
        name : String
      ) : Types::DeleteComponentOutput

        input = Types::DeleteComponentInput.new(name: name)
        delete_component(input)
      end

      def delete_component(input : Types::DeleteComponentInput) : Types::DeleteComponentOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteComponentOutput, "DeleteComponent")
      end

      # Delete the deployment.

      def delete_deployment(
        id : String
      ) : Types::DeleteDeploymentOutput

        input = Types::DeleteDeploymentInput.new(id: id)
        delete_deployment(input)
      end

      def delete_deployment(input : Types::DeleteDeploymentInput) : Types::DeleteDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDeploymentOutput, "DeleteDeployment")
      end

      # Delete an environment.

      def delete_environment(
        name : String
      ) : Types::DeleteEnvironmentOutput

        input = Types::DeleteEnvironmentInput.new(name: name)
        delete_environment(input)
      end

      def delete_environment(input : Types::DeleteEnvironmentInput) : Types::DeleteEnvironmentOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentOutput, "DeleteEnvironment")
      end

      # In an environment account, delete an environment account connection. After you delete an environment
      # account connection that’s in use by an Proton environment, Proton can’t manage the environment
      # infrastructure resources until a new environment account connection is accepted for the environment
      # account and associated environment. You're responsible for cleaning up provisioned resources that
      # remain without an environment connection. For more information, see Environment account connections
      # in the Proton User guide .

      def delete_environment_account_connection(
        id : String
      ) : Types::DeleteEnvironmentAccountConnectionOutput

        input = Types::DeleteEnvironmentAccountConnectionInput.new(id: id)
        delete_environment_account_connection(input)
      end

      def delete_environment_account_connection(input : Types::DeleteEnvironmentAccountConnectionInput) : Types::DeleteEnvironmentAccountConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT_ACCOUNT_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentAccountConnectionOutput, "DeleteEnvironmentAccountConnection")
      end

      # If no other major or minor versions of an environment template exist, delete the environment
      # template.

      def delete_environment_template(
        name : String
      ) : Types::DeleteEnvironmentTemplateOutput

        input = Types::DeleteEnvironmentTemplateInput.new(name: name)
        delete_environment_template(input)
      end

      def delete_environment_template(input : Types::DeleteEnvironmentTemplateInput) : Types::DeleteEnvironmentTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentTemplateOutput, "DeleteEnvironmentTemplate")
      end

      # If no other minor versions of an environment template exist, delete a major version of the
      # environment template if it's not the Recommended version. Delete the Recommended version of the
      # environment template if no other major versions or minor versions of the environment template exist.
      # A major version of an environment template is a version that's not backward compatible. Delete a
      # minor version of an environment template if it isn't the Recommended version. Delete a Recommended
      # minor version of the environment template if no other minor versions of the environment template
      # exist. A minor version of an environment template is a version that's backward compatible.

      def delete_environment_template_version(
        major_version : String,
        minor_version : String,
        template_name : String
      ) : Types::DeleteEnvironmentTemplateVersionOutput

        input = Types::DeleteEnvironmentTemplateVersionInput.new(major_version: major_version, minor_version: minor_version, template_name: template_name)
        delete_environment_template_version(input)
      end

      def delete_environment_template_version(input : Types::DeleteEnvironmentTemplateVersionInput) : Types::DeleteEnvironmentTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentTemplateVersionOutput, "DeleteEnvironmentTemplateVersion")
      end

      # De-register and unlink your repository.

      def delete_repository(
        name : String,
        provider : String
      ) : Types::DeleteRepositoryOutput

        input = Types::DeleteRepositoryInput.new(name: name, provider: provider)
        delete_repository(input)
      end

      def delete_repository(input : Types::DeleteRepositoryInput) : Types::DeleteRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRepositoryOutput, "DeleteRepository")
      end

      # Delete a service, with its instances and pipeline. You can't delete a service if it has any service
      # instances that have components attached to them. For more information about components, see Proton
      # components in the Proton User Guide .

      def delete_service(
        name : String
      ) : Types::DeleteServiceOutput

        input = Types::DeleteServiceInput.new(name: name)
        delete_service(input)
      end

      def delete_service(input : Types::DeleteServiceInput) : Types::DeleteServiceOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceOutput, "DeleteService")
      end

      # Delete the Proton Ops file.

      def delete_service_sync_config(
        service_name : String
      ) : Types::DeleteServiceSyncConfigOutput

        input = Types::DeleteServiceSyncConfigInput.new(service_name: service_name)
        delete_service_sync_config(input)
      end

      def delete_service_sync_config(input : Types::DeleteServiceSyncConfigInput) : Types::DeleteServiceSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceSyncConfigOutput, "DeleteServiceSyncConfig")
      end

      # If no other major or minor versions of the service template exist, delete the service template.

      def delete_service_template(
        name : String
      ) : Types::DeleteServiceTemplateOutput

        input = Types::DeleteServiceTemplateInput.new(name: name)
        delete_service_template(input)
      end

      def delete_service_template(input : Types::DeleteServiceTemplateInput) : Types::DeleteServiceTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceTemplateOutput, "DeleteServiceTemplate")
      end

      # If no other minor versions of a service template exist, delete a major version of the service
      # template if it's not the Recommended version. Delete the Recommended version of the service template
      # if no other major versions or minor versions of the service template exist. A major version of a
      # service template is a version that isn't backwards compatible. Delete a minor version of a service
      # template if it's not the Recommended version. Delete a Recommended minor version of the service
      # template if no other minor versions of the service template exist. A minor version of a service
      # template is a version that's backwards compatible.

      def delete_service_template_version(
        major_version : String,
        minor_version : String,
        template_name : String
      ) : Types::DeleteServiceTemplateVersionOutput

        input = Types::DeleteServiceTemplateVersionInput.new(major_version: major_version, minor_version: minor_version, template_name: template_name)
        delete_service_template_version(input)
      end

      def delete_service_template_version(input : Types::DeleteServiceTemplateVersionInput) : Types::DeleteServiceTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceTemplateVersionOutput, "DeleteServiceTemplateVersion")
      end

      # Delete a template sync configuration.

      def delete_template_sync_config(
        template_name : String,
        template_type : String
      ) : Types::DeleteTemplateSyncConfigOutput

        input = Types::DeleteTemplateSyncConfigInput.new(template_name: template_name, template_type: template_type)
        delete_template_sync_config(input)
      end

      def delete_template_sync_config(input : Types::DeleteTemplateSyncConfigInput) : Types::DeleteTemplateSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_TEMPLATE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTemplateSyncConfigOutput, "DeleteTemplateSyncConfig")
      end

      # Get detail data for Proton account-wide settings.

      def get_account_settings : Types::GetAccountSettingsOutput
        input = Types::GetAccountSettingsInput.new
        get_account_settings(input)
      end

      def get_account_settings(input : Types::GetAccountSettingsInput) : Types::GetAccountSettingsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountSettingsOutput, "GetAccountSettings")
      end

      # Get detailed data for a component. For more information about components, see Proton components in
      # the Proton User Guide .

      def get_component(
        name : String
      ) : Types::GetComponentOutput

        input = Types::GetComponentInput.new(name: name)
        get_component(input)
      end

      def get_component(input : Types::GetComponentInput) : Types::GetComponentOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComponentOutput, "GetComponent")
      end

      # Get detailed data for a deployment.

      def get_deployment(
        id : String,
        component_name : String? = nil,
        environment_name : String? = nil,
        service_instance_name : String? = nil,
        service_name : String? = nil
      ) : Types::GetDeploymentOutput

        input = Types::GetDeploymentInput.new(id: id, component_name: component_name, environment_name: environment_name, service_instance_name: service_instance_name, service_name: service_name)
        get_deployment(input)
      end

      def get_deployment(input : Types::GetDeploymentInput) : Types::GetDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeploymentOutput, "GetDeployment")
      end

      # Get detailed data for an environment.

      def get_environment(
        name : String
      ) : Types::GetEnvironmentOutput

        input = Types::GetEnvironmentInput.new(name: name)
        get_environment(input)
      end

      def get_environment(input : Types::GetEnvironmentInput) : Types::GetEnvironmentOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnvironmentOutput, "GetEnvironment")
      end

      # In an environment account, get the detailed data for an environment account connection. For more
      # information, see Environment account connections in the Proton User guide .

      def get_environment_account_connection(
        id : String
      ) : Types::GetEnvironmentAccountConnectionOutput

        input = Types::GetEnvironmentAccountConnectionInput.new(id: id)
        get_environment_account_connection(input)
      end

      def get_environment_account_connection(input : Types::GetEnvironmentAccountConnectionInput) : Types::GetEnvironmentAccountConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ENVIRONMENT_ACCOUNT_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnvironmentAccountConnectionOutput, "GetEnvironmentAccountConnection")
      end

      # Get detailed data for an environment template.

      def get_environment_template(
        name : String
      ) : Types::GetEnvironmentTemplateOutput

        input = Types::GetEnvironmentTemplateInput.new(name: name)
        get_environment_template(input)
      end

      def get_environment_template(input : Types::GetEnvironmentTemplateInput) : Types::GetEnvironmentTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ENVIRONMENT_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnvironmentTemplateOutput, "GetEnvironmentTemplate")
      end

      # Get detailed data for a major or minor version of an environment template.

      def get_environment_template_version(
        major_version : String,
        minor_version : String,
        template_name : String
      ) : Types::GetEnvironmentTemplateVersionOutput

        input = Types::GetEnvironmentTemplateVersionInput.new(major_version: major_version, minor_version: minor_version, template_name: template_name)
        get_environment_template_version(input)
      end

      def get_environment_template_version(input : Types::GetEnvironmentTemplateVersionInput) : Types::GetEnvironmentTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ENVIRONMENT_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnvironmentTemplateVersionOutput, "GetEnvironmentTemplateVersion")
      end

      # Get detail data for a linked repository.

      def get_repository(
        name : String,
        provider : String
      ) : Types::GetRepositoryOutput

        input = Types::GetRepositoryInput.new(name: name, provider: provider)
        get_repository(input)
      end

      def get_repository(input : Types::GetRepositoryInput) : Types::GetRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositoryOutput, "GetRepository")
      end

      # Get the sync status of a repository used for Proton template sync. For more information about
      # template sync, see . A repository sync status isn't tied to the Proton Repository resource (or any
      # other Proton resource). Therefore, tags on an Proton Repository resource have no effect on this
      # action. Specifically, you can't use these tags to control access to this action using
      # Attribute-based access control (ABAC). For more information about ABAC, see ABAC in the Proton User
      # Guide .

      def get_repository_sync_status(
        branch : String,
        repository_name : String,
        repository_provider : String,
        sync_type : String
      ) : Types::GetRepositorySyncStatusOutput

        input = Types::GetRepositorySyncStatusInput.new(branch: branch, repository_name: repository_name, repository_provider: repository_provider, sync_type: sync_type)
        get_repository_sync_status(input)
      end

      def get_repository_sync_status(input : Types::GetRepositorySyncStatusInput) : Types::GetRepositorySyncStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY_SYNC_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositorySyncStatusOutput, "GetRepositorySyncStatus")
      end

      # Get counts of Proton resources. For infrastructure-provisioning resources (environments, services,
      # service instances, pipelines), the action returns staleness counts. A resource is stale when it's
      # behind the recommended version of the Proton template that it uses and it needs an update to become
      # current. The action returns staleness counts (counts of resources that are up-to-date, behind a
      # template major version, or behind a template minor version), the total number of resources, and the
      # number of resources that are in a failed state, grouped by resource type. Components, environments,
      # and service templates return less information - see the components , environments , and
      # serviceTemplates field descriptions. For context, the action also returns the total number of each
      # type of Proton template in the Amazon Web Services account. For more information, see Proton
      # dashboard in the Proton User Guide .

      def get_resources_summary : Types::GetResourcesSummaryOutput
        input = Types::GetResourcesSummaryInput.new
        get_resources_summary(input)
      end

      def get_resources_summary(input : Types::GetResourcesSummaryInput) : Types::GetResourcesSummaryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCES_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcesSummaryOutput, "GetResourcesSummary")
      end

      # Get detailed data for a service.

      def get_service(
        name : String
      ) : Types::GetServiceOutput

        input = Types::GetServiceInput.new(name: name)
        get_service(input)
      end

      def get_service(input : Types::GetServiceInput) : Types::GetServiceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceOutput, "GetService")
      end

      # Get detailed data for a service instance. A service instance is an instantiation of service template
      # and it runs in a specific environment.

      def get_service_instance(
        name : String,
        service_name : String
      ) : Types::GetServiceInstanceOutput

        input = Types::GetServiceInstanceInput.new(name: name, service_name: service_name)
        get_service_instance(input)
      end

      def get_service_instance(input : Types::GetServiceInstanceInput) : Types::GetServiceInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceInstanceOutput, "GetServiceInstance")
      end

      # Get the status of the synced service instance.

      def get_service_instance_sync_status(
        service_instance_name : String,
        service_name : String
      ) : Types::GetServiceInstanceSyncStatusOutput

        input = Types::GetServiceInstanceSyncStatusInput.new(service_instance_name: service_instance_name, service_name: service_name)
        get_service_instance_sync_status(input)
      end

      def get_service_instance_sync_status(input : Types::GetServiceInstanceSyncStatusInput) : Types::GetServiceInstanceSyncStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_INSTANCE_SYNC_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceInstanceSyncStatusOutput, "GetServiceInstanceSyncStatus")
      end

      # Get detailed data for the service sync blocker summary.

      def get_service_sync_blocker_summary(
        service_name : String,
        service_instance_name : String? = nil
      ) : Types::GetServiceSyncBlockerSummaryOutput

        input = Types::GetServiceSyncBlockerSummaryInput.new(service_name: service_name, service_instance_name: service_instance_name)
        get_service_sync_blocker_summary(input)
      end

      def get_service_sync_blocker_summary(input : Types::GetServiceSyncBlockerSummaryInput) : Types::GetServiceSyncBlockerSummaryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_SYNC_BLOCKER_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceSyncBlockerSummaryOutput, "GetServiceSyncBlockerSummary")
      end

      # Get detailed information for the service sync configuration.

      def get_service_sync_config(
        service_name : String
      ) : Types::GetServiceSyncConfigOutput

        input = Types::GetServiceSyncConfigInput.new(service_name: service_name)
        get_service_sync_config(input)
      end

      def get_service_sync_config(input : Types::GetServiceSyncConfigInput) : Types::GetServiceSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceSyncConfigOutput, "GetServiceSyncConfig")
      end

      # Get detailed data for a service template.

      def get_service_template(
        name : String
      ) : Types::GetServiceTemplateOutput

        input = Types::GetServiceTemplateInput.new(name: name)
        get_service_template(input)
      end

      def get_service_template(input : Types::GetServiceTemplateInput) : Types::GetServiceTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceTemplateOutput, "GetServiceTemplate")
      end

      # Get detailed data for a major or minor version of a service template.

      def get_service_template_version(
        major_version : String,
        minor_version : String,
        template_name : String
      ) : Types::GetServiceTemplateVersionOutput

        input = Types::GetServiceTemplateVersionInput.new(major_version: major_version, minor_version: minor_version, template_name: template_name)
        get_service_template_version(input)
      end

      def get_service_template_version(input : Types::GetServiceTemplateVersionInput) : Types::GetServiceTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceTemplateVersionOutput, "GetServiceTemplateVersion")
      end

      # Get detail data for a template sync configuration.

      def get_template_sync_config(
        template_name : String,
        template_type : String
      ) : Types::GetTemplateSyncConfigOutput

        input = Types::GetTemplateSyncConfigInput.new(template_name: template_name, template_type: template_type)
        get_template_sync_config(input)
      end

      def get_template_sync_config(input : Types::GetTemplateSyncConfigInput) : Types::GetTemplateSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::GET_TEMPLATE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTemplateSyncConfigOutput, "GetTemplateSyncConfig")
      end

      # Get the status of a template sync.

      def get_template_sync_status(
        template_name : String,
        template_type : String,
        template_version : String
      ) : Types::GetTemplateSyncStatusOutput

        input = Types::GetTemplateSyncStatusInput.new(template_name: template_name, template_type: template_type, template_version: template_version)
        get_template_sync_status(input)
      end

      def get_template_sync_status(input : Types::GetTemplateSyncStatusInput) : Types::GetTemplateSyncStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_TEMPLATE_SYNC_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTemplateSyncStatusOutput, "GetTemplateSyncStatus")
      end

      # Get a list of component Infrastructure as Code (IaC) outputs. For more information about components,
      # see Proton components in the Proton User Guide .

      def list_component_outputs(
        component_name : String,
        deployment_id : String? = nil,
        next_token : String? = nil
      ) : Types::ListComponentOutputsOutput

        input = Types::ListComponentOutputsInput.new(component_name: component_name, deployment_id: deployment_id, next_token: next_token)
        list_component_outputs(input)
      end

      def list_component_outputs(input : Types::ListComponentOutputsInput) : Types::ListComponentOutputsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPONENT_OUTPUTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComponentOutputsOutput, "ListComponentOutputs")
      end

      # List provisioned resources for a component with details. For more information about components, see
      # Proton components in the Proton User Guide .

      def list_component_provisioned_resources(
        component_name : String,
        next_token : String? = nil
      ) : Types::ListComponentProvisionedResourcesOutput

        input = Types::ListComponentProvisionedResourcesInput.new(component_name: component_name, next_token: next_token)
        list_component_provisioned_resources(input)
      end

      def list_component_provisioned_resources(input : Types::ListComponentProvisionedResourcesInput) : Types::ListComponentProvisionedResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPONENT_PROVISIONED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComponentProvisionedResourcesOutput, "ListComponentProvisionedResources")
      end

      # List components with summary data. You can filter the result list by environment, service, or a
      # single service instance. For more information about components, see Proton components in the Proton
      # User Guide .

      def list_components(
        environment_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_instance_name : String? = nil,
        service_name : String? = nil
      ) : Types::ListComponentsOutput

        input = Types::ListComponentsInput.new(environment_name: environment_name, max_results: max_results, next_token: next_token, service_instance_name: service_instance_name, service_name: service_name)
        list_components(input)
      end

      def list_components(input : Types::ListComponentsInput) : Types::ListComponentsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPONENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComponentsOutput, "ListComponents")
      end

      # List deployments. You can filter the result list by environment, service, or a single service
      # instance.

      def list_deployments(
        component_name : String? = nil,
        environment_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_instance_name : String? = nil,
        service_name : String? = nil
      ) : Types::ListDeploymentsOutput

        input = Types::ListDeploymentsInput.new(component_name: component_name, environment_name: environment_name, max_results: max_results, next_token: next_token, service_instance_name: service_instance_name, service_name: service_name)
        list_deployments(input)
      end

      def list_deployments(input : Types::ListDeploymentsInput) : Types::ListDeploymentsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeploymentsOutput, "ListDeployments")
      end

      # View a list of environment account connections. For more information, see Environment account
      # connections in the Proton User guide .

      def list_environment_account_connections(
        requested_by : String,
        environment_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        statuses : Array(String)? = nil
      ) : Types::ListEnvironmentAccountConnectionsOutput

        input = Types::ListEnvironmentAccountConnectionsInput.new(requested_by: requested_by, environment_name: environment_name, max_results: max_results, next_token: next_token, statuses: statuses)
        list_environment_account_connections(input)
      end

      def list_environment_account_connections(input : Types::ListEnvironmentAccountConnectionsInput) : Types::ListEnvironmentAccountConnectionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENT_ACCOUNT_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentAccountConnectionsOutput, "ListEnvironmentAccountConnections")
      end

      # List the infrastructure as code outputs for your environment.

      def list_environment_outputs(
        environment_name : String,
        deployment_id : String? = nil,
        next_token : String? = nil
      ) : Types::ListEnvironmentOutputsOutput

        input = Types::ListEnvironmentOutputsInput.new(environment_name: environment_name, deployment_id: deployment_id, next_token: next_token)
        list_environment_outputs(input)
      end

      def list_environment_outputs(input : Types::ListEnvironmentOutputsInput) : Types::ListEnvironmentOutputsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENT_OUTPUTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentOutputsOutput, "ListEnvironmentOutputs")
      end

      # List the provisioned resources for your environment.

      def list_environment_provisioned_resources(
        environment_name : String,
        next_token : String? = nil
      ) : Types::ListEnvironmentProvisionedResourcesOutput

        input = Types::ListEnvironmentProvisionedResourcesInput.new(environment_name: environment_name, next_token: next_token)
        list_environment_provisioned_resources(input)
      end

      def list_environment_provisioned_resources(input : Types::ListEnvironmentProvisionedResourcesInput) : Types::ListEnvironmentProvisionedResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENT_PROVISIONED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentProvisionedResourcesOutput, "ListEnvironmentProvisionedResources")
      end

      # List major or minor versions of an environment template with detail data.

      def list_environment_template_versions(
        template_name : String,
        major_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEnvironmentTemplateVersionsOutput

        input = Types::ListEnvironmentTemplateVersionsInput.new(template_name: template_name, major_version: major_version, max_results: max_results, next_token: next_token)
        list_environment_template_versions(input)
      end

      def list_environment_template_versions(input : Types::ListEnvironmentTemplateVersionsInput) : Types::ListEnvironmentTemplateVersionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENT_TEMPLATE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentTemplateVersionsOutput, "ListEnvironmentTemplateVersions")
      end

      # List environment templates.

      def list_environment_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEnvironmentTemplatesOutput

        input = Types::ListEnvironmentTemplatesInput.new(max_results: max_results, next_token: next_token)
        list_environment_templates(input)
      end

      def list_environment_templates(input : Types::ListEnvironmentTemplatesInput) : Types::ListEnvironmentTemplatesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENT_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentTemplatesOutput, "ListEnvironmentTemplates")
      end

      # List environments with detail data summaries.

      def list_environments(
        environment_templates : Array(Types::EnvironmentTemplateFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEnvironmentsOutput

        input = Types::ListEnvironmentsInput.new(environment_templates: environment_templates, max_results: max_results, next_token: next_token)
        list_environments(input)
      end

      def list_environments(input : Types::ListEnvironmentsInput) : Types::ListEnvironmentsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentsOutput, "ListEnvironments")
      end

      # List linked repositories with detail data.

      def list_repositories(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRepositoriesOutput

        input = Types::ListRepositoriesInput.new(max_results: max_results, next_token: next_token)
        list_repositories(input)
      end

      def list_repositories(input : Types::ListRepositoriesInput) : Types::ListRepositoriesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPOSITORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRepositoriesOutput, "ListRepositories")
      end

      # List repository sync definitions with detail data.

      def list_repository_sync_definitions(
        repository_name : String,
        repository_provider : String,
        sync_type : String,
        next_token : String? = nil
      ) : Types::ListRepositorySyncDefinitionsOutput

        input = Types::ListRepositorySyncDefinitionsInput.new(repository_name: repository_name, repository_provider: repository_provider, sync_type: sync_type, next_token: next_token)
        list_repository_sync_definitions(input)
      end

      def list_repository_sync_definitions(input : Types::ListRepositorySyncDefinitionsInput) : Types::ListRepositorySyncDefinitionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPOSITORY_SYNC_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRepositorySyncDefinitionsOutput, "ListRepositorySyncDefinitions")
      end

      # Get a list service of instance Infrastructure as Code (IaC) outputs.

      def list_service_instance_outputs(
        service_instance_name : String,
        service_name : String,
        deployment_id : String? = nil,
        next_token : String? = nil
      ) : Types::ListServiceInstanceOutputsOutput

        input = Types::ListServiceInstanceOutputsInput.new(service_instance_name: service_instance_name, service_name: service_name, deployment_id: deployment_id, next_token: next_token)
        list_service_instance_outputs(input)
      end

      def list_service_instance_outputs(input : Types::ListServiceInstanceOutputsInput) : Types::ListServiceInstanceOutputsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_INSTANCE_OUTPUTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceInstanceOutputsOutput, "ListServiceInstanceOutputs")
      end

      # List provisioned resources for a service instance with details.

      def list_service_instance_provisioned_resources(
        service_instance_name : String,
        service_name : String,
        next_token : String? = nil
      ) : Types::ListServiceInstanceProvisionedResourcesOutput

        input = Types::ListServiceInstanceProvisionedResourcesInput.new(service_instance_name: service_instance_name, service_name: service_name, next_token: next_token)
        list_service_instance_provisioned_resources(input)
      end

      def list_service_instance_provisioned_resources(input : Types::ListServiceInstanceProvisionedResourcesInput) : Types::ListServiceInstanceProvisionedResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_INSTANCE_PROVISIONED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceInstanceProvisionedResourcesOutput, "ListServiceInstanceProvisionedResources")
      end

      # List service instances with summary data. This action lists service instances of all services in the
      # Amazon Web Services account.

      def list_service_instances(
        filters : Array(Types::ListServiceInstancesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_name : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListServiceInstancesOutput

        input = Types::ListServiceInstancesInput.new(filters: filters, max_results: max_results, next_token: next_token, service_name: service_name, sort_by: sort_by, sort_order: sort_order)
        list_service_instances(input)
      end

      def list_service_instances(input : Types::ListServiceInstancesInput) : Types::ListServiceInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceInstancesOutput, "ListServiceInstances")
      end

      # Get a list of service pipeline Infrastructure as Code (IaC) outputs.

      def list_service_pipeline_outputs(
        service_name : String,
        deployment_id : String? = nil,
        next_token : String? = nil
      ) : Types::ListServicePipelineOutputsOutput

        input = Types::ListServicePipelineOutputsInput.new(service_name: service_name, deployment_id: deployment_id, next_token: next_token)
        list_service_pipeline_outputs(input)
      end

      def list_service_pipeline_outputs(input : Types::ListServicePipelineOutputsInput) : Types::ListServicePipelineOutputsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_PIPELINE_OUTPUTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicePipelineOutputsOutput, "ListServicePipelineOutputs")
      end

      # List provisioned resources for a service and pipeline with details.

      def list_service_pipeline_provisioned_resources(
        service_name : String,
        next_token : String? = nil
      ) : Types::ListServicePipelineProvisionedResourcesOutput

        input = Types::ListServicePipelineProvisionedResourcesInput.new(service_name: service_name, next_token: next_token)
        list_service_pipeline_provisioned_resources(input)
      end

      def list_service_pipeline_provisioned_resources(input : Types::ListServicePipelineProvisionedResourcesInput) : Types::ListServicePipelineProvisionedResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_PIPELINE_PROVISIONED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicePipelineProvisionedResourcesOutput, "ListServicePipelineProvisionedResources")
      end

      # List major or minor versions of a service template with detail data.

      def list_service_template_versions(
        template_name : String,
        major_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServiceTemplateVersionsOutput

        input = Types::ListServiceTemplateVersionsInput.new(template_name: template_name, major_version: major_version, max_results: max_results, next_token: next_token)
        list_service_template_versions(input)
      end

      def list_service_template_versions(input : Types::ListServiceTemplateVersionsInput) : Types::ListServiceTemplateVersionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_TEMPLATE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceTemplateVersionsOutput, "ListServiceTemplateVersions")
      end

      # List service templates with detail data.

      def list_service_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServiceTemplatesOutput

        input = Types::ListServiceTemplatesInput.new(max_results: max_results, next_token: next_token)
        list_service_templates(input)
      end

      def list_service_templates(input : Types::ListServiceTemplatesInput) : Types::ListServiceTemplatesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceTemplatesOutput, "ListServiceTemplates")
      end

      # List services with summaries of detail data.

      def list_services(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServicesOutput

        input = Types::ListServicesInput.new(max_results: max_results, next_token: next_token)
        list_services(input)
      end

      def list_services(input : Types::ListServicesInput) : Types::ListServicesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicesOutput, "ListServices")
      end

      # List tags for a resource. For more information, see Proton resources and tagging in the Proton User
      # Guide .

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

      # Notify Proton of status changes to a provisioned resource when you use self-managed provisioning.
      # For more information, see Self-managed provisioning in the Proton User Guide .

      def notify_resource_deployment_status_change(
        resource_arn : String,
        deployment_id : String? = nil,
        outputs : Array(Types::Output)? = nil,
        status : String? = nil,
        status_message : String? = nil
      ) : Types::NotifyResourceDeploymentStatusChangeOutput

        input = Types::NotifyResourceDeploymentStatusChangeInput.new(resource_arn: resource_arn, deployment_id: deployment_id, outputs: outputs, status: status, status_message: status_message)
        notify_resource_deployment_status_change(input)
      end

      def notify_resource_deployment_status_change(input : Types::NotifyResourceDeploymentStatusChangeInput) : Types::NotifyResourceDeploymentStatusChangeOutput
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_RESOURCE_DEPLOYMENT_STATUS_CHANGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyResourceDeploymentStatusChangeOutput, "NotifyResourceDeploymentStatusChange")
      end

      # In a management account, reject an environment account connection from another environment account.
      # After you reject an environment account connection request, you can't accept or use the rejected
      # environment account connection. You can’t reject an environment account connection that's connected
      # to an environment. For more information, see Environment account connections in the Proton User
      # guide .

      def reject_environment_account_connection(
        id : String
      ) : Types::RejectEnvironmentAccountConnectionOutput

        input = Types::RejectEnvironmentAccountConnectionInput.new(id: id)
        reject_environment_account_connection(input)
      end

      def reject_environment_account_connection(input : Types::RejectEnvironmentAccountConnectionInput) : Types::RejectEnvironmentAccountConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::REJECT_ENVIRONMENT_ACCOUNT_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectEnvironmentAccountConnectionOutput, "RejectEnvironmentAccountConnection")
      end

      # Tag a resource. A tag is a key-value pair of metadata that you associate with an Proton resource.
      # For more information, see Proton resources and tagging in the Proton User Guide .

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

      # Remove a customer tag from a resource. A tag is a key-value pair of metadata associated with an
      # Proton resource. For more information, see Proton resources and tagging in the Proton User Guide .

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

      # Update Proton settings that are used for multiple services in the Amazon Web Services account.

      def update_account_settings(
        delete_pipeline_provisioning_repository : Bool? = nil,
        pipeline_codebuild_role_arn : String? = nil,
        pipeline_provisioning_repository : Types::RepositoryBranchInput? = nil,
        pipeline_service_role_arn : String? = nil
      ) : Types::UpdateAccountSettingsOutput

        input = Types::UpdateAccountSettingsInput.new(delete_pipeline_provisioning_repository: delete_pipeline_provisioning_repository, pipeline_codebuild_role_arn: pipeline_codebuild_role_arn, pipeline_provisioning_repository: pipeline_provisioning_repository, pipeline_service_role_arn: pipeline_service_role_arn)
        update_account_settings(input)
      end

      def update_account_settings(input : Types::UpdateAccountSettingsInput) : Types::UpdateAccountSettingsOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAccountSettingsOutput, "UpdateAccountSettings")
      end

      # Update a component. There are a few modes for updating a component. The deploymentType field defines
      # the mode. You can't update a component while its deployment status, or the deployment status of a
      # service instance attached to it, is IN_PROGRESS . For more information about components, see Proton
      # components in the Proton User Guide .

      def update_component(
        deployment_type : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        service_instance_name : String? = nil,
        service_name : String? = nil,
        service_spec : String? = nil,
        template_file : String? = nil
      ) : Types::UpdateComponentOutput

        input = Types::UpdateComponentInput.new(deployment_type: deployment_type, name: name, client_token: client_token, description: description, service_instance_name: service_instance_name, service_name: service_name, service_spec: service_spec, template_file: template_file)
        update_component(input)
      end

      def update_component(input : Types::UpdateComponentInput) : Types::UpdateComponentOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateComponentOutput, "UpdateComponent")
      end

      # Update an environment. If the environment is associated with an environment account connection,
      # don't update or include the protonServiceRoleArn and provisioningRepository parameter to update or
      # connect to an environment account connection. You can only update to a new environment account
      # connection if that connection was created in the same environment account that the current
      # environment account connection was created in. The account connection must also be associated with
      # the current environment. If the environment isn't associated with an environment account connection,
      # don't update or include the environmentAccountConnectionId parameter. You can't update or connect
      # the environment to an environment account connection if it isn't already associated with an
      # environment connection. You can update either the environmentAccountConnectionId or
      # protonServiceRoleArn parameter and value. You can’t update both. If the environment was configured
      # for Amazon Web Services-managed provisioning, omit the provisioningRepository parameter. If the
      # environment was configured for self-managed provisioning, specify the provisioningRepository
      # parameter and omit the protonServiceRoleArn and environmentAccountConnectionId parameters. For more
      # information, see Environments and Provisioning methods in the Proton User Guide . There are four
      # modes for updating an environment. The deploymentType field defines the mode. NONE In this mode, a
      # deployment doesn't occur. Only the requested metadata parameters are updated. CURRENT_VERSION In
      # this mode, the environment is deployed and updated with the new spec that you provide. Only
      # requested parameters are updated. Don’t include minor or major version parameters when you use this
      # deployment-type . MINOR_VERSION In this mode, the environment is deployed and updated with the
      # published, recommended (latest) minor version of the current major version in use, by default. You
      # can also specify a different minor version of the current major version in use. MAJOR_VERSION In
      # this mode, the environment is deployed and updated with the published, recommended (latest) major
      # and minor version of the current template, by default. You can also specify a different major
      # version that's higher than the major version in use and a minor version.

      def update_environment(
        deployment_type : String,
        name : String,
        codebuild_role_arn : String? = nil,
        component_role_arn : String? = nil,
        description : String? = nil,
        environment_account_connection_id : String? = nil,
        proton_service_role_arn : String? = nil,
        provisioning_repository : Types::RepositoryBranchInput? = nil,
        spec : String? = nil,
        template_major_version : String? = nil,
        template_minor_version : String? = nil
      ) : Types::UpdateEnvironmentOutput

        input = Types::UpdateEnvironmentInput.new(deployment_type: deployment_type, name: name, codebuild_role_arn: codebuild_role_arn, component_role_arn: component_role_arn, description: description, environment_account_connection_id: environment_account_connection_id, proton_service_role_arn: proton_service_role_arn, provisioning_repository: provisioning_repository, spec: spec, template_major_version: template_major_version, template_minor_version: template_minor_version)
        update_environment(input)
      end

      def update_environment(input : Types::UpdateEnvironmentInput) : Types::UpdateEnvironmentOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnvironmentOutput, "UpdateEnvironment")
      end

      # In an environment account, update an environment account connection to use a new IAM role. For more
      # information, see Environment account connections in the Proton User guide .

      def update_environment_account_connection(
        id : String,
        codebuild_role_arn : String? = nil,
        component_role_arn : String? = nil,
        role_arn : String? = nil
      ) : Types::UpdateEnvironmentAccountConnectionOutput

        input = Types::UpdateEnvironmentAccountConnectionInput.new(id: id, codebuild_role_arn: codebuild_role_arn, component_role_arn: component_role_arn, role_arn: role_arn)
        update_environment_account_connection(input)
      end

      def update_environment_account_connection(input : Types::UpdateEnvironmentAccountConnectionInput) : Types::UpdateEnvironmentAccountConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENVIRONMENT_ACCOUNT_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnvironmentAccountConnectionOutput, "UpdateEnvironmentAccountConnection")
      end

      # Update an environment template.

      def update_environment_template(
        name : String,
        description : String? = nil,
        display_name : String? = nil
      ) : Types::UpdateEnvironmentTemplateOutput

        input = Types::UpdateEnvironmentTemplateInput.new(name: name, description: description, display_name: display_name)
        update_environment_template(input)
      end

      def update_environment_template(input : Types::UpdateEnvironmentTemplateInput) : Types::UpdateEnvironmentTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENVIRONMENT_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnvironmentTemplateOutput, "UpdateEnvironmentTemplate")
      end

      # Update a major or minor version of an environment template.

      def update_environment_template_version(
        major_version : String,
        minor_version : String,
        template_name : String,
        description : String? = nil,
        status : String? = nil
      ) : Types::UpdateEnvironmentTemplateVersionOutput

        input = Types::UpdateEnvironmentTemplateVersionInput.new(major_version: major_version, minor_version: minor_version, template_name: template_name, description: description, status: status)
        update_environment_template_version(input)
      end

      def update_environment_template_version(input : Types::UpdateEnvironmentTemplateVersionInput) : Types::UpdateEnvironmentTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENVIRONMENT_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnvironmentTemplateVersionOutput, "UpdateEnvironmentTemplateVersion")
      end

      # Edit a service description or use a spec to add and delete service instances. Existing service
      # instances and the service pipeline can't be edited using this API. They can only be deleted. Use the
      # description parameter to modify the description. Edit the spec parameter to add or delete instances.
      # You can't delete a service instance (remove it from the spec) if it has an attached component. For
      # more information about components, see Proton components in the Proton User Guide .

      def update_service(
        name : String,
        description : String? = nil,
        spec : String? = nil
      ) : Types::UpdateServiceOutput

        input = Types::UpdateServiceInput.new(name: name, description: description, spec: spec)
        update_service(input)
      end

      def update_service(input : Types::UpdateServiceInput) : Types::UpdateServiceOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceOutput, "UpdateService")
      end

      # Update a service instance. There are a few modes for updating a service instance. The deploymentType
      # field defines the mode. You can't update a service instance while its deployment status, or the
      # deployment status of a component attached to it, is IN_PROGRESS . For more information about
      # components, see Proton components in the Proton User Guide .

      def update_service_instance(
        deployment_type : String,
        name : String,
        service_name : String,
        client_token : String? = nil,
        spec : String? = nil,
        template_major_version : String? = nil,
        template_minor_version : String? = nil
      ) : Types::UpdateServiceInstanceOutput

        input = Types::UpdateServiceInstanceInput.new(deployment_type: deployment_type, name: name, service_name: service_name, client_token: client_token, spec: spec, template_major_version: template_major_version, template_minor_version: template_minor_version)
        update_service_instance(input)
      end

      def update_service_instance(input : Types::UpdateServiceInstanceInput) : Types::UpdateServiceInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceInstanceOutput, "UpdateServiceInstance")
      end

      # Update the service pipeline. There are four modes for updating a service pipeline. The
      # deploymentType field defines the mode. NONE In this mode, a deployment doesn't occur. Only the
      # requested metadata parameters are updated. CURRENT_VERSION In this mode, the service pipeline is
      # deployed and updated with the new spec that you provide. Only requested parameters are updated.
      # Don’t include major or minor version parameters when you use this deployment-type . MINOR_VERSION In
      # this mode, the service pipeline is deployed and updated with the published, recommended (latest)
      # minor version of the current major version in use, by default. You can specify a different minor
      # version of the current major version in use. MAJOR_VERSION In this mode, the service pipeline is
      # deployed and updated with the published, recommended (latest) major and minor version of the current
      # template by default. You can specify a different major version that's higher than the major version
      # in use and a minor version.

      def update_service_pipeline(
        deployment_type : String,
        service_name : String,
        spec : String,
        template_major_version : String? = nil,
        template_minor_version : String? = nil
      ) : Types::UpdateServicePipelineOutput

        input = Types::UpdateServicePipelineInput.new(deployment_type: deployment_type, service_name: service_name, spec: spec, template_major_version: template_major_version, template_minor_version: template_minor_version)
        update_service_pipeline(input)
      end

      def update_service_pipeline(input : Types::UpdateServicePipelineInput) : Types::UpdateServicePipelineOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServicePipelineOutput, "UpdateServicePipeline")
      end

      # Update the service sync blocker by resolving it.

      def update_service_sync_blocker(
        id : String,
        resolved_reason : String
      ) : Types::UpdateServiceSyncBlockerOutput

        input = Types::UpdateServiceSyncBlockerInput.new(id: id, resolved_reason: resolved_reason)
        update_service_sync_blocker(input)
      end

      def update_service_sync_blocker(input : Types::UpdateServiceSyncBlockerInput) : Types::UpdateServiceSyncBlockerOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_SYNC_BLOCKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceSyncBlockerOutput, "UpdateServiceSyncBlocker")
      end

      # Update the Proton Ops config file.

      def update_service_sync_config(
        branch : String,
        file_path : String,
        repository_name : String,
        repository_provider : String,
        service_name : String
      ) : Types::UpdateServiceSyncConfigOutput

        input = Types::UpdateServiceSyncConfigInput.new(branch: branch, file_path: file_path, repository_name: repository_name, repository_provider: repository_provider, service_name: service_name)
        update_service_sync_config(input)
      end

      def update_service_sync_config(input : Types::UpdateServiceSyncConfigInput) : Types::UpdateServiceSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceSyncConfigOutput, "UpdateServiceSyncConfig")
      end

      # Update a service template.

      def update_service_template(
        name : String,
        description : String? = nil,
        display_name : String? = nil
      ) : Types::UpdateServiceTemplateOutput

        input = Types::UpdateServiceTemplateInput.new(name: name, description: description, display_name: display_name)
        update_service_template(input)
      end

      def update_service_template(input : Types::UpdateServiceTemplateInput) : Types::UpdateServiceTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceTemplateOutput, "UpdateServiceTemplate")
      end

      # Update a major or minor version of a service template.

      def update_service_template_version(
        major_version : String,
        minor_version : String,
        template_name : String,
        compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplateInput)? = nil,
        description : String? = nil,
        status : String? = nil,
        supported_component_sources : Array(String)? = nil
      ) : Types::UpdateServiceTemplateVersionOutput

        input = Types::UpdateServiceTemplateVersionInput.new(major_version: major_version, minor_version: minor_version, template_name: template_name, compatible_environment_templates: compatible_environment_templates, description: description, status: status, supported_component_sources: supported_component_sources)
        update_service_template_version(input)
      end

      def update_service_template_version(input : Types::UpdateServiceTemplateVersionInput) : Types::UpdateServiceTemplateVersionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_TEMPLATE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceTemplateVersionOutput, "UpdateServiceTemplateVersion")
      end

      # Update template sync configuration parameters, except for the templateName and templateType .
      # Repository details (branch, name, and provider) should be of a linked repository. A linked
      # repository is a repository that has been registered with Proton. For more information, see
      # CreateRepository .

      def update_template_sync_config(
        branch : String,
        repository_name : String,
        repository_provider : String,
        template_name : String,
        template_type : String,
        subdirectory : String? = nil
      ) : Types::UpdateTemplateSyncConfigOutput

        input = Types::UpdateTemplateSyncConfigInput.new(branch: branch, repository_name: repository_name, repository_provider: repository_provider, template_name: template_name, template_type: template_type, subdirectory: subdirectory)
        update_template_sync_config(input)
      end

      def update_template_sync_config(input : Types::UpdateTemplateSyncConfigInput) : Types::UpdateTemplateSyncConfigOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TEMPLATE_SYNC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTemplateSyncConfigOutput, "UpdateTemplateSyncConfig")
      end
    end
  end
end
