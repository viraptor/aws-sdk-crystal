module Aws
  module TrustedAdvisor
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Update one or more exclusion status for a list of recommendation resources

      def batch_update_recommendation_resource_exclusion(
        recommendation_resource_exclusions : Array(Types::RecommendationResourceExclusion)
      ) : Protocol::Request
        input = Types::BatchUpdateRecommendationResourceExclusionRequest.new(recommendation_resource_exclusions: recommendation_resource_exclusions)
        batch_update_recommendation_resource_exclusion(input)
      end

      def batch_update_recommendation_resource_exclusion(input : Types::BatchUpdateRecommendationResourceExclusionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_RECOMMENDATION_RESOURCE_EXCLUSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a specific recommendation within an AWS Organizations organization. This API supports only
      # prioritized recommendations.

      def get_organization_recommendation(
        organization_recommendation_identifier : String
      ) : Protocol::Request
        input = Types::GetOrganizationRecommendationRequest.new(organization_recommendation_identifier: organization_recommendation_identifier)
        get_organization_recommendation(input)
      end

      def get_organization_recommendation(input : Types::GetOrganizationRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ORGANIZATION_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a specific Recommendation

      def get_recommendation(
        recommendation_identifier : String
      ) : Protocol::Request
        input = Types::GetRecommendationRequest.new(recommendation_identifier: recommendation_identifier)
        get_recommendation(input)
      end

      def get_recommendation(input : Types::GetRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List a filterable set of Checks

      def list_checks(
        aws_service : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pillar : String? = nil,
        source : String? = nil
      ) : Protocol::Request
        input = Types::ListChecksRequest.new(aws_service: aws_service, language: language, max_results: max_results, next_token: next_token, pillar: pillar, source: source)
        list_checks(input)
      end

      def list_checks(input : Types::ListChecksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHECKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the accounts that own the resources for an organization aggregate recommendation. This API
      # only supports prioritized recommendations.

      def list_organization_recommendation_accounts(
        organization_recommendation_identifier : String,
        affected_account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationRecommendationAccountsRequest.new(organization_recommendation_identifier: organization_recommendation_identifier, affected_account_id: affected_account_id, max_results: max_results, next_token: next_token)
        list_organization_recommendation_accounts(input)
      end

      def list_organization_recommendation_accounts(input : Types::ListOrganizationRecommendationAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_RECOMMENDATION_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List Resources of a Recommendation within an Organization. This API only supports prioritized
      # recommendations.

      def list_organization_recommendation_resources(
        organization_recommendation_identifier : String,
        affected_account_id : String? = nil,
        exclusion_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        region_code : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationRecommendationResourcesRequest.new(organization_recommendation_identifier: organization_recommendation_identifier, affected_account_id: affected_account_id, exclusion_status: exclusion_status, max_results: max_results, next_token: next_token, region_code: region_code, status: status)
        list_organization_recommendation_resources(input)
      end

      def list_organization_recommendation_resources(input : Types::ListOrganizationRecommendationResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_RECOMMENDATION_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List a filterable set of Recommendations within an Organization. This API only supports prioritized
      # recommendations.

      def list_organization_recommendations(
        after_last_updated_at : Time? = nil,
        aws_service : String? = nil,
        before_last_updated_at : Time? = nil,
        check_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pillar : String? = nil,
        source : String? = nil,
        status : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationRecommendationsRequest.new(after_last_updated_at: after_last_updated_at, aws_service: aws_service, before_last_updated_at: before_last_updated_at, check_identifier: check_identifier, max_results: max_results, next_token: next_token, pillar: pillar, source: source, status: status, type: type)
        list_organization_recommendations(input)
      end

      def list_organization_recommendations(input : Types::ListOrganizationRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List Resources of a Recommendation

      def list_recommendation_resources(
        recommendation_identifier : String,
        exclusion_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        region_code : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListRecommendationResourcesRequest.new(recommendation_identifier: recommendation_identifier, exclusion_status: exclusion_status, max_results: max_results, next_token: next_token, region_code: region_code, status: status)
        list_recommendation_resources(input)
      end

      def list_recommendation_resources(input : Types::ListRecommendationResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDATION_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List a filterable set of Recommendations

      def list_recommendations(
        after_last_updated_at : Time? = nil,
        aws_service : String? = nil,
        before_last_updated_at : Time? = nil,
        check_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pillar : String? = nil,
        source : String? = nil,
        status : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListRecommendationsRequest.new(after_last_updated_at: after_last_updated_at, aws_service: aws_service, before_last_updated_at: before_last_updated_at, check_identifier: check_identifier, max_results: max_results, next_token: next_token, pillar: pillar, source: source, status: status, type: type)
        list_recommendations(input)
      end

      def list_recommendations(input : Types::ListRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the lifecycle of a Recommendation within an Organization. This API only supports prioritized
      # recommendations.

      def update_organization_recommendation_lifecycle(
        lifecycle_stage : String,
        organization_recommendation_identifier : String,
        update_reason : String? = nil,
        update_reason_code : String? = nil
      ) : Protocol::Request
        input = Types::UpdateOrganizationRecommendationLifecycleRequest.new(lifecycle_stage: lifecycle_stage, organization_recommendation_identifier: organization_recommendation_identifier, update_reason: update_reason, update_reason_code: update_reason_code)
        update_organization_recommendation_lifecycle(input)
      end

      def update_organization_recommendation_lifecycle(input : Types::UpdateOrganizationRecommendationLifecycleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORGANIZATION_RECOMMENDATION_LIFECYCLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the lifecyle of a Recommendation. This API only supports prioritized recommendations.

      def update_recommendation_lifecycle(
        lifecycle_stage : String,
        recommendation_identifier : String,
        update_reason : String? = nil,
        update_reason_code : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRecommendationLifecycleRequest.new(lifecycle_stage: lifecycle_stage, recommendation_identifier: recommendation_identifier, update_reason: update_reason, update_reason_code: update_reason_code)
        update_recommendation_lifecycle(input)
      end

      def update_recommendation_lifecycle(input : Types::UpdateRecommendationLifecycleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECOMMENDATION_LIFECYCLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
