module Aws
  module ConnectCases
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request. See the accompanying
      # error message for details.

      class ConflictException < ServiceError
      end

      # We couldn't process your request because of an issue with the server. Try again later.

      class InternalServerException < ServiceError
      end

      # We couldn't find the requested resource. Check that your resources exists and were created in the
      # same Amazon Web Services Region as your request, and try your request again.

      class ResourceNotFoundException < ServiceError
      end

      # The service quota has been exceeded. For a list of service quotas, see Amazon Connect Service Quotas
      # in the Amazon Connect Administrator Guide .

      class ServiceQuotaExceededException < ServiceError
      end

      # The rate has been exceeded for this API. Please try again after a few minutes.

      class ThrottlingException < ServiceError
      end

      # The request isn't valid. Check the syntax and try again.

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
