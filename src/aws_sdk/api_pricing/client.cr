module AwsSdk
  module Pricing
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

      # Returns the metadata for one service or a list of the metadata for all services. Use this without a
      # service code to get the service codes for all services. Use it with a service code, such as
      # AmazonEC2 , to get information specific to that service, such as the attribute names available for
      # that service. For example, some of the attribute names available for EC2 are volumeType ,
      # maxIopsVolume , operation , locationType , and instanceCapacity10xlarge .
      def describe_services(
        format_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_code : String? = nil
      ) : Types::DescribeServicesResponse
        input = Types::DescribeServicesRequest.new(format_version: format_version, max_results: max_results, next_token: next_token, service_code: service_code)
        describe_services(input)
      end
      def describe_services(input : Types::DescribeServicesRequest) : Types::DescribeServicesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServicesResponse, "DescribeServices")
      end

      # Returns a list of attribute values. Attributes are similar to the details in a Price List API offer
      # file. For a list of available attributes, see Offer File Definitions in the Billing and Cost
      # Management User Guide .
      def get_attribute_values(
        attribute_name : String,
        service_code : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetAttributeValuesResponse
        input = Types::GetAttributeValuesRequest.new(attribute_name: attribute_name, service_code: service_code, max_results: max_results, next_token: next_token)
        get_attribute_values(input)
      end
      def get_attribute_values(input : Types::GetAttributeValuesRequest) : Types::GetAttributeValuesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ATTRIBUTE_VALUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAttributeValuesResponse, "GetAttributeValues")
      end

      # This feature is in preview release and is subject to change. Your use of Amazon Web Services Price
      # List API is subject to the Beta Service Participation terms of the Amazon Web Services Service Terms
      # (Section 1.10). This returns the URL that you can retrieve your Price List file from. This URL is
      # based on the PriceListArn and FileFormat that you retrieve from the ListPriceLists response.
      def get_price_list_file_url(
        file_format : String,
        price_list_arn : String
      ) : Types::GetPriceListFileUrlResponse
        input = Types::GetPriceListFileUrlRequest.new(file_format: file_format, price_list_arn: price_list_arn)
        get_price_list_file_url(input)
      end
      def get_price_list_file_url(input : Types::GetPriceListFileUrlRequest) : Types::GetPriceListFileUrlResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PRICE_LIST_FILE_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPriceListFileUrlResponse, "GetPriceListFileUrl")
      end

      # Returns a list of all products that match the filter criteria.
      def get_products(
        service_code : String,
        filters : Array(Types::Filter)? = nil,
        format_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetProductsResponse
        input = Types::GetProductsRequest.new(service_code: service_code, filters: filters, format_version: format_version, max_results: max_results, next_token: next_token)
        get_products(input)
      end
      def get_products(input : Types::GetProductsRequest) : Types::GetProductsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PRODUCTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProductsResponse, "GetProducts")
      end

      # This feature is in preview release and is subject to change. Your use of Amazon Web Services Price
      # List API is subject to the Beta Service Participation terms of the Amazon Web Services Service Terms
      # (Section 1.10). This returns a list of Price List references that the requester if authorized to
      # view, given a ServiceCode , CurrencyCode , and an EffectiveDate . Use without a RegionCode filter to
      # list Price List references from all available Amazon Web Services Regions. Use with a RegionCode
      # filter to get the Price List reference that's specific to a specific Amazon Web Services Region. You
      # can use the PriceListArn from the response to get your preferred Price List files through the
      # GetPriceListFileUrl API.
      def list_price_lists(
        currency_code : String,
        effective_date : Time,
        service_code : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        region_code : String? = nil
      ) : Types::ListPriceListsResponse
        input = Types::ListPriceListsRequest.new(currency_code: currency_code, effective_date: effective_date, service_code: service_code, max_results: max_results, next_token: next_token, region_code: region_code)
        list_price_lists(input)
      end
      def list_price_lists(input : Types::ListPriceListsRequest) : Types::ListPriceListsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PRICE_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPriceListsResponse, "ListPriceLists")
      end
    end
  end
end
