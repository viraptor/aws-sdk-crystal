module AwsSdk
  module Route53GlobalResolver
    module Errors
      class ServiceError < Exception
      end

      # You don't have permission to perform this operation. Check your IAM permissions and try again.

      class AccessDeniedException < ServiceError
      end

      # The request conflicts with the current state of the resource. This can occur when trying to modify a
      # resource that is not in a valid state for the requested operation.

      class ConflictException < ServiceError
      end

      # An internal server error occurred. Try again later.

      class InternalServerException < ServiceError
      end

      # The specified resource was not found. Verify the resource ID and try again.

      class ResourceNotFoundException < ServiceError
      end

      # The request would exceed one or more service quotas. Check your current usage and quotas, then try
      # again.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled due to too many requests. Wait a moment and try again.

      class ThrottlingException < ServiceError
      end

      # The input parameters are invalid. Check the parameter values and try again.

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
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
