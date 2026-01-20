module Aws
  module DataExchange
    module Model
      API_VERSION = "2017-07-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "dataexchange"
      ENDPOINT_PREFIX = "dataexchange"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://dataexchange-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://dataexchange-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://dataexchange.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://dataexchange.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_DATA_GRANT = OperationModel.new(
        name: "AcceptDataGrant",
        http_method: "POST",
        request_uri: "/v1/data-grants/{DataGrantArn}/accept"
      )

      CANCEL_JOB = OperationModel.new(
        name: "CancelJob",
        http_method: "DELETE",
        request_uri: "/v1/jobs/{JobId}"
      )

      CREATE_DATA_GRANT = OperationModel.new(
        name: "CreateDataGrant",
        http_method: "POST",
        request_uri: "/v1/data-grants"
      )

      CREATE_DATA_SET = OperationModel.new(
        name: "CreateDataSet",
        http_method: "POST",
        request_uri: "/v1/data-sets"
      )

      CREATE_EVENT_ACTION = OperationModel.new(
        name: "CreateEventAction",
        http_method: "POST",
        request_uri: "/v1/event-actions"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/v1/jobs"
      )

      CREATE_REVISION = OperationModel.new(
        name: "CreateRevision",
        http_method: "POST",
        request_uri: "/v1/data-sets/{DataSetId}/revisions"
      )

      DELETE_ASSET = OperationModel.new(
        name: "DeleteAsset",
        http_method: "DELETE",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
      )

      DELETE_DATA_GRANT = OperationModel.new(
        name: "DeleteDataGrant",
        http_method: "DELETE",
        request_uri: "/v1/data-grants/{DataGrantId}"
      )

      DELETE_DATA_SET = OperationModel.new(
        name: "DeleteDataSet",
        http_method: "DELETE",
        request_uri: "/v1/data-sets/{DataSetId}"
      )

      DELETE_EVENT_ACTION = OperationModel.new(
        name: "DeleteEventAction",
        http_method: "DELETE",
        request_uri: "/v1/event-actions/{EventActionId}"
      )

      DELETE_REVISION = OperationModel.new(
        name: "DeleteRevision",
        http_method: "DELETE",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
      )

      GET_ASSET = OperationModel.new(
        name: "GetAsset",
        http_method: "GET",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
      )

      GET_DATA_GRANT = OperationModel.new(
        name: "GetDataGrant",
        http_method: "GET",
        request_uri: "/v1/data-grants/{DataGrantId}"
      )

      GET_DATA_SET = OperationModel.new(
        name: "GetDataSet",
        http_method: "GET",
        request_uri: "/v1/data-sets/{DataSetId}"
      )

      GET_EVENT_ACTION = OperationModel.new(
        name: "GetEventAction",
        http_method: "GET",
        request_uri: "/v1/event-actions/{EventActionId}"
      )

      GET_JOB = OperationModel.new(
        name: "GetJob",
        http_method: "GET",
        request_uri: "/v1/jobs/{JobId}"
      )

      GET_RECEIVED_DATA_GRANT = OperationModel.new(
        name: "GetReceivedDataGrant",
        http_method: "GET",
        request_uri: "/v1/received-data-grants/{DataGrantArn}"
      )

      GET_REVISION = OperationModel.new(
        name: "GetRevision",
        http_method: "GET",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
      )

      LIST_DATA_GRANTS = OperationModel.new(
        name: "ListDataGrants",
        http_method: "GET",
        request_uri: "/v1/data-grants"
      )

      LIST_DATA_SET_REVISIONS = OperationModel.new(
        name: "ListDataSetRevisions",
        http_method: "GET",
        request_uri: "/v1/data-sets/{DataSetId}/revisions"
      )

      LIST_DATA_SETS = OperationModel.new(
        name: "ListDataSets",
        http_method: "GET",
        request_uri: "/v1/data-sets"
      )

      LIST_EVENT_ACTIONS = OperationModel.new(
        name: "ListEventActions",
        http_method: "GET",
        request_uri: "/v1/event-actions"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/v1/jobs"
      )

      LIST_RECEIVED_DATA_GRANTS = OperationModel.new(
        name: "ListReceivedDataGrants",
        http_method: "GET",
        request_uri: "/v1/received-data-grants"
      )

      LIST_REVISION_ASSETS = OperationModel.new(
        name: "ListRevisionAssets",
        http_method: "GET",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      REVOKE_REVISION = OperationModel.new(
        name: "RevokeRevision",
        http_method: "POST",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/revoke"
      )

      SEND_API_ASSET = OperationModel.new(
        name: "SendApiAsset",
        http_method: "POST",
        request_uri: "/v1"
      )

      SEND_DATA_SET_NOTIFICATION = OperationModel.new(
        name: "SendDataSetNotification",
        http_method: "POST",
        request_uri: "/v1/data-sets/{DataSetId}/notification"
      )

      START_JOB = OperationModel.new(
        name: "StartJob",
        http_method: "PATCH",
        request_uri: "/v1/jobs/{JobId}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_ASSET = OperationModel.new(
        name: "UpdateAsset",
        http_method: "PATCH",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
      )

      UPDATE_DATA_SET = OperationModel.new(
        name: "UpdateDataSet",
        http_method: "PATCH",
        request_uri: "/v1/data-sets/{DataSetId}"
      )

      UPDATE_EVENT_ACTION = OperationModel.new(
        name: "UpdateEventAction",
        http_method: "PATCH",
        request_uri: "/v1/event-actions/{EventActionId}"
      )

      UPDATE_REVISION = OperationModel.new(
        name: "UpdateRevision",
        http_method: "PATCH",
        request_uri: "/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
      )
    end
  end
end
