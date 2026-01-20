module AwsSdk
  module MigrationHubConfig
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Exception raised to indicate that authorization of an action was successful, when the DryRun flag is
      # set to true.

      class DryRunOperation < ServiceError
      end

      # Exception raised when an internal, configuration, or dependency error is encountered.

      class InternalServerError < ServiceError
      end

      # Exception raised when the provided input violates a policy constraint or is entered in the wrong
      # format or data type.

      class InvalidInputException < ServiceError
      end

      # Exception raised when a request fails due to temporary unavailability of the service.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "DryRunOperation"
          DryRunOperation.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
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
