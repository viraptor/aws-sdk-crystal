module Aws
  module Savingsplans
    module Model
      API_VERSION = "2019-06-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "savingsplans"
      ENDPOINT_PREFIX = "savingsplans"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"endpoint":{"url":"https://savingsplans.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingName":"savingsplans","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://savingsplans.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"Region"}]}]}],"endpoint":{"url":"https://savingsplans.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingName":"savingsplans","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://savingsplans.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"savingsplans","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://savingsplans-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://savingsplans-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://savingsplans.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://savingsplans.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_SAVINGS_PLAN = OperationModel.new(
        name: "CreateSavingsPlan",
        http_method: "POST",
        request_uri: "/CreateSavingsPlan"
      )

      DELETE_QUEUED_SAVINGS_PLAN = OperationModel.new(
        name: "DeleteQueuedSavingsPlan",
        http_method: "POST",
        request_uri: "/DeleteQueuedSavingsPlan"
      )

      DESCRIBE_SAVINGS_PLAN_RATES = OperationModel.new(
        name: "DescribeSavingsPlanRates",
        http_method: "POST",
        request_uri: "/DescribeSavingsPlanRates"
      )

      DESCRIBE_SAVINGS_PLANS = OperationModel.new(
        name: "DescribeSavingsPlans",
        http_method: "POST",
        request_uri: "/DescribeSavingsPlans"
      )

      DESCRIBE_SAVINGS_PLANS_OFFERING_RATES = OperationModel.new(
        name: "DescribeSavingsPlansOfferingRates",
        http_method: "POST",
        request_uri: "/DescribeSavingsPlansOfferingRates"
      )

      DESCRIBE_SAVINGS_PLANS_OFFERINGS = OperationModel.new(
        name: "DescribeSavingsPlansOfferings",
        http_method: "POST",
        request_uri: "/DescribeSavingsPlansOfferings"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/ListTagsForResource"
      )

      RETURN_SAVINGS_PLAN = OperationModel.new(
        name: "ReturnSavingsPlan",
        http_method: "POST",
        request_uri: "/ReturnSavingsPlan"
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
    end
  end
end
