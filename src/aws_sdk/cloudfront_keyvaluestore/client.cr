module AwsSdk
  module CloudFrontKeyValueStore
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

      # Deletes the key value pair specified by the key.
      def delete_key(
        if_match : String,
        key : String,
        kvs_arn : String
      ) : Protocol::Request
        input = Types::DeleteKeyRequest.new(if_match: if_match, key: key, kvs_arn: kvs_arn)
        delete_key(input)
      end
      def delete_key(input : Types::DeleteKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata information about Key Value Store.
      def describe_key_value_store(
        kvs_arn : String
      ) : Protocol::Request
        input = Types::DescribeKeyValueStoreRequest.new(kvs_arn: kvs_arn)
        describe_key_value_store(input)
      end
      def describe_key_value_store(input : Types::DescribeKeyValueStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_KEY_VALUE_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a key value pair.
      def get_key(
        key : String,
        kvs_arn : String
      ) : Protocol::Request
        input = Types::GetKeyRequest.new(key: key, kvs_arn: kvs_arn)
        get_key(input)
      end
      def get_key(input : Types::GetKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of key value pairs.
      def list_keys(
        kvs_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKeysRequest.new(kvs_arn: kvs_arn, max_results: max_results, next_token: next_token)
        list_keys(input)
      end
      def list_keys(input : Types::ListKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new key value pair or replaces the value of an existing key.
      def put_key(
        if_match : String,
        key : String,
        kvs_arn : String,
        value : String
      ) : Protocol::Request
        input = Types::PutKeyRequest.new(if_match: if_match, key: key, kvs_arn: kvs_arn, value: value)
        put_key(input)
      end
      def put_key(input : Types::PutKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Puts or Deletes multiple key value pairs in a single, all-or-nothing operation.
      def update_keys(
        if_match : String,
        kvs_arn : String,
        deletes : Array(Types::DeleteKeyRequestListItem)? = nil,
        puts : Array(Types::PutKeyRequestListItem)? = nil
      ) : Protocol::Request
        input = Types::UpdateKeysRequest.new(if_match: if_match, kvs_arn: kvs_arn, deletes: deletes, puts: puts)
        update_keys(input)
      end
      def update_keys(input : Types::UpdateKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
