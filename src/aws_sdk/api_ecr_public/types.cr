require "json"
require "time"

module AwsSdk
  module ECRPUBLIC
    module Types

      # An authorization token data object that corresponds to a public registry.
      struct AuthorizationData
        include JSON::Serializable

        # A base64-encoded string that contains authorization data for a public Amazon ECR registry. When the
        # string is decoded, it's presented in the format user:password for public registry authentication
        # using docker login .
        @[JSON::Field(key: "authorizationToken")]
        getter authorization_token : String?

        # The Unix time in seconds and milliseconds when the authorization token expires. Authorization tokens
        # are valid for 12 hours.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        def initialize(
          @authorization_token : String? = nil,
          @expires_at : Time? = nil
        )
        end
      end

      struct BatchCheckLayerAvailabilityRequest
        include JSON::Serializable

        # The digests of the image layers to check.
        @[JSON::Field(key: "layerDigests")]
        getter layer_digests : Array(String)

        # The name of the repository that's associated with the image layers to check.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID, or registry alias, associated with the public registry that
        # contains the image layers to check. If you do not specify a registry, the default public registry is
        # assumed.
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

        # A list of image layer objects that correspond to the image layer references in the request.
        @[JSON::Field(key: "layers")]
        getter layers : Array(Types::Layer)?

        def initialize(
          @failures : Array(Types::LayerFailure)? = nil,
          @layers : Array(Types::Layer)? = nil
        )
        end
      end

      struct BatchDeleteImageRequest
        include JSON::Serializable

        # A list of image ID references that correspond to images to delete. The format of the imageIds
        # reference is imageTag=tag or imageDigest=digest .
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)

        # The repository in a public registry that contains the image to delete.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID, or registry alias, that's associated with the registry that
        # contains the image to delete. If you do not specify a registry, the default public registry is
        # assumed.
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

      struct CompleteLayerUploadRequest
        include JSON::Serializable

        # The sha256 digest of the image layer.
        @[JSON::Field(key: "layerDigests")]
        getter layer_digests : Array(String)

        # The name of the repository in a public registry to associate with the image layer.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The upload ID from a previous InitiateLayerUpload operation to associate with the image layer.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The Amazon Web Services account ID, or registry alias, associated with the registry where layers are
        # uploaded. If you do not specify a registry, the default public registry is assumed.
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

        # The public registry ID that's associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name that's associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The upload ID that's associated with the layer.
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

      struct CreateRepositoryRequest
        include JSON::Serializable

        # The name to use for the repository. This appears publicly in the Amazon ECR Public Gallery. The
        # repository name can be specified on its own (for example nginx-web-app ) or prepended with a
        # namespace to group the repository into a category (for example project-a/nginx-web-app ).
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The details about the repository that are publicly visible in the Amazon ECR Public Gallery.
        @[JSON::Field(key: "catalogData")]
        getter catalog_data : Types::RepositoryCatalogDataInput?

        # The metadata that you apply to each repository to help categorize and organize your repositories.
        # Each tag consists of a key and an optional value. You define both of them. Tag keys can have a
        # maximum character length of 128 characters, and tag values can have a maximum length of 256
        # characters.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @repository_name : String,
          @catalog_data : Types::RepositoryCatalogDataInput? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRepositoryResponse
        include JSON::Serializable

        @[JSON::Field(key: "catalogData")]
        getter catalog_data : Types::RepositoryCatalogData?

        # The repository that was created.
        @[JSON::Field(key: "repository")]
        getter repository : Types::Repository?

        def initialize(
          @catalog_data : Types::RepositoryCatalogData? = nil,
          @repository : Types::Repository? = nil
        )
        end
      end

      struct DeleteRepositoryPolicyRequest
        include JSON::Serializable

        # The name of the repository that's associated with the repository policy to delete.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID that's associated with the public registry that contains the
        # repository policy to delete. If you do not specify a registry, the default public registry is
        # assumed.
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

        # The registry ID that's associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name that's associated with the request.
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

        # The force option can be used to delete a repository that contains images. If the force option is not
        # used, the repository must be empty prior to deletion.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # The Amazon Web Services account ID that's associated with the public registry that contains the
        # repository to delete. If you do not specify a registry, the default public registry is assumed.
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

      struct DescribeImageTagsRequest
        include JSON::Serializable

        # The name of the repository that contains the image tag details to describe.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The maximum number of repository results that's returned by DescribeImageTags in paginated output.
        # When this parameter is used, DescribeImageTags only returns maxResults results in a single page
        # along with a nextToken response element. You can see the remaining results of the initial request by
        # sending another DescribeImageTags request with the returned nextToken value. This value can be
        # between 1 and 1000. If this parameter isn't used, then DescribeImageTags returns up to 100 results
        # and a nextToken value, if applicable. If you specify images with imageIds , you can't use this
        # option.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value that's returned from a previous paginated DescribeImageTags request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. If there are no more results to
        # return, this value is null . If you specify images with imageIds , you can't use this option.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID that's associated with the public registry that contains the
        # repository where images are described. If you do not specify a registry, the default public registry
        # is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registry_id : String? = nil
        )
        end
      end

      struct DescribeImageTagsResponse
        include JSON::Serializable

        # The image tag details for the images in the requested repository.
        @[JSON::Field(key: "imageTagDetails")]
        getter image_tag_details : Array(Types::ImageTagDetail)?

        # The nextToken value to include in a future DescribeImageTags request. When the results of a
        # DescribeImageTags request exceed maxResults , you can use this value to retrieve the next page of
        # results. If there are no more results to return, this value is null .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_tag_details : Array(Types::ImageTagDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeImagesRequest
        include JSON::Serializable

        # The repository that contains the images to describe.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The list of image IDs for the requested repository.
        @[JSON::Field(key: "imageIds")]
        getter image_ids : Array(Types::ImageIdentifier)?

        # The maximum number of repository results that's returned by DescribeImages in paginated output. When
        # this parameter is used, DescribeImages only returns maxResults results in a single page along with a
        # nextToken response element. You can see the remaining results of the initial request by sending
        # another DescribeImages request with the returned nextToken value. This value can be between 1 and
        # 1000. If this parameter isn't used, then DescribeImages returns up to 100 results and a nextToken
        # value, if applicable. If you specify images with imageIds , you can't use this option.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value that's returned from a previous paginated DescribeImages request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. If there are no more results to
        # return, this value is null . If you specify images with imageIds , you can't use this option.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID that's associated with the public registry that contains the
        # repository where images are described. If you do not specify a registry, the default public registry
        # is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
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
        # DescribeImages request exceed maxResults , you can use this value to retrieve the next page of
        # results. If there are no more results to return, this value is null .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_details : Array(Types::ImageDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistriesRequest
        include JSON::Serializable

        # The maximum number of repository results that's returned by DescribeRegistries in paginated output.
        # When this parameter is used, DescribeRegistries only returns maxResults results in a single page
        # along with a nextToken response element. The remaining results of the initial request can be seen by
        # sending another DescribeRegistries request with the returned nextToken value. This value can be
        # between 1 and 1000. If this parameter isn't used, then DescribeRegistries returns up to 100 results
        # and a nextToken value, if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value that's returned from a previous paginated DescribeRegistries request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. If there are no more results to
        # return, this value is null . This token should be treated as an opaque identifier that is only used
        # to retrieve the next items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRegistriesResponse
        include JSON::Serializable

        # An object that contains the details for a public registry.
        @[JSON::Field(key: "registries")]
        getter registries : Array(Types::Registry)

        # The nextToken value to include in a future DescribeRepositories request. If the results of a
        # DescribeRepositories request exceed maxResults , you can use this value to retrieve the next page of
        # results. If there are no more results, this value is null .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @registries : Array(Types::Registry),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRepositoriesRequest
        include JSON::Serializable

        # The maximum number of repository results that's returned by DescribeRepositories in paginated
        # output. When this parameter is used, DescribeRepositories only returns maxResults results in a
        # single page along with a nextToken response element. You can see the remaining results of the
        # initial request by sending another DescribeRepositories request with the returned nextToken value.
        # This value can be between 1 and 1000. If this parameter isn't used, then DescribeRepositories
        # returns up to 100 results and a nextToken value, if applicable. If you specify repositories with
        # repositoryNames , you can't use this option.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value that's returned from a previous paginated DescribeRepositories request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. If there are no more results to
        # return, this value is null . If you specify repositories with repositoryNames , you can't use this
        # option. This token should be treated as an opaque identifier that is only used to retrieve the next
        # items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID that's associated with the registry that contains the
        # repositories to be described. If you do not specify a registry, the default public registry is
        # assumed.
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
        # results. If there are no more results to return, this value is null .
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

      # The specified layer upload doesn't contain any layer parts.
      struct EmptyUploadException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct GetAuthorizationTokenRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetAuthorizationTokenResponse
        include JSON::Serializable

        # An authorization token data object that corresponds to a public registry.
        @[JSON::Field(key: "authorizationData")]
        getter authorization_data : Types::AuthorizationData?

        def initialize(
          @authorization_data : Types::AuthorizationData? = nil
        )
        end
      end

      struct GetRegistryCatalogDataRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetRegistryCatalogDataResponse
        include JSON::Serializable

        # The catalog metadata for the public registry.
        @[JSON::Field(key: "registryCatalogData")]
        getter registry_catalog_data : Types::RegistryCatalogData

        def initialize(
          @registry_catalog_data : Types::RegistryCatalogData
        )
        end
      end

      struct GetRepositoryCatalogDataRequest
        include JSON::Serializable

        # The name of the repository to retrieve the catalog metadata for.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID that's associated with the registry that contains the
        # repositories to be described. If you do not specify a registry, the default public registry is
        # assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct GetRepositoryCatalogDataResponse
        include JSON::Serializable

        # The catalog metadata for the repository.
        @[JSON::Field(key: "catalogData")]
        getter catalog_data : Types::RepositoryCatalogData?

        def initialize(
          @catalog_data : Types::RepositoryCatalogData? = nil
        )
        end
      end

      struct GetRepositoryPolicyRequest
        include JSON::Serializable

        # The name of the repository with the policy to retrieve.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID that's associated with the public registry that contains the
        # repository. If you do not specify a registry, the default public registry is assumed.
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

        # The repository policy text that's associated with the repository. The policy text will be in JSON
        # format.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID that's associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name that's associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # An object that represents an Amazon ECR image.
      struct Image
        include JSON::Serializable

        # An object that contains the image tag and image digest associated with an image.
        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        # The image manifest that's associated with the image.
        @[JSON::Field(key: "imageManifest")]
        getter image_manifest : String?

        # The manifest media type of the image.
        @[JSON::Field(key: "imageManifestMediaType")]
        getter image_manifest_media_type : String?

        # The Amazon Web Services account ID that's associated with the registry containing the image.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the repository that's associated with the image.
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

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that describes an image that's returned by a DescribeImages operation.
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

        # The date and time, expressed in standard JavaScript date format, that the current image was pushed
        # to the repository at.
        @[JSON::Field(key: "imagePushedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter image_pushed_at : Time?

        # The size, in bytes, of the image in the repository. If the image is a manifest list, this is the max
        # size of all manifests in the list. Beginning with Docker version 1.9, the Docker client compresses
        # image layers before pushing them to a V2 Docker registry. The output of the docker images command
        # shows the uncompressed image size, so it might return a larger image size than the image sizes that
        # are returned by DescribeImages .
        @[JSON::Field(key: "imageSizeInBytes")]
        getter image_size_in_bytes : Int64?

        # The list of tags that's associated with this image.
        @[JSON::Field(key: "imageTags")]
        getter image_tags : Array(String)?

        # The Amazon Web Services account ID that's associated with the public registry where this image
        # belongs.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the repository where this image belongs.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @artifact_media_type : String? = nil,
          @image_digest : String? = nil,
          @image_manifest_media_type : String? = nil,
          @image_pushed_at : Time? = nil,
          @image_size_in_bytes : Int64? = nil,
          @image_tags : Array(String)? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # The specified image digest doesn't match the digest that Amazon ECR calculated for the image.
      struct ImageDigestDoesNotMatchException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents an Amazon ECR image failure.
      struct ImageFailure
        include JSON::Serializable

        # The code that's associated with the failure.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The reason for the failure.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The image ID that's associated with the failure.
        @[JSON::Field(key: "imageId")]
        getter image_id : Types::ImageIdentifier?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @image_id : Types::ImageIdentifier? = nil
        )
        end
      end

      # An object with identifying information for an Amazon ECR image.
      struct ImageIdentifier
        include JSON::Serializable

        # The sha256 digest of the image manifest.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # The tag that's used for the image.
        @[JSON::Field(key: "imageTag")]
        getter image_tag : String?

        def initialize(
          @image_digest : String? = nil,
          @image_tag : String? = nil
        )
        end
      end

      # The image requested doesn't exist in the specified repository.
      struct ImageNotFoundException
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

      # An object that represents the image tag details for an image.
      struct ImageTagDetail
        include JSON::Serializable

        # The time stamp that indicates when the image tag was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An object that describes the details of an image.
        @[JSON::Field(key: "imageDetail")]
        getter image_detail : Types::ReferencedImageDetail?

        # The tag that's associated with the image.
        @[JSON::Field(key: "imageTag")]
        getter image_tag : String?

        def initialize(
          @created_at : Time? = nil,
          @image_detail : Types::ReferencedImageDetail? = nil,
          @image_tag : String? = nil
        )
        end
      end

      struct InitiateLayerUploadRequest
        include JSON::Serializable

        # The name of the repository that you want to upload layers to.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID, or registry alias, that's associated with the registry to which
        # you intend to upload layers. If you do not specify a registry, the default public registry is
        # assumed.
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

      # The layer digest calculation performed by Amazon ECR when the image layer doesn't match the digest
      # specified.
      struct InvalidLayerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The layer part size isn't valid, or the first byte specified isn't consecutive to the last byte of a
      # previous layer part upload.
      struct InvalidLayerPartException
        include JSON::Serializable

        # The position of the last byte of the layer part.
        @[JSON::Field(key: "lastValidByteReceived")]
        getter last_valid_byte_received : Int64?

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon Web Services account ID that's associated with the layer part.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The name of the repository.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The upload ID that's associated with the layer part.
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

      # An object that represents an Amazon ECR image layer.
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

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents an Amazon ECR image layer failure.
      struct LayerFailure
        include JSON::Serializable

        # The failure code that's associated with the failure.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The reason for the failure.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The layer digest that's associated with the failure.
        @[JSON::Field(key: "layerDigest")]
        getter layer_digest : String?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @layer_digest : String? = nil
        )
        end
      end

      # Layer parts must be at least 5 MiB in size.
      struct LayerPartTooSmallException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified layers can't be found, or the specified layer isn't valid for this repository.
      struct LayersNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation didn't succeed because it would have exceeded a service limit for your account. For
      # more information, see Amazon ECR Service Quotas in the Amazon Elastic Container Registry User Guide.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list the tags for. Currently, the
        # supported resource is an Amazon ECR Public repository.
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

      struct PutImageRequest
        include JSON::Serializable

        # The image manifest that corresponds to the image to be uploaded.
        @[JSON::Field(key: "imageManifest")]
        getter image_manifest : String

        # The name of the repository where the image is put.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The image digest of the image manifest that corresponds to the image.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # The media type of the image manifest. If you push an image manifest that doesn't contain the
        # mediaType field, you must specify the imageManifestMediaType in the request.
        @[JSON::Field(key: "imageManifestMediaType")]
        getter image_manifest_media_type : String?

        # The tag to associate with the image. This parameter is required for images that use the Docker Image
        # Manifest V2 Schema 2 or Open Container Initiative (OCI) formats.
        @[JSON::Field(key: "imageTag")]
        getter image_tag : String?

        # The Amazon Web Services account ID, or registry alias, that's associated with the public registry
        # that contains the repository where the image is put. If you do not specify a registry, the default
        # public registry is assumed.
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

      struct PutRegistryCatalogDataRequest
        include JSON::Serializable

        # The display name for a public registry. The display name is shown as the repository author in the
        # Amazon ECR Public Gallery. The registry display name is only publicly visible in the Amazon ECR
        # Public Gallery for verified accounts.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @display_name : String? = nil
        )
        end
      end

      struct PutRegistryCatalogDataResponse
        include JSON::Serializable

        # The catalog data for the public registry.
        @[JSON::Field(key: "registryCatalogData")]
        getter registry_catalog_data : Types::RegistryCatalogData

        def initialize(
          @registry_catalog_data : Types::RegistryCatalogData
        )
        end
      end

      struct PutRepositoryCatalogDataRequest
        include JSON::Serializable

        # An object containing the catalog data for a repository. This data is publicly visible in the Amazon
        # ECR Public Gallery.
        @[JSON::Field(key: "catalogData")]
        getter catalog_data : Types::RepositoryCatalogDataInput

        # The name of the repository to create or update the catalog data for.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The Amazon Web Services account ID that's associated with the public registry the repository is in.
        # If you do not specify a registry, the default public registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        def initialize(
          @catalog_data : Types::RepositoryCatalogDataInput,
          @repository_name : String,
          @registry_id : String? = nil
        )
        end
      end

      struct PutRepositoryCatalogDataResponse
        include JSON::Serializable

        # The catalog data for the repository.
        @[JSON::Field(key: "catalogData")]
        getter catalog_data : Types::RepositoryCatalogData?

        def initialize(
          @catalog_data : Types::RepositoryCatalogData? = nil
        )
        end
      end

      # An object that describes the image tag details that are returned by a DescribeImageTags action.
      struct ReferencedImageDetail
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

        # The date and time, expressed in standard JavaScript date format, which the current image tag was
        # pushed to the repository at.
        @[JSON::Field(key: "imagePushedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter image_pushed_at : Time?

        # The size, in bytes, of the image in the repository. If the image is a manifest list, this is the max
        # size of all manifests in the list. Beginning with Docker version 1.9, the Docker client compresses
        # image layers before pushing them to a V2 Docker registry. The output of the docker images command
        # shows the uncompressed image size, so it might return a larger image size than the image sizes that
        # are returned by DescribeImages .
        @[JSON::Field(key: "imageSizeInBytes")]
        getter image_size_in_bytes : Int64?

        def initialize(
          @artifact_media_type : String? = nil,
          @image_digest : String? = nil,
          @image_manifest_media_type : String? = nil,
          @image_pushed_at : Time? = nil,
          @image_size_in_bytes : Int64? = nil
        )
        end
      end

      # The manifest list is referencing an image that doesn't exist.
      struct ReferencedImagesNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of a public registry.
      struct Registry
        include JSON::Serializable

        # An array of objects that represents the aliases for a public registry.
        @[JSON::Field(key: "aliases")]
        getter aliases : Array(Types::RegistryAlias)

        # The Amazon Resource Name (ARN) of the public registry.
        @[JSON::Field(key: "registryArn")]
        getter registry_arn : String

        # The Amazon Web Services account ID that's associated with the registry. If you do not specify a
        # registry, the default public registry is assumed.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String

        # The URI of a public registry. The URI contains a universal prefix and the registry alias.
        @[JSON::Field(key: "registryUri")]
        getter registry_uri : String

        # Indicates whether the account is a verified Amazon Web Services Marketplace vendor. If an account is
        # verified, each public repository receives a verified account badge on the Amazon ECR Public Gallery.
        @[JSON::Field(key: "verified")]
        getter verified : Bool

        def initialize(
          @aliases : Array(Types::RegistryAlias),
          @registry_arn : String,
          @registry_id : String,
          @registry_uri : String,
          @verified : Bool
        )
        end
      end

      # An object representing the aliases for a public registry. A public registry is given an alias when
      # it's created. However, a custom alias can be set using the Amazon ECR console. For more information,
      # see Registries in the Amazon Elastic Container Registry User Guide .
      struct RegistryAlias
        include JSON::Serializable

        # Indicates whether the registry alias is the default alias for the registry. When the first public
        # repository is created, your public registry is assigned a default registry alias.
        @[JSON::Field(key: "defaultRegistryAlias")]
        getter default_registry_alias : Bool

        # The name of the registry alias.
        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates whether the registry alias is the primary alias for the registry. If true, the alias is
        # the primary registry alias and is displayed in both the repository URL and the image URI used in the
        # docker pull commands on the Amazon ECR Public Gallery. A registry alias that isn't the primary
        # registry alias can be used in the repository URI in a docker pull command.
        @[JSON::Field(key: "primaryRegistryAlias")]
        getter primary_registry_alias : Bool

        # The status of the registry alias.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @default_registry_alias : Bool,
          @name : String,
          @primary_registry_alias : Bool,
          @status : String
        )
        end
      end

      # The metadata for a public registry.
      struct RegistryCatalogData
        include JSON::Serializable

        # The display name for a public registry. This appears on the Amazon ECR Public Gallery. Only accounts
        # that have the verified account badge can have a registry display name.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @display_name : String? = nil
        )
        end
      end

      # The registry doesn't exist.
      struct RegistryNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing a repository.
      struct Repository
        include JSON::Serializable

        # The date and time, in JavaScript date format, when the repository was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Web Services account ID that's associated with the public registry that contains the
        # repository.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The Amazon Resource Name (ARN) that identifies the repository. The ARN contains the arn:aws:ecr
        # namespace, followed by the region of the repository, Amazon Web Services account ID of the
        # repository owner, repository namespace, and repository name. For example,
        # arn:aws:ecr:region:012345678910:repository/test .
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

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The catalog data for a repository. This data is publicly visible in the Amazon ECR Public Gallery.
      struct RepositoryCatalogData
        include JSON::Serializable

        # The longform description of the contents of the repository. This text appears in the repository
        # details on the Amazon ECR Public Gallery.
        @[JSON::Field(key: "aboutText")]
        getter about_text : String?

        # The architecture tags that are associated with the repository. Only supported operating system tags
        # appear publicly in the Amazon ECR Public Gallery. For more information, see
        # RepositoryCatalogDataInput .
        @[JSON::Field(key: "architectures")]
        getter architectures : Array(String)?

        # The short description of the repository.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The URL that contains the logo that's associated with the repository.
        @[JSON::Field(key: "logoUrl")]
        getter logo_url : String?

        # Indicates whether the repository is certified by Amazon Web Services Marketplace.
        @[JSON::Field(key: "marketplaceCertified")]
        getter marketplace_certified : Bool?

        # The operating system tags that are associated with the repository. Only supported operating system
        # tags appear publicly in the Amazon ECR Public Gallery. For more information, see
        # RepositoryCatalogDataInput .
        @[JSON::Field(key: "operatingSystems")]
        getter operating_systems : Array(String)?

        # The longform usage details of the contents of the repository. The usage text provides context for
        # users of the repository.
        @[JSON::Field(key: "usageText")]
        getter usage_text : String?

        def initialize(
          @about_text : String? = nil,
          @architectures : Array(String)? = nil,
          @description : String? = nil,
          @logo_url : String? = nil,
          @marketplace_certified : Bool? = nil,
          @operating_systems : Array(String)? = nil,
          @usage_text : String? = nil
        )
        end
      end

      # An object that contains the catalog data for a repository. This data is publicly visible in the
      # Amazon ECR Public Gallery.
      struct RepositoryCatalogDataInput
        include JSON::Serializable

        # A detailed description of the contents of the repository. It's publicly visible in the Amazon ECR
        # Public Gallery. The text must be in markdown format.
        @[JSON::Field(key: "aboutText")]
        getter about_text : String?

        # The system architecture that the images in the repository are compatible with. On the Amazon ECR
        # Public Gallery, the following supported architectures appear as badges on the repository and are
        # used as search filters. If an unsupported tag is added to your repository catalog data, it's
        # associated with the repository and can be retrieved using the API but isn't discoverable in the
        # Amazon ECR Public Gallery. ARM ARM 64 x86 x86-64
        @[JSON::Field(key: "architectures")]
        getter architectures : Array(String)?

        # A short description of the contents of the repository. This text appears in both the image details
        # and also when searching for repositories on the Amazon ECR Public Gallery.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The base64-encoded repository logo payload. The repository logo is only publicly visible in the
        # Amazon ECR Public Gallery for verified accounts.
        @[JSON::Field(key: "logoImageBlob")]
        getter logo_image_blob : Bytes?

        # The operating systems that the images in the repository are compatible with. On the Amazon ECR
        # Public Gallery, the following supported operating systems appear as badges on the repository and are
        # used as search filters. If an unsupported tag is added to your repository catalog data, it's
        # associated with the repository and can be retrieved using the API but isn't discoverable in the
        # Amazon ECR Public Gallery. Linux Windows
        @[JSON::Field(key: "operatingSystems")]
        getter operating_systems : Array(String)?

        # Detailed information about how to use the contents of the repository. It's publicly visible in the
        # Amazon ECR Public Gallery. The usage text provides context, support information, and additional
        # usage details for users of the repository. The text must be in markdown format.
        @[JSON::Field(key: "usageText")]
        getter usage_text : String?

        def initialize(
          @about_text : String? = nil,
          @architectures : Array(String)? = nil,
          @description : String? = nil,
          @logo_image_blob : Bytes? = nil,
          @operating_systems : Array(String)? = nil,
          @usage_text : String? = nil
        )
        end
      end

      # The repository catalog data doesn't exist.
      struct RepositoryCatalogDataNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified repository contains images. To delete a repository that contains images, you must
      # force the deletion with the force parameter.
      struct RepositoryNotEmptyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified repository can't be found. Check the spelling of the specified repository and ensure
      # that you're performing operations on the correct registry.
      struct RepositoryNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified repository and registry combination doesn't have an associated repository policy.
      struct RepositoryPolicyNotFoundException
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
        # Repository Policies in the Amazon Elastic Container Registry User Guide .
        @[JSON::Field(key: "policyText")]
        getter policy_text : String

        # The name of the repository to receive the policy.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # If the policy that you want to set on a repository policy would prevent you from setting another
        # policy in the future, you must force the SetRepositoryPolicy operation. This prevents accidental
        # repository lockouts.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # The Amazon Web Services account ID that's associated with the registry that contains the repository.
        # If you do not specify a registry, the default public registry is assumed.
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

        # The JSON repository policy text that's applied to the repository.
        @[JSON::Field(key: "policyText")]
        getter policy_text : String?

        # The registry ID that's associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name that's associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @policy_text : String? = nil,
          @registry_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # The metadata that you apply to a resource to help you categorize and organize them. Each tag
      # consists of a key and an optional value. You define both. Tag keys can have a maximum character
      # length of 128 characters, and tag values can have a maximum length of 256 characters.
      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to add tags to. Currently, the supported resource is
        # an Amazon ECR Public repository.
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

      # The action isn't supported in this Region.
      struct UnsupportedCommandException
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

        # The Amazon Resource Name (ARN) of the resource to delete tags from. Currently, the supported
        # resource is an Amazon ECR Public repository.
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

        # The name of the repository that you're uploading layer parts to.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The upload ID from a previous InitiateLayerUpload operation to associate with the layer part upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The Amazon Web Services account ID, or registry alias, that's associated with the registry that
        # you're uploading layer parts to. If you do not specify a registry, the default public registry is
        # assumed.
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

        # The integer value of the last byte that's received in the request.
        @[JSON::Field(key: "lastByteReceived")]
        getter last_byte_received : Int64?

        # The registry ID that's associated with the request.
        @[JSON::Field(key: "registryId")]
        getter registry_id : String?

        # The repository name that's associated with the request.
        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The upload ID that's associated with the request.
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

      # The upload can't be found, or the specified upload ID isn't valid for this repository.
      struct UploadNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
