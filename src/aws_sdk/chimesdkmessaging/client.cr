module AwsSdk
  module ChimeSDKMessaging
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

      # Associates a channel flow with a channel. Once associated, all messages to that channel go through
      # channel flow processors. To stop processing, use the DisassociateChannelFlow API. Only
      # administrators or channel moderators can associate a channel flow. The x-amz-chime-bearer request
      # header is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as
      # the value in the header.

      def associate_channel_flow(
        channel_arn : String,
        channel_flow_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::AssociateChannelFlowRequest.new(channel_arn: channel_arn, channel_flow_arn: channel_flow_arn, chime_bearer: chime_bearer)
        associate_channel_flow(input)
      end

      def associate_channel_flow(input : Types::AssociateChannelFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_CHANNEL_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a specified number of users and bots to a channel.

      def batch_create_channel_membership(
        channel_arn : String,
        chime_bearer : String,
        member_arns : Array(String),
        sub_channel_id : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::BatchCreateChannelMembershipRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arns: member_arns, sub_channel_id: sub_channel_id, type: type)
        batch_create_channel_membership(input)
      end

      def batch_create_channel_membership(input : Types::BatchCreateChannelMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_CHANNEL_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Calls back Amazon Chime SDK messaging with a processing response message. This should be invoked
      # from the processor Lambda. This is a developer API. You can return one of the following processing
      # responses: Update message content or metadata Deny a message Make no changes to the message

      def channel_flow_callback(
        callback_id : String,
        channel_arn : String,
        channel_message : Types::ChannelMessageCallback,
        delete_resource : Bool? = nil
      ) : Protocol::Request
        input = Types::ChannelFlowCallbackRequest.new(callback_id: callback_id, channel_arn: channel_arn, channel_message: channel_message, delete_resource: delete_resource)
        channel_flow_callback(input)
      end

      def channel_flow_callback(input : Types::ChannelFlowCallbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHANNEL_FLOW_CALLBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a channel to which you can add users and send messages. Restriction : You can't change a
      # channel's privacy. The x-amz-chime-bearer request header is mandatory. Use the ARN of the
      # AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def create_channel(
        app_instance_arn : String,
        chime_bearer : String,
        client_request_token : String,
        name : String,
        channel_id : String? = nil,
        elastic_channel_configuration : Types::ElasticChannelConfiguration? = nil,
        expiration_settings : Types::ExpirationSettings? = nil,
        member_arns : Array(String)? = nil,
        metadata : String? = nil,
        mode : String? = nil,
        moderator_arns : Array(String)? = nil,
        privacy : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelRequest.new(app_instance_arn: app_instance_arn, chime_bearer: chime_bearer, client_request_token: client_request_token, name: name, channel_id: channel_id, elastic_channel_configuration: elastic_channel_configuration, expiration_settings: expiration_settings, member_arns: member_arns, metadata: metadata, mode: mode, moderator_arns: moderator_arns, privacy: privacy, tags: tags)
        create_channel(input)
      end

      def create_channel(input : Types::CreateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently bans a member from a channel. Moderators can't add banned members to a channel. To undo
      # a ban, you first have to DeleteChannelBan , and then CreateChannelMembership . Bans are cleaned up
      # when you delete users or channels. If you ban a user who is already part of a channel, that user is
      # automatically kicked from the channel. The x-amz-chime-bearer request header is mandatory. Use the
      # ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def create_channel_ban(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String
      ) : Protocol::Request
        input = Types::CreateChannelBanRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn)
        create_channel_ban(input)
      end

      def create_channel_ban(input : Types::CreateChannelBanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL_BAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a channel flow, a container for processors. Processors are AWS Lambda functions that perform
      # actions on chat messages, such as stripping out profanity. You can associate channel flows with
      # channels, and the processors in the channel flow then take action on all messages sent to that
      # channel. This is a developer API. Channel flows process the following items: New and updated
      # messages Persistent and non-persistent messages The Standard message type Channel flows don't
      # process Control or System messages. For more information about the message types provided by Chime
      # SDK messaging, refer to Message types in the Amazon Chime developer guide .

      def create_channel_flow(
        app_instance_arn : String,
        client_request_token : String,
        name : String,
        processors : Array(Types::Processor),
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelFlowRequest.new(app_instance_arn: app_instance_arn, client_request_token: client_request_token, name: name, processors: processors, tags: tags)
        create_channel_flow(input)
      end

      def create_channel_flow(input : Types::CreateChannelFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a member to a channel. The InvitedBy field in ChannelMembership is derived from the request
      # header. A channel member can: List messages Send messages Receive messages Edit their own messages
      # Leave the channel Privacy settings impact this action as follows: Public Channels: You do not need
      # to be a member to list messages, but you must be a member to send messages. Private Channels: You
      # must be a member to list or send messages. The x-amz-chime-bearer request header is mandatory. Use
      # the ARN of the AppInstanceUserArn or AppInstanceBot that makes the API call as the value in the
      # header.

      def create_channel_membership(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String,
        type : String,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateChannelMembershipRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn, type: type, sub_channel_id: sub_channel_id)
        create_channel_membership(input)
      end

      def create_channel_membership(input : Types::CreateChannelMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new ChannelModerator . A channel moderator can: Add and remove other members of the
      # channel. Add and remove other moderators of the channel. Add and remove user bans for the channel.
      # Redact messages in the channel. List messages in the channel. The x-amz-chime-bearer request header
      # is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot of the user that makes the API
      # call as the value in the header.

      def create_channel_moderator(
        channel_arn : String,
        channel_moderator_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::CreateChannelModeratorRequest.new(channel_arn: channel_arn, channel_moderator_arn: channel_moderator_arn, chime_bearer: chime_bearer)
        create_channel_moderator(input)
      end

      def create_channel_moderator(input : Types::CreateChannelModeratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL_MODERATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Immediately makes a channel and its memberships inaccessible and marks them for deletion. This is an
      # irreversible process. The x-amz-chime-bearer request header is mandatory. Use the ARN of the
      # AppInstanceUserArn or AppInstanceBot that makes the API call as the value in the header.

      def delete_channel(
        channel_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::DeleteChannelRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer)
        delete_channel(input)
      end

      def delete_channel(input : Types::DeleteChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a member from a channel's ban list. The x-amz-chime-bearer request header is mandatory. Use
      # the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def delete_channel_ban(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String
      ) : Protocol::Request
        input = Types::DeleteChannelBanRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn)
        delete_channel_ban(input)
      end

      def delete_channel_ban(input : Types::DeleteChannelBanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_BAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a channel flow, an irreversible process. This is a developer API. This API works only when
      # the channel flow is not associated with any channel. To get a list of all channels that a channel
      # flow is associated with, use the ListChannelsAssociatedWithChannelFlow API. Use the
      # DisassociateChannelFlow API to disassociate a channel flow from all channels.

      def delete_channel_flow(
        channel_flow_arn : String
      ) : Protocol::Request
        input = Types::DeleteChannelFlowRequest.new(channel_flow_arn: channel_flow_arn)
        delete_channel_flow(input)
      end

      def delete_channel_flow(input : Types::DeleteChannelFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a member from a channel. The x-amz-chime-bearer request header is mandatory. Use the
      # AppInstanceUserArn of the user that makes the API call as the value in the header.

      def delete_channel_membership(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteChannelMembershipRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn, sub_channel_id: sub_channel_id)
        delete_channel_membership(input)
      end

      def delete_channel_membership(input : Types::DeleteChannelMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a channel message. Only admins can perform this action. Deletion makes messages inaccessible
      # immediately. A background process deletes any revisions created by UpdateChannelMessage . The
      # x-amz-chime-bearer request header is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot
      # that makes the API call as the value in the header.

      def delete_channel_message(
        channel_arn : String,
        chime_bearer : String,
        message_id : String,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteChannelMessageRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, message_id: message_id, sub_channel_id: sub_channel_id)
        delete_channel_message(input)
      end

      def delete_channel_message(input : Types::DeleteChannelMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a channel moderator. The x-amz-chime-bearer request header is mandatory. Use the ARN of the
      # AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def delete_channel_moderator(
        channel_arn : String,
        channel_moderator_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::DeleteChannelModeratorRequest.new(channel_arn: channel_arn, channel_moderator_arn: channel_moderator_arn, chime_bearer: chime_bearer)
        delete_channel_moderator(input)
      end

      def delete_channel_moderator(input : Types::DeleteChannelModeratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_MODERATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the streaming configurations for an AppInstance . For more information, see Streaming
      # messaging data in the Amazon Chime SDK Developer Guide .

      def delete_messaging_streaming_configurations(
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::DeleteMessagingStreamingConfigurationsRequest.new(app_instance_arn: app_instance_arn)
        delete_messaging_streaming_configurations(input)
      end

      def delete_messaging_streaming_configurations(input : Types::DeleteMessagingStreamingConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MESSAGING_STREAMING_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of a channel in an Amazon Chime AppInstance . The x-amz-chime-bearer
      # request header is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API
      # call as the value in the header.

      def describe_channel(
        channel_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::DescribeChannelRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer)
        describe_channel(input)
      end

      def describe_channel(input : Types::DescribeChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of a channel ban. The x-amz-chime-bearer request header is mandatory. Use
      # the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def describe_channel_ban(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String
      ) : Protocol::Request
        input = Types::DescribeChannelBanRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn)
        describe_channel_ban(input)
      end

      def describe_channel_ban(input : Types::DescribeChannelBanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL_BAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of a channel flow in an Amazon Chime AppInstance . This is a developer API.

      def describe_channel_flow(
        channel_flow_arn : String
      ) : Protocol::Request
        input = Types::DescribeChannelFlowRequest.new(channel_flow_arn: channel_flow_arn)
        describe_channel_flow(input)
      end

      def describe_channel_flow(input : Types::DescribeChannelFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of a user's channel membership. The x-amz-chime-bearer request header is
      # mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value
      # in the header.

      def describe_channel_membership(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeChannelMembershipRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn, sub_channel_id: sub_channel_id)
        describe_channel_membership(input)
      end

      def describe_channel_membership(input : Types::DescribeChannelMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details of a channel based on the membership of the specified AppInstanceUser or
      # AppInstanceBot . The x-amz-chime-bearer request header is mandatory. Use the ARN of the
      # AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def describe_channel_membership_for_app_instance_user(
        app_instance_user_arn : String,
        channel_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::DescribeChannelMembershipForAppInstanceUserRequest.new(app_instance_user_arn: app_instance_user_arn, channel_arn: channel_arn, chime_bearer: chime_bearer)
        describe_channel_membership_for_app_instance_user(input)
      end

      def describe_channel_membership_for_app_instance_user(input : Types::DescribeChannelMembershipForAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL_MEMBERSHIP_FOR_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of a channel moderated by the specified AppInstanceUser or AppInstanceBot .
      # The x-amz-chime-bearer request header is mandatory. Use the ARN of the AppInstanceUser or
      # AppInstanceBot that makes the API call as the value in the header.

      def describe_channel_moderated_by_app_instance_user(
        app_instance_user_arn : String,
        channel_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::DescribeChannelModeratedByAppInstanceUserRequest.new(app_instance_user_arn: app_instance_user_arn, channel_arn: channel_arn, chime_bearer: chime_bearer)
        describe_channel_moderated_by_app_instance_user(input)
      end

      def describe_channel_moderated_by_app_instance_user(input : Types::DescribeChannelModeratedByAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL_MODERATED_BY_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of a single ChannelModerator. The x-amz-chime-bearer request header is
      # mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the
      # header.

      def describe_channel_moderator(
        channel_arn : String,
        channel_moderator_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::DescribeChannelModeratorRequest.new(channel_arn: channel_arn, channel_moderator_arn: channel_moderator_arn, chime_bearer: chime_bearer)
        describe_channel_moderator(input)
      end

      def describe_channel_moderator(input : Types::DescribeChannelModeratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL_MODERATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a channel flow from all its channels. Once disassociated, all messages to that channel
      # stop going through the channel flow processor. Only administrators or channel moderators can
      # disassociate a channel flow. The x-amz-chime-bearer request header is mandatory. Use the ARN of the
      # AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def disassociate_channel_flow(
        channel_arn : String,
        channel_flow_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::DisassociateChannelFlowRequest.new(channel_arn: channel_arn, channel_flow_arn: channel_flow_arn, chime_bearer: chime_bearer)
        disassociate_channel_flow(input)
      end

      def disassociate_channel_flow(input : Types::DisassociateChannelFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_CHANNEL_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the membership preferences of an AppInstanceUser or AppInstanceBot for the specified channel. A
      # user or a bot must be a member of the channel and own the membership in order to retrieve membership
      # preferences. Users or bots in the AppInstanceAdmin and channel moderator roles can't retrieve
      # preferences for other users or bots. Banned users or bots can't retrieve membership preferences for
      # the channel from which they are banned. The x-amz-chime-bearer request header is mandatory. Use the
      # ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def get_channel_membership_preferences(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String
      ) : Protocol::Request
        input = Types::GetChannelMembershipPreferencesRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn)
        get_channel_membership_preferences(input)
      end

      def get_channel_membership_preferences(input : Types::GetChannelMembershipPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_MEMBERSHIP_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the full details of a channel message. The x-amz-chime-bearer request header is mandatory. Use
      # the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def get_channel_message(
        channel_arn : String,
        chime_bearer : String,
        message_id : String,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::GetChannelMessageRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, message_id: message_id, sub_channel_id: sub_channel_id)
        get_channel_message(input)
      end

      def get_channel_message(input : Types::GetChannelMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets message status for a specified messageId . Use this API to determine the intermediate status of
      # messages going through channel flow processing. The API provides an alternative to retrieving
      # message status if the event was not received because a client wasn't connected to a websocket.
      # Messages can have any one of these statuses. SENT Message processed successfully PENDING Ongoing
      # processing FAILED Processing failed DENIED Message denied by the processor This API does not return
      # statuses for denied messages, because we don't store them once the processor denies them. Only the
      # message sender can invoke this API. The x-amz-chime-bearer request header is mandatory. Use the ARN
      # of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def get_channel_message_status(
        channel_arn : String,
        chime_bearer : String,
        message_id : String,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::GetChannelMessageStatusRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, message_id: message_id, sub_channel_id: sub_channel_id)
        get_channel_message_status(input)
      end

      def get_channel_message_status(input : Types::GetChannelMessageStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_MESSAGE_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The details of the endpoint for the messaging session.

      def get_messaging_session_endpoint(
        network_type : String? = nil
      ) : Protocol::Request
        input = Types::GetMessagingSessionEndpointRequest.new(network_type: network_type)
        get_messaging_session_endpoint(input)
      end

      def get_messaging_session_endpoint(input : Types::GetMessagingSessionEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MESSAGING_SESSION_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the data streaming configuration for an AppInstance . For more information, see Streaming
      # messaging data in the Amazon Chime SDK Developer Guide .

      def get_messaging_streaming_configurations(
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::GetMessagingStreamingConfigurationsRequest.new(app_instance_arn: app_instance_arn)
        get_messaging_streaming_configurations(input)
      end

      def get_messaging_streaming_configurations(input : Types::GetMessagingStreamingConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MESSAGING_STREAMING_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the users and bots banned from a particular channel. The x-amz-chime-bearer request header
      # is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the
      # value in the header.

      def list_channel_bans(
        channel_arn : String,
        chime_bearer : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelBansRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, max_results: max_results, next_token: next_token)
        list_channel_bans(input)
      end

      def list_channel_bans(input : Types::ListChannelBansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_BANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated lists of all the channel flows created under a single Chime. This is a developer
      # API.

      def list_channel_flows(
        app_instance_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelFlowsRequest.new(app_instance_arn: app_instance_arn, max_results: max_results, next_token: next_token)
        list_channel_flows(input)
      end

      def list_channel_flows(input : Types::ListChannelFlowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all channel memberships in a channel. The x-amz-chime-bearer request header is mandatory. Use
      # the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.
      # If you want to list the channels to which a specific app instance user belongs, see the
      # ListChannelMembershipsForAppInstanceUser API.

      def list_channel_memberships(
        channel_arn : String,
        chime_bearer : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sub_channel_id : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelMembershipsRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, max_results: max_results, next_token: next_token, sub_channel_id: sub_channel_id, type: type)
        list_channel_memberships(input)
      end

      def list_channel_memberships(input : Types::ListChannelMembershipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_MEMBERSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all channels that an AppInstanceUser or AppInstanceBot is a part of. Only an AppInstanceAdmin
      # can call the API with a user ARN that is not their own. The x-amz-chime-bearer request header is
      # mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value
      # in the header.

      def list_channel_memberships_for_app_instance_user(
        chime_bearer : String,
        app_instance_user_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelMembershipsForAppInstanceUserRequest.new(chime_bearer: chime_bearer, app_instance_user_arn: app_instance_user_arn, max_results: max_results, next_token: next_token)
        list_channel_memberships_for_app_instance_user(input)
      end

      def list_channel_memberships_for_app_instance_user(input : Types::ListChannelMembershipsForAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_MEMBERSHIPS_FOR_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all the messages in a channel. Returns a paginated list of ChannelMessages . By default, sorted
      # by creation timestamp in descending order. Redacted messages appear in the results as empty, since
      # they are only redacted, not deleted. Deleted messages do not appear in the results. This action
      # always returns the latest version of an edited message. Also, the x-amz-chime-bearer request header
      # is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the
      # value in the header.

      def list_channel_messages(
        channel_arn : String,
        chime_bearer : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        not_after : Time? = nil,
        not_before : Time? = nil,
        sort_order : String? = nil,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelMessagesRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, max_results: max_results, next_token: next_token, not_after: not_after, not_before: not_before, sort_order: sort_order, sub_channel_id: sub_channel_id)
        list_channel_messages(input)
      end

      def list_channel_messages(input : Types::ListChannelMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the moderators for a channel. The x-amz-chime-bearer request header is mandatory. Use the
      # ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def list_channel_moderators(
        channel_arn : String,
        chime_bearer : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelModeratorsRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, max_results: max_results, next_token: next_token)
        list_channel_moderators(input)
      end

      def list_channel_moderators(input : Types::ListChannelModeratorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_MODERATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Channels created under a single Chime App as a paginated list. You can specify filters to
      # narrow results. Functionality &amp; restrictions Use privacy = PUBLIC to retrieve all public
      # channels in the account. Only an AppInstanceAdmin can set privacy = PRIVATE to list the private
      # channels in an account. The x-amz-chime-bearer request header is mandatory. Use the ARN of the
      # AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def list_channels(
        app_instance_arn : String,
        chime_bearer : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        privacy : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(app_instance_arn: app_instance_arn, chime_bearer: chime_bearer, max_results: max_results, next_token: next_token, privacy: privacy)
        list_channels(input)
      end

      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all channels associated with a specified channel flow. You can associate a channel flow with
      # multiple channels, but you can only associate a channel with one channel flow. This is a developer
      # API.

      def list_channels_associated_with_channel_flow(
        channel_flow_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsAssociatedWithChannelFlowRequest.new(channel_flow_arn: channel_flow_arn, max_results: max_results, next_token: next_token)
        list_channels_associated_with_channel_flow(input)
      end

      def list_channels_associated_with_channel_flow(input : Types::ListChannelsAssociatedWithChannelFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS_ASSOCIATED_WITH_CHANNEL_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of the channels moderated by an AppInstanceUser . The x-amz-chime-bearer request header is
      # mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value
      # in the header.

      def list_channels_moderated_by_app_instance_user(
        chime_bearer : String,
        app_instance_user_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsModeratedByAppInstanceUserRequest.new(chime_bearer: chime_bearer, app_instance_user_arn: app_instance_user_arn, max_results: max_results, next_token: next_token)
        list_channels_moderated_by_app_instance_user(input)
      end

      def list_channels_moderated_by_app_instance_user(input : Types::ListChannelsModeratedByAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS_MODERATED_BY_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the SubChannels in an elastic channel when given a channel ID. Available only to the app
      # instance admins and channel moderators of elastic channels.

      def list_sub_channels(
        channel_arn : String,
        chime_bearer : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubChannelsRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, max_results: max_results, next_token: next_token)
        list_sub_channels(input)
      end

      def list_sub_channels(input : Types::ListSubChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUB_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags applied to an Amazon Chime SDK messaging resource.

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

      # Sets the number of days before the channel is automatically deleted. A background process deletes
      # expired channels within 6 hours of expiration. Actual deletion times may vary. Expired channels that
      # have not yet been deleted appear as active, and you can update their expiration settings. The system
      # honors the new settings. The x-amz-chime-bearer request header is mandatory. Use the ARN of the
      # AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def put_channel_expiration_settings(
        channel_arn : String,
        chime_bearer : String? = nil,
        expiration_settings : Types::ExpirationSettings? = nil
      ) : Protocol::Request
        input = Types::PutChannelExpirationSettingsRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, expiration_settings: expiration_settings)
        put_channel_expiration_settings(input)
      end

      def put_channel_expiration_settings(input : Types::PutChannelExpirationSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CHANNEL_EXPIRATION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the membership preferences of an AppInstanceUser or AppInstanceBot for the specified channel.
      # The user or bot must be a member of the channel. Only the user or bot who owns the membership can
      # set preferences. Users or bots in the AppInstanceAdmin and channel moderator roles can't set
      # preferences for other users. Banned users or bots can't set membership preferences for the channel
      # from which they are banned. The x-amz-chime-bearer request header is mandatory. Use the ARN of an
      # AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def put_channel_membership_preferences(
        channel_arn : String,
        chime_bearer : String,
        member_arn : String,
        preferences : Types::ChannelMembershipPreferences
      ) : Protocol::Request
        input = Types::PutChannelMembershipPreferencesRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, member_arn: member_arn, preferences: preferences)
        put_channel_membership_preferences(input)
      end

      def put_channel_membership_preferences(input : Types::PutChannelMembershipPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CHANNEL_MEMBERSHIP_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the data streaming configuration for an AppInstance . For more information, see Streaming
      # messaging data in the Amazon Chime SDK Developer Guide .

      def put_messaging_streaming_configurations(
        app_instance_arn : String,
        streaming_configurations : Array(Types::StreamingConfiguration)
      ) : Protocol::Request
        input = Types::PutMessagingStreamingConfigurationsRequest.new(app_instance_arn: app_instance_arn, streaming_configurations: streaming_configurations)
        put_messaging_streaming_configurations(input)
      end

      def put_messaging_streaming_configurations(input : Types::PutMessagingStreamingConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_MESSAGING_STREAMING_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Redacts message content and metadata. The message exists in the back end, but the action returns
      # null content, and the state shows as redacted. The x-amz-chime-bearer request header is mandatory.
      # Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as the value in the
      # header.

      def redact_channel_message(
        channel_arn : String,
        chime_bearer : String,
        message_id : String,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::RedactChannelMessageRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, message_id: message_id, sub_channel_id: sub_channel_id)
        redact_channel_message(input)
      end

      def redact_channel_message(input : Types::RedactChannelMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REDACT_CHANNEL_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the ChimeBearer to search channels by channel members. Users or bots can search across the
      # channels that they belong to. Users in the AppInstanceAdmin role can search across all channels. The
      # x-amz-chime-bearer request header is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot
      # that makes the API call as the value in the header. This operation isn't supported for
      # AppInstanceUsers with a large number of memberships.

      def search_channels(
        fields : Array(Types::SearchField),
        chime_bearer : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchChannelsRequest.new(fields: fields, chime_bearer: chime_bearer, max_results: max_results, next_token: next_token)
        search_channels(input)
      end

      def search_channels(input : Types::SearchChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a message to a particular channel that the member is a part of. The x-amz-chime-bearer request
      # header is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as
      # the value in the header. Also, STANDARD messages can be up to 4KB in size and contain metadata.
      # Metadata is arbitrary, and you can use it in a variety of ways, such as containing a link to an
      # attachment. CONTROL messages are limited to 30 bytes and do not contain metadata.

      def send_channel_message(
        channel_arn : String,
        chime_bearer : String,
        client_request_token : String,
        content : String,
        persistence : String,
        type : String,
        content_type : String? = nil,
        message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
        metadata : String? = nil,
        push_notification : Types::PushNotificationConfiguration? = nil,
        sub_channel_id : String? = nil,
        target : Array(Types::Target)? = nil
      ) : Protocol::Request
        input = Types::SendChannelMessageRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, client_request_token: client_request_token, content: content, persistence: persistence, type: type, content_type: content_type, message_attributes: message_attributes, metadata: metadata, push_notification: push_notification, sub_channel_id: sub_channel_id, target: target)
        send_channel_message(input)
      end

      def send_channel_message(input : Types::SendChannelMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_CHANNEL_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies the specified tags to the specified Amazon Chime SDK messaging resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified tags from the specified Amazon Chime SDK messaging resource.

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

      # Update a channel's attributes. Restriction : You can't change a channel's privacy. The
      # x-amz-chime-bearer request header is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot
      # that makes the API call as the value in the header.

      def update_channel(
        channel_arn : String,
        chime_bearer : String,
        metadata : String? = nil,
        mode : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, metadata: metadata, mode: mode, name: name)
        update_channel(input)
      end

      def update_channel(input : Types::UpdateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates channel flow attributes. This is a developer API.

      def update_channel_flow(
        channel_flow_arn : String,
        name : String,
        processors : Array(Types::Processor)
      ) : Protocol::Request
        input = Types::UpdateChannelFlowRequest.new(channel_flow_arn: channel_flow_arn, name: name, processors: processors)
        update_channel_flow(input)
      end

      def update_channel_flow(input : Types::UpdateChannelFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the content of a message. The x-amz-chime-bearer request header is mandatory. Use the ARN of
      # the AppInstanceUser or AppInstanceBot that makes the API call as the value in the header.

      def update_channel_message(
        channel_arn : String,
        chime_bearer : String,
        content : String,
        message_id : String,
        content_type : String? = nil,
        metadata : String? = nil,
        sub_channel_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelMessageRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer, content: content, message_id: message_id, content_type: content_type, metadata: metadata, sub_channel_id: sub_channel_id)
        update_channel_message(input)
      end

      def update_channel_message(input : Types::UpdateChannelMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The details of the time when a user last read messages in a channel. The x-amz-chime-bearer request
      # header is mandatory. Use the ARN of the AppInstanceUser or AppInstanceBot that makes the API call as
      # the value in the header.

      def update_channel_read_marker(
        channel_arn : String,
        chime_bearer : String
      ) : Protocol::Request
        input = Types::UpdateChannelReadMarkerRequest.new(channel_arn: channel_arn, chime_bearer: chime_bearer)
        update_channel_read_marker(input)
      end

      def update_channel_read_marker(input : Types::UpdateChannelReadMarkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL_READ_MARKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
