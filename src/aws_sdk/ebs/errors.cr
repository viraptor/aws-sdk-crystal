module AwsSdk
  module EBS
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # You have reached the limit for concurrent API requests. For more information, see Optimizing
      # performance of the EBS direct APIs in the Amazon Elastic Compute Cloud User Guide .
      class ConcurrentLimitExceededException < ServiceError
      end

      # The request uses the same client token as a previous, but non-identical request.
      class ConflictException < ServiceError
      end

      # An internal error has occurred. For more information see Error retries .
      class InternalServerException < ServiceError
      end

      # The number of API requests has exceeded the maximum allowed API request throttling limit for the
      # snapshot. For more information see Error retries .
      class RequestThrottledException < ServiceError
      end

      # The specified resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # Your current service quotas do not allow you to perform this action.
      class ServiceQuotaExceededException < ServiceError
      end

      # The input fails to satisfy the constraints of the EBS direct APIs.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConcurrentLimitExceededException"
          ConcurrentLimitExceededException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "RequestThrottledException"
          RequestThrottledException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
