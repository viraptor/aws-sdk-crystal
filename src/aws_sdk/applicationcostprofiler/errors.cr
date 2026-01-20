module AwsSdk
  module ApplicationCostProfiler
    module Errors
      class ServiceError < Exception
      end

      # You do not have permission to perform this action.

      class AccessDeniedException < ServiceError
      end

      # An internal server error occurred. Retry your request.

      class InternalServerException < ServiceError
      end

      # Your request exceeds one or more of the service quotas.

      class ServiceQuotaExceededException < ServiceError
      end

      # The calls to AWS Application Cost Profiler API are throttled. The request was denied.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints for the API.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
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
