require "uri"
require "socket"

module Aws
  module Runtime
    class Client
      getter endpoint : String
      getter region : String
      getter service : String
      getter credentials : Credentials?
      getter transport : Transport
      getter endpoint_headers : Hash(String, String)
      getter config : Config

      def initialize(
        @endpoint : String,
        @region : String,
        @service : String,
        @credentials : Credentials?,
        @transport : Transport = HttpTransport.new,
        @endpoint_headers : Hash(String, String) = {} of String => String,
        @config : Config = Config.new
      )
        raise ArgumentError.new("endpoint must not be empty") if @endpoint.empty?
        raise ArgumentError.new("region must not be empty") if @region.empty?
        raise ArgumentError.new("service must not be empty") if @service.empty?
      end

      def execute(request : Http::Request) : Http::Response
        request = request.with_headers(@endpoint_headers)
        signer = signer_for_request
        signer.sign(request)

        attempt = 0
        loop do
          attempt += 1
          log_request(request) if @config.http_wire_trace
          begin
            response = @transport.execute(request)
            log_response(response) if @config.http_wire_trace
            return response unless retryable_response?(response)
            return response if attempt > @config.retry_limit
            @config.retry_backoff.call(attempt)
          rescue ex : IO::Error | Socket::Error
            raise ex if attempt > @config.retry_limit
            @config.retry_backoff.call(attempt)
          end
        end
      end

      private def signer_for_request : Signer::SigV4
        credentials = @credentials
        raise Errors::MissingCredentialsError.new("missing AWS credentials") unless credentials
        Signer::SigV4.new(@service, @region, credentials)
      end

      private def retryable_response?(response : Http::Response) : Bool
        response.status >= 500 || response.status == 429
      end

      private def log_request(request : Http::Request) : Nil
        uri = URI.parse(request.uri)
        path = uri.request_target
        path = "/" if path.empty?
        STDOUT.puts "-- HTTP REQUEST --"
        STDOUT.puts "#{request.method} #{path} HTTP/1.1"
        STDOUT.puts "host: #{uri.host}#{uri.port ? ":#{uri.port}" : ""}"
        request.headers.each { |key, value| STDOUT.puts "#{key}: #{value}" }
        STDOUT.puts
        STDOUT.puts request.body if request.body
        STDOUT.flush
      end

      private def log_response(response : Http::Response) : Nil
        STDOUT.puts "-- HTTP RESPONSE --"
        STDOUT.puts "#{response.version} #{response.status}"
        response.headers.each { |key, value| STDOUT.puts "#{key}: #{value}" }
        STDOUT.puts
        STDOUT.puts response.body if response.body
        STDOUT.flush
      end
    end
  end
end
