module AwsSdk
  module Pipes
    module Errors
      class ServiceError < Exception
      end

      # An action you attempted resulted in an exception.
      class ConflictException < ServiceError
      end

      # This exception occurs due to unexpected causes.
      class InternalException < ServiceError
      end

      # An entity that you specified does not exist.
      class NotFoundException < ServiceError
      end

      # A quota has been exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # An action was throttled.
      class ThrottlingException < ServiceError
      end

      # Indicates that an error has occurred while performing a validate operation.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
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
