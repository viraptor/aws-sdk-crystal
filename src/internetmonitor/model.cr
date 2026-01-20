module Aws
  module InternetMonitor
    module Model
      API_VERSION = "2021-06-03"
      TARGET_PREFIX = ""
      SIGNING_NAME = "internetmonitor"
      ENDPOINT_PREFIX = "internetmonitor"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://internetmonitor-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://internetmonitor-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://internetmonitor.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://internetmonitor.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_MONITOR = OperationModel.new(
        name: "CreateMonitor",
        http_method: "POST",
        request_uri: "/v20210603/Monitors"
      )

      DELETE_MONITOR = OperationModel.new(
        name: "DeleteMonitor",
        http_method: "DELETE",
        request_uri: "/v20210603/Monitors/{MonitorName}"
      )

      GET_HEALTH_EVENT = OperationModel.new(
        name: "GetHealthEvent",
        http_method: "GET",
        request_uri: "/v20210603/Monitors/{MonitorName}/HealthEvents/{EventId}"
      )

      GET_INTERNET_EVENT = OperationModel.new(
        name: "GetInternetEvent",
        http_method: "GET",
        request_uri: "/v20210603/InternetEvents/{EventId}"
      )

      GET_MONITOR = OperationModel.new(
        name: "GetMonitor",
        http_method: "GET",
        request_uri: "/v20210603/Monitors/{MonitorName}"
      )

      GET_QUERY_RESULTS = OperationModel.new(
        name: "GetQueryResults",
        http_method: "GET",
        request_uri: "/v20210603/Monitors/{MonitorName}/Queries/{QueryId}/Results"
      )

      GET_QUERY_STATUS = OperationModel.new(
        name: "GetQueryStatus",
        http_method: "GET",
        request_uri: "/v20210603/Monitors/{MonitorName}/Queries/{QueryId}/Status"
      )

      LIST_HEALTH_EVENTS = OperationModel.new(
        name: "ListHealthEvents",
        http_method: "GET",
        request_uri: "/v20210603/Monitors/{MonitorName}/HealthEvents"
      )

      LIST_INTERNET_EVENTS = OperationModel.new(
        name: "ListInternetEvents",
        http_method: "GET",
        request_uri: "/v20210603/InternetEvents"
      )

      LIST_MONITORS = OperationModel.new(
        name: "ListMonitors",
        http_method: "GET",
        request_uri: "/v20210603/Monitors"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      START_QUERY = OperationModel.new(
        name: "StartQuery",
        http_method: "POST",
        request_uri: "/v20210603/Monitors/{MonitorName}/Queries"
      )

      STOP_QUERY = OperationModel.new(
        name: "StopQuery",
        http_method: "DELETE",
        request_uri: "/v20210603/Monitors/{MonitorName}/Queries/{QueryId}"
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

      UPDATE_MONITOR = OperationModel.new(
        name: "UpdateMonitor",
        http_method: "PATCH",
        request_uri: "/v20210603/Monitors/{MonitorName}"
      )
    end
  end
end
