module AwsSdk
  module ManagedBlockchain
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end


      class IllegalActionException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.

      class InternalServiceErrorException < ServiceError
      end

      # The action or operation requested is invalid. Verify that the action is typed correctly.

      class InvalidRequestException < ServiceError
      end

      # A resource request is issued for a resource that already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # The maximum number of resources of that type already exist. Ensure the resources requested are
      # within the boundaries of the service edition and your account limits.

      class ResourceLimitExceededException < ServiceError
      end

      # A requested resource doesn't exist. It may have been deleted or referenced incorrectly.

      class ResourceNotFoundException < ServiceError
      end

      # The requested resource exists but isn't in a status that can complete the operation.

      class ResourceNotReadyException < ServiceError
      end

      # The request or operation couldn't be performed because a service is throttling requests. The most
      # common source of throttling errors is creating resources that exceed your service limit for this
      # resource type. Request a limit increase or delete unused resources if possible.

      class ThrottlingException < ServiceError
      end


      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "IllegalActionException"
          IllegalActionException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceNotReadyException"
          ResourceNotReadyException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
