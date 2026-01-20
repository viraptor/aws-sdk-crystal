module AwsSdk
  module ComputeOptimizer
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # An internal error has occurred. Try your call again.

      class InternalServerException < ServiceError
      end

      # The value supplied for the input parameter is out of range or not valid.

      class InvalidParameterValueException < ServiceError
      end

      # The request exceeds a limit of the service.

      class LimitExceededException < ServiceError
      end

      # The request must contain either a valid (registered) Amazon Web Services access key ID or X.509
      # certificate.

      class MissingAuthenticationToken < ServiceError
      end

      # The account is not opted in to Compute Optimizer.

      class OptInRequiredException < ServiceError
      end

      # A resource that is required for the action doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request has failed due to a temporary failure of the server.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MissingAuthenticationToken"
          MissingAuthenticationToken.new(message)
        when "OptInRequiredException"
          OptInRequiredException.new(message)
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
