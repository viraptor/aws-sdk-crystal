module AwsSdk
  module TimestreamQuery
    module Errors
      class ServiceError < Exception
      end

      # You do not have the necessary permissions to access the account settings.

      class AccessDeniedException < ServiceError
      end

      # Unable to poll results for a cancelled query.

      class ConflictException < ServiceError
      end

      # An internal server error occurred while processing the request.

      class InternalServerException < ServiceError
      end

      # The requested endpoint is invalid.

      class InvalidEndpointException < ServiceError
      end

      # Timestream was unable to run the query successfully.

      class QueryExecutionException < ServiceError
      end

      # The requested resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # You have exceeded the service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled due to excessive requests.

      class ThrottlingException < ServiceError
      end

      # Invalid or malformed request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidEndpointException"
          InvalidEndpointException.new(message)
        when "QueryExecutionException"
          QueryExecutionException.new(message)
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
