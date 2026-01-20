module Aws
  module MarketplaceDeployment
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request configuration has conflicts. For details, see the accompanying error message.

      class ConflictException < ServiceError
      end

      # There was an internal service exception.

      class InternalServerException < ServiceError
      end

      # The specified resource wasn't found.

      class ResourceNotFoundException < ServiceError
      end

      # The maximum number of requests per account has been exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # Too many requests.

      class ThrottlingException < ServiceError
      end

      # An error occurred during validation.

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
