module AwsSdk
  module SSMIncidents
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this operation.
      class AccessDeniedException < ServiceError
      end

      # Updating or deleting a resource causes an inconsistent state.
      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.
      class InternalServerException < ServiceError
      end

      # Request references a resource which doesn't exist.
      class ResourceNotFoundException < ServiceError
      end

      # Request would cause a service quota to be exceeded.
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
