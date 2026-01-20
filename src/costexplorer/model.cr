module Aws
  module CostExplorer
    module Model
      API_VERSION = "2017-10-25"
      TARGET_PREFIX = "AWSInsightsIndexService"
      SIGNING_NAME = "ce"
      ENDPOINT_PREFIX = "ce"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ce.us-east-1.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ce.cn-northwest-1.api.amazonwebservices.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://ce.us-iso-east-1.c2s.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-iso-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://ce.us-isob-east-1.sc2s.sgov.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isob-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://ce.eu-isoe-west-1.cloud.adc-e.uk","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eu-isoe-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://ce.us-isof-south-1.csp.hci.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isof-south-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ce.eusc-de-east-1.api.amazonwebservices.eu","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eusc-de-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://ce.eusc-de-east-1.api.amazonwebservices.eu","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eusc-de-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ce-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ce-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ce.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ce.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ANOMALY_MONITOR = OperationModel.new(
        name: "CreateAnomalyMonitor",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ANOMALY_SUBSCRIPTION = OperationModel.new(
        name: "CreateAnomalySubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COST_CATEGORY_DEFINITION = OperationModel.new(
        name: "CreateCostCategoryDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ANOMALY_MONITOR = OperationModel.new(
        name: "DeleteAnomalyMonitor",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ANOMALY_SUBSCRIPTION = OperationModel.new(
        name: "DeleteAnomalySubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COST_CATEGORY_DEFINITION = OperationModel.new(
        name: "DeleteCostCategoryDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COST_CATEGORY_DEFINITION = OperationModel.new(
        name: "DescribeCostCategoryDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ANOMALIES = OperationModel.new(
        name: "GetAnomalies",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ANOMALY_MONITORS = OperationModel.new(
        name: "GetAnomalyMonitors",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ANOMALY_SUBSCRIPTIONS = OperationModel.new(
        name: "GetAnomalySubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPROXIMATE_USAGE_RECORDS = OperationModel.new(
        name: "GetApproximateUsageRecords",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMMITMENT_PURCHASE_ANALYSIS = OperationModel.new(
        name: "GetCommitmentPurchaseAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COST_AND_USAGE = OperationModel.new(
        name: "GetCostAndUsage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COST_AND_USAGE_COMPARISONS = OperationModel.new(
        name: "GetCostAndUsageComparisons",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COST_AND_USAGE_WITH_RESOURCES = OperationModel.new(
        name: "GetCostAndUsageWithResources",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COST_CATEGORIES = OperationModel.new(
        name: "GetCostCategories",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COST_COMPARISON_DRIVERS = OperationModel.new(
        name: "GetCostComparisonDrivers",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COST_FORECAST = OperationModel.new(
        name: "GetCostForecast",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DIMENSION_VALUES = OperationModel.new(
        name: "GetDimensionValues",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVATION_COVERAGE = OperationModel.new(
        name: "GetReservationCoverage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVATION_PURCHASE_RECOMMENDATION = OperationModel.new(
        name: "GetReservationPurchaseRecommendation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVATION_UTILIZATION = OperationModel.new(
        name: "GetReservationUtilization",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RIGHTSIZING_RECOMMENDATION = OperationModel.new(
        name: "GetRightsizingRecommendation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAVINGS_PLAN_PURCHASE_RECOMMENDATION_DETAILS = OperationModel.new(
        name: "GetSavingsPlanPurchaseRecommendationDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAVINGS_PLANS_COVERAGE = OperationModel.new(
        name: "GetSavingsPlansCoverage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAVINGS_PLANS_PURCHASE_RECOMMENDATION = OperationModel.new(
        name: "GetSavingsPlansPurchaseRecommendation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAVINGS_PLANS_UTILIZATION = OperationModel.new(
        name: "GetSavingsPlansUtilization",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAVINGS_PLANS_UTILIZATION_DETAILS = OperationModel.new(
        name: "GetSavingsPlansUtilizationDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TAGS = OperationModel.new(
        name: "GetTags",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USAGE_FORECAST = OperationModel.new(
        name: "GetUsageForecast",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMMITMENT_PURCHASE_ANALYSES = OperationModel.new(
        name: "ListCommitmentPurchaseAnalyses",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COST_ALLOCATION_TAG_BACKFILL_HISTORY = OperationModel.new(
        name: "ListCostAllocationTagBackfillHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COST_ALLOCATION_TAGS = OperationModel.new(
        name: "ListCostAllocationTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COST_CATEGORY_DEFINITIONS = OperationModel.new(
        name: "ListCostCategoryDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COST_CATEGORY_RESOURCE_ASSOCIATIONS = OperationModel.new(
        name: "ListCostCategoryResourceAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SAVINGS_PLANS_PURCHASE_RECOMMENDATION_GENERATION = OperationModel.new(
        name: "ListSavingsPlansPurchaseRecommendationGeneration",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PROVIDE_ANOMALY_FEEDBACK = OperationModel.new(
        name: "ProvideAnomalyFeedback",
        http_method: "POST",
        request_uri: "/"
      )

      START_COMMITMENT_PURCHASE_ANALYSIS = OperationModel.new(
        name: "StartCommitmentPurchaseAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      START_COST_ALLOCATION_TAG_BACKFILL = OperationModel.new(
        name: "StartCostAllocationTagBackfill",
        http_method: "POST",
        request_uri: "/"
      )

      START_SAVINGS_PLANS_PURCHASE_RECOMMENDATION_GENERATION = OperationModel.new(
        name: "StartSavingsPlansPurchaseRecommendationGeneration",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ANOMALY_MONITOR = OperationModel.new(
        name: "UpdateAnomalyMonitor",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ANOMALY_SUBSCRIPTION = OperationModel.new(
        name: "UpdateAnomalySubscription",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COST_ALLOCATION_TAGS_STATUS = OperationModel.new(
        name: "UpdateCostAllocationTagsStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COST_CATEGORY_DEFINITION = OperationModel.new(
        name: "UpdateCostCategoryDefinition",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
