module AwsSdk
  module VerifiedPermissions
    module Model
      API_VERSION = "2021-12-01"
      TARGET_PREFIX = "VerifiedPermissions"
      SIGNING_NAME = "verifiedpermissions"
      ENDPOINT_PREFIX = "verifiedpermissions"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://verifiedpermissions-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://verifiedpermissions-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://verifiedpermissions.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://verifiedpermissions.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_POLICY = OperationModel.new(
        name: "BatchGetPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_IS_AUTHORIZED = OperationModel.new(
        name: "BatchIsAuthorized",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_IS_AUTHORIZED_WITH_TOKEN = OperationModel.new(
        name: "BatchIsAuthorizedWithToken",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IDENTITY_SOURCE = OperationModel.new(
        name: "CreateIdentitySource",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_POLICY = OperationModel.new(
        name: "CreatePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_POLICY_STORE = OperationModel.new(
        name: "CreatePolicyStore",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_POLICY_TEMPLATE = OperationModel.new(
        name: "CreatePolicyTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITY_SOURCE = OperationModel.new(
        name: "DeleteIdentitySource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY_STORE = OperationModel.new(
        name: "DeletePolicyStore",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY_TEMPLATE = OperationModel.new(
        name: "DeletePolicyTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_SOURCE = OperationModel.new(
        name: "GetIdentitySource",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICY_STORE = OperationModel.new(
        name: "GetPolicyStore",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICY_TEMPLATE = OperationModel.new(
        name: "GetPolicyTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEMA = OperationModel.new(
        name: "GetSchema",
        http_method: "POST",
        request_uri: "/"
      )

      IS_AUTHORIZED = OperationModel.new(
        name: "IsAuthorized",
        http_method: "POST",
        request_uri: "/"
      )

      IS_AUTHORIZED_WITH_TOKEN = OperationModel.new(
        name: "IsAuthorizedWithToken",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IDENTITY_SOURCES = OperationModel.new(
        name: "ListIdentitySources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICIES = OperationModel.new(
        name: "ListPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICY_STORES = OperationModel.new(
        name: "ListPolicyStores",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICY_TEMPLATES = OperationModel.new(
        name: "ListPolicyTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SCHEMA = OperationModel.new(
        name: "PutSchema",
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

      UPDATE_IDENTITY_SOURCE = OperationModel.new(
        name: "UpdateIdentitySource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_POLICY = OperationModel.new(
        name: "UpdatePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_POLICY_STORE = OperationModel.new(
        name: "UpdatePolicyStore",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_POLICY_TEMPLATE = OperationModel.new(
        name: "UpdatePolicyTemplate",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
