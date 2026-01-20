module Aws
  module Tnb
    module Errors
      class ServiceError < Exception
      end

      # Insufficient permissions to make request.

      class AccessDeniedException < ServiceError
      end

      # Unexpected error occurred. Problem on the server.

      class InternalServerException < ServiceError
      end

      # Request references a resource that doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # Service quotas have been exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # Exception caused by throttling.

      class ThrottlingException < ServiceError
      end

      # Unable to process the request because the client provided input failed to satisfy request
      # constraints.

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
