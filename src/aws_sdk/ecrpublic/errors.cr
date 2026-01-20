module AwsSdk
  module ECRPUBLIC
    module Errors
      class ServiceError < Exception
      end

      # The specified layer upload doesn't contain any layer parts.

      class EmptyUploadException < ServiceError
      end

      # The specified image has already been pushed, and there were no changes to the manifest or image tag
      # after the last push.

      class ImageAlreadyExistsException < ServiceError
      end

      # The specified image digest doesn't match the digest that Amazon ECR calculated for the image.

      class ImageDigestDoesNotMatchException < ServiceError
      end

      # The image requested doesn't exist in the specified repository.

      class ImageNotFoundException < ServiceError
      end

      # The specified image is tagged with a tag that already exists. The repository is configured for tag
      # immutability.

      class ImageTagAlreadyExistsException < ServiceError
      end

      # The layer digest calculation performed by Amazon ECR when the image layer doesn't match the digest
      # specified.

      class InvalidLayerException < ServiceError
      end

      # The layer part size isn't valid, or the first byte specified isn't consecutive to the last byte of a
      # previous layer part upload.

      class InvalidLayerPartException < ServiceError
      end

      # The specified parameter is invalid. Review the available parameters for the API request.

      class InvalidParameterException < ServiceError
      end

      # An invalid parameter has been specified. Tag keys can have a maximum character length of 128
      # characters, and tag values can have a maximum length of 256 characters.

      class InvalidTagParameterException < ServiceError
      end

      # The image layer already exists in the associated repository.

      class LayerAlreadyExistsException < ServiceError
      end

      # Layer parts must be at least 5 MiB in size.

      class LayerPartTooSmallException < ServiceError
      end

      # The specified layers can't be found, or the specified layer isn't valid for this repository.

      class LayersNotFoundException < ServiceError
      end

      # The operation didn't succeed because it would have exceeded a service limit for your account. For
      # more information, see Amazon ECR Service Quotas in the Amazon Elastic Container Registry User Guide.

      class LimitExceededException < ServiceError
      end

      # The manifest list is referencing an image that doesn't exist.

      class ReferencedImagesNotFoundException < ServiceError
      end

      # The registry doesn't exist.

      class RegistryNotFoundException < ServiceError
      end

      # The specified repository already exists in the specified registry.

      class RepositoryAlreadyExistsException < ServiceError
      end

      # The repository catalog data doesn't exist.

      class RepositoryCatalogDataNotFoundException < ServiceError
      end

      # The specified repository contains images. To delete a repository that contains images, you must
      # force the deletion with the force parameter.

      class RepositoryNotEmptyException < ServiceError
      end

      # The specified repository can't be found. Check the spelling of the specified repository and ensure
      # that you're performing operations on the correct registry.

      class RepositoryNotFoundException < ServiceError
      end

      # The specified repository and registry combination doesn't have an associated repository policy.

      class RepositoryPolicyNotFoundException < ServiceError
      end

      # These errors are usually caused by a server-side issue.

      class ServerException < ServiceError
      end

      # The list of tags on the repository is over the limit. The maximum number of tags that can be applied
      # to a repository is 50.

      class TooManyTagsException < ServiceError
      end

      # The action isn't supported in this Region.

      class UnsupportedCommandException < ServiceError
      end

      # The upload can't be found, or the specified upload ID isn't valid for this repository.

      class UploadNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "EmptyUploadException"
          EmptyUploadException.new(message)
        when "ImageAlreadyExistsException"
          ImageAlreadyExistsException.new(message)
        when "ImageDigestDoesNotMatchException"
          ImageDigestDoesNotMatchException.new(message)
        when "ImageNotFoundException"
          ImageNotFoundException.new(message)
        when "ImageTagAlreadyExistsException"
          ImageTagAlreadyExistsException.new(message)
        when "InvalidLayerException"
          InvalidLayerException.new(message)
        when "InvalidLayerPartException"
          InvalidLayerPartException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidTagParameterException"
          InvalidTagParameterException.new(message)
        when "LayerAlreadyExistsException"
          LayerAlreadyExistsException.new(message)
        when "LayerPartTooSmallException"
          LayerPartTooSmallException.new(message)
        when "LayersNotFoundException"
          LayersNotFoundException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ReferencedImagesNotFoundException"
          ReferencedImagesNotFoundException.new(message)
        when "RegistryNotFoundException"
          RegistryNotFoundException.new(message)
        when "RepositoryAlreadyExistsException"
          RepositoryAlreadyExistsException.new(message)
        when "RepositoryCatalogDataNotFoundException"
          RepositoryCatalogDataNotFoundException.new(message)
        when "RepositoryNotEmptyException"
          RepositoryNotEmptyException.new(message)
        when "RepositoryNotFoundException"
          RepositoryNotFoundException.new(message)
        when "RepositoryPolicyNotFoundException"
          RepositoryPolicyNotFoundException.new(message)
        when "ServerException"
          ServerException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnsupportedCommandException"
          UnsupportedCommandException.new(message)
        when "UploadNotFoundException"
          UploadNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
