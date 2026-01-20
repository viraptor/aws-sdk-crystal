module Aws
  module AppFabric
    module Model
      API_VERSION = "2023-05-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "appfabric"
      ENDPOINT_PREFIX = "appfabric"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://appfabric-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://appfabric-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://appfabric.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://appfabric.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_USER_ACCESS_TASKS = OperationModel.new(
        name: "BatchGetUserAccessTasks",
        http_method: "POST",
        request_uri: "/useraccess/batchget"
      )

      CONNECT_APP_AUTHORIZATION = OperationModel.new(
        name: "ConnectAppAuthorization",
        http_method: "POST",
        request_uri: "/appbundles/{appBundleIdentifier}/appauthorizations/{appAuthorizationIdentifier}/connect"
      )

      CREATE_APP_AUTHORIZATION = OperationModel.new(
        name: "CreateAppAuthorization",
        http_method: "POST",
        request_uri: "/appbundles/{appBundleIdentifier}/appauthorizations"
      )

      CREATE_APP_BUNDLE = OperationModel.new(
        name: "CreateAppBundle",
        http_method: "POST",
        request_uri: "/appbundles"
      )

      CREATE_INGESTION = OperationModel.new(
        name: "CreateIngestion",
        http_method: "POST",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions"
      )

      CREATE_INGESTION_DESTINATION = OperationModel.new(
        name: "CreateIngestionDestination",
        http_method: "POST",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}/ingestiondestinations"
      )

      DELETE_APP_AUTHORIZATION = OperationModel.new(
        name: "DeleteAppAuthorization",
        http_method: "DELETE",
        request_uri: "/appbundles/{appBundleIdentifier}/appauthorizations/{appAuthorizationIdentifier}"
      )

      DELETE_APP_BUNDLE = OperationModel.new(
        name: "DeleteAppBundle",
        http_method: "DELETE",
        request_uri: "/appbundles/{appBundleIdentifier}"
      )

      DELETE_INGESTION = OperationModel.new(
        name: "DeleteIngestion",
        http_method: "DELETE",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}"
      )

      DELETE_INGESTION_DESTINATION = OperationModel.new(
        name: "DeleteIngestionDestination",
        http_method: "DELETE",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}/ingestiondestinations/{ingestionDestinationIdentifier}"
      )

      GET_APP_AUTHORIZATION = OperationModel.new(
        name: "GetAppAuthorization",
        http_method: "GET",
        request_uri: "/appbundles/{appBundleIdentifier}/appauthorizations/{appAuthorizationIdentifier}"
      )

      GET_APP_BUNDLE = OperationModel.new(
        name: "GetAppBundle",
        http_method: "GET",
        request_uri: "/appbundles/{appBundleIdentifier}"
      )

      GET_INGESTION = OperationModel.new(
        name: "GetIngestion",
        http_method: "GET",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}"
      )

      GET_INGESTION_DESTINATION = OperationModel.new(
        name: "GetIngestionDestination",
        http_method: "GET",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}/ingestiondestinations/{ingestionDestinationIdentifier}"
      )

      LIST_APP_AUTHORIZATIONS = OperationModel.new(
        name: "ListAppAuthorizations",
        http_method: "GET",
        request_uri: "/appbundles/{appBundleIdentifier}/appauthorizations"
      )

      LIST_APP_BUNDLES = OperationModel.new(
        name: "ListAppBundles",
        http_method: "GET",
        request_uri: "/appbundles"
      )

      LIST_INGESTION_DESTINATIONS = OperationModel.new(
        name: "ListIngestionDestinations",
        http_method: "GET",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}/ingestiondestinations"
      )

      LIST_INGESTIONS = OperationModel.new(
        name: "ListIngestions",
        http_method: "GET",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      START_INGESTION = OperationModel.new(
        name: "StartIngestion",
        http_method: "POST",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}/start"
      )

      START_USER_ACCESS_TASKS = OperationModel.new(
        name: "StartUserAccessTasks",
        http_method: "POST",
        request_uri: "/useraccess/start"
      )

      STOP_INGESTION = OperationModel.new(
        name: "StopIngestion",
        http_method: "POST",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}/stop"
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

      UPDATE_APP_AUTHORIZATION = OperationModel.new(
        name: "UpdateAppAuthorization",
        http_method: "PATCH",
        request_uri: "/appbundles/{appBundleIdentifier}/appauthorizations/{appAuthorizationIdentifier}"
      )

      UPDATE_INGESTION_DESTINATION = OperationModel.new(
        name: "UpdateIngestionDestination",
        http_method: "PATCH",
        request_uri: "/appbundles/{appBundleIdentifier}/ingestions/{ingestionIdentifier}/ingestiondestinations/{ingestionDestinationIdentifier}"
      )
    end
  end
end
