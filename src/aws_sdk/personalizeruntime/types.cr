require "json"

module AwsSdk
  module PersonalizeRuntime
    module Types


      struct GetActionRecommendationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign to use for getting action recommendations. This
        # campaign must deploy a solution version trained with a PERSONALIZED_ACTIONS recipe.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String?

        # The ARN of the filter to apply to the returned recommendations. For more information, see Filtering
        # Recommendations . When using this parameter, be sure the filter resource is ACTIVE .

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The values to use when filtering recommendations. For each placeholder parameter in your filter
        # expression, provide the parameter name (in matching case) as a key and the filter value(s) as the
        # corresponding value. Separate multiple values for one parameter with a comma. For filter expressions
        # that use an INCLUDE element to include actions, you must provide values for all parameters that are
        # defined in the expression. For filters with expressions that use an EXCLUDE element to exclude
        # actions, you can omit the filter-values . In this case, Amazon Personalize doesn't use that portion
        # of the expression to filter recommendations. For more information, see Filtering recommendations and
        # user segments .

        @[JSON::Field(key: "filterValues")]
        getter filter_values : Hash(String, String)?

        # The number of results to return. The default is 5. The maximum is 100.

        @[JSON::Field(key: "numResults")]
        getter num_results : Int32?

        # The user ID of the user to provide action recommendations for.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @campaign_arn : String? = nil,
          @filter_arn : String? = nil,
          @filter_values : Hash(String, String)? = nil,
          @num_results : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct GetActionRecommendationsResponse
        include JSON::Serializable

        # A list of action recommendations sorted in descending order by prediction score. There can be a
        # maximum of 100 actions in the list. For information about action scores, see How action
        # recommendation scoring works .

        @[JSON::Field(key: "actionList")]
        getter action_list : Array(Types::PredictedAction)?

        # The ID of the recommendation.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        def initialize(
          @action_list : Array(Types::PredictedAction)? = nil,
          @recommendation_id : String? = nil
        )
        end
      end


      struct GetPersonalizedRankingRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign to use for generating the personalized ranking.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String

        # A list of items (by itemId ) to rank. If an item was not included in the training dataset, the item
        # is appended to the end of the reranked list. If you are including metadata in recommendations, the
        # maximum is 50. Otherwise, the maximum is 500.

        @[JSON::Field(key: "inputList")]
        getter input_list : Array(String)

        # The user for which you want the campaign to provide a personalized ranking.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The contextual metadata to use when getting recommendations. Contextual metadata includes any
        # interaction information that might be relevant when getting a user's recommendations, such as the
        # user's current location or device type.

        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        # The Amazon Resource Name (ARN) of a filter you created to include items or exclude items from
        # recommendations for a given user. For more information, see Filtering Recommendations .

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The values to use when filtering recommendations. For each placeholder parameter in your filter
        # expression, provide the parameter name (in matching case) as a key and the filter value(s) as the
        # corresponding value. Separate multiple values for one parameter with a comma. For filter expressions
        # that use an INCLUDE element to include items, you must provide values for all parameters that are
        # defined in the expression. For filters with expressions that use an EXCLUDE element to exclude
        # items, you can omit the filter-values .In this case, Amazon Personalize doesn't use that portion of
        # the expression to filter recommendations. For more information, see Filtering Recommendations .

        @[JSON::Field(key: "filterValues")]
        getter filter_values : Hash(String, String)?

        # If you enabled metadata in recommendations when you created or updated the campaign, specify
        # metadata columns from your Items dataset to include in the personalized ranking. The map key is
        # ITEMS and the value is a list of column names from your Items dataset. The maximum number of columns
        # you can provide is 10. For information about enabling metadata for a campaign, see Enabling metadata
        # in recommendations for a campaign .

        @[JSON::Field(key: "metadataColumns")]
        getter metadata_columns : Hash(String, Array(String))?

        def initialize(
          @campaign_arn : String,
          @input_list : Array(String),
          @user_id : String,
          @context : Hash(String, String)? = nil,
          @filter_arn : String? = nil,
          @filter_values : Hash(String, String)? = nil,
          @metadata_columns : Hash(String, Array(String))? = nil
        )
        end
      end


      struct GetPersonalizedRankingResponse
        include JSON::Serializable

        # A list of items in order of most likely interest to the user. The maximum is 500.

        @[JSON::Field(key: "personalizedRanking")]
        getter personalized_ranking : Array(Types::PredictedItem)?

        # The ID of the recommendation.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        def initialize(
          @personalized_ranking : Array(Types::PredictedItem)? = nil,
          @recommendation_id : String? = nil
        )
        end
      end


      struct GetRecommendationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign to use for getting recommendations.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String?

        # The contextual metadata to use when getting recommendations. Contextual metadata includes any
        # interaction information that might be relevant when getting a user's recommendations, such as the
        # user's current location or device type.

        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        # The ARN of the filter to apply to the returned recommendations. For more information, see Filtering
        # Recommendations . When using this parameter, be sure the filter resource is ACTIVE .

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The values to use when filtering recommendations. For each placeholder parameter in your filter
        # expression, provide the parameter name (in matching case) as a key and the filter value(s) as the
        # corresponding value. Separate multiple values for one parameter with a comma. For filter expressions
        # that use an INCLUDE element to include items, you must provide values for all parameters that are
        # defined in the expression. For filters with expressions that use an EXCLUDE element to exclude
        # items, you can omit the filter-values .In this case, Amazon Personalize doesn't use that portion of
        # the expression to filter recommendations. For more information, see Filtering recommendations and
        # user segments .

        @[JSON::Field(key: "filterValues")]
        getter filter_values : Hash(String, String)?

        # The item ID to provide recommendations for. Required for RELATED_ITEMS recipe type.

        @[JSON::Field(key: "itemId")]
        getter item_id : String?

        # If you enabled metadata in recommendations when you created or updated the campaign or recommender,
        # specify the metadata columns from your Items dataset to include in item recommendations. The map key
        # is ITEMS and the value is a list of column names from your Items dataset. The maximum number of
        # columns you can provide is 10. For information about enabling metadata for a campaign, see Enabling
        # metadata in recommendations for a campaign . For information about enabling metadata for a
        # recommender, see Enabling metadata in recommendations for a recommender .

        @[JSON::Field(key: "metadataColumns")]
        getter metadata_columns : Hash(String, Array(String))?

        # The number of results to return. The default is 25. If you are including metadata in
        # recommendations, the maximum is 50. Otherwise, the maximum is 500.

        @[JSON::Field(key: "numResults")]
        getter num_results : Int32?

        # The promotions to apply to the recommendation request. A promotion defines additional business rules
        # that apply to a configurable subset of recommended items.

        @[JSON::Field(key: "promotions")]
        getter promotions : Array(Types::Promotion)?

        # The Amazon Resource Name (ARN) of the recommender to use to get recommendations. Provide a
        # recommender ARN if you created a Domain dataset group with a recommender for a domain use case.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String?

        # The user ID to provide recommendations for. Required for USER_PERSONALIZATION recipe type.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @campaign_arn : String? = nil,
          @context : Hash(String, String)? = nil,
          @filter_arn : String? = nil,
          @filter_values : Hash(String, String)? = nil,
          @item_id : String? = nil,
          @metadata_columns : Hash(String, Array(String))? = nil,
          @num_results : Int32? = nil,
          @promotions : Array(Types::Promotion)? = nil,
          @recommender_arn : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct GetRecommendationsResponse
        include JSON::Serializable

        # A list of recommendations sorted in descending order by prediction score. There can be a maximum of
        # 500 items in the list.

        @[JSON::Field(key: "itemList")]
        getter item_list : Array(Types::PredictedItem)?

        # The ID of the recommendation.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        def initialize(
          @item_list : Array(Types::PredictedItem)? = nil,
          @recommendation_id : String? = nil
        )
        end
      end

      # Provide a valid value for the field or parameter.

      struct InvalidInputException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that identifies an action. The API returns a list of PredictedAction s.

      struct PredictedAction
        include JSON::Serializable

        # The ID of the recommended action.

        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        # The score of the recommended action. For information about action scores, see How action
        # recommendation scoring works .

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @action_id : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # An object that identifies an item. The and APIs return a list of PredictedItem s.

      struct PredictedItem
        include JSON::Serializable

        # The recommended item ID.

        @[JSON::Field(key: "itemId")]
        getter item_id : String?

        # Metadata about the item from your Items dataset.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The name of the promotion that included the predicted item.

        @[JSON::Field(key: "promotionName")]
        getter promotion_name : String?

        # If you use User-Personalization-v2, a list of reasons for why the item was included in
        # recommendations. Possible reasons include the following: Promoted item - Indicates the item was
        # included as part of a promotion that you applied in your recommendation request. Exploration -
        # Indicates the item was included with exploration. With exploration, recommendations include items
        # with less interactions data or relevance for the user. For more information about exploration, see
        # Exploration . Popular item - Indicates the item was included as a placeholder popular item. If you
        # use a filter, depending on how many recommendations the filter removes, Amazon Personalize might add
        # placeholder items to meet the numResults for your recommendation request. These items are popular
        # items, based on interactions data, that satisfy your filter criteria. They don't have a relevance
        # score for the user.

        @[JSON::Field(key: "reason")]
        getter reason : Array(String)?

        # A numeric representation of the model's certainty that the item will be the next user selection. For
        # more information on scoring logic, see how-scores-work .

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @item_id : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @promotion_name : String? = nil,
          @reason : Array(String)? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Contains information on a promotion. A promotion defines additional business rules that apply to a
      # configurable subset of recommended items.

      struct Promotion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the filter used by the promotion. This filter defines the criteria
        # for promoted items. For more information, see Promotion filters .

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The values to use when promoting items. For each placeholder parameter in your promotion's filter
        # expression, provide the parameter name (in matching case) as a key and the filter value(s) as the
        # corresponding value. Separate multiple values for one parameter with a comma. For filter expressions
        # that use an INCLUDE element to include items, you must provide values for all parameters that are
        # defined in the expression. For filters with expressions that use an EXCLUDE element to exclude
        # items, you can omit the filter-values . In this case, Amazon Personalize doesn't use that portion of
        # the expression to filter recommendations. For more information on creating filters, see Filtering
        # recommendations and user segments .

        @[JSON::Field(key: "filterValues")]
        getter filter_values : Hash(String, String)?

        # The name of the promotion.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The percentage of recommended items to apply the promotion to.

        @[JSON::Field(key: "percentPromotedItems")]
        getter percent_promoted_items : Int32?

        def initialize(
          @filter_arn : String? = nil,
          @filter_values : Hash(String, String)? = nil,
          @name : String? = nil,
          @percent_promoted_items : Int32? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
