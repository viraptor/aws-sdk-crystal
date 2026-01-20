module Aws
  module QuickSight
    module Errors
      class ServiceError < Exception
      end

      # You don't have access to this item. The provided credentials couldn't be validated. You might not be
      # authorized to carry out the request. Make sure that your account is authorized to use the Amazon
      # Quick Sight service, that your policies have the correct permissions, and that you are using the
      # correct credentials.

      class AccessDeniedException < ServiceError
      end

      # A resource is already in a state that indicates an operation is happening that must complete before
      # a new update can be applied.

      class ConcurrentUpdatingException < ServiceError
      end

      # Updating or deleting a resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # The customer managed key that is registered to your Amazon Quick Sight account is unavailable.

      class CustomerManagedKeyUnavailableException < ServiceError
      end

      # The domain specified isn't on the allow list. All domains for embedded dashboards must be added to
      # the approved list by an Amazon Quick Suite admin.

      class DomainNotWhitelistedException < ServiceError
      end

      # The identity type specified isn't supported. Supported identity types include IAM and QUICKSIGHT .

      class IdentityTypeNotSupportedException < ServiceError
      end

      # An internal failure occurred.

      class InternalFailureException < ServiceError
      end

      # An internal service exception.

      class InternalServerException < ServiceError
      end

      # An exception thrown when an invalid parameter value is provided for dataset operations.

      class InvalidDataSetParameterValueException < ServiceError
      end

      # The NextToken value isn't valid.

      class InvalidNextTokenException < ServiceError
      end

      # One or more parameter has a value that isn't valid.

      class InvalidParameterException < ServiceError
      end

      # One or more parameters has a value that isn't valid.

      class InvalidParameterValueException < ServiceError
      end

      # You don't have this feature activated for your account. To fix this issue, contact Amazon Web
      # Services support.

      class InvalidRequestException < ServiceError
      end

      # A limit is exceeded.

      class LimitExceededException < ServiceError
      end

      # One or more preconditions aren't met.

      class PreconditionNotMetException < ServiceError
      end

      # The user with the provided name isn't found. This error can happen in any operation that requires
      # finding a user based on a provided user name, such as DeleteUser , DescribeUser , and so on.

      class QuickSightUserNotFoundException < ServiceError
      end

      # The resource specified already exists.

      class ResourceExistsException < ServiceError
      end

      # One or more resources can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # This resource is currently unavailable.

      class ResourceUnavailableException < ServiceError
      end

      # The number of minutes specified for the lifetime of a session isn't valid. The session lifetime must
      # be 15-600 minutes.

      class SessionLifetimeInMinutesInvalidException < ServiceError
      end

      # Access is throttled.

      class ThrottlingException < ServiceError
      end

      # This error indicates that you are calling an embedding operation in Amazon Quick Sight without the
      # required pricing plan on your Amazon Web Services account. Before you can use embedding for
      # anonymous users, a Quick Suite administrator needs to add capacity pricing to Quick Sight. You can
      # do this on the Manage Quick Suite page. After capacity pricing is added, you can use the
      # GetDashboardEmbedUrl API operation with the --identity-type ANONYMOUS option.

      class UnsupportedPricingPlanException < ServiceError
      end

      # This error indicates that you are calling an operation on an Amazon Quick Suite subscription where
      # the edition doesn't include support for that operation. Amazon Quick Suite currently has Standard
      # Edition and Enterprise Edition. Not every operation and capability is available in every edition.

      class UnsupportedUserEditionException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConcurrentUpdatingException"
          ConcurrentUpdatingException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "CustomerManagedKeyUnavailableException"
          CustomerManagedKeyUnavailableException.new(message)
        when "DomainNotWhitelistedException"
          DomainNotWhitelistedException.new(message)
        when "IdentityTypeNotSupportedException"
          IdentityTypeNotSupportedException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidDataSetParameterValueException"
          InvalidDataSetParameterValueException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "PreconditionNotMetException"
          PreconditionNotMetException.new(message)
        when "QuickSightUserNotFoundException"
          QuickSightUserNotFoundException.new(message)
        when "ResourceExistsException"
          ResourceExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
        when "SessionLifetimeInMinutesInvalidException"
          SessionLifetimeInMinutesInvalidException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedPricingPlanException"
          UnsupportedPricingPlanException.new(message)
        when "UnsupportedUserEditionException"
          UnsupportedUserEditionException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
