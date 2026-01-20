module AwsSdk
  module Outposts
    module Errors
      class ServiceError < Exception
      end

      # You do not have permission to perform this operation.

      class AccessDeniedException < ServiceError
      end

      # Updating or deleting this resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # An internal error has occurred.

      class InternalServerException < ServiceError
      end

      # The specified request is not valid.

      class NotFoundException < ServiceError
      end

      # You have exceeded a service quota.

      class ServiceQuotaExceededException < ServiceError
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
        when "NotFoundException"
          NotFoundException.new(message)
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
