module AwsSdk
  module MarketplaceCommerceAnalytics
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

      # Given a data set type and data set publication date, asynchronously publishes the requested data set
      # to the specified S3 bucket and notifies the specified SNS topic once the data is available. Returns
      # a unique request identifier that can be used to correlate requests with notifications from the SNS
      # topic. Data sets will be published in comma-separated values (CSV) format with the file name
      # {data_set_type}_YYYY-MM-DD.csv. If a file with the same name already exists (e.g. if the same data
      # set is requested twice), the original file will be overwritten by the new file. Requires a Role with
      # an attached permissions policy providing Allow permissions for the following actions: s3:PutObject,
      # s3:GetBucketLocation, sns:GetTopicAttributes, sns:Publish, iam:GetRolePolicy.
      def generate_data_set(
        data_set_publication_date : Time,
        data_set_type : String,
        destination_s3_bucket_name : String,
        role_name_arn : String,
        sns_topic_arn : String,
        customer_defined_values : Hash(String, String)? = nil,
        destination_s3_prefix : String? = nil
      ) : Types::GenerateDataSetResult
        input = Types::GenerateDataSetRequest.new(data_set_publication_date: data_set_publication_date, data_set_type: data_set_type, destination_s3_bucket_name: destination_s3_bucket_name, role_name_arn: role_name_arn, sns_topic_arn: sns_topic_arn, customer_defined_values: customer_defined_values, destination_s3_prefix: destination_s3_prefix)
        generate_data_set(input)
      end
      def generate_data_set(input : Types::GenerateDataSetRequest) : Types::GenerateDataSetResult
        request = Protocol::JsonRpc.build_request(Model::GENERATE_DATA_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GenerateDataSetResult, "GenerateDataSet")
      end

      # This target has been deprecated. Given a data set type and a from date, asynchronously publishes the
      # requested customer support data to the specified S3 bucket and notifies the specified SNS topic once
      # the data is available. Returns a unique request identifier that can be used to correlate requests
      # with notifications from the SNS topic. Data sets will be published in comma-separated values (CSV)
      # format with the file name {data_set_type}_YYYY-MM-DD'T'HH-mm-ss'Z'.csv. If a file with the same name
      # already exists (e.g. if the same data set is requested twice), the original file will be overwritten
      # by the new file. Requires a Role with an attached permissions policy providing Allow permissions for
      # the following actions: s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes, sns:Publish,
      # iam:GetRolePolicy.
      def start_support_data_export(
        data_set_type : String,
        destination_s3_bucket_name : String,
        from_date : Time,
        role_name_arn : String,
        sns_topic_arn : String,
        customer_defined_values : Hash(String, String)? = nil,
        destination_s3_prefix : String? = nil
      ) : Types::StartSupportDataExportResult
        input = Types::StartSupportDataExportRequest.new(data_set_type: data_set_type, destination_s3_bucket_name: destination_s3_bucket_name, from_date: from_date, role_name_arn: role_name_arn, sns_topic_arn: sns_topic_arn, customer_defined_values: customer_defined_values, destination_s3_prefix: destination_s3_prefix)
        start_support_data_export(input)
      end
      def start_support_data_export(input : Types::StartSupportDataExportRequest) : Types::StartSupportDataExportResult
        request = Protocol::JsonRpc.build_request(Model::START_SUPPORT_DATA_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSupportDataExportResult, "StartSupportDataExport")
      end
    end
  end
end
