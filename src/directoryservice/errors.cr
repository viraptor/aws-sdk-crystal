module Aws
  module DirectoryService
    module Errors
      class ServiceError < Exception
      end

      # A directory assessment is automatically created when you create a hybrid directory. There are two
      # types of assessments: CUSTOMER and SYSTEM . Your Amazon Web Services account has a limit of 100
      # CUSTOMER directory assessments. If you attempt to create a hybrid directory; and you already have
      # 100 CUSTOMER directory assessments;, you will encounter an error. Delete assessments to free up
      # capacity before trying again. You can request an increase to your CUSTOMER directory assessment
      # quota by contacting customer support or delete existing CUSTOMER directory assessments; to free up
      # capacity.

      class ADAssessmentLimitExceededException < ServiceError
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # An authentication error occurred.

      class AuthenticationFailedException < ServiceError
      end

      # The certificate has already been registered into the system.

      class CertificateAlreadyExistsException < ServiceError
      end

      # The certificate is not present in the system for describe or deregister activities.

      class CertificateDoesNotExistException < ServiceError
      end

      # The certificate is being used for the LDAP security connection and cannot be removed without
      # disabling LDAP security.

      class CertificateInUseException < ServiceError
      end

      # The certificate could not be added because the certificate limit has been reached.

      class CertificateLimitExceededException < ServiceError
      end

      # A client exception has occurred.

      class ClientException < ServiceError
      end

      # The Region you specified is the same Region where the Managed Microsoft AD directory was created.
      # Specify a different Region and try again.

      class DirectoryAlreadyInRegionException < ServiceError
      end

      # The specified directory has already been shared with this Amazon Web Services account.

      class DirectoryAlreadySharedException < ServiceError
      end

      # The specified directory does not exist in the system.

      class DirectoryDoesNotExistException < ServiceError
      end

      # The directory is already updated to desired update type settings.

      class DirectoryInDesiredStateException < ServiceError
      end

      # The maximum number of directories in the region has been reached. You can use the GetDirectoryLimits
      # operation to determine your directory limits in the region.

      class DirectoryLimitExceededException < ServiceError
      end

      # The specified directory has not been shared with this Amazon Web Services account.

      class DirectoryNotSharedException < ServiceError
      end

      # The specified directory is unavailable.

      class DirectoryUnavailableException < ServiceError
      end

      # A disable operation for CA enrollment policy is already in progress for this directory.

      class DisableAlreadyInProgressException < ServiceError
      end

      # The maximum allowed number of domain controllers per directory was exceeded. The default limit per
      # directory is 20 domain controllers.

      class DomainControllerLimitExceededException < ServiceError
      end

      # An enable operation for CA enrollment policy is already in progress for this directory.

      class EnableAlreadyInProgressException < ServiceError
      end

      # The specified entity already exists.

      class EntityAlreadyExistsException < ServiceError
      end

      # The specified entity could not be found.

      class EntityDoesNotExistException < ServiceError
      end

      # The specified directory setting is not compatible with other settings.

      class IncompatibleSettingsException < ServiceError
      end

      # The account does not have sufficient permission to perform the operation.

      class InsufficientPermissionsException < ServiceError
      end

      # The certificate PEM that was provided has incorrect encoding.

      class InvalidCertificateException < ServiceError
      end

      # Client authentication is already enabled.

      class InvalidClientAuthStatusException < ServiceError
      end

      # The LDAP activities could not be performed because they are limited by the LDAPS status.

      class InvalidLDAPSStatusException < ServiceError
      end

      # The NextToken value is not valid.

      class InvalidNextTokenException < ServiceError
      end

      # One or more parameters are not valid.

      class InvalidParameterException < ServiceError
      end

      # The new password provided by the user does not meet the password complexity requirements defined in
      # your directory.

      class InvalidPasswordException < ServiceError
      end

      # The specified shared target is not valid.

      class InvalidTargetException < ServiceError
      end

      # The maximum allowed number of IP addresses was exceeded. The default limit is 100 IP address blocks.

      class IpRouteLimitExceededException < ServiceError
      end

      # Client authentication setup could not be completed because at least one valid certificate must be
      # registered in the system.

      class NoAvailableCertificateException < ServiceError
      end

      # Exception encountered while trying to access your Amazon Web Services organization.

      class OrganizationsException < ServiceError
      end

      # You have reached the limit for maximum number of simultaneous Region replications per directory.

      class RegionLimitExceededException < ServiceError
      end

      # An exception has occurred in Directory Service.

      class ServiceException < ServiceError
      end

      # The maximum number of Amazon Web Services accounts that you can share with this directory has been
      # reached.

      class ShareLimitExceededException < ServiceError
      end

      # The maximum number of manual snapshots for the directory has been reached. You can use the
      # GetSnapshotLimits operation to determine the snapshot limits for a directory.

      class SnapshotLimitExceededException < ServiceError
      end

      # The maximum allowed number of tags was exceeded.

      class TagLimitExceededException < ServiceError
      end

      # The operation is not supported.

      class UnsupportedOperationException < ServiceError
      end

      # The specified directory setting is not supported.

      class UnsupportedSettingsException < ServiceError
      end

      # The user provided a username that does not exist in your directory.

      class UserDoesNotExistException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ADAssessmentLimitExceededException"
          ADAssessmentLimitExceededException.new(message)
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AuthenticationFailedException"
          AuthenticationFailedException.new(message)
        when "CertificateAlreadyExistsException"
          CertificateAlreadyExistsException.new(message)
        when "CertificateDoesNotExistException"
          CertificateDoesNotExistException.new(message)
        when "CertificateInUseException"
          CertificateInUseException.new(message)
        when "CertificateLimitExceededException"
          CertificateLimitExceededException.new(message)
        when "ClientException"
          ClientException.new(message)
        when "DirectoryAlreadyInRegionException"
          DirectoryAlreadyInRegionException.new(message)
        when "DirectoryAlreadySharedException"
          DirectoryAlreadySharedException.new(message)
        when "DirectoryDoesNotExistException"
          DirectoryDoesNotExistException.new(message)
        when "DirectoryInDesiredStateException"
          DirectoryInDesiredStateException.new(message)
        when "DirectoryLimitExceededException"
          DirectoryLimitExceededException.new(message)
        when "DirectoryNotSharedException"
          DirectoryNotSharedException.new(message)
        when "DirectoryUnavailableException"
          DirectoryUnavailableException.new(message)
        when "DisableAlreadyInProgressException"
          DisableAlreadyInProgressException.new(message)
        when "DomainControllerLimitExceededException"
          DomainControllerLimitExceededException.new(message)
        when "EnableAlreadyInProgressException"
          EnableAlreadyInProgressException.new(message)
        when "EntityAlreadyExistsException"
          EntityAlreadyExistsException.new(message)
        when "EntityDoesNotExistException"
          EntityDoesNotExistException.new(message)
        when "IncompatibleSettingsException"
          IncompatibleSettingsException.new(message)
        when "InsufficientPermissionsException"
          InsufficientPermissionsException.new(message)
        when "InvalidCertificateException"
          InvalidCertificateException.new(message)
        when "InvalidClientAuthStatusException"
          InvalidClientAuthStatusException.new(message)
        when "InvalidLDAPSStatusException"
          InvalidLDAPSStatusException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidPasswordException"
          InvalidPasswordException.new(message)
        when "InvalidTargetException"
          InvalidTargetException.new(message)
        when "IpRouteLimitExceededException"
          IpRouteLimitExceededException.new(message)
        when "NoAvailableCertificateException"
          NoAvailableCertificateException.new(message)
        when "OrganizationsException"
          OrganizationsException.new(message)
        when "RegionLimitExceededException"
          RegionLimitExceededException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "ShareLimitExceededException"
          ShareLimitExceededException.new(message)
        when "SnapshotLimitExceededException"
          SnapshotLimitExceededException.new(message)
        when "TagLimitExceededException"
          TagLimitExceededException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        when "UnsupportedSettingsException"
          UnsupportedSettingsException.new(message)
        when "UserDoesNotExistException"
          UserDoesNotExistException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
