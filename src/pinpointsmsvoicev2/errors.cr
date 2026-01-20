module Aws
  module PinpointSMSVoiceV2
    module Errors
      class ServiceError < Exception
      end

      # The request was denied because you don't have sufficient permissions to access the resource.

      class AccessDeniedException < ServiceError
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time or it could be that the requested action isn't valid
      # for the current state or configuration of the resource.

      class ConflictException < ServiceError
      end

      # The API encountered an unexpected error and couldn't complete the request. You might be able to
      # successfully issue the request again in the future.

      class InternalServerException < ServiceError
      end

      # A requested resource couldn't be found.

      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service quota to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # An error that occurred because too many requests were sent during a certain amount of time.

      class ThrottlingException < ServiceError
      end

      # A validation exception for a field.

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
