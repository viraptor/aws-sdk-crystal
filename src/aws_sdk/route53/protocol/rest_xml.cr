require "json"
require "uri"
require "xml"
require "../../runtime"

module AwsSdk
  module Route53
    module Protocol
      module RestXml
        CONTENT_TYPE = "application/xml"

        struct ShapeMember
          getter name : String
          getter shape : String
          getter location : String?
          getter location_name : String?
          getter flattened : Bool

          def initialize(
            @name : String,
            @shape : String,
            @location : String?,
            @location_name : String?,
            @flattened : Bool
          )
          end
        end

        struct Shape
          getter name : String
          getter type : String
          getter members : Array(ShapeMember)
          getter list_member : ShapeMember?
          getter flattened : Bool

          def initialize(
            @name : String,
            @type : String,
            @members : Array(ShapeMember),
            @list_member : ShapeMember?,
            @flattened : Bool
          )
          end
        end

        OPERATION_INPUT_SHAPES = {
          "ActivateKeySigningKey" => "ActivateKeySigningKeyRequest",
          "AssociateVPCWithHostedZone" => "AssociateVPCWithHostedZoneRequest",
          "ChangeCidrCollection" => "ChangeCidrCollectionRequest",
          "ChangeResourceRecordSets" => "ChangeResourceRecordSetsRequest",
          "ChangeTagsForResource" => "ChangeTagsForResourceRequest",
          "CreateCidrCollection" => "CreateCidrCollectionRequest",
          "CreateHealthCheck" => "CreateHealthCheckRequest",
          "CreateHostedZone" => "CreateHostedZoneRequest",
          "CreateKeySigningKey" => "CreateKeySigningKeyRequest",
          "CreateQueryLoggingConfig" => "CreateQueryLoggingConfigRequest",
          "CreateReusableDelegationSet" => "CreateReusableDelegationSetRequest",
          "CreateTrafficPolicy" => "CreateTrafficPolicyRequest",
          "CreateTrafficPolicyInstance" => "CreateTrafficPolicyInstanceRequest",
          "CreateTrafficPolicyVersion" => "CreateTrafficPolicyVersionRequest",
          "CreateVPCAssociationAuthorization" => "CreateVPCAssociationAuthorizationRequest",
          "DeactivateKeySigningKey" => "DeactivateKeySigningKeyRequest",
          "DeleteCidrCollection" => "DeleteCidrCollectionRequest",
          "DeleteHealthCheck" => "DeleteHealthCheckRequest",
          "DeleteHostedZone" => "DeleteHostedZoneRequest",
          "DeleteKeySigningKey" => "DeleteKeySigningKeyRequest",
          "DeleteQueryLoggingConfig" => "DeleteQueryLoggingConfigRequest",
          "DeleteReusableDelegationSet" => "DeleteReusableDelegationSetRequest",
          "DeleteTrafficPolicy" => "DeleteTrafficPolicyRequest",
          "DeleteTrafficPolicyInstance" => "DeleteTrafficPolicyInstanceRequest",
          "DeleteVPCAssociationAuthorization" => "DeleteVPCAssociationAuthorizationRequest",
          "DisableHostedZoneDNSSEC" => "DisableHostedZoneDNSSECRequest",
          "DisassociateVPCFromHostedZone" => "DisassociateVPCFromHostedZoneRequest",
          "EnableHostedZoneDNSSEC" => "EnableHostedZoneDNSSECRequest",
          "GetAccountLimit" => "GetAccountLimitRequest",
          "GetChange" => "GetChangeRequest",
          "GetCheckerIpRanges" => "GetCheckerIpRangesRequest",
          "GetDNSSEC" => "GetDNSSECRequest",
          "GetGeoLocation" => "GetGeoLocationRequest",
          "GetHealthCheck" => "GetHealthCheckRequest",
          "GetHealthCheckCount" => "GetHealthCheckCountRequest",
          "GetHealthCheckLastFailureReason" => "GetHealthCheckLastFailureReasonRequest",
          "GetHealthCheckStatus" => "GetHealthCheckStatusRequest",
          "GetHostedZone" => "GetHostedZoneRequest",
          "GetHostedZoneCount" => "GetHostedZoneCountRequest",
          "GetHostedZoneLimit" => "GetHostedZoneLimitRequest",
          "GetQueryLoggingConfig" => "GetQueryLoggingConfigRequest",
          "GetReusableDelegationSet" => "GetReusableDelegationSetRequest",
          "GetReusableDelegationSetLimit" => "GetReusableDelegationSetLimitRequest",
          "GetTrafficPolicy" => "GetTrafficPolicyRequest",
          "GetTrafficPolicyInstance" => "GetTrafficPolicyInstanceRequest",
          "GetTrafficPolicyInstanceCount" => "GetTrafficPolicyInstanceCountRequest",
          "ListCidrBlocks" => "ListCidrBlocksRequest",
          "ListCidrCollections" => "ListCidrCollectionsRequest",
          "ListCidrLocations" => "ListCidrLocationsRequest",
          "ListGeoLocations" => "ListGeoLocationsRequest",
          "ListHealthChecks" => "ListHealthChecksRequest",
          "ListHostedZones" => "ListHostedZonesRequest",
          "ListHostedZonesByName" => "ListHostedZonesByNameRequest",
          "ListHostedZonesByVPC" => "ListHostedZonesByVPCRequest",
          "ListQueryLoggingConfigs" => "ListQueryLoggingConfigsRequest",
          "ListResourceRecordSets" => "ListResourceRecordSetsRequest",
          "ListReusableDelegationSets" => "ListReusableDelegationSetsRequest",
          "ListTagsForResource" => "ListTagsForResourceRequest",
          "ListTagsForResources" => "ListTagsForResourcesRequest",
          "ListTrafficPolicies" => "ListTrafficPoliciesRequest",
          "ListTrafficPolicyInstances" => "ListTrafficPolicyInstancesRequest",
          "ListTrafficPolicyInstancesByHostedZone" => "ListTrafficPolicyInstancesByHostedZoneRequest",
          "ListTrafficPolicyInstancesByPolicy" => "ListTrafficPolicyInstancesByPolicyRequest",
          "ListTrafficPolicyVersions" => "ListTrafficPolicyVersionsRequest",
          "ListVPCAssociationAuthorizations" => "ListVPCAssociationAuthorizationsRequest",
          "TestDNSAnswer" => "TestDNSAnswerRequest",
          "UpdateHealthCheck" => "UpdateHealthCheckRequest",
          "UpdateHostedZoneComment" => "UpdateHostedZoneCommentRequest",
          "UpdateHostedZoneFeatures" => "UpdateHostedZoneFeaturesRequest",
          "UpdateTrafficPolicyComment" => "UpdateTrafficPolicyCommentRequest",
          "UpdateTrafficPolicyInstance" => "UpdateTrafficPolicyInstanceRequest",
        }

        OPERATION_OUTPUT_SHAPES = {
          "ActivateKeySigningKey" => "ActivateKeySigningKeyResponse",
          "AssociateVPCWithHostedZone" => "AssociateVPCWithHostedZoneResponse",
          "ChangeCidrCollection" => "ChangeCidrCollectionResponse",
          "ChangeResourceRecordSets" => "ChangeResourceRecordSetsResponse",
          "ChangeTagsForResource" => "ChangeTagsForResourceResponse",
          "CreateCidrCollection" => "CreateCidrCollectionResponse",
          "CreateHealthCheck" => "CreateHealthCheckResponse",
          "CreateHostedZone" => "CreateHostedZoneResponse",
          "CreateKeySigningKey" => "CreateKeySigningKeyResponse",
          "CreateQueryLoggingConfig" => "CreateQueryLoggingConfigResponse",
          "CreateReusableDelegationSet" => "CreateReusableDelegationSetResponse",
          "CreateTrafficPolicy" => "CreateTrafficPolicyResponse",
          "CreateTrafficPolicyInstance" => "CreateTrafficPolicyInstanceResponse",
          "CreateTrafficPolicyVersion" => "CreateTrafficPolicyVersionResponse",
          "CreateVPCAssociationAuthorization" => "CreateVPCAssociationAuthorizationResponse",
          "DeactivateKeySigningKey" => "DeactivateKeySigningKeyResponse",
          "DeleteCidrCollection" => "DeleteCidrCollectionResponse",
          "DeleteHealthCheck" => "DeleteHealthCheckResponse",
          "DeleteHostedZone" => "DeleteHostedZoneResponse",
          "DeleteKeySigningKey" => "DeleteKeySigningKeyResponse",
          "DeleteQueryLoggingConfig" => "DeleteQueryLoggingConfigResponse",
          "DeleteReusableDelegationSet" => "DeleteReusableDelegationSetResponse",
          "DeleteTrafficPolicy" => "DeleteTrafficPolicyResponse",
          "DeleteTrafficPolicyInstance" => "DeleteTrafficPolicyInstanceResponse",
          "DeleteVPCAssociationAuthorization" => "DeleteVPCAssociationAuthorizationResponse",
          "DisableHostedZoneDNSSEC" => "DisableHostedZoneDNSSECResponse",
          "DisassociateVPCFromHostedZone" => "DisassociateVPCFromHostedZoneResponse",
          "EnableHostedZoneDNSSEC" => "EnableHostedZoneDNSSECResponse",
          "GetAccountLimit" => "GetAccountLimitResponse",
          "GetChange" => "GetChangeResponse",
          "GetCheckerIpRanges" => "GetCheckerIpRangesResponse",
          "GetDNSSEC" => "GetDNSSECResponse",
          "GetGeoLocation" => "GetGeoLocationResponse",
          "GetHealthCheck" => "GetHealthCheckResponse",
          "GetHealthCheckCount" => "GetHealthCheckCountResponse",
          "GetHealthCheckLastFailureReason" => "GetHealthCheckLastFailureReasonResponse",
          "GetHealthCheckStatus" => "GetHealthCheckStatusResponse",
          "GetHostedZone" => "GetHostedZoneResponse",
          "GetHostedZoneCount" => "GetHostedZoneCountResponse",
          "GetHostedZoneLimit" => "GetHostedZoneLimitResponse",
          "GetQueryLoggingConfig" => "GetQueryLoggingConfigResponse",
          "GetReusableDelegationSet" => "GetReusableDelegationSetResponse",
          "GetReusableDelegationSetLimit" => "GetReusableDelegationSetLimitResponse",
          "GetTrafficPolicy" => "GetTrafficPolicyResponse",
          "GetTrafficPolicyInstance" => "GetTrafficPolicyInstanceResponse",
          "GetTrafficPolicyInstanceCount" => "GetTrafficPolicyInstanceCountResponse",
          "ListCidrBlocks" => "ListCidrBlocksResponse",
          "ListCidrCollections" => "ListCidrCollectionsResponse",
          "ListCidrLocations" => "ListCidrLocationsResponse",
          "ListGeoLocations" => "ListGeoLocationsResponse",
          "ListHealthChecks" => "ListHealthChecksResponse",
          "ListHostedZones" => "ListHostedZonesResponse",
          "ListHostedZonesByName" => "ListHostedZonesByNameResponse",
          "ListHostedZonesByVPC" => "ListHostedZonesByVPCResponse",
          "ListQueryLoggingConfigs" => "ListQueryLoggingConfigsResponse",
          "ListResourceRecordSets" => "ListResourceRecordSetsResponse",
          "ListReusableDelegationSets" => "ListReusableDelegationSetsResponse",
          "ListTagsForResource" => "ListTagsForResourceResponse",
          "ListTagsForResources" => "ListTagsForResourcesResponse",
          "ListTrafficPolicies" => "ListTrafficPoliciesResponse",
          "ListTrafficPolicyInstances" => "ListTrafficPolicyInstancesResponse",
          "ListTrafficPolicyInstancesByHostedZone" => "ListTrafficPolicyInstancesByHostedZoneResponse",
          "ListTrafficPolicyInstancesByPolicy" => "ListTrafficPolicyInstancesByPolicyResponse",
          "ListTrafficPolicyVersions" => "ListTrafficPolicyVersionsResponse",
          "ListVPCAssociationAuthorizations" => "ListVPCAssociationAuthorizationsResponse",
          "TestDNSAnswer" => "TestDNSAnswerResponse",
          "UpdateHealthCheck" => "UpdateHealthCheckResponse",
          "UpdateHostedZoneComment" => "UpdateHostedZoneCommentResponse",
          "UpdateHostedZoneFeatures" => "UpdateHostedZoneFeaturesResponse",
          "UpdateTrafficPolicyComment" => "UpdateTrafficPolicyCommentResponse",
          "UpdateTrafficPolicyInstance" => "UpdateTrafficPolicyInstanceResponse",
        }

        OPERATION_INPUT_ROOTS = {
          "ActivateKeySigningKey" => "ActivateKeySigningKeyRequest",
          "AssociateVPCWithHostedZone" => "AssociateVPCWithHostedZoneRequest",
          "ChangeCidrCollection" => "ChangeCidrCollectionRequest",
          "ChangeResourceRecordSets" => "ChangeResourceRecordSetsRequest",
          "ChangeTagsForResource" => "ChangeTagsForResourceRequest",
          "CreateCidrCollection" => "CreateCidrCollectionRequest",
          "CreateHealthCheck" => "CreateHealthCheckRequest",
          "CreateHostedZone" => "CreateHostedZoneRequest",
          "CreateKeySigningKey" => "CreateKeySigningKeyRequest",
          "CreateQueryLoggingConfig" => "CreateQueryLoggingConfigRequest",
          "CreateReusableDelegationSet" => "CreateReusableDelegationSetRequest",
          "CreateTrafficPolicy" => "CreateTrafficPolicyRequest",
          "CreateTrafficPolicyInstance" => "CreateTrafficPolicyInstanceRequest",
          "CreateTrafficPolicyVersion" => "CreateTrafficPolicyVersionRequest",
          "CreateVPCAssociationAuthorization" => "CreateVPCAssociationAuthorizationRequest",
          "DeactivateKeySigningKey" => "DeactivateKeySigningKeyRequest",
          "DeleteCidrCollection" => "DeleteCidrCollectionRequest",
          "DeleteHealthCheck" => "DeleteHealthCheckRequest",
          "DeleteHostedZone" => "DeleteHostedZoneRequest",
          "DeleteKeySigningKey" => "DeleteKeySigningKeyRequest",
          "DeleteQueryLoggingConfig" => "DeleteQueryLoggingConfigRequest",
          "DeleteReusableDelegationSet" => "DeleteReusableDelegationSetRequest",
          "DeleteTrafficPolicy" => "DeleteTrafficPolicyRequest",
          "DeleteTrafficPolicyInstance" => "DeleteTrafficPolicyInstanceRequest",
          "DeleteVPCAssociationAuthorization" => "DeleteVPCAssociationAuthorizationRequest",
          "DisableHostedZoneDNSSEC" => "DisableHostedZoneDNSSECRequest",
          "DisassociateVPCFromHostedZone" => "DisassociateVPCFromHostedZoneRequest",
          "EnableHostedZoneDNSSEC" => "EnableHostedZoneDNSSECRequest",
          "GetAccountLimit" => "GetAccountLimitRequest",
          "GetChange" => "GetChangeRequest",
          "GetCheckerIpRanges" => "GetCheckerIpRangesRequest",
          "GetDNSSEC" => "GetDNSSECRequest",
          "GetGeoLocation" => "GetGeoLocationRequest",
          "GetHealthCheck" => "GetHealthCheckRequest",
          "GetHealthCheckCount" => "GetHealthCheckCountRequest",
          "GetHealthCheckLastFailureReason" => "GetHealthCheckLastFailureReasonRequest",
          "GetHealthCheckStatus" => "GetHealthCheckStatusRequest",
          "GetHostedZone" => "GetHostedZoneRequest",
          "GetHostedZoneCount" => "GetHostedZoneCountRequest",
          "GetHostedZoneLimit" => "GetHostedZoneLimitRequest",
          "GetQueryLoggingConfig" => "GetQueryLoggingConfigRequest",
          "GetReusableDelegationSet" => "GetReusableDelegationSetRequest",
          "GetReusableDelegationSetLimit" => "GetReusableDelegationSetLimitRequest",
          "GetTrafficPolicy" => "GetTrafficPolicyRequest",
          "GetTrafficPolicyInstance" => "GetTrafficPolicyInstanceRequest",
          "GetTrafficPolicyInstanceCount" => "GetTrafficPolicyInstanceCountRequest",
          "ListCidrBlocks" => "ListCidrBlocksRequest",
          "ListCidrCollections" => "ListCidrCollectionsRequest",
          "ListCidrLocations" => "ListCidrLocationsRequest",
          "ListGeoLocations" => "ListGeoLocationsRequest",
          "ListHealthChecks" => "ListHealthChecksRequest",
          "ListHostedZones" => "ListHostedZonesRequest",
          "ListHostedZonesByName" => "ListHostedZonesByNameRequest",
          "ListHostedZonesByVPC" => "ListHostedZonesByVPCRequest",
          "ListQueryLoggingConfigs" => "ListQueryLoggingConfigsRequest",
          "ListResourceRecordSets" => "ListResourceRecordSetsRequest",
          "ListReusableDelegationSets" => "ListReusableDelegationSetsRequest",
          "ListTagsForResource" => "ListTagsForResourceRequest",
          "ListTagsForResources" => "ListTagsForResourcesRequest",
          "ListTrafficPolicies" => "ListTrafficPoliciesRequest",
          "ListTrafficPolicyInstances" => "ListTrafficPolicyInstancesRequest",
          "ListTrafficPolicyInstancesByHostedZone" => "ListTrafficPolicyInstancesByHostedZoneRequest",
          "ListTrafficPolicyInstancesByPolicy" => "ListTrafficPolicyInstancesByPolicyRequest",
          "ListTrafficPolicyVersions" => "ListTrafficPolicyVersionsRequest",
          "ListVPCAssociationAuthorizations" => "ListVPCAssociationAuthorizationsRequest",
          "TestDNSAnswer" => "TestDNSAnswerRequest",
          "UpdateHealthCheck" => "UpdateHealthCheckRequest",
          "UpdateHostedZoneComment" => "UpdateHostedZoneCommentRequest",
          "UpdateHostedZoneFeatures" => "UpdateHostedZoneFeaturesRequest",
          "UpdateTrafficPolicyComment" => "UpdateTrafficPolicyCommentRequest",
          "UpdateTrafficPolicyInstance" => "UpdateTrafficPolicyInstanceRequest",
        }

        OPERATION_INPUT_NAMESPACES = {
          "AssociateVPCWithHostedZone" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "ChangeCidrCollection" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "ChangeResourceRecordSets" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "ChangeTagsForResource" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateCidrCollection" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateHealthCheck" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateHostedZone" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateKeySigningKey" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateQueryLoggingConfig" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateReusableDelegationSet" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateTrafficPolicy" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateTrafficPolicyInstance" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateTrafficPolicyVersion" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "CreateVPCAssociationAuthorization" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "DeleteVPCAssociationAuthorization" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "DisassociateVPCFromHostedZone" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "ListTagsForResources" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "UpdateHealthCheck" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "UpdateHostedZoneComment" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "UpdateHostedZoneFeatures" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "UpdateTrafficPolicyComment" => "https://route53.amazonaws.com/doc/2013-04-01/",
          "UpdateTrafficPolicyInstance" => "https://route53.amazonaws.com/doc/2013-04-01/",
        }

        SHAPES = {
          "ARN" => Shape.new(
            "ARN",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "AWSAccountID" => Shape.new(
            "AWSAccountID",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "AWSRegion" => Shape.new(
            "AWSRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "AcceleratedRecoveryEnabled" => Shape.new(
            "AcceleratedRecoveryEnabled",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "AcceleratedRecoveryStatus" => Shape.new(
            "AcceleratedRecoveryStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "AccountLimit" => Shape.new(
            "AccountLimit",
            "structure",
            [
              ShapeMember.new(
                "Type",
                "AccountLimitType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Value",
                "LimitValue",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "AccountLimitType" => Shape.new(
            "AccountLimitType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ActivateKeySigningKeyRequest" => Shape.new(
            "ActivateKeySigningKeyRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "HostedZoneId",
                false
              ),
              ShapeMember.new(
                "Name",
                "SigningKeyName",
                "uri",
                "Name",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ActivateKeySigningKeyResponse" => Shape.new(
            "ActivateKeySigningKeyResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "AlarmIdentifier" => Shape.new(
            "AlarmIdentifier",
            "structure",
            [
              ShapeMember.new(
                "Name",
                "AlarmName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Region",
                "CloudWatchRegion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "AlarmName" => Shape.new(
            "AlarmName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "AliasHealthEnabled" => Shape.new(
            "AliasHealthEnabled",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "AliasTarget" => Shape.new(
            "AliasTarget",
            "structure",
            [
              ShapeMember.new(
                "DNSName",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "EvaluateTargetHealth",
                "AliasHealthEnabled",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "AssociateVPCComment" => Shape.new(
            "AssociateVPCComment",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "AssociateVPCWithHostedZoneRequest" => Shape.new(
            "AssociateVPCWithHostedZoneRequest",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "AssociateVPCComment",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "VPC",
                "VPC",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "AssociateVPCWithHostedZoneResponse" => Shape.new(
            "AssociateVPCWithHostedZoneResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Bias" => Shape.new(
            "Bias",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "Change" => Shape.new(
            "Change",
            "structure",
            [
              ShapeMember.new(
                "Action",
                "ChangeAction",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourceRecordSet",
                "ResourceRecordSet",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeAction" => Shape.new(
            "ChangeAction",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ChangeBatch" => Shape.new(
            "ChangeBatch",
            "structure",
            [
              ShapeMember.new(
                "Changes",
                "Changes",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Comment",
                "ResourceDescription",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeCidrCollectionRequest" => Shape.new(
            "ChangeCidrCollectionRequest",
            "structure",
            [
              ShapeMember.new(
                "Changes",
                "CidrCollectionChanges",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "CollectionVersion",
                "CollectionVersion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "UUID",
                "uri",
                "CidrCollectionId",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeCidrCollectionResponse" => Shape.new(
            "ChangeCidrCollectionResponse",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "ChangeId",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeId" => Shape.new(
            "ChangeId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ChangeInfo" => Shape.new(
            "ChangeInfo",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "ResourceDescription",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Status",
                "ChangeStatus",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SubmittedAt",
                "TimeStamp",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeResourceRecordSetsRequest" => Shape.new(
            "ChangeResourceRecordSetsRequest",
            "structure",
            [
              ShapeMember.new(
                "ChangeBatch",
                "ChangeBatch",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeResourceRecordSetsResponse" => Shape.new(
            "ChangeResourceRecordSetsResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeStatus" => Shape.new(
            "ChangeStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ChangeTagsForResourceRequest" => Shape.new(
            "ChangeTagsForResourceRequest",
            "structure",
            [
              ShapeMember.new(
                "AddTags",
                "TagList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "RemoveTagKeys",
                "TagKeyList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourceId",
                "TagResourceId",
                "uri",
                "ResourceId",
                false
              ),
              ShapeMember.new(
                "ResourceType",
                "TagResourceType",
                "uri",
                "ResourceType",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ChangeTagsForResourceResponse" => Shape.new(
            "ChangeTagsForResourceResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "Changes" => Shape.new(
            "Changes",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Change",
              nil,
              "Change",
              false
            ),
            false
          ),
          "CheckerIpRanges" => Shape.new(
            "CheckerIpRanges",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "IPAddressCidr",
              nil,
              nil,
              false
            ),
            false
          ),
          "ChildHealthCheckList" => Shape.new(
            "ChildHealthCheckList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "HealthCheckId",
              nil,
              "ChildHealthCheck",
              false
            ),
            false
          ),
          "Cidr" => Shape.new(
            "Cidr",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CidrBlockInUseException" => Shape.new(
            "CidrBlockInUseException",
            "structure",
            [
              ShapeMember.new(
                "Message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CidrBlockSummaries" => Shape.new(
            "CidrBlockSummaries",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CidrBlockSummary",
              nil,
              nil,
              false
            ),
            false
          ),
          "CidrBlockSummary" => Shape.new(
            "CidrBlockSummary",
            "structure",
            [
              ShapeMember.new(
                "CidrBlock",
                "Cidr",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LocationName",
                "CidrLocationNameDefaultNotAllowed",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CidrCollection" => Shape.new(
            "CidrCollection",
            "structure",
            [
              ShapeMember.new(
                "Arn",
                "ARN",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "UUID",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "CollectionName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Version",
                "CollectionVersion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CidrCollectionAlreadyExistsException" => Shape.new(
            "CidrCollectionAlreadyExistsException",
            "structure",
            [
              ShapeMember.new(
                "Message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CidrCollectionChange" => Shape.new(
            "CidrCollectionChange",
            "structure",
            [
              ShapeMember.new(
                "Action",
                "CidrCollectionChangeAction",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "CidrList",
                "CidrList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LocationName",
                "CidrLocationNameDefaultNotAllowed",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CidrCollectionChangeAction" => Shape.new(
            "CidrCollectionChangeAction",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CidrCollectionChanges" => Shape.new(
            "CidrCollectionChanges",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CidrCollectionChange",
              nil,
              nil,
              false
            ),
            false
          ),
          "CidrCollectionInUseException" => Shape.new(
            "CidrCollectionInUseException",
            "structure",
            [
              ShapeMember.new(
                "Message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CidrCollectionVersionMismatchException" => Shape.new(
            "CidrCollectionVersionMismatchException",
            "structure",
            [
              ShapeMember.new(
                "Message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CidrList" => Shape.new(
            "CidrList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Cidr",
              nil,
              "Cidr",
              false
            ),
            false
          ),
          "CidrLocationNameDefaultAllowed" => Shape.new(
            "CidrLocationNameDefaultAllowed",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CidrLocationNameDefaultNotAllowed" => Shape.new(
            "CidrLocationNameDefaultNotAllowed",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CidrNonce" => Shape.new(
            "CidrNonce",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CidrRoutingConfig" => Shape.new(
            "CidrRoutingConfig",
            "structure",
            [
              ShapeMember.new(
                "CollectionId",
                "UUID",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LocationName",
                "CidrLocationNameDefaultAllowed",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CloudWatchAlarmConfiguration" => Shape.new(
            "CloudWatchAlarmConfiguration",
            "structure",
            [
              ShapeMember.new(
                "ComparisonOperator",
                "ComparisonOperator",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Dimensions",
                "DimensionList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "EvaluationPeriods",
                "EvaluationPeriods",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MetricName",
                "MetricName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Namespace",
                "Namespace",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Period",
                "Period",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Statistic",
                "Statistic",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Threshold",
                "Threshold",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CloudWatchLogsLogGroupArn" => Shape.new(
            "CloudWatchLogsLogGroupArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CloudWatchRegion" => Shape.new(
            "CloudWatchRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CollectionName" => Shape.new(
            "CollectionName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "CollectionSummaries" => Shape.new(
            "CollectionSummaries",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CollectionSummary",
              nil,
              nil,
              false
            ),
            false
          ),
          "CollectionSummary" => Shape.new(
            "CollectionSummary",
            "structure",
            [
              ShapeMember.new(
                "Arn",
                "ARN",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "UUID",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "CollectionName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Version",
                "CollectionVersion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CollectionVersion" => Shape.new(
            "CollectionVersion",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "ComparisonOperator" => Shape.new(
            "ComparisonOperator",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ConcurrentModification" => Shape.new(
            "ConcurrentModification",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ConflictingDomainExists" => Shape.new(
            "ConflictingDomainExists",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ConflictingTypes" => Shape.new(
            "ConflictingTypes",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Coordinates" => Shape.new(
            "Coordinates",
            "structure",
            [
              ShapeMember.new(
                "Latitude",
                "Latitude",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Longitude",
                "Longitude",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateCidrCollectionRequest" => Shape.new(
            "CreateCidrCollectionRequest",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "CidrNonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "CollectionName",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateCidrCollectionResponse" => Shape.new(
            "CreateCidrCollectionResponse",
            "structure",
            [
              ShapeMember.new(
                "Collection",
                "CidrCollection",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateHealthCheckRequest" => Shape.new(
            "CreateHealthCheckRequest",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "HealthCheckNonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HealthCheckConfig",
                "HealthCheckConfig",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateHealthCheckResponse" => Shape.new(
            "CreateHealthCheckResponse",
            "structure",
            [
              ShapeMember.new(
                "HealthCheck",
                "HealthCheck",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateHostedZoneRequest" => Shape.new(
            "CreateHostedZoneRequest",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "Nonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "DelegationSetId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneConfig",
                "HostedZoneConfig",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "VPC",
                "VPC",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateHostedZoneResponse" => Shape.new(
            "CreateHostedZoneResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "DelegationSet",
                "DelegationSet",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZone",
                "HostedZone",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
              ShapeMember.new(
                "VPC",
                "VPC",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateKeySigningKeyRequest" => Shape.new(
            "CreateKeySigningKeyRequest",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "Nonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "KeyManagementServiceArn",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "SigningKeyName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Status",
                "SigningKeyStatus",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateKeySigningKeyResponse" => Shape.new(
            "CreateKeySigningKeyResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "KeySigningKey",
                "KeySigningKey",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateQueryLoggingConfigRequest" => Shape.new(
            "CreateQueryLoggingConfigRequest",
            "structure",
            [
              ShapeMember.new(
                "CloudWatchLogsLogGroupArn",
                "CloudWatchLogsLogGroupArn",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateQueryLoggingConfigResponse" => Shape.new(
            "CreateQueryLoggingConfigResponse",
            "structure",
            [
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
              ShapeMember.new(
                "QueryLoggingConfig",
                "QueryLoggingConfig",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateReusableDelegationSetRequest" => Shape.new(
            "CreateReusableDelegationSetRequest",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "Nonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateReusableDelegationSetResponse" => Shape.new(
            "CreateReusableDelegationSetResponse",
            "structure",
            [
              ShapeMember.new(
                "DelegationSet",
                "DelegationSet",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateTrafficPolicyInstanceRequest" => Shape.new(
            "CreateTrafficPolicyInstanceRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TTL",
                "TTL",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyId",
                "TrafficPolicyId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyVersion",
                "TrafficPolicyVersion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateTrafficPolicyInstanceResponse" => Shape.new(
            "CreateTrafficPolicyInstanceResponse",
            "structure",
            [
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstance",
                "TrafficPolicyInstance",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateTrafficPolicyRequest" => Shape.new(
            "CreateTrafficPolicyRequest",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "TrafficPolicyComment",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Document",
                "TrafficPolicyDocument",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "TrafficPolicyName",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateTrafficPolicyResponse" => Shape.new(
            "CreateTrafficPolicyResponse",
            "structure",
            [
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
              ShapeMember.new(
                "TrafficPolicy",
                "TrafficPolicy",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateTrafficPolicyVersionRequest" => Shape.new(
            "CreateTrafficPolicyVersionRequest",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "TrafficPolicyComment",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Document",
                "TrafficPolicyDocument",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "TrafficPolicyId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateTrafficPolicyVersionResponse" => Shape.new(
            "CreateTrafficPolicyVersionResponse",
            "structure",
            [
              ShapeMember.new(
                "Location",
                "ResourceURI",
                "header",
                "Location",
                false
              ),
              ShapeMember.new(
                "TrafficPolicy",
                "TrafficPolicy",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateVPCAssociationAuthorizationRequest" => Shape.new(
            "CreateVPCAssociationAuthorizationRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "VPC",
                "VPC",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "CreateVPCAssociationAuthorizationResponse" => Shape.new(
            "CreateVPCAssociationAuthorizationResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "VPC",
                "VPC",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DNSName" => Shape.new(
            "DNSName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "DNSRCode" => Shape.new(
            "DNSRCode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "DNSSECNotFound" => Shape.new(
            "DNSSECNotFound",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DNSSECStatus" => Shape.new(
            "DNSSECStatus",
            "structure",
            [
              ShapeMember.new(
                "ServeSignature",
                "ServeSignature",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "StatusMessage",
                "SigningKeyStatusMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeactivateKeySigningKeyRequest" => Shape.new(
            "DeactivateKeySigningKeyRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "HostedZoneId",
                false
              ),
              ShapeMember.new(
                "Name",
                "SigningKeyName",
                "uri",
                "Name",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeactivateKeySigningKeyResponse" => Shape.new(
            "DeactivateKeySigningKeyResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DelegationSet" => Shape.new(
            "DelegationSet",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "Nonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NameServers",
                "DelegationSetNameServers",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DelegationSetAlreadyCreated" => Shape.new(
            "DelegationSetAlreadyCreated",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DelegationSetAlreadyReusable" => Shape.new(
            "DelegationSetAlreadyReusable",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DelegationSetInUse" => Shape.new(
            "DelegationSetInUse",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DelegationSetNameServers" => Shape.new(
            "DelegationSetNameServers",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DNSName",
              nil,
              "NameServer",
              false
            ),
            false
          ),
          "DelegationSetNotAvailable" => Shape.new(
            "DelegationSetNotAvailable",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DelegationSetNotReusable" => Shape.new(
            "DelegationSetNotReusable",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DelegationSets" => Shape.new(
            "DelegationSets",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DelegationSet",
              nil,
              "DelegationSet",
              false
            ),
            false
          ),
          "DeleteCidrCollectionRequest" => Shape.new(
            "DeleteCidrCollectionRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "UUID",
                "uri",
                "CidrCollectionId",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteCidrCollectionResponse" => Shape.new(
            "DeleteCidrCollectionResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteHealthCheckRequest" => Shape.new(
            "DeleteHealthCheckRequest",
            "structure",
            [
              ShapeMember.new(
                "HealthCheckId",
                "HealthCheckId",
                "uri",
                "HealthCheckId",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteHealthCheckResponse" => Shape.new(
            "DeleteHealthCheckResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteHostedZoneRequest" => Shape.new(
            "DeleteHostedZoneRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteHostedZoneResponse" => Shape.new(
            "DeleteHostedZoneResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteKeySigningKeyRequest" => Shape.new(
            "DeleteKeySigningKeyRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "HostedZoneId",
                false
              ),
              ShapeMember.new(
                "Name",
                "SigningKeyName",
                "uri",
                "Name",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteKeySigningKeyResponse" => Shape.new(
            "DeleteKeySigningKeyResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteQueryLoggingConfigRequest" => Shape.new(
            "DeleteQueryLoggingConfigRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "QueryLoggingConfigId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteQueryLoggingConfigResponse" => Shape.new(
            "DeleteQueryLoggingConfigResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteReusableDelegationSetRequest" => Shape.new(
            "DeleteReusableDelegationSetRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteReusableDelegationSetResponse" => Shape.new(
            "DeleteReusableDelegationSetResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteTrafficPolicyInstanceRequest" => Shape.new(
            "DeleteTrafficPolicyInstanceRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "TrafficPolicyInstanceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteTrafficPolicyInstanceResponse" => Shape.new(
            "DeleteTrafficPolicyInstanceResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteTrafficPolicyRequest" => Shape.new(
            "DeleteTrafficPolicyRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "TrafficPolicyId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "Version",
                "TrafficPolicyVersion",
                "uri",
                "Version",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteTrafficPolicyResponse" => Shape.new(
            "DeleteTrafficPolicyResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteVPCAssociationAuthorizationRequest" => Shape.new(
            "DeleteVPCAssociationAuthorizationRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "VPC",
                "VPC",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DeleteVPCAssociationAuthorizationResponse" => Shape.new(
            "DeleteVPCAssociationAuthorizationResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "Dimension" => Shape.new(
            "Dimension",
            "structure",
            [
              ShapeMember.new(
                "Name",
                "DimensionField",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Value",
                "DimensionField",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DimensionField" => Shape.new(
            "DimensionField",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "DimensionList" => Shape.new(
            "DimensionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Dimension",
              nil,
              "Dimension",
              false
            ),
            false
          ),
          "DisableHostedZoneDNSSECRequest" => Shape.new(
            "DisableHostedZoneDNSSECRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DisableHostedZoneDNSSECResponse" => Shape.new(
            "DisableHostedZoneDNSSECResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Disabled" => Shape.new(
            "Disabled",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "DisassociateVPCComment" => Shape.new(
            "DisassociateVPCComment",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "DisassociateVPCFromHostedZoneRequest" => Shape.new(
            "DisassociateVPCFromHostedZoneRequest",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "DisassociateVPCComment",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "VPC",
                "VPC",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "DisassociateVPCFromHostedZoneResponse" => Shape.new(
            "DisassociateVPCFromHostedZoneResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "EnableHostedZoneDNSSECRequest" => Shape.new(
            "EnableHostedZoneDNSSECRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "EnableHostedZoneDNSSECResponse" => Shape.new(
            "EnableHostedZoneDNSSECResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "EnableSNI" => Shape.new(
            "EnableSNI",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "ErrorMessage" => Shape.new(
            "ErrorMessage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ErrorMessages" => Shape.new(
            "ErrorMessages",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ErrorMessage",
              nil,
              "Message",
              false
            ),
            false
          ),
          "EvaluationPeriods" => Shape.new(
            "EvaluationPeriods",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "FailureReason" => Shape.new(
            "FailureReason",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "FailureThreshold" => Shape.new(
            "FailureThreshold",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "FullyQualifiedDomainName" => Shape.new(
            "FullyQualifiedDomainName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "GeoLocation" => Shape.new(
            "GeoLocation",
            "structure",
            [
              ShapeMember.new(
                "ContinentCode",
                "GeoLocationContinentCode",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "CountryCode",
                "GeoLocationCountryCode",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SubdivisionCode",
                "GeoLocationSubdivisionCode",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GeoLocationContinentCode" => Shape.new(
            "GeoLocationContinentCode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "GeoLocationContinentName" => Shape.new(
            "GeoLocationContinentName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "GeoLocationCountryCode" => Shape.new(
            "GeoLocationCountryCode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "GeoLocationCountryName" => Shape.new(
            "GeoLocationCountryName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "GeoLocationDetails" => Shape.new(
            "GeoLocationDetails",
            "structure",
            [
              ShapeMember.new(
                "ContinentCode",
                "GeoLocationContinentCode",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ContinentName",
                "GeoLocationContinentName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "CountryCode",
                "GeoLocationCountryCode",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "CountryName",
                "GeoLocationCountryName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SubdivisionCode",
                "GeoLocationSubdivisionCode",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SubdivisionName",
                "GeoLocationSubdivisionName",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GeoLocationDetailsList" => Shape.new(
            "GeoLocationDetailsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "GeoLocationDetails",
              nil,
              "GeoLocationDetails",
              false
            ),
            false
          ),
          "GeoLocationSubdivisionCode" => Shape.new(
            "GeoLocationSubdivisionCode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "GeoLocationSubdivisionName" => Shape.new(
            "GeoLocationSubdivisionName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "GeoProximityLocation" => Shape.new(
            "GeoProximityLocation",
            "structure",
            [
              ShapeMember.new(
                "AWSRegion",
                "AWSRegion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Bias",
                "Bias",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Coordinates",
                "Coordinates",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LocalZoneGroup",
                "LocalZoneGroup",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetAccountLimitRequest" => Shape.new(
            "GetAccountLimitRequest",
            "structure",
            [
              ShapeMember.new(
                "Type",
                "AccountLimitType",
                "uri",
                "Type",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetAccountLimitResponse" => Shape.new(
            "GetAccountLimitResponse",
            "structure",
            [
              ShapeMember.new(
                "Count",
                "UsageCount",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Limit",
                "AccountLimit",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetChangeRequest" => Shape.new(
            "GetChangeRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "ChangeId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetChangeResponse" => Shape.new(
            "GetChangeResponse",
            "structure",
            [
              ShapeMember.new(
                "ChangeInfo",
                "ChangeInfo",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetCheckerIpRangesRequest" => Shape.new(
            "GetCheckerIpRangesRequest",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "GetCheckerIpRangesResponse" => Shape.new(
            "GetCheckerIpRangesResponse",
            "structure",
            [
              ShapeMember.new(
                "CheckerIpRanges",
                "CheckerIpRanges",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetDNSSECRequest" => Shape.new(
            "GetDNSSECRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetDNSSECResponse" => Shape.new(
            "GetDNSSECResponse",
            "structure",
            [
              ShapeMember.new(
                "KeySigningKeys",
                "KeySigningKeys",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Status",
                "DNSSECStatus",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetGeoLocationRequest" => Shape.new(
            "GetGeoLocationRequest",
            "structure",
            [
              ShapeMember.new(
                "ContinentCode",
                "GeoLocationContinentCode",
                "querystring",
                "continentcode",
                false
              ),
              ShapeMember.new(
                "CountryCode",
                "GeoLocationCountryCode",
                "querystring",
                "countrycode",
                false
              ),
              ShapeMember.new(
                "SubdivisionCode",
                "GeoLocationSubdivisionCode",
                "querystring",
                "subdivisioncode",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetGeoLocationResponse" => Shape.new(
            "GetGeoLocationResponse",
            "structure",
            [
              ShapeMember.new(
                "GeoLocationDetails",
                "GeoLocationDetails",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckCountRequest" => Shape.new(
            "GetHealthCheckCountRequest",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckCountResponse" => Shape.new(
            "GetHealthCheckCountResponse",
            "structure",
            [
              ShapeMember.new(
                "HealthCheckCount",
                "HealthCheckCount",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckLastFailureReasonRequest" => Shape.new(
            "GetHealthCheckLastFailureReasonRequest",
            "structure",
            [
              ShapeMember.new(
                "HealthCheckId",
                "HealthCheckId",
                "uri",
                "HealthCheckId",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckLastFailureReasonResponse" => Shape.new(
            "GetHealthCheckLastFailureReasonResponse",
            "structure",
            [
              ShapeMember.new(
                "HealthCheckObservations",
                "HealthCheckObservations",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckRequest" => Shape.new(
            "GetHealthCheckRequest",
            "structure",
            [
              ShapeMember.new(
                "HealthCheckId",
                "HealthCheckId",
                "uri",
                "HealthCheckId",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckResponse" => Shape.new(
            "GetHealthCheckResponse",
            "structure",
            [
              ShapeMember.new(
                "HealthCheck",
                "HealthCheck",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckStatusRequest" => Shape.new(
            "GetHealthCheckStatusRequest",
            "structure",
            [
              ShapeMember.new(
                "HealthCheckId",
                "HealthCheckId",
                "uri",
                "HealthCheckId",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHealthCheckStatusResponse" => Shape.new(
            "GetHealthCheckStatusResponse",
            "structure",
            [
              ShapeMember.new(
                "HealthCheckObservations",
                "HealthCheckObservations",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHostedZoneCountRequest" => Shape.new(
            "GetHostedZoneCountRequest",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHostedZoneCountResponse" => Shape.new(
            "GetHostedZoneCountResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneCount",
                "HostedZoneCount",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHostedZoneLimitRequest" => Shape.new(
            "GetHostedZoneLimitRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "Type",
                "HostedZoneLimitType",
                "uri",
                "Type",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHostedZoneLimitResponse" => Shape.new(
            "GetHostedZoneLimitResponse",
            "structure",
            [
              ShapeMember.new(
                "Count",
                "UsageCount",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Limit",
                "HostedZoneLimit",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHostedZoneRequest" => Shape.new(
            "GetHostedZoneRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetHostedZoneResponse" => Shape.new(
            "GetHostedZoneResponse",
            "structure",
            [
              ShapeMember.new(
                "DelegationSet",
                "DelegationSet",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZone",
                "HostedZone",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "VPCs",
                "VPCs",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetQueryLoggingConfigRequest" => Shape.new(
            "GetQueryLoggingConfigRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "QueryLoggingConfigId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetQueryLoggingConfigResponse" => Shape.new(
            "GetQueryLoggingConfigResponse",
            "structure",
            [
              ShapeMember.new(
                "QueryLoggingConfig",
                "QueryLoggingConfig",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetReusableDelegationSetLimitRequest" => Shape.new(
            "GetReusableDelegationSetLimitRequest",
            "structure",
            [
              ShapeMember.new(
                "DelegationSetId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "Type",
                "ReusableDelegationSetLimitType",
                "uri",
                "Type",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetReusableDelegationSetLimitResponse" => Shape.new(
            "GetReusableDelegationSetLimitResponse",
            "structure",
            [
              ShapeMember.new(
                "Count",
                "UsageCount",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Limit",
                "ReusableDelegationSetLimit",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetReusableDelegationSetRequest" => Shape.new(
            "GetReusableDelegationSetRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetReusableDelegationSetResponse" => Shape.new(
            "GetReusableDelegationSetResponse",
            "structure",
            [
              ShapeMember.new(
                "DelegationSet",
                "DelegationSet",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetTrafficPolicyInstanceCountRequest" => Shape.new(
            "GetTrafficPolicyInstanceCountRequest",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "GetTrafficPolicyInstanceCountResponse" => Shape.new(
            "GetTrafficPolicyInstanceCountResponse",
            "structure",
            [
              ShapeMember.new(
                "TrafficPolicyInstanceCount",
                "TrafficPolicyInstanceCount",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetTrafficPolicyInstanceRequest" => Shape.new(
            "GetTrafficPolicyInstanceRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "TrafficPolicyInstanceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetTrafficPolicyInstanceResponse" => Shape.new(
            "GetTrafficPolicyInstanceResponse",
            "structure",
            [
              ShapeMember.new(
                "TrafficPolicyInstance",
                "TrafficPolicyInstance",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetTrafficPolicyRequest" => Shape.new(
            "GetTrafficPolicyRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "TrafficPolicyId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "Version",
                "TrafficPolicyVersion",
                "uri",
                "Version",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "GetTrafficPolicyResponse" => Shape.new(
            "GetTrafficPolicyResponse",
            "structure",
            [
              ShapeMember.new(
                "TrafficPolicy",
                "TrafficPolicy",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HealthCheck" => Shape.new(
            "HealthCheck",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "HealthCheckNonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "CloudWatchAlarmConfiguration",
                "CloudWatchAlarmConfiguration",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HealthCheckConfig",
                "HealthCheckConfig",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HealthCheckVersion",
                "HealthCheckVersion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "HealthCheckId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LinkedService",
                "LinkedService",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckAlreadyExists" => Shape.new(
            "HealthCheckAlreadyExists",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckConfig" => Shape.new(
            "HealthCheckConfig",
            "structure",
            [
              ShapeMember.new(
                "AlarmIdentifier",
                "AlarmIdentifier",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ChildHealthChecks",
                "ChildHealthCheckList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Disabled",
                "Disabled",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "EnableSNI",
                "EnableSNI",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "FailureThreshold",
                "FailureThreshold",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "FullyQualifiedDomainName",
                "FullyQualifiedDomainName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HealthThreshold",
                "HealthThreshold",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IPAddress",
                "IPAddress",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "InsufficientDataHealthStatus",
                "InsufficientDataHealthStatus",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Inverted",
                "Inverted",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MeasureLatency",
                "MeasureLatency",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Port",
                "Port",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Regions",
                "HealthCheckRegionList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "RequestInterval",
                "RequestInterval",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourcePath",
                "ResourcePath",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "RoutingControlArn",
                "RoutingControlArn",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SearchString",
                "SearchString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Type",
                "HealthCheckType",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckCount" => Shape.new(
            "HealthCheckCount",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckId" => Shape.new(
            "HealthCheckId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckInUse" => Shape.new(
            "HealthCheckInUse",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckNonce" => Shape.new(
            "HealthCheckNonce",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckObservation" => Shape.new(
            "HealthCheckObservation",
            "structure",
            [
              ShapeMember.new(
                "IPAddress",
                "IPAddress",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Region",
                "HealthCheckRegion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "StatusReport",
                "StatusReport",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckObservations" => Shape.new(
            "HealthCheckObservations",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "HealthCheckObservation",
              nil,
              "HealthCheckObservation",
              false
            ),
            false
          ),
          "HealthCheckRegion" => Shape.new(
            "HealthCheckRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckRegionList" => Shape.new(
            "HealthCheckRegionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "HealthCheckRegion",
              nil,
              "Region",
              false
            ),
            false
          ),
          "HealthCheckType" => Shape.new(
            "HealthCheckType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckVersion" => Shape.new(
            "HealthCheckVersion",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "HealthCheckVersionMismatch" => Shape.new(
            "HealthCheckVersionMismatch",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HealthChecks" => Shape.new(
            "HealthChecks",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "HealthCheck",
              nil,
              "HealthCheck",
              false
            ),
            false
          ),
          "HealthThreshold" => Shape.new(
            "HealthThreshold",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "HostedZone" => Shape.new(
            "HostedZone",
            "structure",
            [
              ShapeMember.new(
                "CallerReference",
                "Nonce",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Config",
                "HostedZoneConfig",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Features",
                "HostedZoneFeatures",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LinkedService",
                "LinkedService",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourceRecordSetCount",
                "HostedZoneRRSetCount",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneAlreadyExists" => Shape.new(
            "HostedZoneAlreadyExists",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneConfig" => Shape.new(
            "HostedZoneConfig",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "ResourceDescription",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "PrivateZone",
                "IsPrivateZone",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneCount" => Shape.new(
            "HostedZoneCount",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneFailureReasons" => Shape.new(
            "HostedZoneFailureReasons",
            "structure",
            [
              ShapeMember.new(
                "AcceleratedRecovery",
                "FailureReason",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneFeatures" => Shape.new(
            "HostedZoneFeatures",
            "structure",
            [
              ShapeMember.new(
                "AcceleratedRecoveryStatus",
                "AcceleratedRecoveryStatus",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "FailureReasons",
                "HostedZoneFailureReasons",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneLimit" => Shape.new(
            "HostedZoneLimit",
            "structure",
            [
              ShapeMember.new(
                "Type",
                "HostedZoneLimitType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Value",
                "LimitValue",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneLimitType" => Shape.new(
            "HostedZoneLimitType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneNotEmpty" => Shape.new(
            "HostedZoneNotEmpty",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneNotFound" => Shape.new(
            "HostedZoneNotFound",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneNotPrivate" => Shape.new(
            "HostedZoneNotPrivate",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneOwner" => Shape.new(
            "HostedZoneOwner",
            "structure",
            [
              ShapeMember.new(
                "OwningAccount",
                "AWSAccountID",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "OwningService",
                "HostedZoneOwningService",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneOwningService" => Shape.new(
            "HostedZoneOwningService",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "HostedZonePartiallyDelegated" => Shape.new(
            "HostedZonePartiallyDelegated",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneRRSetCount" => Shape.new(
            "HostedZoneRRSetCount",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneSummaries" => Shape.new(
            "HostedZoneSummaries",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "HostedZoneSummary",
              nil,
              "HostedZoneSummary",
              false
            ),
            false
          ),
          "HostedZoneSummary" => Shape.new(
            "HostedZoneSummary",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Owner",
                "HostedZoneOwner",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "HostedZoneType" => Shape.new(
            "HostedZoneType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "HostedZones" => Shape.new(
            "HostedZones",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "HostedZone",
              nil,
              "HostedZone",
              false
            ),
            false
          ),
          "IPAddress" => Shape.new(
            "IPAddress",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "IPAddressCidr" => Shape.new(
            "IPAddressCidr",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "IncompatibleVersion" => Shape.new(
            "IncompatibleVersion",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InsufficientCloudWatchLogsResourcePolicy" => Shape.new(
            "InsufficientCloudWatchLogsResourcePolicy",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InsufficientDataHealthStatus" => Shape.new(
            "InsufficientDataHealthStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "InvalidArgument" => Shape.new(
            "InvalidArgument",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidChangeBatch" => Shape.new(
            "InvalidChangeBatch",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "messages",
                "ErrorMessages",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidDomainName" => Shape.new(
            "InvalidDomainName",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidInput" => Shape.new(
            "InvalidInput",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidKMSArn" => Shape.new(
            "InvalidKMSArn",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidKeySigningKeyName" => Shape.new(
            "InvalidKeySigningKeyName",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidKeySigningKeyStatus" => Shape.new(
            "InvalidKeySigningKeyStatus",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidPaginationToken" => Shape.new(
            "InvalidPaginationToken",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidSigningStatus" => Shape.new(
            "InvalidSigningStatus",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidTrafficPolicyDocument" => Shape.new(
            "InvalidTrafficPolicyDocument",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "InvalidVPCId" => Shape.new(
            "InvalidVPCId",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Inverted" => Shape.new(
            "Inverted",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "IsPrivateZone" => Shape.new(
            "IsPrivateZone",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "KeySigningKey" => Shape.new(
            "KeySigningKey",
            "structure",
            [
              ShapeMember.new(
                "CreatedDate",
                "TimeStamp",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "DNSKEYRecord",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "DSRecord",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "DigestAlgorithmMnemonic",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "DigestAlgorithmType",
                "SigningKeyInteger",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "DigestValue",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Flag",
                "SigningKeyInteger",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "KeyTag",
                "SigningKeyTag",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "KmsArn",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LastModifiedDate",
                "TimeStamp",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "SigningKeyName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "PublicKey",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SigningAlgorithmMnemonic",
                "SigningKeyString",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SigningAlgorithmType",
                "SigningKeyInteger",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Status",
                "SigningKeyStatus",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "StatusMessage",
                "SigningKeyStatusMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "KeySigningKeyAlreadyExists" => Shape.new(
            "KeySigningKeyAlreadyExists",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "KeySigningKeyInParentDSRecord" => Shape.new(
            "KeySigningKeyInParentDSRecord",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "KeySigningKeyInUse" => Shape.new(
            "KeySigningKeyInUse",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "KeySigningKeyWithActiveStatusNotFound" => Shape.new(
            "KeySigningKeyWithActiveStatusNotFound",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "KeySigningKeys" => Shape.new(
            "KeySigningKeys",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "KeySigningKey",
              nil,
              nil,
              false
            ),
            false
          ),
          "LastVPCAssociation" => Shape.new(
            "LastVPCAssociation",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Latitude" => Shape.new(
            "Latitude",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "LimitValue" => Shape.new(
            "LimitValue",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "LimitsExceeded" => Shape.new(
            "LimitsExceeded",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "LinkedService" => Shape.new(
            "LinkedService",
            "structure",
            [
              ShapeMember.new(
                "Description",
                "ResourceDescription",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ServicePrincipal",
                "ServicePrincipal",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListCidrBlocksRequest" => Shape.new(
            "ListCidrBlocksRequest",
            "structure",
            [
              ShapeMember.new(
                "CollectionId",
                "UUID",
                "uri",
                "CidrCollectionId",
                false
              ),
              ShapeMember.new(
                "LocationName",
                "CidrLocationNameDefaultNotAllowed",
                "querystring",
                "location",
                false
              ),
              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxresults",
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                "querystring",
                "nexttoken",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListCidrBlocksResponse" => Shape.new(
            "ListCidrBlocksResponse",
            "structure",
            [
              ShapeMember.new(
                "CidrBlocks",
                "CidrBlockSummaries",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListCidrCollectionsRequest" => Shape.new(
            "ListCidrCollectionsRequest",
            "structure",
            [
              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxresults",
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                "querystring",
                "nexttoken",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListCidrCollectionsResponse" => Shape.new(
            "ListCidrCollectionsResponse",
            "structure",
            [
              ShapeMember.new(
                "CidrCollections",
                "CollectionSummaries",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListCidrLocationsRequest" => Shape.new(
            "ListCidrLocationsRequest",
            "structure",
            [
              ShapeMember.new(
                "CollectionId",
                "UUID",
                "uri",
                "CidrCollectionId",
                false
              ),
              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxresults",
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                "querystring",
                "nexttoken",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListCidrLocationsResponse" => Shape.new(
            "ListCidrLocationsResponse",
            "structure",
            [
              ShapeMember.new(
                "CidrLocations",
                "LocationSummaries",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListGeoLocationsRequest" => Shape.new(
            "ListGeoLocationsRequest",
            "structure",
            [
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "StartContinentCode",
                "GeoLocationContinentCode",
                "querystring",
                "startcontinentcode",
                false
              ),
              ShapeMember.new(
                "StartCountryCode",
                "GeoLocationCountryCode",
                "querystring",
                "startcountrycode",
                false
              ),
              ShapeMember.new(
                "StartSubdivisionCode",
                "GeoLocationSubdivisionCode",
                "querystring",
                "startsubdivisioncode",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListGeoLocationsResponse" => Shape.new(
            "ListGeoLocationsResponse",
            "structure",
            [
              ShapeMember.new(
                "GeoLocationDetailsList",
                "GeoLocationDetailsList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextContinentCode",
                "GeoLocationContinentCode",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextCountryCode",
                "GeoLocationCountryCode",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextSubdivisionCode",
                "GeoLocationSubdivisionCode",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHealthChecksRequest" => Shape.new(
            "ListHealthChecksRequest",
            "structure",
            [
              ShapeMember.new(
                "Marker",
                "PageMarker",
                "querystring",
                "marker",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHealthChecksResponse" => Shape.new(
            "ListHealthChecksResponse",
            "structure",
            [
              ShapeMember.new(
                "HealthChecks",
                "HealthChecks",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Marker",
                "PageMarker",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextMarker",
                "PageMarker",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHostedZonesByNameRequest" => Shape.new(
            "ListHostedZonesByNameRequest",
            "structure",
            [
              ShapeMember.new(
                "DNSName",
                "DNSName",
                "querystring",
                "dnsname",
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "querystring",
                "hostedzoneid",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHostedZonesByNameResponse" => Shape.new(
            "ListHostedZonesByNameResponse",
            "structure",
            [
              ShapeMember.new(
                "DNSName",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZones",
                "HostedZones",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextDNSName",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextHostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHostedZonesByVPCRequest" => Shape.new(
            "ListHostedZonesByVPCRequest",
            "structure",
            [
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                "querystring",
                "nexttoken",
                false
              ),
              ShapeMember.new(
                "VPCId",
                "VPCId",
                "querystring",
                "vpcid",
                false
              ),
              ShapeMember.new(
                "VPCRegion",
                "VPCRegion",
                "querystring",
                "vpcregion",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHostedZonesByVPCResponse" => Shape.new(
            "ListHostedZonesByVPCResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneSummaries",
                "HostedZoneSummaries",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHostedZonesRequest" => Shape.new(
            "ListHostedZonesRequest",
            "structure",
            [
              ShapeMember.new(
                "DelegationSetId",
                "ResourceId",
                "querystring",
                "delegationsetid",
                false
              ),
              ShapeMember.new(
                "HostedZoneType",
                "HostedZoneType",
                "querystring",
                "hostedzonetype",
                false
              ),
              ShapeMember.new(
                "Marker",
                "PageMarker",
                "querystring",
                "marker",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListHostedZonesResponse" => Shape.new(
            "ListHostedZonesResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZones",
                "HostedZones",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Marker",
                "PageMarker",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextMarker",
                "PageMarker",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListQueryLoggingConfigsRequest" => Shape.new(
            "ListQueryLoggingConfigsRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "querystring",
                "hostedzoneid",
                false
              ),
              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxresults",
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                "querystring",
                "nexttoken",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListQueryLoggingConfigsResponse" => Shape.new(
            "ListQueryLoggingConfigsResponse",
            "structure",
            [
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "QueryLoggingConfigs",
                "QueryLoggingConfigs",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListResourceRecordSetsRequest" => Shape.new(
            "ListResourceRecordSetsRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "StartRecordIdentifier",
                "ResourceRecordSetIdentifier",
                "querystring",
                "identifier",
                false
              ),
              ShapeMember.new(
                "StartRecordName",
                "DNSName",
                "querystring",
                "name",
                false
              ),
              ShapeMember.new(
                "StartRecordType",
                "RRType",
                "querystring",
                "type",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListResourceRecordSetsResponse" => Shape.new(
            "ListResourceRecordSetsResponse",
            "structure",
            [
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextRecordIdentifier",
                "ResourceRecordSetIdentifier",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextRecordName",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextRecordType",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourceRecordSets",
                "ResourceRecordSets",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListReusableDelegationSetsRequest" => Shape.new(
            "ListReusableDelegationSetsRequest",
            "structure",
            [
              ShapeMember.new(
                "Marker",
                "PageMarker",
                "querystring",
                "marker",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListReusableDelegationSetsResponse" => Shape.new(
            "ListReusableDelegationSetsResponse",
            "structure",
            [
              ShapeMember.new(
                "DelegationSets",
                "DelegationSets",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Marker",
                "PageMarker",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextMarker",
                "PageMarker",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTagsForResourceRequest" => Shape.new(
            "ListTagsForResourceRequest",
            "structure",
            [
              ShapeMember.new(
                "ResourceId",
                "TagResourceId",
                "uri",
                "ResourceId",
                false
              ),
              ShapeMember.new(
                "ResourceType",
                "TagResourceType",
                "uri",
                "ResourceType",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTagsForResourceResponse" => Shape.new(
            "ListTagsForResourceResponse",
            "structure",
            [
              ShapeMember.new(
                "ResourceTagSet",
                "ResourceTagSet",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTagsForResourcesRequest" => Shape.new(
            "ListTagsForResourcesRequest",
            "structure",
            [
              ShapeMember.new(
                "ResourceIds",
                "TagResourceIdList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourceType",
                "TagResourceType",
                "uri",
                "ResourceType",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTagsForResourcesResponse" => Shape.new(
            "ListTagsForResourcesResponse",
            "structure",
            [
              ShapeMember.new(
                "ResourceTagSets",
                "ResourceTagSetList",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPoliciesRequest" => Shape.new(
            "ListTrafficPoliciesRequest",
            "structure",
            [
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyIdMarker",
                "TrafficPolicyId",
                "querystring",
                "trafficpolicyid",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPoliciesResponse" => Shape.new(
            "ListTrafficPoliciesResponse",
            "structure",
            [
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyIdMarker",
                "TrafficPolicyId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicySummaries",
                "TrafficPolicySummaries",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyInstancesByHostedZoneRequest" => Shape.new(
            "ListTrafficPolicyInstancesByHostedZoneRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "querystring",
                "id",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceNameMarker",
                "DNSName",
                "querystring",
                "trafficpolicyinstancename",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceTypeMarker",
                "RRType",
                "querystring",
                "trafficpolicyinstancetype",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyInstancesByHostedZoneResponse" => Shape.new(
            "ListTrafficPolicyInstancesByHostedZoneResponse",
            "structure",
            [
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceNameMarker",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceTypeMarker",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstances",
                "TrafficPolicyInstances",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyInstancesByPolicyRequest" => Shape.new(
            "ListTrafficPolicyInstancesByPolicyRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneIdMarker",
                "ResourceId",
                "querystring",
                "hostedzoneid",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyId",
                "TrafficPolicyId",
                "querystring",
                "id",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceNameMarker",
                "DNSName",
                "querystring",
                "trafficpolicyinstancename",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceTypeMarker",
                "RRType",
                "querystring",
                "trafficpolicyinstancetype",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyVersion",
                "TrafficPolicyVersion",
                "querystring",
                "version",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyInstancesByPolicyResponse" => Shape.new(
            "ListTrafficPolicyInstancesByPolicyResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneIdMarker",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceNameMarker",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceTypeMarker",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstances",
                "TrafficPolicyInstances",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyInstancesRequest" => Shape.new(
            "ListTrafficPolicyInstancesRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneIdMarker",
                "ResourceId",
                "querystring",
                "hostedzoneid",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceNameMarker",
                "DNSName",
                "querystring",
                "trafficpolicyinstancename",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceTypeMarker",
                "RRType",
                "querystring",
                "trafficpolicyinstancetype",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyInstancesResponse" => Shape.new(
            "ListTrafficPolicyInstancesResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneIdMarker",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceNameMarker",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceTypeMarker",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstances",
                "TrafficPolicyInstances",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyVersionsRequest" => Shape.new(
            "ListTrafficPolicyVersionsRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "TrafficPolicyId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                "querystring",
                "maxitems",
                false
              ),
              ShapeMember.new(
                "TrafficPolicyVersionMarker",
                "TrafficPolicyVersionMarker",
                "querystring",
                "trafficpolicyversion",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListTrafficPolicyVersionsResponse" => Shape.new(
            "ListTrafficPolicyVersionsResponse",
            "structure",
            [
              ShapeMember.new(
                "IsTruncated",
                "PageTruncated",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MaxItems",
                "PageMaxItems",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicies",
                "TrafficPolicies",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyVersionMarker",
                "TrafficPolicyVersionMarker",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListVPCAssociationAuthorizationsRequest" => Shape.new(
            "ListVPCAssociationAuthorizationsRequest",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxresults",
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                "querystring",
                "nexttoken",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ListVPCAssociationAuthorizationsResponse" => Shape.new(
            "ListVPCAssociationAuthorizationsResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "NextToken",
                "PaginationToken",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "VPCs",
                "VPCs",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "LocalZoneGroup" => Shape.new(
            "LocalZoneGroup",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "LocationSummaries" => Shape.new(
            "LocationSummaries",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "LocationSummary",
              nil,
              nil,
              false
            ),
            false
          ),
          "LocationSummary" => Shape.new(
            "LocationSummary",
            "structure",
            [
              ShapeMember.new(
                "LocationName",
                "CidrLocationNameDefaultAllowed",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Longitude" => Shape.new(
            "Longitude",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "MaxResults" => Shape.new(
            "MaxResults",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "MeasureLatency" => Shape.new(
            "MeasureLatency",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "Message" => Shape.new(
            "Message",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "MetricName" => Shape.new(
            "MetricName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "Nameserver" => Shape.new(
            "Nameserver",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "Namespace" => Shape.new(
            "Namespace",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "NoSuchChange" => Shape.new(
            "NoSuchChange",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchCidrCollectionException" => Shape.new(
            "NoSuchCidrCollectionException",
            "structure",
            [
              ShapeMember.new(
                "Message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchCidrLocationException" => Shape.new(
            "NoSuchCidrLocationException",
            "structure",
            [
              ShapeMember.new(
                "Message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchCloudWatchLogsLogGroup" => Shape.new(
            "NoSuchCloudWatchLogsLogGroup",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchDelegationSet" => Shape.new(
            "NoSuchDelegationSet",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchGeoLocation" => Shape.new(
            "NoSuchGeoLocation",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchHealthCheck" => Shape.new(
            "NoSuchHealthCheck",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchHostedZone" => Shape.new(
            "NoSuchHostedZone",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchKeySigningKey" => Shape.new(
            "NoSuchKeySigningKey",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchQueryLoggingConfig" => Shape.new(
            "NoSuchQueryLoggingConfig",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchTrafficPolicy" => Shape.new(
            "NoSuchTrafficPolicy",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "NoSuchTrafficPolicyInstance" => Shape.new(
            "NoSuchTrafficPolicyInstance",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Nonce" => Shape.new(
            "Nonce",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "NotAuthorizedException" => Shape.new(
            "NotAuthorizedException",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "PageMarker" => Shape.new(
            "PageMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "PageMaxItems" => Shape.new(
            "PageMaxItems",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "PageTruncated" => Shape.new(
            "PageTruncated",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "PaginationToken" => Shape.new(
            "PaginationToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "Period" => Shape.new(
            "Period",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "Port" => Shape.new(
            "Port",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "PriorRequestNotComplete" => Shape.new(
            "PriorRequestNotComplete",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "PublicZoneVPCAssociation" => Shape.new(
            "PublicZoneVPCAssociation",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "QueryLoggingConfig" => Shape.new(
            "QueryLoggingConfig",
            "structure",
            [
              ShapeMember.new(
                "CloudWatchLogsLogGroupArn",
                "CloudWatchLogsLogGroupArn",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "QueryLoggingConfigId",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "QueryLoggingConfigAlreadyExists" => Shape.new(
            "QueryLoggingConfigAlreadyExists",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "QueryLoggingConfigId" => Shape.new(
            "QueryLoggingConfigId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "QueryLoggingConfigs" => Shape.new(
            "QueryLoggingConfigs",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "QueryLoggingConfig",
              nil,
              "QueryLoggingConfig",
              false
            ),
            false
          ),
          "RData" => Shape.new(
            "RData",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "RRType" => Shape.new(
            "RRType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "RecordData" => Shape.new(
            "RecordData",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "RecordDataEntry",
              nil,
              "RecordDataEntry",
              false
            ),
            false
          ),
          "RecordDataEntry" => Shape.new(
            "RecordDataEntry",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "RequestInterval" => Shape.new(
            "RequestInterval",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResettableElementName" => Shape.new(
            "ResettableElementName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResettableElementNameList" => Shape.new(
            "ResettableElementNameList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResettableElementName",
              nil,
              "ResettableElementName",
              false
            ),
            false
          ),
          "ResourceDescription" => Shape.new(
            "ResourceDescription",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourceId" => Shape.new(
            "ResourceId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourcePath" => Shape.new(
            "ResourcePath",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecord" => Shape.new(
            "ResourceRecord",
            "structure",
            [
              ShapeMember.new(
                "Value",
                "RData",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecordSet" => Shape.new(
            "ResourceRecordSet",
            "structure",
            [
              ShapeMember.new(
                "AliasTarget",
                "AliasTarget",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "CidrRoutingConfig",
                "CidrRoutingConfig",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Failover",
                "ResourceRecordSetFailover",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "GeoLocation",
                "GeoLocation",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "GeoProximityLocation",
                "GeoProximityLocation",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HealthCheckId",
                "HealthCheckId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "MultiValueAnswer",
                "ResourceRecordSetMultiValueAnswer",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Region",
                "ResourceRecordSetRegion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourceRecords",
                "ResourceRecords",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SetIdentifier",
                "ResourceRecordSetIdentifier",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TTL",
                "TTL",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyInstanceId",
                "TrafficPolicyInstanceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Type",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Weight",
                "ResourceRecordSetWeight",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecordSetFailover" => Shape.new(
            "ResourceRecordSetFailover",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecordSetIdentifier" => Shape.new(
            "ResourceRecordSetIdentifier",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecordSetMultiValueAnswer" => Shape.new(
            "ResourceRecordSetMultiValueAnswer",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecordSetRegion" => Shape.new(
            "ResourceRecordSetRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecordSetWeight" => Shape.new(
            "ResourceRecordSetWeight",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "ResourceRecordSets" => Shape.new(
            "ResourceRecordSets",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResourceRecordSet",
              nil,
              "ResourceRecordSet",
              false
            ),
            false
          ),
          "ResourceRecords" => Shape.new(
            "ResourceRecords",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResourceRecord",
              nil,
              "ResourceRecord",
              false
            ),
            false
          ),
          "ResourceTagSet" => Shape.new(
            "ResourceTagSet",
            "structure",
            [
              ShapeMember.new(
                "ResourceId",
                "TagResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourceType",
                "TagResourceType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ResourceTagSetList" => Shape.new(
            "ResourceTagSetList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResourceTagSet",
              nil,
              "ResourceTagSet",
              false
            ),
            false
          ),
          "ResourceURI" => Shape.new(
            "ResourceURI",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ReusableDelegationSetLimit" => Shape.new(
            "ReusableDelegationSetLimit",
            "structure",
            [
              ShapeMember.new(
                "Type",
                "ReusableDelegationSetLimitType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Value",
                "LimitValue",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "ReusableDelegationSetLimitType" => Shape.new(
            "ReusableDelegationSetLimitType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "RoutingControlArn" => Shape.new(
            "RoutingControlArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "SearchString" => Shape.new(
            "SearchString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ServeSignature" => Shape.new(
            "ServeSignature",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "ServicePrincipal" => Shape.new(
            "ServicePrincipal",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "SigningKeyInteger" => Shape.new(
            "SigningKeyInteger",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "SigningKeyName" => Shape.new(
            "SigningKeyName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "SigningKeyStatus" => Shape.new(
            "SigningKeyStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "SigningKeyStatusMessage" => Shape.new(
            "SigningKeyStatusMessage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "SigningKeyString" => Shape.new(
            "SigningKeyString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "SigningKeyTag" => Shape.new(
            "SigningKeyTag",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "Statistic" => Shape.new(
            "Statistic",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "Status" => Shape.new(
            "Status",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "StatusReport" => Shape.new(
            "StatusReport",
            "structure",
            [
              ShapeMember.new(
                "CheckedTime",
                "TimeStamp",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Status",
                "Status",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "SubnetMask" => Shape.new(
            "SubnetMask",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TTL" => Shape.new(
            "TTL",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "Tag" => Shape.new(
            "Tag",
            "structure",
            [
              ShapeMember.new(
                "Key",
                "TagKey",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Value",
                "TagValue",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TagKey" => Shape.new(
            "TagKey",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TagKeyList" => Shape.new(
            "TagKeyList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TagKey",
              nil,
              "Key",
              false
            ),
            false
          ),
          "TagList" => Shape.new(
            "TagList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Tag",
              nil,
              "Tag",
              false
            ),
            false
          ),
          "TagResourceId" => Shape.new(
            "TagResourceId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TagResourceIdList" => Shape.new(
            "TagResourceIdList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TagResourceId",
              nil,
              "ResourceId",
              false
            ),
            false
          ),
          "TagResourceType" => Shape.new(
            "TagResourceType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TagValue" => Shape.new(
            "TagValue",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TestDNSAnswerRequest" => Shape.new(
            "TestDNSAnswerRequest",
            "structure",
            [
              ShapeMember.new(
                "EDNS0ClientSubnetIP",
                "IPAddress",
                "querystring",
                "edns0clientsubnetip",
                false
              ),
              ShapeMember.new(
                "EDNS0ClientSubnetMask",
                "SubnetMask",
                "querystring",
                "edns0clientsubnetmask",
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "querystring",
                "hostedzoneid",
                false
              ),
              ShapeMember.new(
                "RecordName",
                "DNSName",
                "querystring",
                "recordname",
                false
              ),
              ShapeMember.new(
                "RecordType",
                "RRType",
                "querystring",
                "recordtype",
                false
              ),
              ShapeMember.new(
                "ResolverIP",
                "IPAddress",
                "querystring",
                "resolverip",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TestDNSAnswerResponse" => Shape.new(
            "TestDNSAnswerResponse",
            "structure",
            [
              ShapeMember.new(
                "Nameserver",
                "Nameserver",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Protocol",
                "TransportProtocol",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "RecordData",
                "RecordData",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "RecordName",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "RecordType",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResponseCode",
                "DNSRCode",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "Threshold" => Shape.new(
            "Threshold",
            "double",
            [] of ShapeMember,
            nil,
            false
          ),
          "ThrottlingException" => Shape.new(
            "ThrottlingException",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TimeStamp" => Shape.new(
            "TimeStamp",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),
          "TooManyHealthChecks" => Shape.new(
            "TooManyHealthChecks",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TooManyHostedZones" => Shape.new(
            "TooManyHostedZones",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TooManyKeySigningKeys" => Shape.new(
            "TooManyKeySigningKeys",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TooManyTrafficPolicies" => Shape.new(
            "TooManyTrafficPolicies",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TooManyTrafficPolicyInstances" => Shape.new(
            "TooManyTrafficPolicyInstances",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TooManyTrafficPolicyVersionsForCurrentPolicy" => Shape.new(
            "TooManyTrafficPolicyVersionsForCurrentPolicy",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TooManyVPCAssociationAuthorizations" => Shape.new(
            "TooManyVPCAssociationAuthorizations",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicies" => Shape.new(
            "TrafficPolicies",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TrafficPolicy",
              nil,
              "TrafficPolicy",
              false
            ),
            false
          ),
          "TrafficPolicy" => Shape.new(
            "TrafficPolicy",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "TrafficPolicyComment",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Document",
                "TrafficPolicyDocument",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "TrafficPolicyId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "TrafficPolicyName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Type",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Version",
                "TrafficPolicyVersion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyAlreadyExists" => Shape.new(
            "TrafficPolicyAlreadyExists",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyComment" => Shape.new(
            "TrafficPolicyComment",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyDocument" => Shape.new(
            "TrafficPolicyDocument",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyId" => Shape.new(
            "TrafficPolicyId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyInUse" => Shape.new(
            "TrafficPolicyInUse",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyInstance" => Shape.new(
            "TrafficPolicyInstance",
            "structure",
            [
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "TrafficPolicyInstanceId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Message",
                "Message",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "DNSName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "State",
                "TrafficPolicyInstanceState",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TTL",
                "TTL",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyId",
                "TrafficPolicyId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyType",
                "RRType",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyVersion",
                "TrafficPolicyVersion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyInstanceAlreadyExists" => Shape.new(
            "TrafficPolicyInstanceAlreadyExists",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyInstanceCount" => Shape.new(
            "TrafficPolicyInstanceCount",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyInstanceId" => Shape.new(
            "TrafficPolicyInstanceId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyInstanceState" => Shape.new(
            "TrafficPolicyInstanceState",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyInstances" => Shape.new(
            "TrafficPolicyInstances",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TrafficPolicyInstance",
              nil,
              "TrafficPolicyInstance",
              false
            ),
            false
          ),
          "TrafficPolicyName" => Shape.new(
            "TrafficPolicyName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicySummaries" => Shape.new(
            "TrafficPolicySummaries",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TrafficPolicySummary",
              nil,
              "TrafficPolicySummary",
              false
            ),
            false
          ),
          "TrafficPolicySummary" => Shape.new(
            "TrafficPolicySummary",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "TrafficPolicyId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "LatestVersion",
                "TrafficPolicyVersion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Name",
                "TrafficPolicyName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyCount",
                "TrafficPolicyVersion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Type",
                "RRType",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyVersion" => Shape.new(
            "TrafficPolicyVersion",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),
          "TrafficPolicyVersionMarker" => Shape.new(
            "TrafficPolicyVersionMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "TransportProtocol" => Shape.new(
            "TransportProtocol",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "UUID" => Shape.new(
            "UUID",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "UpdateHealthCheckRequest" => Shape.new(
            "UpdateHealthCheckRequest",
            "structure",
            [
              ShapeMember.new(
                "AlarmIdentifier",
                "AlarmIdentifier",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ChildHealthChecks",
                "ChildHealthCheckList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Disabled",
                "Disabled",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "EnableSNI",
                "EnableSNI",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "FailureThreshold",
                "FailureThreshold",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "FullyQualifiedDomainName",
                "FullyQualifiedDomainName",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HealthCheckId",
                "HealthCheckId",
                "uri",
                "HealthCheckId",
                false
              ),
              ShapeMember.new(
                "HealthCheckVersion",
                "HealthCheckVersion",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HealthThreshold",
                "HealthThreshold",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "IPAddress",
                "IPAddress",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "InsufficientDataHealthStatus",
                "InsufficientDataHealthStatus",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Inverted",
                "Inverted",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Port",
                "Port",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Regions",
                "HealthCheckRegionList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResetElements",
                "ResettableElementNameList",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "ResourcePath",
                "ResourcePath",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "SearchString",
                "SearchString",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateHealthCheckResponse" => Shape.new(
            "UpdateHealthCheckResponse",
            "structure",
            [
              ShapeMember.new(
                "HealthCheck",
                "HealthCheck",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateHostedZoneCommentRequest" => Shape.new(
            "UpdateHostedZoneCommentRequest",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "ResourceDescription",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateHostedZoneCommentResponse" => Shape.new(
            "UpdateHostedZoneCommentResponse",
            "structure",
            [
              ShapeMember.new(
                "HostedZone",
                "HostedZone",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateHostedZoneFeaturesRequest" => Shape.new(
            "UpdateHostedZoneFeaturesRequest",
            "structure",
            [
              ShapeMember.new(
                "EnableAcceleratedRecovery",
                "AcceleratedRecoveryEnabled",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "HostedZoneId",
                "ResourceId",
                "uri",
                "Id",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateHostedZoneFeaturesResponse" => Shape.new(
            "UpdateHostedZoneFeaturesResponse",
            "structure",
            [
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateTrafficPolicyCommentRequest" => Shape.new(
            "UpdateTrafficPolicyCommentRequest",
            "structure",
            [
              ShapeMember.new(
                "Comment",
                "TrafficPolicyComment",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "Id",
                "TrafficPolicyId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "Version",
                "TrafficPolicyVersion",
                "uri",
                "Version",
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateTrafficPolicyCommentResponse" => Shape.new(
            "UpdateTrafficPolicyCommentResponse",
            "structure",
            [
              ShapeMember.new(
                "TrafficPolicy",
                "TrafficPolicy",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateTrafficPolicyInstanceRequest" => Shape.new(
            "UpdateTrafficPolicyInstanceRequest",
            "structure",
            [
              ShapeMember.new(
                "Id",
                "TrafficPolicyInstanceId",
                "uri",
                "Id",
                false
              ),
              ShapeMember.new(
                "TTL",
                "TTL",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyId",
                "TrafficPolicyId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "TrafficPolicyVersion",
                "TrafficPolicyVersion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UpdateTrafficPolicyInstanceResponse" => Shape.new(
            "UpdateTrafficPolicyInstanceResponse",
            "structure",
            [
              ShapeMember.new(
                "TrafficPolicyInstance",
                "TrafficPolicyInstance",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "UsageCount" => Shape.new(
            "UsageCount",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),
          "VPC" => Shape.new(
            "VPC",
            "structure",
            [
              ShapeMember.new(
                "VPCId",
                "VPCId",
                nil,
                nil,
                false
              ),
              ShapeMember.new(
                "VPCRegion",
                "VPCRegion",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "VPCAssociationAuthorizationNotFound" => Shape.new(
            "VPCAssociationAuthorizationNotFound",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "VPCAssociationNotFound" => Shape.new(
            "VPCAssociationNotFound",
            "structure",
            [
              ShapeMember.new(
                "message",
                "ErrorMessage",
                nil,
                nil,
                false
              ),
            ] of ShapeMember,
            nil,
            false
          ),
          "VPCId" => Shape.new(
            "VPCId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "VPCRegion" => Shape.new(
            "VPCRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),
          "VPCs" => Shape.new(
            "VPCs",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "VPC",
              nil,
              "VPC",
              false
            ),
            false
          ),
        }

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : AwsSdk::Runtime::Http::Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          payload = input ? JSON.parse(input.to_json).as_h : {} of String => JSON::Any
          input_shape = OPERATION_INPUT_SHAPES[operation.name]?
          raise ArgumentError.new("input shape missing for #{operation.name}") if input && input_shape.nil?
          uri = endpoint.rstrip("/") + operation.request_uri
          uri = apply_uri_labels(uri, input_shape, payload) if input_shape
          params = URI::Params.new
          headers = {"content-type" => CONTENT_TYPE}
          apply_query_params(params, input_shape, payload) if input_shape
          apply_header_params(headers, input_shape, payload) if input_shape
          query = params.to_s
          uri = "#{uri}?#{query}" unless query.empty?
          body = if input_shape
            body_payload = body_payload(input_shape, payload)
            if body_payload.empty?
              nil
            else
              root_name = OPERATION_INPUT_ROOTS[operation.name]? || input_shape
              namespace = OPERATION_INPUT_NAMESPACES[operation.name]?
              build_xml(root_name, input_shape, body_payload, namespace)
            end
          else
            nil
          end
          AwsSdk::Runtime::Http::Request.new(operation.http_method, uri, headers, body)
        end

        def self.parse_error(response : AwsSdk::Runtime::Http::Response) : Exception
          error_type = error_type_from_body(response.body)
          message = error_message_from_body(response.body)
          Errors.build(error_type, message)
        end

        def self.parse_response(response : AwsSdk::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T
          payload = {} of String => JSON::Any
          output_shape = OPERATION_OUTPUT_SHAPES[operation_name]?
          if (body = response.body)
            document = XML.parse(body)
            node = result_node(document, operation_name) || document.root
            if node && output_shape
              parsed = parse_node(node, output_shape)
              payload = parsed.as_h? || payload
            end
          end
          apply_header_values(payload, output_shape, response.headers) if output_shape
          output_type.from_json(JSON::Any.new(payload).to_json)
        rescue XML::Error
          output_type.from_json("{}")
        end

        private def self.shape(name : String) : Shape
          SHAPES[name]? || raise ArgumentError.new("shape not found: #{name}")
        end

        private def self.member_key(member : ShapeMember) : String
          member.location_name || member.name
        end

        private def self.apply_uri_labels(uri : String, input_shape : String, payload : Hash(String, JSON::Any)) : String
          result = uri
          labels = uri.scan(/\{([^\}]+)\}/).map { |match| match[1] }
          return result if labels.empty?
          shape = shape(input_shape)
          labels.each do |label|
            member = shape.members.find { |item| item.location == "uri" && member_key(item) == label }
            raise ArgumentError.new("missing uri label #{label}") unless member
            value = payload[member_key(member)]?
            raise ArgumentError.new("missing value for uri label #{label}") unless value
            member_shape = shape(member.shape)
            result = result.gsub("{#{label}}", scalar_text(member_shape.type, value))
          end
          result
        end

        private def self.apply_query_params(params : URI::Params, input_shape : String, payload : Hash(String, JSON::Any)) : Nil
          shape = shape(input_shape)
          shape.members.each do |member|
            next unless member.location == "querystring"
            key = member_key(member)
            value = payload[key]?
            next unless value
            add_param(params, key, value)
          end
        end

        private def self.apply_header_params(headers : Hash(String, String), input_shape : String, payload : Hash(String, JSON::Any)) : Nil
          shape = shape(input_shape)
          shape.members.each do |member|
            next unless member.location == "header"
            key = member_key(member)
            value = payload[key]?
            next unless value
            headers[key] = scalar_text(shape(member.shape).type, value)
          end
        end

        private def self.body_payload(input_shape : String, payload : Hash(String, JSON::Any)) : Hash(String, JSON::Any)
          shape = shape(input_shape)
          return {} of String => JSON::Any unless shape.type == "structure"
          body = {} of String => JSON::Any
          shape.members.each do |member|
            next unless member.location.nil?
            key = member_key(member)
            value = payload[key]?
            next unless value
            next if value.raw.nil?
            body[key] = value
          end
          body
        end

        private def self.build_xml(root_name : String, root_shape : String, payload : Hash(String, JSON::Any), xml_namespace : String?) : String
          XML.build do |xml|
            shape = shape(root_shape)
            if xml_namespace
              xml.element(root_name, {"xmlns" => xml_namespace}) do
                serialize_structure(xml, shape, payload)
              end
            else
              xml.element(root_name) do
                serialize_structure(xml, shape, payload)
              end
            end
          end
        end

        private def self.serialize_structure(xml : XML::Builder, shape : Shape, payload : Hash(String, JSON::Any)) : Nil
          shape.members.each do |member|
            next unless member.location.nil?
            key = member_key(member)
            value = payload[key]?
            next unless value
            serialize_member(xml, member, value)
          end
        end

        private def self.serialize_member(xml : XML::Builder, member : ShapeMember, value : JSON::Any) : Nil
          shape = shape(member.shape)
          element_name = member_key(member)
          case shape.type
          when "structure"
            xml.element(element_name) do
              serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)
            end
          when "list"
            serialize_list(xml, element_name, shape, value, member.flattened)
          else
            xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }
          end
        end

        private def self.serialize_list(xml : XML::Builder, element_name : String, shape : Shape, value : JSON::Any, member_flattened : Bool) : Nil
          items = value.as_a? || [] of JSON::Any
          list_member = shape.list_member
          return unless list_member
          member_name = list_member.location_name || "member"
          flattened = shape.flattened || member_flattened
          if flattened
            items.each do |item|
              serialize_value(xml, member_name, list_member.shape, item)
            end
          else
            xml.element(element_name) do
              items.each do |item|
                serialize_value(xml, member_name, list_member.shape, item)
              end
            end
          end
        end

        private def self.serialize_value(xml : XML::Builder, element_name : String, shape_name : String, value : JSON::Any) : Nil
          shape = shape(shape_name)
          case shape.type
          when "structure"
            xml.element(element_name) do
              serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)
            end
          when "list"
            serialize_list(xml, element_name, shape, value, false)
          else
            xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }
          end
        end

        private def self.scalar_text(shape_type : String, value : JSON::Any) : String
          case value.raw
          when Nil
            ""
          when String
            value.as_s
          when Int64
            value.as_i.to_s
          when Float64
            value.as_f.to_s
          when Bool
            value.as_bool ? "true" : "false"
          else
            value.to_json
          end
        end

        private def self.parse_node(node : XML::Node, shape_name : String) : JSON::Any
          shape = shape(shape_name)
          case shape.type
          when "structure"
            JSON::Any.new(parse_structure(node, shape))
          when "list"
            JSON::Any.new(parse_list(node, shape))
          else
            parse_scalar(shape.type, node.content)
          end
        end

        private def self.parse_structure(node : XML::Node, shape : Shape) : Hash(String, JSON::Any)
          result = {} of String => JSON::Any
          shape.members.each do |member|
            next unless member.location.nil?
            shape_ref = shape(member.shape)
            key = member_key(member)
            if shape_ref.type == "list" && (shape_ref.flattened || member.flattened)
              list_member = shape_ref.list_member
              next unless list_member
              member_name = list_member.location_name || "member"
              items = node.children.select(&.element?).select { |child| child.name == member_name }
              values = items.map { |child| parse_node(child, list_member.shape) }
              result[key] = JSON::Any.new(values)
            else
              child = node.children.find { |item| item.element? && item.name == key }
              next unless child
              result[key] = parse_node(child, member.shape)
            end
          end
          result
        end

        private def self.parse_list(node : XML::Node, shape : Shape) : Array(JSON::Any)
          member = shape.list_member
          return [] of JSON::Any unless member
          member_name = member.location_name || "member"
          items = node.children.select(&.element?).select { |child| child.name == member_name }
          items.map { |child| parse_node(child, member.shape) }
        end

        private def self.parse_scalar(shape_type : String, value : String) : JSON::Any
          case shape_type
          when "integer", "short", "byte"
            JSON::Any.new(value.to_i)
          when "long", "bigInteger"
            JSON::Any.new(value.to_i64)
          when "float", "double", "bigDecimal"
            JSON::Any.new(value.to_f)
          when "boolean"
            JSON::Any.new(value.downcase == "true")
          else
            JSON::Any.new(value)
          end
        end

        private def self.apply_header_values(payload : Hash(String, JSON::Any), output_shape : String, headers : Hash(String, String)) : Nil
          shape = shape(output_shape)
          shape.members.each do |member|
            next unless member.location == "header"
            header_name = member_key(member)
            value = header_value(headers, header_name)
            next unless value
            payload[header_name] = parse_scalar(shape(member.shape).type, value)
          end
        end

        private def self.header_value(headers : Hash(String, String), name : String) : String?
          headers[name]? || headers[name.downcase]? || headers[name.upcase]? || headers.find { |key, _| key.downcase == name.downcase }.try(&.[1])
        end

        private def self.result_node(document : XML::Node, operation_name : String) : XML::Node?
          document.xpath_node("//*[local-name()=\"#{operation_name}Result\"]") ||
            document.xpath_node("//*[local-name()=\"#{operation_name}Response\"]")
        end

        private def self.add_param(params : URI::Params, key : String, value : JSON::Any) : Nil
          case value.raw
          when Nil
          when Array
            value.as_a.each do |item|
              add_param(params, key, item)
            end
          when Hash
            params.add(key, value.to_json)
          when String
            params.add(key, value.as_s)
          when Int64
            params.add(key, value.as_i.to_s)
          when Float64
            params.add(key, value.as_f.to_s)
          when Bool
            params.add(key, value.as_bool ? "true" : "false")
          else
            params.add(key, value.to_json)
          end
        end

        private def self.error_type_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Code")
          node.try(&.content)
        rescue XML::Error
          nil
        end

        private def self.error_message_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Message")
          node.try(&.content)
        rescue XML::Error
          nil
        end
      end
    end
  end
end
