module AwsSdk
  module LicenseManager
    module Errors
      class ServiceError < Exception
      end

      # Access to resource denied.

      class AccessDeniedException < ServiceError
      end

      # The Amazon Web Services user account does not have permission to perform the action. Check the IAM
      # policy associated with this account.

      class AuthorizationException < ServiceError
      end

      # There was a conflict processing the request. Try your request again.

      class ConflictException < ServiceError
      end

      # The entitlement is not allowed.

      class EntitlementNotAllowedException < ServiceError
      end

      # A dependency required to run the API is missing.

      class FailedDependencyException < ServiceError
      end

      # The request uses too many filters or too many filter values.

      class FilterLimitExceededException < ServiceError
      end

      # One or more parameter values are not valid.

      class InvalidParameterValueException < ServiceError
      end

      # License Manager cannot allocate a license to a resource because of its state. For example, you
      # cannot allocate a license to an instance in the process of shutting down.

      class InvalidResourceStateException < ServiceError
      end

      # You do not have enough licenses available to support a new resource launch.

      class LicenseUsageException < ServiceError
      end

      # There are no entitlements found for this license, or the entitlement maximum count is reached.

      class NoEntitlementsAllowedException < ServiceError
      end

      # Too many requests have been submitted. Try again after a brief wait.

      class RateLimitExceededException < ServiceError
      end

      # This is not the correct Region for the resource. Try again.

      class RedirectException < ServiceError
      end

      # Your resource limits have been exceeded.

      class ResourceLimitExceededException < ServiceError
      end

      # The resource cannot be found.

      class ResourceNotFoundException < ServiceError
      end

      # The server experienced an internal error. Try again.

      class ServerInternalException < ServiceError
      end

      # The digital signature method is unsupported. Try your request again.

      class UnsupportedDigitalSignatureMethodException < ServiceError
      end

      # The provided input is not valid. Try your request again.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AuthorizationException"
          AuthorizationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "EntitlementNotAllowedException"
          EntitlementNotAllowedException.new(message)
        when "FailedDependencyException"
          FailedDependencyException.new(message)
        when "FilterLimitExceededException"
          FilterLimitExceededException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidResourceStateException"
          InvalidResourceStateException.new(message)
        when "LicenseUsageException"
          LicenseUsageException.new(message)
        when "NoEntitlementsAllowedException"
          NoEntitlementsAllowedException.new(message)
        when "RateLimitExceededException"
          RateLimitExceededException.new(message)
        when "RedirectException"
          RedirectException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServerInternalException"
          ServerInternalException.new(message)
        when "UnsupportedDigitalSignatureMethodException"
          UnsupportedDigitalSignatureMethodException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
