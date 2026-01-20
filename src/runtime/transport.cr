require "http/client"
require "uri"

module AwsSdk
  module Runtime
    module Transport
      abstract def execute(request : Http::Request) : Http::Response
    end

    class HttpTransport
      include Transport

      def execute(request : Http::Request) : Http::Response
        uri = URI.parse(request.uri)
        host = uri.host
        raise ArgumentError.new("request uri must include host") unless host

        port = uri.port || (uri.scheme == "https" ? 443 : 80)
        client = HTTP::Client.new(host, port, tls: uri.scheme == "https")
        headers = HTTP::Headers.new
        request.headers.each { |key, value| headers[key] = value }

        response = client.exec(request.method, uri.request_target, headers, request.body)
        response_headers = {} of String => String
        response.headers.each do |key, value|
          response_headers[key] = value.join(",")
        end
        Http::Response.new(response.status_code, response_headers, response.body)
      ensure
        client.close if client
      end
    end
  end
end
