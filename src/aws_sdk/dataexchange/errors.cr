module AwsSdk
  module DataExchange
    module Errors
      class ServiceError < Exception
      end

      # Access to the resource is denied.
      class AccessDeniedException < ServiceError
      end

      # The request couldn't be completed because it conflicted with the current state of the resource.
      class ConflictException < ServiceError
      end

      # An exception occurred with the service.
      class InternalServerException < ServiceError
      end

      # The resource couldn't be found.
      class ResourceNotFoundException < ServiceError
      end

      # The request has exceeded the quotas imposed by the service.
      class ServiceLimitExceededException < ServiceError
      end

      # The limit on the number of requests per second was exceeded.
      class ThrottlingException < ServiceError
      end

      # The request was invalid.
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
        when "ServiceLimitExceededException"
          ServiceLimitExceededException.new(message)
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
