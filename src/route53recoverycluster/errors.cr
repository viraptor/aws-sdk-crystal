module Aws
  module Route53RecoveryCluster
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # There was a conflict with this request. Try again.

      class ConflictException < ServiceError
      end

      # The cluster endpoint isn't available. Try another cluster endpoint.

      class EndpointTemporarilyUnavailableException < ServiceError
      end

      # There was an unexpected error during processing of the request.

      class InternalServerException < ServiceError
      end

      # The request references a routing control or control panel that was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The request can't update that many routing control states at the same time. Try again with fewer
      # routing control states.

      class ServiceLimitExceededException < ServiceError
      end

      # The request was denied because of request throttling.

      class ThrottlingException < ServiceError
      end

      # There was a validation error on the request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "EndpointTemporarilyUnavailableException"
          EndpointTemporarilyUnavailableException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceLimitExceededException"
          ServiceLimitExceededException.new(message)
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
