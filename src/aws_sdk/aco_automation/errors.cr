module AwsSdk
  module ComputeOptimizerAutomation
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient permissions to perform this action.
      class AccessDeniedException < ServiceError
      end

      # You are not authorized to perform this action.
      class ForbiddenException < ServiceError
      end

      # The specified client token is already in use.
      class IdempotencyTokenInUseException < ServiceError
      end

      # Exception thrown when the same client token is used with different parameters, indicating a mismatch
      # in idempotent request parameters.
      class IdempotentParameterMismatchException < ServiceError
      end

      # An internal error occurred while processing the request.
      class InternalServerException < ServiceError
      end

      # One or more parameter values are not valid.
      class InvalidParameterValueException < ServiceError
      end

      # The operation can only be performed by a management account.
      class NotManagementAccountException < ServiceError
      end

      # The account must be opted in to Compute Optimizer Automation before performing this action.
      class OptInRequiredException < ServiceError
      end

      # The specified resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request would exceed service quotas.
      class ServiceQuotaExceededException < ServiceError
      end

      # The service is temporarily unavailable.
      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "IdempotencyTokenInUseException"
          IdempotencyTokenInUseException.new(message)
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "NotManagementAccountException"
          NotManagementAccountException.new(message)
        when "OptInRequiredException"
          OptInRequiredException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
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
