module Aws
  module CodeGuruProfiler
    module Errors
      class ServiceError < Exception
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      class ConflictException < ServiceError
      end

      # The server encountered an internal error and is unable to complete the request.

      class InternalServerException < ServiceError
      end

      # The resource specified in the request does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # You have exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use Service Quotas to request a service quota increase.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The parameter is not valid.

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
