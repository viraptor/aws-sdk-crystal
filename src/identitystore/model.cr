module Aws
  module Identitystore
    module Model
      API_VERSION = "2020-06-15"
      TARGET_PREFIX = "AWSIdentityStore"
      SIGNING_NAME = "identitystore"
      ENDPOINT_PREFIX = "identitystore"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://identitystore-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://identitystore.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://identitystore-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://identitystore.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://identitystore.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GROUP_MEMBERSHIP = OperationModel.new(
        name: "CreateGroupMembership",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GROUP_MEMBERSHIP = OperationModel.new(
        name: "DeleteGroupMembership",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GROUP = OperationModel.new(
        name: "DescribeGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GROUP_MEMBERSHIP = OperationModel.new(
        name: "DescribeGroupMembership",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER = OperationModel.new(
        name: "DescribeUser",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GROUP_ID = OperationModel.new(
        name: "GetGroupId",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GROUP_MEMBERSHIP_ID = OperationModel.new(
        name: "GetGroupMembershipId",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER_ID = OperationModel.new(
        name: "GetUserId",
        http_method: "POST",
        request_uri: "/"
      )

      IS_MEMBER_IN_GROUPS = OperationModel.new(
        name: "IsMemberInGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUP_MEMBERSHIPS = OperationModel.new(
        name: "ListGroupMemberships",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUP_MEMBERSHIPS_FOR_MEMBER = OperationModel.new(
        name: "ListGroupMembershipsForMember",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
