module AwsSdk
  module Braket
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # An error occurred due to a conflict.

      class ConflictException < ServiceError
      end

      # The specified device is currently offline.

      class DeviceOfflineException < ServiceError
      end

      # The specified device has been retired.

      class DeviceRetiredException < ServiceError
      end

      # The request failed because of an unknown error.

      class InternalServiceException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The request failed because a service quota is exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The API throttling rate limit is exceeded.

      class ThrottlingException < ServiceError
      end

      # The input request failed to satisfy constraints expected by Amazon Braket.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DeviceOfflineException"
          DeviceOfflineException.new(message)
        when "DeviceRetiredException"
          DeviceRetiredException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
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
