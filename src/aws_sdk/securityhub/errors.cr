module AwsSdk
  module SecurityHub
    module Errors
      class ServiceError < Exception
      end

      # You don't have permission to perform the action specified in the request.
      class AccessDeniedException < ServiceError
      end

      # The request causes conflict with the current state of the service resource.
      class ConflictException < ServiceError
      end

      # Internal server error.
      class InternalException < ServiceError
      end

      # The request has failed due to an internal failure of the service.
      class InternalServerException < ServiceError
      end

      # The account doesn't have permission to perform this action.
      class InvalidAccessException < ServiceError
      end

      # The request was rejected because you supplied an invalid or out-of-range value for an input
      # parameter.
      class InvalidInputException < ServiceError
      end

      # The request was rejected because it attempted to create resources beyond the current Amazon Web
      # Services account or throttling limits. The error code describes the limit exceeded.
      class LimitExceededException < ServiceError
      end

      # The resource specified in the request conflicts with an existing resource.
      class ResourceConflictException < ServiceError
      end

      # The request was rejected because it conflicts with the resource's availability. For example, you
      # tried to update a security control that's currently in the UPDATING state.
      class ResourceInUseException < ServiceError
      end

      # The request was rejected because we can't find the specified resource.
      class ResourceNotFoundException < ServiceError
      end

      # The request was rejected because it would exceed the service quota limit.
      class ServiceQuotaExceededException < ServiceError
      end

      # The limit on the number of requests per second was exceeded.
      class ThrottlingException < ServiceError
      end

      # The request has failed validation because it's missing required fields or has invalid inputs.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidAccessException"
          InvalidAccessException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceConflictException"
          ResourceConflictException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
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
