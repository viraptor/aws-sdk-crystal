module Aws
  module QApps
    module Model
      API_VERSION = "2023-11-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "qapps"
      ENDPOINT_PREFIX = "data.qapps"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://data.qapps-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://data.qapps-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://data.qapps.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://data.qapps.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_LIBRARY_ITEM_REVIEW = OperationModel.new(
        name: "AssociateLibraryItemReview",
        http_method: "POST",
        request_uri: "/catalog.associateItemRating"
      )

      ASSOCIATE_Q_APP_WITH_USER = OperationModel.new(
        name: "AssociateQAppWithUser",
        http_method: "POST",
        request_uri: "/apps.install"
      )

      BATCH_CREATE_CATEGORY = OperationModel.new(
        name: "BatchCreateCategory",
        http_method: "POST",
        request_uri: "/catalog.createCategories"
      )

      BATCH_DELETE_CATEGORY = OperationModel.new(
        name: "BatchDeleteCategory",
        http_method: "POST",
        request_uri: "/catalog.deleteCategories"
      )

      BATCH_UPDATE_CATEGORY = OperationModel.new(
        name: "BatchUpdateCategory",
        http_method: "POST",
        request_uri: "/catalog.updateCategories"
      )

      CREATE_LIBRARY_ITEM = OperationModel.new(
        name: "CreateLibraryItem",
        http_method: "POST",
        request_uri: "/catalog.createItem"
      )

      CREATE_PRESIGNED_URL = OperationModel.new(
        name: "CreatePresignedUrl",
        http_method: "POST",
        request_uri: "/apps.createPresignedUrl"
      )

      CREATE_Q_APP = OperationModel.new(
        name: "CreateQApp",
        http_method: "POST",
        request_uri: "/apps.create"
      )

      DELETE_LIBRARY_ITEM = OperationModel.new(
        name: "DeleteLibraryItem",
        http_method: "POST",
        request_uri: "/catalog.deleteItem"
      )

      DELETE_Q_APP = OperationModel.new(
        name: "DeleteQApp",
        http_method: "POST",
        request_uri: "/apps.delete"
      )

      DESCRIBE_Q_APP_PERMISSIONS = OperationModel.new(
        name: "DescribeQAppPermissions",
        http_method: "GET",
        request_uri: "/apps.describeQAppPermissions"
      )

      DISASSOCIATE_LIBRARY_ITEM_REVIEW = OperationModel.new(
        name: "DisassociateLibraryItemReview",
        http_method: "POST",
        request_uri: "/catalog.disassociateItemRating"
      )

      DISASSOCIATE_Q_APP_FROM_USER = OperationModel.new(
        name: "DisassociateQAppFromUser",
        http_method: "POST",
        request_uri: "/apps.uninstall"
      )

      EXPORT_Q_APP_SESSION_DATA = OperationModel.new(
        name: "ExportQAppSessionData",
        http_method: "POST",
        request_uri: "/runtime.exportQAppSessionData"
      )

      GET_LIBRARY_ITEM = OperationModel.new(
        name: "GetLibraryItem",
        http_method: "GET",
        request_uri: "/catalog.getItem"
      )

      GET_Q_APP = OperationModel.new(
        name: "GetQApp",
        http_method: "GET",
        request_uri: "/apps.get"
      )

      GET_Q_APP_SESSION = OperationModel.new(
        name: "GetQAppSession",
        http_method: "GET",
        request_uri: "/runtime.getQAppSession"
      )

      GET_Q_APP_SESSION_METADATA = OperationModel.new(
        name: "GetQAppSessionMetadata",
        http_method: "GET",
        request_uri: "/runtime.getQAppSessionMetadata"
      )

      IMPORT_DOCUMENT = OperationModel.new(
        name: "ImportDocument",
        http_method: "POST",
        request_uri: "/apps.importDocument"
      )

      LIST_CATEGORIES = OperationModel.new(
        name: "ListCategories",
        http_method: "GET",
        request_uri: "/catalog.listCategories"
      )

      LIST_LIBRARY_ITEMS = OperationModel.new(
        name: "ListLibraryItems",
        http_method: "GET",
        request_uri: "/catalog.list"
      )

      LIST_Q_APP_SESSION_DATA = OperationModel.new(
        name: "ListQAppSessionData",
        http_method: "GET",
        request_uri: "/runtime.listQAppSessionData"
      )

      LIST_Q_APPS = OperationModel.new(
        name: "ListQApps",
        http_method: "GET",
        request_uri: "/apps.list"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceARN}"
      )

      PREDICT_Q_APP = OperationModel.new(
        name: "PredictQApp",
        http_method: "POST",
        request_uri: "/apps.predictQApp"
      )

      START_Q_APP_SESSION = OperationModel.new(
        name: "StartQAppSession",
        http_method: "POST",
        request_uri: "/runtime.startQAppSession"
      )

      STOP_Q_APP_SESSION = OperationModel.new(
        name: "StopQAppSession",
        http_method: "POST",
        request_uri: "/runtime.deleteMiniAppRun"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceARN}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceARN}"
      )

      UPDATE_LIBRARY_ITEM = OperationModel.new(
        name: "UpdateLibraryItem",
        http_method: "POST",
        request_uri: "/catalog.updateItem"
      )

      UPDATE_LIBRARY_ITEM_METADATA = OperationModel.new(
        name: "UpdateLibraryItemMetadata",
        http_method: "POST",
        request_uri: "/catalog.updateItemMetadata"
      )

      UPDATE_Q_APP = OperationModel.new(
        name: "UpdateQApp",
        http_method: "POST",
        request_uri: "/apps.update"
      )

      UPDATE_Q_APP_PERMISSIONS = OperationModel.new(
        name: "UpdateQAppPermissions",
        http_method: "POST",
        request_uri: "/apps.updateQAppPermissions"
      )

      UPDATE_Q_APP_SESSION = OperationModel.new(
        name: "UpdateQAppSession",
        http_method: "POST",
        request_uri: "/runtime.updateQAppSession"
      )

      UPDATE_Q_APP_SESSION_METADATA = OperationModel.new(
        name: "UpdateQAppSessionMetadata",
        http_method: "POST",
        request_uri: "/runtime.updateQAppSessionMetadata"
      )
    end
  end
end
