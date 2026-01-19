module AwsSdk
  module Savingsplans
    module Errors
      class ServiceError < Exception
      end

      # An unexpected error occurred.
      class InternalServerException < ServiceError
      end

      # The specified resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # A service quota has been exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # One of the input parameters is not valid.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
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
