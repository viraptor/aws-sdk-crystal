module AwsSdk
  module InspectorScan
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

      # Scans a provided CycloneDX 1.5 SBOM and reports on any vulnerabilities discovered in that SBOM. You
      # can generate compatible SBOMs for your resources using the Amazon Inspector SBOM generator . The
      # output of this action reports NVD and CVSS scores when NVD and CVSS scores are available. Because
      # the output reports both scores, you might notice a discrepency between them. However, you can triage
      # the severity of either score depending on the vendor of your choosing.

      def scan_sbom(
        sbom : Types::Sbom,
        output_format : String? = nil
      ) : Protocol::Request
        input = Types::ScanSbomRequest.new(sbom: sbom, output_format: output_format)
        scan_sbom(input)
      end

      def scan_sbom(input : Types::ScanSbomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SCAN_SBOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
