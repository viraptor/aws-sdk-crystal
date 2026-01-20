require "json"
require "time"

module AwsSdk
  module Imagebuilder
    module Types

      # You do not have permissions to perform the requested operation.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains counts of vulnerability findings from image scans that run when you create new Image
      # Builder images, or build new versions of existing images. The vulnerability counts are grouped by
      # severity level. The counts are aggregated across resources to create the final tally for the account
      # that owns them.

      struct AccountAggregation
        include JSON::Serializable

        # Identifies the account that owns the aggregated resource findings.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Counts by severity level for medium severity and higher level findings, plus a total for all of the
        # findings.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @account_id : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # In addition to your infrastructure configuration, these settings provide an extra layer of control
      # over your build instances. You can also specify commands to run on launch for all of your build
      # instances. Image Builder does not automatically install the Systems Manager agent on Windows
      # instances. If your base image includes the Systems Manager agent, then the AMI that you create will
      # also include the agent. For Linux instances, if the base image does not already include the Systems
      # Manager agent, Image Builder installs it. For Linux instances where Image Builder installs the
      # Systems Manager agent, you can choose whether to keep it for the AMI that you create.

      struct AdditionalInstanceConfiguration
        include JSON::Serializable

        # Contains settings for the Systems Manager agent on your build instance.

        @[JSON::Field(key: "systemsManagerAgent")]
        getter systems_manager_agent : Types::SystemsManagerAgent?

        # Use this property to provide commands or a command script to run when you launch your build
        # instance. The userDataOverride property replaces any commands that Image Builder might have added to
        # ensure that Systems Manager is installed on your Linux build instance. If you override the user
        # data, make sure that you add commands to install Systems Manager, if it is not pre-installed on your
        # base image. The user data is always base 64 encoded. For example, the following commands are encoded
        # as IyEvYmluL2Jhc2gKbWtkaXIgLXAgL3Zhci9iYi8KdG91Y2ggL3Zhci$ : #!/bin/bash mkdir -p /var/bb/ touch
        # /var

        @[JSON::Field(key: "userDataOverride")]
        getter user_data_override : String?

        def initialize(
          @systems_manager_agent : Types::SystemsManagerAgent? = nil,
          @user_data_override : String? = nil
        )
        end
      end

      # Details of an Amazon EC2 AMI.

      struct Ami
        include JSON::Serializable

        # The account ID of the owner of the AMI.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The description of the Amazon EC2 AMI. Minimum and maximum length are in characters.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The AMI ID of the Amazon EC2 AMI.

        @[JSON::Field(key: "image")]
        getter image : String?

        # The name of the Amazon EC2 AMI.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Web Services Region of the Amazon EC2 AMI.

        @[JSON::Field(key: "region")]
        getter region : String?


        @[JSON::Field(key: "state")]
        getter state : Types::ImageState?

        def initialize(
          @account_id : String? = nil,
          @description : String? = nil,
          @image : String? = nil,
          @name : String? = nil,
          @region : String? = nil,
          @state : Types::ImageState? = nil
        )
        end
      end

      # Define and configure the output AMIs of the pipeline.

      struct AmiDistributionConfiguration
        include JSON::Serializable

        # The tags to apply to AMIs distributed to this Region.

        @[JSON::Field(key: "amiTags")]
        getter ami_tags : Hash(String, String)?

        # The description of the AMI distribution configuration. Minimum and maximum length are in characters.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) that uniquely identifies the KMS key used to encrypt the distributed
        # image. This can be either the Key ARN or the Alias ARN. For more information, see Key identifiers
        # (KeyId) in the Key Management Service Developer Guide .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # Launch permissions can be used to configure which Amazon Web Services accounts can use the AMI to
        # launch instances.

        @[JSON::Field(key: "launchPermission")]
        getter launch_permission : Types::LaunchPermissionConfiguration?

        # The name of the output AMI.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of an account to which you want to distribute an image.

        @[JSON::Field(key: "targetAccountIds")]
        getter target_account_ids : Array(String)?

        def initialize(
          @ami_tags : Hash(String, String)? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @launch_permission : Types::LaunchPermissionConfiguration? = nil,
          @name : String? = nil,
          @target_account_ids : Array(String)? = nil
        )
        end
      end

      # Defines the rules by which an image pipeline is automatically disabled when it fails.

      struct AutoDisablePolicy
        include JSON::Serializable

        # The number of consecutive scheduled image pipeline executions that must fail before Image Builder
        # automatically disables the pipeline.

        @[JSON::Field(key: "failureCount")]
        getter failure_count : Int32

        def initialize(
          @failure_count : Int32
        )
        end
      end

      # You have exceeded the permitted request rate for the specific operation.

      struct CallRateLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CancelImageCreationRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the image that you want to cancel creation for.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String

        def initialize(
          @client_token : String,
          @image_build_version_arn : String
        )
        end
      end


      struct CancelImageCreationResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image whose creation this request canceled.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_build_version_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CancelLifecycleExecutionRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # Identifies the specific runtime instance of the image lifecycle to cancel.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String

        def initialize(
          @client_token : String,
          @lifecycle_execution_id : String
        )
        end
      end


      struct CancelLifecycleExecutionResponse
        include JSON::Serializable

        # The unique identifier for the image lifecycle runtime instance that was canceled.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String?

        def initialize(
          @lifecycle_execution_id : String? = nil
        )
        end
      end

      # These errors are usually caused by a client action, such as using an action or resource on behalf of
      # a user that doesn't have permissions to use the action or resource, or specifying an invalid
      # resource identifier.

      struct ClientException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A detailed view of a component.

      struct Component
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Describes what change has been made in this version of the component, or what makes this version
        # different from other versions of the component.

        @[JSON::Field(key: "changeDescription")]
        getter change_description : String?

        # Component data contains the YAML document content for the component.

        @[JSON::Field(key: "data")]
        getter data : String?

        # The date that Image Builder created the component.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The description of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The encryption status of the component.

        @[JSON::Field(key: "encrypted")]
        getter encrypted : Bool?

        # The KMS key identifier used to encrypt the component. This can be either the Key ARN or the Alias
        # ARN. For more information, see Key identifiers (KeyId) in the Key Management Service Developer Guide
        # .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates whether component source is hidden from view in the console, and from component detail
        # results for API, CLI, or SDK operations.

        @[JSON::Field(key: "obfuscate")]
        getter obfuscate : Bool?

        # The owner of the component.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # Contains parameter details for each of the parameters that the component document defined for the
        # component.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::ComponentParameterDetail)?

        # The operating system platform of the component.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Contains product codes that are used for billing purposes for Amazon Web Services Marketplace
        # components.

        @[JSON::Field(key: "productCodes")]
        getter product_codes : Array(Types::ProductCodeListItem)?

        # Contains the name of the publisher if this is a third-party component. Otherwise, this property is
        # empty.

        @[JSON::Field(key: "publisher")]
        getter publisher : String?

        # Describes the current status of the component.

        @[JSON::Field(key: "state")]
        getter state : Types::ComponentState?

        # The operating system (OS) version supported by the component. If the OS information is available,
        # Image Builder performs a prefix match against the base image OS version during image recipe
        # creation.

        @[JSON::Field(key: "supportedOsVersions")]
        getter supported_os_versions : Array(String)?

        # The tags that apply to the component.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The component type specifies whether Image Builder uses the component to build the image or only to
        # test it.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The version of the component.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @change_description : String? = nil,
          @data : String? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @encrypted : Bool? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @obfuscate : Bool? = nil,
          @owner : String? = nil,
          @parameters : Array(Types::ComponentParameterDetail)? = nil,
          @platform : String? = nil,
          @product_codes : Array(Types::ProductCodeListItem)? = nil,
          @publisher : String? = nil,
          @state : Types::ComponentState? = nil,
          @supported_os_versions : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Configuration details of the component.

      struct ComponentConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component.

        @[JSON::Field(key: "componentArn")]
        getter component_arn : String

        # A group of parameter settings that Image Builder uses to configure the component for a specific
        # recipe.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::ComponentParameter)?

        def initialize(
          @component_arn : String,
          @parameters : Array(Types::ComponentParameter)? = nil
        )
        end
      end

      # Contains a key/value pair that sets the named component parameter.

      struct ComponentParameter
        include JSON::Serializable

        # The name of the component parameter to set.

        @[JSON::Field(key: "name")]
        getter name : String

        # Sets the value for the named component parameter.

        @[JSON::Field(key: "value")]
        getter value : Array(String)

        def initialize(
          @name : String,
          @value : Array(String)
        )
        end
      end

      # Defines a parameter that is used to provide configuration details for the component.

      struct ComponentParameterDetail
        include JSON::Serializable

        # The name of this input parameter.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of input this parameter provides. The currently supported value is "string".

        @[JSON::Field(key: "type")]
        getter type : String

        # The default value of this parameter if no input is provided.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : Array(String)?

        # Describes this parameter.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @type : String,
          @default_value : Array(String)? = nil,
          @description : String? = nil
        )
        end
      end

      # A group of fields that describe the current status of components.

      struct ComponentState
        include JSON::Serializable

        # Describes how or why the component changed state.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The current state of the component.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A high-level summary of a component.

      struct ComponentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The change description for the current version of the component.

        @[JSON::Field(key: "changeDescription")]
        getter change_description : String?

        # The original creation date of the component.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The description of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates whether component source is hidden from view in the console, and from component detail
        # results for API, CLI, or SDK operations.

        @[JSON::Field(key: "obfuscate")]
        getter obfuscate : Bool?

        # The owner of the component.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The operating system platform of the component.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Contains the name of the publisher if this is a third-party component. Otherwise, this property is
        # empty.

        @[JSON::Field(key: "publisher")]
        getter publisher : String?

        # Describes the current status of the component.

        @[JSON::Field(key: "state")]
        getter state : Types::ComponentState?

        # The operating system (OS) version that the component supports. If the OS information is available,
        # Image Builder performs a prefix match against the base image OS version during image recipe
        # creation.

        @[JSON::Field(key: "supportedOsVersions")]
        getter supported_os_versions : Array(String)?

        # The tags that apply to the component.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The component type specifies whether Image Builder uses the component to build the image or only to
        # test it.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The version of the component.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @change_description : String? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @obfuscate : Bool? = nil,
          @owner : String? = nil,
          @platform : String? = nil,
          @publisher : String? = nil,
          @state : Types::ComponentState? = nil,
          @supported_os_versions : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # The defining characteristics of a specific version of an Amazon Web Services TOE component.

      struct ComponentVersion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component. Semantic versioning is included in each object's
        # Amazon Resource Name (ARN), at the level that applies to that object as follows: Versionless ARNs
        # and Name ARNs do not include specific values in any of the nodes. The nodes are either left off
        # entirely, or they are specified as wildcards, for example: x.x.x. Version ARNs have only the first
        # three nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt; Build version ARNs have all four nodes, and
        # point to a specific build for a specific version of an object.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date that the component was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The description of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the component.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The platform of the component.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Contains product codes that are used for billing purposes for Amazon Web Services Marketplace
        # components.

        @[JSON::Field(key: "productCodes")]
        getter product_codes : Array(Types::ProductCodeListItem)?

        # Describes the current status of the component version.

        @[JSON::Field(key: "status")]
        getter status : String?

        # he operating system (OS) version supported by the component. If the OS information is available, a
        # prefix match is performed against the base image OS version during image recipe creation.

        @[JSON::Field(key: "supportedOsVersions")]
        getter supported_os_versions : Array(String)?

        # The type of the component denotes whether the component is used to build the image or only to test
        # it.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The semantic version of the component. The semantic version has four nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
        # and can filter on all of them. Assignment: For the first three nodes you can assign any positive
        # integer value, including zero, with an upper limit of 2^30-1, or 1073741823 for each node. Image
        # Builder automatically assigns the build number to the fourth node. Patterns: You can use any numeric
        # pattern that adheres to the assignment requirements for the nodes that you can assign. For example,
        # you might choose a software version pattern, such as 1.0.0, or a date, such as 2021.01.01.
        # Filtering: With semantic versioning, you have the flexibility to use wildcards (x) to specify the
        # most recent versions or nodes when selecting the base image or components for your recipe. When you
        # use a wildcard in any node, all nodes to the right of the first wildcard must also be wildcards.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @platform : String? = nil,
          @product_codes : Array(Types::ProductCodeListItem)? = nil,
          @status : String? = nil,
          @supported_os_versions : Array(String)? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # A container encapsulates the runtime environment for an application.

      struct Container
        include JSON::Serializable

        # A list of URIs for containers created in the context Region.

        @[JSON::Field(key: "imageUris")]
        getter image_uris : Array(String)?

        # Containers and container images are Region-specific. This is the Region context for the container.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @image_uris : Array(String)? = nil,
          @region : String? = nil
        )
        end
      end

      # Container distribution settings for encryption, licensing, and sharing in a specific Region.

      struct ContainerDistributionConfiguration
        include JSON::Serializable

        # The destination repository for the container distribution configuration.

        @[JSON::Field(key: "targetRepository")]
        getter target_repository : Types::TargetContainerRepository

        # Tags that are attached to the container distribution configuration.

        @[JSON::Field(key: "containerTags")]
        getter container_tags : Array(String)?

        # The description of the container distribution configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @target_repository : Types::TargetContainerRepository,
          @container_tags : Array(String)? = nil,
          @description : String? = nil
        )
        end
      end

      # A container recipe.

      struct ContainerRecipe
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe. Semantic versioning is included in each
        # object's Amazon Resource Name (ARN), at the level that applies to that object as follows:
        # Versionless ARNs and Name ARNs do not include specific values in any of the nodes. The nodes are
        # either left off entirely, or they are specified as wildcards, for example: x.x.x. Version ARNs have
        # only the first three nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt; Build version ARNs have all
        # four nodes, and point to a specific build for a specific version of an object.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Build and test components that are included in the container recipe. Recipes require a minimum of
        # one build component, and can have a maximum of 20 build and test components in any combination.

        @[JSON::Field(key: "components")]
        getter components : Array(Types::ComponentConfiguration)?

        # Specifies the type of container, such as Docker.

        @[JSON::Field(key: "containerType")]
        getter container_type : String?

        # The date when this container recipe was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The description of the container recipe.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Dockerfiles are text documents that are used to build Docker containers, and ensure that they
        # contain all of the elements required by the application running inside. The template data consists
        # of contextual variables where Image Builder places build information or scripts, based on your
        # container image recipe.

        @[JSON::Field(key: "dockerfileTemplateData")]
        getter dockerfile_template_data : String?

        # A flag that indicates if the target container is encrypted.

        @[JSON::Field(key: "encrypted")]
        getter encrypted : Bool?

        # A group of options that can be used to configure an instance for building and testing container
        # images.

        @[JSON::Field(key: "instanceConfiguration")]
        getter instance_configuration : Types::InstanceConfiguration?

        # The Amazon Resource Name (ARN) that uniquely identifies which KMS key is used to encrypt the
        # container image for distribution to the target Region. This can be either the Key ARN or the Alias
        # ARN. For more information, see Key identifiers (KeyId) in the Key Management Service Developer Guide
        # .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the container recipe.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the container recipe.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The base image for customizations specified in the container recipe. This can contain an Image
        # Builder image resource ARN or a container image URI, for example amazonlinux:latest .

        @[JSON::Field(key: "parentImage")]
        getter parent_image : String?

        # The system platform for the container, such as Windows or Linux.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Tags that are attached to the container recipe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The destination repository for the container image.

        @[JSON::Field(key: "targetRepository")]
        getter target_repository : Types::TargetContainerRepository?

        # The semantic version of the container recipe. The semantic version has four nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
        # and can filter on all of them. Assignment: For the first three nodes you can assign any positive
        # integer value, including zero, with an upper limit of 2^30-1, or 1073741823 for each node. Image
        # Builder automatically assigns the build number to the fourth node. Patterns: You can use any numeric
        # pattern that adheres to the assignment requirements for the nodes that you can assign. For example,
        # you might choose a software version pattern, such as 1.0.0, or a date, such as 2021.01.01.
        # Filtering: With semantic versioning, you have the flexibility to use wildcards (x) to specify the
        # most recent versions or nodes when selecting the base image or components for your recipe. When you
        # use a wildcard in any node, all nodes to the right of the first wildcard must also be wildcards.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The working directory for use during build and test workflows.

        @[JSON::Field(key: "workingDirectory")]
        getter working_directory : String?

        def initialize(
          @arn : String? = nil,
          @components : Array(Types::ComponentConfiguration)? = nil,
          @container_type : String? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @dockerfile_template_data : String? = nil,
          @encrypted : Bool? = nil,
          @instance_configuration : Types::InstanceConfiguration? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parent_image : String? = nil,
          @platform : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_repository : Types::TargetContainerRepository? = nil,
          @version : String? = nil,
          @working_directory : String? = nil
        )
        end
      end

      # A summary of a container recipe

      struct ContainerRecipeSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Specifies the type of container, such as "Docker".

        @[JSON::Field(key: "containerType")]
        getter container_type : String?

        # The date when this container recipe was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The base image for a container build and test instance. This can contain an AMI ID or it can specify
        # an Amazon Web Services Systems Manager (SSM) Parameter Store Parameter, prefixed by ssm: , followed
        # by the parameter name or ARN. If not specified, Image Builder uses the appropriate ECS-optimized AMI
        # as a base image.

        @[JSON::Field(key: "instanceImage")]
        getter instance_image : String?

        # The name of the container recipe.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the container recipe.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The base image for the container recipe.

        @[JSON::Field(key: "parentImage")]
        getter parent_image : String?

        # The system platform for the container, such as Windows or Linux.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Tags that are attached to the container recipe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @container_type : String? = nil,
          @date_created : String? = nil,
          @instance_image : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parent_image : String? = nil,
          @platform : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateComponentRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operating system platform of the component.

        @[JSON::Field(key: "platform")]
        getter platform : String

        # The semantic version of the component. This version follows the semantic version syntax. The
        # semantic version has four nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can
        # assign values for the first three, and can filter on all of them. Assignment: For the first three
        # nodes you can assign any positive integer value, including zero, with an upper limit of 2^30-1, or
        # 1073741823 for each node. Image Builder automatically assigns the build number to the fourth node.
        # Patterns: You can use any numeric pattern that adheres to the assignment requirements for the nodes
        # that you can assign. For example, you might choose a software version pattern, such as 1.0.0, or a
        # date, such as 2021.01.01.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # The change description of the component. Describes what change has been made in this version, or
        # what makes this version different from other versions of the component.

        @[JSON::Field(key: "changeDescription")]
        getter change_description : String?

        # Component data contains inline YAML document content for the component. Alternatively, you can
        # specify the uri of a YAML document file stored in Amazon S3. However, you cannot specify both
        # properties.

        @[JSON::Field(key: "data")]
        getter data : String?

        # Describes the contents of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Validates the required permissions for the operation and the request parameters, without actually
        # making the request, and provides an error response. Upon a successful request, the error response is
        # DryRunOperationException .

        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # The Amazon Resource Name (ARN) that uniquely identifies the KMS key used to encrypt this component.
        # This can be either the Key ARN or the Alias ARN. For more information, see Key identifiers (KeyId)
        # in the Key Management Service Developer Guide .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The operating system (OS) version supported by the component. If the OS information is available, a
        # prefix match is performed against the base image OS version during image recipe creation.

        @[JSON::Field(key: "supportedOsVersions")]
        getter supported_os_versions : Array(String)?

        # The tags that apply to the component.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The uri of a YAML component document file. This must be an S3 URL ( s3://bucket/key ), and the
        # requester must have permission to access the S3 bucket it points to. If you use Amazon S3, you can
        # specify component content up to your service quota. Alternatively, you can specify the YAML document
        # inline, using the component data property. You cannot specify both properties.

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @client_token : String,
          @name : String,
          @platform : String,
          @semantic_version : String,
          @change_description : String? = nil,
          @data : String? = nil,
          @description : String? = nil,
          @dry_run : Bool? = nil,
          @kms_key_id : String? = nil,
          @supported_os_versions : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @uri : String? = nil
        )
        end
      end


      struct CreateComponentResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the component that the request created.

        @[JSON::Field(key: "componentBuildVersionArn")]
        getter component_build_version_arn : String?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @component_build_version_arn : String? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateContainerRecipeRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The type of container to create.

        @[JSON::Field(key: "containerType")]
        getter container_type : String

        # The name of the container recipe.

        @[JSON::Field(key: "name")]
        getter name : String

        # The base image for the container recipe.

        @[JSON::Field(key: "parentImage")]
        getter parent_image : String

        # The semantic version of the container recipe. This version follows the semantic version syntax. The
        # semantic version has four nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can
        # assign values for the first three, and can filter on all of them. Assignment: For the first three
        # nodes you can assign any positive integer value, including zero, with an upper limit of 2^30-1, or
        # 1073741823 for each node. Image Builder automatically assigns the build number to the fourth node.
        # Patterns: You can use any numeric pattern that adheres to the assignment requirements for the nodes
        # that you can assign. For example, you might choose a software version pattern, such as 1.0.0, or a
        # date, such as 2021.01.01.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # The destination repository for the container image.

        @[JSON::Field(key: "targetRepository")]
        getter target_repository : Types::TargetContainerRepository

        # The components included in the container recipe.

        @[JSON::Field(key: "components")]
        getter components : Array(Types::ComponentConfiguration)?

        # The description of the container recipe.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Dockerfile template used to build your image as an inline data blob.

        @[JSON::Field(key: "dockerfileTemplateData")]
        getter dockerfile_template_data : String?

        # The Amazon S3 URI for the Dockerfile that will be used to build your container image.

        @[JSON::Field(key: "dockerfileTemplateUri")]
        getter dockerfile_template_uri : String?

        # Specifies the operating system version for the base image.

        @[JSON::Field(key: "imageOsVersionOverride")]
        getter image_os_version_override : String?

        # A group of options that can be used to configure an instance for building and testing container
        # images.

        @[JSON::Field(key: "instanceConfiguration")]
        getter instance_configuration : Types::InstanceConfiguration?

        # The Amazon Resource Name (ARN) that uniquely identifies which KMS key is used to encrypt the
        # Dockerfile template. This can be either the Key ARN or the Alias ARN. For more information, see Key
        # identifiers (KeyId) in the Key Management Service Developer Guide .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # Specifies the operating system platform when you use a custom base image.

        @[JSON::Field(key: "platformOverride")]
        getter platform_override : String?

        # Tags that are attached to the container recipe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The working directory for use during build and test workflows.

        @[JSON::Field(key: "workingDirectory")]
        getter working_directory : String?

        def initialize(
          @client_token : String,
          @container_type : String,
          @name : String,
          @parent_image : String,
          @semantic_version : String,
          @target_repository : Types::TargetContainerRepository,
          @components : Array(Types::ComponentConfiguration)? = nil,
          @description : String? = nil,
          @dockerfile_template_data : String? = nil,
          @dockerfile_template_uri : String? = nil,
          @image_os_version_override : String? = nil,
          @instance_configuration : Types::InstanceConfiguration? = nil,
          @kms_key_id : String? = nil,
          @platform_override : String? = nil,
          @tags : Hash(String, String)? = nil,
          @working_directory : String? = nil
        )
        end
      end


      struct CreateContainerRecipeResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Returns the Amazon Resource Name (ARN) of the container recipe that the request created.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @container_recipe_arn : String? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateDistributionConfigurationRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The distributions of the distribution configuration.

        @[JSON::Field(key: "distributions")]
        getter distributions : Array(Types::Distribution)

        # The name of the distribution configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the distribution configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags of the distribution configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @distributions : Array(Types::Distribution),
          @name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDistributionConfigurationResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the distribution configuration that was created by this request.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @distribution_configuration_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateImagePipelineRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the infrastructure configuration that will be used to build images
        # created by this image pipeline.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        # The name of the image pipeline.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the container recipe that is used to configure images created by
        # this container pipeline.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String?

        # The description of the image pipeline.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the distribution configuration that will be used to configure and
        # distribute images created by this image pipeline.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String?

        # Collects additional information about the image being created, including the operating system (OS)
        # version and package list. This information is used to enhance the overall experience of using EC2
        # Image Builder. Enabled by default.

        @[JSON::Field(key: "enhancedImageMetadataEnabled")]
        getter enhanced_image_metadata_enabled : Bool?

        # The name or Amazon Resource Name (ARN) for the IAM role you create that grants Image Builder access
        # to perform workflow actions.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # The Amazon Resource Name (ARN) of the image recipe that will be used to configure images created by
        # this image pipeline.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String?

        # Contains settings for vulnerability scans.

        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The image test configuration of the image pipeline.

        @[JSON::Field(key: "imageTestsConfiguration")]
        getter image_tests_configuration : Types::ImageTestsConfiguration?

        # Define logging configuration for the image build process.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::PipelineLoggingConfiguration?

        # The schedule of the image pipeline.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The status of the image pipeline.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags of the image pipeline.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Contains an array of workflow configuration objects.

        @[JSON::Field(key: "workflows")]
        getter workflows : Array(Types::WorkflowConfiguration)?

        def initialize(
          @client_token : String,
          @infrastructure_configuration_arn : String,
          @name : String,
          @container_recipe_arn : String? = nil,
          @description : String? = nil,
          @distribution_configuration_arn : String? = nil,
          @enhanced_image_metadata_enabled : Bool? = nil,
          @execution_role : String? = nil,
          @image_recipe_arn : String? = nil,
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @image_tests_configuration : Types::ImageTestsConfiguration? = nil,
          @logging_configuration : Types::PipelineLoggingConfiguration? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflows : Array(Types::WorkflowConfiguration)? = nil
        )
        end
      end


      struct CreateImagePipelineResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image pipeline that was created by this request.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_pipeline_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateImageRecipeRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the image recipe.

        @[JSON::Field(key: "name")]
        getter name : String

        # The base image for customizations specified in the image recipe. You can specify the parent image
        # using one of the following options: AMI ID Image Builder image Amazon Resource Name (ARN) Amazon Web
        # Services Systems Manager (SSM) Parameter Store Parameter, prefixed by ssm: , followed by the
        # parameter name or ARN. Amazon Web Services Marketplace product ID If you enter an AMI ID or an SSM
        # parameter that contains the AMI ID, you must have access to the AMI, and the AMI must be in the
        # source Region.

        @[JSON::Field(key: "parentImage")]
        getter parent_image : String

        # The semantic version of the image recipe. This version follows the semantic version syntax. The
        # semantic version has four nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can
        # assign values for the first three, and can filter on all of them. Assignment: For the first three
        # nodes you can assign any positive integer value, including zero, with an upper limit of 2^30-1, or
        # 1073741823 for each node. Image Builder automatically assigns the build number to the fourth node.
        # Patterns: You can use any numeric pattern that adheres to the assignment requirements for the nodes
        # that you can assign. For example, you might choose a software version pattern, such as 1.0.0, or a
        # date, such as 2021.01.01.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # Specify additional settings and launch scripts for your build instances.

        @[JSON::Field(key: "additionalInstanceConfiguration")]
        getter additional_instance_configuration : Types::AdditionalInstanceConfiguration?

        # Tags that are applied to the AMI that Image Builder creates during the Build phase prior to image
        # distribution.

        @[JSON::Field(key: "amiTags")]
        getter ami_tags : Hash(String, String)?

        # The block device mappings of the image recipe.

        @[JSON::Field(key: "blockDeviceMappings")]
        getter block_device_mappings : Array(Types::InstanceBlockDeviceMapping)?

        # The components included in the image recipe.

        @[JSON::Field(key: "components")]
        getter components : Array(Types::ComponentConfiguration)?

        # The description of the image recipe.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags of the image recipe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The working directory used during build and test workflows.

        @[JSON::Field(key: "workingDirectory")]
        getter working_directory : String?

        def initialize(
          @client_token : String,
          @name : String,
          @parent_image : String,
          @semantic_version : String,
          @additional_instance_configuration : Types::AdditionalInstanceConfiguration? = nil,
          @ami_tags : Hash(String, String)? = nil,
          @block_device_mappings : Array(Types::InstanceBlockDeviceMapping)? = nil,
          @components : Array(Types::ComponentConfiguration)? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil,
          @working_directory : String? = nil
        )
        end
      end


      struct CreateImageRecipeResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image recipe that was created by this request.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_recipe_arn : String? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateImageRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the infrastructure configuration that defines the environment in
        # which your image will be built and tested.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        # The Amazon Resource Name (ARN) of the container recipe that defines how images are configured and
        # tested.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String?

        # The Amazon Resource Name (ARN) of the distribution configuration that defines and configures the
        # outputs of your pipeline.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String?

        # Collects additional information about the image being created, including the operating system (OS)
        # version and package list. This information is used to enhance the overall experience of using EC2
        # Image Builder. Enabled by default.

        @[JSON::Field(key: "enhancedImageMetadataEnabled")]
        getter enhanced_image_metadata_enabled : Bool?

        # The name or Amazon Resource Name (ARN) for the IAM role you create that grants Image Builder access
        # to perform workflow actions.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # The Amazon Resource Name (ARN) of the image recipe that defines how images are configured, tested,
        # and assessed.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String?

        # Contains settings for vulnerability scans.

        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The image tests configuration of the image.

        @[JSON::Field(key: "imageTestsConfiguration")]
        getter image_tests_configuration : Types::ImageTestsConfiguration?

        # Define logging configuration for the image build process.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::ImageLoggingConfiguration?

        # The tags of the image.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Contains an array of workflow configuration objects.

        @[JSON::Field(key: "workflows")]
        getter workflows : Array(Types::WorkflowConfiguration)?

        def initialize(
          @client_token : String,
          @infrastructure_configuration_arn : String,
          @container_recipe_arn : String? = nil,
          @distribution_configuration_arn : String? = nil,
          @enhanced_image_metadata_enabled : Bool? = nil,
          @execution_role : String? = nil,
          @image_recipe_arn : String? = nil,
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @image_tests_configuration : Types::ImageTestsConfiguration? = nil,
          @logging_configuration : Types::ImageLoggingConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @workflows : Array(Types::WorkflowConfiguration)? = nil
        )
        end
      end


      struct CreateImageResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image that the request created.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_build_version_arn : String? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateInfrastructureConfigurationRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The instance profile to associate with the instance used to customize your Amazon EC2 AMI.

        @[JSON::Field(key: "instanceProfileName")]
        getter instance_profile_name : String

        # The name of the infrastructure configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the infrastructure configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The instance metadata options that you can set for the HTTP requests that pipeline builds use to
        # launch EC2 build and test instances.

        @[JSON::Field(key: "instanceMetadataOptions")]
        getter instance_metadata_options : Types::InstanceMetadataOptions?

        # The instance types of the infrastructure configuration. You can specify one or more instance types
        # to use for this build. The service will pick one of these instance types based on availability.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The key pair of the infrastructure configuration. You can use this to log on to and debug the
        # instance used to create your image.

        @[JSON::Field(key: "keyPair")]
        getter key_pair : String?

        # The logging configuration of the infrastructure configuration.

        @[JSON::Field(key: "logging")]
        getter logging : Types::Logging?

        # The instance placement settings that define where the instances that are launched from your image
        # will run.

        @[JSON::Field(key: "placement")]
        getter placement : Types::Placement?

        # The metadata tags to assign to the Amazon EC2 instance that Image Builder launches during the build
        # process. Tags are formatted as key value pairs.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The security group IDs to associate with the instance used to customize your Amazon EC2 AMI.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The Amazon Resource Name (ARN) for the SNS topic to which we send image build event notifications.
        # EC2 Image Builder is unable to send notifications to SNS topics that are encrypted using keys from
        # other accounts. The key that is used to encrypt the SNS topic must reside in the account that the
        # Image Builder service runs under.

        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String?

        # The subnet ID in which to place the instance used to customize your Amazon EC2 AMI.

        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The metadata tags to assign to the infrastructure configuration resource that Image Builder creates
        # as output. Tags are formatted as key value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The terminate instance on failure setting of the infrastructure configuration. Set to false if you
        # want Image Builder to retain the instance used to configure your AMI if the build or test phase of
        # your workflow fails.

        @[JSON::Field(key: "terminateInstanceOnFailure")]
        getter terminate_instance_on_failure : Bool?

        def initialize(
          @client_token : String,
          @instance_profile_name : String,
          @name : String,
          @description : String? = nil,
          @instance_metadata_options : Types::InstanceMetadataOptions? = nil,
          @instance_types : Array(String)? = nil,
          @key_pair : String? = nil,
          @logging : Types::Logging? = nil,
          @placement : Types::Placement? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @sns_topic_arn : String? = nil,
          @subnet_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @terminate_instance_on_failure : Bool? = nil
        )
        end
      end


      struct CreateInfrastructureConfigurationResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the infrastructure configuration that was created by this request.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @infrastructure_configuration_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateLifecyclePolicyRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name or Amazon Resource Name (ARN) for the IAM role you create that grants Image Builder access
        # to run lifecycle actions.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String

        # The name of the lifecycle policy to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # Configuration details for the lifecycle policy rules.

        @[JSON::Field(key: "policyDetails")]
        getter policy_details : Array(Types::LifecyclePolicyDetail)

        # Selection criteria for the resources that the lifecycle policy applies to.

        @[JSON::Field(key: "resourceSelection")]
        getter resource_selection : Types::LifecyclePolicyResourceSelection

        # The type of Image Builder resource that the lifecycle policy applies to.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Optional description for the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the lifecycle policy resource is enabled.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Tags to apply to the lifecycle policy resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @execution_role : String,
          @name : String,
          @policy_details : Array(Types::LifecyclePolicyDetail),
          @resource_selection : Types::LifecyclePolicyResourceSelection,
          @resource_type : String,
          @description : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLifecyclePolicyResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the lifecycle policy that the request created.

        @[JSON::Field(key: "lifecyclePolicyArn")]
        getter lifecycle_policy_arn : String?

        def initialize(
          @client_token : String? = nil,
          @lifecycle_policy_arn : String? = nil
        )
        end
      end


      struct CreateWorkflowRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the workflow to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # The semantic version of this workflow resource. The semantic version syntax adheres to the following
        # rules. The semantic version has four nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;.
        # You can assign values for the first three, and can filter on all of them. Assignment: For the first
        # three nodes you can assign any positive integer value, including zero, with an upper limit of
        # 2^30-1, or 1073741823 for each node. Image Builder automatically assigns the build number to the
        # fourth node. Patterns: You can use any numeric pattern that adheres to the assignment requirements
        # for the nodes that you can assign. For example, you might choose a software version pattern, such as
        # 1.0.0, or a date, such as 2021.01.01.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # The phase in the image build process for which the workflow resource is responsible.

        @[JSON::Field(key: "type")]
        getter type : String

        # Describes what change has been made in this version of the workflow, or what makes this version
        # different from other versions of the workflow.

        @[JSON::Field(key: "changeDescription")]
        getter change_description : String?

        # Contains the UTF-8 encoded YAML document content for the workflow. Alternatively, you can specify
        # the uri of a YAML document file stored in Amazon S3. However, you cannot specify both properties.

        @[JSON::Field(key: "data")]
        getter data : String?

        # Describes the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Validates the required permissions for the operation and the request parameters, without actually
        # making the request, and provides an error response. Upon a successful request, the error response is
        # DryRunOperationException .

        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # The Amazon Resource Name (ARN) that uniquely identifies the KMS key used to encrypt this workflow
        # resource. This can be either the Key ARN or the Alias ARN. For more information, see Key identifiers
        # (KeyId) in the Key Management Service Developer Guide .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # Tags that apply to the workflow resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The uri of a YAML component document file. This must be an S3 URL ( s3://bucket/key ), and the
        # requester must have permission to access the S3 bucket it points to. If you use Amazon S3, you can
        # specify component content up to your service quota. Alternatively, you can specify the YAML document
        # inline, using the component data property. You cannot specify both properties.

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @client_token : String,
          @name : String,
          @semantic_version : String,
          @type : String,
          @change_description : String? = nil,
          @data : String? = nil,
          @description : String? = nil,
          @dry_run : Bool? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uri : String? = nil
        )
        end
      end


      struct CreateWorkflowResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The Amazon Resource Name (ARN) of the workflow resource that the request created.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String?

        def initialize(
          @client_token : String? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @workflow_build_version_arn : String? = nil
        )
        end
      end

      # Amazon Inspector generates a risk score for each finding. This score helps you to prioritize
      # findings, to focus on the most critical findings and the most vulnerable resources. The score uses
      # the Common Vulnerability Scoring System (CVSS) format. This format is a modification of the base
      # CVSS score that the National Vulnerability Database (NVD) provides. For more information about
      # severity levels, see Severity levels for Amazon Inspector findings in the Amazon Inspector User
      # Guide .

      struct CvssScore
        include JSON::Serializable

        # The CVSS base score.

        @[JSON::Field(key: "baseScore")]
        getter base_score : Float64?

        # The vector string of the CVSS score.

        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String?

        # The source of the CVSS score.

        @[JSON::Field(key: "source")]
        getter source : String?

        # The CVSS version that generated the score.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @base_score : Float64? = nil,
          @scoring_vector : String? = nil,
          @source : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Details about an adjustment that Amazon Inspector made to the CVSS score for a finding.

      struct CvssScoreAdjustment
        include JSON::Serializable

        # The metric that Amazon Inspector used to adjust the CVSS score.

        @[JSON::Field(key: "metric")]
        getter metric : String?

        # The reason for the CVSS score adjustment.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @metric : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Details about the source of the score, and the factors that determined the adjustments to create the
      # final score.

      struct CvssScoreDetails
        include JSON::Serializable

        # An object that contains details about an adjustment that Amazon Inspector made to the CVSS score for
        # the finding.

        @[JSON::Field(key: "adjustments")]
        getter adjustments : Array(Types::CvssScoreAdjustment)?

        # The source of the finding.

        @[JSON::Field(key: "cvssSource")]
        getter cvss_source : String?

        # The CVSS score.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        # The source for the CVSS score.

        @[JSON::Field(key: "scoreSource")]
        getter score_source : String?

        # A vector that measures the severity of the vulnerability.

        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String?

        # The CVSS version that generated the score.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @adjustments : Array(Types::CvssScoreAdjustment)? = nil,
          @cvss_source : String? = nil,
          @score : Float64? = nil,
          @score_source : String? = nil,
          @scoring_vector : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct DeleteComponentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component build version to delete.

        @[JSON::Field(key: "componentBuildVersionArn")]
        getter component_build_version_arn : String

        def initialize(
          @component_build_version_arn : String
        )
        end
      end


      struct DeleteComponentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component build version that this request deleted.

        @[JSON::Field(key: "componentBuildVersionArn")]
        getter component_build_version_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @component_build_version_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct DeleteContainerRecipeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe to delete.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String

        def initialize(
          @container_recipe_arn : String
        )
        end
      end


      struct DeleteContainerRecipeResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe that was deleted.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @container_recipe_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct DeleteDistributionConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the distribution configuration to delete.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String

        def initialize(
          @distribution_configuration_arn : String
        )
        end
      end


      struct DeleteDistributionConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the distribution configuration that was deleted.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @distribution_configuration_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct DeleteImagePipelineRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image pipeline to delete.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String

        def initialize(
          @image_pipeline_arn : String
        )
        end
      end


      struct DeleteImagePipelineResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image pipeline that was deleted.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_pipeline_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct DeleteImageRecipeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image recipe to delete.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String

        def initialize(
          @image_recipe_arn : String
        )
        end
      end


      struct DeleteImageRecipeResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image recipe that was deleted.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_recipe_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct DeleteImageRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Image Builder image resource to delete.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String

        def initialize(
          @image_build_version_arn : String
        )
        end
      end


      struct DeleteImageResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Image Builder image resource that this request deleted.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_build_version_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct DeleteInfrastructureConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the infrastructure configuration to delete.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        def initialize(
          @infrastructure_configuration_arn : String
        )
        end
      end


      struct DeleteInfrastructureConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the infrastructure configuration that was deleted.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @infrastructure_configuration_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct DeleteLifecyclePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the lifecycle policy resource to delete.

        @[JSON::Field(key: "lifecyclePolicyArn")]
        getter lifecycle_policy_arn : String

        def initialize(
          @lifecycle_policy_arn : String
        )
        end
      end


      struct DeleteLifecyclePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the lifecycle policy that was deleted.

        @[JSON::Field(key: "lifecyclePolicyArn")]
        getter lifecycle_policy_arn : String?

        def initialize(
          @lifecycle_policy_arn : String? = nil
        )
        end
      end


      struct DeleteWorkflowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow resource to delete.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String

        def initialize(
          @workflow_build_version_arn : String
        )
        end
      end


      struct DeleteWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow resource that this request deleted.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String?

        def initialize(
          @workflow_build_version_arn : String? = nil
        )
        end
      end


      struct DistributeImageRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the distribution configuration to use.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String

        # The IAM role to use for the distribution.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String

        # The source image Amazon Resource Name (ARN) to distribute.

        @[JSON::Field(key: "sourceImage")]
        getter source_image : String

        # The logging configuration for the distribution.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::ImageLoggingConfiguration?

        # The tags to apply to the distributed image.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @distribution_configuration_arn : String,
          @execution_role : String,
          @source_image : String,
          @logging_configuration : Types::ImageLoggingConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DistributeImageResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image to be distributed.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        def initialize(
          @client_token : String? = nil,
          @image_build_version_arn : String? = nil
        )
        end
      end

      # Defines the settings for a specific Region.

      struct Distribution
        include JSON::Serializable

        # The target Region.

        @[JSON::Field(key: "region")]
        getter region : String

        # The specific AMI settings; for example, launch permissions or AMI tags.

        @[JSON::Field(key: "amiDistributionConfiguration")]
        getter ami_distribution_configuration : Types::AmiDistributionConfiguration?

        # Container distribution settings for encryption, licensing, and sharing in a specific Region.

        @[JSON::Field(key: "containerDistributionConfiguration")]
        getter container_distribution_configuration : Types::ContainerDistributionConfiguration?

        # The Windows faster-launching configurations to use for AMI distribution.

        @[JSON::Field(key: "fastLaunchConfigurations")]
        getter fast_launch_configurations : Array(Types::FastLaunchConfiguration)?

        # A group of launchTemplateConfiguration settings that apply to image distribution for specified
        # accounts.

        @[JSON::Field(key: "launchTemplateConfigurations")]
        getter launch_template_configurations : Array(Types::LaunchTemplateConfiguration)?

        # The License Manager Configuration to associate with the AMI in the specified Region.

        @[JSON::Field(key: "licenseConfigurationArns")]
        getter license_configuration_arns : Array(String)?

        # Configure export settings to deliver disk images created from your image build, using a file format
        # that is compatible with your VMs in that Region.

        @[JSON::Field(key: "s3ExportConfiguration")]
        getter s3_export_configuration : Types::S3ExportConfiguration?

        # Contains settings to update Amazon Web Services Systems Manager (SSM) Parameter Store Parameters
        # with output AMI IDs from the build by target Region.

        @[JSON::Field(key: "ssmParameterConfigurations")]
        getter ssm_parameter_configurations : Array(Types::SsmParameterConfiguration)?

        def initialize(
          @region : String,
          @ami_distribution_configuration : Types::AmiDistributionConfiguration? = nil,
          @container_distribution_configuration : Types::ContainerDistributionConfiguration? = nil,
          @fast_launch_configurations : Array(Types::FastLaunchConfiguration)? = nil,
          @launch_template_configurations : Array(Types::LaunchTemplateConfiguration)? = nil,
          @license_configuration_arns : Array(String)? = nil,
          @s3_export_configuration : Types::S3ExportConfiguration? = nil,
          @ssm_parameter_configurations : Array(Types::SsmParameterConfiguration)? = nil
        )
        end
      end

      # A distribution configuration.

      struct DistributionConfiguration
        include JSON::Serializable

        # The maximum duration in minutes for this distribution configuration.

        @[JSON::Field(key: "timeoutMinutes")]
        getter timeout_minutes : Int32

        # The Amazon Resource Name (ARN) of the distribution configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date on which this distribution configuration was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The date on which this distribution configuration was last updated.

        @[JSON::Field(key: "dateUpdated")]
        getter date_updated : String?

        # The description of the distribution configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The distribution objects that apply Region-specific settings for the deployment of the image to
        # targeted Regions.

        @[JSON::Field(key: "distributions")]
        getter distributions : Array(Types::Distribution)?

        # The name of the distribution configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags of the distribution configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @timeout_minutes : Int32,
          @arn : String? = nil,
          @date_created : String? = nil,
          @date_updated : String? = nil,
          @description : String? = nil,
          @distributions : Array(Types::Distribution)? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A high-level overview of a distribution configuration.

      struct DistributionConfigurationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the distribution configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date on which the distribution configuration was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The date on which the distribution configuration was updated.

        @[JSON::Field(key: "dateUpdated")]
        getter date_updated : String?

        # The description of the distribution configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the distribution configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of Regions where the container image is distributed to.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        # The tags associated with the distribution configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @date_created : String? = nil,
          @date_updated : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @regions : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The dry run operation of the resource was successful, and no resources or mutations were actually
      # performed due to the dry run flag in the request.

      struct DryRunOperationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon EBS-specific block device mapping specifications.

      struct EbsInstanceBlockDeviceSpecification
        include JSON::Serializable

        # Use to configure delete on termination of the associated device.

        @[JSON::Field(key: "deleteOnTermination")]
        getter delete_on_termination : Bool?

        # Use to configure device encryption.

        @[JSON::Field(key: "encrypted")]
        getter encrypted : Bool?

        # Use to configure device IOPS.

        @[JSON::Field(key: "iops")]
        getter iops : Int32?

        # The Amazon Resource Name (ARN) that uniquely identifies the KMS key to use when encrypting the
        # device. This can be either the Key ARN or the Alias ARN. For more information, see Key identifiers
        # (KeyId) in the Key Management Service Developer Guide .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The snapshot that defines the device contents.

        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String?

        # For GP3 volumes only – The throughput in MiB/s that the volume supports.

        @[JSON::Field(key: "throughput")]
        getter throughput : Int32?

        # Use to override the device's volume size.

        @[JSON::Field(key: "volumeSize")]
        getter volume_size : Int32?

        # Use to override the device's volume type.

        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @delete_on_termination : Bool? = nil,
          @encrypted : Bool? = nil,
          @iops : Int32? = nil,
          @kms_key_id : String? = nil,
          @snapshot_id : String? = nil,
          @throughput : Int32? = nil,
          @volume_size : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Settings that Image Builder uses to configure the ECR repository and the output container images
      # that Amazon Inspector scans.

      struct EcrConfiguration
        include JSON::Serializable

        # Tags for Image Builder to apply to the output container image that Amazon Inspector scans. Tags can
        # help you identify and manage your scanned images.

        @[JSON::Field(key: "containerTags")]
        getter container_tags : Array(String)?

        # The name of the container repository that Amazon Inspector scans to identify findings for your
        # container images. The name includes the path for the repository location. If you don’t provide this
        # information, Image Builder creates a repository in your account named
        # image-builder-image-scanning-repository for vulnerability scans of your output container images.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @container_tags : Array(String)? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Define and configure faster launching for output Windows AMIs.

      struct FastLaunchConfiguration
        include JSON::Serializable

        # A Boolean that represents the current state of faster launching for the Windows AMI. Set to true to
        # start using Windows faster launching, or false to stop using it.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The owner account ID for the fast-launch enabled Windows AMI.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The launch template that the fast-launch enabled Windows AMI uses when it launches Windows instances
        # to create pre-provisioned snapshots.

        @[JSON::Field(key: "launchTemplate")]
        getter launch_template : Types::FastLaunchLaunchTemplateSpecification?

        # The maximum number of parallel instances that are launched for creating resources.

        @[JSON::Field(key: "maxParallelLaunches")]
        getter max_parallel_launches : Int32?

        # Configuration settings for managing the number of snapshots that are created from pre-provisioned
        # instances for the Windows AMI when faster launching is enabled.

        @[JSON::Field(key: "snapshotConfiguration")]
        getter snapshot_configuration : Types::FastLaunchSnapshotConfiguration?

        def initialize(
          @enabled : Bool,
          @account_id : String? = nil,
          @launch_template : Types::FastLaunchLaunchTemplateSpecification? = nil,
          @max_parallel_launches : Int32? = nil,
          @snapshot_configuration : Types::FastLaunchSnapshotConfiguration? = nil
        )
        end
      end

      # Identifies the launch template that the associated Windows AMI uses for launching an instance when
      # faster launching is enabled. You can specify either the launchTemplateName or the launchTemplateId ,
      # but not both.

      struct FastLaunchLaunchTemplateSpecification
        include JSON::Serializable

        # The ID of the launch template to use for faster launching for a Windows AMI.

        @[JSON::Field(key: "launchTemplateId")]
        getter launch_template_id : String?

        # The name of the launch template to use for faster launching for a Windows AMI.

        @[JSON::Field(key: "launchTemplateName")]
        getter launch_template_name : String?

        # The version of the launch template to use for faster launching for a Windows AMI.

        @[JSON::Field(key: "launchTemplateVersion")]
        getter launch_template_version : String?

        def initialize(
          @launch_template_id : String? = nil,
          @launch_template_name : String? = nil,
          @launch_template_version : String? = nil
        )
        end
      end

      # Configuration settings for creating and managing pre-provisioned snapshots for a fast-launch enabled
      # Windows AMI.

      struct FastLaunchSnapshotConfiguration
        include JSON::Serializable

        # The number of pre-provisioned snapshots to keep on hand for a fast-launch enabled Windows AMI.

        @[JSON::Field(key: "targetResourceCount")]
        getter target_resource_count : Int32?

        def initialize(
          @target_resource_count : Int32? = nil
        )
        end
      end

      # A filter name and value pair that is used to return a more specific list of results from a list
      # operation. Filters can be used to match a set of resources by specific criteria, such as tags,
      # attributes, or IDs.

      struct Filter
        include JSON::Serializable

        # The name of the filter. Filter names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter values. Filter values are case-sensitive.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # You are not authorized to perform the requested operation.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetComponentPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component whose policy you want to retrieve.

        @[JSON::Field(key: "componentArn")]
        getter component_arn : String

        def initialize(
          @component_arn : String
        )
        end
      end


      struct GetComponentPolicyResponse
        include JSON::Serializable

        # The component policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @policy : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetComponentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component that you want to get. Regex requires the suffix
        # /\d+$ .

        @[JSON::Field(key: "componentBuildVersionArn")]
        getter component_build_version_arn : String

        def initialize(
          @component_build_version_arn : String
        )
        end
      end


      struct GetComponentResponse
        include JSON::Serializable

        # The component object specified in the request.

        @[JSON::Field(key: "component")]
        getter component : Types::Component?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @component : Types::Component? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetContainerRecipePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe for the policy being requested.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String

        def initialize(
          @container_recipe_arn : String
        )
        end
      end


      struct GetContainerRecipePolicyResponse
        include JSON::Serializable

        # The container recipe policy object that is returned.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @policy : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetContainerRecipeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe to retrieve.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String

        def initialize(
          @container_recipe_arn : String
        )
        end
      end


      struct GetContainerRecipeResponse
        include JSON::Serializable

        # The container recipe object that is returned.

        @[JSON::Field(key: "containerRecipe")]
        getter container_recipe : Types::ContainerRecipe?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @container_recipe : Types::ContainerRecipe? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetDistributionConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the distribution configuration that you want to retrieve.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String

        def initialize(
          @distribution_configuration_arn : String
        )
        end
      end


      struct GetDistributionConfigurationResponse
        include JSON::Serializable

        # The distribution configuration object.

        @[JSON::Field(key: "distributionConfiguration")]
        getter distribution_configuration : Types::DistributionConfiguration?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @distribution_configuration : Types::DistributionConfiguration? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetImagePipelineRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image pipeline that you want to retrieve.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String

        def initialize(
          @image_pipeline_arn : String
        )
        end
      end


      struct GetImagePipelineResponse
        include JSON::Serializable

        # The image pipeline object.

        @[JSON::Field(key: "imagePipeline")]
        getter image_pipeline : Types::ImagePipeline?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_pipeline : Types::ImagePipeline? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetImagePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image whose policy you want to retrieve.

        @[JSON::Field(key: "imageArn")]
        getter image_arn : String

        def initialize(
          @image_arn : String
        )
        end
      end


      struct GetImagePolicyResponse
        include JSON::Serializable

        # The image policy object.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @policy : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetImageRecipePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image recipe whose policy you want to retrieve.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String

        def initialize(
          @image_recipe_arn : String
        )
        end
      end


      struct GetImageRecipePolicyResponse
        include JSON::Serializable

        # The image recipe policy object.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @policy : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetImageRecipeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image recipe that you want to retrieve.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String

        def initialize(
          @image_recipe_arn : String
        )
        end
      end


      struct GetImageRecipeResponse
        include JSON::Serializable

        # The image recipe object.

        @[JSON::Field(key: "imageRecipe")]
        getter image_recipe : Types::ImageRecipe?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_recipe : Types::ImageRecipe? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetImageRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image that you want to get.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String

        def initialize(
          @image_build_version_arn : String
        )
        end
      end


      struct GetImageResponse
        include JSON::Serializable

        # The image object.

        @[JSON::Field(key: "image")]
        getter image : Types::Image?

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image : Types::Image? = nil,
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @request_id : String? = nil
        )
        end
      end

      # GetInfrastructureConfiguration request object.

      struct GetInfrastructureConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the infrastructure configuration that you want to retrieve.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        def initialize(
          @infrastructure_configuration_arn : String
        )
        end
      end

      # GetInfrastructureConfiguration response object.

      struct GetInfrastructureConfigurationResponse
        include JSON::Serializable

        # The infrastructure configuration object.

        @[JSON::Field(key: "infrastructureConfiguration")]
        getter infrastructure_configuration : Types::InfrastructureConfiguration?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @infrastructure_configuration : Types::InfrastructureConfiguration? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct GetLifecycleExecutionRequest
        include JSON::Serializable

        # Use the unique identifier for a runtime instance of the lifecycle policy to get runtime details.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String

        def initialize(
          @lifecycle_execution_id : String
        )
        end
      end


      struct GetLifecycleExecutionResponse
        include JSON::Serializable

        # Runtime details for the specified runtime instance of the lifecycle policy.

        @[JSON::Field(key: "lifecycleExecution")]
        getter lifecycle_execution : Types::LifecycleExecution?

        def initialize(
          @lifecycle_execution : Types::LifecycleExecution? = nil
        )
        end
      end


      struct GetLifecyclePolicyRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the image lifecycle policy resource to get.

        @[JSON::Field(key: "lifecyclePolicyArn")]
        getter lifecycle_policy_arn : String

        def initialize(
          @lifecycle_policy_arn : String
        )
        end
      end


      struct GetLifecyclePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image lifecycle policy resource that was returned.

        @[JSON::Field(key: "lifecyclePolicy")]
        getter lifecycle_policy : Types::LifecyclePolicy?

        def initialize(
          @lifecycle_policy : Types::LifecyclePolicy? = nil
        )
        end
      end


      struct GetMarketplaceResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies an Amazon Web Services Marketplace resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Specifies which type of Amazon Web Services Marketplace resource Image Builder retrieves.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The bucket path that you can specify to download the resource from Amazon S3.

        @[JSON::Field(key: "resourceLocation")]
        getter resource_location : String?

        def initialize(
          @resource_arn : String,
          @resource_type : String,
          @resource_location : String? = nil
        )
        end
      end


      struct GetMarketplaceResourceResponse
        include JSON::Serializable

        # Returns obfuscated data that contains the YAML content of the component.

        @[JSON::Field(key: "data")]
        getter data : String?

        # The Amazon Resource Name (ARN) for the Amazon Web Services Marketplace resource that was requested.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The obfuscated S3 URL to download the component artifact from.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @data : String? = nil,
          @resource_arn : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct GetWorkflowExecutionRequest
        include JSON::Serializable

        # Use the unique identifier for a runtime instance of the workflow to get runtime details.

        @[JSON::Field(key: "workflowExecutionId")]
        getter workflow_execution_id : String

        def initialize(
          @workflow_execution_id : String
        )
        end
      end


      struct GetWorkflowExecutionResponse
        include JSON::Serializable

        # The timestamp when the specified runtime instance of the workflow finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # The Amazon Resource Name (ARN) of the image resource build version that the specified runtime
        # instance of the workflow created.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The output message from the specified runtime instance of the workflow, if applicable.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Test workflows are defined within named runtime groups. The parallel group is a named group that
        # contains one or more test workflows.

        @[JSON::Field(key: "parallelGroup")]
        getter parallel_group : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # The timestamp when the specified runtime instance of the workflow started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # The current runtime status for the specified runtime instance of the workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The total number of steps in the specified runtime instance of the workflow that ran. This number
        # should equal the sum of the step counts for steps that succeeded, were skipped, and failed.

        @[JSON::Field(key: "totalStepCount")]
        getter total_step_count : Int32?

        # A runtime count for the number of steps that failed in the specified runtime instance of the
        # workflow.

        @[JSON::Field(key: "totalStepsFailed")]
        getter total_steps_failed : Int32?

        # A runtime count for the number of steps that were skipped in the specified runtime instance of the
        # workflow.

        @[JSON::Field(key: "totalStepsSkipped")]
        getter total_steps_skipped : Int32?

        # A runtime count for the number of steps that ran successfully in the specified runtime instance of
        # the workflow.

        @[JSON::Field(key: "totalStepsSucceeded")]
        getter total_steps_succeeded : Int32?

        # The type of workflow that Image Builder ran for the specified runtime instance of the workflow.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The Amazon Resource Name (ARN) of the build version for the Image Builder workflow resource that
        # defines the specified runtime instance of the workflow.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String?

        # The unique identifier that Image Builder assigned to keep track of runtime details when it ran the
        # workflow.

        @[JSON::Field(key: "workflowExecutionId")]
        getter workflow_execution_id : String?

        def initialize(
          @end_time : String? = nil,
          @image_build_version_arn : String? = nil,
          @message : String? = nil,
          @parallel_group : String? = nil,
          @request_id : String? = nil,
          @start_time : String? = nil,
          @status : String? = nil,
          @total_step_count : Int32? = nil,
          @total_steps_failed : Int32? = nil,
          @total_steps_skipped : Int32? = nil,
          @total_steps_succeeded : Int32? = nil,
          @type : String? = nil,
          @workflow_build_version_arn : String? = nil,
          @workflow_execution_id : String? = nil
        )
        end
      end


      struct GetWorkflowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow resource that you want to get.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String

        def initialize(
          @workflow_build_version_arn : String
        )
        end
      end


      struct GetWorkflowResponse
        include JSON::Serializable

        # The resource ARNs with different wildcard variations of semantic versioning.

        @[JSON::Field(key: "latestVersionReferences")]
        getter latest_version_references : Types::LatestVersionReferences?

        # The workflow resource specified in the request.

        @[JSON::Field(key: "workflow")]
        getter workflow : Types::Workflow?

        def initialize(
          @latest_version_references : Types::LatestVersionReferences? = nil,
          @workflow : Types::Workflow? = nil
        )
        end
      end


      struct GetWorkflowStepExecutionRequest
        include JSON::Serializable

        # Use the unique identifier for a specific runtime instance of the workflow step to get runtime
        # details for that step.

        @[JSON::Field(key: "stepExecutionId")]
        getter step_execution_id : String

        def initialize(
          @step_execution_id : String
        )
        end
      end


      struct GetWorkflowStepExecutionResponse
        include JSON::Serializable

        # The name of the action that the specified step performs.

        @[JSON::Field(key: "action")]
        getter action : String?

        # Describes the specified workflow step.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the specified runtime instance of the workflow step finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # The Amazon Resource Name (ARN) of the image resource build version that the specified runtime
        # instance of the workflow step creates.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # Input parameters that Image Builder provided for the specified runtime instance of the workflow
        # step.

        @[JSON::Field(key: "inputs")]
        getter inputs : String?

        # The output message from the specified runtime instance of the workflow step, if applicable.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the specified runtime instance of the workflow step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The action to perform if the workflow step fails.

        @[JSON::Field(key: "onFailure")]
        getter on_failure : String?

        # The file names that the specified runtime version of the workflow step created as output.

        @[JSON::Field(key: "outputs")]
        getter outputs : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # Reports on the rollback status of the specified runtime version of the workflow step, if applicable.

        @[JSON::Field(key: "rollbackStatus")]
        getter rollback_status : String?

        # The timestamp when the specified runtime version of the workflow step started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # The current status for the specified runtime version of the workflow step.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique identifier for the runtime version of the workflow step that you specified in the
        # request.

        @[JSON::Field(key: "stepExecutionId")]
        getter step_execution_id : String?

        # The maximum duration in seconds for this step to complete its action.

        @[JSON::Field(key: "timeoutSeconds")]
        getter timeout_seconds : Int32?

        # The Amazon Resource Name (ARN) of the build version for the Image Builder workflow resource that
        # defines this workflow step.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String?

        # The unique identifier that Image Builder assigned to keep track of runtime details when it ran the
        # workflow.

        @[JSON::Field(key: "workflowExecutionId")]
        getter workflow_execution_id : String?

        def initialize(
          @action : String? = nil,
          @description : String? = nil,
          @end_time : String? = nil,
          @image_build_version_arn : String? = nil,
          @inputs : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @on_failure : String? = nil,
          @outputs : String? = nil,
          @request_id : String? = nil,
          @rollback_status : String? = nil,
          @start_time : String? = nil,
          @status : String? = nil,
          @step_execution_id : String? = nil,
          @timeout_seconds : Int32? = nil,
          @workflow_build_version_arn : String? = nil,
          @workflow_execution_id : String? = nil
        )
        end
      end

      # You have specified a client token for an operation using parameter values that differ from a
      # previous request that used the same client token.

      struct IdempotentParameterMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An Image Builder image resource that keeps track of all of the settings used to create, configure,
      # and distribute output for that image. You must specify exactly one recipe for the image – either a
      # container recipe ( containerRecipe ), which creates a container image, or an image recipe (
      # imageRecipe ), which creates an AMI.

      struct Image
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image. Semantic versioning is included in each object's Amazon
        # Resource Name (ARN), at the level that applies to that object as follows: Versionless ARNs and Name
        # ARNs do not include specific values in any of the nodes. The nodes are either left off entirely, or
        # they are specified as wildcards, for example: x.x.x. Version ARNs have only the first three nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt; Build version ARNs have all four nodes, and point to a
        # specific build for a specific version of an object.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Indicates the type of build that created this image. The build can be initiated in the following
        # ways: USER_INITIATED – A manual pipeline build request. SCHEDULED – A pipeline build initiated by a
        # cron expression in the Image Builder pipeline, or from EventBridge. IMPORT – A VM import created the
        # image to use as the base image for the recipe. IMPORT_ISO – An ISO disk import created the image.

        @[JSON::Field(key: "buildType")]
        getter build_type : String?

        # For container images, this is the container recipe that Image Builder used to create the image. For
        # images that distribute an AMI, this is empty.

        @[JSON::Field(key: "containerRecipe")]
        getter container_recipe : Types::ContainerRecipe?

        # The date on which Image Builder created this image.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The time when deprecation occurs for an image resource. This can be a past or future date.

        @[JSON::Field(key: "deprecationTime")]
        getter deprecation_time : Time?

        # The distribution configuration that Image Builder used to create this image.

        @[JSON::Field(key: "distributionConfiguration")]
        getter distribution_configuration : Types::DistributionConfiguration?

        # Indicates whether Image Builder collects additional information about the image, such as the
        # operating system (OS) version and package list.

        @[JSON::Field(key: "enhancedImageMetadataEnabled")]
        getter enhanced_image_metadata_enabled : Bool?

        # The name or Amazon Resource Name (ARN) for the IAM role you create that grants Image Builder access
        # to perform workflow actions.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # For images that distribute an AMI, this is the image recipe that Image Builder used to create the
        # image. For container images, this is empty.

        @[JSON::Field(key: "imageRecipe")]
        getter image_recipe : Types::ImageRecipe?

        # Contains settings for vulnerability scans.

        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The origin of the base image that Image Builder used to build this image.

        @[JSON::Field(key: "imageSource")]
        getter image_source : String?

        # The image tests that ran when that Image Builder created this image.

        @[JSON::Field(key: "imageTestsConfiguration")]
        getter image_tests_configuration : Types::ImageTestsConfiguration?

        # The infrastructure that Image Builder used to create this image.

        @[JSON::Field(key: "infrastructureConfiguration")]
        getter infrastructure_configuration : Types::InfrastructureConfiguration?

        # Identifies the last runtime instance of the lifecycle policy to take action on the image.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String?

        # The logging configuration that's defined for the image. Image Builder uses the defined settings to
        # direct execution log output during image creation.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::ImageLoggingConfiguration?

        # The name of the image.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The operating system version for instances that launch from this image. For example, Amazon Linux 2,
        # Ubuntu 18, or Microsoft Windows Server 2019.

        @[JSON::Field(key: "osVersion")]
        getter os_version : String?

        # The output resources that Image Builder produces for this image.

        @[JSON::Field(key: "outputResources")]
        getter output_resources : Types::OutputResources?

        # The image operating system platform, such as Linux or Windows.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Contains information about the current state of scans for this image.

        @[JSON::Field(key: "scanState")]
        getter scan_state : Types::ImageScanState?

        # The Amazon Resource Name (ARN) of the image pipeline that created this image.

        @[JSON::Field(key: "sourcePipelineArn")]
        getter source_pipeline_arn : String?

        # The name of the image pipeline that created this image.

        @[JSON::Field(key: "sourcePipelineName")]
        getter source_pipeline_name : String?

        # The state of the image.

        @[JSON::Field(key: "state")]
        getter state : Types::ImageState?

        # The tags that apply to this image.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies whether this image produces an AMI or a container image.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The semantic version of the image. The semantic version has four nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
        # and can filter on all of them. Assignment: For the first three nodes you can assign any positive
        # integer value, including zero, with an upper limit of 2^30-1, or 1073741823 for each node. Image
        # Builder automatically assigns the build number to the fourth node. Patterns: You can use any numeric
        # pattern that adheres to the assignment requirements for the nodes that you can assign. For example,
        # you might choose a software version pattern, such as 1.0.0, or a date, such as 2021.01.01.
        # Filtering: With semantic versioning, you have the flexibility to use wildcards (x) to specify the
        # most recent versions or nodes when selecting the base image or components for your recipe. When you
        # use a wildcard in any node, all nodes to the right of the first wildcard must also be wildcards.

        @[JSON::Field(key: "version")]
        getter version : String?

        # Contains the build and test workflows that are associated with the image.

        @[JSON::Field(key: "workflows")]
        getter workflows : Array(Types::WorkflowConfiguration)?

        def initialize(
          @arn : String? = nil,
          @build_type : String? = nil,
          @container_recipe : Types::ContainerRecipe? = nil,
          @date_created : String? = nil,
          @deprecation_time : Time? = nil,
          @distribution_configuration : Types::DistributionConfiguration? = nil,
          @enhanced_image_metadata_enabled : Bool? = nil,
          @execution_role : String? = nil,
          @image_recipe : Types::ImageRecipe? = nil,
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @image_source : String? = nil,
          @image_tests_configuration : Types::ImageTestsConfiguration? = nil,
          @infrastructure_configuration : Types::InfrastructureConfiguration? = nil,
          @lifecycle_execution_id : String? = nil,
          @logging_configuration : Types::ImageLoggingConfiguration? = nil,
          @name : String? = nil,
          @os_version : String? = nil,
          @output_resources : Types::OutputResources? = nil,
          @platform : String? = nil,
          @scan_state : Types::ImageScanState? = nil,
          @source_pipeline_arn : String? = nil,
          @source_pipeline_name : String? = nil,
          @state : Types::ImageState? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil,
          @workflows : Array(Types::WorkflowConfiguration)? = nil
        )
        end
      end

      # Contains vulnerability counts for a specific image.

      struct ImageAggregation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the image for this aggregation.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # Counts by severity level for medium severity and higher level findings, plus a total for all of the
        # findings for the specified image.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @image_build_version_arn : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # The logging configuration that's defined for the image. Image Builder uses the defined settings to
      # direct execution log output during image creation.

      struct ImageLoggingConfiguration
        include JSON::Serializable

        # The log group name that Image Builder uses for image creation. If not specified, the log group name
        # defaults to /aws/imagebuilder/image-name .

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        def initialize(
          @log_group_name : String? = nil
        )
        end
      end

      # A software package that's installed on top of the base image to create a customized image.

      struct ImagePackage
        include JSON::Serializable

        # The name of the package that's reported to the operating system package manager.

        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        # The version of the package that's reported to the operating system package manager.

        @[JSON::Field(key: "packageVersion")]
        getter package_version : String?

        def initialize(
          @package_name : String? = nil,
          @package_version : String? = nil
        )
        end
      end

      # Details of an image pipeline.

      struct ImagePipeline
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image pipeline.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Image Builder tracks the number of consecutive failures for scheduled pipeline executions and takes
        # one of the following actions each time it runs on a schedule: If the pipeline execution is
        # successful, the number of consecutive failures resets to zero. If the pipeline execution fails,
        # Image Builder increments the number of consecutive failures. If the failure count exceeds the limit
        # defined in the AutoDisablePolicy , Image Builder disables the pipeline. The consecutive failure
        # count is also reset to zero under the following conditions: The pipeline runs manually and succeeds.
        # The pipeline configuration is updated. If the pipeline runs manually and fails, the count remains
        # the same. The next scheduled run continues to increment where it left off before.

        @[JSON::Field(key: "consecutiveFailures")]
        getter consecutive_failures : Int32?

        # The Amazon Resource Name (ARN) of the container recipe that is used for this pipeline.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String?

        # The date on which this image pipeline was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # This is no longer supported, and does not return a value.

        @[JSON::Field(key: "dateLastRun")]
        getter date_last_run : String?

        # The next date when the pipeline is scheduled to run.

        @[JSON::Field(key: "dateNextRun")]
        getter date_next_run : String?

        # The date on which this image pipeline was last updated.

        @[JSON::Field(key: "dateUpdated")]
        getter date_updated : String?

        # The description of the image pipeline.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the distribution configuration associated with this image
        # pipeline.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String?

        # Collects additional information about the image being created, including the operating system (OS)
        # version and package list. This information is used to enhance the overall experience of using EC2
        # Image Builder. Enabled by default.

        @[JSON::Field(key: "enhancedImageMetadataEnabled")]
        getter enhanced_image_metadata_enabled : Bool?

        # The name or Amazon Resource Name (ARN) for the IAM role you create that grants Image Builder access
        # to perform workflow actions.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # The Amazon Resource Name (ARN) of the image recipe associated with this image pipeline.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String?

        # Contains settings for vulnerability scans.

        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The image tests configuration of the image pipeline.

        @[JSON::Field(key: "imageTestsConfiguration")]
        getter image_tests_configuration : Types::ImageTestsConfiguration?

        # The Amazon Resource Name (ARN) of the infrastructure configuration associated with this image
        # pipeline.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String?

        # The status of the last image that this pipeline built, such as BUILDING , TESTING , FAILED , or
        # AVAILABLE .

        @[JSON::Field(key: "lastRunStatus")]
        getter last_run_status : String?

        # Defines logging configuration for the output image.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::PipelineLoggingConfiguration?

        # The name of the image pipeline.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The platform of the image pipeline.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The schedule of the image pipeline.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The status of the image pipeline.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags of this image pipeline.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Contains the workflows that run for the image pipeline.

        @[JSON::Field(key: "workflows")]
        getter workflows : Array(Types::WorkflowConfiguration)?

        def initialize(
          @arn : String? = nil,
          @consecutive_failures : Int32? = nil,
          @container_recipe_arn : String? = nil,
          @date_created : String? = nil,
          @date_last_run : String? = nil,
          @date_next_run : String? = nil,
          @date_updated : String? = nil,
          @description : String? = nil,
          @distribution_configuration_arn : String? = nil,
          @enhanced_image_metadata_enabled : Bool? = nil,
          @execution_role : String? = nil,
          @image_recipe_arn : String? = nil,
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @image_tests_configuration : Types::ImageTestsConfiguration? = nil,
          @infrastructure_configuration_arn : String? = nil,
          @last_run_status : String? = nil,
          @logging_configuration : Types::PipelineLoggingConfiguration? = nil,
          @name : String? = nil,
          @platform : String? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflows : Array(Types::WorkflowConfiguration)? = nil
        )
        end
      end

      # Contains vulnerability counts for a specific image pipeline.

      struct ImagePipelineAggregation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the image pipeline for this aggregation.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String?

        # Counts by severity level for medium severity and higher level findings, plus a total for all of the
        # findings for the specified image pipeline.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @image_pipeline_arn : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # An image recipe.

      struct ImageRecipe
        include JSON::Serializable

        # Before you create a new AMI, Image Builder launches temporary Amazon EC2 instances to build and test
        # your image configuration. Instance configuration adds a layer of control over those instances. You
        # can define settings and add scripts to run when an instance is launched from your AMI.

        @[JSON::Field(key: "additionalInstanceConfiguration")]
        getter additional_instance_configuration : Types::AdditionalInstanceConfiguration?

        # Tags that are applied to the AMI that Image Builder creates during the Build phase prior to image
        # distribution.

        @[JSON::Field(key: "amiTags")]
        getter ami_tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the image recipe.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The block device mappings to apply when creating images from this recipe.

        @[JSON::Field(key: "blockDeviceMappings")]
        getter block_device_mappings : Array(Types::InstanceBlockDeviceMapping)?

        # The components that are included in the image recipe. Recipes require a minimum of one build
        # component, and can have a maximum of 20 build and test components in any combination.

        @[JSON::Field(key: "components")]
        getter components : Array(Types::ComponentConfiguration)?

        # The date on which this image recipe was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The description of the image recipe.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the image recipe.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the image recipe.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The base image for customizations specified in the image recipe. You can specify the parent image
        # using one of the following options: AMI ID Image Builder image Amazon Resource Name (ARN) Amazon Web
        # Services Systems Manager (SSM) Parameter Store Parameter, prefixed by ssm: , followed by the
        # parameter name or ARN. Amazon Web Services Marketplace product ID

        @[JSON::Field(key: "parentImage")]
        getter parent_image : String?

        # The platform of the image recipe.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The tags of the image recipe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies which type of image is created by the recipe - an AMI or a container image.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The version of the image recipe.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The working directory to be used during build and test workflows.

        @[JSON::Field(key: "workingDirectory")]
        getter working_directory : String?

        def initialize(
          @additional_instance_configuration : Types::AdditionalInstanceConfiguration? = nil,
          @ami_tags : Hash(String, String)? = nil,
          @arn : String? = nil,
          @block_device_mappings : Array(Types::InstanceBlockDeviceMapping)? = nil,
          @components : Array(Types::ComponentConfiguration)? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parent_image : String? = nil,
          @platform : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil,
          @working_directory : String? = nil
        )
        end
      end

      # A summary of an image recipe.

      struct ImageRecipeSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image recipe.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date on which this image recipe was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The name of the image recipe.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the image recipe.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The base image of the image recipe.

        @[JSON::Field(key: "parentImage")]
        getter parent_image : String?

        # The platform of the image recipe.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The tags of the image recipe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @date_created : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parent_image : String? = nil,
          @platform : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains details about a vulnerability scan finding.

      struct ImageScanFinding
        include JSON::Serializable

        # The Amazon Web Services account ID that's associated with the finding.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The description of the finding.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time when the finding was first observed.

        @[JSON::Field(key: "firstObservedAt")]
        getter first_observed_at : Time?

        # Details about whether a fix is available for any of the packages that are identified in the finding
        # through a version update.

        @[JSON::Field(key: "fixAvailable")]
        getter fix_available : String?

        # The Amazon Resource Name (ARN) of the image build version that's associated with the finding.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The Amazon Resource Name (ARN) of the image pipeline that's associated with the finding.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String?

        # The score that Amazon Inspector assigned for the finding.

        @[JSON::Field(key: "inspectorScore")]
        getter inspector_score : Float64?

        # An object that contains details of the Amazon Inspector score.

        @[JSON::Field(key: "inspectorScoreDetails")]
        getter inspector_score_details : Types::InspectorScoreDetails?

        # An object that contains the details of a package vulnerability finding.

        @[JSON::Field(key: "packageVulnerabilityDetails")]
        getter package_vulnerability_details : Types::PackageVulnerabilityDetails?

        # An object that contains the details about how to remediate the finding.

        @[JSON::Field(key: "remediation")]
        getter remediation : Types::Remediation?

        # The severity of the finding.

        @[JSON::Field(key: "severity")]
        getter severity : String?

        # The title of the finding.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The type of the finding. Image Builder looks for findings of the type PACKAGE_VULNERABILITY that
        # apply to output images, and excludes other types.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The timestamp when the finding was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @aws_account_id : String? = nil,
          @description : String? = nil,
          @first_observed_at : Time? = nil,
          @fix_available : String? = nil,
          @image_build_version_arn : String? = nil,
          @image_pipeline_arn : String? = nil,
          @inspector_score : Float64? = nil,
          @inspector_score_details : Types::InspectorScoreDetails? = nil,
          @package_vulnerability_details : Types::PackageVulnerabilityDetails? = nil,
          @remediation : Types::Remediation? = nil,
          @severity : String? = nil,
          @title : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # This returns exactly one type of aggregation, based on the filter that Image Builder applies in its
      # API action.

      struct ImageScanFindingAggregation
        include JSON::Serializable

        # Returns an object that contains severity counts based on an account ID.

        @[JSON::Field(key: "accountAggregation")]
        getter account_aggregation : Types::AccountAggregation?

        # Returns an object that contains severity counts based on the Amazon Resource Name (ARN) for a
        # specific image.

        @[JSON::Field(key: "imageAggregation")]
        getter image_aggregation : Types::ImageAggregation?

        # Returns an object that contains severity counts based on an image pipeline ARN.

        @[JSON::Field(key: "imagePipelineAggregation")]
        getter image_pipeline_aggregation : Types::ImagePipelineAggregation?

        # Returns an object that contains severity counts based on vulnerability ID.

        @[JSON::Field(key: "vulnerabilityIdAggregation")]
        getter vulnerability_id_aggregation : Types::VulnerabilityIdAggregation?

        def initialize(
          @account_aggregation : Types::AccountAggregation? = nil,
          @image_aggregation : Types::ImageAggregation? = nil,
          @image_pipeline_aggregation : Types::ImagePipelineAggregation? = nil,
          @vulnerability_id_aggregation : Types::VulnerabilityIdAggregation? = nil
        )
        end
      end

      # A name value pair that Image Builder applies to streamline results from the vulnerability scan
      # findings list action.

      struct ImageScanFindingsFilter
        include JSON::Serializable

        # The name of the image scan finding filter. Filter names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter values. Filter values are case-sensitive.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Shows the vulnerability scan status for a specific image, and the reason for that status.

      struct ImageScanState
        include JSON::Serializable

        # The reason for the scan status for the image.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The current state of vulnerability scans for the image.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains settings for Image Builder image resource and container image scans.

      struct ImageScanningConfiguration
        include JSON::Serializable

        # Contains Amazon ECR settings for vulnerability scans.

        @[JSON::Field(key: "ecrConfiguration")]
        getter ecr_configuration : Types::EcrConfiguration?

        # A setting that indicates whether Image Builder keeps a snapshot of the vulnerability scans that
        # Amazon Inspector runs against the build instance when you create a new image.

        @[JSON::Field(key: "imageScanningEnabled")]
        getter image_scanning_enabled : Bool?

        def initialize(
          @ecr_configuration : Types::EcrConfiguration? = nil,
          @image_scanning_enabled : Bool? = nil
        )
        end
      end

      # Image status and the reason for that status.

      struct ImageState
        include JSON::Serializable

        # The reason for the status of the image.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The status of the image.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An image summary.

      struct ImageSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Indicates the type of build that created this image. The build can be initiated in the following
        # ways: USER_INITIATED – A manual pipeline build request. SCHEDULED – A pipeline build initiated by a
        # cron expression in the Image Builder pipeline, or from EventBridge. IMPORT – A VM import created the
        # image to use as the base image for the recipe. IMPORT_ISO – An ISO disk import created the image.

        @[JSON::Field(key: "buildType")]
        getter build_type : String?

        # The date on which Image Builder created this image.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The time when deprecation occurs for an image resource. This can be a past or future date.

        @[JSON::Field(key: "deprecationTime")]
        getter deprecation_time : Time?

        # The origin of the base image that Image Builder used to build this image.

        @[JSON::Field(key: "imageSource")]
        getter image_source : String?

        # Identifies the last runtime instance of the lifecycle policy to take action on the image.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String?

        # The logging configuration that's defined for the image.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::ImageLoggingConfiguration?

        # The name of the image.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The operating system version of the instances that launch from this image. For example, Amazon Linux
        # 2, Ubuntu 18, or Microsoft Windows Server 2019.

        @[JSON::Field(key: "osVersion")]
        getter os_version : String?

        # The output resources that Image Builder produced when it created this image.

        @[JSON::Field(key: "outputResources")]
        getter output_resources : Types::OutputResources?

        # The owner of the image.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The image operating system platform, such as Linux or Windows.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The state of the image.

        @[JSON::Field(key: "state")]
        getter state : Types::ImageState?

        # The tags that apply to this image.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies whether this image produces an AMI or a container image.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The version of the image.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @build_type : String? = nil,
          @date_created : String? = nil,
          @deprecation_time : Time? = nil,
          @image_source : String? = nil,
          @lifecycle_execution_id : String? = nil,
          @logging_configuration : Types::ImageLoggingConfiguration? = nil,
          @name : String? = nil,
          @os_version : String? = nil,
          @output_resources : Types::OutputResources? = nil,
          @owner : String? = nil,
          @platform : String? = nil,
          @state : Types::ImageState? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Configure image tests for your pipeline build. Tests run after building the image, to verify that
      # the AMI or container image is valid before distributing it.

      struct ImageTestsConfiguration
        include JSON::Serializable

        # Determines if tests should run after building the image. Image Builder defaults to enable tests to
        # run following the image build, before image distribution.

        @[JSON::Field(key: "imageTestsEnabled")]
        getter image_tests_enabled : Bool?

        # The maximum time in minutes that tests are permitted to run. The timeout property is not currently
        # active. This value is ignored.

        @[JSON::Field(key: "timeoutMinutes")]
        getter timeout_minutes : Int32?

        def initialize(
          @image_tests_enabled : Bool? = nil,
          @timeout_minutes : Int32? = nil
        )
        end
      end

      # The defining characteristics of a specific version of an Image Builder image.

      struct ImageVersion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a specific version of an Image Builder image. Semantic versioning
        # is included in each object's Amazon Resource Name (ARN), at the level that applies to that object as
        # follows: Versionless ARNs and Name ARNs do not include specific values in any of the nodes. The
        # nodes are either left off entirely, or they are specified as wildcards, for example: x.x.x. Version
        # ARNs have only the first three nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt; Build version ARNs
        # have all four nodes, and point to a specific build for a specific version of an object.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Indicates the type of build that created this image. The build can be initiated in the following
        # ways: USER_INITIATED – A manual pipeline build request. SCHEDULED – A pipeline build initiated by a
        # cron expression in the Image Builder pipeline, or from EventBridge. IMPORT – A VM import created the
        # image to use as the base image for the recipe. IMPORT_ISO – An ISO disk import created the image.

        @[JSON::Field(key: "buildType")]
        getter build_type : String?

        # The date on which this specific version of the Image Builder image was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The origin of the base image that Image Builder used to build this image.

        @[JSON::Field(key: "imageSource")]
        getter image_source : String?

        # The name of this specific version of an Image Builder image.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The operating system version of the Amazon EC2 build instance. For example, Amazon Linux 2, Ubuntu
        # 18, or Microsoft Windows Server 2019.

        @[JSON::Field(key: "osVersion")]
        getter os_version : String?

        # The owner of the image version.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The operating system platform of the image version, for example "Windows" or "Linux".

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Specifies whether this image produces an AMI or a container image.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Details for a specific version of an Image Builder image. This version follows the semantic version
        # syntax. The semantic version has four nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
        # and can filter on all of them. Assignment: For the first three nodes you can assign any positive
        # integer value, including zero, with an upper limit of 2^30-1, or 1073741823 for each node. Image
        # Builder automatically assigns the build number to the fourth node. Patterns: You can use any numeric
        # pattern that adheres to the assignment requirements for the nodes that you can assign. For example,
        # you might choose a software version pattern, such as 1.0.0, or a date, such as 2021.01.01.
        # Filtering: With semantic versioning, you have the flexibility to use wildcards (x) to specify the
        # most recent versions or nodes when selecting the base image or components for your recipe. When you
        # use a wildcard in any node, all nodes to the right of the first wildcard must also be wildcards.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @build_type : String? = nil,
          @date_created : String? = nil,
          @image_source : String? = nil,
          @name : String? = nil,
          @os_version : String? = nil,
          @owner : String? = nil,
          @platform : String? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct ImportComponentRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The format of the resource that you want to import as a component.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the component.

        @[JSON::Field(key: "name")]
        getter name : String

        # The platform of the component.

        @[JSON::Field(key: "platform")]
        getter platform : String

        # The semantic version of the component. This version follows the semantic version syntax. The
        # semantic version has four nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can
        # assign values for the first three, and can filter on all of them. Filtering: With semantic
        # versioning, you have the flexibility to use wildcards (x) to specify the most recent versions or
        # nodes when selecting the base image or components for your recipe. When you use a wildcard in any
        # node, all nodes to the right of the first wildcard must also be wildcards.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # The type of the component denotes whether the component is used to build the image, or only to test
        # it.

        @[JSON::Field(key: "type")]
        getter type : String

        # The change description of the component. This description indicates the change that has been made in
        # this version, or what makes this version different from other versions of the component.

        @[JSON::Field(key: "changeDescription")]
        getter change_description : String?

        # The data of the component. Used to specify the data inline. Either data or uri can be used to
        # specify the data within the component.

        @[JSON::Field(key: "data")]
        getter data : String?

        # The description of the component. Describes the contents of the component.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) that uniquely identifies the KMS key used to encrypt this component.
        # This can be either the Key ARN or the Alias ARN. For more information, see Key identifiers (KeyId)
        # in the Key Management Service Developer Guide .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The tags of the component.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The uri of the component. Must be an Amazon S3 URL and the requester must have permission to access
        # the Amazon S3 bucket. If you use Amazon S3, you can specify component content up to your service
        # quota. Either data or uri can be used to specify the data within the component.

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @client_token : String,
          @format : String,
          @name : String,
          @platform : String,
          @semantic_version : String,
          @type : String,
          @change_description : String? = nil,
          @data : String? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uri : String? = nil
        )
        end
      end


      struct ImportComponentResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the imported component.

        @[JSON::Field(key: "componentBuildVersionArn")]
        getter component_build_version_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @component_build_version_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ImportDiskImageRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the infrastructure configuration resource that's used for
        # launching the EC2 instance on which the ISO image is built.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        # The name of the image resource that's created from the import.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operating system version for the imported image. Allowed values include the following: Microsoft
        # Windows 11 .

        @[JSON::Field(key: "osVersion")]
        getter os_version : String

        # The operating system platform for the imported image. Allowed values include the following: Windows
        # .

        @[JSON::Field(key: "platform")]
        getter platform : String

        # The semantic version to attach to the image that's created during the import process. This version
        # follows the semantic version syntax.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # The uri of the ISO disk file that's stored in Amazon S3.

        @[JSON::Field(key: "uri")]
        getter uri : String

        # The description for your disk image import.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name or Amazon Resource Name (ARN) for the IAM role you create that grants Image Builder access
        # to perform workflow actions to import an image from a Microsoft ISO file.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # Define logging configuration for the image build process.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::ImageLoggingConfiguration?

        # Tags that are attached to image resources created from the import.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @infrastructure_configuration_arn : String,
          @name : String,
          @os_version : String,
          @platform : String,
          @semantic_version : String,
          @uri : String,
          @description : String? = nil,
          @execution_role : String? = nil,
          @logging_configuration : Types::ImageLoggingConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ImportDiskImageResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the output AMI that was created from the ISO disk file.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        def initialize(
          @client_token : String? = nil,
          @image_build_version_arn : String? = nil
        )
        end
      end


      struct ImportVmImageRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the base image that is created by the import process.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operating system platform for the imported VM.

        @[JSON::Field(key: "platform")]
        getter platform : String

        # The semantic version to attach to the base image that was created during the import process. This
        # version follows the semantic version syntax. The semantic version has four nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
        # and can filter on all of them. Assignment: For the first three nodes you can assign any positive
        # integer value, including zero, with an upper limit of 2^30-1, or 1073741823 for each node. Image
        # Builder automatically assigns the build number to the fourth node. Patterns: You can use any numeric
        # pattern that adheres to the assignment requirements for the nodes that you can assign. For example,
        # you might choose a software version pattern, such as 1.0.0, or a date, such as 2021.01.01.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # The importTaskId (API) or ImportTaskId (CLI) from the Amazon EC2 VM import process. Image Builder
        # retrieves information from the import process to pull in the AMI that is created from the VM source
        # as the base image for your recipe.

        @[JSON::Field(key: "vmImportTaskId")]
        getter vm_import_task_id : String

        # The description for the base image that is created by the import process.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Define logging configuration for the image build process.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::ImageLoggingConfiguration?

        # The operating system version for the imported VM.

        @[JSON::Field(key: "osVersion")]
        getter os_version : String?

        # Tags that are attached to the import resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @name : String,
          @platform : String,
          @semantic_version : String,
          @vm_import_task_id : String,
          @description : String? = nil,
          @logging_configuration : Types::ImageLoggingConfiguration? = nil,
          @os_version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ImportVmImageResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the AMI that was created during the VM import process. This AMI is
        # used as the base image for the recipe that imported the VM.

        @[JSON::Field(key: "imageArn")]
        getter image_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Details of the infrastructure configuration.

      struct InfrastructureConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the infrastructure configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date on which the infrastructure configuration was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The date on which the infrastructure configuration was last updated.

        @[JSON::Field(key: "dateUpdated")]
        getter date_updated : String?

        # The description of the infrastructure configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The instance metadata option settings for the infrastructure configuration.

        @[JSON::Field(key: "instanceMetadataOptions")]
        getter instance_metadata_options : Types::InstanceMetadataOptions?

        # The instance profile of the infrastructure configuration.

        @[JSON::Field(key: "instanceProfileName")]
        getter instance_profile_name : String?

        # The instance types of the infrastructure configuration.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The Amazon EC2 key pair of the infrastructure configuration.

        @[JSON::Field(key: "keyPair")]
        getter key_pair : String?

        # The logging configuration of the infrastructure configuration.

        @[JSON::Field(key: "logging")]
        getter logging : Types::Logging?

        # The name of the infrastructure configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The instance placement settings that define where the instances that are launched from your image
        # will run.

        @[JSON::Field(key: "placement")]
        getter placement : Types::Placement?

        # The tags attached to the resource created by Image Builder.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The security group IDs of the infrastructure configuration.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The Amazon Resource Name (ARN) for the SNS topic to which we send image build event notifications.
        # EC2 Image Builder is unable to send notifications to SNS topics that are encrypted using keys from
        # other accounts. The key that is used to encrypt the SNS topic must reside in the account that the
        # Image Builder service runs under.

        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String?

        # The subnet ID of the infrastructure configuration.

        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The tags of the infrastructure configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The terminate instance on failure configuration of the infrastructure configuration.

        @[JSON::Field(key: "terminateInstanceOnFailure")]
        getter terminate_instance_on_failure : Bool?

        def initialize(
          @arn : String? = nil,
          @date_created : String? = nil,
          @date_updated : String? = nil,
          @description : String? = nil,
          @instance_metadata_options : Types::InstanceMetadataOptions? = nil,
          @instance_profile_name : String? = nil,
          @instance_types : Array(String)? = nil,
          @key_pair : String? = nil,
          @logging : Types::Logging? = nil,
          @name : String? = nil,
          @placement : Types::Placement? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @sns_topic_arn : String? = nil,
          @subnet_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @terminate_instance_on_failure : Bool? = nil
        )
        end
      end

      # The infrastructure used when building Amazon EC2 AMIs.

      struct InfrastructureConfigurationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the infrastructure configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date on which the infrastructure configuration was created.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The date on which the infrastructure configuration was last updated.

        @[JSON::Field(key: "dateUpdated")]
        getter date_updated : String?

        # The description of the infrastructure configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The instance profile of the infrastructure configuration.

        @[JSON::Field(key: "instanceProfileName")]
        getter instance_profile_name : String?

        # The instance types of the infrastructure configuration.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The name of the infrastructure configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The instance placement settings that define where the instances that are launched from your image
        # will run.

        @[JSON::Field(key: "placement")]
        getter placement : Types::Placement?

        # The tags attached to the image created by Image Builder.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The tags of the infrastructure configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @date_created : String? = nil,
          @date_updated : String? = nil,
          @description : String? = nil,
          @instance_profile_name : String? = nil,
          @instance_types : Array(String)? = nil,
          @name : String? = nil,
          @placement : Types::Placement? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about the factors that influenced the score that Amazon Inspector assigned for a
      # finding.

      struct InspectorScoreDetails
        include JSON::Serializable

        # An object that contains details about an adjustment that Amazon Inspector made to the CVSS score for
        # the finding.

        @[JSON::Field(key: "adjustedCvss")]
        getter adjusted_cvss : Types::CvssScoreDetails?

        def initialize(
          @adjusted_cvss : Types::CvssScoreDetails? = nil
        )
        end
      end

      # Defines block device mappings for the instance used to configure your image.

      struct InstanceBlockDeviceMapping
        include JSON::Serializable

        # The device to which these mappings apply.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # Use to manage Amazon EBS-specific configuration for this mapping.

        @[JSON::Field(key: "ebs")]
        getter ebs : Types::EbsInstanceBlockDeviceSpecification?

        # Use to remove a mapping from the base image.

        @[JSON::Field(key: "noDevice")]
        getter no_device : String?

        # Use to manage instance ephemeral devices.

        @[JSON::Field(key: "virtualName")]
        getter virtual_name : String?

        def initialize(
          @device_name : String? = nil,
          @ebs : Types::EbsInstanceBlockDeviceSpecification? = nil,
          @no_device : String? = nil,
          @virtual_name : String? = nil
        )
        end
      end

      # Defines a custom base AMI and block device mapping configurations of an instance used for building
      # and testing container images.

      struct InstanceConfiguration
        include JSON::Serializable

        # Defines the block devices to attach for building an instance from this Image Builder AMI.

        @[JSON::Field(key: "blockDeviceMappings")]
        getter block_device_mappings : Array(Types::InstanceBlockDeviceMapping)?

        # The base image for a container build and test instance. This can contain an AMI ID or it can specify
        # an Amazon Web Services Systems Manager (SSM) Parameter Store Parameter, prefixed by ssm: , followed
        # by the parameter name or ARN. If not specified, Image Builder uses the appropriate ECS-optimized AMI
        # as a base image.

        @[JSON::Field(key: "image")]
        getter image : String?

        def initialize(
          @block_device_mappings : Array(Types::InstanceBlockDeviceMapping)? = nil,
          @image : String? = nil
        )
        end
      end

      # The instance metadata options that apply to the HTTP requests that pipeline builds use to launch EC2
      # build and test instances. For more information about instance metadata options, see Configure the
      # instance metadata options in the Amazon EC2 User Guide for Linux instances, or Configure the
      # instance metadata options in the Amazon EC2 Windows Guide for Windows instances.

      struct InstanceMetadataOptions
        include JSON::Serializable

        # Limit the number of hops that an instance metadata request can traverse to reach its destination.
        # The default is one hop. However, if HTTP tokens are required, container image builds need a minimum
        # of two hops.

        @[JSON::Field(key: "httpPutResponseHopLimit")]
        getter http_put_response_hop_limit : Int32?

        # Indicates whether a signed token header is required for instance metadata retrieval requests. The
        # values affect the response as follows: required – When you retrieve the IAM role credentials,
        # version 2.0 credentials are returned in all cases. optional – You can include a signed token header
        # in your request to retrieve instance metadata, or you can leave it out. If you include it, version
        # 2.0 credentials are returned for the IAM role. Otherwise, version 1.0 credentials are returned. The
        # default setting is optional .

        @[JSON::Field(key: "httpTokens")]
        getter http_tokens : String?

        def initialize(
          @http_put_response_hop_limit : Int32? = nil,
          @http_tokens : String? = nil
        )
        end
      end

      # You have provided an invalid pagination token in your request.

      struct InvalidPaginationTokenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have specified two or more mutually exclusive parameters. Review the error message for details.

      struct InvalidParameterCombinationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified parameter is invalid. Review the available parameters for the API request.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value that you provided for the specified parameter is invalid.

      struct InvalidParameterValueException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have requested an action that that the service doesn't support.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your version number is out of bounds or does not follow the required syntax.

      struct InvalidVersionNumberException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource ARNs with different wildcard variations of semantic versioning.

      struct LatestVersionReferences
        include JSON::Serializable

        # The latest version Amazon Resource Name (ARN) with the same major version of the Image Builder
        # resource.

        @[JSON::Field(key: "latestMajorVersionArn")]
        getter latest_major_version_arn : String?

        # The latest version Amazon Resource Name (ARN) with the same minor version of the Image Builder
        # resource.

        @[JSON::Field(key: "latestMinorVersionArn")]
        getter latest_minor_version_arn : String?

        # The latest version Amazon Resource Name (ARN) with the same patch version of the Image Builder
        # resource.

        @[JSON::Field(key: "latestPatchVersionArn")]
        getter latest_patch_version_arn : String?

        # The latest version Amazon Resource Name (ARN) of the Image Builder resource.

        @[JSON::Field(key: "latestVersionArn")]
        getter latest_version_arn : String?

        def initialize(
          @latest_major_version_arn : String? = nil,
          @latest_minor_version_arn : String? = nil,
          @latest_patch_version_arn : String? = nil,
          @latest_version_arn : String? = nil
        )
        end
      end

      # Describes the configuration for a launch permission. The launch permission modification request is
      # sent to the Amazon EC2 ModifyImageAttribute API on behalf of the user for each Region they have
      # selected to distribute the AMI. To make an AMI public, set the launch permission authorized accounts
      # to all . See the examples for making an AMI public at Amazon EC2 ModifyImageAttribute .

      struct LaunchPermissionConfiguration
        include JSON::Serializable

        # The ARN for an Amazon Web Services Organization that you want to share your AMI with. For more
        # information, see What is Organizations? .

        @[JSON::Field(key: "organizationArns")]
        getter organization_arns : Array(String)?

        # The ARN for an Organizations organizational unit (OU) that you want to share your AMI with. For more
        # information about key concepts for Organizations, see Organizations terminology and concepts .

        @[JSON::Field(key: "organizationalUnitArns")]
        getter organizational_unit_arns : Array(String)?

        # The name of the group.

        @[JSON::Field(key: "userGroups")]
        getter user_groups : Array(String)?

        # The Amazon Web Services account ID.

        @[JSON::Field(key: "userIds")]
        getter user_ids : Array(String)?

        def initialize(
          @organization_arns : Array(String)? = nil,
          @organizational_unit_arns : Array(String)? = nil,
          @user_groups : Array(String)? = nil,
          @user_ids : Array(String)? = nil
        )
        end
      end

      # Identifies an Amazon EC2 launch template to use for a specific account.

      struct LaunchTemplateConfiguration
        include JSON::Serializable

        # Identifies the Amazon EC2 launch template to use.

        @[JSON::Field(key: "launchTemplateId")]
        getter launch_template_id : String

        # The account ID that this configuration applies to.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Set the specified Amazon EC2 launch template as the default launch template for the specified
        # account.

        @[JSON::Field(key: "setDefaultVersion")]
        getter set_default_version : Bool?

        def initialize(
          @launch_template_id : String,
          @account_id : String? = nil,
          @set_default_version : Bool? = nil
        )
        end
      end

      # Contains metadata from a runtime instance of a lifecycle policy.

      struct LifecycleExecution
        include JSON::Serializable

        # The timestamp when the lifecycle runtime instance completed.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Identifies the lifecycle policy runtime instance.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String?

        # The Amazon Resource Name (ARN) of the lifecycle policy that ran.

        @[JSON::Field(key: "lifecyclePolicyArn")]
        getter lifecycle_policy_arn : String?

        # Contains information about associated resources that are identified for action by the runtime
        # instance of the lifecycle policy.

        @[JSON::Field(key: "resourcesImpactedSummary")]
        getter resources_impacted_summary : Types::LifecycleExecutionResourcesImpactedSummary?

        # The timestamp when the lifecycle runtime instance started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Runtime state that reports if the policy action ran successfully, failed, or was skipped.

        @[JSON::Field(key: "state")]
        getter state : Types::LifecycleExecutionState?

        def initialize(
          @end_time : Time? = nil,
          @lifecycle_execution_id : String? = nil,
          @lifecycle_policy_arn : String? = nil,
          @resources_impacted_summary : Types::LifecycleExecutionResourcesImpactedSummary? = nil,
          @start_time : Time? = nil,
          @state : Types::LifecycleExecutionState? = nil
        )
        end
      end

      # Contains details for a resource that the runtime instance of the lifecycle policy identified for
      # action.

      struct LifecycleExecutionResource
        include JSON::Serializable

        # The account that owns the impacted resource.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The action to take for the identified resource.

        @[JSON::Field(key: "action")]
        getter action : Types::LifecycleExecutionResourceAction?

        # The ending timestamp from the lifecycle action that was applied to the resource.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # For an impacted container image, this identifies a list of URIs for associated container images
        # distributed to ECR repositories.

        @[JSON::Field(key: "imageUris")]
        getter image_uris : Array(String)?

        # The Amazon Web Services Region where the lifecycle execution resource is stored.

        @[JSON::Field(key: "region")]
        getter region : String?

        # Identifies the impacted resource. The resource ID depends on the type of resource, as follows. Image
        # Builder image resources: Amazon Resource Name (ARN) Distributed AMIs: AMI ID Container images
        # distributed to an ECR repository: image URI or SHA Digest

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # A list of associated resource snapshots for the impacted resource if it’s an AMI.

        @[JSON::Field(key: "snapshots")]
        getter snapshots : Array(Types::LifecycleExecutionSnapshotResource)?

        # The starting timestamp from the lifecycle action that was applied to the resource.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The runtime state for the lifecycle execution.

        @[JSON::Field(key: "state")]
        getter state : Types::LifecycleExecutionResourceState?

        def initialize(
          @account_id : String? = nil,
          @action : Types::LifecycleExecutionResourceAction? = nil,
          @end_time : Time? = nil,
          @image_uris : Array(String)? = nil,
          @region : String? = nil,
          @resource_id : String? = nil,
          @snapshots : Array(Types::LifecycleExecutionSnapshotResource)? = nil,
          @start_time : Time? = nil,
          @state : Types::LifecycleExecutionResourceState? = nil
        )
        end
      end

      # The lifecycle policy action that was identified for the impacted resource.

      struct LifecycleExecutionResourceAction
        include JSON::Serializable

        # The name of the resource that was identified for a lifecycle policy action.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The reason why the lifecycle policy action is taken.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @name : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains the state of an impacted resource that the runtime instance of the lifecycle policy
      # identified for action.

      struct LifecycleExecutionResourceState
        include JSON::Serializable

        # Messaging that clarifies the reason for the assigned status.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The runtime status of the lifecycle action taken for the impacted resource.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains details for an image resource that was identified for a lifecycle action.

      struct LifecycleExecutionResourcesImpactedSummary
        include JSON::Serializable

        # Indicates whether an image resource that was identified for a lifecycle action has associated
        # resources that are also impacted.

        @[JSON::Field(key: "hasImpactedResources")]
        getter has_impacted_resources : Bool?

        def initialize(
          @has_impacted_resources : Bool? = nil
        )
        end
      end

      # Contains the state of an impacted snapshot resource that the runtime instance of the lifecycle
      # policy identified for action.

      struct LifecycleExecutionSnapshotResource
        include JSON::Serializable

        # Identifies the impacted snapshot resource.

        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String?

        # The runtime status of the lifecycle action taken for the snapshot.

        @[JSON::Field(key: "state")]
        getter state : Types::LifecycleExecutionResourceState?

        def initialize(
          @snapshot_id : String? = nil,
          @state : Types::LifecycleExecutionResourceState? = nil
        )
        end
      end

      # The current state of the runtime instance of the lifecycle policy.

      struct LifecycleExecutionState
        include JSON::Serializable

        # The reason for the current status.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The runtime status of the lifecycle execution.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration details for a lifecycle policy resource.

      struct LifecyclePolicy
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the lifecycle policy resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when Image Builder created the lifecycle policy resource.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : Time?

        # The timestamp for the last time Image Builder ran the lifecycle policy.

        @[JSON::Field(key: "dateLastRun")]
        getter date_last_run : Time?

        # The timestamp when Image Builder updated the lifecycle policy resource.

        @[JSON::Field(key: "dateUpdated")]
        getter date_updated : Time?

        # Optional description for the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name or Amazon Resource Name (ARN) of the IAM role that Image Builder uses to run the lifecycle
        # policy. This is a custom role that you create.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # The name of the lifecycle policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The configuration details for a lifecycle policy resource.

        @[JSON::Field(key: "policyDetails")]
        getter policy_details : Array(Types::LifecyclePolicyDetail)?

        # Resource selection criteria used to run the lifecycle policy.

        @[JSON::Field(key: "resourceSelection")]
        getter resource_selection : Types::LifecyclePolicyResourceSelection?

        # The type of resources the lifecycle policy targets.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Indicates whether the lifecycle policy resource is enabled.

        @[JSON::Field(key: "status")]
        getter status : String?

        # To help manage your lifecycle policy resources, you can assign your own metadata to each resource in
        # the form of tags. Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @date_created : Time? = nil,
          @date_last_run : Time? = nil,
          @date_updated : Time? = nil,
          @description : String? = nil,
          @execution_role : String? = nil,
          @name : String? = nil,
          @policy_details : Array(Types::LifecyclePolicyDetail)? = nil,
          @resource_selection : Types::LifecyclePolicyResourceSelection? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration details for a lifecycle policy resource.

      struct LifecyclePolicyDetail
        include JSON::Serializable

        # Configuration details for the policy action.

        @[JSON::Field(key: "action")]
        getter action : Types::LifecyclePolicyDetailAction

        # Specifies the resources that the lifecycle policy applies to.

        @[JSON::Field(key: "filter")]
        getter filter : Types::LifecyclePolicyDetailFilter

        # Additional rules to specify resources that should be exempt from policy actions.

        @[JSON::Field(key: "exclusionRules")]
        getter exclusion_rules : Types::LifecyclePolicyDetailExclusionRules?

        def initialize(
          @action : Types::LifecyclePolicyDetailAction,
          @filter : Types::LifecyclePolicyDetailFilter,
          @exclusion_rules : Types::LifecyclePolicyDetailExclusionRules? = nil
        )
        end
      end

      # Contains selection criteria for the lifecycle policy.

      struct LifecyclePolicyDetailAction
        include JSON::Serializable

        # Specifies the lifecycle action to take.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies the resources that the lifecycle policy applies to.

        @[JSON::Field(key: "includeResources")]
        getter include_resources : Types::LifecyclePolicyDetailActionIncludeResources?

        def initialize(
          @type : String,
          @include_resources : Types::LifecyclePolicyDetailActionIncludeResources? = nil
        )
        end
      end

      # Specifies how the lifecycle policy should apply actions to selected resources.

      struct LifecyclePolicyDetailActionIncludeResources
        include JSON::Serializable

        # Specifies whether the lifecycle action should apply to distributed AMIs.

        @[JSON::Field(key: "amis")]
        getter amis : Bool?

        # Specifies whether the lifecycle action should apply to distributed containers.

        @[JSON::Field(key: "containers")]
        getter containers : Bool?

        # Specifies whether the lifecycle action should apply to snapshots associated with distributed AMIs.

        @[JSON::Field(key: "snapshots")]
        getter snapshots : Bool?

        def initialize(
          @amis : Bool? = nil,
          @containers : Bool? = nil,
          @snapshots : Bool? = nil
        )
        end
      end

      # Specifies resources that lifecycle policy actions should not apply to.

      struct LifecyclePolicyDetailExclusionRules
        include JSON::Serializable

        # Lists configuration values that apply to AMIs that Image Builder should exclude from the lifecycle
        # action.

        @[JSON::Field(key: "amis")]
        getter amis : Types::LifecyclePolicyDetailExclusionRulesAmis?

        # Contains a list of tags that Image Builder uses to skip lifecycle actions for Image Builder image
        # resources that have them.

        @[JSON::Field(key: "tagMap")]
        getter tag_map : Hash(String, String)?

        def initialize(
          @amis : Types::LifecyclePolicyDetailExclusionRulesAmis? = nil,
          @tag_map : Hash(String, String)? = nil
        )
        end
      end

      # Defines criteria for AMIs that are excluded from lifecycle actions.

      struct LifecyclePolicyDetailExclusionRulesAmis
        include JSON::Serializable

        # Configures whether public AMIs are excluded from the lifecycle action.

        @[JSON::Field(key: "isPublic")]
        getter is_public : Bool?

        # Specifies configuration details for Image Builder to exclude the most recent resources from
        # lifecycle actions.

        @[JSON::Field(key: "lastLaunched")]
        getter last_launched : Types::LifecyclePolicyDetailExclusionRulesAmisLastLaunched?

        # Configures Amazon Web Services Regions that are excluded from the lifecycle action.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        # Specifies Amazon Web Services accounts whose resources are excluded from the lifecycle action.

        @[JSON::Field(key: "sharedAccounts")]
        getter shared_accounts : Array(String)?

        # Lists tags that should be excluded from lifecycle actions for the AMIs that have them.

        @[JSON::Field(key: "tagMap")]
        getter tag_map : Hash(String, String)?

        def initialize(
          @is_public : Bool? = nil,
          @last_launched : Types::LifecyclePolicyDetailExclusionRulesAmisLastLaunched? = nil,
          @regions : Array(String)? = nil,
          @shared_accounts : Array(String)? = nil,
          @tag_map : Hash(String, String)? = nil
        )
        end
      end

      # Defines criteria to exclude AMIs from lifecycle actions based on the last time they were used to
      # launch an instance.

      struct LifecyclePolicyDetailExclusionRulesAmisLastLaunched
        include JSON::Serializable

        # Defines the unit of time that the lifecycle policy uses to calculate elapsed time since the last
        # instance launched from the AMI. For example: days, weeks, months, or years.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # The integer number of units for the time period. For example 6 (months).

        @[JSON::Field(key: "value")]
        getter value : Int32

        def initialize(
          @unit : String,
          @value : Int32
        )
        end
      end

      # Defines filters that the lifecycle policy uses to determine impacted resource.

      struct LifecyclePolicyDetailFilter
        include JSON::Serializable

        # Filter resources based on either age or count .

        @[JSON::Field(key: "type")]
        getter type : String

        # The number of units for the time period or for the count. For example, a value of 6 might refer to
        # six months or six AMIs. For count-based filters, this value represents the minimum number of
        # resources to keep on hand. If you have fewer resources than this number, the resource is excluded
        # from lifecycle actions.

        @[JSON::Field(key: "value")]
        getter value : Int32

        # For age-based filters, this is the number of resources to keep on hand after the lifecycle DELETE
        # action is applied. Impacted resources are only deleted if you have more than this number of
        # resources. If you have fewer resources than this number, the impacted resource is not deleted.

        @[JSON::Field(key: "retainAtLeast")]
        getter retain_at_least : Int32?

        # Defines the unit of time that the lifecycle policy uses to determine impacted resources. This is
        # required for age-based rules.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @type : String,
          @value : Int32,
          @retain_at_least : Int32? = nil,
          @unit : String? = nil
        )
        end
      end

      # Resource selection criteria for the lifecycle policy.

      struct LifecyclePolicyResourceSelection
        include JSON::Serializable

        # A list of recipes that are used as selection criteria for the output images that the lifecycle
        # policy applies to.

        @[JSON::Field(key: "recipes")]
        getter recipes : Array(Types::LifecyclePolicyResourceSelectionRecipe)?

        # A list of tags that are used as selection criteria for the Image Builder image resources that the
        # lifecycle policy applies to.

        @[JSON::Field(key: "tagMap")]
        getter tag_map : Hash(String, String)?

        def initialize(
          @recipes : Array(Types::LifecyclePolicyResourceSelectionRecipe)? = nil,
          @tag_map : Hash(String, String)? = nil
        )
        end
      end

      # Specifies an Image Builder recipe that the lifecycle policy uses for resource selection.

      struct LifecyclePolicyResourceSelectionRecipe
        include JSON::Serializable

        # The name of an Image Builder recipe that the lifecycle policy uses for resource selection.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the Image Builder recipe specified by the name field.

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        def initialize(
          @name : String,
          @semantic_version : String
        )
        end
      end

      # Contains a summary of lifecycle policy resources.

      struct LifecyclePolicySummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the lifecycle policy summary resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when Image Builder created the lifecycle policy resource.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : Time?

        # The timestamp for the last time Image Builder ran the lifecycle policy.

        @[JSON::Field(key: "dateLastRun")]
        getter date_last_run : Time?

        # The timestamp when Image Builder updated the lifecycle policy resource.

        @[JSON::Field(key: "dateUpdated")]
        getter date_updated : Time?

        # Optional description for the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name or Amazon Resource Name (ARN) of the IAM role that Image Builder uses to run the lifecycle
        # policy.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # The name of the lifecycle policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of resources the lifecycle policy targets.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The lifecycle policy resource status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # To help manage your lifecycle policy resources, you can assign your own metadata to each resource in
        # the form of tags. Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @date_created : Time? = nil,
          @date_last_run : Time? = nil,
          @date_updated : Time? = nil,
          @description : String? = nil,
          @execution_role : String? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListComponentBuildVersionsRequest
        include JSON::Serializable

        # The component version Amazon Resource Name (ARN) whose versions you want to list.

        @[JSON::Field(key: "componentVersionArn")]
        getter component_version_arn : String?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_version_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentBuildVersionsResponse
        include JSON::Serializable

        # The list of component summaries for the specified semantic version.

        @[JSON::Field(key: "componentSummaryList")]
        getter component_summary_list : Array(Types::ComponentSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @component_summary_list : Array(Types::ComponentSummary)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListComponentsRequest
        include JSON::Serializable

        # Returns the list of components for the specified name.

        @[JSON::Field(key: "byName")]
        getter by_name : Bool?

        # Use the following filters to streamline results: description name platform supportedOsVersion type
        # version

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filters results based on the type of owner for the component. By default, this request returns a
        # list of components that your account owns. To see results for other types of owners, you can specify
        # components that Amazon manages, third party components, or components that other accounts have
        # shared with you.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        def initialize(
          @by_name : Bool? = nil,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct ListComponentsResponse
        include JSON::Serializable

        # The list of component semantic versions. The semantic version has four nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
        # and can filter on all of them.

        @[JSON::Field(key: "componentVersionList")]
        getter component_version_list : Array(Types::ComponentVersion)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @component_version_list : Array(Types::ComponentVersion)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListContainerRecipesRequest
        include JSON::Serializable

        # Use the following filters to streamline results: containerType name parentImage platform

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Returns container recipes belonging to the specified owner, that have been shared with you. You can
        # omit this field to return container recipes belonging to your account.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct ListContainerRecipesResponse
        include JSON::Serializable

        # The list of container recipes returned for the request.

        @[JSON::Field(key: "containerRecipeSummaryList")]
        getter container_recipe_summary_list : Array(Types::ContainerRecipeSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @container_recipe_summary_list : Array(Types::ContainerRecipeSummary)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListDistributionConfigurationsRequest
        include JSON::Serializable

        # You can filter on name to streamline results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDistributionConfigurationsResponse
        include JSON::Serializable

        # The list of distributions.

        @[JSON::Field(key: "distributionConfigurationSummaryList")]
        getter distribution_configuration_summary_list : Array(Types::DistributionConfigurationSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @distribution_configuration_summary_list : Array(Types::DistributionConfigurationSummary)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListImageBuildVersionsRequest
        include JSON::Serializable

        # Use the following filters to streamline results: name osVersion platform type version

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The Amazon Resource Name (ARN) of the image whose build versions you want to retrieve.

        @[JSON::Field(key: "imageVersionArn")]
        getter image_version_arn : String?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @image_version_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImageBuildVersionsResponse
        include JSON::Serializable

        # The list of image build versions.

        @[JSON::Field(key: "imageSummaryList")]
        getter image_summary_list : Array(Types::ImageSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_summary_list : Array(Types::ImageSummary)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListImagePackagesRequest
        include JSON::Serializable

        # Filter results for the ListImagePackages request by the Image Build Version ARN

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_build_version_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImagePackagesResponse
        include JSON::Serializable

        # The list of Image Packages returned in the response.

        @[JSON::Field(key: "imagePackageList")]
        getter image_package_list : Array(Types::ImagePackage)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_package_list : Array(Types::ImagePackage)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListImagePipelineImagesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image pipeline whose images you want to view.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String

        # Use the following filters to streamline results: name version

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_pipeline_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImagePipelineImagesResponse
        include JSON::Serializable

        # The list of images built by this pipeline.

        @[JSON::Field(key: "imageSummaryList")]
        getter image_summary_list : Array(Types::ImageSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_summary_list : Array(Types::ImageSummary)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListImagePipelinesRequest
        include JSON::Serializable

        # Use the following filters to streamline results: description distributionConfigurationArn
        # imageRecipeArn infrastructureConfigurationArn name status

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImagePipelinesResponse
        include JSON::Serializable

        # The list of image pipelines.

        @[JSON::Field(key: "imagePipelineList")]
        getter image_pipeline_list : Array(Types::ImagePipeline)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_pipeline_list : Array(Types::ImagePipeline)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListImageRecipesRequest
        include JSON::Serializable

        # Use the following filters to streamline results: name parentImage platform

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # You can specify the recipe owner to filter results by that owner. By default, this request will only
        # show image recipes owned by your account. To filter by a different owner, specify one of the Valid
        # Values that are listed for this parameter.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct ListImageRecipesResponse
        include JSON::Serializable

        # A list of ImageRecipeSummary objects that contain identifying characteristics for the image recipe,
        # such as the name, the Amazon Resource Name (ARN), and the date created, along with other key
        # details.

        @[JSON::Field(key: "imageRecipeSummaryList")]
        getter image_recipe_summary_list : Array(Types::ImageRecipeSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_recipe_summary_list : Array(Types::ImageRecipeSummary)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListImageScanFindingAggregationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "filter")]
        getter filter : Types::Filter?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::Filter? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImageScanFindingAggregationsResponse
        include JSON::Serializable

        # The aggregation type specifies what type of key is used to group the image scan findings. Image
        # Builder returns results based on the request filter. If you didn't specify a filter in the request,
        # the type defaults to accountId . Aggregation types accountId imageBuildVersionArn imagePipelineArn
        # vulnerabilityId Each aggregation includes counts by severity level for medium severity and higher
        # level findings, plus a total for all of the findings for each key value.

        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : String?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # An array of image scan finding aggregations that match the filter criteria.

        @[JSON::Field(key: "responses")]
        getter responses : Array(Types::ImageScanFindingAggregation)?

        def initialize(
          @aggregation_type : String? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil,
          @responses : Array(Types::ImageScanFindingAggregation)? = nil
        )
        end
      end


      struct ListImageScanFindingsRequest
        include JSON::Serializable

        # An array of name value pairs that you can use to filter your results. You can use the following
        # filters to streamline results: imageBuildVersionArn imagePipelineArn vulnerabilityId severity If you
        # don't request a filter, then all findings in your account are listed.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ImageScanFindingsFilter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ImageScanFindingsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImageScanFindingsResponse
        include JSON::Serializable

        # The image scan findings for your account that meet your request filter criteria.

        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::ImageScanFinding)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @findings : Array(Types::ImageScanFinding)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListImagesRequest
        include JSON::Serializable

        # Requests a list of images with a specific recipe name.

        @[JSON::Field(key: "byName")]
        getter by_name : Bool?

        # Use the following filters to streamline results: name osVersion platform type version

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Includes deprecated images in the response list.

        @[JSON::Field(key: "includeDeprecated")]
        getter include_deprecated : Bool?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The owner defines which images you want to list. By default, this request will only show images
        # owned by your account. You can use this field to specify if you want to view images owned by
        # yourself, by Amazon, or those images that have been shared with you by other customers.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        def initialize(
          @by_name : Bool? = nil,
          @filters : Array(Types::Filter)? = nil,
          @include_deprecated : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct ListImagesResponse
        include JSON::Serializable

        # The list of image semantic versions. The semantic version has four nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign values for the first three,
        # and can filter on all of them. Filtering: With semantic versioning, you have the flexibility to use
        # wildcards (x) to specify the most recent versions or nodes when selecting the base image or
        # components for your recipe. When you use a wildcard in any node, all nodes to the right of the first
        # wildcard must also be wildcards.

        @[JSON::Field(key: "imageVersionList")]
        getter image_version_list : Array(Types::ImageVersion)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_version_list : Array(Types::ImageVersion)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListInfrastructureConfigurationsRequest
        include JSON::Serializable

        # You can filter on name to streamline results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInfrastructureConfigurationsResponse
        include JSON::Serializable

        # The list of infrastructure configurations.

        @[JSON::Field(key: "infrastructureConfigurationSummaryList")]
        getter infrastructure_configuration_summary_list : Array(Types::InfrastructureConfigurationSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @infrastructure_configuration_summary_list : Array(Types::InfrastructureConfigurationSummary)? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct ListLifecycleExecutionResourcesRequest
        include JSON::Serializable

        # Use the unique identifier for a runtime instance of the lifecycle policy to get runtime details.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # You can leave this empty to get a list of Image Builder resources that were identified for lifecycle
        # actions. To get a list of associated resources that are impacted for an individual resource (the
        # parent), specify its Amazon Resource Name (ARN). Associated resources are produced from your image
        # and distributed when you run a build, such as AMIs or container images stored in ECR repositories.

        @[JSON::Field(key: "parentResourceId")]
        getter parent_resource_id : String?

        def initialize(
          @lifecycle_execution_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @parent_resource_id : String? = nil
        )
        end
      end


      struct ListLifecycleExecutionResourcesResponse
        include JSON::Serializable

        # Runtime details for the specified runtime instance of the lifecycle policy.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String?

        # The current state of the lifecycle runtime instance.

        @[JSON::Field(key: "lifecycleExecutionState")]
        getter lifecycle_execution_state : Types::LifecycleExecutionState?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of resources that were identified for lifecycle actions.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::LifecycleExecutionResource)?

        def initialize(
          @lifecycle_execution_id : String? = nil,
          @lifecycle_execution_state : Types::LifecycleExecutionState? = nil,
          @next_token : String? = nil,
          @resources : Array(Types::LifecycleExecutionResource)? = nil
        )
        end
      end


      struct ListLifecycleExecutionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to get a list of lifecycle runtime
        # instances.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLifecycleExecutionsResponse
        include JSON::Serializable

        # A list of lifecycle runtime instances for the specified resource.

        @[JSON::Field(key: "lifecycleExecutions")]
        getter lifecycle_executions : Array(Types::LifecycleExecution)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @lifecycle_executions : Array(Types::LifecycleExecution)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLifecyclePoliciesRequest
        include JSON::Serializable

        # Streamline results based on one of the following values: Name , Status .

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLifecyclePoliciesResponse
        include JSON::Serializable

        # A list of lifecycle policies in your Amazon Web Services account that meet the criteria specified in
        # the request.

        @[JSON::Field(key: "lifecyclePolicySummaryList")]
        getter lifecycle_policy_summary_list : Array(Types::LifecyclePolicySummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @lifecycle_policy_summary_list : Array(Types::LifecyclePolicySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListWaitingWorkflowStepsRequest
        include JSON::Serializable

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWaitingWorkflowStepsResponse
        include JSON::Serializable

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of the workflow steps that are waiting for action in your Amazon Web Services account.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::WorkflowStepExecution)?

        def initialize(
          @next_token : String? = nil,
          @steps : Array(Types::WorkflowStepExecution)? = nil
        )
        end
      end


      struct ListWorkflowBuildVersionsRequest
        include JSON::Serializable

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the workflow resource for which to get a list of build versions.

        @[JSON::Field(key: "workflowVersionArn")]
        getter workflow_version_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @workflow_version_arn : String? = nil
        )
        end
      end


      struct ListWorkflowBuildVersionsResponse
        include JSON::Serializable

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list that contains metadata for the workflow builds that have run for the workflow resource
        # specified in the request.

        @[JSON::Field(key: "workflowSummaryList")]
        getter workflow_summary_list : Array(Types::WorkflowSummary)?

        def initialize(
          @next_token : String? = nil,
          @workflow_summary_list : Array(Types::WorkflowSummary)? = nil
        )
        end
      end


      struct ListWorkflowExecutionsRequest
        include JSON::Serializable

        # List all workflow runtime instances for the specified image build version resource ARN.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_build_version_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkflowExecutionsResponse
        include JSON::Serializable

        # The resource Amazon Resource Name (ARN) of the image build version for which you requested a list of
        # workflow runtime details.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The output message from the list action, if applicable.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # Contains an array of runtime details that represents each time a workflow ran for the requested
        # image build version.

        @[JSON::Field(key: "workflowExecutions")]
        getter workflow_executions : Array(Types::WorkflowExecutionMetadata)?

        def initialize(
          @image_build_version_arn : String? = nil,
          @message : String? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil,
          @workflow_executions : Array(Types::WorkflowExecutionMetadata)? = nil
        )
        end
      end


      struct ListWorkflowStepExecutionsRequest
        include JSON::Serializable

        # The unique identifier that Image Builder assigned to keep track of runtime details when it ran the
        # workflow.

        @[JSON::Field(key: "workflowExecutionId")]
        getter workflow_execution_id : String

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_execution_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkflowStepExecutionsResponse
        include JSON::Serializable

        # The image build version resource Amazon Resource Name (ARN) that's associated with the specified
        # runtime instance of the workflow.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The output message from the list action, if applicable.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # Contains an array of runtime details that represents each step in this runtime instance of the
        # workflow.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::WorkflowStepMetadata)?

        # The build version Amazon Resource Name (ARN) for the Image Builder workflow resource that defines
        # the steps for this runtime instance of the workflow.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String?

        # The unique identifier that Image Builder assigned to keep track of runtime details when it ran the
        # workflow.

        @[JSON::Field(key: "workflowExecutionId")]
        getter workflow_execution_id : String?

        def initialize(
          @image_build_version_arn : String? = nil,
          @message : String? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil,
          @steps : Array(Types::WorkflowStepMetadata)? = nil,
          @workflow_build_version_arn : String? = nil,
          @workflow_execution_id : String? = nil
        )
        end
      end


      struct ListWorkflowsRequest
        include JSON::Serializable

        # Specify all or part of the workflow name to streamline results.

        @[JSON::Field(key: "byName")]
        getter by_name : Bool?

        # Used to streamline search results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Specify the maximum number of items to return in a request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Used to get a list of workflow build version filtered by the identity of the creator.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        def initialize(
          @by_name : Bool? = nil,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct ListWorkflowsResponse
        include JSON::Serializable

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of workflow build versions that match the request criteria.

        @[JSON::Field(key: "workflowVersionList")]
        getter workflow_version_list : Array(Types::WorkflowVersion)?

        def initialize(
          @next_token : String? = nil,
          @workflow_version_list : Array(Types::WorkflowVersion)? = nil
        )
        end
      end

      # Logging configuration defines where Image Builder uploads your logs.

      struct Logging
        include JSON::Serializable

        # The Amazon S3 logging configuration.

        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::S3Logs?

        def initialize(
          @s3_logs : Types::S3Logs? = nil
        )
        end
      end

      # The resources produced by this image.

      struct OutputResources
        include JSON::Serializable

        # The Amazon EC2 AMIs created by this image.

        @[JSON::Field(key: "amis")]
        getter amis : Array(Types::Ami)?

        # Container images that the pipeline has generated and stored in the output repository.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::Container)?

        def initialize(
          @amis : Array(Types::Ami)? = nil,
          @containers : Array(Types::Container)? = nil
        )
        end
      end

      # Information about package vulnerability findings.

      struct PackageVulnerabilityDetails
        include JSON::Serializable

        # A unique identifier for this vulnerability.

        @[JSON::Field(key: "vulnerabilityId")]
        getter vulnerability_id : String

        # CVSS scores for one or more vulnerabilities that Amazon Inspector identified for a package.

        @[JSON::Field(key: "cvss")]
        getter cvss : Array(Types::CvssScore)?

        # Links to web pages that contain details about the vulnerabilities that Amazon Inspector identified
        # for the package.

        @[JSON::Field(key: "referenceUrls")]
        getter reference_urls : Array(String)?

        # Vulnerabilities that are often related to the findings for the package.

        @[JSON::Field(key: "relatedVulnerabilities")]
        getter related_vulnerabilities : Array(String)?

        # The source of the vulnerability information.

        @[JSON::Field(key: "source")]
        getter source : String?

        # A link to the source of the vulnerability information.

        @[JSON::Field(key: "sourceUrl")]
        getter source_url : String?

        # The date and time when this vulnerability was first added to the vendor's database.

        @[JSON::Field(key: "vendorCreatedAt")]
        getter vendor_created_at : Time?

        # The severity that the vendor assigned to this vulnerability type.

        @[JSON::Field(key: "vendorSeverity")]
        getter vendor_severity : String?

        # The date and time when the vendor last updated this vulnerability in their database.

        @[JSON::Field(key: "vendorUpdatedAt")]
        getter vendor_updated_at : Time?

        # The packages that this vulnerability impacts.

        @[JSON::Field(key: "vulnerablePackages")]
        getter vulnerable_packages : Array(Types::VulnerablePackage)?

        def initialize(
          @vulnerability_id : String,
          @cvss : Array(Types::CvssScore)? = nil,
          @reference_urls : Array(String)? = nil,
          @related_vulnerabilities : Array(String)? = nil,
          @source : String? = nil,
          @source_url : String? = nil,
          @vendor_created_at : Time? = nil,
          @vendor_severity : String? = nil,
          @vendor_updated_at : Time? = nil,
          @vulnerable_packages : Array(Types::VulnerablePackage)? = nil
        )
        end
      end

      # The logging configuration that's defined for pipeline execution.

      struct PipelineLoggingConfiguration
        include JSON::Serializable

        # The log group name that Image Builder uses for image creation. If not specified, the log group name
        # defaults to /aws/imagebuilder/image-name .

        @[JSON::Field(key: "imageLogGroupName")]
        getter image_log_group_name : String?

        # The log group name that Image Builder uses for the log output during creation of a new pipeline. If
        # not specified, the pipeline log group name defaults to /aws/imagebuilder/pipeline/pipeline-name .

        @[JSON::Field(key: "pipelineLogGroupName")]
        getter pipeline_log_group_name : String?

        def initialize(
          @image_log_group_name : String? = nil,
          @pipeline_log_group_name : String? = nil
        )
        end
      end

      # By default, EC2 instances run on shared tenancy hardware. This means that multiple Amazon Web
      # Services accounts might share the same physical hardware. When you use dedicated hardware, the
      # physical server that hosts your instances is dedicated to your Amazon Web Services account. Instance
      # placement settings contain the details for the physical hardware where instances that Image Builder
      # launches during image creation will run.

      struct Placement
        include JSON::Serializable

        # The Availability Zone where your build and test instances will launch.

        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The ID of the Dedicated Host on which build and test instances run. This only applies if tenancy is
        # host . If you specify the host ID, you must not specify the resource group ARN. If you specify both,
        # Image Builder returns an error.

        @[JSON::Field(key: "hostId")]
        getter host_id : String?

        # The Amazon Resource Name (ARN) of the host resource group in which to launch build and test
        # instances. This only applies if tenancy is host . If you specify the resource group ARN, you must
        # not specify the host ID. If you specify both, Image Builder returns an error.

        @[JSON::Field(key: "hostResourceGroupArn")]
        getter host_resource_group_arn : String?

        # The tenancy of the instance. An instance with a tenancy of dedicated runs on single-tenant hardware.
        # An instance with a tenancy of host runs on a Dedicated Host. If tenancy is set to host , then you
        # can optionally specify one target for placement – either host ID or host resource group ARN. If
        # automatic placement is enabled for your host, and you don't specify any placement target, Amazon EC2
        # will try to find an available host for your build and test instances.

        @[JSON::Field(key: "tenancy")]
        getter tenancy : String?

        def initialize(
          @availability_zone : String? = nil,
          @host_id : String? = nil,
          @host_resource_group_arn : String? = nil,
          @tenancy : String? = nil
        )
        end
      end

      # Information about a single product code.

      struct ProductCodeListItem
        include JSON::Serializable

        # For Amazon Web Services Marketplace components, this contains the product code ID that can be
        # stamped onto an EC2 AMI to ensure that components are billed correctly. If this property is empty,
        # it might mean that the component is not published.

        @[JSON::Field(key: "productCodeId")]
        getter product_code_id : String

        # The owner of the product code that's billed. If this property is empty, it might mean that the
        # component is not published.

        @[JSON::Field(key: "productCodeType")]
        getter product_code_type : String

        def initialize(
          @product_code_id : String,
          @product_code_type : String
        )
        end
      end


      struct PutComponentPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component that this policy should be applied to.

        @[JSON::Field(key: "componentArn")]
        getter component_arn : String

        # The policy to apply.

        @[JSON::Field(key: "policy")]
        getter policy : String

        def initialize(
          @component_arn : String,
          @policy : String
        )
        end
      end


      struct PutComponentPolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the component that this policy was applied to.

        @[JSON::Field(key: "componentArn")]
        getter component_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @component_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct PutContainerRecipePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe that this policy should be applied to.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String

        # The policy to apply to the container recipe.

        @[JSON::Field(key: "policy")]
        getter policy : String

        def initialize(
          @container_recipe_arn : String,
          @policy : String
        )
        end
      end


      struct PutContainerRecipePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container recipe that this policy was applied to.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @container_recipe_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct PutImagePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image that this policy should be applied to.

        @[JSON::Field(key: "imageArn")]
        getter image_arn : String

        # The policy to apply.

        @[JSON::Field(key: "policy")]
        getter policy : String

        def initialize(
          @image_arn : String,
          @policy : String
        )
        end
      end


      struct PutImagePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image that this policy was applied to.

        @[JSON::Field(key: "imageArn")]
        getter image_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct PutImageRecipePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image recipe that this policy should be applied to.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String

        # The policy to apply.

        @[JSON::Field(key: "policy")]
        getter policy : String

        def initialize(
          @image_recipe_arn : String,
          @policy : String
        )
        end
      end


      struct PutImageRecipePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image recipe that this policy was applied to.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @image_recipe_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Information about how to remediate a finding.

      struct Remediation
        include JSON::Serializable

        # An object that contains information about the recommended course of action to remediate the finding.

        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RemediationRecommendation?

        def initialize(
          @recommendation : Types::RemediationRecommendation? = nil
        )
        end
      end

      # Details about the recommended course of action to remediate the finding.

      struct RemediationRecommendation
        include JSON::Serializable

        # The recommended course of action to remediate the finding.

        @[JSON::Field(key: "text")]
        getter text : String?

        # A link to more information about the recommended remediation for this vulnerability.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @text : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The resource that you are trying to create already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have attempted to mutate or delete a resource with a dependency that prohibits this action. See
      # the error message for more details.

      struct ResourceDependencyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource that you are trying to operate on is currently in use. Review the message details and
      # retry later.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # At least one of the resources referenced by your request does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The current state of an impacted resource.

      struct ResourceState
        include JSON::Serializable

        # Shows the current lifecycle policy action that was applied to an impacted resource.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Additional rules to specify resources that should be exempt from ad-hoc lifecycle actions.

      struct ResourceStateUpdateExclusionRules
        include JSON::Serializable


        @[JSON::Field(key: "amis")]
        getter amis : Types::LifecyclePolicyDetailExclusionRulesAmis?

        def initialize(
          @amis : Types::LifecyclePolicyDetailExclusionRulesAmis? = nil
        )
        end
      end

      # Specifies if the lifecycle policy should apply actions to selected resources.

      struct ResourceStateUpdateIncludeResources
        include JSON::Serializable

        # Specifies whether the lifecycle action should apply to distributed AMIs

        @[JSON::Field(key: "amis")]
        getter amis : Bool?

        # Specifies whether the lifecycle action should apply to distributed containers.

        @[JSON::Field(key: "containers")]
        getter containers : Bool?

        # Specifies whether the lifecycle action should apply to snapshots associated with distributed AMIs.

        @[JSON::Field(key: "snapshots")]
        getter snapshots : Bool?

        def initialize(
          @amis : Bool? = nil,
          @containers : Bool? = nil,
          @snapshots : Bool? = nil
        )
        end
      end


      struct RetryImageRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The source image Amazon Resource Name (ARN) to retry.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String

        def initialize(
          @client_token : String,
          @image_build_version_arn : String
        )
        end
      end


      struct RetryImageResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ARN of the image to be retried.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        def initialize(
          @client_token : String? = nil,
          @image_build_version_arn : String? = nil
        )
        end
      end

      # Properties that configure export from your build instance to a compatible file format for your VM.

      struct S3ExportConfiguration
        include JSON::Serializable

        # Export the updated image to one of the following supported disk image formats: Virtual Hard Disk
        # (VHD) – Compatible with Citrix Xen and Microsoft Hyper-V virtualization products. Stream-optimized
        # ESX Virtual Machine Disk (VMDK) – Compatible with VMware ESX and VMware vSphere versions 4, 5, and
        # 6. Raw – Raw format.

        @[JSON::Field(key: "diskImageFormat")]
        getter disk_image_format : String

        # The name of the role that grants VM Import/Export permission to export images to your S3 bucket.

        @[JSON::Field(key: "roleName")]
        getter role_name : String

        # The S3 bucket in which to store the output disk images for your VM.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String

        # The Amazon S3 path for the bucket where the output disk images for your VM are stored.

        @[JSON::Field(key: "s3Prefix")]
        getter s3_prefix : String?

        def initialize(
          @disk_image_format : String,
          @role_name : String,
          @s3_bucket : String,
          @s3_prefix : String? = nil
        )
        end
      end

      # Amazon S3 logging configuration.

      struct S3Logs
        include JSON::Serializable

        # The S3 bucket in which to store the logs.

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String?

        # The Amazon S3 path to the bucket where the logs are stored.

        @[JSON::Field(key: "s3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket_name : String? = nil,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # A schedule configures when and how often a pipeline will automatically create a new image.

      struct Schedule
        include JSON::Serializable

        # The policy that configures when Image Builder should automatically disable a pipeline that is
        # failing.

        @[JSON::Field(key: "autoDisablePolicy")]
        getter auto_disable_policy : Types::AutoDisablePolicy?

        # The start condition configures when the pipeline should trigger a new image build, as follows. If no
        # value is set Image Builder defaults to EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE .
        # EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE (default) – When you use semantic version filters
        # on the base image or components in your image recipe, EC2 Image Builder builds a new image only when
        # there are new versions of the base image or components in your recipe that match the filter. For
        # semantic version syntax, see CreateComponent . EXPRESSION_MATCH_ONLY – This condition builds a new
        # image every time the CRON expression matches the current time.

        @[JSON::Field(key: "pipelineExecutionStartCondition")]
        getter pipeline_execution_start_condition : String?

        # The cron expression determines how often EC2 Image Builder evaluates your
        # pipelineExecutionStartCondition . For information on how to format a cron expression in Image
        # Builder, see Use cron expressions in EC2 Image Builder .

        @[JSON::Field(key: "scheduleExpression")]
        getter schedule_expression : String?

        # The timezone that applies to the scheduling expression. For example, "Etc/UTC",
        # "America/Los_Angeles" in the IANA timezone format . If not specified this defaults to UTC.

        @[JSON::Field(key: "timezone")]
        getter timezone : String?

        def initialize(
          @auto_disable_policy : Types::AutoDisablePolicy? = nil,
          @pipeline_execution_start_condition : String? = nil,
          @schedule_expression : String? = nil,
          @timezone : String? = nil
        )
        end
      end


      struct SendWorkflowStepActionRequest
        include JSON::Serializable

        # The action for the image creation process to take while a workflow WaitForAction step waits for an
        # asynchronous action to complete.

        @[JSON::Field(key: "action")]
        getter action : String

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the image build version to send action for.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String

        # Uniquely identifies the workflow step that sent the step action.

        @[JSON::Field(key: "stepExecutionId")]
        getter step_execution_id : String

        # The reason why this action is sent.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @action : String,
          @client_token : String,
          @image_build_version_arn : String,
          @step_execution_id : String,
          @reason : String? = nil
        )
        end
      end


      struct SendWorkflowStepActionResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image build version that received the action request.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The workflow step that sent the step action.

        @[JSON::Field(key: "stepExecutionId")]
        getter step_execution_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_build_version_arn : String? = nil,
          @step_execution_id : String? = nil
        )
        end
      end

      # This exception is thrown when the service encounters an unrecoverable exception.

      struct ServiceException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have exceeded the number of permitted resources or operations for this service. For service
      # quotas, see EC2 Image Builder endpoints and quotas .

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service is unable to process your request at this time.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Includes counts by severity level for medium severity and higher level findings, plus a total for
      # all of the findings for the specified filter.

      struct SeverityCounts
        include JSON::Serializable

        # The total number of findings across all severity levels for the specified filter.

        @[JSON::Field(key: "all")]
        getter all : Int64?

        # The number of critical severity findings for the specified filter.

        @[JSON::Field(key: "critical")]
        getter critical : Int64?

        # The number of high severity findings for the specified filter.

        @[JSON::Field(key: "high")]
        getter high : Int64?

        # The number of medium severity findings for the specified filter.

        @[JSON::Field(key: "medium")]
        getter medium : Int64?

        def initialize(
          @all : Int64? = nil,
          @critical : Int64? = nil,
          @high : Int64? = nil,
          @medium : Int64? = nil
        )
        end
      end

      # Configuration for a single Parameter in the Amazon Web Services Systems Manager (SSM) Parameter
      # Store in a given Region.

      struct SsmParameterConfiguration
        include JSON::Serializable

        # This is the name of the Parameter in the target Region or account. The image distribution creates
        # the Parameter if it doesn't already exist. Otherwise, it updates the parameter.

        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String

        # Specify the account that will own the Parameter in a given Region. During distribution, this account
        # must be specified in distribution settings as a target account for the Region.

        @[JSON::Field(key: "amiAccountId")]
        getter ami_account_id : String?

        # The data type specifies what type of value the Parameter contains. We recommend that you use data
        # type aws:ec2:image .

        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        def initialize(
          @parameter_name : String,
          @ami_account_id : String? = nil,
          @data_type : String? = nil
        )
        end
      end


      struct StartImagePipelineExecutionRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the image pipeline that you want to manually invoke.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String

        # Specify tags for Image Builder to apply to the image resource that's created When it starts pipeline
        # execution.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @image_pipeline_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartImagePipelineExecutionResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image that the request created.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_build_version_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct StartResourceStateUpdateRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the Image Builder resource that is updated. The state update might
        # also impact associated resources.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Indicates the lifecycle action to take for this request.

        @[JSON::Field(key: "state")]
        getter state : Types::ResourceState

        # Skip action on the image resource and associated resources if specified exclusion rules are met.

        @[JSON::Field(key: "exclusionRules")]
        getter exclusion_rules : Types::ResourceStateUpdateExclusionRules?

        # The name or Amazon Resource Name (ARN) of the IAM role that’s used to update image state.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # A list of image resources to update state for.

        @[JSON::Field(key: "includeResources")]
        getter include_resources : Types::ResourceStateUpdateIncludeResources?

        # The timestamp that indicates when resources are updated by a lifecycle action.

        @[JSON::Field(key: "updateAt")]
        getter update_at : Time?

        def initialize(
          @client_token : String,
          @resource_arn : String,
          @state : Types::ResourceState,
          @exclusion_rules : Types::ResourceStateUpdateExclusionRules? = nil,
          @execution_role : String? = nil,
          @include_resources : Types::ResourceStateUpdateIncludeResources? = nil,
          @update_at : Time? = nil
        )
        end
      end


      struct StartResourceStateUpdateResponse
        include JSON::Serializable

        # Identifies the lifecycle runtime instance that started the resource state update.

        @[JSON::Field(key: "lifecycleExecutionId")]
        getter lifecycle_execution_id : String?

        # The requested Amazon Resource Name (ARN) of the Image Builder resource for the asynchronous update.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @lifecycle_execution_id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Contains settings for the Systems Manager agent on your build instance.

      struct SystemsManagerAgent
        include JSON::Serializable

        # Controls whether the Systems Manager agent is removed from your final build image, prior to creating
        # the new AMI. If this is set to true, then the agent is removed from the final image. If it's set to
        # false, then the agent is left in, so that it is included in the new AMI. default value is false. The
        # default behavior of uninstallAfterBuild is to remove the SSM Agent if it was installed by EC2 Image
        # Builder

        @[JSON::Field(key: "uninstallAfterBuild")]
        getter uninstall_after_build : Bool?

        def initialize(
          @uninstall_after_build : Bool? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to apply to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The container repository where the output container image is stored.

      struct TargetContainerRepository
        include JSON::Serializable

        # The name of the container repository where the output container image is stored. This name is
        # prefixed by the repository location. For example, &lt;repository location url&gt;/repository_name .

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # Specifies the service in which this image was registered.

        @[JSON::Field(key: "service")]
        getter service : String

        def initialize(
          @repository_name : String,
          @service : String
        )
        end
      end

      # You have attempted too many requests for the specific operation.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to untag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDistributionConfigurationRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the distribution configuration that you want to update.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String

        # The distributions of the distribution configuration.

        @[JSON::Field(key: "distributions")]
        getter distributions : Array(Types::Distribution)

        # The description of the distribution configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @client_token : String,
          @distribution_configuration_arn : String,
          @distributions : Array(Types::Distribution),
          @description : String? = nil
        )
        end
      end


      struct UpdateDistributionConfigurationResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the distribution configuration that was updated by this request.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @distribution_configuration_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct UpdateImagePipelineRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the image pipeline that you want to update.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String

        # The Amazon Resource Name (ARN) of the infrastructure configuration that Image Builder uses to build
        # images that this image pipeline has updated.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        # The Amazon Resource Name (ARN) of the container pipeline to update.

        @[JSON::Field(key: "containerRecipeArn")]
        getter container_recipe_arn : String?

        # The description of the image pipeline.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the distribution configuration that Image Builder uses to
        # configure and distribute images that this image pipeline has updated.

        @[JSON::Field(key: "distributionConfigurationArn")]
        getter distribution_configuration_arn : String?

        # Collects additional information about the image being created, including the operating system (OS)
        # version and package list. This information is used to enhance the overall experience of using EC2
        # Image Builder. Enabled by default.

        @[JSON::Field(key: "enhancedImageMetadataEnabled")]
        getter enhanced_image_metadata_enabled : Bool?

        # The name or Amazon Resource Name (ARN) for the IAM role you create that grants Image Builder access
        # to perform workflow actions.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # The Amazon Resource Name (ARN) of the image recipe that will be used to configure images updated by
        # this image pipeline.

        @[JSON::Field(key: "imageRecipeArn")]
        getter image_recipe_arn : String?

        # Contains settings for vulnerability scans.

        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The image test configuration of the image pipeline.

        @[JSON::Field(key: "imageTestsConfiguration")]
        getter image_tests_configuration : Types::ImageTestsConfiguration?

        # Update logging configuration for the output image that's created when the pipeline runs.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::PipelineLoggingConfiguration?

        # The schedule of the image pipeline.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The status of the image pipeline.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Contains the workflows to run for the pipeline.

        @[JSON::Field(key: "workflows")]
        getter workflows : Array(Types::WorkflowConfiguration)?

        def initialize(
          @client_token : String,
          @image_pipeline_arn : String,
          @infrastructure_configuration_arn : String,
          @container_recipe_arn : String? = nil,
          @description : String? = nil,
          @distribution_configuration_arn : String? = nil,
          @enhanced_image_metadata_enabled : Bool? = nil,
          @execution_role : String? = nil,
          @image_recipe_arn : String? = nil,
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @image_tests_configuration : Types::ImageTestsConfiguration? = nil,
          @logging_configuration : Types::PipelineLoggingConfiguration? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil,
          @workflows : Array(Types::WorkflowConfiguration)? = nil
        )
        end
      end


      struct UpdateImagePipelineResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the image pipeline that was updated by this request.

        @[JSON::Field(key: "imagePipelineArn")]
        getter image_pipeline_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @image_pipeline_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct UpdateInfrastructureConfigurationRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the infrastructure configuration that you want to update.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        # The instance profile to associate with the instance used to customize your Amazon EC2 AMI.

        @[JSON::Field(key: "instanceProfileName")]
        getter instance_profile_name : String

        # The description of the infrastructure configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The instance metadata options that you can set for the HTTP requests that pipeline builds use to
        # launch EC2 build and test instances. For more information about instance metadata options, see one
        # of the following links: Configure the instance metadata options in the Amazon EC2 User Guide for
        # Linux instances. Configure the instance metadata options in the Amazon EC2 Windows Guide for Windows
        # instances.

        @[JSON::Field(key: "instanceMetadataOptions")]
        getter instance_metadata_options : Types::InstanceMetadataOptions?

        # The instance types of the infrastructure configuration. You can specify one or more instance types
        # to use for this build. The service will pick one of these instance types based on availability.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The key pair of the infrastructure configuration. You can use this to log on to and debug the
        # instance used to create your image.

        @[JSON::Field(key: "keyPair")]
        getter key_pair : String?

        # The logging configuration of the infrastructure configuration.

        @[JSON::Field(key: "logging")]
        getter logging : Types::Logging?

        # The instance placement settings that define where the instances that are launched from your image
        # will run.

        @[JSON::Field(key: "placement")]
        getter placement : Types::Placement?

        # The tags attached to the resource created by Image Builder.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The security group IDs to associate with the instance used to customize your Amazon EC2 AMI.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The Amazon Resource Name (ARN) for the SNS topic to which we send image build event notifications.
        # EC2 Image Builder is unable to send notifications to SNS topics that are encrypted using keys from
        # other accounts. The key that is used to encrypt the SNS topic must reside in the account that the
        # Image Builder service runs under.

        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String?

        # The subnet ID to place the instance used to customize your Amazon EC2 AMI in.

        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The terminate instance on failure setting of the infrastructure configuration. Set to false if you
        # want Image Builder to retain the instance used to configure your AMI if the build or test phase of
        # your workflow fails.

        @[JSON::Field(key: "terminateInstanceOnFailure")]
        getter terminate_instance_on_failure : Bool?

        def initialize(
          @client_token : String,
          @infrastructure_configuration_arn : String,
          @instance_profile_name : String,
          @description : String? = nil,
          @instance_metadata_options : Types::InstanceMetadataOptions? = nil,
          @instance_types : Array(String)? = nil,
          @key_pair : String? = nil,
          @logging : Types::Logging? = nil,
          @placement : Types::Placement? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @sns_topic_arn : String? = nil,
          @subnet_id : String? = nil,
          @terminate_instance_on_failure : Bool? = nil
        )
        end
      end


      struct UpdateInfrastructureConfigurationResponse
        include JSON::Serializable

        # The client token that uniquely identifies the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the infrastructure configuration that was updated by this request.

        @[JSON::Field(key: "infrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String?

        # The request ID that uniquely identifies this request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @client_token : String? = nil,
          @infrastructure_configuration_arn : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct UpdateLifecyclePolicyRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
        # information, see Ensuring idempotency in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name or Amazon Resource Name (ARN) of the IAM role that Image Builder uses to update the
        # lifecycle policy.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String

        # The Amazon Resource Name (ARN) of the lifecycle policy resource.

        @[JSON::Field(key: "lifecyclePolicyArn")]
        getter lifecycle_policy_arn : String

        # The configuration details for a lifecycle policy resource.

        @[JSON::Field(key: "policyDetails")]
        getter policy_details : Array(Types::LifecyclePolicyDetail)

        # Selection criteria for resources that the lifecycle policy applies to.

        @[JSON::Field(key: "resourceSelection")]
        getter resource_selection : Types::LifecyclePolicyResourceSelection

        # The type of image resource that the lifecycle policy applies to.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Optional description for the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the lifecycle policy resource is enabled.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @client_token : String,
          @execution_role : String,
          @lifecycle_policy_arn : String,
          @policy_details : Array(Types::LifecyclePolicyDetail),
          @resource_selection : Types::LifecyclePolicyResourceSelection,
          @resource_type : String,
          @description : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateLifecyclePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the image lifecycle policy resource that was updated.

        @[JSON::Field(key: "lifecyclePolicyArn")]
        getter lifecycle_policy_arn : String?

        def initialize(
          @lifecycle_policy_arn : String? = nil
        )
        end
      end

      # Includes counts of image and pipeline resource findings by vulnerability.

      struct VulnerabilityIdAggregation
        include JSON::Serializable

        # Counts by severity level for medium severity and higher level findings, plus a total for all of the
        # findings for the specified vulnerability.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        # The vulnerability Id for this set of counts.

        @[JSON::Field(key: "vulnerabilityId")]
        getter vulnerability_id : String?

        def initialize(
          @severity_counts : Types::SeverityCounts? = nil,
          @vulnerability_id : String? = nil
        )
        end
      end

      # Information about a vulnerable package that Amazon Inspector identifies in a finding.

      struct VulnerablePackage
        include JSON::Serializable

        # The architecture of the vulnerable package.

        @[JSON::Field(key: "arch")]
        getter arch : String?

        # The epoch of the vulnerable package.

        @[JSON::Field(key: "epoch")]
        getter epoch : Int32?

        # The file path of the vulnerable package.

        @[JSON::Field(key: "filePath")]
        getter file_path : String?

        # The version of the package that contains the vulnerability fix.

        @[JSON::Field(key: "fixedInVersion")]
        getter fixed_in_version : String?

        # The name of the vulnerable package.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The package manager of the vulnerable package.

        @[JSON::Field(key: "packageManager")]
        getter package_manager : String?

        # The release of the vulnerable package.

        @[JSON::Field(key: "release")]
        getter release : String?

        # The code to run in your environment to update packages with a fix available.

        @[JSON::Field(key: "remediation")]
        getter remediation : String?

        # The source layer hash of the vulnerable package.

        @[JSON::Field(key: "sourceLayerHash")]
        getter source_layer_hash : String?

        # The version of the vulnerable package.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arch : String? = nil,
          @epoch : Int32? = nil,
          @file_path : String? = nil,
          @fixed_in_version : String? = nil,
          @name : String? = nil,
          @package_manager : String? = nil,
          @release : String? = nil,
          @remediation : String? = nil,
          @source_layer_hash : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Defines a process that Image Builder uses to build and test images during the image creation
      # process.

      struct Workflow
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Describes what change has been made in this version of the workflow, or what makes this version
        # different from other versions of the workflow.

        @[JSON::Field(key: "changeDescription")]
        getter change_description : String?

        # Contains the YAML document content for the workflow.

        @[JSON::Field(key: "data")]
        getter data : String?

        # The timestamp when Image Builder created the workflow resource.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # The description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The KMS key identifier used to encrypt the workflow resource. This can be either the Key ARN or the
        # Alias ARN. For more information, see Key identifiers (KeyId) in the Key Management Service Developer
        # Guide .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the workflow resource.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the workflow resource.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # An array of input parameters that that the image workflow uses to control actions or configure
        # settings.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::WorkflowParameterDetail)?

        # Describes the current status of the workflow and the reason for that status.

        @[JSON::Field(key: "state")]
        getter state : Types::WorkflowState?

        # The tags that apply to the workflow resource

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies the image creation stage that the workflow applies to. Image Builder currently supports
        # build and test workflows.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The workflow resource version. Workflow resources are immutable. To make a change, you can clone a
        # workflow or create a new version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @change_description : String? = nil,
          @data : String? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parameters : Array(Types::WorkflowParameterDetail)? = nil,
          @state : Types::WorkflowState? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Contains control settings and configurable inputs for a workflow resource.

      struct WorkflowConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow resource.

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The action to take if the workflow fails.

        @[JSON::Field(key: "onFailure")]
        getter on_failure : String?

        # Test workflows are defined within named runtime groups called parallel groups. The parallel group is
        # the named group that contains this test workflow. Test workflows within a parallel group can run at
        # the same time. Image Builder starts up to five test workflows in the group at the same time, and
        # starts additional workflows as others complete, until all workflows in the group have completed.
        # This field only applies for test workflows.

        @[JSON::Field(key: "parallelGroup")]
        getter parallel_group : String?

        # Contains parameter values for each of the parameters that the workflow document defined for the
        # workflow resource.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::WorkflowParameter)?

        def initialize(
          @workflow_arn : String,
          @on_failure : String? = nil,
          @parallel_group : String? = nil,
          @parameters : Array(Types::WorkflowParameter)? = nil
        )
        end
      end

      # Metadata that includes details and status from this runtime instance of the workflow.

      struct WorkflowExecutionMetadata
        include JSON::Serializable

        # The timestamp when this runtime instance of the workflow finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # The runtime output message from the workflow, if applicable.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the test group that included the test workflow resource at runtime.

        @[JSON::Field(key: "parallelGroup")]
        getter parallel_group : String?

        # Indicates retry status for this runtime instance of the workflow.

        @[JSON::Field(key: "retried")]
        getter retried : Bool?

        # The timestamp when the runtime instance of this workflow started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # The current runtime status for this workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The total number of steps in the workflow. This should equal the sum of the step counts for steps
        # that succeeded, were skipped, and failed.

        @[JSON::Field(key: "totalStepCount")]
        getter total_step_count : Int32?

        # A runtime count for the number of steps in the workflow that failed.

        @[JSON::Field(key: "totalStepsFailed")]
        getter total_steps_failed : Int32?

        # A runtime count for the number of steps in the workflow that were skipped.

        @[JSON::Field(key: "totalStepsSkipped")]
        getter total_steps_skipped : Int32?

        # A runtime count for the number of steps in the workflow that ran successfully.

        @[JSON::Field(key: "totalStepsSucceeded")]
        getter total_steps_succeeded : Int32?

        # Indicates what type of workflow that Image Builder ran for this runtime instance of the workflow.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The Amazon Resource Name (ARN) of the workflow resource build version that ran.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String?

        # Unique identifier that Image Builder assigns to keep track of runtime resources each time it runs a
        # workflow.

        @[JSON::Field(key: "workflowExecutionId")]
        getter workflow_execution_id : String?

        def initialize(
          @end_time : String? = nil,
          @message : String? = nil,
          @parallel_group : String? = nil,
          @retried : Bool? = nil,
          @start_time : String? = nil,
          @status : String? = nil,
          @total_step_count : Int32? = nil,
          @total_steps_failed : Int32? = nil,
          @total_steps_skipped : Int32? = nil,
          @total_steps_succeeded : Int32? = nil,
          @type : String? = nil,
          @workflow_build_version_arn : String? = nil,
          @workflow_execution_id : String? = nil
        )
        end
      end

      # Contains a key/value pair that sets the named workflow parameter.

      struct WorkflowParameter
        include JSON::Serializable

        # The name of the workflow parameter to set.

        @[JSON::Field(key: "name")]
        getter name : String

        # Sets the value for the named workflow parameter.

        @[JSON::Field(key: "value")]
        getter value : Array(String)

        def initialize(
          @name : String,
          @value : Array(String)
        )
        end
      end

      # Defines a parameter that's used to provide configuration details for the workflow.

      struct WorkflowParameterDetail
        include JSON::Serializable

        # The name of this input parameter.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of input this parameter provides. The currently supported value is "string".

        @[JSON::Field(key: "type")]
        getter type : String

        # The default value of this parameter if no input is provided.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : Array(String)?

        # Describes this parameter.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @type : String,
          @default_value : Array(String)? = nil,
          @description : String? = nil
        )
        end
      end

      # A group of fields that describe the current status of workflow.

      struct WorkflowState
        include JSON::Serializable

        # Describes how or why the workflow changed state.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The current state of the workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains runtime details for an instance of a workflow that ran for the associated image build
      # version.

      struct WorkflowStepExecution
        include JSON::Serializable

        # The name of the step action.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The Amazon Resource Name (ARN) of the image build version that ran the workflow.

        @[JSON::Field(key: "imageBuildVersionArn")]
        getter image_build_version_arn : String?

        # The name of the workflow step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp when the workflow step started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # Uniquely identifies the workflow step that ran for the associated image build version.

        @[JSON::Field(key: "stepExecutionId")]
        getter step_execution_id : String?

        # The Amazon Resource Name (ARN) of the workflow resource that ran.

        @[JSON::Field(key: "workflowBuildVersionArn")]
        getter workflow_build_version_arn : String?

        # Uniquely identifies the runtime instance of the workflow that contains the workflow step that ran
        # for the associated image build version.

        @[JSON::Field(key: "workflowExecutionId")]
        getter workflow_execution_id : String?

        def initialize(
          @action : String? = nil,
          @image_build_version_arn : String? = nil,
          @name : String? = nil,
          @start_time : String? = nil,
          @step_execution_id : String? = nil,
          @workflow_build_version_arn : String? = nil,
          @workflow_execution_id : String? = nil
        )
        end
      end

      # Runtime details and status for the workflow step.

      struct WorkflowStepMetadata
        include JSON::Serializable

        # The step action name.

        @[JSON::Field(key: "action")]
        getter action : String?

        # Description of the workflow step.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the workflow step finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # Input parameters that Image Builder provides for the workflow step.

        @[JSON::Field(key: "inputs")]
        getter inputs : String?

        # Detailed output message that the workflow step provides at runtime.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the workflow step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The file names that the workflow step created as output for this runtime instance of the workflow.

        @[JSON::Field(key: "outputs")]
        getter outputs : String?

        # Reports on the rollback status of the step, if applicable.

        @[JSON::Field(key: "rollbackStatus")]
        getter rollback_status : String?

        # The timestamp when the workflow step started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # Runtime status for the workflow step.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A unique identifier for the workflow step, assigned at runtime.

        @[JSON::Field(key: "stepExecutionId")]
        getter step_execution_id : String?

        def initialize(
          @action : String? = nil,
          @description : String? = nil,
          @end_time : String? = nil,
          @inputs : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @outputs : String? = nil,
          @rollback_status : String? = nil,
          @start_time : String? = nil,
          @status : String? = nil,
          @step_execution_id : String? = nil
        )
        end
      end

      # Contains metadata about the workflow resource.

      struct WorkflowSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The change description for the current version of the workflow resource.

        @[JSON::Field(key: "changeDescription")]
        getter change_description : String?

        # The original creation date of the workflow resource.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # Describes the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the workflow resource.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # Describes the current state of the workflow resource.

        @[JSON::Field(key: "state")]
        getter state : Types::WorkflowState?

        # Contains a list of tags that are defined for the workflow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The image creation stage that this workflow applies to. Image Builder currently supports build and
        # test stage workflows.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The version of the workflow.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @change_description : String? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @state : Types::WorkflowState? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Contains details about this version of the workflow.

      struct WorkflowVersion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when Image Builder created the workflow version.

        @[JSON::Field(key: "dateCreated")]
        getter date_created : String?

        # Describes the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the workflow resource.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The image creation stage that this workflow applies to. Image Builder currently supports build and
        # test stage workflows.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The semantic version of the workflow resource. The format includes three nodes:
        # &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @date_created : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end
    end
  end
end
