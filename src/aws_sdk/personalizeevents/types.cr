require "json"
require "time"

module AwsSdk
  module PersonalizeEvents
    module Types

      # Represents action metadata added to an Action dataset using the PutActions API. For more information
      # see Importing actions individually .

      struct Action
        include JSON::Serializable

        # The ID associated with the action.

        @[JSON::Field(key: "actionId")]
        getter action_id : String

        # A string map of action-specific metadata. Each element in the map consists of a key-value pair. For
        # example, {"value": "100"} . The keys use camel case names that match the fields in the schema for
        # the Actions dataset. In the previous example, the value matches the 'VALUE' field defined in the
        # Actions schema. For categorical string data, to include multiple categories for a single action,
        # separate each category with a pipe separator ( | ). For example, \"Deluxe|Premium\" .

        @[JSON::Field(key: "properties")]
        getter properties : String?

        def initialize(
          @action_id : String,
          @properties : String? = nil
        )
        end
      end

      # Represents an action interaction event sent using the PutActionInteractions API.

      struct ActionInteraction
        include JSON::Serializable

        # The ID of the action the user interacted with. This corresponds to the ACTION_ID field of the Action
        # interaction schema.

        @[JSON::Field(key: "actionId")]
        getter action_id : String

        # The type of action interaction event. You can specify Viewed , Taken , and Not Taken event types.
        # For more information about action interaction event type data, see Event type data .

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The ID associated with the user's visit. Your application generates a unique sessionId when a user
        # first visits your website or uses your application.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The timestamp for when the action interaction event occurred. Timestamps must be in Unix epoch time
        # format, in seconds.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # An ID associated with the event. If an event ID is not provided, Amazon Personalize generates a
        # unique ID for the event. An event ID is not used as an input to the model. Amazon Personalize uses
        # the event ID to distinguish unique events. Any subsequent events after the first with the same event
        # ID are not used in model training.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # A list of action IDs that represents the sequence of actions you have shown the user. For example,
        # ["actionId1", "actionId2", "actionId3"] . Amazon Personalize doesn't use impressions data from
        # action interaction events. Instead, record multiple events for each action and use the Viewed event
        # type.

        @[JSON::Field(key: "impression")]
        getter impression : Array(String)?

        # A string map of event-specific data that you might choose to record. For example, if a user takes an
        # action, other than the action ID, you might also send the number of actions taken by the user. Each
        # item in the map consists of a key-value pair. For example, {"numberOfActions": "12"} The keys use
        # camel case names that match the fields in the Action interactions schema. In the above example, the
        # numberOfActions would match the 'NUMBER_OF_ACTIONS' field defined in the Action interactions schema.
        # The following can't be included as a keyword for properties (case insensitive). userId sessionId
        # eventType timestamp recommendationId impression

        @[JSON::Field(key: "properties")]
        getter properties : String?

        # The ID of the list of recommendations that contains the action the user interacted with.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        # The ID of the user who interacted with the action. This corresponds to the USER_ID field of the
        # Action interaction schema.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @action_id : String,
          @event_type : String,
          @session_id : String,
          @timestamp : Time,
          @event_id : String? = nil,
          @impression : Array(String)? = nil,
          @properties : String? = nil,
          @recommendation_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Represents item interaction event information sent using the PutEvents API.

      struct Event
        include JSON::Serializable

        # The type of event, such as click or download. This property corresponds to the EVENT_TYPE field of
        # your Item interactions dataset's schema and depends on the types of events you are tracking.

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The timestamp (in Unix time) on the client side when the event occurred.

        @[JSON::Field(key: "sentAt")]
        getter sent_at : Time

        # An ID associated with the event. If an event ID is not provided, Amazon Personalize generates a
        # unique ID for the event. An event ID is not used as an input to the model. Amazon Personalize uses
        # the event ID to distinguish unique events. Any subsequent events after the first with the same event
        # ID are not used in model training.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The event value that corresponds to the EVENT_VALUE field of the Item interactions schema.

        @[JSON::Field(key: "eventValue")]
        getter event_value : Float64?

        # A list of item IDs that represents the sequence of items you have shown the user. For example,
        # ["itemId1", "itemId2", "itemId3"] . Provide a list of items to manually record impressions data for
        # an event. For more information on recording impressions data, see Recording impressions data .

        @[JSON::Field(key: "impression")]
        getter impression : Array(String)?

        # The item ID key that corresponds to the ITEM_ID field of the Item interactions dataset's schema.

        @[JSON::Field(key: "itemId")]
        getter item_id : String?

        # Contains information about the metric attribution associated with an event. For more information
        # about metric attributions, see Measuring impact of recommendations .

        @[JSON::Field(key: "metricAttribution")]
        getter metric_attribution : Types::MetricAttribution?

        # A string map of event-specific data that you might choose to record. For example, if a user rates a
        # movie on your site, other than movie ID ( itemId ) and rating ( eventValue ) , you might also send
        # the number of movie ratings made by the user. Each item in the map consists of a key-value pair. For
        # example, {"numberOfRatings": "12"} The keys use camel case names that match the fields in the Item
        # interactions dataset's schema. In the above example, the numberOfRatings would match the
        # 'NUMBER_OF_RATINGS' field defined in the Item interactions dataset's schema. The following can't be
        # included as a keyword for properties (case insensitive). userId sessionId eventType timestamp
        # recommendationId impression

        @[JSON::Field(key: "properties")]
        getter properties : String?

        # The ID of the list of recommendations that contains the item the user interacted with. Provide a
        # recommendationId to have Amazon Personalize implicitly record the recommendations you show your user
        # as impressions data. Or provide a recommendationId if you use a metric attribution to measure the
        # impact of recommendations. For more information on recording impressions data, see Recording
        # impressions data . For more information on creating a metric attribution see Measuring impact of
        # recommendations .

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        def initialize(
          @event_type : String,
          @sent_at : Time,
          @event_id : String? = nil,
          @event_value : Float64? = nil,
          @impression : Array(String)? = nil,
          @item_id : String? = nil,
          @metric_attribution : Types::MetricAttribution? = nil,
          @properties : String? = nil,
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

      # Represents item metadata added to an Items dataset using the PutItems API. For more information see
      # Importing items individually .

      struct Item
        include JSON::Serializable

        # The ID associated with the item.

        @[JSON::Field(key: "itemId")]
        getter item_id : String

        # A string map of item-specific metadata. Each element in the map consists of a key-value pair. For
        # example, {"numberOfRatings": "12"} . The keys use camel case names that match the fields in the
        # schema for the Items dataset. In the previous example, the numberOfRatings matches the
        # 'NUMBER_OF_RATINGS' field defined in the Items schema. For categorical string data, to include
        # multiple categories for a single item, separate each category with a pipe separator ( | ). For
        # example, \"Horror|Action\" .

        @[JSON::Field(key: "properties")]
        getter properties : String?

        def initialize(
          @item_id : String,
          @properties : String? = nil
        )
        end
      end

      # Contains information about a metric attribution associated with an event. For more information about
      # metric attributions, see Measuring impact of recommendations .

      struct MetricAttribution
        include JSON::Serializable

        # The source of the event, such as a third party.

        @[JSON::Field(key: "eventAttributionSource")]
        getter event_attribution_source : String

        def initialize(
          @event_attribution_source : String
        )
        end
      end


      struct PutActionInteractionsRequest
        include JSON::Serializable

        # A list of action interaction events from the session.

        @[JSON::Field(key: "actionInteractions")]
        getter action_interactions : Array(Types::ActionInteraction)

        # The ID of your action interaction event tracker. When you create an Action interactions dataset,
        # Amazon Personalize creates an action interaction event tracker for you. For more information, see
        # Action interaction event tracker ID .

        @[JSON::Field(key: "trackingId")]
        getter tracking_id : String

        def initialize(
          @action_interactions : Array(Types::ActionInteraction),
          @tracking_id : String
        )
        end
      end


      struct PutActionsRequest
        include JSON::Serializable

        # A list of action data.

        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)

        # The Amazon Resource Name (ARN) of the Actions dataset you are adding the action or actions to.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        def initialize(
          @actions : Array(Types::Action),
          @dataset_arn : String
        )
        end
      end


      struct PutEventsRequest
        include JSON::Serializable

        # A list of event data from the session.

        @[JSON::Field(key: "eventList")]
        getter event_list : Array(Types::Event)

        # The session ID associated with the user's visit. Your application generates the sessionId when a
        # user first visits your website or uses your application. Amazon Personalize uses the sessionId to
        # associate events with the user before they log in. For more information, see Recording item
        # interaction events .

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The tracking ID for the event. The ID is generated by a call to the CreateEventTracker API.

        @[JSON::Field(key: "trackingId")]
        getter tracking_id : String

        # The user associated with the event.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @event_list : Array(Types::Event),
          @session_id : String,
          @tracking_id : String,
          @user_id : String? = nil
        )
        end
      end


      struct PutItemsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Items dataset you are adding the item or items to.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        # A list of item data.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Item)

        def initialize(
          @dataset_arn : String,
          @items : Array(Types::Item)
        )
        end
      end


      struct PutUsersRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Users dataset you are adding the user or users to.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        # A list of user data.

        @[JSON::Field(key: "users")]
        getter users : Array(Types::User)

        def initialize(
          @dataset_arn : String,
          @users : Array(Types::User)
        )
        end
      end

      # The specified resource is in use.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Could not find the specified resource.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents user metadata added to a Users dataset using the PutUsers API. For more information see
      # Importing users individually .

      struct User
        include JSON::Serializable

        # The ID associated with the user.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A string map of user-specific metadata. Each element in the map consists of a key-value pair. For
        # example, {"numberOfVideosWatched": "45"} . The keys use camel case names that match the fields in
        # the schema for the Users dataset. In the previous example, the numberOfVideosWatched matches the
        # 'NUMBER_OF_VIDEOS_WATCHED' field defined in the Users schema. For categorical string data, to
        # include multiple categories for a single user, separate each category with a pipe separator ( | ).
        # For example, \"Member|Frequent shopper\" .

        @[JSON::Field(key: "properties")]
        getter properties : String?

        def initialize(
          @user_id : String,
          @properties : String? = nil
        )
        end
      end
    end
  end
end
