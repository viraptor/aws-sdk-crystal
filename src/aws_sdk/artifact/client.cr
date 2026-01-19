module AwsSdk
  module Artifact
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

      # Get the account settings for Artifact.
      def get_account_settings : Protocol::Request
        input = Types::GetAccountSettingsRequest.new
        get_account_settings(input)
      end
      def get_account_settings(input : Types::GetAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the content for a single report.
      def get_report(
        report_id : String,
        term_token : String,
        report_version : Int64? = nil
      ) : Protocol::Request
        input = Types::GetReportRequest.new(report_id: report_id, term_token: term_token, report_version: report_version)
        get_report(input)
      end
      def get_report(input : Types::GetReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the metadata for a single report.
      def get_report_metadata(
        report_id : String,
        report_version : Int64? = nil
      ) : Protocol::Request
        input = Types::GetReportMetadataRequest.new(report_id: report_id, report_version: report_version)
        get_report_metadata(input)
      end
      def get_report_metadata(input : Types::GetReportMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPORT_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the Term content associated with a single report.
      def get_term_for_report(
        report_id : String,
        report_version : Int64? = nil
      ) : Protocol::Request
        input = Types::GetTermForReportRequest.new(report_id: report_id, report_version: report_version)
        get_term_for_report(input)
      end
      def get_term_for_report(input : Types::GetTermForReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TERM_FOR_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List active customer-agreements applicable to calling identity.
      def list_customer_agreements(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomerAgreementsRequest.new(max_results: max_results, next_token: next_token)
        list_customer_agreements(input)
      end
      def list_customer_agreements(input : Types::ListCustomerAgreementsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOMER_AGREEMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List available report versions for a given report.
      def list_report_versions(
        report_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReportVersionsRequest.new(report_id: report_id, max_results: max_results, next_token: next_token)
        list_report_versions(input)
      end
      def list_report_versions(input : Types::ListReportVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPORT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List available reports.
      def list_reports(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReportsRequest.new(max_results: max_results, next_token: next_token)
        list_reports(input)
      end
      def list_reports(input : Types::ListReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Put the account settings for Artifact.
      def put_account_settings(
        notification_subscription_status : String? = nil
      ) : Protocol::Request
        input = Types::PutAccountSettingsRequest.new(notification_subscription_status: notification_subscription_status)
        put_account_settings(input)
      end
      def put_account_settings(input : Types::PutAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
