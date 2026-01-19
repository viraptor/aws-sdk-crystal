module AwsSdk
  module Backup
    module Errors
      class ServiceError < Exception
      end

      # The required resource already exists.
      class AlreadyExistsException < ServiceError
      end

      # Backup can't perform the action that you requested until it finishes performing a previous action.
      # Try again later.
      class ConflictException < ServiceError
      end

      # A dependent Amazon Web Services service or resource returned an error to the Backup service, and the
      # action cannot be completed.
      class DependencyFailureException < ServiceError
      end

      # Indicates that something is wrong with a parameter's value. For example, the value is out of range.
      class InvalidParameterValueException < ServiceError
      end

      # Indicates that something is wrong with the input to the request. For example, a parameter is of the
      # wrong type.
      class InvalidRequestException < ServiceError
      end

      # Backup is already performing an action on this recovery point. It can't perform the action you
      # requested until the first action finishes. Try again later.
      class InvalidResourceStateException < ServiceError
      end

      # A limit in the request has been exceeded; for example, a maximum number of items allowed in a
      # request.
      class LimitExceededException < ServiceError
      end

      # Indicates that a required parameter is missing.
      class MissingParameterValueException < ServiceError
      end

      # A resource that is required for the action doesn't exist.
      class ResourceNotFoundException < ServiceError
      end

      # The request failed due to a temporary failure of the server.
      class ServiceUnavailableException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DependencyFailureException"
          DependencyFailureException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidResourceStateException"
          InvalidResourceStateException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MissingParameterValueException"
          MissingParameterValueException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
