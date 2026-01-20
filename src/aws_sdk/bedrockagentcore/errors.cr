module AwsSdk
  module BedrockAgentCore
    module Errors
      class ServiceError < Exception
      end

      # The exception that occurs when you do not have sufficient permissions to perform an action. Verify
      # that your IAM policy includes the necessary permissions for the operation you are trying to perform.

      class AccessDeniedException < ServiceError
      end

      # The exception that occurs when the request conflicts with the current state of the resource. This
      # can happen when trying to modify a resource that is currently being modified by another request, or
      # when trying to create a resource that already exists.

      class ConflictException < ServiceError
      end

      # An exception thrown when attempting to create a resource with an identifier that already exists.

      class DuplicateIdException < ServiceError
      end

      # The exception that occurs when the service encounters an unexpected internal error. This is a
      # temporary condition that will resolve itself with retries. We recommend implementing exponential
      # backoff retry logic in your application.

      class InternalServerException < ServiceError
      end

      # The input fails to satisfy the constraints specified by AgentCore. Check your input values and try
      # again.

      class InvalidInputException < ServiceError
      end

      # The exception that occurs when the specified resource does not exist. This can happen when using an
      # invalid identifier or when trying to access a resource that has been deleted.

      class ResourceNotFoundException < ServiceError
      end

      # The exception that occurs when there is an error in the runtime client. This can happen due to
      # network issues, invalid configuration, or other client-side problems. Check the error message for
      # specific details about the error.

      class RuntimeClientError < ServiceError
      end

      # The service encountered an internal error. Try your request again later.

      class ServiceException < ServiceError
      end

      # The exception that occurs when the request would cause a service quota to be exceeded. Review your
      # service quotas and either reduce your request rate or request a quota increase.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling. Reduce the frequency of requests and try again.

      class ThrottledException < ServiceError
      end

      # The exception that occurs when the request was denied due to request throttling. This happens when
      # you exceed the allowed request rate for an operation. Reduce the frequency of requests or implement
      # exponential backoff retry logic in your application.

      class ThrottlingException < ServiceError
      end

      # This exception is thrown when the JWT bearer token is invalid or not found for OAuth bearer token
      # based access

      class UnauthorizedException < ServiceError
      end

      # The exception that occurs when the input fails to satisfy the constraints specified by the service.
      # Check the error message for details about which input parameter is invalid and correct your request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DuplicateIdException"
          DuplicateIdException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "RuntimeClientError"
          RuntimeClientError.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottledException"
          ThrottledException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
