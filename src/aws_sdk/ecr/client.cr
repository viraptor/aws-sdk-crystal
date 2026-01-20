module AwsSdk
  module ECR
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

      # Checks the availability of one or more image layers in a repository. When an image is pushed to a
      # repository, each image layer is checked to verify if it has been uploaded before. If it has been
      # uploaded, then the image layer is skipped. This operation is used by the Amazon ECR proxy and is not
      # generally used by customers for pulling and pushing images. In most cases, you should use the docker
      # CLI to pull, tag, and push images.

      def batch_check_layer_availability(
        layer_digests : Array(String),
        repository_name : String,
        registry_id : String? = nil
      ) : Types::BatchCheckLayerAvailabilityResponse

        input = Types::BatchCheckLayerAvailabilityRequest.new(layer_digests: layer_digests, repository_name: repository_name, registry_id: registry_id)
        batch_check_layer_availability(input)
      end

      def batch_check_layer_availability(input : Types::BatchCheckLayerAvailabilityRequest) : Types::BatchCheckLayerAvailabilityResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_CHECK_LAYER_AVAILABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchCheckLayerAvailabilityResponse, "BatchCheckLayerAvailability")
      end

      # Deletes a list of specified images within a repository. Images are specified with either an imageTag
      # or imageDigest . You can remove a tag from an image by specifying the image's tag in your request.
      # When you remove the last tag from an image, the image is deleted from your repository. You can
      # completely delete an image (and all of its tags) by specifying the image's digest in your request.

      def batch_delete_image(
        image_ids : Array(Types::ImageIdentifier),
        repository_name : String,
        registry_id : String? = nil
      ) : Types::BatchDeleteImageResponse

        input = Types::BatchDeleteImageRequest.new(image_ids: image_ids, repository_name: repository_name, registry_id: registry_id)
        batch_delete_image(input)
      end

      def batch_delete_image(input : Types::BatchDeleteImageRequest) : Types::BatchDeleteImageResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteImageResponse, "BatchDeleteImage")
      end

      # Gets detailed information for an image. Images are specified with either an imageTag or imageDigest
      # . When an image is pulled, the BatchGetImage API is called once to retrieve the image manifest.

      def batch_get_image(
        image_ids : Array(Types::ImageIdentifier),
        repository_name : String,
        accepted_media_types : Array(String)? = nil,
        registry_id : String? = nil
      ) : Types::BatchGetImageResponse

        input = Types::BatchGetImageRequest.new(image_ids: image_ids, repository_name: repository_name, accepted_media_types: accepted_media_types, registry_id: registry_id)
        batch_get_image(input)
      end

      def batch_get_image(input : Types::BatchGetImageRequest) : Types::BatchGetImageResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetImageResponse, "BatchGetImage")
      end

      # Gets the scanning configuration for one or more repositories.

      def batch_get_repository_scanning_configuration(
        repository_names : Array(String)
      ) : Types::BatchGetRepositoryScanningConfigurationResponse

        input = Types::BatchGetRepositoryScanningConfigurationRequest.new(repository_names: repository_names)
        batch_get_repository_scanning_configuration(input)
      end

      def batch_get_repository_scanning_configuration(input : Types::BatchGetRepositoryScanningConfigurationRequest) : Types::BatchGetRepositoryScanningConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_REPOSITORY_SCANNING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetRepositoryScanningConfigurationResponse, "BatchGetRepositoryScanningConfiguration")
      end

      # Informs Amazon ECR that the image layer upload has completed for a specified registry, repository
      # name, and upload ID. You can optionally provide a sha256 digest of the image layer for data
      # validation purposes. When an image is pushed, the CompleteLayerUpload API is called once per each
      # new image layer to verify that the upload has completed. This operation is used by the Amazon ECR
      # proxy and is not generally used by customers for pulling and pushing images. In most cases, you
      # should use the docker CLI to pull, tag, and push images.

      def complete_layer_upload(
        layer_digests : Array(String),
        repository_name : String,
        upload_id : String,
        registry_id : String? = nil
      ) : Types::CompleteLayerUploadResponse

        input = Types::CompleteLayerUploadRequest.new(layer_digests: layer_digests, repository_name: repository_name, upload_id: upload_id, registry_id: registry_id)
        complete_layer_upload(input)
      end

      def complete_layer_upload(input : Types::CompleteLayerUploadRequest) : Types::CompleteLayerUploadResponse
        request = Protocol::JsonRpc.build_request(Model::COMPLETE_LAYER_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CompleteLayerUploadResponse, "CompleteLayerUpload")
      end

      # Creates a pull through cache rule. A pull through cache rule provides a way to cache images from an
      # upstream registry source in your Amazon ECR private registry. For more information, see Using pull
      # through cache rules in the Amazon Elastic Container Registry User Guide .

      def create_pull_through_cache_rule(
        ecr_repository_prefix : String,
        upstream_registry_url : String,
        credential_arn : String? = nil,
        custom_role_arn : String? = nil,
        registry_id : String? = nil,
        upstream_registry : String? = nil,
        upstream_repository_prefix : String? = nil
      ) : Types::CreatePullThroughCacheRuleResponse

        input = Types::CreatePullThroughCacheRuleRequest.new(ecr_repository_prefix: ecr_repository_prefix, upstream_registry_url: upstream_registry_url, credential_arn: credential_arn, custom_role_arn: custom_role_arn, registry_id: registry_id, upstream_registry: upstream_registry, upstream_repository_prefix: upstream_repository_prefix)
        create_pull_through_cache_rule(input)
      end

      def create_pull_through_cache_rule(input : Types::CreatePullThroughCacheRuleRequest) : Types::CreatePullThroughCacheRuleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PULL_THROUGH_CACHE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePullThroughCacheRuleResponse, "CreatePullThroughCacheRule")
      end

      # Creates a repository. For more information, see Amazon ECR repositories in the Amazon Elastic
      # Container Registry User Guide .

      def create_repository(
        repository_name : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        image_scanning_configuration : Types::ImageScanningConfiguration? = nil,
        image_tag_mutability : String? = nil,
        image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
        registry_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRepositoryResponse

        input = Types::CreateRepositoryRequest.new(repository_name: repository_name, encryption_configuration: encryption_configuration, image_scanning_configuration: image_scanning_configuration, image_tag_mutability: image_tag_mutability, image_tag_mutability_exclusion_filters: image_tag_mutability_exclusion_filters, registry_id: registry_id, tags: tags)
        create_repository(input)
      end

      def create_repository(input : Types::CreateRepositoryRequest) : Types::CreateRepositoryResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRepositoryResponse, "CreateRepository")
      end

      # Creates a repository creation template. This template is used to define the settings for
      # repositories created by Amazon ECR on your behalf. For example, repositories created through pull
      # through cache actions. For more information, see Private repository creation templates in the Amazon
      # Elastic Container Registry User Guide .

      def create_repository_creation_template(
        applied_for : Array(String),
        prefix : String,
        custom_role_arn : String? = nil,
        description : String? = nil,
        encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate? = nil,
        image_tag_mutability : String? = nil,
        image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
        lifecycle_policy : String? = nil,
        repository_policy : String? = nil,
        resource_tags : Array(Types::Tag)? = nil
      ) : Types::CreateRepositoryCreationTemplateResponse

        input = Types::CreateRepositoryCreationTemplateRequest.new(applied_for: applied_for, prefix: prefix, custom_role_arn: custom_role_arn, description: description, encryption_configuration: encryption_configuration, image_tag_mutability: image_tag_mutability, image_tag_mutability_exclusion_filters: image_tag_mutability_exclusion_filters, lifecycle_policy: lifecycle_policy, repository_policy: repository_policy, resource_tags: resource_tags)
        create_repository_creation_template(input)
      end

      def create_repository_creation_template(input : Types::CreateRepositoryCreationTemplateRequest) : Types::CreateRepositoryCreationTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPOSITORY_CREATION_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRepositoryCreationTemplateResponse, "CreateRepositoryCreationTemplate")
      end

      # Deletes the lifecycle policy associated with the specified repository.

      def delete_lifecycle_policy(
        repository_name : String,
        registry_id : String? = nil
      ) : Types::DeleteLifecyclePolicyResponse

        input = Types::DeleteLifecyclePolicyRequest.new(repository_name: repository_name, registry_id: registry_id)
        delete_lifecycle_policy(input)
      end

      def delete_lifecycle_policy(input : Types::DeleteLifecyclePolicyRequest) : Types::DeleteLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLifecyclePolicyResponse, "DeleteLifecyclePolicy")
      end

      # Deletes a pull through cache rule.

      def delete_pull_through_cache_rule(
        ecr_repository_prefix : String,
        registry_id : String? = nil
      ) : Types::DeletePullThroughCacheRuleResponse

        input = Types::DeletePullThroughCacheRuleRequest.new(ecr_repository_prefix: ecr_repository_prefix, registry_id: registry_id)
        delete_pull_through_cache_rule(input)
      end

      def delete_pull_through_cache_rule(input : Types::DeletePullThroughCacheRuleRequest) : Types::DeletePullThroughCacheRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PULL_THROUGH_CACHE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePullThroughCacheRuleResponse, "DeletePullThroughCacheRule")
      end

      # Deletes the registry permissions policy.

      def delete_registry_policy : Types::DeleteRegistryPolicyResponse
        input = Types::DeleteRegistryPolicyRequest.new
        delete_registry_policy(input)
      end

      def delete_registry_policy(input : Types::DeleteRegistryPolicyRequest) : Types::DeleteRegistryPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGISTRY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegistryPolicyResponse, "DeleteRegistryPolicy")
      end

      # Deletes a repository. If the repository isn't empty, you must either delete the contents of the
      # repository or use the force option to delete the repository and have Amazon ECR delete all of its
      # contents on your behalf.

      def delete_repository(
        repository_name : String,
        force : Bool? = nil,
        registry_id : String? = nil
      ) : Types::DeleteRepositoryResponse

        input = Types::DeleteRepositoryRequest.new(repository_name: repository_name, force: force, registry_id: registry_id)
        delete_repository(input)
      end

      def delete_repository(input : Types::DeleteRepositoryRequest) : Types::DeleteRepositoryResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRepositoryResponse, "DeleteRepository")
      end

      # Deletes a repository creation template.

      def delete_repository_creation_template(
        prefix : String
      ) : Types::DeleteRepositoryCreationTemplateResponse

        input = Types::DeleteRepositoryCreationTemplateRequest.new(prefix: prefix)
        delete_repository_creation_template(input)
      end

      def delete_repository_creation_template(input : Types::DeleteRepositoryCreationTemplateRequest) : Types::DeleteRepositoryCreationTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPOSITORY_CREATION_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRepositoryCreationTemplateResponse, "DeleteRepositoryCreationTemplate")
      end

      # Deletes the repository policy associated with the specified repository.

      def delete_repository_policy(
        repository_name : String,
        registry_id : String? = nil
      ) : Types::DeleteRepositoryPolicyResponse

        input = Types::DeleteRepositoryPolicyRequest.new(repository_name: repository_name, registry_id: registry_id)
        delete_repository_policy(input)
      end

      def delete_repository_policy(input : Types::DeleteRepositoryPolicyRequest) : Types::DeleteRepositoryPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPOSITORY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRepositoryPolicyResponse, "DeleteRepositoryPolicy")
      end

      # Deletes the registry's signing configuration. Images pushed after deletion of the signing
      # configuration will no longer be automatically signed. For more information, see Managed signing in
      # the Amazon Elastic Container Registry User Guide . Deleting the signing configuration does not
      # affect existing image signatures.

      def delete_signing_configuration : Types::DeleteSigningConfigurationResponse
        input = Types::DeleteSigningConfigurationRequest.new
        delete_signing_configuration(input)
      end

      def delete_signing_configuration(input : Types::DeleteSigningConfigurationRequest) : Types::DeleteSigningConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SIGNING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSigningConfigurationResponse, "DeleteSigningConfiguration")
      end

      # Removes a principal from the pull time update exclusion list for a registry. Once removed, Amazon
      # ECR will resume updating the pull time if the specified principal pulls an image.

      def deregister_pull_time_update_exclusion(
        principal_arn : String
      ) : Types::DeregisterPullTimeUpdateExclusionResponse

        input = Types::DeregisterPullTimeUpdateExclusionRequest.new(principal_arn: principal_arn)
        deregister_pull_time_update_exclusion(input)
      end

      def deregister_pull_time_update_exclusion(input : Types::DeregisterPullTimeUpdateExclusionRequest) : Types::DeregisterPullTimeUpdateExclusionResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_PULL_TIME_UPDATE_EXCLUSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterPullTimeUpdateExclusionResponse, "DeregisterPullTimeUpdateExclusion")
      end

      # Returns the replication status for a specified image.

      def describe_image_replication_status(
        image_id : Types::ImageIdentifier,
        repository_name : String,
        registry_id : String? = nil
      ) : Types::DescribeImageReplicationStatusResponse

        input = Types::DescribeImageReplicationStatusRequest.new(image_id: image_id, repository_name: repository_name, registry_id: registry_id)
        describe_image_replication_status(input)
      end

      def describe_image_replication_status(input : Types::DescribeImageReplicationStatusRequest) : Types::DescribeImageReplicationStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_REPLICATION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageReplicationStatusResponse, "DescribeImageReplicationStatus")
      end

      # Returns the scan findings for the specified image.

      def describe_image_scan_findings(
        image_id : Types::ImageIdentifier,
        repository_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::DescribeImageScanFindingsResponse

        input = Types::DescribeImageScanFindingsRequest.new(image_id: image_id, repository_name: repository_name, max_results: max_results, next_token: next_token, registry_id: registry_id)
        describe_image_scan_findings(input)
      end

      def describe_image_scan_findings(input : Types::DescribeImageScanFindingsRequest) : Types::DescribeImageScanFindingsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_SCAN_FINDINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageScanFindingsResponse, "DescribeImageScanFindings")
      end

      # Returns the signing status for a specified image. If the image matched signing rules that reference
      # different signing profiles, a status is returned for each profile. For more information, see Managed
      # signing in the Amazon Elastic Container Registry User Guide .

      def describe_image_signing_status(
        image_id : Types::ImageIdentifier,
        repository_name : String,
        registry_id : String? = nil
      ) : Types::DescribeImageSigningStatusResponse

        input = Types::DescribeImageSigningStatusRequest.new(image_id: image_id, repository_name: repository_name, registry_id: registry_id)
        describe_image_signing_status(input)
      end

      def describe_image_signing_status(input : Types::DescribeImageSigningStatusRequest) : Types::DescribeImageSigningStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_SIGNING_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageSigningStatusResponse, "DescribeImageSigningStatus")
      end

      # Returns metadata about the images in a repository. Starting with Docker version 1.9, the Docker
      # client compresses image layers before pushing them to a V2 Docker registry. The output of the docker
      # images command shows the uncompressed image size. Therefore, Docker might return a larger image than
      # the image shown in the Amazon Web Services Management Console. The new version of Amazon ECR Basic
      # Scanning doesn't use the ImageDetail$imageScanFindingsSummary and ImageDetail$imageScanStatus
      # attributes from the API response to return scan results. Use the DescribeImageScanFindings API
      # instead. For more information about Amazon Web Services native basic scanning, see Scan images for
      # software vulnerabilities in Amazon ECR .

      def describe_images(
        repository_name : String,
        filter : Types::DescribeImagesFilter? = nil,
        image_ids : Array(Types::ImageIdentifier)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::DescribeImagesResponse

        input = Types::DescribeImagesRequest.new(repository_name: repository_name, filter: filter, image_ids: image_ids, max_results: max_results, next_token: next_token, registry_id: registry_id)
        describe_images(input)
      end

      def describe_images(input : Types::DescribeImagesRequest) : Types::DescribeImagesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImagesResponse, "DescribeImages")
      end

      # Returns the pull through cache rules for a registry.

      def describe_pull_through_cache_rules(
        ecr_repository_prefixes : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::DescribePullThroughCacheRulesResponse

        input = Types::DescribePullThroughCacheRulesRequest.new(ecr_repository_prefixes: ecr_repository_prefixes, max_results: max_results, next_token: next_token, registry_id: registry_id)
        describe_pull_through_cache_rules(input)
      end

      def describe_pull_through_cache_rules(input : Types::DescribePullThroughCacheRulesRequest) : Types::DescribePullThroughCacheRulesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PULL_THROUGH_CACHE_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePullThroughCacheRulesResponse, "DescribePullThroughCacheRules")
      end

      # Describes the settings for a registry. The replication configuration for a repository can be created
      # or updated with the PutReplicationConfiguration API action.

      def describe_registry : Types::DescribeRegistryResponse
        input = Types::DescribeRegistryRequest.new
        describe_registry(input)
      end

      def describe_registry(input : Types::DescribeRegistryRequest) : Types::DescribeRegistryResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistryResponse, "DescribeRegistry")
      end

      # Describes image repositories in a registry.

      def describe_repositories(
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil,
        repository_names : Array(String)? = nil
      ) : Types::DescribeRepositoriesResponse

        input = Types::DescribeRepositoriesRequest.new(max_results: max_results, next_token: next_token, registry_id: registry_id, repository_names: repository_names)
        describe_repositories(input)
      end

      def describe_repositories(input : Types::DescribeRepositoriesRequest) : Types::DescribeRepositoriesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPOSITORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRepositoriesResponse, "DescribeRepositories")
      end

      # Returns details about the repository creation templates in a registry. The prefixes request
      # parameter can be used to return the details for a specific repository creation template.

      def describe_repository_creation_templates(
        max_results : Int32? = nil,
        next_token : String? = nil,
        prefixes : Array(String)? = nil
      ) : Types::DescribeRepositoryCreationTemplatesResponse

        input = Types::DescribeRepositoryCreationTemplatesRequest.new(max_results: max_results, next_token: next_token, prefixes: prefixes)
        describe_repository_creation_templates(input)
      end

      def describe_repository_creation_templates(input : Types::DescribeRepositoryCreationTemplatesRequest) : Types::DescribeRepositoryCreationTemplatesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPOSITORY_CREATION_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRepositoryCreationTemplatesResponse, "DescribeRepositoryCreationTemplates")
      end

      # Retrieves the account setting value for the specified setting name.

      def get_account_setting(
        name : String
      ) : Types::GetAccountSettingResponse

        input = Types::GetAccountSettingRequest.new(name: name)
        get_account_setting(input)
      end

      def get_account_setting(input : Types::GetAccountSettingRequest) : Types::GetAccountSettingResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_SETTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountSettingResponse, "GetAccountSetting")
      end

      # Retrieves an authorization token. An authorization token represents your IAM authentication
      # credentials and can be used to access any Amazon ECR registry that your IAM principal has access to.
      # The authorization token is valid for 12 hours. The authorizationToken returned is a base64 encoded
      # string that can be decoded and used in a docker login command to authenticate to a registry. The CLI
      # offers an get-login-password command that simplifies the login process. For more information, see
      # Registry authentication in the Amazon Elastic Container Registry User Guide .

      def get_authorization_token(
        registry_ids : Array(String)? = nil
      ) : Types::GetAuthorizationTokenResponse

        input = Types::GetAuthorizationTokenRequest.new(registry_ids: registry_ids)
        get_authorization_token(input)
      end

      def get_authorization_token(input : Types::GetAuthorizationTokenRequest) : Types::GetAuthorizationTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AUTHORIZATION_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAuthorizationTokenResponse, "GetAuthorizationToken")
      end

      # Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only get
      # URLs for image layers that are referenced in an image. When an image is pulled, the
      # GetDownloadUrlForLayer API is called once per image layer that is not already cached. This operation
      # is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing
      # images. In most cases, you should use the docker CLI to pull, tag, and push images.

      def get_download_url_for_layer(
        layer_digest : String,
        repository_name : String,
        registry_id : String? = nil
      ) : Types::GetDownloadUrlForLayerResponse

        input = Types::GetDownloadUrlForLayerRequest.new(layer_digest: layer_digest, repository_name: repository_name, registry_id: registry_id)
        get_download_url_for_layer(input)
      end

      def get_download_url_for_layer(input : Types::GetDownloadUrlForLayerRequest) : Types::GetDownloadUrlForLayerResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DOWNLOAD_URL_FOR_LAYER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDownloadUrlForLayerResponse, "GetDownloadUrlForLayer")
      end

      # Retrieves the lifecycle policy for the specified repository.

      def get_lifecycle_policy(
        repository_name : String,
        registry_id : String? = nil
      ) : Types::GetLifecyclePolicyResponse

        input = Types::GetLifecyclePolicyRequest.new(repository_name: repository_name, registry_id: registry_id)
        get_lifecycle_policy(input)
      end

      def get_lifecycle_policy(input : Types::GetLifecyclePolicyRequest) : Types::GetLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLifecyclePolicyResponse, "GetLifecyclePolicy")
      end

      # Retrieves the results of the lifecycle policy preview request for the specified repository.

      def get_lifecycle_policy_preview(
        repository_name : String,
        filter : Types::LifecyclePolicyPreviewFilter? = nil,
        image_ids : Array(Types::ImageIdentifier)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::GetLifecyclePolicyPreviewResponse

        input = Types::GetLifecyclePolicyPreviewRequest.new(repository_name: repository_name, filter: filter, image_ids: image_ids, max_results: max_results, next_token: next_token, registry_id: registry_id)
        get_lifecycle_policy_preview(input)
      end

      def get_lifecycle_policy_preview(input : Types::GetLifecyclePolicyPreviewRequest) : Types::GetLifecyclePolicyPreviewResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LIFECYCLE_POLICY_PREVIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLifecyclePolicyPreviewResponse, "GetLifecyclePolicyPreview")
      end

      # Retrieves the permissions policy for a registry.

      def get_registry_policy : Types::GetRegistryPolicyResponse
        input = Types::GetRegistryPolicyRequest.new
        get_registry_policy(input)
      end

      def get_registry_policy(input : Types::GetRegistryPolicyRequest) : Types::GetRegistryPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGISTRY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegistryPolicyResponse, "GetRegistryPolicy")
      end

      # Retrieves the scanning configuration for a registry.

      def get_registry_scanning_configuration : Types::GetRegistryScanningConfigurationResponse
        input = Types::GetRegistryScanningConfigurationRequest.new
        get_registry_scanning_configuration(input)
      end

      def get_registry_scanning_configuration(input : Types::GetRegistryScanningConfigurationRequest) : Types::GetRegistryScanningConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGISTRY_SCANNING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegistryScanningConfigurationResponse, "GetRegistryScanningConfiguration")
      end

      # Retrieves the repository policy for the specified repository.

      def get_repository_policy(
        repository_name : String,
        registry_id : String? = nil
      ) : Types::GetRepositoryPolicyResponse

        input = Types::GetRepositoryPolicyRequest.new(repository_name: repository_name, registry_id: registry_id)
        get_repository_policy(input)
      end

      def get_repository_policy(input : Types::GetRepositoryPolicyRequest) : Types::GetRepositoryPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositoryPolicyResponse, "GetRepositoryPolicy")
      end

      # Retrieves the registry's signing configuration, which defines rules for automatically signing images
      # using Amazon Web Services Signer. For more information, see Managed signing in the Amazon Elastic
      # Container Registry User Guide .

      def get_signing_configuration : Types::GetSigningConfigurationResponse
        input = Types::GetSigningConfigurationRequest.new
        get_signing_configuration(input)
      end

      def get_signing_configuration(input : Types::GetSigningConfigurationRequest) : Types::GetSigningConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SIGNING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSigningConfigurationResponse, "GetSigningConfiguration")
      end

      # Notifies Amazon ECR that you intend to upload an image layer. When an image is pushed, the
      # InitiateLayerUpload API is called once per image layer that has not already been uploaded. Whether
      # or not an image layer has been uploaded is determined by the BatchCheckLayerAvailability API action.
      # This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling
      # and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.

      def initiate_layer_upload(
        repository_name : String,
        registry_id : String? = nil
      ) : Types::InitiateLayerUploadResponse

        input = Types::InitiateLayerUploadRequest.new(repository_name: repository_name, registry_id: registry_id)
        initiate_layer_upload(input)
      end

      def initiate_layer_upload(input : Types::InitiateLayerUploadRequest) : Types::InitiateLayerUploadResponse
        request = Protocol::JsonRpc.build_request(Model::INITIATE_LAYER_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InitiateLayerUploadResponse, "InitiateLayerUpload")
      end

      # Lists the artifacts associated with a specified subject image.

      def list_image_referrers(
        repository_name : String,
        subject_id : Types::SubjectIdentifier,
        filter : Types::ListImageReferrersFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::ListImageReferrersResponse

        input = Types::ListImageReferrersRequest.new(repository_name: repository_name, subject_id: subject_id, filter: filter, max_results: max_results, next_token: next_token, registry_id: registry_id)
        list_image_referrers(input)
      end

      def list_image_referrers(input : Types::ListImageReferrersRequest) : Types::ListImageReferrersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IMAGE_REFERRERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListImageReferrersResponse, "ListImageReferrers")
      end

      # Lists all the image IDs for the specified repository. You can filter images based on whether or not
      # they are tagged by using the tagStatus filter and specifying either TAGGED , UNTAGGED or ANY . For
      # example, you can filter your results to return only UNTAGGED images and then pipe that result to a
      # BatchDeleteImage operation to delete them. Or, you can filter your results to return only TAGGED
      # images to list all of the tags in your repository.

      def list_images(
        repository_name : String,
        filter : Types::ListImagesFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::ListImagesResponse

        input = Types::ListImagesRequest.new(repository_name: repository_name, filter: filter, max_results: max_results, next_token: next_token, registry_id: registry_id)
        list_images(input)
      end

      def list_images(input : Types::ListImagesRequest) : Types::ListImagesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListImagesResponse, "ListImages")
      end

      # Lists the IAM principals that are excluded from having their image pull times recorded.

      def list_pull_time_update_exclusions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPullTimeUpdateExclusionsResponse

        input = Types::ListPullTimeUpdateExclusionsRequest.new(max_results: max_results, next_token: next_token)
        list_pull_time_update_exclusions(input)
      end

      def list_pull_time_update_exclusions(input : Types::ListPullTimeUpdateExclusionsRequest) : Types::ListPullTimeUpdateExclusionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PULL_TIME_UPDATE_EXCLUSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPullTimeUpdateExclusionsResponse, "ListPullTimeUpdateExclusions")
      end

      # List the tags for an Amazon ECR resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Allows you to change the basic scan type version or registry policy scope.

      def put_account_setting(
        name : String,
        value : String
      ) : Types::PutAccountSettingResponse

        input = Types::PutAccountSettingRequest.new(name: name, value: value)
        put_account_setting(input)
      end

      def put_account_setting(input : Types::PutAccountSettingRequest) : Types::PutAccountSettingResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ACCOUNT_SETTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAccountSettingResponse, "PutAccountSetting")
      end

      # Creates or updates the image manifest and tags associated with an image. When an image is pushed and
      # all new image layers have been uploaded, the PutImage API is called once to create or update the
      # image manifest and the tags associated with the image. This operation is used by the Amazon ECR
      # proxy and is not generally used by customers for pulling and pushing images. In most cases, you
      # should use the docker CLI to pull, tag, and push images.

      def put_image(
        image_manifest : String,
        repository_name : String,
        image_digest : String? = nil,
        image_manifest_media_type : String? = nil,
        image_tag : String? = nil,
        registry_id : String? = nil
      ) : Types::PutImageResponse

        input = Types::PutImageRequest.new(image_manifest: image_manifest, repository_name: repository_name, image_digest: image_digest, image_manifest_media_type: image_manifest_media_type, image_tag: image_tag, registry_id: registry_id)
        put_image(input)
      end

      def put_image(input : Types::PutImageRequest) : Types::PutImageResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutImageResponse, "PutImage")
      end

      # The PutImageScanningConfiguration API is being deprecated, in favor of specifying the image scanning
      # configuration at the registry level. For more information, see PutRegistryScanningConfiguration .
      # Updates the image scanning configuration for the specified repository.

      def put_image_scanning_configuration(
        image_scanning_configuration : Types::ImageScanningConfiguration,
        repository_name : String,
        registry_id : String? = nil
      ) : Types::PutImageScanningConfigurationResponse

        input = Types::PutImageScanningConfigurationRequest.new(image_scanning_configuration: image_scanning_configuration, repository_name: repository_name, registry_id: registry_id)
        put_image_scanning_configuration(input)
      end

      def put_image_scanning_configuration(input : Types::PutImageScanningConfigurationRequest) : Types::PutImageScanningConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_IMAGE_SCANNING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutImageScanningConfigurationResponse, "PutImageScanningConfiguration")
      end

      # Updates the image tag mutability settings for the specified repository. For more information, see
      # Image tag mutability in the Amazon Elastic Container Registry User Guide .

      def put_image_tag_mutability(
        image_tag_mutability : String,
        repository_name : String,
        image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
        registry_id : String? = nil
      ) : Types::PutImageTagMutabilityResponse

        input = Types::PutImageTagMutabilityRequest.new(image_tag_mutability: image_tag_mutability, repository_name: repository_name, image_tag_mutability_exclusion_filters: image_tag_mutability_exclusion_filters, registry_id: registry_id)
        put_image_tag_mutability(input)
      end

      def put_image_tag_mutability(input : Types::PutImageTagMutabilityRequest) : Types::PutImageTagMutabilityResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_IMAGE_TAG_MUTABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutImageTagMutabilityResponse, "PutImageTagMutability")
      end

      # Creates or updates the lifecycle policy for the specified repository. For more information, see
      # Lifecycle policy template .

      def put_lifecycle_policy(
        lifecycle_policy_text : String,
        repository_name : String,
        registry_id : String? = nil
      ) : Types::PutLifecyclePolicyResponse

        input = Types::PutLifecyclePolicyRequest.new(lifecycle_policy_text: lifecycle_policy_text, repository_name: repository_name, registry_id: registry_id)
        put_lifecycle_policy(input)
      end

      def put_lifecycle_policy(input : Types::PutLifecyclePolicyRequest) : Types::PutLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutLifecyclePolicyResponse, "PutLifecyclePolicy")
      end

      # Creates or updates the permissions policy for your registry. A registry policy is used to specify
      # permissions for another Amazon Web Services account and is used when configuring cross-account
      # replication. For more information, see Registry permissions in the Amazon Elastic Container Registry
      # User Guide .

      def put_registry_policy(
        policy_text : String
      ) : Types::PutRegistryPolicyResponse

        input = Types::PutRegistryPolicyRequest.new(policy_text: policy_text)
        put_registry_policy(input)
      end

      def put_registry_policy(input : Types::PutRegistryPolicyRequest) : Types::PutRegistryPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REGISTRY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRegistryPolicyResponse, "PutRegistryPolicy")
      end

      # Creates or updates the scanning configuration for your private registry.

      def put_registry_scanning_configuration(
        rules : Array(Types::RegistryScanningRule)? = nil,
        scan_type : String? = nil
      ) : Types::PutRegistryScanningConfigurationResponse

        input = Types::PutRegistryScanningConfigurationRequest.new(rules: rules, scan_type: scan_type)
        put_registry_scanning_configuration(input)
      end

      def put_registry_scanning_configuration(input : Types::PutRegistryScanningConfigurationRequest) : Types::PutRegistryScanningConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REGISTRY_SCANNING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRegistryScanningConfigurationResponse, "PutRegistryScanningConfiguration")
      end

      # Creates or updates the replication configuration for a registry. The existing replication
      # configuration for a repository can be retrieved with the DescribeRegistry API action. The first time
      # the PutReplicationConfiguration API is called, a service-linked IAM role is created in your account
      # for the replication process. For more information, see Using service-linked roles for Amazon ECR in
      # the Amazon Elastic Container Registry User Guide . For more information on the custom role for
      # replication, see Creating an IAM role for replication . When configuring cross-account replication,
      # the destination account must grant the source account permission to replicate. This permission is
      # controlled using a registry permissions policy. For more information, see PutRegistryPolicy .

      def put_replication_configuration(
        replication_configuration : Types::ReplicationConfiguration
      ) : Types::PutReplicationConfigurationResponse

        input = Types::PutReplicationConfigurationRequest.new(replication_configuration: replication_configuration)
        put_replication_configuration(input)
      end

      def put_replication_configuration(input : Types::PutReplicationConfigurationRequest) : Types::PutReplicationConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REPLICATION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutReplicationConfigurationResponse, "PutReplicationConfiguration")
      end

      # Creates or updates the registry's signing configuration, which defines rules for automatically
      # signing images with Amazon Web Services Signer. For more information, see Managed signing in the
      # Amazon Elastic Container Registry User Guide . To successfully generate a signature, the IAM
      # principal pushing images must have permission to sign payloads with the Amazon Web Services Signer
      # signing profile referenced in the signing configuration.

      def put_signing_configuration(
        signing_configuration : Types::SigningConfiguration
      ) : Types::PutSigningConfigurationResponse

        input = Types::PutSigningConfigurationRequest.new(signing_configuration: signing_configuration)
        put_signing_configuration(input)
      end

      def put_signing_configuration(input : Types::PutSigningConfigurationRequest) : Types::PutSigningConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SIGNING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutSigningConfigurationResponse, "PutSigningConfiguration")
      end

      # Adds an IAM principal to the pull time update exclusion list for a registry. Amazon ECR will not
      # record the pull time if an excluded principal pulls an image.

      def register_pull_time_update_exclusion(
        principal_arn : String
      ) : Types::RegisterPullTimeUpdateExclusionResponse

        input = Types::RegisterPullTimeUpdateExclusionRequest.new(principal_arn: principal_arn)
        register_pull_time_update_exclusion(input)
      end

      def register_pull_time_update_exclusion(input : Types::RegisterPullTimeUpdateExclusionRequest) : Types::RegisterPullTimeUpdateExclusionResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_PULL_TIME_UPDATE_EXCLUSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterPullTimeUpdateExclusionResponse, "RegisterPullTimeUpdateExclusion")
      end

      # Applies a repository policy to the specified repository to control access permissions. For more
      # information, see Amazon ECR Repository policies in the Amazon Elastic Container Registry User Guide
      # .

      def set_repository_policy(
        policy_text : String,
        repository_name : String,
        force : Bool? = nil,
        registry_id : String? = nil
      ) : Types::SetRepositoryPolicyResponse

        input = Types::SetRepositoryPolicyRequest.new(policy_text: policy_text, repository_name: repository_name, force: force, registry_id: registry_id)
        set_repository_policy(input)
      end

      def set_repository_policy(input : Types::SetRepositoryPolicyRequest) : Types::SetRepositoryPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::SET_REPOSITORY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetRepositoryPolicyResponse, "SetRepositoryPolicy")
      end

      # Starts a basic image vulnerability scan. A basic image scan can only be started once per 24 hours on
      # an individual image. This limit includes if an image was scanned on initial push. You can start up
      # to 100,000 basic scans per 24 hours. This limit includes both scans on initial push and scans
      # initiated by the StartImageScan API. For more information, see Basic scanning in the Amazon Elastic
      # Container Registry User Guide .

      def start_image_scan(
        image_id : Types::ImageIdentifier,
        repository_name : String,
        registry_id : String? = nil
      ) : Types::StartImageScanResponse

        input = Types::StartImageScanRequest.new(image_id: image_id, repository_name: repository_name, registry_id: registry_id)
        start_image_scan(input)
      end

      def start_image_scan(input : Types::StartImageScanRequest) : Types::StartImageScanResponse
        request = Protocol::JsonRpc.build_request(Model::START_IMAGE_SCAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartImageScanResponse, "StartImageScan")
      end

      # Starts a preview of a lifecycle policy for the specified repository. This allows you to see the
      # results before associating the lifecycle policy with the repository.

      def start_lifecycle_policy_preview(
        repository_name : String,
        lifecycle_policy_text : String? = nil,
        registry_id : String? = nil
      ) : Types::StartLifecyclePolicyPreviewResponse

        input = Types::StartLifecyclePolicyPreviewRequest.new(repository_name: repository_name, lifecycle_policy_text: lifecycle_policy_text, registry_id: registry_id)
        start_lifecycle_policy_preview(input)
      end

      def start_lifecycle_policy_preview(input : Types::StartLifecyclePolicyPreviewRequest) : Types::StartLifecyclePolicyPreviewResponse
        request = Protocol::JsonRpc.build_request(Model::START_LIFECYCLE_POLICY_PREVIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartLifecyclePolicyPreviewResponse, "StartLifecyclePolicyPreview")
      end

      # Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not
      # changed if they are not specified in the request parameters.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Deletes specified tags from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Transitions an image between storage classes. You can transition images from Amazon ECR standard
      # storage class to Amazon ECR archival storage class for long-term storage, or restore archived images
      # back to Amazon ECR standard.

      def update_image_storage_class(
        image_id : Types::ImageIdentifier,
        repository_name : String,
        target_storage_class : String,
        registry_id : String? = nil
      ) : Types::UpdateImageStorageClassResponse

        input = Types::UpdateImageStorageClassRequest.new(image_id: image_id, repository_name: repository_name, target_storage_class: target_storage_class, registry_id: registry_id)
        update_image_storage_class(input)
      end

      def update_image_storage_class(input : Types::UpdateImageStorageClassRequest) : Types::UpdateImageStorageClassResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IMAGE_STORAGE_CLASS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateImageStorageClassResponse, "UpdateImageStorageClass")
      end

      # Updates an existing pull through cache rule.

      def update_pull_through_cache_rule(
        ecr_repository_prefix : String,
        credential_arn : String? = nil,
        custom_role_arn : String? = nil,
        registry_id : String? = nil
      ) : Types::UpdatePullThroughCacheRuleResponse

        input = Types::UpdatePullThroughCacheRuleRequest.new(ecr_repository_prefix: ecr_repository_prefix, credential_arn: credential_arn, custom_role_arn: custom_role_arn, registry_id: registry_id)
        update_pull_through_cache_rule(input)
      end

      def update_pull_through_cache_rule(input : Types::UpdatePullThroughCacheRuleRequest) : Types::UpdatePullThroughCacheRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PULL_THROUGH_CACHE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePullThroughCacheRuleResponse, "UpdatePullThroughCacheRule")
      end

      # Updates an existing repository creation template.

      def update_repository_creation_template(
        prefix : String,
        applied_for : Array(String)? = nil,
        custom_role_arn : String? = nil,
        description : String? = nil,
        encryption_configuration : Types::EncryptionConfigurationForRepositoryCreationTemplate? = nil,
        image_tag_mutability : String? = nil,
        image_tag_mutability_exclusion_filters : Array(Types::ImageTagMutabilityExclusionFilter)? = nil,
        lifecycle_policy : String? = nil,
        repository_policy : String? = nil,
        resource_tags : Array(Types::Tag)? = nil
      ) : Types::UpdateRepositoryCreationTemplateResponse

        input = Types::UpdateRepositoryCreationTemplateRequest.new(prefix: prefix, applied_for: applied_for, custom_role_arn: custom_role_arn, description: description, encryption_configuration: encryption_configuration, image_tag_mutability: image_tag_mutability, image_tag_mutability_exclusion_filters: image_tag_mutability_exclusion_filters, lifecycle_policy: lifecycle_policy, repository_policy: repository_policy, resource_tags: resource_tags)
        update_repository_creation_template(input)
      end

      def update_repository_creation_template(input : Types::UpdateRepositoryCreationTemplateRequest) : Types::UpdateRepositoryCreationTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REPOSITORY_CREATION_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRepositoryCreationTemplateResponse, "UpdateRepositoryCreationTemplate")
      end

      # Uploads an image layer part to Amazon ECR. When an image is pushed, each new image layer is uploaded
      # in parts. The maximum size of each image layer part can be 20971520 bytes (or about 20MB). The
      # UploadLayerPart API is called once per each new image layer part. This operation is used by the
      # Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most
      # cases, you should use the docker CLI to pull, tag, and push images.

      def upload_layer_part(
        layer_part_blob : Bytes,
        part_first_byte : Int64,
        part_last_byte : Int64,
        repository_name : String,
        upload_id : String,
        registry_id : String? = nil
      ) : Types::UploadLayerPartResponse

        input = Types::UploadLayerPartRequest.new(layer_part_blob: layer_part_blob, part_first_byte: part_first_byte, part_last_byte: part_last_byte, repository_name: repository_name, upload_id: upload_id, registry_id: registry_id)
        upload_layer_part(input)
      end

      def upload_layer_part(input : Types::UploadLayerPartRequest) : Types::UploadLayerPartResponse
        request = Protocol::JsonRpc.build_request(Model::UPLOAD_LAYER_PART, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UploadLayerPartResponse, "UploadLayerPart")
      end

      # Validates an existing pull through cache rule for an upstream registry that requires authentication.
      # This will retrieve the contents of the Amazon Web Services Secrets Manager secret, verify the
      # syntax, and then validate that authentication to the upstream registry is successful.

      def validate_pull_through_cache_rule(
        ecr_repository_prefix : String,
        registry_id : String? = nil
      ) : Types::ValidatePullThroughCacheRuleResponse

        input = Types::ValidatePullThroughCacheRuleRequest.new(ecr_repository_prefix: ecr_repository_prefix, registry_id: registry_id)
        validate_pull_through_cache_rule(input)
      end

      def validate_pull_through_cache_rule(input : Types::ValidatePullThroughCacheRuleRequest) : Types::ValidatePullThroughCacheRuleResponse
        request = Protocol::JsonRpc.build_request(Model::VALIDATE_PULL_THROUGH_CACHE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ValidatePullThroughCacheRuleResponse, "ValidatePullThroughCacheRule")
      end
    end
  end
end
