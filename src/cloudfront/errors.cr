module Aws
  module CloudFront
    module Errors
      class ServiceError < Exception
      end

      # Access denied.

      class AccessDenied < ServiceError
      end

      # Invalidation batch specified is too large.

      class BatchTooLarge < ServiceError
      end

      # The CNAME specified is already defined for CloudFront.

      class CNAMEAlreadyExists < ServiceError
      end

      # A cache policy with this name already exists. You must provide a unique name. To modify an existing
      # cache policy, use UpdateCachePolicy .

      class CachePolicyAlreadyExists < ServiceError
      end

      # Cannot delete the cache policy because it is attached to one or more cache behaviors.

      class CachePolicyInUse < ServiceError
      end

      # You can't change the value of a public key.

      class CannotChangeImmutablePublicKeyFields < ServiceError
      end

      # The entity cannot be deleted while it is in use.

      class CannotDeleteEntityWhileInUse < ServiceError
      end

      # The entity cannot be updated while it is in use.

      class CannotUpdateEntityWhileInUse < ServiceError
      end

      # If the CallerReference is a value you already sent in a previous request to create an identity but
      # the content of the CloudFrontOriginAccessIdentityConfig is different from the original request,
      # CloudFront returns a CloudFrontOriginAccessIdentityAlreadyExists error.

      class CloudFrontOriginAccessIdentityAlreadyExists < ServiceError
      end

      # The Origin Access Identity specified is already in use.

      class CloudFrontOriginAccessIdentityInUse < ServiceError
      end

      # A continuous deployment policy with this configuration already exists.

      class ContinuousDeploymentPolicyAlreadyExists < ServiceError
      end

      # You cannot delete a continuous deployment policy that is associated with a primary distribution.

      class ContinuousDeploymentPolicyInUse < ServiceError
      end

      # The caller reference you attempted to create the distribution with is associated with another
      # distribution.

      class DistributionAlreadyExists < ServiceError
      end

      # The specified CloudFront distribution is not disabled. You must disable the distribution before you
      # can delete it.

      class DistributionNotDisabled < ServiceError
      end

      # The entity already exists. You must provide a unique entity.

      class EntityAlreadyExists < ServiceError
      end

      # The entity limit has been exceeded.

      class EntityLimitExceeded < ServiceError
      end

      # The entity was not found.

      class EntityNotFound < ServiceError
      end

      # The entity size limit was exceeded.

      class EntitySizeLimitExceeded < ServiceError
      end

      # The specified configuration for field-level encryption already exists.

      class FieldLevelEncryptionConfigAlreadyExists < ServiceError
      end

      # The specified configuration for field-level encryption is in use.

      class FieldLevelEncryptionConfigInUse < ServiceError
      end

      # The specified profile for field-level encryption already exists.

      class FieldLevelEncryptionProfileAlreadyExists < ServiceError
      end

      # The specified profile for field-level encryption is in use.

      class FieldLevelEncryptionProfileInUse < ServiceError
      end

      # The maximum size of a profile for field-level encryption was exceeded.

      class FieldLevelEncryptionProfileSizeExceeded < ServiceError
      end

      # A function with the same name already exists in this Amazon Web Services account. To create a
      # function, you must provide a unique name. To update an existing function, use UpdateFunction .

      class FunctionAlreadyExists < ServiceError
      end

      # Cannot delete the function because it's attached to one or more cache behaviors.

      class FunctionInUse < ServiceError
      end

      # The function is too large. For more information, see Quotas (formerly known as limits) in the Amazon
      # CloudFront Developer Guide .

      class FunctionSizeLimitExceeded < ServiceError
      end

      # Deletion is not allowed for this entity.

      class IllegalDelete < ServiceError
      end

      # The specified configuration for field-level encryption can't be associated with the specified cache
      # behavior.

      class IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior < ServiceError
      end

      # An origin cannot contain both an origin access control (OAC) and an origin access identity (OAI).

      class IllegalOriginAccessConfiguration < ServiceError
      end

      # The update contains modifications that are not allowed.

      class IllegalUpdate < ServiceError
      end

      # The value of Quantity and the size of Items don't match.

      class InconsistentQuantities < ServiceError
      end

      # An argument is invalid.

      class InvalidArgument < ServiceError
      end

      # The specified CloudFront resource can't be associated.

      class InvalidAssociation < ServiceError
      end

      # The default root object file name is too big or contains an invalid character.

      class InvalidDefaultRootObject < ServiceError
      end

      # An origin access control is associated with an origin whose domain name is not supported.

      class InvalidDomainNameForOriginAccessControl < ServiceError
      end

      # An invalid error code was specified.

      class InvalidErrorCode < ServiceError
      end

      # Your request contains forward cookies option which doesn't match with the expectation for the
      # whitelisted list of cookie names. Either list of cookie names has been specified when not allowed or
      # list of cookie names is missing when expected.

      class InvalidForwardCookies < ServiceError
      end

      # A CloudFront function association is invalid.

      class InvalidFunctionAssociation < ServiceError
      end

      # The specified geo restriction parameter is not valid.

      class InvalidGeoRestrictionParameter < ServiceError
      end

      # The headers specified are not valid for an Amazon S3 origin.

      class InvalidHeadersForS3Origin < ServiceError
      end

      # The If-Match version is missing or not valid.

      class InvalidIfMatchVersion < ServiceError
      end

      # The specified Lambda@Edge function association is invalid.

      class InvalidLambdaFunctionAssociation < ServiceError
      end

      # The location code specified is not valid.

      class InvalidLocationCode < ServiceError
      end

      # The minimum protocol version specified is not valid.

      class InvalidMinimumProtocolVersion < ServiceError
      end

      # The Amazon S3 origin server specified does not refer to a valid Amazon S3 bucket.

      class InvalidOrigin < ServiceError
      end

      # The origin access control is not valid.

      class InvalidOriginAccessControl < ServiceError
      end

      # The origin access identity is not valid or doesn't exist.

      class InvalidOriginAccessIdentity < ServiceError
      end

      # The keep alive timeout specified for the origin is not valid.

      class InvalidOriginKeepaliveTimeout < ServiceError
      end

      # The read timeout specified for the origin is not valid.

      class InvalidOriginReadTimeout < ServiceError
      end

      # You cannot specify SSLv3 as the minimum protocol version if you only want to support only clients
      # that support Server Name Indication (SNI).

      class InvalidProtocolSettings < ServiceError
      end

      # The query string parameters specified are not valid.

      class InvalidQueryStringParameters < ServiceError
      end

      # The relative path is too big, is not URL-encoded, or does not begin with a slash (/).

      class InvalidRelativePath < ServiceError
      end

      # This operation requires the HTTPS protocol. Ensure that you specify the HTTPS protocol in your
      # request, or omit the RequiredProtocols element from your distribution configuration.

      class InvalidRequiredProtocol < ServiceError
      end

      # A response code is not valid.

      class InvalidResponseCode < ServiceError
      end

      # The TTL order specified is not valid.

      class InvalidTTLOrder < ServiceError
      end

      # The tagging specified is not valid.

      class InvalidTagging < ServiceError
      end

      # A viewer certificate specified is not valid.

      class InvalidViewerCertificate < ServiceError
      end

      # A web ACL ID specified is not valid. To specify a web ACL created using the latest version of WAF,
      # use the ACL ARN, for example
      # arn:aws:wafv2:us-east-1:123456789012:global/webacl/ExampleWebACL/473e64fd-f30b-4765-81a0-62ad96dd167a
      # . To specify a web ACL created using WAF Classic, use the ACL ID, for example
      # 473e64fd-f30b-4765-81a0-62ad96dd167a .

      class InvalidWebACLId < ServiceError
      end

      # A key group with this name already exists. You must provide a unique name. To modify an existing key
      # group, use UpdateKeyGroup .

      class KeyGroupAlreadyExists < ServiceError
      end

      # This operation requires a body. Ensure that the body is present and the Content-Type header is set.

      class MissingBody < ServiceError
      end

      # A monitoring subscription already exists for the specified distribution.

      class MonitoringSubscriptionAlreadyExists < ServiceError
      end

      # The cache policy does not exist.

      class NoSuchCachePolicy < ServiceError
      end

      # The specified origin access identity does not exist.

      class NoSuchCloudFrontOriginAccessIdentity < ServiceError
      end

      # The continuous deployment policy doesn't exist.

      class NoSuchContinuousDeploymentPolicy < ServiceError
      end

      # The specified distribution does not exist.

      class NoSuchDistribution < ServiceError
      end

      # The specified configuration for field-level encryption doesn't exist.

      class NoSuchFieldLevelEncryptionConfig < ServiceError
      end

      # The specified profile for field-level encryption doesn't exist.

      class NoSuchFieldLevelEncryptionProfile < ServiceError
      end

      # The function does not exist.

      class NoSuchFunctionExists < ServiceError
      end

      # The specified invalidation does not exist.

      class NoSuchInvalidation < ServiceError
      end

      # A monitoring subscription does not exist for the specified distribution.

      class NoSuchMonitoringSubscription < ServiceError
      end

      # No origin exists with the specified Origin Id .

      class NoSuchOrigin < ServiceError
      end

      # The origin access control does not exist.

      class NoSuchOriginAccessControl < ServiceError
      end

      # The origin request policy does not exist.

      class NoSuchOriginRequestPolicy < ServiceError
      end

      # The specified public key doesn't exist.

      class NoSuchPublicKey < ServiceError
      end

      # The real-time log configuration does not exist.

      class NoSuchRealtimeLogConfig < ServiceError
      end

      # A resource that was specified is not valid.

      class NoSuchResource < ServiceError
      end

      # The response headers policy does not exist.

      class NoSuchResponseHeadersPolicy < ServiceError
      end

      # The specified streaming distribution does not exist.

      class NoSuchStreamingDistribution < ServiceError
      end

      # An origin access control with the specified parameters already exists.

      class OriginAccessControlAlreadyExists < ServiceError
      end

      # Cannot delete the origin access control because it's in use by one or more distributions.

      class OriginAccessControlInUse < ServiceError
      end

      # An origin request policy with this name already exists. You must provide a unique name. To modify an
      # existing origin request policy, use UpdateOriginRequestPolicy .

      class OriginRequestPolicyAlreadyExists < ServiceError
      end

      # Cannot delete the origin request policy because it is attached to one or more cache behaviors.

      class OriginRequestPolicyInUse < ServiceError
      end

      # The precondition in one or more of the request fields evaluated to false .

      class PreconditionFailed < ServiceError
      end

      # The specified public key already exists.

      class PublicKeyAlreadyExists < ServiceError
      end

      # The specified public key is in use.

      class PublicKeyInUse < ServiceError
      end

      # No profile specified for the field-level encryption query argument.

      class QueryArgProfileEmpty < ServiceError
      end

      # A real-time log configuration with this name already exists. You must provide a unique name. To
      # modify an existing real-time log configuration, use UpdateRealtimeLogConfig .

      class RealtimeLogConfigAlreadyExists < ServiceError
      end

      # Cannot delete the real-time log configuration because it is attached to one or more cache behaviors.

      class RealtimeLogConfigInUse < ServiceError
      end

      # The specified real-time log configuration belongs to a different Amazon Web Services account.

      class RealtimeLogConfigOwnerMismatch < ServiceError
      end

      # Cannot delete this resource because it is in use.

      class ResourceInUse < ServiceError
      end

      # The specified CloudFront resource hasn't been disabled yet.

      class ResourceNotDisabled < ServiceError
      end

      # A response headers policy with this name already exists. You must provide a unique name. To modify
      # an existing response headers policy, use UpdateResponseHeadersPolicy .

      class ResponseHeadersPolicyAlreadyExists < ServiceError
      end

      # Cannot delete the response headers policy because it is attached to one or more cache behaviors in a
      # CloudFront distribution.

      class ResponseHeadersPolicyInUse < ServiceError
      end

      # A continuous deployment policy for this staging distribution already exists.

      class StagingDistributionInUse < ServiceError
      end

      # The caller reference you attempted to create the streaming distribution with is associated with
      # another distribution

      class StreamingDistributionAlreadyExists < ServiceError
      end

      # The specified CloudFront distribution is not disabled. You must disable the distribution before you
      # can delete it.

      class StreamingDistributionNotDisabled < ServiceError
      end

      # The CloudFront function failed.

      class TestFunctionFailed < ServiceError
      end

      # The length of the Content-Security-Policy header value in the response headers policy exceeds the
      # maximum. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      class TooLongCSPInResponseHeadersPolicy < ServiceError
      end

      # You cannot create more cache behaviors for the distribution.

      class TooManyCacheBehaviors < ServiceError
      end

      # You have reached the maximum number of cache policies for this Amazon Web Services account. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyCachePolicies < ServiceError
      end

      # You cannot create anymore custom SSL/TLS certificates.

      class TooManyCertificates < ServiceError
      end

      # Processing your request would cause you to exceed the maximum number of origin access identities
      # allowed.

      class TooManyCloudFrontOriginAccessIdentities < ServiceError
      end

      # You have reached the maximum number of continuous deployment policies for this Amazon Web Services
      # account.

      class TooManyContinuousDeploymentPolicies < ServiceError
      end

      # Your request contains more cookie names in the whitelist than are allowed per cache behavior.

      class TooManyCookieNamesInWhiteList < ServiceError
      end

      # The number of cookies in the cache policy exceeds the maximum. For more information, see Quotas
      # (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyCookiesInCachePolicy < ServiceError
      end

      # The number of cookies in the origin request policy exceeds the maximum. For more information, see
      # Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyCookiesInOriginRequestPolicy < ServiceError
      end

      # The number of custom headers in the response headers policy exceeds the maximum. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyCustomHeadersInResponseHeadersPolicy < ServiceError
      end

      # Your request contains more CNAMEs than are allowed per distribution.

      class TooManyDistributionCNAMEs < ServiceError
      end

      # Processing your request would cause you to exceed the maximum number of distributions allowed.

      class TooManyDistributions < ServiceError
      end

      # The maximum number of distributions have been associated with the specified cache policy. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyDistributionsAssociatedToCachePolicy < ServiceError
      end

      # The maximum number of distributions have been associated with the specified configuration for
      # field-level encryption.

      class TooManyDistributionsAssociatedToFieldLevelEncryptionConfig < ServiceError
      end

      # The number of distributions that reference this key group is more than the maximum allowed. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyDistributionsAssociatedToKeyGroup < ServiceError
      end

      # The maximum number of distributions have been associated with the specified origin access control.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      class TooManyDistributionsAssociatedToOriginAccessControl < ServiceError
      end

      # The maximum number of distributions have been associated with the specified origin request policy.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      class TooManyDistributionsAssociatedToOriginRequestPolicy < ServiceError
      end

      # The maximum number of distributions have been associated with the specified response headers policy.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      class TooManyDistributionsAssociatedToResponseHeadersPolicy < ServiceError
      end

      # You have reached the maximum number of distributions that are associated with a CloudFront function.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      class TooManyDistributionsWithFunctionAssociations < ServiceError
      end

      # Processing your request would cause the maximum number of distributions with Lambda@Edge function
      # associations per owner to be exceeded.

      class TooManyDistributionsWithLambdaAssociations < ServiceError
      end

      # The maximum number of distributions have been associated with the specified Lambda@Edge function.

      class TooManyDistributionsWithSingleFunctionARN < ServiceError
      end

      # The maximum number of configurations for field-level encryption have been created.

      class TooManyFieldLevelEncryptionConfigs < ServiceError
      end

      # The maximum number of content type profiles for field-level encryption have been created.

      class TooManyFieldLevelEncryptionContentTypeProfiles < ServiceError
      end

      # The maximum number of encryption entities for field-level encryption have been created.

      class TooManyFieldLevelEncryptionEncryptionEntities < ServiceError
      end

      # The maximum number of field patterns for field-level encryption have been created.

      class TooManyFieldLevelEncryptionFieldPatterns < ServiceError
      end

      # The maximum number of profiles for field-level encryption have been created.

      class TooManyFieldLevelEncryptionProfiles < ServiceError
      end

      # The maximum number of query arg profiles for field-level encryption have been created.

      class TooManyFieldLevelEncryptionQueryArgProfiles < ServiceError
      end

      # You have reached the maximum number of CloudFront function associations for this distribution. For
      # more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyFunctionAssociations < ServiceError
      end

      # You have reached the maximum number of CloudFront functions for this Amazon Web Services account.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      class TooManyFunctions < ServiceError
      end

      # The number of headers in the cache policy exceeds the maximum. For more information, see Quotas
      # (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyHeadersInCachePolicy < ServiceError
      end

      # Your request contains too many headers in forwarded values.

      class TooManyHeadersInForwardedValues < ServiceError
      end

      # The number of headers in the origin request policy exceeds the maximum. For more information, see
      # Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyHeadersInOriginRequestPolicy < ServiceError
      end

      # You have exceeded the maximum number of allowable InProgress invalidation batch requests, or
      # invalidation objects.

      class TooManyInvalidationsInProgress < ServiceError
      end

      # You have reached the maximum number of key groups for this Amazon Web Services account. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyKeyGroups < ServiceError
      end

      # The number of key groups referenced by this distribution is more than the maximum allowed. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyKeyGroupsAssociatedToDistribution < ServiceError
      end

      # Your request contains more Lambda@Edge function associations than are allowed per distribution.

      class TooManyLambdaFunctionAssociations < ServiceError
      end

      # The number of origin access controls in your Amazon Web Services account exceeds the maximum
      # allowed. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      class TooManyOriginAccessControls < ServiceError
      end

      # Your request contains too many origin custom headers.

      class TooManyOriginCustomHeaders < ServiceError
      end

      # Processing your request would cause you to exceed the maximum number of origin groups allowed.

      class TooManyOriginGroupsPerDistribution < ServiceError
      end

      # You have reached the maximum number of origin request policies for this Amazon Web Services account.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      class TooManyOriginRequestPolicies < ServiceError
      end

      # You cannot create more origins for the distribution.

      class TooManyOrigins < ServiceError
      end

      # The maximum number of public keys for field-level encryption have been created. To create a new
      # public key, delete one of the existing keys.

      class TooManyPublicKeys < ServiceError
      end

      # The number of public keys in this key group is more than the maximum allowed. For more information,
      # see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyPublicKeysInKeyGroup < ServiceError
      end

      # Your request contains too many query string parameters.

      class TooManyQueryStringParameters < ServiceError
      end

      # The number of query strings in the cache policy exceeds the maximum. For more information, see
      # Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyQueryStringsInCachePolicy < ServiceError
      end

      # The number of query strings in the origin request policy exceeds the maximum. For more information,
      # see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyQueryStringsInOriginRequestPolicy < ServiceError
      end

      # You have reached the maximum number of real-time log configurations for this Amazon Web Services
      # account. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      class TooManyRealtimeLogConfigs < ServiceError
      end

      # The number of headers in RemoveHeadersConfig in the response headers policy exceeds the maximum. For
      # more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      class TooManyRemoveHeadersInResponseHeadersPolicy < ServiceError
      end

      # You have reached the maximum number of response headers policies for this Amazon Web Services
      # account. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      class TooManyResponseHeadersPolicies < ServiceError
      end

      # Your request contains more CNAMEs than are allowed per distribution.

      class TooManyStreamingDistributionCNAMEs < ServiceError
      end

      # Processing your request would cause you to exceed the maximum number of streaming distributions
      # allowed.

      class TooManyStreamingDistributions < ServiceError
      end

      # Your request contains more trusted signers than are allowed per distribution.

      class TooManyTrustedSigners < ServiceError
      end

      # The specified key group does not exist.

      class TrustedKeyGroupDoesNotExist < ServiceError
      end

      # One or more of your trusted signers don't exist.

      class TrustedSignerDoesNotExist < ServiceError
      end

      # This operation is not supported in this Amazon Web Services Region.

      class UnsupportedOperation < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDenied"
          AccessDenied.new(message)
        when "BatchTooLarge"
          BatchTooLarge.new(message)
        when "CNAMEAlreadyExists"
          CNAMEAlreadyExists.new(message)
        when "CachePolicyAlreadyExists"
          CachePolicyAlreadyExists.new(message)
        when "CachePolicyInUse"
          CachePolicyInUse.new(message)
        when "CannotChangeImmutablePublicKeyFields"
          CannotChangeImmutablePublicKeyFields.new(message)
        when "CannotDeleteEntityWhileInUse"
          CannotDeleteEntityWhileInUse.new(message)
        when "CannotUpdateEntityWhileInUse"
          CannotUpdateEntityWhileInUse.new(message)
        when "CloudFrontOriginAccessIdentityAlreadyExists"
          CloudFrontOriginAccessIdentityAlreadyExists.new(message)
        when "CloudFrontOriginAccessIdentityInUse"
          CloudFrontOriginAccessIdentityInUse.new(message)
        when "ContinuousDeploymentPolicyAlreadyExists"
          ContinuousDeploymentPolicyAlreadyExists.new(message)
        when "ContinuousDeploymentPolicyInUse"
          ContinuousDeploymentPolicyInUse.new(message)
        when "DistributionAlreadyExists"
          DistributionAlreadyExists.new(message)
        when "DistributionNotDisabled"
          DistributionNotDisabled.new(message)
        when "EntityAlreadyExists"
          EntityAlreadyExists.new(message)
        when "EntityLimitExceeded"
          EntityLimitExceeded.new(message)
        when "EntityNotFound"
          EntityNotFound.new(message)
        when "EntitySizeLimitExceeded"
          EntitySizeLimitExceeded.new(message)
        when "FieldLevelEncryptionConfigAlreadyExists"
          FieldLevelEncryptionConfigAlreadyExists.new(message)
        when "FieldLevelEncryptionConfigInUse"
          FieldLevelEncryptionConfigInUse.new(message)
        when "FieldLevelEncryptionProfileAlreadyExists"
          FieldLevelEncryptionProfileAlreadyExists.new(message)
        when "FieldLevelEncryptionProfileInUse"
          FieldLevelEncryptionProfileInUse.new(message)
        when "FieldLevelEncryptionProfileSizeExceeded"
          FieldLevelEncryptionProfileSizeExceeded.new(message)
        when "FunctionAlreadyExists"
          FunctionAlreadyExists.new(message)
        when "FunctionInUse"
          FunctionInUse.new(message)
        when "FunctionSizeLimitExceeded"
          FunctionSizeLimitExceeded.new(message)
        when "IllegalDelete"
          IllegalDelete.new(message)
        when "IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior"
          IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior.new(message)
        when "IllegalOriginAccessConfiguration"
          IllegalOriginAccessConfiguration.new(message)
        when "IllegalUpdate"
          IllegalUpdate.new(message)
        when "InconsistentQuantities"
          InconsistentQuantities.new(message)
        when "InvalidArgument"
          InvalidArgument.new(message)
        when "InvalidAssociation"
          InvalidAssociation.new(message)
        when "InvalidDefaultRootObject"
          InvalidDefaultRootObject.new(message)
        when "InvalidDomainNameForOriginAccessControl"
          InvalidDomainNameForOriginAccessControl.new(message)
        when "InvalidErrorCode"
          InvalidErrorCode.new(message)
        when "InvalidForwardCookies"
          InvalidForwardCookies.new(message)
        when "InvalidFunctionAssociation"
          InvalidFunctionAssociation.new(message)
        when "InvalidGeoRestrictionParameter"
          InvalidGeoRestrictionParameter.new(message)
        when "InvalidHeadersForS3Origin"
          InvalidHeadersForS3Origin.new(message)
        when "InvalidIfMatchVersion"
          InvalidIfMatchVersion.new(message)
        when "InvalidLambdaFunctionAssociation"
          InvalidLambdaFunctionAssociation.new(message)
        when "InvalidLocationCode"
          InvalidLocationCode.new(message)
        when "InvalidMinimumProtocolVersion"
          InvalidMinimumProtocolVersion.new(message)
        when "InvalidOrigin"
          InvalidOrigin.new(message)
        when "InvalidOriginAccessControl"
          InvalidOriginAccessControl.new(message)
        when "InvalidOriginAccessIdentity"
          InvalidOriginAccessIdentity.new(message)
        when "InvalidOriginKeepaliveTimeout"
          InvalidOriginKeepaliveTimeout.new(message)
        when "InvalidOriginReadTimeout"
          InvalidOriginReadTimeout.new(message)
        when "InvalidProtocolSettings"
          InvalidProtocolSettings.new(message)
        when "InvalidQueryStringParameters"
          InvalidQueryStringParameters.new(message)
        when "InvalidRelativePath"
          InvalidRelativePath.new(message)
        when "InvalidRequiredProtocol"
          InvalidRequiredProtocol.new(message)
        when "InvalidResponseCode"
          InvalidResponseCode.new(message)
        when "InvalidTTLOrder"
          InvalidTTLOrder.new(message)
        when "InvalidTagging"
          InvalidTagging.new(message)
        when "InvalidViewerCertificate"
          InvalidViewerCertificate.new(message)
        when "InvalidWebACLId"
          InvalidWebACLId.new(message)
        when "KeyGroupAlreadyExists"
          KeyGroupAlreadyExists.new(message)
        when "MissingBody"
          MissingBody.new(message)
        when "MonitoringSubscriptionAlreadyExists"
          MonitoringSubscriptionAlreadyExists.new(message)
        when "NoSuchCachePolicy"
          NoSuchCachePolicy.new(message)
        when "NoSuchCloudFrontOriginAccessIdentity"
          NoSuchCloudFrontOriginAccessIdentity.new(message)
        when "NoSuchContinuousDeploymentPolicy"
          NoSuchContinuousDeploymentPolicy.new(message)
        when "NoSuchDistribution"
          NoSuchDistribution.new(message)
        when "NoSuchFieldLevelEncryptionConfig"
          NoSuchFieldLevelEncryptionConfig.new(message)
        when "NoSuchFieldLevelEncryptionProfile"
          NoSuchFieldLevelEncryptionProfile.new(message)
        when "NoSuchFunctionExists"
          NoSuchFunctionExists.new(message)
        when "NoSuchInvalidation"
          NoSuchInvalidation.new(message)
        when "NoSuchMonitoringSubscription"
          NoSuchMonitoringSubscription.new(message)
        when "NoSuchOrigin"
          NoSuchOrigin.new(message)
        when "NoSuchOriginAccessControl"
          NoSuchOriginAccessControl.new(message)
        when "NoSuchOriginRequestPolicy"
          NoSuchOriginRequestPolicy.new(message)
        when "NoSuchPublicKey"
          NoSuchPublicKey.new(message)
        when "NoSuchRealtimeLogConfig"
          NoSuchRealtimeLogConfig.new(message)
        when "NoSuchResource"
          NoSuchResource.new(message)
        when "NoSuchResponseHeadersPolicy"
          NoSuchResponseHeadersPolicy.new(message)
        when "NoSuchStreamingDistribution"
          NoSuchStreamingDistribution.new(message)
        when "OriginAccessControlAlreadyExists"
          OriginAccessControlAlreadyExists.new(message)
        when "OriginAccessControlInUse"
          OriginAccessControlInUse.new(message)
        when "OriginRequestPolicyAlreadyExists"
          OriginRequestPolicyAlreadyExists.new(message)
        when "OriginRequestPolicyInUse"
          OriginRequestPolicyInUse.new(message)
        when "PreconditionFailed"
          PreconditionFailed.new(message)
        when "PublicKeyAlreadyExists"
          PublicKeyAlreadyExists.new(message)
        when "PublicKeyInUse"
          PublicKeyInUse.new(message)
        when "QueryArgProfileEmpty"
          QueryArgProfileEmpty.new(message)
        when "RealtimeLogConfigAlreadyExists"
          RealtimeLogConfigAlreadyExists.new(message)
        when "RealtimeLogConfigInUse"
          RealtimeLogConfigInUse.new(message)
        when "RealtimeLogConfigOwnerMismatch"
          RealtimeLogConfigOwnerMismatch.new(message)
        when "ResourceInUse"
          ResourceInUse.new(message)
        when "ResourceNotDisabled"
          ResourceNotDisabled.new(message)
        when "ResponseHeadersPolicyAlreadyExists"
          ResponseHeadersPolicyAlreadyExists.new(message)
        when "ResponseHeadersPolicyInUse"
          ResponseHeadersPolicyInUse.new(message)
        when "StagingDistributionInUse"
          StagingDistributionInUse.new(message)
        when "StreamingDistributionAlreadyExists"
          StreamingDistributionAlreadyExists.new(message)
        when "StreamingDistributionNotDisabled"
          StreamingDistributionNotDisabled.new(message)
        when "TestFunctionFailed"
          TestFunctionFailed.new(message)
        when "TooLongCSPInResponseHeadersPolicy"
          TooLongCSPInResponseHeadersPolicy.new(message)
        when "TooManyCacheBehaviors"
          TooManyCacheBehaviors.new(message)
        when "TooManyCachePolicies"
          TooManyCachePolicies.new(message)
        when "TooManyCertificates"
          TooManyCertificates.new(message)
        when "TooManyCloudFrontOriginAccessIdentities"
          TooManyCloudFrontOriginAccessIdentities.new(message)
        when "TooManyContinuousDeploymentPolicies"
          TooManyContinuousDeploymentPolicies.new(message)
        when "TooManyCookieNamesInWhiteList"
          TooManyCookieNamesInWhiteList.new(message)
        when "TooManyCookiesInCachePolicy"
          TooManyCookiesInCachePolicy.new(message)
        when "TooManyCookiesInOriginRequestPolicy"
          TooManyCookiesInOriginRequestPolicy.new(message)
        when "TooManyCustomHeadersInResponseHeadersPolicy"
          TooManyCustomHeadersInResponseHeadersPolicy.new(message)
        when "TooManyDistributionCNAMEs"
          TooManyDistributionCNAMEs.new(message)
        when "TooManyDistributions"
          TooManyDistributions.new(message)
        when "TooManyDistributionsAssociatedToCachePolicy"
          TooManyDistributionsAssociatedToCachePolicy.new(message)
        when "TooManyDistributionsAssociatedToFieldLevelEncryptionConfig"
          TooManyDistributionsAssociatedToFieldLevelEncryptionConfig.new(message)
        when "TooManyDistributionsAssociatedToKeyGroup"
          TooManyDistributionsAssociatedToKeyGroup.new(message)
        when "TooManyDistributionsAssociatedToOriginAccessControl"
          TooManyDistributionsAssociatedToOriginAccessControl.new(message)
        when "TooManyDistributionsAssociatedToOriginRequestPolicy"
          TooManyDistributionsAssociatedToOriginRequestPolicy.new(message)
        when "TooManyDistributionsAssociatedToResponseHeadersPolicy"
          TooManyDistributionsAssociatedToResponseHeadersPolicy.new(message)
        when "TooManyDistributionsWithFunctionAssociations"
          TooManyDistributionsWithFunctionAssociations.new(message)
        when "TooManyDistributionsWithLambdaAssociations"
          TooManyDistributionsWithLambdaAssociations.new(message)
        when "TooManyDistributionsWithSingleFunctionARN"
          TooManyDistributionsWithSingleFunctionARN.new(message)
        when "TooManyFieldLevelEncryptionConfigs"
          TooManyFieldLevelEncryptionConfigs.new(message)
        when "TooManyFieldLevelEncryptionContentTypeProfiles"
          TooManyFieldLevelEncryptionContentTypeProfiles.new(message)
        when "TooManyFieldLevelEncryptionEncryptionEntities"
          TooManyFieldLevelEncryptionEncryptionEntities.new(message)
        when "TooManyFieldLevelEncryptionFieldPatterns"
          TooManyFieldLevelEncryptionFieldPatterns.new(message)
        when "TooManyFieldLevelEncryptionProfiles"
          TooManyFieldLevelEncryptionProfiles.new(message)
        when "TooManyFieldLevelEncryptionQueryArgProfiles"
          TooManyFieldLevelEncryptionQueryArgProfiles.new(message)
        when "TooManyFunctionAssociations"
          TooManyFunctionAssociations.new(message)
        when "TooManyFunctions"
          TooManyFunctions.new(message)
        when "TooManyHeadersInCachePolicy"
          TooManyHeadersInCachePolicy.new(message)
        when "TooManyHeadersInForwardedValues"
          TooManyHeadersInForwardedValues.new(message)
        when "TooManyHeadersInOriginRequestPolicy"
          TooManyHeadersInOriginRequestPolicy.new(message)
        when "TooManyInvalidationsInProgress"
          TooManyInvalidationsInProgress.new(message)
        when "TooManyKeyGroups"
          TooManyKeyGroups.new(message)
        when "TooManyKeyGroupsAssociatedToDistribution"
          TooManyKeyGroupsAssociatedToDistribution.new(message)
        when "TooManyLambdaFunctionAssociations"
          TooManyLambdaFunctionAssociations.new(message)
        when "TooManyOriginAccessControls"
          TooManyOriginAccessControls.new(message)
        when "TooManyOriginCustomHeaders"
          TooManyOriginCustomHeaders.new(message)
        when "TooManyOriginGroupsPerDistribution"
          TooManyOriginGroupsPerDistribution.new(message)
        when "TooManyOriginRequestPolicies"
          TooManyOriginRequestPolicies.new(message)
        when "TooManyOrigins"
          TooManyOrigins.new(message)
        when "TooManyPublicKeys"
          TooManyPublicKeys.new(message)
        when "TooManyPublicKeysInKeyGroup"
          TooManyPublicKeysInKeyGroup.new(message)
        when "TooManyQueryStringParameters"
          TooManyQueryStringParameters.new(message)
        when "TooManyQueryStringsInCachePolicy"
          TooManyQueryStringsInCachePolicy.new(message)
        when "TooManyQueryStringsInOriginRequestPolicy"
          TooManyQueryStringsInOriginRequestPolicy.new(message)
        when "TooManyRealtimeLogConfigs"
          TooManyRealtimeLogConfigs.new(message)
        when "TooManyRemoveHeadersInResponseHeadersPolicy"
          TooManyRemoveHeadersInResponseHeadersPolicy.new(message)
        when "TooManyResponseHeadersPolicies"
          TooManyResponseHeadersPolicies.new(message)
        when "TooManyStreamingDistributionCNAMEs"
          TooManyStreamingDistributionCNAMEs.new(message)
        when "TooManyStreamingDistributions"
          TooManyStreamingDistributions.new(message)
        when "TooManyTrustedSigners"
          TooManyTrustedSigners.new(message)
        when "TrustedKeyGroupDoesNotExist"
          TrustedKeyGroupDoesNotExist.new(message)
        when "TrustedSignerDoesNotExist"
          TrustedSignerDoesNotExist.new(message)
        when "UnsupportedOperation"
          UnsupportedOperation.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
