module Aws
  module CognitoIdentityProvider
    module Errors
      class ServiceError < Exception
      end

      # This exception is thrown when a user tries to confirm the account with an email address or phone
      # number that has already been supplied as an alias for a different user profile. This exception
      # indicates that an account with this email address or phone already exists in a user pool that you've
      # configured to use email address or phone number as a sign-in alias.

      class AliasExistsException < ServiceError
      end

      # This exception is thrown when a verification code fails to deliver successfully.

      class CodeDeliveryFailureException < ServiceError
      end

      # This exception is thrown if the provided code doesn't match what the server was expecting.

      class CodeMismatchException < ServiceError
      end

      # This exception is thrown if two or more modifications are happening concurrently.

      class ConcurrentModificationException < ServiceError
      end

      # This exception is thrown when a user attempts to confirm a device with a device key that already
      # exists.

      class DeviceKeyExistsException < ServiceError
      end

      # This exception is thrown when the provider is already supported by the user pool.

      class DuplicateProviderException < ServiceError
      end

      # This exception is thrown when there is a code mismatch and the service fails to configure the
      # software token TOTP multi-factor authentication (MFA).

      class EnableSoftwareTokenMFAException < ServiceError
      end

      # This exception is thrown if a code has expired.

      class ExpiredCodeException < ServiceError
      end

      # This exception is thrown when a feature you attempted to configure isn't available in your current
      # feature plan.

      class FeatureUnavailableInTierException < ServiceError
      end

      # This exception is thrown when WAF doesn't allow your request based on a web ACL that's associated
      # with your user pool.

      class ForbiddenException < ServiceError
      end

      # This exception is thrown when Amazon Cognito encounters a group that already exists in the user
      # pool.

      class GroupExistsException < ServiceError
      end

      # This exception is thrown when Amazon Cognito encounters an internal error.

      class InternalErrorException < ServiceError
      end

      # This exception is thrown when Amazon Cognito isn't allowed to use your email identity. HTTP status
      # code: 400.

      class InvalidEmailRoleAccessPolicyException < ServiceError
      end

      # This exception is thrown when Amazon Cognito encounters an invalid Lambda response.

      class InvalidLambdaResponseException < ServiceError
      end

      # This exception is thrown when the specified OAuth flow is not valid.

      class InvalidOAuthFlowException < ServiceError
      end

      # This exception is thrown when the Amazon Cognito service encounters an invalid parameter.

      class InvalidParameterException < ServiceError
      end

      # This exception is thrown when Amazon Cognito encounters an invalid password.

      class InvalidPasswordException < ServiceError
      end

      # This exception is returned when the role provided for SMS configuration doesn't have permission to
      # publish using Amazon SNS.

      class InvalidSmsRoleAccessPolicyException < ServiceError
      end

      # This exception is thrown when the trust relationship is not valid for the role provided for SMS
      # configuration. This can happen if you don't trust cognito-idp.amazonaws.com or the external ID
      # provided in the role does not match what is provided in the SMS configuration for the user pool.

      class InvalidSmsRoleTrustRelationshipException < ServiceError
      end

      # This exception is thrown when the user pool configuration is not valid.

      class InvalidUserPoolConfigurationException < ServiceError
      end

      # This exception is thrown when a user exceeds the limit for a requested Amazon Web Services resource.

      class LimitExceededException < ServiceError
      end

      # This exception is thrown when Amazon Cognito can't find a multi-factor authentication (MFA) method.

      class MFAMethodNotFoundException < ServiceError
      end

      # This exception is thrown when you attempt to apply a managed login branding style to an app client
      # that already has an assigned style.

      class ManagedLoginBrandingExistsException < ServiceError
      end

      # This exception is thrown when a user isn't authorized.

      class NotAuthorizedException < ServiceError
      end

      # The message returned when a user's new password matches a previous password and doesn't comply with
      # the password-history policy.

      class PasswordHistoryPolicyViolationException < ServiceError
      end

      # This exception is thrown when a password reset is required.

      class PasswordResetRequiredException < ServiceError
      end

      # This exception is thrown when a precondition is not met.

      class PreconditionNotMetException < ServiceError
      end

      # This exception is throw when your application requests token refresh with a refresh token that has
      # been invalidated by refresh-token rotation.

      class RefreshTokenReuseException < ServiceError
      end

      # This exception is thrown when the Amazon Cognito service can't find the requested resource.

      class ResourceNotFoundException < ServiceError
      end

      # This exception is thrown when the specified scope doesn't exist.

      class ScopeDoesNotExistException < ServiceError
      end

      # This exception is thrown when the software token time-based one-time password (TOTP) multi-factor
      # authentication (MFA) isn't activated for the user pool.

      class SoftwareTokenMFANotFoundException < ServiceError
      end

      # Terms document names must be unique to the app client. This exception is thrown when you attempt to
      # create terms documents with a duplicate TermsName .

      class TermsExistsException < ServiceError
      end

      # This exception is thrown when you've attempted to change your feature plan but the operation isn't
      # permitted.

      class TierChangeNotAllowedException < ServiceError
      end

      # This exception is thrown when the user has made too many failed attempts for a given action, such as
      # sign-in.

      class TooManyFailedAttemptsException < ServiceError
      end

      # This exception is thrown when the user has made too many requests for a given operation.

      class TooManyRequestsException < ServiceError
      end

      # Exception that is thrown when the request isn't authorized. This can happen due to an invalid access
      # token in the request.

      class UnauthorizedException < ServiceError
      end

      # This exception is thrown when Amazon Cognito encounters an unexpected exception with Lambda.

      class UnexpectedLambdaException < ServiceError
      end

      # This exception is thrown when the specified identifier isn't supported.

      class UnsupportedIdentityProviderException < ServiceError
      end

      # Exception that is thrown when you attempt to perform an operation that isn't enabled for the user
      # pool client.

      class UnsupportedOperationException < ServiceError
      end

      # Exception that is thrown when an unsupported token is passed to an operation.

      class UnsupportedTokenTypeException < ServiceError
      end

      # The request failed because the user is in an unsupported state.

      class UnsupportedUserStateException < ServiceError
      end

      # This exception is thrown when you're trying to modify a user pool while a user import job is in
      # progress for that pool.

      class UserImportInProgressException < ServiceError
      end

      # This exception is thrown when the Amazon Cognito service encounters a user validation exception with
      # the Lambda service.

      class UserLambdaValidationException < ServiceError
      end

      # This exception is thrown when a user isn't confirmed successfully.

      class UserNotConfirmedException < ServiceError
      end

      # This exception is thrown when a user isn't found.

      class UserNotFoundException < ServiceError
      end

      # This exception is thrown when user pool add-ons aren't enabled.

      class UserPoolAddOnNotEnabledException < ServiceError
      end

      # This exception is thrown when a user pool tag can't be set or updated.

      class UserPoolTaggingException < ServiceError
      end

      # This exception is thrown when Amazon Cognito encounters a user name that already exists in the user
      # pool.

      class UsernameExistsException < ServiceError
      end

      # This exception is thrown when the challenge from StartWebAuthn registration has expired.

      class WebAuthnChallengeNotFoundException < ServiceError
      end

      # This exception is thrown when the access token is for a different client than the one in the
      # original StartWebAuthnRegistration request.

      class WebAuthnClientMismatchException < ServiceError
      end

      # This exception is thrown when a user pool doesn't have a configured relying party id or a user pool
      # domain.

      class WebAuthnConfigurationMissingException < ServiceError
      end

      # This exception is thrown when a user presents passkey credentials from an unsupported device or
      # provider.

      class WebAuthnCredentialNotSupportedException < ServiceError
      end

      # This exception is thrown when the passkey feature isn't enabled for the user pool.

      class WebAuthnNotEnabledException < ServiceError
      end

      # This exception is thrown when the passkey credential's registration origin does not align with the
      # user pool relying party id.

      class WebAuthnOriginNotAllowedException < ServiceError
      end

      # This exception is thrown when the given passkey credential is associated with a different relying
      # party ID than the user pool relying party ID.

      class WebAuthnRelyingPartyMismatchException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AliasExistsException"
          AliasExistsException.new(message)
        when "CodeDeliveryFailureException"
          CodeDeliveryFailureException.new(message)
        when "CodeMismatchException"
          CodeMismatchException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "DeviceKeyExistsException"
          DeviceKeyExistsException.new(message)
        when "DuplicateProviderException"
          DuplicateProviderException.new(message)
        when "EnableSoftwareTokenMFAException"
          EnableSoftwareTokenMFAException.new(message)
        when "ExpiredCodeException"
          ExpiredCodeException.new(message)
        when "FeatureUnavailableInTierException"
          FeatureUnavailableInTierException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "GroupExistsException"
          GroupExistsException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidEmailRoleAccessPolicyException"
          InvalidEmailRoleAccessPolicyException.new(message)
        when "InvalidLambdaResponseException"
          InvalidLambdaResponseException.new(message)
        when "InvalidOAuthFlowException"
          InvalidOAuthFlowException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidPasswordException"
          InvalidPasswordException.new(message)
        when "InvalidSmsRoleAccessPolicyException"
          InvalidSmsRoleAccessPolicyException.new(message)
        when "InvalidSmsRoleTrustRelationshipException"
          InvalidSmsRoleTrustRelationshipException.new(message)
        when "InvalidUserPoolConfigurationException"
          InvalidUserPoolConfigurationException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MFAMethodNotFoundException"
          MFAMethodNotFoundException.new(message)
        when "ManagedLoginBrandingExistsException"
          ManagedLoginBrandingExistsException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "PasswordHistoryPolicyViolationException"
          PasswordHistoryPolicyViolationException.new(message)
        when "PasswordResetRequiredException"
          PasswordResetRequiredException.new(message)
        when "PreconditionNotMetException"
          PreconditionNotMetException.new(message)
        when "RefreshTokenReuseException"
          RefreshTokenReuseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ScopeDoesNotExistException"
          ScopeDoesNotExistException.new(message)
        when "SoftwareTokenMFANotFoundException"
          SoftwareTokenMFANotFoundException.new(message)
        when "TermsExistsException"
          TermsExistsException.new(message)
        when "TierChangeNotAllowedException"
          TierChangeNotAllowedException.new(message)
        when "TooManyFailedAttemptsException"
          TooManyFailedAttemptsException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "UnexpectedLambdaException"
          UnexpectedLambdaException.new(message)
        when "UnsupportedIdentityProviderException"
          UnsupportedIdentityProviderException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        when "UnsupportedTokenTypeException"
          UnsupportedTokenTypeException.new(message)
        when "UnsupportedUserStateException"
          UnsupportedUserStateException.new(message)
        when "UserImportInProgressException"
          UserImportInProgressException.new(message)
        when "UserLambdaValidationException"
          UserLambdaValidationException.new(message)
        when "UserNotConfirmedException"
          UserNotConfirmedException.new(message)
        when "UserNotFoundException"
          UserNotFoundException.new(message)
        when "UserPoolAddOnNotEnabledException"
          UserPoolAddOnNotEnabledException.new(message)
        when "UserPoolTaggingException"
          UserPoolTaggingException.new(message)
        when "UsernameExistsException"
          UsernameExistsException.new(message)
        when "WebAuthnChallengeNotFoundException"
          WebAuthnChallengeNotFoundException.new(message)
        when "WebAuthnClientMismatchException"
          WebAuthnClientMismatchException.new(message)
        when "WebAuthnConfigurationMissingException"
          WebAuthnConfigurationMissingException.new(message)
        when "WebAuthnCredentialNotSupportedException"
          WebAuthnCredentialNotSupportedException.new(message)
        when "WebAuthnNotEnabledException"
          WebAuthnNotEnabledException.new(message)
        when "WebAuthnOriginNotAllowedException"
          WebAuthnOriginNotAllowedException.new(message)
        when "WebAuthnRelyingPartyMismatchException"
          WebAuthnRelyingPartyMismatchException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
