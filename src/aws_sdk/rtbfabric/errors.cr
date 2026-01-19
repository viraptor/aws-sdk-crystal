module AwsSdk
  module RTBFabric
    module Errors
      class ServiceError < Exception
      end

      # The request could not be completed because you do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The request could not be completed because of a conflict in the current state of the resource.
      class ConflictException < ServiceError
      end

      # The request could not be completed because of an internal server error. Try your call again.
      class InternalServerException < ServiceError
      end

      # The request could not be completed because the resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # The request could not be completed because you exceeded a service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The request could not be completed because it fails satisfy the constraints specified by the
      # service.
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
