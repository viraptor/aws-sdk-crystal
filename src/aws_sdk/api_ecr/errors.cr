module AwsSdk
  module ECR
    module Errors
      class ServiceError < Exception
      end

      # The operation did not succeed because the account is managed by a organization policy.
      class BlockedByOrganizationPolicyException < ServiceError
      end

      # The specified layer upload does not contain any layer parts.
      class EmptyUploadException < ServiceError
      end

      # The specified pull time update exclusion already exists for the registry.
      class ExclusionAlreadyExistsException < ServiceError
      end

      # The specified pull time update exclusion was not found.
      class ExclusionNotFoundException < ServiceError
      end

      # The specified image has already been pushed, and there were no changes to the manifest or image tag
      # after the last push.
      class ImageAlreadyExistsException < ServiceError
      end

      # The specified image is archived and cannot be scanned.
      class ImageArchivedException < ServiceError
      end

      # The specified image digest does not match the digest that Amazon ECR calculated for the image.
      class ImageDigestDoesNotMatchException < ServiceError
      end

      # The image requested does not exist in the specified repository.
      class ImageNotFoundException < ServiceError
      end

      # The requested image storage class update is not supported.
      class ImageStorageClassUpdateNotSupportedException < ServiceError
      end

      # The specified image is tagged with a tag that already exists. The repository is configured for tag
      # immutability.
      class ImageTagAlreadyExistsException < ServiceError
      end

      # The layer digest calculation performed by Amazon ECR upon receipt of the image layer does not match
      # the digest specified.
      class InvalidLayerException < ServiceError
      end

      # The layer part size is not valid, or the first byte specified is not consecutive to the last byte of
      # a previous layer part upload.
      class InvalidLayerPartException < ServiceError
      end

      # The specified parameter is invalid. Review the available parameters for the API request.
      class InvalidParameterException < ServiceError
      end

      # An invalid parameter has been specified. Tag keys can have a maximum character length of 128
      # characters, and tag values can have a maximum length of 256 characters.
      class InvalidTagParameterException < ServiceError
      end

      # The operation failed due to a KMS exception.
      class KmsException < ServiceError
      end

      # The image layer already exists in the associated repository.
      class LayerAlreadyExistsException < ServiceError
      end

      # The specified layer is not available because it is not associated with an image. Unassociated image
      # layers may be cleaned up at any time.
      class LayerInaccessibleException < ServiceError
      end

      # Layer parts must be at least 5 MiB in size.
      class LayerPartTooSmallException < ServiceError
      end

      # The specified layers could not be found, or the specified layer is not valid for this repository.
      class LayersNotFoundException < ServiceError
      end

      # The lifecycle policy could not be found, and no policy is set to the repository.
      class LifecyclePolicyNotFoundException < ServiceError
      end

      # The previous lifecycle policy preview request has not completed. Wait and try again.
      class LifecyclePolicyPreviewInProgressException < ServiceError
      end

      # There is no dry run for this repository.
      class LifecyclePolicyPreviewNotFoundException < ServiceError
      end

      # The operation did not succeed because it would have exceeded a service limit for your account. For
      # more information, see Amazon ECR service quotas in the Amazon Elastic Container Registry User Guide.
      class LimitExceededException < ServiceError
      end

      # A pull through cache rule with these settings already exists for the private registry.
      class PullThroughCacheRuleAlreadyExistsException < ServiceError
      end

      # The pull through cache rule was not found. Specify a valid pull through cache rule and try again.
      class PullThroughCacheRuleNotFoundException < ServiceError
      end

      # The manifest list is referencing an image that does not exist.
      class ReferencedImagesNotFoundException < ServiceError
      end

      # The registry doesn't have an associated registry policy.
      class RegistryPolicyNotFoundException < ServiceError
      end

      # The specified repository already exists in the specified registry.
      class RepositoryAlreadyExistsException < ServiceError
      end

      # The specified repository contains images. To delete a repository that contains images, you must
      # force the deletion with the force parameter.
      class RepositoryNotEmptyException < ServiceError
      end

      # The specified repository could not be found. Check the spelling of the specified repository and
      # ensure that you are performing operations on the correct registry.
      class RepositoryNotFoundException < ServiceError
      end

      # The specified repository and registry combination does not have an associated repository policy.
      class RepositoryPolicyNotFoundException < ServiceError
      end

      # The specified image scan could not be found. Ensure that image scanning is enabled on the repository
      # and try again.
      class ScanNotFoundException < ServiceError
      end

      # The ARN of the secret specified in the pull through cache rule was not found. Update the pull
      # through cache rule with a valid secret ARN and try again.
      class SecretNotFoundException < ServiceError
      end

      # These errors are usually caused by a server-side issue.
      class ServerException < ServiceError
      end

      # The specified signing configuration was not found. This occurs when attempting to retrieve or delete
      # a signing configuration that does not exist.
      class SigningConfigurationNotFoundException < ServiceError
      end

      # The repository creation template already exists. Specify a unique prefix and try again.
      class TemplateAlreadyExistsException < ServiceError
      end

      # The specified repository creation template can't be found. Verify the registry ID and prefix and try
      # again.
      class TemplateNotFoundException < ServiceError
      end

      # The list of tags on the repository is over the limit. The maximum number of tags that can be applied
      # to a repository is 50.
      class TooManyTagsException < ServiceError
      end

      # The secret is unable to be accessed. Verify the resource permissions for the secret and try again.
      class UnableToAccessSecretException < ServiceError
      end

      # The secret is accessible but is unable to be decrypted. Verify the resource permisisons and try
      # again.
      class UnableToDecryptSecretValueException < ServiceError
      end

      # The image or images were unable to be pulled using the pull through cache rule. This is usually
      # caused because of an issue with the Secrets Manager secret containing the credentials for the
      # upstream registry.
      class UnableToGetUpstreamImageException < ServiceError
      end

      # There was an issue getting the upstream layer matching the pull through cache rule.
      class UnableToGetUpstreamLayerException < ServiceError
      end

      # The image is of a type that cannot be scanned.
      class UnsupportedImageTypeException < ServiceError
      end

      # The specified upstream registry isn't supported.
      class UnsupportedUpstreamRegistryException < ServiceError
      end

      # The upload could not be found, or the specified upload ID is not valid for this repository.
      class UploadNotFoundException < ServiceError
      end

      # There was an exception validating this request.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BlockedByOrganizationPolicyException"
          BlockedByOrganizationPolicyException.new(message)
        when "EmptyUploadException"
          EmptyUploadException.new(message)
        when "ExclusionAlreadyExistsException"
          ExclusionAlreadyExistsException.new(message)
        when "ExclusionNotFoundException"
          ExclusionNotFoundException.new(message)
        when "ImageAlreadyExistsException"
          ImageAlreadyExistsException.new(message)
        when "ImageArchivedException"
          ImageArchivedException.new(message)
        when "ImageDigestDoesNotMatchException"
          ImageDigestDoesNotMatchException.new(message)
        when "ImageNotFoundException"
          ImageNotFoundException.new(message)
        when "ImageStorageClassUpdateNotSupportedException"
          ImageStorageClassUpdateNotSupportedException.new(message)
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
        when "KmsException"
          KmsException.new(message)
        when "LayerAlreadyExistsException"
          LayerAlreadyExistsException.new(message)
        when "LayerInaccessibleException"
          LayerInaccessibleException.new(message)
        when "LayerPartTooSmallException"
          LayerPartTooSmallException.new(message)
        when "LayersNotFoundException"
          LayersNotFoundException.new(message)
        when "LifecyclePolicyNotFoundException"
          LifecyclePolicyNotFoundException.new(message)
        when "LifecyclePolicyPreviewInProgressException"
          LifecyclePolicyPreviewInProgressException.new(message)
        when "LifecyclePolicyPreviewNotFoundException"
          LifecyclePolicyPreviewNotFoundException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "PullThroughCacheRuleAlreadyExistsException"
          PullThroughCacheRuleAlreadyExistsException.new(message)
        when "PullThroughCacheRuleNotFoundException"
          PullThroughCacheRuleNotFoundException.new(message)
        when "ReferencedImagesNotFoundException"
          ReferencedImagesNotFoundException.new(message)
        when "RegistryPolicyNotFoundException"
          RegistryPolicyNotFoundException.new(message)
        when "RepositoryAlreadyExistsException"
          RepositoryAlreadyExistsException.new(message)
        when "RepositoryNotEmptyException"
          RepositoryNotEmptyException.new(message)
        when "RepositoryNotFoundException"
          RepositoryNotFoundException.new(message)
        when "RepositoryPolicyNotFoundException"
          RepositoryPolicyNotFoundException.new(message)
        when "ScanNotFoundException"
          ScanNotFoundException.new(message)
        when "SecretNotFoundException"
          SecretNotFoundException.new(message)
        when "ServerException"
          ServerException.new(message)
        when "SigningConfigurationNotFoundException"
          SigningConfigurationNotFoundException.new(message)
        when "TemplateAlreadyExistsException"
          TemplateAlreadyExistsException.new(message)
        when "TemplateNotFoundException"
          TemplateNotFoundException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnableToAccessSecretException"
          UnableToAccessSecretException.new(message)
        when "UnableToDecryptSecretValueException"
          UnableToDecryptSecretValueException.new(message)
        when "UnableToGetUpstreamImageException"
          UnableToGetUpstreamImageException.new(message)
        when "UnableToGetUpstreamLayerException"
          UnableToGetUpstreamLayerException.new(message)
        when "UnsupportedImageTypeException"
          UnsupportedImageTypeException.new(message)
        when "UnsupportedUpstreamRegistryException"
          UnsupportedUpstreamRegistryException.new(message)
        when "UploadNotFoundException"
          UploadNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
