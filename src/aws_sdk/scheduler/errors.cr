module AwsSdk
  module Scheduler
    module Errors
      class ServiceError < Exception
      end

      # Updating or deleting the resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # Unexpected error encountered while processing the request.

      class InternalServerException < ServiceError
      end

      # The request references a resource which does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request exceeds a service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
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
