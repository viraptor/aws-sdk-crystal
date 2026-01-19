module AwsSdk
  module STS
    module Errors
      class ServiceError < Exception
      end

      # The web identity token that was passed is expired or is not valid. Get a new identity token from the
      # identity provider and then retry the request.
      class ExpiredTokenException < ServiceError
      end

      # The trade-in token provided in the request has expired and can no longer be exchanged for
      # credentials. Request a new token and retry the operation.
      class ExpiredTradeInTokenException < ServiceError
      end

      # The request could not be fulfilled because the identity provider (IDP) that was asked to verify the
      # incoming identity token could not be reached. This is often a transient error caused by network
      # conditions. Retry the request a limited number of times so that you don't exceed the request rate.
      # If the error persists, the identity provider might be down or not responding.
      class IDPCommunicationErrorException < ServiceError
      end

      # The identity provider (IdP) reported that authentication failed. This might be because the claim is
      # invalid. If this error is returned for the AssumeRoleWithWebIdentity operation, it can also mean
      # that the claim has expired or has been explicitly revoked.
      class IDPRejectedClaimException < ServiceError
      end

      # The error returned if the message passed to DecodeAuthorizationMessage was invalid. This can happen
      # if the token contains invalid characters, such as line breaks, or if the message has expired.
      class InvalidAuthorizationMessageException < ServiceError
      end

      # The web identity token that was passed could not be validated by Amazon Web Services. Get a new
      # identity token from the identity provider and then retry the request.
      class InvalidIdentityTokenException < ServiceError
      end

      # The requested token payload size exceeds the maximum allowed size. Reduce the number of request tags
      # included in the GetWebIdentityToken API call to reduce the token payload size.
      class JWTPayloadSizeExceededException < ServiceError
      end

      # The request was rejected because the policy document was malformed. The error message describes the
      # specific error.
      class MalformedPolicyDocumentException < ServiceError
      end

      # The outbound web identity federation feature is not enabled for this account. To use this feature,
      # you must first enable it through the Amazon Web Services Management Console or API.
      class OutboundWebIdentityFederationDisabledException < ServiceError
      end

      # The request was rejected because the total packed size of the session policies and session tags
      # combined was too large. An Amazon Web Services conversion compresses the session policy document,
      # session policy ARNs, and session tags into a packed binary format that has a separate limit. The
      # error message indicates by percentage how close the policies and tags are to the upper size limit.
      # For more information, see Passing Session Tags in STS in the IAM User Guide . You could receive this
      # error even though you meet other defined session policy and session tag limits. For more
      # information, see IAM and STS Entity Character Limits in the IAM User Guide .
      class PackedPolicyTooLargeException < ServiceError
      end

      # STS is not activated in the requested region for the account that is being asked to generate
      # credentials. The account administrator must use the IAM console to activate STS in that region. For
      # more information, see Activating and Deactivating STS in an Amazon Web Services Region in the IAM
      # User Guide .
      class RegionDisabledException < ServiceError
      end

      # The requested token duration would extend the session beyond its original expiration time. You
      # cannot use this operation to extend the lifetime of a session beyond what was granted when the
      # session was originally created.
      class SessionDurationEscalationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ExpiredTokenException"
          ExpiredTokenException.new(message)
        when "ExpiredTradeInTokenException"
          ExpiredTradeInTokenException.new(message)
        when "IDPCommunicationErrorException"
          IDPCommunicationErrorException.new(message)
        when "IDPRejectedClaimException"
          IDPRejectedClaimException.new(message)
        when "InvalidAuthorizationMessageException"
          InvalidAuthorizationMessageException.new(message)
        when "InvalidIdentityTokenException"
          InvalidIdentityTokenException.new(message)
        when "JWTPayloadSizeExceededException"
          JWTPayloadSizeExceededException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "OutboundWebIdentityFederationDisabledException"
          OutboundWebIdentityFederationDisabledException.new(message)
        when "PackedPolicyTooLargeException"
          PackedPolicyTooLargeException.new(message)
        when "RegionDisabledException"
          RegionDisabledException.new(message)
        when "SessionDurationEscalationException"
          SessionDurationEscalationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
