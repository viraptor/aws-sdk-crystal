module Aws
  module VoiceID
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient permissions to perform this action. Check the error message and try
      # again.

      class AccessDeniedException < ServiceError
      end

      # The request failed due to a conflict. Check the ConflictType and error message for more details.

      class ConflictException < ServiceError
      end

      # The request failed due to an unknown error on the server side.

      class InternalServerException < ServiceError
      end

      # The specified resource cannot be found. Check the ResourceType and error message for more details.

      class ResourceNotFoundException < ServiceError
      end

      # The request exceeded the service quota. Refer to Voice ID Service Quotas and try your request again.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling. Please slow down your request rate. Refer to
      # Amazon Connect Voice ID Service API throttling quotas and try your request again.

      class ThrottlingException < ServiceError
      end

      # The request failed one or more validations; check the error message for more details.

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
