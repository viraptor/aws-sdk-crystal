module AwsSdk
  module ApplicationDiscoveryService
    module Errors
      class ServiceError < Exception
      end

      # The user does not have permission to perform the action. Check the IAM policy associated with this
      # user.
      class AuthorizationErrorException < ServiceError
      end

      # Conflict error.
      class ConflictErrorException < ServiceError
      end

      # The home Region is not set. Set the home Region to continue.
      class HomeRegionNotSetException < ServiceError
      end

      # One or more parameters are not valid. Verify the parameters and try again.
      class InvalidParameterException < ServiceError
      end

      # The value of one or more parameters are either invalid or out of range. Verify the parameter values
      # and try again.
      class InvalidParameterValueException < ServiceError
      end

      # The limit of 200 configuration IDs per request has been exceeded.
      class LimitExceededException < ServiceError
      end

      # This operation is not permitted.
      class OperationNotPermittedException < ServiceError
      end

      # This issue occurs when the same clientRequestToken is used with the StartImportTask action, but with
      # different parameters. For example, you use the same request token but have two different import
      # URLs, you can encounter this issue. If the import tasks are meant to be different, use a different
      # clientRequestToken , and try again.
      class ResourceInUseException < ServiceError
      end

      # The specified configuration ID was not located. Verify the configuration ID and try again.
      class ResourceNotFoundException < ServiceError
      end

      # The server experienced an internal error. Try again.
      class ServerInternalErrorException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AuthorizationErrorException"
          AuthorizationErrorException.new(message)
        when "ConflictErrorException"
          ConflictErrorException.new(message)
        when "HomeRegionNotSetException"
          HomeRegionNotSetException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "OperationNotPermittedException"
          OperationNotPermittedException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServerInternalErrorException"
          ServerInternalErrorException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
