module Aws
  module ECRPUBLIC
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

      # Checks the availability of one or more image layers that are within a repository in a public
      # registry. When an image is pushed to a repository, each image layer is checked to verify if it has
      # been uploaded before. If it has been uploaded, then the image layer is skipped. This operation is
      # used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images.
      # In most cases, you should use the docker CLI to pull, tag, and push images.

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

      # Deletes a list of specified images that are within a repository in a public registry. Images are
      # specified with either an imageTag or imageDigest . You can remove a tag from an image by specifying
      # the image's tag in your request. When you remove the last tag from an image, the image is deleted
      # from your repository. You can completely delete an image (and all of its tags) by specifying the
      # digest of the image in your request.

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

      # Informs Amazon ECR that the image layer upload is complete for a specified public registry,
      # repository name, and upload ID. You can optionally provide a sha256 digest of the image layer for
      # data validation purposes. When an image is pushed, the CompleteLayerUpload API is called once for
      # each new image layer to verify that the upload is complete. This operation is used by the Amazon ECR
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

      # Creates a repository in a public registry. For more information, see Amazon ECR repositories in the
      # Amazon Elastic Container Registry User Guide .

      def create_repository(
        repository_name : String,
        catalog_data : Types::RepositoryCatalogDataInput? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRepositoryResponse

        input = Types::CreateRepositoryRequest.new(repository_name: repository_name, catalog_data: catalog_data, tags: tags)
        create_repository(input)
      end

      def create_repository(input : Types::CreateRepositoryRequest) : Types::CreateRepositoryResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRepositoryResponse, "CreateRepository")
      end

      # Deletes a repository in a public registry. If the repository contains images, you must either
      # manually delete all images in the repository or use the force option. This option deletes all images
      # on your behalf before deleting the repository.

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

      # Deletes the repository policy that's associated with the specified repository.

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

      # Returns the image tag details for a repository in a public registry.

      def describe_image_tags(
        repository_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::DescribeImageTagsResponse

        input = Types::DescribeImageTagsRequest.new(repository_name: repository_name, max_results: max_results, next_token: next_token, registry_id: registry_id)
        describe_image_tags(input)
      end

      def describe_image_tags(input : Types::DescribeImageTagsRequest) : Types::DescribeImageTagsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageTagsResponse, "DescribeImageTags")
      end

      # Returns metadata that's related to the images in a repository in a public registry. Beginning with
      # Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker
      # registry. The output of the docker images command shows the uncompressed image size. Therefore, it
      # might return a larger image size than the image sizes that are returned by DescribeImages .

      def describe_images(
        repository_name : String,
        image_ids : Array(Types::ImageIdentifier)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : String? = nil
      ) : Types::DescribeImagesResponse

        input = Types::DescribeImagesRequest.new(repository_name: repository_name, image_ids: image_ids, max_results: max_results, next_token: next_token, registry_id: registry_id)
        describe_images(input)
      end

      def describe_images(input : Types::DescribeImagesRequest) : Types::DescribeImagesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImagesResponse, "DescribeImages")
      end

      # Returns details for a public registry.

      def describe_registries(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeRegistriesResponse

        input = Types::DescribeRegistriesRequest.new(max_results: max_results, next_token: next_token)
        describe_registries(input)
      end

      def describe_registries(input : Types::DescribeRegistriesRequest) : Types::DescribeRegistriesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistriesResponse, "DescribeRegistries")
      end

      # Describes repositories that are in a public registry.

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

      # Retrieves an authorization token. An authorization token represents your IAM authentication
      # credentials. You can use it to access any Amazon ECR registry that your IAM principal has access to.
      # The authorization token is valid for 12 hours. This API requires the
      # ecr-public:GetAuthorizationToken and sts:GetServiceBearerToken permissions.

      def get_authorization_token : Types::GetAuthorizationTokenResponse
        input = Types::GetAuthorizationTokenRequest.new
        get_authorization_token(input)
      end

      def get_authorization_token(input : Types::GetAuthorizationTokenRequest) : Types::GetAuthorizationTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AUTHORIZATION_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAuthorizationTokenResponse, "GetAuthorizationToken")
      end

      # Retrieves catalog metadata for a public registry.

      def get_registry_catalog_data : Types::GetRegistryCatalogDataResponse
        input = Types::GetRegistryCatalogDataRequest.new
        get_registry_catalog_data(input)
      end

      def get_registry_catalog_data(input : Types::GetRegistryCatalogDataRequest) : Types::GetRegistryCatalogDataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGISTRY_CATALOG_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegistryCatalogDataResponse, "GetRegistryCatalogData")
      end

      # Retrieve catalog metadata for a repository in a public registry. This metadata is displayed publicly
      # in the Amazon ECR Public Gallery.

      def get_repository_catalog_data(
        repository_name : String,
        registry_id : String? = nil
      ) : Types::GetRepositoryCatalogDataResponse

        input = Types::GetRepositoryCatalogDataRequest.new(repository_name: repository_name, registry_id: registry_id)
        get_repository_catalog_data(input)
      end

      def get_repository_catalog_data(input : Types::GetRepositoryCatalogDataRequest) : Types::GetRepositoryCatalogDataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY_CATALOG_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositoryCatalogDataResponse, "GetRepositoryCatalogData")
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

      # Notifies Amazon ECR that you intend to upload an image layer. When an image is pushed, the
      # InitiateLayerUpload API is called once for each image layer that hasn't already been uploaded.
      # Whether an image layer uploads is determined by the BatchCheckLayerAvailability API action. This
      # operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and
      # pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.

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

      # List the tags for an Amazon ECR Public resource.

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

      # Creates or updates the image manifest and tags that are associated with an image. When an image is
      # pushed and all new image layers have been uploaded, the PutImage API is called once to create or
      # update the image manifest and the tags that are associated with the image. This operation is used by
      # the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most
      # cases, you should use the docker CLI to pull, tag, and push images.

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

      # Create or update the catalog data for a public registry.

      def put_registry_catalog_data(
        display_name : String? = nil
      ) : Types::PutRegistryCatalogDataResponse

        input = Types::PutRegistryCatalogDataRequest.new(display_name: display_name)
        put_registry_catalog_data(input)
      end

      def put_registry_catalog_data(input : Types::PutRegistryCatalogDataRequest) : Types::PutRegistryCatalogDataResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REGISTRY_CATALOG_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRegistryCatalogDataResponse, "PutRegistryCatalogData")
      end

      # Creates or updates the catalog data for a repository in a public registry.

      def put_repository_catalog_data(
        catalog_data : Types::RepositoryCatalogDataInput,
        repository_name : String,
        registry_id : String? = nil
      ) : Types::PutRepositoryCatalogDataResponse

        input = Types::PutRepositoryCatalogDataRequest.new(catalog_data: catalog_data, repository_name: repository_name, registry_id: registry_id)
        put_repository_catalog_data(input)
      end

      def put_repository_catalog_data(input : Types::PutRepositoryCatalogDataRequest) : Types::PutRepositoryCatalogDataResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REPOSITORY_CATALOG_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRepositoryCatalogDataResponse, "PutRepositoryCatalogData")
      end

      # Applies a repository policy to the specified public repository to control access permissions. For
      # more information, see Amazon ECR Repository Policies in the Amazon Elastic Container Registry User
      # Guide .

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

      # Associates the specified tags to a resource with the specified resourceArn . If existing tags on a
      # resource aren't specified in the request parameters, they aren't changed. When a resource is
      # deleted, the tags associated with that resource are also deleted.

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

      # Uploads an image layer part to Amazon ECR. When an image is pushed, each new image layer is uploaded
      # in parts. The maximum size of each image layer part can be 20971520 bytes (about 20MB). The
      # UploadLayerPart API is called once for each new image layer part. This operation is used by the
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
    end
  end
end
