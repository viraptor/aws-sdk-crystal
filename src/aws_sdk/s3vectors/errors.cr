module AwsSdk
  module S3Vectors
    module Errors
      class ServiceError < Exception
      end

      # Access denied.

      class AccessDeniedException < ServiceError
      end

      # The request failed because a vector bucket name or a vector index name already exists. Vector bucket
      # names must be unique within your Amazon Web Services account for each Amazon Web Services Region.
      # Vector index names must be unique within your vector bucket. Choose a different vector bucket name
      # or vector index name, and try again.

      class ConflictException < ServiceError
      end

      # The request failed due to an internal server error.

      class InternalServerException < ServiceError
      end

      # The specified Amazon Web Services KMS key isn't enabled.

      class KmsDisabledException < ServiceError
      end

      # The request was rejected for one of the following reasons: The KeyUsage value of the KMS key is
      # incompatible with the API operation. The encryption algorithm or signing algorithm specified for the
      # operation is incompatible with the type of key material in the KMS key ( KeySpec ). For more
      # information, see InvalidKeyUsageException in the Amazon Web Services Key Management Service API
      # Reference .

      class KmsInvalidKeyUsageException < ServiceError
      end

      # The key state of the KMS key isn't compatible with the operation. For more information, see
      # KMSInvalidStateException in the Amazon Web Services Key Management Service API Reference .

      class KmsInvalidStateException < ServiceError
      end

      # The KMS key can't be found.

      class KmsNotFoundException < ServiceError
      end

      # The request was rejected because the specified resource can't be found.

      class NotFoundException < ServiceError
      end

      # The request timed out. Retry your request.

      class RequestTimeoutException < ServiceError
      end

      # Your request exceeds a service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The service is unavailable. Wait briefly and retry your request. If it continues to fail, increase
      # your waiting time between retries.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.

      class TooManyRequestsException < ServiceError
      end

      # The requested action isn't valid.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "KmsDisabledException"
          KmsDisabledException.new(message)
        when "KmsInvalidKeyUsageException"
          KmsInvalidKeyUsageException.new(message)
        when "KmsInvalidStateException"
          KmsInvalidStateException.new(message)
        when "KmsNotFoundException"
          KmsNotFoundException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "RequestTimeoutException"
          RequestTimeoutException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
