module Aws
  module EKS
    module Model
      API_VERSION = "2017-11-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "eks"
      ENDPOINT_PREFIX = "eks"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://eks-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"endpoint":{"url":"https://fips.eks.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://eks.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://eks-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://eks.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://eks.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ACCESS_POLICY = OperationModel.new(
        name: "AssociateAccessPolicy",
        http_method: "POST",
        request_uri: "/clusters/{name}/access-entries/{principalArn}/access-policies"
      )

      ASSOCIATE_ENCRYPTION_CONFIG = OperationModel.new(
        name: "AssociateEncryptionConfig",
        http_method: "POST",
        request_uri: "/clusters/{name}/encryption-config/associate"
      )

      ASSOCIATE_IDENTITY_PROVIDER_CONFIG = OperationModel.new(
        name: "AssociateIdentityProviderConfig",
        http_method: "POST",
        request_uri: "/clusters/{name}/identity-provider-configs/associate"
      )

      CREATE_ACCESS_ENTRY = OperationModel.new(
        name: "CreateAccessEntry",
        http_method: "POST",
        request_uri: "/clusters/{name}/access-entries"
      )

      CREATE_ADDON = OperationModel.new(
        name: "CreateAddon",
        http_method: "POST",
        request_uri: "/clusters/{name}/addons"
      )

      CREATE_CAPABILITY = OperationModel.new(
        name: "CreateCapability",
        http_method: "POST",
        request_uri: "/clusters/{name}/capabilities"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/clusters"
      )

      CREATE_EKS_ANYWHERE_SUBSCRIPTION = OperationModel.new(
        name: "CreateEksAnywhereSubscription",
        http_method: "POST",
        request_uri: "/eks-anywhere-subscriptions"
      )

      CREATE_FARGATE_PROFILE = OperationModel.new(
        name: "CreateFargateProfile",
        http_method: "POST",
        request_uri: "/clusters/{name}/fargate-profiles"
      )

      CREATE_NODEGROUP = OperationModel.new(
        name: "CreateNodegroup",
        http_method: "POST",
        request_uri: "/clusters/{name}/node-groups"
      )

      CREATE_POD_IDENTITY_ASSOCIATION = OperationModel.new(
        name: "CreatePodIdentityAssociation",
        http_method: "POST",
        request_uri: "/clusters/{name}/pod-identity-associations"
      )

      DELETE_ACCESS_ENTRY = OperationModel.new(
        name: "DeleteAccessEntry",
        http_method: "DELETE",
        request_uri: "/clusters/{name}/access-entries/{principalArn}"
      )

      DELETE_ADDON = OperationModel.new(
        name: "DeleteAddon",
        http_method: "DELETE",
        request_uri: "/clusters/{name}/addons/{addonName}"
      )

      DELETE_CAPABILITY = OperationModel.new(
        name: "DeleteCapability",
        http_method: "DELETE",
        request_uri: "/clusters/{name}/capabilities/{capabilityName}"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "DELETE",
        request_uri: "/clusters/{name}"
      )

      DELETE_EKS_ANYWHERE_SUBSCRIPTION = OperationModel.new(
        name: "DeleteEksAnywhereSubscription",
        http_method: "DELETE",
        request_uri: "/eks-anywhere-subscriptions/{id}"
      )

      DELETE_FARGATE_PROFILE = OperationModel.new(
        name: "DeleteFargateProfile",
        http_method: "DELETE",
        request_uri: "/clusters/{name}/fargate-profiles/{fargateProfileName}"
      )

      DELETE_NODEGROUP = OperationModel.new(
        name: "DeleteNodegroup",
        http_method: "DELETE",
        request_uri: "/clusters/{name}/node-groups/{nodegroupName}"
      )

      DELETE_POD_IDENTITY_ASSOCIATION = OperationModel.new(
        name: "DeletePodIdentityAssociation",
        http_method: "DELETE",
        request_uri: "/clusters/{name}/pod-identity-associations/{associationId}"
      )

      DEREGISTER_CLUSTER = OperationModel.new(
        name: "DeregisterCluster",
        http_method: "DELETE",
        request_uri: "/cluster-registrations/{name}"
      )

      DESCRIBE_ACCESS_ENTRY = OperationModel.new(
        name: "DescribeAccessEntry",
        http_method: "GET",
        request_uri: "/clusters/{name}/access-entries/{principalArn}"
      )

      DESCRIBE_ADDON = OperationModel.new(
        name: "DescribeAddon",
        http_method: "GET",
        request_uri: "/clusters/{name}/addons/{addonName}"
      )

      DESCRIBE_ADDON_CONFIGURATION = OperationModel.new(
        name: "DescribeAddonConfiguration",
        http_method: "GET",
        request_uri: "/addons/configuration-schemas"
      )

      DESCRIBE_ADDON_VERSIONS = OperationModel.new(
        name: "DescribeAddonVersions",
        http_method: "GET",
        request_uri: "/addons/supported-versions"
      )

      DESCRIBE_CAPABILITY = OperationModel.new(
        name: "DescribeCapability",
        http_method: "GET",
        request_uri: "/clusters/{name}/capabilities/{capabilityName}"
      )

      DESCRIBE_CLUSTER = OperationModel.new(
        name: "DescribeCluster",
        http_method: "GET",
        request_uri: "/clusters/{name}"
      )

      DESCRIBE_CLUSTER_VERSIONS = OperationModel.new(
        name: "DescribeClusterVersions",
        http_method: "GET",
        request_uri: "/cluster-versions"
      )

      DESCRIBE_EKS_ANYWHERE_SUBSCRIPTION = OperationModel.new(
        name: "DescribeEksAnywhereSubscription",
        http_method: "GET",
        request_uri: "/eks-anywhere-subscriptions/{id}"
      )

      DESCRIBE_FARGATE_PROFILE = OperationModel.new(
        name: "DescribeFargateProfile",
        http_method: "GET",
        request_uri: "/clusters/{name}/fargate-profiles/{fargateProfileName}"
      )

      DESCRIBE_IDENTITY_PROVIDER_CONFIG = OperationModel.new(
        name: "DescribeIdentityProviderConfig",
        http_method: "POST",
        request_uri: "/clusters/{name}/identity-provider-configs/describe"
      )

      DESCRIBE_INSIGHT = OperationModel.new(
        name: "DescribeInsight",
        http_method: "GET",
        request_uri: "/clusters/{name}/insights/{id}"
      )

      DESCRIBE_INSIGHTS_REFRESH = OperationModel.new(
        name: "DescribeInsightsRefresh",
        http_method: "GET",
        request_uri: "/clusters/{name}/insights-refresh"
      )

      DESCRIBE_NODEGROUP = OperationModel.new(
        name: "DescribeNodegroup",
        http_method: "GET",
        request_uri: "/clusters/{name}/node-groups/{nodegroupName}"
      )

      DESCRIBE_POD_IDENTITY_ASSOCIATION = OperationModel.new(
        name: "DescribePodIdentityAssociation",
        http_method: "GET",
        request_uri: "/clusters/{name}/pod-identity-associations/{associationId}"
      )

      DESCRIBE_UPDATE = OperationModel.new(
        name: "DescribeUpdate",
        http_method: "GET",
        request_uri: "/clusters/{name}/updates/{updateId}"
      )

      DISASSOCIATE_ACCESS_POLICY = OperationModel.new(
        name: "DisassociateAccessPolicy",
        http_method: "DELETE",
        request_uri: "/clusters/{name}/access-entries/{principalArn}/access-policies/{policyArn}"
      )

      DISASSOCIATE_IDENTITY_PROVIDER_CONFIG = OperationModel.new(
        name: "DisassociateIdentityProviderConfig",
        http_method: "POST",
        request_uri: "/clusters/{name}/identity-provider-configs/disassociate"
      )

      LIST_ACCESS_ENTRIES = OperationModel.new(
        name: "ListAccessEntries",
        http_method: "GET",
        request_uri: "/clusters/{name}/access-entries"
      )

      LIST_ACCESS_POLICIES = OperationModel.new(
        name: "ListAccessPolicies",
        http_method: "GET",
        request_uri: "/access-policies"
      )

      LIST_ADDONS = OperationModel.new(
        name: "ListAddons",
        http_method: "GET",
        request_uri: "/clusters/{name}/addons"
      )

      LIST_ASSOCIATED_ACCESS_POLICIES = OperationModel.new(
        name: "ListAssociatedAccessPolicies",
        http_method: "GET",
        request_uri: "/clusters/{name}/access-entries/{principalArn}/access-policies"
      )

      LIST_CAPABILITIES = OperationModel.new(
        name: "ListCapabilities",
        http_method: "GET",
        request_uri: "/clusters/{name}/capabilities"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "GET",
        request_uri: "/clusters"
      )

      LIST_EKS_ANYWHERE_SUBSCRIPTIONS = OperationModel.new(
        name: "ListEksAnywhereSubscriptions",
        http_method: "GET",
        request_uri: "/eks-anywhere-subscriptions"
      )

      LIST_FARGATE_PROFILES = OperationModel.new(
        name: "ListFargateProfiles",
        http_method: "GET",
        request_uri: "/clusters/{name}/fargate-profiles"
      )

      LIST_IDENTITY_PROVIDER_CONFIGS = OperationModel.new(
        name: "ListIdentityProviderConfigs",
        http_method: "GET",
        request_uri: "/clusters/{name}/identity-provider-configs"
      )

      LIST_INSIGHTS = OperationModel.new(
        name: "ListInsights",
        http_method: "POST",
        request_uri: "/clusters/{name}/insights"
      )

      LIST_NODEGROUPS = OperationModel.new(
        name: "ListNodegroups",
        http_method: "GET",
        request_uri: "/clusters/{name}/node-groups"
      )

      LIST_POD_IDENTITY_ASSOCIATIONS = OperationModel.new(
        name: "ListPodIdentityAssociations",
        http_method: "GET",
        request_uri: "/clusters/{name}/pod-identity-associations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_UPDATES = OperationModel.new(
        name: "ListUpdates",
        http_method: "GET",
        request_uri: "/clusters/{name}/updates"
      )

      REGISTER_CLUSTER = OperationModel.new(
        name: "RegisterCluster",
        http_method: "POST",
        request_uri: "/cluster-registrations"
      )

      START_INSIGHTS_REFRESH = OperationModel.new(
        name: "StartInsightsRefresh",
        http_method: "POST",
        request_uri: "/clusters/{name}/insights-refresh"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_ACCESS_ENTRY = OperationModel.new(
        name: "UpdateAccessEntry",
        http_method: "POST",
        request_uri: "/clusters/{name}/access-entries/{principalArn}"
      )

      UPDATE_ADDON = OperationModel.new(
        name: "UpdateAddon",
        http_method: "POST",
        request_uri: "/clusters/{name}/addons/{addonName}/update"
      )

      UPDATE_CAPABILITY = OperationModel.new(
        name: "UpdateCapability",
        http_method: "POST",
        request_uri: "/clusters/{name}/capabilities/{capabilityName}"
      )

      UPDATE_CLUSTER_CONFIG = OperationModel.new(
        name: "UpdateClusterConfig",
        http_method: "POST",
        request_uri: "/clusters/{name}/update-config"
      )

      UPDATE_CLUSTER_VERSION = OperationModel.new(
        name: "UpdateClusterVersion",
        http_method: "POST",
        request_uri: "/clusters/{name}/updates"
      )

      UPDATE_EKS_ANYWHERE_SUBSCRIPTION = OperationModel.new(
        name: "UpdateEksAnywhereSubscription",
        http_method: "POST",
        request_uri: "/eks-anywhere-subscriptions/{id}"
      )

      UPDATE_NODEGROUP_CONFIG = OperationModel.new(
        name: "UpdateNodegroupConfig",
        http_method: "POST",
        request_uri: "/clusters/{name}/node-groups/{nodegroupName}/update-config"
      )

      UPDATE_NODEGROUP_VERSION = OperationModel.new(
        name: "UpdateNodegroupVersion",
        http_method: "POST",
        request_uri: "/clusters/{name}/node-groups/{nodegroupName}/update-version"
      )

      UPDATE_POD_IDENTITY_ASSOCIATION = OperationModel.new(
        name: "UpdatePodIdentityAssociation",
        http_method: "POST",
        request_uri: "/clusters/{name}/pod-identity-associations/{associationId}"
      )
    end
  end
end
