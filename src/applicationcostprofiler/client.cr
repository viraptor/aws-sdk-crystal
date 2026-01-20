module Aws
  module ApplicationCostProfiler
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

      # Deletes the specified report definition in AWS Application Cost Profiler. This stops the report from
      # being generated.

      def delete_report_definition(
        report_id : String
      ) : Protocol::Request
        input = Types::DeleteReportDefinitionRequest.new(report_id: report_id)
        delete_report_definition(input)
      end

      def delete_report_definition(input : Types::DeleteReportDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPORT_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the definition of a report already configured in AWS Application Cost Profiler.

      def get_report_definition(
        report_id : String
      ) : Protocol::Request
        input = Types::GetReportDefinitionRequest.new(report_id: report_id)
        get_report_definition(input)
      end

      def get_report_definition(input : Types::GetReportDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPORT_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Ingests application usage data from Amazon Simple Storage Service (Amazon S3). The data must already
      # exist in the S3 location. As part of the action, AWS Application Cost Profiler copies the object
      # from your S3 bucket to an S3 bucket owned by Amazon for processing asynchronously.

      def import_application_usage(
        source_s3_location : Types::SourceS3Location
      ) : Protocol::Request
        input = Types::ImportApplicationUsageRequest.new(source_s3_location: source_s3_location)
        import_application_usage(input)
      end

      def import_application_usage(input : Types::ImportApplicationUsageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_APPLICATION_USAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all reports and their configurations for your AWS account. The maximum number of
      # reports is one.

      def list_report_definitions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReportDefinitionsRequest.new(max_results: max_results, next_token: next_token)
        list_report_definitions(input)
      end

      def list_report_definitions(input : Types::ListReportDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPORT_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates the report definition for a report in Application Cost Profiler.

      def put_report_definition(
        destination_s3_location : Types::S3Location,
        format : String,
        report_description : String,
        report_frequency : String,
        report_id : String
      ) : Protocol::Request
        input = Types::PutReportDefinitionRequest.new(destination_s3_location: destination_s3_location, format: format, report_description: report_description, report_frequency: report_frequency, report_id: report_id)
        put_report_definition(input)
      end

      def put_report_definition(input : Types::PutReportDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_REPORT_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates existing report in AWS Application Cost Profiler.

      def update_report_definition(
        destination_s3_location : Types::S3Location,
        format : String,
        report_description : String,
        report_frequency : String,
        report_id : String
      ) : Protocol::Request
        input = Types::UpdateReportDefinitionRequest.new(destination_s3_location: destination_s3_location, format: format, report_description: report_description, report_frequency: report_frequency, report_id: report_id)
        update_report_definition(input)
      end

      def update_report_definition(input : Types::UpdateReportDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPORT_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
