module AwsSdk
  module Connect
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Request processing failed because dependent condition failed.

      class ConditionalOperationFailedException < ServiceError
      end

      # Operation cannot be performed at this time as there is a conflict with another operation or contact
      # state.

      class ConflictException < ServiceError
      end

      # The flow has not been published.

      class ContactFlowNotPublishedException < ServiceError
      end

      # The contact with the specified ID does not exist.

      class ContactNotFoundException < ServiceError
      end

      # Outbound calls to the destination number are not allowed.

      class DestinationNotAllowedException < ServiceError
      end

      # A resource with the specified name already exists.

      class DuplicateResourceException < ServiceError
      end

      # An entity with the same name already exists.

      class IdempotencyException < ServiceError
      end

      # Request processing failed because of an error or failure with the service.

      class InternalServiceException < ServiceError
      end

      # This exception occurs when an API request is made to a non-active region in an Amazon Connect
      # instance configured with Amazon Connect Global Resiliency. For example, if the active region is US
      # West (Oregon) and a request is made to US East (N. Virginia), the exception will be returned.

      class InvalidActiveRegionException < ServiceError
      end

      # The flow is not valid.

      class InvalidContactFlowException < ServiceError
      end

      # The problems with the module. Please fix before trying again.

      class InvalidContactFlowModuleException < ServiceError
      end

      # One or more of the specified parameters are not valid.

      class InvalidParameterException < ServiceError
      end

      # The request is not valid.

      class InvalidRequestException < ServiceError
      end

      # The allowed limit for the resource has been exceeded.

      class LimitExceededException < ServiceError
      end

      # Maximum number (1000) of tags have been returned with current request. Consider changing request
      # parameters to get more tags.

      class MaximumResultReturnedException < ServiceError
      end

      # The contact is not permitted.

      class OutboundContactNotPermittedException < ServiceError
      end

      # Thrown for analyzed content when requested OutputType was not enabled for a given contact. For
      # example, if an OutputType.Raw was requested for a contact that had `RedactedOnly` Redaction policy
      # set in the flow.

      class OutputTypeNotFoundException < ServiceError
      end

      # The property is not valid.

      class PropertyValidationException < ServiceError
      end

      # A resource already has that name.

      class ResourceConflictException < ServiceError
      end

      # That resource is already in use (for example, you're trying to add a record with the same name as an
      # existing record). If you are trying to delete a resource (for example, DeleteHoursOfOperation or
      # DeletePredefinedAttribute), remove its reference from related resources and then try again.

      class ResourceInUseException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The resource is not ready.

      class ResourceNotReadyException < ServiceError
      end

      # The service quota has been exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The throttling limit has been exceeded.

      class ThrottlingException < ServiceError
      end

      # Displayed when rate-related API limits are exceeded.

      class TooManyRequestsException < ServiceError
      end

      # No user with the specified credentials was found in the Amazon Connect instance.

      class UserNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConditionalOperationFailedException"
          ConditionalOperationFailedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ContactFlowNotPublishedException"
          ContactFlowNotPublishedException.new(message)
        when "ContactNotFoundException"
          ContactNotFoundException.new(message)
        when "DestinationNotAllowedException"
          DestinationNotAllowedException.new(message)
        when "DuplicateResourceException"
          DuplicateResourceException.new(message)
        when "IdempotencyException"
          IdempotencyException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidActiveRegionException"
          InvalidActiveRegionException.new(message)
        when "InvalidContactFlowException"
          InvalidContactFlowException.new(message)
        when "InvalidContactFlowModuleException"
          InvalidContactFlowModuleException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MaximumResultReturnedException"
          MaximumResultReturnedException.new(message)
        when "OutboundContactNotPermittedException"
          OutboundContactNotPermittedException.new(message)
        when "OutputTypeNotFoundException"
          OutputTypeNotFoundException.new(message)
        when "PropertyValidationException"
          PropertyValidationException.new(message)
        when "ResourceConflictException"
          ResourceConflictException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceNotReadyException"
          ResourceNotReadyException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "UserNotFoundException"
          UserNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
