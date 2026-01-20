module Aws
  module Deadline
    module Errors
      class ServiceError < Exception
      end

      # You don't have permission to perform the action.

      class AccessDeniedException < ServiceError
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.

      class ConflictException < ServiceError
      end

      # Deadline Cloud can't process your request right now. Try again later.

      class InternalServerErrorException < ServiceError
      end

      # The requested resource can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your Amazon Web Services account.

      class ServiceQuotaExceededException < ServiceError
      end

      # Your request exceeded a request rate quota.

      class ThrottlingException < ServiceError
      end

      # The request isn't valid. This can occur if your request contains malformed JSON or unsupported
      # characters.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
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
