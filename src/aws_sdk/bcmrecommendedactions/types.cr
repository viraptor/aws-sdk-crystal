require "json"

module AwsSdk
  module BCMRecommendedActions
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes a filter that returns a more specific list of recommended actions.

      struct ActionFilter
        include JSON::Serializable

        # The category to filter on. Valid values are FEATURE for feature type, SEVERITY for severity level,
        # and TYPE for recommendation type.

        @[JSON::Field(key: "key")]
        getter key : String

        # Specifies how to apply the filter. Use EQUALS to include matching results or NOT_EQUALS to exclude
        # matching results.

        @[JSON::Field(key: "matchOption")]
        getter match_option : String

        # One or more values to match against the specified key.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @match_option : String,
          @values : Array(String)
        )
        end
      end

      # An unexpected error occurred during the processing of your request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListRecommendedActionsRequest
        include JSON::Serializable

        # The criteria that you want all returned recommended actions to match.

        @[JSON::Field(key: "filter")]
        getter filter : Types::RequestFilter?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::RequestFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendedActionsResponse
        include JSON::Serializable

        # The list of recommended actions that satisfy the filter criteria.

        @[JSON::Field(key: "recommendedActions")]
        getter recommended_actions : Array(Types::RecommendedAction)

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @recommended_actions : Array(Types::RecommendedAction),
          @next_token : String? = nil
        )
        end
      end

      # Describes a specific recommended action.

      struct RecommendedAction
        include JSON::Serializable

        # The account that the recommended action is for.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Context that applies to the recommended action.

        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        # The feature associated with the recommended action.

        @[JSON::Field(key: "feature")]
        getter feature : String?

        # The ID for the recommended action.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the recommended action status was last updated.

        @[JSON::Field(key: "lastUpdatedTimeStamp")]
        getter last_updated_time_stamp : String?

        # The possible next steps to execute the recommended action.

        @[JSON::Field(key: "nextSteps")]
        getter next_steps : Array(String)?

        # The severity associated with the recommended action.

        @[JSON::Field(key: "severity")]
        getter severity : String?

        # The type of action you can take by adopting the recommended action.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @context : Hash(String, String)? = nil,
          @feature : String? = nil,
          @id : String? = nil,
          @last_updated_time_stamp : String? = nil,
          @next_steps : Array(String)? = nil,
          @severity : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Enables filtering of results based on specified action criteria. You can define multiple action
      # filters to refine results using combinations of feature type, severity level, and recommendation
      # type.

      struct RequestFilter
        include JSON::Serializable

        # A list of action filters that define criteria for filtering results. Each filter specifies a key,
        # match option, and corresponding values to filter on.

        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ActionFilter)?

        def initialize(
          @actions : Array(Types::ActionFilter)? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Provides a single, overarching explanation for the validation failure.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # Lists each problematic field and why it failed validation.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Provides specific details about why a particular field failed validation.

      struct ValidationExceptionField
        include JSON::Serializable

        # Provides a message explaining why the field failed validation.

        @[JSON::Field(key: "message")]
        getter message : String

        # Provides the name of the field that failed validation.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
