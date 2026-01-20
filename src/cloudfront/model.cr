module Aws
  module CloudFront
    module Model
      API_VERSION = "2020-05-31"
      TARGET_PREFIX = ""
      SIGNING_NAME = "cloudfront"
      ENDPOINT_PREFIX = "cloudfront"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://cloudfront.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://cloudfront-fips.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://cloudfront.cn-northwest-1.amazonaws.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://cloudfront-fips.cn-northwest-1.amazonaws.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudfront-fips.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudfront-fips.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudfront.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cloudfront.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ALIAS = OperationModel.new(
        name: "AssociateAlias",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution/{TargetDistributionId}/associate-alias"
      )

      ASSOCIATE_DISTRIBUTION_TENANT_WEB_ACL = OperationModel.new(
        name: "AssociateDistributionTenantWebACL",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution-tenant/{Id}/associate-web-acl"
      )

      ASSOCIATE_DISTRIBUTION_WEB_ACL = OperationModel.new(
        name: "AssociateDistributionWebACL",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution/{Id}/associate-web-acl"
      )

      COPY_DISTRIBUTION = OperationModel.new(
        name: "CopyDistribution",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution/{PrimaryDistributionId}/copy"
      )

      CREATE_ANYCAST_IP_LIST = OperationModel.new(
        name: "CreateAnycastIpList",
        http_method: "POST",
        request_uri: "/2020-05-31/anycast-ip-list"
      )

      CREATE_CACHE_POLICY = OperationModel.new(
        name: "CreateCachePolicy",
        http_method: "POST",
        request_uri: "/2020-05-31/cache-policy"
      )

      CREATE_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY = OperationModel.new(
        name: "CreateCloudFrontOriginAccessIdentity",
        http_method: "POST",
        request_uri: "/2020-05-31/origin-access-identity/cloudfront"
      )

      CREATE_CONNECTION_FUNCTION = OperationModel.new(
        name: "CreateConnectionFunction",
        http_method: "POST",
        request_uri: "/2020-05-31/connection-function"
      )

      CREATE_CONNECTION_GROUP = OperationModel.new(
        name: "CreateConnectionGroup",
        http_method: "POST",
        request_uri: "/2020-05-31/connection-group"
      )

      CREATE_CONTINUOUS_DEPLOYMENT_POLICY = OperationModel.new(
        name: "CreateContinuousDeploymentPolicy",
        http_method: "POST",
        request_uri: "/2020-05-31/continuous-deployment-policy"
      )

      CREATE_DISTRIBUTION = OperationModel.new(
        name: "CreateDistribution",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution"
      )

      CREATE_DISTRIBUTION_TENANT = OperationModel.new(
        name: "CreateDistributionTenant",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution-tenant"
      )

      CREATE_DISTRIBUTION_WITH_TAGS = OperationModel.new(
        name: "CreateDistributionWithTags",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution?WithTags"
      )

      CREATE_FIELD_LEVEL_ENCRYPTION_CONFIG = OperationModel.new(
        name: "CreateFieldLevelEncryptionConfig",
        http_method: "POST",
        request_uri: "/2020-05-31/field-level-encryption"
      )

      CREATE_FIELD_LEVEL_ENCRYPTION_PROFILE = OperationModel.new(
        name: "CreateFieldLevelEncryptionProfile",
        http_method: "POST",
        request_uri: "/2020-05-31/field-level-encryption-profile"
      )

      CREATE_FUNCTION = OperationModel.new(
        name: "CreateFunction",
        http_method: "POST",
        request_uri: "/2020-05-31/function"
      )

      CREATE_INVALIDATION = OperationModel.new(
        name: "CreateInvalidation",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution/{DistributionId}/invalidation"
      )

      CREATE_INVALIDATION_FOR_DISTRIBUTION_TENANT = OperationModel.new(
        name: "CreateInvalidationForDistributionTenant",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution-tenant/{Id}/invalidation"
      )

      CREATE_KEY_GROUP = OperationModel.new(
        name: "CreateKeyGroup",
        http_method: "POST",
        request_uri: "/2020-05-31/key-group"
      )

      CREATE_KEY_VALUE_STORE = OperationModel.new(
        name: "CreateKeyValueStore",
        http_method: "POST",
        request_uri: "/2020-05-31/key-value-store"
      )

      CREATE_MONITORING_SUBSCRIPTION = OperationModel.new(
        name: "CreateMonitoringSubscription",
        http_method: "POST",
        request_uri: "/2020-05-31/distributions/{DistributionId}/monitoring-subscription"
      )

      CREATE_ORIGIN_ACCESS_CONTROL = OperationModel.new(
        name: "CreateOriginAccessControl",
        http_method: "POST",
        request_uri: "/2020-05-31/origin-access-control"
      )

      CREATE_ORIGIN_REQUEST_POLICY = OperationModel.new(
        name: "CreateOriginRequestPolicy",
        http_method: "POST",
        request_uri: "/2020-05-31/origin-request-policy"
      )

      CREATE_PUBLIC_KEY = OperationModel.new(
        name: "CreatePublicKey",
        http_method: "POST",
        request_uri: "/2020-05-31/public-key"
      )

      CREATE_REALTIME_LOG_CONFIG = OperationModel.new(
        name: "CreateRealtimeLogConfig",
        http_method: "POST",
        request_uri: "/2020-05-31/realtime-log-config"
      )

      CREATE_RESPONSE_HEADERS_POLICY = OperationModel.new(
        name: "CreateResponseHeadersPolicy",
        http_method: "POST",
        request_uri: "/2020-05-31/response-headers-policy"
      )

      CREATE_STREAMING_DISTRIBUTION = OperationModel.new(
        name: "CreateStreamingDistribution",
        http_method: "POST",
        request_uri: "/2020-05-31/streaming-distribution"
      )

      CREATE_STREAMING_DISTRIBUTION_WITH_TAGS = OperationModel.new(
        name: "CreateStreamingDistributionWithTags",
        http_method: "POST",
        request_uri: "/2020-05-31/streaming-distribution?WithTags"
      )

      CREATE_TRUST_STORE = OperationModel.new(
        name: "CreateTrustStore",
        http_method: "POST",
        request_uri: "/2020-05-31/trust-store"
      )

      CREATE_VPC_ORIGIN = OperationModel.new(
        name: "CreateVpcOrigin",
        http_method: "POST",
        request_uri: "/2020-05-31/vpc-origin"
      )

      DELETE_ANYCAST_IP_LIST = OperationModel.new(
        name: "DeleteAnycastIpList",
        http_method: "DELETE",
        request_uri: "/2020-05-31/anycast-ip-list/{Id}"
      )

      DELETE_CACHE_POLICY = OperationModel.new(
        name: "DeleteCachePolicy",
        http_method: "DELETE",
        request_uri: "/2020-05-31/cache-policy/{Id}"
      )

      DELETE_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY = OperationModel.new(
        name: "DeleteCloudFrontOriginAccessIdentity",
        http_method: "DELETE",
        request_uri: "/2020-05-31/origin-access-identity/cloudfront/{Id}"
      )

      DELETE_CONNECTION_FUNCTION = OperationModel.new(
        name: "DeleteConnectionFunction",
        http_method: "DELETE",
        request_uri: "/2020-05-31/connection-function/{Id}"
      )

      DELETE_CONNECTION_GROUP = OperationModel.new(
        name: "DeleteConnectionGroup",
        http_method: "DELETE",
        request_uri: "/2020-05-31/connection-group/{Id}"
      )

      DELETE_CONTINUOUS_DEPLOYMENT_POLICY = OperationModel.new(
        name: "DeleteContinuousDeploymentPolicy",
        http_method: "DELETE",
        request_uri: "/2020-05-31/continuous-deployment-policy/{Id}"
      )

      DELETE_DISTRIBUTION = OperationModel.new(
        name: "DeleteDistribution",
        http_method: "DELETE",
        request_uri: "/2020-05-31/distribution/{Id}"
      )

      DELETE_DISTRIBUTION_TENANT = OperationModel.new(
        name: "DeleteDistributionTenant",
        http_method: "DELETE",
        request_uri: "/2020-05-31/distribution-tenant/{Id}"
      )

      DELETE_FIELD_LEVEL_ENCRYPTION_CONFIG = OperationModel.new(
        name: "DeleteFieldLevelEncryptionConfig",
        http_method: "DELETE",
        request_uri: "/2020-05-31/field-level-encryption/{Id}"
      )

      DELETE_FIELD_LEVEL_ENCRYPTION_PROFILE = OperationModel.new(
        name: "DeleteFieldLevelEncryptionProfile",
        http_method: "DELETE",
        request_uri: "/2020-05-31/field-level-encryption-profile/{Id}"
      )

      DELETE_FUNCTION = OperationModel.new(
        name: "DeleteFunction",
        http_method: "DELETE",
        request_uri: "/2020-05-31/function/{Name}"
      )

      DELETE_KEY_GROUP = OperationModel.new(
        name: "DeleteKeyGroup",
        http_method: "DELETE",
        request_uri: "/2020-05-31/key-group/{Id}"
      )

      DELETE_KEY_VALUE_STORE = OperationModel.new(
        name: "DeleteKeyValueStore",
        http_method: "DELETE",
        request_uri: "/2020-05-31/key-value-store/{Name}"
      )

      DELETE_MONITORING_SUBSCRIPTION = OperationModel.new(
        name: "DeleteMonitoringSubscription",
        http_method: "DELETE",
        request_uri: "/2020-05-31/distributions/{DistributionId}/monitoring-subscription"
      )

      DELETE_ORIGIN_ACCESS_CONTROL = OperationModel.new(
        name: "DeleteOriginAccessControl",
        http_method: "DELETE",
        request_uri: "/2020-05-31/origin-access-control/{Id}"
      )

      DELETE_ORIGIN_REQUEST_POLICY = OperationModel.new(
        name: "DeleteOriginRequestPolicy",
        http_method: "DELETE",
        request_uri: "/2020-05-31/origin-request-policy/{Id}"
      )

      DELETE_PUBLIC_KEY = OperationModel.new(
        name: "DeletePublicKey",
        http_method: "DELETE",
        request_uri: "/2020-05-31/public-key/{Id}"
      )

      DELETE_REALTIME_LOG_CONFIG = OperationModel.new(
        name: "DeleteRealtimeLogConfig",
        http_method: "POST",
        request_uri: "/2020-05-31/delete-realtime-log-config"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/2020-05-31/delete-resource-policy"
      )

      DELETE_RESPONSE_HEADERS_POLICY = OperationModel.new(
        name: "DeleteResponseHeadersPolicy",
        http_method: "DELETE",
        request_uri: "/2020-05-31/response-headers-policy/{Id}"
      )

      DELETE_STREAMING_DISTRIBUTION = OperationModel.new(
        name: "DeleteStreamingDistribution",
        http_method: "DELETE",
        request_uri: "/2020-05-31/streaming-distribution/{Id}"
      )

      DELETE_TRUST_STORE = OperationModel.new(
        name: "DeleteTrustStore",
        http_method: "DELETE",
        request_uri: "/2020-05-31/trust-store/{Id}"
      )

      DELETE_VPC_ORIGIN = OperationModel.new(
        name: "DeleteVpcOrigin",
        http_method: "DELETE",
        request_uri: "/2020-05-31/vpc-origin/{Id}"
      )

      DESCRIBE_CONNECTION_FUNCTION = OperationModel.new(
        name: "DescribeConnectionFunction",
        http_method: "GET",
        request_uri: "/2020-05-31/connection-function/{Identifier}/describe"
      )

      DESCRIBE_FUNCTION = OperationModel.new(
        name: "DescribeFunction",
        http_method: "GET",
        request_uri: "/2020-05-31/function/{Name}/describe"
      )

      DESCRIBE_KEY_VALUE_STORE = OperationModel.new(
        name: "DescribeKeyValueStore",
        http_method: "GET",
        request_uri: "/2020-05-31/key-value-store/{Name}"
      )

      DISASSOCIATE_DISTRIBUTION_TENANT_WEB_ACL = OperationModel.new(
        name: "DisassociateDistributionTenantWebACL",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution-tenant/{Id}/disassociate-web-acl"
      )

      DISASSOCIATE_DISTRIBUTION_WEB_ACL = OperationModel.new(
        name: "DisassociateDistributionWebACL",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution/{Id}/disassociate-web-acl"
      )

      GET_ANYCAST_IP_LIST = OperationModel.new(
        name: "GetAnycastIpList",
        http_method: "GET",
        request_uri: "/2020-05-31/anycast-ip-list/{Id}"
      )

      GET_CACHE_POLICY = OperationModel.new(
        name: "GetCachePolicy",
        http_method: "GET",
        request_uri: "/2020-05-31/cache-policy/{Id}"
      )

      GET_CACHE_POLICY_CONFIG = OperationModel.new(
        name: "GetCachePolicyConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/cache-policy/{Id}/config"
      )

      GET_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY = OperationModel.new(
        name: "GetCloudFrontOriginAccessIdentity",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-access-identity/cloudfront/{Id}"
      )

      GET_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY_CONFIG = OperationModel.new(
        name: "GetCloudFrontOriginAccessIdentityConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-access-identity/cloudfront/{Id}/config"
      )

      GET_CONNECTION_FUNCTION = OperationModel.new(
        name: "GetConnectionFunction",
        http_method: "GET",
        request_uri: "/2020-05-31/connection-function/{Identifier}"
      )

      GET_CONNECTION_GROUP = OperationModel.new(
        name: "GetConnectionGroup",
        http_method: "GET",
        request_uri: "/2020-05-31/connection-group/{Identifier}"
      )

      GET_CONNECTION_GROUP_BY_ROUTING_ENDPOINT = OperationModel.new(
        name: "GetConnectionGroupByRoutingEndpoint",
        http_method: "GET",
        request_uri: "/2020-05-31/connection-group"
      )

      GET_CONTINUOUS_DEPLOYMENT_POLICY = OperationModel.new(
        name: "GetContinuousDeploymentPolicy",
        http_method: "GET",
        request_uri: "/2020-05-31/continuous-deployment-policy/{Id}"
      )

      GET_CONTINUOUS_DEPLOYMENT_POLICY_CONFIG = OperationModel.new(
        name: "GetContinuousDeploymentPolicyConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/continuous-deployment-policy/{Id}/config"
      )

      GET_DISTRIBUTION = OperationModel.new(
        name: "GetDistribution",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution/{Id}"
      )

      GET_DISTRIBUTION_CONFIG = OperationModel.new(
        name: "GetDistributionConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution/{Id}/config"
      )

      GET_DISTRIBUTION_TENANT = OperationModel.new(
        name: "GetDistributionTenant",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution-tenant/{Identifier}"
      )

      GET_DISTRIBUTION_TENANT_BY_DOMAIN = OperationModel.new(
        name: "GetDistributionTenantByDomain",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution-tenant"
      )

      GET_FIELD_LEVEL_ENCRYPTION = OperationModel.new(
        name: "GetFieldLevelEncryption",
        http_method: "GET",
        request_uri: "/2020-05-31/field-level-encryption/{Id}"
      )

      GET_FIELD_LEVEL_ENCRYPTION_CONFIG = OperationModel.new(
        name: "GetFieldLevelEncryptionConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/field-level-encryption/{Id}/config"
      )

      GET_FIELD_LEVEL_ENCRYPTION_PROFILE = OperationModel.new(
        name: "GetFieldLevelEncryptionProfile",
        http_method: "GET",
        request_uri: "/2020-05-31/field-level-encryption-profile/{Id}"
      )

      GET_FIELD_LEVEL_ENCRYPTION_PROFILE_CONFIG = OperationModel.new(
        name: "GetFieldLevelEncryptionProfileConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/field-level-encryption-profile/{Id}/config"
      )

      GET_FUNCTION = OperationModel.new(
        name: "GetFunction",
        http_method: "GET",
        request_uri: "/2020-05-31/function/{Name}"
      )

      GET_INVALIDATION = OperationModel.new(
        name: "GetInvalidation",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution/{DistributionId}/invalidation/{Id}"
      )

      GET_INVALIDATION_FOR_DISTRIBUTION_TENANT = OperationModel.new(
        name: "GetInvalidationForDistributionTenant",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution-tenant/{DistributionTenantId}/invalidation/{Id}"
      )

      GET_KEY_GROUP = OperationModel.new(
        name: "GetKeyGroup",
        http_method: "GET",
        request_uri: "/2020-05-31/key-group/{Id}"
      )

      GET_KEY_GROUP_CONFIG = OperationModel.new(
        name: "GetKeyGroupConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/key-group/{Id}/config"
      )

      GET_MANAGED_CERTIFICATE_DETAILS = OperationModel.new(
        name: "GetManagedCertificateDetails",
        http_method: "GET",
        request_uri: "/2020-05-31/managed-certificate/{Identifier}"
      )

      GET_MONITORING_SUBSCRIPTION = OperationModel.new(
        name: "GetMonitoringSubscription",
        http_method: "GET",
        request_uri: "/2020-05-31/distributions/{DistributionId}/monitoring-subscription"
      )

      GET_ORIGIN_ACCESS_CONTROL = OperationModel.new(
        name: "GetOriginAccessControl",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-access-control/{Id}"
      )

      GET_ORIGIN_ACCESS_CONTROL_CONFIG = OperationModel.new(
        name: "GetOriginAccessControlConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-access-control/{Id}/config"
      )

      GET_ORIGIN_REQUEST_POLICY = OperationModel.new(
        name: "GetOriginRequestPolicy",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-request-policy/{Id}"
      )

      GET_ORIGIN_REQUEST_POLICY_CONFIG = OperationModel.new(
        name: "GetOriginRequestPolicyConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-request-policy/{Id}/config"
      )

      GET_PUBLIC_KEY = OperationModel.new(
        name: "GetPublicKey",
        http_method: "GET",
        request_uri: "/2020-05-31/public-key/{Id}"
      )

      GET_PUBLIC_KEY_CONFIG = OperationModel.new(
        name: "GetPublicKeyConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/public-key/{Id}/config"
      )

      GET_REALTIME_LOG_CONFIG = OperationModel.new(
        name: "GetRealtimeLogConfig",
        http_method: "POST",
        request_uri: "/2020-05-31/get-realtime-log-config"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/2020-05-31/get-resource-policy"
      )

      GET_RESPONSE_HEADERS_POLICY = OperationModel.new(
        name: "GetResponseHeadersPolicy",
        http_method: "GET",
        request_uri: "/2020-05-31/response-headers-policy/{Id}"
      )

      GET_RESPONSE_HEADERS_POLICY_CONFIG = OperationModel.new(
        name: "GetResponseHeadersPolicyConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/response-headers-policy/{Id}/config"
      )

      GET_STREAMING_DISTRIBUTION = OperationModel.new(
        name: "GetStreamingDistribution",
        http_method: "GET",
        request_uri: "/2020-05-31/streaming-distribution/{Id}"
      )

      GET_STREAMING_DISTRIBUTION_CONFIG = OperationModel.new(
        name: "GetStreamingDistributionConfig",
        http_method: "GET",
        request_uri: "/2020-05-31/streaming-distribution/{Id}/config"
      )

      GET_TRUST_STORE = OperationModel.new(
        name: "GetTrustStore",
        http_method: "GET",
        request_uri: "/2020-05-31/trust-store/{Identifier}"
      )

      GET_VPC_ORIGIN = OperationModel.new(
        name: "GetVpcOrigin",
        http_method: "GET",
        request_uri: "/2020-05-31/vpc-origin/{Id}"
      )

      LIST_ANYCAST_IP_LISTS = OperationModel.new(
        name: "ListAnycastIpLists",
        http_method: "GET",
        request_uri: "/2020-05-31/anycast-ip-list"
      )

      LIST_CACHE_POLICIES = OperationModel.new(
        name: "ListCachePolicies",
        http_method: "GET",
        request_uri: "/2020-05-31/cache-policy"
      )

      LIST_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITIES = OperationModel.new(
        name: "ListCloudFrontOriginAccessIdentities",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-access-identity/cloudfront"
      )

      LIST_CONFLICTING_ALIASES = OperationModel.new(
        name: "ListConflictingAliases",
        http_method: "GET",
        request_uri: "/2020-05-31/conflicting-alias"
      )

      LIST_CONNECTION_FUNCTIONS = OperationModel.new(
        name: "ListConnectionFunctions",
        http_method: "POST",
        request_uri: "/2020-05-31/connection-functions"
      )

      LIST_CONNECTION_GROUPS = OperationModel.new(
        name: "ListConnectionGroups",
        http_method: "POST",
        request_uri: "/2020-05-31/connection-groups"
      )

      LIST_CONTINUOUS_DEPLOYMENT_POLICIES = OperationModel.new(
        name: "ListContinuousDeploymentPolicies",
        http_method: "GET",
        request_uri: "/2020-05-31/continuous-deployment-policy"
      )

      LIST_DISTRIBUTION_TENANTS = OperationModel.new(
        name: "ListDistributionTenants",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution-tenants"
      )

      LIST_DISTRIBUTION_TENANTS_BY_CUSTOMIZATION = OperationModel.new(
        name: "ListDistributionTenantsByCustomization",
        http_method: "POST",
        request_uri: "/2020-05-31/distribution-tenants-by-customization"
      )

      LIST_DISTRIBUTIONS = OperationModel.new(
        name: "ListDistributions",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution"
      )

      LIST_DISTRIBUTIONS_BY_ANYCAST_IP_LIST_ID = OperationModel.new(
        name: "ListDistributionsByAnycastIpListId",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByAnycastIpListId/{AnycastIpListId}"
      )

      LIST_DISTRIBUTIONS_BY_CACHE_POLICY_ID = OperationModel.new(
        name: "ListDistributionsByCachePolicyId",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByCachePolicyId/{CachePolicyId}"
      )

      LIST_DISTRIBUTIONS_BY_CONNECTION_FUNCTION = OperationModel.new(
        name: "ListDistributionsByConnectionFunction",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByConnectionFunction"
      )

      LIST_DISTRIBUTIONS_BY_CONNECTION_MODE = OperationModel.new(
        name: "ListDistributionsByConnectionMode",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByConnectionMode/{ConnectionMode}"
      )

      LIST_DISTRIBUTIONS_BY_KEY_GROUP = OperationModel.new(
        name: "ListDistributionsByKeyGroup",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByKeyGroupId/{KeyGroupId}"
      )

      LIST_DISTRIBUTIONS_BY_ORIGIN_REQUEST_POLICY_ID = OperationModel.new(
        name: "ListDistributionsByOriginRequestPolicyId",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByOriginRequestPolicyId/{OriginRequestPolicyId}"
      )

      LIST_DISTRIBUTIONS_BY_OWNED_RESOURCE = OperationModel.new(
        name: "ListDistributionsByOwnedResource",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByOwnedResource/{ResourceArn}"
      )

      LIST_DISTRIBUTIONS_BY_REALTIME_LOG_CONFIG = OperationModel.new(
        name: "ListDistributionsByRealtimeLogConfig",
        http_method: "POST",
        request_uri: "/2020-05-31/distributionsByRealtimeLogConfig"
      )

      LIST_DISTRIBUTIONS_BY_RESPONSE_HEADERS_POLICY_ID = OperationModel.new(
        name: "ListDistributionsByResponseHeadersPolicyId",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByResponseHeadersPolicyId/{ResponseHeadersPolicyId}"
      )

      LIST_DISTRIBUTIONS_BY_TRUST_STORE = OperationModel.new(
        name: "ListDistributionsByTrustStore",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByTrustStore"
      )

      LIST_DISTRIBUTIONS_BY_VPC_ORIGIN_ID = OperationModel.new(
        name: "ListDistributionsByVpcOriginId",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByVpcOriginId/{VpcOriginId}"
      )

      LIST_DISTRIBUTIONS_BY_WEB_ACL_ID = OperationModel.new(
        name: "ListDistributionsByWebACLId",
        http_method: "GET",
        request_uri: "/2020-05-31/distributionsByWebACLId/{WebACLId}"
      )

      LIST_DOMAIN_CONFLICTS = OperationModel.new(
        name: "ListDomainConflicts",
        http_method: "POST",
        request_uri: "/2020-05-31/domain-conflicts"
      )

      LIST_FIELD_LEVEL_ENCRYPTION_CONFIGS = OperationModel.new(
        name: "ListFieldLevelEncryptionConfigs",
        http_method: "GET",
        request_uri: "/2020-05-31/field-level-encryption"
      )

      LIST_FIELD_LEVEL_ENCRYPTION_PROFILES = OperationModel.new(
        name: "ListFieldLevelEncryptionProfiles",
        http_method: "GET",
        request_uri: "/2020-05-31/field-level-encryption-profile"
      )

      LIST_FUNCTIONS = OperationModel.new(
        name: "ListFunctions",
        http_method: "GET",
        request_uri: "/2020-05-31/function"
      )

      LIST_INVALIDATIONS = OperationModel.new(
        name: "ListInvalidations",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution/{DistributionId}/invalidation"
      )

      LIST_INVALIDATIONS_FOR_DISTRIBUTION_TENANT = OperationModel.new(
        name: "ListInvalidationsForDistributionTenant",
        http_method: "GET",
        request_uri: "/2020-05-31/distribution-tenant/{Id}/invalidation"
      )

      LIST_KEY_GROUPS = OperationModel.new(
        name: "ListKeyGroups",
        http_method: "GET",
        request_uri: "/2020-05-31/key-group"
      )

      LIST_KEY_VALUE_STORES = OperationModel.new(
        name: "ListKeyValueStores",
        http_method: "GET",
        request_uri: "/2020-05-31/key-value-store"
      )

      LIST_ORIGIN_ACCESS_CONTROLS = OperationModel.new(
        name: "ListOriginAccessControls",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-access-control"
      )

      LIST_ORIGIN_REQUEST_POLICIES = OperationModel.new(
        name: "ListOriginRequestPolicies",
        http_method: "GET",
        request_uri: "/2020-05-31/origin-request-policy"
      )

      LIST_PUBLIC_KEYS = OperationModel.new(
        name: "ListPublicKeys",
        http_method: "GET",
        request_uri: "/2020-05-31/public-key"
      )

      LIST_REALTIME_LOG_CONFIGS = OperationModel.new(
        name: "ListRealtimeLogConfigs",
        http_method: "GET",
        request_uri: "/2020-05-31/realtime-log-config"
      )

      LIST_RESPONSE_HEADERS_POLICIES = OperationModel.new(
        name: "ListResponseHeadersPolicies",
        http_method: "GET",
        request_uri: "/2020-05-31/response-headers-policy"
      )

      LIST_STREAMING_DISTRIBUTIONS = OperationModel.new(
        name: "ListStreamingDistributions",
        http_method: "GET",
        request_uri: "/2020-05-31/streaming-distribution"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/2020-05-31/tagging"
      )

      LIST_TRUST_STORES = OperationModel.new(
        name: "ListTrustStores",
        http_method: "POST",
        request_uri: "/2020-05-31/trust-stores"
      )

      LIST_VPC_ORIGINS = OperationModel.new(
        name: "ListVpcOrigins",
        http_method: "GET",
        request_uri: "/2020-05-31/vpc-origin"
      )

      PUBLISH_CONNECTION_FUNCTION = OperationModel.new(
        name: "PublishConnectionFunction",
        http_method: "POST",
        request_uri: "/2020-05-31/connection-function/{Id}/publish"
      )

      PUBLISH_FUNCTION = OperationModel.new(
        name: "PublishFunction",
        http_method: "POST",
        request_uri: "/2020-05-31/function/{Name}/publish"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/2020-05-31/put-resource-policy"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/2020-05-31/tagging?Operation=Tag"
      )

      TEST_CONNECTION_FUNCTION = OperationModel.new(
        name: "TestConnectionFunction",
        http_method: "POST",
        request_uri: "/2020-05-31/connection-function/{Id}/test"
      )

      TEST_FUNCTION = OperationModel.new(
        name: "TestFunction",
        http_method: "POST",
        request_uri: "/2020-05-31/function/{Name}/test"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/2020-05-31/tagging?Operation=Untag"
      )

      UPDATE_ANYCAST_IP_LIST = OperationModel.new(
        name: "UpdateAnycastIpList",
        http_method: "PUT",
        request_uri: "/2020-05-31/anycast-ip-list/{Id}"
      )

      UPDATE_CACHE_POLICY = OperationModel.new(
        name: "UpdateCachePolicy",
        http_method: "PUT",
        request_uri: "/2020-05-31/cache-policy/{Id}"
      )

      UPDATE_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY = OperationModel.new(
        name: "UpdateCloudFrontOriginAccessIdentity",
        http_method: "PUT",
        request_uri: "/2020-05-31/origin-access-identity/cloudfront/{Id}/config"
      )

      UPDATE_CONNECTION_FUNCTION = OperationModel.new(
        name: "UpdateConnectionFunction",
        http_method: "PUT",
        request_uri: "/2020-05-31/connection-function/{Id}"
      )

      UPDATE_CONNECTION_GROUP = OperationModel.new(
        name: "UpdateConnectionGroup",
        http_method: "PUT",
        request_uri: "/2020-05-31/connection-group/{Id}"
      )

      UPDATE_CONTINUOUS_DEPLOYMENT_POLICY = OperationModel.new(
        name: "UpdateContinuousDeploymentPolicy",
        http_method: "PUT",
        request_uri: "/2020-05-31/continuous-deployment-policy/{Id}"
      )

      UPDATE_DISTRIBUTION = OperationModel.new(
        name: "UpdateDistribution",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution/{Id}/config"
      )

      UPDATE_DISTRIBUTION_TENANT = OperationModel.new(
        name: "UpdateDistributionTenant",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution-tenant/{Id}"
      )

      UPDATE_DISTRIBUTION_WITH_STAGING_CONFIG = OperationModel.new(
        name: "UpdateDistributionWithStagingConfig",
        http_method: "PUT",
        request_uri: "/2020-05-31/distribution/{Id}/promote-staging-config"
      )

      UPDATE_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "UpdateDomainAssociation",
        http_method: "POST",
        request_uri: "/2020-05-31/domain-association"
      )

      UPDATE_FIELD_LEVEL_ENCRYPTION_CONFIG = OperationModel.new(
        name: "UpdateFieldLevelEncryptionConfig",
        http_method: "PUT",
        request_uri: "/2020-05-31/field-level-encryption/{Id}/config"
      )

      UPDATE_FIELD_LEVEL_ENCRYPTION_PROFILE = OperationModel.new(
        name: "UpdateFieldLevelEncryptionProfile",
        http_method: "PUT",
        request_uri: "/2020-05-31/field-level-encryption-profile/{Id}/config"
      )

      UPDATE_FUNCTION = OperationModel.new(
        name: "UpdateFunction",
        http_method: "PUT",
        request_uri: "/2020-05-31/function/{Name}"
      )

      UPDATE_KEY_GROUP = OperationModel.new(
        name: "UpdateKeyGroup",
        http_method: "PUT",
        request_uri: "/2020-05-31/key-group/{Id}"
      )

      UPDATE_KEY_VALUE_STORE = OperationModel.new(
        name: "UpdateKeyValueStore",
        http_method: "PUT",
        request_uri: "/2020-05-31/key-value-store/{Name}"
      )

      UPDATE_ORIGIN_ACCESS_CONTROL = OperationModel.new(
        name: "UpdateOriginAccessControl",
        http_method: "PUT",
        request_uri: "/2020-05-31/origin-access-control/{Id}/config"
      )

      UPDATE_ORIGIN_REQUEST_POLICY = OperationModel.new(
        name: "UpdateOriginRequestPolicy",
        http_method: "PUT",
        request_uri: "/2020-05-31/origin-request-policy/{Id}"
      )

      UPDATE_PUBLIC_KEY = OperationModel.new(
        name: "UpdatePublicKey",
        http_method: "PUT",
        request_uri: "/2020-05-31/public-key/{Id}/config"
      )

      UPDATE_REALTIME_LOG_CONFIG = OperationModel.new(
        name: "UpdateRealtimeLogConfig",
        http_method: "PUT",
        request_uri: "/2020-05-31/realtime-log-config"
      )

      UPDATE_RESPONSE_HEADERS_POLICY = OperationModel.new(
        name: "UpdateResponseHeadersPolicy",
        http_method: "PUT",
        request_uri: "/2020-05-31/response-headers-policy/{Id}"
      )

      UPDATE_STREAMING_DISTRIBUTION = OperationModel.new(
        name: "UpdateStreamingDistribution",
        http_method: "PUT",
        request_uri: "/2020-05-31/streaming-distribution/{Id}/config"
      )

      UPDATE_TRUST_STORE = OperationModel.new(
        name: "UpdateTrustStore",
        http_method: "PUT",
        request_uri: "/2020-05-31/trust-store/{Id}"
      )

      UPDATE_VPC_ORIGIN = OperationModel.new(
        name: "UpdateVpcOrigin",
        http_method: "PUT",
        request_uri: "/2020-05-31/vpc-origin/{Id}"
      )

      VERIFY_DNS_CONFIGURATION = OperationModel.new(
        name: "VerifyDnsConfiguration",
        http_method: "POST",
        request_uri: "/2020-05-31/verify-dns-configuration"
      )
    end
  end
end
