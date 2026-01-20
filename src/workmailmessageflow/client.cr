module Aws
  module WorkMailMessageFlow
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

      # Retrieves the raw content of an in-transit email message, in MIME format.

      def get_raw_message_content(
        message_id : String
      ) : Protocol::Request
        input = Types::GetRawMessageContentRequest.new(message_id: message_id)
        get_raw_message_content(input)
      end

      def get_raw_message_content(input : Types::GetRawMessageContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RAW_MESSAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the raw content of an in-transit email message, in MIME format. This example describes how
      # to update in-transit email message. For more information and examples for using this API, see
      # Updating message content with AWS Lambda . Updates to an in-transit message only appear when you
      # call PutRawMessageContent from an AWS Lambda function configured with a synchronous Run Lambda rule.
      # If you call PutRawMessageContent on a delivered or sent message, the message remains unchanged, even
      # though GetRawMessageContent returns an updated message.

      def put_raw_message_content(
        content : Types::RawMessageContent,
        message_id : String
      ) : Protocol::Request
        input = Types::PutRawMessageContentRequest.new(content: content, message_id: message_id)
        put_raw_message_content(input)
      end

      def put_raw_message_content(input : Types::PutRawMessageContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RAW_MESSAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
