module Aws
  module DirectoryServiceData
    module Model
      API_VERSION = "2023-05-31"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ds-data"
      ENDPOINT_PREFIX = "ds-data"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ds-data-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ds-data-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ds-data.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ds-data.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_GROUP_MEMBER = OperationModel.new(
        name: "AddGroupMember",
        http_method: "POST",
        request_uri: "/GroupMemberships/AddGroupMember"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/Groups/CreateGroup"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/Users/CreateUser"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "POST",
        request_uri: "/Groups/DeleteGroup"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/Users/DeleteUser"
      )

      DESCRIBE_GROUP = OperationModel.new(
        name: "DescribeGroup",
        http_method: "POST",
        request_uri: "/Groups/DescribeGroup"
      )

      DESCRIBE_USER = OperationModel.new(
        name: "DescribeUser",
        http_method: "POST",
        request_uri: "/Users/DescribeUser"
      )

      DISABLE_USER = OperationModel.new(
        name: "DisableUser",
        http_method: "POST",
        request_uri: "/Users/DisableUser"
      )

      LIST_GROUP_MEMBERS = OperationModel.new(
        name: "ListGroupMembers",
        http_method: "POST",
        request_uri: "/GroupMemberships/ListGroupMembers"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "POST",
        request_uri: "/Groups/ListGroups"
      )

      LIST_GROUPS_FOR_MEMBER = OperationModel.new(
        name: "ListGroupsForMember",
        http_method: "POST",
        request_uri: "/GroupMemberships/ListGroupsForMember"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "POST",
        request_uri: "/Users/ListUsers"
      )

      REMOVE_GROUP_MEMBER = OperationModel.new(
        name: "RemoveGroupMember",
        http_method: "POST",
        request_uri: "/GroupMemberships/RemoveGroupMember"
      )

      SEARCH_GROUPS = OperationModel.new(
        name: "SearchGroups",
        http_method: "POST",
        request_uri: "/Groups/SearchGroups"
      )

      SEARCH_USERS = OperationModel.new(
        name: "SearchUsers",
        http_method: "POST",
        request_uri: "/Users/SearchUsers"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "POST",
        request_uri: "/Groups/UpdateGroup"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "POST",
        request_uri: "/Users/UpdateUser"
      )
    end
  end
end
