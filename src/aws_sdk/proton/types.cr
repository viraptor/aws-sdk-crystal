require "json"
require "time"

module AwsSdk
  module Proton
    module Types


      struct AcceptEnvironmentAccountConnectionInput
        include JSON::Serializable

        # The ID of the environment account connection.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct AcceptEnvironmentAccountConnectionOutput
        include JSON::Serializable

        # The environment account connection data that's returned by Proton.

        @[JSON::Field(key: "environmentAccountConnection")]
        getter environment_account_connection : Types::EnvironmentAccountConnection

        def initialize(
          @environment_account_connection : Types::EnvironmentAccountConnection
        )
        end
      end

      # There isn't sufficient access for performing this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Proton settings that are used for multiple services in the Amazon Web Services account.

      struct AccountSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service role that Proton uses for provisioning pipelines.
        # Proton assumes this role for CodeBuild-based provisioning.

        @[JSON::Field(key: "pipelineCodebuildRoleArn")]
        getter pipeline_codebuild_role_arn : String?

        # The linked repository for pipeline provisioning. Required if you have environments configured for
        # self-managed provisioning with services that include pipelines. A linked repository is a repository
        # that has been registered with Proton. For more information, see CreateRepository .

        @[JSON::Field(key: "pipelineProvisioningRepository")]
        getter pipeline_provisioning_repository : Types::RepositoryBranch?

        # The Amazon Resource Name (ARN) of the service role you want to use for provisioning pipelines.
        # Assumed by Proton for Amazon Web Services-managed provisioning, and by customer-owned automation for
        # self-managed provisioning.

        @[JSON::Field(key: "pipelineServiceRoleArn")]
        getter pipeline_service_role_arn : String?

        def initialize(
          @pipeline_codebuild_role_arn : String? = nil,
          @pipeline_provisioning_repository : Types::RepositoryBranch? = nil,
          @pipeline_service_role_arn : String? = nil
        )
        end
      end


      struct CancelComponentDeploymentInput
        include JSON::Serializable

        # The name of the component with the deployment to cancel.

        @[JSON::Field(key: "componentName")]
        getter component_name : String

        def initialize(
          @component_name : String
        )
        end
      end


      struct CancelComponentDeploymentOutput
        include JSON::Serializable

        # The detailed data of the component with the deployment that is being canceled.

        @[JSON::Field(key: "component")]
        getter component : Types::Component

        def initialize(
          @component : Types::Component
        )
        end
      end


      struct CancelEnvironmentDeploymentInput
        include JSON::Serializable

        # The name of the environment with the deployment to cancel.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        def initialize(
          @environment_name : String
        )
        end
      end


      struct CancelEnvironmentDeploymentOutput
        include JSON::Serializable

        # The environment summary data that's returned by Proton.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment

        def initialize(
          @environment : Types::Environment
        )
        end
      end


      struct CancelServiceInstanceDeploymentInput
        include JSON::Serializable

        # The name of the service instance with the deployment to cancel.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String

        # The name of the service with the service instance deployment to cancel.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_instance_name : String,
          @service_name : String
        )
        end
      end


      struct CancelServiceInstanceDeploymentOutput
        include JSON::Serializable

        # The service instance summary data that's returned by Proton.

        @[JSON::Field(key: "serviceInstance")]
        getter service_instance : Types::ServiceInstance

        def initialize(
          @service_instance : Types::ServiceInstance
        )
        end
      end


      struct CancelServicePipelineDeploymentInput
        include JSON::Serializable

        # The name of the service with the service pipeline deployment to cancel.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_name : String
        )
        end
      end


      struct CancelServicePipelineDeploymentOutput
        include JSON::Serializable

        # The service pipeline detail data that's returned by Proton.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::ServicePipeline

        def initialize(
          @pipeline : Types::ServicePipeline
        )
        end
      end

      # Compatible environment template data.

      struct CompatibleEnvironmentTemplate
        include JSON::Serializable

        # The major version of the compatible environment template.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The compatible environment template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @major_version : String,
          @template_name : String
        )
        end
      end

      # Compatible environment template data.

      struct CompatibleEnvironmentTemplateInput
        include JSON::Serializable

        # The major version of the compatible environment template.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The compatible environment template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @major_version : String,
          @template_name : String
        )
        end
      end

      # Detailed data of an Proton component resource. For more information about components, see Proton
      # components in the Proton User Guide .

      struct Component
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the component was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The component deployment status.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The name of the Proton environment that this component is associated with.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The time when the component was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String

        # The message associated with the component deployment status.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # A description of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the last attempted deployment of this component.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The last token the client requested.

        @[JSON::Field(key: "lastClientRequestToken")]
        getter last_client_request_token : String?

        # The time when a deployment of the component was last attempted.

        @[JSON::Field(key: "lastDeploymentAttemptedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_attempted_at : Time?

        # The time when the component was last deployed successfully.

        @[JSON::Field(key: "lastDeploymentSucceededAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_succeeded_at : Time?

        # The ID of the last successful deployment of this component.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The name of the service instance that this component is attached to. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service that serviceInstanceName is associated with. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The service spec that the component uses to access service inputs. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceSpec")]
        getter service_spec : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @environment_name : String,
          @last_modified_at : Time,
          @name : String,
          @deployment_status_message : String? = nil,
          @description : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_client_request_token : String? = nil,
          @last_deployment_attempted_at : Time? = nil,
          @last_deployment_succeeded_at : Time? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil,
          @service_spec : String? = nil
        )
        end
      end

      # The detailed data about the current state of the component.

      struct ComponentState
        include JSON::Serializable

        # The name of the service instance that this component is attached to. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service that serviceInstanceName is associated with. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The service spec that the component uses to access service inputs. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceSpec")]
        getter service_spec : String?

        # The template file used.

        @[JSON::Field(key: "templateFile")]
        getter template_file : String?

        def initialize(
          @service_instance_name : String? = nil,
          @service_name : String? = nil,
          @service_spec : String? = nil,
          @template_file : String? = nil
        )
        end
      end

      # Summary data of an Proton component resource. For more information about components, see Proton
      # components in the Proton User Guide .

      struct ComponentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the component was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The component deployment status.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The name of the Proton environment that this component is associated with.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The time when the component was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String

        # The message associated with the component deployment status.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The ID of the last attempted deployment of this component.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The time when a deployment of the component was last attempted.

        @[JSON::Field(key: "lastDeploymentAttemptedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_attempted_at : Time?

        # The time when the component was last deployed successfully.

        @[JSON::Field(key: "lastDeploymentSucceededAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_succeeded_at : Time?

        # The ID of the last successful deployment of this component.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The name of the service instance that this component is attached to. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service that serviceInstanceName is associated with. Provided when a component is
        # attached to a service instance.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @environment_name : String,
          @last_modified_at : Time,
          @name : String,
          @deployment_status_message : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_deployment_attempted_at : Time? = nil,
          @last_deployment_succeeded_at : Time? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # The request couldn't be made due to a conflicting operation or resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Summary counts of each Proton resource type.

      struct CountsSummary
        include JSON::Serializable

        # The total number of components in the Amazon Web Services account. The semantics of the components
        # field are different from the semantics of results for other infrastructure-provisioning resources.
        # That's because at this time components don't have associated templates, therefore they don't have
        # the concept of staleness. The components object will only contain total and failed members.

        @[JSON::Field(key: "components")]
        getter components : Types::ResourceCountsSummary?

        # The total number of environment templates in the Amazon Web Services account. The
        # environmentTemplates object will only contain total members.

        @[JSON::Field(key: "environmentTemplates")]
        getter environment_templates : Types::ResourceCountsSummary?

        # The staleness counts for Proton environments in the Amazon Web Services account. The environments
        # object will only contain total members.

        @[JSON::Field(key: "environments")]
        getter environments : Types::ResourceCountsSummary?

        # The staleness counts for Proton pipelines in the Amazon Web Services account.

        @[JSON::Field(key: "pipelines")]
        getter pipelines : Types::ResourceCountsSummary?

        # The staleness counts for Proton service instances in the Amazon Web Services account.

        @[JSON::Field(key: "serviceInstances")]
        getter service_instances : Types::ResourceCountsSummary?

        # The total number of service templates in the Amazon Web Services account. The serviceTemplates
        # object will only contain total members.

        @[JSON::Field(key: "serviceTemplates")]
        getter service_templates : Types::ResourceCountsSummary?

        # The staleness counts for Proton services in the Amazon Web Services account.

        @[JSON::Field(key: "services")]
        getter services : Types::ResourceCountsSummary?

        def initialize(
          @components : Types::ResourceCountsSummary? = nil,
          @environment_templates : Types::ResourceCountsSummary? = nil,
          @environments : Types::ResourceCountsSummary? = nil,
          @pipelines : Types::ResourceCountsSummary? = nil,
          @service_instances : Types::ResourceCountsSummary? = nil,
          @service_templates : Types::ResourceCountsSummary? = nil,
          @services : Types::ResourceCountsSummary? = nil
        )
        end
      end


      struct CreateComponentInput
        include JSON::Serializable

        # A path to a manifest file that lists the Infrastructure as Code (IaC) file, template language, and
        # rendering engine for infrastructure that a custom component provisions.

        @[JSON::Field(key: "manifest")]
        getter manifest : String

        # The customer-provided name of the component.

        @[JSON::Field(key: "name")]
        getter name : String

        # A path to the Infrastructure as Code (IaC) file describing infrastructure that a custom component
        # provisions. Components support a single IaC file, even if you use Terraform as your template
        # language.

        @[JSON::Field(key: "templateFile")]
        getter template_file : String

        # The client token for the created component.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional customer-provided description of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the Proton environment that you want to associate this component with. You must specify
        # this when you don't specify serviceInstanceName and serviceName .

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The name of the service instance that you want to attach this component to. If you don't specify
        # this, the component isn't attached to any service instance. Specify both serviceInstanceName and
        # serviceName or neither of them.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service that serviceInstanceName is associated with. If you don't specify this, the
        # component isn't attached to any service instance. Specify both serviceInstanceName and serviceName
        # or neither of them.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The service spec that you want the component to use to access service inputs. Set this only when you
        # attach the component to a service instance.

        @[JSON::Field(key: "serviceSpec")]
        getter service_spec : String?

        # An optional list of metadata items that you can associate with the Proton component. A tag is a
        # key-value pair. For more information, see Proton resources and tagging in the Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @manifest : String,
          @name : String,
          @template_file : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @environment_name : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil,
          @service_spec : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateComponentOutput
        include JSON::Serializable

        # The detailed data of the created component.

        @[JSON::Field(key: "component")]
        getter component : Types::Component

        def initialize(
          @component : Types::Component
        )
        end
      end


      struct CreateEnvironmentAccountConnectionInput
        include JSON::Serializable

        # The name of the Proton environment that's created in the associated management account.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID of the management account that accepts or rejects the environment account connection. You
        # create and manage the Proton environment in this account. If the management account accepts the
        # environment account connection, Proton can use the associated IAM role to provision environment
        # infrastructure resources in the associated environment account.

        @[JSON::Field(key: "managementAccountId")]
        getter management_account_id : String

        # When included, if two identical requests are made with the same client token, Proton returns the
        # environment account connection that the first request created.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of an IAM service role in the environment account. Proton uses this
        # role to provision infrastructure resources using CodeBuild-based provisioning in the associated
        # environment account.

        @[JSON::Field(key: "codebuildRoleArn")]
        getter codebuild_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in the associated environment account. It determines the scope of infrastructure
        # that a component can provision in the account. You must specify componentRoleArn to allow directly
        # defined components to be associated with any environments running in this account. For more
        # information about components, see Proton components in the Proton User Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that's created in the environment account.
        # Proton uses this role to provision infrastructure resources in the associated environment account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # An optional list of metadata items that you can associate with the Proton environment account
        # connection. A tag is a key-value pair. For more information, see Proton resources and tagging in the
        # Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @environment_name : String,
          @management_account_id : String,
          @client_token : String? = nil,
          @codebuild_role_arn : String? = nil,
          @component_role_arn : String? = nil,
          @role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEnvironmentAccountConnectionOutput
        include JSON::Serializable

        # The environment account connection detail data that's returned by Proton.

        @[JSON::Field(key: "environmentAccountConnection")]
        getter environment_account_connection : Types::EnvironmentAccountConnection

        def initialize(
          @environment_account_connection : Types::EnvironmentAccountConnection
        )
        end
      end


      struct CreateEnvironmentInput
        include JSON::Serializable

        # The name of the environment.

        @[JSON::Field(key: "name")]
        getter name : String

        # A YAML formatted string that provides inputs as defined in the environment template bundle schema
        # file. For more information, see Environments in the Proton User Guide .

        @[JSON::Field(key: "spec")]
        getter spec : String

        # The major version of the environment template.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The name of the environment template. For more information, see Environment Templates in the Proton
        # User Guide .

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The Amazon Resource Name (ARN) of the IAM service role that allows Proton to provision
        # infrastructure using CodeBuild-based provisioning on your behalf. To use CodeBuild-based
        # provisioning for the environment or for any service instance running in the environment, specify
        # either the environmentAccountConnectionId or codebuildRoleArn parameter.

        @[JSON::Field(key: "codebuildRoleArn")]
        getter codebuild_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in this environment. It determines the scope of infrastructure that a component
        # can provision. You must specify componentRoleArn to allow directly defined components to be
        # associated with this environment. For more information about components, see Proton components in
        # the Proton User Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        # A description of the environment that's being created and deployed.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment account connection that you provide if you're provisioning your
        # environment infrastructure resources to an environment account. For more information, see
        # Environment account connections in the Proton User guide . To use Amazon Web Services-managed
        # provisioning for the environment, specify either the environmentAccountConnectionId or
        # protonServiceRoleArn parameter and omit the provisioningRepository parameter.

        @[JSON::Field(key: "environmentAccountConnectionId")]
        getter environment_account_connection_id : String?

        # The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make calls to other
        # services on your behalf. To use Amazon Web Services-managed provisioning for the environment,
        # specify either the environmentAccountConnectionId or protonServiceRoleArn parameter and omit the
        # provisioningRepository parameter.

        @[JSON::Field(key: "protonServiceRoleArn")]
        getter proton_service_role_arn : String?

        # The linked repository that you use to host your rendered infrastructure templates for self-managed
        # provisioning. A linked repository is a repository that has been registered with Proton. For more
        # information, see CreateRepository . To use self-managed provisioning for the environment, specify
        # this parameter and omit the environmentAccountConnectionId and protonServiceRoleArn parameters.

        @[JSON::Field(key: "provisioningRepository")]
        getter provisioning_repository : Types::RepositoryBranchInput?

        # An optional list of metadata items that you can associate with the Proton environment. A tag is a
        # key-value pair. For more information, see Proton resources and tagging in the Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The minor version of the environment template.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String?

        def initialize(
          @name : String,
          @spec : String,
          @template_major_version : String,
          @template_name : String,
          @codebuild_role_arn : String? = nil,
          @component_role_arn : String? = nil,
          @description : String? = nil,
          @environment_account_connection_id : String? = nil,
          @proton_service_role_arn : String? = nil,
          @provisioning_repository : Types::RepositoryBranchInput? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_minor_version : String? = nil
        )
        end
      end


      struct CreateEnvironmentOutput
        include JSON::Serializable

        # The environment detail data that's returned by Proton.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment

        def initialize(
          @environment : Types::Environment
        )
        end
      end


      struct CreateEnvironmentTemplateInput
        include JSON::Serializable

        # The name of the environment template.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the environment template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The environment template name as displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # A customer provided encryption key that Proton uses to encrypt data.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # When included, indicates that the environment template is for customer provisioned and managed
        # infrastructure.

        @[JSON::Field(key: "provisioning")]
        getter provisioning : String?

        # An optional list of metadata items that you can associate with the Proton environment template. A
        # tag is a key-value pair. For more information, see Proton resources and tagging in the Proton User
        # Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @encryption_key : String? = nil,
          @provisioning : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEnvironmentTemplateOutput
        include JSON::Serializable

        # The environment template detail data that's returned by Proton.

        @[JSON::Field(key: "environmentTemplate")]
        getter environment_template : Types::EnvironmentTemplate

        def initialize(
          @environment_template : Types::EnvironmentTemplate
        )
        end
      end


      struct CreateEnvironmentTemplateVersionInput
        include JSON::Serializable

        # An object that includes the template bundle S3 bucket path and name for the new version of an
        # template.

        @[JSON::Field(key: "source")]
        getter source : Types::TemplateVersionSourceInput

        # The name of the environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # When included, if two identical requests are made with the same client token, Proton returns the
        # environment template version that the first request created.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the new version of an environment template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # To create a new minor version of the environment template, include major Version . To create a new
        # major and minor version of the environment template, exclude major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String?

        # An optional list of metadata items that you can associate with the Proton environment template
        # version. A tag is a key-value pair. For more information, see Proton resources and tagging in the
        # Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @source : Types::TemplateVersionSourceInput,
          @template_name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @major_version : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEnvironmentTemplateVersionOutput
        include JSON::Serializable

        # The environment template detail data that's returned by Proton.

        @[JSON::Field(key: "environmentTemplateVersion")]
        getter environment_template_version : Types::EnvironmentTemplateVersion

        def initialize(
          @environment_template_version : Types::EnvironmentTemplateVersion
        )
        end
      end


      struct CreateRepositoryInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of your AWS CodeStar connection that connects Proton to your
        # repository provider account. For more information, see Setting up for Proton in the Proton User
        # Guide .

        @[JSON::Field(key: "connectionArn")]
        getter connection_arn : String

        # The repository name (for example, myrepos/myrepo ).

        @[JSON::Field(key: "name")]
        getter name : String

        # The repository provider.

        @[JSON::Field(key: "provider")]
        getter provider : String

        # The ARN of your customer Amazon Web Services Key Management Service (Amazon Web Services KMS) key.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # An optional list of metadata items that you can associate with the Proton repository. A tag is a
        # key-value pair. For more information, see Proton resources and tagging in the Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connection_arn : String,
          @name : String,
          @provider : String,
          @encryption_key : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRepositoryOutput
        include JSON::Serializable

        # The repository link's detail data that's returned by Proton.

        @[JSON::Field(key: "repository")]
        getter repository : Types::Repository

        def initialize(
          @repository : Types::Repository
        )
        end
      end


      struct CreateServiceInput
        include JSON::Serializable

        # The service name.

        @[JSON::Field(key: "name")]
        getter name : String

        # A link to a spec file that provides inputs as defined in the service template bundle schema file.
        # The spec file is in YAML format. Don’t include pipeline inputs in the spec if your service template
        # doesn’t include a service pipeline. For more information, see Create a service in the Proton User
        # Guide .

        @[JSON::Field(key: "spec")]
        getter spec : String

        # The major version of the service template that was used to create the service.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The name of the service template that's used to create the service.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The name of the code repository branch that holds the code that's deployed in Proton. Don't include
        # this parameter if your service template doesn't include a service pipeline.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        # A description of the Proton service.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the repository connection. For more information, see Setting up an
        # AWS CodeStar connection in the Proton User Guide . Don't include this parameter if your service
        # template doesn't include a service pipeline.

        @[JSON::Field(key: "repositoryConnectionArn")]
        getter repository_connection_arn : String?

        # The ID of the code repository. Don't include this parameter if your service template doesn't include
        # a service pipeline.

        @[JSON::Field(key: "repositoryId")]
        getter repository_id : String?

        # An optional list of metadata items that you can associate with the Proton service. A tag is a
        # key-value pair. For more information, see Proton resources and tagging in the Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The minor version of the service template that was used to create the service.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String?

        def initialize(
          @name : String,
          @spec : String,
          @template_major_version : String,
          @template_name : String,
          @branch_name : String? = nil,
          @description : String? = nil,
          @repository_connection_arn : String? = nil,
          @repository_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_minor_version : String? = nil
        )
        end
      end


      struct CreateServiceInstanceInput
        include JSON::Serializable

        # The name of the service instance to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the service the service instance is added to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The spec for the service instance you want to create.

        @[JSON::Field(key: "spec")]
        getter spec : String

        # The client token of the service instance to create.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional list of metadata items that you can associate with the Proton service instance. A tag is
        # a key-value pair. For more information, see Proton resources and tagging in the Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # To create a new major and minor version of the service template, exclude major Version .

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String?

        # To create a new minor version of the service template, include a major Version .

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String?

        def initialize(
          @name : String,
          @service_name : String,
          @spec : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_major_version : String? = nil,
          @template_minor_version : String? = nil
        )
        end
      end


      struct CreateServiceInstanceOutput
        include JSON::Serializable

        # The detailed data of the service instance being created.

        @[JSON::Field(key: "serviceInstance")]
        getter service_instance : Types::ServiceInstance

        def initialize(
          @service_instance : Types::ServiceInstance
        )
        end
      end


      struct CreateServiceOutput
        include JSON::Serializable

        # The service detail data that's returned by Proton.

        @[JSON::Field(key: "service")]
        getter service : Types::Service

        def initialize(
          @service : Types::Service
        )
        end
      end


      struct CreateServiceSyncConfigInput
        include JSON::Serializable

        # The repository branch for your Proton Ops file.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The path to the Proton Ops file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The repository name.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The provider type for your repository.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The name of the service the Proton Ops file is for.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @branch : String,
          @file_path : String,
          @repository_name : String,
          @repository_provider : String,
          @service_name : String
        )
        end
      end


      struct CreateServiceSyncConfigOutput
        include JSON::Serializable

        # The detailed data of the Proton Ops file.

        @[JSON::Field(key: "serviceSyncConfig")]
        getter service_sync_config : Types::ServiceSyncConfig?

        def initialize(
          @service_sync_config : Types::ServiceSyncConfig? = nil
        )
        end
      end


      struct CreateServiceTemplateInput
        include JSON::Serializable

        # The name of the service template.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the service template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the service template as displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # A customer provided encryption key that's used to encrypt data.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # By default, Proton provides a service pipeline for your service. When this parameter is included, it
        # indicates that an Proton service pipeline isn't provided for your service. After it's included, it
        # can't be changed. For more information, see Template bundles in the Proton User Guide .

        @[JSON::Field(key: "pipelineProvisioning")]
        getter pipeline_provisioning : String?

        # An optional list of metadata items that you can associate with the Proton service template. A tag is
        # a key-value pair. For more information, see Proton resources and tagging in the Proton User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @encryption_key : String? = nil,
          @pipeline_provisioning : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateServiceTemplateOutput
        include JSON::Serializable

        # The service template detail data that's returned by Proton.

        @[JSON::Field(key: "serviceTemplate")]
        getter service_template : Types::ServiceTemplate

        def initialize(
          @service_template : Types::ServiceTemplate
        )
        end
      end


      struct CreateServiceTemplateVersionInput
        include JSON::Serializable

        # An array of environment template objects that are compatible with the new service template version.
        # A service instance based on this service template version can run in environments based on
        # compatible templates.

        @[JSON::Field(key: "compatibleEnvironmentTemplates")]
        getter compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplateInput)

        # An object that includes the template bundle S3 bucket path and name for the new version of a service
        # template.

        @[JSON::Field(key: "source")]
        getter source : Types::TemplateVersionSourceInput

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # When included, if two identical requests are made with the same client token, Proton returns the
        # service template version that the first request created.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the new version of a service template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # To create a new minor version of the service template, include a major Version . To create a new
        # major and minor version of the service template, exclude major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String?

        # An array of supported component sources. Components with supported sources can be attached to
        # service instances based on this service template version. For more information about components, see
        # Proton components in the Proton User Guide .

        @[JSON::Field(key: "supportedComponentSources")]
        getter supported_component_sources : Array(String)?

        # An optional list of metadata items that you can associate with the Proton service template version.
        # A tag is a key-value pair. For more information, see Proton resources and tagging in the Proton User
        # Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplateInput),
          @source : Types::TemplateVersionSourceInput,
          @template_name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @major_version : String? = nil,
          @supported_component_sources : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateServiceTemplateVersionOutput
        include JSON::Serializable

        # The service template version summary of detail data that's returned by Proton.

        @[JSON::Field(key: "serviceTemplateVersion")]
        getter service_template_version : Types::ServiceTemplateVersion

        def initialize(
          @service_template_version : Types::ServiceTemplateVersion
        )
        end
      end


      struct CreateTemplateSyncConfigInput
        include JSON::Serializable

        # The repository branch for your template.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The repository name (for example, myrepos/myrepo ).

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The provider type for your repository.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The name of your registered template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The type of the registered template.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # A repository subdirectory path to your template bundle directory. When included, Proton limits the
        # template bundle search to this repository directory.

        @[JSON::Field(key: "subdirectory")]
        getter subdirectory : String?

        def initialize(
          @branch : String,
          @repository_name : String,
          @repository_provider : String,
          @template_name : String,
          @template_type : String,
          @subdirectory : String? = nil
        )
        end
      end


      struct CreateTemplateSyncConfigOutput
        include JSON::Serializable

        # The template sync configuration detail data that's returned by Proton.

        @[JSON::Field(key: "templateSyncConfig")]
        getter template_sync_config : Types::TemplateSyncConfig?

        def initialize(
          @template_sync_config : Types::TemplateSyncConfig? = nil
        )
        end
      end


      struct DeleteComponentInput
        include JSON::Serializable

        # The name of the component to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteComponentOutput
        include JSON::Serializable

        # The detailed data of the component being deleted.

        @[JSON::Field(key: "component")]
        getter component : Types::Component?

        def initialize(
          @component : Types::Component? = nil
        )
        end
      end


      struct DeleteDeploymentInput
        include JSON::Serializable

        # The ID of the deployment to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteDeploymentOutput
        include JSON::Serializable

        # The detailed data of the deployment being deleted.

        @[JSON::Field(key: "deployment")]
        getter deployment : Types::Deployment?

        def initialize(
          @deployment : Types::Deployment? = nil
        )
        end
      end


      struct DeleteEnvironmentAccountConnectionInput
        include JSON::Serializable

        # The ID of the environment account connection to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteEnvironmentAccountConnectionOutput
        include JSON::Serializable

        # The detailed data of the environment account connection being deleted.

        @[JSON::Field(key: "environmentAccountConnection")]
        getter environment_account_connection : Types::EnvironmentAccountConnection?

        def initialize(
          @environment_account_connection : Types::EnvironmentAccountConnection? = nil
        )
        end
      end


      struct DeleteEnvironmentInput
        include JSON::Serializable

        # The name of the environment to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteEnvironmentOutput
        include JSON::Serializable

        # The detailed data of the environment being deleted.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end


      struct DeleteEnvironmentTemplateInput
        include JSON::Serializable

        # The name of the environment template to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteEnvironmentTemplateOutput
        include JSON::Serializable

        # The detailed data of the environment template being deleted.

        @[JSON::Field(key: "environmentTemplate")]
        getter environment_template : Types::EnvironmentTemplate?

        def initialize(
          @environment_template : Types::EnvironmentTemplate? = nil
        )
        end
      end


      struct DeleteEnvironmentTemplateVersionInput
        include JSON::Serializable

        # The environment template major version to delete.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The environment template minor version to delete.

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The name of the environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @major_version : String,
          @minor_version : String,
          @template_name : String
        )
        end
      end


      struct DeleteEnvironmentTemplateVersionOutput
        include JSON::Serializable

        # The detailed data of the environment template version being deleted.

        @[JSON::Field(key: "environmentTemplateVersion")]
        getter environment_template_version : Types::EnvironmentTemplateVersion?

        def initialize(
          @environment_template_version : Types::EnvironmentTemplateVersion? = nil
        )
        end
      end


      struct DeleteRepositoryInput
        include JSON::Serializable

        # The repository name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The repository provider.

        @[JSON::Field(key: "provider")]
        getter provider : String

        def initialize(
          @name : String,
          @provider : String
        )
        end
      end


      struct DeleteRepositoryOutput
        include JSON::Serializable

        # The deleted repository link's detail data that's returned by Proton.

        @[JSON::Field(key: "repository")]
        getter repository : Types::Repository?

        def initialize(
          @repository : Types::Repository? = nil
        )
        end
      end


      struct DeleteServiceInput
        include JSON::Serializable

        # The name of the service to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteServiceOutput
        include JSON::Serializable

        # The detailed data of the service being deleted.

        @[JSON::Field(key: "service")]
        getter service : Types::Service?

        def initialize(
          @service : Types::Service? = nil
        )
        end
      end


      struct DeleteServiceSyncConfigInput
        include JSON::Serializable

        # The name of the service that you want to delete the service sync configuration for.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_name : String
        )
        end
      end


      struct DeleteServiceSyncConfigOutput
        include JSON::Serializable

        # The detailed data for the service sync config.

        @[JSON::Field(key: "serviceSyncConfig")]
        getter service_sync_config : Types::ServiceSyncConfig?

        def initialize(
          @service_sync_config : Types::ServiceSyncConfig? = nil
        )
        end
      end


      struct DeleteServiceTemplateInput
        include JSON::Serializable

        # The name of the service template to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteServiceTemplateOutput
        include JSON::Serializable

        # The detailed data of the service template being deleted.

        @[JSON::Field(key: "serviceTemplate")]
        getter service_template : Types::ServiceTemplate?

        def initialize(
          @service_template : Types::ServiceTemplate? = nil
        )
        end
      end


      struct DeleteServiceTemplateVersionInput
        include JSON::Serializable

        # The service template major version to delete.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The service template minor version to delete.

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @major_version : String,
          @minor_version : String,
          @template_name : String
        )
        end
      end


      struct DeleteServiceTemplateVersionOutput
        include JSON::Serializable

        # The detailed data of the service template version being deleted.

        @[JSON::Field(key: "serviceTemplateVersion")]
        getter service_template_version : Types::ServiceTemplateVersion?

        def initialize(
          @service_template_version : Types::ServiceTemplateVersion? = nil
        )
        end
      end


      struct DeleteTemplateSyncConfigInput
        include JSON::Serializable

        # The template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The template type.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        def initialize(
          @template_name : String,
          @template_type : String
        )
        end
      end


      struct DeleteTemplateSyncConfigOutput
        include JSON::Serializable

        # The template sync configuration detail data that's returned by Proton.

        @[JSON::Field(key: "templateSyncConfig")]
        getter template_sync_config : Types::TemplateSyncConfig?

        def initialize(
          @template_sync_config : Types::TemplateSyncConfig? = nil
        )
        end
      end

      # The detailed information about a deployment.

      struct Deployment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deployment.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the deployment was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The status of the deployment.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The name of the environment associated with this deployment.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID of the deployment.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the deployment was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The Amazon Resource Name (ARN) of the target of the deployment.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # The date and time the depoyment target was created.

        @[JSON::Field(key: "targetResourceCreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter target_resource_created_at : Time

        # The resource type of the deployment target. It can be an environment, service, service instance, or
        # component.

        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The date and time the deployment was completed.

        @[JSON::Field(key: "completedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_at : Time?

        # The name of the component associated with this deployment.

        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The deployment status message.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The initial state of the target resource at the time of the deployment.

        @[JSON::Field(key: "initialState")]
        getter initial_state : Types::DeploymentState?

        # The ID of the last attempted deployment.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The ID of the last successful deployment.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The name of the deployment's service instance.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service in this deployment.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The target state of the target resource at the time of the deployment.

        @[JSON::Field(key: "targetState")]
        getter target_state : Types::DeploymentState?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @environment_name : String,
          @id : String,
          @last_modified_at : Time,
          @target_arn : String,
          @target_resource_created_at : Time,
          @target_resource_type : String,
          @completed_at : Time? = nil,
          @component_name : String? = nil,
          @deployment_status_message : String? = nil,
          @initial_state : Types::DeploymentState? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil,
          @target_state : Types::DeploymentState? = nil
        )
        end
      end

      # The detailed data about the current state of the deployment.

      struct DeploymentState
        include JSON::Serializable

        # The state of the component associated with the deployment.

        @[JSON::Field(key: "component")]
        getter component : Types::ComponentState?

        # The state of the environment associated with the deployment.

        @[JSON::Field(key: "environment")]
        getter environment : Types::EnvironmentState?

        # The state of the service instance associated with the deployment.

        @[JSON::Field(key: "serviceInstance")]
        getter service_instance : Types::ServiceInstanceState?

        # The state of the service pipeline associated with the deployment.

        @[JSON::Field(key: "servicePipeline")]
        getter service_pipeline : Types::ServicePipelineState?

        def initialize(
          @component : Types::ComponentState? = nil,
          @environment : Types::EnvironmentState? = nil,
          @service_instance : Types::ServiceInstanceState? = nil,
          @service_pipeline : Types::ServicePipelineState? = nil
        )
        end
      end

      # Summary data of the deployment.

      struct DeploymentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deployment.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the deployment was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The current status of the deployment.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The name of the environment associated with the deployment.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID of the deployment.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the deployment was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The Amazon Resource Name (ARN) of the target of the deployment.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # The date and time the target resource was created.

        @[JSON::Field(key: "targetResourceCreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter target_resource_created_at : Time

        # The resource type of the deployment target. It can be an environment, service, service instance, or
        # component.

        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The date and time the deployment was completed.

        @[JSON::Field(key: "completedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_at : Time?

        # The name of the component associated with the deployment.

        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The ID of the last attempted deployment.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The ID of the last successful deployment.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The name of the service instance associated with the deployment.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service associated with the deployment.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @environment_name : String,
          @id : String,
          @last_modified_at : Time,
          @target_arn : String,
          @target_resource_created_at : Time,
          @target_resource_type : String,
          @completed_at : Time? = nil,
          @component_name : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # Detailed data of an Proton environment resource. An Proton environment is a set of resources shared
      # across Proton services.

      struct Environment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the environment was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The environment deployment status.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The time when a deployment of the environment was last attempted.

        @[JSON::Field(key: "lastDeploymentAttemptedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_attempted_at : Time

        # The time when the environment was last deployed successfully.

        @[JSON::Field(key: "lastDeploymentSucceededAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_succeeded_at : Time

        # The name of the environment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The major version of the environment template.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The minor version of the environment template.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The Amazon Resource Name (ARN) of the environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The Amazon Resource Name (ARN) of the IAM service role that allows Proton to provision
        # infrastructure using CodeBuild-based provisioning on your behalf.

        @[JSON::Field(key: "codebuildRoleArn")]
        getter codebuild_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in this environment. It determines the scope of infrastructure that a component
        # can provision. The environment must have a componentRoleArn to allow directly defined components to
        # be associated with the environment. For more information about components, see Proton components in
        # the Proton User Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        # An environment deployment status message.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The description of the environment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment account connection that's used to provision infrastructure resources in an
        # environment account.

        @[JSON::Field(key: "environmentAccountConnectionId")]
        getter environment_account_connection_id : String?

        # The ID of the environment account that the environment infrastructure resources are provisioned in.

        @[JSON::Field(key: "environmentAccountId")]
        getter environment_account_id : String?

        # The ID of the last attempted deployment of this environment.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The ID of the last successful deployment of this environment.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make calls to other
        # services on your behalf.

        @[JSON::Field(key: "protonServiceRoleArn")]
        getter proton_service_role_arn : String?

        # When included, indicates that the environment template is for customer provisioned and managed
        # infrastructure.

        @[JSON::Field(key: "provisioning")]
        getter provisioning : String?

        # The linked repository that you use to host your rendered infrastructure templates for self-managed
        # provisioning. A linked repository is a repository that has been registered with Proton. For more
        # information, see CreateRepository .

        @[JSON::Field(key: "provisioningRepository")]
        getter provisioning_repository : Types::RepositoryBranch?

        # The environment spec.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @last_deployment_attempted_at : Time,
          @last_deployment_succeeded_at : Time,
          @name : String,
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @codebuild_role_arn : String? = nil,
          @component_role_arn : String? = nil,
          @deployment_status_message : String? = nil,
          @description : String? = nil,
          @environment_account_connection_id : String? = nil,
          @environment_account_id : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @proton_service_role_arn : String? = nil,
          @provisioning : String? = nil,
          @provisioning_repository : Types::RepositoryBranch? = nil,
          @spec : String? = nil
        )
        end
      end

      # Detailed data of an Proton environment account connection resource.

      struct EnvironmentAccountConnection
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment account connection.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The environment account that's connected to the environment account connection.

        @[JSON::Field(key: "environmentAccountId")]
        getter environment_account_id : String

        # The name of the environment that's associated with the environment account connection.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID of the environment account connection.

        @[JSON::Field(key: "id")]
        getter id : String

        # The time when the environment account connection was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The ID of the management account that's connected to the environment account connection.

        @[JSON::Field(key: "managementAccountId")]
        getter management_account_id : String

        # The time when the environment account connection request was made.

        @[JSON::Field(key: "requestedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter requested_at : Time

        # The IAM service role that's associated with the environment account connection.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The status of the environment account connection.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of an IAM service role in the environment account. Proton uses this
        # role to provision infrastructure resources using CodeBuild-based provisioning in the associated
        # environment account.

        @[JSON::Field(key: "codebuildRoleArn")]
        getter codebuild_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in the associated environment account. It determines the scope of infrastructure
        # that a component can provision in the account. The environment account connection must have a
        # componentRoleArn to allow directly defined components to be associated with any environments running
        # in the account. For more information about components, see Proton components in the Proton User
        # Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        def initialize(
          @arn : String,
          @environment_account_id : String,
          @environment_name : String,
          @id : String,
          @last_modified_at : Time,
          @management_account_id : String,
          @requested_at : Time,
          @role_arn : String,
          @status : String,
          @codebuild_role_arn : String? = nil,
          @component_role_arn : String? = nil
        )
        end
      end

      # Summary data of an Proton environment account connection resource.

      struct EnvironmentAccountConnectionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment account connection.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the environment account that's connected to the environment account connection.

        @[JSON::Field(key: "environmentAccountId")]
        getter environment_account_id : String

        # The name of the environment that's associated with the environment account connection.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID of the environment account connection.

        @[JSON::Field(key: "id")]
        getter id : String

        # The time when the environment account connection was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The ID of the management account that's connected to the environment account connection.

        @[JSON::Field(key: "managementAccountId")]
        getter management_account_id : String

        # The time when the environment account connection request was made.

        @[JSON::Field(key: "requestedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter requested_at : Time

        # The IAM service role that's associated with the environment account connection.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The status of the environment account connection.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in the associated environment account. It determines the scope of infrastructure
        # that a component can provision in the account. The environment account connection must have a
        # componentRoleArn to allow directly defined components to be associated with any environments running
        # in the account. For more information about components, see Proton components in the Proton User
        # Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        def initialize(
          @arn : String,
          @environment_account_id : String,
          @environment_name : String,
          @id : String,
          @last_modified_at : Time,
          @management_account_id : String,
          @requested_at : Time,
          @role_arn : String,
          @status : String,
          @component_role_arn : String? = nil
        )
        end
      end

      # The detailed data about the current state of the environment.

      struct EnvironmentState
        include JSON::Serializable

        # The major version of the environment template that was used to create the environment.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The minor version of the environment template that was used to create the environment.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The name of the environment template that was used to create the environment.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The environment spec that was used to create the environment.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        def initialize(
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @spec : String? = nil
        )
        end
      end

      # Summary data of an Proton environment resource. An Proton environment is a set of resources shared
      # across Proton services.

      struct EnvironmentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the environment was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The environment deployment status.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The time when a deployment of the environment was last attempted.

        @[JSON::Field(key: "lastDeploymentAttemptedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_attempted_at : Time

        # The time when the environment was last deployed successfully.

        @[JSON::Field(key: "lastDeploymentSucceededAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_succeeded_at : Time

        # The name of the environment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The major version of the environment template.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The minor version of the environment template.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The name of the environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in this environment. It determines the scope of infrastructure that a component
        # can provision. The environment must have a componentRoleArn to allow directly defined components to
        # be associated with the environment. For more information about components, see Proton components in
        # the Proton User Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        # An environment deployment status message.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The description of the environment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment account connection that the environment is associated with.

        @[JSON::Field(key: "environmentAccountConnectionId")]
        getter environment_account_connection_id : String?

        # The ID of the environment account that the environment infrastructure resources are provisioned in.

        @[JSON::Field(key: "environmentAccountId")]
        getter environment_account_id : String?

        # The ID of the last attempted deployment of this environment.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The ID of the last successful deployment of this environment.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make calls to other
        # services on your behalf.

        @[JSON::Field(key: "protonServiceRoleArn")]
        getter proton_service_role_arn : String?

        # When included, indicates that the environment template is for customer provisioned and managed
        # infrastructure.

        @[JSON::Field(key: "provisioning")]
        getter provisioning : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @last_deployment_attempted_at : Time,
          @last_deployment_succeeded_at : Time,
          @name : String,
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @component_role_arn : String? = nil,
          @deployment_status_message : String? = nil,
          @description : String? = nil,
          @environment_account_connection_id : String? = nil,
          @environment_account_id : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @proton_service_role_arn : String? = nil,
          @provisioning : String? = nil
        )
        end
      end

      # The environment template data.

      struct EnvironmentTemplate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the environment template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the environment template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the environment template.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the environment template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the environment template as displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The customer provided encryption key for the environment template.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # When included, indicates that the environment template is for customer provisioned and managed
        # infrastructure.

        @[JSON::Field(key: "provisioning")]
        getter provisioning : String?

        # The ID of the recommended version of the environment template.

        @[JSON::Field(key: "recommendedVersion")]
        getter recommended_version : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @encryption_key : String? = nil,
          @provisioning : String? = nil,
          @recommended_version : String? = nil
        )
        end
      end

      # A search filter for environment templates.

      struct EnvironmentTemplateFilter
        include JSON::Serializable

        # Include majorVersion to filter search for a major version.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # Include templateName to filter search for a template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @major_version : String,
          @template_name : String
        )
        end
      end

      # The environment template data.

      struct EnvironmentTemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the environment template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the environment template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the environment template.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the environment template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the environment template as displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # When included, indicates that the environment template is for customer provisioned and managed
        # infrastructure.

        @[JSON::Field(key: "provisioning")]
        getter provisioning : String?

        # The recommended version of the environment template.

        @[JSON::Field(key: "recommendedVersion")]
        getter recommended_version : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @provisioning : String? = nil,
          @recommended_version : String? = nil
        )
        end
      end

      # The environment template version data.

      struct EnvironmentTemplateVersion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the version of an environment template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the version of an environment template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the version of an environment template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The latest major version that's associated with the version of an environment template.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The minor version of an environment template.

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The status of the version of an environment template.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the version of an environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A description of the minor version of an environment template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The recommended minor version of the environment template.

        @[JSON::Field(key: "recommendedMinorVersion")]
        getter recommended_minor_version : String?

        # The schema of the version of an environment template.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        # The status message of the version of an environment template.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @major_version : String,
          @minor_version : String,
          @status : String,
          @template_name : String,
          @description : String? = nil,
          @recommended_minor_version : String? = nil,
          @schema : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A summary of the version of an environment template detail data.

      struct EnvironmentTemplateVersionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the version of an environment template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the version of an environment template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the version of an environment template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The latest major version that's associated with the version of an environment template.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The version of an environment template.

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The status of the version of an environment template.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A description of the version of an environment template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The recommended minor version of the environment template.

        @[JSON::Field(key: "recommendedMinorVersion")]
        getter recommended_minor_version : String?

        # The status message of the version of an environment template.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @major_version : String,
          @minor_version : String,
          @status : String,
          @template_name : String,
          @description : String? = nil,
          @recommended_minor_version : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct GetAccountSettingsInput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountSettingsOutput
        include JSON::Serializable

        # The Proton pipeline service role detail data that's returned by Proton.

        @[JSON::Field(key: "accountSettings")]
        getter account_settings : Types::AccountSettings?

        def initialize(
          @account_settings : Types::AccountSettings? = nil
        )
        end
      end


      struct GetComponentInput
        include JSON::Serializable

        # The name of the component that you want to get the detailed data for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetComponentOutput
        include JSON::Serializable

        # The detailed data of the requested component.

        @[JSON::Field(key: "component")]
        getter component : Types::Component?

        def initialize(
          @component : Types::Component? = nil
        )
        end
      end


      struct GetDeploymentInput
        include JSON::Serializable

        # The ID of the deployment that you want to get the detailed data for.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of a component that you want to get the detailed data for.

        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The name of a environment that you want to get the detailed data for.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The name of the service instance associated with the given deployment ID. serviceName must be
        # specified to identify the service instance.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service associated with the given deployment ID.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @id : String,
          @component_name : String? = nil,
          @environment_name : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil
        )
        end
      end


      struct GetDeploymentOutput
        include JSON::Serializable

        # The detailed data of the requested deployment.

        @[JSON::Field(key: "deployment")]
        getter deployment : Types::Deployment?

        def initialize(
          @deployment : Types::Deployment? = nil
        )
        end
      end


      struct GetEnvironmentAccountConnectionInput
        include JSON::Serializable

        # The ID of the environment account connection that you want to get the detailed data for.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetEnvironmentAccountConnectionOutput
        include JSON::Serializable

        # The detailed data of the requested environment account connection.

        @[JSON::Field(key: "environmentAccountConnection")]
        getter environment_account_connection : Types::EnvironmentAccountConnection

        def initialize(
          @environment_account_connection : Types::EnvironmentAccountConnection
        )
        end
      end


      struct GetEnvironmentInput
        include JSON::Serializable

        # The name of the environment that you want to get the detailed data for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetEnvironmentOutput
        include JSON::Serializable

        # The detailed data of the requested environment.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment

        def initialize(
          @environment : Types::Environment
        )
        end
      end


      struct GetEnvironmentTemplateInput
        include JSON::Serializable

        # The name of the environment template that you want to get the detailed data for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetEnvironmentTemplateOutput
        include JSON::Serializable

        # The detailed data of the requested environment template.

        @[JSON::Field(key: "environmentTemplate")]
        getter environment_template : Types::EnvironmentTemplate

        def initialize(
          @environment_template : Types::EnvironmentTemplate
        )
        end
      end


      struct GetEnvironmentTemplateVersionInput
        include JSON::Serializable

        # To get environment template major version detail data, include major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # To get environment template minor version detail data, include minorVersion .

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The name of the environment template a version of which you want to get detailed data for.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @major_version : String,
          @minor_version : String,
          @template_name : String
        )
        end
      end


      struct GetEnvironmentTemplateVersionOutput
        include JSON::Serializable

        # The detailed data of the requested environment template version.

        @[JSON::Field(key: "environmentTemplateVersion")]
        getter environment_template_version : Types::EnvironmentTemplateVersion

        def initialize(
          @environment_template_version : Types::EnvironmentTemplateVersion
        )
        end
      end


      struct GetRepositoryInput
        include JSON::Serializable

        # The repository name, for example myrepos/myrepo .

        @[JSON::Field(key: "name")]
        getter name : String

        # The repository provider.

        @[JSON::Field(key: "provider")]
        getter provider : String

        def initialize(
          @name : String,
          @provider : String
        )
        end
      end


      struct GetRepositoryOutput
        include JSON::Serializable

        # The repository link's detail data that's returned by Proton.

        @[JSON::Field(key: "repository")]
        getter repository : Types::Repository

        def initialize(
          @repository : Types::Repository
        )
        end
      end


      struct GetRepositorySyncStatusInput
        include JSON::Serializable

        # The repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The repository name.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The repository provider.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The repository sync type.

        @[JSON::Field(key: "syncType")]
        getter sync_type : String

        def initialize(
          @branch : String,
          @repository_name : String,
          @repository_provider : String,
          @sync_type : String
        )
        end
      end


      struct GetRepositorySyncStatusOutput
        include JSON::Serializable

        # The repository sync status detail data that's returned by Proton.

        @[JSON::Field(key: "latestSync")]
        getter latest_sync : Types::RepositorySyncAttempt?

        def initialize(
          @latest_sync : Types::RepositorySyncAttempt? = nil
        )
        end
      end


      struct GetResourcesSummaryInput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetResourcesSummaryOutput
        include JSON::Serializable

        # Summary counts of each Proton resource type.

        @[JSON::Field(key: "counts")]
        getter counts : Types::CountsSummary

        def initialize(
          @counts : Types::CountsSummary
        )
        end
      end


      struct GetServiceInput
        include JSON::Serializable

        # The name of the service that you want to get the detailed data for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetServiceInstanceInput
        include JSON::Serializable

        # The name of a service instance that you want to get the detailed data for.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the service that you want the service instance input for.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @name : String,
          @service_name : String
        )
        end
      end


      struct GetServiceInstanceOutput
        include JSON::Serializable

        # The detailed data of the requested service instance.

        @[JSON::Field(key: "serviceInstance")]
        getter service_instance : Types::ServiceInstance

        def initialize(
          @service_instance : Types::ServiceInstance
        )
        end
      end


      struct GetServiceInstanceSyncStatusInput
        include JSON::Serializable

        # The name of the service instance that you want the sync status input for.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String

        # The name of the service that the service instance belongs to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_instance_name : String,
          @service_name : String
        )
        end
      end


      struct GetServiceInstanceSyncStatusOutput
        include JSON::Serializable

        # The service instance sync desired state that's returned by Proton

        @[JSON::Field(key: "desiredState")]
        getter desired_state : Types::Revision?

        # The detailed data of the latest successful sync with the service instance.

        @[JSON::Field(key: "latestSuccessfulSync")]
        getter latest_successful_sync : Types::ResourceSyncAttempt?

        # The detailed data of the latest sync with the service instance.

        @[JSON::Field(key: "latestSync")]
        getter latest_sync : Types::ResourceSyncAttempt?

        def initialize(
          @desired_state : Types::Revision? = nil,
          @latest_successful_sync : Types::ResourceSyncAttempt? = nil,
          @latest_sync : Types::ResourceSyncAttempt? = nil
        )
        end
      end


      struct GetServiceOutput
        include JSON::Serializable

        # The detailed data of the requested service.

        @[JSON::Field(key: "service")]
        getter service : Types::Service?

        def initialize(
          @service : Types::Service? = nil
        )
        end
      end


      struct GetServiceSyncBlockerSummaryInput
        include JSON::Serializable

        # The name of the service that you want to get the service sync blocker summary for. If given only the
        # service name, all instances are blocked.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The name of the service instance that you want to get the service sync blocker summary for. If given
        # bothe the instance name and the service name, only the instance is blocked.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        def initialize(
          @service_name : String,
          @service_instance_name : String? = nil
        )
        end
      end


      struct GetServiceSyncBlockerSummaryOutput
        include JSON::Serializable

        # The detailed data of the requested service sync blocker summary.

        @[JSON::Field(key: "serviceSyncBlockerSummary")]
        getter service_sync_blocker_summary : Types::ServiceSyncBlockerSummary?

        def initialize(
          @service_sync_blocker_summary : Types::ServiceSyncBlockerSummary? = nil
        )
        end
      end


      struct GetServiceSyncConfigInput
        include JSON::Serializable

        # The name of the service that you want to get the service sync configuration for.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_name : String
        )
        end
      end


      struct GetServiceSyncConfigOutput
        include JSON::Serializable

        # The detailed data of the requested service sync configuration.

        @[JSON::Field(key: "serviceSyncConfig")]
        getter service_sync_config : Types::ServiceSyncConfig?

        def initialize(
          @service_sync_config : Types::ServiceSyncConfig? = nil
        )
        end
      end


      struct GetServiceTemplateInput
        include JSON::Serializable

        # The name of the service template that you want to get detailed data for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetServiceTemplateOutput
        include JSON::Serializable

        # The detailed data of the requested service template.

        @[JSON::Field(key: "serviceTemplate")]
        getter service_template : Types::ServiceTemplate

        def initialize(
          @service_template : Types::ServiceTemplate
        )
        end
      end


      struct GetServiceTemplateVersionInput
        include JSON::Serializable

        # To get service template major version detail data, include major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # To get service template minor version detail data, include minorVersion .

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The name of the service template a version of which you want to get detailed data for.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @major_version : String,
          @minor_version : String,
          @template_name : String
        )
        end
      end


      struct GetServiceTemplateVersionOutput
        include JSON::Serializable

        # The detailed data of the requested service template version.

        @[JSON::Field(key: "serviceTemplateVersion")]
        getter service_template_version : Types::ServiceTemplateVersion

        def initialize(
          @service_template_version : Types::ServiceTemplateVersion
        )
        end
      end


      struct GetTemplateSyncConfigInput
        include JSON::Serializable

        # The template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The template type.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        def initialize(
          @template_name : String,
          @template_type : String
        )
        end
      end


      struct GetTemplateSyncConfigOutput
        include JSON::Serializable

        # The template sync configuration detail data that's returned by Proton.

        @[JSON::Field(key: "templateSyncConfig")]
        getter template_sync_config : Types::TemplateSyncConfig?

        def initialize(
          @template_sync_config : Types::TemplateSyncConfig? = nil
        )
        end
      end


      struct GetTemplateSyncStatusInput
        include JSON::Serializable

        # The template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The template type.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # The template major version.

        @[JSON::Field(key: "templateVersion")]
        getter template_version : String

        def initialize(
          @template_name : String,
          @template_type : String,
          @template_version : String
        )
        end
      end


      struct GetTemplateSyncStatusOutput
        include JSON::Serializable

        # The template sync desired state that's returned by Proton.

        @[JSON::Field(key: "desiredState")]
        getter desired_state : Types::Revision?

        # The details of the last successful sync that's returned by Proton.

        @[JSON::Field(key: "latestSuccessfulSync")]
        getter latest_successful_sync : Types::ResourceSyncAttempt?

        # The details of the last sync that's returned by Proton.

        @[JSON::Field(key: "latestSync")]
        getter latest_sync : Types::ResourceSyncAttempt?

        def initialize(
          @desired_state : Types::Revision? = nil,
          @latest_successful_sync : Types::ResourceSyncAttempt? = nil,
          @latest_sync : Types::ResourceSyncAttempt? = nil
        )
        end
      end

      # The request failed to register with the service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListComponentOutputsInput
        include JSON::Serializable

        # The name of the component whose outputs you want.

        @[JSON::Field(key: "componentName")]
        getter component_name : String

        # The ID of the deployment whose outputs you want.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A token that indicates the location of the next output in the array of outputs, after the list of
        # outputs that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_name : String,
          @deployment_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentOutputsOutput
        include JSON::Serializable

        # An array of component Infrastructure as Code (IaC) outputs.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)

        # A token that indicates the location of the next output in the array of outputs, after the list of
        # outputs that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @outputs : Array(Types::Output),
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentProvisionedResourcesInput
        include JSON::Serializable

        # The name of the component whose provisioned resources you want.

        @[JSON::Field(key: "componentName")]
        getter component_name : String

        # A token that indicates the location of the next provisioned resource in the array of provisioned
        # resources, after the list of provisioned resources that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentProvisionedResourcesOutput
        include JSON::Serializable

        # An array of provisioned resources for a component.

        @[JSON::Field(key: "provisionedResources")]
        getter provisioned_resources : Array(Types::ProvisionedResource)

        # A token that indicates the location of the next provisioned resource in the array of provisioned
        # resources, after the current requested list of provisioned resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @provisioned_resources : Array(Types::ProvisionedResource),
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentsInput
        include JSON::Serializable

        # The name of an environment for result list filtering. Proton returns components associated with the
        # environment or attached to service instances running in it.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The maximum number of components to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next component in the array of components, after the list
        # of components that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of a service instance for result list filtering. Proton returns the component attached to
        # the service instance, if any.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of a service for result list filtering. Proton returns components attached to service
        # instances of the service.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @environment_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil
        )
        end
      end


      struct ListComponentsOutput
        include JSON::Serializable

        # An array of components with summary data.

        @[JSON::Field(key: "components")]
        getter components : Array(Types::ComponentSummary)

        # A token that indicates the location of the next component in the array of components, after the
        # current requested list of components.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @components : Array(Types::ComponentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsInput
        include JSON::Serializable

        # The name of a component for result list filtering. Proton returns deployments associated with that
        # component.

        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The name of an environment for result list filtering. Proton returns deployments associated with the
        # environment.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The maximum number of deployments to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next deployment in the array of deployment, after the
        # list of deployment that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of a service instance for result list filtering. Proton returns the deployments associated
        # with the service instance.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of a service for result list filtering. Proton returns deployments associated with service
        # instances of the service.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @component_name : String? = nil,
          @environment_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil
        )
        end
      end


      struct ListDeploymentsOutput
        include JSON::Serializable

        # An array of deployment with summary data.

        @[JSON::Field(key: "deployments")]
        getter deployments : Array(Types::DeploymentSummary)

        # A token that indicates the location of the next deployment in the array of deployment, after the
        # current requested list of deployment.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployments : Array(Types::DeploymentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentAccountConnectionsInput
        include JSON::Serializable

        # The type of account making the ListEnvironmentAccountConnections request.

        @[JSON::Field(key: "requestedBy")]
        getter requested_by : String

        # The environment name that's associated with each listed environment account connection.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The maximum number of environment account connections to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next environment account connection in the array of
        # environment account connections, after the list of environment account connections that was
        # previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status details for each listed environment account connection.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        def initialize(
          @requested_by : String,
          @environment_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct ListEnvironmentAccountConnectionsOutput
        include JSON::Serializable

        # An array of environment account connections with details that's returned by Proton.

        @[JSON::Field(key: "environmentAccountConnections")]
        getter environment_account_connections : Array(Types::EnvironmentAccountConnectionSummary)

        # A token that indicates the location of the next environment account connection in the array of
        # environment account connections, after the current requested list of environment account
        # connections.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_account_connections : Array(Types::EnvironmentAccountConnectionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentOutputsInput
        include JSON::Serializable

        # The environment name.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The ID of the deployment whose outputs you want.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A token that indicates the location of the next environment output in the array of environment
        # outputs, after the list of environment outputs that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_name : String,
          @deployment_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentOutputsOutput
        include JSON::Serializable

        # An array of environment outputs with detail data.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)

        # A token that indicates the location of the next environment output in the array of environment
        # outputs, after the current requested list of environment outputs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @outputs : Array(Types::Output),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentProvisionedResourcesInput
        include JSON::Serializable

        # The environment name.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # A token that indicates the location of the next environment provisioned resource in the array of
        # environment provisioned resources, after the list of environment provisioned resources that was
        # previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentProvisionedResourcesOutput
        include JSON::Serializable

        # An array of environment provisioned resources.

        @[JSON::Field(key: "provisionedResources")]
        getter provisioned_resources : Array(Types::ProvisionedResource)

        # A token that indicates the location of the next environment provisioned resource in the array of
        # provisioned resources, after the current requested list of environment provisioned resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @provisioned_resources : Array(Types::ProvisionedResource),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentTemplateVersionsInput
        include JSON::Serializable

        # The name of the environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # To view a list of minor of versions under a major version of an environment template, include major
        # Version . To view a list of major versions of an environment template, exclude major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String?

        # The maximum number of major or minor versions of an environment template to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next major or minor version in the array of major or
        # minor versions of an environment template, after the list of major or minor versions that was
        # previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_name : String,
          @major_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentTemplateVersionsOutput
        include JSON::Serializable

        # An array of major or minor versions of an environment template detail data.

        @[JSON::Field(key: "templateVersions")]
        getter template_versions : Array(Types::EnvironmentTemplateVersionSummary)

        # A token that indicates the location of the next major or minor version in the array of major or
        # minor versions of an environment template, after the list of major or minor versions that was
        # previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_versions : Array(Types::EnvironmentTemplateVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentTemplatesInput
        include JSON::Serializable

        # The maximum number of environment templates to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next environment template in the array of environment
        # templates, after the list of environment templates that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentTemplatesOutput
        include JSON::Serializable

        # An array of environment templates with detail data.

        @[JSON::Field(key: "templates")]
        getter templates : Array(Types::EnvironmentTemplateSummary)

        # A token that indicates the location of the next environment template in the array of environment
        # templates, after the current requested list of environment templates.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @templates : Array(Types::EnvironmentTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsInput
        include JSON::Serializable

        # An array of the versions of the environment template.

        @[JSON::Field(key: "environmentTemplates")]
        getter environment_templates : Array(Types::EnvironmentTemplateFilter)?

        # The maximum number of environments to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next environment in the array of environments, after the
        # list of environments that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_templates : Array(Types::EnvironmentTemplateFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsOutput
        include JSON::Serializable

        # An array of environment detail data summaries.

        @[JSON::Field(key: "environments")]
        getter environments : Array(Types::EnvironmentSummary)

        # A token that indicates the location of the next environment in the array of environments, after the
        # current requested list of environments.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(Types::EnvironmentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListRepositoriesInput
        include JSON::Serializable

        # The maximum number of repositories to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next repository in the array of repositories, after the
        # list of repositories previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRepositoriesOutput
        include JSON::Serializable

        # An array of repository links.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::RepositorySummary)

        # A token that indicates the location of the next repository in the array of repositories, after the
        # current requested list of repositories.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @repositories : Array(Types::RepositorySummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListRepositorySyncDefinitionsInput
        include JSON::Serializable

        # The repository name.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The repository provider.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The sync type. The only supported value is TEMPLATE_SYNC .

        @[JSON::Field(key: "syncType")]
        getter sync_type : String

        # A token that indicates the location of the next repository sync definition in the array of
        # repository sync definitions, after the list of repository sync definitions previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @repository_name : String,
          @repository_provider : String,
          @sync_type : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListRepositorySyncDefinitionsOutput
        include JSON::Serializable

        # An array of repository sync definitions.

        @[JSON::Field(key: "syncDefinitions")]
        getter sync_definitions : Array(Types::RepositorySyncDefinition)

        # A token that indicates the location of the next repository sync definition in the array of
        # repository sync definitions, after the current requested list of repository sync definitions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sync_definitions : Array(Types::RepositorySyncDefinition),
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceInstanceOutputsInput
        include JSON::Serializable

        # The name of the service instance whose outputs you want.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String

        # The name of the service that serviceInstanceName is associated to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The ID of the deployment whose outputs you want.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A token that indicates the location of the next output in the array of outputs, after the list of
        # outputs that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_instance_name : String,
          @service_name : String,
          @deployment_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceInstanceOutputsOutput
        include JSON::Serializable

        # An array of service instance Infrastructure as Code (IaC) outputs.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)

        # A token that indicates the location of the next output in the array of outputs, after the current
        # requested list of outputs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @outputs : Array(Types::Output),
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceInstanceProvisionedResourcesInput
        include JSON::Serializable

        # The name of the service instance whose provisioned resources you want.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String

        # The name of the service that serviceInstanceName is associated to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # A token that indicates the location of the next provisioned resource in the array of provisioned
        # resources, after the list of provisioned resources that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_instance_name : String,
          @service_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceInstanceProvisionedResourcesOutput
        include JSON::Serializable

        # An array of provisioned resources for a service instance.

        @[JSON::Field(key: "provisionedResources")]
        getter provisioned_resources : Array(Types::ProvisionedResource)

        # A token that indicates the location of the next provisioned resource in the array of provisioned
        # resources, after the current requested list of provisioned resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @provisioned_resources : Array(Types::ProvisionedResource),
          @next_token : String? = nil
        )
        end
      end

      # A filtering criterion to scope down the result list of the ListServiceInstances action.

      struct ListServiceInstancesFilter
        include JSON::Serializable

        # The name of a filtering criterion.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A value to filter by. With the date/time keys ( *At{Before,After} ), the value is a valid RFC 3339
        # string with no UTC offset and with an optional fractional precision (for example,
        # 1985-04-12T23:20:50.52Z ).

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct ListServiceInstancesInput
        include JSON::Serializable

        # An array of filtering criteria that scope down the result list. By default, all service instances in
        # the Amazon Web Services account are returned.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListServiceInstancesFilter)?

        # The maximum number of service instances to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next service in the array of service instances, after the
        # list of service instances that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the service that the service instance belongs to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The field that the result list is sorted by. When you choose to sort by serviceName , service
        # instances within each service are sorted by service instance name. Default: serviceName

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Result list sort order. Default: ASCENDING

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @filters : Array(Types::ListServiceInstancesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_name : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListServiceInstancesOutput
        include JSON::Serializable

        # An array of service instances with summary data.

        @[JSON::Field(key: "serviceInstances")]
        getter service_instances : Array(Types::ServiceInstanceSummary)

        # A token that indicates the location of the next service instance in the array of service instances,
        # after the current requested list of service instances.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_instances : Array(Types::ServiceInstanceSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListServicePipelineOutputsInput
        include JSON::Serializable

        # The name of the service whose pipeline's outputs you want.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The ID of the deployment you want the outputs for.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A token that indicates the location of the next output in the array of outputs, after the list of
        # outputs that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_name : String,
          @deployment_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServicePipelineOutputsOutput
        include JSON::Serializable

        # An array of service pipeline Infrastructure as Code (IaC) outputs.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)

        # A token that indicates the location of the next output in the array of outputs, after the current
        # requested list of outputs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @outputs : Array(Types::Output),
          @next_token : String? = nil
        )
        end
      end


      struct ListServicePipelineProvisionedResourcesInput
        include JSON::Serializable

        # The name of the service whose pipeline's provisioned resources you want.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # A token that indicates the location of the next provisioned resource in the array of provisioned
        # resources, after the list of provisioned resources that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListServicePipelineProvisionedResourcesOutput
        include JSON::Serializable

        # An array of provisioned resources for a service and pipeline.

        @[JSON::Field(key: "provisionedResources")]
        getter provisioned_resources : Array(Types::ProvisionedResource)

        # A token that indicates the location of the next provisioned resource in the array of provisioned
        # resources, after the current requested list of provisioned resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @provisioned_resources : Array(Types::ProvisionedResource),
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceTemplateVersionsInput
        include JSON::Serializable

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # To view a list of minor of versions under a major version of a service template, include major
        # Version . To view a list of major versions of a service template, exclude major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String?

        # The maximum number of major or minor versions of a service template to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next major or minor version in the array of major or
        # minor versions of a service template, after the list of major or minor versions that was previously
        # requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_name : String,
          @major_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceTemplateVersionsOutput
        include JSON::Serializable

        # An array of major or minor versions of a service template with detail data.

        @[JSON::Field(key: "templateVersions")]
        getter template_versions : Array(Types::ServiceTemplateVersionSummary)

        # A token that indicates the location of the next major or minor version in the array of major or
        # minor versions of a service template, after the current requested list of service major or minor
        # versions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_versions : Array(Types::ServiceTemplateVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceTemplatesInput
        include JSON::Serializable

        # The maximum number of service templates to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next service template in the array of service templates,
        # after the list of service templates previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceTemplatesOutput
        include JSON::Serializable

        # An array of service templates with detail data.

        @[JSON::Field(key: "templates")]
        getter templates : Array(Types::ServiceTemplateSummary)

        # A token that indicates the location of the next service template in the array of service templates,
        # after the current requested list of service templates.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @templates : Array(Types::ServiceTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListServicesInput
        include JSON::Serializable

        # The maximum number of services to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next service in the array of services, after the list of
        # services that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServicesOutput
        include JSON::Serializable

        # An array of services with summaries of detail data.

        @[JSON::Field(key: "services")]
        getter services : Array(Types::ServiceSummary)

        # A token that indicates the location of the next service in the array of services, after the current
        # requested list of services.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @services : Array(Types::ServiceSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for the listed tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of tags to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates the location of the next resource tag in the array of resource tags, after
        # the list of resource tags that was previously requested.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # A list of resource tags with detail data.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        # A token that indicates the location of the next resource tag in the array of resource tags, after
        # the current requested list of resource tags.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @tags : Array(Types::Tag),
          @next_token : String? = nil
        )
        end
      end


      struct NotifyResourceDeploymentStatusChangeInput
        include JSON::Serializable

        # The provisioned resource Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The deployment ID for your provisioned resource.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The provisioned resource state change detail data that's returned by Proton.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)?

        # The status of your provisioned resource.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The deployment status message for your provisioned resource.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @resource_arn : String,
          @deployment_id : String? = nil,
          @outputs : Array(Types::Output)? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct NotifyResourceDeploymentStatusChangeOutput
        include JSON::Serializable

        def initialize
        end
      end

      # An infrastructure as code defined resource output.

      struct Output
        include JSON::Serializable

        # The output key.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The output value.

        @[JSON::Field(key: "valueString")]
        getter value_string : String?

        def initialize(
          @key : String? = nil,
          @value_string : String? = nil
        )
        end
      end

      # Detail data for a provisioned resource.

      struct ProvisionedResource
        include JSON::Serializable

        # The provisioned resource identifier.

        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # The provisioned resource name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The resource provisioning engine. At this time, CLOUDFORMATION can be used for Amazon Web
        # Services-managed provisioning, and TERRAFORM can be used for self-managed provisioning. For more
        # information, see Self-managed provisioning in the Proton User Guide .

        @[JSON::Field(key: "provisioningEngine")]
        getter provisioning_engine : String?

        def initialize(
          @identifier : String? = nil,
          @name : String? = nil,
          @provisioning_engine : String? = nil
        )
        end
      end


      struct RejectEnvironmentAccountConnectionInput
        include JSON::Serializable

        # The ID of the environment account connection to reject.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct RejectEnvironmentAccountConnectionOutput
        include JSON::Serializable

        # The environment connection account detail data that's returned by Proton.

        @[JSON::Field(key: "environmentAccountConnection")]
        getter environment_account_connection : Types::EnvironmentAccountConnection

        def initialize(
          @environment_account_connection : Types::EnvironmentAccountConnection
        )
        end
      end

      # Detailed data of a linked repository—a repository that has been registered with Proton.

      struct Repository
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the linked repository.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of your AWS CodeStar connection that connects Proton to your
        # repository provider account.

        @[JSON::Field(key: "connectionArn")]
        getter connection_arn : String

        # The repository name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The repository provider.

        @[JSON::Field(key: "provider")]
        getter provider : String

        # Your customer Amazon Web Services KMS encryption key.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        def initialize(
          @arn : String,
          @connection_arn : String,
          @name : String,
          @provider : String,
          @encryption_key : String? = nil
        )
        end
      end

      # Detail data for a linked repository branch.

      struct RepositoryBranch
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the linked repository.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The repository name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The repository provider.

        @[JSON::Field(key: "provider")]
        getter provider : String

        def initialize(
          @arn : String,
          @branch : String,
          @name : String,
          @provider : String
        )
        end
      end

      # Detail input data for a linked repository branch.

      struct RepositoryBranchInput
        include JSON::Serializable

        # The repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The repository name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The repository provider.

        @[JSON::Field(key: "provider")]
        getter provider : String

        def initialize(
          @branch : String,
          @name : String,
          @provider : String
        )
        end
      end

      # Summary data of a linked repository—a repository that has been registered with Proton.

      struct RepositorySummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the linked repository.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the of your connection that connects Proton to your repository.

        @[JSON::Field(key: "connectionArn")]
        getter connection_arn : String

        # The repository name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The repository provider.

        @[JSON::Field(key: "provider")]
        getter provider : String

        def initialize(
          @arn : String,
          @connection_arn : String,
          @name : String,
          @provider : String
        )
        end
      end

      # Detail data for a repository sync attempt activated by a push to a repository.

      struct RepositorySyncAttempt
        include JSON::Serializable

        # Detail data for sync attempt events.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::RepositorySyncEvent)

        # The time when the sync attempt started.

        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # The sync attempt status.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @events : Array(Types::RepositorySyncEvent),
          @started_at : Time,
          @status : String
        )
        end
      end

      # A repository sync definition.

      struct RepositorySyncDefinition
        include JSON::Serializable

        # The repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The directory in the repository.

        @[JSON::Field(key: "directory")]
        getter directory : String

        # The resource that is synced from.

        @[JSON::Field(key: "parent")]
        getter parent : String

        # The resource that is synced to.

        @[JSON::Field(key: "target")]
        getter target : String

        def initialize(
          @branch : String,
          @directory : String,
          @parent : String,
          @target : String
        )
        end
      end

      # Repository sync event detail data for a sync attempt.

      struct RepositorySyncEvent
        include JSON::Serializable

        # Event detail for a repository sync attempt.

        @[JSON::Field(key: "event")]
        getter event : String

        # The time that the sync event occurred.

        @[JSON::Field(key: "time", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time : Time

        # The type of event.

        @[JSON::Field(key: "type")]
        getter type : String

        # The external ID of the sync event.

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        def initialize(
          @event : String,
          @time : Time,
          @type : String,
          @external_id : String? = nil
        )
        end
      end

      # Summary counts of each Proton resource types.

      struct ResourceCountsSummary
        include JSON::Serializable

        # The total number of resources of this type in the Amazon Web Services account.

        @[JSON::Field(key: "total")]
        getter total : Int32

        # The number of resources of this type in the Amazon Web Services account that need a major template
        # version update.

        @[JSON::Field(key: "behindMajor")]
        getter behind_major : Int32?

        # The number of resources of this type in the Amazon Web Services account that need a minor template
        # version update.

        @[JSON::Field(key: "behindMinor")]
        getter behind_minor : Int32?

        # The number of resources of this type in the Amazon Web Services account that failed to deploy.

        @[JSON::Field(key: "failed")]
        getter failed : Int32?

        # The number of resources of this type in the Amazon Web Services account that are up-to-date with
        # their template.

        @[JSON::Field(key: "upToDate")]
        getter up_to_date : Int32?

        def initialize(
          @total : Int32,
          @behind_major : Int32? = nil,
          @behind_minor : Int32? = nil,
          @failed : Int32? = nil,
          @up_to_date : Int32? = nil
        )
        end
      end

      # The requested resource wasn't found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Detail data for a resource sync attempt activated by a push to a repository.

      struct ResourceSyncAttempt
        include JSON::Serializable

        # An array of events with detail data.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::ResourceSyncEvent)

        # Detail data for the initial repository commit, path and push.

        @[JSON::Field(key: "initialRevision")]
        getter initial_revision : Types::Revision

        # The time when the sync attempt started.

        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # The status of the sync attempt.

        @[JSON::Field(key: "status")]
        getter status : String

        # The resource that is synced to.

        @[JSON::Field(key: "target")]
        getter target : String

        # Detail data for the target revision.

        @[JSON::Field(key: "targetRevision")]
        getter target_revision : Types::Revision

        def initialize(
          @events : Array(Types::ResourceSyncEvent),
          @initial_revision : Types::Revision,
          @started_at : Time,
          @status : String,
          @target : String,
          @target_revision : Types::Revision
        )
        end
      end

      # Detail data for a resource sync event.

      struct ResourceSyncEvent
        include JSON::Serializable

        # A resource sync event.

        @[JSON::Field(key: "event")]
        getter event : String

        # The time when the event occurred.

        @[JSON::Field(key: "time", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time : Time

        # The type of event.

        @[JSON::Field(key: "type")]
        getter type : String

        # The external ID for the event.

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        def initialize(
          @event : String,
          @time : Time,
          @type : String,
          @external_id : String? = nil
        )
        end
      end

      # Revision detail data for a commit and push that activates a sync attempt

      struct Revision
        include JSON::Serializable

        # The repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The repository directory changed by a commit and push that activated the sync attempt.

        @[JSON::Field(key: "directory")]
        getter directory : String

        # The repository name.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The repository provider.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The secure hash algorithm (SHA) hash for the revision.

        @[JSON::Field(key: "sha")]
        getter sha : String

        def initialize(
          @branch : String,
          @directory : String,
          @repository_name : String,
          @repository_provider : String,
          @sha : String
        )
        end
      end

      # Template bundle S3 bucket data.

      struct S3ObjectSource
        include JSON::Serializable

        # The name of the S3 bucket that contains a template bundle.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The path to the S3 bucket that contains a template bundle.

        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # Detailed data of an Proton service resource.

      struct Service
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the service was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the service was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the service.

        @[JSON::Field(key: "name")]
        getter name : String

        # The formatted specification that defines the service.

        @[JSON::Field(key: "spec")]
        getter spec : String

        # The status of the service.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The name of the code repository branch that holds the code that's deployed in Proton.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        # A description of the service.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The service pipeline detail data.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::ServicePipeline?

        # The Amazon Resource Name (ARN) of the repository connection. For more information, see Setting up an
        # AWS CodeStar connection in the Proton User Guide .

        @[JSON::Field(key: "repositoryConnectionArn")]
        getter repository_connection_arn : String?

        # The ID of the source code repository.

        @[JSON::Field(key: "repositoryId")]
        getter repository_id : String?

        # A service status message.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @name : String,
          @spec : String,
          @status : String,
          @template_name : String,
          @branch_name : String? = nil,
          @description : String? = nil,
          @pipeline : Types::ServicePipeline? = nil,
          @repository_connection_arn : String? = nil,
          @repository_id : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Detailed data of an Proton service instance resource.

      struct ServiceInstance
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service instance.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the service instance was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The service instance deployment status.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The name of the environment that the service instance was deployed into.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The time when a deployment of the service instance was last attempted.

        @[JSON::Field(key: "lastDeploymentAttemptedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_attempted_at : Time

        # The time when the service instance was last deployed successfully.

        @[JSON::Field(key: "lastDeploymentSucceededAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_succeeded_at : Time

        # The name of the service instance.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the service that the service instance belongs to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The major version of the service template that was used to create the service instance.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The minor version of the service template that was used to create the service instance.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The name of the service template that was used to create the service instance.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The message associated with the service instance deployment status.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The ID of the last attempted deployment of this service instance.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The last client request token received.

        @[JSON::Field(key: "lastClientRequestToken")]
        getter last_client_request_token : String?

        # The ID of the last successful deployment of this service instance.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The service spec that was used to create the service instance.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @environment_name : String,
          @last_deployment_attempted_at : Time,
          @last_deployment_succeeded_at : Time,
          @name : String,
          @service_name : String,
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @deployment_status_message : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_client_request_token : String? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @spec : String? = nil
        )
        end
      end

      # The detailed data about the current state of this service instance.

      struct ServiceInstanceState
        include JSON::Serializable

        # The service spec that was used to create the service instance.

        @[JSON::Field(key: "spec")]
        getter spec : String

        # The major version of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The minor version of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The name of the service template that was used to create the service instance.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The IDs for the last successful components deployed for this service instance.

        @[JSON::Field(key: "lastSuccessfulComponentDeploymentIds")]
        getter last_successful_component_deployment_ids : Array(String)?

        # The ID for the last successful environment deployed for this service instance.

        @[JSON::Field(key: "lastSuccessfulEnvironmentDeploymentId")]
        getter last_successful_environment_deployment_id : String?

        # The ID for the last successful service pipeline deployed for this service instance.

        @[JSON::Field(key: "lastSuccessfulServicePipelineDeploymentId")]
        getter last_successful_service_pipeline_deployment_id : String?

        def initialize(
          @spec : String,
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @last_successful_component_deployment_ids : Array(String)? = nil,
          @last_successful_environment_deployment_id : String? = nil,
          @last_successful_service_pipeline_deployment_id : String? = nil
        )
        end
      end

      # Summary data of an Proton service instance resource.

      struct ServiceInstanceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service instance.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the service instance was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The service instance deployment status.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The name of the environment that the service instance was deployed into.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The time when a deployment of the service was last attempted.

        @[JSON::Field(key: "lastDeploymentAttemptedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_attempted_at : Time

        # The time when the service was last deployed successfully.

        @[JSON::Field(key: "lastDeploymentSucceededAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_succeeded_at : Time

        # The name of the service instance.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the service that the service instance belongs to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The service instance template major version.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The service instance template minor version.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A service instance deployment status message.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The ID of the last attempted deployment of this service instance.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The ID of the last successful deployment of this service instance.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @environment_name : String,
          @last_deployment_attempted_at : Time,
          @last_deployment_succeeded_at : Time,
          @name : String,
          @service_name : String,
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @deployment_status_message : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_succeeded_deployment_id : String? = nil
        )
        end
      end

      # Detailed data of an Proton service instance pipeline resource.

      struct ServicePipeline
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service pipeline.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the service pipeline was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The deployment status of the service pipeline.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String

        # The time when a deployment of the service pipeline was last attempted.

        @[JSON::Field(key: "lastDeploymentAttemptedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_attempted_at : Time

        # The time when the service pipeline was last deployed successfully.

        @[JSON::Field(key: "lastDeploymentSucceededAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deployment_succeeded_at : Time

        # The major version of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The minor version of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The name of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A service pipeline deployment status message.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The ID of the last attempted deployment of this service pipeline.

        @[JSON::Field(key: "lastAttemptedDeploymentId")]
        getter last_attempted_deployment_id : String?

        # The ID of the last successful deployment of this service pipeline.

        @[JSON::Field(key: "lastSucceededDeploymentId")]
        getter last_succeeded_deployment_id : String?

        # The service spec that was used to create the service pipeline.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @deployment_status : String,
          @last_deployment_attempted_at : Time,
          @last_deployment_succeeded_at : Time,
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @deployment_status_message : String? = nil,
          @last_attempted_deployment_id : String? = nil,
          @last_succeeded_deployment_id : String? = nil,
          @spec : String? = nil
        )
        end
      end

      # The detailed data about the current state of the service pipeline.

      struct ServicePipelineState
        include JSON::Serializable

        # The major version of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String

        # The minor version of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String

        # The name of the service template that was used to create the service pipeline.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The service spec that was used to create the service pipeline.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        def initialize(
          @template_major_version : String,
          @template_minor_version : String,
          @template_name : String,
          @spec : String? = nil
        )
        end
      end

      # A quota was exceeded. For more information, see Proton Quotas in the Proton User Guide .

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Summary data of an Proton service resource.

      struct ServiceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the service was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the service was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the service.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the service.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A description of the service.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A service status message.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @name : String,
          @status : String,
          @template_name : String,
          @description : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # If a service instance is manually updated, Proton wants to prevent accidentally overriding a manual
      # change. A blocker is created because of the manual update or deletion of a service instance. The
      # summary describes the blocker as being active or resolved.

      struct ServiceSyncBlockerSummary
        include JSON::Serializable

        # The name of the service that you want to get the sync blocker summary for. If given a service
        # instance name and a service name, it will return the blockers only applying to the instance that is
        # blocked. If given only a service name, it will return the blockers that apply to all of the
        # instances. In order to get the blockers for a single instance, you will need to make two distinct
        # calls, one to get the sync blocker summary for the service and the other to get the sync blocker for
        # the service instance.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The latest active blockers for the synced service.

        @[JSON::Field(key: "latestBlockers")]
        getter latest_blockers : Array(Types::SyncBlocker)?

        # The name of the service instance that you want sync your service configuration with.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        def initialize(
          @service_name : String,
          @latest_blockers : Array(Types::SyncBlocker)? = nil,
          @service_instance_name : String? = nil
        )
        end
      end

      # Detailed data of the service sync configuration.

      struct ServiceSyncConfig
        include JSON::Serializable

        # The name of the code repository branch that holds the service code Proton will sync with.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The file path to the service sync configuration file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The name of the code repository that holds the service code Proton will sync with.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The name of the repository provider that holds the repository Proton will sync with.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The name of the service that the service instance is added to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @branch : String,
          @file_path : String,
          @repository_name : String,
          @repository_provider : String,
          @service_name : String
        )
        end
      end

      # Detailed data of an Proton service template resource.

      struct ServiceTemplate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the service template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the service template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the service template.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the service template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The service template name as displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The customer provided service template encryption key that's used to encrypt data.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # If pipelineProvisioning is true , a service pipeline is included in the service template. Otherwise,
        # a service pipeline isn't included in the service template.

        @[JSON::Field(key: "pipelineProvisioning")]
        getter pipeline_provisioning : String?

        # The recommended version of the service template.

        @[JSON::Field(key: "recommendedVersion")]
        getter recommended_version : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @encryption_key : String? = nil,
          @pipeline_provisioning : String? = nil,
          @recommended_version : String? = nil
        )
        end
      end

      # Summary data of an Proton service template resource.

      struct ServiceTemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the service template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the service template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The name of the service template.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the service template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The service template name as displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # If pipelineProvisioning is true , a service pipeline is included in the service template, otherwise
        # a service pipeline isn't included in the service template.

        @[JSON::Field(key: "pipelineProvisioning")]
        getter pipeline_provisioning : String?

        # The recommended version of the service template.

        @[JSON::Field(key: "recommendedVersion")]
        getter recommended_version : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @pipeline_provisioning : String? = nil,
          @recommended_version : String? = nil
        )
        end
      end

      # Detailed data of an Proton service template version resource.

      struct ServiceTemplateVersion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the version of a service template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # An array of compatible environment template names for the major version of a service template.

        @[JSON::Field(key: "compatibleEnvironmentTemplates")]
        getter compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplate)

        # The time when the version of a service template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the version of a service template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The latest major version that's associated with the version of a service template.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The minor version of a service template.

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The service template version status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the version of a service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A description of the version of a service template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The recommended minor version of the service template.

        @[JSON::Field(key: "recommendedMinorVersion")]
        getter recommended_minor_version : String?

        # The schema of the version of a service template.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        # A service template version status message.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # An array of supported component sources. Components with supported sources can be attached to
        # service instances based on this service template version. For more information about components, see
        # Proton components in the Proton User Guide .

        @[JSON::Field(key: "supportedComponentSources")]
        getter supported_component_sources : Array(String)?

        def initialize(
          @arn : String,
          @compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplate),
          @created_at : Time,
          @last_modified_at : Time,
          @major_version : String,
          @minor_version : String,
          @status : String,
          @template_name : String,
          @description : String? = nil,
          @recommended_minor_version : String? = nil,
          @schema : String? = nil,
          @status_message : String? = nil,
          @supported_component_sources : Array(String)? = nil
        )
        end
      end

      # Summary data of an Proton service template version resource.

      struct ServiceTemplateVersionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the version of a service template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the version of a service template was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when the version of a service template was last modified.

        @[JSON::Field(key: "lastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_at : Time

        # The latest major version that's associated with the version of a service template.

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # The minor version of a service template.

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The service template minor version status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A description of the version of a service template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The recommended minor version of the service template.

        @[JSON::Field(key: "recommendedMinorVersion")]
        getter recommended_minor_version : String?

        # A service template minor version status message.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_modified_at : Time,
          @major_version : String,
          @minor_version : String,
          @status : String,
          @template_name : String,
          @description : String? = nil,
          @recommended_minor_version : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Detailed data of the sync blocker.

      struct SyncBlocker
        include JSON::Serializable

        # The time when the sync blocker was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The reason why the sync blocker was created.

        @[JSON::Field(key: "createdReason")]
        getter created_reason : String

        # The ID of the sync blocker.

        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the sync blocker.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the sync blocker.

        @[JSON::Field(key: "type")]
        getter type : String

        # The contexts for the sync blocker.

        @[JSON::Field(key: "contexts")]
        getter contexts : Array(Types::SyncBlockerContext)?

        # The time the sync blocker was resolved.

        @[JSON::Field(key: "resolvedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter resolved_at : Time?

        # The reason the sync blocker was resolved.

        @[JSON::Field(key: "resolvedReason")]
        getter resolved_reason : String?

        def initialize(
          @created_at : Time,
          @created_reason : String,
          @id : String,
          @status : String,
          @type : String,
          @contexts : Array(Types::SyncBlockerContext)? = nil,
          @resolved_at : Time? = nil,
          @resolved_reason : String? = nil
        )
        end
      end

      # Detailed data of the context of the sync blocker.

      struct SyncBlockerContext
        include JSON::Serializable

        # The key for the sync blocker context.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the sync blocker context.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # A description of a resource tag.

      struct Tag
        include JSON::Serializable

        # The key of the resource tag.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the resource tag.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Proton resource to apply customer tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of customer tags to apply to the Proton resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The detail data for a template sync configuration.

      struct TemplateSyncConfig
        include JSON::Serializable

        # The repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The repository name (for example, myrepos/myrepo ).

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The repository provider.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The template type.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # A subdirectory path to your template bundle version.

        @[JSON::Field(key: "subdirectory")]
        getter subdirectory : String?

        def initialize(
          @branch : String,
          @repository_name : String,
          @repository_provider : String,
          @template_name : String,
          @template_type : String,
          @subdirectory : String? = nil
        )
        end
      end

      # Template version source data.

      struct TemplateVersionSourceInput
        include JSON::Serializable

        # An S3 source object that includes the template bundle S3 path and name for a template minor version.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3ObjectSource?

        def initialize(
          @s3 : Types::S3ObjectSource? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove customer tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of customer tag keys that indicate the customer tags to be removed from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAccountSettingsInput
        include JSON::Serializable

        # Set to true to remove a configured pipeline repository from the account settings. Don't set this
        # field if you are updating the configured pipeline repository.

        @[JSON::Field(key: "deletePipelineProvisioningRepository")]
        getter delete_pipeline_provisioning_repository : Bool?

        # The Amazon Resource Name (ARN) of the service role you want to use for provisioning pipelines.
        # Proton assumes this role for CodeBuild-based provisioning.

        @[JSON::Field(key: "pipelineCodebuildRoleArn")]
        getter pipeline_codebuild_role_arn : String?

        # A linked repository for pipeline provisioning. Specify it if you have environments configured for
        # self-managed provisioning with services that include pipelines. A linked repository is a repository
        # that has been registered with Proton. For more information, see CreateRepository . To remove a
        # previously configured repository, set deletePipelineProvisioningRepository to true , and don't set
        # pipelineProvisioningRepository .

        @[JSON::Field(key: "pipelineProvisioningRepository")]
        getter pipeline_provisioning_repository : Types::RepositoryBranchInput?

        # The Amazon Resource Name (ARN) of the service role you want to use for provisioning pipelines.
        # Assumed by Proton for Amazon Web Services-managed provisioning, and by customer-owned automation for
        # self-managed provisioning. To remove a previously configured ARN, specify an empty string.

        @[JSON::Field(key: "pipelineServiceRoleArn")]
        getter pipeline_service_role_arn : String?

        def initialize(
          @delete_pipeline_provisioning_repository : Bool? = nil,
          @pipeline_codebuild_role_arn : String? = nil,
          @pipeline_provisioning_repository : Types::RepositoryBranchInput? = nil,
          @pipeline_service_role_arn : String? = nil
        )
        end
      end


      struct UpdateAccountSettingsOutput
        include JSON::Serializable

        # The Proton pipeline service role and repository data shared across the Amazon Web Services account.

        @[JSON::Field(key: "accountSettings")]
        getter account_settings : Types::AccountSettings

        def initialize(
          @account_settings : Types::AccountSettings
        )
        end
      end


      struct UpdateComponentInput
        include JSON::Serializable

        # The deployment type. It defines the mode for updating a component, as follows: NONE In this mode, a
        # deployment doesn't occur. Only the requested metadata parameters are updated. You can only specify
        # description in this mode. CURRENT_VERSION In this mode, the component is deployed and updated with
        # the new serviceSpec , templateSource , and/or type that you provide. Only requested parameters are
        # updated.

        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String

        # The name of the component to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The client token for the updated component.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional customer-provided description of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the service instance that you want to attach this component to. Don't specify to keep
        # the component's current service instance attachment. Specify an empty string to detach the component
        # from the service instance it's attached to. Specify non-empty values for both serviceInstanceName
        # and serviceName or for neither of them.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        # The name of the service that serviceInstanceName is associated with. Don't specify to keep the
        # component's current service instance attachment. Specify an empty string to detach the component
        # from the service instance it's attached to. Specify non-empty values for both serviceInstanceName
        # and serviceName or for neither of them.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The service spec that you want the component to use to access service inputs. Set this only when the
        # component is attached to a service instance.

        @[JSON::Field(key: "serviceSpec")]
        getter service_spec : String?

        # A path to the Infrastructure as Code (IaC) file describing infrastructure that a custom component
        # provisions. Components support a single IaC file, even if you use Terraform as your template
        # language.

        @[JSON::Field(key: "templateFile")]
        getter template_file : String?

        def initialize(
          @deployment_type : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @service_instance_name : String? = nil,
          @service_name : String? = nil,
          @service_spec : String? = nil,
          @template_file : String? = nil
        )
        end
      end


      struct UpdateComponentOutput
        include JSON::Serializable

        # The detailed data of the updated component.

        @[JSON::Field(key: "component")]
        getter component : Types::Component

        def initialize(
          @component : Types::Component
        )
        end
      end


      struct UpdateEnvironmentAccountConnectionInput
        include JSON::Serializable

        # The ID of the environment account connection to update.

        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of an IAM service role in the environment account. Proton uses this
        # role to provision infrastructure resources using CodeBuild-based provisioning in the associated
        # environment account.

        @[JSON::Field(key: "codebuildRoleArn")]
        getter codebuild_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in the associated environment account. It determines the scope of infrastructure
        # that a component can provision in the account. The environment account connection must have a
        # componentRoleArn to allow directly defined components to be associated with any environments running
        # in the account. For more information about components, see Proton components in the Proton User
        # Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that's associated with the environment
        # account connection to update.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @id : String,
          @codebuild_role_arn : String? = nil,
          @component_role_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateEnvironmentAccountConnectionOutput
        include JSON::Serializable

        # The environment account connection detail data that's returned by Proton.

        @[JSON::Field(key: "environmentAccountConnection")]
        getter environment_account_connection : Types::EnvironmentAccountConnection

        def initialize(
          @environment_account_connection : Types::EnvironmentAccountConnection
        )
        end
      end


      struct UpdateEnvironmentInput
        include JSON::Serializable

        # There are four modes for updating an environment. The deploymentType field defines the mode. NONE In
        # this mode, a deployment doesn't occur. Only the requested metadata parameters are updated.
        # CURRENT_VERSION In this mode, the environment is deployed and updated with the new spec that you
        # provide. Only requested parameters are updated. Don’t include major or minor version parameters when
        # you use this deployment-type . MINOR_VERSION In this mode, the environment is deployed and updated
        # with the published, recommended (latest) minor version of the current major version in use, by
        # default. You can also specify a different minor version of the current major version in use.
        # MAJOR_VERSION In this mode, the environment is deployed and updated with the published, recommended
        # (latest) major and minor version of the current template, by default. You can also specify a
        # different major version that is higher than the major version in use and a minor version (optional).

        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String

        # The name of the environment to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM service role that allows Proton to provision
        # infrastructure using CodeBuild-based provisioning on your behalf.

        @[JSON::Field(key: "codebuildRoleArn")]
        getter codebuild_role_arn : String?

        # The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly
        # defined components in this environment. It determines the scope of infrastructure that a component
        # can provision. The environment must have a componentRoleArn to allow directly defined components to
        # be associated with the environment. For more information about components, see Proton components in
        # the Proton User Guide .

        @[JSON::Field(key: "componentRoleArn")]
        getter component_role_arn : String?

        # A description of the environment update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment account connection. You can only update to a new environment account
        # connection if it was created in the same environment account that the current environment account
        # connection was created in and is associated with the current environment.

        @[JSON::Field(key: "environmentAccountConnectionId")]
        getter environment_account_connection_id : String?

        # The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make API calls to
        # other services your behalf.

        @[JSON::Field(key: "protonServiceRoleArn")]
        getter proton_service_role_arn : String?

        # The linked repository that you use to host your rendered infrastructure templates for self-managed
        # provisioning. A linked repository is a repository that has been registered with Proton. For more
        # information, see CreateRepository .

        @[JSON::Field(key: "provisioningRepository")]
        getter provisioning_repository : Types::RepositoryBranchInput?

        # The formatted specification that defines the update.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        # The major version of the environment to update.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String?

        # The minor version of the environment to update.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String?

        def initialize(
          @deployment_type : String,
          @name : String,
          @codebuild_role_arn : String? = nil,
          @component_role_arn : String? = nil,
          @description : String? = nil,
          @environment_account_connection_id : String? = nil,
          @proton_service_role_arn : String? = nil,
          @provisioning_repository : Types::RepositoryBranchInput? = nil,
          @spec : String? = nil,
          @template_major_version : String? = nil,
          @template_minor_version : String? = nil
        )
        end
      end


      struct UpdateEnvironmentOutput
        include JSON::Serializable

        # The environment detail data that's returned by Proton.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment

        def initialize(
          @environment : Types::Environment
        )
        end
      end


      struct UpdateEnvironmentTemplateInput
        include JSON::Serializable

        # The name of the environment template to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the environment template update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the environment template to update as displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end


      struct UpdateEnvironmentTemplateOutput
        include JSON::Serializable

        # The environment template detail data that's returned by Proton.

        @[JSON::Field(key: "environmentTemplate")]
        getter environment_template : Types::EnvironmentTemplate

        def initialize(
          @environment_template : Types::EnvironmentTemplate
        )
        end
      end


      struct UpdateEnvironmentTemplateVersionInput
        include JSON::Serializable

        # To update a major version of an environment template, include major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # To update a minor version of an environment template, include minorVersion .

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The name of the environment template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # A description of environment template version to update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of the environment template minor version to update.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @major_version : String,
          @minor_version : String,
          @template_name : String,
          @description : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateEnvironmentTemplateVersionOutput
        include JSON::Serializable

        # The environment template version detail data that's returned by Proton.

        @[JSON::Field(key: "environmentTemplateVersion")]
        getter environment_template_version : Types::EnvironmentTemplateVersion

        def initialize(
          @environment_template_version : Types::EnvironmentTemplateVersion
        )
        end
      end


      struct UpdateServiceInput
        include JSON::Serializable

        # The name of the service to edit.

        @[JSON::Field(key: "name")]
        getter name : String

        # The edited service description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Lists the service instances to add and the existing service instances to remain. Omit the existing
        # service instances to delete from the list. Don't include edits to the existing service instances or
        # pipeline. For more information, see Edit a service in the Proton User Guide .

        @[JSON::Field(key: "spec")]
        getter spec : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @spec : String? = nil
        )
        end
      end


      struct UpdateServiceInstanceInput
        include JSON::Serializable

        # The deployment type. It defines the mode for updating a service instance, as follows: NONE In this
        # mode, a deployment doesn't occur. Only the requested metadata parameters are updated.
        # CURRENT_VERSION In this mode, the service instance is deployed and updated with the new spec that
        # you provide. Only requested parameters are updated. Don’t include major or minor version parameters
        # when you use this deployment type. MINOR_VERSION In this mode, the service instance is deployed and
        # updated with the published, recommended (latest) minor version of the current major version in use,
        # by default. You can also specify a different minor version of the current major version in use.
        # MAJOR_VERSION In this mode, the service instance is deployed and updated with the published,
        # recommended (latest) major and minor version of the current template, by default. You can specify a
        # different major version that's higher than the major version in use and a minor version.

        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String

        # The name of the service instance to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the service that the service instance belongs to.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The client token of the service instance to update.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The formatted specification that defines the service instance update.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        # The major version of the service template to update.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String?

        # The minor version of the service template to update.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String?

        def initialize(
          @deployment_type : String,
          @name : String,
          @service_name : String,
          @client_token : String? = nil,
          @spec : String? = nil,
          @template_major_version : String? = nil,
          @template_minor_version : String? = nil
        )
        end
      end


      struct UpdateServiceInstanceOutput
        include JSON::Serializable

        # The service instance summary data that's returned by Proton.

        @[JSON::Field(key: "serviceInstance")]
        getter service_instance : Types::ServiceInstance

        def initialize(
          @service_instance : Types::ServiceInstance
        )
        end
      end


      struct UpdateServiceOutput
        include JSON::Serializable

        # The service detail data that's returned by Proton.

        @[JSON::Field(key: "service")]
        getter service : Types::Service

        def initialize(
          @service : Types::Service
        )
        end
      end


      struct UpdateServicePipelineInput
        include JSON::Serializable

        # The deployment type. There are four modes for updating a service pipeline. The deploymentType field
        # defines the mode. NONE In this mode, a deployment doesn't occur. Only the requested metadata
        # parameters are updated. CURRENT_VERSION In this mode, the service pipeline is deployed and updated
        # with the new spec that you provide. Only requested parameters are updated. Don’t include major or
        # minor version parameters when you use this deployment-type . MINOR_VERSION In this mode, the service
        # pipeline is deployed and updated with the published, recommended (latest) minor version of the
        # current major version in use, by default. You can specify a different minor version of the current
        # major version in use. MAJOR_VERSION In this mode, the service pipeline is deployed and updated with
        # the published, recommended (latest) major and minor version of the current template, by default. You
        # can specify a different major version that's higher than the major version in use and a minor
        # version.

        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String

        # The name of the service to that the pipeline is associated with.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The spec for the service pipeline to update.

        @[JSON::Field(key: "spec")]
        getter spec : String

        # The major version of the service template that was used to create the service that the pipeline is
        # associated with.

        @[JSON::Field(key: "templateMajorVersion")]
        getter template_major_version : String?

        # The minor version of the service template that was used to create the service that the pipeline is
        # associated with.

        @[JSON::Field(key: "templateMinorVersion")]
        getter template_minor_version : String?

        def initialize(
          @deployment_type : String,
          @service_name : String,
          @spec : String,
          @template_major_version : String? = nil,
          @template_minor_version : String? = nil
        )
        end
      end


      struct UpdateServicePipelineOutput
        include JSON::Serializable

        # The pipeline details that are returned by Proton.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::ServicePipeline

        def initialize(
          @pipeline : Types::ServicePipeline
        )
        end
      end


      struct UpdateServiceSyncBlockerInput
        include JSON::Serializable

        # The ID of the service sync blocker.

        @[JSON::Field(key: "id")]
        getter id : String

        # The reason the service sync blocker was resolved.

        @[JSON::Field(key: "resolvedReason")]
        getter resolved_reason : String

        def initialize(
          @id : String,
          @resolved_reason : String
        )
        end
      end


      struct UpdateServiceSyncBlockerOutput
        include JSON::Serializable

        # The name of the service that you want to update the service sync blocker for.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The detailed data on the service sync blocker that was updated.

        @[JSON::Field(key: "serviceSyncBlocker")]
        getter service_sync_blocker : Types::SyncBlocker

        # The name of the service instance that you want to update the service sync blocker for.

        @[JSON::Field(key: "serviceInstanceName")]
        getter service_instance_name : String?

        def initialize(
          @service_name : String,
          @service_sync_blocker : Types::SyncBlocker,
          @service_instance_name : String? = nil
        )
        end
      end


      struct UpdateServiceSyncConfigInput
        include JSON::Serializable

        # The name of the code repository branch where the Proton Ops file is found.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The path to the Proton Ops file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The name of the repository where the Proton Ops file is found.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The name of the repository provider where the Proton Ops file is found.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The name of the service the Proton Ops file is for.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @branch : String,
          @file_path : String,
          @repository_name : String,
          @repository_provider : String,
          @service_name : String
        )
        end
      end


      struct UpdateServiceSyncConfigOutput
        include JSON::Serializable

        # The detailed data of the Proton Ops file.

        @[JSON::Field(key: "serviceSyncConfig")]
        getter service_sync_config : Types::ServiceSyncConfig?

        def initialize(
          @service_sync_config : Types::ServiceSyncConfig? = nil
        )
        end
      end


      struct UpdateServiceTemplateInput
        include JSON::Serializable

        # The name of the service template to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the service template update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the service template to update that's displayed in the developer interface.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end


      struct UpdateServiceTemplateOutput
        include JSON::Serializable

        # The service template detail data that's returned by Proton.

        @[JSON::Field(key: "serviceTemplate")]
        getter service_template : Types::ServiceTemplate

        def initialize(
          @service_template : Types::ServiceTemplate
        )
        end
      end


      struct UpdateServiceTemplateVersionInput
        include JSON::Serializable

        # To update a major version of a service template, include major Version .

        @[JSON::Field(key: "majorVersion")]
        getter major_version : String

        # To update a minor version of a service template, include minorVersion .

        @[JSON::Field(key: "minorVersion")]
        getter minor_version : String

        # The name of the service template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # An array of environment template objects that are compatible with this service template version. A
        # service instance based on this service template version can run in environments based on compatible
        # templates.

        @[JSON::Field(key: "compatibleEnvironmentTemplates")]
        getter compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplateInput)?

        # A description of a service template version to update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of the service template minor version to update.

        @[JSON::Field(key: "status")]
        getter status : String?

        # An array of supported component sources. Components with supported sources can be attached to
        # service instances based on this service template version. A change to supportedComponentSources
        # doesn't impact existing component attachments to instances based on this template version. A change
        # only affects later associations. For more information about components, see Proton components in the
        # Proton User Guide .

        @[JSON::Field(key: "supportedComponentSources")]
        getter supported_component_sources : Array(String)?

        def initialize(
          @major_version : String,
          @minor_version : String,
          @template_name : String,
          @compatible_environment_templates : Array(Types::CompatibleEnvironmentTemplateInput)? = nil,
          @description : String? = nil,
          @status : String? = nil,
          @supported_component_sources : Array(String)? = nil
        )
        end
      end


      struct UpdateServiceTemplateVersionOutput
        include JSON::Serializable

        # The service template version detail data that's returned by Proton.

        @[JSON::Field(key: "serviceTemplateVersion")]
        getter service_template_version : Types::ServiceTemplateVersion

        def initialize(
          @service_template_version : Types::ServiceTemplateVersion
        )
        end
      end


      struct UpdateTemplateSyncConfigInput
        include JSON::Serializable

        # The repository branch for your template.

        @[JSON::Field(key: "branch")]
        getter branch : String

        # The repository name (for example, myrepos/myrepo ).

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The repository provider.

        @[JSON::Field(key: "repositoryProvider")]
        getter repository_provider : String

        # The synced template name.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The synced template type.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # A subdirectory path to your template bundle version. When included, limits the template bundle
        # search to this repository directory.

        @[JSON::Field(key: "subdirectory")]
        getter subdirectory : String?

        def initialize(
          @branch : String,
          @repository_name : String,
          @repository_provider : String,
          @template_name : String,
          @template_type : String,
          @subdirectory : String? = nil
        )
        end
      end


      struct UpdateTemplateSyncConfigOutput
        include JSON::Serializable

        # The template sync configuration detail data that's returned by Proton.

        @[JSON::Field(key: "templateSyncConfig")]
        getter template_sync_config : Types::TemplateSyncConfig?

        def initialize(
          @template_sync_config : Types::TemplateSyncConfig? = nil
        )
        end
      end

      # The input is invalid or an out-of-range value was supplied for the input parameter.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
