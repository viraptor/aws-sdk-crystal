module AwsSdk
  module Artifact
    module Errors
      class ServiceError < Exception
      end

      # User does not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Request to create/modify content would result in a conflict.

      class ConflictException < ServiceError
      end

      # An unknown server exception has occurred.

      class InternalServerException < ServiceError
      end

      # Request references a resource which does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # Request would cause a service quota to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # Request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # Request fails to satisfy the constraints specified by an AWS service.

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
