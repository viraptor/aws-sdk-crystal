module Aws
  module CostExplorer
    module Errors
      class ServiceError < Exception
      end

      # The requested analysis can't be found.

      class AnalysisNotFoundException < ServiceError
      end

      # A request to backfill is already in progress. Once the previous request is complete, you can create
      # another request.

      class BackfillLimitExceededException < ServiceError
      end

      # The requested report expired. Update the date interval and try again.

      class BillExpirationException < ServiceError
      end

      # The billing view status must be HEALTHY to perform this action. Try again when the status is HEALTHY
      # .

      class BillingViewHealthStatusException < ServiceError
      end

      # The requested data is unavailable.

      class DataUnavailableException < ServiceError
      end

      # A request to generate a recommendation or analysis is already in progress.

      class GenerationExistsException < ServiceError
      end

      # The pagination token is invalid. Try again without a pagination token.

      class InvalidNextTokenException < ServiceError
      end

      # You made too many calls in a short period of time. Try again later.

      class LimitExceededException < ServiceError
      end

      # Your request parameters changed between pages. Try again with the old parameters or without a
      # pagination token.

      class RequestChangedException < ServiceError
      end

      # The specified ARN in the request doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # You've reached the limit on the number of resources you can create, or exceeded the size of an
      # individual resource.

      class ServiceQuotaExceededException < ServiceError
      end

      # Can occur if you specify a number of tags for a resource greater than the maximum 50 user tags per
      # resource.

      class TooManyTagsException < ServiceError
      end

      # The cost anomaly monitor does not exist for the account.

      class UnknownMonitorException < ServiceError
      end

      # The cost anomaly subscription does not exist for the account.

      class UnknownSubscriptionException < ServiceError
      end

      # Cost Explorer was unable to identify the usage unit. Provide UsageType/UsageTypeGroup filter
      # selections that contain matching units, for example: hours .

      class UnresolvableUsageUnitException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AnalysisNotFoundException"
          AnalysisNotFoundException.new(message)
        when "BackfillLimitExceededException"
          BackfillLimitExceededException.new(message)
        when "BillExpirationException"
          BillExpirationException.new(message)
        when "BillingViewHealthStatusException"
          BillingViewHealthStatusException.new(message)
        when "DataUnavailableException"
          DataUnavailableException.new(message)
        when "GenerationExistsException"
          GenerationExistsException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "RequestChangedException"
          RequestChangedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnknownMonitorException"
          UnknownMonitorException.new(message)
        when "UnknownSubscriptionException"
          UnknownSubscriptionException.new(message)
        when "UnresolvableUsageUnitException"
          UnresolvableUsageUnitException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
