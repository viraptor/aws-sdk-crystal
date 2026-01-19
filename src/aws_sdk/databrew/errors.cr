module AwsSdk
  module DataBrew
    module Errors
      class ServiceError < Exception
      end

      # Access to the specified resource was denied.
      class AccessDeniedException < ServiceError
      end

      # Updating or deleting a resource can cause an inconsistent state.
      class ConflictException < ServiceError
      end

      # An internal service failure occurred.
      class InternalServerException < ServiceError
      end

      # One or more resources can't be found.
      class ResourceNotFoundException < ServiceError
      end

      # A service quota is exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # The input parameters for this request failed validation.
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
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
