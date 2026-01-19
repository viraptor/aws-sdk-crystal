module AwsSdk
  module PersonalizeRuntime
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

      # Returns a list of recommended actions in sorted in descending order by prediction score. Use the
      # GetActionRecommendations API if you have a custom campaign that deploys a solution version trained
      # with a PERSONALIZED_ACTIONS recipe. For more information about PERSONALIZED_ACTIONS recipes, see
      # PERSONALIZED_ACTIONS recipes . For more information about getting action recommendations, see
      # Getting action recommendations .
      def get_action_recommendations(
        campaign_arn : String? = nil,
        filter_arn : String? = nil,
        filter_values : Hash(String, String)? = nil,
        num_results : Int32? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::GetActionRecommendationsRequest.new(campaign_arn: campaign_arn, filter_arn: filter_arn, filter_values: filter_values, num_results: num_results, user_id: user_id)
        get_action_recommendations(input)
      end
      def get_action_recommendations(input : Types::GetActionRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACTION_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Re-ranks a list of recommended items for the given user. The first item in the list is deemed the
      # most likely item to be of interest to the user. The solution backing the campaign must have been
      # created using a recipe of type PERSONALIZED_RANKING.
      def get_personalized_ranking(
        campaign_arn : String,
        input_list : Array(String),
        user_id : String,
        context : Hash(String, String)? = nil,
        filter_arn : String? = nil,
        filter_values : Hash(String, String)? = nil,
        metadata_columns : Hash(String, Array(String))? = nil
      ) : Protocol::Request
        input = Types::GetPersonalizedRankingRequest.new(campaign_arn: campaign_arn, input_list: input_list, user_id: user_id, context: context, filter_arn: filter_arn, filter_values: filter_values, metadata_columns: metadata_columns)
        get_personalized_ranking(input)
      end
      def get_personalized_ranking(input : Types::GetPersonalizedRankingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PERSONALIZED_RANKING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of recommended items. For campaigns, the campaign's Amazon Resource Name (ARN) is
      # required and the required user and item input depends on the recipe type used to create the solution
      # backing the campaign as follows: USER_PERSONALIZATION - userId required, itemId not used
      # RELATED_ITEMS - itemId required, userId not used Campaigns that are backed by a solution created
      # using a recipe of type PERSONALIZED_RANKING use the API. For recommenders, the recommender's ARN is
      # required and the required item and user input depends on the use case (domain-based recipe) backing
      # the recommender. For information on use case requirements see Choosing recommender use cases .
      def get_recommendations(
        campaign_arn : String? = nil,
        context : Hash(String, String)? = nil,
        filter_arn : String? = nil,
        filter_values : Hash(String, String)? = nil,
        item_id : String? = nil,
        metadata_columns : Hash(String, Array(String))? = nil,
        num_results : Int32? = nil,
        promotions : Array(Types::Promotion)? = nil,
        recommender_arn : String? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::GetRecommendationsRequest.new(campaign_arn: campaign_arn, context: context, filter_arn: filter_arn, filter_values: filter_values, item_id: item_id, metadata_columns: metadata_columns, num_results: num_results, promotions: promotions, recommender_arn: recommender_arn, user_id: user_id)
        get_recommendations(input)
      end
      def get_recommendations(input : Types::GetRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
