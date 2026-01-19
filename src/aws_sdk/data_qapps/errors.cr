module AwsSdk
  module QApps
    module Errors
      class ServiceError < Exception
      end

      # The client is not authorized to perform the requested operation.
      class AccessDeniedException < ServiceError
      end

      # The requested operation could not be completed due to a conflict with the current state of the
      # resource.
      class ConflictException < ServiceError
      end

      # The requested operation could not be completed because the content exceeds the maximum allowed size.
      class ContentTooLargeException < ServiceError
      end

      # An internal service error occurred while processing the request.
      class InternalServerException < ServiceError
      end

      # The requested resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # The requested operation could not be completed because it would exceed the service's quota or limit.
      class ServiceQuotaExceededException < ServiceError
      end

      # The requested operation could not be completed because too many requests were sent at once. Wait a
      # bit and try again later.
      class ThrottlingException < ServiceError
      end

      # The client is not authenticated or authorized to perform the requested operation.
      class UnauthorizedException < ServiceError
      end

      # The input failed to satisfy the constraints specified by the service.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ContentTooLargeException"
          ContentTooLargeException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
