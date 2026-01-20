module AwsSdk
  module Billing
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associates one or more source billing views with an existing billing view. This allows creating
      # aggregate billing views that combine data from multiple sources.

      def associate_source_views(
        arn : String,
        source_views : Array(String)
      ) : Types::AssociateSourceViewsResponse

        input = Types::AssociateSourceViewsRequest.new(arn: arn, source_views: source_views)
        associate_source_views(input)
      end

      def associate_source_views(input : Types::AssociateSourceViewsRequest) : Types::AssociateSourceViewsResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_SOURCE_VIEWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateSourceViewsResponse, "AssociateSourceViews")
      end

      # Creates a billing view with the specified billing view attributes.

      def create_billing_view(
        name : String,
        source_views : Array(String),
        client_token : String? = nil,
        data_filter_expression : Types::Expression? = nil,
        description : String? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Types::CreateBillingViewResponse

        input = Types::CreateBillingViewRequest.new(name: name, source_views: source_views, client_token: client_token, data_filter_expression: data_filter_expression, description: description, resource_tags: resource_tags)
        create_billing_view(input)
      end

      def create_billing_view(input : Types::CreateBillingViewRequest) : Types::CreateBillingViewResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BILLING_VIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBillingViewResponse, "CreateBillingView")
      end

      # Deletes the specified billing view.

      def delete_billing_view(
        arn : String,
        force : Bool? = nil
      ) : Types::DeleteBillingViewResponse

        input = Types::DeleteBillingViewRequest.new(arn: arn, force: force)
        delete_billing_view(input)
      end

      def delete_billing_view(input : Types::DeleteBillingViewRequest) : Types::DeleteBillingViewResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BILLING_VIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBillingViewResponse, "DeleteBillingView")
      end

      # Removes the association between one or more source billing views and an existing billing view. This
      # allows modifying the composition of aggregate billing views.

      def disassociate_source_views(
        arn : String,
        source_views : Array(String)
      ) : Types::DisassociateSourceViewsResponse

        input = Types::DisassociateSourceViewsRequest.new(arn: arn, source_views: source_views)
        disassociate_source_views(input)
      end

      def disassociate_source_views(input : Types::DisassociateSourceViewsRequest) : Types::DisassociateSourceViewsResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_SOURCE_VIEWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateSourceViewsResponse, "DisassociateSourceViews")
      end

      # Returns the metadata associated to the specified billing view ARN.

      def get_billing_view(
        arn : String
      ) : Types::GetBillingViewResponse

        input = Types::GetBillingViewRequest.new(arn: arn)
        get_billing_view(input)
      end

      def get_billing_view(input : Types::GetBillingViewRequest) : Types::GetBillingViewResponse
        request = Protocol::JsonRpc.build_request(Model::GET_BILLING_VIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBillingViewResponse, "GetBillingView")
      end

      # Returns the resource-based policy document attached to the resource in JSON format.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyResponse

        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyResponse, "GetResourcePolicy")
      end

      # Lists the billing views available for a given time period. Every Amazon Web Services account has a
      # unique PRIMARY billing view that represents the billing data available by default. Accounts that use
      # Billing Conductor also have BILLING_GROUP billing views representing pro forma costs associated with
      # each created billing group.

      def list_billing_views(
        active_time_range : Types::ActiveTimeRange? = nil,
        arns : Array(String)? = nil,
        billing_view_types : Array(String)? = nil,
        max_results : Int32? = nil,
        names : Array(Types::StringSearch)? = nil,
        next_token : String? = nil,
        owner_account_id : String? = nil,
        source_account_id : String? = nil
      ) : Types::ListBillingViewsResponse

        input = Types::ListBillingViewsRequest.new(active_time_range: active_time_range, arns: arns, billing_view_types: billing_view_types, max_results: max_results, names: names, next_token: next_token, owner_account_id: owner_account_id, source_account_id: source_account_id)
        list_billing_views(input)
      end

      def list_billing_views(input : Types::ListBillingViewsRequest) : Types::ListBillingViewsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILLING_VIEWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillingViewsResponse, "ListBillingViews")
      end

      # Lists the source views (managed Amazon Web Services billing views) associated with the billing view.

      def list_source_views_for_billing_view(
        arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSourceViewsForBillingViewResponse

        input = Types::ListSourceViewsForBillingViewRequest.new(arn: arn, max_results: max_results, next_token: next_token)
        list_source_views_for_billing_view(input)
      end

      def list_source_views_for_billing_view(input : Types::ListSourceViewsForBillingViewRequest) : Types::ListSourceViewsForBillingViewResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SOURCE_VIEWS_FOR_BILLING_VIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSourceViewsForBillingViewResponse, "ListSourceViewsForBillingView")
      end

      # Lists tags associated with the billing view resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # An API operation for adding one or more tags (key-value pairs) to a resource.

      def tag_resource(
        resource_arn : String,
        resource_tags : Array(Types::ResourceTag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, resource_tags: resource_tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes one or more tags from a resource. Specify only tag keys in your request. Don't specify the
      # value.

      def untag_resource(
        resource_arn : String,
        resource_tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, resource_tag_keys: resource_tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # An API to update the attributes of the billing view.

      def update_billing_view(
        arn : String,
        data_filter_expression : Types::Expression? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Types::UpdateBillingViewResponse

        input = Types::UpdateBillingViewRequest.new(arn: arn, data_filter_expression: data_filter_expression, description: description, name: name)
        update_billing_view(input)
      end

      def update_billing_view(input : Types::UpdateBillingViewRequest) : Types::UpdateBillingViewResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BILLING_VIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBillingViewResponse, "UpdateBillingView")
      end
    end
  end
end
