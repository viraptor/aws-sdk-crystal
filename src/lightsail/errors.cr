module Aws
  module Lightsail
    module Errors
      class ServiceError < Exception
      end

      # Lightsail throws this exception when the user cannot be authenticated or uses invalid credentials to
      # access a resource.

      class AccessDeniedException < ServiceError
      end

      # Lightsail throws this exception when an account is still in the setup in progress state.

      class AccountSetupInProgressException < ServiceError
      end

      # Lightsail throws this exception when user input does not conform to the validation rules of an input
      # field. Domain and distribution APIs are only available in the N. Virginia ( us-east-1 ) Amazon Web
      # Services Region. Please set your Amazon Web Services Region configuration to us-east-1 to create,
      # view, or edit these resources.

      class InvalidInputException < ServiceError
      end

      # Lightsail throws this exception when it cannot find a resource.

      class NotFoundException < ServiceError
      end

      # Lightsail throws this exception when an operation fails to execute.

      class OperationFailureException < ServiceError
      end

      # Lightsail throws this exception when an operation is performed on resources in an opt-in Region that
      # is currently being set up.

      class RegionSetupInProgressException < ServiceError
      end

      # A general service exception.

      class ServiceException < ServiceError
      end

      # Lightsail throws this exception when the user has not been authenticated.

      class UnauthenticatedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AccountSetupInProgressException"
          AccountSetupInProgressException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "OperationFailureException"
          OperationFailureException.new(message)
        when "RegionSetupInProgressException"
          RegionSetupInProgressException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "UnauthenticatedException"
          UnauthenticatedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
