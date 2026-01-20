require "json"
require "uri"
require "xml"
require "../../runtime"

module Aws
  module CloudFront
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


          "AssociateAlias" => "AssociateAliasRequest",


          "AssociateDistributionTenantWebACL" => "AssociateDistributionTenantWebACLRequest",


          "AssociateDistributionWebACL" => "AssociateDistributionWebACLRequest",


          "CopyDistribution" => "CopyDistributionRequest",


          "CreateAnycastIpList" => "CreateAnycastIpListRequest",


          "CreateCachePolicy" => "CreateCachePolicyRequest",


          "CreateCloudFrontOriginAccessIdentity" => "CreateCloudFrontOriginAccessIdentityRequest",


          "CreateConnectionFunction" => "CreateConnectionFunctionRequest",


          "CreateConnectionGroup" => "CreateConnectionGroupRequest",


          "CreateContinuousDeploymentPolicy" => "CreateContinuousDeploymentPolicyRequest",


          "CreateDistribution" => "CreateDistributionRequest",


          "CreateDistributionTenant" => "CreateDistributionTenantRequest",


          "CreateDistributionWithTags" => "CreateDistributionWithTagsRequest",


          "CreateFieldLevelEncryptionConfig" => "CreateFieldLevelEncryptionConfigRequest",


          "CreateFieldLevelEncryptionProfile" => "CreateFieldLevelEncryptionProfileRequest",


          "CreateFunction" => "CreateFunctionRequest",


          "CreateInvalidation" => "CreateInvalidationRequest",


          "CreateInvalidationForDistributionTenant" => "CreateInvalidationForDistributionTenantRequest",


          "CreateKeyGroup" => "CreateKeyGroupRequest",


          "CreateKeyValueStore" => "CreateKeyValueStoreRequest",


          "CreateMonitoringSubscription" => "CreateMonitoringSubscriptionRequest",


          "CreateOriginAccessControl" => "CreateOriginAccessControlRequest",


          "CreateOriginRequestPolicy" => "CreateOriginRequestPolicyRequest",


          "CreatePublicKey" => "CreatePublicKeyRequest",


          "CreateRealtimeLogConfig" => "CreateRealtimeLogConfigRequest",


          "CreateResponseHeadersPolicy" => "CreateResponseHeadersPolicyRequest",


          "CreateStreamingDistribution" => "CreateStreamingDistributionRequest",


          "CreateStreamingDistributionWithTags" => "CreateStreamingDistributionWithTagsRequest",


          "CreateTrustStore" => "CreateTrustStoreRequest",


          "CreateVpcOrigin" => "CreateVpcOriginRequest",


          "DeleteAnycastIpList" => "DeleteAnycastIpListRequest",


          "DeleteCachePolicy" => "DeleteCachePolicyRequest",


          "DeleteCloudFrontOriginAccessIdentity" => "DeleteCloudFrontOriginAccessIdentityRequest",


          "DeleteConnectionFunction" => "DeleteConnectionFunctionRequest",


          "DeleteConnectionGroup" => "DeleteConnectionGroupRequest",


          "DeleteContinuousDeploymentPolicy" => "DeleteContinuousDeploymentPolicyRequest",


          "DeleteDistribution" => "DeleteDistributionRequest",


          "DeleteDistributionTenant" => "DeleteDistributionTenantRequest",


          "DeleteFieldLevelEncryptionConfig" => "DeleteFieldLevelEncryptionConfigRequest",


          "DeleteFieldLevelEncryptionProfile" => "DeleteFieldLevelEncryptionProfileRequest",


          "DeleteFunction" => "DeleteFunctionRequest",


          "DeleteKeyGroup" => "DeleteKeyGroupRequest",


          "DeleteKeyValueStore" => "DeleteKeyValueStoreRequest",


          "DeleteMonitoringSubscription" => "DeleteMonitoringSubscriptionRequest",


          "DeleteOriginAccessControl" => "DeleteOriginAccessControlRequest",


          "DeleteOriginRequestPolicy" => "DeleteOriginRequestPolicyRequest",


          "DeletePublicKey" => "DeletePublicKeyRequest",


          "DeleteRealtimeLogConfig" => "DeleteRealtimeLogConfigRequest",


          "DeleteResourcePolicy" => "DeleteResourcePolicyRequest",


          "DeleteResponseHeadersPolicy" => "DeleteResponseHeadersPolicyRequest",


          "DeleteStreamingDistribution" => "DeleteStreamingDistributionRequest",


          "DeleteTrustStore" => "DeleteTrustStoreRequest",


          "DeleteVpcOrigin" => "DeleteVpcOriginRequest",


          "DescribeConnectionFunction" => "DescribeConnectionFunctionRequest",


          "DescribeFunction" => "DescribeFunctionRequest",


          "DescribeKeyValueStore" => "DescribeKeyValueStoreRequest",


          "DisassociateDistributionTenantWebACL" => "DisassociateDistributionTenantWebACLRequest",


          "DisassociateDistributionWebACL" => "DisassociateDistributionWebACLRequest",


          "GetAnycastIpList" => "GetAnycastIpListRequest",


          "GetCachePolicy" => "GetCachePolicyRequest",


          "GetCachePolicyConfig" => "GetCachePolicyConfigRequest",


          "GetCloudFrontOriginAccessIdentity" => "GetCloudFrontOriginAccessIdentityRequest",


          "GetCloudFrontOriginAccessIdentityConfig" => "GetCloudFrontOriginAccessIdentityConfigRequest",


          "GetConnectionFunction" => "GetConnectionFunctionRequest",


          "GetConnectionGroup" => "GetConnectionGroupRequest",


          "GetConnectionGroupByRoutingEndpoint" => "GetConnectionGroupByRoutingEndpointRequest",


          "GetContinuousDeploymentPolicy" => "GetContinuousDeploymentPolicyRequest",


          "GetContinuousDeploymentPolicyConfig" => "GetContinuousDeploymentPolicyConfigRequest",


          "GetDistribution" => "GetDistributionRequest",


          "GetDistributionConfig" => "GetDistributionConfigRequest",


          "GetDistributionTenant" => "GetDistributionTenantRequest",


          "GetDistributionTenantByDomain" => "GetDistributionTenantByDomainRequest",


          "GetFieldLevelEncryption" => "GetFieldLevelEncryptionRequest",


          "GetFieldLevelEncryptionConfig" => "GetFieldLevelEncryptionConfigRequest",


          "GetFieldLevelEncryptionProfile" => "GetFieldLevelEncryptionProfileRequest",


          "GetFieldLevelEncryptionProfileConfig" => "GetFieldLevelEncryptionProfileConfigRequest",


          "GetFunction" => "GetFunctionRequest",


          "GetInvalidation" => "GetInvalidationRequest",


          "GetInvalidationForDistributionTenant" => "GetInvalidationForDistributionTenantRequest",


          "GetKeyGroup" => "GetKeyGroupRequest",


          "GetKeyGroupConfig" => "GetKeyGroupConfigRequest",


          "GetManagedCertificateDetails" => "GetManagedCertificateDetailsRequest",


          "GetMonitoringSubscription" => "GetMonitoringSubscriptionRequest",


          "GetOriginAccessControl" => "GetOriginAccessControlRequest",


          "GetOriginAccessControlConfig" => "GetOriginAccessControlConfigRequest",


          "GetOriginRequestPolicy" => "GetOriginRequestPolicyRequest",


          "GetOriginRequestPolicyConfig" => "GetOriginRequestPolicyConfigRequest",


          "GetPublicKey" => "GetPublicKeyRequest",


          "GetPublicKeyConfig" => "GetPublicKeyConfigRequest",


          "GetRealtimeLogConfig" => "GetRealtimeLogConfigRequest",


          "GetResourcePolicy" => "GetResourcePolicyRequest",


          "GetResponseHeadersPolicy" => "GetResponseHeadersPolicyRequest",


          "GetResponseHeadersPolicyConfig" => "GetResponseHeadersPolicyConfigRequest",


          "GetStreamingDistribution" => "GetStreamingDistributionRequest",


          "GetStreamingDistributionConfig" => "GetStreamingDistributionConfigRequest",


          "GetTrustStore" => "GetTrustStoreRequest",


          "GetVpcOrigin" => "GetVpcOriginRequest",


          "ListAnycastIpLists" => "ListAnycastIpListsRequest",


          "ListCachePolicies" => "ListCachePoliciesRequest",


          "ListCloudFrontOriginAccessIdentities" => "ListCloudFrontOriginAccessIdentitiesRequest",


          "ListConflictingAliases" => "ListConflictingAliasesRequest",


          "ListConnectionFunctions" => "ListConnectionFunctionsRequest",


          "ListConnectionGroups" => "ListConnectionGroupsRequest",


          "ListContinuousDeploymentPolicies" => "ListContinuousDeploymentPoliciesRequest",


          "ListDistributionTenants" => "ListDistributionTenantsRequest",


          "ListDistributionTenantsByCustomization" => "ListDistributionTenantsByCustomizationRequest",


          "ListDistributions" => "ListDistributionsRequest",


          "ListDistributionsByAnycastIpListId" => "ListDistributionsByAnycastIpListIdRequest",


          "ListDistributionsByCachePolicyId" => "ListDistributionsByCachePolicyIdRequest",


          "ListDistributionsByConnectionFunction" => "ListDistributionsByConnectionFunctionRequest",


          "ListDistributionsByConnectionMode" => "ListDistributionsByConnectionModeRequest",


          "ListDistributionsByKeyGroup" => "ListDistributionsByKeyGroupRequest",


          "ListDistributionsByOriginRequestPolicyId" => "ListDistributionsByOriginRequestPolicyIdRequest",


          "ListDistributionsByOwnedResource" => "ListDistributionsByOwnedResourceRequest",


          "ListDistributionsByRealtimeLogConfig" => "ListDistributionsByRealtimeLogConfigRequest",


          "ListDistributionsByResponseHeadersPolicyId" => "ListDistributionsByResponseHeadersPolicyIdRequest",


          "ListDistributionsByTrustStore" => "ListDistributionsByTrustStoreRequest",


          "ListDistributionsByVpcOriginId" => "ListDistributionsByVpcOriginIdRequest",


          "ListDistributionsByWebACLId" => "ListDistributionsByWebACLIdRequest",


          "ListDomainConflicts" => "ListDomainConflictsRequest",


          "ListFieldLevelEncryptionConfigs" => "ListFieldLevelEncryptionConfigsRequest",


          "ListFieldLevelEncryptionProfiles" => "ListFieldLevelEncryptionProfilesRequest",


          "ListFunctions" => "ListFunctionsRequest",


          "ListInvalidations" => "ListInvalidationsRequest",


          "ListInvalidationsForDistributionTenant" => "ListInvalidationsForDistributionTenantRequest",


          "ListKeyGroups" => "ListKeyGroupsRequest",


          "ListKeyValueStores" => "ListKeyValueStoresRequest",


          "ListOriginAccessControls" => "ListOriginAccessControlsRequest",


          "ListOriginRequestPolicies" => "ListOriginRequestPoliciesRequest",


          "ListPublicKeys" => "ListPublicKeysRequest",


          "ListRealtimeLogConfigs" => "ListRealtimeLogConfigsRequest",


          "ListResponseHeadersPolicies" => "ListResponseHeadersPoliciesRequest",


          "ListStreamingDistributions" => "ListStreamingDistributionsRequest",


          "ListTagsForResource" => "ListTagsForResourceRequest",


          "ListTrustStores" => "ListTrustStoresRequest",


          "ListVpcOrigins" => "ListVpcOriginsRequest",


          "PublishConnectionFunction" => "PublishConnectionFunctionRequest",


          "PublishFunction" => "PublishFunctionRequest",


          "PutResourcePolicy" => "PutResourcePolicyRequest",


          "TagResource" => "TagResourceRequest",


          "TestConnectionFunction" => "TestConnectionFunctionRequest",


          "TestFunction" => "TestFunctionRequest",


          "UntagResource" => "UntagResourceRequest",


          "UpdateAnycastIpList" => "UpdateAnycastIpListRequest",


          "UpdateCachePolicy" => "UpdateCachePolicyRequest",


          "UpdateCloudFrontOriginAccessIdentity" => "UpdateCloudFrontOriginAccessIdentityRequest",


          "UpdateConnectionFunction" => "UpdateConnectionFunctionRequest",


          "UpdateConnectionGroup" => "UpdateConnectionGroupRequest",


          "UpdateContinuousDeploymentPolicy" => "UpdateContinuousDeploymentPolicyRequest",


          "UpdateDistribution" => "UpdateDistributionRequest",


          "UpdateDistributionTenant" => "UpdateDistributionTenantRequest",


          "UpdateDistributionWithStagingConfig" => "UpdateDistributionWithStagingConfigRequest",


          "UpdateDomainAssociation" => "UpdateDomainAssociationRequest",


          "UpdateFieldLevelEncryptionConfig" => "UpdateFieldLevelEncryptionConfigRequest",


          "UpdateFieldLevelEncryptionProfile" => "UpdateFieldLevelEncryptionProfileRequest",


          "UpdateFunction" => "UpdateFunctionRequest",


          "UpdateKeyGroup" => "UpdateKeyGroupRequest",


          "UpdateKeyValueStore" => "UpdateKeyValueStoreRequest",


          "UpdateOriginAccessControl" => "UpdateOriginAccessControlRequest",


          "UpdateOriginRequestPolicy" => "UpdateOriginRequestPolicyRequest",


          "UpdatePublicKey" => "UpdatePublicKeyRequest",


          "UpdateRealtimeLogConfig" => "UpdateRealtimeLogConfigRequest",


          "UpdateResponseHeadersPolicy" => "UpdateResponseHeadersPolicyRequest",


          "UpdateStreamingDistribution" => "UpdateStreamingDistributionRequest",


          "UpdateTrustStore" => "UpdateTrustStoreRequest",


          "UpdateVpcOrigin" => "UpdateVpcOriginRequest",


          "VerifyDnsConfiguration" => "VerifyDnsConfigurationRequest",

        }

        OPERATION_OUTPUT_SHAPES = {



          "AssociateDistributionTenantWebACL" => "AssociateDistributionTenantWebACLResult",


          "AssociateDistributionWebACL" => "AssociateDistributionWebACLResult",


          "CopyDistribution" => "CopyDistributionResult",


          "CreateAnycastIpList" => "CreateAnycastIpListResult",


          "CreateCachePolicy" => "CreateCachePolicyResult",


          "CreateCloudFrontOriginAccessIdentity" => "CreateCloudFrontOriginAccessIdentityResult",


          "CreateConnectionFunction" => "CreateConnectionFunctionResult",


          "CreateConnectionGroup" => "CreateConnectionGroupResult",


          "CreateContinuousDeploymentPolicy" => "CreateContinuousDeploymentPolicyResult",


          "CreateDistribution" => "CreateDistributionResult",


          "CreateDistributionTenant" => "CreateDistributionTenantResult",


          "CreateDistributionWithTags" => "CreateDistributionWithTagsResult",


          "CreateFieldLevelEncryptionConfig" => "CreateFieldLevelEncryptionConfigResult",


          "CreateFieldLevelEncryptionProfile" => "CreateFieldLevelEncryptionProfileResult",


          "CreateFunction" => "CreateFunctionResult",


          "CreateInvalidation" => "CreateInvalidationResult",


          "CreateInvalidationForDistributionTenant" => "CreateInvalidationForDistributionTenantResult",


          "CreateKeyGroup" => "CreateKeyGroupResult",


          "CreateKeyValueStore" => "CreateKeyValueStoreResult",


          "CreateMonitoringSubscription" => "CreateMonitoringSubscriptionResult",


          "CreateOriginAccessControl" => "CreateOriginAccessControlResult",


          "CreateOriginRequestPolicy" => "CreateOriginRequestPolicyResult",


          "CreatePublicKey" => "CreatePublicKeyResult",


          "CreateRealtimeLogConfig" => "CreateRealtimeLogConfigResult",


          "CreateResponseHeadersPolicy" => "CreateResponseHeadersPolicyResult",


          "CreateStreamingDistribution" => "CreateStreamingDistributionResult",


          "CreateStreamingDistributionWithTags" => "CreateStreamingDistributionWithTagsResult",


          "CreateTrustStore" => "CreateTrustStoreResult",


          "CreateVpcOrigin" => "CreateVpcOriginResult",















          "DeleteMonitoringSubscription" => "DeleteMonitoringSubscriptionResult",










          "DeleteVpcOrigin" => "DeleteVpcOriginResult",


          "DescribeConnectionFunction" => "DescribeConnectionFunctionResult",


          "DescribeFunction" => "DescribeFunctionResult",


          "DescribeKeyValueStore" => "DescribeKeyValueStoreResult",


          "DisassociateDistributionTenantWebACL" => "DisassociateDistributionTenantWebACLResult",


          "DisassociateDistributionWebACL" => "DisassociateDistributionWebACLResult",


          "GetAnycastIpList" => "GetAnycastIpListResult",


          "GetCachePolicy" => "GetCachePolicyResult",


          "GetCachePolicyConfig" => "GetCachePolicyConfigResult",


          "GetCloudFrontOriginAccessIdentity" => "GetCloudFrontOriginAccessIdentityResult",


          "GetCloudFrontOriginAccessIdentityConfig" => "GetCloudFrontOriginAccessIdentityConfigResult",


          "GetConnectionFunction" => "GetConnectionFunctionResult",


          "GetConnectionGroup" => "GetConnectionGroupResult",


          "GetConnectionGroupByRoutingEndpoint" => "GetConnectionGroupByRoutingEndpointResult",


          "GetContinuousDeploymentPolicy" => "GetContinuousDeploymentPolicyResult",


          "GetContinuousDeploymentPolicyConfig" => "GetContinuousDeploymentPolicyConfigResult",


          "GetDistribution" => "GetDistributionResult",


          "GetDistributionConfig" => "GetDistributionConfigResult",


          "GetDistributionTenant" => "GetDistributionTenantResult",


          "GetDistributionTenantByDomain" => "GetDistributionTenantByDomainResult",


          "GetFieldLevelEncryption" => "GetFieldLevelEncryptionResult",


          "GetFieldLevelEncryptionConfig" => "GetFieldLevelEncryptionConfigResult",


          "GetFieldLevelEncryptionProfile" => "GetFieldLevelEncryptionProfileResult",


          "GetFieldLevelEncryptionProfileConfig" => "GetFieldLevelEncryptionProfileConfigResult",


          "GetFunction" => "GetFunctionResult",


          "GetInvalidation" => "GetInvalidationResult",


          "GetInvalidationForDistributionTenant" => "GetInvalidationForDistributionTenantResult",


          "GetKeyGroup" => "GetKeyGroupResult",


          "GetKeyGroupConfig" => "GetKeyGroupConfigResult",


          "GetManagedCertificateDetails" => "GetManagedCertificateDetailsResult",


          "GetMonitoringSubscription" => "GetMonitoringSubscriptionResult",


          "GetOriginAccessControl" => "GetOriginAccessControlResult",


          "GetOriginAccessControlConfig" => "GetOriginAccessControlConfigResult",


          "GetOriginRequestPolicy" => "GetOriginRequestPolicyResult",


          "GetOriginRequestPolicyConfig" => "GetOriginRequestPolicyConfigResult",


          "GetPublicKey" => "GetPublicKeyResult",


          "GetPublicKeyConfig" => "GetPublicKeyConfigResult",


          "GetRealtimeLogConfig" => "GetRealtimeLogConfigResult",


          "GetResourcePolicy" => "GetResourcePolicyResult",


          "GetResponseHeadersPolicy" => "GetResponseHeadersPolicyResult",


          "GetResponseHeadersPolicyConfig" => "GetResponseHeadersPolicyConfigResult",


          "GetStreamingDistribution" => "GetStreamingDistributionResult",


          "GetStreamingDistributionConfig" => "GetStreamingDistributionConfigResult",


          "GetTrustStore" => "GetTrustStoreResult",


          "GetVpcOrigin" => "GetVpcOriginResult",


          "ListAnycastIpLists" => "ListAnycastIpListsResult",


          "ListCachePolicies" => "ListCachePoliciesResult",


          "ListCloudFrontOriginAccessIdentities" => "ListCloudFrontOriginAccessIdentitiesResult",


          "ListConflictingAliases" => "ListConflictingAliasesResult",


          "ListConnectionFunctions" => "ListConnectionFunctionsResult",


          "ListConnectionGroups" => "ListConnectionGroupsResult",


          "ListContinuousDeploymentPolicies" => "ListContinuousDeploymentPoliciesResult",


          "ListDistributionTenants" => "ListDistributionTenantsResult",


          "ListDistributionTenantsByCustomization" => "ListDistributionTenantsByCustomizationResult",


          "ListDistributions" => "ListDistributionsResult",


          "ListDistributionsByAnycastIpListId" => "ListDistributionsByAnycastIpListIdResult",


          "ListDistributionsByCachePolicyId" => "ListDistributionsByCachePolicyIdResult",


          "ListDistributionsByConnectionFunction" => "ListDistributionsByConnectionFunctionResult",


          "ListDistributionsByConnectionMode" => "ListDistributionsByConnectionModeResult",


          "ListDistributionsByKeyGroup" => "ListDistributionsByKeyGroupResult",


          "ListDistributionsByOriginRequestPolicyId" => "ListDistributionsByOriginRequestPolicyIdResult",


          "ListDistributionsByOwnedResource" => "ListDistributionsByOwnedResourceResult",


          "ListDistributionsByRealtimeLogConfig" => "ListDistributionsByRealtimeLogConfigResult",


          "ListDistributionsByResponseHeadersPolicyId" => "ListDistributionsByResponseHeadersPolicyIdResult",


          "ListDistributionsByTrustStore" => "ListDistributionsByTrustStoreResult",


          "ListDistributionsByVpcOriginId" => "ListDistributionsByVpcOriginIdResult",


          "ListDistributionsByWebACLId" => "ListDistributionsByWebACLIdResult",


          "ListDomainConflicts" => "ListDomainConflictsResult",


          "ListFieldLevelEncryptionConfigs" => "ListFieldLevelEncryptionConfigsResult",


          "ListFieldLevelEncryptionProfiles" => "ListFieldLevelEncryptionProfilesResult",


          "ListFunctions" => "ListFunctionsResult",


          "ListInvalidations" => "ListInvalidationsResult",


          "ListInvalidationsForDistributionTenant" => "ListInvalidationsForDistributionTenantResult",


          "ListKeyGroups" => "ListKeyGroupsResult",


          "ListKeyValueStores" => "ListKeyValueStoresResult",


          "ListOriginAccessControls" => "ListOriginAccessControlsResult",


          "ListOriginRequestPolicies" => "ListOriginRequestPoliciesResult",


          "ListPublicKeys" => "ListPublicKeysResult",


          "ListRealtimeLogConfigs" => "ListRealtimeLogConfigsResult",


          "ListResponseHeadersPolicies" => "ListResponseHeadersPoliciesResult",


          "ListStreamingDistributions" => "ListStreamingDistributionsResult",


          "ListTagsForResource" => "ListTagsForResourceResult",


          "ListTrustStores" => "ListTrustStoresResult",


          "ListVpcOrigins" => "ListVpcOriginsResult",


          "PublishConnectionFunction" => "PublishConnectionFunctionResult",


          "PublishFunction" => "PublishFunctionResult",


          "PutResourcePolicy" => "PutResourcePolicyResult",



          "TestConnectionFunction" => "TestConnectionFunctionResult",


          "TestFunction" => "TestFunctionResult",



          "UpdateAnycastIpList" => "UpdateAnycastIpListResult",


          "UpdateCachePolicy" => "UpdateCachePolicyResult",


          "UpdateCloudFrontOriginAccessIdentity" => "UpdateCloudFrontOriginAccessIdentityResult",


          "UpdateConnectionFunction" => "UpdateConnectionFunctionResult",


          "UpdateConnectionGroup" => "UpdateConnectionGroupResult",


          "UpdateContinuousDeploymentPolicy" => "UpdateContinuousDeploymentPolicyResult",


          "UpdateDistribution" => "UpdateDistributionResult",


          "UpdateDistributionTenant" => "UpdateDistributionTenantResult",


          "UpdateDistributionWithStagingConfig" => "UpdateDistributionWithStagingConfigResult",


          "UpdateDomainAssociation" => "UpdateDomainAssociationResult",


          "UpdateFieldLevelEncryptionConfig" => "UpdateFieldLevelEncryptionConfigResult",


          "UpdateFieldLevelEncryptionProfile" => "UpdateFieldLevelEncryptionProfileResult",


          "UpdateFunction" => "UpdateFunctionResult",


          "UpdateKeyGroup" => "UpdateKeyGroupResult",


          "UpdateKeyValueStore" => "UpdateKeyValueStoreResult",


          "UpdateOriginAccessControl" => "UpdateOriginAccessControlResult",


          "UpdateOriginRequestPolicy" => "UpdateOriginRequestPolicyResult",


          "UpdatePublicKey" => "UpdatePublicKeyResult",


          "UpdateRealtimeLogConfig" => "UpdateRealtimeLogConfigResult",


          "UpdateResponseHeadersPolicy" => "UpdateResponseHeadersPolicyResult",


          "UpdateStreamingDistribution" => "UpdateStreamingDistributionResult",


          "UpdateTrustStore" => "UpdateTrustStoreResult",


          "UpdateVpcOrigin" => "UpdateVpcOriginResult",


          "VerifyDnsConfiguration" => "VerifyDnsConfigurationResult",

        }

        OPERATION_INPUT_ROOTS = {



          "AssociateAlias" => "AssociateAliasRequest",



          "AssociateDistributionTenantWebACL" => "AssociateDistributionTenantWebACLRequest",



          "AssociateDistributionWebACL" => "AssociateDistributionWebACLRequest",



          "CopyDistribution" => "CopyDistributionRequest",



          "CreateAnycastIpList" => "CreateAnycastIpListRequest",



          "CreateCachePolicy" => "CreateCachePolicyRequest",



          "CreateCloudFrontOriginAccessIdentity" => "CreateCloudFrontOriginAccessIdentityRequest",



          "CreateConnectionFunction" => "CreateConnectionFunctionRequest",



          "CreateConnectionGroup" => "CreateConnectionGroupRequest",



          "CreateContinuousDeploymentPolicy" => "CreateContinuousDeploymentPolicyRequest",



          "CreateDistribution" => "CreateDistributionRequest",



          "CreateDistributionTenant" => "CreateDistributionTenantRequest",



          "CreateDistributionWithTags" => "CreateDistributionWithTagsRequest",



          "CreateFieldLevelEncryptionConfig" => "CreateFieldLevelEncryptionConfigRequest",



          "CreateFieldLevelEncryptionProfile" => "CreateFieldLevelEncryptionProfileRequest",



          "CreateFunction" => "CreateFunctionRequest",



          "CreateInvalidation" => "CreateInvalidationRequest",



          "CreateInvalidationForDistributionTenant" => "CreateInvalidationForDistributionTenantRequest",



          "CreateKeyGroup" => "CreateKeyGroupRequest",



          "CreateKeyValueStore" => "CreateKeyValueStoreRequest",



          "CreateMonitoringSubscription" => "CreateMonitoringSubscriptionRequest",



          "CreateOriginAccessControl" => "CreateOriginAccessControlRequest",



          "CreateOriginRequestPolicy" => "CreateOriginRequestPolicyRequest",



          "CreatePublicKey" => "CreatePublicKeyRequest",



          "CreateRealtimeLogConfig" => "CreateRealtimeLogConfigRequest",



          "CreateResponseHeadersPolicy" => "CreateResponseHeadersPolicyRequest",



          "CreateStreamingDistribution" => "CreateStreamingDistributionRequest",



          "CreateStreamingDistributionWithTags" => "CreateStreamingDistributionWithTagsRequest",



          "CreateTrustStore" => "CreateTrustStoreRequest",



          "CreateVpcOrigin" => "CreateVpcOriginRequest",



          "DeleteAnycastIpList" => "DeleteAnycastIpListRequest",



          "DeleteCachePolicy" => "DeleteCachePolicyRequest",



          "DeleteCloudFrontOriginAccessIdentity" => "DeleteCloudFrontOriginAccessIdentityRequest",



          "DeleteConnectionFunction" => "DeleteConnectionFunctionRequest",



          "DeleteConnectionGroup" => "DeleteConnectionGroupRequest",



          "DeleteContinuousDeploymentPolicy" => "DeleteContinuousDeploymentPolicyRequest",



          "DeleteDistribution" => "DeleteDistributionRequest",



          "DeleteDistributionTenant" => "DeleteDistributionTenantRequest",



          "DeleteFieldLevelEncryptionConfig" => "DeleteFieldLevelEncryptionConfigRequest",



          "DeleteFieldLevelEncryptionProfile" => "DeleteFieldLevelEncryptionProfileRequest",



          "DeleteFunction" => "DeleteFunctionRequest",



          "DeleteKeyGroup" => "DeleteKeyGroupRequest",



          "DeleteKeyValueStore" => "DeleteKeyValueStoreRequest",



          "DeleteMonitoringSubscription" => "DeleteMonitoringSubscriptionRequest",



          "DeleteOriginAccessControl" => "DeleteOriginAccessControlRequest",



          "DeleteOriginRequestPolicy" => "DeleteOriginRequestPolicyRequest",



          "DeletePublicKey" => "DeletePublicKeyRequest",



          "DeleteRealtimeLogConfig" => "DeleteRealtimeLogConfigRequest",



          "DeleteResourcePolicy" => "DeleteResourcePolicyRequest",



          "DeleteResponseHeadersPolicy" => "DeleteResponseHeadersPolicyRequest",



          "DeleteStreamingDistribution" => "DeleteStreamingDistributionRequest",



          "DeleteTrustStore" => "DeleteTrustStoreRequest",



          "DeleteVpcOrigin" => "DeleteVpcOriginRequest",



          "DescribeConnectionFunction" => "DescribeConnectionFunctionRequest",



          "DescribeFunction" => "DescribeFunctionRequest",



          "DescribeKeyValueStore" => "DescribeKeyValueStoreRequest",



          "DisassociateDistributionTenantWebACL" => "DisassociateDistributionTenantWebACLRequest",



          "DisassociateDistributionWebACL" => "DisassociateDistributionWebACLRequest",



          "GetAnycastIpList" => "GetAnycastIpListRequest",



          "GetCachePolicy" => "GetCachePolicyRequest",



          "GetCachePolicyConfig" => "GetCachePolicyConfigRequest",



          "GetCloudFrontOriginAccessIdentity" => "GetCloudFrontOriginAccessIdentityRequest",



          "GetCloudFrontOriginAccessIdentityConfig" => "GetCloudFrontOriginAccessIdentityConfigRequest",



          "GetConnectionFunction" => "GetConnectionFunctionRequest",



          "GetConnectionGroup" => "GetConnectionGroupRequest",



          "GetConnectionGroupByRoutingEndpoint" => "GetConnectionGroupByRoutingEndpointRequest",



          "GetContinuousDeploymentPolicy" => "GetContinuousDeploymentPolicyRequest",



          "GetContinuousDeploymentPolicyConfig" => "GetContinuousDeploymentPolicyConfigRequest",



          "GetDistribution" => "GetDistributionRequest",



          "GetDistributionConfig" => "GetDistributionConfigRequest",



          "GetDistributionTenant" => "GetDistributionTenantRequest",



          "GetDistributionTenantByDomain" => "GetDistributionTenantByDomainRequest",



          "GetFieldLevelEncryption" => "GetFieldLevelEncryptionRequest",



          "GetFieldLevelEncryptionConfig" => "GetFieldLevelEncryptionConfigRequest",



          "GetFieldLevelEncryptionProfile" => "GetFieldLevelEncryptionProfileRequest",



          "GetFieldLevelEncryptionProfileConfig" => "GetFieldLevelEncryptionProfileConfigRequest",



          "GetFunction" => "GetFunctionRequest",



          "GetInvalidation" => "GetInvalidationRequest",



          "GetInvalidationForDistributionTenant" => "GetInvalidationForDistributionTenantRequest",



          "GetKeyGroup" => "GetKeyGroupRequest",



          "GetKeyGroupConfig" => "GetKeyGroupConfigRequest",



          "GetManagedCertificateDetails" => "GetManagedCertificateDetailsRequest",



          "GetMonitoringSubscription" => "GetMonitoringSubscriptionRequest",



          "GetOriginAccessControl" => "GetOriginAccessControlRequest",



          "GetOriginAccessControlConfig" => "GetOriginAccessControlConfigRequest",



          "GetOriginRequestPolicy" => "GetOriginRequestPolicyRequest",



          "GetOriginRequestPolicyConfig" => "GetOriginRequestPolicyConfigRequest",



          "GetPublicKey" => "GetPublicKeyRequest",



          "GetPublicKeyConfig" => "GetPublicKeyConfigRequest",



          "GetRealtimeLogConfig" => "GetRealtimeLogConfigRequest",



          "GetResourcePolicy" => "GetResourcePolicyRequest",



          "GetResponseHeadersPolicy" => "GetResponseHeadersPolicyRequest",



          "GetResponseHeadersPolicyConfig" => "GetResponseHeadersPolicyConfigRequest",



          "GetStreamingDistribution" => "GetStreamingDistributionRequest",



          "GetStreamingDistributionConfig" => "GetStreamingDistributionConfigRequest",



          "GetTrustStore" => "GetTrustStoreRequest",



          "GetVpcOrigin" => "GetVpcOriginRequest",



          "ListAnycastIpLists" => "ListAnycastIpListsRequest",



          "ListCachePolicies" => "ListCachePoliciesRequest",



          "ListCloudFrontOriginAccessIdentities" => "ListCloudFrontOriginAccessIdentitiesRequest",



          "ListConflictingAliases" => "ListConflictingAliasesRequest",



          "ListConnectionFunctions" => "ListConnectionFunctionsRequest",



          "ListConnectionGroups" => "ListConnectionGroupsRequest",



          "ListContinuousDeploymentPolicies" => "ListContinuousDeploymentPoliciesRequest",



          "ListDistributionTenants" => "ListDistributionTenantsRequest",



          "ListDistributionTenantsByCustomization" => "ListDistributionTenantsByCustomizationRequest",



          "ListDistributions" => "ListDistributionsRequest",



          "ListDistributionsByAnycastIpListId" => "ListDistributionsByAnycastIpListIdRequest",



          "ListDistributionsByCachePolicyId" => "ListDistributionsByCachePolicyIdRequest",



          "ListDistributionsByConnectionFunction" => "ListDistributionsByConnectionFunctionRequest",



          "ListDistributionsByConnectionMode" => "ListDistributionsByConnectionModeRequest",



          "ListDistributionsByKeyGroup" => "ListDistributionsByKeyGroupRequest",



          "ListDistributionsByOriginRequestPolicyId" => "ListDistributionsByOriginRequestPolicyIdRequest",



          "ListDistributionsByOwnedResource" => "ListDistributionsByOwnedResourceRequest",



          "ListDistributionsByRealtimeLogConfig" => "ListDistributionsByRealtimeLogConfigRequest",



          "ListDistributionsByResponseHeadersPolicyId" => "ListDistributionsByResponseHeadersPolicyIdRequest",



          "ListDistributionsByTrustStore" => "ListDistributionsByTrustStoreRequest",



          "ListDistributionsByVpcOriginId" => "ListDistributionsByVpcOriginIdRequest",



          "ListDistributionsByWebACLId" => "ListDistributionsByWebACLIdRequest",



          "ListDomainConflicts" => "ListDomainConflictsRequest",



          "ListFieldLevelEncryptionConfigs" => "ListFieldLevelEncryptionConfigsRequest",



          "ListFieldLevelEncryptionProfiles" => "ListFieldLevelEncryptionProfilesRequest",



          "ListFunctions" => "ListFunctionsRequest",



          "ListInvalidations" => "ListInvalidationsRequest",



          "ListInvalidationsForDistributionTenant" => "ListInvalidationsForDistributionTenantRequest",



          "ListKeyGroups" => "ListKeyGroupsRequest",



          "ListKeyValueStores" => "ListKeyValueStoresRequest",



          "ListOriginAccessControls" => "ListOriginAccessControlsRequest",



          "ListOriginRequestPolicies" => "ListOriginRequestPoliciesRequest",



          "ListPublicKeys" => "ListPublicKeysRequest",



          "ListRealtimeLogConfigs" => "ListRealtimeLogConfigsRequest",



          "ListResponseHeadersPolicies" => "ListResponseHeadersPoliciesRequest",



          "ListStreamingDistributions" => "ListStreamingDistributionsRequest",



          "ListTagsForResource" => "ListTagsForResourceRequest",



          "ListTrustStores" => "ListTrustStoresRequest",



          "ListVpcOrigins" => "ListVpcOriginsRequest",



          "PublishConnectionFunction" => "PublishConnectionFunctionRequest",



          "PublishFunction" => "PublishFunctionRequest",



          "PutResourcePolicy" => "PutResourcePolicyRequest",



          "TagResource" => "TagResourceRequest",



          "TestConnectionFunction" => "TestConnectionFunctionRequest",



          "TestFunction" => "TestFunctionRequest",



          "UntagResource" => "UntagResourceRequest",



          "UpdateAnycastIpList" => "UpdateAnycastIpListRequest",



          "UpdateCachePolicy" => "UpdateCachePolicyRequest",



          "UpdateCloudFrontOriginAccessIdentity" => "UpdateCloudFrontOriginAccessIdentityRequest",



          "UpdateConnectionFunction" => "UpdateConnectionFunctionRequest",



          "UpdateConnectionGroup" => "UpdateConnectionGroupRequest",



          "UpdateContinuousDeploymentPolicy" => "UpdateContinuousDeploymentPolicyRequest",



          "UpdateDistribution" => "UpdateDistributionRequest",



          "UpdateDistributionTenant" => "UpdateDistributionTenantRequest",



          "UpdateDistributionWithStagingConfig" => "UpdateDistributionWithStagingConfigRequest",



          "UpdateDomainAssociation" => "UpdateDomainAssociationRequest",



          "UpdateFieldLevelEncryptionConfig" => "UpdateFieldLevelEncryptionConfigRequest",



          "UpdateFieldLevelEncryptionProfile" => "UpdateFieldLevelEncryptionProfileRequest",



          "UpdateFunction" => "UpdateFunctionRequest",



          "UpdateKeyGroup" => "UpdateKeyGroupRequest",



          "UpdateKeyValueStore" => "UpdateKeyValueStoreRequest",



          "UpdateOriginAccessControl" => "UpdateOriginAccessControlRequest",



          "UpdateOriginRequestPolicy" => "UpdateOriginRequestPolicyRequest",



          "UpdatePublicKey" => "UpdatePublicKeyRequest",



          "UpdateRealtimeLogConfig" => "UpdateRealtimeLogConfigRequest",



          "UpdateResponseHeadersPolicy" => "UpdateResponseHeadersPolicyRequest",



          "UpdateStreamingDistribution" => "UpdateStreamingDistributionRequest",



          "UpdateTrustStore" => "UpdateTrustStoreRequest",



          "UpdateVpcOrigin" => "UpdateVpcOriginRequest",



          "VerifyDnsConfiguration" => "VerifyDnsConfigurationRequest",

        }

        OPERATION_INPUT_NAMESPACES = {







          "AssociateDistributionTenantWebACL" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "AssociateDistributionWebACL" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "CopyDistribution" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "CreateAnycastIpList" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",










          "CreateConnectionFunction" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "CreateConnectionGroup" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",










          "CreateDistributionTenant" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",













          "CreateFunction" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",













          "CreateKeyValueStore" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",
















          "CreateRealtimeLogConfig" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",













          "CreateTrustStore" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "CreateVpcOrigin" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",























































          "DeleteRealtimeLogConfig" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "DeleteResourcePolicy" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




























































































































          "GetRealtimeLogConfig" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "GetResourcePolicy" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",


































          "ListConnectionFunctions" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "ListConnectionGroups" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",







          "ListDistributionTenants" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "ListDistributionTenantsByCustomization" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




























          "ListDistributionsByRealtimeLogConfig" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",
















          "ListDomainConflicts" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",














































          "ListTrustStores" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",













          "PutResourcePolicy" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",







          "TestConnectionFunction" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "TestFunction" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",







          "UpdateAnycastIpList" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",










          "UpdateConnectionFunction" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",




          "UpdateConnectionGroup" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",










          "UpdateDistributionTenant" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",







          "UpdateDomainAssociation" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",










          "UpdateFunction" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",







          "UpdateKeyValueStore" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",













          "UpdateRealtimeLogConfig" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",
















          "VerifyDnsConfiguration" => "http://cloudfront.amazonaws.com/doc/2020-05-31/",

        }

        SHAPES = {







          "AccessControlAllowHeadersList" => Shape.new(
            "AccessControlAllowHeadersList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Header",
              false
            ),
            false
          ),









          "AccessControlAllowMethodsList" => Shape.new(
            "AccessControlAllowMethodsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResponseHeadersPolicyAccessControlAllowMethodsValues",
              nil,
              "Method",
              false
            ),
            false
          ),









          "AccessControlAllowOriginsList" => Shape.new(
            "AccessControlAllowOriginsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Origin",
              false
            ),
            false
          ),









          "AccessControlExposeHeadersList" => Shape.new(
            "AccessControlExposeHeadersList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Header",
              false
            ),
            false
          ),





          "AccessDenied" => Shape.new(
            "AccessDenied",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ActiveTrustedKeyGroups" => Shape.new(
            "ActiveTrustedKeyGroups",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "KGKeyPairIdsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ActiveTrustedSigners" => Shape.new(
            "ActiveTrustedSigners",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "SignerList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AliasICPRecordal" => Shape.new(
            "AliasICPRecordal",
            "structure",
            [





              ShapeMember.new(
                "CNAME",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ICPRecordalStatus",
                "ICPRecordalStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "AliasICPRecordals" => Shape.new(
            "AliasICPRecordals",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "AliasICPRecordal",
              nil,
              "AliasICPRecordal",
              false
            ),
            false
          ),









          "AliasList" => Shape.new(
            "AliasList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "CNAME",
              false
            ),
            false
          ),





          "Aliases" => Shape.new(
            "Aliases",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "AliasList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AllowedMethods" => Shape.new(
            "AllowedMethods",
            "structure",
            [





              ShapeMember.new(
                "CachedMethods",
                "CachedMethods",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "MethodsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AnycastIpList" => Shape.new(
            "AnycastIpList",
            "structure",
            [





              ShapeMember.new(
                "AnycastIps",
                "AnycastIps",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpAddressType",
                "IpAddressType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpCount",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpamConfig",
                "IpamConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "AnycastIpListName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AnycastIpListCollection" => Shape.new(
            "AnycastIpListCollection",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "AnycastIpListSummaries",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AnycastIpListName" => Shape.new(
            "AnycastIpListName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "AnycastIpListSummaries" => Shape.new(
            "AnycastIpListSummaries",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "AnycastIpListSummary",
              nil,
              "AnycastIpListSummary",
              false
            ),
            false
          ),





          "AnycastIpListSummary" => Shape.new(
            "AnycastIpListSummary",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpAddressType",
                "IpAddressType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpCount",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpamConfig",
                "IpamConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "AnycastIpListName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "AnycastIps" => Shape.new(
            "AnycastIps",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "AnycastIp",
              false
            ),
            false
          ),





          "AssociateAliasRequest" => Shape.new(
            "AssociateAliasRequest",
            "structure",
            [





              ShapeMember.new(
                "Alias",
                "string",
                "querystring",
                "Alias",
                false
              ),





              ShapeMember.new(
                "TargetDistributionId",
                "string",
                "uri",
                "TargetDistributionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AssociateDistributionTenantWebACLRequest" => Shape.new(
            "AssociateDistributionTenantWebACLRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "WebACLArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AssociateDistributionTenantWebACLResult" => Shape.new(
            "AssociateDistributionTenantWebACLResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "WebACLArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AssociateDistributionWebACLRequest" => Shape.new(
            "AssociateDistributionWebACLRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "WebACLArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AssociateDistributionWebACLResult" => Shape.new(
            "AssociateDistributionWebACLResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "WebACLArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "AwsAccountNumberList" => Shape.new(
            "AwsAccountNumberList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "AwsAccountNumber",
              false
            ),
            false
          ),





          "BatchTooLarge" => Shape.new(
            "BatchTooLarge",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CNAMEAlreadyExists" => Shape.new(
            "CNAMEAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CaCertificatesBundleS3Location" => Shape.new(
            "CaCertificatesBundleS3Location",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Region",
                "CaCertificatesBundleS3LocationRegionString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Version",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CaCertificatesBundleS3LocationRegionString" => Shape.new(
            "CaCertificatesBundleS3LocationRegionString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CaCertificatesBundleSource" => Shape.new(
            "CaCertificatesBundleSource",
            "structure",
            [





              ShapeMember.new(
                "CaCertificatesBundleS3Location",
                "CaCertificatesBundleS3Location",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CacheBehavior" => Shape.new(
            "CacheBehavior",
            "structure",
            [





              ShapeMember.new(
                "AllowedMethods",
                "AllowedMethods",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CachePolicyId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Compress",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DefaultTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryptionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ForwardedValues",
                "ForwardedValues",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionAssociations",
                "FunctionAssociations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GrpcConfig",
                "GrpcConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LambdaFunctionAssociations",
                "LambdaFunctionAssociations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MinTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicyId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PathPattern",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RealtimeLogConfigArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicyId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SmoothStreaming",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TargetOriginId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustedKeyGroups",
                "TrustedKeyGroups",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustedSigners",
                "TrustedSigners",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ViewerProtocolPolicy",
                "ViewerProtocolPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CacheBehaviorList" => Shape.new(
            "CacheBehaviorList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CacheBehavior",
              nil,
              "CacheBehavior",
              false
            ),
            false
          ),





          "CacheBehaviors" => Shape.new(
            "CacheBehaviors",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "CacheBehaviorList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicy" => Shape.new(
            "CachePolicy",
            "structure",
            [





              ShapeMember.new(
                "CachePolicyConfig",
                "CachePolicyConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyAlreadyExists" => Shape.new(
            "CachePolicyAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyConfig" => Shape.new(
            "CachePolicyConfig",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DefaultTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MinTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ParametersInCacheKeyAndForwardedToOrigin",
                "ParametersInCacheKeyAndForwardedToOrigin",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyCookieBehavior" => Shape.new(
            "CachePolicyCookieBehavior",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyCookiesConfig" => Shape.new(
            "CachePolicyCookiesConfig",
            "structure",
            [





              ShapeMember.new(
                "CookieBehavior",
                "CachePolicyCookieBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Cookies",
                "CookieNames",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyHeaderBehavior" => Shape.new(
            "CachePolicyHeaderBehavior",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyHeadersConfig" => Shape.new(
            "CachePolicyHeadersConfig",
            "structure",
            [





              ShapeMember.new(
                "HeaderBehavior",
                "CachePolicyHeaderBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Headers",
                "Headers",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyInUse" => Shape.new(
            "CachePolicyInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyList" => Shape.new(
            "CachePolicyList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "CachePolicySummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyQueryStringBehavior" => Shape.new(
            "CachePolicyQueryStringBehavior",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CachePolicyQueryStringsConfig" => Shape.new(
            "CachePolicyQueryStringsConfig",
            "structure",
            [





              ShapeMember.new(
                "QueryStringBehavior",
                "CachePolicyQueryStringBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryStrings",
                "QueryStringNames",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CachePolicySummary" => Shape.new(
            "CachePolicySummary",
            "structure",
            [





              ShapeMember.new(
                "CachePolicy",
                "CachePolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "CachePolicyType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CachePolicySummaryList" => Shape.new(
            "CachePolicySummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CachePolicySummary",
              nil,
              "CachePolicySummary",
              false
            ),
            false
          ),





          "CachePolicyType" => Shape.new(
            "CachePolicyType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CachedMethods" => Shape.new(
            "CachedMethods",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "MethodsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CannotChangeImmutablePublicKeyFields" => Shape.new(
            "CannotChangeImmutablePublicKeyFields",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CannotDeleteEntityWhileInUse" => Shape.new(
            "CannotDeleteEntityWhileInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CannotUpdateEntityWhileInUse" => Shape.new(
            "CannotUpdateEntityWhileInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Certificate" => Shape.new(
            "Certificate",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CertificateSource" => Shape.new(
            "CertificateSource",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CertificateTransparencyLoggingPreference" => Shape.new(
            "CertificateTransparencyLoggingPreference",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CloudFrontOriginAccessIdentity" => Shape.new(
            "CloudFrontOriginAccessIdentity",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentityConfig",
                "CloudFrontOriginAccessIdentityConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3CanonicalUserId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CloudFrontOriginAccessIdentityAlreadyExists" => Shape.new(
            "CloudFrontOriginAccessIdentityAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CloudFrontOriginAccessIdentityConfig" => Shape.new(
            "CloudFrontOriginAccessIdentityConfig",
            "structure",
            [





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CloudFrontOriginAccessIdentityInUse" => Shape.new(
            "CloudFrontOriginAccessIdentityInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CloudFrontOriginAccessIdentityList" => Shape.new(
            "CloudFrontOriginAccessIdentityList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "CloudFrontOriginAccessIdentitySummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CloudFrontOriginAccessIdentitySummary" => Shape.new(
            "CloudFrontOriginAccessIdentitySummary",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3CanonicalUserId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CloudFrontOriginAccessIdentitySummaryList" => Shape.new(
            "CloudFrontOriginAccessIdentitySummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CloudFrontOriginAccessIdentitySummary",
              nil,
              "CloudFrontOriginAccessIdentitySummary",
              false
            ),
            false
          ),





          "CommentType" => Shape.new(
            "CommentType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ConflictingAlias" => Shape.new(
            "ConflictingAlias",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Alias",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ConflictingAliases" => Shape.new(
            "ConflictingAliases",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ConflictingAlias",
              nil,
              "ConflictingAlias",
              false
            ),
            false
          ),





          "ConflictingAliasesList" => Shape.new(
            "ConflictingAliasesList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "ConflictingAliases",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ConnectionFunctionAssociation" => Shape.new(
            "ConnectionFunctionAssociation",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "ResourceId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ConnectionFunctionSummary" => Shape.new(
            "ConnectionFunctionSummary",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionConfig",
                "FunctionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
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
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ConnectionFunctionSummaryList" => Shape.new(
            "ConnectionFunctionSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ConnectionFunctionSummary",
              nil,
              "ConnectionFunctionSummary",
              false
            ),
            false
          ),





          "ConnectionFunctionTestResult" => Shape.new(
            "ConnectionFunctionTestResult",
            "structure",
            [





              ShapeMember.new(
                "ComputeUtilization",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionErrorMessage",
                "sensitiveStringType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionExecutionLogs",
                "FunctionExecutionLogList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionOutput",
                "sensitiveStringType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionSummary",
                "ConnectionFunctionSummary",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ConnectionGroup" => Shape.new(
            "ConnectionGroup",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Ipv6Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsDefault",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RoutingEndpoint",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ConnectionGroupAssociationFilter" => Shape.new(
            "ConnectionGroupAssociationFilter",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ConnectionGroupSummary" => Shape.new(
            "ConnectionGroupSummary",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsDefault",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RoutingEndpoint",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ConnectionGroupSummaryList" => Shape.new(
            "ConnectionGroupSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ConnectionGroupSummary",
              nil,
              "ConnectionGroupSummary",
              false
            ),
            false
          ),





          "ConnectionMode" => Shape.new(
            "ConnectionMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentTypeProfile" => Shape.new(
            "ContentTypeProfile",
            "structure",
            [





              ShapeMember.new(
                "ContentType",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Format",
                "Format",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ProfileId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContentTypeProfileConfig" => Shape.new(
            "ContentTypeProfileConfig",
            "structure",
            [





              ShapeMember.new(
                "ContentTypeProfiles",
                "ContentTypeProfiles",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ForwardWhenContentTypeIsUnknown",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ContentTypeProfileList" => Shape.new(
            "ContentTypeProfileList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ContentTypeProfile",
              nil,
              "ContentTypeProfile",
              false
            ),
            false
          ),





          "ContentTypeProfiles" => Shape.new(
            "ContentTypeProfiles",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "ContentTypeProfileList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentPolicy" => Shape.new(
            "ContinuousDeploymentPolicy",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicyConfig",
                "ContinuousDeploymentPolicyConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentPolicyAlreadyExists" => Shape.new(
            "ContinuousDeploymentPolicyAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentPolicyConfig" => Shape.new(
            "ContinuousDeploymentPolicyConfig",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StagingDistributionDnsNames",
                "StagingDistributionDnsNames",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrafficConfig",
                "TrafficConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentPolicyInUse" => Shape.new(
            "ContinuousDeploymentPolicyInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentPolicyList" => Shape.new(
            "ContinuousDeploymentPolicyList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "ContinuousDeploymentPolicySummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentPolicySummary" => Shape.new(
            "ContinuousDeploymentPolicySummary",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicy",
                "ContinuousDeploymentPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ContinuousDeploymentPolicySummaryList" => Shape.new(
            "ContinuousDeploymentPolicySummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ContinuousDeploymentPolicySummary",
              nil,
              "ContinuousDeploymentPolicySummary",
              false
            ),
            false
          ),





          "ContinuousDeploymentPolicyType" => Shape.new(
            "ContinuousDeploymentPolicyType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentSingleHeaderConfig" => Shape.new(
            "ContinuousDeploymentSingleHeaderConfig",
            "structure",
            [





              ShapeMember.new(
                "Header",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ContinuousDeploymentSingleWeightConfig" => Shape.new(
            "ContinuousDeploymentSingleWeightConfig",
            "structure",
            [





              ShapeMember.new(
                "SessionStickinessConfig",
                "SessionStickinessConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Weight",
                "float",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CookieNameList" => Shape.new(
            "CookieNameList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Name",
              false
            ),
            false
          ),





          "CookieNames" => Shape.new(
            "CookieNames",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "CookieNameList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CookiePreference" => Shape.new(
            "CookiePreference",
            "structure",
            [





              ShapeMember.new(
                "Forward",
                "ItemSelection",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "WhitelistedNames",
                "CookieNames",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CopyDistributionRequest" => Shape.new(
            "CopyDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "PrimaryDistributionId",
                "string",
                "uri",
                "PrimaryDistributionId",
                false
              ),





              ShapeMember.new(
                "Staging",
                "boolean",
                "header",
                "Staging",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CopyDistributionResult" => Shape.new(
            "CopyDistributionResult",
            "structure",
            [





              ShapeMember.new(
                "Distribution",
                "Distribution",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAnycastIpListRequest" => Shape.new(
            "CreateAnycastIpListRequest",
            "structure",
            [





              ShapeMember.new(
                "IpAddressType",
                "IpAddressType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpCount",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpamCidrConfigs",
                "IpamCidrConfigList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "AnycastIpListName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAnycastIpListResult" => Shape.new(
            "CreateAnycastIpListResult",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpList",
                "AnycastIpList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateCachePolicyRequest" => Shape.new(
            "CreateCachePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "CachePolicyConfig",
                "CachePolicyConfig",
                nil,
                "CachePolicyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateCachePolicyResult" => Shape.new(
            "CreateCachePolicyResult",
            "structure",
            [





              ShapeMember.new(
                "CachePolicy",
                "CachePolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateCloudFrontOriginAccessIdentityRequest" => Shape.new(
            "CreateCloudFrontOriginAccessIdentityRequest",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentityConfig",
                "CloudFrontOriginAccessIdentityConfig",
                nil,
                "CloudFrontOriginAccessIdentityConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateCloudFrontOriginAccessIdentityResult" => Shape.new(
            "CreateCloudFrontOriginAccessIdentityResult",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentity",
                "CloudFrontOriginAccessIdentity",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateConnectionFunctionRequest" => Shape.new(
            "CreateConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionCode",
                "FunctionBlob",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionConfig",
                "FunctionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateConnectionFunctionResult" => Shape.new(
            "CreateConnectionFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionSummary",
                "ConnectionFunctionSummary",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateConnectionGroupRequest" => Shape.new(
            "CreateConnectionGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Ipv6Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateConnectionGroupResult" => Shape.new(
            "CreateConnectionGroupResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroup",
                "ConnectionGroup",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateContinuousDeploymentPolicyRequest" => Shape.new(
            "CreateContinuousDeploymentPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicyConfig",
                "ContinuousDeploymentPolicyConfig",
                nil,
                "ContinuousDeploymentPolicyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateContinuousDeploymentPolicyResult" => Shape.new(
            "CreateContinuousDeploymentPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicy",
                "ContinuousDeploymentPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateDistributionRequest" => Shape.new(
            "CreateDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionConfig",
                "DistributionConfig",
                nil,
                "DistributionConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateDistributionResult" => Shape.new(
            "CreateDistributionResult",
            "structure",
            [





              ShapeMember.new(
                "Distribution",
                "Distribution",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateDistributionTenantRequest" => Shape.new(
            "CreateDistributionTenantRequest",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroupId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Customizations",
                "Customizations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Domains",
                "DomainList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ManagedCertificateRequest",
                "ManagedCertificateRequest",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "CreateDistributionTenantRequestNameString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Parameters",
                "Parameters",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateDistributionTenantRequestNameString" => Shape.new(
            "CreateDistributionTenantRequestNameString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CreateDistributionTenantResult" => Shape.new(
            "CreateDistributionTenantResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionTenant",
                "DistributionTenant",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateDistributionWithTagsRequest" => Shape.new(
            "CreateDistributionWithTagsRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionConfigWithTags",
                "DistributionConfigWithTags",
                nil,
                "DistributionConfigWithTags",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateDistributionWithTagsResult" => Shape.new(
            "CreateDistributionWithTagsResult",
            "structure",
            [





              ShapeMember.new(
                "Distribution",
                "Distribution",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateFieldLevelEncryptionConfigRequest" => Shape.new(
            "CreateFieldLevelEncryptionConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionConfig",
                "FieldLevelEncryptionConfig",
                nil,
                "FieldLevelEncryptionConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateFieldLevelEncryptionConfigResult" => Shape.new(
            "CreateFieldLevelEncryptionConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryption",
                "FieldLevelEncryption",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateFieldLevelEncryptionProfileRequest" => Shape.new(
            "CreateFieldLevelEncryptionProfileRequest",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionProfileConfig",
                "FieldLevelEncryptionProfileConfig",
                nil,
                "FieldLevelEncryptionProfileConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateFieldLevelEncryptionProfileResult" => Shape.new(
            "CreateFieldLevelEncryptionProfileResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryptionProfile",
                "FieldLevelEncryptionProfile",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateFunctionRequest" => Shape.new(
            "CreateFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "FunctionCode",
                "FunctionBlob",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionConfig",
                "FunctionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateFunctionResult" => Shape.new(
            "CreateFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FunctionSummary",
                "FunctionSummary",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateInvalidationForDistributionTenantRequest" => Shape.new(
            "CreateInvalidationForDistributionTenantRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "InvalidationBatch",
                "InvalidationBatch",
                nil,
                "InvalidationBatch",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateInvalidationForDistributionTenantResult" => Shape.new(
            "CreateInvalidationForDistributionTenantResult",
            "structure",
            [





              ShapeMember.new(
                "Invalidation",
                "Invalidation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateInvalidationRequest" => Shape.new(
            "CreateInvalidationRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                "uri",
                "DistributionId",
                false
              ),





              ShapeMember.new(
                "InvalidationBatch",
                "InvalidationBatch",
                nil,
                "InvalidationBatch",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateInvalidationResult" => Shape.new(
            "CreateInvalidationResult",
            "structure",
            [





              ShapeMember.new(
                "Invalidation",
                "Invalidation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateKeyGroupRequest" => Shape.new(
            "CreateKeyGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "KeyGroupConfig",
                "KeyGroupConfig",
                nil,
                "KeyGroupConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateKeyGroupResult" => Shape.new(
            "CreateKeyGroupResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "KeyGroup",
                "KeyGroup",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateKeyValueStoreRequest" => Shape.new(
            "CreateKeyValueStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "KeyValueStoreComment",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ImportSource",
                "ImportSource",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "KeyValueStoreName",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateKeyValueStoreResult" => Shape.new(
            "CreateKeyValueStoreResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "KeyValueStore",
                "KeyValueStore",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateMonitoringSubscriptionRequest" => Shape.new(
            "CreateMonitoringSubscriptionRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                "uri",
                "DistributionId",
                false
              ),





              ShapeMember.new(
                "MonitoringSubscription",
                "MonitoringSubscription",
                nil,
                "MonitoringSubscription",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateMonitoringSubscriptionResult" => Shape.new(
            "CreateMonitoringSubscriptionResult",
            "structure",
            [





              ShapeMember.new(
                "MonitoringSubscription",
                "MonitoringSubscription",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateOriginAccessControlRequest" => Shape.new(
            "CreateOriginAccessControlRequest",
            "structure",
            [





              ShapeMember.new(
                "OriginAccessControlConfig",
                "OriginAccessControlConfig",
                nil,
                "OriginAccessControlConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateOriginAccessControlResult" => Shape.new(
            "CreateOriginAccessControlResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),





              ShapeMember.new(
                "OriginAccessControl",
                "OriginAccessControl",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateOriginRequestPolicyRequest" => Shape.new(
            "CreateOriginRequestPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "OriginRequestPolicyConfig",
                "OriginRequestPolicyConfig",
                nil,
                "OriginRequestPolicyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateOriginRequestPolicyResult" => Shape.new(
            "CreateOriginRequestPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicy",
                "OriginRequestPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreatePublicKeyRequest" => Shape.new(
            "CreatePublicKeyRequest",
            "structure",
            [





              ShapeMember.new(
                "PublicKeyConfig",
                "PublicKeyConfig",
                nil,
                "PublicKeyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreatePublicKeyResult" => Shape.new(
            "CreatePublicKeyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),





              ShapeMember.new(
                "PublicKey",
                "PublicKey",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateRealtimeLogConfigRequest" => Shape.new(
            "CreateRealtimeLogConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "EndPoints",
                "EndPointList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Fields",
                "FieldList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SamplingRate",
                "long",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateRealtimeLogConfigResult" => Shape.new(
            "CreateRealtimeLogConfigResult",
            "structure",
            [





              ShapeMember.new(
                "RealtimeLogConfig",
                "RealtimeLogConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateResponseHeadersPolicyRequest" => Shape.new(
            "CreateResponseHeadersPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "ResponseHeadersPolicyConfig",
                "ResponseHeadersPolicyConfig",
                nil,
                "ResponseHeadersPolicyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateResponseHeadersPolicyResult" => Shape.new(
            "CreateResponseHeadersPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicy",
                "ResponseHeadersPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateStreamingDistributionRequest" => Shape.new(
            "CreateStreamingDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "StreamingDistributionConfig",
                "StreamingDistributionConfig",
                nil,
                "StreamingDistributionConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateStreamingDistributionResult" => Shape.new(
            "CreateStreamingDistributionResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),





              ShapeMember.new(
                "StreamingDistribution",
                "StreamingDistribution",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateStreamingDistributionWithTagsRequest" => Shape.new(
            "CreateStreamingDistributionWithTagsRequest",
            "structure",
            [





              ShapeMember.new(
                "StreamingDistributionConfigWithTags",
                "StreamingDistributionConfigWithTags",
                nil,
                "StreamingDistributionConfigWithTags",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateStreamingDistributionWithTagsResult" => Shape.new(
            "CreateStreamingDistributionWithTagsResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),





              ShapeMember.new(
                "StreamingDistribution",
                "StreamingDistribution",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateTrustStoreRequest" => Shape.new(
            "CreateTrustStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "CaCertificatesBundleSource",
                "CaCertificatesBundleSource",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateTrustStoreResult" => Shape.new(
            "CreateTrustStoreResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "TrustStore",
                "TrustStore",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateVpcOriginRequest" => Shape.new(
            "CreateVpcOriginRequest",
            "structure",
            [





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VpcOriginEndpointConfig",
                "VpcOriginEndpointConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateVpcOriginResult" => Shape.new(
            "CreateVpcOriginResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Location",
                "string",
                "header",
                "Location",
                false
              ),





              ShapeMember.new(
                "VpcOrigin",
                "VpcOrigin",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CustomErrorResponse" => Shape.new(
            "CustomErrorResponse",
            "structure",
            [





              ShapeMember.new(
                "ErrorCachingMinTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ErrorCode",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResponseCode",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResponsePagePath",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CustomErrorResponseList" => Shape.new(
            "CustomErrorResponseList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CustomErrorResponse",
              nil,
              "CustomErrorResponse",
              false
            ),
            false
          ),





          "CustomErrorResponses" => Shape.new(
            "CustomErrorResponses",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "CustomErrorResponseList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CustomHeaders" => Shape.new(
            "CustomHeaders",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "OriginCustomHeadersList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CustomOriginConfig" => Shape.new(
            "CustomOriginConfig",
            "structure",
            [





              ShapeMember.new(
                "HTTPPort",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HTTPSPort",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpAddressType",
                "IpAddressType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginKeepaliveTimeout",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginProtocolPolicy",
                "OriginProtocolPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginReadTimeout",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginSslProtocols",
                "OriginSslProtocols",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CustomizationActionType" => Shape.new(
            "CustomizationActionType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Customizations" => Shape.new(
            "Customizations",
            "structure",
            [





              ShapeMember.new(
                "Certificate",
                "Certificate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GeoRestrictions",
                "GeoRestrictionCustomization",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "WebAcl",
                "WebAclCustomization",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DefaultCacheBehavior" => Shape.new(
            "DefaultCacheBehavior",
            "structure",
            [





              ShapeMember.new(
                "AllowedMethods",
                "AllowedMethods",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CachePolicyId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Compress",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DefaultTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryptionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ForwardedValues",
                "ForwardedValues",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionAssociations",
                "FunctionAssociations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GrpcConfig",
                "GrpcConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LambdaFunctionAssociations",
                "LambdaFunctionAssociations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MinTTL",
                "long",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicyId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RealtimeLogConfigArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicyId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SmoothStreaming",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TargetOriginId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustedKeyGroups",
                "TrustedKeyGroups",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustedSigners",
                "TrustedSigners",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ViewerProtocolPolicy",
                "ViewerProtocolPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAnycastIpListRequest" => Shape.new(
            "DeleteAnycastIpListRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteCachePolicyRequest" => Shape.new(
            "DeleteCachePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteCloudFrontOriginAccessIdentityRequest" => Shape.new(
            "DeleteCloudFrontOriginAccessIdentityRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteConnectionFunctionRequest" => Shape.new(
            "DeleteConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteConnectionGroupRequest" => Shape.new(
            "DeleteConnectionGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteContinuousDeploymentPolicyRequest" => Shape.new(
            "DeleteContinuousDeploymentPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteDistributionRequest" => Shape.new(
            "DeleteDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteDistributionTenantRequest" => Shape.new(
            "DeleteDistributionTenantRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteFieldLevelEncryptionConfigRequest" => Shape.new(
            "DeleteFieldLevelEncryptionConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteFieldLevelEncryptionProfileRequest" => Shape.new(
            "DeleteFieldLevelEncryptionProfileRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteFunctionRequest" => Shape.new(
            "DeleteFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                "uri",
                "Name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteKeyGroupRequest" => Shape.new(
            "DeleteKeyGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteKeyValueStoreRequest" => Shape.new(
            "DeleteKeyValueStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Name",
                "KeyValueStoreName",
                "uri",
                "Name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMonitoringSubscriptionRequest" => Shape.new(
            "DeleteMonitoringSubscriptionRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                "uri",
                "DistributionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMonitoringSubscriptionResult" => Shape.new(
            "DeleteMonitoringSubscriptionResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteOriginAccessControlRequest" => Shape.new(
            "DeleteOriginAccessControlRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteOriginRequestPolicyRequest" => Shape.new(
            "DeleteOriginRequestPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeletePublicKeyRequest" => Shape.new(
            "DeletePublicKeyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteRealtimeLogConfigRequest" => Shape.new(
            "DeleteRealtimeLogConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteResourcePolicyRequest" => Shape.new(
            "DeleteResourcePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "ResourceArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteResponseHeadersPolicyRequest" => Shape.new(
            "DeleteResponseHeadersPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteStreamingDistributionRequest" => Shape.new(
            "DeleteStreamingDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteTrustStoreRequest" => Shape.new(
            "DeleteTrustStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteVpcOriginRequest" => Shape.new(
            "DeleteVpcOriginRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteVpcOriginResult" => Shape.new(
            "DeleteVpcOriginResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "VpcOrigin",
                "VpcOrigin",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeConnectionFunctionRequest" => Shape.new(
            "DescribeConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "Identifier",
                "string",
                "uri",
                "Identifier",
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                "querystring",
                "Stage",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeConnectionFunctionResult" => Shape.new(
            "DescribeConnectionFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionSummary",
                "ConnectionFunctionSummary",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeFunctionRequest" => Shape.new(
            "DescribeFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "FunctionName",
                "uri",
                "Name",
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                "querystring",
                "Stage",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeFunctionResult" => Shape.new(
            "DescribeFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FunctionSummary",
                "FunctionSummary",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeKeyValueStoreRequest" => Shape.new(
            "DescribeKeyValueStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "KeyValueStoreName",
                "uri",
                "Name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeKeyValueStoreResult" => Shape.new(
            "DescribeKeyValueStoreResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "KeyValueStore",
                "KeyValueStore",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DisassociateDistributionTenantWebACLRequest" => Shape.new(
            "DisassociateDistributionTenantWebACLRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DisassociateDistributionTenantWebACLResult" => Shape.new(
            "DisassociateDistributionTenantWebACLResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DisassociateDistributionWebACLRequest" => Shape.new(
            "DisassociateDistributionWebACLRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DisassociateDistributionWebACLResult" => Shape.new(
            "DisassociateDistributionWebACLResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Distribution" => Shape.new(
            "Distribution",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ActiveTrustedKeyGroups",
                "ActiveTrustedKeyGroups",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ActiveTrustedSigners",
                "ActiveTrustedSigners",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AliasICPRecordals",
                "AliasICPRecordals",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionConfig",
                "DistributionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DomainName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InProgressInvalidationBatches",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionAlreadyExists" => Shape.new(
            "DistributionAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionConfig" => Shape.new(
            "DistributionConfig",
            "structure",
            [





              ShapeMember.new(
                "Aliases",
                "Aliases",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CacheBehaviors",
                "CacheBehaviors",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "CommentType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionAssociation",
                "ConnectionFunctionAssociation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionMode",
                "ConnectionMode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContinuousDeploymentPolicyId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CustomErrorResponses",
                "CustomErrorResponses",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DefaultCacheBehavior",
                "DefaultCacheBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DefaultRootObject",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HttpVersion",
                "HttpVersion",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsIPV6Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Logging",
                "LoggingConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginGroups",
                "OriginGroups",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Origins",
                "Origins",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PriceClass",
                "PriceClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Restrictions",
                "Restrictions",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Staging",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TenantConfig",
                "TenantConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ViewerCertificate",
                "ViewerCertificate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ViewerMtlsConfig",
                "ViewerMtlsConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "WebACLId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionConfigWithTags" => Shape.new(
            "DistributionConfigWithTags",
            "structure",
            [





              ShapeMember.new(
                "DistributionConfig",
                "DistributionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionIdList" => Shape.new(
            "DistributionIdList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "DistributionIdListSummary",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DistributionIdListSummary" => Shape.new(
            "DistributionIdListSummary",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "DistributionId",
              false
            ),
            false
          ),





          "DistributionIdOwner" => Shape.new(
            "DistributionIdOwner",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OwnerAccountId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DistributionIdOwnerItemList" => Shape.new(
            "DistributionIdOwnerItemList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DistributionIdOwner",
              nil,
              "DistributionIdOwner",
              false
            ),
            false
          ),





          "DistributionIdOwnerList" => Shape.new(
            "DistributionIdOwnerList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "DistributionIdOwnerItemList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionList" => Shape.new(
            "DistributionList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "DistributionSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionNotDisabled" => Shape.new(
            "DistributionNotDisabled",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionResourceId" => Shape.new(
            "DistributionResourceId",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionTenantId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionResourceType" => Shape.new(
            "DistributionResourceType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "DistributionSummary" => Shape.new(
            "DistributionSummary",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AliasICPRecordals",
                "AliasICPRecordals",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Aliases",
                "Aliases",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CacheBehaviors",
                "CacheBehaviors",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "sensitiveStringType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionAssociation",
                "ConnectionFunctionAssociation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionMode",
                "ConnectionMode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CustomErrorResponses",
                "CustomErrorResponses",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DefaultCacheBehavior",
                "DefaultCacheBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DomainName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HttpVersion",
                "HttpVersion",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsIPV6Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginGroups",
                "OriginGroups",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Origins",
                "Origins",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PriceClass",
                "PriceClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Restrictions",
                "Restrictions",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Staging",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ViewerCertificate",
                "ViewerCertificate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ViewerMtlsConfig",
                "ViewerMtlsConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "WebACLId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DistributionSummaryList" => Shape.new(
            "DistributionSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DistributionSummary",
              nil,
              "DistributionSummary",
              false
            ),
            false
          ),





          "DistributionTenant" => Shape.new(
            "DistributionTenant",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionGroupId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Customizations",
                "Customizations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Domains",
                "DomainResultList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Parameters",
                "Parameters",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DistributionTenantAssociationFilter" => Shape.new(
            "DistributionTenantAssociationFilter",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroupId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DistributionTenantList" => Shape.new(
            "DistributionTenantList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DistributionTenantSummary",
              nil,
              "DistributionTenantSummary",
              false
            ),
            false
          ),





          "DistributionTenantSummary" => Shape.new(
            "DistributionTenantSummary",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionGroupId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Customizations",
                "Customizations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Domains",
                "DomainResultList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DnsConfiguration" => Shape.new(
            "DnsConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Reason",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "DnsConfigurationStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DnsConfigurationList" => Shape.new(
            "DnsConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DnsConfiguration",
              nil,
              "DnsConfiguration",
              false
            ),
            false
          ),





          "DnsConfigurationStatus" => Shape.new(
            "DnsConfigurationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "DomainConflict" => Shape.new(
            "DomainConflict",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResourceId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResourceType",
                "DistributionResourceType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DomainConflictsList" => Shape.new(
            "DomainConflictsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DomainConflict",
              nil,
              "DomainConflicts",
              false
            ),
            false
          ),





          "DomainItem" => Shape.new(
            "DomainItem",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DomainList" => Shape.new(
            "DomainList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DomainItem",
              nil,
              nil,
              false
            ),
            false
          ),





          "DomainResult" => Shape.new(
            "DomainResult",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "DomainStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DomainResultList" => Shape.new(
            "DomainResultList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DomainResult",
              nil,
              nil,
              false
            ),
            false
          ),





          "DomainStatus" => Shape.new(
            "DomainStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "EncryptionEntities" => Shape.new(
            "EncryptionEntities",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "EncryptionEntityList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "EncryptionEntity" => Shape.new(
            "EncryptionEntity",
            "structure",
            [





              ShapeMember.new(
                "FieldPatterns",
                "FieldPatterns",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ProviderId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicKeyId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "EncryptionEntityList" => Shape.new(
            "EncryptionEntityList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "EncryptionEntity",
              nil,
              "EncryptionEntity",
              false
            ),
            false
          ),





          "EndPoint" => Shape.new(
            "EndPoint",
            "structure",
            [





              ShapeMember.new(
                "KinesisStreamConfig",
                "KinesisStreamConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StreamType",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "EndPointList" => Shape.new(
            "EndPointList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "EndPoint",
              nil,
              nil,
              false
            ),
            false
          ),





          "EntityAlreadyExists" => Shape.new(
            "EntityAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "EntityLimitExceeded" => Shape.new(
            "EntityLimitExceeded",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "EntityNotFound" => Shape.new(
            "EntityNotFound",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "EntitySizeLimitExceeded" => Shape.new(
            "EntitySizeLimitExceeded",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "EventType" => Shape.new(
            "EventType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryption" => Shape.new(
            "FieldLevelEncryption",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionConfig",
                "FieldLevelEncryptionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionConfig" => Shape.new(
            "FieldLevelEncryptionConfig",
            "structure",
            [





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentTypeProfileConfig",
                "ContentTypeProfileConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryArgProfileConfig",
                "QueryArgProfileConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionConfigAlreadyExists" => Shape.new(
            "FieldLevelEncryptionConfigAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionConfigInUse" => Shape.new(
            "FieldLevelEncryptionConfigInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionList" => Shape.new(
            "FieldLevelEncryptionList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "FieldLevelEncryptionSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionProfile" => Shape.new(
            "FieldLevelEncryptionProfile",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionProfileConfig",
                "FieldLevelEncryptionProfileConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionProfileAlreadyExists" => Shape.new(
            "FieldLevelEncryptionProfileAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionProfileConfig" => Shape.new(
            "FieldLevelEncryptionProfileConfig",
            "structure",
            [





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncryptionEntities",
                "EncryptionEntities",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionProfileInUse" => Shape.new(
            "FieldLevelEncryptionProfileInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionProfileList" => Shape.new(
            "FieldLevelEncryptionProfileList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "FieldLevelEncryptionProfileSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionProfileSizeExceeded" => Shape.new(
            "FieldLevelEncryptionProfileSizeExceeded",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FieldLevelEncryptionProfileSummary" => Shape.new(
            "FieldLevelEncryptionProfileSummary",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncryptionEntities",
                "EncryptionEntities",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "FieldLevelEncryptionProfileSummaryList" => Shape.new(
            "FieldLevelEncryptionProfileSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "FieldLevelEncryptionProfileSummary",
              nil,
              "FieldLevelEncryptionProfileSummary",
              false
            ),
            false
          ),





          "FieldLevelEncryptionSummary" => Shape.new(
            "FieldLevelEncryptionSummary",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentTypeProfileConfig",
                "ContentTypeProfileConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryArgProfileConfig",
                "QueryArgProfileConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "FieldLevelEncryptionSummaryList" => Shape.new(
            "FieldLevelEncryptionSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "FieldLevelEncryptionSummary",
              nil,
              "FieldLevelEncryptionSummary",
              false
            ),
            false
          ),









          "FieldList" => Shape.new(
            "FieldList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Field",
              false
            ),
            false
          ),









          "FieldPatternList" => Shape.new(
            "FieldPatternList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "FieldPattern",
              false
            ),
            false
          ),





          "FieldPatterns" => Shape.new(
            "FieldPatterns",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "FieldPatternList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Format" => Shape.new(
            "Format",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ForwardedValues" => Shape.new(
            "ForwardedValues",
            "structure",
            [





              ShapeMember.new(
                "Cookies",
                "CookiePreference",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Headers",
                "Headers",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryString",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryStringCacheKeys",
                "QueryStringCacheKeys",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FrameOptionsList" => Shape.new(
            "FrameOptionsList",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FunctionARN" => Shape.new(
            "FunctionARN",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FunctionAlreadyExists" => Shape.new(
            "FunctionAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FunctionAssociation" => Shape.new(
            "FunctionAssociation",
            "structure",
            [





              ShapeMember.new(
                "EventType",
                "EventType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionARN",
                "FunctionARN",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "FunctionAssociationList" => Shape.new(
            "FunctionAssociationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "FunctionAssociation",
              nil,
              "FunctionAssociation",
              false
            ),
            false
          ),





          "FunctionAssociations" => Shape.new(
            "FunctionAssociations",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "FunctionAssociationList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FunctionBlob" => Shape.new(
            "FunctionBlob",
            "blob",
            [] of ShapeMember,
            nil,
            false
          ),




          "FunctionConfig" => Shape.new(
            "FunctionConfig",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyValueStoreAssociations",
                "KeyValueStoreAssociations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Runtime",
                "FunctionRuntime",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FunctionEventObject" => Shape.new(
            "FunctionEventObject",
            "blob",
            [] of ShapeMember,
            nil,
            false
          ),








          "FunctionExecutionLogList" => Shape.new(
            "FunctionExecutionLogList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              nil,
              false
            ),
            false
          ),





          "FunctionInUse" => Shape.new(
            "FunctionInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FunctionList" => Shape.new(
            "FunctionList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "FunctionSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FunctionMetadata" => Shape.new(
            "FunctionMetadata",
            "structure",
            [





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FunctionName" => Shape.new(
            "FunctionName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FunctionRuntime" => Shape.new(
            "FunctionRuntime",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FunctionSizeLimitExceeded" => Shape.new(
            "FunctionSizeLimitExceeded",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "FunctionStage" => Shape.new(
            "FunctionStage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FunctionSummary" => Shape.new(
            "FunctionSummary",
            "structure",
            [





              ShapeMember.new(
                "FunctionConfig",
                "FunctionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionMetadata",
                "FunctionMetadata",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "FunctionSummaryList" => Shape.new(
            "FunctionSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "FunctionSummary",
              nil,
              "FunctionSummary",
              false
            ),
            false
          ),





          "GeoRestriction" => Shape.new(
            "GeoRestriction",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "LocationList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RestrictionType",
                "GeoRestrictionType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GeoRestrictionCustomization" => Shape.new(
            "GeoRestrictionCustomization",
            "structure",
            [





              ShapeMember.new(
                "Locations",
                "LocationList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RestrictionType",
                "GeoRestrictionType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GeoRestrictionType" => Shape.new(
            "GeoRestrictionType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GetAnycastIpListRequest" => Shape.new(
            "GetAnycastIpListRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAnycastIpListResult" => Shape.new(
            "GetAnycastIpListResult",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpList",
                "AnycastIpList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCachePolicyConfigRequest" => Shape.new(
            "GetCachePolicyConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCachePolicyConfigResult" => Shape.new(
            "GetCachePolicyConfigResult",
            "structure",
            [





              ShapeMember.new(
                "CachePolicyConfig",
                "CachePolicyConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCachePolicyRequest" => Shape.new(
            "GetCachePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCachePolicyResult" => Shape.new(
            "GetCachePolicyResult",
            "structure",
            [





              ShapeMember.new(
                "CachePolicy",
                "CachePolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCloudFrontOriginAccessIdentityConfigRequest" => Shape.new(
            "GetCloudFrontOriginAccessIdentityConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCloudFrontOriginAccessIdentityConfigResult" => Shape.new(
            "GetCloudFrontOriginAccessIdentityConfigResult",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentityConfig",
                "CloudFrontOriginAccessIdentityConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCloudFrontOriginAccessIdentityRequest" => Shape.new(
            "GetCloudFrontOriginAccessIdentityRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetCloudFrontOriginAccessIdentityResult" => Shape.new(
            "GetCloudFrontOriginAccessIdentityResult",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentity",
                "CloudFrontOriginAccessIdentity",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetConnectionFunctionRequest" => Shape.new(
            "GetConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "Identifier",
                "string",
                "uri",
                "Identifier",
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                "querystring",
                "Stage",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetConnectionFunctionResult" => Shape.new(
            "GetConnectionFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionCode",
                "FunctionBlob",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentType",
                "string",
                "header",
                "Content-Type",
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetConnectionGroupByRoutingEndpointRequest" => Shape.new(
            "GetConnectionGroupByRoutingEndpointRequest",
            "structure",
            [





              ShapeMember.new(
                "RoutingEndpoint",
                "string",
                "querystring",
                "RoutingEndpoint",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetConnectionGroupByRoutingEndpointResult" => Shape.new(
            "GetConnectionGroupByRoutingEndpointResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroup",
                "ConnectionGroup",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetConnectionGroupRequest" => Shape.new(
            "GetConnectionGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "Identifier",
                "string",
                "uri",
                "Identifier",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetConnectionGroupResult" => Shape.new(
            "GetConnectionGroupResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroup",
                "ConnectionGroup",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetContinuousDeploymentPolicyConfigRequest" => Shape.new(
            "GetContinuousDeploymentPolicyConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetContinuousDeploymentPolicyConfigResult" => Shape.new(
            "GetContinuousDeploymentPolicyConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicyConfig",
                "ContinuousDeploymentPolicyConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetContinuousDeploymentPolicyRequest" => Shape.new(
            "GetContinuousDeploymentPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetContinuousDeploymentPolicyResult" => Shape.new(
            "GetContinuousDeploymentPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicy",
                "ContinuousDeploymentPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionConfigRequest" => Shape.new(
            "GetDistributionConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionConfigResult" => Shape.new(
            "GetDistributionConfigResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionConfig",
                "DistributionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionRequest" => Shape.new(
            "GetDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionResult" => Shape.new(
            "GetDistributionResult",
            "structure",
            [





              ShapeMember.new(
                "Distribution",
                "Distribution",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionTenantByDomainRequest" => Shape.new(
            "GetDistributionTenantByDomainRequest",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                "querystring",
                "domain",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionTenantByDomainResult" => Shape.new(
            "GetDistributionTenantByDomainResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionTenant",
                "DistributionTenant",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionTenantRequest" => Shape.new(
            "GetDistributionTenantRequest",
            "structure",
            [





              ShapeMember.new(
                "Identifier",
                "string",
                "uri",
                "Identifier",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDistributionTenantResult" => Shape.new(
            "GetDistributionTenantResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionTenant",
                "DistributionTenant",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionConfigRequest" => Shape.new(
            "GetFieldLevelEncryptionConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionConfigResult" => Shape.new(
            "GetFieldLevelEncryptionConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryptionConfig",
                "FieldLevelEncryptionConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionProfileConfigRequest" => Shape.new(
            "GetFieldLevelEncryptionProfileConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionProfileConfigResult" => Shape.new(
            "GetFieldLevelEncryptionProfileConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryptionProfileConfig",
                "FieldLevelEncryptionProfileConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionProfileRequest" => Shape.new(
            "GetFieldLevelEncryptionProfileRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionProfileResult" => Shape.new(
            "GetFieldLevelEncryptionProfileResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryptionProfile",
                "FieldLevelEncryptionProfile",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionRequest" => Shape.new(
            "GetFieldLevelEncryptionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFieldLevelEncryptionResult" => Shape.new(
            "GetFieldLevelEncryptionResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryption",
                "FieldLevelEncryption",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFunctionRequest" => Shape.new(
            "GetFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "FunctionName",
                "uri",
                "Name",
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                "querystring",
                "Stage",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetFunctionResult" => Shape.new(
            "GetFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ContentType",
                "string",
                "header",
                "Content-Type",
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FunctionCode",
                "FunctionBlob",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetInvalidationForDistributionTenantRequest" => Shape.new(
            "GetInvalidationForDistributionTenantRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionTenantId",
                "string",
                "uri",
                "DistributionTenantId",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetInvalidationForDistributionTenantResult" => Shape.new(
            "GetInvalidationForDistributionTenantResult",
            "structure",
            [





              ShapeMember.new(
                "Invalidation",
                "Invalidation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetInvalidationRequest" => Shape.new(
            "GetInvalidationRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                "uri",
                "DistributionId",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetInvalidationResult" => Shape.new(
            "GetInvalidationResult",
            "structure",
            [





              ShapeMember.new(
                "Invalidation",
                "Invalidation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetKeyGroupConfigRequest" => Shape.new(
            "GetKeyGroupConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetKeyGroupConfigResult" => Shape.new(
            "GetKeyGroupConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "KeyGroupConfig",
                "KeyGroupConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetKeyGroupRequest" => Shape.new(
            "GetKeyGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetKeyGroupResult" => Shape.new(
            "GetKeyGroupResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "KeyGroup",
                "KeyGroup",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetManagedCertificateDetailsRequest" => Shape.new(
            "GetManagedCertificateDetailsRequest",
            "structure",
            [





              ShapeMember.new(
                "Identifier",
                "string",
                "uri",
                "Identifier",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetManagedCertificateDetailsResult" => Shape.new(
            "GetManagedCertificateDetailsResult",
            "structure",
            [





              ShapeMember.new(
                "ManagedCertificateDetails",
                "ManagedCertificateDetails",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMonitoringSubscriptionRequest" => Shape.new(
            "GetMonitoringSubscriptionRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                "uri",
                "DistributionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMonitoringSubscriptionResult" => Shape.new(
            "GetMonitoringSubscriptionResult",
            "structure",
            [





              ShapeMember.new(
                "MonitoringSubscription",
                "MonitoringSubscription",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginAccessControlConfigRequest" => Shape.new(
            "GetOriginAccessControlConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginAccessControlConfigResult" => Shape.new(
            "GetOriginAccessControlConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "OriginAccessControlConfig",
                "OriginAccessControlConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginAccessControlRequest" => Shape.new(
            "GetOriginAccessControlRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginAccessControlResult" => Shape.new(
            "GetOriginAccessControlResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "OriginAccessControl",
                "OriginAccessControl",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginRequestPolicyConfigRequest" => Shape.new(
            "GetOriginRequestPolicyConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginRequestPolicyConfigResult" => Shape.new(
            "GetOriginRequestPolicyConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicyConfig",
                "OriginRequestPolicyConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginRequestPolicyRequest" => Shape.new(
            "GetOriginRequestPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetOriginRequestPolicyResult" => Shape.new(
            "GetOriginRequestPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicy",
                "OriginRequestPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicKeyConfigRequest" => Shape.new(
            "GetPublicKeyConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicKeyConfigResult" => Shape.new(
            "GetPublicKeyConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "PublicKeyConfig",
                "PublicKeyConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicKeyRequest" => Shape.new(
            "GetPublicKeyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicKeyResult" => Shape.new(
            "GetPublicKeyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "PublicKey",
                "PublicKey",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetRealtimeLogConfigRequest" => Shape.new(
            "GetRealtimeLogConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetRealtimeLogConfigResult" => Shape.new(
            "GetRealtimeLogConfigResult",
            "structure",
            [





              ShapeMember.new(
                "RealtimeLogConfig",
                "RealtimeLogConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetResourcePolicyRequest" => Shape.new(
            "GetResourcePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "ResourceArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetResourcePolicyResult" => Shape.new(
            "GetResourcePolicyResult",
            "structure",
            [





              ShapeMember.new(
                "PolicyDocument",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResourceArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetResponseHeadersPolicyConfigRequest" => Shape.new(
            "GetResponseHeadersPolicyConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetResponseHeadersPolicyConfigResult" => Shape.new(
            "GetResponseHeadersPolicyConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicyConfig",
                "ResponseHeadersPolicyConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetResponseHeadersPolicyRequest" => Shape.new(
            "GetResponseHeadersPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetResponseHeadersPolicyResult" => Shape.new(
            "GetResponseHeadersPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicy",
                "ResponseHeadersPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStreamingDistributionConfigRequest" => Shape.new(
            "GetStreamingDistributionConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStreamingDistributionConfigResult" => Shape.new(
            "GetStreamingDistributionConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "StreamingDistributionConfig",
                "StreamingDistributionConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStreamingDistributionRequest" => Shape.new(
            "GetStreamingDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStreamingDistributionResult" => Shape.new(
            "GetStreamingDistributionResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "StreamingDistribution",
                "StreamingDistribution",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetTrustStoreRequest" => Shape.new(
            "GetTrustStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "Identifier",
                "string",
                "uri",
                "Identifier",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetTrustStoreResult" => Shape.new(
            "GetTrustStoreResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "TrustStore",
                "TrustStore",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetVpcOriginRequest" => Shape.new(
            "GetVpcOriginRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetVpcOriginResult" => Shape.new(
            "GetVpcOriginResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "VpcOrigin",
                "VpcOrigin",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GrpcConfig" => Shape.new(
            "GrpcConfig",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "HeaderList" => Shape.new(
            "HeaderList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Name",
              false
            ),
            false
          ),





          "Headers" => Shape.new(
            "Headers",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "HeaderList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "HttpVersion" => Shape.new(
            "HttpVersion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ICPRecordalStatus" => Shape.new(
            "ICPRecordalStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IllegalDelete" => Shape.new(
            "IllegalDelete",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior" => Shape.new(
            "IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IllegalOriginAccessConfiguration" => Shape.new(
            "IllegalOriginAccessConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IllegalUpdate" => Shape.new(
            "IllegalUpdate",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ImportSource" => Shape.new(
            "ImportSource",
            "structure",
            [





              ShapeMember.new(
                "SourceARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SourceType",
                "ImportSourceType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ImportSourceType" => Shape.new(
            "ImportSourceType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "InconsistentQuantities" => Shape.new(
            "InconsistentQuantities",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidArgument" => Shape.new(
            "InvalidArgument",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidAssociation" => Shape.new(
            "InvalidAssociation",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidDefaultRootObject" => Shape.new(
            "InvalidDefaultRootObject",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidDomainNameForOriginAccessControl" => Shape.new(
            "InvalidDomainNameForOriginAccessControl",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidErrorCode" => Shape.new(
            "InvalidErrorCode",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidForwardCookies" => Shape.new(
            "InvalidForwardCookies",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidFunctionAssociation" => Shape.new(
            "InvalidFunctionAssociation",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidGeoRestrictionParameter" => Shape.new(
            "InvalidGeoRestrictionParameter",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidHeadersForS3Origin" => Shape.new(
            "InvalidHeadersForS3Origin",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidIfMatchVersion" => Shape.new(
            "InvalidIfMatchVersion",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidLambdaFunctionAssociation" => Shape.new(
            "InvalidLambdaFunctionAssociation",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidLocationCode" => Shape.new(
            "InvalidLocationCode",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidMinimumProtocolVersion" => Shape.new(
            "InvalidMinimumProtocolVersion",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidOrigin" => Shape.new(
            "InvalidOrigin",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidOriginAccessControl" => Shape.new(
            "InvalidOriginAccessControl",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidOriginAccessIdentity" => Shape.new(
            "InvalidOriginAccessIdentity",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidOriginKeepaliveTimeout" => Shape.new(
            "InvalidOriginKeepaliveTimeout",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidOriginReadTimeout" => Shape.new(
            "InvalidOriginReadTimeout",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidProtocolSettings" => Shape.new(
            "InvalidProtocolSettings",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidQueryStringParameters" => Shape.new(
            "InvalidQueryStringParameters",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidRelativePath" => Shape.new(
            "InvalidRelativePath",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidRequiredProtocol" => Shape.new(
            "InvalidRequiredProtocol",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidResponseCode" => Shape.new(
            "InvalidResponseCode",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidTTLOrder" => Shape.new(
            "InvalidTTLOrder",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidTagging" => Shape.new(
            "InvalidTagging",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidViewerCertificate" => Shape.new(
            "InvalidViewerCertificate",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidWebACLId" => Shape.new(
            "InvalidWebACLId",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Invalidation" => Shape.new(
            "Invalidation",
            "structure",
            [





              ShapeMember.new(
                "CreateTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InvalidationBatch",
                "InvalidationBatch",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidationBatch" => Shape.new(
            "InvalidationBatch",
            "structure",
            [





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Paths",
                "Paths",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidationList" => Shape.new(
            "InvalidationList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "InvalidationSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidationSummary" => Shape.new(
            "InvalidationSummary",
            "structure",
            [





              ShapeMember.new(
                "CreateTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "InvalidationSummaryList" => Shape.new(
            "InvalidationSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "InvalidationSummary",
              nil,
              "InvalidationSummary",
              false
            ),
            false
          ),





          "IpAddressType" => Shape.new(
            "IpAddressType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IpamCidrConfig" => Shape.new(
            "IpamCidrConfig",
            "structure",
            [





              ShapeMember.new(
                "AnycastIp",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Cidr",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IpamPoolArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "IpamCidrStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "IpamCidrConfigList" => Shape.new(
            "IpamCidrConfigList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "IpamCidrConfig",
              nil,
              "IpamCidrConfig",
              false
            ),
            false
          ),





          "IpamCidrStatus" => Shape.new(
            "IpamCidrStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IpamConfig" => Shape.new(
            "IpamConfig",
            "structure",
            [





              ShapeMember.new(
                "IpamCidrConfigs",
                "IpamCidrConfigList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ItemSelection" => Shape.new(
            "ItemSelection",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "KGKeyPairIds" => Shape.new(
            "KGKeyPairIds",
            "structure",
            [





              ShapeMember.new(
                "KeyGroupId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyPairIds",
                "KeyPairIds",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "KGKeyPairIdsList" => Shape.new(
            "KGKeyPairIdsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "KGKeyPairIds",
              nil,
              "KeyGroup",
              false
            ),
            false
          ),





          "KeyGroup" => Shape.new(
            "KeyGroup",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyGroupConfig",
                "KeyGroupConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyGroupAlreadyExists" => Shape.new(
            "KeyGroupAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyGroupConfig" => Shape.new(
            "KeyGroupConfig",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "PublicKeyIdList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyGroupList" => Shape.new(
            "KeyGroupList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "KeyGroupSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyGroupSummary" => Shape.new(
            "KeyGroupSummary",
            "structure",
            [





              ShapeMember.new(
                "KeyGroup",
                "KeyGroup",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "KeyGroupSummaryList" => Shape.new(
            "KeyGroupSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "KeyGroupSummary",
              nil,
              "KeyGroupSummary",
              false
            ),
            false
          ),









          "KeyPairIdList" => Shape.new(
            "KeyPairIdList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "KeyPairId",
              false
            ),
            false
          ),





          "KeyPairIds" => Shape.new(
            "KeyPairIds",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "KeyPairIdList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyValueStore" => Shape.new(
            "KeyValueStore",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyValueStoreARN" => Shape.new(
            "KeyValueStoreARN",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "KeyValueStoreAssociation" => Shape.new(
            "KeyValueStoreAssociation",
            "structure",
            [





              ShapeMember.new(
                "KeyValueStoreARN",
                "KeyValueStoreARN",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "KeyValueStoreAssociationList" => Shape.new(
            "KeyValueStoreAssociationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "KeyValueStoreAssociation",
              nil,
              "KeyValueStoreAssociation",
              false
            ),
            false
          ),





          "KeyValueStoreAssociations" => Shape.new(
            "KeyValueStoreAssociations",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "KeyValueStoreAssociationList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyValueStoreComment" => Shape.new(
            "KeyValueStoreComment",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "KeyValueStoreList" => Shape.new(
            "KeyValueStoreList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "KeyValueStoreSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KeyValueStoreName" => Shape.new(
            "KeyValueStoreName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "KeyValueStoreSummaryList" => Shape.new(
            "KeyValueStoreSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "KeyValueStore",
              nil,
              "KeyValueStore",
              false
            ),
            false
          ),





          "KinesisStreamConfig" => Shape.new(
            "KinesisStreamConfig",
            "structure",
            [





              ShapeMember.new(
                "RoleARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StreamARN",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LambdaFunctionARN" => Shape.new(
            "LambdaFunctionARN",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LambdaFunctionAssociation" => Shape.new(
            "LambdaFunctionAssociation",
            "structure",
            [





              ShapeMember.new(
                "EventType",
                "EventType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IncludeBody",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LambdaFunctionARN",
                "LambdaFunctionARN",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "LambdaFunctionAssociationList" => Shape.new(
            "LambdaFunctionAssociationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "LambdaFunctionAssociation",
              nil,
              "LambdaFunctionAssociation",
              false
            ),
            false
          ),





          "LambdaFunctionAssociations" => Shape.new(
            "LambdaFunctionAssociations",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "LambdaFunctionAssociationList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAnycastIpListsRequest" => Shape.new(
            "ListAnycastIpListsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAnycastIpListsResult" => Shape.new(
            "ListAnycastIpListsResult",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpLists",
                "AnycastIpListCollection",
                nil,
                "AnycastIpListCollection",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListCachePoliciesRequest" => Shape.new(
            "ListCachePoliciesRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "Type",
                "CachePolicyType",
                "querystring",
                "Type",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListCachePoliciesResult" => Shape.new(
            "ListCachePoliciesResult",
            "structure",
            [





              ShapeMember.new(
                "CachePolicyList",
                "CachePolicyList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListCloudFrontOriginAccessIdentitiesRequest" => Shape.new(
            "ListCloudFrontOriginAccessIdentitiesRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListCloudFrontOriginAccessIdentitiesResult" => Shape.new(
            "ListCloudFrontOriginAccessIdentitiesResult",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentityList",
                "CloudFrontOriginAccessIdentityList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListConflictingAliasesRequest" => Shape.new(
            "ListConflictingAliasesRequest",
            "structure",
            [





              ShapeMember.new(
                "Alias",
                "aliasString",
                "querystring",
                "Alias",
                false
              ),





              ShapeMember.new(
                "DistributionId",
                "distributionIdString",
                "querystring",
                "DistributionId",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "listConflictingAliasesMaxItemsInteger",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListConflictingAliasesResult" => Shape.new(
            "ListConflictingAliasesResult",
            "structure",
            [





              ShapeMember.new(
                "ConflictingAliasesList",
                "ConflictingAliasesList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListConnectionFunctionsRequest" => Shape.new(
            "ListConnectionFunctionsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListConnectionFunctionsResult" => Shape.new(
            "ListConnectionFunctionsResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctions",
                "ConnectionFunctionSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListConnectionGroupsRequest" => Shape.new(
            "ListConnectionGroupsRequest",
            "structure",
            [





              ShapeMember.new(
                "AssociationFilter",
                "ConnectionGroupAssociationFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListConnectionGroupsResult" => Shape.new(
            "ListConnectionGroupsResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroups",
                "ConnectionGroupSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListContinuousDeploymentPoliciesRequest" => Shape.new(
            "ListContinuousDeploymentPoliciesRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListContinuousDeploymentPoliciesResult" => Shape.new(
            "ListContinuousDeploymentPoliciesResult",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicyList",
                "ContinuousDeploymentPolicyList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionTenantsByCustomizationRequest" => Shape.new(
            "ListDistributionTenantsByCustomizationRequest",
            "structure",
            [





              ShapeMember.new(
                "CertificateArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "WebACLArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionTenantsByCustomizationResult" => Shape.new(
            "ListDistributionTenantsByCustomizationResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionTenantList",
                "DistributionTenantList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionTenantsRequest" => Shape.new(
            "ListDistributionTenantsRequest",
            "structure",
            [





              ShapeMember.new(
                "AssociationFilter",
                "DistributionTenantAssociationFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionTenantsResult" => Shape.new(
            "ListDistributionTenantsResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionTenantList",
                "DistributionTenantList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByAnycastIpListIdRequest" => Shape.new(
            "ListDistributionsByAnycastIpListIdRequest",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                "uri",
                "AnycastIpListId",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByAnycastIpListIdResult" => Shape.new(
            "ListDistributionsByAnycastIpListIdResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByCachePolicyIdRequest" => Shape.new(
            "ListDistributionsByCachePolicyIdRequest",
            "structure",
            [





              ShapeMember.new(
                "CachePolicyId",
                "string",
                "uri",
                "CachePolicyId",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByCachePolicyIdResult" => Shape.new(
            "ListDistributionsByCachePolicyIdResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionIdList",
                "DistributionIdList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByConnectionFunctionRequest" => Shape.new(
            "ListDistributionsByConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionIdentifier",
                "string",
                "querystring",
                "ConnectionFunctionIdentifier",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByConnectionFunctionResult" => Shape.new(
            "ListDistributionsByConnectionFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByConnectionModeRequest" => Shape.new(
            "ListDistributionsByConnectionModeRequest",
            "structure",
            [





              ShapeMember.new(
                "ConnectionMode",
                "ConnectionMode",
                "uri",
                "ConnectionMode",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByConnectionModeResult" => Shape.new(
            "ListDistributionsByConnectionModeResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByKeyGroupRequest" => Shape.new(
            "ListDistributionsByKeyGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "KeyGroupId",
                "string",
                "uri",
                "KeyGroupId",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByKeyGroupResult" => Shape.new(
            "ListDistributionsByKeyGroupResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionIdList",
                "DistributionIdList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByOriginRequestPolicyIdRequest" => Shape.new(
            "ListDistributionsByOriginRequestPolicyIdRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicyId",
                "string",
                "uri",
                "OriginRequestPolicyId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByOriginRequestPolicyIdResult" => Shape.new(
            "ListDistributionsByOriginRequestPolicyIdResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionIdList",
                "DistributionIdList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByOwnedResourceRequest" => Shape.new(
            "ListDistributionsByOwnedResourceRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "ResourceArn",
                "string",
                "uri",
                "ResourceArn",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByOwnedResourceResult" => Shape.new(
            "ListDistributionsByOwnedResourceResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionIdOwnerList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByRealtimeLogConfigRequest" => Shape.new(
            "ListDistributionsByRealtimeLogConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RealtimeLogConfigArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RealtimeLogConfigName",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByRealtimeLogConfigResult" => Shape.new(
            "ListDistributionsByRealtimeLogConfigResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByResponseHeadersPolicyIdRequest" => Shape.new(
            "ListDistributionsByResponseHeadersPolicyIdRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicyId",
                "string",
                "uri",
                "ResponseHeadersPolicyId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByResponseHeadersPolicyIdResult" => Shape.new(
            "ListDistributionsByResponseHeadersPolicyIdResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionIdList",
                "DistributionIdList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByTrustStoreRequest" => Shape.new(
            "ListDistributionsByTrustStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "TrustStoreIdentifier",
                "string",
                "querystring",
                "TrustStoreIdentifier",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByTrustStoreResult" => Shape.new(
            "ListDistributionsByTrustStoreResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByVpcOriginIdRequest" => Shape.new(
            "ListDistributionsByVpcOriginIdRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "VpcOriginId",
                "string",
                "uri",
                "VpcOriginId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByVpcOriginIdResult" => Shape.new(
            "ListDistributionsByVpcOriginIdResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionIdList",
                "DistributionIdList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByWebACLIdRequest" => Shape.new(
            "ListDistributionsByWebACLIdRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "WebACLId",
                "string",
                "uri",
                "WebACLId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsByWebACLIdResult" => Shape.new(
            "ListDistributionsByWebACLIdResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsRequest" => Shape.new(
            "ListDistributionsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDistributionsResult" => Shape.new(
            "ListDistributionsResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionList",
                "DistributionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDomainConflictsRequest" => Shape.new(
            "ListDomainConflictsRequest",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DomainControlValidationResource",
                "DistributionResourceId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDomainConflictsResult" => Shape.new(
            "ListDomainConflictsResult",
            "structure",
            [





              ShapeMember.new(
                "DomainConflicts",
                "DomainConflictsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListFieldLevelEncryptionConfigsRequest" => Shape.new(
            "ListFieldLevelEncryptionConfigsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListFieldLevelEncryptionConfigsResult" => Shape.new(
            "ListFieldLevelEncryptionConfigsResult",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionList",
                "FieldLevelEncryptionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListFieldLevelEncryptionProfilesRequest" => Shape.new(
            "ListFieldLevelEncryptionProfilesRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListFieldLevelEncryptionProfilesResult" => Shape.new(
            "ListFieldLevelEncryptionProfilesResult",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionProfileList",
                "FieldLevelEncryptionProfileList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListFunctionsRequest" => Shape.new(
            "ListFunctionsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                "querystring",
                "Stage",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListFunctionsResult" => Shape.new(
            "ListFunctionsResult",
            "structure",
            [





              ShapeMember.new(
                "FunctionList",
                "FunctionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListInvalidationsForDistributionTenantRequest" => Shape.new(
            "ListInvalidationsForDistributionTenantRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListInvalidationsForDistributionTenantResult" => Shape.new(
            "ListInvalidationsForDistributionTenantResult",
            "structure",
            [





              ShapeMember.new(
                "InvalidationList",
                "InvalidationList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListInvalidationsRequest" => Shape.new(
            "ListInvalidationsRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionId",
                "string",
                "uri",
                "DistributionId",
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListInvalidationsResult" => Shape.new(
            "ListInvalidationsResult",
            "structure",
            [





              ShapeMember.new(
                "InvalidationList",
                "InvalidationList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListKeyGroupsRequest" => Shape.new(
            "ListKeyGroupsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListKeyGroupsResult" => Shape.new(
            "ListKeyGroupsResult",
            "structure",
            [





              ShapeMember.new(
                "KeyGroupList",
                "KeyGroupList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListKeyValueStoresRequest" => Shape.new(
            "ListKeyValueStoresRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                "querystring",
                "Status",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListKeyValueStoresResult" => Shape.new(
            "ListKeyValueStoresResult",
            "structure",
            [





              ShapeMember.new(
                "KeyValueStoreList",
                "KeyValueStoreList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListOriginAccessControlsRequest" => Shape.new(
            "ListOriginAccessControlsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListOriginAccessControlsResult" => Shape.new(
            "ListOriginAccessControlsResult",
            "structure",
            [





              ShapeMember.new(
                "OriginAccessControlList",
                "OriginAccessControlList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListOriginRequestPoliciesRequest" => Shape.new(
            "ListOriginRequestPoliciesRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "Type",
                "OriginRequestPolicyType",
                "querystring",
                "Type",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListOriginRequestPoliciesResult" => Shape.new(
            "ListOriginRequestPoliciesResult",
            "structure",
            [





              ShapeMember.new(
                "OriginRequestPolicyList",
                "OriginRequestPolicyList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListPublicKeysRequest" => Shape.new(
            "ListPublicKeysRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListPublicKeysResult" => Shape.new(
            "ListPublicKeysResult",
            "structure",
            [





              ShapeMember.new(
                "PublicKeyList",
                "PublicKeyList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListRealtimeLogConfigsRequest" => Shape.new(
            "ListRealtimeLogConfigsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListRealtimeLogConfigsResult" => Shape.new(
            "ListRealtimeLogConfigsResult",
            "structure",
            [





              ShapeMember.new(
                "RealtimeLogConfigs",
                "RealtimeLogConfigs",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListResponseHeadersPoliciesRequest" => Shape.new(
            "ListResponseHeadersPoliciesRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),





              ShapeMember.new(
                "Type",
                "ResponseHeadersPolicyType",
                "querystring",
                "Type",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListResponseHeadersPoliciesResult" => Shape.new(
            "ListResponseHeadersPoliciesResult",
            "structure",
            [





              ShapeMember.new(
                "ResponseHeadersPolicyList",
                "ResponseHeadersPolicyList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStreamingDistributionsRequest" => Shape.new(
            "ListStreamingDistributionsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStreamingDistributionsResult" => Shape.new(
            "ListStreamingDistributionsResult",
            "structure",
            [





              ShapeMember.new(
                "StreamingDistributionList",
                "StreamingDistributionList",
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
                "Resource",
                "ResourceARN",
                "querystring",
                "Resource",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListTagsForResourceResult" => Shape.new(
            "ListTagsForResourceResult",
            "structure",
            [





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListTrustStoresRequest" => Shape.new(
            "ListTrustStoresRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListTrustStoresResult" => Shape.new(
            "ListTrustStoresResult",
            "structure",
            [





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustStoreList",
                "TrustStoreList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListVpcOriginsRequest" => Shape.new(
            "ListVpcOriginsRequest",
            "structure",
            [





              ShapeMember.new(
                "Marker",
                "string",
                "querystring",
                "Marker",
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "string",
                "querystring",
                "MaxItems",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListVpcOriginsResult" => Shape.new(
            "ListVpcOriginsResult",
            "structure",
            [





              ShapeMember.new(
                "VpcOriginList",
                "VpcOriginList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "LocationList" => Shape.new(
            "LocationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Location",
              false
            ),
            false
          ),





          "LoggingConfig" => Shape.new(
            "LoggingConfig",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IncludeCookies",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ManagedCertificateDetails" => Shape.new(
            "ManagedCertificateDetails",
            "structure",
            [





              ShapeMember.new(
                "CertificateArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CertificateStatus",
                "ManagedCertificateStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ValidationTokenDetails",
                "ValidationTokenDetailList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ValidationTokenHost",
                "ValidationTokenHost",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ManagedCertificateRequest" => Shape.new(
            "ManagedCertificateRequest",
            "structure",
            [





              ShapeMember.new(
                "CertificateTransparencyLoggingPreference",
                "CertificateTransparencyLoggingPreference",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PrimaryDomainName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ValidationTokenHost",
                "ValidationTokenHost",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ManagedCertificateStatus" => Shape.new(
            "ManagedCertificateStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Method" => Shape.new(
            "Method",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "MethodsList" => Shape.new(
            "MethodsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Method",
              nil,
              "Method",
              false
            ),
            false
          ),





          "MinimumProtocolVersion" => Shape.new(
            "MinimumProtocolVersion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MissingBody" => Shape.new(
            "MissingBody",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MonitoringSubscription" => Shape.new(
            "MonitoringSubscription",
            "structure",
            [





              ShapeMember.new(
                "RealtimeMetricsSubscriptionConfig",
                "RealtimeMetricsSubscriptionConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MonitoringSubscriptionAlreadyExists" => Shape.new(
            "MonitoringSubscriptionAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchCachePolicy" => Shape.new(
            "NoSuchCachePolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchCloudFrontOriginAccessIdentity" => Shape.new(
            "NoSuchCloudFrontOriginAccessIdentity",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchContinuousDeploymentPolicy" => Shape.new(
            "NoSuchContinuousDeploymentPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchDistribution" => Shape.new(
            "NoSuchDistribution",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchFieldLevelEncryptionConfig" => Shape.new(
            "NoSuchFieldLevelEncryptionConfig",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchFieldLevelEncryptionProfile" => Shape.new(
            "NoSuchFieldLevelEncryptionProfile",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchFunctionExists" => Shape.new(
            "NoSuchFunctionExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchInvalidation" => Shape.new(
            "NoSuchInvalidation",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchMonitoringSubscription" => Shape.new(
            "NoSuchMonitoringSubscription",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchOrigin" => Shape.new(
            "NoSuchOrigin",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchOriginAccessControl" => Shape.new(
            "NoSuchOriginAccessControl",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchOriginRequestPolicy" => Shape.new(
            "NoSuchOriginRequestPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchPublicKey" => Shape.new(
            "NoSuchPublicKey",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchRealtimeLogConfig" => Shape.new(
            "NoSuchRealtimeLogConfig",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchResource" => Shape.new(
            "NoSuchResource",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchResponseHeadersPolicy" => Shape.new(
            "NoSuchResponseHeadersPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchStreamingDistribution" => Shape.new(
            "NoSuchStreamingDistribution",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Origin" => Shape.new(
            "Origin",
            "structure",
            [





              ShapeMember.new(
                "ConnectionAttempts",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionTimeout",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CustomHeaders",
                "CustomHeaders",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CustomOriginConfig",
                "CustomOriginConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DomainName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginAccessControlId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginPath",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginShield",
                "OriginShield",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResponseCompletionTimeout",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3OriginConfig",
                "S3OriginConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VpcOriginConfig",
                "VpcOriginConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControl" => Shape.new(
            "OriginAccessControl",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginAccessControlConfig",
                "OriginAccessControlConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlAlreadyExists" => Shape.new(
            "OriginAccessControlAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlConfig" => Shape.new(
            "OriginAccessControlConfig",
            "structure",
            [





              ShapeMember.new(
                "Description",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginAccessControlOriginType",
                "OriginAccessControlOriginTypes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SigningBehavior",
                "OriginAccessControlSigningBehaviors",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SigningProtocol",
                "OriginAccessControlSigningProtocols",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlInUse" => Shape.new(
            "OriginAccessControlInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlList" => Shape.new(
            "OriginAccessControlList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "OriginAccessControlSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlOriginTypes" => Shape.new(
            "OriginAccessControlOriginTypes",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlSigningBehaviors" => Shape.new(
            "OriginAccessControlSigningBehaviors",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlSigningProtocols" => Shape.new(
            "OriginAccessControlSigningProtocols",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginAccessControlSummary" => Shape.new(
            "OriginAccessControlSummary",
            "structure",
            [





              ShapeMember.new(
                "Description",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginAccessControlOriginType",
                "OriginAccessControlOriginTypes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SigningBehavior",
                "OriginAccessControlSigningBehaviors",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SigningProtocol",
                "OriginAccessControlSigningProtocols",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "OriginAccessControlSummaryList" => Shape.new(
            "OriginAccessControlSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "OriginAccessControlSummary",
              nil,
              "OriginAccessControlSummary",
              false
            ),
            false
          ),





          "OriginCustomHeader" => Shape.new(
            "OriginCustomHeader",
            "structure",
            [





              ShapeMember.new(
                "HeaderName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HeaderValue",
                "sensitiveStringType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "OriginCustomHeadersList" => Shape.new(
            "OriginCustomHeadersList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "OriginCustomHeader",
              nil,
              "OriginCustomHeader",
              false
            ),
            false
          ),





          "OriginGroup" => Shape.new(
            "OriginGroup",
            "structure",
            [





              ShapeMember.new(
                "FailoverCriteria",
                "OriginGroupFailoverCriteria",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Members",
                "OriginGroupMembers",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SelectionCriteria",
                "OriginGroupSelectionCriteria",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginGroupFailoverCriteria" => Shape.new(
            "OriginGroupFailoverCriteria",
            "structure",
            [





              ShapeMember.new(
                "StatusCodes",
                "StatusCodes",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "OriginGroupList" => Shape.new(
            "OriginGroupList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "OriginGroup",
              nil,
              "OriginGroup",
              false
            ),
            false
          ),





          "OriginGroupMember" => Shape.new(
            "OriginGroupMember",
            "structure",
            [





              ShapeMember.new(
                "OriginId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "OriginGroupMemberList" => Shape.new(
            "OriginGroupMemberList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "OriginGroupMember",
              nil,
              "OriginGroupMember",
              false
            ),
            false
          ),





          "OriginGroupMembers" => Shape.new(
            "OriginGroupMembers",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "OriginGroupMemberList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginGroupSelectionCriteria" => Shape.new(
            "OriginGroupSelectionCriteria",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginGroups" => Shape.new(
            "OriginGroups",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "OriginGroupList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "OriginList" => Shape.new(
            "OriginList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Origin",
              nil,
              "Origin",
              false
            ),
            false
          ),





          "OriginProtocolPolicy" => Shape.new(
            "OriginProtocolPolicy",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicy" => Shape.new(
            "OriginRequestPolicy",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicyConfig",
                "OriginRequestPolicyConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyAlreadyExists" => Shape.new(
            "OriginRequestPolicyAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyConfig" => Shape.new(
            "OriginRequestPolicyConfig",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CookiesConfig",
                "OriginRequestPolicyCookiesConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HeadersConfig",
                "OriginRequestPolicyHeadersConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryStringsConfig",
                "OriginRequestPolicyQueryStringsConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyCookieBehavior" => Shape.new(
            "OriginRequestPolicyCookieBehavior",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyCookiesConfig" => Shape.new(
            "OriginRequestPolicyCookiesConfig",
            "structure",
            [





              ShapeMember.new(
                "CookieBehavior",
                "OriginRequestPolicyCookieBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Cookies",
                "CookieNames",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyHeaderBehavior" => Shape.new(
            "OriginRequestPolicyHeaderBehavior",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyHeadersConfig" => Shape.new(
            "OriginRequestPolicyHeadersConfig",
            "structure",
            [





              ShapeMember.new(
                "HeaderBehavior",
                "OriginRequestPolicyHeaderBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Headers",
                "Headers",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyInUse" => Shape.new(
            "OriginRequestPolicyInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyList" => Shape.new(
            "OriginRequestPolicyList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "OriginRequestPolicySummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyQueryStringBehavior" => Shape.new(
            "OriginRequestPolicyQueryStringBehavior",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicyQueryStringsConfig" => Shape.new(
            "OriginRequestPolicyQueryStringsConfig",
            "structure",
            [





              ShapeMember.new(
                "QueryStringBehavior",
                "OriginRequestPolicyQueryStringBehavior",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryStrings",
                "QueryStringNames",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginRequestPolicySummary" => Shape.new(
            "OriginRequestPolicySummary",
            "structure",
            [





              ShapeMember.new(
                "OriginRequestPolicy",
                "OriginRequestPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "OriginRequestPolicyType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "OriginRequestPolicySummaryList" => Shape.new(
            "OriginRequestPolicySummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "OriginRequestPolicySummary",
              nil,
              "OriginRequestPolicySummary",
              false
            ),
            false
          ),





          "OriginRequestPolicyType" => Shape.new(
            "OriginRequestPolicyType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginShield" => Shape.new(
            "OriginShield",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginShieldRegion",
                "OriginShieldRegion",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OriginShieldRegion" => Shape.new(
            "OriginShieldRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OriginSslProtocols" => Shape.new(
            "OriginSslProtocols",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "SslProtocolsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Origins" => Shape.new(
            "Origins",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "OriginList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Parameter" => Shape.new(
            "Parameter",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "ParameterName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "ParameterValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ParameterDefinition" => Shape.new(
            "ParameterDefinition",
            "structure",
            [





              ShapeMember.new(
                "Definition",
                "ParameterDefinitionSchema",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "ParameterName",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ParameterDefinitionSchema" => Shape.new(
            "ParameterDefinitionSchema",
            "structure",
            [





              ShapeMember.new(
                "StringSchema",
                "StringSchemaConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ParameterDefinitions" => Shape.new(
            "ParameterDefinitions",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ParameterDefinition",
              nil,
              nil,
              false
            ),
            false
          ),





          "ParameterName" => Shape.new(
            "ParameterName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ParameterValue" => Shape.new(
            "ParameterValue",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "Parameters" => Shape.new(
            "Parameters",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Parameter",
              nil,
              nil,
              false
            ),
            false
          ),





          "ParametersInCacheKeyAndForwardedToOrigin" => Shape.new(
            "ParametersInCacheKeyAndForwardedToOrigin",
            "structure",
            [





              ShapeMember.new(
                "CookiesConfig",
                "CachePolicyCookiesConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EnableAcceptEncodingBrotli",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EnableAcceptEncodingGzip",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HeadersConfig",
                "CachePolicyHeadersConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryStringsConfig",
                "CachePolicyQueryStringsConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "PathList" => Shape.new(
            "PathList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Path",
              false
            ),
            false
          ),





          "Paths" => Shape.new(
            "Paths",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "PathList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PreconditionFailed" => Shape.new(
            "PreconditionFailed",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PriceClass" => Shape.new(
            "PriceClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "PublicKey" => Shape.new(
            "PublicKey",
            "structure",
            [





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicKeyConfig",
                "PublicKeyConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublicKeyAlreadyExists" => Shape.new(
            "PublicKeyAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublicKeyConfig" => Shape.new(
            "PublicKeyConfig",
            "structure",
            [





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncodedKey",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "PublicKeyIdList" => Shape.new(
            "PublicKeyIdList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "PublicKey",
              false
            ),
            false
          ),





          "PublicKeyInUse" => Shape.new(
            "PublicKeyInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublicKeyList" => Shape.new(
            "PublicKeyList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "PublicKeySummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublicKeySummary" => Shape.new(
            "PublicKeySummary",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncodedKey",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "PublicKeySummaryList" => Shape.new(
            "PublicKeySummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "PublicKeySummary",
              nil,
              "PublicKeySummary",
              false
            ),
            false
          ),





          "PublishConnectionFunctionRequest" => Shape.new(
            "PublishConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublishConnectionFunctionResult" => Shape.new(
            "PublishConnectionFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionSummary",
                "ConnectionFunctionSummary",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublishFunctionRequest" => Shape.new(
            "PublishFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                "uri",
                "Name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublishFunctionResult" => Shape.new(
            "PublishFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "FunctionSummary",
                "FunctionSummary",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutResourcePolicyRequest" => Shape.new(
            "PutResourcePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "PolicyDocument",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResourceArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutResourcePolicyResult" => Shape.new(
            "PutResourcePolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ResourceArn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "QueryArgProfile" => Shape.new(
            "QueryArgProfile",
            "structure",
            [





              ShapeMember.new(
                "ProfileId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryArg",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "QueryArgProfileConfig" => Shape.new(
            "QueryArgProfileConfig",
            "structure",
            [





              ShapeMember.new(
                "ForwardWhenQueryArgProfileIsUnknown",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueryArgProfiles",
                "QueryArgProfiles",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "QueryArgProfileEmpty" => Shape.new(
            "QueryArgProfileEmpty",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "QueryArgProfileList" => Shape.new(
            "QueryArgProfileList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "QueryArgProfile",
              nil,
              "QueryArgProfile",
              false
            ),
            false
          ),





          "QueryArgProfiles" => Shape.new(
            "QueryArgProfiles",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "QueryArgProfileList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "QueryStringCacheKeys" => Shape.new(
            "QueryStringCacheKeys",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "QueryStringCacheKeysList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "QueryStringCacheKeysList" => Shape.new(
            "QueryStringCacheKeysList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Name",
              false
            ),
            false
          ),





          "QueryStringNames" => Shape.new(
            "QueryStringNames",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "QueryStringNamesList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "QueryStringNamesList" => Shape.new(
            "QueryStringNamesList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "Name",
              false
            ),
            false
          ),





          "RealtimeLogConfig" => Shape.new(
            "RealtimeLogConfig",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EndPoints",
                "EndPointList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Fields",
                "FieldList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SamplingRate",
                "long",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RealtimeLogConfigAlreadyExists" => Shape.new(
            "RealtimeLogConfigAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RealtimeLogConfigInUse" => Shape.new(
            "RealtimeLogConfigInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "RealtimeLogConfigList" => Shape.new(
            "RealtimeLogConfigList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "RealtimeLogConfig",
              nil,
              nil,
              false
            ),
            false
          ),





          "RealtimeLogConfigOwnerMismatch" => Shape.new(
            "RealtimeLogConfigOwnerMismatch",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RealtimeLogConfigs" => Shape.new(
            "RealtimeLogConfigs",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "RealtimeLogConfigList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RealtimeMetricsSubscriptionConfig" => Shape.new(
            "RealtimeMetricsSubscriptionConfig",
            "structure",
            [





              ShapeMember.new(
                "RealtimeMetricsSubscriptionStatus",
                "RealtimeMetricsSubscriptionStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RealtimeMetricsSubscriptionStatus" => Shape.new(
            "RealtimeMetricsSubscriptionStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReferrerPolicyList" => Shape.new(
            "ReferrerPolicyList",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResourceARN" => Shape.new(
            "ResourceARN",
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




          "ResourceInUse" => Shape.new(
            "ResourceInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResourceNotDisabled" => Shape.new(
            "ResourceNotDisabled",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicy" => Shape.new(
            "ResponseHeadersPolicy",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicyConfig",
                "ResponseHeadersPolicyConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyAccessControlAllowHeaders" => Shape.new(
            "ResponseHeadersPolicyAccessControlAllowHeaders",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "AccessControlAllowHeadersList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyAccessControlAllowMethods" => Shape.new(
            "ResponseHeadersPolicyAccessControlAllowMethods",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "AccessControlAllowMethodsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyAccessControlAllowMethodsValues" => Shape.new(
            "ResponseHeadersPolicyAccessControlAllowMethodsValues",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyAccessControlAllowOrigins" => Shape.new(
            "ResponseHeadersPolicyAccessControlAllowOrigins",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "AccessControlAllowOriginsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyAccessControlExposeHeaders" => Shape.new(
            "ResponseHeadersPolicyAccessControlExposeHeaders",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "AccessControlExposeHeadersList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyAlreadyExists" => Shape.new(
            "ResponseHeadersPolicyAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyConfig" => Shape.new(
            "ResponseHeadersPolicyConfig",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CorsConfig",
                "ResponseHeadersPolicyCorsConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CustomHeadersConfig",
                "ResponseHeadersPolicyCustomHeadersConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RemoveHeadersConfig",
                "ResponseHeadersPolicyRemoveHeadersConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SecurityHeadersConfig",
                "ResponseHeadersPolicySecurityHeadersConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ServerTimingHeadersConfig",
                "ResponseHeadersPolicyServerTimingHeadersConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyContentSecurityPolicy" => Shape.new(
            "ResponseHeadersPolicyContentSecurityPolicy",
            "structure",
            [





              ShapeMember.new(
                "ContentSecurityPolicy",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Override",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyContentTypeOptions" => Shape.new(
            "ResponseHeadersPolicyContentTypeOptions",
            "structure",
            [





              ShapeMember.new(
                "Override",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyCorsConfig" => Shape.new(
            "ResponseHeadersPolicyCorsConfig",
            "structure",
            [





              ShapeMember.new(
                "AccessControlAllowCredentials",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessControlAllowHeaders",
                "ResponseHeadersPolicyAccessControlAllowHeaders",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessControlAllowMethods",
                "ResponseHeadersPolicyAccessControlAllowMethods",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessControlAllowOrigins",
                "ResponseHeadersPolicyAccessControlAllowOrigins",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessControlExposeHeaders",
                "ResponseHeadersPolicyAccessControlExposeHeaders",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessControlMaxAgeSec",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginOverride",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyCustomHeader" => Shape.new(
            "ResponseHeadersPolicyCustomHeader",
            "structure",
            [





              ShapeMember.new(
                "Header",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Override",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ResponseHeadersPolicyCustomHeaderList" => Shape.new(
            "ResponseHeadersPolicyCustomHeaderList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResponseHeadersPolicyCustomHeader",
              nil,
              "ResponseHeadersPolicyCustomHeader",
              false
            ),
            false
          ),





          "ResponseHeadersPolicyCustomHeadersConfig" => Shape.new(
            "ResponseHeadersPolicyCustomHeadersConfig",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "ResponseHeadersPolicyCustomHeaderList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyFrameOptions" => Shape.new(
            "ResponseHeadersPolicyFrameOptions",
            "structure",
            [





              ShapeMember.new(
                "FrameOption",
                "FrameOptionsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Override",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyInUse" => Shape.new(
            "ResponseHeadersPolicyInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyList" => Shape.new(
            "ResponseHeadersPolicyList",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "ResponseHeadersPolicySummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyReferrerPolicy" => Shape.new(
            "ResponseHeadersPolicyReferrerPolicy",
            "structure",
            [





              ShapeMember.new(
                "Override",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReferrerPolicy",
                "ReferrerPolicyList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyRemoveHeader" => Shape.new(
            "ResponseHeadersPolicyRemoveHeader",
            "structure",
            [





              ShapeMember.new(
                "Header",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ResponseHeadersPolicyRemoveHeaderList" => Shape.new(
            "ResponseHeadersPolicyRemoveHeaderList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResponseHeadersPolicyRemoveHeader",
              nil,
              "ResponseHeadersPolicyRemoveHeader",
              false
            ),
            false
          ),





          "ResponseHeadersPolicyRemoveHeadersConfig" => Shape.new(
            "ResponseHeadersPolicyRemoveHeadersConfig",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "ResponseHeadersPolicyRemoveHeaderList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicySecurityHeadersConfig" => Shape.new(
            "ResponseHeadersPolicySecurityHeadersConfig",
            "structure",
            [





              ShapeMember.new(
                "ContentSecurityPolicy",
                "ResponseHeadersPolicyContentSecurityPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentTypeOptions",
                "ResponseHeadersPolicyContentTypeOptions",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FrameOptions",
                "ResponseHeadersPolicyFrameOptions",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReferrerPolicy",
                "ResponseHeadersPolicyReferrerPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StrictTransportSecurity",
                "ResponseHeadersPolicyStrictTransportSecurity",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "XSSProtection",
                "ResponseHeadersPolicyXSSProtection",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyServerTimingHeadersConfig" => Shape.new(
            "ResponseHeadersPolicyServerTimingHeadersConfig",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SamplingRate",
                "SamplingRate",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyStrictTransportSecurity" => Shape.new(
            "ResponseHeadersPolicyStrictTransportSecurity",
            "structure",
            [





              ShapeMember.new(
                "AccessControlMaxAgeSec",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IncludeSubdomains",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Override",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Preload",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicySummary" => Shape.new(
            "ResponseHeadersPolicySummary",
            "structure",
            [





              ShapeMember.new(
                "ResponseHeadersPolicy",
                "ResponseHeadersPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "ResponseHeadersPolicyType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ResponseHeadersPolicySummaryList" => Shape.new(
            "ResponseHeadersPolicySummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ResponseHeadersPolicySummary",
              nil,
              "ResponseHeadersPolicySummary",
              false
            ),
            false
          ),





          "ResponseHeadersPolicyType" => Shape.new(
            "ResponseHeadersPolicyType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseHeadersPolicyXSSProtection" => Shape.new(
            "ResponseHeadersPolicyXSSProtection",
            "structure",
            [





              ShapeMember.new(
                "ModeBlock",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Override",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Protection",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReportUri",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Restrictions" => Shape.new(
            "Restrictions",
            "structure",
            [





              ShapeMember.new(
                "GeoRestriction",
                "GeoRestriction",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3Origin" => Shape.new(
            "S3Origin",
            "structure",
            [





              ShapeMember.new(
                "DomainName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginAccessIdentity",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3OriginConfig" => Shape.new(
            "S3OriginConfig",
            "structure",
            [





              ShapeMember.new(
                "OriginAccessIdentity",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginReadTimeout",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SSLSupportMethod" => Shape.new(
            "SSLSupportMethod",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SamplingRate" => Shape.new(
            "SamplingRate",
            "double",
            [] of ShapeMember,
            nil,
            false
          ),




          "ServerCertificateId" => Shape.new(
            "ServerCertificateId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SessionStickinessConfig" => Shape.new(
            "SessionStickinessConfig",
            "structure",
            [





              ShapeMember.new(
                "IdleTTL",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaximumTTL",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Signer" => Shape.new(
            "Signer",
            "structure",
            [





              ShapeMember.new(
                "AwsAccountNumber",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyPairIds",
                "KeyPairIds",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "SignerList" => Shape.new(
            "SignerList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Signer",
              nil,
              "Signer",
              false
            ),
            false
          ),





          "SslProtocol" => Shape.new(
            "SslProtocol",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "SslProtocolsList" => Shape.new(
            "SslProtocolsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "SslProtocol",
              nil,
              "SslProtocol",
              false
            ),
            false
          ),









          "StagingDistributionDnsNameList" => Shape.new(
            "StagingDistributionDnsNameList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "DnsName",
              false
            ),
            false
          ),





          "StagingDistributionDnsNames" => Shape.new(
            "StagingDistributionDnsNames",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "StagingDistributionDnsNameList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StagingDistributionInUse" => Shape.new(
            "StagingDistributionInUse",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "StatusCodeList" => Shape.new(
            "StatusCodeList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "integer",
              nil,
              "StatusCode",
              false
            ),
            false
          ),





          "StatusCodes" => Shape.new(
            "StatusCodes",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "StatusCodeList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StreamingDistribution" => Shape.new(
            "StreamingDistribution",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ActiveTrustedSigners",
                "ActiveTrustedSigners",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DomainName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StreamingDistributionConfig",
                "StreamingDistributionConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StreamingDistributionAlreadyExists" => Shape.new(
            "StreamingDistributionAlreadyExists",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StreamingDistributionConfig" => Shape.new(
            "StreamingDistributionConfig",
            "structure",
            [





              ShapeMember.new(
                "Aliases",
                "Aliases",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CallerReference",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Logging",
                "StreamingLoggingConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PriceClass",
                "PriceClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3Origin",
                "S3Origin",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustedSigners",
                "TrustedSigners",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StreamingDistributionConfigWithTags" => Shape.new(
            "StreamingDistributionConfigWithTags",
            "structure",
            [





              ShapeMember.new(
                "StreamingDistributionConfig",
                "StreamingDistributionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StreamingDistributionList" => Shape.new(
            "StreamingDistributionList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "StreamingDistributionSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StreamingDistributionNotDisabled" => Shape.new(
            "StreamingDistributionNotDisabled",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StreamingDistributionSummary" => Shape.new(
            "StreamingDistributionSummary",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Aliases",
                "Aliases",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comment",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DomainName",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PriceClass",
                "PriceClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3Origin",
                "S3Origin",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustedSigners",
                "TrustedSigners",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "StreamingDistributionSummaryList" => Shape.new(
            "StreamingDistributionSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "StreamingDistributionSummary",
              nil,
              "StreamingDistributionSummary",
              false
            ),
            false
          ),





          "StreamingLoggingConfig" => Shape.new(
            "StreamingLoggingConfig",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StringSchemaConfig" => Shape.new(
            "StringSchemaConfig",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "sensitiveStringType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DefaultValue",
                "ParameterValue",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Required",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
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





          "TagKeys" => Shape.new(
            "TagKeys",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "TagKeyList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
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





          "TagResourceRequest" => Shape.new(
            "TagResourceRequest",
            "structure",
            [





              ShapeMember.new(
                "Resource",
                "ResourceARN",
                "querystring",
                "Resource",
                false
              ),





              ShapeMember.new(
                "Tags",
                "Tags",
                nil,
                "Tags",
                false
              ),

            ] of ShapeMember,
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




          "Tags" => Shape.new(
            "Tags",
            "structure",
            [





              ShapeMember.new(
                "Items",
                "TagList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TenantConfig" => Shape.new(
            "TenantConfig",
            "structure",
            [





              ShapeMember.new(
                "ParameterDefinitions",
                "ParameterDefinitions",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TestConnectionFunctionRequest" => Shape.new(
            "TestConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "ConnectionObject",
                "FunctionEventObject",
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





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TestConnectionFunctionResult" => Shape.new(
            "TestConnectionFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionTestResult",
                "ConnectionFunctionTestResult",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TestFunctionFailed" => Shape.new(
            "TestFunctionFailed",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TestFunctionRequest" => Shape.new(
            "TestFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "EventObject",
                "FunctionEventObject",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                "uri",
                "Name",
                false
              ),





              ShapeMember.new(
                "Stage",
                "FunctionStage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TestFunctionResult" => Shape.new(
            "TestFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "TestResult",
                "TestResult",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TestResult" => Shape.new(
            "TestResult",
            "structure",
            [





              ShapeMember.new(
                "ComputeUtilization",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionErrorMessage",
                "sensitiveStringType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionExecutionLogs",
                "FunctionExecutionLogList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionOutput",
                "sensitiveStringType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionSummary",
                "FunctionSummary",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooLongCSPInResponseHeadersPolicy" => Shape.new(
            "TooLongCSPInResponseHeadersPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCacheBehaviors" => Shape.new(
            "TooManyCacheBehaviors",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCachePolicies" => Shape.new(
            "TooManyCachePolicies",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCertificates" => Shape.new(
            "TooManyCertificates",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCloudFrontOriginAccessIdentities" => Shape.new(
            "TooManyCloudFrontOriginAccessIdentities",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyContinuousDeploymentPolicies" => Shape.new(
            "TooManyContinuousDeploymentPolicies",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCookieNamesInWhiteList" => Shape.new(
            "TooManyCookieNamesInWhiteList",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCookiesInCachePolicy" => Shape.new(
            "TooManyCookiesInCachePolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCookiesInOriginRequestPolicy" => Shape.new(
            "TooManyCookiesInOriginRequestPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyCustomHeadersInResponseHeadersPolicy" => Shape.new(
            "TooManyCustomHeadersInResponseHeadersPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionCNAMEs" => Shape.new(
            "TooManyDistributionCNAMEs",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributions" => Shape.new(
            "TooManyDistributions",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsAssociatedToCachePolicy" => Shape.new(
            "TooManyDistributionsAssociatedToCachePolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsAssociatedToFieldLevelEncryptionConfig" => Shape.new(
            "TooManyDistributionsAssociatedToFieldLevelEncryptionConfig",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsAssociatedToKeyGroup" => Shape.new(
            "TooManyDistributionsAssociatedToKeyGroup",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsAssociatedToOriginAccessControl" => Shape.new(
            "TooManyDistributionsAssociatedToOriginAccessControl",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsAssociatedToOriginRequestPolicy" => Shape.new(
            "TooManyDistributionsAssociatedToOriginRequestPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsAssociatedToResponseHeadersPolicy" => Shape.new(
            "TooManyDistributionsAssociatedToResponseHeadersPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsWithFunctionAssociations" => Shape.new(
            "TooManyDistributionsWithFunctionAssociations",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsWithLambdaAssociations" => Shape.new(
            "TooManyDistributionsWithLambdaAssociations",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyDistributionsWithSingleFunctionARN" => Shape.new(
            "TooManyDistributionsWithSingleFunctionARN",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFieldLevelEncryptionConfigs" => Shape.new(
            "TooManyFieldLevelEncryptionConfigs",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFieldLevelEncryptionContentTypeProfiles" => Shape.new(
            "TooManyFieldLevelEncryptionContentTypeProfiles",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFieldLevelEncryptionEncryptionEntities" => Shape.new(
            "TooManyFieldLevelEncryptionEncryptionEntities",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFieldLevelEncryptionFieldPatterns" => Shape.new(
            "TooManyFieldLevelEncryptionFieldPatterns",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFieldLevelEncryptionProfiles" => Shape.new(
            "TooManyFieldLevelEncryptionProfiles",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFieldLevelEncryptionQueryArgProfiles" => Shape.new(
            "TooManyFieldLevelEncryptionQueryArgProfiles",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFunctionAssociations" => Shape.new(
            "TooManyFunctionAssociations",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyFunctions" => Shape.new(
            "TooManyFunctions",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyHeadersInCachePolicy" => Shape.new(
            "TooManyHeadersInCachePolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyHeadersInForwardedValues" => Shape.new(
            "TooManyHeadersInForwardedValues",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyHeadersInOriginRequestPolicy" => Shape.new(
            "TooManyHeadersInOriginRequestPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyInvalidationsInProgress" => Shape.new(
            "TooManyInvalidationsInProgress",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyKeyGroups" => Shape.new(
            "TooManyKeyGroups",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyKeyGroupsAssociatedToDistribution" => Shape.new(
            "TooManyKeyGroupsAssociatedToDistribution",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyLambdaFunctionAssociations" => Shape.new(
            "TooManyLambdaFunctionAssociations",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyOriginAccessControls" => Shape.new(
            "TooManyOriginAccessControls",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyOriginCustomHeaders" => Shape.new(
            "TooManyOriginCustomHeaders",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyOriginGroupsPerDistribution" => Shape.new(
            "TooManyOriginGroupsPerDistribution",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyOriginRequestPolicies" => Shape.new(
            "TooManyOriginRequestPolicies",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyOrigins" => Shape.new(
            "TooManyOrigins",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyPublicKeys" => Shape.new(
            "TooManyPublicKeys",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyPublicKeysInKeyGroup" => Shape.new(
            "TooManyPublicKeysInKeyGroup",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyQueryStringParameters" => Shape.new(
            "TooManyQueryStringParameters",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyQueryStringsInCachePolicy" => Shape.new(
            "TooManyQueryStringsInCachePolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyQueryStringsInOriginRequestPolicy" => Shape.new(
            "TooManyQueryStringsInOriginRequestPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyRealtimeLogConfigs" => Shape.new(
            "TooManyRealtimeLogConfigs",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyRemoveHeadersInResponseHeadersPolicy" => Shape.new(
            "TooManyRemoveHeadersInResponseHeadersPolicy",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyResponseHeadersPolicies" => Shape.new(
            "TooManyResponseHeadersPolicies",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyStreamingDistributionCNAMEs" => Shape.new(
            "TooManyStreamingDistributionCNAMEs",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyStreamingDistributions" => Shape.new(
            "TooManyStreamingDistributions",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyTrustedSigners" => Shape.new(
            "TooManyTrustedSigners",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TrafficConfig" => Shape.new(
            "TrafficConfig",
            "structure",
            [





              ShapeMember.new(
                "SingleHeaderConfig",
                "ContinuousDeploymentSingleHeaderConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SingleWeightConfig",
                "ContinuousDeploymentSingleWeightConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "ContinuousDeploymentPolicyType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TrustStore" => Shape.new(
            "TrustStore",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NumberOfCaCertificates",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Reason",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "TrustStoreStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TrustStoreConfig" => Shape.new(
            "TrustStoreConfig",
            "structure",
            [





              ShapeMember.new(
                "AdvertiseTrustStoreCaNames",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IgnoreCertificateExpiry",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustStoreId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "TrustStoreList" => Shape.new(
            "TrustStoreList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TrustStoreSummary",
              nil,
              "TrustStoreSummary",
              false
            ),
            false
          ),





          "TrustStoreStatus" => Shape.new(
            "TrustStoreStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "TrustStoreSummary" => Shape.new(
            "TrustStoreSummary",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NumberOfCaCertificates",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Reason",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "TrustStoreStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TrustedKeyGroupDoesNotExist" => Shape.new(
            "TrustedKeyGroupDoesNotExist",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "TrustedKeyGroupIdList" => Shape.new(
            "TrustedKeyGroupIdList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "string",
              nil,
              "KeyGroup",
              false
            ),
            false
          ),





          "TrustedKeyGroups" => Shape.new(
            "TrustedKeyGroups",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "TrustedKeyGroupIdList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TrustedSignerDoesNotExist" => Shape.new(
            "TrustedSignerDoesNotExist",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TrustedSigners" => Shape.new(
            "TrustedSigners",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "AwsAccountNumberList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UnsupportedOperation" => Shape.new(
            "UnsupportedOperation",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UntagResourceRequest" => Shape.new(
            "UntagResourceRequest",
            "structure",
            [





              ShapeMember.new(
                "Resource",
                "ResourceARN",
                "querystring",
                "Resource",
                false
              ),





              ShapeMember.new(
                "TagKeys",
                "TagKeys",
                nil,
                "TagKeys",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateAnycastIpListRequest" => Shape.new(
            "UpdateAnycastIpListRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "IpAddressType",
                "IpAddressType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateAnycastIpListResult" => Shape.new(
            "UpdateAnycastIpListResult",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpList",
                "AnycastIpList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateCachePolicyRequest" => Shape.new(
            "UpdateCachePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "CachePolicyConfig",
                "CachePolicyConfig",
                nil,
                "CachePolicyConfig",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateCachePolicyResult" => Shape.new(
            "UpdateCachePolicyResult",
            "structure",
            [





              ShapeMember.new(
                "CachePolicy",
                "CachePolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateCloudFrontOriginAccessIdentityRequest" => Shape.new(
            "UpdateCloudFrontOriginAccessIdentityRequest",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentityConfig",
                "CloudFrontOriginAccessIdentityConfig",
                nil,
                "CloudFrontOriginAccessIdentityConfig",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateCloudFrontOriginAccessIdentityResult" => Shape.new(
            "UpdateCloudFrontOriginAccessIdentityResult",
            "structure",
            [





              ShapeMember.new(
                "CloudFrontOriginAccessIdentity",
                "CloudFrontOriginAccessIdentity",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateConnectionFunctionRequest" => Shape.new(
            "UpdateConnectionFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionCode",
                "FunctionBlob",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConnectionFunctionConfig",
                "FunctionConfig",
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





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateConnectionFunctionResult" => Shape.new(
            "UpdateConnectionFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionFunctionSummary",
                "ConnectionFunctionSummary",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateConnectionGroupRequest" => Shape.new(
            "UpdateConnectionGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "AnycastIpListId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Ipv6Enabled",
                "boolean",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateConnectionGroupResult" => Shape.new(
            "UpdateConnectionGroupResult",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroup",
                "ConnectionGroup",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateContinuousDeploymentPolicyRequest" => Shape.new(
            "UpdateContinuousDeploymentPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicyConfig",
                "ContinuousDeploymentPolicyConfig",
                nil,
                "ContinuousDeploymentPolicyConfig",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateContinuousDeploymentPolicyResult" => Shape.new(
            "UpdateContinuousDeploymentPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ContinuousDeploymentPolicy",
                "ContinuousDeploymentPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDistributionRequest" => Shape.new(
            "UpdateDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "DistributionConfig",
                "DistributionConfig",
                nil,
                "DistributionConfig",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDistributionResult" => Shape.new(
            "UpdateDistributionResult",
            "structure",
            [





              ShapeMember.new(
                "Distribution",
                "Distribution",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDistributionTenantRequest" => Shape.new(
            "UpdateDistributionTenantRequest",
            "structure",
            [





              ShapeMember.new(
                "ConnectionGroupId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Customizations",
                "Customizations",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DistributionId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Domains",
                "DomainList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "ManagedCertificateRequest",
                "ManagedCertificateRequest",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Parameters",
                "Parameters",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDistributionTenantResult" => Shape.new(
            "UpdateDistributionTenantResult",
            "structure",
            [





              ShapeMember.new(
                "DistributionTenant",
                "DistributionTenant",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDistributionWithStagingConfigRequest" => Shape.new(
            "UpdateDistributionWithStagingConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "StagingDistributionId",
                "string",
                "querystring",
                "StagingDistributionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDistributionWithStagingConfigResult" => Shape.new(
            "UpdateDistributionWithStagingConfigResult",
            "structure",
            [





              ShapeMember.new(
                "Distribution",
                "Distribution",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDomainAssociationRequest" => Shape.new(
            "UpdateDomainAssociationRequest",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "TargetResource",
                "DistributionResourceId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateDomainAssociationResult" => Shape.new(
            "UpdateDomainAssociationResult",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "ResourceId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateFieldLevelEncryptionConfigRequest" => Shape.new(
            "UpdateFieldLevelEncryptionConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionConfig",
                "FieldLevelEncryptionConfig",
                nil,
                "FieldLevelEncryptionConfig",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateFieldLevelEncryptionConfigResult" => Shape.new(
            "UpdateFieldLevelEncryptionConfigResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryption",
                "FieldLevelEncryption",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateFieldLevelEncryptionProfileRequest" => Shape.new(
            "UpdateFieldLevelEncryptionProfileRequest",
            "structure",
            [





              ShapeMember.new(
                "FieldLevelEncryptionProfileConfig",
                "FieldLevelEncryptionProfileConfig",
                nil,
                "FieldLevelEncryptionProfileConfig",
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateFieldLevelEncryptionProfileResult" => Shape.new(
            "UpdateFieldLevelEncryptionProfileResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "FieldLevelEncryptionProfile",
                "FieldLevelEncryptionProfile",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateFunctionRequest" => Shape.new(
            "UpdateFunctionRequest",
            "structure",
            [





              ShapeMember.new(
                "FunctionCode",
                "FunctionBlob",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionConfig",
                "FunctionConfig",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Name",
                "FunctionName",
                "uri",
                "Name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateFunctionResult" => Shape.new(
            "UpdateFunctionResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETtag",
                false
              ),





              ShapeMember.new(
                "FunctionSummary",
                "FunctionSummary",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateKeyGroupRequest" => Shape.new(
            "UpdateKeyGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "KeyGroupConfig",
                "KeyGroupConfig",
                nil,
                "KeyGroupConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateKeyGroupResult" => Shape.new(
            "UpdateKeyGroupResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "KeyGroup",
                "KeyGroup",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateKeyValueStoreRequest" => Shape.new(
            "UpdateKeyValueStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "Comment",
                "KeyValueStoreComment",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "Name",
                "KeyValueStoreName",
                "uri",
                "Name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateKeyValueStoreResult" => Shape.new(
            "UpdateKeyValueStoreResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "KeyValueStore",
                "KeyValueStore",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateOriginAccessControlRequest" => Shape.new(
            "UpdateOriginAccessControlRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "OriginAccessControlConfig",
                "OriginAccessControlConfig",
                nil,
                "OriginAccessControlConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateOriginAccessControlResult" => Shape.new(
            "UpdateOriginAccessControlResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "OriginAccessControl",
                "OriginAccessControl",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateOriginRequestPolicyRequest" => Shape.new(
            "UpdateOriginRequestPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicyConfig",
                "OriginRequestPolicyConfig",
                nil,
                "OriginRequestPolicyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateOriginRequestPolicyResult" => Shape.new(
            "UpdateOriginRequestPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "OriginRequestPolicy",
                "OriginRequestPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdatePublicKeyRequest" => Shape.new(
            "UpdatePublicKeyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "PublicKeyConfig",
                "PublicKeyConfig",
                nil,
                "PublicKeyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdatePublicKeyResult" => Shape.new(
            "UpdatePublicKeyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "PublicKey",
                "PublicKey",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateRealtimeLogConfigRequest" => Shape.new(
            "UpdateRealtimeLogConfigRequest",
            "structure",
            [





              ShapeMember.new(
                "ARN",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EndPoints",
                "EndPointList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Fields",
                "FieldList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SamplingRate",
                "long",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateRealtimeLogConfigResult" => Shape.new(
            "UpdateRealtimeLogConfigResult",
            "structure",
            [





              ShapeMember.new(
                "RealtimeLogConfig",
                "RealtimeLogConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateResponseHeadersPolicyRequest" => Shape.new(
            "UpdateResponseHeadersPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicyConfig",
                "ResponseHeadersPolicyConfig",
                nil,
                "ResponseHeadersPolicyConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateResponseHeadersPolicyResult" => Shape.new(
            "UpdateResponseHeadersPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "ResponseHeadersPolicy",
                "ResponseHeadersPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateStreamingDistributionRequest" => Shape.new(
            "UpdateStreamingDistributionRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "StreamingDistributionConfig",
                "StreamingDistributionConfig",
                nil,
                "StreamingDistributionConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateStreamingDistributionResult" => Shape.new(
            "UpdateStreamingDistributionResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "StreamingDistribution",
                "StreamingDistribution",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateTrustStoreRequest" => Shape.new(
            "UpdateTrustStoreRequest",
            "structure",
            [





              ShapeMember.new(
                "CaCertificatesBundleSource",
                "CaCertificatesBundleSource",
                nil,
                "CaCertificatesBundleSource",
                false
              ),





              ShapeMember.new(
                "Id",
                "ResourceId",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateTrustStoreResult" => Shape.new(
            "UpdateTrustStoreResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "TrustStore",
                "TrustStore",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateVpcOriginRequest" => Shape.new(
            "UpdateVpcOriginRequest",
            "structure",
            [





              ShapeMember.new(
                "Id",
                "string",
                "uri",
                "Id",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "string",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "VpcOriginEndpointConfig",
                "VpcOriginEndpointConfig",
                nil,
                "VpcOriginEndpointConfig",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateVpcOriginResult" => Shape.new(
            "UpdateVpcOriginResult",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "string",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "VpcOrigin",
                "VpcOrigin",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ValidationTokenDetail" => Shape.new(
            "ValidationTokenDetail",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RedirectFrom",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RedirectTo",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ValidationTokenDetailList" => Shape.new(
            "ValidationTokenDetailList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ValidationTokenDetail",
              nil,
              nil,
              false
            ),
            false
          ),





          "ValidationTokenHost" => Shape.new(
            "ValidationTokenHost",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "VerifyDnsConfigurationRequest" => Shape.new(
            "VerifyDnsConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Domain",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Identifier",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "VerifyDnsConfigurationResult" => Shape.new(
            "VerifyDnsConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "DnsConfigurationList",
                "DnsConfigurationList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ViewerCertificate" => Shape.new(
            "ViewerCertificate",
            "structure",
            [





              ShapeMember.new(
                "ACMCertificateArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Certificate",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CertificateSource",
                "CertificateSource",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CloudFrontDefaultCertificate",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IAMCertificateId",
                "ServerCertificateId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MinimumProtocolVersion",
                "MinimumProtocolVersion",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SSLSupportMethod",
                "SSLSupportMethod",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ViewerMtlsConfig" => Shape.new(
            "ViewerMtlsConfig",
            "structure",
            [





              ShapeMember.new(
                "Mode",
                "ViewerMtlsMode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrustStoreConfig",
                "TrustStoreConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ViewerMtlsMode" => Shape.new(
            "ViewerMtlsMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ViewerProtocolPolicy" => Shape.new(
            "ViewerProtocolPolicy",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "VpcOrigin" => Shape.new(
            "VpcOrigin",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VpcOriginEndpointConfig",
                "VpcOriginEndpointConfig",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "VpcOriginConfig" => Shape.new(
            "VpcOriginConfig",
            "structure",
            [





              ShapeMember.new(
                "OriginKeepaliveTimeout",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginReadTimeout",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OwnerAccountId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VpcOriginId",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "VpcOriginEndpointConfig" => Shape.new(
            "VpcOriginEndpointConfig",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HTTPPort",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HTTPSPort",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginProtocolPolicy",
                "OriginProtocolPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginSslProtocols",
                "OriginSslProtocols",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "VpcOriginList" => Shape.new(
            "VpcOriginList",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Items",
                "VpcOriginSummaryList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxItems",
                "integer",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Quantity",
                "integer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "VpcOriginSummary" => Shape.new(
            "VpcOriginSummary",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "timestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OriginEndpointArn",
                "string",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "VpcOriginSummaryList" => Shape.new(
            "VpcOriginSummaryList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "VpcOriginSummary",
              nil,
              "VpcOriginSummary",
              false
            ),
            false
          ),





          "WebAclCustomization" => Shape.new(
            "WebAclCustomization",
            "structure",
            [





              ShapeMember.new(
                "Action",
                "CustomizationActionType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Arn",
                "string",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "aliasString" => Shape.new(
            "aliasString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "boolean" => Shape.new(
            "boolean",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "distributionIdString" => Shape.new(
            "distributionIdString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "float" => Shape.new(
            "float",
            "float",
            [] of ShapeMember,
            nil,
            false
          ),




          "integer" => Shape.new(
            "integer",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "listConflictingAliasesMaxItemsInteger" => Shape.new(
            "listConflictingAliasesMaxItemsInteger",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "long" => Shape.new(
            "long",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "sensitiveStringType" => Shape.new(
            "sensitiveStringType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "string" => Shape.new(
            "string",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "timestamp" => Shape.new(
            "timestamp",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),


        }

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : Aws::Runtime::Http::Request
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
          Aws::Runtime::Http::Request.new(operation.http_method, uri, headers, body)
        end

        def self.parse_error(response : Aws::Runtime::Http::Response) : Exception
          error_type = error_type_from_body(response.body)
          message = error_message_from_body(response.body)
          Errors.build(error_type, message)
        end

        def self.parse_response(response : Aws::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T
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
