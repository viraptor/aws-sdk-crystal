module AwsSdk
  module DirectoryServiceData
    module Errors
      class ServiceError < Exception
      end

      # You don't have permission to perform the request or access the directory. It can also occur when the
      # DirectoryId doesn't exist or the user, member, or group might be outside of your organizational unit
      # (OU). Make sure that you have the authentication and authorization to perform the action. Review the
      # directory information in the request, and make sure that the object isn't outside of your OU.

      class AccessDeniedException < ServiceError
      end

      # This error will occur when you try to create a resource that conflicts with an existing object. It
      # can also occur when adding a member to a group that the member is already in. This error can be
      # caused by a request sent within the 8-hour idempotency window with the same client token but
      # different input parameters. Client tokens should not be re-used across different requests. After 8
      # hours, any request with the same client token is treated as a new request.

      class ConflictException < ServiceError
      end

      # The request could not be completed due to a problem in the configuration or current state of the
      # specified directory.

      class DirectoryUnavailableException < ServiceError
      end

      # The operation didn't succeed because an internal error occurred. Try again later.

      class InternalServerException < ServiceError
      end

      # The resource couldn't be found.

      class ResourceNotFoundException < ServiceError
      end

      # The limit on the number of requests per second has been exceeded.

      class ThrottlingException < ServiceError
      end

      # The request isn't valid. Review the details in the error message to update the invalid parameters or
      # values in your request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DirectoryUnavailableException"
          DirectoryUnavailableException.new(message)
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
