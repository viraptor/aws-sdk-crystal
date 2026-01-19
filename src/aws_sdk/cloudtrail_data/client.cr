module AwsSdk
  module CloudTrailData
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

      # Ingests your application events into CloudTrail Lake. A required parameter, auditEvents , accepts
      # the JSON records (also called payload ) of events that you want CloudTrail to ingest. You can add up
      # to 100 of these events (or up to 1 MB) per PutAuditEvents request.
      def put_audit_events(
        audit_events : Array(Types::AuditEvent),
        channel_arn : String,
        external_id : String? = nil
      ) : Protocol::Request
        input = Types::PutAuditEventsRequest.new(audit_events: audit_events, channel_arn: channel_arn, external_id: external_id)
        put_audit_events(input)
      end
      def put_audit_events(input : Types::PutAuditEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_AUDIT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
