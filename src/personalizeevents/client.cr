module Aws
  module PersonalizeEvents
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

      # Records action interaction event data. An action interaction event is an interaction between a user
      # and an action . For example, a user taking an action, such a enrolling in a membership program or
      # downloading your app. For more information about recording action interactions, see Recording action
      # interaction events . For more information about actions in an Actions dataset, see Actions dataset .

      def put_action_interactions(
        action_interactions : Array(Types::ActionInteraction),
        tracking_id : String
      ) : Protocol::Request
        input = Types::PutActionInteractionsRequest.new(action_interactions: action_interactions, tracking_id: tracking_id)
        put_action_interactions(input)
      end

      def put_action_interactions(input : Types::PutActionInteractionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACTION_INTERACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more actions to an Actions dataset. For more information see Importing actions
      # individually .

      def put_actions(
        actions : Array(Types::Action),
        dataset_arn : String
      ) : Protocol::Request
        input = Types::PutActionsRequest.new(actions: actions, dataset_arn: dataset_arn)
        put_actions(input)
      end

      def put_actions(input : Types::PutActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Records item interaction event data. For more information see Recording item interaction events .

      def put_events(
        event_list : Array(Types::Event),
        session_id : String,
        tracking_id : String,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::PutEventsRequest.new(event_list: event_list, session_id: session_id, tracking_id: tracking_id, user_id: user_id)
        put_events(input)
      end

      def put_events(input : Types::PutEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more items to an Items dataset. For more information see Importing items individually .

      def put_items(
        dataset_arn : String,
        items : Array(Types::Item)
      ) : Protocol::Request
        input = Types::PutItemsRequest.new(dataset_arn: dataset_arn, items: items)
        put_items(input)
      end

      def put_items(input : Types::PutItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more users to a Users dataset. For more information see Importing users individually .

      def put_users(
        dataset_arn : String,
        users : Array(Types::User)
      ) : Protocol::Request
        input = Types::PutUsersRequest.new(dataset_arn: dataset_arn, users: users)
        put_users(input)
      end

      def put_users(input : Types::PutUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
