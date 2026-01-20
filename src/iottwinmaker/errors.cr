module Aws
  module IoTTwinMaker
    module Errors
      class ServiceError < Exception
      end

      # Access is denied.

      class AccessDeniedException < ServiceError
      end

      # A conflict occurred.

      class ConflictException < ServiceError
      end

      # The connector failed.

      class ConnectorFailureException < ServiceError
      end

      # The connector timed out.

      class ConnectorTimeoutException < ServiceError
      end

      # An unexpected error has occurred.

      class InternalServerException < ServiceError
      end

      # The query timeout exception.

      class QueryTimeoutException < ServiceError
      end

      # The resource wasn't found.

      class ResourceNotFoundException < ServiceError
      end

      # The service quota was exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The rate exceeds the limit.

      class ThrottlingException < ServiceError
      end

      # The number of tags exceeds the limit.

      class TooManyTagsException < ServiceError
      end

      # Failed

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ConnectorFailureException"
          ConnectorFailureException.new(message)
        when "ConnectorTimeoutException"
          ConnectorTimeoutException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "QueryTimeoutException"
          QueryTimeoutException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
