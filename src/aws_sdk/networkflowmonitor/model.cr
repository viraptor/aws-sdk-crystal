module AwsSdk
  module NetworkFlowMonitor
    module Model
      API_VERSION = "2023-04-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "networkflowmonitor"
      ENDPOINT_PREFIX = "networkflowmonitor"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://networkflowmonitor-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://networkflowmonitor.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
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
        request_uri: "/monitors"
      )

      CREATE_SCOPE = OperationModel.new(
        name: "CreateScope",
        http_method: "POST",
        request_uri: "/scopes"
      )

      DELETE_MONITOR = OperationModel.new(
        name: "DeleteMonitor",
        http_method: "DELETE",
        request_uri: "/monitors/{monitorName}"
      )

      DELETE_SCOPE = OperationModel.new(
        name: "DeleteScope",
        http_method: "DELETE",
        request_uri: "/scopes/{scopeId}"
      )

      GET_MONITOR = OperationModel.new(
        name: "GetMonitor",
        http_method: "GET",
        request_uri: "/monitors/{monitorName}"
      )

      GET_QUERY_RESULTS_MONITOR_TOP_CONTRIBUTORS = OperationModel.new(
        name: "GetQueryResultsMonitorTopContributors",
        http_method: "GET",
        request_uri: "/monitors/{monitorName}/topContributorsQueries/{queryId}/results"
      )

      GET_QUERY_RESULTS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS = OperationModel.new(
        name: "GetQueryResultsWorkloadInsightsTopContributors",
        http_method: "GET",
        request_uri: "/workloadInsights/{scopeId}/topContributorsQueries/{queryId}/results"
      )

      GET_QUERY_RESULTS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA = OperationModel.new(
        name: "GetQueryResultsWorkloadInsightsTopContributorsData",
        http_method: "GET",
        request_uri: "/workloadInsights/{scopeId}/topContributorsDataQueries/{queryId}/results"
      )

      GET_QUERY_STATUS_MONITOR_TOP_CONTRIBUTORS = OperationModel.new(
        name: "GetQueryStatusMonitorTopContributors",
        http_method: "GET",
        request_uri: "/monitors/{monitorName}/topContributorsQueries/{queryId}/status"
      )

      GET_QUERY_STATUS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS = OperationModel.new(
        name: "GetQueryStatusWorkloadInsightsTopContributors",
        http_method: "GET",
        request_uri: "/workloadInsights/{scopeId}/topContributorsQueries/{queryId}/status"
      )

      GET_QUERY_STATUS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA = OperationModel.new(
        name: "GetQueryStatusWorkloadInsightsTopContributorsData",
        http_method: "GET",
        request_uri: "/workloadInsights/{scopeId}/topContributorsDataQueries/{queryId}/status"
      )

      GET_SCOPE = OperationModel.new(
        name: "GetScope",
        http_method: "GET",
        request_uri: "/scopes/{scopeId}"
      )

      LIST_MONITORS = OperationModel.new(
        name: "ListMonitors",
        http_method: "GET",
        request_uri: "/monitors"
      )

      LIST_SCOPES = OperationModel.new(
        name: "ListScopes",
        http_method: "GET",
        request_uri: "/scopes"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      START_QUERY_MONITOR_TOP_CONTRIBUTORS = OperationModel.new(
        name: "StartQueryMonitorTopContributors",
        http_method: "POST",
        request_uri: "/monitors/{monitorName}/topContributorsQueries"
      )

      START_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS = OperationModel.new(
        name: "StartQueryWorkloadInsightsTopContributors",
        http_method: "POST",
        request_uri: "/workloadInsights/{scopeId}/topContributorsQueries"
      )

      START_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA = OperationModel.new(
        name: "StartQueryWorkloadInsightsTopContributorsData",
        http_method: "POST",
        request_uri: "/workloadInsights/{scopeId}/topContributorsDataQueries"
      )

      STOP_QUERY_MONITOR_TOP_CONTRIBUTORS = OperationModel.new(
        name: "StopQueryMonitorTopContributors",
        http_method: "DELETE",
        request_uri: "/monitors/{monitorName}/topContributorsQueries/{queryId}"
      )

      STOP_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS = OperationModel.new(
        name: "StopQueryWorkloadInsightsTopContributors",
        http_method: "DELETE",
        request_uri: "/workloadInsights/{scopeId}/topContributorsQueries/{queryId}"
      )

      STOP_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA = OperationModel.new(
        name: "StopQueryWorkloadInsightsTopContributorsData",
        http_method: "DELETE",
        request_uri: "/workloadInsights/{scopeId}/topContributorsDataQueries/{queryId}"
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

      UPDATE_MONITOR = OperationModel.new(
        name: "UpdateMonitor",
        http_method: "PATCH",
        request_uri: "/monitors/{monitorName}"
      )

      UPDATE_SCOPE = OperationModel.new(
        name: "UpdateScope",
        http_method: "PATCH",
        request_uri: "/scopes/{scopeId}"
      )
    end
  end
end
