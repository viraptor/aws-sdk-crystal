module AwsSdk
  module KeyspacesStreams
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access permissions to perform this operation. This exception occurs when
      # your IAM user or role lacks the required permissions to access the Amazon Keyspaces resource or
      # perform the requested action. Check your IAM policies and ensure they grant the necessary
      # permissions.
      class AccessDeniedException < ServiceError
      end

      # The Amazon Keyspaces service encountered an unexpected error while processing the request. This
      # internal server error is not related to your request parameters. Retry your request after a brief
      # delay. If the issue persists, contact Amazon Web Services Support with details of your request to
      # help identify and resolve the problem.
      class InternalServerException < ServiceError
      end

      # The requested resource doesn't exist or could not be found. This exception occurs when you attempt
      # to access a keyspace, table, stream, or other Amazon Keyspaces resource that doesn't exist or that
      # has been deleted. Verify that the resource identifier is correct and that the resource exists in
      # your account.
      class ResourceNotFoundException < ServiceError
      end

      # The request rate is too high and exceeds the service's throughput limits. This exception occurs when
      # you send too many requests in a short period of time. Implement exponential backoff in your retry
      # strategy to handle this exception. Reducing your request frequency or distributing requests more
      # evenly can help avoid throughput exceptions.
      class ThrottlingException < ServiceError
      end

      # The request validation failed because one or more input parameters failed validation. This exception
      # occurs when there are syntax errors in the request, field constraints are violated, or required
      # parameters are missing. To help you fix the issue, the exception message provides details about
      # which parameter failed and why.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
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
