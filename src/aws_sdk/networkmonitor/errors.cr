module AwsSdk
  module NetworkMonitor
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # This operation attempted to create a resource that already exists.
      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.
      class InternalServerException < ServiceError
      end

      # The specified resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # This request exceeds a service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling
      class ThrottlingException < ServiceError
      end

      # One of the parameters for the request is not valid.
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
