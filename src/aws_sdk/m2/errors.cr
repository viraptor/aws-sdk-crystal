module AwsSdk
  module M2
    module Errors
      class ServiceError < Exception
      end

      # The account or role doesn't have the right permissions to make the request.

      class AccessDeniedException < ServiceError
      end

      # The parameters provided in the request conflict with existing resources.

      class ConflictException < ServiceError
      end

      # Failed to connect to server, or didn’t receive response within expected time period.

      class ExecutionTimeoutException < ServiceError
      end

      # An unexpected error occurred during the processing of the request.

      class InternalServerException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # One or more quotas for Amazon Web Services Mainframe Modernization exceeds the limit.

      class ServiceQuotaExceededException < ServiceError
      end

      # Server cannot process the request at the moment.

      class ServiceUnavailableException < ServiceError
      end

      # The number of requests made exceeds the limit.

      class ThrottlingException < ServiceError
      end

      # One or more parameters provided in the request is not valid.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ExecutionTimeoutException"
          ExecutionTimeoutException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
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
