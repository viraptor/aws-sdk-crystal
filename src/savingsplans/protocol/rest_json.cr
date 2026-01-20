require "json"

module Aws
  module Savingsplans
    module Protocol
      struct Request
        getter method : String
        getter uri : String
        getter headers : Hash(String, String)
        getter body : String?

        def initialize(@method : String, @uri : String, @headers : Hash(String, String), @body : String?)
        end
      end

      struct Response
        getter status : Int32
        getter headers : Hash(String, String)
        getter body : String?

        def initialize(@status : Int32, @headers : Hash(String, String), @body : String?)
        end
      end

      module RestJson
        CONTENT_TYPE = "application/json"

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          uri = endpoint.rstrip("/") + operation.request_uri
          headers = {"content-type" => CONTENT_TYPE}
          body = input ? input.to_json : nil
          Request.new(operation.http_method, uri, headers, body)
        end

        def self.parse_error(response : Response) : Exception
          error_type = error_type_from_headers(response.headers) || error_type_from_body(response.body)
          message = error_message_from_body(response.body)
          Errors.build(error_type, message)
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
