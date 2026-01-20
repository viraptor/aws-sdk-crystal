module AwsSdk
  module S3Outposts
    module Errors
      class ServiceError < Exception
      end

      # Access was denied for this action.

      class AccessDeniedException < ServiceError
      end

      # There was a conflict with this action, and it could not be completed.

      class ConflictException < ServiceError
      end

      # There was an exception with the internal server.

      class InternalServerException < ServiceError
      end

      # The service link connection to your Outposts home Region is down. Check your connection and try
      # again.

      class OutpostOfflineException < ServiceError
      end

      # The requested resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # There was an exception validating this data.

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
        when "OutpostOfflineException"
          OutpostOfflineException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
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
