module AwsSdk
  module Route53
    module Errors
      class ServiceError < Exception
      end

      # This CIDR block is already in use.
      class CidrBlockInUseException < ServiceError
      end

      # A CIDR collection with this name and a different caller reference already exists in this account.
      class CidrCollectionAlreadyExistsException < ServiceError
      end

      # This CIDR collection is in use, and isn't empty.
      class CidrCollectionInUseException < ServiceError
      end

      # The CIDR collection version you provided, doesn't match the one in the ListCidrCollections
      # operation.
      class CidrCollectionVersionMismatchException < ServiceError
      end

      # Another user submitted a request to create, update, or delete the object at the same time that you
      # did. Retry the request.
      class ConcurrentModification < ServiceError
      end

      # The cause of this error depends on the operation that you're performing: Create a public hosted
      # zone: Two hosted zones that have the same name or that have a parent/child relationship (example.com
      # and test.example.com) can't have any common name servers. You tried to create a hosted zone that has
      # the same name as an existing hosted zone or that's the parent or child of an existing hosted zone,
      # and you specified a delegation set that shares one or more name servers with the existing hosted
      # zone. For more information, see CreateReusableDelegationSet . Create a private hosted zone: A hosted
      # zone with the specified name already exists and is already associated with the Amazon VPC that you
      # specified. Associate VPCs with a private hosted zone: The VPC that you specified is already
      # associated with another hosted zone that has the same name.
      class ConflictingDomainExists < ServiceError
      end

      # You tried to update a traffic policy instance by using a traffic policy version that has a different
      # DNS type than the current type for the instance. You specified the type in the JSON document in the
      # CreateTrafficPolicy or CreateTrafficPolicyVersion request.
      class ConflictingTypes < ServiceError
      end

      # The hosted zone doesn't have any DNSSEC resources.
      class DNSSECNotFound < ServiceError
      end

      # A delegation set with the same owner and caller reference combination has already been created.
      class DelegationSetAlreadyCreated < ServiceError
      end

      # The specified delegation set has already been marked as reusable.
      class DelegationSetAlreadyReusable < ServiceError
      end

      # The specified delegation contains associated hosted zones which must be deleted before the reusable
      # delegation set can be deleted.
      class DelegationSetInUse < ServiceError
      end

      # You can create a hosted zone that has the same name as an existing hosted zone (example.com is
      # common), but there is a limit to the number of hosted zones that have the same name. If you get this
      # error, Amazon Route 53 has reached that limit. If you own the domain name and Route 53 generates
      # this error, contact Customer Support.
      class DelegationSetNotAvailable < ServiceError
      end

      # A reusable delegation set with the specified ID does not exist.
      class DelegationSetNotReusable < ServiceError
      end

      # The health check you're attempting to create already exists. Amazon Route 53 returns this error when
      # you submit a request that has the following values: The same value for CallerReference as an
      # existing health check, and one or more values that differ from the existing health check that has
      # the same caller reference. The same value for CallerReference as a health check that you created and
      # later deleted, regardless of the other settings in the request.
      class HealthCheckAlreadyExists < ServiceError
      end

      # This error code is not in use.
      class HealthCheckInUse < ServiceError
      end

      # The value of HealthCheckVersion in the request doesn't match the value of HealthCheckVersion in the
      # health check.
      class HealthCheckVersionMismatch < ServiceError
      end

      # The hosted zone you're trying to create already exists. Amazon Route 53 returns this error when a
      # hosted zone has already been created with the specified CallerReference .
      class HostedZoneAlreadyExists < ServiceError
      end

      # The hosted zone contains resource records that are not SOA or NS records.
      class HostedZoneNotEmpty < ServiceError
      end

      # The specified HostedZone can't be found.
      class HostedZoneNotFound < ServiceError
      end

      # The specified hosted zone is a public hosted zone, not a private hosted zone.
      class HostedZoneNotPrivate < ServiceError
      end

      # The hosted zone nameservers don't match the parent nameservers. The hosted zone and parent must have
      # the same nameservers.
      class HostedZonePartiallyDelegated < ServiceError
      end

      # The resource you're trying to access is unsupported on this Amazon Route 53 endpoint.
      class IncompatibleVersion < ServiceError
      end

      # Amazon Route 53 doesn't have the permissions required to create log streams and send query logs to
      # log streams. Possible causes include the following: There is no resource policy that specifies the
      # log group ARN in the value for Resource . The resource policy that includes the log group ARN in the
      # value for Resource doesn't have the necessary permissions. The resource policy hasn't finished
      # propagating yet. The Key management service (KMS) key you specified doesn’t exist or it can’t be
      # used with the log group associated with query log. Update or provide a resource policy to grant
      # permissions for the KMS key. The Key management service (KMS) key you specified is marked as
      # disabled for the log group associated with query log. Update or provide a resource policy to grant
      # permissions for the KMS key.
      class InsufficientCloudWatchLogsResourcePolicy < ServiceError
      end

      # Parameter name is not valid.
      class InvalidArgument < ServiceError
      end

      # This exception contains a list of messages that might contain one or more error messages. Each error
      # message indicates one error in the change batch.
      class InvalidChangeBatch < ServiceError
      end

      # The specified domain name is not valid.
      class InvalidDomainName < ServiceError
      end

      # The input is not valid.
      class InvalidInput < ServiceError
      end

      # The KeyManagementServiceArn that you specified isn't valid to use with DNSSEC signing.
      class InvalidKMSArn < ServiceError
      end

      # The key-signing key (KSK) name that you specified isn't a valid name.
      class InvalidKeySigningKeyName < ServiceError
      end

      # The key-signing key (KSK) status isn't valid or another KSK has the status INTERNAL_FAILURE .
      class InvalidKeySigningKeyStatus < ServiceError
      end

      # The value that you specified to get the second or subsequent page of results is invalid.
      class InvalidPaginationToken < ServiceError
      end

      # Your hosted zone status isn't valid for this operation. In the hosted zone, change the status to
      # enable DNSSEC or disable DNSSEC .
      class InvalidSigningStatus < ServiceError
      end

      # The format of the traffic policy document that you specified in the Document element is not valid.
      class InvalidTrafficPolicyDocument < ServiceError
      end

      # The VPC ID that you specified either isn't a valid ID or the current account is not authorized to
      # access this VPC.
      class InvalidVPCId < ServiceError
      end

      # You've already created a key-signing key (KSK) with this name or with the same customer managed key
      # ARN.
      class KeySigningKeyAlreadyExists < ServiceError
      end

      # The key-signing key (KSK) is specified in a parent DS record.
      class KeySigningKeyInParentDSRecord < ServiceError
      end

      # The key-signing key (KSK) that you specified can't be deactivated because it's the only KSK for a
      # currently-enabled DNSSEC. Disable DNSSEC signing, or add or enable another KSK.
      class KeySigningKeyInUse < ServiceError
      end

      # A key-signing key (KSK) with ACTIVE status wasn't found.
      class KeySigningKeyWithActiveStatusNotFound < ServiceError
      end

      # The VPC that you're trying to disassociate from the private hosted zone is the last VPC that is
      # associated with the hosted zone. Amazon Route 53 doesn't support disassociating the last VPC from a
      # hosted zone.
      class LastVPCAssociation < ServiceError
      end

      # This operation can't be completed because the current account has reached the limit on the resource
      # you are trying to create. To request a higher limit, create a case with the Amazon Web Services
      # Support Center.
      class LimitsExceeded < ServiceError
      end

      # A change with the specified change ID does not exist.
      class NoSuchChange < ServiceError
      end

      # The CIDR collection you specified, doesn't exist.
      class NoSuchCidrCollectionException < ServiceError
      end

      # The CIDR collection location doesn't match any locations in your account.
      class NoSuchCidrLocationException < ServiceError
      end

      # There is no CloudWatch Logs log group with the specified ARN.
      class NoSuchCloudWatchLogsLogGroup < ServiceError
      end

      # A reusable delegation set with the specified ID does not exist.
      class NoSuchDelegationSet < ServiceError
      end

      # Amazon Route 53 doesn't support the specified geographic location. For a list of supported
      # geolocation codes, see the GeoLocation data type.
      class NoSuchGeoLocation < ServiceError
      end

      # No health check exists with the specified ID.
      class NoSuchHealthCheck < ServiceError
      end

      # No hosted zone exists with the ID that you specified.
      class NoSuchHostedZone < ServiceError
      end

      # The specified key-signing key (KSK) doesn't exist.
      class NoSuchKeySigningKey < ServiceError
      end

      # There is no DNS query logging configuration with the specified ID.
      class NoSuchQueryLoggingConfig < ServiceError
      end

      # No traffic policy exists with the specified ID.
      class NoSuchTrafficPolicy < ServiceError
      end

      # No traffic policy instance exists with the specified ID.
      class NoSuchTrafficPolicyInstance < ServiceError
      end

      # Associating the specified VPC with the specified hosted zone has not been authorized.
      class NotAuthorizedException < ServiceError
      end

      # If Amazon Route 53 can't process a request before the next request arrives, it will reject
      # subsequent requests for the same hosted zone and return an HTTP 400 error ( Bad request ). If Route
      # 53 returns this error repeatedly for the same request, we recommend that you wait, in intervals of
      # increasing duration, before you try the request again.
      class PriorRequestNotComplete < ServiceError
      end

      # You're trying to associate a VPC with a public hosted zone. Amazon Route 53 doesn't support
      # associating a VPC with a public hosted zone.
      class PublicZoneVPCAssociation < ServiceError
      end

      # You can create only one query logging configuration for a hosted zone, and a query logging
      # configuration already exists for this hosted zone.
      class QueryLoggingConfigAlreadyExists < ServiceError
      end

      # The limit on the number of requests per second was exceeded.
      class ThrottlingException < ServiceError
      end

      # This health check can't be created because the current account has reached the limit on the number
      # of active health checks. For information about default limits, see Limits in the Amazon Route 53
      # Developer Guide . For information about how to get the current limit for an account, see
      # GetAccountLimit . To request a higher limit, create a case with the Amazon Web Services Support
      # Center. You have reached the maximum number of active health checks for an Amazon Web Services
      # account. To request a higher limit, create a case with the Amazon Web Services Support Center.
      class TooManyHealthChecks < ServiceError
      end

      # This operation can't be completed either because the current account has reached the limit on the
      # number of hosted zones or because you've reached the limit on the number of hosted zones that can be
      # associated with a reusable delegation set. For information about default limits, see Limits in the
      # Amazon Route 53 Developer Guide . To get the current limit on hosted zones that can be created by an
      # account, see GetAccountLimit . To get the current limit on hosted zones that can be associated with
      # a reusable delegation set, see GetReusableDelegationSetLimit . To request a higher limit, create a
      # case with the Amazon Web Services Support Center.
      class TooManyHostedZones < ServiceError
      end

      # You've reached the limit for the number of key-signing keys (KSKs). Remove at least one KSK, and
      # then try again.
      class TooManyKeySigningKeys < ServiceError
      end

      # This traffic policy can't be created because the current account has reached the limit on the number
      # of traffic policies. For information about default limits, see Limits in the Amazon Route 53
      # Developer Guide . To get the current limit for an account, see GetAccountLimit . To request a higher
      # limit, create a case with the Amazon Web Services Support Center.
      class TooManyTrafficPolicies < ServiceError
      end

      # This traffic policy instance can't be created because the current account has reached the limit on
      # the number of traffic policy instances. For information about default limits, see Limits in the
      # Amazon Route 53 Developer Guide . For information about how to get the current limit for an account,
      # see GetAccountLimit . To request a higher limit, create a case with the Amazon Web Services Support
      # Center.
      class TooManyTrafficPolicyInstances < ServiceError
      end

      # This traffic policy version can't be created because you've reached the limit of 1000 on the number
      # of versions that you can create for the current traffic policy. To create more traffic policy
      # versions, you can use GetTrafficPolicy to get the traffic policy document for a specified traffic
      # policy version, and then use CreateTrafficPolicy to create a new traffic policy using the traffic
      # policy document.
      class TooManyTrafficPolicyVersionsForCurrentPolicy < ServiceError
      end

      # You've created the maximum number of authorizations that can be created for the specified hosted
      # zone. To authorize another VPC to be associated with the hosted zone, submit a
      # DeleteVPCAssociationAuthorization request to remove an existing authorization. To get a list of
      # existing authorizations, submit a ListVPCAssociationAuthorizations request.
      class TooManyVPCAssociationAuthorizations < ServiceError
      end

      # A traffic policy that has the same value for Name already exists.
      class TrafficPolicyAlreadyExists < ServiceError
      end

      # One or more traffic policy instances were created by using the specified traffic policy.
      class TrafficPolicyInUse < ServiceError
      end

      # There is already a traffic policy instance with the specified ID.
      class TrafficPolicyInstanceAlreadyExists < ServiceError
      end

      # The VPC that you specified is not authorized to be associated with the hosted zone.
      class VPCAssociationAuthorizationNotFound < ServiceError
      end

      # The specified VPC and hosted zone are not currently associated.
      class VPCAssociationNotFound < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CidrBlockInUseException"
          CidrBlockInUseException.new(message)
        when "CidrCollectionAlreadyExistsException"
          CidrCollectionAlreadyExistsException.new(message)
        when "CidrCollectionInUseException"
          CidrCollectionInUseException.new(message)
        when "CidrCollectionVersionMismatchException"
          CidrCollectionVersionMismatchException.new(message)
        when "ConcurrentModification"
          ConcurrentModification.new(message)
        when "ConflictingDomainExists"
          ConflictingDomainExists.new(message)
        when "ConflictingTypes"
          ConflictingTypes.new(message)
        when "DNSSECNotFound"
          DNSSECNotFound.new(message)
        when "DelegationSetAlreadyCreated"
          DelegationSetAlreadyCreated.new(message)
        when "DelegationSetAlreadyReusable"
          DelegationSetAlreadyReusable.new(message)
        when "DelegationSetInUse"
          DelegationSetInUse.new(message)
        when "DelegationSetNotAvailable"
          DelegationSetNotAvailable.new(message)
        when "DelegationSetNotReusable"
          DelegationSetNotReusable.new(message)
        when "HealthCheckAlreadyExists"
          HealthCheckAlreadyExists.new(message)
        when "HealthCheckInUse"
          HealthCheckInUse.new(message)
        when "HealthCheckVersionMismatch"
          HealthCheckVersionMismatch.new(message)
        when "HostedZoneAlreadyExists"
          HostedZoneAlreadyExists.new(message)
        when "HostedZoneNotEmpty"
          HostedZoneNotEmpty.new(message)
        when "HostedZoneNotFound"
          HostedZoneNotFound.new(message)
        when "HostedZoneNotPrivate"
          HostedZoneNotPrivate.new(message)
        when "HostedZonePartiallyDelegated"
          HostedZonePartiallyDelegated.new(message)
        when "IncompatibleVersion"
          IncompatibleVersion.new(message)
        when "InsufficientCloudWatchLogsResourcePolicy"
          InsufficientCloudWatchLogsResourcePolicy.new(message)
        when "InvalidArgument"
          InvalidArgument.new(message)
        when "InvalidChangeBatch"
          InvalidChangeBatch.new(message)
        when "InvalidDomainName"
          InvalidDomainName.new(message)
        when "InvalidInput"
          InvalidInput.new(message)
        when "InvalidKMSArn"
          InvalidKMSArn.new(message)
        when "InvalidKeySigningKeyName"
          InvalidKeySigningKeyName.new(message)
        when "InvalidKeySigningKeyStatus"
          InvalidKeySigningKeyStatus.new(message)
        when "InvalidPaginationToken"
          InvalidPaginationToken.new(message)
        when "InvalidSigningStatus"
          InvalidSigningStatus.new(message)
        when "InvalidTrafficPolicyDocument"
          InvalidTrafficPolicyDocument.new(message)
        when "InvalidVPCId"
          InvalidVPCId.new(message)
        when "KeySigningKeyAlreadyExists"
          KeySigningKeyAlreadyExists.new(message)
        when "KeySigningKeyInParentDSRecord"
          KeySigningKeyInParentDSRecord.new(message)
        when "KeySigningKeyInUse"
          KeySigningKeyInUse.new(message)
        when "KeySigningKeyWithActiveStatusNotFound"
          KeySigningKeyWithActiveStatusNotFound.new(message)
        when "LastVPCAssociation"
          LastVPCAssociation.new(message)
        when "LimitsExceeded"
          LimitsExceeded.new(message)
        when "NoSuchChange"
          NoSuchChange.new(message)
        when "NoSuchCidrCollectionException"
          NoSuchCidrCollectionException.new(message)
        when "NoSuchCidrLocationException"
          NoSuchCidrLocationException.new(message)
        when "NoSuchCloudWatchLogsLogGroup"
          NoSuchCloudWatchLogsLogGroup.new(message)
        when "NoSuchDelegationSet"
          NoSuchDelegationSet.new(message)
        when "NoSuchGeoLocation"
          NoSuchGeoLocation.new(message)
        when "NoSuchHealthCheck"
          NoSuchHealthCheck.new(message)
        when "NoSuchHostedZone"
          NoSuchHostedZone.new(message)
        when "NoSuchKeySigningKey"
          NoSuchKeySigningKey.new(message)
        when "NoSuchQueryLoggingConfig"
          NoSuchQueryLoggingConfig.new(message)
        when "NoSuchTrafficPolicy"
          NoSuchTrafficPolicy.new(message)
        when "NoSuchTrafficPolicyInstance"
          NoSuchTrafficPolicyInstance.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "PriorRequestNotComplete"
          PriorRequestNotComplete.new(message)
        when "PublicZoneVPCAssociation"
          PublicZoneVPCAssociation.new(message)
        when "QueryLoggingConfigAlreadyExists"
          QueryLoggingConfigAlreadyExists.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyHealthChecks"
          TooManyHealthChecks.new(message)
        when "TooManyHostedZones"
          TooManyHostedZones.new(message)
        when "TooManyKeySigningKeys"
          TooManyKeySigningKeys.new(message)
        when "TooManyTrafficPolicies"
          TooManyTrafficPolicies.new(message)
        when "TooManyTrafficPolicyInstances"
          TooManyTrafficPolicyInstances.new(message)
        when "TooManyTrafficPolicyVersionsForCurrentPolicy"
          TooManyTrafficPolicyVersionsForCurrentPolicy.new(message)
        when "TooManyVPCAssociationAuthorizations"
          TooManyVPCAssociationAuthorizations.new(message)
        when "TrafficPolicyAlreadyExists"
          TrafficPolicyAlreadyExists.new(message)
        when "TrafficPolicyInUse"
          TrafficPolicyInUse.new(message)
        when "TrafficPolicyInstanceAlreadyExists"
          TrafficPolicyInstanceAlreadyExists.new(message)
        when "VPCAssociationAuthorizationNotFound"
          VPCAssociationAuthorizationNotFound.new(message)
        when "VPCAssociationNotFound"
          VPCAssociationNotFound.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
