module Aws
  module FreeTier
    module Model
      API_VERSION = "2023-09-07"
      TARGET_PREFIX = "AWSFreeTierService"
      SIGNING_NAME = "freetier"
      ENDPOINT_PREFIX = "freetier"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://freetier-fips.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://freetier.us-east-1.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingName":"freetier","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://freetier-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"aws-cn-global"]}],"endpoint":{"url":"https://freetier.cn-northwest-1.api.amazonwebservices.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingName":"freetier","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://freetier.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://freetier-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"aws-cn-global"]}],"endpoint":{"url":"https://freetier.cn-northwest-1.api.amazonwebservices.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingName":"freetier","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://freetier.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      GET_ACCOUNT_ACTIVITY = OperationModel.new(
        name: "GetAccountActivity",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_PLAN_STATE = OperationModel.new(
        name: "GetAccountPlanState",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FREE_TIER_USAGE = OperationModel.new(
        name: "GetFreeTierUsage",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_ACTIVITIES = OperationModel.new(
        name: "ListAccountActivities",
        http_method: "POST",
        request_uri: "/"
      )

      UPGRADE_ACCOUNT_PLAN = OperationModel.new(
        name: "UpgradeAccountPlan",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
