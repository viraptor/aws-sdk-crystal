require "json"
require "time"

module AwsSdk
  module FreeTier
    module Types

      # You don't have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The summary of the rewards granted as a result of activities completed.

      struct ActivityReward
        include JSON::Serializable

        # The credits gained by activity rewards.

        @[JSON::Field(key: "credit")]
        getter credit : Types::MonetaryAmount?

        def initialize(
          @credit : Types::MonetaryAmount? = nil
        )
        end
      end

      # The summary of activities.

      struct ActivitySummary
        include JSON::Serializable

        # A unique identifier that identifies the activity.

        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The reward for the activity.

        @[JSON::Field(key: "reward")]
        getter reward : Types::ActivityReward

        # The current status of the activity.

        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the activity.

        @[JSON::Field(key: "title")]
        getter title : String

        def initialize(
          @activity_id : String,
          @reward : Types::ActivityReward,
          @status : String,
          @title : String
        )
        end
      end

      # Contains the specifications for the filters to use for your request.

      struct DimensionValues
        include JSON::Serializable

        # The name of the dimension that you want to filter on.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The match options that you can use to filter your results. You can specify only one of these values
        # in the array.

        @[JSON::Field(key: "MatchOptions")]
        getter match_options : Array(String)

        # The metadata values you can specify to filter upon, so that the results all match at least one of
        # the specified values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @match_options : Array(String),
          @values : Array(String)
        )
        end
      end

      # Use Expression to filter in the GetFreeTierUsage API operation. You can use the following patterns:
      # Simple dimension values ( Dimensions root operator) Complex expressions with logical operators ( AND
      # , NOT , and OR root operators). For simple dimension values , you can set the dimension name,
      # values, and match type for the filters that you plan to use. Example for simple dimension values You
      # can filter to match exactly for REGION==us-east-1 OR REGION==us-west-1 . The corresponding
      # Expression appears like the following: { "Dimensions": { "Key": "REGION", "Values": [ "us-east-1",
      # "us-west-1" ], "MatchOptions": ["EQUALS"] } } As shown in the previous example, lists of dimension
      # values are combined with OR when you apply the filter. For complex expressions with logical
      # operators , you can have nested expressions to use the logical operators and specify advanced
      # filtering. Example for complex expressions with logical operators You can filter by ((REGION ==
      # us-east-1 OR REGION == us-west-1) OR (SERVICE CONTAINS AWSLambda)) AND (USAGE_TYPE !CONTAINS
      # DataTransfer) . The corresponding Expression appears like the following: { "And": [ {"Or": [
      # {"Dimensions": { "Key": "REGION", "Values": [ "us-east-1", "us-west-1" ], "MatchOptions": ["EQUALS"]
      # }}, {"Dimensions": { "Key": "SERVICE", "Values": ["AWSLambda"], "MatchOptions": ["CONTAINS"] } } ]},
      # {"Not": {"Dimensions": { "Key": "USAGE_TYPE", "Values": ["DataTransfer"], "MatchOptions":
      # ["CONTAINS"] }}} ] } In the following Contents , you must specify exactly one of the following root
      # operators.

      struct Expression
        include JSON::Serializable

        # Return results that match all Expressions that you specified in the array.

        @[JSON::Field(key: "And")]
        getter and : Array(Types::Expression)?

        # The specific dimension, values, and match type to filter objects with.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::DimensionValues?

        # Return results that don’t match the Expression that you specified.

        @[JSON::Field(key: "Not")]
        getter not : Types::Expression?

        # Return results that match any of the Expressions that you specified. in the array.

        @[JSON::Field(key: "Or")]
        getter or : Array(Types::Expression)?

        def initialize(
          @and : Array(Types::Expression)? = nil,
          @dimensions : Types::DimensionValues? = nil,
          @not : Types::Expression? = nil,
          @or : Array(Types::Expression)? = nil
        )
        end
      end

      # Consists of a Amazon Web Services Free Tier offer’s metadata and your data usage for the offer.

      struct FreeTierUsage
        include JSON::Serializable

        # Describes the actual usage accrued month-to-day (MTD) that you've used so far.

        @[JSON::Field(key: "actualUsageAmount")]
        getter actual_usage_amount : Float64?

        # The description of the Free Tier offer.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Describes the forecasted usage by the month that you're expected to use.

        @[JSON::Field(key: "forecastedUsageAmount")]
        getter forecasted_usage_amount : Float64?

        # Describes the type of the Free Tier offer. For example, the offer can be "12 Months Free" , "Always
        # Free" , and "Free Trial" .

        @[JSON::Field(key: "freeTierType")]
        getter free_tier_type : String?

        # Describes the maximum usage allowed in Free Tier.

        @[JSON::Field(key: "limit")]
        getter limit : Float64?

        # Describes usageType more granularly with the specific Amazon Web Services service API operation. For
        # example, this can be the RunInstances API operation for Amazon Elastic Compute Cloud.

        @[JSON::Field(key: "operation")]
        getter operation : String?

        # Describes the Amazon Web Services Region for which this offer is applicable

        @[JSON::Field(key: "region")]
        getter region : String?

        # The name of the Amazon Web Services service providing the Free Tier offer. For example, this can be
        # Amazon Elastic Compute Cloud.

        @[JSON::Field(key: "service")]
        getter service : String?

        # Describes the unit of the usageType , such as Hrs .

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # Describes the usage details of the offer. For example, this might be Global-BoxUsage:freetrial .

        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @actual_usage_amount : Float64? = nil,
          @description : String? = nil,
          @forecasted_usage_amount : Float64? = nil,
          @free_tier_type : String? = nil,
          @limit : Float64? = nil,
          @operation : String? = nil,
          @region : String? = nil,
          @service : String? = nil,
          @unit : String? = nil,
          @usage_type : String? = nil
        )
        end
      end


      struct GetAccountActivityRequest
        include JSON::Serializable

        # A unique identifier that identifies the activity.

        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The language code used to return translated title and description fields.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        def initialize(
          @activity_id : String,
          @language_code : String? = nil
        )
        end
      end


      struct GetAccountActivityResponse
        include JSON::Serializable

        # A unique identifier that identifies the activity.

        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # Provides detailed information about the activity and its expected outcomes.

        @[JSON::Field(key: "description")]
        getter description : String

        # The URL resource that provides guidance on activity requirements and completion.

        @[JSON::Field(key: "instructionsUrl")]
        getter instructions_url : String

        # A reward granted upon activity completion.

        @[JSON::Field(key: "reward")]
        getter reward : Types::ActivityReward

        # The current activity status.

        @[JSON::Field(key: "status")]
        getter status : String

        # A short activity title.

        @[JSON::Field(key: "title")]
        getter title : String

        # The timestamp when the activity is completed. This field appears only for activities in the
        # COMPLETED state.

        @[JSON::Field(key: "completedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_at : Time?

        # The estimated time to complete the activity. This is the duration in minutes.

        @[JSON::Field(key: "estimatedTimeToCompleteInMinutes")]
        getter estimated_time_to_complete_in_minutes : Int32?

        # The time by which the activity must be completed to receive a reward.

        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The timestamp when the activity started. This field appears only for activities in the IN_PROGRESS
        # or COMPLETED states.

        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        def initialize(
          @activity_id : String,
          @description : String,
          @instructions_url : String,
          @reward : Types::ActivityReward,
          @status : String,
          @title : String,
          @completed_at : Time? = nil,
          @estimated_time_to_complete_in_minutes : Int32? = nil,
          @expires_at : Time? = nil,
          @started_at : Time? = nil
        )
        end
      end


      struct GetAccountPlanStateRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountPlanStateResponse
        include JSON::Serializable

        # A unique identifier that identifies the account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The current status for the account plan.

        @[JSON::Field(key: "accountPlanStatus")]
        getter account_plan_status : String

        # The plan type for the account.

        @[JSON::Field(key: "accountPlanType")]
        getter account_plan_type : String

        # The timestamp for when the current account plan expires.

        @[JSON::Field(key: "accountPlanExpirationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter account_plan_expiration_date : Time?

        # The amount of credits remaining for the account.

        @[JSON::Field(key: "accountPlanRemainingCredits")]
        getter account_plan_remaining_credits : Types::MonetaryAmount?

        def initialize(
          @account_id : String,
          @account_plan_status : String,
          @account_plan_type : String,
          @account_plan_expiration_date : Time? = nil,
          @account_plan_remaining_credits : Types::MonetaryAmount? = nil
        )
        end
      end


      struct GetFreeTierUsageRequest
        include JSON::Serializable

        # An expression that specifies the conditions that you want each FreeTierUsage object to meet.

        @[JSON::Field(key: "filter")]
        getter filter : Types::Expression?

        # The maximum number of results to return in the response. MaxResults means that there can be up to
        # the specified number of values, but there might be fewer results based on your filters.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::Expression? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetFreeTierUsageResponse
        include JSON::Serializable

        # The list of Free Tier usage objects that meet your filter expression.

        @[JSON::Field(key: "freeTierUsages")]
        getter free_tier_usages : Array(Types::FreeTierUsage)

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @free_tier_usages : Array(Types::FreeTierUsage),
          @next_token : String? = nil
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


      struct ListAccountActivitiesRequest
        include JSON::Serializable

        # The activity status filter. This field can be used to filter the response by activities status.

        @[JSON::Field(key: "filterActivityStatuses")]
        getter filter_activity_statuses : Array(String)?

        # The language code used to return translated titles.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # The maximum number of items to return for this request. To get the next page of items, make another
        # request with the token returned in the output.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token from a previous paginated response. If this is specified, the response includes records
        # beginning from this token (inclusive), up to the number specified by maxResults .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_activity_statuses : Array(String)? = nil,
          @language_code : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountActivitiesResponse
        include JSON::Serializable

        # A brief information about the activities.

        @[JSON::Field(key: "activities")]
        getter activities : Array(Types::ActivitySummary)

        # The token to include in another request to get the next page of items. This value is null when there
        # are no more items to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @activities : Array(Types::ActivitySummary),
          @next_token : String? = nil
        )
        end
      end

      # The monetary amount of the credit.

      struct MonetaryAmount
        include JSON::Serializable

        # The aggregated monetary amount of credits earned.

        @[JSON::Field(key: "amount")]
        getter amount : Float64

        # The unit that the monetary amount is given in.

        @[JSON::Field(key: "unit")]
        getter unit : String

        def initialize(
          @amount : Float64,
          @unit : String
        )
        end
      end

      # This exception is thrown when the requested resource cannot be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
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


      struct UpgradeAccountPlanRequest
        include JSON::Serializable

        # The target account plan type. This makes it explicit about the change and latest value of the
        # accountPlanType .

        @[JSON::Field(key: "accountPlanType")]
        getter account_plan_type : String

        def initialize(
          @account_plan_type : String
        )
        end
      end


      struct UpgradeAccountPlanResponse
        include JSON::Serializable

        # A unique identifier that identifies the account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # This indicates the latest state of the account plan within its lifecycle.

        @[JSON::Field(key: "accountPlanStatus")]
        getter account_plan_status : String

        # The type of plan for the account.

        @[JSON::Field(key: "accountPlanType")]
        getter account_plan_type : String

        def initialize(
          @account_id : String,
          @account_plan_status : String,
          @account_plan_type : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
