module AwsSdk
  module FinspaceData
    module Model
      API_VERSION = "2020-07-13"
      TARGET_PREFIX = ""
      SIGNING_NAME = "finspace-api"
      ENDPOINT_PREFIX = "finspace-api"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://finspace-api-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://finspace-api-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://finspace-api.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://finspace-api.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_USER_TO_PERMISSION_GROUP = OperationModel.new(
        name: "AssociateUserToPermissionGroup",
        http_method: "POST",
        request_uri: "/permission-group/{permissionGroupId}/users/{userId}"
      )

      CREATE_CHANGESET = OperationModel.new(
        name: "CreateChangeset",
        http_method: "POST",
        request_uri: "/datasets/{datasetId}/changesetsv2"
      )

      CREATE_DATA_VIEW = OperationModel.new(
        name: "CreateDataView",
        http_method: "POST",
        request_uri: "/datasets/{datasetId}/dataviewsv2"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/datasetsv2"
      )

      CREATE_PERMISSION_GROUP = OperationModel.new(
        name: "CreatePermissionGroup",
        http_method: "POST",
        request_uri: "/permission-group"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/user"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "DELETE",
        request_uri: "/datasetsv2/{datasetId}"
      )

      DELETE_PERMISSION_GROUP = OperationModel.new(
        name: "DeletePermissionGroup",
        http_method: "DELETE",
        request_uri: "/permission-group/{permissionGroupId}"
      )

      DISABLE_USER = OperationModel.new(
        name: "DisableUser",
        http_method: "POST",
        request_uri: "/user/{userId}/disable"
      )

      DISASSOCIATE_USER_FROM_PERMISSION_GROUP = OperationModel.new(
        name: "DisassociateUserFromPermissionGroup",
        http_method: "DELETE",
        request_uri: "/permission-group/{permissionGroupId}/users/{userId}"
      )

      ENABLE_USER = OperationModel.new(
        name: "EnableUser",
        http_method: "POST",
        request_uri: "/user/{userId}/enable"
      )

      GET_CHANGESET = OperationModel.new(
        name: "GetChangeset",
        http_method: "GET",
        request_uri: "/datasets/{datasetId}/changesetsv2/{changesetId}"
      )

      GET_DATA_VIEW = OperationModel.new(
        name: "GetDataView",
        http_method: "GET",
        request_uri: "/datasets/{datasetId}/dataviewsv2/{dataviewId}"
      )

      GET_DATASET = OperationModel.new(
        name: "GetDataset",
        http_method: "GET",
        request_uri: "/datasetsv2/{datasetId}"
      )

      GET_EXTERNAL_DATA_VIEW_ACCESS_DETAILS = OperationModel.new(
        name: "GetExternalDataViewAccessDetails",
        http_method: "POST",
        request_uri: "/datasets/{datasetId}/dataviewsv2/{dataviewId}/external-access-details"
      )

      GET_PERMISSION_GROUP = OperationModel.new(
        name: "GetPermissionGroup",
        http_method: "GET",
        request_uri: "/permission-group/{permissionGroupId}"
      )

      GET_PROGRAMMATIC_ACCESS_CREDENTIALS = OperationModel.new(
        name: "GetProgrammaticAccessCredentials",
        http_method: "GET",
        request_uri: "/credentials/programmatic"
      )

      GET_USER = OperationModel.new(
        name: "GetUser",
        http_method: "GET",
        request_uri: "/user/{userId}"
      )

      GET_WORKING_LOCATION = OperationModel.new(
        name: "GetWorkingLocation",
        http_method: "POST",
        request_uri: "/workingLocationV1"
      )

      LIST_CHANGESETS = OperationModel.new(
        name: "ListChangesets",
        http_method: "GET",
        request_uri: "/datasets/{datasetId}/changesetsv2"
      )

      LIST_DATA_VIEWS = OperationModel.new(
        name: "ListDataViews",
        http_method: "GET",
        request_uri: "/datasets/{datasetId}/dataviewsv2"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "GET",
        request_uri: "/datasetsv2"
      )

      LIST_PERMISSION_GROUPS = OperationModel.new(
        name: "ListPermissionGroups",
        http_method: "GET",
        request_uri: "/permission-group"
      )

      LIST_PERMISSION_GROUPS_BY_USER = OperationModel.new(
        name: "ListPermissionGroupsByUser",
        http_method: "GET",
        request_uri: "/user/{userId}/permission-groups"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "GET",
        request_uri: "/user"
      )

      LIST_USERS_BY_PERMISSION_GROUP = OperationModel.new(
        name: "ListUsersByPermissionGroup",
        http_method: "GET",
        request_uri: "/permission-group/{permissionGroupId}/users"
      )

      RESET_USER_PASSWORD = OperationModel.new(
        name: "ResetUserPassword",
        http_method: "POST",
        request_uri: "/user/{userId}/password"
      )

      UPDATE_CHANGESET = OperationModel.new(
        name: "UpdateChangeset",
        http_method: "PUT",
        request_uri: "/datasets/{datasetId}/changesetsv2/{changesetId}"
      )

      UPDATE_DATASET = OperationModel.new(
        name: "UpdateDataset",
        http_method: "PUT",
        request_uri: "/datasetsv2/{datasetId}"
      )

      UPDATE_PERMISSION_GROUP = OperationModel.new(
        name: "UpdatePermissionGroup",
        http_method: "PUT",
        request_uri: "/permission-group/{permissionGroupId}"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "PUT",
        request_uri: "/user/{userId}"
      )
    end
  end
end
