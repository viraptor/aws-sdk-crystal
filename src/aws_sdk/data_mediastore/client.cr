module AwsSdk
  module MediaStoreData
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

      # Deletes an object at the specified path.
      def delete_object(
        path : String
      ) : Protocol::Request
        input = Types::DeleteObjectRequest.new(path: path)
        delete_object(input)
      end
      def delete_object(input : Types::DeleteObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the headers for an object at the specified path.
      def describe_object(
        path : String
      ) : Protocol::Request
        input = Types::DescribeObjectRequest.new(path: path)
        describe_object(input)
      end
      def describe_object(input : Types::DescribeObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Downloads the object at the specified path. If the object’s upload availability is set to streaming
      # , AWS Elemental MediaStore downloads the object even if it’s still uploading the object.
      def get_object(
        path : String,
        range : String? = nil
      ) : Protocol::Request
        input = Types::GetObjectRequest.new(path: path, range: range)
        get_object(input)
      end
      def get_object(input : Types::GetObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a list of metadata entries about folders and objects in the specified folder.
      def list_items(
        max_results : Int32? = nil,
        next_token : String? = nil,
        path : String? = nil
      ) : Protocol::Request
        input = Types::ListItemsRequest.new(max_results: max_results, next_token: next_token, path: path)
        list_items(input)
      end
      def list_items(input : Types::ListItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads an object to the specified path. Object sizes are limited to 25 MB for standard upload
      # availability and 10 MB for streaming upload availability.
      def put_object(
        body : Bytes,
        path : String,
        cache_control : String? = nil,
        content_type : String? = nil,
        storage_class : String? = nil,
        upload_availability : String? = nil
      ) : Protocol::Request
        input = Types::PutObjectRequest.new(body: body, path: path, cache_control: cache_control, content_type: content_type, storage_class: storage_class, upload_availability: upload_availability)
        put_object(input)
      end
      def put_object(input : Types::PutObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
