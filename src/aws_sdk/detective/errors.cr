module AwsSdk
  module Detective
    module Errors
      class ServiceError < Exception
      end

      # The request issuer does not have permission to access this resource or perform this operation.

      class AccessDeniedException < ServiceError
      end

      # The request attempted an invalid action.

      class ConflictException < ServiceError
      end

      # The request was valid but failed because of a problem with the service.

      class InternalServerException < ServiceError
      end

      # The request refers to a nonexistent resource.

      class ResourceNotFoundException < ServiceError
      end

      # This request cannot be completed for one of the following reasons. This request cannot be completed
      # if it would cause the number of member accounts in the behavior graph to exceed the maximum allowed.
      # A behavior graph cannot have more than 1,200 member accounts. This request cannot be completed if
      # the current volume ingested is above the limit of 10 TB per day. Detective will not allow you to add
      # additional member accounts.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request cannot be completed because too many other requests are occurring at the same time.

      class TooManyRequestsException < ServiceError
      end

      # The request parameters are invalid.

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
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
