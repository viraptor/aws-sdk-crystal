module Aws
  module NetworkFirewall
    module Errors
      class ServiceError < Exception
      end

      # Amazon Web Services doesn't currently have enough available capacity to fulfill your request. Try
      # your request later.

      class InsufficientCapacityException < ServiceError
      end

      # Your request is valid, but Network Firewall couldn't perform the operation because of a system
      # problem. Retry your request.

      class InternalServerError < ServiceError
      end

      # The operation failed because it's not valid. For example, you might have tried to delete a rule
      # group or firewall policy that's in use.

      class InvalidOperationException < ServiceError
      end

      # The operation failed because of a problem with your request. Examples include: You specified an
      # unsupported parameter name or value. You tried to update a property with a value that isn't among
      # the available types. Your request references an ARN that is malformed, or corresponds to a resource
      # that isn't valid in the context of the request.

      class InvalidRequestException < ServiceError
      end

      # The policy statement failed validation.

      class InvalidResourcePolicyException < ServiceError
      end

      # The token you provided is stale or isn't valid for the operation.

      class InvalidTokenException < ServiceError
      end

      # Unable to perform the operation because doing so would violate a limit setting.

      class LimitExceededException < ServiceError
      end

      # Unable to send logs to a configured logging destination.

      class LogDestinationPermissionException < ServiceError
      end

      # Unable to locate a resource using the parameters that you provided.

      class ResourceNotFoundException < ServiceError
      end

      # Unable to change the resource because your account doesn't own it.

      class ResourceOwnerCheckException < ServiceError
      end

      # Unable to process the request due to throttling limitations.

      class ThrottlingException < ServiceError
      end

      # The operation you requested isn't supported by Network Firewall.

      class UnsupportedOperationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InsufficientCapacityException"
          InsufficientCapacityException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidResourcePolicyException"
          InvalidResourcePolicyException.new(message)
        when "InvalidTokenException"
          InvalidTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "LogDestinationPermissionException"
          LogDestinationPermissionException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceOwnerCheckException"
          ResourceOwnerCheckException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
