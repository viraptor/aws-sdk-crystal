module AwsSdk
  module Wickr
    module Errors
      class ServiceError < Exception
      end

      # The request was invalid or malformed. This error occurs when the request parameters do not meet the
      # API requirements, such as invalid field values, missing required parameters, or improperly formatted
      # data.
      class BadRequestError < ServiceError
      end

      # Access to the requested resource is forbidden. This error occurs when the authenticated user does
      # not have the necessary permissions to perform the requested operation, even though they are
      # authenticated.
      class ForbiddenError < ServiceError
      end

      # An unexpected error occurred on the server while processing the request. This indicates a problem
      # with the Wickr service itself rather than with the request. If this error persists, contact Amazon
      # Web Services Support.
      class InternalServerError < ServiceError
      end

      # The request was throttled because too many requests were sent in a short period of time. Wait a
      # moment and retry the request. Consider implementing exponential backoff in your application.
      class RateLimitError < ServiceError
      end

      # The requested resource could not be found. This error occurs when you try to access or modify a
      # network, user, bot, security group, or other resource that doesn't exist or has been deleted.
      class ResourceNotFoundError < ServiceError
      end

      # The request was not authenticated or the authentication credentials were invalid. This error occurs
      # when the request lacks valid authentication credentials or the credentials have expired.
      class UnauthorizedError < ServiceError
      end

      # One or more fields in the request failed validation. This error provides detailed information about
      # which fields were invalid and why, allowing you to correct the request and retry.
      class ValidationError < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestError"
          BadRequestError.new(message)
        when "ForbiddenError"
          ForbiddenError.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "RateLimitError"
          RateLimitError.new(message)
        when "ResourceNotFoundError"
          ResourceNotFoundError.new(message)
        when "UnauthorizedError"
          UnauthorizedError.new(message)
        when "ValidationError"
          ValidationError.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
