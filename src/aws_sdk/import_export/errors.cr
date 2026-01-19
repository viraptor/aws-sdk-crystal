module AwsSdk
  module ImportExport
    module Errors
      class ServiceError < Exception
      end

      class BucketPermissionException < ServiceError
      end

      class CanceledJobIdException < ServiceError
      end

      class CreateJobQuotaExceededException < ServiceError
      end

      class ExpiredJobIdException < ServiceError
      end

      class InvalidAccessKeyIdException < ServiceError
      end

      class InvalidAddressException < ServiceError
      end

      class InvalidCustomsException < ServiceError
      end

      class InvalidFileSystemException < ServiceError
      end

      class InvalidJobIdException < ServiceError
      end

      class InvalidManifestFieldException < ServiceError
      end

      class InvalidParameterException < ServiceError
      end

      class InvalidVersionException < ServiceError
      end

      class MalformedManifestException < ServiceError
      end

      class MissingCustomsException < ServiceError
      end

      class MissingManifestFieldException < ServiceError
      end

      class MissingParameterException < ServiceError
      end

      class MultipleRegionsException < ServiceError
      end

      class NoSuchBucketException < ServiceError
      end

      class UnableToCancelJobIdException < ServiceError
      end

      class UnableToUpdateJobIdException < ServiceError
      end
    end
  end
end
