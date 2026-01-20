module AwsSdk
  module WorkMail
    module Errors
      class ServiceError < Exception
      end

      # The directory is already in use by another WorkMail organization in the same account and Region.

      class DirectoryInUseException < ServiceError
      end

      # The directory service doesn't recognize the credentials supplied by WorkMail.

      class DirectoryServiceAuthenticationFailedException < ServiceError
      end

      # The directory is unavailable. It might be located in another Region or deleted.

      class DirectoryUnavailableException < ServiceError
      end

      # The email address that you're trying to assign is already created for a different user, group, or
      # resource.

      class EmailAddressInUseException < ServiceError
      end

      # The user, group, or resource that you're trying to register is already registered.

      class EntityAlreadyRegisteredException < ServiceError
      end

      # The identifier supplied for the user, group, or resource does not exist in your organization.

      class EntityNotFoundException < ServiceError
      end

      # You are performing an operation on a user, group, or resource that isn't in the expected state, such
      # as trying to delete an active user.

      class EntityStateException < ServiceError
      end

      # The configuration for a resource isn't valid. A resource must either be able to auto-respond to
      # requests or have at least one delegate associated that can do so on its behalf.

      class InvalidConfigurationException < ServiceError
      end

      # You SES configuration has customizations that WorkMail cannot save. The error message lists the
      # invalid setting. For examples of invalid settings, refer to CreateReceiptRule .

      class InvalidCustomSesConfigurationException < ServiceError
      end

      # One or more of the input parameters don't match the service's restrictions.

      class InvalidParameterException < ServiceError
      end

      # The supplied password doesn't match the minimum security constraints, such as length or use of
      # special characters.

      class InvalidPasswordException < ServiceError
      end

      # The request exceeds the limit of the resource.

      class LimitExceededException < ServiceError
      end

      # The domain you're trying to change is in use by another user or organization in your account. See
      # the error message for details.

      class MailDomainInUseException < ServiceError
      end

      # The domain specified is not found in your organization.

      class MailDomainNotFoundException < ServiceError
      end

      # After a domain has been added to the organization, it must be verified. The domain is not yet
      # verified.

      class MailDomainStateException < ServiceError
      end

      # The user, group, or resource name isn't unique in WorkMail.

      class NameAvailabilityException < ServiceError
      end

      # An operation received a valid organization identifier that either doesn't belong or exist in the
      # system.

      class OrganizationNotFoundException < ServiceError
      end

      # The organization must have a valid state to perform certain operations on the organization or its
      # members.

      class OrganizationStateException < ServiceError
      end

      # This user, group, or resource name is not allowed in WorkMail.

      class ReservedNameException < ServiceError
      end

      # The resource cannot be found.

      class ResourceNotFoundException < ServiceError
      end

      # The resource can have up to 50 user-applied tags.

      class TooManyTagsException < ServiceError
      end

      # You can't perform a write operation against a read-only directory.

      class UnsupportedOperationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DirectoryInUseException"
          DirectoryInUseException.new(message)
        when "DirectoryServiceAuthenticationFailedException"
          DirectoryServiceAuthenticationFailedException.new(message)
        when "DirectoryUnavailableException"
          DirectoryUnavailableException.new(message)
        when "EmailAddressInUseException"
          EmailAddressInUseException.new(message)
        when "EntityAlreadyRegisteredException"
          EntityAlreadyRegisteredException.new(message)
        when "EntityNotFoundException"
          EntityNotFoundException.new(message)
        when "EntityStateException"
          EntityStateException.new(message)
        when "InvalidConfigurationException"
          InvalidConfigurationException.new(message)
        when "InvalidCustomSesConfigurationException"
          InvalidCustomSesConfigurationException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidPasswordException"
          InvalidPasswordException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MailDomainInUseException"
          MailDomainInUseException.new(message)
        when "MailDomainNotFoundException"
          MailDomainNotFoundException.new(message)
        when "MailDomainStateException"
          MailDomainStateException.new(message)
        when "NameAvailabilityException"
          NameAvailabilityException.new(message)
        when "OrganizationNotFoundException"
          OrganizationNotFoundException.new(message)
        when "OrganizationStateException"
          OrganizationStateException.new(message)
        when "ReservedNameException"
          ReservedNameException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
