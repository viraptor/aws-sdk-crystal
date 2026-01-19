require "json"
require "time"

module AwsSdk
  module ECR
    module Types

      # This data type is used in the ImageScanFinding data type.
      struct Attribute
        include JSON::Serializable

        # The attribute key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value assigned to the attribute key.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # An object representing authorization data for an Amazon ECR registry.
      struct AuthorizationData
        include JSON::Serializable

        # A base64-encoded string that contains authorization data for the specified Amazon ECR registry. When
        # the string is decoded, it is presented in the format user:password for private registry
        # authentication using docker login .
        @[JSON::Field(key: "authorizationToken")]
        getter authorization_token : String?

        # The Unix time in seconds and milliseconds when the authorization token expires. Authorization tokens
        # are valid for 12 hours.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The registry URL to use for this authorization token in a docker login command. The Amazon ECR
        # registry URL format is https://aws_account_id.dkr.ecr.region.amazonaws.com . For example,
        # https://012345678910.dkr.ecr.us-east-1.amazonaws.com ..
        @[JSON::Field(key: "proxyEndpoint")]
        getter proxy_endpoint : String?

        def initialize(
          @authorization_token : String? = nil,
          @expires_at : Time? = nil,
          @proxy_endpoint : String? = nil
        )
        end
      end

      # The image details of the Amazon ECR container image.
      struct AwsEcrContainerImageDetails
        include JSON::Serializable

        # The architecture of the Amazon ECR container image.
        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The image author of the Amazon ECR container image.
        @[JSON::Field(key: "author")]
        getter author : String?

        # The image hash of the Amazon ECR container image.
        @[JSON::Field(key: "imageHash")]
        getter image_hash : String?

        # The image tags attached to the Amazon ECR container image.
        @[JSON::Field(key: "imageTags")]
        getter image_tags : Array(String)?

        # The number of Amazon ECS or Amazon EKS clusters currently running the image.
        @[JSON::Field(key: "inUseCount")]
        getter in_use_count : Int64?

        # The most recent date and time a cluster was running the image.
        @[JSON::Field(key: "lastInUseAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_in_use_at : Time?

        # The platform of the Amazon ECR container image.
        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The date and time the Amazon ECR container image was pushed.
        @[JSON::Field(key: "pushedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pushed_at : Time?

        # The registry the Amazon ECR container image belongs to.
        @[JSON::Field(key: "registry")]
        getter registry : String?

        # The name of the repository the Amazon ECR container image resides in.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @architecture : String? = nil,
          @author : String? = nil,
          @image_hash : String? = nil,
          @image_tags : Array(String)? = nil,
          @in_use_count : Int64? = nil,
          @last_in_use_at : Time? = nil,
          @platform : String? = nil,
          @pushed_at : Time? = nil,
          @registry : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct BatchCheckLayerAvailabilityRequest
        include JSON::Serializable

        # The digests of the image layers to check.
        @[JSON::Field(key: "layerDigests")]
        getter layer_digests : Array(String)

        # The name of the repository that is associated with the image layers to check.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the image layers to
        # check. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @layer_digests : Array(String),
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct BatchCheckLayerAvailabilityResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::LayerFailure)?

        # A list of image layer objects corresponding to the image layer references in the request.
        @[JSON::Field(key: "layers")]
        getter layers : Array(Types::Layer)?

        def initialize(
          @failures : Array(Types::LayerFailure)? = nil,
          @layers : Array(Types::Layer)? = nil
        )
        end
      end

      # Deletes specified images within a specified repository. Images are specified with either the
      # imageTag or imageDigest .
      struct BatchDeleteImageRequest
        include JSON::Serializable

        # A list of image ID references that correspond to images to delete. The format of the imageIds
        # reference is imageTag=tag or imageDigest=digest .
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)

        # The repository that contains the image to delete.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the image to delete.
        # If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_ids : Array(Types::ImageIdentifier),
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct BatchDeleteImageResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::ImageFailure)?

        # The image IDs of the deleted images.
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)?

        def initialize(
          @failures : Array(Types::ImageFailure)? = nil,
          @image_ids : Array(Types::ImageIdentifier)? = nil
        )
        end
      end

      struct BatchGetImageRequest
        include JSON::Serializable

        # A list of image ID references that correspond to images to describe. The format of the imageIds
        # reference is imageTag=tag or imageDigest=digest .
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)

        # The repository that contains the images to describe.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The accepted media types for the request. Valid values:
        # application/vnd.docker.distribution.manifest.v1+json |
        # application/vnd.docker.distribution.manifest.v2+json | application/vnd.oci.image.manifest.v1+json
        @[JSON::Field(key: "acceptedMediaTypes")]
        getter accepted_media_types : Array(String)?

        # The Amazon Web Services account ID associated with the registry that contains the images to
        # describe. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_ids : Array(Types::ImageIdentifier),
          @repository_name : String,
          @accepted_media_types : Array(String)? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct BatchGetImageResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::ImageFailure)?

        # A list of image objects corresponding to the image references in the request.
        @[JSON::Field(key: "images")]
        getter images : Array(Types::Image)?

        def initialize(
          @failures : Array(Types::ImageFailure)? = nil,
          @images : Array(Types::Image)? = nil
        )
        end
      end

      struct BatchGetRepositoryScanningConfigurationRequest
        include JSON::Serializable

        # One or more repository names to get the scanning configuration for.
        @[JSON::Field(key: "repositoryNames")]
        getter repository_names : Array(String)

        def initialize(
          @repository_names : Array(String)
        )
        end
      end

      struct BatchGetRepositoryScanningConfigurationResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::RepositoryScanningConfigurationFailure)?

        # The scanning configuration for the requested repositories.
        @[JSON::Field(key: "scanningConfigurations")]
        getter scanning_configurations : Array(Types::RepositoryScanningConfiguration)?

        def initialize(
          @failures : Array(Types::RepositoryScanningConfigurationFailure)? = nil,
          @scanning_configurations : Array(Types::RepositoryScanningConfiguration)? = nil
        )
        end
      end

      # The operation did not succeed because the account is managed by a organization policy.
      struct BlockedByOrganizationPolicyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CompleteLayerUploadRequest
        include JSON::Serializable

        # The sha256 digest of the image layer.
        @[JSON::Field(key: "layerDigests")]
        getter layer_digests : Array(String)

        # The name of the repository to associate with the image layer.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The upload ID from a previous InitiateLayerUpload operation to associate with the image layer.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The Amazon Web Services account ID associated with the registry to which to upload layers. If you do
        # not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @layer_digests : Array(String),
          @repository_name : String,
          @upload_id : String,
          @registry_id : String? = nil
        )
        end
      end

      struct CompleteLayerUploadResponse
        include JSON::Serializable

        # The sha256 digest of the image layer.
        @[JSON::Field(key: "layerDigest")]
        getter layer_digest : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The upload ID associated with the layer.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String?

        def initialize(
          @layer_digest : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil,
          @upload_id : String? = nil
        )
        end
      end

      struct CreatePullThroughCacheRuleRequest
        include JSON::Serializable

        # The repository name prefix to use when caching images from the source registry. There is always an
        # assumed / applied to the end of the prefix. If you specify ecr-public as the prefix, Amazon ECR
        # treats that as ecr-public/ .
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String

        # The registry URL of the upstream public registry to use as the source for the pull through cache
        # rule. The following is the syntax to use for each supported upstream registry. Amazon ECR ( ecr ) –
        # &lt;accountId&gt;.dkr.ecr.&lt;region&gt;.amazonaws.com Amazon ECR Public ( ecr-public ) –
        # public.ecr.aws Docker Hub ( docker-hub ) – registry-1.docker.io GitHub Container Registry (
        # github-container-registry ) – ghcr.io GitLab Container Registry ( gitlab-container-registry ) –
        # registry.gitlab.com Kubernetes ( k8s ) – registry.k8s.io Microsoft Azure Container Registry (
        # azure-container-registry ) – &lt;custom&gt;.azurecr.io Quay ( quay ) – quay.io
        @[JSON::Field(key: "upstreamRegistryUrl")]
        getter upstream_registry_url : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret that identifies the
        # credentials to authenticate to the upstream registry.
        @[JSON::Field(key: "credentialArn")]
        getter credential_arn : String?

        # Amazon Resource Name (ARN) of the IAM role to be assumed by Amazon ECR to authenticate to the ECR
        # upstream registry. This role must be in the same account as the registry that you are configuring.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The Amazon Web Services account ID associated with the registry to create the pull through cache
        # rule for. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the upstream registry.
        @[JSON::Field(key: "upstreamRegistry")]
        getter upstream_registry : String?

        # The repository name prefix of the upstream registry to match with the upstream repository name. When
        # this field isn't specified, Amazon ECR will use the ROOT .
        @[JSON::Field(key: "upstreamRepositoryPrefix")]
        getter upstream_repository_prefix : String?

        def initialize(
          @ecr_repository_prefix : String,
          @upstream_registry_url : String,
          @credential_arn : String? = nil,
          @custom_role_arn : String? = nil,
          @registry_id : String? = nil,
          @upstream_registry : String? = nil,
          @upstream_repository_prefix : String? = nil
        )
        end
      end

      struct CreatePullThroughCacheRuleResponse
        include JSON::Serializable

        # The date and time, in JavaScript date format, when the pull through cache rule was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret associated with the
        # pull through cache rule.
        @[JSON::Field(key: "credentialArn")]
        getter credential_arn : String?

        # The ARN of the IAM role associated with the pull through cache rule.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The Amazon ECR repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the upstream registry associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRegistry")]
        getter upstream_registry : String?

        # The upstream registry URL associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRegistryUrl")]
        getter upstream_registry_url : String?

        # The upstream repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRepositoryPrefix")]
        getter upstream_repository_prefix : String?

        def initialize(
          @created_at : Time? = nil,
          @credential_arn : String? = nil,
          @custom_role_arn : String? = nil,
          @ecr_repository_prefix : String? = nil,
          @registry_id : String? = nil,
          @upstream_registry : String? = nil,
          @upstream_registry_url : String? = nil,
          @upstream_repository_prefix : String? = nil
        )
        end
      end

      struct CreateRepositoryCreationTemplateRequest
        include JSON::Serializable

        # A list of enumerable strings representing the Amazon ECR repository creation scenarios that this
        # template will apply towards. The supported scenarios are PULL_THROUGH_CACHE , REPLICATION , and
        # CREATE_ON_PUSH
        @[JSON::Field(key: "appliedFor")]
        getter applied_for : Array(String)

        # The repository namespace prefix to associate with the template. All repositories created using this
        # namespace prefix will have the settings defined in this template applied. For example, a prefix of
        # prod would apply to all repositories beginning with prod/ . Similarly, a prefix of prod/team would
        # apply to all repositories beginning with prod/team/ . To apply a template to all repositories in
        # your registry that don't have an associated creation template, you can use ROOT as the prefix. There
        # is always an assumed / applied to the end of the prefix. If you specify ecr-public as the prefix,
        # Amazon ECR treats that as ecr-public/ . When using a pull through cache rule, the repository prefix
        # you specify during rule creation is what you should specify as your repository creation template
        # prefix as well.
        @[JSON::Field(key: "prefix")]
        getter prefix : String

        # The ARN of the role to be assumed by Amazon ECR. This role must be in the same account as the
        # registry that you are configuring. Amazon ECR will assume your supplied role when the customRoleArn
        # is specified. When this field isn't specified, Amazon ECR will use the service-linked role for the
        # repository creation template.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # A description for the repository creation template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The encryption configuration to use for repositories created using the template.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate?

        # The tag mutability setting for the repository. If this parameter is omitted, the default setting of
        # MUTABLE will be used which will allow image tags to be overwritten. If IMMUTABLE is specified, all
        # image tags within the repository will be immutable which will prevent them from being overwritten.
        @[JSON::Field(key: "imageTagMutability")]
        getter image_tag_mutability : String?

        # A list of filters that specify which image tags should be excluded from the repository creation
        # template's image tag mutability setting.
        @[JSON::Field(key: "imageTagMutabilityExclusionFilters")]
        getter image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)?

        # The lifecycle policy to use for repositories created using the template.
        @[JSON::Field(key: "lifecyclePolicy")]
        getter lifecycle_policy : String?

        # The repository policy to apply to repositories created using the template. A repository policy is a
        # permissions policy associated with a repository to control access permissions.
        @[JSON::Field(key: "repositoryPolicy")]
        getter repository_policy : String?

        # The metadata to apply to the repository to help you categorize and organize. Each tag consists of a
        # key and an optional value, both of which you define. Tag keys can have a maximum character length of
        # 128 characters, and tag values can have a maximum length of 256 characters.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::Tag)?

        def initialize(
          @applied_for : Array(String),
          @prefix : String,
          @custom_role_arn : String? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate? = nil,
          @image_tag_mutability : String? = nil,
          @image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
          @lifecycle_policy : String? = nil,
          @repository_policy : String? = nil,
          @resource_tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRepositoryCreationTemplateResponse
        include JSON::Serializable

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The details of the repository creation template associated with the request.
        @[JSON::Field(key: "repositoryCreationTemplate")]
        getter repository_creation_template : Types::RepositoryCreationTemplate?

        def initialize(
          @registry_id : String? = nil,
          @repository_creation_template : Types::RepositoryCreationTemplate? = nil
        )
        end
      end

      struct CreateRepositoryRequest
        include JSON::Serializable

        # The name to use for the repository. The repository name may be specified on its own (such as
        # nginx-web-app ) or it can be prepended with a namespace to group the repository into a category
        # (such as project-a/nginx-web-app ). The repository name must start with a letter and can only
        # contain lowercase letters, numbers, hyphens, underscores, and forward slashes.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The encryption configuration for the repository. This determines how the contents of your repository
        # are encrypted at rest.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The imageScanningConfiguration parameter is being deprecated, in favor of specifying the image
        # scanning configuration at the registry level. For more information, see
        # PutRegistryScanningConfiguration . The image scanning configuration for the repository. This
        # determines whether images are scanned for known vulnerabilities after being pushed to the
        # repository.
        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The tag mutability setting for the repository. If this parameter is omitted, the default setting of
        # MUTABLE will be used which will allow image tags to be overwritten. If IMMUTABLE is specified, all
        # image tags within the repository will be immutable which will prevent them from being overwritten.
        @[JSON::Field(key: "imageTagMutability")]
        getter image_tag_mutability : String?

        # A list of filters that specify which image tags should be excluded from the repository's image tag
        # mutability setting.
        @[JSON::Field(key: "imageTagMutabilityExclusionFilters")]
        getter image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)?

        # The Amazon Web Services account ID associated with the registry to create the repository. If you do
        # not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The metadata that you apply to the repository to help you categorize and organize them. Each tag
        # consists of a key and an optional value, both of which you define. Tag keys can have a maximum
        # character length of 128 characters, and tag values can have a maximum length of 256 characters.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @repository_name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @image_tag_mutability : String? = nil,
          @image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
          @registry_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRepositoryResponse
        include JSON::Serializable

        # The repository that was created.
        @[JSON::Field(key: "repository")]
        getter repository : Types::Repository?

        def initialize(
          @repository : Types::Repository? = nil
        )
        end
      end

      # The CVSS score for a finding.
      struct CvssScore
        include JSON::Serializable

        # The base CVSS score used for the finding.
        @[JSON::Field(key: "baseScore")]
        getter base_score : Float64?

        # The vector string of the CVSS score.
        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String?

        # The source of the CVSS score.
        @[JSON::Field(key: "source")]
        getter source : String?

        # The version of CVSS used for the score.
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

      # Details on adjustments Amazon Inspector made to the CVSS score for a finding.
      struct CvssScoreAdjustment
        include JSON::Serializable

        # The metric used to adjust the CVSS score.
        @[JSON::Field(key: "metric")]
        getter metric : String?

        # The reason the CVSS score has been adjustment.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @metric : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Information about the CVSS score.
      struct CvssScoreDetails
        include JSON::Serializable

        # An object that contains details about adjustment Amazon Inspector made to the CVSS score.
        @[JSON::Field(key: "adjustments")]
        getter adjustments : Array(Types::CvssScoreAdjustment)?

        # The CVSS score.
        @[JSON::Field(key: "score")]
        getter score : Float64?

        # The source for the CVSS score.
        @[JSON::Field(key: "scoreSource")]
        getter score_source : String?

        # The vector for the CVSS score.
        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String?

        # The CVSS version used in scoring.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @adjustments : Array(Types::CvssScoreAdjustment)? = nil,
          @score : Float64? = nil,
          @score_source : String? = nil,
          @scoring_vector : String? = nil,
          @version : String? = nil
        )
        end
      end

      struct DeleteLifecyclePolicyRequest
        include JSON::Serializable

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct DeleteLifecyclePolicyResponse
        include JSON::Serializable

        # The time stamp of the last time that the lifecycle policy was run.
        @[JSON::Field(key: "lastEvaluatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_evaluated_at : Time?

        # The JSON lifecycle policy text.
        @[JSON::Field(key: "lifecyclePolicyText")]
        getter lifecycle_policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @last_evaluated_at : Time? = nil,
          @lifecycle_policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct DeletePullThroughCacheRuleRequest
        include JSON::Serializable

        # The Amazon ECR repository prefix associated with the pull through cache rule to delete.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String

        # The Amazon Web Services account ID associated with the registry that contains the pull through cache
        # rule. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @ecr_repository_prefix : String,
          @registry_id : String? = nil
        )
        end
      end

      struct DeletePullThroughCacheRuleResponse
        include JSON::Serializable

        # The timestamp associated with the pull through cache rule.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret associated with the
        # pull through cache rule.
        @[JSON::Field(key: "credentialArn")]
        getter credential_arn : String?

        # The ARN of the IAM role associated with the pull through cache rule.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The Amazon ECR repository prefix associated with the request.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The upstream registry URL associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRegistryUrl")]
        getter upstream_registry_url : String?

        # The upstream repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRepositoryPrefix")]
        getter upstream_repository_prefix : String?

        def initialize(
          @created_at : Time? = nil,
          @credential_arn : String? = nil,
          @custom_role_arn : String? = nil,
          @ecr_repository_prefix : String? = nil,
          @registry_id : String? = nil,
          @upstream_registry_url : String? = nil,
          @upstream_repository_prefix : String? = nil
        )
        end
      end

      struct DeleteRegistryPolicyRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteRegistryPolicyResponse
        include JSON::Serializable

        # The contents of the registry permissions policy that was deleted.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct DeleteRepositoryCreationTemplateRequest
        include JSON::Serializable

        # The repository namespace prefix associated with the repository creation template.
        @[JSON::Field(key: "prefix")]
        getter prefix : String

        def initialize(
          @prefix : String
        )
        end
      end

      struct DeleteRepositoryCreationTemplateResponse
        include JSON::Serializable

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The details of the repository creation template that was deleted.
        @[JSON::Field(key: "repositoryCreationTemplate")]
        getter repository_creation_template : Types::RepositoryCreationTemplate?

        def initialize(
          @registry_id : String? = nil,
          @repository_creation_template : Types::RepositoryCreationTemplate? = nil
        )
        end
      end

      struct DeleteRepositoryPolicyRequest
        include JSON::Serializable

        # The name of the repository that is associated with the repository policy to delete.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository policy
        # to delete. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct DeleteRepositoryPolicyResponse
        include JSON::Serializable

        # The JSON repository policy that was deleted from the repository.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct DeleteRepositoryRequest
        include JSON::Serializable

        # The name of the repository to delete.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # If true, deleting the repository force deletes the contents of the repository. If false, the
        # repository must be empty before attempting to delete it.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # The Amazon Web Services account ID associated with the registry that contains the repository to
        # delete. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @force : Bool? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct DeleteRepositoryResponse
        include JSON::Serializable

        # The repository that was deleted.
        @[JSON::Field(key: "repository")]
        getter repository : Types::Repository?

        def initialize(
          @repository : Types::Repository? = nil
        )
        end
      end

      struct DeleteSigningConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSigningConfigurationResponse
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the registry.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The registry's deleted signing configuration.
        @[JSON::Field(key: "signingConfiguration")]
        getter signing_configuration : Types::SigningConfiguration?

        def initialize(
          @registry_id : String? = nil,
          @signing_configuration : Types::SigningConfiguration? = nil
        )
        end
      end

      struct DeregisterPullTimeUpdateExclusionRequest
        include JSON::Serializable

        # The ARN of the IAM principal to remove from the pull time update exclusion list.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        def initialize(
          @principal_arn : String
        )
        end
      end

      struct DeregisterPullTimeUpdateExclusionResponse
        include JSON::Serializable

        # The ARN of the IAM principal that was removed from the pull time update exclusion list.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @principal_arn : String? = nil
        )
        end
      end

      struct DescribeImageReplicationStatusRequest
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier

        # The name of the repository that the image is in.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry. If you do not specify a registry,
        # the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_id : Types::ImageIdentifier,
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct DescribeImageReplicationStatusResponse
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        # The replication status details for the images in the specified repository.
        @[JSON::Field(key: "replicationStatuses")]
        getter replication_statuses : Array(Types::ImageReplicationStatus)?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @image_id : Types::ImageIdentifier? = nil,
          @replication_statuses : Array(Types::ImageReplicationStatus)? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct DescribeImageScanFindingsRequest
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier

        # The repository for the image for which to describe the scan findings.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The maximum number of image scan results returned by DescribeImageScanFindings in paginated output.
        # When this parameter is used, DescribeImageScanFindings only returns maxResults results in a single
        # page along with a nextToken response element. The remaining results of the initial request can be
        # seen by sending another DescribeImageScanFindings request with the returned nextToken value. This
        # value can be between 1 and 1000. If this parameter is not used, then DescribeImageScanFindings
        # returns up to 100 results and a nextToken value, if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeImageScanFindings request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to describe the image scan findings for. If you do not specify a registry, the default
        # registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_id : Types::ImageIdentifier,
          @repository_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct DescribeImageScanFindingsResponse
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        # The information contained in the image scan findings.
        @[JSON::Field(key: "imageScanFindings")]
        getter image_scan_findings : Types::ImageScanFindings?

        # The current state of the scan.
        @[JSON::Field(key: "imageScanStatus")]
        getter image_scan_status : Types::ImageScanStatus?

        # The nextToken value to include in a future DescribeImageScanFindings request. When the results of a
        # DescribeImageScanFindings request exceed maxResults , this value can be used to retrieve the next
        # page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @image_id : Types::ImageIdentifier? = nil,
          @image_scan_findings : Types::ImageScanFindings? = nil,
          @image_scan_status : Types::ImageScanStatus? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct DescribeImageSigningStatusRequest
        include JSON::Serializable

        # An object containing identifying information for an image.
        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier

        # The name of the repository that contains the image.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_id : Types::ImageIdentifier,
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct DescribeImageSigningStatusResponse
        include JSON::Serializable

        # An object with identifying information for the image.
        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        # The Amazon Web Services account ID associated with the registry.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # A list of signing statuses for the specified image. Each status corresponds to a signing profile.
        @[JSON::Field(key: "signingStatuses")]
        getter signing_statuses : Array(Types::ImageSigningStatus)?

        def initialize(
          @image_id : Types::ImageIdentifier? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil,
          @signing_statuses : Array(Types::ImageSigningStatus)? = nil
        )
        end
      end

      # An object representing a filter on a DescribeImages operation.
      struct DescribeImagesFilter
        include JSON::Serializable

        # The image status with which to filter your DescribeImages results. Valid values are ACTIVE ,
        # ARCHIVED , and ACTIVATING .
        @[JSON::Field(key: "imageStatus")]
        getter image_status : String?

        # The tag status with which to filter your DescribeImages results. You can filter results based on
        # whether they are TAGGED or UNTAGGED .
        @[JSON::Field(key: "tagStatus")]
        getter tag_status : String?

        def initialize(
          @image_status : String? = nil,
          @tag_status : String? = nil
        )
        end
      end

      struct DescribeImagesRequest
        include JSON::Serializable

        # The repository that contains the images to describe.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The filter key and value with which to filter your DescribeImages results.
        @[JSON::Field(key: "filter")]
        getter filter : Types::DescribeImagesFilter?

        # The list of image IDs for the requested repository.
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)?

        # The maximum number of repository results returned by DescribeImages in paginated output. When this
        # parameter is used, DescribeImages only returns maxResults results in a single page along with a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another DescribeImages request with the returned nextToken value. This value can be between 1 and
        # 1000. If this parameter is not used, then DescribeImages returns up to 100 results and a nextToken
        # value, if applicable. This option cannot be used when you specify images with imageIds .
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeImages request where maxResults was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value. This value is null when there are no more
        # results to return. This option cannot be used when you specify images with imageIds .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to describe images. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @filter : Types::DescribeImagesFilter? = nil,
          @image_ids : Array(Types::ImageIdentifier)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct DescribeImagesResponse
        include JSON::Serializable

        # A list of ImageDetail objects that contain data about the image.
        @[JSON::Field(key: "imageDetails")]
        getter image_details : Array(Types::ImageDetail)?

        # The nextToken value to include in a future DescribeImages request. When the results of a
        # DescribeImages request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_details : Array(Types::ImageDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribePullThroughCacheRulesRequest
        include JSON::Serializable

        # The Amazon ECR repository prefixes associated with the pull through cache rules to return. If no
        # repository prefix value is specified, all pull through cache rules are returned.
        @[JSON::Field(key: "ecrRepositoryPrefixes")]
        getter ecr_repository_prefixes : Array(String)?

        # The maximum number of pull through cache rules returned by DescribePullThroughCacheRulesRequest in
        # paginated output. When this parameter is used, DescribePullThroughCacheRulesRequest only returns
        # maxResults results in a single page along with a nextToken response element. The remaining results
        # of the initial request can be seen by sending another DescribePullThroughCacheRulesRequest request
        # with the returned nextToken value. This value can be between 1 and 1000. If this parameter is not
        # used, then DescribePullThroughCacheRulesRequest returns up to 100 results and a nextToken value, if
        # applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribePullThroughCacheRulesRequest request
        # where maxResults was used and the results exceeded the value of that parameter. Pagination continues
        # from the end of the previous results that returned the nextToken value. This value is null when
        # there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID associated with the registry to return the pull through cache
        # rules for. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @ecr_repository_prefixes : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct DescribePullThroughCacheRulesResponse
        include JSON::Serializable

        # The nextToken value to include in a future DescribePullThroughCacheRulesRequest request. When the
        # results of a DescribePullThroughCacheRulesRequest request exceed maxResults , this value can be used
        # to retrieve the next page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The details of the pull through cache rules.
        @[JSON::Field(key: "pullThroughCacheRules")]
        getter pull_through_cache_rules : Array(Types::PullThroughCacheRule)?

        def initialize(
          @next_token : String? = nil,
          @pull_through_cache_rules : Array(Types::PullThroughCacheRule)? = nil
        )
        end
      end

      struct DescribeRegistryRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeRegistryResponse
        include JSON::Serializable

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The replication configuration for the registry.
        @[JSON::Field(key: "replicationConfiguration")]
        getter replication_configuration : Types::ReplicationConfiguration?

        def initialize(
          @registry_id : String? = nil,
          @replication_configuration : Types::ReplicationConfiguration? = nil
        )
        end
      end

      struct DescribeRepositoriesRequest
        include JSON::Serializable

        # The maximum number of repository results returned by DescribeRepositories in paginated output. When
        # this parameter is used, DescribeRepositories only returns maxResults results in a single page along
        # with a nextToken response element. The remaining results of the initial request can be seen by
        # sending another DescribeRepositories request with the returned nextToken value. This value can be
        # between 1 and 1000. If this parameter is not used, then DescribeRepositories returns up to 100
        # results and a nextToken value, if applicable. This option cannot be used when you specify
        # repositories with repositoryNames .
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeRepositories request where maxResults
        # was used and the results exceeded the value of that parameter. Pagination continues from the end of
        # the previous results that returned the nextToken value. This value is null when there are no more
        # results to return. This option cannot be used when you specify repositories with repositoryNames .
        # This token should be treated as an opaque identifier that is only used to retrieve the next items in
        # a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID associated with the registry that contains the repositories to be
        # described. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # A list of repositories to describe. If this parameter is omitted, then all repositories in a
        # registry are described.
        @[JSON::Field(key: "repositoryNames")]
        getter repository_names : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil,
          @repository_names : Array(String)? = nil
        )
        end
      end

      struct DescribeRepositoriesResponse
        include JSON::Serializable

        # The nextToken value to include in a future DescribeRepositories request. When the results of a
        # DescribeRepositories request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of repository objects corresponding to valid repositories.
        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::Repository)?

        def initialize(
          @next_token : String? = nil,
          @repositories : Array(Types::Repository)? = nil
        )
        end
      end

      struct DescribeRepositoryCreationTemplatesRequest
        include JSON::Serializable

        # The maximum number of repository results returned by DescribeRepositoryCreationTemplatesRequest in
        # paginated output. When this parameter is used, DescribeRepositoryCreationTemplatesRequest only
        # returns maxResults results in a single page along with a nextToken response element. The remaining
        # results of the initial request can be seen by sending another
        # DescribeRepositoryCreationTemplatesRequest request with the returned nextToken value. This value can
        # be between 1 and 1000. If this parameter is not used, then
        # DescribeRepositoryCreationTemplatesRequest returns up to 100 results and a nextToken value, if
        # applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeRepositoryCreationTemplates request
        # where maxResults was used and the results exceeded the value of that parameter. Pagination continues
        # from the end of the previous results that returned the nextToken value. This value is null when
        # there are no more results to return. This token should be treated as an opaque identifier that is
        # only used to retrieve the next items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The repository namespace prefixes associated with the repository creation templates to describe. If
        # this value is not specified, all repository creation templates are returned.
        @[JSON::Field(key: "prefixes")]
        getter prefixes : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prefixes : Array(String)? = nil
        )
        end
      end

      struct DescribeRepositoryCreationTemplatesResponse
        include JSON::Serializable

        # The nextToken value to include in a future DescribeRepositoryCreationTemplates request. When the
        # results of a DescribeRepositoryCreationTemplates request exceed maxResults , this value can be used
        # to retrieve the next page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The details of the repository creation templates.
        @[JSON::Field(key: "repositoryCreationTemplates")]
        getter repository_creation_templates : Array(Types::RepositoryCreationTemplate)?

        def initialize(
          @next_token : String? = nil,
          @registry_id : String? = nil,
          @repository_creation_templates : Array(Types::RepositoryCreationTemplate)? = nil
        )
        end
      end

      # The specified layer upload does not contain any layer parts.
      struct EmptyUploadException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The encryption configuration for the repository. This determines how the contents of your repository
      # are encrypted at rest. By default, when no encryption configuration is set or the AES256 encryption
      # type is used, Amazon ECR uses server-side encryption with Amazon S3-managed encryption keys which
      # encrypts your data at rest using an AES256 encryption algorithm. This does not require any action on
      # your part. For more control over the encryption of the contents of your repository, you can use
      # server-side encryption with Key Management Service key stored in Key Management Service (KMS) to
      # encrypt your images. For more information, see Amazon ECR encryption at rest in the Amazon Elastic
      # Container Registry User Guide .
      struct EncryptionConfiguration
        include JSON::Serializable

        # The encryption type to use. If you use the KMS encryption type, the contents of the repository will
        # be encrypted using server-side encryption with Key Management Service key stored in KMS. When you
        # use KMS to encrypt your data, you can either use the default Amazon Web Services managed KMS key for
        # Amazon ECR, or specify your own KMS key, which you already created. If you use the KMS_DSSE
        # encryption type, the contents of the repository will be encrypted with two layers of encryption
        # using server-side encryption with the KMS Management Service key stored in KMS. Similar to the KMS
        # encryption type, you can either use the default Amazon Web Services managed KMS key for Amazon ECR,
        # or specify your own KMS key, which you've already created. If you use the AES256 encryption type,
        # Amazon ECR uses server-side encryption with Amazon S3-managed encryption keys which encrypts the
        # images in the repository using an AES256 encryption algorithm. For more information, see Amazon ECR
        # encryption at rest in the Amazon Elastic Container Registry User Guide .
        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # If you use the KMS encryption type, specify the KMS key to use for encryption. The alias, key ID, or
        # full ARN of the KMS key can be specified. The key must exist in the same Region as the repository.
        # If no key is specified, the default Amazon Web Services managed KMS key for Amazon ECR will be used.
        @[JSON::Field(key: "kmsKey")]
        getter kms_key : String?

        def initialize(
          @encryption_type : String,
          @kms_key : String? = nil
        )
        end
      end

      # The encryption configuration to associate with the repository creation template.
      struct EncryptionConfigurationForRepositoryCreationTemplate
        include JSON::Serializable

        # The encryption type to use. If you use the KMS encryption type, the contents of the repository will
        # be encrypted using server-side encryption with Key Management Service key stored in KMS. When you
        # use KMS to encrypt your data, you can either use the default Amazon Web Services managed KMS key for
        # Amazon ECR, or specify your own KMS key, which you already created. For more information, see
        # Protecting data using server-side encryption with an KMS key stored in Key Management Service
        # (SSE-KMS) in the Amazon Simple Storage Service Console Developer Guide . If you use the AES256
        # encryption type, Amazon ECR uses server-side encryption with Amazon S3-managed encryption keys which
        # encrypts the images in the repository using an AES256 encryption algorithm. For more information,
        # see Protecting data using server-side encryption with Amazon S3-managed encryption keys (SSE-S3) in
        # the Amazon Simple Storage Service Console Developer Guide .
        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # If you use the KMS encryption type, specify the KMS key to use for encryption. The full ARN of the
        # KMS key must be specified. The key must exist in the same Region as the repository. If no key is
        # specified, the default Amazon Web Services managed KMS key for Amazon ECR will be used.
        @[JSON::Field(key: "kmsKey")]
        getter kms_key : String?

        def initialize(
          @encryption_type : String,
          @kms_key : String? = nil
        )
        end
      end

      # The details of an enhanced image scan. This is returned when enhanced scanning is enabled for your
      # private registry.
      struct EnhancedImageScanFinding
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the image.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The description of the finding.
        @[JSON::Field(key: "description")]
        getter description : String?

        # If a finding discovered in your environment has an exploit available.
        @[JSON::Field(key: "exploitAvailable")]
        getter exploit_available : String?

        # The Amazon Resource Number (ARN) of the finding.
        @[JSON::Field(key: "findingArn")]
        getter finding_arn : String?

        # The date and time that the finding was first observed.
        @[JSON::Field(key: "firstObservedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter first_observed_at : Time?

        # Details on whether a fix is available through a version update. This value can be YES , NO , or
        # PARTIAL . A PARTIAL fix means that some, but not all, of the packages identified in the finding have
        # fixes available through updated versions.
        @[JSON::Field(key: "fixAvailable")]
        getter fix_available : String?

        # The date and time that the finding was last observed.
        @[JSON::Field(key: "lastObservedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_observed_at : Time?

        # An object that contains the details of a package vulnerability finding.
        @[JSON::Field(key: "packageVulnerabilityDetails")]
        getter package_vulnerability_details : Types::PackageVulnerabilityDetails?

        # An object that contains the details about how to remediate a finding.
        @[JSON::Field(key: "remediation")]
        getter remediation : Types::Remediation?

        # Contains information on the resources involved in a finding.
        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)?

        # The Amazon Inspector score given to the finding.
        @[JSON::Field(key: "score")]
        getter score : Float64?

        # An object that contains details of the Amazon Inspector score.
        @[JSON::Field(key: "scoreDetails")]
        getter score_details : Types::ScoreDetails?

        # The severity of the finding.
        @[JSON::Field(key: "severity")]
        getter severity : String?

        # The status of the finding.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The title of the finding.
        @[JSON::Field(key: "title")]
        getter title : String?

        # The type of the finding.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The date and time the finding was last updated at.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @aws_account_id : String? = nil,
          @description : String? = nil,
          @exploit_available : String? = nil,
          @finding_arn : String? = nil,
          @first_observed_at : Time? = nil,
          @fix_available : String? = nil,
          @last_observed_at : Time? = nil,
          @package_vulnerability_details : Types::PackageVulnerabilityDetails? = nil,
          @remediation : Types::Remediation? = nil,
          @resources : Array(Types::Resource)? = nil,
          @score : Float64? = nil,
          @score_details : Types::ScoreDetails? = nil,
          @severity : String? = nil,
          @status : String? = nil,
          @title : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The specified pull time update exclusion already exists for the registry.
      struct ExclusionAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified pull time update exclusion was not found.
      struct ExclusionNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct GetAccountSettingRequest
        include JSON::Serializable

        # The name of the account setting, such as BASIC_SCAN_TYPE_VERSION or REGISTRY_POLICY_SCOPE .
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetAccountSettingResponse
        include JSON::Serializable

        # Retrieves the name of the account setting.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The setting value for the setting name. The following are valid values for the basic scan type being
        # used: AWS_NATIVE or CLAIR . The following are valid values for the registry policy scope being used:
        # V1 or V2 .
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct GetAuthorizationTokenRequest
        include JSON::Serializable

        # A list of Amazon Web Services account IDs that are associated with the registries for which to get
        # AuthorizationData objects. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryIds")]
        getter registry_ids : Array(String)?

        def initialize(
          @registry_ids : Array(String)? = nil
        )
        end
      end

      struct GetAuthorizationTokenResponse
        include JSON::Serializable

        # A list of authorization token data objects that correspond to the registryIds values in the request.
        # The size of the authorization token returned by Amazon ECR is not fixed. We recommend that you don't
        # make assumptions about the maximum size.
        @[JSON::Field(key: "authorizationData")]
        getter authorization_data : Array(Types::AuthorizationData)?

        def initialize(
          @authorization_data : Array(Types::AuthorizationData)? = nil
        )
        end
      end

      struct GetDownloadUrlForLayerRequest
        include JSON::Serializable

        # The digest of the image layer to download.
        @[JSON::Field(key: "layerDigest")]
        getter layer_digest : String

        # The name of the repository that is associated with the image layer to download.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the image layer to
        # download. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @layer_digest : String,
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct GetDownloadUrlForLayerResponse
        include JSON::Serializable

        # The pre-signed Amazon S3 download URL for the requested layer.
        @[JSON::Field(key: "downloadUrl")]
        getter download_url : String?

        # The digest of the image layer to download.
        @[JSON::Field(key: "layerDigest")]
        getter layer_digest : String?

        def initialize(
          @download_url : String? = nil,
          @layer_digest : String? = nil
        )
        end
      end

      struct GetLifecyclePolicyPreviewRequest
        include JSON::Serializable

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # An optional parameter that filters results based on image tag status and all tags, if tagged.
        @[JSON::Field(key: "filter")]
        getter filter : Types::LifecyclePolicyPreviewFilter?

        # The list of imageIDs to be included.
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)?

        # The maximum number of repository results returned by GetLifecyclePolicyPreviewRequest in&#x2028;
        # paginated output. When this parameter is used, GetLifecyclePolicyPreviewRequest only returns&#x2028;
        # maxResults results in a single page along with a nextToken &#x2028; response element. The remaining
        # results of the initial request can be seen by sending&#x2028; another
        # GetLifecyclePolicyPreviewRequest request with the returned nextToken &#x2028; value. This value can
        # be between 1 and 100. If this&#x2028; parameter is not used, then GetLifecyclePolicyPreviewRequest
        # returns up to&#x2028;100 results and a nextToken value, if&#x2028; applicable. This option cannot be
        # used when you specify images with imageIds .
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated&#x2028; GetLifecyclePolicyPreviewRequest
        # request where maxResults was used and the&#x2028; results exceeded the value of that parameter.
        # Pagination continues from the end of the&#x2028; previous results that returned the nextToken value.
        # This value is&#x2028; null when there are no more results to return. This option cannot be used when
        # you specify images with imageIds .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @filter : Types::LifecyclePolicyPreviewFilter? = nil,
          @image_ids : Array(Types::ImageIdentifier)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct GetLifecyclePolicyPreviewResponse
        include JSON::Serializable

        # The JSON lifecycle policy text.
        @[JSON::Field(key: "lifecyclePolicyText")]
        getter lifecycle_policy_text : String?

        # The nextToken value to include in a future GetLifecyclePolicyPreview request. When the results of a
        # GetLifecyclePolicyPreview request exceed maxResults , this value can be used to retrieve the next
        # page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The results of the lifecycle policy preview request.
        @[JSON::Field(key: "previewResults")]
        getter preview_results : Array(Types::LifecyclePolicyPreviewResult)?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The status of the lifecycle policy preview request.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The list of images that is returned as a result of the action.
        @[JSON::Field(key: "summary")]
        getter summary : Types::LifecyclePolicyPreviewSummary?

        def initialize(
          @lifecycle_policy_text : String? = nil,
          @next_token : String? = nil,
          @preview_results : Array(Types::LifecyclePolicyPreviewResult)? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil,
          @status : String? = nil,
          @summary : Types::LifecyclePolicyPreviewSummary? = nil
        )
        end
      end

      struct GetLifecyclePolicyRequest
        include JSON::Serializable

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct GetLifecyclePolicyResponse
        include JSON::Serializable

        # The time stamp of the last time that the lifecycle policy was run.
        @[JSON::Field(key: "lastEvaluatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_evaluated_at : Time?

        # The JSON lifecycle policy text.
        @[JSON::Field(key: "lifecyclePolicyText")]
        getter lifecycle_policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @last_evaluated_at : Time? = nil,
          @lifecycle_policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct GetRegistryPolicyRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetRegistryPolicyResponse
        include JSON::Serializable

        # The JSON text of the permissions policy for a registry.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct GetRegistryScanningConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetRegistryScanningConfigurationResponse
        include JSON::Serializable

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The scanning configuration for the registry.
        @[JSON::Field(key: "scanningConfiguration")]
        getter scanning_configuration : Types::RegistryScanningConfiguration?

        def initialize(
          @registry_id : String? = nil,
          @scanning_configuration : Types::RegistryScanningConfiguration? = nil
        )
        end
      end

      struct GetRepositoryPolicyRequest
        include JSON::Serializable

        # The name of the repository with the policy to retrieve.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct GetRepositoryPolicyResponse
        include JSON::Serializable

        # The JSON repository policy text associated with the repository.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct GetSigningConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetSigningConfigurationResponse
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the registry.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The registry's signing configuration.
        @[JSON::Field(key: "signingConfiguration")]
        getter signing_configuration : Types::SigningConfiguration?

        def initialize(
          @registry_id : String? = nil,
          @signing_configuration : Types::SigningConfiguration? = nil
        )
        end
      end

      # An object representing an Amazon ECR image.
      struct Image
        include JSON::Serializable

        # An object containing the image tag and image digest associated with an image.
        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        # The image manifest associated with the image.
        @[JSON::Field(key: "imageManifest")]
        getter image_manifest : String?

        # The manifest media type of the image.
        @[JSON::Field(key: "imageManifestMediaType")]
        getter image_manifest_media_type : String?

        # The Amazon Web Services account ID associated with the registry containing the image.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the repository associated with the image.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @image_id : Types::ImageIdentifier? = nil,
          @image_manifest : String? = nil,
          @image_manifest_media_type : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # The specified image has already been pushed, and there were no changes to the manifest or image tag
      # after the last push.
      struct ImageAlreadyExistsException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified image is archived and cannot be scanned.
      struct ImageArchivedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that describes an image returned by a DescribeImages operation.
      struct ImageDetail
        include JSON::Serializable

        # The artifact media type of the image.
        @[JSON::Field(key: "artifactMediaType")]
        getter artifact_media_type : String?

        # The sha256 digest of the image manifest.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # The media type of the image manifest.
        @[JSON::Field(key: "imageManifestMediaType")]
        getter image_manifest_media_type : String?

        # The date and time, expressed in standard JavaScript date format, at which the current image was
        # pushed to the repository.
        @[JSON::Field(key: "imagePushedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter image_pushed_at : Time?

        # A summary of the last completed image scan.
        @[JSON::Field(key: "imageScanFindingsSummary")]
        getter image_scan_findings_summary : Types::ImageScanFindingsSummary?

        # The current state of the scan.
        @[JSON::Field(key: "imageScanStatus")]
        getter image_scan_status : Types::ImageScanStatus?

        # The size, in bytes, of the image in the repository. If the image is a manifest list, this will be
        # the max size of all manifests in the list. Starting with Docker version 1.9, the Docker client
        # compresses image layers before pushing them to a V2 Docker registry. The output of the docker images
        # command shows the uncompressed image size. Therefore, Docker might return a larger image than the
        # image shown in the Amazon Web Services Management Console.
        @[JSON::Field(key: "imageSizeInBytes")]
        getter image_size_in_bytes : Int64?

        # The current status of the image.
        @[JSON::Field(key: "imageStatus")]
        getter image_status : String?

        # The list of tags associated with this image.
        @[JSON::Field(key: "imageTags")]
        getter image_tags : Array(String)?

        # The date and time, expressed in standard JavaScript date format, when the image was last restored
        # from Amazon ECR archive to Amazon ECR standard.
        @[JSON::Field(key: "lastActivatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_activated_at : Time?

        # The date and time, expressed in standard JavaScript date format, when the image was last
        # transitioned to Amazon ECR archive.
        @[JSON::Field(key: "lastArchivedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_archived_at : Time?

        # The date and time, expressed in standard JavaScript date format, when Amazon ECR recorded the last
        # image pull. Amazon ECR refreshes the last image pull timestamp at least once every 24 hours. For
        # example, if you pull an image once a day then the lastRecordedPullTime timestamp will indicate the
        # exact time that the image was last pulled. However, if you pull an image once an hour, because
        # Amazon ECR refreshes the lastRecordedPullTime timestamp at least once every 24 hours, the result may
        # not be the exact time that the image was last pulled.
        @[JSON::Field(key: "lastRecordedPullTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_recorded_pull_time : Time?

        # The Amazon Web Services account ID associated with the registry to which this image belongs.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the repository to which this image belongs.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The digest of the subject manifest for images that are referrers.
        @[JSON::Field(key: "subjectManifestDigest")]
        getter subject_manifest_digest : String?

        def initialize(
          @artifact_media_type : String? = nil,
          @image_digest : String? = nil,
          @image_manifest_media_type : String? = nil,
          @image_pushed_at : Time? = nil,
          @image_scan_findings_summary : Types::ImageScanFindingsSummary? = nil,
          @image_scan_status : Types::ImageScanStatus? = nil,
          @image_size_in_bytes : Int64? = nil,
          @image_status : String? = nil,
          @image_tags : Array(String)? = nil,
          @last_activated_at : Time? = nil,
          @last_archived_at : Time? = nil,
          @last_recorded_pull_time : Time? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil,
          @subject_manifest_digest : String? = nil
        )
        end
      end

      # The specified image digest does not match the digest that Amazon ECR calculated for the image.
      struct ImageDigestDoesNotMatchException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing an Amazon ECR image failure.
      struct ImageFailure
        include JSON::Serializable

        # The code associated with the failure.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The reason for the failure.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The image ID associated with the failure.
        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @image_id : Types::ImageIdentifier? = nil
        )
        end
      end

      # An object with identifying information for an image in an Amazon ECR repository.
      struct ImageIdentifier
        include JSON::Serializable

        # The sha256 digest of the image manifest.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # The tag used for the image.
        @[JSON::Field(key: "imageTag")]
        getter image_tag : String?

        def initialize(
          @image_digest : String? = nil,
          @image_tag : String? = nil
        )
        end
      end

      # The image requested does not exist in the specified repository.
      struct ImageNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing an artifact associated with a subject image.
      struct ImageReferrer
        include JSON::Serializable

        # The digest of the artifact manifest.
        @[JSON::Field(key: "digest")]
        getter digest : String

        # The media type of the artifact manifest.
        @[JSON::Field(key: "mediaType")]
        getter media_type : String

        # The size, in bytes, of the artifact.
        @[JSON::Field(key: "size")]
        getter size : Int64

        # A map of annotations associated with the artifact.
        @[JSON::Field(key: "annotations")]
        getter annotations : Hash(String, String)?

        # The status of the artifact. Valid values are ACTIVE , ARCHIVED , or ACTIVATING .
        @[JSON::Field(key: "artifactStatus")]
        getter artifact_status : String?

        # A string identifying the type of artifact.
        @[JSON::Field(key: "artifactType")]
        getter artifact_type : String?

        def initialize(
          @digest : String,
          @media_type : String,
          @size : Int64,
          @annotations : Hash(String, String)? = nil,
          @artifact_status : String? = nil,
          @artifact_type : String? = nil
        )
        end
      end

      # The status of the replication process for an image.
      struct ImageReplicationStatus
        include JSON::Serializable

        # The failure code for a replication that has failed.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The destination Region for the image replication.
        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Web Services account ID associated with the registry to which the image belongs.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The image replication status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @failure_code : String? = nil,
          @region : String? = nil,
          @registry_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about an image scan finding.
      struct ImageScanFinding
        include JSON::Serializable

        # A collection of attributes of the host from which the finding is generated.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        # The description of the finding.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name associated with the finding, usually a CVE number.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The finding severity.
        @[JSON::Field(key: "severity")]
        getter severity : String?

        # A link containing additional details about the security vulnerability.
        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @attributes : Array(Types::Attribute)? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @severity : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # The details of an image scan.
      struct ImageScanFindings
        include JSON::Serializable

        # Details about the enhanced scan findings from Amazon Inspector.
        @[JSON::Field(key: "enhancedFindings")]
        getter enhanced_findings : Array(Types::EnhancedImageScanFinding)?

        # The image vulnerability counts, sorted by severity.
        @[JSON::Field(key: "findingSeverityCounts")]
        getter finding_severity_counts : Hash(String, Int32)?

        # The findings from the image scan.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::ImageScanFinding)?

        # The time of the last completed image scan.
        @[JSON::Field(key: "imageScanCompletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter image_scan_completed_at : Time?

        # The time when the vulnerability data was last scanned.
        @[JSON::Field(key: "vulnerabilitySourceUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter vulnerability_source_updated_at : Time?

        def initialize(
          @enhanced_findings : Array(Types::EnhancedImageScanFinding)? = nil,
          @finding_severity_counts : Hash(String, Int32)? = nil,
          @findings : Array(Types::ImageScanFinding)? = nil,
          @image_scan_completed_at : Time? = nil,
          @vulnerability_source_updated_at : Time? = nil
        )
        end
      end

      # A summary of the last completed image scan.
      struct ImageScanFindingsSummary
        include JSON::Serializable

        # The image vulnerability counts, sorted by severity.
        @[JSON::Field(key: "findingSeverityCounts")]
        getter finding_severity_counts : Hash(String, Int32)?

        # The time of the last completed image scan.
        @[JSON::Field(key: "imageScanCompletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter image_scan_completed_at : Time?

        # The time when the vulnerability data was last scanned.
        @[JSON::Field(key: "vulnerabilitySourceUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter vulnerability_source_updated_at : Time?

        def initialize(
          @finding_severity_counts : Hash(String, Int32)? = nil,
          @image_scan_completed_at : Time? = nil,
          @vulnerability_source_updated_at : Time? = nil
        )
        end
      end

      # The current status of an image scan.
      struct ImageScanStatus
        include JSON::Serializable

        # The description of the image scan status.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The current state of an image scan.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The image scanning configuration for a repository.
      struct ImageScanningConfiguration
        include JSON::Serializable

        # The setting that determines whether images are scanned after being pushed to a repository. If set to
        # true , images will be scanned after being pushed. If this parameter is not specified, it will
        # default to false and images will not be scanned unless a scan is manually started with the
        # API_StartImageScan API.
        @[JSON::Field(key: "scanOnPush")]
        getter scan_on_push : Bool?

        def initialize(
          @scan_on_push : Bool? = nil
        )
        end
      end

      # The signing status for an image. Each status corresponds to a signing profile.
      struct ImageSigningStatus
        include JSON::Serializable

        # The failure code, which is only present if status is FAILED .
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # A description of why signing the image failed. This field is only present if status is FAILED .
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the Amazon Web Services Signer signing profile used to sign the image.
        @[JSON::Field(key: "signingProfileArn")]
        getter signing_profile_arn : String?

        # The image's signing status. Possible values are: IN_PROGRESS - Signing is currently in progress.
        # COMPLETE - The signature was successfully generated. FAILED - Signing failed. See failureCode and
        # failureReason for details.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @signing_profile_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The requested image storage class update is not supported.
      struct ImageStorageClassUpdateNotSupportedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified image is tagged with a tag that already exists. The repository is configured for tag
      # immutability.
      struct ImageTagAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A filter that specifies which image tags should be excluded from the repository's image tag
      # mutability setting.
      struct ImageTagMutabilityExclusionFilter
        include JSON::Serializable

        # The filter value used to match image tags for exclusion from mutability settings.
        @[JSON::Field(key: "filter")]
        getter filter : String

        # The type of filter to apply for excluding image tags from mutability settings.
        @[JSON::Field(key: "filterType")]
        getter filter_type : String

        def initialize(
          @filter : String,
          @filter_type : String
        )
        end
      end

      struct InitiateLayerUploadRequest
        include JSON::Serializable

        # The name of the repository to which you intend to upload layers.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry to which you intend to upload
        # layers. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct InitiateLayerUploadResponse
        include JSON::Serializable

        # The size, in bytes, that Amazon ECR expects future layer part uploads to be.
        @[JSON::Field(key: "partSize")]
        getter part_size : Int64?

        # The upload ID for the layer upload. This parameter is passed to further UploadLayerPart and
        # CompleteLayerUpload operations.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String?

        def initialize(
          @part_size : Int64? = nil,
          @upload_id : String? = nil
        )
        end
      end

      # The layer digest calculation performed by Amazon ECR upon receipt of the image layer does not match
      # the digest specified.
      struct InvalidLayerException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The layer part size is not valid, or the first byte specified is not consecutive to the last byte of
      # a previous layer part upload.
      struct InvalidLayerPartException
        include JSON::Serializable

        # The last valid byte received from the layer part upload that is associated with the exception.
        @[JSON::Field(key: "lastValidByteReceived")]
        getter last_valid_byte_received : Int64?

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The registry ID associated with the exception.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the exception.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The upload ID associated with the exception.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String?

        def initialize(
          @last_valid_byte_received : Int64? = nil,
          @message : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil,
          @upload_id : String? = nil
        )
        end
      end

      # The specified parameter is invalid. Review the available parameters for the API request.
      struct InvalidParameterException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An invalid parameter has been specified. Tag keys can have a maximum character length of 128
      # characters, and tag values can have a maximum length of 256 characters.
      struct InvalidTagParameterException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed due to a KMS exception.
      struct KmsException
        include JSON::Serializable

        # The error code returned by KMS.
        @[JSON::Field(key: "kmsError")]
        getter kms_error : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @kms_error : String? = nil,
          @message : String? = nil
        )
        end
      end

      # An object representing an Amazon ECR image layer.
      struct Layer
        include JSON::Serializable

        # The availability status of the image layer.
        @[JSON::Field(key: "layerAvailability")]
        getter layer_availability : String?

        # The sha256 digest of the image layer.
        @[JSON::Field(key: "layerDigest")]
        getter layer_digest : String?

        # The size, in bytes, of the image layer.
        @[JSON::Field(key: "layerSize")]
        getter layer_size : Int64?

        # The media type of the layer, such as application/vnd.docker.image.rootfs.diff.tar.gzip or
        # application/vnd.oci.image.layer.v1.tar+gzip .
        @[JSON::Field(key: "mediaType")]
        getter media_type : String?

        def initialize(
          @layer_availability : String? = nil,
          @layer_digest : String? = nil,
          @layer_size : Int64? = nil,
          @media_type : String? = nil
        )
        end
      end

      # The image layer already exists in the associated repository.
      struct LayerAlreadyExistsException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing an Amazon ECR image layer failure.
      struct LayerFailure
        include JSON::Serializable

        # The failure code associated with the failure.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The reason for the failure.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The layer digest associated with the failure.
        @[JSON::Field(key: "layerDigest")]
        getter layer_digest : String?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @layer_digest : String? = nil
        )
        end
      end

      # The specified layer is not available because it is not associated with an image. Unassociated image
      # layers may be cleaned up at any time.
      struct LayerInaccessibleException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Layer parts must be at least 5 MiB in size.
      struct LayerPartTooSmallException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified layers could not be found, or the specified layer is not valid for this repository.
      struct LayersNotFoundException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The lifecycle policy could not be found, and no policy is set to the repository.
      struct LifecyclePolicyNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The filter for the lifecycle policy preview.
      struct LifecyclePolicyPreviewFilter
        include JSON::Serializable

        # The tag status of the image.
        @[JSON::Field(key: "tagStatus")]
        getter tag_status : String?

        def initialize(
          @tag_status : String? = nil
        )
        end
      end

      # The previous lifecycle policy preview request has not completed. Wait and try again.
      struct LifecyclePolicyPreviewInProgressException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There is no dry run for this repository.
      struct LifecyclePolicyPreviewNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The result of the lifecycle policy preview.
      struct LifecyclePolicyPreviewResult
        include JSON::Serializable

        # The type of action to be taken.
        @[JSON::Field(key: "action")]
        getter action : Types::LifecyclePolicyRuleAction?

        # The priority of the applied rule.
        @[JSON::Field(key: "appliedRulePriority")]
        getter applied_rule_priority : Int32?

        # The sha256 digest of the image manifest.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # The date and time, expressed in standard JavaScript date format, at which the current image was
        # pushed to the repository.
        @[JSON::Field(key: "imagePushedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter image_pushed_at : Time?

        # The list of tags associated with this image.
        @[JSON::Field(key: "imageTags")]
        getter image_tags : Array(String)?

        # The storage class of the image.
        @[JSON::Field(key: "storageClass")]
        getter storage_class : String?

        def initialize(
          @action : Types::LifecyclePolicyRuleAction? = nil,
          @applied_rule_priority : Int32? = nil,
          @image_digest : String? = nil,
          @image_pushed_at : Time? = nil,
          @image_tags : Array(String)? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # The summary of the lifecycle policy preview request.
      struct LifecyclePolicyPreviewSummary
        include JSON::Serializable

        # The number of expiring images.
        @[JSON::Field(key: "expiringImageTotalCount")]
        getter expiring_image_total_count : Int32?

        # The total count of images that will be transitioned to each storage class. This field is only
        # present if at least one image will be transitoned in the summary.
        @[JSON::Field(key: "transitioningImageTotalCounts")]
        getter transitioning_image_total_counts : Array(Types::TransitioningImageTotalCount)?

        def initialize(
          @expiring_image_total_count : Int32? = nil,
          @transitioning_image_total_counts : Array(Types::TransitioningImageTotalCount)? = nil
        )
        end
      end

      # The type of action to be taken.
      struct LifecyclePolicyRuleAction
        include JSON::Serializable

        # The target storage class for the action. This is only present when the type is TRANSITION.
        @[JSON::Field(key: "targetStorageClass")]
        getter target_storage_class : String?

        # The type of action to be taken.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @target_storage_class : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The operation did not succeed because it would have exceeded a service limit for your account. For
      # more information, see Amazon ECR service quotas in the Amazon Elastic Container Registry User Guide.
      struct LimitExceededException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing a filter on a ListImageReferrers operation.
      struct ListImageReferrersFilter
        include JSON::Serializable

        # The artifact status with which to filter your ListImageReferrers results. Valid values are ACTIVE ,
        # ARCHIVED , ACTIVATING , or ANY . If not specified, only artifacts with ACTIVE status are returned.
        @[JSON::Field(key: "artifactStatus")]
        getter artifact_status : String?

        # The artifact types with which to filter your ListImageReferrers results.
        @[JSON::Field(key: "artifactTypes")]
        getter artifact_types : Array(String)?

        def initialize(
          @artifact_status : String? = nil,
          @artifact_types : Array(String)? = nil
        )
        end
      end

      struct ListImageReferrersRequest
        include JSON::Serializable

        # The name of the repository that contains the subject image.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # An object containing the image digest of the subject image for which to retrieve associated
        # artifacts.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : Types::SubjectIdentifier

        # The filter key and value with which to filter your ListImageReferrers results. If no filter is
        # specified, only artifacts with ACTIVE status are returned.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ListImageReferrersFilter?

        # The maximum number of image referrer results returned by ListImageReferrers in paginated output.
        # When this parameter is used, ListImageReferrers only returns maxResults results in a single page
        # along with a nextToken response element. The remaining results of the initial request can be seen by
        # sending another ListImageReferrers request with the returned nextToken value. This value can be
        # between 1 and 50. If this parameter is not used, then ListImageReferrers returns up to 50 results
        # and a nextToken value, if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListImageReferrers request where maxResults
        # was used and the results exceeded the value of that parameter. Pagination continues from the end of
        # the previous results that returned the nextToken value. This value is null when there are no more
        # results to return. This token should be treated as an opaque identifier that is only used to
        # retrieve the next items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to list image referrers. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @subject_id : Types::SubjectIdentifier,
          @filter : Types::ListImageReferrersFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct ListImageReferrersResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListImageReferrers request. When the results of a
        # ListImageReferrers request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of artifacts associated with the subject image.
        @[JSON::Field(key: "referrers")]
        getter referrers : Array(Types::ImageReferrer)?

        def initialize(
          @next_token : String? = nil,
          @referrers : Array(Types::ImageReferrer)? = nil
        )
        end
      end

      # An object representing a filter on a ListImages operation.
      struct ListImagesFilter
        include JSON::Serializable

        # The image status with which to filter your ListImages results. Valid values are ACTIVE , ARCHIVED ,
        # and ACTIVATING .
        @[JSON::Field(key: "imageStatus")]
        getter image_status : String?

        # The tag status with which to filter your ListImages results.
        @[JSON::Field(key: "tagStatus")]
        getter tag_status : String?

        def initialize(
          @image_status : String? = nil,
          @tag_status : String? = nil
        )
        end
      end

      struct ListImagesRequest
        include JSON::Serializable

        # The repository with image IDs to be listed.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The filter key and value with which to filter your ListImages results.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ListImagesFilter?

        # The maximum number of image results returned by ListImages in paginated output. When this parameter
        # is used, ListImages only returns maxResults results in a single page along with a nextToken response
        # element. The remaining results of the initial request can be seen by sending another ListImages
        # request with the returned nextToken value. This value can be between 1 and 1000. If this parameter
        # is not used, then ListImages returns up to 100 results and a nextToken value, if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListImages request where maxResults was used
        # and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value. This value is null when there are no more
        # results to return. This token should be treated as an opaque identifier that is only used to
        # retrieve the next items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to list images. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @filter : Types::ListImagesFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct ListImagesResponse
        include JSON::Serializable

        # The list of image IDs for the requested repository.
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)?

        # The nextToken value to include in a future ListImages request. When the results of a ListImages
        # request exceed maxResults , this value can be used to retrieve the next page of results. This value
        # is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_ids : Array(Types::ImageIdentifier)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPullTimeUpdateExclusionsRequest
        include JSON::Serializable

        # The maximum number of pull time update exclusion results returned by ListPullTimeUpdateExclusions in
        # paginated output. When this parameter is used, ListPullTimeUpdateExclusions only returns maxResults
        # results in a single page along with a nextToken response element. The remaining results of the
        # initial request can be seen by sending another ListPullTimeUpdateExclusions request with the
        # returned nextToken value. This value can be between 1 and 1000. If this parameter is not used, then
        # ListPullTimeUpdateExclusions returns up to 100 results and a nextToken value, if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListPullTimeUpdateExclusions request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return. This token should be treated as an opaque identifier that is only used to
        # retrieve the next items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPullTimeUpdateExclusionsResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListPullTimeUpdateExclusions request. When the results of
        # a ListPullTimeUpdateExclusions request exceed maxResults , this value can be used to retrieve the
        # next page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of IAM principal ARNs that are excluded from having their image pull times recorded.
        @[JSON::Field(key: "pullTimeUpdateExclusions")]
        getter pull_time_update_exclusions : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @pull_time_update_exclusions : Array(String)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently,
        # the only supported resource is an Amazon ECR repository.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about a package vulnerability finding.
      struct PackageVulnerabilityDetails
        include JSON::Serializable

        # An object that contains details about the CVSS score of a finding.
        @[JSON::Field(key: "cvss")]
        getter cvss : Array(Types::CvssScore)?

        # One or more URLs that contain details about this vulnerability type.
        @[JSON::Field(key: "referenceUrls")]
        getter reference_urls : Array(String)?

        # One or more vulnerabilities related to the one identified in this finding.
        @[JSON::Field(key: "relatedVulnerabilities")]
        getter related_vulnerabilities : Array(String)?

        # The source of the vulnerability information.
        @[JSON::Field(key: "source")]
        getter source : String?

        # A URL to the source of the vulnerability information.
        @[JSON::Field(key: "sourceUrl")]
        getter source_url : String?

        # The date and time that this vulnerability was first added to the vendor's database.
        @[JSON::Field(key: "vendorCreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter vendor_created_at : Time?

        # The severity the vendor has given to this vulnerability type.
        @[JSON::Field(key: "vendorSeverity")]
        getter vendor_severity : String?

        # The date and time the vendor last updated this vulnerability in their database.
        @[JSON::Field(key: "vendorUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter vendor_updated_at : Time?

        # The ID given to this vulnerability.
        @[JSON::Field(key: "vulnerabilityId")]
        getter vulnerability_id : String?

        # The packages impacted by this vulnerability.
        @[JSON::Field(key: "vulnerablePackages")]
        getter vulnerable_packages : Array(Types::VulnerablePackage)?

        def initialize(
          @cvss : Array(Types::CvssScore)? = nil,
          @reference_urls : Array(String)? = nil,
          @related_vulnerabilities : Array(String)? = nil,
          @source : String? = nil,
          @source_url : String? = nil,
          @vendor_created_at : Time? = nil,
          @vendor_severity : String? = nil,
          @vendor_updated_at : Time? = nil,
          @vulnerability_id : String? = nil,
          @vulnerable_packages : Array(Types::VulnerablePackage)? = nil
        )
        end
      end

      # The details of a pull through cache rule.
      struct PullThroughCacheRule
        include JSON::Serializable

        # The date and time the pull through cache was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ARN of the Secrets Manager secret associated with the pull through cache rule.
        @[JSON::Field(key: "credentialArn")]
        getter credential_arn : String?

        # The ARN of the IAM role associated with the pull through cache rule.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The Amazon ECR repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String?

        # The Amazon Web Services account ID associated with the registry the pull through cache rule is
        # associated with.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The date and time, in JavaScript date format, when the pull through cache rule was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The name of the upstream source registry associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRegistry")]
        getter upstream_registry : String?

        # The upstream registry URL associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRegistryUrl")]
        getter upstream_registry_url : String?

        # The upstream repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRepositoryPrefix")]
        getter upstream_repository_prefix : String?

        def initialize(
          @created_at : Time? = nil,
          @credential_arn : String? = nil,
          @custom_role_arn : String? = nil,
          @ecr_repository_prefix : String? = nil,
          @registry_id : String? = nil,
          @updated_at : Time? = nil,
          @upstream_registry : String? = nil,
          @upstream_registry_url : String? = nil,
          @upstream_repository_prefix : String? = nil
        )
        end
      end

      # A pull through cache rule with these settings already exists for the private registry.
      struct PullThroughCacheRuleAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The pull through cache rule was not found. Specify a valid pull through cache rule and try again.
      struct PullThroughCacheRuleNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct PutAccountSettingRequest
        include JSON::Serializable

        # The name of the account setting, such as BASIC_SCAN_TYPE_VERSION or REGISTRY_POLICY_SCOPE .
        @[JSON::Field(key: "name")]
        getter name : String

        # Setting value that is specified. The following are valid values for the basic scan type being used:
        # AWS_NATIVE or CLAIR . The following are valid values for the registry policy scope being used: V1 or
        # V2 .
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      struct PutAccountSettingResponse
        include JSON::Serializable

        # Retrieves the name of the account setting.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Retrieves the value of the specified account setting.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct PutImageRequest
        include JSON::Serializable

        # The image manifest corresponding to the image to be uploaded.
        @[JSON::Field(key: "imageManifest")]
        getter image_manifest : String

        # The name of the repository in which to put the image.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The image digest of the image manifest corresponding to the image.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # The media type of the image manifest. If you push an image manifest that does not contain the
        # mediaType field, you must specify the imageManifestMediaType in the request.
        @[JSON::Field(key: "imageManifestMediaType")]
        getter image_manifest_media_type : String?

        # The tag to associate with the image. This parameter is optional.
        @[JSON::Field(key: "imageTag")]
        getter image_tag : String?

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to put the image. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_manifest : String,
          @repository_name : String,
          @image_digest : String? = nil,
          @image_manifest_media_type : String? = nil,
          @image_tag : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct PutImageResponse
        include JSON::Serializable

        # Details of the image uploaded.
        @[JSON::Field(key: "image")]
        getter image : Types::Image?

        def initialize(
          @image : Types::Image? = nil
        )
        end
      end

      struct PutImageScanningConfigurationRequest
        include JSON::Serializable

        # The image scanning configuration for the repository. This setting determines whether images are
        # scanned for known vulnerabilities after being pushed to the repository.
        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration

        # The name of the repository in which to update the image scanning configuration setting.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to update the image scanning configuration setting. If you do not specify a registry, the
        # default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_scanning_configuration : Types::ImageScanningConfiguration,
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct PutImageScanningConfigurationResponse
        include JSON::Serializable

        # The image scanning configuration setting for the repository.
        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct PutImageTagMutabilityRequest
        include JSON::Serializable

        # The tag mutability setting for the repository. If MUTABLE is specified, image tags can be
        # overwritten. If IMMUTABLE is specified, all image tags within the repository will be immutable which
        # will prevent them from being overwritten.
        @[JSON::Field(key: "imageTagMutability")]
        getter image_tag_mutability : String

        # The name of the repository in which to update the image tag mutability settings.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # A list of filters that specify which image tags should be excluded from the image tag mutability
        # setting being applied.
        @[JSON::Field(key: "imageTagMutabilityExclusionFilters")]
        getter image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)?

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to update the image tag mutability settings. If you do not specify a registry, the default
        # registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_tag_mutability : String,
          @repository_name : String,
          @image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct PutImageTagMutabilityResponse
        include JSON::Serializable

        # The image tag mutability setting for the repository.
        @[JSON::Field(key: "imageTagMutability")]
        getter image_tag_mutability : String?

        # The list of filters that specify which image tags are excluded from the repository's image tag
        # mutability setting.
        @[JSON::Field(key: "imageTagMutabilityExclusionFilters")]
        getter image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @image_tag_mutability : String? = nil,
          @image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct PutLifecyclePolicyRequest
        include JSON::Serializable

        # The JSON repository policy text to apply to the repository.
        @[JSON::Field(key: "lifecyclePolicyText")]
        getter lifecycle_policy_text : String

        # The name of the repository to receive the policy.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do&#x2028; not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @lifecycle_policy_text : String,
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct PutLifecyclePolicyResponse
        include JSON::Serializable

        # The JSON repository policy text.
        @[JSON::Field(key: "lifecyclePolicyText")]
        getter lifecycle_policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @lifecycle_policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct PutRegistryPolicyRequest
        include JSON::Serializable

        # The JSON policy text to apply to your registry. The policy text follows the same format as IAM
        # policy text. For more information, see Registry permissions in the Amazon Elastic Container Registry
        # User Guide .
        @[JSON::Field(key: "policyText")]
        getter policy_text : String

        def initialize(
          @policy_text : String
        )
        end
      end

      struct PutRegistryPolicyResponse
        include JSON::Serializable

        # The JSON policy text for your registry.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct PutRegistryScanningConfigurationRequest
        include JSON::Serializable

        # The scanning rules to use for the registry. A scanning rule is used to determine which repository
        # filters are used and at what frequency scanning will occur.
        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::RegistryScanningRule)?

        # The scanning type to set for the registry. When a registry scanning configuration is not defined, by
        # default the BASIC scan type is used. When basic scanning is used, you may specify filters to
        # determine which individual repositories, or all repositories, are scanned when new images are pushed
        # to those repositories. Alternatively, you can do manual scans of images with basic scanning. When
        # the ENHANCED scan type is set, Amazon Inspector provides automated vulnerability scanning. You may
        # choose between continuous scanning or scan on push and you may specify filters to determine which
        # individual repositories, or all repositories, are scanned.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        def initialize(
          @rules : Array(Types::RegistryScanningRule)? = nil,
          @scan_type : String? = nil
        )
        end
      end

      struct PutRegistryScanningConfigurationResponse
        include JSON::Serializable

        # The scanning configuration for your registry.
        @[JSON::Field(key: "registryScanningConfiguration")]
        getter registry_scanning_configuration : Types::RegistryScanningConfiguration?

        def initialize(
          @registry_scanning_configuration : Types::RegistryScanningConfiguration? = nil
        )
        end
      end

      struct PutReplicationConfigurationRequest
        include JSON::Serializable

        # An object representing the replication configuration for a registry.
        @[JSON::Field(key: "replicationConfiguration")]
        getter replication_configuration : Types::ReplicationConfiguration

        def initialize(
          @replication_configuration : Types::ReplicationConfiguration
        )
        end
      end

      struct PutReplicationConfigurationResponse
        include JSON::Serializable

        # The contents of the replication configuration for the registry.
        @[JSON::Field(key: "replicationConfiguration")]
        getter replication_configuration : Types::ReplicationConfiguration?

        def initialize(
          @replication_configuration : Types::ReplicationConfiguration? = nil
        )
        end
      end

      struct PutSigningConfigurationRequest
        include JSON::Serializable

        # The signing configuration to assign to the registry.
        @[JSON::Field(key: "signingConfiguration")]
        getter signing_configuration : Types::SigningConfiguration

        def initialize(
          @signing_configuration : Types::SigningConfiguration
        )
        end
      end

      struct PutSigningConfigurationResponse
        include JSON::Serializable

        # The registry's updated signing configuration.
        @[JSON::Field(key: "signingConfiguration")]
        getter signing_configuration : Types::SigningConfiguration?

        def initialize(
          @signing_configuration : Types::SigningConfiguration? = nil
        )
        end
      end

      # Details about the recommended course of action to remediate the finding.
      struct Recommendation
        include JSON::Serializable

        # The recommended course of action to remediate the finding.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The URL address to the CVE remediation recommendations.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @text : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The manifest list is referencing an image that does not exist.
      struct ReferencedImagesNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct RegisterPullTimeUpdateExclusionRequest
        include JSON::Serializable

        # The ARN of the IAM principal to exclude from having image pull times recorded.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        def initialize(
          @principal_arn : String
        )
        end
      end

      struct RegisterPullTimeUpdateExclusionResponse
        include JSON::Serializable

        # The date and time, expressed in standard JavaScript date format, when the exclusion was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ARN of the IAM principal that was added to the pull time update exclusion list.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @created_at : Time? = nil,
          @principal_arn : String? = nil
        )
        end
      end

      # The registry doesn't have an associated registry policy.
      struct RegistryPolicyNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The scanning configuration for a private registry.
      struct RegistryScanningConfiguration
        include JSON::Serializable

        # The scanning rules associated with the registry.
        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::RegistryScanningRule)?

        # The type of scanning configured for the registry.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        def initialize(
          @rules : Array(Types::RegistryScanningRule)? = nil,
          @scan_type : String? = nil
        )
        end
      end

      # The details of a scanning rule for a private registry.
      struct RegistryScanningRule
        include JSON::Serializable

        # The repository filters associated with the scanning configuration for a private registry.
        @[JSON::Field(key: "repositoryFilters")]
        getter repository_filters : Array(Types::ScanningRepositoryFilter)

        # The frequency that scans are performed at for a private registry. When the ENHANCED scan type is
        # specified, the supported scan frequencies are CONTINUOUS_SCAN and SCAN_ON_PUSH . When the BASIC scan
        # type is specified, the SCAN_ON_PUSH scan frequency is supported. If scan on push is not specified,
        # then the MANUAL scan frequency is set by default.
        @[JSON::Field(key: "scanFrequency")]
        getter scan_frequency : String

        def initialize(
          @repository_filters : Array(Types::ScanningRepositoryFilter),
          @scan_frequency : String
        )
        end
      end

      # Information on how to remediate a finding.
      struct Remediation
        include JSON::Serializable

        # An object that contains information about the recommended course of action to remediate the finding.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::Recommendation?

        def initialize(
          @recommendation : Types::Recommendation? = nil
        )
        end
      end

      # The replication configuration for a registry.
      struct ReplicationConfiguration
        include JSON::Serializable

        # An array of objects representing the replication destinations and repository filters for a
        # replication configuration.
        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::ReplicationRule)

        def initialize(
          @rules : Array(Types::ReplicationRule)
        )
        end
      end

      # An array of objects representing the destination for a replication rule.
      struct ReplicationDestination
        include JSON::Serializable

        # The Region to replicate to.
        @[JSON::Field(key: "region")]
        getter region : String

        # The Amazon Web Services account ID of the Amazon ECR private registry to replicate to. When
        # configuring cross-Region replication within your own registry, specify your own account ID.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String

        def initialize(
          @region : String,
          @registry_id : String
        )
        end
      end

      # An array of objects representing the replication destinations and repository filters for a
      # replication configuration.
      struct ReplicationRule
        include JSON::Serializable

        # An array of objects representing the destination for a replication rule.
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::ReplicationDestination)

        # An array of objects representing the filters for a replication rule. Specifying a repository filter
        # for a replication rule provides a method for controlling which repositories in a private registry
        # are replicated.
        @[JSON::Field(key: "repositoryFilters")]
        getter repository_filters : Array(Types::RepositoryFilter)?

        def initialize(
          @destinations : Array(Types::ReplicationDestination),
          @repository_filters : Array(Types::RepositoryFilter)? = nil
        )
        end
      end

      # An object representing a repository.
      struct Repository
        include JSON::Serializable

        # The date and time, in JavaScript date format, when the repository was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The encryption configuration for the repository. This determines how the contents of your repository
        # are encrypted at rest.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        @[JSON::Field(key: "imageScanningConfiguration")]
        getter image_scanning_configuration : Types::ImageScanningConfiguration?

        # The tag mutability setting for the repository.
        @[JSON::Field(key: "imageTagMutability")]
        getter image_tag_mutability : String?

        # A list of filters that specify which image tags are excluded from the repository's image tag
        # mutability setting.
        @[JSON::Field(key: "imageTagMutabilityExclusionFilters")]
        getter image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)?

        # The Amazon Web Services account ID associated with the registry that contains the repository.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The Amazon Resource Name (ARN) that identifies the repository. The ARN contains the arn:aws:ecr
        # namespace, followed by the region of the repository, Amazon Web Services account ID of the
        # repository owner, repository namespace, and repository name. For example,
        # arn:aws:ecr:region:012345678910:repository-namespace/repository-name .
        @[JSON::Field(key: "repositoryArn")]
        getter repository_arn : String?

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The URI for the repository. You can use this URI for container image push and pull operations.
        @[JSON::Field(key: "repositoryUri")]
        getter repository_uri : String?

        def initialize(
          @created_at : Time? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
          @image_tag_mutability : String? = nil,
          @image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
          @registry_id : String? = nil,
          @repository_arn : String? = nil,
          @repository_name : String? = nil,
          @repository_uri : String? = nil
        )
        end
      end

      # The specified repository already exists in the specified registry.
      struct RepositoryAlreadyExistsException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of the repository creation template associated with the request.
      struct RepositoryCreationTemplate
        include JSON::Serializable

        # A list of enumerable Strings representing the repository creation scenarios that this template will
        # apply towards. The supported scenarios are PULL_THROUGH_CACHE, REPLICATION, and CREATE_ON_PUSH
        @[JSON::Field(key: "appliedFor")]
        getter applied_for : Array(String)?

        # The date and time, in JavaScript date format, when the repository creation template was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ARN of the role to be assumed by Amazon ECR. Amazon ECR will assume your supplied role when the
        # customRoleArn is specified. When this field isn't specified, Amazon ECR will use the service-linked
        # role for the repository creation template.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The description associated with the repository creation template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The encryption configuration associated with the repository creation template.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate?

        # The tag mutability setting for the repository. If this parameter is omitted, the default setting of
        # MUTABLE will be used which will allow image tags to be overwritten. If IMMUTABLE is specified, all
        # image tags within the repository will be immutable which will prevent them from being overwritten.
        @[JSON::Field(key: "imageTagMutability")]
        getter image_tag_mutability : String?

        # A list of filters that specify which image tags are excluded from the repository creation template's
        # image tag mutability setting.
        @[JSON::Field(key: "imageTagMutabilityExclusionFilters")]
        getter image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)?

        # The lifecycle policy to use for repositories created using the template.
        @[JSON::Field(key: "lifecyclePolicy")]
        getter lifecycle_policy : String?

        # The repository namespace prefix associated with the repository creation template.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # The repository policy to apply to repositories created using the template. A repository policy is a
        # permissions policy associated with a repository to control access permissions.
        @[JSON::Field(key: "repositoryPolicy")]
        getter repository_policy : String?

        # The metadata to apply to the repository to help you categorize and organize. Each tag consists of a
        # key and an optional value, both of which you define. Tag keys can have a maximum character length of
        # 128 characters, and tag values can have a maximum length of 256 characters.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::Tag)?

        # The date and time, in JavaScript date format, when the repository creation template was last
        # updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @applied_for : Array(String)? = nil,
          @created_at : Time? = nil,
          @custom_role_arn : String? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate? = nil,
          @image_tag_mutability : String? = nil,
          @image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
          @lifecycle_policy : String? = nil,
          @prefix : String? = nil,
          @repository_policy : String? = nil,
          @resource_tags : Array(Types::Tag)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The filter settings used with image replication. Specifying a repository filter to a replication
      # rule provides a method for controlling which repositories in a private registry are replicated. If
      # no filters are added, the contents of all repositories are replicated.
      struct RepositoryFilter
        include JSON::Serializable

        # The repository filter details. When the PREFIX_MATCH filter type is specified, this value is
        # required and should be the repository name prefix to configure replication for.
        @[JSON::Field(key: "filter")]
        getter filter : String

        # The repository filter type. The only supported value is PREFIX_MATCH , which is a repository name
        # prefix specified with the filter parameter.
        @[JSON::Field(key: "filterType")]
        getter filter_type : String

        def initialize(
          @filter : String,
          @filter_type : String
        )
        end
      end

      # The specified repository contains images. To delete a repository that contains images, you must
      # force the deletion with the force parameter.
      struct RepositoryNotEmptyException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified repository could not be found. Check the spelling of the specified repository and
      # ensure that you are performing operations on the correct registry.
      struct RepositoryNotFoundException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified repository and registry combination does not have an associated repository policy.
      struct RepositoryPolicyNotFoundException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of the scanning configuration for a repository.
      struct RepositoryScanningConfiguration
        include JSON::Serializable

        # The scan filters applied to the repository.
        @[JSON::Field(key: "appliedScanFilters")]
        getter applied_scan_filters : Array(Types::ScanningRepositoryFilter)?

        # The ARN of the repository.
        @[JSON::Field(key: "repositoryArn")]
        getter repository_arn : String?

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The scan frequency for the repository.
        @[JSON::Field(key: "scanFrequency")]
        getter scan_frequency : String?

        # Whether or not scan on push is configured for the repository.
        @[JSON::Field(key: "scanOnPush")]
        getter scan_on_push : Bool?

        def initialize(
          @applied_scan_filters : Array(Types::ScanningRepositoryFilter)? = nil,
          @repository_arn : String? = nil,
          @repository_name : String? = nil,
          @scan_frequency : String? = nil,
          @scan_on_push : Bool? = nil
        )
        end
      end

      # The details about any failures associated with the scanning configuration of a repository.
      struct RepositoryScanningConfigurationFailure
        include JSON::Serializable

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The reason for the failure.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Details about the resource involved in a finding.
      struct Resource
        include JSON::Serializable

        # An object that contains details about the resource involved in a finding.
        @[JSON::Field(key: "details")]
        getter details : Types::ResourceDetails?

        # The ID of the resource.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The tags attached to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of resource.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @details : Types::ResourceDetails? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains details about the resource involved in the finding.
      struct ResourceDetails
        include JSON::Serializable

        # An object that contains details about the Amazon ECR container image involved in the finding.
        @[JSON::Field(key: "awsEcrContainerImage")]
        getter aws_ecr_container_image : Types::AwsEcrContainerImageDetails?

        def initialize(
          @aws_ecr_container_image : Types::AwsEcrContainerImageDetails? = nil
        )
        end
      end

      # The specified image scan could not be found. Ensure that image scanning is enabled on the repository
      # and try again.
      struct ScanNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of a scanning repository filter. For more information on how to use filters, see Using
      # filters in the Amazon Elastic Container Registry User Guide .
      struct ScanningRepositoryFilter
        include JSON::Serializable

        # The filter to use when scanning.
        @[JSON::Field(key: "filter")]
        getter filter : String

        # The type associated with the filter.
        @[JSON::Field(key: "filterType")]
        getter filter_type : String

        def initialize(
          @filter : String,
          @filter_type : String
        )
        end
      end

      # Information about the Amazon Inspector score given to a finding.
      struct ScoreDetails
        include JSON::Serializable

        # An object that contains details about the CVSS score given to a finding.
        @[JSON::Field(key: "cvss")]
        getter cvss : Types::CvssScoreDetails?

        def initialize(
          @cvss : Types::CvssScoreDetails? = nil
        )
        end
      end

      # The ARN of the secret specified in the pull through cache rule was not found. Update the pull
      # through cache rule with a valid secret ARN and try again.
      struct SecretNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # These errors are usually caused by a server-side issue.
      struct ServerException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct SetRepositoryPolicyRequest
        include JSON::Serializable

        # The JSON repository policy text to apply to the repository. For more information, see Amazon ECR
        # repository policies in the Amazon Elastic Container Registry User Guide .
        @[JSON::Field(key: "policyText")]
        getter policy_text : String

        # The name of the repository to receive the policy.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # If the policy you are attempting to set on a repository policy would prevent you from setting
        # another policy in the future, you must force the SetRepositoryPolicy operation. This is intended to
        # prevent accidental repository lock outs.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @policy_text : String,
          @repository_name : String,
          @force : Bool? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct SetRepositoryPolicyResponse
        include JSON::Serializable

        # The JSON repository policy text applied to the repository.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # The signing configuration for a registry, which specifies rules for automatically signing images
      # when pushed.
      struct SigningConfiguration
        include JSON::Serializable

        # A list of signing rules. Each rule defines a signing profile and optional repository filters that
        # determine which images are automatically signed. Maximum of 10 rules.
        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::SigningRule)

        def initialize(
          @rules : Array(Types::SigningRule)
        )
        end
      end

      # The specified signing configuration was not found. This occurs when attempting to retrieve or delete
      # a signing configuration that does not exist.
      struct SigningConfigurationNotFoundException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A repository filter used to determine which repositories have their images automatically signed on
      # push. Each filter consists of a filter type and filter value.
      struct SigningRepositoryFilter
        include JSON::Serializable

        # The filter value used to match repository names. When using WILDCARD_MATCH , the * character matches
        # any sequence of characters. Examples: myapp/* - Matches all repositories starting with myapp/
        # */production - Matches all repositories ending with /production *prod* - Matches all repositories
        # containing prod
        @[JSON::Field(key: "filter")]
        getter filter : String

        # The type of filter to apply. Currently, only WILDCARD_MATCH is supported, which uses wildcard
        # patterns to match repository names.
        @[JSON::Field(key: "filterType")]
        getter filter_type : String

        def initialize(
          @filter : String,
          @filter_type : String
        )
        end
      end

      # A signing rule that specifies a signing profile and optional repository filters. When an image is
      # pushed to a matching repository, a signing job is created using the specified profile.
      struct SigningRule
        include JSON::Serializable

        # The ARN of the Amazon Web Services Signer signing profile to use for signing images that match this
        # rule. For more information about signing profiles, see Signing profiles in the Amazon Web Services
        # Signer Developer Guide .
        @[JSON::Field(key: "signingProfileArn")]
        getter signing_profile_arn : String

        # A list of repository filters that determine which repositories have their images signed on push. If
        # no filters are specified, all images pushed to the registry are signed using the rule's signing
        # profile. Maximum of 100 filters per rule.
        @[JSON::Field(key: "repositoryFilters")]
        getter repository_filters : Array(Types::SigningRepositoryFilter)?

        def initialize(
          @signing_profile_arn : String,
          @repository_filters : Array(Types::SigningRepositoryFilter)? = nil
        )
        end
      end

      struct StartImageScanRequest
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier

        # The name of the repository that contains the images to scan.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID associated with the registry that contains the repository in
        # which to start an image scan request. If you do not specify a registry, the default registry is
        # assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_id : Types::ImageIdentifier,
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct StartImageScanResponse
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        # The current state of the scan.
        @[JSON::Field(key: "imageScanStatus")]
        getter image_scan_status : Types::ImageScanStatus?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @image_id : Types::ImageIdentifier? = nil,
          @image_scan_status : Types::ImageScanStatus? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct StartLifecyclePolicyPreviewRequest
        include JSON::Serializable

        # The name of the repository to be evaluated.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The policy to be evaluated against. If you do not specify a policy, the current policy for the
        # repository is used.
        @[JSON::Field(key: "lifecyclePolicyText")]
        getter lifecycle_policy_text : String?

        # The Amazon Web Services account ID associated with the registry that contains the repository. If you
        # do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @lifecycle_policy_text : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct StartLifecyclePolicyPreviewResponse
        include JSON::Serializable

        # The JSON repository policy text.
        @[JSON::Field(key: "lifecyclePolicyText")]
        getter lifecycle_policy_text : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The status of the lifecycle policy preview request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @lifecycle_policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An object that identifies an image subject.
      struct SubjectIdentifier
        include JSON::Serializable

        # The digest of the image.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String

        def initialize(
          @image_digest : String
        )
        end
      end

      # The metadata to apply to a resource to help you categorize and organize them. Each tag consists of a
      # key and a value, both of which you define. Tag keys can have a maximum character length of 128
      # characters, and tag values can have a maximum length of 256 characters.
      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "Key")]
        getter key : String

        # A value acts as a descriptor within a tag category (key).
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the the resource to which to add tags. Currently, the only
        # supported resource is an Amazon ECR repository.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have a maximum
        # character length of 128 characters, and tag values can have a maximum length of 256 characters.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The repository creation template already exists. Specify a unique prefix and try again.
      struct TemplateAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified repository creation template can't be found. Verify the registry ID and prefix and try
      # again.
      struct TemplateNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The list of tags on the repository is over the limit. The maximum number of tags that can be applied
      # to a repository is 50.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The total count of images transitioning to a storage class.
      struct TransitioningImageTotalCount
        include JSON::Serializable

        # The total number of images transitioning to the storage class.
        @[JSON::Field(key: "imageTotalCount")]
        getter image_total_count : Int32?

        # The target storage class.
        @[JSON::Field(key: "targetStorageClass")]
        getter target_storage_class : String?

        def initialize(
          @image_total_count : Int32? = nil,
          @target_storage_class : String? = nil
        )
        end
      end

      # The secret is unable to be accessed. Verify the resource permissions for the secret and try again.
      struct UnableToAccessSecretException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The secret is accessible but is unable to be decrypted. Verify the resource permisisons and try
      # again.
      struct UnableToDecryptSecretValueException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The image or images were unable to be pulled using the pull through cache rule. This is usually
      # caused because of an issue with the Secrets Manager secret containing the credentials for the
      # upstream registry.
      struct UnableToGetUpstreamImageException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There was an issue getting the upstream layer matching the pull through cache rule.
      struct UnableToGetUpstreamLayerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The image is of a type that cannot be scanned.
      struct UnsupportedImageTypeException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified upstream registry isn't supported.
      struct UnsupportedUpstreamRegistryException
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

        # The Amazon Resource Name (ARN) of the resource from which to remove tags. Currently, the only
        # supported resource is an Amazon ECR repository.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to be removed.
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

      struct UpdateImageStorageClassRequest
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier

        # The name of the repository that contains the image to transition.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The target storage class for the image.
        @[JSON::Field(key: "targetStorageClass")]
        getter target_storage_class : String

        # The Amazon Web Services account ID associated with the registry that contains the image to
        # transition. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @image_id : Types::ImageIdentifier,
          @repository_name : String,
          @target_storage_class : String,
          @registry_id : String? = nil
        )
        end
      end

      struct UpdateImageStorageClassResponse
        include JSON::Serializable

        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        # The current status of the image after the call to UpdateImageStorageClass is complete. Valid values
        # are ACTIVE , ARCHIVED , and ACTIVATING .
        @[JSON::Field(key: "imageStatus")]
        getter image_status : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @image_id : Types::ImageIdentifier? = nil,
          @image_status : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      struct UpdatePullThroughCacheRuleRequest
        include JSON::Serializable

        # The repository name prefix to use when caching images from the source registry.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret that identifies the
        # credentials to authenticate to the upstream registry.
        @[JSON::Field(key: "credentialArn")]
        getter credential_arn : String?

        # Amazon Resource Name (ARN) of the IAM role to be assumed by Amazon ECR to authenticate to the ECR
        # upstream registry. This role must be in the same account as the registry that you are configuring.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The Amazon Web Services account ID associated with the registry associated with the pull through
        # cache rule. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @ecr_repository_prefix : String,
          @credential_arn : String? = nil,
          @custom_role_arn : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct UpdatePullThroughCacheRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret associated with the
        # pull through cache rule.
        @[JSON::Field(key: "credentialArn")]
        getter credential_arn : String?

        # The ARN of the IAM role associated with the pull through cache rule.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The Amazon ECR repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The date and time, in JavaScript date format, when the pull through cache rule was updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The upstream repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRepositoryPrefix")]
        getter upstream_repository_prefix : String?

        def initialize(
          @credential_arn : String? = nil,
          @custom_role_arn : String? = nil,
          @ecr_repository_prefix : String? = nil,
          @registry_id : String? = nil,
          @updated_at : Time? = nil,
          @upstream_repository_prefix : String? = nil
        )
        end
      end

      struct UpdateRepositoryCreationTemplateRequest
        include JSON::Serializable

        # The repository namespace prefix that matches an existing repository creation template in the
        # registry. All repositories created using this namespace prefix will have the settings defined in
        # this template applied. For example, a prefix of prod would apply to all repositories beginning with
        # prod/ . This includes a repository named prod/team1 as well as a repository named prod/repository1 .
        # To apply a template to all repositories in your registry that don't have an associated creation
        # template, you can use ROOT as the prefix.
        @[JSON::Field(key: "prefix")]
        getter prefix : String

        # Updates the list of enumerable strings representing the Amazon ECR repository creation scenarios
        # that this template will apply towards. The supported scenarios are PULL_THROUGH_CACHE , REPLICATION
        # , and CREATE_ON_PUSH
        @[JSON::Field(key: "appliedFor")]
        getter applied_for : Array(String)?

        # The ARN of the role to be assumed by Amazon ECR. This role must be in the same account as the
        # registry that you are configuring. Amazon ECR will assume your supplied role when the customRoleArn
        # is specified. When this field isn't specified, Amazon ECR will use the service-linked role for the
        # repository creation template.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # A description for the repository creation template.
        @[JSON::Field(key: "description")]
        getter description : String?

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate?

        # Updates the tag mutability setting for the repository. If this parameter is omitted, the default
        # setting of MUTABLE will be used which will allow image tags to be overwritten. If IMMUTABLE is
        # specified, all image tags within the repository will be immutable which will prevent them from being
        # overwritten.
        @[JSON::Field(key: "imageTagMutability")]
        getter image_tag_mutability : String?

        # A list of filters that specify which image tags should be excluded from the repository creation
        # template's image tag mutability setting.
        @[JSON::Field(key: "imageTagMutabilityExclusionFilters")]
        getter image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)?

        # Updates the lifecycle policy associated with the specified repository creation template.
        @[JSON::Field(key: "lifecyclePolicy")]
        getter lifecycle_policy : String?

        # Updates the repository policy created using the template. A repository policy is a permissions
        # policy associated with a repository to control access permissions.
        @[JSON::Field(key: "repositoryPolicy")]
        getter repository_policy : String?

        # The metadata to apply to the repository to help you categorize and organize. Each tag consists of a
        # key and an optional value, both of which you define. Tag keys can have a maximum character length of
        # 128 characters, and tag values can have a maximum length of 256 characters.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::Tag)?

        def initialize(
          @prefix : String,
          @applied_for : Array(String)? = nil,
          @custom_role_arn : String? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate? = nil,
          @image_tag_mutability : String? = nil,
          @image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
          @lifecycle_policy : String? = nil,
          @repository_policy : String? = nil,
          @resource_tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct UpdateRepositoryCreationTemplateResponse
        include JSON::Serializable

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The details of the repository creation template associated with the request.
        @[JSON::Field(key: "repositoryCreationTemplate")]
        getter repository_creation_template : Types::RepositoryCreationTemplate?

        def initialize(
          @registry_id : String? = nil,
          @repository_creation_template : Types::RepositoryCreationTemplate? = nil
        )
        end
      end

      struct UploadLayerPartRequest
        include JSON::Serializable

        # The base64-encoded layer part payload.
        @[JSON::Field(key: "layerPartBlob")]
        getter layer_part_blob : Bytes

        # The position of the first byte of the layer part witin the overall image layer.
        @[JSON::Field(key: "partFirstByte")]
        getter part_first_byte : Int64

        # The position of the last byte of the layer part within the overall image layer.
        @[JSON::Field(key: "partLastByte")]
        getter part_last_byte : Int64

        # The name of the repository to which you are uploading layer parts.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The upload ID from a previous InitiateLayerUpload operation to associate with the layer part upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The Amazon Web Services account ID associated with the registry to which you are uploading layer
        # parts. If you do not specify a registry, the default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @layer_part_blob : Bytes,
          @part_first_byte : Int64,
          @part_last_byte : Int64,
          @repository_name : String,
          @upload_id : String,
          @registry_id : String? = nil
        )
        end
      end

      struct UploadLayerPartResponse
        include JSON::Serializable

        # The integer value of the last byte received in the request.
        @[JSON::Field(key: "lastByteReceived")]
        getter last_byte_received : Int64?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The upload ID associated with the request.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String?

        def initialize(
          @last_byte_received : Int64? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil,
          @upload_id : String? = nil
        )
        end
      end

      # The upload could not be found, or the specified upload ID is not valid for this repository.
      struct UploadNotFoundException
        include JSON::Serializable

        # The error message associated with the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ValidatePullThroughCacheRuleRequest
        include JSON::Serializable

        # The repository name prefix associated with the pull through cache rule.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String

        # The registry ID associated with the pull through cache rule. If you do not specify a registry, the
        # default registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @ecr_repository_prefix : String,
          @registry_id : String? = nil
        )
        end
      end

      struct ValidatePullThroughCacheRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret associated with the
        # pull through cache rule.
        @[JSON::Field(key: "credentialArn")]
        getter credential_arn : String?

        # The ARN of the IAM role associated with the pull through cache rule.
        @[JSON::Field(key: "customRoleArn")]
        getter custom_role_arn : String?

        # The Amazon ECR repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String?

        # The reason the validation failed. For more details about possible causes and how to address them,
        # see Using pull through cache rules in the Amazon Elastic Container Registry User Guide .
        @[JSON::Field(key: "failure")]
        getter failure : String?

        # Whether or not the pull through cache rule was validated. If true , Amazon ECR was able to reach the
        # upstream registry and authentication was successful. If false , there was an issue and validation
        # failed. The failure reason indicates the cause.
        @[JSON::Field(key: "isValid")]
        getter is_valid : Bool?

        # The registry ID associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The upstream registry URL associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRegistryUrl")]
        getter upstream_registry_url : String?

        # The upstream repository prefix associated with the pull through cache rule.
        @[JSON::Field(key: "upstreamRepositoryPrefix")]
        getter upstream_repository_prefix : String?

        def initialize(
          @credential_arn : String? = nil,
          @custom_role_arn : String? = nil,
          @ecr_repository_prefix : String? = nil,
          @failure : String? = nil,
          @is_valid : Bool? = nil,
          @registry_id : String? = nil,
          @upstream_registry_url : String? = nil,
          @upstream_repository_prefix : String? = nil
        )
        end
      end

      # There was an exception validating this request.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information on the vulnerable package identified by a finding.
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
          @source_layer_hash : String? = nil,
          @version : String? = nil
        )
        end
      end
    end
  end
end
