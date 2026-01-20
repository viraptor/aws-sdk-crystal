module AwsSdk
  module LicenseManagerUserSubscriptions
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

      # Associates the user to an EC2 instance to utilize user-based subscriptions. Your estimated bill for
      # charges on the number of users and related costs will take 48 hours to appear for billing periods
      # that haven't closed (marked as Pending billing status) in Amazon Web Services Billing. For more
      # information, see Viewing your monthly charges in the Amazon Web Services Billing User Guide .

      def associate_user(
        identity_provider : Types::IdentityProvider,
        instance_id : String,
        username : String,
        domain : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::AssociateUserRequest.new(identity_provider: identity_provider, instance_id: instance_id, username: username, domain: domain, tags: tags)
        associate_user(input)
      end

      def associate_user(input : Types::AssociateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a network endpoint for the Remote Desktop Services (RDS) license server.

      def create_license_server_endpoint(
        identity_provider_arn : String,
        license_server_settings : Types::LicenseServerSettings,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLicenseServerEndpointRequest.new(identity_provider_arn: identity_provider_arn, license_server_settings: license_server_settings, tags: tags)
        create_license_server_endpoint(input)
      end

      def create_license_server_endpoint(input : Types::CreateLicenseServerEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LICENSE_SERVER_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a LicenseServerEndpoint resource.

      def delete_license_server_endpoint(
        license_server_endpoint_arn : String,
        server_type : String
      ) : Protocol::Request
        input = Types::DeleteLicenseServerEndpointRequest.new(license_server_endpoint_arn: license_server_endpoint_arn, server_type: server_type)
        delete_license_server_endpoint(input)
      end

      def delete_license_server_endpoint(input : Types::DeleteLicenseServerEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LICENSE_SERVER_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters the Active Directory identity provider from License Manager user-based subscriptions.

      def deregister_identity_provider(
        identity_provider : Types::IdentityProvider? = nil,
        identity_provider_arn : String? = nil,
        product : String? = nil
      ) : Protocol::Request
        input = Types::DeregisterIdentityProviderRequest.new(identity_provider: identity_provider, identity_provider_arn: identity_provider_arn, product: product)
        deregister_identity_provider(input)
      end

      def deregister_identity_provider(input : Types::DeregisterIdentityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_IDENTITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the user from an EC2 instance providing user-based subscriptions.

      def disassociate_user(
        domain : String? = nil,
        identity_provider : Types::IdentityProvider? = nil,
        instance_id : String? = nil,
        instance_user_arn : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateUserRequest.new(domain: domain, identity_provider: identity_provider, instance_id: instance_id, instance_user_arn: instance_user_arn, username: username)
        disassociate_user(input)
      end

      def disassociate_user(input : Types::DisassociateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Active Directory identity providers for user-based subscriptions.

      def list_identity_providers(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdentityProvidersRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_identity_providers(input)
      end

      def list_identity_providers(input : Types::ListIdentityProvidersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IDENTITY_PROVIDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the EC2 instances providing user-based subscriptions.

      def list_instances(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInstancesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_instances(input)
      end

      def list_instances(input : Types::ListInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the Remote Desktop Services (RDS) License Server endpoints

      def list_license_server_endpoints(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLicenseServerEndpointsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_license_server_endpoints(input)
      end

      def list_license_server_endpoints(input : Types::ListLicenseServerEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LICENSE_SERVER_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the user-based subscription products available from an identity provider.

      def list_product_subscriptions(
        identity_provider : Types::IdentityProvider,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        product : String? = nil
      ) : Protocol::Request
        input = Types::ListProductSubscriptionsRequest.new(identity_provider: identity_provider, filters: filters, max_results: max_results, next_token: next_token, product: product)
        list_product_subscriptions(input)
      end

      def list_product_subscriptions(input : Types::ListProductSubscriptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRODUCT_SUBSCRIPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of tags for the specified resource.

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

      # Lists user associations for an identity provider.

      def list_user_associations(
        identity_provider : Types::IdentityProvider,
        instance_id : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUserAssociationsRequest.new(identity_provider: identity_provider, instance_id: instance_id, filters: filters, max_results: max_results, next_token: next_token)
        list_user_associations(input)
      end

      def list_user_associations(input : Types::ListUserAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USER_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers an identity provider for user-based subscriptions.

      def register_identity_provider(
        identity_provider : Types::IdentityProvider,
        product : String,
        settings : Types::Settings? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::RegisterIdentityProviderRequest.new(identity_provider: identity_provider, product: product, settings: settings, tags: tags)
        register_identity_provider(input)
      end

      def register_identity_provider(input : Types::RegisterIdentityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_IDENTITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a product subscription for a user with the specified identity provider. Your estimated bill
      # for charges on the number of users and related costs will take 48 hours to appear for billing
      # periods that haven't closed (marked as Pending billing status) in Amazon Web Services Billing. For
      # more information, see Viewing your monthly charges in the Amazon Web Services Billing User Guide .

      def start_product_subscription(
        identity_provider : Types::IdentityProvider,
        product : String,
        username : String,
        domain : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartProductSubscriptionRequest.new(identity_provider: identity_provider, product: product, username: username, domain: domain, tags: tags)
        start_product_subscription(input)
      end

      def start_product_subscription(input : Types::StartProductSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PRODUCT_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a product subscription for a user with the specified identity provider.

      def stop_product_subscription(
        domain : String? = nil,
        identity_provider : Types::IdentityProvider? = nil,
        product : String? = nil,
        product_user_arn : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::StopProductSubscriptionRequest.new(domain: domain, identity_provider: identity_provider, product: product, product_user_arn: product_user_arn, username: username)
        stop_product_subscription(input)
      end

      def stop_product_subscription(input : Types::StopProductSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_PRODUCT_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a resource.

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

      # Removes tags from a resource.

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

      # Updates additional product configuration settings for the registered identity provider.

      def update_identity_provider_settings(
        update_settings : Types::UpdateSettings,
        identity_provider : Types::IdentityProvider? = nil,
        identity_provider_arn : String? = nil,
        product : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIdentityProviderSettingsRequest.new(update_settings: update_settings, identity_provider: identity_provider, identity_provider_arn: identity_provider_arn, product: product)
        update_identity_provider_settings(input)
      end

      def update_identity_provider_settings(input : Types::UpdateIdentityProviderSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IDENTITY_PROVIDER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
