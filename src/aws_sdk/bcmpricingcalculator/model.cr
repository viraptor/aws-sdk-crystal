module AwsSdk
  module BCMPricingCalculator
    module Model
      API_VERSION = "2024-06-19"
      TARGET_PREFIX = "AWSBCMPricingCalculator"
      SIGNING_NAME = "bcm-pricing-calculator"
      ENDPOINT_PREFIX = "bcm-pricing-calculator"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://bcm-pricing-calculator-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://bcm-pricing-calculator.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_BILL_SCENARIO_COMMITMENT_MODIFICATION = OperationModel.new(
        name: "BatchCreateBillScenarioCommitmentModification",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_CREATE_BILL_SCENARIO_USAGE_MODIFICATION = OperationModel.new(
        name: "BatchCreateBillScenarioUsageModification",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_CREATE_WORKLOAD_ESTIMATE_USAGE = OperationModel.new(
        name: "BatchCreateWorkloadEstimateUsage",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_BILL_SCENARIO_COMMITMENT_MODIFICATION = OperationModel.new(
        name: "BatchDeleteBillScenarioCommitmentModification",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_BILL_SCENARIO_USAGE_MODIFICATION = OperationModel.new(
        name: "BatchDeleteBillScenarioUsageModification",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_WORKLOAD_ESTIMATE_USAGE = OperationModel.new(
        name: "BatchDeleteWorkloadEstimateUsage",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_UPDATE_BILL_SCENARIO_COMMITMENT_MODIFICATION = OperationModel.new(
        name: "BatchUpdateBillScenarioCommitmentModification",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_UPDATE_BILL_SCENARIO_USAGE_MODIFICATION = OperationModel.new(
        name: "BatchUpdateBillScenarioUsageModification",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_UPDATE_WORKLOAD_ESTIMATE_USAGE = OperationModel.new(
        name: "BatchUpdateWorkloadEstimateUsage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BILL_ESTIMATE = OperationModel.new(
        name: "CreateBillEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BILL_SCENARIO = OperationModel.new(
        name: "CreateBillScenario",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKLOAD_ESTIMATE = OperationModel.new(
        name: "CreateWorkloadEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BILL_ESTIMATE = OperationModel.new(
        name: "DeleteBillEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BILL_SCENARIO = OperationModel.new(
        name: "DeleteBillScenario",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKLOAD_ESTIMATE = OperationModel.new(
        name: "DeleteWorkloadEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BILL_ESTIMATE = OperationModel.new(
        name: "GetBillEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BILL_SCENARIO = OperationModel.new(
        name: "GetBillScenario",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PREFERENCES = OperationModel.new(
        name: "GetPreferences",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKLOAD_ESTIMATE = OperationModel.new(
        name: "GetWorkloadEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_ESTIMATE_COMMITMENTS = OperationModel.new(
        name: "ListBillEstimateCommitments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_ESTIMATE_INPUT_COMMITMENT_MODIFICATIONS = OperationModel.new(
        name: "ListBillEstimateInputCommitmentModifications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_ESTIMATE_INPUT_USAGE_MODIFICATIONS = OperationModel.new(
        name: "ListBillEstimateInputUsageModifications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_ESTIMATE_LINE_ITEMS = OperationModel.new(
        name: "ListBillEstimateLineItems",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_ESTIMATES = OperationModel.new(
        name: "ListBillEstimates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_SCENARIO_COMMITMENT_MODIFICATIONS = OperationModel.new(
        name: "ListBillScenarioCommitmentModifications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_SCENARIO_USAGE_MODIFICATIONS = OperationModel.new(
        name: "ListBillScenarioUsageModifications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BILL_SCENARIOS = OperationModel.new(
        name: "ListBillScenarios",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKLOAD_ESTIMATE_USAGE = OperationModel.new(
        name: "ListWorkloadEstimateUsage",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKLOAD_ESTIMATES = OperationModel.new(
        name: "ListWorkloadEstimates",
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

      UPDATE_BILL_ESTIMATE = OperationModel.new(
        name: "UpdateBillEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BILL_SCENARIO = OperationModel.new(
        name: "UpdateBillScenario",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PREFERENCES = OperationModel.new(
        name: "UpdatePreferences",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKLOAD_ESTIMATE = OperationModel.new(
        name: "UpdateWorkloadEstimate",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
