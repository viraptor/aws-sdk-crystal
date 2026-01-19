module AwsSdk
  module DevOpsGuru
    module Model
      API_VERSION = "2020-12-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "devops-guru"
      ENDPOINT_PREFIX = "devops-guru"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://devops-guru-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://devops-guru-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://devops-guru.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://devops-guru.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_NOTIFICATION_CHANNEL = OperationModel.new(
        name: "AddNotificationChannel",
        http_method: "PUT",
        request_uri: "/channels"
      )

      DELETE_INSIGHT = OperationModel.new(
        name: "DeleteInsight",
        http_method: "DELETE",
        request_uri: "/insights/{Id}"
      )

      DESCRIBE_ACCOUNT_HEALTH = OperationModel.new(
        name: "DescribeAccountHealth",
        http_method: "GET",
        request_uri: "/accounts/health"
      )

      DESCRIBE_ACCOUNT_OVERVIEW = OperationModel.new(
        name: "DescribeAccountOverview",
        http_method: "POST",
        request_uri: "/accounts/overview"
      )

      DESCRIBE_ANOMALY = OperationModel.new(
        name: "DescribeAnomaly",
        http_method: "GET",
        request_uri: "/anomalies/{Id}"
      )

      DESCRIBE_EVENT_SOURCES_CONFIG = OperationModel.new(
        name: "DescribeEventSourcesConfig",
        http_method: "POST",
        request_uri: "/event-sources"
      )

      DESCRIBE_FEEDBACK = OperationModel.new(
        name: "DescribeFeedback",
        http_method: "POST",
        request_uri: "/feedback"
      )

      DESCRIBE_INSIGHT = OperationModel.new(
        name: "DescribeInsight",
        http_method: "GET",
        request_uri: "/insights/{Id}"
      )

      DESCRIBE_ORGANIZATION_HEALTH = OperationModel.new(
        name: "DescribeOrganizationHealth",
        http_method: "POST",
        request_uri: "/organization/health"
      )

      DESCRIBE_ORGANIZATION_OVERVIEW = OperationModel.new(
        name: "DescribeOrganizationOverview",
        http_method: "POST",
        request_uri: "/organization/overview"
      )

      DESCRIBE_ORGANIZATION_RESOURCE_COLLECTION_HEALTH = OperationModel.new(
        name: "DescribeOrganizationResourceCollectionHealth",
        http_method: "POST",
        request_uri: "/organization/health/resource-collection"
      )

      DESCRIBE_RESOURCE_COLLECTION_HEALTH = OperationModel.new(
        name: "DescribeResourceCollectionHealth",
        http_method: "GET",
        request_uri: "/accounts/health/resource-collection/{ResourceCollectionType}"
      )

      DESCRIBE_SERVICE_INTEGRATION = OperationModel.new(
        name: "DescribeServiceIntegration",
        http_method: "GET",
        request_uri: "/service-integrations"
      )

      GET_COST_ESTIMATION = OperationModel.new(
        name: "GetCostEstimation",
        http_method: "GET",
        request_uri: "/cost-estimation"
      )

      GET_RESOURCE_COLLECTION = OperationModel.new(
        name: "GetResourceCollection",
        http_method: "GET",
        request_uri: "/resource-collections/{ResourceCollectionType}"
      )

      LIST_ANOMALIES_FOR_INSIGHT = OperationModel.new(
        name: "ListAnomaliesForInsight",
        http_method: "POST",
        request_uri: "/anomalies/insight/{InsightId}"
      )

      LIST_ANOMALOUS_LOG_GROUPS = OperationModel.new(
        name: "ListAnomalousLogGroups",
        http_method: "POST",
        request_uri: "/list-log-anomalies"
      )

      LIST_EVENTS = OperationModel.new(
        name: "ListEvents",
        http_method: "POST",
        request_uri: "/events"
      )

      LIST_INSIGHTS = OperationModel.new(
        name: "ListInsights",
        http_method: "POST",
        request_uri: "/insights"
      )

      LIST_MONITORED_RESOURCES = OperationModel.new(
        name: "ListMonitoredResources",
        http_method: "POST",
        request_uri: "/monitoredResources"
      )

      LIST_NOTIFICATION_CHANNELS = OperationModel.new(
        name: "ListNotificationChannels",
        http_method: "POST",
        request_uri: "/channels"
      )

      LIST_ORGANIZATION_INSIGHTS = OperationModel.new(
        name: "ListOrganizationInsights",
        http_method: "POST",
        request_uri: "/organization/insights"
      )

      LIST_RECOMMENDATIONS = OperationModel.new(
        name: "ListRecommendations",
        http_method: "POST",
        request_uri: "/recommendations"
      )

      PUT_FEEDBACK = OperationModel.new(
        name: "PutFeedback",
        http_method: "PUT",
        request_uri: "/feedback"
      )

      REMOVE_NOTIFICATION_CHANNEL = OperationModel.new(
        name: "RemoveNotificationChannel",
        http_method: "DELETE",
        request_uri: "/channels/{Id}"
      )

      SEARCH_INSIGHTS = OperationModel.new(
        name: "SearchInsights",
        http_method: "POST",
        request_uri: "/insights/search"
      )

      SEARCH_ORGANIZATION_INSIGHTS = OperationModel.new(
        name: "SearchOrganizationInsights",
        http_method: "POST",
        request_uri: "/organization/insights/search"
      )

      START_COST_ESTIMATION = OperationModel.new(
        name: "StartCostEstimation",
        http_method: "PUT",
        request_uri: "/cost-estimation"
      )

      UPDATE_EVENT_SOURCES_CONFIG = OperationModel.new(
        name: "UpdateEventSourcesConfig",
        http_method: "PUT",
        request_uri: "/event-sources"
      )

      UPDATE_RESOURCE_COLLECTION = OperationModel.new(
        name: "UpdateResourceCollection",
        http_method: "PUT",
        request_uri: "/resource-collections"
      )

      UPDATE_SERVICE_INTEGRATION = OperationModel.new(
        name: "UpdateServiceIntegration",
        http_method: "PUT",
        request_uri: "/service-integrations"
      )
    end
  end
end
