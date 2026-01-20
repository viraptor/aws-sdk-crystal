module Aws
  module IoTManagedIntegrations
    module Errors
      class ServiceError < Exception
      end

      # User is not authorized.

      class AccessDeniedException < ServiceError
      end

      # There is a conflict with the request.

      class ConflictException < ServiceError
      end

      # An unexpected error has occurred.

      class InternalFailureException < ServiceError
      end

      # Internal error from the service that indicates an unexpected error or that the service is
      # unavailable.

      class InternalServerException < ServiceError
      end

      # The request is not valid.

      class InvalidRequestException < ServiceError
      end

      # The request exceeds a service limit or quota. Adjust your request parameters and try again.

      class LimitExceededException < ServiceError
      end

      # The specified resource does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The service quota has been exceeded for this request.

      class ServiceQuotaExceededException < ServiceError
      end

      # The service is temporarily unavailable.

      class ServiceUnavailableException < ServiceError
      end

      # The rate exceeds the limit.

      class ThrottlingException < ServiceError
      end

      # You are not authorized to perform this operation.

      class UnauthorizedException < ServiceError
      end

      # A validation error occurred when performing the API request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
