module AwsSdk
  module OAM
    module Errors
      class ServiceError < Exception
      end

      # A resource was in an inconsistent state during an update or a deletion.
      class ConflictException < ServiceError
      end

      # Unexpected error while processing the request. Retry the request.
      class InternalServiceFault < ServiceError
      end

      # A parameter is specified incorrectly.
      class InvalidParameterException < ServiceError
      end

      # A required parameter is missing from the request.
      class MissingRequiredParameterException < ServiceError
      end

      # The request references a resource that does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service quota to be exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # A resource can have no more than 50 tags.
      class TooManyTagsException < ServiceError
      end

      # The value of a parameter in the request caused an error.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServiceFault"
          InternalServiceFault.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "MissingRequiredParameterException"
          MissingRequiredParameterException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
