module AwsSdk
  module Savingsplans
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

      # Creates a Savings Plan.
      def create_savings_plan(
        commitment : String,
        savings_plan_offering_id : String,
        client_token : String? = nil,
        purchase_time : Time? = nil,
        tags : Hash(String, String)? = nil,
        upfront_payment_amount : String? = nil
      ) : Protocol::Request
        input = Types::CreateSavingsPlanRequest.new(commitment: commitment, savings_plan_offering_id: savings_plan_offering_id, client_token: client_token, purchase_time: purchase_time, tags: tags, upfront_payment_amount: upfront_payment_amount)
        create_savings_plan(input)
      end
      def create_savings_plan(input : Types::CreateSavingsPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SAVINGS_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the queued purchase for the specified Savings Plan.
      def delete_queued_savings_plan(
        savings_plan_id : String
      ) : Protocol::Request
        input = Types::DeleteQueuedSavingsPlanRequest.new(savings_plan_id: savings_plan_id)
        delete_queued_savings_plan(input)
      end
      def delete_queued_savings_plan(input : Types::DeleteQueuedSavingsPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUED_SAVINGS_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the rates for a specific, existing Savings Plan.
      def describe_savings_plan_rates(
        savings_plan_id : String,
        filters : Array(Types::SavingsPlanRateFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSavingsPlanRatesRequest.new(savings_plan_id: savings_plan_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_savings_plan_rates(input)
      end
      def describe_savings_plan_rates(input : Types::DescribeSavingsPlanRatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SAVINGS_PLAN_RATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified Savings Plans.
      def describe_savings_plans(
        filters : Array(Types::SavingsPlanFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        savings_plan_arns : Array(String)? = nil,
        savings_plan_ids : Array(String)? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeSavingsPlansRequest.new(filters: filters, max_results: max_results, next_token: next_token, savings_plan_arns: savings_plan_arns, savings_plan_ids: savings_plan_ids, states: states)
        describe_savings_plans(input)
      end
      def describe_savings_plans(input : Types::DescribeSavingsPlansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SAVINGS_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the offering rates for Savings Plans you might want to purchase.
      def describe_savings_plans_offering_rates(
        filters : Array(Types::SavingsPlanOfferingRateFilterElement)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        operations : Array(String)? = nil,
        products : Array(String)? = nil,
        savings_plan_offering_ids : Array(String)? = nil,
        savings_plan_payment_options : Array(String)? = nil,
        savings_plan_types : Array(String)? = nil,
        service_codes : Array(String)? = nil,
        usage_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeSavingsPlansOfferingRatesRequest.new(filters: filters, max_results: max_results, next_token: next_token, operations: operations, products: products, savings_plan_offering_ids: savings_plan_offering_ids, savings_plan_payment_options: savings_plan_payment_options, savings_plan_types: savings_plan_types, service_codes: service_codes, usage_types: usage_types)
        describe_savings_plans_offering_rates(input)
      end
      def describe_savings_plans_offering_rates(input : Types::DescribeSavingsPlansOfferingRatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SAVINGS_PLANS_OFFERING_RATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the offerings for the specified Savings Plans.
      def describe_savings_plans_offerings(
        currencies : Array(String)? = nil,
        descriptions : Array(String)? = nil,
        durations : Array(Int64)? = nil,
        filters : Array(Types::SavingsPlanOfferingFilterElement)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        offering_ids : Array(String)? = nil,
        operations : Array(String)? = nil,
        payment_options : Array(String)? = nil,
        plan_types : Array(String)? = nil,
        product_type : String? = nil,
        service_codes : Array(String)? = nil,
        usage_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeSavingsPlansOfferingsRequest.new(currencies: currencies, descriptions: descriptions, durations: durations, filters: filters, max_results: max_results, next_token: next_token, offering_ids: offering_ids, operations: operations, payment_options: payment_options, plan_types: plan_types, product_type: product_type, service_codes: service_codes, usage_types: usage_types)
        describe_savings_plans_offerings(input)
      end
      def describe_savings_plans_offerings(input : Types::DescribeSavingsPlansOfferingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SAVINGS_PLANS_OFFERINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.
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

      # Returns the specified Savings Plan.
      def return_savings_plan(
        savings_plan_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::ReturnSavingsPlanRequest.new(savings_plan_id: savings_plan_id, client_token: client_token)
        return_savings_plan(input)
      end
      def return_savings_plan(input : Types::ReturnSavingsPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETURN_SAVINGS_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the specified resource.
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

      # Removes the specified tags from the specified resource.
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
    end
  end
end
