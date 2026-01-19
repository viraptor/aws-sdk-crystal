module AwsSdk
  module LicenseManagerLinuxSubscriptions
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

      # Remove a third-party subscription provider from the Bring Your Own License (BYOL) subscriptions
      # registered to your account.
      def deregister_subscription_provider(
        subscription_provider_arn : String
      ) : Protocol::Request
        input = Types::DeregisterSubscriptionProviderRequest.new(subscription_provider_arn: subscription_provider_arn)
        deregister_subscription_provider(input)
      end
      def deregister_subscription_provider(input : Types::DeregisterSubscriptionProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_SUBSCRIPTION_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details for a Bring Your Own License (BYOL) subscription that's registered to your account.
      def get_registered_subscription_provider(
        subscription_provider_arn : String
      ) : Protocol::Request
        input = Types::GetRegisteredSubscriptionProviderRequest.new(subscription_provider_arn: subscription_provider_arn)
        get_registered_subscription_provider(input)
      end
      def get_registered_subscription_provider(input : Types::GetRegisteredSubscriptionProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REGISTERED_SUBSCRIPTION_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Linux subscriptions service settings for your account.
      def get_service_settings : Protocol::Request
        input = Types::GetServiceSettingsRequest.new
        get_service_settings(input)
      end
      def get_service_settings(input : Types::GetServiceSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the running Amazon EC2 instances that were discovered with commercial Linux subscriptions.
      def list_linux_subscription_instances(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLinuxSubscriptionInstancesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_linux_subscription_instances(input)
      end
      def list_linux_subscription_instances(input : Types::ListLinuxSubscriptionInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LINUX_SUBSCRIPTION_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Linux subscriptions that have been discovered. If you have linked your organization, the
      # returned results will include data aggregated across your accounts in Organizations.
      def list_linux_subscriptions(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLinuxSubscriptionsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_linux_subscriptions(input)
      end
      def list_linux_subscriptions(input : Types::ListLinuxSubscriptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LINUX_SUBSCRIPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List Bring Your Own License (BYOL) subscription registration resources for your account.
      def list_registered_subscription_providers(
        max_results : Int32? = nil,
        next_token : String? = nil,
        subscription_provider_sources : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListRegisteredSubscriptionProvidersRequest.new(max_results: max_results, next_token: next_token, subscription_provider_sources: subscription_provider_sources)
        list_registered_subscription_providers(input)
      end
      def list_registered_subscription_providers(input : Types::ListRegisteredSubscriptionProvidersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REGISTERED_SUBSCRIPTION_PROVIDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the metadata tags that are assigned to the specified Amazon Web Services resource.
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

      # Register the supported third-party subscription provider for your Bring Your Own License (BYOL)
      # subscription.
      def register_subscription_provider(
        secret_arn : String,
        subscription_provider_source : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::RegisterSubscriptionProviderRequest.new(secret_arn: secret_arn, subscription_provider_source: subscription_provider_source, tags: tags)
        register_subscription_provider(input)
      end
      def register_subscription_provider(input : Types::RegisterSubscriptionProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_SUBSCRIPTION_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add metadata tags to the specified Amazon Web Services resource.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove one or more metadata tag from the specified Amazon Web Services resource.
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

      # Updates the service settings for Linux subscriptions.
      def update_service_settings(
        linux_subscriptions_discovery : String,
        linux_subscriptions_discovery_settings : Types::LinuxSubscriptionsDiscoverySettings,
        allow_update : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateServiceSettingsRequest.new(linux_subscriptions_discovery: linux_subscriptions_discovery, linux_subscriptions_discovery_settings: linux_subscriptions_discovery_settings, allow_update: allow_update)
        update_service_settings(input)
      end
      def update_service_settings(input : Types::UpdateServiceSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
