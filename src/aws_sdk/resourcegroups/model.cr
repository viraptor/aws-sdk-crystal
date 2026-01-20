module AwsSdk
  module ResourceGroups
    module Model
      API_VERSION = "2017-11-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "resource-groups"
      ENDPOINT_PREFIX = "resource-groups"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resource-groups-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://resource-groups.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://resource-groups-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resource-groups.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://resource-groups.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_TAG_SYNC_TASK = OperationModel.new(
        name: "CancelTagSyncTask",
        http_method: "POST",
        request_uri: "/cancel-tag-sync-task"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/groups"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "POST",
        request_uri: "/delete-group"
      )

      GET_ACCOUNT_SETTINGS = OperationModel.new(
        name: "GetAccountSettings",
        http_method: "POST",
        request_uri: "/get-account-settings"
      )

      GET_GROUP = OperationModel.new(
        name: "GetGroup",
        http_method: "POST",
        request_uri: "/get-group"
      )

      GET_GROUP_CONFIGURATION = OperationModel.new(
        name: "GetGroupConfiguration",
        http_method: "POST",
        request_uri: "/get-group-configuration"
      )

      GET_GROUP_QUERY = OperationModel.new(
        name: "GetGroupQuery",
        http_method: "POST",
        request_uri: "/get-group-query"
      )

      GET_TAG_SYNC_TASK = OperationModel.new(
        name: "GetTagSyncTask",
        http_method: "POST",
        request_uri: "/get-tag-sync-task"
      )

      GET_TAGS = OperationModel.new(
        name: "GetTags",
        http_method: "GET",
        request_uri: "/resources/{Arn}/tags"
      )

      GROUP_RESOURCES = OperationModel.new(
        name: "GroupResources",
        http_method: "POST",
        request_uri: "/group-resources"
      )

      LIST_GROUP_RESOURCES = OperationModel.new(
        name: "ListGroupResources",
        http_method: "POST",
        request_uri: "/list-group-resources"
      )

      LIST_GROUPING_STATUSES = OperationModel.new(
        name: "ListGroupingStatuses",
        http_method: "POST",
        request_uri: "/list-grouping-statuses"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "POST",
        request_uri: "/groups-list"
      )

      LIST_TAG_SYNC_TASKS = OperationModel.new(
        name: "ListTagSyncTasks",
        http_method: "POST",
        request_uri: "/list-tag-sync-tasks"
      )

      PUT_GROUP_CONFIGURATION = OperationModel.new(
        name: "PutGroupConfiguration",
        http_method: "POST",
        request_uri: "/put-group-configuration"
      )

      SEARCH_RESOURCES = OperationModel.new(
        name: "SearchResources",
        http_method: "POST",
        request_uri: "/resources/search"
      )

      START_TAG_SYNC_TASK = OperationModel.new(
        name: "StartTagSyncTask",
        http_method: "POST",
        request_uri: "/start-tag-sync-task"
      )

      TAG = OperationModel.new(
        name: "Tag",
        http_method: "PUT",
        request_uri: "/resources/{Arn}/tags"
      )

      UNGROUP_RESOURCES = OperationModel.new(
        name: "UngroupResources",
        http_method: "POST",
        request_uri: "/ungroup-resources"
      )

      UNTAG = OperationModel.new(
        name: "Untag",
        http_method: "PATCH",
        request_uri: "/resources/{Arn}/tags"
      )

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "POST",
        request_uri: "/update-account-settings"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "POST",
        request_uri: "/update-group"
      )

      UPDATE_GROUP_QUERY = OperationModel.new(
        name: "UpdateGroupQuery",
        http_method: "POST",
        request_uri: "/update-group-query"
      )
    end
  end
end
