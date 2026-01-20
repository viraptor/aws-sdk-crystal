module AwsSdk
  module Invoicing
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request could not be completed due to a conflict with the current state of the resource. This
      # exception occurs when a concurrent modification is detected during an update operation, or when
      # attempting to create a resource that already exists.

      class ConflictException < ServiceError
      end

      # The processing request failed because of an unknown error, exception, or failure.

      class InternalServerException < ServiceError
      end

      # The resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The request was rejected because it attempted to create resources beyond the current Amazon Web
      # Services account limits. The error message describes the limit exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

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
