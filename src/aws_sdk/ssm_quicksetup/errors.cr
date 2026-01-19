module AwsSdk
  module SSMQuickSetup
    module Errors
      class ServiceError < Exception
      end

      # The requester has insufficient permissions to perform the operation.
      class AccessDeniedException < ServiceError
      end

      # Another request is being processed. Wait a few minutes and try again.
      class ConflictException < ServiceError
      end

      # An error occurred on the server side.
      class InternalServerException < ServiceError
      end

      # The resource couldn't be found. Check the ID or name and try again.
      class ResourceNotFoundException < ServiceError
      end

      # The request or operation exceeds the maximum allowed request rate per Amazon Web Services account
      # and Amazon Web Services Region.
      class ThrottlingException < ServiceError
      end

      # The request is invalid. Verify the values provided for the request parameters are accurate.
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
