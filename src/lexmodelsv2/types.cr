require "json"
require "time"

module Aws
  module LexModelsV2
    module Types

      # The active context used in the test execution.

      struct ActiveContext
        include JSON::Serializable

        # The name of active context.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Provides settings that enable advanced recognition settings for slot values.

      struct AdvancedRecognitionSetting
        include JSON::Serializable

        # Enables using the slot values as a custom vocabulary for recognizing user utterances.

        @[JSON::Field(key: "audioRecognitionStrategy")]
        getter audio_recognition_strategy : String?

        def initialize(
          @audio_recognition_strategy : String? = nil
        )
        end
      end

      # The information about the agent turn in a test set execution.

      struct AgentTurnResult
        include JSON::Serializable

        # The expected agent prompt for the agent turn in a test set execution.

        @[JSON::Field(key: "expectedAgentPrompt")]
        getter expected_agent_prompt : String

        # The actual agent prompt for the agent turn in a test set execution.

        @[JSON::Field(key: "actualAgentPrompt")]
        getter actual_agent_prompt : String?

        # The actual elicited slot for the agent turn in a test set execution.

        @[JSON::Field(key: "actualElicitedSlot")]
        getter actual_elicited_slot : String?

        # The actual intent for the agent turn in a test set execution.

        @[JSON::Field(key: "actualIntent")]
        getter actual_intent : String?


        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ExecutionErrorDetails?

        def initialize(
          @expected_agent_prompt : String,
          @actual_agent_prompt : String? = nil,
          @actual_elicited_slot : String? = nil,
          @actual_intent : String? = nil,
          @error_details : Types::ExecutionErrorDetails? = nil
        )
        end
      end

      # The specification of an agent turn.

      struct AgentTurnSpecification
        include JSON::Serializable

        # The agent prompt for the agent turn in a test set.

        @[JSON::Field(key: "agentPrompt")]
        getter agent_prompt : String

        def initialize(
          @agent_prompt : String
        )
        end
      end

      # Filters responses returned by the ListAggregatedUtterances operation.

      struct AggregatedUtterancesFilter
        include JSON::Serializable

        # The name of the field to filter the utterance list.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListAggregatedUtterances operation should
        # return only utterances that equal the specified value. Specify CO when the ListAggregatedUtterances
        # operation should return utterances that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The value to use for filtering the list of bots.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Specifies attributes for sorting a list of utterances.

      struct AggregatedUtterancesSortBy
        include JSON::Serializable

        # The utterance attribute to sort by.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # Specifies whether to sort the aggregated utterances in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Provides summary information for aggregated utterances. The ListAggregatedUtterances operations
      # combines all instances of the same utterance into a single aggregated summary.

      struct AggregatedUtterancesSummary
        include JSON::Serializable

        # Aggregated utterance data may contain utterances from versions of your bot that have since been
        # deleted. When the aggregated contains this kind of data, this field is set to true.

        @[JSON::Field(key: "containsDataFromDeletedResources")]
        getter contains_data_from_deleted_resources : Bool?

        # The number of times that the utterance was detected by Amazon Lex during the time period. When an
        # utterance is detected, it activates an intent or a slot.

        @[JSON::Field(key: "hitCount")]
        getter hit_count : Int32?

        # The number of times that the utterance was missed by Amazon Lex An utterance is missed when it
        # doesn't activate an intent or slot.

        @[JSON::Field(key: "missedCount")]
        getter missed_count : Int32?

        # The text of the utterance. If the utterance was used with the RecognizeUtterance operation, the text
        # is the transcription of the audio utterance.

        @[JSON::Field(key: "utterance")]
        getter utterance : String?

        # The date and time that the utterance was first recorded in the time window for aggregation. An
        # utterance may have been sent to Amazon Lex before that time, but only utterances within the time
        # window are counted.

        @[JSON::Field(key: "utteranceFirstRecordedInAggregationDuration")]
        getter utterance_first_recorded_in_aggregation_duration : Time?

        # The last date and time that an utterance was recorded in the time window for aggregation. An
        # utterance may be sent to Amazon Lex after that time, but only utterances within the time window are
        # counted.

        @[JSON::Field(key: "utteranceLastRecordedInAggregationDuration")]
        getter utterance_last_recorded_in_aggregation_duration : Time?

        def initialize(
          @contains_data_from_deleted_resources : Bool? = nil,
          @hit_count : Int32? = nil,
          @missed_count : Int32? = nil,
          @utterance : String? = nil,
          @utterance_first_recorded_in_aggregation_duration : Time? = nil,
          @utterance_last_recorded_in_aggregation_duration : Time? = nil
        )
        end
      end

      # Specifies the allowed input types.

      struct AllowedInputTypes
        include JSON::Serializable

        # Indicates whether audio input is allowed.

        @[JSON::Field(key: "allowAudioInput")]
        getter allow_audio_input : Bool

        # Indicates whether DTMF input is allowed.

        @[JSON::Field(key: "allowDTMFInput")]
        getter allow_dtmf_input : Bool

        def initialize(
          @allow_audio_input : Bool,
          @allow_dtmf_input : Bool
        )
        end
      end

      # Contains the time metric, interval, and method by which to bin the analytics data.

      struct AnalyticsBinBySpecification
        include JSON::Serializable

        # Specifies the interval of time by which to bin the analytics data.

        @[JSON::Field(key: "interval")]
        getter interval : String

        # Specifies the time metric by which to bin the analytics data.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether to bin the analytics data in ascending or descending order. If this field is left
        # blank, the default order is by the key of the bin in descending order.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @interval : String,
          @name : String,
          @order : String? = nil
        )
        end
      end

      # An object containing the criterion by which to bin the results and the value that defines that bin.

      struct AnalyticsBinKey
        include JSON::Serializable

        # The criterion by which to bin the results.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the criterion that defines the bin.

        @[JSON::Field(key: "value")]
        getter value : Int64?

        def initialize(
          @name : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # Contains fields describing a condition by which to filter the intents. The expression may be
      # understood as name operator values . For example: IntentName CO Book – The intent name contains the
      # string "Book." BotVersion EQ 2 – The bot version is equal to two. The operators that each filter
      # supports are listed below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel
      # – EQ . SessionId – EQ . OriginatingRequestId – EQ . IntentName – EQ , CO . IntentEndState – EQ , CO
      # .

      struct AnalyticsIntentFilter
        include JSON::Serializable

        # The category by which to filter the intents. The descriptions for each option are as follows:
        # BotAlias – The name of the bot alias. BotVersion – The version of the bot. LocaleId – The locale of
        # the bot. Modality – The modality of the session with the bot (audio, DTMF, or text). Channel – The
        # channel that the bot is integrated with. SessionId – The identifier of the session with the bot.
        # OriginatingRequestId – The identifier of the first request in a session. IntentName – The name of
        # the intent. IntentEndState – The final state of the intent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operation by which to filter the category. The following operations are possible: CO – Contains
        # EQ – Equals GT – Greater than LT – Less than The operators that each filter supports are listed
        # below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel – EQ . SessionId –
        # EQ . OriginatingRequestId – EQ . IntentName – EQ , CO . IntentEndState – EQ , CO .

        @[JSON::Field(key: "operator")]
        getter operator : String

        # An array containing the values of the category by which to apply the operator to filter the results.
        # You can provide multiple values if the operator is EQ or CO . If you provide multiple values, you
        # filter for results that equal/contain any of the values. For example, if the name , operator , and
        # values fields are Modality , EQ , and [Speech, Text] , the operation filters for results where the
        # modality was either Speech or Text .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Contains the category by which the intent analytics were grouped and a member of that category.

      struct AnalyticsIntentGroupByKey
        include JSON::Serializable

        # A category by which the intent analytics were grouped.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A member of the category by which the intent analytics were grouped.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains the category by which to group the intents.

      struct AnalyticsIntentGroupBySpecification
        include JSON::Serializable

        # Specifies whether to group the intent stages by their name or their end state.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Contains the metric and the summary statistic you want to calculate, and the order in which to sort
      # the results, for the intents in the bot.

      struct AnalyticsIntentMetric
        include JSON::Serializable

        # The metric for which you want to get intent summary statistics. Count – The number of times the
        # intent was invoked. Success – The number of times the intent succeeded. Failure – The number of
        # times the intent failed. Switched – The number of times there was a switch to a different intent.
        # Dropped – The number of times the user dropped the intent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The summary statistic to calculate. Sum – The total count for the category you provide in name .
        # Average – The total count divided by the number of intents in the category you provide in name . Max
        # – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String

        # Specifies whether to sort the results in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String,
          @statistic : String,
          @order : String? = nil
        )
        end
      end

      # An object containing the results for the intent metric you requested.

      struct AnalyticsIntentMetricResult
        include JSON::Serializable

        # The metric that you requested. See Key definitions for more details about these metrics. Count – The
        # number of times the intent was invoked. Success – The number of times the intent succeeded. Failure
        # – The number of times the intent failed. Switched – The number of times there was a switch to a
        # different intent. Dropped – The number of times the user dropped the intent.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic that you requested to calculate. Sum – The total count for the category you provide in
        # name . Average – The total count divided by the number of intents in the category you provide in
        # name . Max – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the summary statistic for the metric that you requested.

        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # An object containing information about the requested path.

      struct AnalyticsIntentNodeSummary
        include JSON::Serializable

        # The total number of sessions that follow the given path to the given intent.

        @[JSON::Field(key: "intentCount")]
        getter intent_count : Int32?

        # The number of intents up to and including the requested path.

        @[JSON::Field(key: "intentLevel")]
        getter intent_level : Int32?

        # The name of the intent at the end of the requested path.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # The path.

        @[JSON::Field(key: "intentPath")]
        getter intent_path : String?

        # Specifies whether the node is the end of a path ( Exit ) or not ( Inner ).

        @[JSON::Field(key: "nodeType")]
        getter node_type : String?

        def initialize(
          @intent_count : Int32? = nil,
          @intent_level : Int32? = nil,
          @intent_name : String? = nil,
          @intent_path : String? = nil,
          @node_type : String? = nil
        )
        end
      end

      # An object containing the results for the intent metrics you requested and the bin and/or group(s)
      # they refer to, if applicable.

      struct AnalyticsIntentResult
        include JSON::Serializable

        # A list of objects containing the criteria you requested for binning results and the values of the
        # bins.

        @[JSON::Field(key: "binKeys")]
        getter bin_keys : Array(Types::AnalyticsBinKey)?

        # A list of objects containing the criteria you requested for grouping results and the values of the
        # groups.

        @[JSON::Field(key: "groupByKeys")]
        getter group_by_keys : Array(Types::AnalyticsIntentGroupByKey)?

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the method by which to organize the results.

        @[JSON::Field(key: "metricsResults")]
        getter metrics_results : Array(Types::AnalyticsIntentMetricResult)?

        def initialize(
          @bin_keys : Array(Types::AnalyticsBinKey)? = nil,
          @group_by_keys : Array(Types::AnalyticsIntentGroupByKey)? = nil,
          @metrics_results : Array(Types::AnalyticsIntentMetricResult)? = nil
        )
        end
      end

      # Contains fields describing a condition by which to filter the intent stages. The expression may be
      # understood as name operator values . For example: IntentName CO Book – The intent name contains the
      # string "Book." BotVersion EQ 2 – The bot version is equal to two. The operators that each filter
      # supports are listed below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel
      # – EQ . SessionId – EQ . OriginatingRequestId – EQ . IntentName – EQ , CO . IntentStageName – EQ , CO
      # .

      struct AnalyticsIntentStageFilter
        include JSON::Serializable

        # The category by which to filter the intent stages. The descriptions for each option are as follows:
        # BotAlias – The name of the bot alias. BotVersion – The version of the bot. LocaleId – The locale of
        # the bot. Modality – The modality of the session with the bot (audio, DTMF, or text). Channel – The
        # channel that the bot is integrated with. SessionId – The identifier of the session with the bot.
        # OriginatingRequestId – The identifier of the first request in a session. IntentName – The name of
        # the intent. IntentStageName – The stage in the intent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operation by which to filter the category. The following operations are possible: CO – Contains
        # EQ – Equals GT – Greater than LT – Less than The operators that each filter supports are listed
        # below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel – EQ . SessionId –
        # EQ . OriginatingRequestId – EQ . IntentName – EQ , CO . IntentStageName – EQ , CO .

        @[JSON::Field(key: "operator")]
        getter operator : String

        # An array containing the values of the category by which to apply the operator to filter the results.
        # You can provide multiple values if the operator is EQ or CO . If you provide multiple values, you
        # filter for results that equal/contain any of the values. For example, if the name , operator , and
        # values fields are Modality , EQ , and [Speech, Text] , the operation filters for results where the
        # modality was either Speech or Text .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Contains the category by which the intent stage analytics and the values for that category were
      # grouped.

      struct AnalyticsIntentStageGroupByKey
        include JSON::Serializable

        # A category by which the intent stage analytics were grouped.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A member of the category by which the intent stage analytics were grouped.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains the category by which to group the intent stages.

      struct AnalyticsIntentStageGroupBySpecification
        include JSON::Serializable

        # Specifies whether to group the intent stages by their name or the intent to which the session was
        # switched.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Contains the metric and the summary statistic you want to calculate, and the order in which to sort
      # the results, for the intent stages across the user sessions with the bot.

      struct AnalyticsIntentStageMetric
        include JSON::Serializable

        # The metric for which you want to get intent stage summary statistics. See Key definitions for more
        # details about these metrics. Count – The number of times the intent stage occurred. Success – The
        # number of times the intent stage succeeded. Failure – The number of times the intent stage failed.
        # Dropped – The number of times the user dropped the intent stage. Retry – The number of times the bot
        # tried to elicit a response from the user at this stage.

        @[JSON::Field(key: "name")]
        getter name : String

        # The summary statistic to calculate. Sum – The total count for the category you provide in name .
        # Average – The total count divided by the number of intent stages in the category you provide in name
        # . Max – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String

        # Specifies whether to sort the results in ascending or descending order of the summary statistic (
        # value in the response).

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String,
          @statistic : String,
          @order : String? = nil
        )
        end
      end

      # An object containing the results for an intent stage metric you requested.

      struct AnalyticsIntentStageMetricResult
        include JSON::Serializable

        # The metric that you requested. Count – The number of times the intent stage occurred. Success – The
        # number of times the intent stage succeeded. Failure – The number of times the intent stage failed.
        # Dropped – The number of times the user dropped the intent stage. Retry – The number of times the bot
        # tried to elicit a response from the user at this stage.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The summary statistic that you requested to calculate. Sum – The total count for the category you
        # provide in name . Average – The total count divided by the number of intent stages in the category
        # you provide in name . Max – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the summary statistic for the metric that you requested.

        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # An object containing the results for the intent stage metrics you requested and the bin and/or group
      # they refer to, if applicable.

      struct AnalyticsIntentStageResult
        include JSON::Serializable

        # A list of objects containing the criteria you requested for binning results and the values of the
        # bins.

        @[JSON::Field(key: "binKeys")]
        getter bin_keys : Array(Types::AnalyticsBinKey)?

        # A list of objects containing the criteria you requested for grouping results and the values of the
        # bins.

        @[JSON::Field(key: "groupByKeys")]
        getter group_by_keys : Array(Types::AnalyticsIntentStageGroupByKey)?

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the method by which to organize the results.

        @[JSON::Field(key: "metricsResults")]
        getter metrics_results : Array(Types::AnalyticsIntentStageMetricResult)?

        def initialize(
          @bin_keys : Array(Types::AnalyticsBinKey)? = nil,
          @group_by_keys : Array(Types::AnalyticsIntentStageGroupByKey)? = nil,
          @metrics_results : Array(Types::AnalyticsIntentStageMetricResult)? = nil
        )
        end
      end

      # Contains fields describing a condition by which to filter the paths. The expression may be
      # understood as name operator values . For example: LocaleId EQ en – The locale is "en". BotVersion EQ
      # 2 – The bot version is equal to two. The operators that each filter supports are listed below:
      # BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel – EQ .

      struct AnalyticsPathFilter
        include JSON::Serializable

        # The category by which to filter the intent paths. The descriptions for each option are as follows:
        # BotAlias – The name of the bot alias. BotVersion – The version of the bot. LocaleId – The locale of
        # the bot. Modality – The modality of the session with the bot (audio, DTMF, or text). Channel – The
        # channel that the bot is integrated with.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operation by which to filter the category. The following operations are possible: CO – Contains
        # EQ – Equals GT – Greater than LT – Less than The operators that each filter supports are listed
        # below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel – EQ .

        @[JSON::Field(key: "operator")]
        getter operator : String

        # An array containing the values of the category by which to apply the operator to filter the results.
        # You can provide multiple values if the operator is EQ or CO . If you provide multiple values, you
        # filter for results that equal/contain any of the values. For example, if the name , operator , and
        # values fields are Modality , EQ , and [Speech, Text] , the operation filters for results where the
        # modality was either Speech or Text .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Contains fields describing a condition by which to filter the sessions. The expression may be
      # understood as name operator values . For example: LocaleId EQ en – The locale is "en". Duration GT
      # 200 – The duration is greater than 200 seconds. The operators that each filter supports are listed
      # below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel – EQ . Duration –
      # EQ , GT , LT . conversationEndState – EQ , CO . SessionId – EQ . OriginatingRequestId – EQ .
      # IntentPath – EQ .

      struct AnalyticsSessionFilter
        include JSON::Serializable

        # The category by which to filter the sessions. The descriptions for each option are as follows:
        # BotAlias – The name of the bot alias. BotVersion – The version of the bot. LocaleId – The locale of
        # the bot. Modality – The modality of the session with the bot (audio, DTMF, or text). Channel – The
        # channel that the bot is integrated with. Duration – The duration of the session.
        # conversationEndState – The final state of the session. SessionId – The identifier of the session
        # with the bot. OriginatingRequestId – The identifier of the first request in a session. IntentPath –
        # The order of intents taken in a session.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operation by which to filter the category. The following operations are possible: CO – Contains
        # EQ – Equals GT – Greater than LT – Less than The operators that each filter supports are listed
        # below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel – EQ . Duration –
        # EQ , GT , LT . conversationEndState – EQ , CO . SessionId – EQ . OriginatingRequestId – EQ .
        # IntentPath – EQ .

        @[JSON::Field(key: "operator")]
        getter operator : String

        # An array containing the values of the category by which to apply the operator to filter the results.
        # You can provide multiple values if the operator is EQ or CO . If you provide multiple values, you
        # filter for results that equal/contain any of the values. For example, if the name , operator , and
        # values fields are Modality , EQ , and [Speech, Text] , the operation filters for results where the
        # modality was either Speech or Text .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Contains the category by which the session analytics were grouped and a member of that category.

      struct AnalyticsSessionGroupByKey
        include JSON::Serializable

        # The category by which the session analytics were grouped.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A member of the category by which the session analytics were grouped.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains the category by which to group the sessions.

      struct AnalyticsSessionGroupBySpecification
        include JSON::Serializable

        # Specifies whether to group the session by their end state or their locale.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Contains the metric and the summary statistic you want to calculate, and the order in which to sort
      # the results, for the user sessions with the bot.

      struct AnalyticsSessionMetric
        include JSON::Serializable

        # The metric for which you want to get session summary statistics. Count – The number of sessions.
        # Success – The number of sessions that succeeded. Failure – The number of sessions that failed.
        # Dropped – The number of sessions that the user dropped. Duration – The duration of sessions.
        # TurnsPerSession – The number of turns in the sessions. Concurrency – The number of sessions
        # occurring in the same period of time.

        @[JSON::Field(key: "name")]
        getter name : String

        # The summary statistic to calculate. Sum – The total count for the category you provide in name .
        # Average – The total count divided by the number of sessions in the category you provide in name .
        # Max – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String

        # Specifies whether to sort the results in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String,
          @statistic : String,
          @order : String? = nil
        )
        end
      end

      # An object containing the results for a session metric you requested.

      struct AnalyticsSessionMetricResult
        include JSON::Serializable

        # The metric that you requested. Count – The number of sessions. Success – The number of sessions that
        # succeeded. Failure – The number of sessions that failed. Dropped – The number of sessions that the
        # user dropped. Duration – The duration of sessions. TurnPersession – The number of turns in the
        # sessions. Concurrency – The number of sessions occurring in the same period of time.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The summary statistic that you requested to calculate. Sum – The total count for the category you
        # provide in name . Average – The total count divided by the number of sessions in the category you
        # provide in name . Max – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the summary statistic for the metric that you requested.

        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # An object containing the results for the session metrics you requested and the bin and/or group(s)
      # they refer to, if applicable.

      struct AnalyticsSessionResult
        include JSON::Serializable

        # A list of objects containing the criteria you requested for binning results and the values of the
        # bins.

        @[JSON::Field(key: "binKeys")]
        getter bin_keys : Array(Types::AnalyticsBinKey)?

        # A list of objects containing the criteria you requested for grouping results and the values of the
        # bins.

        @[JSON::Field(key: "groupByKeys")]
        getter group_by_keys : Array(Types::AnalyticsSessionGroupByKey)?

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the method by which to organize the results.

        @[JSON::Field(key: "metricsResults")]
        getter metrics_results : Array(Types::AnalyticsSessionMetricResult)?

        def initialize(
          @bin_keys : Array(Types::AnalyticsBinKey)? = nil,
          @group_by_keys : Array(Types::AnalyticsSessionGroupByKey)? = nil,
          @metrics_results : Array(Types::AnalyticsSessionMetricResult)? = nil
        )
        end
      end

      # An object that specifies the last used intent at the time of the utterance as an attribute to
      # return.

      struct AnalyticsUtteranceAttribute
        include JSON::Serializable

        # An attribute to return. The only available attribute is the intent that the bot mapped the utterance
        # to.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # An object containing the intent that the bot mapped the utterance to.

      struct AnalyticsUtteranceAttributeResult
        include JSON::Serializable

        # The intent that the bot mapped the utterance to.

        @[JSON::Field(key: "lastUsedIntent")]
        getter last_used_intent : String?

        def initialize(
          @last_used_intent : String? = nil
        )
        end
      end

      # Contains fields describing a condition by which to filter the utterances. The expression may be
      # understood as name operator values . For example: LocaleId EQ Book – The locale is the string "en".
      # UtteranceText CO help – The text of the utterance contains the string "help". The operators that
      # each filter supports are listed below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality –
      # EQ . Channel – EQ . SessionId – EQ . OriginatingRequestId – EQ . UtteranceState – EQ . UtteranceText
      # – EQ , CO .

      struct AnalyticsUtteranceFilter
        include JSON::Serializable

        # The category by which to filter the utterances. The descriptions for each option are as follows:
        # BotAlias – The name of the bot alias. BotVersion – The version of the bot. LocaleId – The locale of
        # the bot. Modality – The modality of the session with the bot (audio, DTMF, or text). Channel – The
        # channel that the bot is integrated with. SessionId – The identifier of the session with the bot.
        # OriginatingRequestId – The identifier of the first request in a session. UtteranceState – The state
        # of the utterance. UtteranceText – The text in the utterance.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operation by which to filter the category. The following operations are possible: CO – Contains
        # EQ – Equals GT – Greater than LT – Less than The operators that each filter supports are listed
        # below: BotAlias – EQ . BotVersion – EQ . LocaleId – EQ . Modality – EQ . Channel – EQ . SessionId –
        # EQ . OriginatingRequestId – EQ . UtteranceState – EQ . UtteranceText – EQ , CO .

        @[JSON::Field(key: "operator")]
        getter operator : String

        # An array containing the values of the category by which to apply the operator to filter the results.
        # You can provide multiple values if the operator is EQ or CO . If you provide multiple values, you
        # filter for results that equal/contain any of the values. For example, if the name , operator , and
        # values fields are Modality , EQ , and [Speech, Text] , the operation filters for results where the
        # modality was either Speech or Text .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Contains the category by which the utterance analytics were grouped and the values for that
      # category.

      struct AnalyticsUtteranceGroupByKey
        include JSON::Serializable

        # The category by which the utterance analytics were grouped.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A member of the category by which the utterance analytics were grouped.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains the category by which to group the utterances.

      struct AnalyticsUtteranceGroupBySpecification
        include JSON::Serializable

        # Specifies whether to group the utterances by their text or their state.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Contains the metric and the summary statistic you want to calculate, and the order in which to sort
      # the results, for the utterances across the user sessions with the bot.

      struct AnalyticsUtteranceMetric
        include JSON::Serializable

        # The metric for which you want to get utterance summary statistics. Count – The number of utterances.
        # Missed – The number of utterances that Amazon Lex failed to recognize. Detected – The number of
        # utterances that Amazon Lex managed to detect. UtteranceTimestamp – The date and time of the
        # utterance.

        @[JSON::Field(key: "name")]
        getter name : String

        # The summary statistic to calculate. Sum – The total count for the category you provide in name .
        # Average – The total count divided by the number of utterances in the category you provide in name .
        # Max – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String

        # Specifies whether to sort the results in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String,
          @statistic : String,
          @order : String? = nil
        )
        end
      end

      # An object containing the results for the utterance metric you requested.

      struct AnalyticsUtteranceMetricResult
        include JSON::Serializable

        # The metric that you requested. Count – The number of utterances. Missed – The number of utterances
        # that Amazon Lex failed to recognize. Detected – The number of utterances that Amazon Lex managed to
        # detect. UtteranceTimestamp – The date and time of the utterance.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The summary statistic that you requested to calculate. Sum – The total count for the category you
        # provide in name . Average – The total count divided by the number of utterances in the category you
        # provide in name . Max – The highest count in the category you provide in name .

        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the summary statistic for the metric that you requested.

        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # An object containing the results for the utterance metrics you requested and the bin and/or group(s)
      # they refer to, if applicable.

      struct AnalyticsUtteranceResult
        include JSON::Serializable

        # A list of objects containing information about the last used intent at the time of an utterance.

        @[JSON::Field(key: "attributeResults")]
        getter attribute_results : Array(Types::AnalyticsUtteranceAttributeResult)?

        # A list of objects containing the criteria you requested for binning results and the values of the
        # bins.

        @[JSON::Field(key: "binKeys")]
        getter bin_keys : Array(Types::AnalyticsBinKey)?

        # A list of objects containing the criteria you requested for grouping results and the values of the
        # bins.

        @[JSON::Field(key: "groupByKeys")]
        getter group_by_keys : Array(Types::AnalyticsUtteranceGroupByKey)?

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the method by which to organize the results.

        @[JSON::Field(key: "metricsResults")]
        getter metrics_results : Array(Types::AnalyticsUtteranceMetricResult)?

        def initialize(
          @attribute_results : Array(Types::AnalyticsUtteranceAttributeResult)? = nil,
          @bin_keys : Array(Types::AnalyticsBinKey)? = nil,
          @group_by_keys : Array(Types::AnalyticsUtteranceGroupByKey)? = nil,
          @metrics_results : Array(Types::AnalyticsUtteranceMetricResult)? = nil
        )
        end
      end

      # The object containing information that associates the recommended intent/slot type with a
      # conversation.

      struct AssociatedTranscript
        include JSON::Serializable

        # The content of the transcript that meets the search filter criteria. For the JSON format of the
        # transcript, see Output transcript format .

        @[JSON::Field(key: "transcript")]
        getter transcript : String?

        def initialize(
          @transcript : String? = nil
        )
        end
      end

      # Filters to search for the associated transcript.

      struct AssociatedTranscriptFilter
        include JSON::Serializable

        # The name of the field to use for filtering. The allowed names are IntentId and SlotTypeId.

        @[JSON::Field(key: "name")]
        getter name : String

        # The values to use to filter the transcript.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Specifies the audio and DTMF input specification.

      struct AudioAndDTMFInputSpecification
        include JSON::Serializable

        # Time for which a bot waits before assuming that the customer isn't going to speak or press a key.
        # This timeout is shared between Audio and DTMF inputs.

        @[JSON::Field(key: "startTimeoutMs")]
        getter start_timeout_ms : Int32

        # Specifies the settings on audio input.

        @[JSON::Field(key: "audioSpecification")]
        getter audio_specification : Types::AudioSpecification?

        # Specifies the settings on DTMF input.

        @[JSON::Field(key: "dtmfSpecification")]
        getter dtmf_specification : Types::DTMFSpecification?

        def initialize(
          @start_timeout_ms : Int32,
          @audio_specification : Types::AudioSpecification? = nil,
          @dtmf_specification : Types::DTMFSpecification? = nil
        )
        end
      end

      # The location of audio log files collected when conversation logging is enabled for a bot.

      struct AudioLogDestination
        include JSON::Serializable

        # The Amazon S3 bucket where the audio log files are stored. The IAM role specified in the roleArn
        # parameter of the CreateBot operation must have permission to write to this bucket.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : Types::S3BucketLogDestination

        def initialize(
          @s3_bucket : Types::S3BucketLogDestination
        )
        end
      end

      # Settings for logging audio of conversations between Amazon Lex and a user. You specify whether to
      # log audio and the Amazon S3 bucket where the audio file is stored.

      struct AudioLogSetting
        include JSON::Serializable


        @[JSON::Field(key: "destination")]
        getter destination : Types::AudioLogDestination

        # Determines whether audio logging in enabled for the bot.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The option to enable selective conversation log capture for audio.

        @[JSON::Field(key: "selectiveLoggingEnabled")]
        getter selective_logging_enabled : Bool?

        def initialize(
          @destination : Types::AudioLogDestination,
          @enabled : Bool,
          @selective_logging_enabled : Bool? = nil
        )
        end
      end

      # Specifies the audio input specifications.

      struct AudioSpecification
        include JSON::Serializable

        # Time for which a bot waits after the customer stops speaking to assume the utterance is finished.

        @[JSON::Field(key: "endTimeoutMs")]
        getter end_timeout_ms : Int32

        # Time for how long Amazon Lex waits before speech input is truncated and the speech is returned to
        # application.

        @[JSON::Field(key: "maxLengthMs")]
        getter max_length_ms : Int32

        def initialize(
          @end_timeout_ms : Int32,
          @max_length_ms : Int32
        )
        end
      end


      struct BatchCreateCustomVocabularyItemRequest
        include JSON::Serializable

        # The identifier of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # A list of new custom vocabulary items. Each entry must contain a phrase and can optionally contain a
        # displayAs and/or a weight.

        @[JSON::Field(key: "customVocabularyItemList")]
        getter custom_vocabulary_item_list : Array(Types::NewCustomVocabularyItem)

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported Languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @custom_vocabulary_item_list : Array(Types::NewCustomVocabularyItem),
          @locale_id : String
        )
        end
      end


      struct BatchCreateCustomVocabularyItemResponse
        include JSON::Serializable

        # The identifier of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A list of custom vocabulary items that failed to create during the operation. The reason for the
        # error is contained within each error object.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::FailedCustomVocabularyItem)?

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported Languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A list of custom vocabulary items that were successfully created during the operation.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::CustomVocabularyItem)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @errors : Array(Types::FailedCustomVocabularyItem)? = nil,
          @locale_id : String? = nil,
          @resources : Array(Types::CustomVocabularyItem)? = nil
        )
        end
      end


      struct BatchDeleteCustomVocabularyItemRequest
        include JSON::Serializable

        # The identifier of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # A list of custom vocabulary items requested to be deleted. Each entry must contain the unique custom
        # vocabulary entry identifier.

        @[JSON::Field(key: "customVocabularyItemList")]
        getter custom_vocabulary_item_list : Array(Types::CustomVocabularyEntryId)

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported Languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @custom_vocabulary_item_list : Array(Types::CustomVocabularyEntryId),
          @locale_id : String
        )
        end
      end


      struct BatchDeleteCustomVocabularyItemResponse
        include JSON::Serializable

        # The identifier of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A list of custom vocabulary items that failed to delete during the operation. The reason for the
        # error is contained within each error object.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::FailedCustomVocabularyItem)?

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported languages
        # (https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html).

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A list of custom vocabulary items that were successfully deleted during the operation.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::CustomVocabularyItem)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @errors : Array(Types::FailedCustomVocabularyItem)? = nil,
          @locale_id : String? = nil,
          @resources : Array(Types::CustomVocabularyItem)? = nil
        )
        end
      end


      struct BatchUpdateCustomVocabularyItemRequest
        include JSON::Serializable

        # The identifier of the bot associated with this custom vocabulary

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # A list of custom vocabulary items with updated fields. Each entry must contain a phrase and can
        # optionally contain a displayAs and/or a weight.

        @[JSON::Field(key: "customVocabularyItemList")]
        getter custom_vocabulary_item_list : Array(Types::CustomVocabularyItem)

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported Languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @custom_vocabulary_item_list : Array(Types::CustomVocabularyItem),
          @locale_id : String
        )
        end
      end


      struct BatchUpdateCustomVocabularyItemResponse
        include JSON::Serializable

        # The identifier of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A list of custom vocabulary items that failed to update during the operation. The reason for the
        # error is contained within each error object.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::FailedCustomVocabularyItem)?

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported Languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A list of custom vocabulary items that were successfully updated during the operation.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::CustomVocabularyItem)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @errors : Array(Types::FailedCustomVocabularyItem)? = nil,
          @locale_id : String? = nil,
          @resources : Array(Types::CustomVocabularyItem)? = nil
        )
        end
      end

      # The details on the Bedrock guardrail configuration.

      struct BedrockGuardrailConfiguration
        include JSON::Serializable

        # The unique guardrail id for the Bedrock guardrail configuration.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The guardrail version for the Bedrock guardrail configuration.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @identifier : String,
          @version : String
        )
        end
      end

      # Contains details about the configuration of a Amazon Bedrock knowledge base.

      struct BedrockKnowledgeStoreConfiguration
        include JSON::Serializable

        # The base ARN of the knowledge base used.

        @[JSON::Field(key: "bedrockKnowledgeBaseArn")]
        getter bedrock_knowledge_base_arn : String

        # Specifies whether to return an exact response, or to return an answer generated by the model, using
        # the fields you specify from the database.

        @[JSON::Field(key: "exactResponse")]
        getter exact_response : Bool?

        # Contains the names of the fields used for an exact response to the user.

        @[JSON::Field(key: "exactResponseFields")]
        getter exact_response_fields : Types::BedrockKnowledgeStoreExactResponseFields?

        def initialize(
          @bedrock_knowledge_base_arn : String,
          @exact_response : Bool? = nil,
          @exact_response_fields : Types::BedrockKnowledgeStoreExactResponseFields? = nil
        )
        end
      end

      # The exact response fields given by the Bedrock knowledge store.

      struct BedrockKnowledgeStoreExactResponseFields
        include JSON::Serializable

        # The answer field used for an exact response from Bedrock Knowledge Store.

        @[JSON::Field(key: "answerField")]
        getter answer_field : String?

        def initialize(
          @answer_field : String? = nil
        )
        end
      end

      # Contains information about the Amazon Bedrock model used to interpret the prompt used in descriptive
      # bot building.

      struct BedrockModelSpecification
        include JSON::Serializable

        # The ARN of the foundation model used in descriptive bot building.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The custom prompt used in the Bedrock model specification details.

        @[JSON::Field(key: "customPrompt")]
        getter custom_prompt : String?

        # The guardrail configuration in the Bedrock model specification details.

        @[JSON::Field(key: "guardrail")]
        getter guardrail : Types::BedrockGuardrailConfiguration?

        # The Bedrock trace status in the Bedrock model specification details.

        @[JSON::Field(key: "traceStatus")]
        getter trace_status : String?

        def initialize(
          @model_arn : String,
          @custom_prompt : String? = nil,
          @guardrail : Types::BedrockGuardrailConfiguration? = nil,
          @trace_status : String? = nil
        )
        end
      end

      # Provides a record of an event that affects a bot alias. For example, when the version of a bot that
      # the alias points to changes.

      struct BotAliasHistoryEvent
        include JSON::Serializable

        # The version of the bot that was used in the event.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The date and time that the event ended.

        @[JSON::Field(key: "endDate")]
        getter end_date : Time?

        # The date and time that the event started.

        @[JSON::Field(key: "startDate")]
        getter start_date : Time?

        def initialize(
          @bot_version : String? = nil,
          @end_date : Time? = nil,
          @start_date : Time? = nil
        )
        end
      end

      # Specifies settings that are unique to a locale. For example, you can use different Lambda function
      # depending on the bot's locale.

      struct BotAliasLocaleSettings
        include JSON::Serializable

        # Determines whether the locale is enabled for the bot. If the value is false , the locale isn't
        # available for use.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # Specifies the Lambda function that should be used in the locale.

        @[JSON::Field(key: "codeHookSpecification")]
        getter code_hook_specification : Types::CodeHookSpecification?

        def initialize(
          @enabled : Bool,
          @code_hook_specification : Types::CodeHookSpecification? = nil
        )
        end
      end

      # Contains information about all the aliases replication statuses applicable for global resiliency.

      struct BotAliasReplicaSummary
        include JSON::Serializable

        # The bot alias ID for all the alias bot replications.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The replication statuses for all the alias bot replications.

        @[JSON::Field(key: "botAliasReplicationStatus")]
        getter bot_alias_replication_status : String?

        # The bot version for all the alias bot replications.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The creation time and date for all the alias bot replications.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The reasons for failure for the aliases bot replications.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The last time and date updated for all the alias bot replications.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        def initialize(
          @bot_alias_id : String? = nil,
          @bot_alias_replication_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil,
          @last_updated_date_time : Time? = nil
        )
        end
      end

      # Summary information about bot aliases returned from the ListBotAliases operation.

      struct BotAliasSummary
        include JSON::Serializable

        # The unique identifier assigned to the bot alias. You can use this ID to get detailed information
        # about the alias using the DescribeBotAlias operation.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The name of the bot alias.

        @[JSON::Field(key: "botAliasName")]
        getter bot_alias_name : String?

        # The current state of the bot alias. If the status is Available , the alias is ready for use.

        @[JSON::Field(key: "botAliasStatus")]
        getter bot_alias_status : String?

        # The version of the bot that the bot alias references.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the bot alias was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the bot alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A timestamp of the date and time that the bot alias was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        def initialize(
          @bot_alias_id : String? = nil,
          @bot_alias_name : String? = nil,
          @bot_alias_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @last_updated_date_time : Time? = nil
        )
        end
      end

      # The target Amazon S3 location for the test set execution using a bot alias.

      struct BotAliasTestExecutionTarget
        include JSON::Serializable

        # The bot alias Id of the bot alias used in the test set execution.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The bot Id of the bot alias used in the test set execution.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The locale Id of the bot alias used in the test set execution.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String
        )
        end
      end

      # Provides the identity of a the bot that was exported.

      struct BotExportSpecification
        include JSON::Serializable

        # The identifier of the bot assigned by Amazon Lex.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that was exported. This will be either DRAFT or the version number.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        def initialize(
          @bot_id : String,
          @bot_version : String
        )
        end
      end

      # Filters the responses returned by the ListBots operation.

      struct BotFilter
        include JSON::Serializable

        # The name of the field to filter the list of bots.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListBots operation should return only
        # aliases that equal the specified value. Specify CO when the ListBots operation should return aliases
        # that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The value to use for filtering the list of bots.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Provides the bot parameters required for importing a bot.

      struct BotImportSpecification
        include JSON::Serializable

        # The name that Amazon Lex should use for the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String


        @[JSON::Field(key: "dataPrivacy")]
        getter data_privacy : Types::DataPrivacy

        # The Amazon Resource Name (ARN) of the IAM role used to build and run the bot.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A list of tags to add to the bot. You can only add tags when you import a bot. You can't use the
        # UpdateBot operation to update tags. To update tags, use the TagResource operation.

        @[JSON::Field(key: "botTags")]
        getter bot_tags : Hash(String, String)?

        # Allows you to configure destinations where error logs will be published during the bot import
        # process.

        @[JSON::Field(key: "errorLogSettings")]
        getter error_log_settings : Types::ErrorLogSettings?

        # The time, in seconds, that Amazon Lex should keep information about a user's conversation with the
        # bot. A user interaction remains active for the amount of time specified. If no conversation occurs
        # during this time, the session expires and Amazon Lex deletes any data provided before the timeout.
        # You can specify between 60 (1 minute) and 86,400 (24 hours) seconds.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # A list of tags to add to the test alias for a bot. You can only add tags when you import a bot. You
        # can't use the UpdateAlias operation to update tags. To update tags on the test alias, use the
        # TagResource operation.

        @[JSON::Field(key: "testBotAliasTags")]
        getter test_bot_alias_tags : Hash(String, String)?

        def initialize(
          @bot_name : String,
          @data_privacy : Types::DataPrivacy,
          @role_arn : String,
          @bot_tags : Hash(String, String)? = nil,
          @error_log_settings : Types::ErrorLogSettings? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @test_bot_alias_tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides the bot locale parameters required for exporting a bot locale.

      struct BotLocaleExportSpecification
        include JSON::Serializable

        # The identifier of the bot to create the locale for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to export.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale to export. The string must match one of the locales in the
        # bot.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end

      # Filters responses returned by the ListBotLocales operation.

      struct BotLocaleFilter
        include JSON::Serializable

        # The name of the field to filter the list of bots.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListBotLocales operation should return only
        # aliases that equal the specified value. Specify CO when the ListBotLocales operation should return
        # aliases that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The value to use for filtering the list of bots.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Provides information about an event that occurred affecting the bot locale.

      struct BotLocaleHistoryEvent
        include JSON::Serializable

        # A description of the event that occurred.

        @[JSON::Field(key: "event")]
        getter event : String

        # A timestamp of the date and time that the event occurred.

        @[JSON::Field(key: "eventDate")]
        getter event_date : Time

        def initialize(
          @event : String,
          @event_date : Time
        )
        end
      end

      # Provides the bot locale parameters required for importing a bot locale.

      struct BotLocaleImportSpecification
        include JSON::Serializable

        # The identifier of the bot to import the locale to.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to import the locale to. This can only be the DRAFT version of the bot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale that the bot will be used in. The string must match one of
        # the supported locales. All of the intents, slot types, and slots used in the bot must have the same
        # locale. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # Determines the threshold where Amazon Lex will insert the AMAZON.FallbackIntent ,
        # AMAZON.KendraSearchIntent , or both when returning alternative intents. AMAZON.FallbackIntent and
        # AMAZON.KendraSearchIntent are only inserted if they are configured for the bot. For example, suppose
        # a bot is configured with the confidence threshold of 0.80 and the AMAZON.FallbackIntent . Amazon Lex
        # returns three alternative intents with the following confidence scores: IntentA (0.70), IntentB
        # (0.60), IntentC (0.50). The response from the PostText operation would be: AMAZON.FallbackIntent
        # IntentA IntentB IntentC

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64?

        # The sensitivity level for voice activity detection (VAD) in the bot locale. This setting helps
        # optimize speech recognition accuracy by adjusting how the system responds to background noise during
        # voice interactions.

        @[JSON::Field(key: "speechDetectionSensitivity")]
        getter speech_detection_sensitivity : String?

        # Speech-to-text settings to apply when importing the bot locale configuration.

        @[JSON::Field(key: "speechRecognitionSettings")]
        getter speech_recognition_settings : Types::SpeechRecognitionSettings?

        # Unified speech settings to apply when importing the bot locale configuration.

        @[JSON::Field(key: "unifiedSpeechSettings")]
        getter unified_speech_settings : Types::UnifiedSpeechSettings?


        @[JSON::Field(key: "voiceSettings")]
        getter voice_settings : Types::VoiceSettings?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @nlu_intent_confidence_threshold : Float64? = nil,
          @speech_detection_sensitivity : String? = nil,
          @speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
          @unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
          @voice_settings : Types::VoiceSettings? = nil
        )
        end
      end

      # Specifies attributes for sorting a list of bot locales.

      struct BotLocaleSortBy
        include JSON::Serializable

        # The bot locale attribute to sort by.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # Specifies whether to sort the bot locales in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Summary information about bot locales returned by the ListBotLocales operation.

      struct BotLocaleSummary
        include JSON::Serializable

        # The current status of the bot locale. When the status is Built the locale is ready for use.

        @[JSON::Field(key: "botLocaleStatus")]
        getter bot_locale_status : String?

        # The description of the bot locale.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A timestamp of the date and time that the bot locale was last built.

        @[JSON::Field(key: "lastBuildSubmittedDateTime")]
        getter last_build_submitted_date_time : Time?

        # A timestamp of the date and time that the bot locale was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The language and locale of the bot locale.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The name of the bot locale.

        @[JSON::Field(key: "localeName")]
        getter locale_name : String?

        def initialize(
          @bot_locale_status : String? = nil,
          @description : String? = nil,
          @last_build_submitted_date_time : Time? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @locale_name : String? = nil
        )
        end
      end

      # A bot that is a member of a network of bots.

      struct BotMember
        include JSON::Serializable

        # The alias ID of a bot that is a member of this network of bots.

        @[JSON::Field(key: "botMemberAliasId")]
        getter bot_member_alias_id : String

        # The alias name of a bot that is a member of this network of bots.

        @[JSON::Field(key: "botMemberAliasName")]
        getter bot_member_alias_name : String

        # The unique ID of a bot that is a member of this network of bots.

        @[JSON::Field(key: "botMemberId")]
        getter bot_member_id : String

        # The unique name of a bot that is a member of this network of bots.

        @[JSON::Field(key: "botMemberName")]
        getter bot_member_name : String

        # The version of a bot that is a member of this network of bots.

        @[JSON::Field(key: "botMemberVersion")]
        getter bot_member_version : String

        def initialize(
          @bot_member_alias_id : String,
          @bot_member_alias_name : String,
          @bot_member_id : String,
          @bot_member_name : String,
          @bot_member_version : String
        )
        end
      end

      # A statistical summary of the bot recommendation results.

      struct BotRecommendationResultStatistics
        include JSON::Serializable

        # Statistical information about about the intents associated with the bot recommendation results.

        @[JSON::Field(key: "intents")]
        getter intents : Types::IntentStatistics?

        # Statistical information about the slot types associated with the bot recommendation results.

        @[JSON::Field(key: "slotTypes")]
        getter slot_types : Types::SlotTypeStatistics?

        def initialize(
          @intents : Types::IntentStatistics? = nil,
          @slot_types : Types::SlotTypeStatistics? = nil
        )
        end
      end

      # The object representing the URL of the bot definition, the URL of the associated transcript, and a
      # statistical summary of the bot recommendation results.

      struct BotRecommendationResults
        include JSON::Serializable

        # The presigned url link of the associated transcript.

        @[JSON::Field(key: "associatedTranscriptsUrl")]
        getter associated_transcripts_url : String?

        # The presigned URL link of the recommended bot definition.

        @[JSON::Field(key: "botLocaleExportUrl")]
        getter bot_locale_export_url : String?

        # The statistical summary of the bot recommendation results.

        @[JSON::Field(key: "statistics")]
        getter statistics : Types::BotRecommendationResultStatistics?

        def initialize(
          @associated_transcripts_url : String? = nil,
          @bot_locale_export_url : String? = nil,
          @statistics : Types::BotRecommendationResultStatistics? = nil
        )
        end
      end

      # A summary of the bot recommendation.

      struct BotRecommendationSummary
        include JSON::Serializable

        # The unique identifier of the bot recommendation to be updated.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String

        # The status of the bot recommendation. If the status is Failed, then the reasons for the failure are
        # listed in the failureReasons field.

        @[JSON::Field(key: "botRecommendationStatus")]
        getter bot_recommendation_status : String

        # A timestamp of the date and time that the bot recommendation was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # A timestamp of the date and time that the bot recommendation was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        def initialize(
          @bot_recommendation_id : String,
          @bot_recommendation_status : String,
          @creation_date_time : Time? = nil,
          @last_updated_date_time : Time? = nil
        )
        end
      end

      # Contains summary information about all the replication statuses applicable for global resiliency.

      struct BotReplicaSummary
        include JSON::Serializable

        # The operation status for the replicated bot applicable.

        @[JSON::Field(key: "botReplicaStatus")]
        getter bot_replica_status : String?

        # The creation time and date for the replicated bots.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The reasons for the failure for the replicated bot.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The replica region used in the replication statuses summary.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String?

        def initialize(
          @bot_replica_status : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil,
          @replica_region : String? = nil
        )
        end
      end

      # Specifies attributes for sorting a list of bots.

      struct BotSortBy
        include JSON::Serializable

        # The attribute to use to sort the list of bots.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list. You can choose ascending or descending.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Summary information about a bot returned by the ListBots operation.

      struct BotSummary
        include JSON::Serializable

        # The unique identifier assigned to the bot. Use this ID to get detailed information about the bot
        # with the DescribeBot operation.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The name of the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The current status of the bot. When the status is Available the bot is ready for use.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # The type of the bot.

        @[JSON::Field(key: "botType")]
        getter bot_type : String?

        # The description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time that the bot was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The latest numerical version in use for the bot.

        @[JSON::Field(key: "latestBotVersion")]
        getter latest_bot_version : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_name : String? = nil,
          @bot_status : String? = nil,
          @bot_type : String? = nil,
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @latest_bot_version : String? = nil
        )
        end
      end

      # The version of a bot used for a bot locale.

      struct BotVersionLocaleDetails
        include JSON::Serializable

        # The version of a bot used for a bot locale.

        @[JSON::Field(key: "sourceBotVersion")]
        getter source_bot_version : String

        def initialize(
          @source_bot_version : String
        )
        end
      end

      # The sort category for the version replicated bots.

      struct BotVersionReplicaSortBy
        include JSON::Serializable

        # The attribute of the sort category for the version replicated bots.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order of the sort category for the version replicated bots.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Contains summary information for all the version replication statuses applicable for Global
      # resiliency.

      struct BotVersionReplicaSummary
        include JSON::Serializable

        # The bot version for the summary information for all the version replication statuses.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The version replication status for all the replicated bots.

        @[JSON::Field(key: "botVersionReplicationStatus")]
        getter bot_version_replication_status : String?

        # The creation date and time of the replication status for all the replicated bots.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The reasons for replication failure for all the replicated bots.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        def initialize(
          @bot_version : String? = nil,
          @bot_version_replication_status : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil
        )
        end
      end

      # Specifies attributes for sorting a list of bot versions.

      struct BotVersionSortBy
        include JSON::Serializable

        # The attribute to use to sort the list of versions.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list. You can specify ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Summary information about a bot version returned by the ListBotVersions operation.

      struct BotVersionSummary
        include JSON::Serializable

        # The name of the bot associated with the version.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The status of the bot. When the status is available, the version of the bot is ready for use.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # The numeric version of the bot, or DRAFT to indicate that this is the version of the bot that can be
        # updated..

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the version was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the version.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @bot_name : String? = nil,
          @bot_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil
        )
        end
      end


      struct BuildBotLocaleRequest
        include JSON::Serializable

        # The identifier of the bot to build. The identifier is returned in the response from the CreateBot
        # operation.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to build. This can only be the draft version of the bot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale that the bot will be used in. The string must match one of
        # the supported locales. All of the intents, slot types, and slots used in the bot must have the same
        # locale. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end


      struct BuildBotLocaleResponse
        include JSON::Serializable

        # The identifier of the specified bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The bot's build status. When the status is ReadyExpressTesting you can test the bot using the
        # utterances defined for the intents and slot types. When the status is Built , the bot is ready for
        # use and can be tested using any utterance.

        @[JSON::Field(key: "botLocaleStatus")]
        getter bot_locale_status : String?

        # The version of the bot that was built. This is only the draft version of the bot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp indicating the date and time that the bot was last built for this locale.

        @[JSON::Field(key: "lastBuildSubmittedDateTime")]
        getter last_build_submitted_date_time : Time?

        # The language and locale specified of where the bot can be used.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_locale_status : String? = nil,
          @bot_version : String? = nil,
          @last_build_submitted_date_time : Time? = nil,
          @locale_id : String? = nil
        )
        end
      end

      # Contains specifications about the Amazon Lex build time generative AI capabilities from Amazon
      # Bedrock that you can turn on for your bot.

      struct BuildtimeSettings
        include JSON::Serializable

        # An object containing specifications for the descriptive bot building feature.

        @[JSON::Field(key: "descriptiveBotBuilder")]
        getter descriptive_bot_builder : Types::DescriptiveBotBuilderSpecification?

        # Contains specifications for the sample utterance generation feature.

        @[JSON::Field(key: "sampleUtteranceGeneration")]
        getter sample_utterance_generation : Types::SampleUtteranceGenerationSpecification?

        def initialize(
          @descriptive_bot_builder : Types::DescriptiveBotBuilderSpecification? = nil,
          @sample_utterance_generation : Types::SampleUtteranceGenerationSpecification? = nil
        )
        end
      end

      # Specifies attributes for sorting a list of built-in intents.

      struct BuiltInIntentSortBy
        include JSON::Serializable

        # The attribute to use to sort the list of built-in intents.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list. You can specify ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Provides summary information about a built-in intent for the ListBuiltInIntents operation.

      struct BuiltInIntentSummary
        include JSON::Serializable

        # The description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The signature of the built-in intent. Use this to specify the parent intent of a derived intent.

        @[JSON::Field(key: "intentSignature")]
        getter intent_signature : String?

        def initialize(
          @description : String? = nil,
          @intent_signature : String? = nil
        )
        end
      end

      # Specifies attributes for sorting a list of built-in slot types.

      struct BuiltInSlotTypeSortBy
        include JSON::Serializable

        # The attribute to use to sort the list of built-in intents.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list. You can choose ascending or descending.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Provides summary information about a built-in slot type for the ListBuiltInSlotTypes operation.

      struct BuiltInSlotTypeSummary
        include JSON::Serializable

        # The description of the built-in slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The signature of the built-in slot type. Use this to specify the parent slot type of a derived slot
        # type.

        @[JSON::Field(key: "slotTypeSignature")]
        getter slot_type_signature : String?

        def initialize(
          @description : String? = nil,
          @slot_type_signature : String? = nil
        )
        end
      end

      # Describes a button to use on a response card used to gather slot values from a user.

      struct Button
        include JSON::Serializable

        # The text that appears on the button. Use this to tell the user what value is returned when they
        # choose this button.

        @[JSON::Field(key: "text")]
        getter text : String

        # The value returned to Amazon Lex when the user chooses this button. This must be one of the slot
        # values configured for the slot.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @text : String,
          @value : String
        )
        end
      end

      # The Amazon CloudWatch Logs log group where the text and metadata logs are delivered. The log group
      # must exist before you enable logging.

      struct CloudWatchLogGroupLogDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the log group where text and metadata logs are delivered.

        @[JSON::Field(key: "cloudWatchLogGroupArn")]
        getter cloud_watch_log_group_arn : String

        # The prefix of the log stream name within the log group that you specified

        @[JSON::Field(key: "logPrefix")]
        getter log_prefix : String

        def initialize(
          @cloud_watch_log_group_arn : String,
          @log_prefix : String
        )
        end
      end

      # Contains information about code hooks that Amazon Lex calls during a conversation.

      struct CodeHookSpecification
        include JSON::Serializable


        @[JSON::Field(key: "lambdaCodeHook")]
        getter lambda_code_hook : Types::LambdaCodeHook

        def initialize(
          @lambda_code_hook : Types::LambdaCodeHook
        )
        end
      end

      # A composite slot is a combination of two or more slots that capture multiple pieces of information
      # in a single user input.

      struct CompositeSlotTypeSetting
        include JSON::Serializable

        # Subslots in the composite slot.

        @[JSON::Field(key: "subSlots")]
        getter sub_slots : Array(Types::SubSlotTypeComposition)?

        def initialize(
          @sub_slots : Array(Types::SubSlotTypeComposition)? = nil
        )
        end
      end

      # Provides an expression that evaluates to true or false.

      struct Condition
        include JSON::Serializable

        # The expression string that is evaluated.

        @[JSON::Field(key: "expressionString")]
        getter expression_string : String

        def initialize(
          @expression_string : String
        )
        end
      end

      # A set of actions that Amazon Lex should run if the condition is matched.

      struct ConditionalBranch
        include JSON::Serializable

        # Contains the expression to evaluate. If the condition is true, the branch's actions are taken.

        @[JSON::Field(key: "condition")]
        getter condition : Types::Condition

        # The name of the branch.

        @[JSON::Field(key: "name")]
        getter name : String

        # The next step in the conversation.

        @[JSON::Field(key: "nextStep")]
        getter next_step : Types::DialogState


        @[JSON::Field(key: "response")]
        getter response : Types::ResponseSpecification?

        def initialize(
          @condition : Types::Condition,
          @name : String,
          @next_step : Types::DialogState,
          @response : Types::ResponseSpecification? = nil
        )
        end
      end

      # Provides a list of conditional branches. Branches are evaluated in the order that they are entered
      # in the list. The first branch with a condition that evaluates to true is executed. The last branch
      # in the list is the default branch. The default branch should not have any condition expression. The
      # default branch is executed if no other branch has a matching condition.

      struct ConditionalSpecification
        include JSON::Serializable

        # Determines whether a conditional branch is active. When active is false, the conditions are not
        # evaluated.

        @[JSON::Field(key: "active")]
        getter active : Bool

        # A list of conditional branches. A conditional branch is made up of a condition, a response and a
        # next step. The response and next step are executed when the condition is true.

        @[JSON::Field(key: "conditionalBranches")]
        getter conditional_branches : Array(Types::ConditionalBranch)

        # The conditional branch that should be followed when the conditions for other branches are not
        # satisfied. A conditional branch is made up of a condition, a response and a next step.

        @[JSON::Field(key: "defaultBranch")]
        getter default_branch : Types::DefaultConditionalBranch

        def initialize(
          @active : Bool,
          @conditional_branches : Array(Types::ConditionalBranch),
          @default_branch : Types::DefaultConditionalBranch
        )
        end
      end

      # The action that you tried to perform couldn't be completed because the resource is in a conflicting
      # state. For example, deleting a bot that is in the CREATING state. Try your request again.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The item listing the evaluation of intent level success or failure.

      struct ConversationLevelIntentClassificationResultItem
        include JSON::Serializable

        # The intent name used in the evaluation of intent level success or failure.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # The number of times the specific intent is used in the evaluation of intent level success or
        # failure.

        @[JSON::Field(key: "matchResult")]
        getter match_result : String

        def initialize(
          @intent_name : String,
          @match_result : String
        )
        end
      end

      # The conversation level details of the conversation used in the test set.

      struct ConversationLevelResultDetail
        include JSON::Serializable

        # The success or failure of the streaming of the conversation.

        @[JSON::Field(key: "endToEndResult")]
        getter end_to_end_result : String

        # The speech transcription success or failure details of the conversation.

        @[JSON::Field(key: "speechTranscriptionResult")]
        getter speech_transcription_result : String?

        def initialize(
          @end_to_end_result : String,
          @speech_transcription_result : String? = nil
        )
        end
      end

      # The slots used for the slot resolution in the conversation.

      struct ConversationLevelSlotResolutionResultItem
        include JSON::Serializable

        # The intents used in the slots list for the slot resolution details.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # The number of matching slots used in the slots listings for the slot resolution evaluation.

        @[JSON::Field(key: "matchResult")]
        getter match_result : String

        # The slot name in the slots list for the slot resolution details.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String

        def initialize(
          @intent_name : String,
          @match_result : String,
          @slot_name : String
        )
        end
      end

      # The test result evaluation item at the conversation level.

      struct ConversationLevelTestResultItem
        include JSON::Serializable

        # The conversation Id of the test result evaluation item.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        # The end-to-end success or failure of the test result evaluation item.

        @[JSON::Field(key: "endToEndResult")]
        getter end_to_end_result : String

        # The intent classification of the test result evaluation item.

        @[JSON::Field(key: "intentClassificationResults")]
        getter intent_classification_results : Array(Types::ConversationLevelIntentClassificationResultItem)

        # The slot success or failure of the test result evaluation item.

        @[JSON::Field(key: "slotResolutionResults")]
        getter slot_resolution_results : Array(Types::ConversationLevelSlotResolutionResultItem)

        # The speech transcription success or failure of the test result evaluation item.

        @[JSON::Field(key: "speechTranscriptionResult")]
        getter speech_transcription_result : String?

        def initialize(
          @conversation_id : String,
          @end_to_end_result : String,
          @intent_classification_results : Array(Types::ConversationLevelIntentClassificationResultItem),
          @slot_resolution_results : Array(Types::ConversationLevelSlotResolutionResultItem),
          @speech_transcription_result : String? = nil
        )
        end
      end

      # The test set results data at the conversation level.

      struct ConversationLevelTestResults
        include JSON::Serializable

        # The item list in the test set results data at the conversation level.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ConversationLevelTestResultItem)

        def initialize(
          @items : Array(Types::ConversationLevelTestResultItem)
        )
        end
      end

      # The selection to filter the test set results data at the conversation level.

      struct ConversationLevelTestResultsFilterBy
        include JSON::Serializable

        # The selection of matched or mismatched end-to-end status to filter test set results data at the
        # conversation level.

        @[JSON::Field(key: "endToEndResult")]
        getter end_to_end_result : String?

        def initialize(
          @end_to_end_result : String? = nil
        )
        end
      end

      # Configures conversation logging that saves audio, text, and metadata for the conversations with your
      # users.

      struct ConversationLogSettings
        include JSON::Serializable

        # The Amazon S3 settings for logging audio to an S3 bucket.

        @[JSON::Field(key: "audioLogSettings")]
        getter audio_log_settings : Array(Types::AudioLogSetting)?

        # The Amazon CloudWatch Logs settings for logging text and metadata.

        @[JSON::Field(key: "textLogSettings")]
        getter text_log_settings : Array(Types::TextLogSetting)?

        def initialize(
          @audio_log_settings : Array(Types::AudioLogSetting)? = nil,
          @text_log_settings : Array(Types::TextLogSetting)? = nil
        )
        end
      end

      # The data source that uses conversation logs.

      struct ConversationLogsDataSource
        include JSON::Serializable

        # The bot alias Id from the conversation logs.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The bot Id from the conversation logs.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The filter for the data source of the conversation log.

        @[JSON::Field(key: "filter")]
        getter filter : Types::ConversationLogsDataSourceFilterBy

        # The locale Id of the conversation log.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @filter : Types::ConversationLogsDataSourceFilterBy,
          @locale_id : String
        )
        end
      end

      # The selected data source to filter the conversation log.

      struct ConversationLogsDataSourceFilterBy
        include JSON::Serializable

        # The end time for the conversation log.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The selection to filter by input mode for the conversation logs.

        @[JSON::Field(key: "inputMode")]
        getter input_mode : String

        # The start time for the conversation log.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @input_mode : String,
          @start_time : Time
        )
        end
      end


      struct CreateBotAliasRequest
        include JSON::Serializable

        # The alias to create. The name must be unique for the bot.

        @[JSON::Field(key: "botAliasName")]
        getter bot_alias_name : String

        # The unique identifier of the bot that the alias applies to.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # Maps configuration information to a specific locale. You can use this parameter to specify a
        # specific Lambda function to run different functions in different locales.

        @[JSON::Field(key: "botAliasLocaleSettings")]
        getter bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)?

        # The version of the bot that this alias points to. You can use the UpdateBotAlias operation to change
        # the bot version associated with the alias.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Specifies whether Amazon Lex logs text and audio for a conversation with the bot. When you enable
        # conversation logs, text logs store text input, transcripts of audio input, and associated metadata
        # in Amazon CloudWatch Logs. Audio logs store audio input in Amazon S3.

        @[JSON::Field(key: "conversationLogSettings")]
        getter conversation_log_settings : Types::ConversationLogSettings?

        # A description of the alias. Use this description to help identify the alias.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "sentimentAnalysisSettings")]
        getter sentiment_analysis_settings : Types::SentimentAnalysisSettings?

        # A list of tags to add to the bot alias. You can only add tags when you create an alias, you can't
        # use the UpdateBotAlias operation to update the tags on a bot alias. To update tags, use the
        # TagResource operation.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @bot_alias_name : String,
          @bot_id : String,
          @bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)? = nil,
          @bot_version : String? = nil,
          @conversation_log_settings : Types::ConversationLogSettings? = nil,
          @description : String? = nil,
          @sentiment_analysis_settings : Types::SentimentAnalysisSettings? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateBotAliasResponse
        include JSON::Serializable

        # The unique identifier of the bot alias.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # Configuration information for a specific locale.

        @[JSON::Field(key: "botAliasLocaleSettings")]
        getter bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)?

        # The name specified for the bot alias.

        @[JSON::Field(key: "botAliasName")]
        getter bot_alias_name : String?

        # The current status of the alias. The alias is first put into the Creating state. When the alias is
        # ready to be used, it is put into the Available state. You can use the DescribeBotAlias operation to
        # get the current state of an alias.

        @[JSON::Field(key: "botAliasStatus")]
        getter bot_alias_status : String?

        # The unique identifier of the bot that this alias applies to.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with this alias.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The conversation log settings specified for the alias.

        @[JSON::Field(key: "conversationLogSettings")]
        getter conversation_log_settings : Types::ConversationLogSettings?

        # A Unix timestamp indicating the date and time that the bot alias was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description specified for the bot alias.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "sentimentAnalysisSettings")]
        getter sentiment_analysis_settings : Types::SentimentAnalysisSettings?

        # A list of tags associated with the bot alias.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @bot_alias_id : String? = nil,
          @bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)? = nil,
          @bot_alias_name : String? = nil,
          @bot_alias_status : String? = nil,
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @conversation_log_settings : Types::ConversationLogSettings? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @sentiment_analysis_settings : Types::SentimentAnalysisSettings? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateBotLocaleRequest
        include JSON::Serializable

        # The identifier of the bot to create the locale for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to create the locale for. This can only be the draft version of the bot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale that the bot will be used in. The string must match one of
        # the supported locales. All of the intents, slot types, and slots used in the bot must have the same
        # locale. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # Determines the threshold where Amazon Lex will insert the AMAZON.FallbackIntent ,
        # AMAZON.KendraSearchIntent , or both when returning alternative intents. AMAZON.FallbackIntent and
        # AMAZON.KendraSearchIntent are only inserted if they are configured for the bot. For example, suppose
        # a bot is configured with the confidence threshold of 0.80 and the AMAZON.FallbackIntent . Amazon Lex
        # returns three alternative intents with the following confidence scores: IntentA (0.70), IntentB
        # (0.60), IntentC (0.50). The response from the RecognizeText operation would be:
        # AMAZON.FallbackIntent IntentA IntentB IntentC

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64

        # A description of the bot locale. Use this to help identify the bot locale in lists.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "generativeAISettings")]
        getter generative_ai_settings : Types::GenerativeAISettings?

        # The sensitivity level for voice activity detection (VAD) in the bot locale. This setting helps
        # optimize speech recognition accuracy by adjusting how the system responds to background noise during
        # voice interactions.

        @[JSON::Field(key: "speechDetectionSensitivity")]
        getter speech_detection_sensitivity : String?

        # Speech-to-text settings to configure for the new bot locale.

        @[JSON::Field(key: "speechRecognitionSettings")]
        getter speech_recognition_settings : Types::SpeechRecognitionSettings?

        # Unified speech settings to configure for the new bot locale.

        @[JSON::Field(key: "unifiedSpeechSettings")]
        getter unified_speech_settings : Types::UnifiedSpeechSettings?

        # The Amazon Polly voice ID that Amazon Lex uses for voice interaction with the user.

        @[JSON::Field(key: "voiceSettings")]
        getter voice_settings : Types::VoiceSettings?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @nlu_intent_confidence_threshold : Float64,
          @description : String? = nil,
          @generative_ai_settings : Types::GenerativeAISettings? = nil,
          @speech_detection_sensitivity : String? = nil,
          @speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
          @unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
          @voice_settings : Types::VoiceSettings? = nil
        )
        end
      end


      struct CreateBotLocaleResponse
        include JSON::Serializable

        # The specified bot identifier.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The status of the bot. When the status is Creating the bot locale is being configured. When the
        # status is Building Amazon Lex is building the bot for testing and use. If the status of the bot is
        # ReadyExpressTesting , you can test the bot using the exact utterances specified in the bots'
        # intents. When the bot is ready for full testing or to run, the status is Built . If there was a
        # problem with building the bot, the status is Failed . If the bot was saved but not built, the status
        # is NotBuilt .

        @[JSON::Field(key: "botLocaleStatus")]
        getter bot_locale_status : String?

        # The specified bot version.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp specifying the date and time that the bot locale was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The specified description of the bot locale.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "generativeAISettings")]
        getter generative_ai_settings : Types::GenerativeAISettings?

        # The specified locale identifier.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The specified locale name.

        @[JSON::Field(key: "localeName")]
        getter locale_name : String?

        # The specified confidence threshold for inserting the AMAZON.FallbackIntent and
        # AMAZON.KendraSearchIntent intents.

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64?

        # The sensitivity level for voice activity detection (VAD) that was specified for the bot locale.

        @[JSON::Field(key: "speechDetectionSensitivity")]
        getter speech_detection_sensitivity : String?

        # The speech-to-text settings configured for the created bot locale.

        @[JSON::Field(key: "speechRecognitionSettings")]
        getter speech_recognition_settings : Types::SpeechRecognitionSettings?

        # The unified speech settings configured for the created bot locale.

        @[JSON::Field(key: "unifiedSpeechSettings")]
        getter unified_speech_settings : Types::UnifiedSpeechSettings?

        # The Amazon Polly voice ID that Amazon Lex uses for voice interaction with the user.

        @[JSON::Field(key: "voiceSettings")]
        getter voice_settings : Types::VoiceSettings?

        def initialize(
          @bot_id : String? = nil,
          @bot_locale_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @generative_ai_settings : Types::GenerativeAISettings? = nil,
          @locale_id : String? = nil,
          @locale_name : String? = nil,
          @nlu_intent_confidence_threshold : Float64? = nil,
          @speech_detection_sensitivity : String? = nil,
          @speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
          @unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
          @voice_settings : Types::VoiceSettings? = nil
        )
        end
      end


      struct CreateBotReplicaRequest
        include JSON::Serializable

        # The request for the unique bot ID of the source bot to be replicated in the secondary region.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The request for the secondary region that will be used in the replication of the source bot.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String

        def initialize(
          @bot_id : String,
          @replica_region : String
        )
        end
      end


      struct CreateBotReplicaResponse
        include JSON::Serializable

        # The unique bot ID of the replicated bot generated.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The operational status of the replicated bot generated.

        @[JSON::Field(key: "botReplicaStatus")]
        getter bot_replica_status : String?

        # The creation date and time of the replicated bot generated.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The region of the replicated bot generated.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String?

        # The source region for the source bot used for the replicated bot generated.

        @[JSON::Field(key: "sourceRegion")]
        getter source_region : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_replica_status : String? = nil,
          @creation_date_time : Time? = nil,
          @replica_region : String? = nil,
          @source_region : String? = nil
        )
        end
      end


      struct CreateBotRequest
        include JSON::Serializable

        # The name of the bot. The bot name must be unique in the account that creates the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # Provides information on additional privacy protections Amazon Lex should use with the bot's data.

        @[JSON::Field(key: "dataPrivacy")]
        getter data_privacy : Types::DataPrivacy

        # The time, in seconds, that Amazon Lex should keep information about a user's conversation with the
        # bot. A user interaction remains active for the amount of time specified. If no conversation occurs
        # during this time, the session expires and Amazon Lex deletes any data provided before the timeout.
        # You can specify between 60 (1 minute) and 86,400 (24 hours) seconds.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32

        # The Amazon Resource Name (ARN) of an IAM role that has permission to access the bot.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The list of bot members in a network to be created.

        @[JSON::Field(key: "botMembers")]
        getter bot_members : Array(Types::BotMember)?

        # A list of tags to add to the bot. You can only add tags when you create a bot. You can't use the
        # UpdateBot operation to update tags. To update tags, use the TagResource operation.

        @[JSON::Field(key: "botTags")]
        getter bot_tags : Hash(String, String)?

        # The type of a bot to create.

        @[JSON::Field(key: "botType")]
        getter bot_type : String?

        # A description of the bot. It appears in lists to help you identify a particular bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the configuration for error logging during bot creation.

        @[JSON::Field(key: "errorLogSettings")]
        getter error_log_settings : Types::ErrorLogSettings?

        # A list of tags to add to the test alias for a bot. You can only add tags when you create a bot. You
        # can't use the UpdateAlias operation to update tags. To update tags on the test alias, use the
        # TagResource operation.

        @[JSON::Field(key: "testBotAliasTags")]
        getter test_bot_alias_tags : Hash(String, String)?

        def initialize(
          @bot_name : String,
          @data_privacy : Types::DataPrivacy,
          @idle_session_ttl_in_seconds : Int32,
          @role_arn : String,
          @bot_members : Array(Types::BotMember)? = nil,
          @bot_tags : Hash(String, String)? = nil,
          @bot_type : String? = nil,
          @description : String? = nil,
          @error_log_settings : Types::ErrorLogSettings? = nil,
          @test_bot_alias_tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateBotResponse
        include JSON::Serializable

        # A unique identifier for a particular bot. You use this to identify the bot when you call other
        # Amazon Lex API operations.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The list of bots in a network that was created.

        @[JSON::Field(key: "botMembers")]
        getter bot_members : Array(Types::BotMember)?

        # The name specified for the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # Shows the current status of the bot. The bot is first in the Creating status. Once the bot is read
        # for use, it changes to the Available status. After the bot is created, you can use the DRAFT version
        # of the bot.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # A list of tags associated with the bot.

        @[JSON::Field(key: "botTags")]
        getter bot_tags : Hash(String, String)?

        # The type of a bot that was created.

        @[JSON::Field(key: "botType")]
        getter bot_type : String?

        # A timestamp indicating the date and time that the bot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The data privacy settings specified for the bot.

        @[JSON::Field(key: "dataPrivacy")]
        getter data_privacy : Types::DataPrivacy?

        # The description specified for the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies configuration settings for delivering error logs to Cloudwatch Logs in an Amazon Lex bot
        # response.

        @[JSON::Field(key: "errorLogSettings")]
        getter error_log_settings : Types::ErrorLogSettings?

        # The session idle time specified for the bot.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # The IAM role specified for the bot.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A list of tags associated with the test alias for the bot.

        @[JSON::Field(key: "testBotAliasTags")]
        getter test_bot_alias_tags : Hash(String, String)?

        def initialize(
          @bot_id : String? = nil,
          @bot_members : Array(Types::BotMember)? = nil,
          @bot_name : String? = nil,
          @bot_status : String? = nil,
          @bot_tags : Hash(String, String)? = nil,
          @bot_type : String? = nil,
          @creation_date_time : Time? = nil,
          @data_privacy : Types::DataPrivacy? = nil,
          @description : String? = nil,
          @error_log_settings : Types::ErrorLogSettings? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @role_arn : String? = nil,
          @test_bot_alias_tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateBotVersionRequest
        include JSON::Serializable

        # The identifier of the bot to create the version for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # Specifies the locales that Amazon Lex adds to this version. You can choose the Draft version or any
        # other previously published version for each locale. When you specify a source version, the locale
        # data is copied from the source version to the new version.

        @[JSON::Field(key: "botVersionLocaleSpecification")]
        getter bot_version_locale_specification : Hash(String, Types::BotVersionLocaleDetails)

        # A description of the version. Use the description to help identify the version in lists.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @bot_id : String,
          @bot_version_locale_specification : Hash(String, Types::BotVersionLocaleDetails),
          @description : String? = nil
        )
        end
      end


      struct CreateBotVersionResponse
        include JSON::Serializable

        # The bot identifier specified in the request.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # When you send a request to create or update a bot, Amazon Lex sets the status response element to
        # Creating . After Amazon Lex builds the bot, it sets status to Available . If Amazon Lex can't build
        # the bot, it sets status to Failed .

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # The version number assigned to the version.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The source versions used for each locale in the new version.

        @[JSON::Field(key: "botVersionLocaleSpecification")]
        getter bot_version_locale_specification : Hash(String, Types::BotVersionLocaleDetails)?

        # A timestamp of the date and time that the version was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the version specified in the request.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_status : String? = nil,
          @bot_version : String? = nil,
          @bot_version_locale_specification : Hash(String, Types::BotVersionLocaleDetails)? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateExportRequest
        include JSON::Serializable

        # The file format of the bot or bot locale definition files.

        @[JSON::Field(key: "fileFormat")]
        getter file_format : String

        # Specifies the type of resource to export, either a bot or a bot locale. You can only specify one
        # type of resource to export.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ExportResourceSpecification

        # An password to use to encrypt the exported archive. Using a password is optional, but you should
        # encrypt the archive to protect the data in transit between Amazon Lex and your local computer.

        @[JSON::Field(key: "filePassword")]
        getter file_password : String?

        def initialize(
          @file_format : String,
          @resource_specification : Types::ExportResourceSpecification,
          @file_password : String? = nil
        )
        end
      end


      struct CreateExportResponse
        include JSON::Serializable

        # The date and time that the request to export a bot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # An identifier for a specific request to create an export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        # The status of the export. When the status is Completed , you can use the DescribeExport operation to
        # get the pre-signed S3 URL link to your exported bot or bot locale.

        @[JSON::Field(key: "exportStatus")]
        getter export_status : String?

        # The file format used for the bot or bot locale definition files.

        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # A description of the type of resource that was exported, either a bot or a bot locale.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ExportResourceSpecification?

        def initialize(
          @creation_date_time : Time? = nil,
          @export_id : String? = nil,
          @export_status : String? = nil,
          @file_format : String? = nil,
          @resource_specification : Types::ExportResourceSpecification? = nil
        )
        end
      end


      struct CreateIntentRequest
        include JSON::Serializable

        # The identifier of the bot associated with this intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with this intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The name of the intent. Intent names must be unique in the locale that contains the intent and
        # cannot match the name of any built-in intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # The identifier of the language and locale where this intent is used. All of the bots, slot types,
        # and slots used by the intent must have the same locale. For more information, see Supported
        # languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # A description of the intent. Use the description to help identify the intent in lists.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies that Amazon Lex invokes the alias Lambda function for each user input. You can invoke this
        # Lambda function to personalize user interaction. For example, suppose that your bot determines that
        # the user's name is John. You Lambda function might retrieve John's information from a backend
        # database and prepopulate some of the values. For example, if you find that John is gluten
        # intolerant, you might set the corresponding intent slot, glutenIntolerant to true . You might find
        # John's phone number and set the corresponding session attribute.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::DialogCodeHookSettings?

        # Specifies that Amazon Lex invokes the alias Lambda function when the intent is ready for
        # fulfillment. You can invoke this function to complete the bot's transaction with the user. For
        # example, in a pizza ordering bot, the Lambda function can look up the closest pizza restaurant to
        # the customer's location and then place an order on the customer's behalf.

        @[JSON::Field(key: "fulfillmentCodeHook")]
        getter fulfillment_code_hook : Types::FulfillmentCodeHookSettings?

        # Configuration settings for the response that is sent to the user at the beginning of a conversation,
        # before eliciting slot values.

        @[JSON::Field(key: "initialResponseSetting")]
        getter initial_response_setting : Types::InitialResponseSetting?

        # A list of contexts that must be active for this intent to be considered by Amazon Lex. When an
        # intent has an input context list, Amazon Lex only considers using the intent in an interaction with
        # the user when the specified contexts are included in the active context list for the session. If the
        # contexts are not active, then Amazon Lex will not use the intent. A context can be automatically
        # activated using the outputContexts property or it can be set at runtime. For example, if there are
        # two intents with different input contexts that respond to the same utterances, only the intent with
        # the active context will respond. An intent may have up to 5 input contexts. If an intent has
        # multiple input contexts, all of the contexts must be active to consider the intent.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # Sets the response that Amazon Lex sends to the user when the intent is closed.

        @[JSON::Field(key: "intentClosingSetting")]
        getter intent_closing_setting : Types::IntentClosingSetting?

        # Provides prompts that Amazon Lex sends to the user to confirm the completion of an intent. If the
        # user answers "no," the settings contain a statement that is sent to the user to end the intent.

        @[JSON::Field(key: "intentConfirmationSetting")]
        getter intent_confirmation_setting : Types::IntentConfirmationSetting?

        # A display name for the intent. If configured, This name will be shown to users during Intent
        # Disambiguation instead of the intent name. Display names should be user-friendly, descriptive and
        # match the intent's purpose to improve user experience during disambiguation.

        @[JSON::Field(key: "intentDisplayName")]
        getter intent_display_name : String?

        # Configuration information required to use the AMAZON.KendraSearchIntent intent to connect to an
        # Amazon Kendra index. The AMAZON.KendraSearchIntent intent is called when Amazon Lex can't determine
        # another intent to invoke.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # A lists of contexts that the intent activates when it is fulfilled. You can use an output context to
        # indicate the intents that Amazon Lex should consider for the next turn of the conversation with a
        # customer. When you use the outputContextsList property, all of the contexts specified in the list
        # are activated when the intent is fulfilled. You can set up to 10 output contexts. You can also set
        # the number of conversation turns that the context should be active, or the length of time that the
        # context should be active.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # A unique identifier for the built-in intent to base this intent on.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # Qinconnect intent configuration details for the create intent request.

        @[JSON::Field(key: "qInConnectIntentConfiguration")]
        getter q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration?

        # Specifies the configuration of the built-in Amazon.QnAIntent . The AMAZON.QnAIntent intent is called
        # when Amazon Lex can't determine another intent to invoke. If you specify this field, you can't
        # specify the kendraConfiguration field.

        @[JSON::Field(key: "qnAIntentConfiguration")]
        getter qn_a_intent_configuration : Types::QnAIntentConfiguration?

        # An array of strings that a user might say to signal the intent. For example, "I want a pizza", or "I
        # want a {PizzaSize} pizza". In an utterance, slot names are enclosed in curly braces ("{", "}") to
        # indicate where they should be displayed in the utterance shown to the user..

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_name : String,
          @locale_id : String,
          @description : String? = nil,
          @dialog_code_hook : Types::DialogCodeHookSettings? = nil,
          @fulfillment_code_hook : Types::FulfillmentCodeHookSettings? = nil,
          @initial_response_setting : Types::InitialResponseSetting? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @intent_closing_setting : Types::IntentClosingSetting? = nil,
          @intent_confirmation_setting : Types::IntentConfirmationSetting? = nil,
          @intent_display_name : String? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration? = nil,
          @qn_a_intent_configuration : Types::QnAIntentConfiguration? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil
        )
        end
      end


      struct CreateIntentResponse
        include JSON::Serializable

        # The identifier of the bot associated with the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with the intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the intent was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description specified for the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The dialog Lambda function specified for the intent.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::DialogCodeHookSettings?

        # The fulfillment Lambda function specified for the intent.

        @[JSON::Field(key: "fulfillmentCodeHook")]
        getter fulfillment_code_hook : Types::FulfillmentCodeHookSettings?

        # Configuration settings for the response that is sent to the user at the beginning of a conversation,
        # before eliciting slot values.

        @[JSON::Field(key: "initialResponseSetting")]
        getter initial_response_setting : Types::InitialResponseSetting?

        # The list of input contexts specified for the intent.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # The closing setting specified for the intent.

        @[JSON::Field(key: "intentClosingSetting")]
        getter intent_closing_setting : Types::IntentClosingSetting?

        # The confirmation setting specified for the intent.

        @[JSON::Field(key: "intentConfirmationSetting")]
        getter intent_confirmation_setting : Types::IntentConfirmationSetting?

        # The display name specified for the intent.

        @[JSON::Field(key: "intentDisplayName")]
        getter intent_display_name : String?

        # A unique identifier for the intent.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The name specified for the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # Configuration for searching a Amazon Kendra index specified for the intent.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # The locale that the intent is specified to use.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The list of output contexts specified for the intent.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # The signature of the parent intent specified for the intent.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # Qinconnect intent configuration details for the create intent response.

        @[JSON::Field(key: "qInConnectIntentConfiguration")]
        getter q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration?

        # Details about the the configuration of the built-in Amazon.QnAIntent .

        @[JSON::Field(key: "qnAIntentConfiguration")]
        getter qn_a_intent_configuration : Types::QnAIntentConfiguration?

        # The sample utterances specified for the intent.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @dialog_code_hook : Types::DialogCodeHookSettings? = nil,
          @fulfillment_code_hook : Types::FulfillmentCodeHookSettings? = nil,
          @initial_response_setting : Types::InitialResponseSetting? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @intent_closing_setting : Types::IntentClosingSetting? = nil,
          @intent_confirmation_setting : Types::IntentConfirmationSetting? = nil,
          @intent_display_name : String? = nil,
          @intent_id : String? = nil,
          @intent_name : String? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @locale_id : String? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration? = nil,
          @qn_a_intent_configuration : Types::QnAIntentConfiguration? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil
        )
        end
      end


      struct CreateResourcePolicyRequest
        include JSON::Serializable

        # A resource policy to add to the resource. The policy is a JSON structure that contains one or more
        # statements that define the policy. The policy must follow the IAM syntax. For more information about
        # the contents of a JSON policy document, see IAM JSON policy reference . If the policy isn't valid,
        # Amazon Lex returns a validation exception.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end


      struct CreateResourcePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy was attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The current revision of the resource policy. Use the revision ID to make sure that you are updating
        # the most current version of a resource policy when you add a policy statement to a resource, delete
        # a resource, or update a resource.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @resource_arn : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct CreateResourcePolicyStatementRequest
        include JSON::Serializable

        # The Amazon Lex action that this policy either allows or denies. The action must apply to the
        # resource type of the specified ARN. For more information, see Actions, resources, and condition keys
        # for Amazon Lex V2 .

        @[JSON::Field(key: "action")]
        getter action : Array(String)

        # Determines whether the statement allows or denies access to the resource.

        @[JSON::Field(key: "effect")]
        getter effect : String

        # An IAM principal, such as an IAM user, IAM role, or Amazon Web Services services that is allowed or
        # denied access to a resource. For more information, see Amazon Web Services JSON policy elements:
        # Principal .

        @[JSON::Field(key: "principal")]
        getter principal : Array(Types::Principal)

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name of the statement. The ID is the same as the Sid IAM property. The statement name must be
        # unique within the policy. For more information, see IAM JSON policy elements: Sid .

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        # Specifies a condition when the policy is in effect. If the principal of the policy is a service
        # principal, you must provide two condition blocks, one with a SourceAccount global condition key and
        # one with a SourceArn global condition key. For more information, see IAM JSON policy elements:
        # Condition .

        @[JSON::Field(key: "condition")]
        getter condition : Hash(String, Hash(String, String))?

        # The identifier of the revision of the policy to edit. If this revision ID doesn't match the current
        # revision ID, Amazon Lex throws an exception. If you don't specify a revision, Amazon Lex overwrites
        # the contents of the policy with the new values.

        @[JSON::Field(key: "expectedRevisionId")]
        getter expected_revision_id : String?

        def initialize(
          @action : Array(String),
          @effect : String,
          @principal : Array(Types::Principal),
          @resource_arn : String,
          @statement_id : String,
          @condition : Hash(String, Hash(String, String))? = nil,
          @expected_revision_id : String? = nil
        )
        end
      end


      struct CreateResourcePolicyStatementResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The current revision of the resource policy. Use the revision ID to make sure that you are updating
        # the most current version of a resource policy when you add a policy statement to a resource, delete
        # a resource, or update a resource.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @resource_arn : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct CreateSlotRequest
        include JSON::Serializable

        # The identifier of the bot associated with the slot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the slot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the intent that contains the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The identifier of the language and locale that the slot will be used in. The string must match one
        # of the supported locales. All of the bots, intents, slot types used by the slot must have the same
        # locale. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The name of the slot. Slot names must be unique within the bot that contains the slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String

        # Specifies prompts that Amazon Lex sends to the user to elicit a response that provides the value for
        # the slot.

        @[JSON::Field(key: "valueElicitationSetting")]
        getter value_elicitation_setting : Types::SlotValueElicitationSetting

        # A description of the slot. Use this to help identify the slot in lists.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the slot returns multiple values in one response. Multi-value slots are only
        # available in the en-US locale. If you set this value to true in any other locale, Amazon Lex throws
        # a ValidationException . If the multipleValuesSetting is not set, the default value is false .

        @[JSON::Field(key: "multipleValuesSetting")]
        getter multiple_values_setting : Types::MultipleValuesSetting?

        # Determines how slot values are used in Amazon CloudWatch logs. If the value of the
        # obfuscationSetting parameter is DefaultObfuscation , slot values are obfuscated in the log output.
        # If the value is None , the actual value is present in the log output. The default is to obfuscate
        # values in the CloudWatch logs.

        @[JSON::Field(key: "obfuscationSetting")]
        getter obfuscation_setting : Types::ObfuscationSetting?

        # The unique identifier for the slot type associated with this slot. The slot type determines the
        # values that can be entered into the slot.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # Specifications for the constituent sub slots and the expression for the composite slot.

        @[JSON::Field(key: "subSlotSetting")]
        getter sub_slot_setting : Types::SubSlotSetting?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String,
          @slot_name : String,
          @value_elicitation_setting : Types::SlotValueElicitationSetting,
          @description : String? = nil,
          @multiple_values_setting : Types::MultipleValuesSetting? = nil,
          @obfuscation_setting : Types::ObfuscationSetting? = nil,
          @slot_type_id : String? = nil,
          @sub_slot_setting : Types::SubSlotSetting? = nil
        )
        end
      end


      struct CreateSlotResponse
        include JSON::Serializable

        # The unique identifier of the bot associated with the slot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with the slot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The timestamp of the date and time that the slot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description associated with the slot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the intent associated with the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The language and local specified for the slot.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # Indicates whether the slot returns multiple values in one response.

        @[JSON::Field(key: "multipleValuesSetting")]
        getter multiple_values_setting : Types::MultipleValuesSetting?

        # Indicates whether the slot is configured to obfuscate values in Amazon CloudWatch logs.

        @[JSON::Field(key: "obfuscationSetting")]
        getter obfuscation_setting : Types::ObfuscationSetting?

        # The unique identifier associated with the slot. Use this to identify the slot when you update or
        # delete it.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String?

        # The name specified for the slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String?

        # The unique identifier of the slot type associated with this slot.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # Specifications for the constituent sub slots and the expression for the composite slot.

        @[JSON::Field(key: "subSlotSetting")]
        getter sub_slot_setting : Types::SubSlotSetting?

        # The value elicitation settings specified for the slot.

        @[JSON::Field(key: "valueElicitationSetting")]
        getter value_elicitation_setting : Types::SlotValueElicitationSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @intent_id : String? = nil,
          @locale_id : String? = nil,
          @multiple_values_setting : Types::MultipleValuesSetting? = nil,
          @obfuscation_setting : Types::ObfuscationSetting? = nil,
          @slot_id : String? = nil,
          @slot_name : String? = nil,
          @slot_type_id : String? = nil,
          @sub_slot_setting : Types::SubSlotSetting? = nil,
          @value_elicitation_setting : Types::SlotValueElicitationSetting? = nil
        )
        end
      end


      struct CreateSlotTypeRequest
        include JSON::Serializable

        # The identifier of the bot associated with this slot type.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the bot version associated with this slot type.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale that the slot type will be used in. The string must match
        # one of the supported locales. All of the bots, intents, and slots used by the slot type must have
        # the same locale. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The name for the slot. A slot type name must be unique within the intent.

        @[JSON::Field(key: "slotTypeName")]
        getter slot_type_name : String

        # Specifications for a composite slot type.

        @[JSON::Field(key: "compositeSlotTypeSetting")]
        getter composite_slot_type_setting : Types::CompositeSlotTypeSetting?

        # A description of the slot type. Use the description to help identify the slot type in lists.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Sets the type of external information used to create the slot type.

        @[JSON::Field(key: "externalSourceSetting")]
        getter external_source_setting : Types::ExternalSourceSetting?

        # The built-in slot type used as a parent of this slot type. When you define a parent slot type, the
        # new slot type has the configuration of the parent slot type. Only AMAZON.AlphaNumeric is supported.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # A list of SlotTypeValue objects that defines the values that the slot type can take. Each value can
        # have a list of synonyms, additional values that help train the machine learning model about the
        # values that it resolves for a slot.

        @[JSON::Field(key: "slotTypeValues")]
        getter slot_type_values : Array(Types::SlotTypeValue)?

        # Determines the strategy that Amazon Lex uses to select a value from the list of possible values. The
        # field can be set to one of the following values: ORIGINAL_VALUE - Returns the value entered by the
        # user, if the user value is similar to the slot value. TOP_RESOLUTION - If there is a resolution list
        # for the slot, return the first value in the resolution list. If there is no resolution list, return
        # null. If you don't specify the valueSelectionSetting parameter, the default is ORIGINAL_VALUE .

        @[JSON::Field(key: "valueSelectionSetting")]
        getter value_selection_setting : Types::SlotValueSelectionSetting?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @slot_type_name : String,
          @composite_slot_type_setting : Types::CompositeSlotTypeSetting? = nil,
          @description : String? = nil,
          @external_source_setting : Types::ExternalSourceSetting? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_values : Array(Types::SlotTypeValue)? = nil,
          @value_selection_setting : Types::SlotValueSelectionSetting? = nil
        )
        end
      end


      struct CreateSlotTypeResponse
        include JSON::Serializable

        # The identifier for the bot associated with the slot type.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with the slot type.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Specifications for a composite slot type.

        @[JSON::Field(key: "compositeSlotTypeSetting")]
        getter composite_slot_type_setting : Types::CompositeSlotTypeSetting?

        # A timestamp of the date and time that the slot type was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description specified for the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of external information used to create the slot type.

        @[JSON::Field(key: "externalSourceSetting")]
        getter external_source_setting : Types::ExternalSourceSetting?

        # The specified language and local specified for the slot type.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The signature of the base slot type specified for the slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # The unique identifier assigned to the slot type. Use this to identify the slot type in the
        # UpdateSlotType and DeleteSlotType operations.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # The name specified for the slot type.

        @[JSON::Field(key: "slotTypeName")]
        getter slot_type_name : String?

        # The list of values that the slot type can assume.

        @[JSON::Field(key: "slotTypeValues")]
        getter slot_type_values : Array(Types::SlotTypeValue)?

        # The strategy that Amazon Lex uses to select a value from the list of possible values.

        @[JSON::Field(key: "valueSelectionSetting")]
        getter value_selection_setting : Types::SlotValueSelectionSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @composite_slot_type_setting : Types::CompositeSlotTypeSetting? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @external_source_setting : Types::ExternalSourceSetting? = nil,
          @locale_id : String? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_id : String? = nil,
          @slot_type_name : String? = nil,
          @slot_type_values : Array(Types::SlotTypeValue)? = nil,
          @value_selection_setting : Types::SlotValueSelectionSetting? = nil
        )
        end
      end


      struct CreateTestSetDiscrepancyReportRequest
        include JSON::Serializable

        # The target bot for the test set discrepancy report.

        @[JSON::Field(key: "target")]
        getter target : Types::TestSetDiscrepancyReportResourceTarget

        # The test set Id for the test set discrepancy report.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String

        def initialize(
          @target : Types::TestSetDiscrepancyReportResourceTarget,
          @test_set_id : String
        )
        end
      end


      struct CreateTestSetDiscrepancyReportResponse
        include JSON::Serializable

        # The creation date and time for the test set discrepancy report.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The target bot for the test set discrepancy report.

        @[JSON::Field(key: "target")]
        getter target : Types::TestSetDiscrepancyReportResourceTarget?

        # The unique identifier of the test set discrepancy report to describe.

        @[JSON::Field(key: "testSetDiscrepancyReportId")]
        getter test_set_discrepancy_report_id : String?

        # The test set Id for the test set discrepancy report.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @target : Types::TestSetDiscrepancyReportResourceTarget? = nil,
          @test_set_discrepancy_report_id : String? = nil,
          @test_set_id : String? = nil
        )
        end
      end


      struct CreateUploadUrlRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateUploadUrlResponse
        include JSON::Serializable

        # An identifier for a unique import job. Use it when you call the StartImport operation.

        @[JSON::Field(key: "importId")]
        getter import_id : String?

        # A pre-signed S3 write URL. Upload the zip archive file that contains the definition of your bot or
        # bot locale.

        @[JSON::Field(key: "uploadUrl")]
        getter upload_url : String?

        def initialize(
          @import_id : String? = nil,
          @upload_url : String? = nil
        )
        end
      end

      # A custom response string that Amazon Lex sends to your application. You define the content and
      # structure the string.

      struct CustomPayload
        include JSON::Serializable

        # The string that is sent to your application.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # The unique entry identifier for the custom vocabulary items.

      struct CustomVocabularyEntryId
        include JSON::Serializable

        # The unique item identifier for the custom vocabulary items.

        @[JSON::Field(key: "itemId")]
        getter item_id : String

        def initialize(
          @item_id : String
        )
        end
      end

      # Provides the parameters required for exporting a custom vocabulary.

      struct CustomVocabularyExportSpecification
        include JSON::Serializable

        # The identifier of the bot that contains the custom vocabulary to export.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the custom vocabulary to export.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The locale of the bot that contains the custom vocabulary to export.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end

      # Provides the parameters required for importing a custom vocabulary.

      struct CustomVocabularyImportSpecification
        include JSON::Serializable

        # The identifier of the bot to import the custom vocabulary to.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to import the custom vocabulary to.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the local to import the custom vocabulary to. The value must be en_GB .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end

      # The unique custom vocabulary item from the custom vocabulary list.

      struct CustomVocabularyItem
        include JSON::Serializable

        # The unique item identifer for the custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "itemId")]
        getter item_id : String

        # The unique phrase for the custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "phrase")]
        getter phrase : String

        # The DisplayAs value for the custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "displayAs")]
        getter display_as : String?

        # The weight assigned for the custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "weight")]
        getter weight : Int32?

        def initialize(
          @item_id : String,
          @phrase : String,
          @display_as : String? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # Specifies the DTMF input specifications.

      struct DTMFSpecification
        include JSON::Serializable

        # The DTMF character that clears the accumulated DTMF digits and immediately ends the input.

        @[JSON::Field(key: "deletionCharacter")]
        getter deletion_character : String

        # The DTMF character that immediately ends input. If the user does not press this character, the input
        # ends after the end timeout.

        @[JSON::Field(key: "endCharacter")]
        getter end_character : String

        # How long the bot should wait after the last DTMF character input before assuming that the input has
        # concluded.

        @[JSON::Field(key: "endTimeoutMs")]
        getter end_timeout_ms : Int32

        # The maximum number of DTMF digits allowed in an utterance.

        @[JSON::Field(key: "maxLength")]
        getter max_length : Int32

        def initialize(
          @deletion_character : String,
          @end_character : String,
          @end_timeout_ms : Int32,
          @max_length : Int32
        )
        end
      end

      # By default, data stored by Amazon Lex is encrypted. The DataPrivacy structure provides settings that
      # determine how Amazon Lex handles special cases of securing the data for your bot.

      struct DataPrivacy
        include JSON::Serializable

        # For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether
        # your use of Amazon Lex is related to a website, program, or other application that is directed or
        # targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy
        # Protection Act (COPPA) by specifying true or false in the childDirected field. By specifying true in
        # the childDirected field, you confirm that your use of Amazon Lex is related to a website, program,
        # or other application that is directed or targeted, in whole or in part, to children under age 13 and
        # subject to COPPA. By specifying false in the childDirected field, you confirm that your use of
        # Amazon Lex is not related to a website, program, or other application that is directed or targeted,
        # in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default
        # value for the childDirected field that does not accurately reflect whether your use of Amazon Lex is
        # related to a website, program, or other application that is directed or targeted, in whole or in
        # part, to children under age 13 and subject to COPPA. If your use of Amazon Lex relates to a website,
        # program, or other application that is directed in whole or in part, to children under age 13, you
        # must obtain any required verifiable parental consent under COPPA. For information regarding the use
        # of Amazon Lex in connection with websites, programs, or other applications that are directed or
        # targeted, in whole or in part, to children under age 13, see the Amazon Lex FAQ .

        @[JSON::Field(key: "childDirected")]
        getter child_directed : Bool

        def initialize(
          @child_directed : Bool
        )
        end
      end

      # Contains details about the configuration of the knowledge store used for the AMAZON.QnAIntent . You
      # must have already created the knowledge store and indexed the documents within it.

      struct DataSourceConfiguration
        include JSON::Serializable

        # Contains details about the configuration of the Amazon Bedrock knowledge base used for the
        # AMAZON.QnAIntent . To set up a knowledge base, follow the steps at Building a knowledge base .

        @[JSON::Field(key: "bedrockKnowledgeStoreConfiguration")]
        getter bedrock_knowledge_store_configuration : Types::BedrockKnowledgeStoreConfiguration?

        # Contains details about the configuration of the Amazon Kendra index used for the AMAZON.QnAIntent .
        # To create a Amazon Kendra index, follow the steps at Creating an index .

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::QnAKendraConfiguration?

        # Contains details about the configuration of the Amazon OpenSearch Service database used for the
        # AMAZON.QnAIntent . To create a domain, follow the steps at Creating and managing Amazon OpenSearch
        # Service domains .

        @[JSON::Field(key: "opensearchConfiguration")]
        getter opensearch_configuration : Types::OpensearchConfiguration?

        def initialize(
          @bedrock_knowledge_store_configuration : Types::BedrockKnowledgeStoreConfiguration? = nil,
          @kendra_configuration : Types::QnAKendraConfiguration? = nil,
          @opensearch_configuration : Types::OpensearchConfiguration? = nil
        )
        end
      end

      # The object used for specifying the data range that the customer wants Amazon Lex to read through in
      # the input transcripts.

      struct DateRangeFilter
        include JSON::Serializable

        # A timestamp indicating the end date for the date range filter.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # A timestamp indicating the start date for the date range filter.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        def initialize(
          @end_date_time : Time,
          @start_date_time : Time
        )
        end
      end

      # Configuration settings for integrating Deepgram speech-to-text models with Amazon Lex.

      struct DeepgramSpeechModelConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Secrets Manager secret that contains the Deepgram API token.

        @[JSON::Field(key: "apiTokenSecretArn")]
        getter api_token_secret_arn : String

        # The identifier of the Deepgram speech-to-text model to use for processing speech input.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        def initialize(
          @api_token_secret_arn : String,
          @model_id : String? = nil
        )
        end
      end

      # A set of actions that Amazon Lex should run if none of the other conditions are met.

      struct DefaultConditionalBranch
        include JSON::Serializable

        # The next step in the conversation.

        @[JSON::Field(key: "nextStep")]
        getter next_step : Types::DialogState?


        @[JSON::Field(key: "response")]
        getter response : Types::ResponseSpecification?

        def initialize(
          @next_step : Types::DialogState? = nil,
          @response : Types::ResponseSpecification? = nil
        )
        end
      end


      struct DeleteBotAliasRequest
        include JSON::Serializable

        # The unique identifier of the bot alias to delete.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The unique identifier of the bot associated with the alias to delete.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # By default, Amazon Lex checks if any other resource, such as a bot network, is using the bot alias
        # before it is deleted and throws a ResourceInUseException exception if the alias is being used by
        # another resource. Set this parameter to true to skip this check and remove the alias even if it is
        # being used by another resource.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteBotAliasResponse
        include JSON::Serializable

        # The unique identifier of the bot alias to delete.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The current status of the alias. The status is Deleting while the alias is in the process of being
        # deleted. Once the alias is deleted, it will no longer appear in the list of aliases returned by the
        # ListBotAliases operation.

        @[JSON::Field(key: "botAliasStatus")]
        getter bot_alias_status : String?

        # The unique identifier of the bot that contains the alias to delete.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        def initialize(
          @bot_alias_id : String? = nil,
          @bot_alias_status : String? = nil,
          @bot_id : String? = nil
        )
        end
      end


      struct DeleteBotLocaleRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the locale.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the locale.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale that will be deleted. The string must match one of the
        # supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end


      struct DeleteBotLocaleResponse
        include JSON::Serializable

        # The identifier of the bot that contained the deleted locale.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The status of deleting the bot locale. The locale first enters the Deleting status. Once the locale
        # is deleted it no longer appears in the list of locales for the bot.

        @[JSON::Field(key: "botLocaleStatus")]
        getter bot_locale_status : String?

        # The version of the bot that contained the deleted locale.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The language and locale of the deleted locale.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_locale_status : String? = nil,
          @bot_version : String? = nil,
          @locale_id : String? = nil
        )
        end
      end


      struct DeleteBotReplicaRequest
        include JSON::Serializable

        # The unique ID of the replicated bot to be deleted from the secondary region

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The secondary region of the replicated bot that will be deleted.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String

        def initialize(
          @bot_id : String,
          @replica_region : String
        )
        end
      end


      struct DeleteBotReplicaResponse
        include JSON::Serializable

        # The unique bot ID of the replicated bot generated.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The operational status of the replicated bot generated.

        @[JSON::Field(key: "botReplicaStatus")]
        getter bot_replica_status : String?

        # The region of the replicated bot generated.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_replica_status : String? = nil,
          @replica_region : String? = nil
        )
        end
      end


      struct DeleteBotRequest
        include JSON::Serializable

        # The identifier of the bot to delete.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # By default, Amazon Lex checks if any other resource, such as an alias or bot network, is using the
        # bot version before it is deleted and throws a ResourceInUseException exception if the bot is being
        # used by another resource. Set this parameter to true to skip this check and remove the bot even if
        # it is being used by another resource.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @bot_id : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteBotResponse
        include JSON::Serializable

        # The unique identifier of the bot that Amazon Lex is deleting.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The current status of the bot. The status is Deleting while the bot and its associated resources are
        # being deleted.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_status : String? = nil
        )
        end
      end


      struct DeleteBotVersionRequest
        include JSON::Serializable

        # The identifier of the bot that contains the version.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to delete.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # By default, Amazon Lex checks if any other resource, such as an alias or bot network, is using the
        # bot version before it is deleted and throws a ResourceInUseException exception if the version is
        # being used by another resource. Set this parameter to true to skip this check and remove the version
        # even if it is being used by another resource.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteBotVersionResponse
        include JSON::Serializable

        # The identifier of the bot that is being deleted.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The current status of the bot.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # The version of the bot that is being deleted.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_status : String? = nil,
          @bot_version : String? = nil
        )
        end
      end


      struct DeleteCustomVocabularyRequest
        include JSON::Serializable

        # The unique identifier of the bot to remove the custom vocabulary from.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to remove the custom vocabulary from.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The locale identifier for the locale that contains the custom vocabulary to remove.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end


      struct DeleteCustomVocabularyResponse
        include JSON::Serializable

        # The identifier of the bot that the custom vocabulary was removed from.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that the custom vocabulary was removed from.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The status of removing the custom vocabulary.

        @[JSON::Field(key: "customVocabularyStatus")]
        getter custom_vocabulary_status : String?

        # The locale identifier for the locale that the custom vocabulary was removed from.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @custom_vocabulary_status : String? = nil,
          @locale_id : String? = nil
        )
        end
      end


      struct DeleteExportRequest
        include JSON::Serializable

        # The unique identifier of the export to delete.

        @[JSON::Field(key: "exportId")]
        getter export_id : String

        def initialize(
          @export_id : String
        )
        end
      end


      struct DeleteExportResponse
        include JSON::Serializable

        # The unique identifier of the deleted export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        # The current status of the deletion. When the deletion is complete, the export will no longer be
        # returned by the ListExports operation and calls to the DescribeExport operation with the export
        # identifier will fail.

        @[JSON::Field(key: "exportStatus")]
        getter export_status : String?

        def initialize(
          @export_id : String? = nil,
          @export_status : String? = nil
        )
        end
      end


      struct DeleteImportRequest
        include JSON::Serializable

        # The unique identifier of the import to delete.

        @[JSON::Field(key: "importId")]
        getter import_id : String

        def initialize(
          @import_id : String
        )
        end
      end


      struct DeleteImportResponse
        include JSON::Serializable

        # The unique identifier of the deleted import.

        @[JSON::Field(key: "importId")]
        getter import_id : String?

        # The current status of the deletion. When the deletion is complete, the import will no longer be
        # returned by the ListImports operation and calls to the DescribeImport operation with the import
        # identifier will fail.

        @[JSON::Field(key: "importStatus")]
        getter import_status : String?

        def initialize(
          @import_id : String? = nil,
          @import_status : String? = nil
        )
        end
      end


      struct DeleteIntentRequest
        include JSON::Serializable

        # The identifier of the bot associated with the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The unique identifier of the intent to delete.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The identifier of the language and locale where the bot will be deleted. The string must match one
        # of the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String
        )
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that has the resource policy attached.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The identifier of the revision to edit. If this ID doesn't match the current revision number, Amazon
        # Lex returns an exception If you don't specify a revision ID, Amazon Lex will delete the current
        # policy.

        @[JSON::Field(key: "expectedRevisionId")]
        getter expected_revision_id : String?

        def initialize(
          @resource_arn : String,
          @expected_revision_id : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy was deleted from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The current revision of the resource policy. Use the revision ID to make sure that you are updating
        # the most current version of a resource policy when you add a policy statement to a resource, delete
        # a resource, or update a resource.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @resource_arn : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyStatementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name of the statement (SID) to delete from the policy.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        # The identifier of the revision of the policy to delete the statement from. If this revision ID
        # doesn't match the current revision ID, Amazon Lex throws an exception. If you don't specify a
        # revision, Amazon Lex removes the current contents of the statement.

        @[JSON::Field(key: "expectedRevisionId")]
        getter expected_revision_id : String?

        def initialize(
          @resource_arn : String,
          @statement_id : String,
          @expected_revision_id : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyStatementResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy statement was
        # removed from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The current revision of the resource policy. Use the revision ID to make sure that you are updating
        # the most current version of a resource policy when you add a policy statement to a resource, delete
        # a resource, or update a resource.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @resource_arn : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct DeleteSlotRequest
        include JSON::Serializable

        # The identifier of the bot associated with the slot to delete.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the slot to delete.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the intent associated with the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The identifier of the language and locale that the slot will be deleted from. The string must match
        # one of the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the slot to delete.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String,
          @slot_id : String
        )
        end
      end


      struct DeleteSlotTypeRequest
        include JSON::Serializable

        # The identifier of the bot associated with the slot type.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the slot type.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale that the slot type will be deleted from. The string must
        # match one of the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the slot type to delete.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String

        # By default, the DeleteSlotType operations throws a ResourceInUseException exception if you try to
        # delete a slot type used by a slot. Set the skipResourceInUseCheck parameter to true to skip this
        # check and remove the slot type even if a slot uses it.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @slot_type_id : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteTestSetRequest
        include JSON::Serializable

        # The test set Id of the test set to be deleted.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String

        def initialize(
          @test_set_id : String
        )
        end
      end


      struct DeleteUtterancesRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the utterances.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the language and locale where the utterances were collected. The string must match
        # one of the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The unique identifier of the session with the user. The ID is returned in the response from the
        # RecognizeText and RecognizeUtterance operations.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @bot_id : String,
          @locale_id : String? = nil,
          @session_id : String? = nil
        )
        end
      end


      struct DeleteUtterancesResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeBotAliasRequest
        include JSON::Serializable

        # The identifier of the bot alias to describe.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The identifier of the bot associated with the bot alias to describe.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        def initialize(
          @bot_alias_id : String,
          @bot_id : String
        )
        end
      end


      struct DescribeBotAliasResponse
        include JSON::Serializable

        # A list of events that affect a bot alias. For example, an event is recorded when the version that
        # the alias points to changes.

        @[JSON::Field(key: "botAliasHistoryEvents")]
        getter bot_alias_history_events : Array(Types::BotAliasHistoryEvent)?

        # The identifier of the bot alias.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The locale settings that are unique to the alias.

        @[JSON::Field(key: "botAliasLocaleSettings")]
        getter bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)?

        # The name of the bot alias.

        @[JSON::Field(key: "botAliasName")]
        getter bot_alias_name : String?

        # The current status of the alias. When the alias is Available , the alias is ready for use with your
        # bot.

        @[JSON::Field(key: "botAliasStatus")]
        getter bot_alias_status : String?

        # The identifier of the bot associated with the bot alias.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with the bot alias.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Specifics of how Amazon Lex logs text and audio conversations with the bot associated with the
        # alias.

        @[JSON::Field(key: "conversationLogSettings")]
        getter conversation_log_settings : Types::ConversationLogSettings?

        # A timestamp of the date and time that the alias was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the bot alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A timestamp of the date and time that the alias was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # A list of the networks to which the bot alias you described belongs.

        @[JSON::Field(key: "parentBotNetworks")]
        getter parent_bot_networks : Array(Types::ParentBotNetwork)?


        @[JSON::Field(key: "sentimentAnalysisSettings")]
        getter sentiment_analysis_settings : Types::SentimentAnalysisSettings?

        def initialize(
          @bot_alias_history_events : Array(Types::BotAliasHistoryEvent)? = nil,
          @bot_alias_id : String? = nil,
          @bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)? = nil,
          @bot_alias_name : String? = nil,
          @bot_alias_status : String? = nil,
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @conversation_log_settings : Types::ConversationLogSettings? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @parent_bot_networks : Array(Types::ParentBotNetwork)? = nil,
          @sentiment_analysis_settings : Types::SentimentAnalysisSettings? = nil
        )
        end
      end


      struct DescribeBotLocaleRequest
        include JSON::Serializable

        # The identifier of the bot associated with the locale.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the locale.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The unique identifier of the locale to describe. The string must match one of the supported locales.
        # For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end


      struct DescribeBotLocaleResponse
        include JSON::Serializable

        # The identifier of the bot associated with the locale.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # History of changes, such as when a locale is used in an alias, that have taken place for the locale.

        @[JSON::Field(key: "botLocaleHistoryEvents")]
        getter bot_locale_history_events : Array(Types::BotLocaleHistoryEvent)?

        # The status of the bot. If the status is Failed , the reasons for the failure are listed in the
        # failureReasons field.

        @[JSON::Field(key: "botLocaleStatus")]
        getter bot_locale_status : String?

        # The version of the bot associated with the locale.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The date and time that the locale was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the locale.

        @[JSON::Field(key: "description")]
        getter description : String?

        # if botLocaleStatus is Failed , Amazon Lex explains why it failed to build the bot.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # Contains settings for Amazon Bedrock's generative AI features for your bot locale.

        @[JSON::Field(key: "generativeAISettings")]
        getter generative_ai_settings : Types::GenerativeAISettings?

        # The number of intents defined for the locale.

        @[JSON::Field(key: "intentsCount")]
        getter intents_count : Int32?

        # The date and time that the locale was last submitted for building.

        @[JSON::Field(key: "lastBuildSubmittedDateTime")]
        getter last_build_submitted_date_time : Time?

        # The date and time that the locale was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The unique identifier of the described locale.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The name of the locale.

        @[JSON::Field(key: "localeName")]
        getter locale_name : String?

        # The confidence threshold where Amazon Lex inserts the AMAZON.FallbackIntent and
        # AMAZON.KendraSearchIntent intents in the list of possible intents for an utterance.

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64?

        # Recommended actions to take to resolve an error in the failureReasons field.

        @[JSON::Field(key: "recommendedActions")]
        getter recommended_actions : Array(String)?

        # The number of slot types defined for the locale.

        @[JSON::Field(key: "slotTypesCount")]
        getter slot_types_count : Int32?

        # The sensitivity level for voice activity detection (VAD) configured for the bot locale.

        @[JSON::Field(key: "speechDetectionSensitivity")]
        getter speech_detection_sensitivity : String?

        # The speech-to-text settings configured for the bot locale.

        @[JSON::Field(key: "speechRecognitionSettings")]
        getter speech_recognition_settings : Types::SpeechRecognitionSettings?

        # The unified speech settings configured for the bot locale.

        @[JSON::Field(key: "unifiedSpeechSettings")]
        getter unified_speech_settings : Types::UnifiedSpeechSettings?

        # The Amazon Polly voice Amazon Lex uses for voice interaction with the user.

        @[JSON::Field(key: "voiceSettings")]
        getter voice_settings : Types::VoiceSettings?

        def initialize(
          @bot_id : String? = nil,
          @bot_locale_history_events : Array(Types::BotLocaleHistoryEvent)? = nil,
          @bot_locale_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @generative_ai_settings : Types::GenerativeAISettings? = nil,
          @intents_count : Int32? = nil,
          @last_build_submitted_date_time : Time? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @locale_name : String? = nil,
          @nlu_intent_confidence_threshold : Float64? = nil,
          @recommended_actions : Array(String)? = nil,
          @slot_types_count : Int32? = nil,
          @speech_detection_sensitivity : String? = nil,
          @speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
          @unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
          @voice_settings : Types::VoiceSettings? = nil
        )
        end
      end


      struct DescribeBotRecommendationRequest
        include JSON::Serializable

        # The unique identifier of the bot associated with the bot recommendation.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the bot recommendation to describe.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String

        # The version of the bot associated with the bot recommendation.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the bot recommendation to describe. The string must
        # match one of the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_recommendation_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end


      struct DescribeBotRecommendationResponse
        include JSON::Serializable

        # The identifier of the bot associated with the bot recommendation.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the bot recommendation being described.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String?

        # The object representing the URL of the bot definition, the URL of the associated transcript and a
        # statistical summary of the bot recommendation results.

        @[JSON::Field(key: "botRecommendationResults")]
        getter bot_recommendation_results : Types::BotRecommendationResults?

        # The status of the bot recommendation. If the status is Failed, then the reasons for the failure are
        # listed in the failureReasons field.

        @[JSON::Field(key: "botRecommendationStatus")]
        getter bot_recommendation_status : String?

        # The version of the bot associated with the bot recommendation.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The date and time that the bot recommendation was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The object representing the passwords that were used to encrypt the data related to the bot
        # recommendation results, as well as the KMS key ARN used to encrypt the associated metadata.

        @[JSON::Field(key: "encryptionSetting")]
        getter encryption_setting : Types::EncryptionSetting?

        # If botRecommendationStatus is Failed, Amazon Lex explains why.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The date and time that the bot recommendation was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The identifier of the language and locale of the bot recommendation to describe.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The object representing the Amazon S3 bucket containing the transcript, as well as the associated
        # metadata.

        @[JSON::Field(key: "transcriptSourceSetting")]
        getter transcript_source_setting : Types::TranscriptSourceSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_recommendation_id : String? = nil,
          @bot_recommendation_results : Types::BotRecommendationResults? = nil,
          @bot_recommendation_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @encryption_setting : Types::EncryptionSetting? = nil,
          @failure_reasons : Array(String)? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @transcript_source_setting : Types::TranscriptSourceSetting? = nil
        )
        end
      end


      struct DescribeBotReplicaRequest
        include JSON::Serializable

        # The request for the unique bot ID of the replicated bot being monitored.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The request for the region of the replicated bot being monitored.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String

        def initialize(
          @bot_id : String,
          @replica_region : String
        )
        end
      end


      struct DescribeBotReplicaResponse
        include JSON::Serializable

        # The unique bot ID of the replicated bot being monitored.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The operational status of the replicated bot being monitored.

        @[JSON::Field(key: "botReplicaStatus")]
        getter bot_replica_status : String?

        # The creation date and time of the replicated bot being monitored.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The failure reasons the bot being monitored failed to replicate.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The region of the replicated bot being monitored.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String?

        # The source region of the replicated bot being monitored.

        @[JSON::Field(key: "sourceRegion")]
        getter source_region : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_replica_status : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil,
          @replica_region : String? = nil,
          @source_region : String? = nil
        )
        end
      end


      struct DescribeBotRequest
        include JSON::Serializable

        # The unique identifier of the bot to describe.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        def initialize(
          @bot_id : String
        )
        end
      end


      struct DescribeBotResourceGenerationRequest
        include JSON::Serializable

        # The unique identifier of the bot for which to return the generation details.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot for which to return the generation details.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The unique identifier of the generation request for which to return the generation details.

        @[JSON::Field(key: "generationId")]
        getter generation_id : String

        # The locale of the bot for which to return the generation details.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @generation_id : String,
          @locale_id : String
        )
        end
      end


      struct DescribeBotResourceGenerationResponse
        include JSON::Serializable

        # The unique identifier of the bot for which the generation request was made.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot for which the generation request was made.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The date and time at which the item was generated.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # A list of reasons why the generation of bot resources through natural language description failed.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The Amazon S3 location of the generated bot locale configuration.

        @[JSON::Field(key: "generatedBotLocaleUrl")]
        getter generated_bot_locale_url : String?

        # The generation ID for which to return the generation details.

        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # The prompt used in the generation request.

        @[JSON::Field(key: "generationInputPrompt")]
        getter generation_input_prompt : String?

        # The status of the generation request.

        @[JSON::Field(key: "generationStatus")]
        getter generation_status : String?

        # The date and time at which the generated item was updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The locale of the bot for which the generation request was made.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The ARN of the model used to generate the bot resources.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil,
          @generated_bot_locale_url : String? = nil,
          @generation_id : String? = nil,
          @generation_input_prompt : String? = nil,
          @generation_status : String? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @model_arn : String? = nil
        )
        end
      end


      struct DescribeBotResponse
        include JSON::Serializable

        # The unique identifier of the bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The list of bots in the network that was described.

        @[JSON::Field(key: "botMembers")]
        getter bot_members : Array(Types::BotMember)?

        # The name of the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The current status of the bot. When the status is Available the bot is ready to be used in
        # conversations with users.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # The type of the bot that was described.

        @[JSON::Field(key: "botType")]
        getter bot_type : String?

        # A timestamp of the date and time that the bot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # Settings for managing data privacy of the bot and its conversations with users.

        @[JSON::Field(key: "dataPrivacy")]
        getter data_privacy : Types::DataPrivacy?

        # The description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains the configuration for error logging that specifies where and how bot errors are recorded,
        # including destinations like CloudWatch Logs.

        @[JSON::Field(key: "errorLogSettings")]
        getter error_log_settings : Types::ErrorLogSettings?

        # If the botStatus is Failed , this contains a list of reasons that the bot couldn't be built.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The maximum time in seconds that Amazon Lex retains the data gathered in a conversation.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # A timestamp of the date and time that the bot was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The Amazon Resource Name (ARN) of an IAM role that has permission to access the bot.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_members : Array(Types::BotMember)? = nil,
          @bot_name : String? = nil,
          @bot_status : String? = nil,
          @bot_type : String? = nil,
          @creation_date_time : Time? = nil,
          @data_privacy : Types::DataPrivacy? = nil,
          @description : String? = nil,
          @error_log_settings : Types::ErrorLogSettings? = nil,
          @failure_reasons : Array(String)? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @last_updated_date_time : Time? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct DescribeBotVersionRequest
        include JSON::Serializable

        # The identifier of the bot containing the version to return metadata for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to return metadata for.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        def initialize(
          @bot_id : String,
          @bot_version : String
        )
        end
      end


      struct DescribeBotVersionResponse
        include JSON::Serializable

        # The identifier of the bot that contains the version.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The members of bot network in the version that was described.

        @[JSON::Field(key: "botMembers")]
        getter bot_members : Array(Types::BotMember)?

        # The name of the bot that contains the version.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The current status of the bot. When the status is Available , the bot version is ready for use.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # The type of the bot in the version that was described.

        @[JSON::Field(key: "botType")]
        getter bot_type : String?

        # The version of the bot that was described.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the bot version was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # Data privacy settings for the bot version.

        @[JSON::Field(key: "dataPrivacy")]
        getter data_privacy : Types::DataPrivacy?

        # The description specified for the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If the botStatus is Failed , this contains a list of reasons that the version couldn't be built.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The number of seconds that a session with the bot remains active before it is discarded by Amazon
        # Lex.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # A list of the networks to which the bot version you described belongs.

        @[JSON::Field(key: "parentBotNetworks")]
        getter parent_bot_networks : Array(Types::ParentBotNetwork)?

        # The Amazon Resource Name (ARN) of an IAM role that has permission to access the bot version.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_members : Array(Types::BotMember)? = nil,
          @bot_name : String? = nil,
          @bot_status : String? = nil,
          @bot_type : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @data_privacy : Types::DataPrivacy? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @parent_bot_networks : Array(Types::ParentBotNetwork)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct DescribeCustomVocabularyMetadataRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The bot version of the bot to return metadata for.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The locale to return the custom vocabulary information for. The locale must be en_GB .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end


      struct DescribeCustomVocabularyMetadataResponse
        include JSON::Serializable

        # The identifier of the bot that contains the custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that contains the custom vocabulary to describe.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The date and time that the custom vocabulary was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The status of the custom vocabulary. If the status is Ready the custom vocabulary is ready to use.

        @[JSON::Field(key: "customVocabularyStatus")]
        getter custom_vocabulary_status : String?

        # The date and time that the custom vocabulary was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The locale that contains the custom vocabulary to describe.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @custom_vocabulary_status : String? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil
        )
        end
      end


      struct DescribeExportRequest
        include JSON::Serializable

        # The unique identifier of the export to describe.

        @[JSON::Field(key: "exportId")]
        getter export_id : String

        def initialize(
          @export_id : String
        )
        end
      end


      struct DescribeExportResponse
        include JSON::Serializable

        # The date and time that the export was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # A pre-signed S3 URL that points to the bot or bot locale archive. The URL is only available for 5
        # minutes after calling the DescribeExport operation.

        @[JSON::Field(key: "downloadUrl")]
        getter download_url : String?

        # The unique identifier of the described export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        # The status of the export. When the status is Complete the export archive file is available for
        # download.

        @[JSON::Field(key: "exportStatus")]
        getter export_status : String?

        # If the exportStatus is failed, contains one or more reasons why the export could not be completed.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The file format used in the files that describe the resource.

        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # The last date and time that the export was updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The bot, bot ID, and optional locale ID of the exported bot or bot locale.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ExportResourceSpecification?

        def initialize(
          @creation_date_time : Time? = nil,
          @download_url : String? = nil,
          @export_id : String? = nil,
          @export_status : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @file_format : String? = nil,
          @last_updated_date_time : Time? = nil,
          @resource_specification : Types::ExportResourceSpecification? = nil
        )
        end
      end


      struct DescribeImportRequest
        include JSON::Serializable

        # The unique identifier of the import to describe.

        @[JSON::Field(key: "importId")]
        getter import_id : String

        def initialize(
          @import_id : String
        )
        end
      end


      struct DescribeImportResponse
        include JSON::Serializable

        # The date and time that the import was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # If the importStatus field is Failed , this provides one or more reasons for the failure.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The unique identifier of the described import.

        @[JSON::Field(key: "importId")]
        getter import_id : String?

        # The status of the import process. When the status is Completed the resource is imported and ready
        # for use.

        @[JSON::Field(key: "importStatus")]
        getter import_status : String?

        # The unique identifier that Amazon Lex assigned to the resource created by the import.

        @[JSON::Field(key: "importedResourceId")]
        getter imported_resource_id : String?

        # The name of the imported resource.

        @[JSON::Field(key: "importedResourceName")]
        getter imported_resource_name : String?

        # The date and time that the import was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The strategy used when there was a name conflict between the imported resource and an existing
        # resource. When the merge strategy is FailOnConflict existing resources are not overwritten and the
        # import fails.

        @[JSON::Field(key: "mergeStrategy")]
        getter merge_strategy : String?

        # The specifications of the imported bot, bot locale, or custom vocabulary.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ImportResourceSpecification?

        def initialize(
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil,
          @import_id : String? = nil,
          @import_status : String? = nil,
          @imported_resource_id : String? = nil,
          @imported_resource_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @merge_strategy : String? = nil,
          @resource_specification : Types::ImportResourceSpecification? = nil
        )
        end
      end


      struct DescribeIntentRequest
        include JSON::Serializable

        # The identifier of the bot associated with the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the intent to describe.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The identifier of the language and locale of the intent to describe. The string must match one of
        # the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String
        )
        end
      end


      struct DescribeIntentResponse
        include JSON::Serializable

        # The identifier of the bot associated with the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with the intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the intent was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Lambda function called during each turn of a conversation with the intent.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::DialogCodeHookSettings?

        # The Lambda function called when the intent is complete and ready for fulfillment.

        @[JSON::Field(key: "fulfillmentCodeHook")]
        getter fulfillment_code_hook : Types::FulfillmentCodeHookSettings?

        # Configuration setting for a response sent to the user before Amazon Lex starts eliciting slots.

        @[JSON::Field(key: "initialResponseSetting")]
        getter initial_response_setting : Types::InitialResponseSetting?

        # A list of contexts that must be active for the intent to be considered for sending to the user.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # The response that Amazon Lex sends to when the intent is closed.

        @[JSON::Field(key: "intentClosingSetting")]
        getter intent_closing_setting : Types::IntentClosingSetting?

        # Prompts that Amazon Lex sends to the user to confirm completion of an intent.

        @[JSON::Field(key: "intentConfirmationSetting")]
        getter intent_confirmation_setting : Types::IntentConfirmationSetting?

        # The display name specified for the intent.

        @[JSON::Field(key: "intentDisplayName")]
        getter intent_display_name : String?

        # The unique identifier assigned to the intent when it was created.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The name specified for the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # Configuration information required to use the AMAZON.KendraSearchIntent intent.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # A timestamp of the date and time that the intent was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The language and locale specified for the intent.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A list of contexts that are activated when the intent is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # The identifier of the built-in intent that this intent is derived from, if any.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # Qinconnect intent configuration details for the describe intent response.

        @[JSON::Field(key: "qInConnectIntentConfiguration")]
        getter q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration?

        # Details about the configuration of the built-in Amazon.QnAIntent .

        @[JSON::Field(key: "qnAIntentConfiguration")]
        getter qn_a_intent_configuration : Types::QnAIntentConfiguration?

        # User utterances that trigger this intent.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?

        # The list that determines the priority that slots should be elicited from the user.

        @[JSON::Field(key: "slotPriorities")]
        getter slot_priorities : Array(Types::SlotPriority)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @dialog_code_hook : Types::DialogCodeHookSettings? = nil,
          @fulfillment_code_hook : Types::FulfillmentCodeHookSettings? = nil,
          @initial_response_setting : Types::InitialResponseSetting? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @intent_closing_setting : Types::IntentClosingSetting? = nil,
          @intent_confirmation_setting : Types::IntentConfirmationSetting? = nil,
          @intent_display_name : String? = nil,
          @intent_id : String? = nil,
          @intent_name : String? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration? = nil,
          @qn_a_intent_configuration : Types::QnAIntentConfiguration? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil,
          @slot_priorities : Array(Types::SlotPriority)? = nil
        )
        end
      end


      struct DescribeResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DescribeResourcePolicyResponse
        include JSON::Serializable

        # The JSON structure that contains the resource policy. For more information about the contents of a
        # JSON policy document, see IAM JSON policy reference .

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The current revision of the resource policy. Use the revision ID to make sure that you are updating
        # the most current version of a resource policy when you add a policy statement to a resource, delete
        # a resource, or update a resource.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct DescribeSlotRequest
        include JSON::Serializable

        # The identifier of the bot associated with the slot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the slot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the intent that contains the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The identifier of the language and locale of the slot to describe. The string must match one of the
        # supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The unique identifier for the slot.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String,
          @slot_id : String
        )
        end
      end


      struct DescribeSlotResponse
        include JSON::Serializable

        # The identifier of the bot associated with the slot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with the slot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the slot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description specified for the slot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the intent associated with the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # A timestamp of the date and time that the slot was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The language and locale specified for the slot.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # Indicates whether the slot accepts multiple values in a single utterance. If the
        # multipleValuesSetting is not set, the default value is false .

        @[JSON::Field(key: "multipleValuesSetting")]
        getter multiple_values_setting : Types::MultipleValuesSetting?

        # Whether slot values are shown in Amazon CloudWatch logs. If the value is None , the actual value of
        # the slot is shown in logs.

        @[JSON::Field(key: "obfuscationSetting")]
        getter obfuscation_setting : Types::ObfuscationSetting?

        # The unique identifier generated for the slot.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String?

        # The name specified for the slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String?

        # The identifier of the slot type that determines the values entered into the slot.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # Specifications for the constituent sub slots and the expression for the composite slot.

        @[JSON::Field(key: "subSlotSetting")]
        getter sub_slot_setting : Types::SubSlotSetting?

        # Prompts that Amazon Lex uses to elicit a value for the slot.

        @[JSON::Field(key: "valueElicitationSetting")]
        getter value_elicitation_setting : Types::SlotValueElicitationSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @intent_id : String? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @multiple_values_setting : Types::MultipleValuesSetting? = nil,
          @obfuscation_setting : Types::ObfuscationSetting? = nil,
          @slot_id : String? = nil,
          @slot_name : String? = nil,
          @slot_type_id : String? = nil,
          @sub_slot_setting : Types::SubSlotSetting? = nil,
          @value_elicitation_setting : Types::SlotValueElicitationSetting? = nil
        )
        end
      end


      struct DescribeSlotTypeRequest
        include JSON::Serializable

        # The identifier of the bot associated with the slot type.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot associated with the slot type.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the slot type to describe. The string must match one of
        # the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the slot type.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @slot_type_id : String
        )
        end
      end


      struct DescribeSlotTypeResponse
        include JSON::Serializable

        # The identifier of the bot associated with the slot type.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot associated with the slot type.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Specifications for a composite slot type.

        @[JSON::Field(key: "compositeSlotTypeSetting")]
        getter composite_slot_type_setting : Types::CompositeSlotTypeSetting?

        # A timestamp of the date and time that the slot type was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description specified for the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "externalSourceSetting")]
        getter external_source_setting : Types::ExternalSourceSetting?

        # A timestamp of the date and time that the slot type was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The language and locale specified for the slot type.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The built in slot type used as a parent to this slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # The unique identifier for the slot type.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # The name specified for the slot type.

        @[JSON::Field(key: "slotTypeName")]
        getter slot_type_name : String?

        # The values that the slot type can take. Includes any synonyms for the slot type values.

        @[JSON::Field(key: "slotTypeValues")]
        getter slot_type_values : Array(Types::SlotTypeValue)?

        # The strategy that Amazon Lex uses to choose a value from a list of possible values.

        @[JSON::Field(key: "valueSelectionSetting")]
        getter value_selection_setting : Types::SlotValueSelectionSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @composite_slot_type_setting : Types::CompositeSlotTypeSetting? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @external_source_setting : Types::ExternalSourceSetting? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_id : String? = nil,
          @slot_type_name : String? = nil,
          @slot_type_values : Array(Types::SlotTypeValue)? = nil,
          @value_selection_setting : Types::SlotValueSelectionSetting? = nil
        )
        end
      end


      struct DescribeTestExecutionRequest
        include JSON::Serializable

        # The execution Id of the test set execution.

        @[JSON::Field(key: "testExecutionId")]
        getter test_execution_id : String

        def initialize(
          @test_execution_id : String
        )
        end
      end


      struct DescribeTestExecutionResponse
        include JSON::Serializable

        # Indicates whether we use streaming or non-streaming APIs are used for the test set execution. For
        # streaming, StartConversation Amazon Lex Runtime API is used. Whereas for non-streaming,
        # RecognizeUtterance and RecognizeText Amazon Lex Runtime API is used.

        @[JSON::Field(key: "apiMode")]
        getter api_mode : String?

        # The execution creation date and time for the test set execution.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # Reasons for the failure of the test set execution.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The date and time of the last update for the execution.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The target bot for the test set execution details.

        @[JSON::Field(key: "target")]
        getter target : Types::TestExecutionTarget?

        # The execution Id for the test set execution.

        @[JSON::Field(key: "testExecutionId")]
        getter test_execution_id : String?

        # Indicates whether test set is audio or text.

        @[JSON::Field(key: "testExecutionModality")]
        getter test_execution_modality : String?

        # The test execution status for the test execution.

        @[JSON::Field(key: "testExecutionStatus")]
        getter test_execution_status : String?

        # The test set Id for the test set execution.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        # The test set name of the test set execution.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String?

        def initialize(
          @api_mode : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil,
          @last_updated_date_time : Time? = nil,
          @target : Types::TestExecutionTarget? = nil,
          @test_execution_id : String? = nil,
          @test_execution_modality : String? = nil,
          @test_execution_status : String? = nil,
          @test_set_id : String? = nil,
          @test_set_name : String? = nil
        )
        end
      end


      struct DescribeTestSetDiscrepancyReportRequest
        include JSON::Serializable

        # The unique identifier of the test set discrepancy report.

        @[JSON::Field(key: "testSetDiscrepancyReportId")]
        getter test_set_discrepancy_report_id : String

        def initialize(
          @test_set_discrepancy_report_id : String
        )
        end
      end


      struct DescribeTestSetDiscrepancyReportResponse
        include JSON::Serializable

        # The time and date of creation for the test set discrepancy report.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The failure report for the test set discrepancy report generation action.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The date and time of the last update for the test set discrepancy report.

        @[JSON::Field(key: "lastUpdatedDataTime")]
        getter last_updated_data_time : Time?

        # The target bot location for the test set discrepancy report.

        @[JSON::Field(key: "target")]
        getter target : Types::TestSetDiscrepancyReportResourceTarget?

        # Pre-signed Amazon S3 URL to download the test set discrepancy report.

        @[JSON::Field(key: "testSetDiscrepancyRawOutputUrl")]
        getter test_set_discrepancy_raw_output_url : String?

        # The unique identifier of the test set discrepancy report to describe.

        @[JSON::Field(key: "testSetDiscrepancyReportId")]
        getter test_set_discrepancy_report_id : String?

        # The status for the test set discrepancy report.

        @[JSON::Field(key: "testSetDiscrepancyReportStatus")]
        getter test_set_discrepancy_report_status : String?

        # The top 200 error results from the test set discrepancy report.

        @[JSON::Field(key: "testSetDiscrepancyTopErrors")]
        getter test_set_discrepancy_top_errors : Types::TestSetDiscrepancyErrors?

        # The test set Id for the test set discrepancy report.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @failure_reasons : Array(String)? = nil,
          @last_updated_data_time : Time? = nil,
          @target : Types::TestSetDiscrepancyReportResourceTarget? = nil,
          @test_set_discrepancy_raw_output_url : String? = nil,
          @test_set_discrepancy_report_id : String? = nil,
          @test_set_discrepancy_report_status : String? = nil,
          @test_set_discrepancy_top_errors : Types::TestSetDiscrepancyErrors? = nil,
          @test_set_id : String? = nil
        )
        end
      end


      struct DescribeTestSetGenerationRequest
        include JSON::Serializable

        # The unique identifier of the test set generation.

        @[JSON::Field(key: "testSetGenerationId")]
        getter test_set_generation_id : String

        def initialize(
          @test_set_generation_id : String
        )
        end
      end


      struct DescribeTestSetGenerationResponse
        include JSON::Serializable

        # The creation date and time for the test set generation.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The test set description for the test set generation.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The reasons the test set generation failed.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The data source of the test set used for the test set generation.

        @[JSON::Field(key: "generationDataSource")]
        getter generation_data_source : Types::TestSetGenerationDataSource?

        # The date and time of the last update for the test set generation.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The roleARN of the test set used for the test set generation.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The Amazon S3 storage location for the test set generation.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : Types::TestSetStorageLocation?

        # The unique identifier of the test set generation.

        @[JSON::Field(key: "testSetGenerationId")]
        getter test_set_generation_id : String?

        # The status for the test set generation.

        @[JSON::Field(key: "testSetGenerationStatus")]
        getter test_set_generation_status : String?

        # The unique identifier for the test set created for the generated test set.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        # The test set name for the generated test set.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @generation_data_source : Types::TestSetGenerationDataSource? = nil,
          @last_updated_date_time : Time? = nil,
          @role_arn : String? = nil,
          @storage_location : Types::TestSetStorageLocation? = nil,
          @test_set_generation_id : String? = nil,
          @test_set_generation_status : String? = nil,
          @test_set_id : String? = nil,
          @test_set_name : String? = nil
        )
        end
      end


      struct DescribeTestSetRequest
        include JSON::Serializable

        # The test set Id for the test set request.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String

        def initialize(
          @test_set_id : String
        )
        end
      end


      struct DescribeTestSetResponse
        include JSON::Serializable

        # The creation date and time for the test set data.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the test set.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time for the last update of the test set data.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # Indicates whether the test set is audio or text data.

        @[JSON::Field(key: "modality")]
        getter modality : String?

        # The total number of agent and user turn in the test set.

        @[JSON::Field(key: "numTurns")]
        getter num_turns : Int32?

        # The roleARN used for any operation in the test set to access resources in the Amazon Web Services
        # account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the test set.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon S3 storage location for the test set data.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : Types::TestSetStorageLocation?

        # The test set Id for the test set response.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        # The test set name of the test set.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @modality : String? = nil,
          @num_turns : Int32? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @storage_location : Types::TestSetStorageLocation? = nil,
          @test_set_id : String? = nil,
          @test_set_name : String? = nil
        )
        end
      end

      # Contains specifications for the descriptive bot building feature.

      struct DescriptiveBotBuilderSpecification
        include JSON::Serializable

        # Specifies whether the descriptive bot building feature is activated or not.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # An object containing information about the Amazon Bedrock model used to interpret the prompt used in
        # descriptive bot building.

        @[JSON::Field(key: "bedrockModelSpecification")]
        getter bedrock_model_specification : Types::BedrockModelSpecification?

        def initialize(
          @enabled : Bool,
          @bedrock_model_specification : Types::BedrockModelSpecification? = nil
        )
        end
      end

      # Defines the action that the bot executes at runtime when the conversation reaches this step.

      struct DialogAction
        include JSON::Serializable

        # The action that the bot should execute.

        @[JSON::Field(key: "type")]
        getter type : String

        # If the dialog action is ElicitSlot , defines the slot to elicit from the user.

        @[JSON::Field(key: "slotToElicit")]
        getter slot_to_elicit : String?

        # When true the next message for the intent is not used.

        @[JSON::Field(key: "suppressNextMessage")]
        getter suppress_next_message : Bool?

        def initialize(
          @type : String,
          @slot_to_elicit : String? = nil,
          @suppress_next_message : Bool? = nil
        )
        end
      end

      # Settings that specify the dialog code hook that is called by Amazon Lex at a step of the
      # conversation.

      struct DialogCodeHookInvocationSetting
        include JSON::Serializable

        # Determines whether a dialog code hook is used when the intent is activated.

        @[JSON::Field(key: "active")]
        getter active : Bool

        # Indicates whether a Lambda function should be invoked for the dialog.

        @[JSON::Field(key: "enableCodeHookInvocation")]
        getter enable_code_hook_invocation : Bool

        # Contains the responses and actions that Amazon Lex takes after the Lambda function is complete.

        @[JSON::Field(key: "postCodeHookSpecification")]
        getter post_code_hook_specification : Types::PostDialogCodeHookInvocationSpecification

        # A label that indicates the dialog step from which the dialog code hook is happening.

        @[JSON::Field(key: "invocationLabel")]
        getter invocation_label : String?

        def initialize(
          @active : Bool,
          @enable_code_hook_invocation : Bool,
          @post_code_hook_specification : Types::PostDialogCodeHookInvocationSpecification,
          @invocation_label : String? = nil
        )
        end
      end

      # Settings that determine the Lambda function that Amazon Lex uses for processing user responses.

      struct DialogCodeHookSettings
        include JSON::Serializable

        # Enables the dialog code hook so that it processes user requests.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # The current state of the conversation with the user.

      struct DialogState
        include JSON::Serializable


        @[JSON::Field(key: "dialogAction")]
        getter dialog_action : Types::DialogAction?


        @[JSON::Field(key: "intent")]
        getter intent : Types::IntentOverride?

        # Map of key/value pairs representing session-specific context information. It contains application
        # information passed between Amazon Lex and a client application.

        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        def initialize(
          @dialog_action : Types::DialogAction? = nil,
          @intent : Types::IntentOverride? = nil,
          @session_attributes : Hash(String, String)? = nil
        )
        end
      end

      # Settings that specify the dialog code hook that is called by Amazon Lex between eliciting slot
      # values.

      struct ElicitationCodeHookInvocationSetting
        include JSON::Serializable

        # Indicates whether a Lambda function should be invoked for the dialog.

        @[JSON::Field(key: "enableCodeHookInvocation")]
        getter enable_code_hook_invocation : Bool

        # A label that indicates the dialog step from which the dialog code hook is happening.

        @[JSON::Field(key: "invocationLabel")]
        getter invocation_label : String?

        def initialize(
          @enable_code_hook_invocation : Bool,
          @invocation_label : String? = nil
        )
        end
      end

      # The object representing the passwords that were used to encrypt the data related to the bot
      # recommendation, as well as the KMS key ARN used to encrypt the associated metadata.

      struct EncryptionSetting
        include JSON::Serializable

        # The password used to encrypt the associated transcript file.

        @[JSON::Field(key: "associatedTranscriptsPassword")]
        getter associated_transcripts_password : String?

        # The password used to encrypt the recommended bot recommendation file.

        @[JSON::Field(key: "botLocaleExportPassword")]
        getter bot_locale_export_password : String?

        # The KMS key ARN used to encrypt the metadata associated with the bot recommendation.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @associated_transcripts_password : String? = nil,
          @bot_locale_export_password : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Settings parameters for the error logs, whether it is enabled or disabled.

      struct ErrorLogSettings
        include JSON::Serializable

        # Settings parameters for the error logs, when it is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # Contains the names of the fields used for an exact response to the user.

      struct ExactResponseFields
        include JSON::Serializable

        # The name of the field that contains the answer to the query made to the OpenSearch Service database.

        @[JSON::Field(key: "answerField")]
        getter answer_field : String

        # The name of the field that contains the query made to the OpenSearch Service database.

        @[JSON::Field(key: "questionField")]
        getter question_field : String

        def initialize(
          @answer_field : String,
          @question_field : String
        )
        end
      end

      # Details about an error in an execution of a test set.

      struct ExecutionErrorDetails
        include JSON::Serializable

        # The error code for the error.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The message describing the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @error_code : String,
          @error_message : String
        )
        end
      end

      # Filters the response form the ListExports operation

      struct ExportFilter
        include JSON::Serializable

        # The name of the field to use for filtering.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListExports operation should return only
        # resource types that equal the specified value. Specify CO when the ListExports operation should
        # return resource types that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The values to use to filter the response. The values must be Bot , BotLocale , or CustomVocabulary .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Provides information about the bot or bot locale that you want to export. You can specify the
      # botExportSpecification or the botLocaleExportSpecification , but not both.

      struct ExportResourceSpecification
        include JSON::Serializable

        # Parameters for exporting a bot.

        @[JSON::Field(key: "botExportSpecification")]
        getter bot_export_specification : Types::BotExportSpecification?

        # Parameters for exporting a bot locale.

        @[JSON::Field(key: "botLocaleExportSpecification")]
        getter bot_locale_export_specification : Types::BotLocaleExportSpecification?

        # The parameters required to export a custom vocabulary.

        @[JSON::Field(key: "customVocabularyExportSpecification")]
        getter custom_vocabulary_export_specification : Types::CustomVocabularyExportSpecification?

        # Specifications for the test set that is exported as a resource.

        @[JSON::Field(key: "testSetExportSpecification")]
        getter test_set_export_specification : Types::TestSetExportSpecification?

        def initialize(
          @bot_export_specification : Types::BotExportSpecification? = nil,
          @bot_locale_export_specification : Types::BotLocaleExportSpecification? = nil,
          @custom_vocabulary_export_specification : Types::CustomVocabularyExportSpecification? = nil,
          @test_set_export_specification : Types::TestSetExportSpecification? = nil
        )
        end
      end

      # Provides information about sorting a list of exports.

      struct ExportSortBy
        include JSON::Serializable

        # The export field to use for sorting.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Provides summary information about an export in an export list.

      struct ExportSummary
        include JSON::Serializable

        # The date and time that the export was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The unique identifier that Amazon Lex assigned to the export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        # The status of the export. When the status is Completed the export is ready to download.

        @[JSON::Field(key: "exportStatus")]
        getter export_status : String?

        # The file format used in the export files.

        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # The date and time that the export was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # Information about the bot or bot locale that was exported.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ExportResourceSpecification?

        def initialize(
          @creation_date_time : Time? = nil,
          @export_id : String? = nil,
          @export_status : String? = nil,
          @file_format : String? = nil,
          @last_updated_date_time : Time? = nil,
          @resource_specification : Types::ExportResourceSpecification? = nil
        )
        end
      end

      # Provides information about the external source of the slot type's definition.

      struct ExternalSourceSetting
        include JSON::Serializable

        # Settings required for a slot type based on a grammar that you provide.

        @[JSON::Field(key: "grammarSlotTypeSetting")]
        getter grammar_slot_type_setting : Types::GrammarSlotTypeSetting?

        def initialize(
          @grammar_slot_type_setting : Types::GrammarSlotTypeSetting? = nil
        )
        end
      end

      # The unique failed custom vocabulary item from the custom vocabulary list.

      struct FailedCustomVocabularyItem
        include JSON::Serializable

        # The unique error code for the failed custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message for the failed custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The unique item identifer for the failed custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "itemId")]
        getter item_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @item_id : String? = nil
        )
        end
      end

      # Determines if a Lambda function should be invoked for a specific intent.

      struct FulfillmentCodeHookSettings
        include JSON::Serializable

        # Indicates whether a Lambda function should be invoked to fulfill a specific intent.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # Determines whether the fulfillment code hook is used. When active is false, the code hook doesn't
        # run.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # Provides settings for update messages sent to the user for long-running Lambda fulfillment
        # functions. Fulfillment updates can be used only with streaming conversations.

        @[JSON::Field(key: "fulfillmentUpdatesSpecification")]
        getter fulfillment_updates_specification : Types::FulfillmentUpdatesSpecification?

        # Provides settings for messages sent to the user for after the Lambda fulfillment function completes.
        # Post-fulfillment messages can be sent for both streaming and non-streaming conversations.

        @[JSON::Field(key: "postFulfillmentStatusSpecification")]
        getter post_fulfillment_status_specification : Types::PostFulfillmentStatusSpecification?

        def initialize(
          @enabled : Bool,
          @active : Bool? = nil,
          @fulfillment_updates_specification : Types::FulfillmentUpdatesSpecification? = nil,
          @post_fulfillment_status_specification : Types::PostFulfillmentStatusSpecification? = nil
        )
        end
      end

      # Provides settings for a message that is sent to the user when a fulfillment Lambda function starts
      # running.

      struct FulfillmentStartResponseSpecification
        include JSON::Serializable

        # The delay between when the Lambda fulfillment function starts running and the start message is
        # played. If the Lambda function returns before the delay is over, the start message isn't played.

        @[JSON::Field(key: "delayInSeconds")]
        getter delay_in_seconds : Int32

        # 1 - 5 message groups that contain start messages. Amazon Lex chooses one of the messages to play to
        # the user.

        @[JSON::Field(key: "messageGroups")]
        getter message_groups : Array(Types::MessageGroup)

        # Determines whether the user can interrupt the start message while it is playing.

        @[JSON::Field(key: "allowInterrupt")]
        getter allow_interrupt : Bool?

        def initialize(
          @delay_in_seconds : Int32,
          @message_groups : Array(Types::MessageGroup),
          @allow_interrupt : Bool? = nil
        )
        end
      end

      # Provides settings for a message that is sent periodically to the user while a fulfillment Lambda
      # function is running.

      struct FulfillmentUpdateResponseSpecification
        include JSON::Serializable

        # The frequency that a message is sent to the user. When the period ends, Amazon Lex chooses a message
        # from the message groups and plays it to the user. If the fulfillment Lambda returns before the first
        # period ends, an update message is not played to the user.

        @[JSON::Field(key: "frequencyInSeconds")]
        getter frequency_in_seconds : Int32

        # 1 - 5 message groups that contain update messages. Amazon Lex chooses one of the messages to play to
        # the user.

        @[JSON::Field(key: "messageGroups")]
        getter message_groups : Array(Types::MessageGroup)

        # Determines whether the user can interrupt an update message while it is playing.

        @[JSON::Field(key: "allowInterrupt")]
        getter allow_interrupt : Bool?

        def initialize(
          @frequency_in_seconds : Int32,
          @message_groups : Array(Types::MessageGroup),
          @allow_interrupt : Bool? = nil
        )
        end
      end

      # Provides information for updating the user on the progress of fulfilling an intent.

      struct FulfillmentUpdatesSpecification
        include JSON::Serializable

        # Determines whether fulfillment updates are sent to the user. When this field is true, updates are
        # sent. If the active field is set to true, the startResponse , updateResponse , and timeoutInSeconds
        # fields are required.

        @[JSON::Field(key: "active")]
        getter active : Bool

        # Provides configuration information for the message sent to users when the fulfillment Lambda
        # functions starts running.

        @[JSON::Field(key: "startResponse")]
        getter start_response : Types::FulfillmentStartResponseSpecification?

        # The length of time that the fulfillment Lambda function should run before it times out.

        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        # Provides configuration information for messages sent periodically to the user while the fulfillment
        # Lambda function is running.

        @[JSON::Field(key: "updateResponse")]
        getter update_response : Types::FulfillmentUpdateResponseSpecification?

        def initialize(
          @active : Bool,
          @start_response : Types::FulfillmentStartResponseSpecification? = nil,
          @timeout_in_seconds : Int32? = nil,
          @update_response : Types::FulfillmentUpdateResponseSpecification? = nil
        )
        end
      end


      struct GenerateBotElementRequest
        include JSON::Serializable

        # The bot unique Id for the bot request to generate utterances.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The bot version for the bot request to generate utterances.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The intent unique Id for the bot request to generate utterances.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The unique locale Id for the bot request to generate utterances.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String
        )
        end
      end


      struct GenerateBotElementResponse
        include JSON::Serializable

        # The unique bot Id for the bot which received the response.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The unique bot version for the bot which received the response.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The unique intent Id for the bot which received the response.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The unique locale Id for the bot which received the response.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The sample utterances for the bot which received the response.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @intent_id : String? = nil,
          @locale_id : String? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil
        )
        end
      end

      # Specifies the attribute and method by which to sort the generation request information.

      struct GenerationSortBy
        include JSON::Serializable

        # The attribute by which to sort the generation request information. You can sort by the following
        # attributes. creationStartTime – The time at which the generation request was created.
        # lastUpdatedTime – The time at which the generation request was last updated.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order by which to sort the generation request information.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Contains information about a generation request made for the bot locale.

      struct GenerationSummary
        include JSON::Serializable

        # The date and time at which the generation request was made.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The unique identifier of the generation request.

        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # The status of the generation request.

        @[JSON::Field(key: "generationStatus")]
        getter generation_status : String?

        # The date and time at which the generation request was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        def initialize(
          @creation_date_time : Time? = nil,
          @generation_id : String? = nil,
          @generation_status : String? = nil,
          @last_updated_date_time : Time? = nil
        )
        end
      end

      # Contains specifications about the generative AI capabilities from Amazon Bedrock that you can turn
      # on for your bot.

      struct GenerativeAISettings
        include JSON::Serializable


        @[JSON::Field(key: "buildtimeSettings")]
        getter buildtime_settings : Types::BuildtimeSettings?


        @[JSON::Field(key: "runtimeSettings")]
        getter runtime_settings : Types::RuntimeSettings?

        def initialize(
          @buildtime_settings : Types::BuildtimeSettings? = nil,
          @runtime_settings : Types::RuntimeSettings? = nil
        )
        end
      end


      struct GetTestExecutionArtifactsUrlRequest
        include JSON::Serializable

        # The unique identifier of the completed test execution.

        @[JSON::Field(key: "testExecutionId")]
        getter test_execution_id : String

        def initialize(
          @test_execution_id : String
        )
        end
      end


      struct GetTestExecutionArtifactsUrlResponse
        include JSON::Serializable

        # The pre-signed Amazon S3 URL to download completed test execution.

        @[JSON::Field(key: "downloadArtifactsUrl")]
        getter download_artifacts_url : String?

        # The unique identifier of the completed test execution.

        @[JSON::Field(key: "testExecutionId")]
        getter test_execution_id : String?

        def initialize(
          @download_artifacts_url : String? = nil,
          @test_execution_id : String? = nil
        )
        end
      end

      # Settings requried for a slot type based on a grammar that you provide.

      struct GrammarSlotTypeSetting
        include JSON::Serializable

        # The source of the grammar used to create the slot type.

        @[JSON::Field(key: "source")]
        getter source : Types::GrammarSlotTypeSource?

        def initialize(
          @source : Types::GrammarSlotTypeSource? = nil
        )
        end
      end

      # Describes the Amazon S3 bucket name and location for the grammar that is the source for the slot
      # type.

      struct GrammarSlotTypeSource
        include JSON::Serializable

        # The name of the Amazon S3 bucket that contains the grammar source.

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String

        # The path to the grammar in the Amazon S3 bucket.

        @[JSON::Field(key: "s3ObjectKey")]
        getter s3_object_key : String

        # The KMS key required to decrypt the contents of the grammar, if any.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @s3_bucket_name : String,
          @s3_object_key : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # A card that is shown to the user by a messaging platform. You define the contents of the card, the
      # card is displayed by the platform. When you use a response card, the response from the user is
      # constrained to the text associated with a button on the card.

      struct ImageResponseCard
        include JSON::Serializable

        # The title to display on the response card. The format of the title is determined by the platform
        # displaying the response card.

        @[JSON::Field(key: "title")]
        getter title : String

        # A list of buttons that should be displayed on the response card. The arrangement of the buttons is
        # determined by the platform that displays the button.

        @[JSON::Field(key: "buttons")]
        getter buttons : Array(Types::Button)?

        # The URL of an image to display on the response card. The image URL must be publicly available so
        # that the platform displaying the response card has access to the image.

        @[JSON::Field(key: "imageUrl")]
        getter image_url : String?

        # The subtitle to display on the response card. The format of the subtitle is determined by the
        # platform displaying the response card.

        @[JSON::Field(key: "subtitle")]
        getter subtitle : String?

        def initialize(
          @title : String,
          @buttons : Array(Types::Button)? = nil,
          @image_url : String? = nil,
          @subtitle : String? = nil
        )
        end
      end

      # Filters the response from the ListImports operation.

      struct ImportFilter
        include JSON::Serializable

        # The name of the field to use for filtering.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListImports operation should return only
        # resource types that equal the specified value. Specify CO when the ListImports operation should
        # return resource types that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The values to use to filter the response. The values must be Bot , BotLocale , or CustomVocabulary .

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Provides information about the bot or bot locale that you want to import. You can specify the
      # botImportSpecification or the botLocaleImportSpecification , but not both.

      struct ImportResourceSpecification
        include JSON::Serializable

        # Parameters for importing a bot.

        @[JSON::Field(key: "botImportSpecification")]
        getter bot_import_specification : Types::BotImportSpecification?

        # Parameters for importing a bot locale.

        @[JSON::Field(key: "botLocaleImportSpecification")]
        getter bot_locale_import_specification : Types::BotLocaleImportSpecification?


        @[JSON::Field(key: "customVocabularyImportSpecification")]
        getter custom_vocabulary_import_specification : Types::CustomVocabularyImportSpecification?

        # Specifications for the test set that is imported.

        @[JSON::Field(key: "testSetImportResourceSpecification")]
        getter test_set_import_resource_specification : Types::TestSetImportResourceSpecification?

        def initialize(
          @bot_import_specification : Types::BotImportSpecification? = nil,
          @bot_locale_import_specification : Types::BotLocaleImportSpecification? = nil,
          @custom_vocabulary_import_specification : Types::CustomVocabularyImportSpecification? = nil,
          @test_set_import_resource_specification : Types::TestSetImportResourceSpecification? = nil
        )
        end
      end

      # Provides information for sorting a list of imports.

      struct ImportSortBy
        include JSON::Serializable

        # The export field to use for sorting.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Provides summary information about an import in an import list.

      struct ImportSummary
        include JSON::Serializable

        # The date and time that the import was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The unique identifier that Amazon Lex assigned to the import.

        @[JSON::Field(key: "importId")]
        getter import_id : String?

        # The status of the resource. When the status is Completed the resource is ready to build.

        @[JSON::Field(key: "importStatus")]
        getter import_status : String?

        # The unique identifier that Amazon Lex assigned to the imported resource.

        @[JSON::Field(key: "importedResourceId")]
        getter imported_resource_id : String?

        # The name that you gave the imported resource.

        @[JSON::Field(key: "importedResourceName")]
        getter imported_resource_name : String?

        # The type of resource that was imported.

        @[JSON::Field(key: "importedResourceType")]
        getter imported_resource_type : String?

        # The date and time that the import was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The strategy used to merge existing bot or bot locale definitions with the imported definition.

        @[JSON::Field(key: "mergeStrategy")]
        getter merge_strategy : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @import_id : String? = nil,
          @import_status : String? = nil,
          @imported_resource_id : String? = nil,
          @imported_resource_name : String? = nil,
          @imported_resource_type : String? = nil,
          @last_updated_date_time : Time? = nil,
          @merge_strategy : String? = nil
        )
        end
      end

      # Configuration setting for a response sent to the user before Amazon Lex starts eliciting slots.

      struct InitialResponseSetting
        include JSON::Serializable


        @[JSON::Field(key: "codeHook")]
        getter code_hook : Types::DialogCodeHookInvocationSetting?


        @[JSON::Field(key: "conditional")]
        getter conditional : Types::ConditionalSpecification?


        @[JSON::Field(key: "initialResponse")]
        getter initial_response : Types::ResponseSpecification?

        # The next step in the conversation.

        @[JSON::Field(key: "nextStep")]
        getter next_step : Types::DialogState?

        def initialize(
          @code_hook : Types::DialogCodeHookInvocationSetting? = nil,
          @conditional : Types::ConditionalSpecification? = nil,
          @initial_response : Types::ResponseSpecification? = nil,
          @next_step : Types::DialogState? = nil
        )
        end
      end

      # A context that must be active for an intent to be selected by Amazon Lex.

      struct InputContext
        include JSON::Serializable

        # The name of the context.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Specifications for the current state of the dialog between the user and the bot in the test set.

      struct InputSessionStateSpecification
        include JSON::Serializable

        # Active contexts for the session state.

        @[JSON::Field(key: "activeContexts")]
        getter active_contexts : Array(Types::ActiveContext)?

        # Runtime hints for the session state.

        @[JSON::Field(key: "runtimeHints")]
        getter runtime_hints : Types::RuntimeHints?

        # Session attributes for the session state.

        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        def initialize(
          @active_contexts : Array(Types::ActiveContext)? = nil,
          @runtime_hints : Types::RuntimeHints? = nil,
          @session_attributes : Hash(String, String)? = nil
        )
        end
      end

      # Information for an intent that is classified by the test workbench.

      struct IntentClassificationTestResultItem
        include JSON::Serializable

        # The name of the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # Indicates whether the conversation involves multiple turns or not.

        @[JSON::Field(key: "multiTurnConversation")]
        getter multi_turn_conversation : Bool

        # The result of the intent classification test.

        @[JSON::Field(key: "resultCounts")]
        getter result_counts : Types::IntentClassificationTestResultItemCounts

        def initialize(
          @intent_name : String,
          @multi_turn_conversation : Bool,
          @result_counts : Types::IntentClassificationTestResultItemCounts
        )
        end
      end

      # The number of items in the intent classification test.

      struct IntentClassificationTestResultItemCounts
        include JSON::Serializable

        # The number of matched and mismatched results for intent recognition for the intent.

        @[JSON::Field(key: "intentMatchResultCounts")]
        getter intent_match_result_counts : Hash(String, Int32)

        # The total number of results in the intent classification test.

        @[JSON::Field(key: "totalResultCount")]
        getter total_result_count : Int32

        # The number of matched, mismatched, and execution error results for speech transcription for the
        # intent.

        @[JSON::Field(key: "speechTranscriptionResultCounts")]
        getter speech_transcription_result_counts : Hash(String, Int32)?

        def initialize(
          @intent_match_result_counts : Hash(String, Int32),
          @total_result_count : Int32,
          @speech_transcription_result_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # Information for the results of the intent classification test.

      struct IntentClassificationTestResults
        include JSON::Serializable

        # A list of the results for the intent classification test.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::IntentClassificationTestResultItem)

        def initialize(
          @items : Array(Types::IntentClassificationTestResultItem)
        )
        end
      end

      # Provides a statement the Amazon Lex conveys to the user when the intent is successfully fulfilled.

      struct IntentClosingSetting
        include JSON::Serializable

        # Specifies whether an intent's closing response is used. When this field is false, the closing
        # response isn't sent to the user. If the active field isn't specified, the default is true.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # The response that Amazon Lex sends to the user when the intent is complete.

        @[JSON::Field(key: "closingResponse")]
        getter closing_response : Types::ResponseSpecification?

        # A list of conditional branches associated with the intent's closing response. These branches are
        # executed when the nextStep attribute is set to EvalutateConditional .

        @[JSON::Field(key: "conditional")]
        getter conditional : Types::ConditionalSpecification?

        # Specifies the next step that the bot executes after playing the intent's closing response.

        @[JSON::Field(key: "nextStep")]
        getter next_step : Types::DialogState?

        def initialize(
          @active : Bool? = nil,
          @closing_response : Types::ResponseSpecification? = nil,
          @conditional : Types::ConditionalSpecification? = nil,
          @next_step : Types::DialogState? = nil
        )
        end
      end

      # Provides a prompt for making sure that the user is ready for the intent to be fulfilled.

      struct IntentConfirmationSetting
        include JSON::Serializable

        # Prompts the user to confirm the intent. This question should have a yes or no answer. Amazon Lex
        # uses this prompt to ensure that the user acknowledges that the intent is ready for fulfillment. For
        # example, with the OrderPizza intent, you might want to confirm that the order is correct before
        # placing it. For other intents, such as intents that simply respond to user questions, you might not
        # need to ask the user for confirmation before providing the information.

        @[JSON::Field(key: "promptSpecification")]
        getter prompt_specification : Types::PromptSpecification

        # Specifies whether the intent's confirmation is sent to the user. When this field is false,
        # confirmation and declination responses aren't sent. If the active field isn't specified, the default
        # is true.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # The DialogCodeHookInvocationSetting object associated with intent's confirmation step. The dialog
        # code hook is triggered based on these invocation settings when the confirmation next step or
        # declination next step or failure next step is InvokeDialogCodeHook .

        @[JSON::Field(key: "codeHook")]
        getter code_hook : Types::DialogCodeHookInvocationSetting?

        # A list of conditional branches to evaluate after the intent is closed.

        @[JSON::Field(key: "confirmationConditional")]
        getter confirmation_conditional : Types::ConditionalSpecification?

        # Specifies the next step that the bot executes when the customer confirms the intent.

        @[JSON::Field(key: "confirmationNextStep")]
        getter confirmation_next_step : Types::DialogState?


        @[JSON::Field(key: "confirmationResponse")]
        getter confirmation_response : Types::ResponseSpecification?

        # A list of conditional branches to evaluate after the intent is declined.

        @[JSON::Field(key: "declinationConditional")]
        getter declination_conditional : Types::ConditionalSpecification?

        # Specifies the next step that the bot executes when the customer declines the intent.

        @[JSON::Field(key: "declinationNextStep")]
        getter declination_next_step : Types::DialogState?

        # When the user answers "no" to the question defined in promptSpecification , Amazon Lex responds with
        # this response to acknowledge that the intent was canceled.

        @[JSON::Field(key: "declinationResponse")]
        getter declination_response : Types::ResponseSpecification?

        # The DialogCodeHookInvocationSetting used when the code hook is invoked during confirmation prompt
        # retries.

        @[JSON::Field(key: "elicitationCodeHook")]
        getter elicitation_code_hook : Types::ElicitationCodeHookInvocationSetting?


        @[JSON::Field(key: "failureConditional")]
        getter failure_conditional : Types::ConditionalSpecification?

        # The next step to take in the conversation if the confirmation step fails.

        @[JSON::Field(key: "failureNextStep")]
        getter failure_next_step : Types::DialogState?


        @[JSON::Field(key: "failureResponse")]
        getter failure_response : Types::ResponseSpecification?

        def initialize(
          @prompt_specification : Types::PromptSpecification,
          @active : Bool? = nil,
          @code_hook : Types::DialogCodeHookInvocationSetting? = nil,
          @confirmation_conditional : Types::ConditionalSpecification? = nil,
          @confirmation_next_step : Types::DialogState? = nil,
          @confirmation_response : Types::ResponseSpecification? = nil,
          @declination_conditional : Types::ConditionalSpecification? = nil,
          @declination_next_step : Types::DialogState? = nil,
          @declination_response : Types::ResponseSpecification? = nil,
          @elicitation_code_hook : Types::ElicitationCodeHookInvocationSetting? = nil,
          @failure_conditional : Types::ConditionalSpecification? = nil,
          @failure_next_step : Types::DialogState? = nil,
          @failure_response : Types::ResponseSpecification? = nil
        )
        end
      end

      # Configures the Intent Disambiguation feature that helps resolve ambiguous user inputs when multiple
      # intents could match. When enabled, the system presents clarifying questions to users, helping them
      # specify their exact intent for improved conversation accuracy.

      struct IntentDisambiguationSettings
        include JSON::Serializable

        # Determines whether the Intent Disambiguation feature is enabled. When set to true , Amazon Lex will
        # present disambiguation options to users when multiple intents could match their input, with the
        # default being false .

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # Provides a custom message that will be displayed before presenting the disambiguation options to
        # users. This message helps set the context for users and can be customized to match your bot's tone
        # and brand. If not specified, a default message will be used.

        @[JSON::Field(key: "customDisambiguationMessage")]
        getter custom_disambiguation_message : String?

        # Specifies the maximum number of intent options (2-5) to present to users when disambiguation is
        # needed. This setting determines how many intent options will be shown to users when the system
        # detects ambiguous input. The default value is 3.

        @[JSON::Field(key: "maxDisambiguationIntents")]
        getter max_disambiguation_intents : Int32?

        def initialize(
          @enabled : Bool,
          @custom_disambiguation_message : String? = nil,
          @max_disambiguation_intents : Int32? = nil
        )
        end
      end

      # Filters the response from the ListIntents operation.

      struct IntentFilter
        include JSON::Serializable

        # The name of the field to use for the filter.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListIntents operation should return only
        # aliases that equal the specified value. Specify CO when the ListIntents operation should return
        # aliases that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The value to use for the filter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Information about intent-level slot resolution in a test result.

      struct IntentLevelSlotResolutionTestResultItem
        include JSON::Serializable

        # The name of the intent that was recognized.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # Indicates whether the conversation involves multiple turns or not.

        @[JSON::Field(key: "multiTurnConversation")]
        getter multi_turn_conversation : Bool

        # The results for the slot resolution in the test execution result.

        @[JSON::Field(key: "slotResolutionResults")]
        getter slot_resolution_results : Array(Types::SlotResolutionTestResultItem)

        def initialize(
          @intent_name : String,
          @multi_turn_conversation : Bool,
          @slot_resolution_results : Array(Types::SlotResolutionTestResultItem)
        )
        end
      end

      # Indicates the success or failure of slots at the intent level.

      struct IntentLevelSlotResolutionTestResults
        include JSON::Serializable

        # Indicates the items for the slot level resolution for the intents.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::IntentLevelSlotResolutionTestResultItem)

        def initialize(
          @items : Array(Types::IntentLevelSlotResolutionTestResultItem)
        )
        end
      end

      # Override settings to configure the intent state.

      struct IntentOverride
        include JSON::Serializable

        # The name of the intent. Only required when you're switching intents.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A map of all of the slot value overrides for the intent. The name of the slot maps to the value of
        # the slot. Slots that are not included in the map aren't overridden.

        @[JSON::Field(key: "slots")]
        getter slots : Hash(String, Types::SlotValueOverride)?

        def initialize(
          @name : String? = nil,
          @slots : Hash(String, Types::SlotValueOverride)? = nil
        )
        end
      end

      # Specifies attributes for sorting a list of intents.

      struct IntentSortBy
        include JSON::Serializable

        # The attribute to use to sort the list of intents.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list. You can choose ascending or descending.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # The object that contains the statistical summary of recommended intents associated with the bot
      # recommendation.

      struct IntentStatistics
        include JSON::Serializable

        # The number of recommended intents associated with the bot recommendation.

        @[JSON::Field(key: "discoveredIntentCount")]
        getter discovered_intent_count : Int32?

        def initialize(
          @discovered_intent_count : Int32? = nil
        )
        end
      end

      # Summary information about an intent returned by the ListIntents operation.

      struct IntentSummary
        include JSON::Serializable

        # The description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The input contexts that must be active for this intent to be considered for recognition.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # The display name of the intent.

        @[JSON::Field(key: "intentDisplayName")]
        getter intent_display_name : String?

        # The unique identifier assigned to the intent. Use this ID to get detailed information about the
        # intent with the DescribeIntent operation.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The name of the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # The timestamp of the date and time that the intent was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The output contexts that are activated when this intent is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # If this intent is derived from a built-in intent, the name of the parent intent.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        def initialize(
          @description : String? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @intent_display_name : String? = nil,
          @intent_id : String? = nil,
          @intent_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil
        )
        end
      end

      # The service encountered an unexpected condition. Try your request again.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object containing the name of an intent that was invoked.

      struct InvokedIntentSample
        include JSON::Serializable

        # The name of an intent that was invoked.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        def initialize(
          @intent_name : String? = nil
        )
        end
      end

      # Provides configuration information for the AMAZON.KendraSearchIntent intent. When you use this
      # intent, Amazon Lex searches the specified Amazon Kendra index and returns documents from the index
      # that match the user's utterance.

      struct KendraConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Kendra index that you want the
        # AMAZON.KendraSearchIntent intent to search. The index must be in the same account and Region as the
        # Amazon Lex bot.

        @[JSON::Field(key: "kendraIndex")]
        getter kendra_index : String

        # A query filter that Amazon Lex sends to Amazon Kendra to filter the response from a query. The
        # filter is in the format defined by Amazon Kendra. For more information, see Filtering queries .

        @[JSON::Field(key: "queryFilterString")]
        getter query_filter_string : String?

        # Determines whether the AMAZON.KendraSearchIntent intent uses a custom query string to query the
        # Amazon Kendra index.

        @[JSON::Field(key: "queryFilterStringEnabled")]
        getter query_filter_string_enabled : Bool?

        def initialize(
          @kendra_index : String,
          @query_filter_string : String? = nil,
          @query_filter_string_enabled : Bool? = nil
        )
        end
      end

      # Specifies a Lambda function that verifies requests to a bot or fulfills the user's request to a bot.

      struct LambdaCodeHook
        include JSON::Serializable

        # The version of the request-response that you want Amazon Lex to use to invoke your Lambda function.

        @[JSON::Field(key: "codeHookInterfaceVersion")]
        getter code_hook_interface_version : String

        # The Amazon Resource Name (ARN) of the Lambda function.

        @[JSON::Field(key: "lambdaARN")]
        getter lambda_arn : String

        def initialize(
          @code_hook_interface_version : String,
          @lambda_arn : String
        )
        end
      end

      # The object that contains transcript filter details that are associated with a bot recommendation.

      struct LexTranscriptFilter
        include JSON::Serializable

        # The object that contains a date range filter that will be applied to the transcript. Specify this
        # object if you want Amazon Lex to only read the files that are within the date range.

        @[JSON::Field(key: "dateRangeFilter")]
        getter date_range_filter : Types::DateRangeFilter?

        def initialize(
          @date_range_filter : Types::DateRangeFilter? = nil
        )
        end
      end


      struct ListAggregatedUtterancesRequest
        include JSON::Serializable

        # The time window for aggregating the utterance information. You can specify a time between one hour
        # and two weeks.

        @[JSON::Field(key: "aggregationDuration")]
        getter aggregation_duration : Types::UtteranceAggregationDuration

        # The unique identifier of the bot associated with this request.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the language and locale where the utterances were collected. For more information,
        # see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the bot alias associated with this request. If you specify the bot alias, you
        # can't specify the bot version.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The identifier of the bot version associated with this request. If you specify the bot version, you
        # can't specify the bot alias.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Provides the specification of a filter used to limit the utterances in the response to only those
        # that match the filter specification. You can only specify one filter and one string to filter on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AggregatedUtterancesFilter)?

        # The maximum number of utterances to return in each page of results. If there are fewer results than
        # the maximum page size, only the actual number of results are returned. If you don't specify the
        # maxResults parameter, 1,000 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListAggregatedUtterances operation contains more results that specified in
        # the maxResults parameter, a token is returned in the response. Use that token in the nextToken
        # parameter to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies sorting parameters for the list of utterances. You can sort by the hit count, the missed
        # count, or the number of distinct sessions the utterance appeared in.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::AggregatedUtterancesSortBy?

        def initialize(
          @aggregation_duration : Types::UtteranceAggregationDuration,
          @bot_id : String,
          @locale_id : String,
          @bot_alias_id : String? = nil,
          @bot_version : String? = nil,
          @filters : Array(Types::AggregatedUtterancesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::AggregatedUtterancesSortBy? = nil
        )
        end
      end


      struct ListAggregatedUtterancesResponse
        include JSON::Serializable

        # Summaries of the aggregated utterance data. Each response contains information about the number of
        # times that the utterance was seen during the time period, whether it was detected or missed, and
        # when it was seen during the time period.

        @[JSON::Field(key: "aggregatedUtterancesSummaries")]
        getter aggregated_utterances_summaries : Array(Types::AggregatedUtterancesSummary)?

        # The time period used to aggregate the utterance data.

        @[JSON::Field(key: "aggregationDuration")]
        getter aggregation_duration : Types::UtteranceAggregationDuration?

        # The last date and time that the aggregated data was collected. The time period depends on the length
        # of the aggregation window. Hours - for 1 hour time window, every half hour; otherwise every hour.
        # Days - every 6 hours Weeks - for a one week time window, every 12 hours; otherwise, every day

        @[JSON::Field(key: "aggregationLastRefreshedDateTime")]
        getter aggregation_last_refreshed_date_time : Time?

        # The date and time that the aggregation window ends. Only data collected between the start time and
        # the end time are returned in the results.

        @[JSON::Field(key: "aggregationWindowEndTime")]
        getter aggregation_window_end_time : Time?

        # The date and time that the aggregation window begins. Only data collected after this time is
        # returned in the results.

        @[JSON::Field(key: "aggregationWindowStartTime")]
        getter aggregation_window_start_time : Time?

        # The identifier of the bot alias that contains the utterances. If you specified the bot version, the
        # bot alias ID isn't returned.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The identifier of the bot that contains the utterances.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the bot version that contains the utterances. If you specified the bot alias, the
        # bot version isn't returned.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The identifier of the language and locale that the utterances are in.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the
        # ListAggregatedUtterances operation. If the nextToken field is present, you send the contents as the
        # nextToken parameter of a ListAggregatedUtterances operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @aggregated_utterances_summaries : Array(Types::AggregatedUtterancesSummary)? = nil,
          @aggregation_duration : Types::UtteranceAggregationDuration? = nil,
          @aggregation_last_refreshed_date_time : Time? = nil,
          @aggregation_window_end_time : Time? = nil,
          @aggregation_window_start_time : Time? = nil,
          @bot_alias_id : String? = nil,
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotAliasReplicasRequest
        include JSON::Serializable

        # The request for the unique bot ID of the replicated bot created from the source bot alias.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The request for the secondary region of the replicated bot created from the source bot alias.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String

        # The request for maximum results to list the replicated bots created from the source bot alias.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The request for the next token for the replicated bot created from the source bot alias.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @replica_region : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotAliasReplicasResponse
        include JSON::Serializable

        # The summary information of the replicated bot created from the source bot alias.

        @[JSON::Field(key: "botAliasReplicaSummaries")]
        getter bot_alias_replica_summaries : Array(Types::BotAliasReplicaSummary)?

        # The unique bot ID of the replicated bot created from the source bot alias.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The next token for the replicated bots created from the source bot alias.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The secondary region of the replicated bot created from the source bot alias.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String?

        # The source region of the replicated bot created from the source bot alias.

        @[JSON::Field(key: "sourceRegion")]
        getter source_region : String?

        def initialize(
          @bot_alias_replica_summaries : Array(Types::BotAliasReplicaSummary)? = nil,
          @bot_id : String? = nil,
          @next_token : String? = nil,
          @replica_region : String? = nil,
          @source_region : String? = nil
        )
        end
      end


      struct ListBotAliasesRequest
        include JSON::Serializable

        # The identifier of the bot to list aliases for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The maximum number of aliases to return in each page of results. If there are fewer results than the
        # max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListBotAliases operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotAliasesResponse
        include JSON::Serializable

        # Summary information for the bot aliases that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter of the request. If there are more
        # aliases available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "botAliasSummaries")]
        getter bot_alias_summaries : Array(Types::BotAliasSummary)?

        # The identifier of the bot associated with the aliases.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # A token that indicates whether there are more results to return in a response to the ListBotAliases
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListBotAliases operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_alias_summaries : Array(Types::BotAliasSummary)? = nil,
          @bot_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotLocalesRequest
        include JSON::Serializable

        # The identifier of the bot to list locales for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot to list locales for.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # Provides the specification for a filter used to limit the response to only those locales that match
        # the filter specification. You can only specify one filter and one value to filter on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::BotLocaleFilter)?

        # The maximum number of aliases to return in each page of results. If there are fewer results than the
        # max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListBotLocales operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token as the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies sorting parameters for the list of locales. You can sort by locale name in ascending or
        # descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::BotLocaleSortBy?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @filters : Array(Types::BotLocaleFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::BotLocaleSortBy? = nil
        )
        end
      end


      struct ListBotLocalesResponse
        include JSON::Serializable

        # The identifier of the bot to list locales for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # Summary information for the locales that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter of the request. If there are more
        # locales available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "botLocaleSummaries")]
        getter bot_locale_summaries : Array(Types::BotLocaleSummary)?

        # The version of the bot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A token that indicates whether there are more results to return in a response to the ListBotLocales
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListBotLocales operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_locale_summaries : Array(Types::BotLocaleSummary)? = nil,
          @bot_version : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotRecommendationsRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the bot recommendation list.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the bot recommendation list.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the bot recommendation list.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The maximum number of bot recommendations to return in each page of results. If there are fewer
        # results than the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListBotRecommendation operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotRecommendationsResponse
        include JSON::Serializable

        # The unique identifier of the bot that contains the bot recommendation list.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # Summary information for the bot recommendations that meet the filter specified in this request. The
        # length of the list is specified in the maxResults parameter of the request. If there are more bot
        # recommendations available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "botRecommendationSummaries")]
        getter bot_recommendation_summaries : Array(Types::BotRecommendationSummary)?

        # The version of the bot that contains the bot recommendation list.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The identifier of the language and locale of the bot recommendation list.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the
        # ListBotRecommendations operation. If the nextToken field is present, you send the contents as the
        # nextToken parameter of a ListBotRecommendations operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_recommendation_summaries : Array(Types::BotRecommendationSummary)? = nil,
          @bot_version : String? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotReplicasRequest
        include JSON::Serializable

        # The request for the unique bot IDs in the list of replicated bots.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        def initialize(
          @bot_id : String
        )
        end
      end


      struct ListBotReplicasResponse
        include JSON::Serializable

        # the unique bot IDs in the list of replicated bots.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The summary details for the replicated bots.

        @[JSON::Field(key: "botReplicaSummaries")]
        getter bot_replica_summaries : Array(Types::BotReplicaSummary)?

        # The source region of the source bots in the list of replicated bots.

        @[JSON::Field(key: "sourceRegion")]
        getter source_region : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_replica_summaries : Array(Types::BotReplicaSummary)? = nil,
          @source_region : String? = nil
        )
        end
      end


      struct ListBotResourceGenerationsRequest
        include JSON::Serializable

        # The unique identifier of the bot whose generation requests you want to view.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot whose generation requests you want to view.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The locale of the bot whose generation requests you want to view.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the total number of results is greater than the number specified in the maxResults , the response
        # returns a token in the nextToken field. Use this token when making a request to return the next
        # batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object containing information about the attribute and the method by which to sort the results

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::GenerationSortBy?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::GenerationSortBy? = nil
        )
        end
      end


      struct ListBotResourceGenerationsResponse
        include JSON::Serializable

        # The unique identifier of the bot for which the generation requests were made.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot for which the generation requests were made.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A list of objects, each containing information about a generation request for the bot locale.

        @[JSON::Field(key: "generationSummaries")]
        getter generation_summaries : Array(Types::GenerationSummary)?

        # The locale of the bot for which the generation requests were made.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # If the total number of results is greater than the number specified in the maxResults , the response
        # returns a token in the nextToken field. Use this token when making a request to return the next
        # batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @generation_summaries : Array(Types::GenerationSummary)? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotVersionReplicasRequest
        include JSON::Serializable

        # The request for the unique ID in the list of replicated bots.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The request for the region used in the list of replicated bots.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String

        # The maximum results given in the list of replicated bots.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token given in the list of replicated bots.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The requested sort category for the list of replicated bots.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::BotVersionReplicaSortBy?

        def initialize(
          @bot_id : String,
          @replica_region : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::BotVersionReplicaSortBy? = nil
        )
        end
      end


      struct ListBotVersionReplicasResponse
        include JSON::Serializable

        # The unique ID of the bots in the list of replicated bots.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The information summary used for the replicated bots in the list of replicated bots.

        @[JSON::Field(key: "botVersionReplicaSummaries")]
        getter bot_version_replica_summaries : Array(Types::BotVersionReplicaSummary)?

        # The next token used for the replicated bots in the list of replicated bots.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The region used for the replicated bots in the list of replicated bots.

        @[JSON::Field(key: "replicaRegion")]
        getter replica_region : String?

        # The source region used for the bots in the list of replicated bots.

        @[JSON::Field(key: "sourceRegion")]
        getter source_region : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version_replica_summaries : Array(Types::BotVersionReplicaSummary)? = nil,
          @next_token : String? = nil,
          @replica_region : String? = nil,
          @source_region : String? = nil
        )
        end
      end


      struct ListBotVersionsRequest
        include JSON::Serializable

        # The identifier of the bot to list versions for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The maximum number of versions to return in each page of results. If there are fewer results than
        # the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response to the ListBotVersion operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies sorting parameters for the list of versions. You can specify that the list be sorted by
        # version name in either ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::BotVersionSortBy?

        def initialize(
          @bot_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::BotVersionSortBy? = nil
        )
        end
      end


      struct ListBotVersionsResponse
        include JSON::Serializable

        # The identifier of the bot to list versions for.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # Summary information for the bot versions that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter of the request. If there are more
        # versions available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "botVersionSummaries")]
        getter bot_version_summaries : Array(Types::BotVersionSummary)?

        # A token that indicates whether there are more results to return in a response to the ListBotVersions
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListBotAliases operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version_summaries : Array(Types::BotVersionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotsRequest
        include JSON::Serializable

        # Provides the specification of a filter used to limit the bots in the response to only those that
        # match the filter specification. You can only specify one filter and one string to filter on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::BotFilter)?

        # The maximum number of bots to return in each page of results. If there are fewer results than the
        # maximum page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListBots operation contains more results than specified in the maxResults
        # parameter, a token is returned in the response. Use the returned token in the nextToken parameter of
        # a ListBots request to return the next page of results. For a complete set of results, call the
        # ListBots operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies sorting parameters for the list of bots. You can specify that the list be sorted by bot
        # name in ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::BotSortBy?

        def initialize(
          @filters : Array(Types::BotFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::BotSortBy? = nil
        )
        end
      end


      struct ListBotsResponse
        include JSON::Serializable

        # Summary information for the bots that meet the filter criteria specified in the request. The length
        # of the list is specified in the maxResults parameter of the request. If there are more bots
        # available, the nextToken field contains a token to the next page of results.

        @[JSON::Field(key: "botSummaries")]
        getter bot_summaries : Array(Types::BotSummary)?

        # A token that indicates whether there are more results to return in a response to the ListBots
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListBots operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_summaries : Array(Types::BotSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBuiltInIntentsRequest
        include JSON::Serializable

        # The identifier of the language and locale of the intents to list. The string must match one of the
        # supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The maximum number of built-in intents to return in each page of results. If there are fewer results
        # than the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListBuiltInIntents operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies sorting parameters for the list of built-in intents. You can specify that the list be
        # sorted by the built-in intent signature in either ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::BuiltInIntentSortBy?

        def initialize(
          @locale_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::BuiltInIntentSortBy? = nil
        )
        end
      end


      struct ListBuiltInIntentsResponse
        include JSON::Serializable

        # Summary information for the built-in intents that meet the filter criteria specified in the request.
        # The length of the list is specified in the maxResults parameter of the request. If there are more
        # intents available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "builtInIntentSummaries")]
        getter built_in_intent_summaries : Array(Types::BuiltInIntentSummary)?

        # The language and locale of the intents in the list.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the
        # ListBuiltInIntents operation. If the nextToken field is present, you send the contents as the
        # nextToken parameter of a ListBotAliases operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @built_in_intent_summaries : Array(Types::BuiltInIntentSummary)? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBuiltInSlotTypesRequest
        include JSON::Serializable

        # The identifier of the language and locale of the slot types to list. The string must match one of
        # the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The maximum number of built-in slot types to return in each page of results. If there are fewer
        # results than the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListBuiltInSlotTypes operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Determines the sort order for the response from the ListBuiltInSlotTypes operation. You can choose
        # to sort by the slot type signature in either ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::BuiltInSlotTypeSortBy?

        def initialize(
          @locale_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::BuiltInSlotTypeSortBy? = nil
        )
        end
      end


      struct ListBuiltInSlotTypesResponse
        include JSON::Serializable

        # Summary information for the built-in slot types that meet the filter criteria specified in the
        # request. The length of the list is specified in the maxResults parameter of the request. If there
        # are more slot types available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "builtInSlotTypeSummaries")]
        getter built_in_slot_type_summaries : Array(Types::BuiltInSlotTypeSummary)?

        # The language and locale of the slot types in the list.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the
        # ListBuiltInSlotTypes operation. If the nextToken field is present, you send the contents as the
        # nextToken parameter of a LIstBuiltInSlotTypes operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @built_in_slot_type_summaries : Array(Types::BuiltInSlotTypeSummary)? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomVocabularyItemsRequest
        include JSON::Serializable

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The bot version of the bot to the list custom vocabulary request.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported languages
        # (https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html).

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The maximum number of items returned by the list operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken identifier to the list custom vocabulary request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomVocabularyItemsResponse
        include JSON::Serializable

        # The identifier of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the version of the bot associated with this custom vocabulary.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The custom vocabulary items from the list custom vocabulary response.

        @[JSON::Field(key: "customVocabularyItems")]
        getter custom_vocabulary_items : Array(Types::CustomVocabularyItem)?

        # The identifier of the language and locale where this custom vocabulary is used. The string must
        # match one of the supported locales. For more information, see Supported Languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The nextToken identifier to the list custom vocabulary response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @custom_vocabulary_items : Array(Types::CustomVocabularyItem)? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExportsRequest
        include JSON::Serializable

        # The unique identifier that Amazon Lex assigned to the bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot to list exports for.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Provides the specification of a filter used to limit the exports in the response to only those that
        # match the filter specification. You can only specify one filter and one string to filter on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ExportFilter)?

        # Specifies the resources that should be exported. If you don't specify a resource type in the filters
        # parameter, both bot locales and custom vocabularies are exported.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The maximum number of exports to return in each page of results. If there are fewer results than the
        # max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListExports operation contains more results that specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListExports request to return the next page of results. For a complete set of
        # results, call the ListExports operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Determines the field that the list of exports is sorted by. You can sort by the LastUpdatedDateTime
        # field in ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::ExportSortBy?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @filters : Array(Types::ExportFilter)? = nil,
          @locale_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::ExportSortBy? = nil
        )
        end
      end


      struct ListExportsResponse
        include JSON::Serializable

        # The unique identifier assigned to the bot by Amazon Lex.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that was exported.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Summary information for the exports that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter. If there are more exports available,
        # the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "exportSummaries")]
        getter export_summaries : Array(Types::ExportSummary)?

        # The locale specified in the request.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the ListExports
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListExports operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @export_summaries : Array(Types::ExportSummary)? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportsRequest
        include JSON::Serializable

        # The unique identifier that Amazon Lex assigned to the bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot to list imports for.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Provides the specification of a filter used to limit the bots in the response to only those that
        # match the filter specification. You can only specify one filter and one string to filter on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ImportFilter)?

        # Specifies the locale that should be present in the list. If you don't specify a resource type in the
        # filters parameter, the list contains both bot locales and custom vocabularies.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The maximum number of imports to return in each page of results. If there are fewer results than the
        # max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListImports operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListImports request to return the next page of results. For a complete set of
        # results, call the ListImports operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Determines the field that the list of imports is sorted by. You can sort by the LastUpdatedDateTime
        # field in ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::ImportSortBy?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @filters : Array(Types::ImportFilter)? = nil,
          @locale_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::ImportSortBy? = nil
        )
        end
      end


      struct ListImportsResponse
        include JSON::Serializable

        # The unique identifier assigned by Amazon Lex to the bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that was imported. It will always be DRAFT .

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Summary information for the imports that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter. If there are more imports available,
        # the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "importSummaries")]
        getter import_summaries : Array(Types::ImportSummary)?

        # The locale specified in the request.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the ListImports
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListImports operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @import_summaries : Array(Types::ImportSummary)? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIntentMetricsRequest
        include JSON::Serializable

        # The identifier for the bot for which you want to retrieve intent metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The date and time that marks the end of the range of time for which you want to see intent metrics.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the order by which to organize the results.

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(Types::AnalyticsIntentMetric)

        # The timestamp that marks the beginning of the range of time for which you want to see intent
        # metrics.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        # A list of objects, each of which contains specifications for organizing the results by time.

        @[JSON::Field(key: "binBy")]
        getter bin_by : Array(Types::AnalyticsBinBySpecification)?

        # A list of objects, each of which describes a condition by which you want to filter the results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AnalyticsIntentFilter)?

        # A list of objects, each of which specifies how to group the results. You can group by the following
        # criteria: IntentName – The name of the intent. IntentEndState – The final state of the intent. The
        # possible end states are detailed in Key definitions in the user guide.

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::AnalyticsIntentGroupBySpecification)?

        # The maximum number of results to return in each page of results. If there are fewer results than the
        # maximum page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListIntentMetrics operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListIntentMetrics request to return the next page of results. For a complete set of
        # results, call the ListIntentMetrics operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @end_date_time : Time,
          @metrics : Array(Types::AnalyticsIntentMetric),
          @start_date_time : Time,
          @bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
          @filters : Array(Types::AnalyticsIntentFilter)? = nil,
          @group_by : Array(Types::AnalyticsIntentGroupBySpecification)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIntentMetricsResponse
        include JSON::Serializable

        # The identifier for the bot for which you retrieved intent metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # If the response from the ListIntentMetrics operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListIntentMetrics request to return the next page of results. For a complete set of
        # results, call the ListIntentMetrics operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The results for the intent metrics.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::AnalyticsIntentResult)?

        def initialize(
          @bot_id : String? = nil,
          @next_token : String? = nil,
          @results : Array(Types::AnalyticsIntentResult)? = nil
        )
        end
      end


      struct ListIntentPathsRequest
        include JSON::Serializable

        # The identifier for the bot for which you want to retrieve intent path metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The date and time that marks the end of the range of time for which you want to see intent path
        # metrics.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # The intent path for which you want to retrieve metrics. Use a forward slash to separate intents in
        # the path. For example: /BookCar /BookCar/BookHotel /BookHotel/BookCar

        @[JSON::Field(key: "intentPath")]
        getter intent_path : String

        # The date and time that marks the beginning of the range of time for which you want to see intent
        # path metrics.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        # A list of objects, each describes a condition by which you want to filter the results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AnalyticsPathFilter)?

        def initialize(
          @bot_id : String,
          @end_date_time : Time,
          @intent_path : String,
          @start_date_time : Time,
          @filters : Array(Types::AnalyticsPathFilter)? = nil
        )
        end
      end


      struct ListIntentPathsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about a node in the intent path for which you
        # requested metrics.

        @[JSON::Field(key: "nodeSummaries")]
        getter node_summaries : Array(Types::AnalyticsIntentNodeSummary)?

        def initialize(
          @node_summaries : Array(Types::AnalyticsIntentNodeSummary)? = nil
        )
        end
      end


      struct ListIntentStageMetricsRequest
        include JSON::Serializable

        # The identifier for the bot for which you want to retrieve intent stage metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The date and time that marks the end of the range of time for which you want to see intent stage
        # metrics.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the method by which to organize the results.

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(Types::AnalyticsIntentStageMetric)

        # The date and time that marks the beginning of the range of time for which you want to see intent
        # stage metrics.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        # A list of objects, each of which contains specifications for organizing the results by time.

        @[JSON::Field(key: "binBy")]
        getter bin_by : Array(Types::AnalyticsBinBySpecification)?

        # A list of objects, each of which describes a condition by which you want to filter the results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AnalyticsIntentStageFilter)?

        # A list of objects, each of which specifies how to group the results. You can group by the following
        # criteria: IntentStageName – The name of the intent stage. SwitchedToIntent – The intent to which the
        # conversation was switched (if any).

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::AnalyticsIntentStageGroupBySpecification)?

        # The maximum number of results to return in each page of results. If there are fewer results than the
        # maximum page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListIntentStageMetrics operation contains more results than specified in
        # the maxResults parameter, a token is returned in the response. Use the returned token in the
        # nextToken parameter of a ListIntentStageMetrics request to return the next page of results. For a
        # complete set of results, call the ListIntentStageMetrics operation until the nextToken returned in
        # the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @end_date_time : Time,
          @metrics : Array(Types::AnalyticsIntentStageMetric),
          @start_date_time : Time,
          @bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
          @filters : Array(Types::AnalyticsIntentStageFilter)? = nil,
          @group_by : Array(Types::AnalyticsIntentStageGroupBySpecification)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIntentStageMetricsResponse
        include JSON::Serializable

        # The identifier for the bot for which you retrieved intent stage metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # If the response from the ListIntentStageMetrics operation contains more results than specified in
        # the maxResults parameter, a token is returned in the response. Use the returned token in the
        # nextToken parameter of a ListIntentStageMetrics request to return the next page of results. For a
        # complete set of results, call the ListIntentStageMetrics operation until the nextToken returned in
        # the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The results for the intent stage metrics.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::AnalyticsIntentStageResult)?

        def initialize(
          @bot_id : String? = nil,
          @next_token : String? = nil,
          @results : Array(Types::AnalyticsIntentStageResult)? = nil
        )
        end
      end


      struct ListIntentsRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the intents to list. The string must match one of the
        # supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # Provides the specification of a filter used to limit the intents in the response to only those that
        # match the filter specification. You can only specify one filter and only one string to filter on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::IntentFilter)?

        # The maximum number of intents to return in each page of results. If there are fewer results than the
        # max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListIntents operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListIntents request to return the next page of results. For a complete set of
        # results, call the ListIntents operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Determines the sort order for the response from the ListIntents operation. You can choose to sort by
        # the intent name or last updated date in either ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::IntentSortBy?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @filters : Array(Types::IntentFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::IntentSortBy? = nil
        )
        end
      end


      struct ListIntentsResponse
        include JSON::Serializable

        # The identifier of the bot that contains the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that contains the intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Summary information for the intents that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter of the request. If there are more
        # intents available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "intentSummaries")]
        getter intent_summaries : Array(Types::IntentSummary)?

        # The language and locale of the intents in the list.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the ListIntents
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListIntents operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @intent_summaries : Array(Types::IntentSummary)? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendedIntentsRequest
        include JSON::Serializable

        # The unique identifier of the bot associated with the recommended intents.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The identifier of the bot recommendation that contains the recommended intents.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String

        # The version of the bot that contains the recommended intents.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the recommended intents.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The maximum number of bot recommendations to return in each page of results. If there are fewer
        # results than the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListRecommendedIntents operation contains more results than specified in
        # the maxResults parameter, a token is returned in the response. Use that token in the nextToken
        # parameter to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @bot_recommendation_id : String,
          @bot_version : String,
          @locale_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendedIntentsResponse
        include JSON::Serializable

        # The unique identifier of the bot associated with the recommended intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the bot recommendation that contains the recommended intent.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String?

        # The version of the bot that contains the intent.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The identifier of the language and locale of the intents to list. The string must match one of the
        # supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the
        # ListRecommendedIntents operation. If the nextToken field is present, you send the contents as the
        # nextToken parameter of a ListRecommendedIntents operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Summary information for the intents that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter of the request. If there are more
        # intents available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "summaryList")]
        getter summary_list : Array(Types::RecommendedIntentSummary)?

        def initialize(
          @bot_id : String? = nil,
          @bot_recommendation_id : String? = nil,
          @bot_version : String? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil,
          @summary_list : Array(Types::RecommendedIntentSummary)? = nil
        )
        end
      end


      struct ListSessionAnalyticsDataRequest
        include JSON::Serializable

        # The identifier for the bot for which you want to retrieve session analytics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The date and time that marks the end of the range of time for which you want to see session
        # analytics.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # The date and time that marks the beginning of the range of time for which you want to see session
        # analytics.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        # A list of objects, each of which describes a condition by which you want to filter the results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AnalyticsSessionFilter)?

        # The maximum number of results to return in each page of results. If there are fewer results than the
        # maximum page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListSessionAnalyticsData operation contains more results than specified in
        # the maxResults parameter, a token is returned in the response. Use the returned token in the
        # nextToken parameter of a ListSessionAnalyticsData request to return the next page of results. For a
        # complete set of results, call the ListSessionAnalyticsData operation until the nextToken returned in
        # the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object specifying the measure and method by which to sort the session analytics data.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::SessionDataSortBy?

        def initialize(
          @bot_id : String,
          @end_date_time : Time,
          @start_date_time : Time,
          @filters : Array(Types::AnalyticsSessionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::SessionDataSortBy? = nil
        )
        end
      end


      struct ListSessionAnalyticsDataResponse
        include JSON::Serializable

        # The unique identifier of the bot that the sessions belong to.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # If the response from the ListSessionAnalyticsData operation contains more results than specified in
        # the maxResults parameter, a token is returned in the response. Use the returned token in the
        # nextToken parameter of a ListSessionAnalyticsData request to return the next page of results. For a
        # complete set of results, call the ListSessionAnalyticsData operation until the nextToken returned in
        # the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of objects, each of which contains information about a session with the bot.

        @[JSON::Field(key: "sessions")]
        getter sessions : Array(Types::SessionSpecification)?

        def initialize(
          @bot_id : String? = nil,
          @next_token : String? = nil,
          @sessions : Array(Types::SessionSpecification)? = nil
        )
        end
      end


      struct ListSessionMetricsRequest
        include JSON::Serializable

        # The identifier for the bot for which you want to retrieve session metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The date and time that marks the end of the range of time for which you want to see session metrics.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the method by which to organize the results.

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(Types::AnalyticsSessionMetric)

        # The date and time that marks the beginning of the range of time for which you want to see session
        # metrics.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        # A list of objects, each of which contains specifications for organizing the results by time.

        @[JSON::Field(key: "binBy")]
        getter bin_by : Array(Types::AnalyticsBinBySpecification)?

        # A list of objects, each of which describes a condition by which you want to filter the results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AnalyticsSessionFilter)?

        # A list of objects, each of which specifies how to group the results. You can group by the following
        # criteria: ConversationEndState – The final state of the conversation. The possible end states are
        # detailed in Key definitions in the user guide. LocaleId – The unique identifier of the bot locale.

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::AnalyticsSessionGroupBySpecification)?

        # The maximum number of results to return in each page of results. If there are fewer results than the
        # maximum page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListSessionMetrics operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListSessionMetrics request to return the next page of results. For a complete set of
        # results, call the ListSessionMetrics operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @end_date_time : Time,
          @metrics : Array(Types::AnalyticsSessionMetric),
          @start_date_time : Time,
          @bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
          @filters : Array(Types::AnalyticsSessionFilter)? = nil,
          @group_by : Array(Types::AnalyticsSessionGroupBySpecification)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSessionMetricsResponse
        include JSON::Serializable

        # The identifier for the bot for which you retrieved session metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # If the response from the ListSessionMetrics operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListSessionMetrics request to return the next page of results. For a complete set of
        # results, call the ListSessionMetrics operation until the nextToken returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The results for the session metrics.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::AnalyticsSessionResult)?

        def initialize(
          @bot_id : String? = nil,
          @next_token : String? = nil,
          @results : Array(Types::AnalyticsSessionResult)? = nil
        )
        end
      end


      struct ListSlotTypesRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the slot types.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the slot type.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the slot types to list. The string must match one of
        # the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # Provides the specification of a filter used to limit the slot types in the response to only those
        # that match the filter specification. You can only specify one filter and only one string to filter
        # on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SlotTypeFilter)?

        # The maximum number of slot types to return in each page of results. If there are fewer results than
        # the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListSlotTypes operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Determines the sort order for the response from the ListSlotTypes operation. You can choose to sort
        # by the slot type name or last updated date in either ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::SlotTypeSortBy?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @filters : Array(Types::SlotTypeFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::SlotTypeSortBy? = nil
        )
        end
      end


      struct ListSlotTypesResponse
        include JSON::Serializable

        # The identifier of the bot that contains the slot types.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that contains the slot types.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The language and local of the slot types in the list.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the ListSlotTypes
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListSlotTypes operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Summary information for the slot types that meet the filter criteria specified in the request. The
        # length of the list is specified in the maxResults parameter of the request. If there are more slot
        # types available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "slotTypeSummaries")]
        getter slot_type_summaries : Array(Types::SlotTypeSummary)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil,
          @slot_type_summaries : Array(Types::SlotTypeSummary)? = nil
        )
        end
      end


      struct ListSlotsRequest
        include JSON::Serializable

        # The identifier of the bot that contains the slot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the slot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The unique identifier of the intent that contains the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The identifier of the language and locale of the slots to list. The string must match one of the
        # supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # Provides the specification of a filter used to limit the slots in the response to only those that
        # match the filter specification. You can only specify one filter and only one string to filter on.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SlotFilter)?

        # The maximum number of slots to return in each page of results. If there are fewer results than the
        # max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListSlots operation contains more results than specified in the maxResults
        # parameter, a token is returned in the response. Use that token in the nextToken parameter to return
        # the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Determines the sort order for the response from the ListSlots operation. You can choose to sort by
        # the slot name or last updated date in either ascending or descending order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::SlotSortBy?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String,
          @filters : Array(Types::SlotFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::SlotSortBy? = nil
        )
        end
      end


      struct ListSlotsResponse
        include JSON::Serializable

        # The identifier of the bot that contains the slots.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that contains the slots.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The identifier of the intent that contains the slots.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The language and locale of the slots in the list.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A token that indicates whether there are more results to return in a response to the ListSlots
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListSlots operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Summary information for the slots that meet the filter criteria specified in the request. The length
        # of the list is specified in the maxResults parameter of the request. If there are more slots
        # available, the nextToken field contains a token to get the next page of results.

        @[JSON::Field(key: "slotSummaries")]
        getter slot_summaries : Array(Types::SlotSummary)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @intent_id : String? = nil,
          @locale_id : String? = nil,
          @next_token : String? = nil,
          @slot_summaries : Array(Types::SlotSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to get a list of tags for.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTestExecutionResultItemsRequest
        include JSON::Serializable

        # The filter for the list of results from the test set execution.

        @[JSON::Field(key: "resultFilterBy")]
        getter result_filter_by : Types::TestExecutionResultFilterBy

        # The unique identifier of the test execution to list the result items.

        @[JSON::Field(key: "testExecutionId")]
        getter test_execution_id : String

        # The maximum number of test execution result items to return in each page. If there are fewer results
        # than the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListTestExecutionResultItems operation contains more results than specified
        # in the maxResults parameter, a token is returned in the response. Use that token in the nextToken
        # parameter to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @result_filter_by : Types::TestExecutionResultFilterBy,
          @test_execution_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTestExecutionResultItemsResponse
        include JSON::Serializable

        # A token that indicates whether there are more results to return in a response to the
        # ListTestExecutionResultItems operation. If the nextToken field is present, you send the contents as
        # the nextToken parameter of a ListTestExecutionResultItems operation request to get the next page of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of results from the test execution.

        @[JSON::Field(key: "testExecutionResults")]
        getter test_execution_results : Types::TestExecutionResultItems?

        def initialize(
          @next_token : String? = nil,
          @test_execution_results : Types::TestExecutionResultItems? = nil
        )
        end
      end


      struct ListTestExecutionsRequest
        include JSON::Serializable

        # The maximum number of test executions to return in each page. If there are fewer results than the
        # max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListTestExecutions operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort order of the test set executions.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::TestExecutionSortBy?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::TestExecutionSortBy? = nil
        )
        end
      end


      struct ListTestExecutionsResponse
        include JSON::Serializable

        # A token that indicates whether there are more results to return in a response to the
        # ListTestExecutions operation. If the nextToken field is present, you send the contents as the
        # nextToken parameter of a ListTestExecutions operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of test executions.

        @[JSON::Field(key: "testExecutions")]
        getter test_executions : Array(Types::TestExecutionSummary)?

        def initialize(
          @next_token : String? = nil,
          @test_executions : Array(Types::TestExecutionSummary)? = nil
        )
        end
      end


      struct ListTestSetRecordsRequest
        include JSON::Serializable

        # The identifier of the test set to list its test set records.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String

        # The maximum number of test set records to return in each page. If there are fewer records than the
        # max page size, only the actual number of records are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListTestSetRecords operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @test_set_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTestSetRecordsResponse
        include JSON::Serializable

        # A token that indicates whether there are more records to return in a response to the
        # ListTestSetRecords operation. If the nextToken field is present, you send the contents as the
        # nextToken parameter of a ListTestSetRecords operation request to get the next page of records.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of records from the test set.

        @[JSON::Field(key: "testSetRecords")]
        getter test_set_records : Array(Types::TestSetTurnRecord)?

        def initialize(
          @next_token : String? = nil,
          @test_set_records : Array(Types::TestSetTurnRecord)? = nil
        )
        end
      end


      struct ListTestSetsRequest
        include JSON::Serializable

        # The maximum number of test sets to return in each page. If there are fewer results than the max page
        # size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListTestSets operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use that token in the nextToken parameter
        # to return the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort order for the list of test sets.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::TestSetSortBy?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::TestSetSortBy? = nil
        )
        end
      end


      struct ListTestSetsResponse
        include JSON::Serializable

        # A token that indicates whether there are more results to return in a response to the ListTestSets
        # operation. If the nextToken field is present, you send the contents as the nextToken parameter of a
        # ListTestSets operation request to get the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The selected test sets in a list of test sets.

        @[JSON::Field(key: "testSets")]
        getter test_sets : Array(Types::TestSetSummary)?

        def initialize(
          @next_token : String? = nil,
          @test_sets : Array(Types::TestSetSummary)? = nil
        )
        end
      end


      struct ListUtteranceAnalyticsDataRequest
        include JSON::Serializable

        # The identifier for the bot for which you want to retrieve utterance analytics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The date and time that marks the end of the range of time for which you want to see utterance
        # analytics.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # The date and time that marks the beginning of the range of time for which you want to see utterance
        # analytics.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        # A list of objects, each of which describes a condition by which you want to filter the results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AnalyticsUtteranceFilter)?

        # The maximum number of results to return in each page of results. If there are fewer results than the
        # maximum page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListUtteranceAnalyticsData operation contains more results than specified
        # in the maxResults parameter, a token is returned in the response. Use the returned token in the
        # nextToken parameter of a ListUtteranceAnalyticsData request to return the next page of results. For
        # a complete set of results, call the ListUtteranceAnalyticsData operation until the nextToken
        # returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object specifying the measure and method by which to sort the utterance analytics data.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::UtteranceDataSortBy?

        def initialize(
          @bot_id : String,
          @end_date_time : Time,
          @start_date_time : Time,
          @filters : Array(Types::AnalyticsUtteranceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::UtteranceDataSortBy? = nil
        )
        end
      end


      struct ListUtteranceAnalyticsDataResponse
        include JSON::Serializable

        # The unique identifier of the bot that the utterances belong to.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # If the response from the ListUtteranceAnalyticsData operation contains more results than specified
        # in the maxResults parameter, a token is returned in the response. Use the returned token in the
        # nextToken parameter of a ListUtteranceAnalyticsData request to return the next page of results. For
        # a complete set of results, call the ListUtteranceAnalyticsData operation until the nextToken
        # returned in the response is null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of objects, each of which contains information about an utterance in a user session with your
        # bot.

        @[JSON::Field(key: "utterances")]
        getter utterances : Array(Types::UtteranceSpecification)?

        def initialize(
          @bot_id : String? = nil,
          @next_token : String? = nil,
          @utterances : Array(Types::UtteranceSpecification)? = nil
        )
        end
      end


      struct ListUtteranceMetricsRequest
        include JSON::Serializable

        # The identifier for the bot for which you want to retrieve utterance metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The date and time that marks the end of the range of time for which you want to see utterance
        # metrics.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : Time

        # A list of objects, each of which contains a metric you want to list, the statistic for the metric
        # you want to return, and the method by which to organize the results.

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(Types::AnalyticsUtteranceMetric)

        # The date and time that marks the beginning of the range of time for which you want to see utterance
        # metrics.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : Time

        # A list containing attributes related to the utterance that you want the response to return. The
        # following attributes are possible: LastUsedIntent – The last used intent at the time of the
        # utterance.

        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::AnalyticsUtteranceAttribute)?

        # A list of objects, each of which contains specifications for organizing the results by time.

        @[JSON::Field(key: "binBy")]
        getter bin_by : Array(Types::AnalyticsBinBySpecification)?

        # A list of objects, each of which describes a condition by which you want to filter the results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AnalyticsUtteranceFilter)?

        # A list of objects, each of which specifies how to group the results. You can group by the following
        # criteria: UtteranceText – The transcription of the utterance. UtteranceState – The state of the
        # utterance. The possible states are detailed in Key definitions in the user guide.

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::AnalyticsUtteranceGroupBySpecification)?

        # The maximum number of results to return in each page of results. If there are fewer results than the
        # maximum page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the ListUtteranceMetrics operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListUtteranceMetrics request to return the next page of results. For a complete set
        # of results, call the ListUtteranceMetrics operation until the nextToken returned in the response is
        # null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_id : String,
          @end_date_time : Time,
          @metrics : Array(Types::AnalyticsUtteranceMetric),
          @start_date_time : Time,
          @attributes : Array(Types::AnalyticsUtteranceAttribute)? = nil,
          @bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
          @filters : Array(Types::AnalyticsUtteranceFilter)? = nil,
          @group_by : Array(Types::AnalyticsUtteranceGroupBySpecification)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListUtteranceMetricsResponse
        include JSON::Serializable

        # The identifier for the bot for which you retrieved utterance metrics.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # If the response from the ListUtteranceMetrics operation contains more results than specified in the
        # maxResults parameter, a token is returned in the response. Use the returned token in the nextToken
        # parameter of a ListUtteranceMetrics request to return the next page of results. For a complete set
        # of results, call the ListUtteranceMetrics operation until the nextToken returned in the response is
        # null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The results for the utterance metrics.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::AnalyticsUtteranceResult)?

        def initialize(
          @bot_id : String? = nil,
          @next_token : String? = nil,
          @results : Array(Types::AnalyticsUtteranceResult)? = nil
        )
        end
      end

      # The object that provides message text and its type.

      struct Message
        include JSON::Serializable

        # A message in a custom format defined by the client application.

        @[JSON::Field(key: "customPayload")]
        getter custom_payload : Types::CustomPayload?

        # A message that defines a response card that the client application can show to the user.

        @[JSON::Field(key: "imageResponseCard")]
        getter image_response_card : Types::ImageResponseCard?

        # A message in plain text format.

        @[JSON::Field(key: "plainTextMessage")]
        getter plain_text_message : Types::PlainTextMessage?

        # A message in Speech Synthesis Markup Language (SSML).

        @[JSON::Field(key: "ssmlMessage")]
        getter ssml_message : Types::SSMLMessage?

        def initialize(
          @custom_payload : Types::CustomPayload? = nil,
          @image_response_card : Types::ImageResponseCard? = nil,
          @plain_text_message : Types::PlainTextMessage? = nil,
          @ssml_message : Types::SSMLMessage? = nil
        )
        end
      end

      # Provides one or more messages that Amazon Lex should send to the user.

      struct MessageGroup
        include JSON::Serializable

        # The primary message that Amazon Lex should send to the user.

        @[JSON::Field(key: "message")]
        getter message : Types::Message

        # Message variations to send to the user. When variations are defined, Amazon Lex chooses the primary
        # message or one of the variations to send to the user.

        @[JSON::Field(key: "variations")]
        getter variations : Array(Types::Message)?

        def initialize(
          @message : Types::Message,
          @variations : Array(Types::Message)? = nil
        )
        end
      end

      # Indicates whether a slot can return multiple values.

      struct MultipleValuesSetting
        include JSON::Serializable

        # Indicates whether a slot can return multiple values. When true , the slot may return more than one
        # value in a response. When false , the slot returns only a single value. Multi-value slots are only
        # available in the en-US locale. If you set this value to true in any other locale, Amazon Lex throws
        # a ValidationException . If the allowMutlipleValues is not set, the default value is false .

        @[JSON::Field(key: "allowMultipleValues")]
        getter allow_multiple_values : Bool?

        def initialize(
          @allow_multiple_values : Bool? = nil
        )
        end
      end

      # The new custom vocabulary item from the custom vocabulary list.

      struct NewCustomVocabularyItem
        include JSON::Serializable

        # The unique phrase for the new custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "phrase")]
        getter phrase : String

        # The display as value assigned to the new custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "displayAs")]
        getter display_as : String?

        # The weight assigned to the new custom vocabulary item from the custom vocabulary list.

        @[JSON::Field(key: "weight")]
        getter weight : Int32?

        def initialize(
          @phrase : String,
          @display_as : String? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # Configures the Assisted Natural Language Understanding (NLU) feature for your bot. This
      # specification determines whether enhanced intent recognition and utterance understanding
      # capabilities are active.

      struct NluImprovementSpecification
        include JSON::Serializable

        # Determines whether the Assisted NLU feature is enabled for the bot. When set to true , Amazon Lex
        # uses advanced models to improve intent recognition and slot resolution, with the default being false
        # .

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # Specifies the mode for Assisted NLU operation. Use Primary to make Assisted NLU the primary intent
        # recognition method, or Fallback to use it only when standard NLU confidence is low.

        @[JSON::Field(key: "assistedNluMode")]
        getter assisted_nlu_mode : String?

        # An object containing specifications for the Intent Disambiguation feature within the Assisted NLU
        # settings. These settings determine how the bot handles ambiguous user inputs that could match
        # multiple intents.

        @[JSON::Field(key: "intentDisambiguationSettings")]
        getter intent_disambiguation_settings : Types::IntentDisambiguationSettings?

        def initialize(
          @enabled : Bool,
          @assisted_nlu_mode : String? = nil,
          @intent_disambiguation_settings : Types::IntentDisambiguationSettings? = nil
        )
        end
      end

      # Determines whether Amazon Lex obscures slot values in conversation logs.

      struct ObfuscationSetting
        include JSON::Serializable

        # Value that determines whether Amazon Lex obscures slot values in conversation logs. The default is
        # to obscure the values.

        @[JSON::Field(key: "obfuscationSettingType")]
        getter obfuscation_setting_type : String

        def initialize(
          @obfuscation_setting_type : String
        )
        end
      end

      # Contains details about the configuration of the Amazon OpenSearch Service database used for the
      # AMAZON.QnAIntent .

      struct OpensearchConfiguration
        include JSON::Serializable

        # The endpoint of the Amazon OpenSearch Service domain.

        @[JSON::Field(key: "domainEndpoint")]
        getter domain_endpoint : String

        # The name of the Amazon OpenSearch Service index.

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        # Specifies whether to return an exact response or to return an answer generated by the model using
        # the fields you specify from the database.

        @[JSON::Field(key: "exactResponse")]
        getter exact_response : Bool?

        # Contains the names of the fields used for an exact response to the user.

        @[JSON::Field(key: "exactResponseFields")]
        getter exact_response_fields : Types::ExactResponseFields?

        # Contains a list of fields from the Amazon OpenSearch Service that the model can use to generate the
        # answer to the query.

        @[JSON::Field(key: "includeFields")]
        getter include_fields : Array(String)?

        def initialize(
          @domain_endpoint : String,
          @index_name : String,
          @exact_response : Bool? = nil,
          @exact_response_fields : Types::ExactResponseFields? = nil,
          @include_fields : Array(String)? = nil
        )
        end
      end

      # Describes a session context that is activated when an intent is fulfilled.

      struct OutputContext
        include JSON::Serializable

        # The name of the output context.

        @[JSON::Field(key: "name")]
        getter name : String

        # The amount of time, in seconds, that the output context should remain active. The time is figured
        # from the first time the context is sent to the user.

        @[JSON::Field(key: "timeToLiveInSeconds")]
        getter time_to_live_in_seconds : Int32

        # The number of conversation turns that the output context should remain active. The number of turns
        # is counted from the first time that the context is sent to the user.

        @[JSON::Field(key: "turnsToLive")]
        getter turns_to_live : Int32

        def initialize(
          @name : String,
          @time_to_live_in_seconds : Int32,
          @turns_to_live : Int32
        )
        end
      end

      # Information about the overall results for a test execution result.

      struct OverallTestResultItem
        include JSON::Serializable

        # The number of results that succeeded.

        @[JSON::Field(key: "endToEndResultCounts")]
        getter end_to_end_result_counts : Hash(String, Int32)

        # Indicates whether the conversation contains multiple turns or not.

        @[JSON::Field(key: "multiTurnConversation")]
        getter multi_turn_conversation : Bool

        # The total number of overall results in the result of the test execution.

        @[JSON::Field(key: "totalResultCount")]
        getter total_result_count : Int32

        # The number of speech transcription results in the overall test.

        @[JSON::Field(key: "speechTranscriptionResultCounts")]
        getter speech_transcription_result_counts : Hash(String, Int32)?

        def initialize(
          @end_to_end_result_counts : Hash(String, Int32),
          @multi_turn_conversation : Bool,
          @total_result_count : Int32,
          @speech_transcription_result_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # Information about the overall test results.

      struct OverallTestResults
        include JSON::Serializable

        # A list of the overall test results.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::OverallTestResultItem)

        def initialize(
          @items : Array(Types::OverallTestResultItem)
        )
        end
      end

      # A network of bots.

      struct ParentBotNetwork
        include JSON::Serializable

        # The identifier of the network of bots assigned by Amazon Lex.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the network of bots.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        def initialize(
          @bot_id : String,
          @bot_version : String
        )
        end
      end

      # The object that contains a path format that will be applied when Amazon Lex reads the transcript
      # file in the bucket you provide. Specify this object if you only want Lex to read a subset of files
      # in your Amazon S3 bucket.

      struct PathFormat
        include JSON::Serializable

        # A list of Amazon S3 prefixes that points to sub-folders in the Amazon S3 bucket. Specify this list
        # if you only want Lex to read the files under this set of sub-folders.

        @[JSON::Field(key: "objectPrefixes")]
        getter object_prefixes : Array(String)?

        def initialize(
          @object_prefixes : Array(String)? = nil
        )
        end
      end

      # Defines an ASCII text message to send to the user.

      struct PlainTextMessage
        include JSON::Serializable

        # The message to send to the user.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # Specifies next steps to run after the dialog code hook finishes.

      struct PostDialogCodeHookInvocationSpecification
        include JSON::Serializable

        # A list of conditional branches to evaluate after the dialog code hook throws an exception or returns
        # with the State field of the Intent object set to Failed .

        @[JSON::Field(key: "failureConditional")]
        getter failure_conditional : Types::ConditionalSpecification?

        # Specifies the next step the bot runs after the dialog code hook throws an exception or returns with
        # the State field of the Intent object set to Failed .

        @[JSON::Field(key: "failureNextStep")]
        getter failure_next_step : Types::DialogState?


        @[JSON::Field(key: "failureResponse")]
        getter failure_response : Types::ResponseSpecification?

        # A list of conditional branches to evaluate after the dialog code hook finishes successfully.

        @[JSON::Field(key: "successConditional")]
        getter success_conditional : Types::ConditionalSpecification?

        # Specifics the next step the bot runs after the dialog code hook finishes successfully.

        @[JSON::Field(key: "successNextStep")]
        getter success_next_step : Types::DialogState?


        @[JSON::Field(key: "successResponse")]
        getter success_response : Types::ResponseSpecification?

        # A list of conditional branches to evaluate if the code hook times out.

        @[JSON::Field(key: "timeoutConditional")]
        getter timeout_conditional : Types::ConditionalSpecification?

        # Specifies the next step that the bot runs when the code hook times out.

        @[JSON::Field(key: "timeoutNextStep")]
        getter timeout_next_step : Types::DialogState?


        @[JSON::Field(key: "timeoutResponse")]
        getter timeout_response : Types::ResponseSpecification?

        def initialize(
          @failure_conditional : Types::ConditionalSpecification? = nil,
          @failure_next_step : Types::DialogState? = nil,
          @failure_response : Types::ResponseSpecification? = nil,
          @success_conditional : Types::ConditionalSpecification? = nil,
          @success_next_step : Types::DialogState? = nil,
          @success_response : Types::ResponseSpecification? = nil,
          @timeout_conditional : Types::ConditionalSpecification? = nil,
          @timeout_next_step : Types::DialogState? = nil,
          @timeout_response : Types::ResponseSpecification? = nil
        )
        end
      end

      # Provides a setting that determines whether the post-fulfillment response is sent to the user. For
      # more information, see
      # https://docs.aws.amazon.com/lexv2/latest/dg/streaming-progress.html#progress-complete

      struct PostFulfillmentStatusSpecification
        include JSON::Serializable

        # A list of conditional branches to evaluate after the fulfillment code hook throws an exception or
        # returns with the State field of the Intent object set to Failed .

        @[JSON::Field(key: "failureConditional")]
        getter failure_conditional : Types::ConditionalSpecification?

        # Specifies the next step the bot runs after the fulfillment code hook throws an exception or returns
        # with the State field of the Intent object set to Failed .

        @[JSON::Field(key: "failureNextStep")]
        getter failure_next_step : Types::DialogState?


        @[JSON::Field(key: "failureResponse")]
        getter failure_response : Types::ResponseSpecification?

        # A list of conditional branches to evaluate after the fulfillment code hook finishes successfully.

        @[JSON::Field(key: "successConditional")]
        getter success_conditional : Types::ConditionalSpecification?

        # Specifies the next step in the conversation that Amazon Lex invokes when the fulfillment code hook
        # completes successfully.

        @[JSON::Field(key: "successNextStep")]
        getter success_next_step : Types::DialogState?


        @[JSON::Field(key: "successResponse")]
        getter success_response : Types::ResponseSpecification?

        # A list of conditional branches to evaluate if the fulfillment code hook times out.

        @[JSON::Field(key: "timeoutConditional")]
        getter timeout_conditional : Types::ConditionalSpecification?

        # Specifies the next step that the bot runs when the fulfillment code hook times out.

        @[JSON::Field(key: "timeoutNextStep")]
        getter timeout_next_step : Types::DialogState?


        @[JSON::Field(key: "timeoutResponse")]
        getter timeout_response : Types::ResponseSpecification?

        def initialize(
          @failure_conditional : Types::ConditionalSpecification? = nil,
          @failure_next_step : Types::DialogState? = nil,
          @failure_response : Types::ResponseSpecification? = nil,
          @success_conditional : Types::ConditionalSpecification? = nil,
          @success_next_step : Types::DialogState? = nil,
          @success_response : Types::ResponseSpecification? = nil,
          @timeout_conditional : Types::ConditionalSpecification? = nil,
          @timeout_next_step : Types::DialogState? = nil,
          @timeout_response : Types::ResponseSpecification? = nil
        )
        end
      end

      # Your request couldn't be completed because one or more request fields aren't valid. Check the fields
      # in your request and try again.

      struct PreconditionFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The IAM principal that you allowing or denying access to an Amazon Lex action. You must provide a
      # service or an arn , but not both in the same statement. For more information, see AWS JSON policy
      # elements: Principal .

      struct Principal
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the principal.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the Amazon Web Services service that should allowed or denied access to an Amazon Lex
        # action.

        @[JSON::Field(key: "service")]
        getter service : String?

        def initialize(
          @arn : String? = nil,
          @service : String? = nil
        )
        end
      end

      # Specifies the settings on a prompt attempt.

      struct PromptAttemptSpecification
        include JSON::Serializable

        # Indicates the allowed input types of the prompt attempt.

        @[JSON::Field(key: "allowedInputTypes")]
        getter allowed_input_types : Types::AllowedInputTypes

        # Indicates whether the user can interrupt a speech prompt attempt from the bot.

        @[JSON::Field(key: "allowInterrupt")]
        getter allow_interrupt : Bool?

        # Specifies the settings on audio and DTMF input.

        @[JSON::Field(key: "audioAndDTMFInputSpecification")]
        getter audio_and_dtmf_input_specification : Types::AudioAndDTMFInputSpecification?

        # Specifies the settings on text input.

        @[JSON::Field(key: "textInputSpecification")]
        getter text_input_specification : Types::TextInputSpecification?

        def initialize(
          @allowed_input_types : Types::AllowedInputTypes,
          @allow_interrupt : Bool? = nil,
          @audio_and_dtmf_input_specification : Types::AudioAndDTMFInputSpecification? = nil,
          @text_input_specification : Types::TextInputSpecification? = nil
        )
        end
      end

      # Specifies a list of message groups that Amazon Lex sends to a user to elicit a response.

      struct PromptSpecification
        include JSON::Serializable

        # The maximum number of times the bot tries to elicit a response from the user using this prompt.

        @[JSON::Field(key: "maxRetries")]
        getter max_retries : Int32

        # A collection of messages that Amazon Lex can send to the user. Amazon Lex chooses the actual message
        # to send at runtime.

        @[JSON::Field(key: "messageGroups")]
        getter message_groups : Array(Types::MessageGroup)

        # Indicates whether the user can interrupt a speech prompt from the bot.

        @[JSON::Field(key: "allowInterrupt")]
        getter allow_interrupt : Bool?

        # Indicates how a message is selected from a message group among retries.

        @[JSON::Field(key: "messageSelectionStrategy")]
        getter message_selection_strategy : String?

        # Specifies the advanced settings on each attempt of the prompt.

        @[JSON::Field(key: "promptAttemptsSpecification")]
        getter prompt_attempts_specification : Hash(String, Types::PromptAttemptSpecification)?

        def initialize(
          @max_retries : Int32,
          @message_groups : Array(Types::MessageGroup),
          @allow_interrupt : Bool? = nil,
          @message_selection_strategy : String? = nil,
          @prompt_attempts_specification : Hash(String, Types::PromptAttemptSpecification)? = nil
        )
        end
      end

      # The configuration details of the Qinconnect assistant.

      struct QInConnectAssistantConfiguration
        include JSON::Serializable

        # The assistant Arn details of the Qinconnect assistant configuration.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        def initialize(
          @assistant_arn : String
        )
        end
      end

      # The configuration details of the Qinconnect intent.

      struct QInConnectIntentConfiguration
        include JSON::Serializable

        # The Qinconnect assistant configuration details of the Qinconnect intent.

        @[JSON::Field(key: "qInConnectAssistantConfiguration")]
        getter q_in_connect_assistant_configuration : Types::QInConnectAssistantConfiguration?

        def initialize(
          @q_in_connect_assistant_configuration : Types::QInConnectAssistantConfiguration? = nil
        )
        end
      end

      # Details about the the configuration of the built-in Amazon.QnAIntent .

      struct QnAIntentConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "bedrockModelConfiguration")]
        getter bedrock_model_configuration : Types::BedrockModelSpecification?

        # Contains details about the configuration of the data source used for the AMAZON.QnAIntent .

        @[JSON::Field(key: "dataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration?

        def initialize(
          @bedrock_model_configuration : Types::BedrockModelSpecification? = nil,
          @data_source_configuration : Types::DataSourceConfiguration? = nil
        )
        end
      end

      # Contains details about the configuration of the Amazon Kendra index used for the AMAZON.QnAIntent .

      struct QnAKendraConfiguration
        include JSON::Serializable

        # The ARN of the Amazon Kendra index to use.

        @[JSON::Field(key: "kendraIndex")]
        getter kendra_index : String

        # Specifies whether to return an exact response from the Amazon Kendra index or to let the Amazon
        # Bedrock model you select generate a response based on the results. To use this feature, you must
        # first add FAQ questions to your index by following the steps at Adding frequently asked questions
        # (FAQs) to an index .

        @[JSON::Field(key: "exactResponse")]
        getter exact_response : Bool?

        # Contains the Amazon Kendra filter string to use if enabled. For more information on the Amazon
        # Kendra search filter JSON format, see Using document attributes to filter search results .

        @[JSON::Field(key: "queryFilterString")]
        getter query_filter_string : String?

        # Specifies whether to enable an Amazon Kendra filter string or not.

        @[JSON::Field(key: "queryFilterStringEnabled")]
        getter query_filter_string_enabled : Bool?

        def initialize(
          @kendra_index : String,
          @exact_response : Bool? = nil,
          @query_filter_string : String? = nil,
          @query_filter_string_enabled : Bool? = nil
        )
        end
      end

      # An object that contains a summary of a recommended intent.

      struct RecommendedIntentSummary
        include JSON::Serializable

        # The unique identifier of a recommended intent associated with the bot recommendation.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The name of a recommended intent associated with the bot recommendation.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # The count of sample utterances of a recommended intent that is associated with a bot recommendation.

        @[JSON::Field(key: "sampleUtterancesCount")]
        getter sample_utterances_count : Int32?

        def initialize(
          @intent_id : String? = nil,
          @intent_name : String? = nil,
          @sample_utterances_count : Int32? = nil
        )
        end
      end

      # Specifies the time window that utterance statistics are returned for. The time window is always
      # relative to the last time that the that utterances were aggregated. For example, if the
      # ListAggregatedUtterances operation is called at 1600, the time window is set to 1 hour, and the last
      # refresh time was 1530, only utterances made between 1430 and 1530 are returned. You can choose the
      # time window that statistics should be returned for. Hours - You can request utterance statistics for
      # 1, 3, 6, 12, or 24 hour time windows. Statistics are refreshed every half hour for 1 hour time
      # windows, and hourly for the other time windows. Days - You can request utterance statistics for 3
      # days. Statistics are refreshed every 6 hours. Weeks - You can see statistics for one or two weeks.
      # Statistics are refreshed every 12 hours for one week time windows, and once per day for two week
      # time windows.

      struct RelativeAggregationDuration
        include JSON::Serializable

        # The type of time period that the timeValue field represents.

        @[JSON::Field(key: "timeDimension")]
        getter time_dimension : String

        # The period of the time window to gather statistics for. The valid value depends on the setting of
        # the timeDimension field. Hours - 1/3/6/12/24 Days - 3 Weeks - 1/2

        @[JSON::Field(key: "timeValue")]
        getter time_value : Int32

        def initialize(
          @time_dimension : String,
          @time_value : Int32
        )
        end
      end

      # You asked to describe a resource that doesn't exist. Check the resource that you are requesting and
      # try again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies a list of message groups that Amazon Lex uses to respond the user input.

      struct ResponseSpecification
        include JSON::Serializable

        # A collection of responses that Amazon Lex can send to the user. Amazon Lex chooses the actual
        # response to send at runtime.

        @[JSON::Field(key: "messageGroups")]
        getter message_groups : Array(Types::MessageGroup)

        # Indicates whether the user can interrupt a speech response from Amazon Lex.

        @[JSON::Field(key: "allowInterrupt")]
        getter allow_interrupt : Bool?

        def initialize(
          @message_groups : Array(Types::MessageGroup),
          @allow_interrupt : Bool? = nil
        )
        end
      end

      # Provides an array of phrases that should be given preference when resolving values for a slot.

      struct RuntimeHintDetails
        include JSON::Serializable

        # One or more strings that Amazon Lex should look for in the input to the bot. Each phrase is given
        # preference when deciding on slot values.

        @[JSON::Field(key: "runtimeHintValues")]
        getter runtime_hint_values : Array(Types::RuntimeHintValue)?

        # A map of constituent sub slot names inside a composite slot in the intent and the phrases that
        # should be added for each sub slot. Inside each composite slot hints, this structure provides a
        # mechanism to add granular sub slot phrases. Only sub slot hints are supported for composite slots.
        # The intent name, composite slot name and the constituent sub slot names must exist.

        @[JSON::Field(key: "subSlotHints")]
        getter sub_slot_hints : Hash(String, Types::RuntimeHintDetails)?

        def initialize(
          @runtime_hint_values : Array(Types::RuntimeHintValue)? = nil,
          @sub_slot_hints : Hash(String, Types::RuntimeHintDetails)? = nil
        )
        end
      end

      # Provides the phrase that Amazon Lex should look for in the user's input to the bot.

      struct RuntimeHintValue
        include JSON::Serializable

        # The phrase that Amazon Lex should look for in the user's input to the bot.

        @[JSON::Field(key: "phrase")]
        getter phrase : String

        def initialize(
          @phrase : String
        )
        end
      end

      # You can provide Amazon Lex with hints to the phrases that a customer is likely to use for a slot.
      # When a slot with hints is resolved, the phrases in the runtime hints are preferred in the
      # resolution. You can provide hints for a maximum of 100 intents. You can provide a maximum of 100
      # slots. Before you can use runtime hints with an existing bot, you must first rebuild the bot. For
      # more information, see Using runtime hints to improve recognition of slot values .

      struct RuntimeHints
        include JSON::Serializable

        # A list of the slots in the intent that should have runtime hints added, and the phrases that should
        # be added for each slot. The first level of the slotHints map is the name of the intent. The second
        # level is the name of the slot within the intent. For more information, see Using hints to improve
        # accuracy . The intent name and slot name must exist.

        @[JSON::Field(key: "slotHints")]
        getter slot_hints : Hash(String, Hash(String, Types::RuntimeHintDetails))?

        def initialize(
          @slot_hints : Hash(String, Hash(String, Types::RuntimeHintDetails))? = nil
        )
        end
      end

      # Contains specifications about the Amazon Lex runtime generative AI capabilities from Amazon Bedrock
      # that you can turn on for your bot.

      struct RuntimeSettings
        include JSON::Serializable

        # An object containing specifications for the Assisted NLU feature within the bot's runtime settings.
        # These settings determine how the bot processes and interprets user utterances during conversations.

        @[JSON::Field(key: "nluImprovement")]
        getter nlu_improvement : Types::NluImprovementSpecification?

        # An object containing specifications for the assisted slot resolution feature.

        @[JSON::Field(key: "slotResolutionImprovement")]
        getter slot_resolution_improvement : Types::SlotResolutionImprovementSpecification?

        def initialize(
          @nlu_improvement : Types::NluImprovementSpecification? = nil,
          @slot_resolution_improvement : Types::SlotResolutionImprovementSpecification? = nil
        )
        end
      end

      # Specifies an Amazon S3 bucket for logging audio conversations

      struct S3BucketLogDestination
        include JSON::Serializable

        # The S3 prefix to assign to audio log files.

        @[JSON::Field(key: "logPrefix")]
        getter log_prefix : String

        # The Amazon Resource Name (ARN) of an Amazon S3 bucket where audio log files are stored.

        @[JSON::Field(key: "s3BucketArn")]
        getter s3_bucket_arn : String

        # The Amazon Resource Name (ARN) of an Amazon Web Services Key Management Service (KMS) key for
        # encrypting audio log files stored in an S3 bucket.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @log_prefix : String,
          @s3_bucket_arn : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # The object representing the Amazon S3 bucket containing the transcript, as well as the associated
      # metadata.

      struct S3BucketTranscriptSource
        include JSON::Serializable

        # The name of the bucket containing the transcript and the associated metadata.

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String

        # The format of the transcript content. Currently, Genie only supports the Amazon Lex transcript
        # format.

        @[JSON::Field(key: "transcriptFormat")]
        getter transcript_format : String

        # The ARN of the KMS key that customer use to encrypt their Amazon S3 bucket. Only use this field if
        # your bucket is encrypted using a customer managed KMS key.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The object that contains a path format that will be applied when Amazon Lex reads the transcript
        # file in the bucket you provide. Specify this object if you only want Lex to read a subset of files
        # in your Amazon S3 bucket.

        @[JSON::Field(key: "pathFormat")]
        getter path_format : Types::PathFormat?

        # The object that contains the filter which will be applied when Amazon Lex reads through the Amazon
        # S3 bucket. Specify this object if you want Amazon Lex to read only a subset of the Amazon S3 bucket
        # based on the filter you provide.

        @[JSON::Field(key: "transcriptFilter")]
        getter transcript_filter : Types::TranscriptFilter?

        def initialize(
          @s3_bucket_name : String,
          @transcript_format : String,
          @kms_key_arn : String? = nil,
          @path_format : Types::PathFormat? = nil,
          @transcript_filter : Types::TranscriptFilter? = nil
        )
        end
      end

      # Defines a Speech Synthesis Markup Language (SSML) prompt.

      struct SSMLMessage
        include JSON::Serializable

        # The SSML text that defines the prompt.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # A sample utterance that invokes an intent or respond to a slot elicitation prompt.

      struct SampleUtterance
        include JSON::Serializable

        # The sample utterance that Amazon Lex uses to build its machine-learning model to recognize intents.

        @[JSON::Field(key: "utterance")]
        getter utterance : String

        def initialize(
          @utterance : String
        )
        end
      end

      # Contains specifications for the sample utterance generation feature.

      struct SampleUtteranceGenerationSpecification
        include JSON::Serializable

        # Specifies whether to enable sample utterance generation or not.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool


        @[JSON::Field(key: "bedrockModelSpecification")]
        getter bedrock_model_specification : Types::BedrockModelSpecification?

        def initialize(
          @enabled : Bool,
          @bedrock_model_specification : Types::BedrockModelSpecification? = nil
        )
        end
      end

      # Defines one of the values for a slot type.

      struct SampleValue
        include JSON::Serializable

        # The value that can be used for a slot type.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end


      struct SearchAssociatedTranscriptsRequest
        include JSON::Serializable

        # The unique identifier of the bot associated with the transcripts that you are searching.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The unique identifier of the bot recommendation associated with the transcripts to search.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String

        # The version of the bot containing the transcripts that you are searching.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # A list of filter objects.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AssociatedTranscriptFilter)

        # The identifier of the language and locale of the transcripts to search. The string must match one of
        # the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The maximum number of bot recommendations to return in each page of results. If there are fewer
        # results than the max page size, only the actual number of results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response from the SearchAssociatedTranscriptsRequest operation contains more results than
        # specified in the maxResults parameter, an index is returned in the response. Use that index in the
        # nextIndex parameter to return the next page of results.

        @[JSON::Field(key: "nextIndex")]
        getter next_index : Int32?

        # How SearchResults are ordered. Valid values are Ascending or Descending. The default is Descending.

        @[JSON::Field(key: "searchOrder")]
        getter search_order : String?

        def initialize(
          @bot_id : String,
          @bot_recommendation_id : String,
          @bot_version : String,
          @filters : Array(Types::AssociatedTranscriptFilter),
          @locale_id : String,
          @max_results : Int32? = nil,
          @next_index : Int32? = nil,
          @search_order : String? = nil
        )
        end
      end


      struct SearchAssociatedTranscriptsResponse
        include JSON::Serializable

        # The object that contains the associated transcript that meet the criteria you specified.

        @[JSON::Field(key: "associatedTranscripts")]
        getter associated_transcripts : Array(Types::AssociatedTranscript)?

        # The unique identifier of the bot associated with the transcripts that you are searching.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The unique identifier of the bot recommendation associated with the transcripts to search.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String?

        # The version of the bot containing the transcripts that you are searching.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The identifier of the language and locale of the transcripts to search. The string must match one of
        # the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # A index that indicates whether there are more results to return in a response to the
        # SearchAssociatedTranscripts operation. If the nextIndex field is present, you send the contents as
        # the nextIndex parameter of a SearchAssociatedTranscriptsRequest operation to get the next page of
        # results.

        @[JSON::Field(key: "nextIndex")]
        getter next_index : Int32?

        # The total number of transcripts returned by the search.

        @[JSON::Field(key: "totalResults")]
        getter total_results : Int32?

        def initialize(
          @associated_transcripts : Array(Types::AssociatedTranscript)? = nil,
          @bot_id : String? = nil,
          @bot_recommendation_id : String? = nil,
          @bot_version : String? = nil,
          @locale_id : String? = nil,
          @next_index : Int32? = nil,
          @total_results : Int32? = nil
        )
        end
      end

      # Determines whether Amazon Lex will use Amazon Comprehend to detect the sentiment of user utterances.

      struct SentimentAnalysisSettings
        include JSON::Serializable

        # Sets whether Amazon Lex uses Amazon Comprehend to detect the sentiment of user utterances.

        @[JSON::Field(key: "detectSentiment")]
        getter detect_sentiment : Bool

        def initialize(
          @detect_sentiment : Bool
        )
        end
      end

      # You have reached a quota for your bot.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object specifying the measure and method by which to sort the session analytics data.

      struct SessionDataSortBy
        include JSON::Serializable

        # The measure by which to sort the session analytics data. conversationStartTime – The date and time
        # when the conversation began. A conversation is defined as a unique combination of a sessionId and an
        # originatingRequestId . numberOfTurns – The number of turns that the session took.
        # conversationDurationSeconds – The duration of the conversation in seconds.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether to sort the results in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @name : String,
          @order : String
        )
        end
      end

      # An object containing information about a specific session.

      struct SessionSpecification
        include JSON::Serializable

        # The identifier of the alias of the bot that the session was held with.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The version of the bot that the session was held with.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The channel that is integrated with the bot that the session was held with.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The duration of the conversation in seconds. A conversation is defined as a unique combination of a
        # sessionId and an originatingRequestId .

        @[JSON::Field(key: "conversationDurationSeconds")]
        getter conversation_duration_seconds : Int64?

        # The final state of the conversation. A conversation is defined as a unique combination of a
        # sessionId and an originatingRequestId .

        @[JSON::Field(key: "conversationEndState")]
        getter conversation_end_state : String?

        # The date and time when the conversation ended. A conversation is defined as a unique combination of
        # a sessionId and an originatingRequestId .

        @[JSON::Field(key: "conversationEndTime")]
        getter conversation_end_time : Time?

        # The date and time when the conversation began. A conversation is defined as a unique combination of
        # a sessionId and an originatingRequestId .

        @[JSON::Field(key: "conversationStartTime")]
        getter conversation_start_time : Time?

        # A list of objects containing the name of an intent that was invoked.

        @[JSON::Field(key: "invokedIntentSamples")]
        getter invoked_intent_samples : Array(Types::InvokedIntentSample)?

        # The locale of the bot that the session was held with.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The mode of the session. The possible values are as follows: Speech – The session was spoken. Text –
        # The session was written. DTMF – The session used a touch-tone keypad (Dual Tone Multi-Frequency).
        # MultiMode – The session used multiple modes.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The number of turns that the session took.

        @[JSON::Field(key: "numberOfTurns")]
        getter number_of_turns : Int64?

        # The identifier of the first request in a session.

        @[JSON::Field(key: "originatingRequestId")]
        getter originating_request_id : String?

        # The identifier of the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @bot_alias_id : String? = nil,
          @bot_version : String? = nil,
          @channel : String? = nil,
          @conversation_duration_seconds : Int64? = nil,
          @conversation_end_state : String? = nil,
          @conversation_end_time : Time? = nil,
          @conversation_start_time : Time? = nil,
          @invoked_intent_samples : Array(Types::InvokedIntentSample)? = nil,
          @locale_id : String? = nil,
          @mode : String? = nil,
          @number_of_turns : Int64? = nil,
          @originating_request_id : String? = nil,
          @session_id : String? = nil
        )
        end
      end

      # Settings used when Amazon Lex successfully captures a slot value from a user.

      struct SlotCaptureSetting
        include JSON::Serializable

        # A list of conditional branches to evaluate after the slot value is captured.

        @[JSON::Field(key: "captureConditional")]
        getter capture_conditional : Types::ConditionalSpecification?

        # Specifies the next step that the bot runs when the slot value is captured before the code hook times
        # out.

        @[JSON::Field(key: "captureNextStep")]
        getter capture_next_step : Types::DialogState?


        @[JSON::Field(key: "captureResponse")]
        getter capture_response : Types::ResponseSpecification?

        # Code hook called after Amazon Lex successfully captures a slot value.

        @[JSON::Field(key: "codeHook")]
        getter code_hook : Types::DialogCodeHookInvocationSetting?

        # Code hook called when Amazon Lex doesn't capture a slot value.

        @[JSON::Field(key: "elicitationCodeHook")]
        getter elicitation_code_hook : Types::ElicitationCodeHookInvocationSetting?

        # A list of conditional branches to evaluate when the slot value isn't captured.

        @[JSON::Field(key: "failureConditional")]
        getter failure_conditional : Types::ConditionalSpecification?

        # Specifies the next step that the bot runs when the slot value code is not recognized.

        @[JSON::Field(key: "failureNextStep")]
        getter failure_next_step : Types::DialogState?


        @[JSON::Field(key: "failureResponse")]
        getter failure_response : Types::ResponseSpecification?

        def initialize(
          @capture_conditional : Types::ConditionalSpecification? = nil,
          @capture_next_step : Types::DialogState? = nil,
          @capture_response : Types::ResponseSpecification? = nil,
          @code_hook : Types::DialogCodeHookInvocationSetting? = nil,
          @elicitation_code_hook : Types::ElicitationCodeHookInvocationSetting? = nil,
          @failure_conditional : Types::ConditionalSpecification? = nil,
          @failure_next_step : Types::DialogState? = nil,
          @failure_response : Types::ResponseSpecification? = nil
        )
        end
      end

      # Specifies the default value to use when a user doesn't provide a value for a slot.

      struct SlotDefaultValue
        include JSON::Serializable

        # The default value to use when a user doesn't provide a value for a slot.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String

        def initialize(
          @default_value : String
        )
        end
      end

      # Defines a list of values that Amazon Lex should use as the default value for a slot.

      struct SlotDefaultValueSpecification
        include JSON::Serializable

        # A list of default values. Amazon Lex chooses the default value to use in the order that they are
        # presented in the list.

        @[JSON::Field(key: "defaultValueList")]
        getter default_value_list : Array(Types::SlotDefaultValue)

        def initialize(
          @default_value_list : Array(Types::SlotDefaultValue)
        )
        end
      end

      # Filters the response from the ListSlots operation.

      struct SlotFilter
        include JSON::Serializable

        # The name of the field to use for filtering.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListSlots operation should return only
        # aliases that equal the specified value. Specify CO when the ListSlots operation should return
        # aliases that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The value to use to filter the response.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Sets the priority that Amazon Lex should use when eliciting slot values from a user.

      struct SlotPriority
        include JSON::Serializable

        # The priority that Amazon Lex should apply to the slot.

        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The unique identifier of the slot.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String

        def initialize(
          @priority : Int32,
          @slot_id : String
        )
        end
      end

      # Contains specifications for the assisted slot resolution feature.

      struct SlotResolutionImprovementSpecification
        include JSON::Serializable

        # Specifies whether assisted slot resolution is turned on or off.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # An object containing information about the Amazon Bedrock model used to assist slot resolution.

        @[JSON::Field(key: "bedrockModelSpecification")]
        getter bedrock_model_specification : Types::BedrockModelSpecification?

        def initialize(
          @enabled : Bool,
          @bedrock_model_specification : Types::BedrockModelSpecification? = nil
        )
        end
      end

      # Contains information about whether assisted slot resolution is turned on for the slot or not.

      struct SlotResolutionSetting
        include JSON::Serializable

        # Specifies whether assisted slot resolution is turned on for the slot or not. If the value is
        # EnhancedFallback , assisted slot resolution is activated when Amazon Lex defaults to the
        # AMAZON.FallbackIntent . If the value is Default , assisted slot resolution is turned off.

        @[JSON::Field(key: "slotResolutionStrategy")]
        getter slot_resolution_strategy : String

        def initialize(
          @slot_resolution_strategy : String
        )
        end
      end

      # Information about the success and failure rate of slot resolution in the results of a test
      # execution.

      struct SlotResolutionTestResultItem
        include JSON::Serializable

        # A result for slot resolution in the results of a test execution.

        @[JSON::Field(key: "resultCounts")]
        getter result_counts : Types::SlotResolutionTestResultItemCounts

        # The name of the slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String

        def initialize(
          @result_counts : Types::SlotResolutionTestResultItemCounts,
          @slot_name : String
        )
        end
      end

      # Information about the counts for a slot resolution in the results of a test execution.

      struct SlotResolutionTestResultItemCounts
        include JSON::Serializable

        # The number of matched and mismatched results for slot resolution for the slot.

        @[JSON::Field(key: "slotMatchResultCounts")]
        getter slot_match_result_counts : Hash(String, Int32)

        # The total number of results.

        @[JSON::Field(key: "totalResultCount")]
        getter total_result_count : Int32

        # The number of matched, mismatched and execution error results for speech transcription for the slot.

        @[JSON::Field(key: "speechTranscriptionResultCounts")]
        getter speech_transcription_result_counts : Hash(String, Int32)?

        def initialize(
          @slot_match_result_counts : Hash(String, Int32),
          @total_result_count : Int32,
          @speech_transcription_result_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # Specifies attributes for sorting a list of bots.

      struct SlotSortBy
        include JSON::Serializable

        # The attribute to use to sort the list.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list. You can choose ascending or descending.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Summary information about a slot, a value that the bot elicits from the user.

      struct SlotSummary
        include JSON::Serializable

        # The description of the slot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of the last date and time that the slot was updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # Whether the slot is required or optional. An intent is complete when all required slots are filled.

        @[JSON::Field(key: "slotConstraint")]
        getter slot_constraint : String?

        # The unique identifier of the slot.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String?

        # The name given to the slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String?

        # The unique identifier for the slot type that defines the values for the slot.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # Prompts that are sent to the user to elicit a value for the slot.

        @[JSON::Field(key: "valueElicitationPromptSpecification")]
        getter value_elicitation_prompt_specification : Types::PromptSpecification?

        def initialize(
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @slot_constraint : String? = nil,
          @slot_id : String? = nil,
          @slot_name : String? = nil,
          @slot_type_id : String? = nil,
          @value_elicitation_prompt_specification : Types::PromptSpecification? = nil
        )
        end
      end

      # Filters the response from the ListSlotTypes operation.

      struct SlotTypeFilter
        include JSON::Serializable

        # The name of the field to use for filtering.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for the filter. Specify EQ when the ListSlotTypes operation should return only
        # aliases that equal the specified value. Specify CO when the ListSlotTypes operation should return
        # aliases that contain the specified value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The value to use to filter the response.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Specifies attributes for sorting a list of slot types.

      struct SlotTypeSortBy
        include JSON::Serializable

        # The attribute to use to sort the list of slot types.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order to sort the list. You can say ascending or descending.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # The object that contains the statistical summary of the recommended slot type associated with the
      # bot recommendation.

      struct SlotTypeStatistics
        include JSON::Serializable

        # The number of recommended slot types associated with the bot recommendation.

        @[JSON::Field(key: "discoveredSlotTypeCount")]
        getter discovered_slot_type_count : Int32?

        def initialize(
          @discovered_slot_type_count : Int32? = nil
        )
        end
      end

      # Provides summary information about a slot type.

      struct SlotTypeSummary
        include JSON::Serializable

        # The description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A timestamp of the date and time that the slot type was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # If the slot type is derived from a built-on slot type, the name of the parent slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # Indicates the type of the slot type. Custom - A slot type that you created using custom values. For
        # more information, see Creating custom slot types . Extended - A slot type created by extending the
        # AMAZON.AlphaNumeric built-in slot type. For more information, see AMAZON.AlphaNumeric .
        # ExternalGrammar - A slot type using a custom GRXML grammar to define values. For more information,
        # see Using a custom grammar slot type .

        @[JSON::Field(key: "slotTypeCategory")]
        getter slot_type_category : String?

        # The unique identifier assigned to the slot type.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # The name of the slot type.

        @[JSON::Field(key: "slotTypeName")]
        getter slot_type_name : String?

        def initialize(
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_category : String? = nil,
          @slot_type_id : String? = nil,
          @slot_type_name : String? = nil
        )
        end
      end

      # Each slot type can have a set of values. Each SlotTypeValue represents a value that the slot type
      # can take.

      struct SlotTypeValue
        include JSON::Serializable

        # The value of the slot type entry.

        @[JSON::Field(key: "sampleValue")]
        getter sample_value : Types::SampleValue?

        # Additional values related to the slot type entry.

        @[JSON::Field(key: "synonyms")]
        getter synonyms : Array(Types::SampleValue)?

        def initialize(
          @sample_value : Types::SampleValue? = nil,
          @synonyms : Array(Types::SampleValue)? = nil
        )
        end
      end

      # The value to set in a slot.

      struct SlotValue
        include JSON::Serializable

        # The value that Amazon Lex determines for the slot. The actual value depends on the setting of the
        # value selection strategy for the bot. You can choose to use the value entered by the user, or you
        # can have Amazon Lex choose the first value in the resolvedValues list.

        @[JSON::Field(key: "interpretedValue")]
        getter interpreted_value : String?

        def initialize(
          @interpreted_value : String? = nil
        )
        end
      end

      # Specifies the elicitation setting details eliciting a slot.

      struct SlotValueElicitationSetting
        include JSON::Serializable

        # Specifies whether the slot is required or optional.

        @[JSON::Field(key: "slotConstraint")]
        getter slot_constraint : String

        # A list of default values for a slot. Default values are used when Amazon Lex hasn't determined a
        # value for a slot. You can specify default values from context variables, session attributes, and
        # defined values.

        @[JSON::Field(key: "defaultValueSpecification")]
        getter default_value_specification : Types::SlotDefaultValueSpecification?

        # The prompt that Amazon Lex uses to elicit the slot value from the user.

        @[JSON::Field(key: "promptSpecification")]
        getter prompt_specification : Types::PromptSpecification?

        # If you know a specific pattern that users might respond to an Amazon Lex request for a slot value,
        # you can provide those utterances to improve accuracy. This is optional. In most cases, Amazon Lex is
        # capable of understanding user utterances.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?

        # Specifies the settings that Amazon Lex uses when a slot value is successfully entered by a user.

        @[JSON::Field(key: "slotCaptureSetting")]
        getter slot_capture_setting : Types::SlotCaptureSetting?

        # An object containing information about whether assisted slot resolution is turned on for the slot or
        # not.

        @[JSON::Field(key: "slotResolutionSetting")]
        getter slot_resolution_setting : Types::SlotResolutionSetting?


        @[JSON::Field(key: "waitAndContinueSpecification")]
        getter wait_and_continue_specification : Types::WaitAndContinueSpecification?

        def initialize(
          @slot_constraint : String,
          @default_value_specification : Types::SlotDefaultValueSpecification? = nil,
          @prompt_specification : Types::PromptSpecification? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil,
          @slot_capture_setting : Types::SlotCaptureSetting? = nil,
          @slot_resolution_setting : Types::SlotResolutionSetting? = nil,
          @wait_and_continue_specification : Types::WaitAndContinueSpecification? = nil
        )
        end
      end

      # The slot values that Amazon Lex uses when it sets slot values in a dialog step.

      struct SlotValueOverride
        include JSON::Serializable

        # When the shape value is List , it indicates that the values field contains a list of slot values.
        # When the value is Scalar , it indicates that the value field contains a single value.

        @[JSON::Field(key: "shape")]
        getter shape : String?

        # The current value of the slot.

        @[JSON::Field(key: "value")]
        getter value : Types::SlotValue?

        # A list of one or more values that the user provided for the slot. For example, for a slot that
        # elicits pizza toppings, the values might be "pepperoni" and "pineapple."

        @[JSON::Field(key: "values")]
        getter values : Array(Types::SlotValueOverride)?

        def initialize(
          @shape : String? = nil,
          @value : Types::SlotValue? = nil,
          @values : Array(Types::SlotValueOverride)? = nil
        )
        end
      end

      # Provides a regular expression used to validate the value of a slot.

      struct SlotValueRegexFilter
        include JSON::Serializable

        # A regular expression used to validate the value of a slot. Use a standard regular expression. Amazon
        # Lex supports the following characters in the regular expression: A-Z, a-z 0-9 Unicode characters
        # ("\⁠u&lt;Unicode&gt;") Represent Unicode characters with four digits, for example "\⁠u0041" or
        # "\⁠u005A". The following regular expression operators are not supported: Infinite repeaters: *, +,
        # or {x,} with no upper bound. Wild card (.)

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        def initialize(
          @pattern : String
        )
        end
      end

      # Contains settings used by Amazon Lex to select a slot value.

      struct SlotValueSelectionSetting
        include JSON::Serializable

        # Determines the slot resolution strategy that Amazon Lex uses to return slot type values. The field
        # can be set to one of the following values: ORIGINAL_VALUE - Returns the value entered by the user,
        # if the user value is similar to the slot value. TOP_RESOLUTION - If there is a resolution list for
        # the slot, return the first value in the resolution list as the slot type value. If there is no
        # resolution list, null is returned. If you don't specify the valueSelectionStrategy , the default is
        # ORIGINAL_VALUE .

        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String

        # Provides settings that enable advanced recognition settings for slot values. You can use this to
        # enable using slot values as a custom vocabulary for recognizing user utterances.

        @[JSON::Field(key: "advancedRecognitionSetting")]
        getter advanced_recognition_setting : Types::AdvancedRecognitionSetting?

        # A regular expression used to validate the value of a slot.

        @[JSON::Field(key: "regexFilter")]
        getter regex_filter : Types::SlotValueRegexFilter?

        def initialize(
          @resolution_strategy : String,
          @advanced_recognition_setting : Types::AdvancedRecognitionSetting? = nil,
          @regex_filter : Types::SlotValueRegexFilter? = nil
        )
        end
      end

      # Subslot specifications.

      struct Specifications
        include JSON::Serializable

        # The unique identifier assigned to the slot type.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String

        # Specifies the elicitation setting details for constituent sub slots of a composite slot.

        @[JSON::Field(key: "valueElicitationSetting")]
        getter value_elicitation_setting : Types::SubSlotValueElicitationSetting

        def initialize(
          @slot_type_id : String,
          @value_elicitation_setting : Types::SubSlotValueElicitationSetting
        )
        end
      end

      # Configuration for a foundation model used for speech synthesis and recognition capabilities.

      struct SpeechFoundationModel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the foundation model used for speech processing.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The identifier of the voice to use for speech synthesis with the foundation model.

        @[JSON::Field(key: "voiceId")]
        getter voice_id : String?

        def initialize(
          @model_arn : String,
          @voice_id : String? = nil
        )
        end
      end

      # Configuration settings that define which speech-to-text model to use for processing speech input.

      struct SpeechModelConfig
        include JSON::Serializable

        # Configuration settings for using Deepgram as the speech-to-text provider.

        @[JSON::Field(key: "deepgramConfig")]
        getter deepgram_config : Types::DeepgramSpeechModelConfig?

        def initialize(
          @deepgram_config : Types::DeepgramSpeechModelConfig? = nil
        )
        end
      end

      # Settings that control how Amazon Lex processes and recognizes speech input from users.

      struct SpeechRecognitionSettings
        include JSON::Serializable

        # Configuration settings for the selected speech-to-text model.

        @[JSON::Field(key: "speechModelConfig")]
        getter speech_model_config : Types::SpeechModelConfig?

        # The speech-to-text model to use.

        @[JSON::Field(key: "speechModelPreference")]
        getter speech_model_preference : String?

        def initialize(
          @speech_model_config : Types::SpeechModelConfig? = nil,
          @speech_model_preference : String? = nil
        )
        end
      end


      struct StartBotRecommendationRequest
        include JSON::Serializable

        # The unique identifier of the bot containing the bot recommendation.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot containing the bot recommendation.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the bot recommendation to start. The string must match
        # one of the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The object representing the Amazon S3 bucket containing the transcript, as well as the associated
        # metadata.

        @[JSON::Field(key: "transcriptSourceSetting")]
        getter transcript_source_setting : Types::TranscriptSourceSetting

        # The object representing the passwords that will be used to encrypt the data related to the bot
        # recommendation results, as well as the KMS key ARN used to encrypt the associated metadata.

        @[JSON::Field(key: "encryptionSetting")]
        getter encryption_setting : Types::EncryptionSetting?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @transcript_source_setting : Types::TranscriptSourceSetting,
          @encryption_setting : Types::EncryptionSetting? = nil
        )
        end
      end


      struct StartBotRecommendationResponse
        include JSON::Serializable

        # The unique identifier of the bot containing the bot recommendation.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The identifier of the bot recommendation that you have created.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String?

        # The status of the bot recommendation. If the status is Failed, then the reasons for the failure are
        # listed in the failureReasons field.

        @[JSON::Field(key: "botRecommendationStatus")]
        getter bot_recommendation_status : String?

        # The version of the bot containing the bot recommendation.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the bot recommendation was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The object representing the passwords that were used to encrypt the data related to the bot
        # recommendation results, as well as the KMS key ARN used to encrypt the associated metadata.

        @[JSON::Field(key: "encryptionSetting")]
        getter encryption_setting : Types::EncryptionSetting?

        # The identifier of the language and locale of the bot recommendation to start. The string must match
        # one of the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The object representing the Amazon S3 bucket containing the transcript, as well as the associated
        # metadata.

        @[JSON::Field(key: "transcriptSourceSetting")]
        getter transcript_source_setting : Types::TranscriptSourceSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_recommendation_id : String? = nil,
          @bot_recommendation_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @encryption_setting : Types::EncryptionSetting? = nil,
          @locale_id : String? = nil,
          @transcript_source_setting : Types::TranscriptSourceSetting? = nil
        )
        end
      end


      struct StartBotResourceGenerationRequest
        include JSON::Serializable

        # The unique identifier of the bot for which to generate intents and slot types.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot for which to generate intents and slot types.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The prompt to generate intents and slot types for the bot locale. Your description should be both
        # detailed and precise to help generate appropriate and sufficient intents for your bot. Include a
        # list of actions to improve the intent creation process.

        @[JSON::Field(key: "generationInputPrompt")]
        getter generation_input_prompt : String

        # The locale of the bot for which to generate intents and slot types.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @generation_input_prompt : String,
          @locale_id : String
        )
        end
      end


      struct StartBotResourceGenerationResponse
        include JSON::Serializable

        # The unique identifier of the bot for which the generation request was made.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot for which the generation request was made.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The date and time at which the generation request was made.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The unique identifier of the generation request.

        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # The prompt that was used generate intents and slot types for the bot locale.

        @[JSON::Field(key: "generationInputPrompt")]
        getter generation_input_prompt : String?

        # The status of the generation request.

        @[JSON::Field(key: "generationStatus")]
        getter generation_status : String?

        # The locale of the bot for which the generation request was made.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @generation_id : String? = nil,
          @generation_input_prompt : String? = nil,
          @generation_status : String? = nil,
          @locale_id : String? = nil
        )
        end
      end


      struct StartImportRequest
        include JSON::Serializable

        # The unique identifier for the import. It is included in the response from the CreateUploadUrl
        # operation.

        @[JSON::Field(key: "importId")]
        getter import_id : String

        # The strategy to use when there is a name conflict between the imported resource and an existing
        # resource. When the merge strategy is FailOnConflict existing resources are not overwritten and the
        # import fails.

        @[JSON::Field(key: "mergeStrategy")]
        getter merge_strategy : String

        # Parameters for creating the bot, bot locale or custom vocabulary.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ImportResourceSpecification

        # The password used to encrypt the zip archive that contains the resource definition. You should
        # always encrypt the zip archive to protect it during transit between your site and Amazon Lex.

        @[JSON::Field(key: "filePassword")]
        getter file_password : String?

        def initialize(
          @import_id : String,
          @merge_strategy : String,
          @resource_specification : Types::ImportResourceSpecification,
          @file_password : String? = nil
        )
        end
      end


      struct StartImportResponse
        include JSON::Serializable

        # The date and time that the import request was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # A unique identifier for the import.

        @[JSON::Field(key: "importId")]
        getter import_id : String?

        # The current status of the import. When the status is Complete the bot, bot alias, or custom
        # vocabulary is ready to use.

        @[JSON::Field(key: "importStatus")]
        getter import_status : String?

        # The strategy used when there was a name conflict between the imported resource and an existing
        # resource. When the merge strategy is FailOnConflict existing resources are not overwritten and the
        # import fails.

        @[JSON::Field(key: "mergeStrategy")]
        getter merge_strategy : String?

        # The parameters used when importing the resource.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ImportResourceSpecification?

        def initialize(
          @creation_date_time : Time? = nil,
          @import_id : String? = nil,
          @import_status : String? = nil,
          @merge_strategy : String? = nil,
          @resource_specification : Types::ImportResourceSpecification? = nil
        )
        end
      end


      struct StartTestExecutionRequest
        include JSON::Serializable

        # Indicates whether we use streaming or non-streaming APIs for the test set execution. For streaming,
        # StartConversation Runtime API is used. Whereas, for non-streaming, RecognizeUtterance and
        # RecognizeText Amazon Lex Runtime API are used.

        @[JSON::Field(key: "apiMode")]
        getter api_mode : String

        # The target bot for the test set execution.

        @[JSON::Field(key: "target")]
        getter target : Types::TestExecutionTarget

        # The test set Id for the test set execution.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String

        # Indicates whether audio or text is used.

        @[JSON::Field(key: "testExecutionModality")]
        getter test_execution_modality : String?

        def initialize(
          @api_mode : String,
          @target : Types::TestExecutionTarget,
          @test_set_id : String,
          @test_execution_modality : String? = nil
        )
        end
      end


      struct StartTestExecutionResponse
        include JSON::Serializable

        # Indicates whether we use streaming or non-streaming APIs for the test set execution. For streaming,
        # StartConversation Amazon Lex Runtime API is used. Whereas for non-streaming, RecognizeUtterance and
        # RecognizeText Amazon Lex Runtime API are used.

        @[JSON::Field(key: "apiMode")]
        getter api_mode : String?

        # The creation date and time for the test set execution.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The target bot for the test set execution.

        @[JSON::Field(key: "target")]
        getter target : Types::TestExecutionTarget?

        # The unique identifier of the test set execution.

        @[JSON::Field(key: "testExecutionId")]
        getter test_execution_id : String?

        # Indicates whether audio or text is used.

        @[JSON::Field(key: "testExecutionModality")]
        getter test_execution_modality : String?

        # The test set Id for the test set execution.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        def initialize(
          @api_mode : String? = nil,
          @creation_date_time : Time? = nil,
          @target : Types::TestExecutionTarget? = nil,
          @test_execution_id : String? = nil,
          @test_execution_modality : String? = nil,
          @test_set_id : String? = nil
        )
        end
      end


      struct StartTestSetGenerationRequest
        include JSON::Serializable

        # The data source for the test set generation.

        @[JSON::Field(key: "generationDataSource")]
        getter generation_data_source : Types::TestSetGenerationDataSource

        # The roleARN used for any operation in the test set to access resources in the Amazon Web Services
        # account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The Amazon S3 storage location for the test set generation.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : Types::TestSetStorageLocation

        # The test set name for the test set generation request.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String

        # The test set description for the test set generation request.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of tags to add to the test set. You can only add tags when you import/generate a new test
        # set. You can't use the UpdateTestSet operation to update tags. To update tags, use the TagResource
        # operation.

        @[JSON::Field(key: "testSetTags")]
        getter test_set_tags : Hash(String, String)?

        def initialize(
          @generation_data_source : Types::TestSetGenerationDataSource,
          @role_arn : String,
          @storage_location : Types::TestSetStorageLocation,
          @test_set_name : String,
          @description : String? = nil,
          @test_set_tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartTestSetGenerationResponse
        include JSON::Serializable

        # The creation date and time for the test set generation.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description used for the test set generation.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The data source for the test set generation.

        @[JSON::Field(key: "generationDataSource")]
        getter generation_data_source : Types::TestSetGenerationDataSource?

        # The roleARN used for any operation in the test set to access resources in the Amazon Web Services
        # account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The Amazon S3 storage location for the test set generation.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : Types::TestSetStorageLocation?

        # The unique identifier of the test set generation to describe.

        @[JSON::Field(key: "testSetGenerationId")]
        getter test_set_generation_id : String?

        # The status for the test set generation.

        @[JSON::Field(key: "testSetGenerationStatus")]
        getter test_set_generation_status : String?

        # The test set name used for the test set generation.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String?

        # A list of tags that was used for the test set that is being generated.

        @[JSON::Field(key: "testSetTags")]
        getter test_set_tags : Hash(String, String)?

        def initialize(
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @generation_data_source : Types::TestSetGenerationDataSource? = nil,
          @role_arn : String? = nil,
          @storage_location : Types::TestSetStorageLocation? = nil,
          @test_set_generation_id : String? = nil,
          @test_set_generation_status : String? = nil,
          @test_set_name : String? = nil,
          @test_set_tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines the messages that Amazon Lex sends to a user to remind them that the bot is waiting for a
      # response.

      struct StillWaitingResponseSpecification
        include JSON::Serializable

        # How often a message should be sent to the user. Minimum of 1 second, maximum of 5 minutes.

        @[JSON::Field(key: "frequencyInSeconds")]
        getter frequency_in_seconds : Int32

        # One or more message groups, each containing one or more messages, that define the prompts that
        # Amazon Lex sends to the user.

        @[JSON::Field(key: "messageGroups")]
        getter message_groups : Array(Types::MessageGroup)

        # If Amazon Lex waits longer than this length of time for a response, it will stop sending messages.

        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int32

        # Indicates that the user can interrupt the response by speaking while the message is being played.

        @[JSON::Field(key: "allowInterrupt")]
        getter allow_interrupt : Bool?

        def initialize(
          @frequency_in_seconds : Int32,
          @message_groups : Array(Types::MessageGroup),
          @timeout_in_seconds : Int32,
          @allow_interrupt : Bool? = nil
        )
        end
      end


      struct StopBotRecommendationRequest
        include JSON::Serializable

        # The unique identifier of the bot containing the bot recommendation to be stopped.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The unique identifier of the bot recommendation to be stopped.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String

        # The version of the bot containing the bot recommendation.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale of the bot recommendation to stop. The string must match
        # one of the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_recommendation_id : String,
          @bot_version : String,
          @locale_id : String
        )
        end
      end


      struct StopBotRecommendationResponse
        include JSON::Serializable

        # The unique identifier of the bot containing the bot recommendation that is being stopped.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The unique identifier of the bot recommendation that is being stopped.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String?

        # The status of the bot recommendation. If the status is Failed, then the reasons for the failure are
        # listed in the failureReasons field.

        @[JSON::Field(key: "botRecommendationStatus")]
        getter bot_recommendation_status : String?

        # The version of the bot containing the recommendation that is being stopped.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The identifier of the language and locale of the bot response to stop. The string must match one of
        # the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_recommendation_id : String? = nil,
          @bot_recommendation_status : String? = nil,
          @bot_version : String? = nil,
          @locale_id : String? = nil
        )
        end
      end

      # Specifications for the constituent sub slots and the expression for the composite slot.

      struct SubSlotSetting
        include JSON::Serializable

        # The expression text for defining the constituent sub slots in the composite slot using logical AND
        # and OR operators.

        @[JSON::Field(key: "expression")]
        getter expression : String?

        # Specifications for the constituent sub slots of a composite slot.

        @[JSON::Field(key: "slotSpecifications")]
        getter slot_specifications : Hash(String, Types::Specifications)?

        def initialize(
          @expression : String? = nil,
          @slot_specifications : Hash(String, Types::Specifications)? = nil
        )
        end
      end

      # Subslot type composition.

      struct SubSlotTypeComposition
        include JSON::Serializable

        # Name of a constituent sub slot inside a composite slot.

        @[JSON::Field(key: "name")]
        getter name : String

        # The unique identifier assigned to a slot type. This refers to either a built-in slot type or the
        # unique slotTypeId of a custom slot type.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String

        def initialize(
          @name : String,
          @slot_type_id : String
        )
        end
      end

      # Subslot elicitation settings. DefaultValueSpecification is a list of default values for a
      # constituent sub slot in a composite slot. Default values are used when Amazon Lex hasn't determined
      # a value for a slot. You can specify default values from context variables, session attributes, and
      # defined values. This is similar to DefaultValueSpecification for slots. PromptSpecification is the
      # prompt that Amazon Lex uses to elicit the sub slot value from the user. This is similar to
      # PromptSpecification for slots.

      struct SubSlotValueElicitationSetting
        include JSON::Serializable


        @[JSON::Field(key: "promptSpecification")]
        getter prompt_specification : Types::PromptSpecification


        @[JSON::Field(key: "defaultValueSpecification")]
        getter default_value_specification : Types::SlotDefaultValueSpecification?

        # If you know a specific pattern that users might respond to an Amazon Lex request for a sub slot
        # value, you can provide those utterances to improve accuracy. This is optional. In most cases Amazon
        # Lex is capable of understanding user utterances. This is similar to SampleUtterances for slots.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?


        @[JSON::Field(key: "waitAndContinueSpecification")]
        getter wait_and_continue_specification : Types::WaitAndContinueSpecification?

        def initialize(
          @prompt_specification : Types::PromptSpecification,
          @default_value_specification : Types::SlotDefaultValueSpecification? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil,
          @wait_and_continue_specification : Types::WaitAndContinueSpecification? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot, bot alias, or bot channel to tag.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # A list of tag keys to add to the resource. If a tag key already exists, the existing value is
        # replaced with the new value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the method by which to filter the results of the test execution.

      struct TestExecutionResultFilterBy
        include JSON::Serializable

        # Specifies which results to filter. See Test result details"&gt;Test results details for details
        # about different types of results.

        @[JSON::Field(key: "resultTypeFilter")]
        getter result_type_filter : String

        # Contains information about the method for filtering Conversation level test results.

        @[JSON::Field(key: "conversationLevelTestResultsFilterBy")]
        getter conversation_level_test_results_filter_by : Types::ConversationLevelTestResultsFilterBy?

        def initialize(
          @result_type_filter : String,
          @conversation_level_test_results_filter_by : Types::ConversationLevelTestResultsFilterBy? = nil
        )
        end
      end

      # Contains the results of the test execution, grouped by type of results. See Test result
      # details"&gt;Test results details for details about different types of results.

      struct TestExecutionResultItems
        include JSON::Serializable

        # Results related to conversations in the test set, including metrics about success and failure of
        # conversations and intent and slot failures.

        @[JSON::Field(key: "conversationLevelTestResults")]
        getter conversation_level_test_results : Types::ConversationLevelTestResults?

        # Intent recognition results aggregated by intent name. The aggregated results contain success and
        # failure rates of intent recognition, speech transcriptions, and end-to-end conversations.

        @[JSON::Field(key: "intentClassificationTestResults")]
        getter intent_classification_test_results : Types::IntentClassificationTestResults?

        # Slot resolution results aggregated by intent and slot name. The aggregated results contain success
        # and failure rates of slot resolution, speech transcriptions, and end-to-end conversations

        @[JSON::Field(key: "intentLevelSlotResolutionTestResults")]
        getter intent_level_slot_resolution_test_results : Types::IntentLevelSlotResolutionTestResults?

        # Overall results for the test execution, including the breakdown of conversations and single-input
        # utterances.

        @[JSON::Field(key: "overallTestResults")]
        getter overall_test_results : Types::OverallTestResults?

        # Results related to utterances in the test set.

        @[JSON::Field(key: "utteranceLevelTestResults")]
        getter utterance_level_test_results : Types::UtteranceLevelTestResults?

        def initialize(
          @conversation_level_test_results : Types::ConversationLevelTestResults? = nil,
          @intent_classification_test_results : Types::IntentClassificationTestResults? = nil,
          @intent_level_slot_resolution_test_results : Types::IntentLevelSlotResolutionTestResults? = nil,
          @overall_test_results : Types::OverallTestResults? = nil,
          @utterance_level_test_results : Types::UtteranceLevelTestResults? = nil
        )
        end
      end

      # Contains information about the method by which to sort the instances of test executions you have
      # carried out.

      struct TestExecutionSortBy
        include JSON::Serializable

        # Specifies whether to sort the test set executions by the date and time at which the test sets were
        # created.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # Specifies whether to sort in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Summarizes metadata about the test execution.

      struct TestExecutionSummary
        include JSON::Serializable

        # Specifies whether the API mode for the test execution is streaming or non-streaming.

        @[JSON::Field(key: "apiMode")]
        getter api_mode : String?

        # The date and time at which the test execution was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The date and time at which the test execution was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # Contains information about the bot used for the test execution..

        @[JSON::Field(key: "target")]
        getter target : Types::TestExecutionTarget?

        # The unique identifier of the test execution.

        @[JSON::Field(key: "testExecutionId")]
        getter test_execution_id : String?

        # Specifies whether the data used for the test execution is written or spoken.

        @[JSON::Field(key: "testExecutionModality")]
        getter test_execution_modality : String?

        # The current status of the test execution.

        @[JSON::Field(key: "testExecutionStatus")]
        getter test_execution_status : String?

        # The unique identifier of the test set used in the test execution.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        # The name of the test set used in the test execution.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String?

        def initialize(
          @api_mode : String? = nil,
          @creation_date_time : Time? = nil,
          @last_updated_date_time : Time? = nil,
          @target : Types::TestExecutionTarget? = nil,
          @test_execution_id : String? = nil,
          @test_execution_modality : String? = nil,
          @test_execution_status : String? = nil,
          @test_set_id : String? = nil,
          @test_set_name : String? = nil
        )
        end
      end

      # Contains information about the bot used for the test execution.

      struct TestExecutionTarget
        include JSON::Serializable

        # Contains information about the bot alias used for the test execution.

        @[JSON::Field(key: "botAliasTarget")]
        getter bot_alias_target : Types::BotAliasTestExecutionTarget?

        def initialize(
          @bot_alias_target : Types::BotAliasTestExecutionTarget? = nil
        )
        end
      end

      # Contains details about the errors in the test set discrepancy report

      struct TestSetDiscrepancyErrors
        include JSON::Serializable

        # Contains information about discrepancies found for intents between the test set and the bot.

        @[JSON::Field(key: "intentDiscrepancies")]
        getter intent_discrepancies : Array(Types::TestSetIntentDiscrepancyItem)

        # Contains information about discrepancies found for slots between the test set and the bot.

        @[JSON::Field(key: "slotDiscrepancies")]
        getter slot_discrepancies : Array(Types::TestSetSlotDiscrepancyItem)

        def initialize(
          @intent_discrepancies : Array(Types::TestSetIntentDiscrepancyItem),
          @slot_discrepancies : Array(Types::TestSetSlotDiscrepancyItem)
        )
        end
      end

      # Contains information about the bot alias used for the test set discrepancy report.

      struct TestSetDiscrepancyReportBotAliasTarget
        include JSON::Serializable

        # The unique identifier for the bot associated with the bot alias.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The unique identifier for the bot alias.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The unique identifier of the locale associated with the bot alias.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String
        )
        end
      end

      # Contains information about the resource used for the test set discrepancy report.

      struct TestSetDiscrepancyReportResourceTarget
        include JSON::Serializable

        # Contains information about the bot alias used as the resource for the test set discrepancy report.

        @[JSON::Field(key: "botAliasTarget")]
        getter bot_alias_target : Types::TestSetDiscrepancyReportBotAliasTarget?

        def initialize(
          @bot_alias_target : Types::TestSetDiscrepancyReportBotAliasTarget? = nil
        )
        end
      end

      # Contains information about the test set that is exported.

      struct TestSetExportSpecification
        include JSON::Serializable

        # The unique identifier of the test set.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String

        def initialize(
          @test_set_id : String
        )
        end
      end

      # Contains information about the data source from which the test set is generated.

      struct TestSetGenerationDataSource
        include JSON::Serializable

        # Contains information about the bot from which the conversation logs are sourced.

        @[JSON::Field(key: "conversationLogsDataSource")]
        getter conversation_logs_data_source : Types::ConversationLogsDataSource?

        def initialize(
          @conversation_logs_data_source : Types::ConversationLogsDataSource? = nil
        )
        end
      end

      # Contains information about the Amazon S3 location from which the test set is imported.

      struct TestSetImportInputLocation
        include JSON::Serializable

        # The name of the Amazon S3 bucket.

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String

        # The path inside the Amazon S3 bucket pointing to the test-set CSV file.

        @[JSON::Field(key: "s3Path")]
        getter s3_path : String

        def initialize(
          @s3_bucket_name : String,
          @s3_path : String
        )
        end
      end

      # Contains information about the test set that is imported.

      struct TestSetImportResourceSpecification
        include JSON::Serializable

        # Contains information about the input location from where test-set should be imported.

        @[JSON::Field(key: "importInputLocation")]
        getter import_input_location : Types::TestSetImportInputLocation

        # Specifies whether the test-set being imported contains written or spoken data.

        @[JSON::Field(key: "modality")]
        getter modality : String

        # The Amazon Resource Name (ARN) of an IAM role that has permission to access the test set.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Contains information about the location that Amazon Lex uses to store the test-set.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : Types::TestSetStorageLocation

        # The name of the test set.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String

        # The description of the test set.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of tags to add to the test set. You can only add tags when you import/generate a new test
        # set. You can't use the UpdateTestSet operation to update tags. To update tags, use the TagResource
        # operation.

        @[JSON::Field(key: "testSetTags")]
        getter test_set_tags : Hash(String, String)?

        def initialize(
          @import_input_location : Types::TestSetImportInputLocation,
          @modality : String,
          @role_arn : String,
          @storage_location : Types::TestSetStorageLocation,
          @test_set_name : String,
          @description : String? = nil,
          @test_set_tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about discrepancy in an intent information between the test set and the bot.

      struct TestSetIntentDiscrepancyItem
        include JSON::Serializable

        # The error message for a discrepancy for an intent between the test set and the bot.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The name of the intent in the discrepancy report.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        def initialize(
          @error_message : String,
          @intent_name : String
        )
        end
      end

      # Contains information about discrepancy in a slot information between the test set and the bot.

      struct TestSetSlotDiscrepancyItem
        include JSON::Serializable

        # The error message for a discrepancy for an intent between the test set and the bot.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The name of the intent associated with the slot in the discrepancy report.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # The name of the slot in the discrepancy report.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String

        def initialize(
          @error_message : String,
          @intent_name : String,
          @slot_name : String
        )
        end
      end

      # Contains information about the methods by which to sort the test set.

      struct TestSetSortBy
        include JSON::Serializable

        # Specifies whether to sort the test sets by name or by the time they were last updated.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # Specifies whether to sort in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Contains information about the location in which the test set is stored.

      struct TestSetStorageLocation
        include JSON::Serializable

        # The name of the Amazon S3 bucket in which the test set is stored.

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String

        # The path inside the Amazon S3 bucket where the test set is stored.

        @[JSON::Field(key: "s3Path")]
        getter s3_path : String

        # The Amazon Resource Name (ARN) of an Amazon Web Services Key Management Service (KMS) key for
        # encrypting the test set.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @s3_bucket_name : String,
          @s3_path : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Contains summary information about the test set.

      struct TestSetSummary
        include JSON::Serializable

        # The date and time at which the test set was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The description of the test set.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time at which the test set was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # Specifies whether the test set contains written or spoken data.

        @[JSON::Field(key: "modality")]
        getter modality : String?

        # The number of turns in the test set.

        @[JSON::Field(key: "numTurns")]
        getter num_turns : Int32?

        # The Amazon Resource Name (ARN) of an IAM role that has permission to access the test set.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the test set.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Contains information about the location at which the test set is stored.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : Types::TestSetStorageLocation?

        # The unique identifier of the test set.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        # The name of the test set.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @modality : String? = nil,
          @num_turns : Int32? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @storage_location : Types::TestSetStorageLocation? = nil,
          @test_set_id : String? = nil,
          @test_set_name : String? = nil
        )
        end
      end

      # Contains information about a turn in a test set.

      struct TestSetTurnRecord
        include JSON::Serializable

        # The record number associated with the turn.

        @[JSON::Field(key: "recordNumber")]
        getter record_number : Int64

        # Contains information about the agent or user turn depending upon type of turn.

        @[JSON::Field(key: "turnSpecification")]
        getter turn_specification : Types::TurnSpecification

        # The unique identifier for the conversation associated with the turn.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # The number of turns that has elapsed up to that turn.

        @[JSON::Field(key: "turnNumber")]
        getter turn_number : Int32?

        def initialize(
          @record_number : Int64,
          @turn_specification : Types::TurnSpecification,
          @conversation_id : String? = nil,
          @turn_number : Int32? = nil
        )
        end
      end

      # Contains information about the results of the analysis of a turn in the test set.

      struct TestSetTurnResult
        include JSON::Serializable

        # Contains information about the agent messages in the turn.

        @[JSON::Field(key: "agent")]
        getter agent : Types::AgentTurnResult?

        # Contains information about the user messages in the turn.

        @[JSON::Field(key: "user")]
        getter user : Types::UserTurnResult?

        def initialize(
          @agent : Types::AgentTurnResult? = nil,
          @user : Types::UserTurnResult? = nil
        )
        end
      end

      # Specifies the text input specifications.

      struct TextInputSpecification
        include JSON::Serializable

        # Time for which a bot waits before re-prompting a customer for text input.

        @[JSON::Field(key: "startTimeoutMs")]
        getter start_timeout_ms : Int32

        def initialize(
          @start_timeout_ms : Int32
        )
        end
      end

      # Defines the Amazon CloudWatch Logs destination log group for conversation text logs.

      struct TextLogDestination
        include JSON::Serializable

        # Defines the Amazon CloudWatch Logs log group where text and metadata logs are delivered.

        @[JSON::Field(key: "cloudWatch")]
        getter cloud_watch : Types::CloudWatchLogGroupLogDestination

        def initialize(
          @cloud_watch : Types::CloudWatchLogGroupLogDestination
        )
        end
      end

      # Defines settings to enable text conversation logs.

      struct TextLogSetting
        include JSON::Serializable


        @[JSON::Field(key: "destination")]
        getter destination : Types::TextLogDestination

        # Determines whether conversation logs should be stored for an alias.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The option to enable selective conversation log capture for text.

        @[JSON::Field(key: "selectiveLoggingEnabled")]
        getter selective_logging_enabled : Bool?

        def initialize(
          @destination : Types::TextLogDestination,
          @enabled : Bool,
          @selective_logging_enabled : Bool? = nil
        )
        end
      end

      # Your request rate is too high. Reduce the frequency of requests.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The number of seconds after which the user can invoke the API again.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The object representing the filter that Amazon Lex will use to select the appropriate transcript.

      struct TranscriptFilter
        include JSON::Serializable

        # The object representing the filter that Amazon Lex will use to select the appropriate transcript
        # when the transcript format is the Amazon Lex format.

        @[JSON::Field(key: "lexTranscriptFilter")]
        getter lex_transcript_filter : Types::LexTranscriptFilter?

        def initialize(
          @lex_transcript_filter : Types::LexTranscriptFilter? = nil
        )
        end
      end

      # Indicates the setting of the location where the transcript is stored.

      struct TranscriptSourceSetting
        include JSON::Serializable

        # Indicates the setting of the Amazon S3 bucket where the transcript is stored.

        @[JSON::Field(key: "s3BucketTranscriptSource")]
        getter s3_bucket_transcript_source : Types::S3BucketTranscriptSource?

        def initialize(
          @s3_bucket_transcript_source : Types::S3BucketTranscriptSource? = nil
        )
        end
      end

      # Contains information about the messages in the turn.

      struct TurnSpecification
        include JSON::Serializable

        # Contains information about the agent messages in the turn.

        @[JSON::Field(key: "agentTurn")]
        getter agent_turn : Types::AgentTurnSpecification?

        # Contains information about the user messages in the turn.

        @[JSON::Field(key: "userTurn")]
        getter user_turn : Types::UserTurnSpecification?

        def initialize(
          @agent_turn : Types::AgentTurnSpecification? = nil,
          @user_turn : Types::UserTurnSpecification? = nil
        )
        end
      end

      # Unified configuration settings that combine speech recognition and synthesis capabilities.

      struct UnifiedSpeechSettings
        include JSON::Serializable

        # The foundation model configuration to use for unified speech processing capabilities.

        @[JSON::Field(key: "speechFoundationModel")]
        getter speech_foundation_model : Types::SpeechFoundationModel

        def initialize(
          @speech_foundation_model : Types::SpeechFoundationModel
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove the tags from.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # A list of tag keys to remove from the resource. If a tag key does not exist on the resource, it is
        # ignored.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateBotAliasRequest
        include JSON::Serializable

        # The unique identifier of the bot alias.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The new name to assign to the bot alias.

        @[JSON::Field(key: "botAliasName")]
        getter bot_alias_name : String

        # The identifier of the bot with the updated alias.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The new Lambda functions to use in each locale for the bot alias.

        @[JSON::Field(key: "botAliasLocaleSettings")]
        getter bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)?

        # The new bot version to assign to the bot alias.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The new settings for storing conversation logs in Amazon CloudWatch Logs and Amazon S3 buckets.

        @[JSON::Field(key: "conversationLogSettings")]
        getter conversation_log_settings : Types::ConversationLogSettings?

        # The new description to assign to the bot alias.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "sentimentAnalysisSettings")]
        getter sentiment_analysis_settings : Types::SentimentAnalysisSettings?

        def initialize(
          @bot_alias_id : String,
          @bot_alias_name : String,
          @bot_id : String,
          @bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)? = nil,
          @bot_version : String? = nil,
          @conversation_log_settings : Types::ConversationLogSettings? = nil,
          @description : String? = nil,
          @sentiment_analysis_settings : Types::SentimentAnalysisSettings? = nil
        )
        end
      end


      struct UpdateBotAliasResponse
        include JSON::Serializable

        # The identifier of the updated bot alias.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The updated Lambda functions to use in each locale for the bot alias.

        @[JSON::Field(key: "botAliasLocaleSettings")]
        getter bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)?

        # The updated name of the bot alias.

        @[JSON::Field(key: "botAliasName")]
        getter bot_alias_name : String?

        # The current status of the bot alias. When the status is Available the alias is ready for use.

        @[JSON::Field(key: "botAliasStatus")]
        getter bot_alias_status : String?

        # The identifier of the bot with the updated alias.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The updated version of the bot that the alias points to.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The updated settings for storing conversation logs in Amazon CloudWatch Logs and Amazon S3 buckets.

        @[JSON::Field(key: "conversationLogSettings")]
        getter conversation_log_settings : Types::ConversationLogSettings?

        # A timestamp of the date and time that the bot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The updated description of the bot alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A timestamp of the date and time that the bot was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?


        @[JSON::Field(key: "sentimentAnalysisSettings")]
        getter sentiment_analysis_settings : Types::SentimentAnalysisSettings?

        def initialize(
          @bot_alias_id : String? = nil,
          @bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)? = nil,
          @bot_alias_name : String? = nil,
          @bot_alias_status : String? = nil,
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @conversation_log_settings : Types::ConversationLogSettings? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @sentiment_analysis_settings : Types::SentimentAnalysisSettings? = nil
        )
        end
      end


      struct UpdateBotLocaleRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the locale.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the locale to be updated. The version can only be the DRAFT
        # version.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale to update. The string must match one of the supported
        # locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The new confidence threshold where Amazon Lex inserts the AMAZON.FallbackIntent and
        # AMAZON.KendraSearchIntent intents in the list of possible intents for an utterance.

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64

        # The new description of the locale.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains settings for generative AI features powered by Amazon Bedrock for your bot locale. Use this
        # object to turn generative AI features on and off. Pricing may differ if you turn a feature on. For
        # more information, see LINK.

        @[JSON::Field(key: "generativeAISettings")]
        getter generative_ai_settings : Types::GenerativeAISettings?

        # The new sensitivity level for voice activity detection (VAD) in the bot locale. This setting helps
        # optimize speech recognition accuracy by adjusting how the system responds to background noise during
        # voice interactions.

        @[JSON::Field(key: "speechDetectionSensitivity")]
        getter speech_detection_sensitivity : String?

        # Updated speech-to-text settings to apply to the bot locale.

        @[JSON::Field(key: "speechRecognitionSettings")]
        getter speech_recognition_settings : Types::SpeechRecognitionSettings?

        # Updated unified speech settings to apply to the bot locale.

        @[JSON::Field(key: "unifiedSpeechSettings")]
        getter unified_speech_settings : Types::UnifiedSpeechSettings?

        # The new Amazon Polly voice Amazon Lex should use for voice interaction with the user.

        @[JSON::Field(key: "voiceSettings")]
        getter voice_settings : Types::VoiceSettings?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @nlu_intent_confidence_threshold : Float64,
          @description : String? = nil,
          @generative_ai_settings : Types::GenerativeAISettings? = nil,
          @speech_detection_sensitivity : String? = nil,
          @speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
          @unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
          @voice_settings : Types::VoiceSettings? = nil
        )
        end
      end


      struct UpdateBotLocaleResponse
        include JSON::Serializable

        # The identifier of the bot that contains the updated locale.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The current status of the locale. When the bot status is Built the locale is ready for use.

        @[JSON::Field(key: "botLocaleStatus")]
        getter bot_locale_status : String?

        # The version of the bot that contains the updated locale.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the locale was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The updated description of the locale.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If the botLocaleStatus is Failed , the failureReasons field lists the errors that occurred while
        # building the bot.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # Contains settings for generative AI features powered by Amazon Bedrock for your bot locale.

        @[JSON::Field(key: "generativeAISettings")]
        getter generative_ai_settings : Types::GenerativeAISettings?

        # A timestamp of the date and time that the locale was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The language and locale of the updated bot locale.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The updated locale name for the locale.

        @[JSON::Field(key: "localeName")]
        getter locale_name : String?

        # The updated confidence threshold for inserting the AMAZON.FallbackIntent and
        # AMAZON.KendraSearchIntent intents in the list of possible intents for an utterance.

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64?

        # Recommended actions to take to resolve an error in the failureReasons field.

        @[JSON::Field(key: "recommendedActions")]
        getter recommended_actions : Array(String)?

        # The updated sensitivity level for voice activity detection (VAD) in the bot locale.

        @[JSON::Field(key: "speechDetectionSensitivity")]
        getter speech_detection_sensitivity : String?

        # The updated speech-to-text settings for the bot locale.

        @[JSON::Field(key: "speechRecognitionSettings")]
        getter speech_recognition_settings : Types::SpeechRecognitionSettings?

        # The updated unified speech settings for the bot locale.

        @[JSON::Field(key: "unifiedSpeechSettings")]
        getter unified_speech_settings : Types::UnifiedSpeechSettings?

        # The updated Amazon Polly voice to use for voice interaction with the user.

        @[JSON::Field(key: "voiceSettings")]
        getter voice_settings : Types::VoiceSettings?

        def initialize(
          @bot_id : String? = nil,
          @bot_locale_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @generative_ai_settings : Types::GenerativeAISettings? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @locale_name : String? = nil,
          @nlu_intent_confidence_threshold : Float64? = nil,
          @recommended_actions : Array(String)? = nil,
          @speech_detection_sensitivity : String? = nil,
          @speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
          @unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
          @voice_settings : Types::VoiceSettings? = nil
        )
        end
      end


      struct UpdateBotRecommendationRequest
        include JSON::Serializable

        # The unique identifier of the bot containing the bot recommendation to be updated.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The unique identifier of the bot recommendation to be updated.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String

        # The version of the bot containing the bot recommendation to be updated.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The object representing the passwords that will be used to encrypt the data related to the bot
        # recommendation results, as well as the KMS key ARN used to encrypt the associated metadata.

        @[JSON::Field(key: "encryptionSetting")]
        getter encryption_setting : Types::EncryptionSetting

        # The identifier of the language and locale of the bot recommendation to update. The string must match
        # one of the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_id : String,
          @bot_recommendation_id : String,
          @bot_version : String,
          @encryption_setting : Types::EncryptionSetting,
          @locale_id : String
        )
        end
      end


      struct UpdateBotRecommendationResponse
        include JSON::Serializable

        # The unique identifier of the bot containing the bot recommendation that has been updated.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The unique identifier of the bot recommendation to be updated.

        @[JSON::Field(key: "botRecommendationId")]
        getter bot_recommendation_id : String?

        # The status of the bot recommendation. If the status is Failed, then the reasons for the failure are
        # listed in the failureReasons field.

        @[JSON::Field(key: "botRecommendationStatus")]
        getter bot_recommendation_status : String?

        # The version of the bot containing the bot recommendation that has been updated.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of the date and time that the bot recommendation was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The object representing the passwords that were used to encrypt the data related to the bot
        # recommendation results, as well as the KMS key ARN used to encrypt the associated metadata.

        @[JSON::Field(key: "encryptionSetting")]
        getter encryption_setting : Types::EncryptionSetting?

        # A timestamp of the date and time that the bot recommendation was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The identifier of the language and locale of the bot recommendation to update. The string must match
        # one of the supported locales. For more information, see Supported languages

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The object representing the Amazon S3 bucket containing the transcript, as well as the associated
        # metadata.

        @[JSON::Field(key: "transcriptSourceSetting")]
        getter transcript_source_setting : Types::TranscriptSourceSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_recommendation_id : String? = nil,
          @bot_recommendation_status : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @encryption_setting : Types::EncryptionSetting? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @transcript_source_setting : Types::TranscriptSourceSetting? = nil
        )
        end
      end


      struct UpdateBotRequest
        include JSON::Serializable

        # The unique identifier of the bot to update. This identifier is returned by the CreateBot operation.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The new name of the bot. The name must be unique in the account that creates the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # Provides information on additional privacy protections Amazon Lex should use with the bot's data.

        @[JSON::Field(key: "dataPrivacy")]
        getter data_privacy : Types::DataPrivacy

        # The time, in seconds, that Amazon Lex should keep information about a user's conversation with the
        # bot. A user interaction remains active for the amount of time specified. If no conversation occurs
        # during this time, the session expires and Amazon Lex deletes any data provided before the timeout.
        # You can specify between 60 (1 minute) and 86,400 (24 hours) seconds.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the bot.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The list of bot members in the network associated with the update action.

        @[JSON::Field(key: "botMembers")]
        getter bot_members : Array(Types::BotMember)?

        # The type of the bot to be updated.

        @[JSON::Field(key: "botType")]
        getter bot_type : String?

        # A description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Allows you to modify how Amazon Lex logs errors during bot interactions, including destinations for
        # error logs and the types of errors to be captured.

        @[JSON::Field(key: "errorLogSettings")]
        getter error_log_settings : Types::ErrorLogSettings?

        def initialize(
          @bot_id : String,
          @bot_name : String,
          @data_privacy : Types::DataPrivacy,
          @idle_session_ttl_in_seconds : Int32,
          @role_arn : String,
          @bot_members : Array(Types::BotMember)? = nil,
          @bot_type : String? = nil,
          @description : String? = nil,
          @error_log_settings : Types::ErrorLogSettings? = nil
        )
        end
      end


      struct UpdateBotResponse
        include JSON::Serializable

        # The unique identifier of the bot that was updated.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The list of bot members in the network that was updated.

        @[JSON::Field(key: "botMembers")]
        getter bot_members : Array(Types::BotMember)?

        # The name of the bot after the update.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # Shows the current status of the bot. The bot is first in the Creating status. Once the bot is read
        # for use, it changes to the Available status. After the bot is created, you can use the DRAFT version
        # of the bot.

        @[JSON::Field(key: "botStatus")]
        getter bot_status : String?

        # The type of the bot that was updated.

        @[JSON::Field(key: "botType")]
        getter bot_type : String?

        # A timestamp of the date and time that the bot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The data privacy settings for the bot after the update.

        @[JSON::Field(key: "dataPrivacy")]
        getter data_privacy : Types::DataPrivacy?

        # The description of the bot after the update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Settings for managing error logs within the response of an update bot operation.

        @[JSON::Field(key: "errorLogSettings")]
        getter error_log_settings : Types::ErrorLogSettings?

        # The session timeout, in seconds, for the bot after the update.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # A timestamp of the date and time that the bot was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The Amazon Resource Name (ARN) of the IAM role used by the bot after the update.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @bot_id : String? = nil,
          @bot_members : Array(Types::BotMember)? = nil,
          @bot_name : String? = nil,
          @bot_status : String? = nil,
          @bot_type : String? = nil,
          @creation_date_time : Time? = nil,
          @data_privacy : Types::DataPrivacy? = nil,
          @description : String? = nil,
          @error_log_settings : Types::ErrorLogSettings? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @last_updated_date_time : Time? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateExportRequest
        include JSON::Serializable

        # The unique identifier Amazon Lex assigned to the export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String

        # The new password to use to encrypt the export zip archive.

        @[JSON::Field(key: "filePassword")]
        getter file_password : String?

        def initialize(
          @export_id : String,
          @file_password : String? = nil
        )
        end
      end


      struct UpdateExportResponse
        include JSON::Serializable

        # The date and time that the export was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The unique identifier Amazon Lex assigned to the export.

        @[JSON::Field(key: "exportId")]
        getter export_id : String?

        # The status of the export. When the status is Completed the export archive is available for download.

        @[JSON::Field(key: "exportStatus")]
        getter export_status : String?

        # The file format used for the files that define the resource. The TSV format is required to export a
        # custom vocabulary only; otherwise use LexJson format.

        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # The date and time that the export was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # A description of the type of resource that was exported, either a bot or a bot locale.

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ExportResourceSpecification?

        def initialize(
          @creation_date_time : Time? = nil,
          @export_id : String? = nil,
          @export_status : String? = nil,
          @file_format : String? = nil,
          @last_updated_date_time : Time? = nil,
          @resource_specification : Types::ExportResourceSpecification? = nil
        )
        end
      end


      struct UpdateIntentRequest
        include JSON::Serializable

        # The identifier of the bot that contains the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the intent. Must be DRAFT .

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The unique identifier of the intent to update.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The new name for the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # The identifier of the language and locale where this intent is used. The string must match one of
        # the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The new description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The new Lambda function to use between each turn of the conversation with the bot.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::DialogCodeHookSettings?

        # The new Lambda function to call when all of the intents required slots are provided and the intent
        # is ready for fulfillment.

        @[JSON::Field(key: "fulfillmentCodeHook")]
        getter fulfillment_code_hook : Types::FulfillmentCodeHookSettings?

        # Configuration settings for a response sent to the user before Amazon Lex starts eliciting slots.

        @[JSON::Field(key: "initialResponseSetting")]
        getter initial_response_setting : Types::InitialResponseSetting?

        # A new list of contexts that must be active in order for Amazon Lex to consider the intent.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # The new response that Amazon Lex sends the user when the intent is closed.

        @[JSON::Field(key: "intentClosingSetting")]
        getter intent_closing_setting : Types::IntentClosingSetting?

        # New prompts that Amazon Lex sends to the user to confirm the completion of an intent.

        @[JSON::Field(key: "intentConfirmationSetting")]
        getter intent_confirmation_setting : Types::IntentConfirmationSetting?

        # The new display name for the intent.

        @[JSON::Field(key: "intentDisplayName")]
        getter intent_display_name : String?

        # New configuration settings for connecting to an Amazon Kendra index.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # A new list of contexts that Amazon Lex activates when the intent is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # The signature of the new built-in intent to use as the parent of this intent.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # Qinconnect intent configuration details for the update intent request.

        @[JSON::Field(key: "qInConnectIntentConfiguration")]
        getter q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration?

        # Specifies the configuration of the built-in Amazon.QnAIntent . The AMAZON.QnAIntent intent is called
        # when Amazon Lex can't determine another intent to invoke. If you specify this field, you can't
        # specify the kendraConfiguration field.

        @[JSON::Field(key: "qnAIntentConfiguration")]
        getter qn_a_intent_configuration : Types::QnAIntentConfiguration?

        # New utterances used to invoke the intent.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?

        # A new list of slots and their priorities that are contained by the intent.

        @[JSON::Field(key: "slotPriorities")]
        getter slot_priorities : Array(Types::SlotPriority)?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @intent_name : String,
          @locale_id : String,
          @description : String? = nil,
          @dialog_code_hook : Types::DialogCodeHookSettings? = nil,
          @fulfillment_code_hook : Types::FulfillmentCodeHookSettings? = nil,
          @initial_response_setting : Types::InitialResponseSetting? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @intent_closing_setting : Types::IntentClosingSetting? = nil,
          @intent_confirmation_setting : Types::IntentConfirmationSetting? = nil,
          @intent_display_name : String? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration? = nil,
          @qn_a_intent_configuration : Types::QnAIntentConfiguration? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil,
          @slot_priorities : Array(Types::SlotPriority)? = nil
        )
        end
      end


      struct UpdateIntentResponse
        include JSON::Serializable

        # The identifier of the bot that contains the intent.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that contains the intent. Will always be DRAFT .

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # A timestamp of when the intent was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The updated description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated Lambda function called during each turn of the conversation with the user.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::DialogCodeHookSettings?

        # The updated Lambda function called when the intent is ready for fulfillment.

        @[JSON::Field(key: "fulfillmentCodeHook")]
        getter fulfillment_code_hook : Types::FulfillmentCodeHookSettings?

        # Configuration settings for a response sent to the user before Amazon Lex starts eliciting slots.

        @[JSON::Field(key: "initialResponseSetting")]
        getter initial_response_setting : Types::InitialResponseSetting?

        # The updated list of contexts that must be active for the intent to be considered by Amazon Lex.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # The updated response that Amazon Lex sends the user when the intent is closed.

        @[JSON::Field(key: "intentClosingSetting")]
        getter intent_closing_setting : Types::IntentClosingSetting?

        # The updated prompts that Amazon Lex sends to the user to confirm the completion of an intent.

        @[JSON::Field(key: "intentConfirmationSetting")]
        getter intent_confirmation_setting : Types::IntentConfirmationSetting?

        # The updated display name of the intent.

        @[JSON::Field(key: "intentDisplayName")]
        getter intent_display_name : String?

        # The identifier of the intent that was updated.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The updated name of the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # The updated configuration for connecting to an Amazon Kendra index with the
        # AMAZON.KendraSearchIntent intent.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # A timestamp of the last time that the intent was modified.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The updated language and locale of the intent.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The updated list of contexts that Amazon Lex activates when the intent is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # The updated built-in intent that is the parent of this intent.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # Qinconnect intent configuration details for the update intent response.

        @[JSON::Field(key: "qInConnectIntentConfiguration")]
        getter q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration?

        # Details about the configuration of the built-in Amazon.QnAIntent .

        @[JSON::Field(key: "qnAIntentConfiguration")]
        getter qn_a_intent_configuration : Types::QnAIntentConfiguration?

        # The updated list of sample utterances for the intent.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(Types::SampleUtterance)?

        # The updated list of slots and their priorities that are elicited from the user for the intent.

        @[JSON::Field(key: "slotPriorities")]
        getter slot_priorities : Array(Types::SlotPriority)?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @dialog_code_hook : Types::DialogCodeHookSettings? = nil,
          @fulfillment_code_hook : Types::FulfillmentCodeHookSettings? = nil,
          @initial_response_setting : Types::InitialResponseSetting? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @intent_closing_setting : Types::IntentClosingSetting? = nil,
          @intent_confirmation_setting : Types::IntentConfirmationSetting? = nil,
          @intent_display_name : String? = nil,
          @intent_id : String? = nil,
          @intent_name : String? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration? = nil,
          @qn_a_intent_configuration : Types::QnAIntentConfiguration? = nil,
          @sample_utterances : Array(Types::SampleUtterance)? = nil,
          @slot_priorities : Array(Types::SlotPriority)? = nil
        )
        end
      end


      struct UpdateResourcePolicyRequest
        include JSON::Serializable

        # A resource policy to add to the resource. The policy is a JSON structure that contains one or more
        # statements that define the policy. The policy must follow the IAM syntax. For more information about
        # the contents of a JSON policy document, see IAM JSON policy reference . If the policy isn't valid,
        # Amazon Lex returns a validation exception.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The identifier of the revision of the policy to update. If this revision ID doesn't match the
        # current revision ID, Amazon Lex throws an exception. If you don't specify a revision, Amazon Lex
        # overwrites the contents of the policy with the new values.

        @[JSON::Field(key: "expectedRevisionId")]
        getter expected_revision_id : String?

        def initialize(
          @policy : String,
          @resource_arn : String,
          @expected_revision_id : String? = nil
        )
        end
      end


      struct UpdateResourcePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot or bot alias that the resource policy is attached to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The current revision of the resource policy. Use the revision ID to make sure that you are updating
        # the most current version of a resource policy when you add a policy statement to a resource, delete
        # a resource, or update a resource.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @resource_arn : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct UpdateSlotRequest
        include JSON::Serializable

        # The unique identifier of the bot that contains the slot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the slot. Must always be DRAFT .

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the intent that contains the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The identifier of the language and locale that contains the slot. The string must match one of the
        # supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The unique identifier for the slot to update.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String

        # The new name for the slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String

        # A new set of prompts that Amazon Lex sends to the user to elicit a response the provides a value for
        # the slot.

        @[JSON::Field(key: "valueElicitationSetting")]
        getter value_elicitation_setting : Types::SlotValueElicitationSetting

        # The new description for the slot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Determines whether the slot accepts multiple values in one response. Multiple value slots are only
        # available in the en-US locale. If you set this value to true in any other locale, Amazon Lex throws
        # a ValidationException . If the multipleValuesSetting is not set, the default value is false .

        @[JSON::Field(key: "multipleValuesSetting")]
        getter multiple_values_setting : Types::MultipleValuesSetting?

        # New settings that determine how slot values are formatted in Amazon CloudWatch logs.

        @[JSON::Field(key: "obfuscationSetting")]
        getter obfuscation_setting : Types::ObfuscationSetting?

        # The unique identifier of the new slot type to associate with this slot.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # Specifications for the constituent sub slots and the expression for the composite slot.

        @[JSON::Field(key: "subSlotSetting")]
        getter sub_slot_setting : Types::SubSlotSetting?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @intent_id : String,
          @locale_id : String,
          @slot_id : String,
          @slot_name : String,
          @value_elicitation_setting : Types::SlotValueElicitationSetting,
          @description : String? = nil,
          @multiple_values_setting : Types::MultipleValuesSetting? = nil,
          @obfuscation_setting : Types::ObfuscationSetting? = nil,
          @slot_type_id : String? = nil,
          @sub_slot_setting : Types::SubSlotSetting? = nil
        )
        end
      end


      struct UpdateSlotResponse
        include JSON::Serializable

        # The identifier of the bot that contains the slot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that contains the slot. Will always be DRAFT .

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The timestamp of the date and time that the slot was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The updated description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The intent that contains the slot.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String?

        # The timestamp of the date and time that the slot was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The locale that contains the slot.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # Indicates whether the slot accepts multiple values in one response.

        @[JSON::Field(key: "multipleValuesSetting")]
        getter multiple_values_setting : Types::MultipleValuesSetting?

        # The updated setting that determines whether the slot value is obfuscated in the Amazon CloudWatch
        # logs.

        @[JSON::Field(key: "obfuscationSetting")]
        getter obfuscation_setting : Types::ObfuscationSetting?

        # The unique identifier of the slot that was updated.

        @[JSON::Field(key: "slotId")]
        getter slot_id : String?

        # The updated name of the slot.

        @[JSON::Field(key: "slotName")]
        getter slot_name : String?

        # The updated identifier of the slot type that provides values for the slot.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # Specifications for the constituent sub slots and the expression for the composite slot.

        @[JSON::Field(key: "subSlotSetting")]
        getter sub_slot_setting : Types::SubSlotSetting?

        # The updated prompts that Amazon Lex sends to the user to elicit a response that provides a value for
        # the slot.

        @[JSON::Field(key: "valueElicitationSetting")]
        getter value_elicitation_setting : Types::SlotValueElicitationSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @intent_id : String? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @multiple_values_setting : Types::MultipleValuesSetting? = nil,
          @obfuscation_setting : Types::ObfuscationSetting? = nil,
          @slot_id : String? = nil,
          @slot_name : String? = nil,
          @slot_type_id : String? = nil,
          @sub_slot_setting : Types::SubSlotSetting? = nil,
          @value_elicitation_setting : Types::SlotValueElicitationSetting? = nil
        )
        end
      end


      struct UpdateSlotTypeRequest
        include JSON::Serializable

        # The identifier of the bot that contains the slot type.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The version of the bot that contains the slot type. Must be DRAFT .

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The identifier of the language and locale that contains the slot type. The string must match one of
        # the supported locales. For more information, see Supported languages .

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The unique identifier of the slot type to update.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String

        # The new name of the slot type.

        @[JSON::Field(key: "slotTypeName")]
        getter slot_type_name : String

        # Specifications for a composite slot type.

        @[JSON::Field(key: "compositeSlotTypeSetting")]
        getter composite_slot_type_setting : Types::CompositeSlotTypeSetting?

        # The new description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "externalSourceSetting")]
        getter external_source_setting : Types::ExternalSourceSetting?

        # The new built-in slot type that should be used as the parent of this slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # A new list of values and their optional synonyms that define the values that the slot type can take.

        @[JSON::Field(key: "slotTypeValues")]
        getter slot_type_values : Array(Types::SlotTypeValue)?

        # The strategy that Amazon Lex should use when deciding on a value from the list of slot type values.

        @[JSON::Field(key: "valueSelectionSetting")]
        getter value_selection_setting : Types::SlotValueSelectionSetting?

        def initialize(
          @bot_id : String,
          @bot_version : String,
          @locale_id : String,
          @slot_type_id : String,
          @slot_type_name : String,
          @composite_slot_type_setting : Types::CompositeSlotTypeSetting? = nil,
          @description : String? = nil,
          @external_source_setting : Types::ExternalSourceSetting? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_values : Array(Types::SlotTypeValue)? = nil,
          @value_selection_setting : Types::SlotValueSelectionSetting? = nil
        )
        end
      end


      struct UpdateSlotTypeResponse
        include JSON::Serializable

        # The identifier of the bot that contains the slot type.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The version of the bot that contains the slot type. This is always DRAFT .

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Specifications for a composite slot type.

        @[JSON::Field(key: "compositeSlotTypeSetting")]
        getter composite_slot_type_setting : Types::CompositeSlotTypeSetting?

        # The timestamp of the date and time that the slot type was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The updated description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "externalSourceSetting")]
        getter external_source_setting : Types::ExternalSourceSetting?

        # A timestamp of the date and time that the slot type was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # The language and locale of the updated slot type.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The updated signature of the built-in slot type that is the parent of this slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # The unique identifier of the updated slot type.

        @[JSON::Field(key: "slotTypeId")]
        getter slot_type_id : String?

        # The updated name of the slot type.

        @[JSON::Field(key: "slotTypeName")]
        getter slot_type_name : String?

        # The updated values that the slot type provides.

        @[JSON::Field(key: "slotTypeValues")]
        getter slot_type_values : Array(Types::SlotTypeValue)?

        # The updated strategy that Amazon Lex uses to determine which value to select from the slot type.

        @[JSON::Field(key: "valueSelectionSetting")]
        getter value_selection_setting : Types::SlotValueSelectionSetting?

        def initialize(
          @bot_id : String? = nil,
          @bot_version : String? = nil,
          @composite_slot_type_setting : Types::CompositeSlotTypeSetting? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @external_source_setting : Types::ExternalSourceSetting? = nil,
          @last_updated_date_time : Time? = nil,
          @locale_id : String? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_id : String? = nil,
          @slot_type_name : String? = nil,
          @slot_type_values : Array(Types::SlotTypeValue)? = nil,
          @value_selection_setting : Types::SlotValueSelectionSetting? = nil
        )
        end
      end


      struct UpdateTestSetRequest
        include JSON::Serializable

        # The test set Id for which update test operation to be performed.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String

        # The new test set name.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String

        # The new test set description.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @test_set_id : String,
          @test_set_name : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateTestSetResponse
        include JSON::Serializable

        # The creation date and time for the updated test set.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : Time?

        # The test set description for the updated test set.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time of the last update for the updated test set.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : Time?

        # Indicates whether audio or text is used for the updated test set.

        @[JSON::Field(key: "modality")]
        getter modality : String?

        # The number of conversation turns from the updated test set.

        @[JSON::Field(key: "numTurns")]
        getter num_turns : Int32?

        # The roleARN used for any operation in the test set to access resources in the Amazon Web Services
        # account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status for the updated test set.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon S3 storage location for the updated test set.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : Types::TestSetStorageLocation?

        # The test set Id for which update test operation to be performed.

        @[JSON::Field(key: "testSetId")]
        getter test_set_id : String?

        # The test set name for the updated test set.

        @[JSON::Field(key: "testSetName")]
        getter test_set_name : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @last_updated_date_time : Time? = nil,
          @modality : String? = nil,
          @num_turns : Int32? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @storage_location : Types::TestSetStorageLocation? = nil,
          @test_set_id : String? = nil,
          @test_set_name : String? = nil
        )
        end
      end

      # Contains information about the user messages in the turn in the input.

      struct UserTurnInputSpecification
        include JSON::Serializable

        # The utterance input in the user turn.

        @[JSON::Field(key: "utteranceInput")]
        getter utterance_input : Types::UtteranceInputSpecification

        # Request attributes of the user turn.

        @[JSON::Field(key: "requestAttributes")]
        getter request_attributes : Hash(String, String)?

        # Contains information about the session state in the input.

        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::InputSessionStateSpecification?

        def initialize(
          @utterance_input : Types::UtteranceInputSpecification,
          @request_attributes : Hash(String, String)? = nil,
          @session_state : Types::InputSessionStateSpecification? = nil
        )
        end
      end

      # Contains information about the intent that is output for the turn by the test execution.

      struct UserTurnIntentOutput
        include JSON::Serializable

        # The name of the intent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The slots associated with the intent.

        @[JSON::Field(key: "slots")]
        getter slots : Hash(String, Types::UserTurnSlotOutput)?

        def initialize(
          @name : String,
          @slots : Hash(String, Types::UserTurnSlotOutput)? = nil
        )
        end
      end

      # Contains results that are output for the user turn by the test execution.

      struct UserTurnOutputSpecification
        include JSON::Serializable

        # Contains information about the intent.

        @[JSON::Field(key: "intent")]
        getter intent : Types::UserTurnIntentOutput

        # The contexts that are active in the turn.

        @[JSON::Field(key: "activeContexts")]
        getter active_contexts : Array(Types::ActiveContext)?

        # The transcript that is output for the user turn by the test execution.

        @[JSON::Field(key: "transcript")]
        getter transcript : String?

        def initialize(
          @intent : Types::UserTurnIntentOutput,
          @active_contexts : Array(Types::ActiveContext)? = nil,
          @transcript : String? = nil
        )
        end
      end

      # Contains the results for the user turn by the test execution.

      struct UserTurnResult
        include JSON::Serializable

        # Contains information about the expected output for the user turn.

        @[JSON::Field(key: "expectedOutput")]
        getter expected_output : Types::UserTurnOutputSpecification

        # Contains information about the user messages in the turn in the input.

        @[JSON::Field(key: "input")]
        getter input : Types::UserTurnInputSpecification

        # Contains information about the actual output for the user turn.

        @[JSON::Field(key: "actualOutput")]
        getter actual_output : Types::UserTurnOutputSpecification?

        # Contains information about the results related to the conversation associated with the user turn.

        @[JSON::Field(key: "conversationLevelResult")]
        getter conversation_level_result : Types::ConversationLevelResultDetail?

        # Specifies whether the expected and actual outputs match or not, or if there is an error in
        # execution.

        @[JSON::Field(key: "endToEndResult")]
        getter end_to_end_result : String?


        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ExecutionErrorDetails?

        # Specifies whether the expected and actual intents match or not.

        @[JSON::Field(key: "intentMatchResult")]
        getter intent_match_result : String?

        # Specifies whether the expected and actual slots match or not.

        @[JSON::Field(key: "slotMatchResult")]
        getter slot_match_result : String?

        # Specifies whether the expected and actual speech transcriptions match or not, or if there is an
        # error in execution.

        @[JSON::Field(key: "speechTranscriptionResult")]
        getter speech_transcription_result : String?

        def initialize(
          @expected_output : Types::UserTurnOutputSpecification,
          @input : Types::UserTurnInputSpecification,
          @actual_output : Types::UserTurnOutputSpecification? = nil,
          @conversation_level_result : Types::ConversationLevelResultDetail? = nil,
          @end_to_end_result : String? = nil,
          @error_details : Types::ExecutionErrorDetails? = nil,
          @intent_match_result : String? = nil,
          @slot_match_result : String? = nil,
          @speech_transcription_result : String? = nil
        )
        end
      end

      # Contains information about a slot output by the test set execution.

      struct UserTurnSlotOutput
        include JSON::Serializable

        # A list of items mapping the name of the subslots to information about those subslots.

        @[JSON::Field(key: "subSlots")]
        getter sub_slots : Hash(String, Types::UserTurnSlotOutput)?

        # The value output by the slot recognition.

        @[JSON::Field(key: "value")]
        getter value : String?

        # Values that are output by the slot recognition.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::UserTurnSlotOutput)?

        def initialize(
          @sub_slots : Hash(String, Types::UserTurnSlotOutput)? = nil,
          @value : String? = nil,
          @values : Array(Types::UserTurnSlotOutput)? = nil
        )
        end
      end

      # Contains information about the expected and input values for the user turn.

      struct UserTurnSpecification
        include JSON::Serializable

        # Contains results about the expected output for the user turn.

        @[JSON::Field(key: "expected")]
        getter expected : Types::UserTurnOutputSpecification

        # Contains information about the user messages in the turn in the input.

        @[JSON::Field(key: "input")]
        getter input : Types::UserTurnInputSpecification

        def initialize(
          @expected : Types::UserTurnOutputSpecification,
          @input : Types::UserTurnInputSpecification
        )
        end
      end

      # Provides parameters for setting the time window and duration for aggregating utterance data.

      struct UtteranceAggregationDuration
        include JSON::Serializable

        # The desired time window for aggregating utterances.

        @[JSON::Field(key: "relativeAggregationDuration")]
        getter relative_aggregation_duration : Types::RelativeAggregationDuration

        def initialize(
          @relative_aggregation_duration : Types::RelativeAggregationDuration
        )
        end
      end

      # Contains information about the audio for an utterance.

      struct UtteranceAudioInputSpecification
        include JSON::Serializable

        # Amazon S3 file pointing to the audio.

        @[JSON::Field(key: "audioFileS3Location")]
        getter audio_file_s3_location : String

        def initialize(
          @audio_file_s3_location : String
        )
        end
      end

      # An object that contains a response to the utterance from the bot.

      struct UtteranceBotResponse
        include JSON::Serializable

        # The text of the response to the utterance from the bot.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The type of the response. The following values are possible: PlainText – A plain text string.
        # CustomPayload – A response string that you can customize to include data or metadata for your
        # application. SSML – A string that includes Speech Synthesis Markup Language to customize the audio
        # response. ImageResponseCard – An image with buttons that the customer can select. See
        # ImageResponseCard for more information.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?


        @[JSON::Field(key: "imageResponseCard")]
        getter image_response_card : Types::ImageResponseCard?

        def initialize(
          @content : String? = nil,
          @content_type : String? = nil,
          @image_response_card : Types::ImageResponseCard? = nil
        )
        end
      end

      # An object specifying the measure and method by which to sort the utterance data.

      struct UtteranceDataSortBy
        include JSON::Serializable

        # The measure by which to sort the utterance analytics data. Count – The number of utterances.
        # UtteranceTimestamp – The date and time of the utterance.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether to sort the results in ascending or descending order.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @name : String,
          @order : String
        )
        end
      end

      # Contains information about input of an utterance.

      struct UtteranceInputSpecification
        include JSON::Serializable

        # Contains information about the audio input for an utterance.

        @[JSON::Field(key: "audioInput")]
        getter audio_input : Types::UtteranceAudioInputSpecification?

        # A text input transcription of the utterance. It is only applicable for test-sets containing text
        # data.

        @[JSON::Field(key: "textInput")]
        getter text_input : String?

        def initialize(
          @audio_input : Types::UtteranceAudioInputSpecification? = nil,
          @text_input : String? = nil
        )
        end
      end

      # Contains information about multiple utterances in the results of a test set execution.

      struct UtteranceLevelTestResultItem
        include JSON::Serializable

        # The record number of the result.

        @[JSON::Field(key: "recordNumber")]
        getter record_number : Int64

        # Contains information about the turn associated with the result.

        @[JSON::Field(key: "turnResult")]
        getter turn_result : Types::TestSetTurnResult

        # The unique identifier for the conversation associated with the result.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        def initialize(
          @record_number : Int64,
          @turn_result : Types::TestSetTurnResult,
          @conversation_id : String? = nil
        )
        end
      end

      # Contains information about the utterances in the results of the test set execution.

      struct UtteranceLevelTestResults
        include JSON::Serializable

        # Contains information about an utterance in the results of the test set execution.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::UtteranceLevelTestResultItem)

        def initialize(
          @items : Array(Types::UtteranceLevelTestResultItem)
        )
        end
      end

      # An object containing information about a specific utterance.

      struct UtteranceSpecification
        include JSON::Serializable

        # The name of the intent that the utterance is associated to.

        @[JSON::Field(key: "associatedIntentName")]
        getter associated_intent_name : String?

        # The name of the slot that the utterance is associated to.

        @[JSON::Field(key: "associatedSlotName")]
        getter associated_slot_name : String?

        # The duration in milliseconds of the audio associated with the utterance.

        @[JSON::Field(key: "audioVoiceDurationMillis")]
        getter audio_voice_duration_millis : Int64?

        # The identifier of the alias of the bot that the utterance was made to.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The identifier for the audio of the bot response.

        @[JSON::Field(key: "botResponseAudioVoiceId")]
        getter bot_response_audio_voice_id : String?

        # A list of objects containing information about the bot response to the utterance.

        @[JSON::Field(key: "botResponses")]
        getter bot_responses : Array(Types::UtteranceBotResponse)?

        # The version of the bot that the utterance was made to.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The channel that is integrated with the bot that the utterance was made to.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The date and time when the conversation in which the utterance took place ended. A conversation is
        # defined as a unique combination of a sessionId and an originatingRequestId .

        @[JSON::Field(key: "conversationEndTime")]
        getter conversation_end_time : Time?

        # The date and time when the conversation in which the utterance took place began. A conversation is
        # defined as a unique combination of a sessionId and an originatingRequestId .

        @[JSON::Field(key: "conversationStartTime")]
        getter conversation_start_time : Time?

        # The type of dialog action that the utterance is associated to. See the type field in DialogAction
        # for more information.

        @[JSON::Field(key: "dialogActionType")]
        getter dialog_action_type : String?

        # The input type of the utterance. The possible values are as follows: PCM format: audio data must be
        # in little-endian byte order. audio/l16; rate=16000; channels=1 audio/x-l16; sample-rate=16000;
        # channel-count=1 audio/lpcm; sample-rate=8000; sample-size-bits=16; channel-count=1;
        # is-big-endian=false Opus format
        # audio/x-cbr-opus-with-preamble;preamble-size=0;bit-rate=256000;frame-size-milliseconds=4 Text format
        # text/plain; charset=utf-8

        @[JSON::Field(key: "inputType")]
        getter input_type : String?

        # The state of the intent that the utterance is associated to.

        @[JSON::Field(key: "intentState")]
        getter intent_state : String?

        # The locale of the bot that the utterance was made to.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The mode of the session. The possible values are as follows: Speech – The session consisted of
        # spoken dialogue. Text – The session consisted of written dialogue. DTMF – The session consisted of
        # touch-tone keypad (Dual Tone Multi-Frequency) key presses. MultiMode – The session consisted of
        # multiple modes.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The output type of the utterance. The possible values are as follows: audio/mpeg audio/ogg audio/pcm
        # (16 KHz) audio/ (defaults to mpeg ) text/plain; charset=utf-8

        @[JSON::Field(key: "outputType")]
        getter output_type : String?

        # The identifier of the session that the utterance was made in.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The slots that have been filled in the session by the time of the utterance.

        @[JSON::Field(key: "slotsFilledInSession")]
        getter slots_filled_in_session : String?

        # The text of the utterance.

        @[JSON::Field(key: "utterance")]
        getter utterance : String?

        # The identifier of the request associated with the utterance.

        @[JSON::Field(key: "utteranceRequestId")]
        getter utterance_request_id : String?

        # The date and time when the utterance took place.

        @[JSON::Field(key: "utteranceTimestamp")]
        getter utterance_timestamp : Time?

        # Specifies whether the bot understood the utterance or not.

        @[JSON::Field(key: "utteranceUnderstood")]
        getter utterance_understood : Bool?

        def initialize(
          @associated_intent_name : String? = nil,
          @associated_slot_name : String? = nil,
          @audio_voice_duration_millis : Int64? = nil,
          @bot_alias_id : String? = nil,
          @bot_response_audio_voice_id : String? = nil,
          @bot_responses : Array(Types::UtteranceBotResponse)? = nil,
          @bot_version : String? = nil,
          @channel : String? = nil,
          @conversation_end_time : Time? = nil,
          @conversation_start_time : Time? = nil,
          @dialog_action_type : String? = nil,
          @input_type : String? = nil,
          @intent_state : String? = nil,
          @locale_id : String? = nil,
          @mode : String? = nil,
          @output_type : String? = nil,
          @session_id : String? = nil,
          @slots_filled_in_session : String? = nil,
          @utterance : String? = nil,
          @utterance_request_id : String? = nil,
          @utterance_timestamp : Time? = nil,
          @utterance_understood : Bool? = nil
        )
        end
      end

      # One of the input parameters in your request isn't valid. Check the parameters and try your request
      # again.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines settings for using an Amazon Polly voice to communicate with a user. Valid values include:
      # standard neural long-form generative

      struct VoiceSettings
        include JSON::Serializable

        # The identifier of the Amazon Polly voice to use.

        @[JSON::Field(key: "voiceId")]
        getter voice_id : String

        # Indicates the type of Amazon Polly voice that Amazon Lex should use for voice interaction with the
        # user. For more information, see the engine parameter of the SynthesizeSpeech operation in the Amazon
        # Polly developer guide . If you do not specify a value, the default is standard .

        @[JSON::Field(key: "engine")]
        getter engine : String?

        def initialize(
          @voice_id : String,
          @engine : String? = nil
        )
        end
      end

      # Specifies the prompts that Amazon Lex uses while a bot is waiting for customer input.

      struct WaitAndContinueSpecification
        include JSON::Serializable

        # The response that Amazon Lex sends to indicate that the bot is ready to continue the conversation.

        @[JSON::Field(key: "continueResponse")]
        getter continue_response : Types::ResponseSpecification

        # The response that Amazon Lex sends to indicate that the bot is waiting for the conversation to
        # continue.

        @[JSON::Field(key: "waitingResponse")]
        getter waiting_response : Types::ResponseSpecification

        # Specifies whether the bot will wait for a user to respond. When this field is false, wait and
        # continue responses for a slot aren't used. If the active field isn't specified, the default is true.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # A response that Amazon Lex sends periodically to the user to indicate that the bot is still waiting
        # for input from the user.

        @[JSON::Field(key: "stillWaitingResponse")]
        getter still_waiting_response : Types::StillWaitingResponseSpecification?

        def initialize(
          @continue_response : Types::ResponseSpecification,
          @waiting_response : Types::ResponseSpecification,
          @active : Bool? = nil,
          @still_waiting_response : Types::StillWaitingResponseSpecification? = nil
        )
        end
      end
    end
  end
end
