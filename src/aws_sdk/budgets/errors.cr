module AwsSdk
  module Budgets
    module Errors
      class ServiceError < Exception
      end

      # You are not authorized to use this operation with the given parameters.

      class AccessDeniedException < ServiceError
      end

      # The billing view status must be HEALTHY to perform this action. Try again when the status is
      # HEALTHY.

      class BillingViewHealthStatusException < ServiceError
      end

      # You've exceeded the notification or subscriber limit.

      class CreationLimitExceededException < ServiceError
      end

      # The budget name already exists. Budget names must be unique within an account.

      class DuplicateRecordException < ServiceError
      end

      # The pagination token expired.

      class ExpiredNextTokenException < ServiceError
      end

      # An error on the server occurred during the processing of your request. Try again later.

      class InternalErrorException < ServiceError
      end

      # The pagination token is invalid.

      class InvalidNextTokenException < ServiceError
      end

      # An error on the client occurred. Typically, the cause is an invalid input value.

      class InvalidParameterException < ServiceError
      end

      # We can’t locate the resource that you specified.

      class NotFoundException < ServiceError
      end

      # The request was received and recognized by the server, but the server rejected that particular
      # method for the requested resource.

      class ResourceLockedException < ServiceError
      end

      # You've reached a Service Quota limit on this resource.

      class ServiceQuotaExceededException < ServiceError
      end

      # The number of API requests has exceeded the maximum allowed API request throttling limit for the
      # account.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BillingViewHealthStatusException"
          BillingViewHealthStatusException.new(message)
        when "CreationLimitExceededException"
          CreationLimitExceededException.new(message)
        when "DuplicateRecordException"
          DuplicateRecordException.new(message)
        when "ExpiredNextTokenException"
          ExpiredNextTokenException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceLockedException"
          ResourceLockedException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
