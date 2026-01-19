module AwsSdk
  module Billingconductor
    module Model
      API_VERSION = "2021-07-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "billingconductor"
      ENDPOINT_PREFIX = "billingconductor"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://billingconductor.us-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"billingconductor","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://billingconductor-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://billingconductor-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://billingconductor.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://billingconductor.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ACCOUNTS = OperationModel.new(
        name: "AssociateAccounts",
        http_method: "POST",
        request_uri: "/associate-accounts"
      )

      ASSOCIATE_PRICING_RULES = OperationModel.new(
        name: "AssociatePricingRules",
        http_method: "PUT",
        request_uri: "/associate-pricing-rules"
      )

      BATCH_ASSOCIATE_RESOURCES_TO_CUSTOM_LINE_ITEM = OperationModel.new(
        name: "BatchAssociateResourcesToCustomLineItem",
        http_method: "PUT",
        request_uri: "/batch-associate-resources-to-custom-line-item"
      )

      BATCH_DISASSOCIATE_RESOURCES_FROM_CUSTOM_LINE_ITEM = OperationModel.new(
        name: "BatchDisassociateResourcesFromCustomLineItem",
        http_method: "PUT",
        request_uri: "/batch-disassociate-resources-from-custom-line-item"
      )

      CREATE_BILLING_GROUP = OperationModel.new(
        name: "CreateBillingGroup",
        http_method: "POST",
        request_uri: "/create-billing-group"
      )

      CREATE_CUSTOM_LINE_ITEM = OperationModel.new(
        name: "CreateCustomLineItem",
        http_method: "POST",
        request_uri: "/create-custom-line-item"
      )

      CREATE_PRICING_PLAN = OperationModel.new(
        name: "CreatePricingPlan",
        http_method: "POST",
        request_uri: "/create-pricing-plan"
      )

      CREATE_PRICING_RULE = OperationModel.new(
        name: "CreatePricingRule",
        http_method: "POST",
        request_uri: "/create-pricing-rule"
      )

      DELETE_BILLING_GROUP = OperationModel.new(
        name: "DeleteBillingGroup",
        http_method: "POST",
        request_uri: "/delete-billing-group"
      )

      DELETE_CUSTOM_LINE_ITEM = OperationModel.new(
        name: "DeleteCustomLineItem",
        http_method: "POST",
        request_uri: "/delete-custom-line-item"
      )

      DELETE_PRICING_PLAN = OperationModel.new(
        name: "DeletePricingPlan",
        http_method: "POST",
        request_uri: "/delete-pricing-plan"
      )

      DELETE_PRICING_RULE = OperationModel.new(
        name: "DeletePricingRule",
        http_method: "POST",
        request_uri: "/delete-pricing-rule"
      )

      DISASSOCIATE_ACCOUNTS = OperationModel.new(
        name: "DisassociateAccounts",
        http_method: "POST",
        request_uri: "/disassociate-accounts"
      )

      DISASSOCIATE_PRICING_RULES = OperationModel.new(
        name: "DisassociatePricingRules",
        http_method: "PUT",
        request_uri: "/disassociate-pricing-rules"
      )

      GET_BILLING_GROUP_COST_REPORT = OperationModel.new(
        name: "GetBillingGroupCostReport",
        http_method: "POST",
        request_uri: "/get-billing-group-cost-report"
      )

      LIST_ACCOUNT_ASSOCIATIONS = OperationModel.new(
        name: "ListAccountAssociations",
        http_method: "POST",
        request_uri: "/list-account-associations"
      )

      LIST_BILLING_GROUP_COST_REPORTS = OperationModel.new(
        name: "ListBillingGroupCostReports",
        http_method: "POST",
        request_uri: "/list-billing-group-cost-reports"
      )

      LIST_BILLING_GROUPS = OperationModel.new(
        name: "ListBillingGroups",
        http_method: "POST",
        request_uri: "/list-billing-groups"
      )

      LIST_CUSTOM_LINE_ITEM_VERSIONS = OperationModel.new(
        name: "ListCustomLineItemVersions",
        http_method: "POST",
        request_uri: "/list-custom-line-item-versions"
      )

      LIST_CUSTOM_LINE_ITEMS = OperationModel.new(
        name: "ListCustomLineItems",
        http_method: "POST",
        request_uri: "/list-custom-line-items"
      )

      LIST_PRICING_PLANS = OperationModel.new(
        name: "ListPricingPlans",
        http_method: "POST",
        request_uri: "/list-pricing-plans"
      )

      LIST_PRICING_PLANS_ASSOCIATED_WITH_PRICING_RULE = OperationModel.new(
        name: "ListPricingPlansAssociatedWithPricingRule",
        http_method: "POST",
        request_uri: "/list-pricing-plans-associated-with-pricing-rule"
      )

      LIST_PRICING_RULES = OperationModel.new(
        name: "ListPricingRules",
        http_method: "POST",
        request_uri: "/list-pricing-rules"
      )

      LIST_PRICING_RULES_ASSOCIATED_TO_PRICING_PLAN = OperationModel.new(
        name: "ListPricingRulesAssociatedToPricingPlan",
        http_method: "POST",
        request_uri: "/list-pricing-rules-associated-to-pricing-plan"
      )

      LIST_RESOURCES_ASSOCIATED_TO_CUSTOM_LINE_ITEM = OperationModel.new(
        name: "ListResourcesAssociatedToCustomLineItem",
        http_method: "POST",
        request_uri: "/list-resources-associated-to-custom-line-item"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
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

      UPDATE_BILLING_GROUP = OperationModel.new(
        name: "UpdateBillingGroup",
        http_method: "POST",
        request_uri: "/update-billing-group"
      )

      UPDATE_CUSTOM_LINE_ITEM = OperationModel.new(
        name: "UpdateCustomLineItem",
        http_method: "POST",
        request_uri: "/update-custom-line-item"
      )

      UPDATE_PRICING_PLAN = OperationModel.new(
        name: "UpdatePricingPlan",
        http_method: "PUT",
        request_uri: "/update-pricing-plan"
      )

      UPDATE_PRICING_RULE = OperationModel.new(
        name: "UpdatePricingRule",
        http_method: "PUT",
        request_uri: "/update-pricing-rule"
      )
    end
  end
end
