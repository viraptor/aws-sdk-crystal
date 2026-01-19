module AwsSdk
  module Route53Profiles
    module Errors
      class ServiceError < Exception
      end

      # The current account doesn't have the IAM permissions required to perform the specified operation.
      class AccessDeniedException < ServiceError
      end

      # The request you submitted conflicts with an existing request.
      class ConflictException < ServiceError
      end

      # An internal server error occured. Retry your request.
      class InternalServiceErrorException < ServiceError
      end

      # The NextToken you provided isn;t valid.
      class InvalidNextTokenException < ServiceError
      end

      # One or more parameters in this request are not valid.
      class InvalidParameterException < ServiceError
      end

      # The request caused one or more limits to be exceeded.
      class LimitExceededException < ServiceError
      end

      # The resource you are trying to associate, has already been associated.
      class ResourceExistsException < ServiceError
      end

      # The resource you are associating is not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request was throttled. Try again in a few minutes.
      class ThrottlingException < ServiceError
      end

      # You have provided an invalid command.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceExistsException"
          ResourceExistsException.new(message)
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
