module Aws
  module Transfer
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # This exception is thrown when the UpdateServer is called for a file transfer protocol-enabled server
      # that has VPC as the endpoint type and the server's VpcEndpointID is not in the available state.

      class ConflictException < ServiceError
      end

      # This exception is thrown when an error occurs in the Transfer Family service.

      class InternalServiceError < ServiceError
      end

      # The NextToken parameter that was passed is invalid.

      class InvalidNextTokenException < ServiceError
      end

      # This exception is thrown when the client submits a malformed request.

      class InvalidRequestException < ServiceError
      end

      # The requested resource does not exist, or exists in a region other than the one specified for the
      # command.

      class ResourceExistsException < ServiceError
      end

      # This exception is thrown when a resource is not found by the Amazon Web ServicesTransfer Family
      # service.

      class ResourceNotFoundException < ServiceError
      end

      # The request has failed because the Amazon Web ServicesTransfer Family service is not available.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServiceError"
          InternalServiceError.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "ResourceExistsException"
          ResourceExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
