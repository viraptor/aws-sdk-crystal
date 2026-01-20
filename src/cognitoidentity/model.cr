module Aws
  module CognitoIdentity
    module Model
      API_VERSION = "2014-06-30"
      TARGET_PREFIX = "AWSCognitoIdentityService"
      SIGNING_NAME = "cognito-identity"
      ENDPOINT_PREFIX = "cognito-identity"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-east-1"]}],"endpoint":{"url":"https://cognito-identity-fips.us-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-east-2"]}],"endpoint":{"url":"https://cognito-identity-fips.us-east-2.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-west-1"]}],"endpoint":{"url":"https://cognito-identity-fips.us-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-west-2"]}],"endpoint":{"url":"https://cognito-identity-fips.us-west-2.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://cognito-identity-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cognito-identity-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://cognito-identity.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://cognito-identity.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cognito-identity.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_IDENTITY_POOL = OperationModel.new(
        name: "CreateIdentityPool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITIES = OperationModel.new(
        name: "DeleteIdentities",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITY_POOL = OperationModel.new(
        name: "DeleteIdentityPool",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IDENTITY = OperationModel.new(
        name: "DescribeIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IDENTITY_POOL = OperationModel.new(
        name: "DescribeIdentityPool",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CREDENTIALS_FOR_IDENTITY = OperationModel.new(
        name: "GetCredentialsForIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ID = OperationModel.new(
        name: "GetId",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_POOL_ROLES = OperationModel.new(
        name: "GetIdentityPoolRoles",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPEN_ID_TOKEN = OperationModel.new(
        name: "GetOpenIdToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPEN_ID_TOKEN_FOR_DEVELOPER_IDENTITY = OperationModel.new(
        name: "GetOpenIdTokenForDeveloperIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PRINCIPAL_TAG_ATTRIBUTE_MAP = OperationModel.new(
        name: "GetPrincipalTagAttributeMap",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IDENTITIES = OperationModel.new(
        name: "ListIdentities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IDENTITY_POOLS = OperationModel.new(
        name: "ListIdentityPools",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LOOKUP_DEVELOPER_IDENTITY = OperationModel.new(
        name: "LookupDeveloperIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_DEVELOPER_IDENTITIES = OperationModel.new(
        name: "MergeDeveloperIdentities",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IDENTITY_POOL_ROLES = OperationModel.new(
        name: "SetIdentityPoolRoles",
        http_method: "POST",
        request_uri: "/"
      )

      SET_PRINCIPAL_TAG_ATTRIBUTE_MAP = OperationModel.new(
        name: "SetPrincipalTagAttributeMap",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNLINK_DEVELOPER_IDENTITY = OperationModel.new(
        name: "UnlinkDeveloperIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      UNLINK_IDENTITY = OperationModel.new(
        name: "UnlinkIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_IDENTITY_POOL = OperationModel.new(
        name: "UpdateIdentityPool",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
