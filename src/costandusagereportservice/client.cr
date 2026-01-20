module Aws
  module CostAndUsageReportService
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Deletes the specified report. Any tags associated with the report are also deleted.

      def delete_report_definition(
        report_name : String
      ) : Types::DeleteReportDefinitionResponse

        input = Types::DeleteReportDefinitionRequest.new(report_name: report_name)
        delete_report_definition(input)
      end

      def delete_report_definition(input : Types::DeleteReportDefinitionRequest) : Types::DeleteReportDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPORT_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReportDefinitionResponse, "DeleteReportDefinition")
      end

      # Lists the Amazon Web Services Cost and Usage Report available to this account.

      def describe_report_definitions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeReportDefinitionsResponse

        input = Types::DescribeReportDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        describe_report_definitions(input)
      end

      def describe_report_definitions(input : Types::DescribeReportDefinitionsRequest) : Types::DescribeReportDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPORT_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReportDefinitionsResponse, "DescribeReportDefinitions")
      end

      # Lists the tags associated with the specified report definition.

      def list_tags_for_resource(
        report_name : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(report_name: report_name)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Allows you to programmatically update your report preferences.

      def modify_report_definition(
        report_definition : Types::ReportDefinition,
        report_name : String
      ) : Types::ModifyReportDefinitionResponse

        input = Types::ModifyReportDefinitionRequest.new(report_definition: report_definition, report_name: report_name)
        modify_report_definition(input)
      end

      def modify_report_definition(input : Types::ModifyReportDefinitionRequest) : Types::ModifyReportDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_REPORT_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyReportDefinitionResponse, "ModifyReportDefinition")
      end

      # Creates a new report using the description that you provide.

      def put_report_definition(
        report_definition : Types::ReportDefinition,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutReportDefinitionResponse

        input = Types::PutReportDefinitionRequest.new(report_definition: report_definition, tags: tags)
        put_report_definition(input)
      end

      def put_report_definition(input : Types::PutReportDefinitionRequest) : Types::PutReportDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REPORT_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutReportDefinitionResponse, "PutReportDefinition")
      end

      # Associates a set of tags with a report definition.

      def tag_resource(
        report_name : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(report_name: report_name, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Disassociates a set of tags from a report definition.

      def untag_resource(
        report_name : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(report_name: report_name, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end
    end
  end
end
