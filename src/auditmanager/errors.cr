module Aws
  module AuditManager
    module Errors
      class ServiceError < Exception
      end

      # Your account isn't registered with Audit Manager. Check the delegated administrator setup on the
      # Audit Manager settings page, and try again.

      class AccessDeniedException < ServiceError
      end

      # An internal service error occurred during the processing of your request. Try again later.

      class InternalServerException < ServiceError
      end

      # The resource that's specified in the request can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # You've reached your account quota for this resource type. To perform the requested action, delete
      # some existing resources or request a quota increase from the Service Quotas console. For a list of
      # Audit Manager service quotas, see Quotas and restrictions for Audit Manager .

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The request has invalid or missing parameters.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
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
