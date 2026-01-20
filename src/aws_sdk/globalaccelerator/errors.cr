module AwsSdk
  module GlobalAccelerator
    module Errors
      class ServiceError < Exception
      end

      # The accelerator that you specified could not be disabled.

      class AcceleratorNotDisabledException < ServiceError
      end

      # The accelerator that you specified doesn't exist.

      class AcceleratorNotFoundException < ServiceError
      end

      # You don't have access permission.

      class AccessDeniedException < ServiceError
      end

      # The listener that you specified has an endpoint group associated with it. You must remove all
      # dependent resources from a listener before you can delete it.

      class AssociatedEndpointGroupFoundException < ServiceError
      end

      # The accelerator that you specified has a listener associated with it. You must remove all dependent
      # resources from an accelerator before you can delete it.

      class AssociatedListenerFoundException < ServiceError
      end

      # No cross-account attachment was found.

      class AttachmentNotFoundException < ServiceError
      end

      # The CIDR that you specified was not found or is incorrect.

      class ByoipCidrNotFoundException < ServiceError
      end

      # You can't use both of those options.

      class ConflictException < ServiceError
      end

      # The endpoint that you specified doesn't exist.

      class EndpointAlreadyExistsException < ServiceError
      end

      # The endpoint group that you specified already exists.

      class EndpointGroupAlreadyExistsException < ServiceError
      end

      # The endpoint group that you specified doesn't exist.

      class EndpointGroupNotFoundException < ServiceError
      end

      # The endpoint that you specified doesn't exist.

      class EndpointNotFoundException < ServiceError
      end

      # The CIDR that you specified is not valid for this action. For example, the state of the CIDR might
      # be incorrect for this action.

      class IncorrectCidrStateException < ServiceError
      end

      # There was an internal error for Global Accelerator.

      class InternalServiceErrorException < ServiceError
      end

      # An argument that you specified is invalid.

      class InvalidArgumentException < ServiceError
      end

      # There isn't another item to return.

      class InvalidNextTokenException < ServiceError
      end

      # The port numbers that you specified are not valid numbers or are not unique for this accelerator.

      class InvalidPortRangeException < ServiceError
      end

      # Processing your request would cause you to exceed an Global Accelerator limit.

      class LimitExceededException < ServiceError
      end

      # The listener that you specified doesn't exist.

      class ListenerNotFoundException < ServiceError
      end

      # There's already a transaction in progress. Another transaction can't be processed.

      class TransactionInProgressException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AcceleratorNotDisabledException"
          AcceleratorNotDisabledException.new(message)
        when "AcceleratorNotFoundException"
          AcceleratorNotFoundException.new(message)
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AssociatedEndpointGroupFoundException"
          AssociatedEndpointGroupFoundException.new(message)
        when "AssociatedListenerFoundException"
          AssociatedListenerFoundException.new(message)
        when "AttachmentNotFoundException"
          AttachmentNotFoundException.new(message)
        when "ByoipCidrNotFoundException"
          ByoipCidrNotFoundException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "EndpointAlreadyExistsException"
          EndpointAlreadyExistsException.new(message)
        when "EndpointGroupAlreadyExistsException"
          EndpointGroupAlreadyExistsException.new(message)
        when "EndpointGroupNotFoundException"
          EndpointGroupNotFoundException.new(message)
        when "EndpointNotFoundException"
          EndpointNotFoundException.new(message)
        when "IncorrectCidrStateException"
          IncorrectCidrStateException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidPortRangeException"
          InvalidPortRangeException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ListenerNotFoundException"
          ListenerNotFoundException.new(message)
        when "TransactionInProgressException"
          TransactionInProgressException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
