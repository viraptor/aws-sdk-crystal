module Aws
  module CodeGuruProfiler
    module Model
      API_VERSION = "2019-07-18"
      TARGET_PREFIX = ""
      SIGNING_NAME = "codeguru-profiler"
      ENDPOINT_PREFIX = "codeguru-profiler"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeguru-profiler-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeguru-profiler-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeguru-profiler.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codeguru-profiler.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_NOTIFICATION_CHANNELS = OperationModel.new(
        name: "AddNotificationChannels",
        http_method: "POST",
        request_uri: "/profilingGroups/{profilingGroupName}/notificationConfiguration"
      )

      BATCH_GET_FRAME_METRIC_DATA = OperationModel.new(
        name: "BatchGetFrameMetricData",
        http_method: "POST",
        request_uri: "/profilingGroups/{profilingGroupName}/frames/-/metrics"
      )

      CONFIGURE_AGENT = OperationModel.new(
        name: "ConfigureAgent",
        http_method: "POST",
        request_uri: "/profilingGroups/{profilingGroupName}/configureAgent"
      )

      CREATE_PROFILING_GROUP = OperationModel.new(
        name: "CreateProfilingGroup",
        http_method: "POST",
        request_uri: "/profilingGroups"
      )

      DELETE_PROFILING_GROUP = OperationModel.new(
        name: "DeleteProfilingGroup",
        http_method: "DELETE",
        request_uri: "/profilingGroups/{profilingGroupName}"
      )

      DESCRIBE_PROFILING_GROUP = OperationModel.new(
        name: "DescribeProfilingGroup",
        http_method: "GET",
        request_uri: "/profilingGroups/{profilingGroupName}"
      )

      GET_FINDINGS_REPORT_ACCOUNT_SUMMARY = OperationModel.new(
        name: "GetFindingsReportAccountSummary",
        http_method: "GET",
        request_uri: "/internal/findingsReports"
      )

      GET_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "GetNotificationConfiguration",
        http_method: "GET",
        request_uri: "/profilingGroups/{profilingGroupName}/notificationConfiguration"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "GET",
        request_uri: "/profilingGroups/{profilingGroupName}/policy"
      )

      GET_PROFILE = OperationModel.new(
        name: "GetProfile",
        http_method: "GET",
        request_uri: "/profilingGroups/{profilingGroupName}/profile"
      )

      GET_RECOMMENDATIONS = OperationModel.new(
        name: "GetRecommendations",
        http_method: "GET",
        request_uri: "/internal/profilingGroups/{profilingGroupName}/recommendations"
      )

      LIST_FINDINGS_REPORTS = OperationModel.new(
        name: "ListFindingsReports",
        http_method: "GET",
        request_uri: "/internal/profilingGroups/{profilingGroupName}/findingsReports"
      )

      LIST_PROFILE_TIMES = OperationModel.new(
        name: "ListProfileTimes",
        http_method: "GET",
        request_uri: "/profilingGroups/{profilingGroupName}/profileTimes"
      )

      LIST_PROFILING_GROUPS = OperationModel.new(
        name: "ListProfilingGroups",
        http_method: "GET",
        request_uri: "/profilingGroups"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      POST_AGENT_PROFILE = OperationModel.new(
        name: "PostAgentProfile",
        http_method: "POST",
        request_uri: "/profilingGroups/{profilingGroupName}/agentProfile"
      )

      PUT_PERMISSION = OperationModel.new(
        name: "PutPermission",
        http_method: "PUT",
        request_uri: "/profilingGroups/{profilingGroupName}/policy/{actionGroup}"
      )

      REMOVE_NOTIFICATION_CHANNEL = OperationModel.new(
        name: "RemoveNotificationChannel",
        http_method: "DELETE",
        request_uri: "/profilingGroups/{profilingGroupName}/notificationConfiguration/{channelId}"
      )

      REMOVE_PERMISSION = OperationModel.new(
        name: "RemovePermission",
        http_method: "DELETE",
        request_uri: "/profilingGroups/{profilingGroupName}/policy/{actionGroup}"
      )

      SUBMIT_FEEDBACK = OperationModel.new(
        name: "SubmitFeedback",
        http_method: "POST",
        request_uri: "/internal/profilingGroups/{profilingGroupName}/anomalies/{anomalyInstanceId}/feedback"
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

      UPDATE_PROFILING_GROUP = OperationModel.new(
        name: "UpdateProfilingGroup",
        http_method: "PUT",
        request_uri: "/profilingGroups/{profilingGroupName}"
      )
    end
  end
end
