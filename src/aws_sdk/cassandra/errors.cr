module AwsSdk
  module Keyspaces
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access permissions to perform this action.
      class AccessDeniedException < ServiceError
      end

      # Amazon Keyspaces couldn't complete the requested action. This error may occur if you try to perform
      # an action and the same or a different action is already in progress, or if you try to create a
      # resource that already exists.
      class ConflictException < ServiceError
      end

      # Amazon Keyspaces was unable to fully process this request because of an internal server error.
      class InternalServerException < ServiceError
      end

      # The operation tried to access a keyspace, table, or type that doesn't exist. The resource might not
      # be specified correctly, or its status might not be ACTIVE .
      class ResourceNotFoundException < ServiceError
      end

      # The operation exceeded the service quota for this resource. For more information on service quotas,
      # see Quotas in the Amazon Keyspaces Developer Guide .
      class ServiceQuotaExceededException < ServiceError
      end

      # The operation failed due to an invalid or malformed request.
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
