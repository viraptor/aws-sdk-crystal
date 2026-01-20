module Aws
  module ChimeSDKIdentity
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

      # Creates an Amazon Chime SDK messaging AppInstance under an AWS account. Only SDK messaging customers
      # use this API. CreateAppInstance supports idempotency behavior as described in the AWS API Standard.
      # identity

      def create_app_instance(
        client_request_token : String,
        name : String,
        metadata : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAppInstanceRequest.new(client_request_token: client_request_token, name: name, metadata: metadata, tags: tags)
        create_app_instance(input)
      end

      def create_app_instance(input : Types::CreateAppInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Promotes an AppInstanceUser or AppInstanceBot to an AppInstanceAdmin . The promoted entity can
      # perform the following actions. ChannelModerator actions across all channels in the AppInstance .
      # DeleteChannelMessage actions. Only an AppInstanceUser and AppInstanceBot can be promoted to an
      # AppInstanceAdmin role.

      def create_app_instance_admin(
        app_instance_admin_arn : String,
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::CreateAppInstanceAdminRequest.new(app_instance_admin_arn: app_instance_admin_arn, app_instance_arn: app_instance_arn)
        create_app_instance_admin(input)
      end

      def create_app_instance_admin(input : Types::CreateAppInstanceAdminRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_INSTANCE_ADMIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a bot under an Amazon Chime AppInstance . The request consists of a unique Configuration and
      # Name for that bot.

      def create_app_instance_bot(
        app_instance_arn : String,
        client_request_token : String,
        configuration : Types::Configuration,
        metadata : String? = nil,
        name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAppInstanceBotRequest.new(app_instance_arn: app_instance_arn, client_request_token: client_request_token, configuration: configuration, metadata: metadata, name: name, tags: tags)
        create_app_instance_bot(input)
      end

      def create_app_instance_bot(input : Types::CreateAppInstanceBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_INSTANCE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user under an Amazon Chime AppInstance . The request consists of a unique
      # appInstanceUserId and Name for that user.

      def create_app_instance_user(
        app_instance_arn : String,
        app_instance_user_id : String,
        client_request_token : String,
        name : String,
        expiration_settings : Types::ExpirationSettings? = nil,
        metadata : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAppInstanceUserRequest.new(app_instance_arn: app_instance_arn, app_instance_user_id: app_instance_user_id, client_request_token: client_request_token, name: name, expiration_settings: expiration_settings, metadata: metadata, tags: tags)
        create_app_instance_user(input)
      end

      def create_app_instance_user(input : Types::CreateAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an AppInstance and all associated data asynchronously.

      def delete_app_instance(
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::DeleteAppInstanceRequest.new(app_instance_arn: app_instance_arn)
        delete_app_instance(input)
      end

      def delete_app_instance(input : Types::DeleteAppInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Demotes an AppInstanceAdmin to an AppInstanceUser or AppInstanceBot . This action does not delete
      # the user.

      def delete_app_instance_admin(
        app_instance_admin_arn : String,
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::DeleteAppInstanceAdminRequest.new(app_instance_admin_arn: app_instance_admin_arn, app_instance_arn: app_instance_arn)
        delete_app_instance_admin(input)
      end

      def delete_app_instance_admin(input : Types::DeleteAppInstanceAdminRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_INSTANCE_ADMIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an AppInstanceBot .

      def delete_app_instance_bot(
        app_instance_bot_arn : String
      ) : Protocol::Request
        input = Types::DeleteAppInstanceBotRequest.new(app_instance_bot_arn: app_instance_bot_arn)
        delete_app_instance_bot(input)
      end

      def delete_app_instance_bot(input : Types::DeleteAppInstanceBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_INSTANCE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an AppInstanceUser .

      def delete_app_instance_user(
        app_instance_user_arn : String
      ) : Protocol::Request
        input = Types::DeleteAppInstanceUserRequest.new(app_instance_user_arn: app_instance_user_arn)
        delete_app_instance_user(input)
      end

      def delete_app_instance_user(input : Types::DeleteAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters an AppInstanceUserEndpoint .

      def deregister_app_instance_user_endpoint(
        app_instance_user_arn : String,
        endpoint_id : String
      ) : Protocol::Request
        input = Types::DeregisterAppInstanceUserEndpointRequest.new(app_instance_user_arn: app_instance_user_arn, endpoint_id: endpoint_id)
        deregister_app_instance_user_endpoint(input)
      end

      def deregister_app_instance_user_endpoint(input : Types::DeregisterAppInstanceUserEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_APP_INSTANCE_USER_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of an AppInstance .

      def describe_app_instance(
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::DescribeAppInstanceRequest.new(app_instance_arn: app_instance_arn)
        describe_app_instance(input)
      end

      def describe_app_instance(input : Types::DescribeAppInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of an AppInstanceAdmin .

      def describe_app_instance_admin(
        app_instance_admin_arn : String,
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::DescribeAppInstanceAdminRequest.new(app_instance_admin_arn: app_instance_admin_arn, app_instance_arn: app_instance_arn)
        describe_app_instance_admin(input)
      end

      def describe_app_instance_admin(input : Types::DescribeAppInstanceAdminRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_INSTANCE_ADMIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The AppInstanceBot's information.

      def describe_app_instance_bot(
        app_instance_bot_arn : String
      ) : Protocol::Request
        input = Types::DescribeAppInstanceBotRequest.new(app_instance_bot_arn: app_instance_bot_arn)
        describe_app_instance_bot(input)
      end

      def describe_app_instance_bot(input : Types::DescribeAppInstanceBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_INSTANCE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of an AppInstanceUser .

      def describe_app_instance_user(
        app_instance_user_arn : String
      ) : Protocol::Request
        input = Types::DescribeAppInstanceUserRequest.new(app_instance_user_arn: app_instance_user_arn)
        describe_app_instance_user(input)
      end

      def describe_app_instance_user(input : Types::DescribeAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the full details of an AppInstanceUserEndpoint .

      def describe_app_instance_user_endpoint(
        app_instance_user_arn : String,
        endpoint_id : String
      ) : Protocol::Request
        input = Types::DescribeAppInstanceUserEndpointRequest.new(app_instance_user_arn: app_instance_user_arn, endpoint_id: endpoint_id)
        describe_app_instance_user_endpoint(input)
      end

      def describe_app_instance_user_endpoint(input : Types::DescribeAppInstanceUserEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_INSTANCE_USER_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the retention settings for an AppInstance .

      def get_app_instance_retention_settings(
        app_instance_arn : String
      ) : Protocol::Request
        input = Types::GetAppInstanceRetentionSettingsRequest.new(app_instance_arn: app_instance_arn)
        get_app_instance_retention_settings(input)
      end

      def get_app_instance_retention_settings(input : Types::GetAppInstanceRetentionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APP_INSTANCE_RETENTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the administrators in the AppInstance .

      def list_app_instance_admins(
        app_instance_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppInstanceAdminsRequest.new(app_instance_arn: app_instance_arn, max_results: max_results, next_token: next_token)
        list_app_instance_admins(input)
      end

      def list_app_instance_admins(input : Types::ListAppInstanceAdminsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_INSTANCE_ADMINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all AppInstanceBots created under a single AppInstance .

      def list_app_instance_bots(
        app_instance_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppInstanceBotsRequest.new(app_instance_arn: app_instance_arn, max_results: max_results, next_token: next_token)
        list_app_instance_bots(input)
      end

      def list_app_instance_bots(input : Types::ListAppInstanceBotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_INSTANCE_BOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the AppInstanceUserEndpoints created under a single AppInstanceUser .

      def list_app_instance_user_endpoints(
        app_instance_user_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppInstanceUserEndpointsRequest.new(app_instance_user_arn: app_instance_user_arn, max_results: max_results, next_token: next_token)
        list_app_instance_user_endpoints(input)
      end

      def list_app_instance_user_endpoints(input : Types::ListAppInstanceUserEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_INSTANCE_USER_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all AppInstanceUsers created under a single AppInstance .

      def list_app_instance_users(
        app_instance_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppInstanceUsersRequest.new(app_instance_arn: app_instance_arn, max_results: max_results, next_token: next_token)
        list_app_instance_users(input)
      end

      def list_app_instance_users(input : Types::ListAppInstanceUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_INSTANCE_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Amazon Chime AppInstance s created under a single AWS account.

      def list_app_instances(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppInstancesRequest.new(max_results: max_results, next_token: next_token)
        list_app_instances(input)
      end

      def list_app_instances(input : Types::ListAppInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags applied to an Amazon Chime SDK identity resource.

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

      # Sets the amount of time in days that a given AppInstance retains data.

      def put_app_instance_retention_settings(
        app_instance_arn : String,
        app_instance_retention_settings : Types::AppInstanceRetentionSettings
      ) : Protocol::Request
        input = Types::PutAppInstanceRetentionSettingsRequest.new(app_instance_arn: app_instance_arn, app_instance_retention_settings: app_instance_retention_settings)
        put_app_instance_retention_settings(input)
      end

      def put_app_instance_retention_settings(input : Types::PutAppInstanceRetentionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_APP_INSTANCE_RETENTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the number of days before the AppInstanceUser is automatically deleted. A background process
      # deletes expired AppInstanceUsers within 6 hours of expiration. Actual deletion times may vary.
      # Expired AppInstanceUsers that have not yet been deleted appear as active, and you can update their
      # expiration settings. The system honors the new settings.

      def put_app_instance_user_expiration_settings(
        app_instance_user_arn : String,
        expiration_settings : Types::ExpirationSettings? = nil
      ) : Protocol::Request
        input = Types::PutAppInstanceUserExpirationSettingsRequest.new(app_instance_user_arn: app_instance_user_arn, expiration_settings: expiration_settings)
        put_app_instance_user_expiration_settings(input)
      end

      def put_app_instance_user_expiration_settings(input : Types::PutAppInstanceUserExpirationSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_APP_INSTANCE_USER_EXPIRATION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers an endpoint under an Amazon Chime AppInstanceUser . The endpoint receives messages for a
      # user. For push notifications, the endpoint is a mobile device used to receive mobile push
      # notifications for a user.

      def register_app_instance_user_endpoint(
        app_instance_user_arn : String,
        client_request_token : String,
        endpoint_attributes : Types::EndpointAttributes,
        resource_arn : String,
        type : String,
        allow_messages : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::RegisterAppInstanceUserEndpointRequest.new(app_instance_user_arn: app_instance_user_arn, client_request_token: client_request_token, endpoint_attributes: endpoint_attributes, resource_arn: resource_arn, type: type, allow_messages: allow_messages, name: name)
        register_app_instance_user_endpoint(input)
      end

      def register_app_instance_user_endpoint(input : Types::RegisterAppInstanceUserEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_APP_INSTANCE_USER_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies the specified tags to the specified Amazon Chime SDK identity resource.

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

      # Removes the specified tags from the specified Amazon Chime SDK identity resource.

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

      # Updates AppInstance metadata.

      def update_app_instance(
        app_instance_arn : String,
        metadata : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateAppInstanceRequest.new(app_instance_arn: app_instance_arn, metadata: metadata, name: name)
        update_app_instance(input)
      end

      def update_app_instance(input : Types::UpdateAppInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name and metadata of an AppInstanceBot .

      def update_app_instance_bot(
        app_instance_bot_arn : String,
        metadata : String,
        name : String,
        configuration : Types::Configuration? = nil
      ) : Protocol::Request
        input = Types::UpdateAppInstanceBotRequest.new(app_instance_bot_arn: app_instance_bot_arn, metadata: metadata, name: name, configuration: configuration)
        update_app_instance_bot(input)
      end

      def update_app_instance_bot(input : Types::UpdateAppInstanceBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_INSTANCE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details of an AppInstanceUser . You can update names and metadata.

      def update_app_instance_user(
        app_instance_user_arn : String,
        metadata : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateAppInstanceUserRequest.new(app_instance_user_arn: app_instance_user_arn, metadata: metadata, name: name)
        update_app_instance_user(input)
      end

      def update_app_instance_user(input : Types::UpdateAppInstanceUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_INSTANCE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details of an AppInstanceUserEndpoint . You can update the name and AllowMessage values.

      def update_app_instance_user_endpoint(
        app_instance_user_arn : String,
        endpoint_id : String,
        allow_messages : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAppInstanceUserEndpointRequest.new(app_instance_user_arn: app_instance_user_arn, endpoint_id: endpoint_id, allow_messages: allow_messages, name: name)
        update_app_instance_user_endpoint(input)
      end

      def update_app_instance_user_endpoint(input : Types::UpdateAppInstanceUserEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_INSTANCE_USER_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
