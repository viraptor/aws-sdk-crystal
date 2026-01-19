module AwsSdk
  module Route53RecoveryControlConfig
    module Errors
      class ServiceError < Exception
      end

      # 403 response - You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # 409 response - ConflictException. You might be using a predefined variable.
      class ConflictException < ServiceError
      end

      # 500 response - InternalServiceError. Temporary service error. Retry the request.
      class InternalServerException < ServiceError
      end

      # 404 response - MalformedQueryString. The query string contains a syntax error or resource not found.
      class ResourceNotFoundException < ServiceError
      end

      # 402 response - You attempted to create more resources than the service allows based on service
      # quotas.
      class ServiceQuotaExceededException < ServiceError
      end

      # 429 response - LimitExceededException or TooManyRequestsException.
      class ThrottlingException < ServiceError
      end

      # 400 response - Multiple causes. For example, you might have a malformed query string and input
      # parameter might be out of range, or you might have used parameters together incorrectly.
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
