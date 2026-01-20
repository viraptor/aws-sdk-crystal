module Aws
  module BCMDashboards
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient permissions to perform this action. Verify your IAM permissions and any
      # resource policies.

      class AccessDeniedException < ServiceError
      end

      # An internal error occurred while processing the request. Retry your request. If the problem
      # persists, contact Amazon Web Services Support.

      class InternalServerException < ServiceError
      end

      # The specified resource (dashboard, policy, or widget) was not found. Verify the ARN and try again.

      class ResourceNotFoundException < ServiceError
      end

      # The request would exceed service quotas. For example, attempting to create more than 20 widgets in a
      # dashboard or exceeding the maximum number of dashboards per account.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling. Reduce the frequency of requests and use
      # exponential backoff.

      class ThrottlingException < ServiceError
      end

      # The input parameters do not satisfy the requirements. Check the error message for specific
      # validation details.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
