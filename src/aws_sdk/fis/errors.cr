module AwsSdk
  module Fis
    module Errors
      class ServiceError < Exception
      end

      # The request could not be processed because of a conflict.
      class ConflictException < ServiceError
      end

      # The specified resource cannot be found.
      class ResourceNotFoundException < ServiceError
      end

      # You have exceeded your service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The specified input is not valid, or fails to satisfy the constraints for the request.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
