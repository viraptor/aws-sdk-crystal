module Aws
  module Budgets
    module Model
      API_VERSION = "2016-10-20"
      TARGET_PREFIX = "AWSBudgetServiceGateway"
      SIGNING_NAME = "budgets"
      ENDPOINT_PREFIX = "budgets"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://budgets.us-east-1.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://budgets.global.sc2s.sgov.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isob-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://budgets.global.cloud.adc-e.uk","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eu-isoe-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://budgets.global.csp.hci.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isof-south-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://budgets.eusc-de-east-1.api.amazonwebservices.eu","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eusc-de-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://budgets.eusc-de-east-1.api.amazonwebservices.eu","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eusc-de-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://budgets-fips.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://budgets-fips.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://budgets.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://budgets.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_BUDGET = OperationModel.new(
        name: "CreateBudget",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BUDGET_ACTION = OperationModel.new(
        name: "CreateBudgetAction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NOTIFICATION = OperationModel.new(
        name: "CreateNotification",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SUBSCRIBER = OperationModel.new(
        name: "CreateSubscriber",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BUDGET = OperationModel.new(
        name: "DeleteBudget",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BUDGET_ACTION = OperationModel.new(
        name: "DeleteBudgetAction",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NOTIFICATION = OperationModel.new(
        name: "DeleteNotification",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SUBSCRIBER = OperationModel.new(
        name: "DeleteSubscriber",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGET = OperationModel.new(
        name: "DescribeBudget",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGET_ACTION = OperationModel.new(
        name: "DescribeBudgetAction",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGET_ACTION_HISTORIES = OperationModel.new(
        name: "DescribeBudgetActionHistories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGET_ACTIONS_FOR_ACCOUNT = OperationModel.new(
        name: "DescribeBudgetActionsForAccount",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGET_ACTIONS_FOR_BUDGET = OperationModel.new(
        name: "DescribeBudgetActionsForBudget",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGET_NOTIFICATIONS_FOR_ACCOUNT = OperationModel.new(
        name: "DescribeBudgetNotificationsForAccount",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGET_PERFORMANCE_HISTORY = OperationModel.new(
        name: "DescribeBudgetPerformanceHistory",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUDGETS = OperationModel.new(
        name: "DescribeBudgets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NOTIFICATIONS_FOR_BUDGET = OperationModel.new(
        name: "DescribeNotificationsForBudget",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUBSCRIBERS_FOR_NOTIFICATION = OperationModel.new(
        name: "DescribeSubscribersForNotification",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_BUDGET_ACTION = OperationModel.new(
        name: "ExecuteBudgetAction",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
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

      UPDATE_BUDGET = OperationModel.new(
        name: "UpdateBudget",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BUDGET_ACTION = OperationModel.new(
        name: "UpdateBudgetAction",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NOTIFICATION = OperationModel.new(
        name: "UpdateNotification",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SUBSCRIBER = OperationModel.new(
        name: "UpdateSubscriber",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
