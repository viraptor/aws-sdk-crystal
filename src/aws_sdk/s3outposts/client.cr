module AwsSdk
  module S3Outposts
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

      # Creates an endpoint and associates it with the specified Outpost. It can take up to 5 minutes for
      # this action to finish. Related actions include: DeleteEndpoint ListEndpoints

      def create_endpoint(
        outpost_id : String,
        security_group_id : String,
        subnet_id : String,
        access_type : String? = nil,
        customer_owned_ipv4_pool : String? = nil
      ) : Protocol::Request
        input = Types::CreateEndpointRequest.new(outpost_id: outpost_id, security_group_id: security_group_id, subnet_id: subnet_id, access_type: access_type, customer_owned_ipv4_pool: customer_owned_ipv4_pool)
        create_endpoint(input)
      end

      def create_endpoint(input : Types::CreateEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an endpoint. It can take up to 5 minutes for this action to finish. Related actions include:
      # CreateEndpoint ListEndpoints

      def delete_endpoint(
        endpoint_id : String,
        outpost_id : String
      ) : Protocol::Request
        input = Types::DeleteEndpointRequest.new(endpoint_id: endpoint_id, outpost_id: outpost_id)
        delete_endpoint(input)
      end

      def delete_endpoint(input : Types::DeleteEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists endpoints associated with the specified Outpost. Related actions include: CreateEndpoint
      # DeleteEndpoint

      def list_endpoints(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEndpointsRequest.new(max_results: max_results, next_token: next_token)
        list_endpoints(input)
      end

      def list_endpoints(input : Types::ListEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Outposts with S3 on Outposts capacity for your Amazon Web Services account. Includes S3 on
      # Outposts that you have access to as the Outposts owner, or as a shared user from Resource Access
      # Manager (RAM).

      def list_outposts_with_s3(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOutpostsWithS3Request.new(max_results: max_results, next_token: next_token)
        list_outposts_with_s3(input)
      end

      def list_outposts_with_s3(input : Types::ListOutpostsWithS3Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OUTPOSTS_WITH_S3, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all endpoints associated with an Outpost that has been shared by Amazon Web Services Resource
      # Access Manager (RAM). Related actions include: CreateEndpoint DeleteEndpoint

      def list_shared_endpoints(
        outpost_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSharedEndpointsRequest.new(outpost_id: outpost_id, max_results: max_results, next_token: next_token)
        list_shared_endpoints(input)
      end

      def list_shared_endpoints(input : Types::ListSharedEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SHARED_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
