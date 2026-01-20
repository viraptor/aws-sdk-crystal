module AwsSdk
  module MigrationHub
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Exception raised to indicate a successfully authorized action when the DryRun flag is set to "true".

      class DryRunOperation < ServiceError
      end

      # The home region is not set. Set the home region to continue.

      class HomeRegionNotSetException < ServiceError
      end

      # Exception raised when an internal, configuration, or dependency error is encountered.

      class InternalServerError < ServiceError
      end

      # Exception raised when the provided input violates a policy constraint or is entered in the wrong
      # format or data type.

      class InvalidInputException < ServiceError
      end

      # Exception raised when there are problems accessing Application Discovery Service (Application
      # Discovery Service); most likely due to a misconfigured policy or the migrationhub-discovery role is
      # missing or not configured correctly.

      class PolicyErrorException < ServiceError
      end

      # Exception raised when the request references a resource (Application Discovery Service
      # configuration, update stream, migration task, etc.) that does not exist in Application Discovery
      # Service (Application Discovery Service) or in Migration Hub's repository.

      class ResourceNotFoundException < ServiceError
      end

      # Exception raised when there is an internal, configuration, or dependency error encountered.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # Exception raised to indicate a request was not authorized when the DryRun flag is set to "true".

      class UnauthorizedOperation < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "DryRunOperation"
          DryRunOperation.new(message)
        when "HomeRegionNotSetException"
          HomeRegionNotSetException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "PolicyErrorException"
          PolicyErrorException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedOperation"
          UnauthorizedOperation.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
