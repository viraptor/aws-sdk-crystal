module AwsSdk
  module Location
    module Errors
      class ServiceError < Exception
      end

      # The request was denied because of insufficient access or permissions. Check with an administrator to
      # verify your permissions.
      class AccessDeniedException < ServiceError
      end

      # The request was unsuccessful because of a conflict.
      class ConflictException < ServiceError
      end

      # The request has failed to process because of an unknown server error, exception, or failure.
      class InternalServerException < ServiceError
      end

      # The resource that you've entered was not found in your AWS account.
      class ResourceNotFoundException < ServiceError
      end

      # The operation was denied because the request would exceed the maximum quota set for Amazon Location
      # Service.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied because of request throttling.
      class ThrottlingException < ServiceError
      end

      # The input failed to meet the constraints specified by the AWS service.
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
