require "http/client"
require "uri"

module Aws
  module Runtime
    module Transport
      abstract def execute(request : Http::Request) : Http::Response

      def with_timeout(timeout : Time::Span) : Transport
        self
      end
    end

    class HttpTransport
      include Transport

      def initialize(
        @connect_timeout : Time::Span? = nil,
        @read_timeout : Time::Span? = nil,
        @write_timeout : Time::Span? = nil
      )
      end

      def execute(request : Http::Request) : Http::Response
        uri = URI.parse(request.uri)
        host = uri.host
        raise ArgumentError.new("request uri must include host") unless host

        port = uri.port || (uri.scheme == "https" ? 443 : 80)
        client = HTTP::Client.new(host, port, tls: uri.scheme == "https")
        if (t = @connect_timeout)
          client.connect_timeout = t
        end
        if (t = @read_timeout)
          client.read_timeout = t
        end
        if (t = @write_timeout)
          client.write_timeout = t
        end
        headers = HTTP::Headers.new
        request.headers.each { |key, value| headers[key] = value }

        response = client.exec(request.method, uri.request_target, headers, request.body)
        response_headers = {} of String => String
        response.headers.each do |key, value|
          response_headers[key] = value.join(",")
        end
        Http::Response.new(response.status_code, response_headers, response.body, response.version)
      ensure
        client.close if client
      end

      def with_timeout(timeout : Time::Span) : Transport
        HttpTransport.new(connect_timeout: timeout, read_timeout: timeout, write_timeout: timeout)
      end
    end
  end
end
