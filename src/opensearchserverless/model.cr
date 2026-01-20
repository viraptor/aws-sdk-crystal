module Aws
  module OpenSearchServerless
    module Model
      API_VERSION = "2021-11-01"
      TARGET_PREFIX = "OpenSearchServerless"
      SIGNING_NAME = "aoss"
      ENDPOINT_PREFIX = "aoss"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aoss-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aoss-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aoss.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aoss.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_COLLECTION = OperationModel.new(
        name: "BatchGetCollection",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_COLLECTION_GROUP = OperationModel.new(
        name: "BatchGetCollectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_EFFECTIVE_LIFECYCLE_POLICY = OperationModel.new(
        name: "BatchGetEffectiveLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_LIFECYCLE_POLICY = OperationModel.new(
        name: "BatchGetLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_VPC_ENDPOINT = OperationModel.new(
        name: "BatchGetVpcEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCESS_POLICY = OperationModel.new(
        name: "CreateAccessPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COLLECTION = OperationModel.new(
        name: "CreateCollection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COLLECTION_GROUP = OperationModel.new(
        name: "CreateCollectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INDEX = OperationModel.new(
        name: "CreateIndex",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LIFECYCLE_POLICY = OperationModel.new(
        name: "CreateLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SECURITY_CONFIG = OperationModel.new(
        name: "CreateSecurityConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SECURITY_POLICY = OperationModel.new(
        name: "CreateSecurityPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_ENDPOINT = OperationModel.new(
        name: "CreateVpcEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCESS_POLICY = OperationModel.new(
        name: "DeleteAccessPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COLLECTION = OperationModel.new(
        name: "DeleteCollection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COLLECTION_GROUP = OperationModel.new(
        name: "DeleteCollectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INDEX = OperationModel.new(
        name: "DeleteIndex",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LIFECYCLE_POLICY = OperationModel.new(
        name: "DeleteLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SECURITY_CONFIG = OperationModel.new(
        name: "DeleteSecurityConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SECURITY_POLICY = OperationModel.new(
        name: "DeleteSecurityPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_ENDPOINT = OperationModel.new(
        name: "DeleteVpcEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCESS_POLICY = OperationModel.new(
        name: "GetAccessPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_SETTINGS = OperationModel.new(
        name: "GetAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INDEX = OperationModel.new(
        name: "GetIndex",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICIES_STATS = OperationModel.new(
        name: "GetPoliciesStats",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SECURITY_CONFIG = OperationModel.new(
        name: "GetSecurityConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SECURITY_POLICY = OperationModel.new(
        name: "GetSecurityPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCESS_POLICIES = OperationModel.new(
        name: "ListAccessPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COLLECTION_GROUPS = OperationModel.new(
        name: "ListCollectionGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COLLECTIONS = OperationModel.new(
        name: "ListCollections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LIFECYCLE_POLICIES = OperationModel.new(
        name: "ListLifecyclePolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SECURITY_CONFIGS = OperationModel.new(
        name: "ListSecurityConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SECURITY_POLICIES = OperationModel.new(
        name: "ListSecurityPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VPC_ENDPOINTS = OperationModel.new(
        name: "ListVpcEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCESS_POLICY = OperationModel.new(
        name: "UpdateAccessPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COLLECTION = OperationModel.new(
        name: "UpdateCollection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COLLECTION_GROUP = OperationModel.new(
        name: "UpdateCollectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INDEX = OperationModel.new(
        name: "UpdateIndex",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LIFECYCLE_POLICY = OperationModel.new(
        name: "UpdateLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SECURITY_CONFIG = OperationModel.new(
        name: "UpdateSecurityConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SECURITY_POLICY = OperationModel.new(
        name: "UpdateSecurityPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VPC_ENDPOINT = OperationModel.new(
        name: "UpdateVpcEndpoint",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
