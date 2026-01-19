module AwsSdk
  module RUM
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "rum"
      ENDPOINT_PREFIX = "rum"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rum-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rum-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rum.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://rum.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_RUM_METRIC_DEFINITIONS = OperationModel.new(
        name: "BatchCreateRumMetricDefinitions",
        http_method: "POST",
        request_uri: "/rummetrics/{AppMonitorName}/metrics"
      )

      BATCH_DELETE_RUM_METRIC_DEFINITIONS = OperationModel.new(
        name: "BatchDeleteRumMetricDefinitions",
        http_method: "DELETE",
        request_uri: "/rummetrics/{AppMonitorName}/metrics"
      )

      BATCH_GET_RUM_METRIC_DEFINITIONS = OperationModel.new(
        name: "BatchGetRumMetricDefinitions",
        http_method: "GET",
        request_uri: "/rummetrics/{AppMonitorName}/metrics"
      )

      CREATE_APP_MONITOR = OperationModel.new(
        name: "CreateAppMonitor",
        http_method: "POST",
        request_uri: "/appmonitor"
      )

      DELETE_APP_MONITOR = OperationModel.new(
        name: "DeleteAppMonitor",
        http_method: "DELETE",
        request_uri: "/appmonitor/{Name}"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/appmonitor/{Name}/policy"
      )

      DELETE_RUM_METRICS_DESTINATION = OperationModel.new(
        name: "DeleteRumMetricsDestination",
        http_method: "DELETE",
        request_uri: "/rummetrics/{AppMonitorName}/metricsdestination"
      )

      GET_APP_MONITOR = OperationModel.new(
        name: "GetAppMonitor",
        http_method: "GET",
        request_uri: "/appmonitor/{Name}"
      )

      GET_APP_MONITOR_DATA = OperationModel.new(
        name: "GetAppMonitorData",
        http_method: "POST",
        request_uri: "/appmonitor/{Name}/data"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/appmonitor/{Name}/policy"
      )

      LIST_APP_MONITORS = OperationModel.new(
        name: "ListAppMonitors",
        http_method: "POST",
        request_uri: "/appmonitors"
      )

      LIST_RUM_METRICS_DESTINATIONS = OperationModel.new(
        name: "ListRumMetricsDestinations",
        http_method: "GET",
        request_uri: "/rummetrics/{AppMonitorName}/metricsdestination"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "PUT",
        request_uri: "/appmonitor/{Name}/policy"
      )

      PUT_RUM_EVENTS = OperationModel.new(
        name: "PutRumEvents",
        http_method: "POST",
        request_uri: "/appmonitors/{Id}/"
      )

      PUT_RUM_METRICS_DESTINATION = OperationModel.new(
        name: "PutRumMetricsDestination",
        http_method: "POST",
        request_uri: "/rummetrics/{AppMonitorName}/metricsdestination"
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

      UPDATE_APP_MONITOR = OperationModel.new(
        name: "UpdateAppMonitor",
        http_method: "PATCH",
        request_uri: "/appmonitor/{Name}"
      )

      UPDATE_RUM_METRIC_DEFINITION = OperationModel.new(
        name: "UpdateRumMetricDefinition",
        http_method: "PATCH",
        request_uri: "/rummetrics/{AppMonitorName}/metrics"
      )
    end
  end
end
