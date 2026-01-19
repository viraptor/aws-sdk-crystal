module AwsSdk
  module Runtime
    class Client
      getter endpoint : String
      getter region : String
      getter service : String
      getter credentials : Credentials?
      getter transport : Transport
      getter endpoint_headers : Hash(String, String)

      def initialize(
        @endpoint : String,
        @region : String,
        @service : String,
        @credentials : Credentials?,
        @transport : Transport = HttpTransport.new,
        @endpoint_headers : Hash(String, String) = {} of String => String
      )
        raise ArgumentError.new("endpoint must not be empty") if @endpoint.empty?
        raise ArgumentError.new("region must not be empty") if @region.empty?
        raise ArgumentError.new("service must not be empty") if @service.empty?
      end

      def execute(request : Http::Request) : Http::Response
        request = request.with_headers(@endpoint_headers)
        signer = signer_for_request
        signer.sign(request)
        @transport.execute(request)
      end

      private def signer_for_request : Signer::SigV4
        credentials = @credentials
        raise Errors::MissingCredentialsError.new("missing AWS credentials") unless credentials
        Signer::SigV4.new(@service, @region, credentials)
      end
    end
  end
end
