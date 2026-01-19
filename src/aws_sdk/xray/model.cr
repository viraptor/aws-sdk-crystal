module AwsSdk
  module XRay
    module Model
      API_VERSION = "2016-04-12"
      TARGET_PREFIX = ""
      SIGNING_NAME = "xray"
      ENDPOINT_PREFIX = "xray"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://xray-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://xray-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://xray.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://xray.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_TRACES = OperationModel.new(
        name: "BatchGetTraces",
        http_method: "POST",
        request_uri: "/Traces"
      )

      CANCEL_TRACE_RETRIEVAL = OperationModel.new(
        name: "CancelTraceRetrieval",
        http_method: "POST",
        request_uri: "/CancelTraceRetrieval"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/CreateGroup"
      )

      CREATE_SAMPLING_RULE = OperationModel.new(
        name: "CreateSamplingRule",
        http_method: "POST",
        request_uri: "/CreateSamplingRule"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "POST",
        request_uri: "/DeleteGroup"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/DeleteResourcePolicy"
      )

      DELETE_SAMPLING_RULE = OperationModel.new(
        name: "DeleteSamplingRule",
        http_method: "POST",
        request_uri: "/DeleteSamplingRule"
      )

      GET_ENCRYPTION_CONFIG = OperationModel.new(
        name: "GetEncryptionConfig",
        http_method: "POST",
        request_uri: "/EncryptionConfig"
      )

      GET_GROUP = OperationModel.new(
        name: "GetGroup",
        http_method: "POST",
        request_uri: "/GetGroup"
      )

      GET_GROUPS = OperationModel.new(
        name: "GetGroups",
        http_method: "POST",
        request_uri: "/Groups"
      )

      GET_INDEXING_RULES = OperationModel.new(
        name: "GetIndexingRules",
        http_method: "POST",
        request_uri: "/GetIndexingRules"
      )

      GET_INSIGHT = OperationModel.new(
        name: "GetInsight",
        http_method: "POST",
        request_uri: "/Insight"
      )

      GET_INSIGHT_EVENTS = OperationModel.new(
        name: "GetInsightEvents",
        http_method: "POST",
        request_uri: "/InsightEvents"
      )

      GET_INSIGHT_IMPACT_GRAPH = OperationModel.new(
        name: "GetInsightImpactGraph",
        http_method: "POST",
        request_uri: "/InsightImpactGraph"
      )

      GET_INSIGHT_SUMMARIES = OperationModel.new(
        name: "GetInsightSummaries",
        http_method: "POST",
        request_uri: "/InsightSummaries"
      )

      GET_RETRIEVED_TRACES_GRAPH = OperationModel.new(
        name: "GetRetrievedTracesGraph",
        http_method: "POST",
        request_uri: "/GetRetrievedTracesGraph"
      )

      GET_SAMPLING_RULES = OperationModel.new(
        name: "GetSamplingRules",
        http_method: "POST",
        request_uri: "/GetSamplingRules"
      )

      GET_SAMPLING_STATISTIC_SUMMARIES = OperationModel.new(
        name: "GetSamplingStatisticSummaries",
        http_method: "POST",
        request_uri: "/SamplingStatisticSummaries"
      )

      GET_SAMPLING_TARGETS = OperationModel.new(
        name: "GetSamplingTargets",
        http_method: "POST",
        request_uri: "/SamplingTargets"
      )

      GET_SERVICE_GRAPH = OperationModel.new(
        name: "GetServiceGraph",
        http_method: "POST",
        request_uri: "/ServiceGraph"
      )

      GET_TIME_SERIES_SERVICE_STATISTICS = OperationModel.new(
        name: "GetTimeSeriesServiceStatistics",
        http_method: "POST",
        request_uri: "/TimeSeriesServiceStatistics"
      )

      GET_TRACE_GRAPH = OperationModel.new(
        name: "GetTraceGraph",
        http_method: "POST",
        request_uri: "/TraceGraph"
      )

      GET_TRACE_SEGMENT_DESTINATION = OperationModel.new(
        name: "GetTraceSegmentDestination",
        http_method: "POST",
        request_uri: "/GetTraceSegmentDestination"
      )

      GET_TRACE_SUMMARIES = OperationModel.new(
        name: "GetTraceSummaries",
        http_method: "POST",
        request_uri: "/TraceSummaries"
      )

      LIST_RESOURCE_POLICIES = OperationModel.new(
        name: "ListResourcePolicies",
        http_method: "POST",
        request_uri: "/ListResourcePolicies"
      )

      LIST_RETRIEVED_TRACES = OperationModel.new(
        name: "ListRetrievedTraces",
        http_method: "POST",
        request_uri: "/ListRetrievedTraces"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/ListTagsForResource"
      )

      PUT_ENCRYPTION_CONFIG = OperationModel.new(
        name: "PutEncryptionConfig",
        http_method: "POST",
        request_uri: "/PutEncryptionConfig"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/PutResourcePolicy"
      )

      PUT_TELEMETRY_RECORDS = OperationModel.new(
        name: "PutTelemetryRecords",
        http_method: "POST",
        request_uri: "/TelemetryRecords"
      )

      PUT_TRACE_SEGMENTS = OperationModel.new(
        name: "PutTraceSegments",
        http_method: "POST",
        request_uri: "/TraceSegments"
      )

      START_TRACE_RETRIEVAL = OperationModel.new(
        name: "StartTraceRetrieval",
        http_method: "POST",
        request_uri: "/StartTraceRetrieval"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/TagResource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/UntagResource"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "POST",
        request_uri: "/UpdateGroup"
      )

      UPDATE_INDEXING_RULE = OperationModel.new(
        name: "UpdateIndexingRule",
        http_method: "POST",
        request_uri: "/UpdateIndexingRule"
      )

      UPDATE_SAMPLING_RULE = OperationModel.new(
        name: "UpdateSamplingRule",
        http_method: "POST",
        request_uri: "/UpdateSamplingRule"
      )

      UPDATE_TRACE_SEGMENT_DESTINATION = OperationModel.new(
        name: "UpdateTraceSegmentDestination",
        http_method: "POST",
        request_uri: "/UpdateTraceSegmentDestination"
      )
    end
  end
end
