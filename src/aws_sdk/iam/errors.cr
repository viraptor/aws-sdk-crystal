module AwsSdk
  module IAM
    module Errors
      class ServiceError < Exception
      end

      # The request was rejected because the account making the request is not the management account or
      # delegated administrator account for centralized root access .
      class AccountNotManagementOrDelegatedAdministratorException < ServiceError
      end

      # The request was rejected because the account making the request is not the management account for
      # the organization.
      class CallerIsNotManagementAccountException < ServiceError
      end

      # The request was rejected because multiple requests to change this object were submitted
      # simultaneously. Wait a few minutes and submit your request again.
      class ConcurrentModificationException < ServiceError
      end

      # The request was rejected because the most recent credential report has expired. To generate a new
      # credential report, use GenerateCredentialReport . For more information about credential report
      # expiration, see Getting credential reports in the IAM User Guide .
      class CredentialReportExpiredException < ServiceError
      end

      # The request was rejected because the credential report does not exist. To generate a credential
      # report, use GenerateCredentialReport .
      class CredentialReportNotPresentException < ServiceError
      end

      # The request was rejected because the credential report is still being generated.
      class CredentialReportNotReadyException < ServiceError
      end

      # The request was rejected because it attempted to delete a resource that has attached subordinate
      # entities. The error message describes these entities.
      class DeleteConflictException < ServiceError
      end

      # The request was rejected because the same certificate is associated with an IAM user in the account.
      class DuplicateCertificateException < ServiceError
      end

      # The request was rejected because the SSH public key is already associated with the specified IAM
      # user.
      class DuplicateSSHPublicKeyException < ServiceError
      end

      # The request was rejected because it attempted to create a resource that already exists.
      class EntityAlreadyExistsException < ServiceError
      end

      # The request was rejected because it referenced an entity that is temporarily unmodifiable, such as a
      # user name that was deleted and then recreated. The error indicates that the request is likely to
      # succeed if you try again after waiting several minutes. The error message describes the entity.
      class EntityTemporarilyUnmodifiableException < ServiceError
      end

      # The request failed because outbound identity federation is already disabled for your Amazon Web
      # Services account. You cannot disable the feature multiple times
      class FeatureDisabledException < ServiceError
      end

      # The request failed because outbound identity federation is already enabled for your Amazon Web
      # Services account. You cannot enable the feature multiple times. To fetch the current configuration
      # (including the unique issuer URL), use the GetOutboundWebIdentityFederationInfo operation.
      class FeatureEnabledException < ServiceError
      end

      # The request was rejected because the authentication code was not recognized. The error message
      # describes the specific error.
      class InvalidAuthenticationCodeException < ServiceError
      end

      # The request was rejected because the certificate is invalid.
      class InvalidCertificateException < ServiceError
      end

      # The request was rejected because an invalid or out-of-range value was supplied for an input
      # parameter.
      class InvalidInputException < ServiceError
      end

      # The request was rejected because the public key is malformed or otherwise invalid.
      class InvalidPublicKeyException < ServiceError
      end

      # The request was rejected because the type of user for the transaction was incorrect.
      class InvalidUserTypeException < ServiceError
      end

      # The request was rejected because the public key certificate and the private key do not match.
      class KeyPairMismatchException < ServiceError
      end

      # The request was rejected because it attempted to create resources beyond the current Amazon Web
      # Services account limits. The error message describes the limit exceeded.
      class LimitExceededException < ServiceError
      end

      # The request was rejected because the certificate was malformed or expired. The error message
      # describes the specific error.
      class MalformedCertificateException < ServiceError
      end

      # The request was rejected because the policy document was malformed. The error message describes the
      # specific error.
      class MalformedPolicyDocumentException < ServiceError
      end

      # The request was rejected because it referenced a resource entity that does not exist. The error
      # message describes the resource.
      class NoSuchEntityException < ServiceError
      end

      # The request failed because IAM cannot connect to the OpenID Connect identity provider URL.
      class OpenIdIdpCommunicationErrorException < ServiceError
      end

      # The request was rejected because no organization is associated with your account.
      class OrganizationNotFoundException < ServiceError
      end

      # The request was rejected because your organization does not have All features enabled. For more
      # information, see Available feature sets in the Organizations User Guide .
      class OrganizationNotInAllFeaturesModeException < ServiceError
      end

      # The request was rejected because the provided password did not meet the requirements imposed by the
      # account password policy.
      class PasswordPolicyViolationException < ServiceError
      end

      # The request failed because a provided policy could not be successfully evaluated. An additional
      # detailed message indicates the source of the failure.
      class PolicyEvaluationException < ServiceError
      end

      # The request failed because Amazon Web Services service role policies can only be attached to the
      # service-linked role for that service.
      class PolicyNotAttachableException < ServiceError
      end

      # The request failed because the maximum number of concurrent requests for this account are already
      # running.
      class ReportGenerationLimitExceededException < ServiceError
      end

      # The request was rejected because trusted access is not enabled for IAM in Organizations. For
      # details, see IAM and Organizations in the Organizations User Guide .
      class ServiceAccessNotEnabledException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.
      class ServiceFailureException < ServiceError
      end

      # The specified service does not support service-specific credentials.
      class ServiceNotSupportedException < ServiceError
      end

      # The request was rejected because service-linked roles are protected Amazon Web Services resources.
      # Only the service that depends on the service-linked role can modify or delete the role on your
      # behalf. The error message includes the name of the service that depends on this service-linked role.
      # You must request the change through that service.
      class UnmodifiableEntityException < ServiceError
      end

      # The request was rejected because the public key encoding format is unsupported or unrecognized.
      class UnrecognizedPublicKeyEncodingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccountNotManagementOrDelegatedAdministratorException"
          AccountNotManagementOrDelegatedAdministratorException.new(message)
        when "CallerIsNotManagementAccountException"
          CallerIsNotManagementAccountException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "CredentialReportExpiredException"
          CredentialReportExpiredException.new(message)
        when "CredentialReportNotPresentException"
          CredentialReportNotPresentException.new(message)
        when "CredentialReportNotReadyException"
          CredentialReportNotReadyException.new(message)
        when "DeleteConflictException"
          DeleteConflictException.new(message)
        when "DuplicateCertificateException"
          DuplicateCertificateException.new(message)
        when "DuplicateSSHPublicKeyException"
          DuplicateSSHPublicKeyException.new(message)
        when "EntityAlreadyExistsException"
          EntityAlreadyExistsException.new(message)
        when "EntityTemporarilyUnmodifiableException"
          EntityTemporarilyUnmodifiableException.new(message)
        when "FeatureDisabledException"
          FeatureDisabledException.new(message)
        when "FeatureEnabledException"
          FeatureEnabledException.new(message)
        when "InvalidAuthenticationCodeException"
          InvalidAuthenticationCodeException.new(message)
        when "InvalidCertificateException"
          InvalidCertificateException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "InvalidPublicKeyException"
          InvalidPublicKeyException.new(message)
        when "InvalidUserTypeException"
          InvalidUserTypeException.new(message)
        when "KeyPairMismatchException"
          KeyPairMismatchException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MalformedCertificateException"
          MalformedCertificateException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "NoSuchEntityException"
          NoSuchEntityException.new(message)
        when "OpenIdIdpCommunicationErrorException"
          OpenIdIdpCommunicationErrorException.new(message)
        when "OrganizationNotFoundException"
          OrganizationNotFoundException.new(message)
        when "OrganizationNotInAllFeaturesModeException"
          OrganizationNotInAllFeaturesModeException.new(message)
        when "PasswordPolicyViolationException"
          PasswordPolicyViolationException.new(message)
        when "PolicyEvaluationException"
          PolicyEvaluationException.new(message)
        when "PolicyNotAttachableException"
          PolicyNotAttachableException.new(message)
        when "ReportGenerationLimitExceededException"
          ReportGenerationLimitExceededException.new(message)
        when "ServiceAccessNotEnabledException"
          ServiceAccessNotEnabledException.new(message)
        when "ServiceFailureException"
          ServiceFailureException.new(message)
        when "ServiceNotSupportedException"
          ServiceNotSupportedException.new(message)
        when "UnmodifiableEntityException"
          UnmodifiableEntityException.new(message)
        when "UnrecognizedPublicKeyEncodingException"
          UnrecognizedPublicKeyEncodingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
