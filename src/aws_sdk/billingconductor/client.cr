module AwsSdk
  module Billingconductor
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Connects an array of account IDs in a consolidated billing family to a predefined billing group. The
      # account IDs must be a part of the consolidated billing family during the current month, and not
      # already associated with another billing group. The maximum number of accounts that can be associated
      # in one call is 30.

      def associate_accounts(
        account_ids : Array(String),
        arn : String
      ) : Protocol::Request
        input = Types::AssociateAccountsInput.new(account_ids: account_ids, arn: arn)
        associate_accounts(input)
      end

      def associate_accounts(input : Types::AssociateAccountsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Connects an array of PricingRuleArns to a defined PricingPlan . The maximum number PricingRuleArn
      # that can be associated in one call is 30.

      def associate_pricing_rules(
        arn : String,
        pricing_rule_arns : Array(String)
      ) : Protocol::Request
        input = Types::AssociatePricingRulesInput.new(arn: arn, pricing_rule_arns: pricing_rule_arns)
        associate_pricing_rules(input)
      end

      def associate_pricing_rules(input : Types::AssociatePricingRulesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PRICING_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a batch of resources to a percentage custom line item.

      def batch_associate_resources_to_custom_line_item(
        resource_arns : Array(String),
        target_arn : String,
        billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil
      ) : Protocol::Request
        input = Types::BatchAssociateResourcesToCustomLineItemInput.new(resource_arns: resource_arns, target_arn: target_arn, billing_period_range: billing_period_range)
        batch_associate_resources_to_custom_line_item(input)
      end

      def batch_associate_resources_to_custom_line_item(input : Types::BatchAssociateResourcesToCustomLineItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ASSOCIATE_RESOURCES_TO_CUSTOM_LINE_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a batch of resources from a percentage custom line item.

      def batch_disassociate_resources_from_custom_line_item(
        resource_arns : Array(String),
        target_arn : String,
        billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil
      ) : Protocol::Request
        input = Types::BatchDisassociateResourcesFromCustomLineItemInput.new(resource_arns: resource_arns, target_arn: target_arn, billing_period_range: billing_period_range)
        batch_disassociate_resources_from_custom_line_item(input)
      end

      def batch_disassociate_resources_from_custom_line_item(input : Types::BatchDisassociateResourcesFromCustomLineItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISASSOCIATE_RESOURCES_FROM_CUSTOM_LINE_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a billing group that resembles a consolidated billing family that Amazon Web Services
      # charges, based off of the predefined pricing plan computation.

      def create_billing_group(
        account_grouping : Types::AccountGrouping,
        computation_preference : Types::ComputationPreference,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        primary_account_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateBillingGroupInput.new(account_grouping: account_grouping, computation_preference: computation_preference, name: name, client_token: client_token, description: description, primary_account_id: primary_account_id, tags: tags)
        create_billing_group(input)
      end

      def create_billing_group(input : Types::CreateBillingGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom line item that can be used to create a one-time fixed charge that can be applied to
      # a single billing group for the current or previous billing period. The one-time fixed charge is
      # either a fee or discount.

      def create_custom_line_item(
        billing_group_arn : String,
        charge_details : Types::CustomLineItemChargeDetails,
        description : String,
        name : String,
        account_id : String? = nil,
        billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil,
        client_token : String? = nil,
        computation_rule : String? = nil,
        presentation_details : Types::PresentationObject? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomLineItemInput.new(billing_group_arn: billing_group_arn, charge_details: charge_details, description: description, name: name, account_id: account_id, billing_period_range: billing_period_range, client_token: client_token, computation_rule: computation_rule, presentation_details: presentation_details, tags: tags)
        create_custom_line_item(input)
      end

      def create_custom_line_item(input : Types::CreateCustomLineItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_LINE_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a pricing plan that is used for computing Amazon Web Services charges for billing groups.

      def create_pricing_plan(
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        pricing_rule_arns : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePricingPlanInput.new(name: name, client_token: client_token, description: description, pricing_rule_arns: pricing_rule_arns, tags: tags)
        create_pricing_plan(input)
      end

      def create_pricing_plan(input : Types::CreatePricingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRICING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a pricing rule can be associated to a pricing plan, or a set of pricing plans.

      def create_pricing_rule(
        name : String,
        scope : String,
        type : String,
        billing_entity : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        modifier_percentage : Float64? = nil,
        operation : String? = nil,
        service : String? = nil,
        tags : Hash(String, String)? = nil,
        tiering : Types::CreateTieringInput? = nil,
        usage_type : String? = nil
      ) : Protocol::Request
        input = Types::CreatePricingRuleInput.new(name: name, scope: scope, type: type, billing_entity: billing_entity, client_token: client_token, description: description, modifier_percentage: modifier_percentage, operation: operation, service: service, tags: tags, tiering: tiering, usage_type: usage_type)
        create_pricing_rule(input)
      end

      def create_pricing_rule(input : Types::CreatePricingRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRICING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a billing group.

      def delete_billing_group(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteBillingGroupInput.new(arn: arn)
        delete_billing_group(input)
      end

      def delete_billing_group(input : Types::DeleteBillingGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the custom line item identified by the given ARN in the current, or previous billing period.

      def delete_custom_line_item(
        arn : String,
        billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil
      ) : Protocol::Request
        input = Types::DeleteCustomLineItemInput.new(arn: arn, billing_period_range: billing_period_range)
        delete_custom_line_item(input)
      end

      def delete_custom_line_item(input : Types::DeleteCustomLineItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_LINE_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a pricing plan. The pricing plan must not be associated with any billing groups to delete
      # successfully.

      def delete_pricing_plan(
        arn : String
      ) : Protocol::Request
        input = Types::DeletePricingPlanInput.new(arn: arn)
        delete_pricing_plan(input)
      end

      def delete_pricing_plan(input : Types::DeletePricingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRICING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the pricing rule that's identified by the input Amazon Resource Name (ARN).

      def delete_pricing_rule(
        arn : String
      ) : Protocol::Request
        input = Types::DeletePricingRuleInput.new(arn: arn)
        delete_pricing_rule(input)
      end

      def delete_pricing_rule(input : Types::DeletePricingRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRICING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified list of account IDs from the given billing group.

      def disassociate_accounts(
        account_ids : Array(String),
        arn : String
      ) : Protocol::Request
        input = Types::DisassociateAccountsInput.new(account_ids: account_ids, arn: arn)
        disassociate_accounts(input)
      end

      def disassociate_accounts(input : Types::DisassociateAccountsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a list of pricing rules from a pricing plan.

      def disassociate_pricing_rules(
        arn : String,
        pricing_rule_arns : Array(String)
      ) : Protocol::Request
        input = Types::DisassociatePricingRulesInput.new(arn: arn, pricing_rule_arns: pricing_rule_arns)
        disassociate_pricing_rules(input)
      end

      def disassociate_pricing_rules(input : Types::DisassociatePricingRulesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PRICING_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the margin summary report, which includes the Amazon Web Services cost and charged amount
      # (pro forma cost) by Amazon Web Services service for a specific billing group.

      def get_billing_group_cost_report(
        arn : String,
        billing_period_range : Types::BillingPeriodRange? = nil,
        group_by : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetBillingGroupCostReportInput.new(arn: arn, billing_period_range: billing_period_range, group_by: group_by, max_results: max_results, next_token: next_token)
        get_billing_group_cost_report(input)
      end

      def get_billing_group_cost_report(input : Types::GetBillingGroupCostReportInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BILLING_GROUP_COST_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This is a paginated call to list linked accounts that are linked to the payer account for the
      # specified time period. If no information is provided, the current billing period is used. The
      # response will optionally include the billing group that's associated with the linked account.

      def list_account_associations(
        billing_period : String? = nil,
        filters : Types::ListAccountAssociationsFilter? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountAssociationsInput.new(billing_period: billing_period, filters: filters, next_token: next_token)
        list_account_associations(input)
      end

      def list_account_associations(input : Types::ListAccountAssociationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNT_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A paginated call to retrieve a summary report of actual Amazon Web Services charges and the
      # calculated Amazon Web Services charges based on the associated pricing plan of a billing group.

      def list_billing_group_cost_reports(
        billing_period : String? = nil,
        filters : Types::ListBillingGroupCostReportsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBillingGroupCostReportsInput.new(billing_period: billing_period, filters: filters, max_results: max_results, next_token: next_token)
        list_billing_group_cost_reports(input)
      end

      def list_billing_group_cost_reports(input : Types::ListBillingGroupCostReportsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BILLING_GROUP_COST_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A paginated call to retrieve a list of billing groups for the given billing period. If you don't
      # provide a billing group, the current billing period is used.

      def list_billing_groups(
        billing_period : String? = nil,
        filters : Types::ListBillingGroupsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBillingGroupsInput.new(billing_period: billing_period, filters: filters, max_results: max_results, next_token: next_token)
        list_billing_groups(input)
      end

      def list_billing_groups(input : Types::ListBillingGroupsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BILLING_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A paginated call to get a list of all custom line item versions.

      def list_custom_line_item_versions(
        arn : String,
        filters : Types::ListCustomLineItemVersionsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomLineItemVersionsInput.new(arn: arn, filters: filters, max_results: max_results, next_token: next_token)
        list_custom_line_item_versions(input)
      end

      def list_custom_line_item_versions(input : Types::ListCustomLineItemVersionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_LINE_ITEM_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A paginated call to get a list of all custom line items (FFLIs) for the given billing period. If you
      # don't provide a billing period, the current billing period is used.

      def list_custom_line_items(
        billing_period : String? = nil,
        filters : Types::ListCustomLineItemsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomLineItemsInput.new(billing_period: billing_period, filters: filters, max_results: max_results, next_token: next_token)
        list_custom_line_items(input)
      end

      def list_custom_line_items(input : Types::ListCustomLineItemsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_LINE_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A paginated call to get pricing plans for the given billing period. If you don't provide a billing
      # period, the current billing period is used.

      def list_pricing_plans(
        billing_period : String? = nil,
        filters : Types::ListPricingPlansFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPricingPlansInput.new(billing_period: billing_period, filters: filters, max_results: max_results, next_token: next_token)
        list_pricing_plans(input)
      end

      def list_pricing_plans(input : Types::ListPricingPlansInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRICING_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of the pricing plans that are associated with a pricing rule.

      def list_pricing_plans_associated_with_pricing_rule(
        pricing_rule_arn : String,
        billing_period : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPricingPlansAssociatedWithPricingRuleInput.new(pricing_rule_arn: pricing_rule_arn, billing_period: billing_period, max_results: max_results, next_token: next_token)
        list_pricing_plans_associated_with_pricing_rule(input)
      end

      def list_pricing_plans_associated_with_pricing_rule(input : Types::ListPricingPlansAssociatedWithPricingRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRICING_PLANS_ASSOCIATED_WITH_PRICING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a pricing rule that can be associated to a pricing plan, or set of pricing plans.

      def list_pricing_rules(
        billing_period : String? = nil,
        filters : Types::ListPricingRulesFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPricingRulesInput.new(billing_period: billing_period, filters: filters, max_results: max_results, next_token: next_token)
        list_pricing_rules(input)
      end

      def list_pricing_rules(input : Types::ListPricingRulesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRICING_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the pricing rules that are associated with a pricing plan.

      def list_pricing_rules_associated_to_pricing_plan(
        pricing_plan_arn : String,
        billing_period : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPricingRulesAssociatedToPricingPlanInput.new(pricing_plan_arn: pricing_plan_arn, billing_period: billing_period, max_results: max_results, next_token: next_token)
        list_pricing_rules_associated_to_pricing_plan(input)
      end

      def list_pricing_rules_associated_to_pricing_plan(input : Types::ListPricingRulesAssociatedToPricingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRICING_RULES_ASSOCIATED_TO_PRICING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the resources that are associated to a custom line item.

      def list_resources_associated_to_custom_line_item(
        arn : String,
        billing_period : String? = nil,
        filters : Types::ListResourcesAssociatedToCustomLineItemFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourcesAssociatedToCustomLineItemInput.new(arn: arn, billing_period: billing_period, filters: filters, max_results: max_results, next_token: next_token)
        list_resources_associated_to_custom_line_item(input)
      end

      def list_resources_associated_to_custom_line_item(input : Types::ListResourcesAssociatedToCustomLineItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCES_ASSOCIATED_TO_CUSTOM_LINE_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list the tags for a resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified tags to a resource with the specified resourceArn . If existing tags on a
      # resource are not specified in the request parameters, they are not changed.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes specified tags from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This updates an existing billing group.

      def update_billing_group(
        arn : String,
        account_grouping : Types::UpdateBillingGroupAccountGrouping? = nil,
        computation_preference : Types::ComputationPreference? = nil,
        description : String? = nil,
        name : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateBillingGroupInput.new(arn: arn, account_grouping: account_grouping, computation_preference: computation_preference, description: description, name: name, status: status)
        update_billing_group(input)
      end

      def update_billing_group(input : Types::UpdateBillingGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an existing custom line item in the current or previous billing period.

      def update_custom_line_item(
        arn : String,
        billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil,
        charge_details : Types::UpdateCustomLineItemChargeDetails? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCustomLineItemInput.new(arn: arn, billing_period_range: billing_period_range, charge_details: charge_details, description: description, name: name)
        update_custom_line_item(input)
      end

      def update_custom_line_item(input : Types::UpdateCustomLineItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CUSTOM_LINE_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This updates an existing pricing plan.

      def update_pricing_plan(
        arn : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePricingPlanInput.new(arn: arn, description: description, name: name)
        update_pricing_plan(input)
      end

      def update_pricing_plan(input : Types::UpdatePricingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRICING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing pricing rule.

      def update_pricing_rule(
        arn : String,
        description : String? = nil,
        modifier_percentage : Float64? = nil,
        name : String? = nil,
        tiering : Types::UpdateTieringInput? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePricingRuleInput.new(arn: arn, description: description, modifier_percentage: modifier_percentage, name: name, tiering: tiering, type: type)
        update_pricing_rule(input)
      end

      def update_pricing_rule(input : Types::UpdatePricingRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRICING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
