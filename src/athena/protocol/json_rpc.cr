require "json"
require "../../runtime"

module Aws
  module Athena
    module Protocol
      module JsonRpc
        CONTENT_TYPE = "application/x-amz-json-1.1"

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : Aws::Runtime::Http::Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          raise ArgumentError.new("targetPrefix is missing") if Model::TARGET_PREFIX.empty?

          uri = endpoint.rstrip("/") + "/"
          headers = {
            "content-type" => CONTENT_TYPE,
            "x-amz-target" => "#{Model::TARGET_PREFIX}.#{operation.name}",
          }
          body = input ? input.to_json : "{}"
          Aws::Runtime::Http::Request.new("POST", uri, headers, body)
        end

        def self.parse_error(response : Aws::Runtime::Http::Response) : Exception
          error_type = error_type_from_headers(response.headers) || error_type_from_body(response.body)
          message = error_message_from_body(response.body)
          Errors.build(error_type, message)
        end

        def self.parse_response(response : Aws::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T
          body = response.body
          return output_type.from_json("{}") unless body
          output_type.from_json(body)
        rescue ex : JSON::ParseException | JSON::SerializableError
          snippet = body ? body[0, 200] : ""
          details = snippet.empty? ? "empty body" : "body=#{snippet}"
          raise Aws::Runtime::Errors::ResponseParseError.new("Failed to parse #{operation_name} response (#{details}): #{ex.message}")
        end

        private def self.error_type_from_headers(headers : Hash(String, String)) : String?
          raw = headers["x-amzn-errortype"]? || headers["x-amzn-errorType"]?
          raw.try { |value| value.split(':').first }
        end

        private def self.error_type_from_body(body : String?) : String?
          return nil unless body
          parsed = JSON.parse(body).as_h?
          return nil unless parsed

          parsed["__type"]?.try(&.as_s).try { |value| value.split('#').last } ||
            parsed["code"]?.try(&.as_s)
        rescue JSON::ParseException
          nil
        end

        private def self.error_message_from_body(body : String?) : String?
          return nil unless body
          parsed = JSON.parse(body).as_h?
          return nil unless parsed

          parsed["message"]?.try(&.as_s) || parsed["Message"]?.try(&.as_s)
        rescue JSON::ParseException
          nil
        end
      end
    end
  end
end
