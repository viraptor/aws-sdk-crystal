module Aws
  module LicenseManagerUserSubscriptions
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request couldn't be completed because it conflicted with the current state of the resource.

      class ConflictException < ServiceError
      end

      # An exception occurred with the service.

      class InternalServerException < ServiceError
      end

      # The resource couldn't be found.

      class ResourceNotFoundException < ServiceError
      end

      # The request failed because a service quota is exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied because of request throttling. Retry the request.

      class ThrottlingException < ServiceError
      end

      # A parameter is not valid.

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
