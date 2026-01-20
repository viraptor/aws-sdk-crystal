module AwsSdk
  module Imagebuilder
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

      # CancelImageCreation cancels the creation of Image. This operation can only be used on images in a
      # non-terminal state.

      def cancel_image_creation(
        client_token : String,
        image_build_version_arn : String
      ) : Protocol::Request
        input = Types::CancelImageCreationRequest.new(client_token: client_token, image_build_version_arn: image_build_version_arn)
        cancel_image_creation(input)
      end

      def cancel_image_creation(input : Types::CancelImageCreationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_IMAGE_CREATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancel a specific image lifecycle policy runtime instance.

      def cancel_lifecycle_execution(
        client_token : String,
        lifecycle_execution_id : String
      ) : Protocol::Request
        input = Types::CancelLifecycleExecutionRequest.new(client_token: client_token, lifecycle_execution_id: lifecycle_execution_id)
        cancel_lifecycle_execution(input)
      end

      def cancel_lifecycle_execution(input : Types::CancelLifecycleExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_LIFECYCLE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new component that can be used to build, validate, test, and assess your image. The
      # component is based on a YAML document that you specify using exactly one of the following methods:
      # Inline, using the data property in the request body. A URL that points to a YAML document file
      # stored in Amazon S3, using the uri property in the request body.

      def create_component(
        client_token : String,
        name : String,
        platform : String,
        semantic_version : String,
        change_description : String? = nil,
        data : String? = nil,
        description : String? = nil,
        dry_run : Bool? = nil,
        kms_key_id : String? = nil,
        supported_os_versions : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        uri : String? = nil
      ) : Protocol::Request
        input = Types::CreateComponentRequest.new(client_token: client_token, name: name, platform: platform, semantic_version: semantic_version, change_description: change_description, data: data, description: description, dry_run: dry_run, kms_key_id: kms_key_id, supported_os_versions: supported_os_versions, tags: tags, uri: uri)
        create_component(input)
      end

      def create_component(input : Types::CreateComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new container recipe. Container recipes define how images are configured, tested, and
      # assessed.

      def create_container_recipe(
        client_token : String,
        container_type : String,
        name : String,
        parent_image : String,
        semantic_version : String,
        target_repository : Types::TargetContainerRepository,
        components : Array(Types::ComponentConfiguration)? = nil,
        description : String? = nil,
        dockerfile_template_data : String? = nil,
        dockerfile_template_uri : String? = nil,
        image_os_version_override : String? = nil,
        instance_configuration : Types::InstanceConfiguration? = nil,
        kms_key_id : String? = nil,
        platform_override : String? = nil,
        tags : Hash(String, String)? = nil,
        working_directory : String? = nil
      ) : Protocol::Request
        input = Types::CreateContainerRecipeRequest.new(client_token: client_token, container_type: container_type, name: name, parent_image: parent_image, semantic_version: semantic_version, target_repository: target_repository, components: components, description: description, dockerfile_template_data: dockerfile_template_data, dockerfile_template_uri: dockerfile_template_uri, image_os_version_override: image_os_version_override, instance_configuration: instance_configuration, kms_key_id: kms_key_id, platform_override: platform_override, tags: tags, working_directory: working_directory)
        create_container_recipe(input)
      end

      def create_container_recipe(input : Types::CreateContainerRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTAINER_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new distribution configuration. Distribution configurations define and configure the
      # outputs of your pipeline.

      def create_distribution_configuration(
        client_token : String,
        distributions : Array(Types::Distribution),
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDistributionConfigurationRequest.new(client_token: client_token, distributions: distributions, name: name, description: description, tags: tags)
        create_distribution_configuration(input)
      end

      def create_distribution_configuration(input : Types::CreateDistributionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DISTRIBUTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new image. This request will create a new image along with all of the configured output
      # resources defined in the distribution configuration. You must specify exactly one recipe for your
      # image, using either a ContainerRecipeArn or an ImageRecipeArn.

      def create_image(
        client_token : String,
        infrastructure_configuration_arn : String,
        container_recipe_arn : String? = nil,
        distribution_configuration_arn : String? = nil,
        enhanced_image_metadata_enabled : Bool? = nil,
        execution_role : String? = nil,
        image_recipe_arn : String? = nil,
        image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
        image_tests_configuration : Types::ImageTestsConfiguration? = nil,
        logging_configuration : Types::ImageLoggingConfiguration? = nil,
        tags : Hash(String, String)? = nil,
        workflows : Array(Types::WorkflowConfiguration)? = nil
      ) : Protocol::Request
        input = Types::CreateImageRequest.new(client_token: client_token, infrastructure_configuration_arn: infrastructure_configuration_arn, container_recipe_arn: container_recipe_arn, distribution_configuration_arn: distribution_configuration_arn, enhanced_image_metadata_enabled: enhanced_image_metadata_enabled, execution_role: execution_role, image_recipe_arn: image_recipe_arn, image_scanning_configuration: image_scanning_configuration, image_tests_configuration: image_tests_configuration, logging_configuration: logging_configuration, tags: tags, workflows: workflows)
        create_image(input)
      end

      def create_image(input : Types::CreateImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new image pipeline. Image pipelines enable you to automate the creation and distribution
      # of images.

      def create_image_pipeline(
        client_token : String,
        infrastructure_configuration_arn : String,
        name : String,
        container_recipe_arn : String? = nil,
        description : String? = nil,
        distribution_configuration_arn : String? = nil,
        enhanced_image_metadata_enabled : Bool? = nil,
        execution_role : String? = nil,
        image_recipe_arn : String? = nil,
        image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
        image_tests_configuration : Types::ImageTestsConfiguration? = nil,
        logging_configuration : Types::PipelineLoggingConfiguration? = nil,
        schedule : Types::Schedule? = nil,
        status : String? = nil,
        tags : Hash(String, String)? = nil,
        workflows : Array(Types::WorkflowConfiguration)? = nil
      ) : Protocol::Request
        input = Types::CreateImagePipelineRequest.new(client_token: client_token, infrastructure_configuration_arn: infrastructure_configuration_arn, name: name, container_recipe_arn: container_recipe_arn, description: description, distribution_configuration_arn: distribution_configuration_arn, enhanced_image_metadata_enabled: enhanced_image_metadata_enabled, execution_role: execution_role, image_recipe_arn: image_recipe_arn, image_scanning_configuration: image_scanning_configuration, image_tests_configuration: image_tests_configuration, logging_configuration: logging_configuration, schedule: schedule, status: status, tags: tags, workflows: workflows)
        create_image_pipeline(input)
      end

      def create_image_pipeline(input : Types::CreateImagePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IMAGE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new image recipe. Image recipes define how images are configured, tested, and assessed.

      def create_image_recipe(
        client_token : String,
        name : String,
        parent_image : String,
        semantic_version : String,
        additional_instance_configuration : Types::AdditionalInstanceConfiguration? = nil,
        ami_tags : Hash(String, String)? = nil,
        block_device_mappings : Array(Types::InstanceBlockDeviceMapping)? = nil,
        components : Array(Types::ComponentConfiguration)? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil,
        working_directory : String? = nil
      ) : Protocol::Request
        input = Types::CreateImageRecipeRequest.new(client_token: client_token, name: name, parent_image: parent_image, semantic_version: semantic_version, additional_instance_configuration: additional_instance_configuration, ami_tags: ami_tags, block_device_mappings: block_device_mappings, components: components, description: description, tags: tags, working_directory: working_directory)
        create_image_recipe(input)
      end

      def create_image_recipe(input : Types::CreateImageRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IMAGE_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new infrastructure configuration. An infrastructure configuration defines the environment
      # in which your image will be built and tested.

      def create_infrastructure_configuration(
        client_token : String,
        instance_profile_name : String,
        name : String,
        description : String? = nil,
        instance_metadata_options : Types::InstanceMetadataOptions? = nil,
        instance_types : Array(String)? = nil,
        key_pair : String? = nil,
        logging : Types::Logging? = nil,
        placement : Types::Placement? = nil,
        resource_tags : Hash(String, String)? = nil,
        security_group_ids : Array(String)? = nil,
        sns_topic_arn : String? = nil,
        subnet_id : String? = nil,
        tags : Hash(String, String)? = nil,
        terminate_instance_on_failure : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateInfrastructureConfigurationRequest.new(client_token: client_token, instance_profile_name: instance_profile_name, name: name, description: description, instance_metadata_options: instance_metadata_options, instance_types: instance_types, key_pair: key_pair, logging: logging, placement: placement, resource_tags: resource_tags, security_group_ids: security_group_ids, sns_topic_arn: sns_topic_arn, subnet_id: subnet_id, tags: tags, terminate_instance_on_failure: terminate_instance_on_failure)
        create_infrastructure_configuration(input)
      end

      def create_infrastructure_configuration(input : Types::CreateInfrastructureConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INFRASTRUCTURE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a lifecycle policy resource.

      def create_lifecycle_policy(
        client_token : String,
        execution_role : String,
        name : String,
        policy_details : Array(Types::LifecyclePolicyDetail),
        resource_selection : Types::LifecyclePolicyResourceSelection,
        resource_type : String,
        description : String? = nil,
        status : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLifecyclePolicyRequest.new(client_token: client_token, execution_role: execution_role, name: name, policy_details: policy_details, resource_selection: resource_selection, resource_type: resource_type, description: description, status: status, tags: tags)
        create_lifecycle_policy(input)
      end

      def create_lifecycle_policy(input : Types::CreateLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new workflow or a new version of an existing workflow.

      def create_workflow(
        client_token : String,
        name : String,
        semantic_version : String,
        type : String,
        change_description : String? = nil,
        data : String? = nil,
        description : String? = nil,
        dry_run : Bool? = nil,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil,
        uri : String? = nil
      ) : Protocol::Request
        input = Types::CreateWorkflowRequest.new(client_token: client_token, name: name, semantic_version: semantic_version, type: type, change_description: change_description, data: data, description: description, dry_run: dry_run, kms_key_id: kms_key_id, tags: tags, uri: uri)
        create_workflow(input)
      end

      def create_workflow(input : Types::CreateWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a component build version.

      def delete_component(
        component_build_version_arn : String
      ) : Protocol::Request
        input = Types::DeleteComponentRequest.new(component_build_version_arn: component_build_version_arn)
        delete_component(input)
      end

      def delete_component(input : Types::DeleteComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a container recipe.

      def delete_container_recipe(
        container_recipe_arn : String
      ) : Protocol::Request
        input = Types::DeleteContainerRecipeRequest.new(container_recipe_arn: container_recipe_arn)
        delete_container_recipe(input)
      end

      def delete_container_recipe(input : Types::DeleteContainerRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTAINER_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a distribution configuration.

      def delete_distribution_configuration(
        distribution_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteDistributionConfigurationRequest.new(distribution_configuration_arn: distribution_configuration_arn)
        delete_distribution_configuration(input)
      end

      def delete_distribution_configuration(input : Types::DeleteDistributionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DISTRIBUTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Image Builder image resource. This does not delete any EC2 AMIs or ECR container images
      # that are created during the image build process. You must clean those up separately, using the
      # appropriate Amazon EC2 or Amazon ECR console actions, or API or CLI commands. To deregister an EC2
      # Linux AMI, see Deregister your Linux AMI in the Amazon EC2 User Guide . To deregister an EC2 Windows
      # AMI, see Deregister your Windows AMI in the Amazon EC2 Windows Guide . To delete a container image
      # from Amazon ECR, see Deleting an image in the Amazon ECR User Guide .

      def delete_image(
        image_build_version_arn : String
      ) : Protocol::Request
        input = Types::DeleteImageRequest.new(image_build_version_arn: image_build_version_arn)
        delete_image(input)
      end

      def delete_image(input : Types::DeleteImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an image pipeline.

      def delete_image_pipeline(
        image_pipeline_arn : String
      ) : Protocol::Request
        input = Types::DeleteImagePipelineRequest.new(image_pipeline_arn: image_pipeline_arn)
        delete_image_pipeline(input)
      end

      def delete_image_pipeline(input : Types::DeleteImagePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IMAGE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an image recipe.

      def delete_image_recipe(
        image_recipe_arn : String
      ) : Protocol::Request
        input = Types::DeleteImageRecipeRequest.new(image_recipe_arn: image_recipe_arn)
        delete_image_recipe(input)
      end

      def delete_image_recipe(input : Types::DeleteImageRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IMAGE_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an infrastructure configuration.

      def delete_infrastructure_configuration(
        infrastructure_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteInfrastructureConfigurationRequest.new(infrastructure_configuration_arn: infrastructure_configuration_arn)
        delete_infrastructure_configuration(input)
      end

      def delete_infrastructure_configuration(input : Types::DeleteInfrastructureConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INFRASTRUCTURE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the specified lifecycle policy resource.

      def delete_lifecycle_policy(
        lifecycle_policy_arn : String
      ) : Protocol::Request
        input = Types::DeleteLifecyclePolicyRequest.new(lifecycle_policy_arn: lifecycle_policy_arn)
        delete_lifecycle_policy(input)
      end

      def delete_lifecycle_policy(input : Types::DeleteLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific workflow resource.

      def delete_workflow(
        workflow_build_version_arn : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowRequest.new(workflow_build_version_arn: workflow_build_version_arn)
        delete_workflow(input)
      end

      def delete_workflow(input : Types::DeleteWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # DistributeImage distributes existing AMIs to additional regions and accounts without rebuilding the
      # image.

      def distribute_image(
        client_token : String,
        distribution_configuration_arn : String,
        execution_role : String,
        source_image : String,
        logging_configuration : Types::ImageLoggingConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::DistributeImageRequest.new(client_token: client_token, distribution_configuration_arn: distribution_configuration_arn, execution_role: execution_role, source_image: source_image, logging_configuration: logging_configuration, tags: tags)
        distribute_image(input)
      end

      def distribute_image(input : Types::DistributeImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISTRIBUTE_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a component object.

      def get_component(
        component_build_version_arn : String
      ) : Protocol::Request
        input = Types::GetComponentRequest.new(component_build_version_arn: component_build_version_arn)
        get_component(input)
      end

      def get_component(input : Types::GetComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a component policy.

      def get_component_policy(
        component_arn : String
      ) : Protocol::Request
        input = Types::GetComponentPolicyRequest.new(component_arn: component_arn)
        get_component_policy(input)
      end

      def get_component_policy(input : Types::GetComponentPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPONENT_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a container recipe.

      def get_container_recipe(
        container_recipe_arn : String
      ) : Protocol::Request
        input = Types::GetContainerRecipeRequest.new(container_recipe_arn: container_recipe_arn)
        get_container_recipe(input)
      end

      def get_container_recipe(input : Types::GetContainerRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTAINER_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the policy for a container recipe.

      def get_container_recipe_policy(
        container_recipe_arn : String
      ) : Protocol::Request
        input = Types::GetContainerRecipePolicyRequest.new(container_recipe_arn: container_recipe_arn)
        get_container_recipe_policy(input)
      end

      def get_container_recipe_policy(input : Types::GetContainerRecipePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTAINER_RECIPE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a distribution configuration.

      def get_distribution_configuration(
        distribution_configuration_arn : String
      ) : Protocol::Request
        input = Types::GetDistributionConfigurationRequest.new(distribution_configuration_arn: distribution_configuration_arn)
        get_distribution_configuration(input)
      end

      def get_distribution_configuration(input : Types::GetDistributionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DISTRIBUTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an image.

      def get_image(
        image_build_version_arn : String
      ) : Protocol::Request
        input = Types::GetImageRequest.new(image_build_version_arn: image_build_version_arn)
        get_image(input)
      end

      def get_image(input : Types::GetImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an image pipeline.

      def get_image_pipeline(
        image_pipeline_arn : String
      ) : Protocol::Request
        input = Types::GetImagePipelineRequest.new(image_pipeline_arn: image_pipeline_arn)
        get_image_pipeline(input)
      end

      def get_image_pipeline(input : Types::GetImagePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an image policy.

      def get_image_policy(
        image_arn : String
      ) : Protocol::Request
        input = Types::GetImagePolicyRequest.new(image_arn: image_arn)
        get_image_policy(input)
      end

      def get_image_policy(input : Types::GetImagePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an image recipe.

      def get_image_recipe(
        image_recipe_arn : String
      ) : Protocol::Request
        input = Types::GetImageRecipeRequest.new(image_recipe_arn: image_recipe_arn)
        get_image_recipe(input)
      end

      def get_image_recipe(input : Types::GetImageRecipeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE_RECIPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an image recipe policy.

      def get_image_recipe_policy(
        image_recipe_arn : String
      ) : Protocol::Request
        input = Types::GetImageRecipePolicyRequest.new(image_recipe_arn: image_recipe_arn)
        get_image_recipe_policy(input)
      end

      def get_image_recipe_policy(input : Types::GetImageRecipePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE_RECIPE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an infrastructure configuration.

      def get_infrastructure_configuration(
        infrastructure_configuration_arn : String
      ) : Protocol::Request
        input = Types::GetInfrastructureConfigurationRequest.new(infrastructure_configuration_arn: infrastructure_configuration_arn)
        get_infrastructure_configuration(input)
      end

      def get_infrastructure_configuration(input : Types::GetInfrastructureConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INFRASTRUCTURE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the runtime information that was logged for a specific runtime instance of the lifecycle policy.

      def get_lifecycle_execution(
        lifecycle_execution_id : String
      ) : Protocol::Request
        input = Types::GetLifecycleExecutionRequest.new(lifecycle_execution_id: lifecycle_execution_id)
        get_lifecycle_execution(input)
      end

      def get_lifecycle_execution(input : Types::GetLifecycleExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LIFECYCLE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details for the specified image lifecycle policy.

      def get_lifecycle_policy(
        lifecycle_policy_arn : String
      ) : Protocol::Request
        input = Types::GetLifecyclePolicyRequest.new(lifecycle_policy_arn: lifecycle_policy_arn)
        get_lifecycle_policy(input)
      end

      def get_lifecycle_policy(input : Types::GetLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verify the subscription and perform resource dependency checks on the requested Amazon Web Services
      # Marketplace resource. For Amazon Web Services Marketplace components, the response contains fields
      # to download the components and their artifacts.

      def get_marketplace_resource(
        resource_arn : String,
        resource_type : String,
        resource_location : String? = nil
      ) : Protocol::Request
        input = Types::GetMarketplaceResourceRequest.new(resource_arn: resource_arn, resource_type: resource_type, resource_location: resource_location)
        get_marketplace_resource(input)
      end

      def get_marketplace_resource(input : Types::GetMarketplaceResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MARKETPLACE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a workflow resource object.

      def get_workflow(
        workflow_build_version_arn : String
      ) : Protocol::Request
        input = Types::GetWorkflowRequest.new(workflow_build_version_arn: workflow_build_version_arn)
        get_workflow(input)
      end

      def get_workflow(input : Types::GetWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the runtime information that was logged for a specific runtime instance of the workflow.

      def get_workflow_execution(
        workflow_execution_id : String
      ) : Protocol::Request
        input = Types::GetWorkflowExecutionRequest.new(workflow_execution_id: workflow_execution_id)
        get_workflow_execution(input)
      end

      def get_workflow_execution(input : Types::GetWorkflowExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the runtime information that was logged for a specific runtime instance of the workflow step.

      def get_workflow_step_execution(
        step_execution_id : String
      ) : Protocol::Request
        input = Types::GetWorkflowStepExecutionRequest.new(step_execution_id: step_execution_id)
        get_workflow_step_execution(input)
      end

      def get_workflow_step_execution(input : Types::GetWorkflowStepExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_STEP_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports a component and transforms its data into a component document.

      def import_component(
        client_token : String,
        format : String,
        name : String,
        platform : String,
        semantic_version : String,
        type : String,
        change_description : String? = nil,
        data : String? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil,
        uri : String? = nil
      ) : Protocol::Request
        input = Types::ImportComponentRequest.new(client_token: client_token, format: format, name: name, platform: platform, semantic_version: semantic_version, type: type, change_description: change_description, data: data, description: description, kms_key_id: kms_key_id, tags: tags, uri: uri)
        import_component(input)
      end

      def import_component(input : Types::ImportComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Import a Windows operating system image from a verified Microsoft ISO disk file. The following disk
      # images are supported: Windows 11 Enterprise

      def import_disk_image(
        client_token : String,
        infrastructure_configuration_arn : String,
        name : String,
        os_version : String,
        platform : String,
        semantic_version : String,
        uri : String,
        description : String? = nil,
        execution_role : String? = nil,
        logging_configuration : Types::ImageLoggingConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ImportDiskImageRequest.new(client_token: client_token, infrastructure_configuration_arn: infrastructure_configuration_arn, name: name, os_version: os_version, platform: platform, semantic_version: semantic_version, uri: uri, description: description, execution_role: execution_role, logging_configuration: logging_configuration, tags: tags)
        import_disk_image(input)
      end

      def import_disk_image(input : Types::ImportDiskImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_DISK_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you export your virtual machine (VM) from its virtualization environment, that process creates
      # a set of one or more disk container files that act as snapshots of your VM’s environment, settings,
      # and data. The Amazon EC2 API ImportImage action uses those files to import your VM and create an
      # AMI. To import using the CLI command, see import-image You can reference the task ID from the VM
      # import to pull in the AMI that the import created as the base image for your Image Builder recipe.

      def import_vm_image(
        client_token : String,
        name : String,
        platform : String,
        semantic_version : String,
        vm_import_task_id : String,
        description : String? = nil,
        logging_configuration : Types::ImageLoggingConfiguration? = nil,
        os_version : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ImportVmImageRequest.new(client_token: client_token, name: name, platform: platform, semantic_version: semantic_version, vm_import_task_id: vm_import_task_id, description: description, logging_configuration: logging_configuration, os_version: os_version, tags: tags)
        import_vm_image(input)
      end

      def import_vm_image(input : Types::ImportVmImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_VM_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of component build versions for the specified component version Amazon Resource
      # Name (ARN).

      def list_component_build_versions(
        component_version_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentBuildVersionsRequest.new(component_version_arn: component_version_arn, max_results: max_results, next_token: next_token)
        list_component_build_versions(input)
      end

      def list_component_build_versions(input : Types::ListComponentBuildVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENT_BUILD_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of components that can be filtered by name, or by using the listed filters to
      # streamline results. Newly created components can take up to two minutes to appear in the
      # ListComponents API Results. The semantic version has four nodes:
      # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
      # and can filter on all of them. Filtering: With semantic versioning, you have the flexibility to use
      # wildcards (x) to specify the most recent versions or nodes when selecting the base image or
      # components for your recipe. When you use a wildcard in any node, all nodes to the right of the first
      # wildcard must also be wildcards.

      def list_components(
        by_name : Bool? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentsRequest.new(by_name: by_name, filters: filters, max_results: max_results, next_token: next_token, owner: owner)
        list_components(input)
      end

      def list_components(input : Types::ListComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of container recipes.

      def list_container_recipes(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil
      ) : Protocol::Request
        input = Types::ListContainerRecipesRequest.new(filters: filters, max_results: max_results, next_token: next_token, owner: owner)
        list_container_recipes(input)
      end

      def list_container_recipes(input : Types::ListContainerRecipesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTAINER_RECIPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of distribution configurations.

      def list_distribution_configurations(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDistributionConfigurationsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_distribution_configurations(input)
      end

      def list_distribution_configurations(input : Types::ListDistributionConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DISTRIBUTION_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of image build versions.

      def list_image_build_versions(
        filters : Array(Types::Filter)? = nil,
        image_version_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImageBuildVersionsRequest.new(filters: filters, image_version_arn: image_version_arn, max_results: max_results, next_token: next_token)
        list_image_build_versions(input)
      end

      def list_image_build_versions(input : Types::ListImageBuildVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_BUILD_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the Packages that are associated with an Image Build Version, as determined by Amazon Web
      # Services Systems Manager Inventory at build time.

      def list_image_packages(
        image_build_version_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImagePackagesRequest.new(image_build_version_arn: image_build_version_arn, max_results: max_results, next_token: next_token)
        list_image_packages(input)
      end

      def list_image_packages(input : Types::ListImagePackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of images created by the specified pipeline.

      def list_image_pipeline_images(
        image_pipeline_arn : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImagePipelineImagesRequest.new(image_pipeline_arn: image_pipeline_arn, filters: filters, max_results: max_results, next_token: next_token)
        list_image_pipeline_images(input)
      end

      def list_image_pipeline_images(input : Types::ListImagePipelineImagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_PIPELINE_IMAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of image pipelines.

      def list_image_pipelines(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImagePipelinesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_image_pipelines(input)
      end

      def list_image_pipelines(input : Types::ListImagePipelinesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_PIPELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of image recipes.

      def list_image_recipes(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil
      ) : Protocol::Request
        input = Types::ListImageRecipesRequest.new(filters: filters, max_results: max_results, next_token: next_token, owner: owner)
        list_image_recipes(input)
      end

      def list_image_recipes(input : Types::ListImageRecipesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_RECIPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of image scan aggregations for your account. You can filter by the type of key that
      # Image Builder uses to group results. For example, if you want to get a list of findings by severity
      # level for one of your pipelines, you might specify your pipeline with the imagePipelineArn filter.
      # If you don't specify a filter, Image Builder returns an aggregation for your account. To streamline
      # results, you can use the following filters in your request: accountId imageBuildVersionArn
      # imagePipelineArn vulnerabilityId

      def list_image_scan_finding_aggregations(
        filter : Types::Filter? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImageScanFindingAggregationsRequest.new(filter: filter, next_token: next_token)
        list_image_scan_finding_aggregations(input)
      end

      def list_image_scan_finding_aggregations(input : Types::ListImageScanFindingAggregationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_SCAN_FINDING_AGGREGATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of image scan findings for your account.

      def list_image_scan_findings(
        filters : Array(Types::ImageScanFindingsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImageScanFindingsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_image_scan_findings(input)
      end

      def list_image_scan_findings(input : Types::ListImageScanFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_SCAN_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of images that you have access to. Newly created images can take up to two minutes
      # to appear in the ListImages API Results.

      def list_images(
        by_name : Bool? = nil,
        filters : Array(Types::Filter)? = nil,
        include_deprecated : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil
      ) : Protocol::Request
        input = Types::ListImagesRequest.new(by_name: by_name, filters: filters, include_deprecated: include_deprecated, max_results: max_results, next_token: next_token, owner: owner)
        list_images(input)
      end

      def list_images(input : Types::ListImagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of infrastructure configurations.

      def list_infrastructure_configurations(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInfrastructureConfigurationsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_infrastructure_configurations(input)
      end

      def list_infrastructure_configurations(input : Types::ListInfrastructureConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INFRASTRUCTURE_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List resources that the runtime instance of the image lifecycle identified for lifecycle actions.

      def list_lifecycle_execution_resources(
        lifecycle_execution_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        parent_resource_id : String? = nil
      ) : Protocol::Request
        input = Types::ListLifecycleExecutionResourcesRequest.new(lifecycle_execution_id: lifecycle_execution_id, max_results: max_results, next_token: next_token, parent_resource_id: parent_resource_id)
        list_lifecycle_execution_resources(input)
      end

      def list_lifecycle_execution_resources(input : Types::ListLifecycleExecutionResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LIFECYCLE_EXECUTION_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the lifecycle runtime history for the specified resource.

      def list_lifecycle_executions(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLifecycleExecutionsRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_lifecycle_executions(input)
      end

      def list_lifecycle_executions(input : Types::ListLifecycleExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LIFECYCLE_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a list of lifecycle policies in your Amazon Web Services account.

      def list_lifecycle_policies(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLifecyclePoliciesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_lifecycle_policies(input)
      end

      def list_lifecycle_policies(input : Types::ListLifecyclePoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LIFECYCLE_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of tags for the specified resource.

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

      # Get a list of workflow steps that are waiting for action for workflows in your Amazon Web Services
      # account.

      def list_waiting_workflow_steps(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWaitingWorkflowStepsRequest.new(max_results: max_results, next_token: next_token)
        list_waiting_workflow_steps(input)
      end

      def list_waiting_workflow_steps(input : Types::ListWaitingWorkflowStepsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WAITING_WORKFLOW_STEPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of build versions for a specific workflow resource.

      def list_workflow_build_versions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        workflow_version_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowBuildVersionsRequest.new(max_results: max_results, next_token: next_token, workflow_version_arn: workflow_version_arn)
        list_workflow_build_versions(input)
      end

      def list_workflow_build_versions(input : Types::ListWorkflowBuildVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_BUILD_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of workflow runtime instance metadata objects for a specific image build version.

      def list_workflow_executions(
        image_build_version_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowExecutionsRequest.new(image_build_version_arn: image_build_version_arn, max_results: max_results, next_token: next_token)
        list_workflow_executions(input)
      end

      def list_workflow_executions(input : Types::ListWorkflowExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns runtime data for each step in a runtime instance of the workflow that you specify in the
      # request.

      def list_workflow_step_executions(
        workflow_execution_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowStepExecutionsRequest.new(workflow_execution_id: workflow_execution_id, max_results: max_results, next_token: next_token)
        list_workflow_step_executions(input)
      end

      def list_workflow_step_executions(input : Types::ListWorkflowStepExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_STEP_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists workflow build versions based on filtering parameters.

      def list_workflows(
        by_name : Bool? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowsRequest.new(by_name: by_name, filters: filters, max_results: max_results, next_token: next_token, owner: owner)
        list_workflows(input)
      end

      def list_workflows(input : Types::ListWorkflowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies a policy to a component. We recommend that you call the RAM API CreateResourceShare to share
      # resources. If you call the Image Builder API PutComponentPolicy , you must also call the RAM API
      # PromoteResourceShareCreatedFromPolicy in order for the resource to be visible to all principals with
      # whom the resource is shared.

      def put_component_policy(
        component_arn : String,
        policy : String
      ) : Protocol::Request
        input = Types::PutComponentPolicyRequest.new(component_arn: component_arn, policy: policy)
        put_component_policy(input)
      end

      def put_component_policy(input : Types::PutComponentPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_COMPONENT_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies a policy to a container image. We recommend that you call the RAM API CreateResourceShare
      # (https://docs.aws.amazon.com//ram/latest/APIReference/API_CreateResourceShare.html) to share
      # resources. If you call the Image Builder API PutContainerImagePolicy , you must also call the RAM
      # API PromoteResourceShareCreatedFromPolicy
      # (https://docs.aws.amazon.com//ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html)
      # in order for the resource to be visible to all principals with whom the resource is shared.

      def put_container_recipe_policy(
        container_recipe_arn : String,
        policy : String
      ) : Protocol::Request
        input = Types::PutContainerRecipePolicyRequest.new(container_recipe_arn: container_recipe_arn, policy: policy)
        put_container_recipe_policy(input)
      end

      def put_container_recipe_policy(input : Types::PutContainerRecipePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONTAINER_RECIPE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies a policy to an image. We recommend that you call the RAM API CreateResourceShare to share
      # resources. If you call the Image Builder API PutImagePolicy , you must also call the RAM API
      # PromoteResourceShareCreatedFromPolicy in order for the resource to be visible to all principals with
      # whom the resource is shared.

      def put_image_policy(
        image_arn : String,
        policy : String
      ) : Protocol::Request
        input = Types::PutImagePolicyRequest.new(image_arn: image_arn, policy: policy)
        put_image_policy(input)
      end

      def put_image_policy(input : Types::PutImagePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_IMAGE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies a policy to an image recipe. We recommend that you call the RAM API CreateResourceShare to
      # share resources. If you call the Image Builder API PutImageRecipePolicy , you must also call the RAM
      # API PromoteResourceShareCreatedFromPolicy in order for the resource to be visible to all principals
      # with whom the resource is shared.

      def put_image_recipe_policy(
        image_recipe_arn : String,
        policy : String
      ) : Protocol::Request
        input = Types::PutImageRecipePolicyRequest.new(image_recipe_arn: image_recipe_arn, policy: policy)
        put_image_recipe_policy(input)
      end

      def put_image_recipe_policy(input : Types::PutImageRecipePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_IMAGE_RECIPE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # RetryImage retries an image distribution without rebuilding the image.

      def retry_image(
        client_token : String,
        image_build_version_arn : String
      ) : Protocol::Request
        input = Types::RetryImageRequest.new(client_token: client_token, image_build_version_arn: image_build_version_arn)
        retry_image(input)
      end

      def retry_image(input : Types::RetryImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRY_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Pauses or resumes image creation when the associated workflow runs a WaitForAction step.

      def send_workflow_step_action(
        action : String,
        client_token : String,
        image_build_version_arn : String,
        step_execution_id : String,
        reason : String? = nil
      ) : Protocol::Request
        input = Types::SendWorkflowStepActionRequest.new(action: action, client_token: client_token, image_build_version_arn: image_build_version_arn, step_execution_id: step_execution_id, reason: reason)
        send_workflow_step_action(input)
      end

      def send_workflow_step_action(input : Types::SendWorkflowStepActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_WORKFLOW_STEP_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Manually triggers a pipeline to create an image.

      def start_image_pipeline_execution(
        client_token : String,
        image_pipeline_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartImagePipelineExecutionRequest.new(client_token: client_token, image_pipeline_arn: image_pipeline_arn, tags: tags)
        start_image_pipeline_execution(input)
      end

      def start_image_pipeline_execution(input : Types::StartImagePipelineExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_IMAGE_PIPELINE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Begin asynchronous resource state update for lifecycle changes to the specified image resources.

      def start_resource_state_update(
        client_token : String,
        resource_arn : String,
        state : Types::ResourceState,
        exclusion_rules : Types::ResourceStateUpdateExclusionRules? = nil,
        execution_role : String? = nil,
        include_resources : Types::ResourceStateUpdateIncludeResources? = nil,
        update_at : Time? = nil
      ) : Protocol::Request
        input = Types::StartResourceStateUpdateRequest.new(client_token: client_token, resource_arn: resource_arn, state: state, exclusion_rules: exclusion_rules, execution_role: execution_role, include_resources: include_resources, update_at: update_at)
        start_resource_state_update(input)
      end

      def start_resource_state_update(input : Types::StartResourceStateUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RESOURCE_STATE_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to a resource.

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

      # Removes a tag from a resource.

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

      # Updates a new distribution configuration. Distribution configurations define and configure the
      # outputs of your pipeline.

      def update_distribution_configuration(
        client_token : String,
        distribution_configuration_arn : String,
        distributions : Array(Types::Distribution),
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDistributionConfigurationRequest.new(client_token: client_token, distribution_configuration_arn: distribution_configuration_arn, distributions: distributions, description: description)
        update_distribution_configuration(input)
      end

      def update_distribution_configuration(input : Types::UpdateDistributionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DISTRIBUTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an image pipeline. Image pipelines enable you to automate the creation and distribution of
      # images. You must specify exactly one recipe for your image, using either a containerRecipeArn or an
      # imageRecipeArn . UpdateImagePipeline does not support selective updates for the pipeline. You must
      # specify all of the required properties in the update request, not just the properties that have
      # changed.

      def update_image_pipeline(
        client_token : String,
        image_pipeline_arn : String,
        infrastructure_configuration_arn : String,
        container_recipe_arn : String? = nil,
        description : String? = nil,
        distribution_configuration_arn : String? = nil,
        enhanced_image_metadata_enabled : Bool? = nil,
        execution_role : String? = nil,
        image_recipe_arn : String? = nil,
        image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
        image_tests_configuration : Types::ImageTestsConfiguration? = nil,
        logging_configuration : Types::PipelineLoggingConfiguration? = nil,
        schedule : Types::Schedule? = nil,
        status : String? = nil,
        workflows : Array(Types::WorkflowConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateImagePipelineRequest.new(client_token: client_token, image_pipeline_arn: image_pipeline_arn, infrastructure_configuration_arn: infrastructure_configuration_arn, container_recipe_arn: container_recipe_arn, description: description, distribution_configuration_arn: distribution_configuration_arn, enhanced_image_metadata_enabled: enhanced_image_metadata_enabled, execution_role: execution_role, image_recipe_arn: image_recipe_arn, image_scanning_configuration: image_scanning_configuration, image_tests_configuration: image_tests_configuration, logging_configuration: logging_configuration, schedule: schedule, status: status, workflows: workflows)
        update_image_pipeline(input)
      end

      def update_image_pipeline(input : Types::UpdateImagePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IMAGE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a new infrastructure configuration. An infrastructure configuration defines the environment
      # in which your image will be built and tested.

      def update_infrastructure_configuration(
        client_token : String,
        infrastructure_configuration_arn : String,
        instance_profile_name : String,
        description : String? = nil,
        instance_metadata_options : Types::InstanceMetadataOptions? = nil,
        instance_types : Array(String)? = nil,
        key_pair : String? = nil,
        logging : Types::Logging? = nil,
        placement : Types::Placement? = nil,
        resource_tags : Hash(String, String)? = nil,
        security_group_ids : Array(String)? = nil,
        sns_topic_arn : String? = nil,
        subnet_id : String? = nil,
        terminate_instance_on_failure : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateInfrastructureConfigurationRequest.new(client_token: client_token, infrastructure_configuration_arn: infrastructure_configuration_arn, instance_profile_name: instance_profile_name, description: description, instance_metadata_options: instance_metadata_options, instance_types: instance_types, key_pair: key_pair, logging: logging, placement: placement, resource_tags: resource_tags, security_group_ids: security_group_ids, sns_topic_arn: sns_topic_arn, subnet_id: subnet_id, terminate_instance_on_failure: terminate_instance_on_failure)
        update_infrastructure_configuration(input)
      end

      def update_infrastructure_configuration(input : Types::UpdateInfrastructureConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INFRASTRUCTURE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the specified lifecycle policy.

      def update_lifecycle_policy(
        client_token : String,
        execution_role : String,
        lifecycle_policy_arn : String,
        policy_details : Array(Types::LifecyclePolicyDetail),
        resource_selection : Types::LifecyclePolicyResourceSelection,
        resource_type : String,
        description : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLifecyclePolicyRequest.new(client_token: client_token, execution_role: execution_role, lifecycle_policy_arn: lifecycle_policy_arn, policy_details: policy_details, resource_selection: resource_selection, resource_type: resource_type, description: description, status: status)
        update_lifecycle_policy(input)
      end

      def update_lifecycle_policy(input : Types::UpdateLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
