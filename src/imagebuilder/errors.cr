module Aws
  module Imagebuilder
    module Errors
      class ServiceError < Exception
      end

      # You do not have permissions to perform the requested operation.

      class AccessDeniedException < ServiceError
      end

      # You have exceeded the permitted request rate for the specific operation.

      class CallRateLimitExceededException < ServiceError
      end

      # These errors are usually caused by a client action, such as using an action or resource on behalf of
      # a user that doesn't have permissions to use the action or resource, or specifying an invalid
      # resource identifier.

      class ClientException < ServiceError
      end

      # The dry run operation of the resource was successful, and no resources or mutations were actually
      # performed due to the dry run flag in the request.

      class DryRunOperationException < ServiceError
      end

      # You are not authorized to perform the requested operation.

      class ForbiddenException < ServiceError
      end

      # You have specified a client token for an operation using parameter values that differ from a
      # previous request that used the same client token.

      class IdempotentParameterMismatchException < ServiceError
      end

      # You have provided an invalid pagination token in your request.

      class InvalidPaginationTokenException < ServiceError
      end

      # You have specified two or more mutually exclusive parameters. Review the error message for details.

      class InvalidParameterCombinationException < ServiceError
      end

      # The specified parameter is invalid. Review the available parameters for the API request.

      class InvalidParameterException < ServiceError
      end

      # The value that you provided for the specified parameter is invalid.

      class InvalidParameterValueException < ServiceError
      end

      # You have requested an action that that the service doesn't support.

      class InvalidRequestException < ServiceError
      end

      # Your version number is out of bounds or does not follow the required syntax.

      class InvalidVersionNumberException < ServiceError
      end

      # The resource that you are trying to create already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # You have attempted to mutate or delete a resource with a dependency that prohibits this action. See
      # the error message for more details.

      class ResourceDependencyException < ServiceError
      end

      # The resource that you are trying to operate on is currently in use. Review the message details and
      # retry later.

      class ResourceInUseException < ServiceError
      end

      # At least one of the resources referenced by your request does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # This exception is thrown when the service encounters an unrecoverable exception.

      class ServiceException < ServiceError
      end

      # You have exceeded the number of permitted resources or operations for this service. For service
      # quotas, see EC2 Image Builder endpoints and quotas .

      class ServiceQuotaExceededException < ServiceError
      end

      # The service is unable to process your request at this time.

      class ServiceUnavailableException < ServiceError
      end

      # You have attempted too many requests for the specific operation.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "CallRateLimitExceededException"
          CallRateLimitExceededException.new(message)
        when "ClientException"
          ClientException.new(message)
        when "DryRunOperationException"
          DryRunOperationException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "InvalidPaginationTokenException"
          InvalidPaginationTokenException.new(message)
        when "InvalidParameterCombinationException"
          InvalidParameterCombinationException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidVersionNumberException"
          InvalidVersionNumberException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceDependencyException"
          ResourceDependencyException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
