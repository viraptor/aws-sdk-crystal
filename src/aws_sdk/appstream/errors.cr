module AwsSdk
  module AppStream
    module Errors
      class ServiceError < Exception
      end

      # An API error occurred. Wait a few minutes and try again.

      class ConcurrentModificationException < ServiceError
      end

      # The exception that is thrown when a dry run operation is requested. This indicates that the
      # validation checks have been performed successfully, but no actual resources were created or
      # modified.

      class DryRunOperationException < ServiceError
      end

      # The entitlement already exists.

      class EntitlementAlreadyExistsException < ServiceError
      end

      # The entitlement can't be found.

      class EntitlementNotFoundException < ServiceError
      end

      # The image can't be updated because it's not compatible for updates.

      class IncompatibleImageException < ServiceError
      end

      # The resource cannot be created because your AWS account is suspended. For assistance, contact AWS
      # Support.

      class InvalidAccountStatusException < ServiceError
      end

      # Indicates an incorrect combination of parameters, or a missing parameter.

      class InvalidParameterCombinationException < ServiceError
      end

      # The specified role is invalid.

      class InvalidRoleException < ServiceError
      end

      # The requested limit exceeds the permitted limit for an account.

      class LimitExceededException < ServiceError
      end

      # The attempted operation is not permitted.

      class OperationNotPermittedException < ServiceError
      end

      # WorkSpaces Applications can’t process the request right now because the Describe calls from your AWS
      # account are being throttled by Amazon EC2. Try again later.

      class RequestLimitExceededException < ServiceError
      end

      # The specified resource already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # The specified resource is in use.

      class ResourceInUseException < ServiceError
      end

      # The specified resource exists and is not in use, but isn't available.

      class ResourceNotAvailableException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "DryRunOperationException"
          DryRunOperationException.new(message)
        when "EntitlementAlreadyExistsException"
          EntitlementAlreadyExistsException.new(message)
        when "EntitlementNotFoundException"
          EntitlementNotFoundException.new(message)
        when "IncompatibleImageException"
          IncompatibleImageException.new(message)
        when "InvalidAccountStatusException"
          InvalidAccountStatusException.new(message)
        when "InvalidParameterCombinationException"
          InvalidParameterCombinationException.new(message)
        when "InvalidRoleException"
          InvalidRoleException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "OperationNotPermittedException"
          OperationNotPermittedException.new(message)
        when "RequestLimitExceededException"
          RequestLimitExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotAvailableException"
          ResourceNotAvailableException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
