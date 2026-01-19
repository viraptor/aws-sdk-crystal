require "json"

module AwsSdk
  module KinesisVideoWebrtcStorage
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
        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          raise ArgumentError.new("unsupported operation: #{operation.name}") unless supported_operation?(operation.name)

          uri = endpoint.rstrip("/") + operation.request_uri
          headers = {"content-type" => "application/json"}

          body = case operation.name
                 when "JoinStorageSession"
                   unless input.is_a?(Types::JoinStorageSessionInput)
                     raise ArgumentError.new("input must be JoinStorageSessionInput")
                   end
                   input.to_json
                 when "JoinStorageSessionAsViewer"
                   unless input.is_a?(Types::JoinStorageSessionAsViewerInput)
                     raise ArgumentError.new("input must be JoinStorageSessionAsViewerInput")
                   end
                   input.to_json
                 else
                   raise ArgumentError.new("unsupported operation: #{operation.name}")
                 end

          Request.new(operation.http_method, uri, headers, body)
        end

        def self.parse_error(response : Response) : Exception
          error_type = error_type_from_headers(response.headers) || error_type_from_body(response.body)
          message = error_message_from_body(response.body)

          case error_type
          when "AccessDeniedException"
            Errors::AccessDeniedException.new(message)
          when "ClientLimitExceededException"
            Errors::ClientLimitExceededException.new(message)
          when "InvalidArgumentException"
            Errors::InvalidArgumentException.new(message)
          when "ResourceNotFoundException"
            Errors::ResourceNotFoundException.new(message)
          else
            Errors::ServiceError.new(message || "Unknown error")
          end
        end

        private def self.supported_operation?(name : String) : Bool
          name == "JoinStorageSession" || name == "JoinStorageSessionAsViewer"
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
