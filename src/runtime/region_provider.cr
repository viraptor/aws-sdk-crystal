require "json"

module Aws
  module Runtime
    module RegionProvider
      abstract def resolve : String?
    end

    class EnvRegionProvider
      include RegionProvider

      def resolve : String?
        ENV["AWS_REGION"]? || ENV["AWS_DEFAULT_REGION"]?
      end
    end

    class SharedConfigRegionProvider
      include RegionProvider

      def initialize(@profile : String)
      end

      def resolve : String?
        SharedConfig.region_for(@profile)
      end
    end

    class ImdsRegionProvider
      include RegionProvider

      METADATA_HOST = "http://169.254.169.254"
      TOKEN_PATH = "/latest/api/token"
      REGION_PATH = "/latest/meta-data/placement/region"

      def initialize(transport : Transport = HttpTransport.new)
        @transport = transport.with_timeout(Imds.timeout)
        @attempts = Imds.num_attempts
      end

      def resolve : String?
        return nil if Imds.disabled?
        token = imds_token
        imds_get(REGION_PATH, token).try(&.strip)
      rescue
        nil
      end

      private def imds_token : String?
        headers = {"x-aws-ec2-metadata-token-ttl-seconds" => "21600"}
        response = Imds.attempt(@attempts) do
          @transport.execute(Http::Request.new("PUT", "#{METADATA_HOST}#{TOKEN_PATH}", headers))
        end
        return nil unless response && response.status == 200
        response.body
      end

      private def imds_get(path : String, token : String?) : String?
        headers = {} of String => String
        headers["x-aws-ec2-metadata-token"] = token if token
        response = Imds.attempt(@attempts) do
          @transport.execute(Http::Request.new("GET", "#{METADATA_HOST}#{path}", headers))
        end
        return nil unless response && response.status == 200
        response.body
      end
    end

    class RegionProviderChain
      def initialize(
        @profile : String = SharedConfig.default_profile,
        @transport : Transport = HttpTransport.new
      )
      end

      def resolve : String?
        providers.each do |provider|
          region = provider.resolve
          return region if region && !region.empty?
        end
        nil
      end

      private def providers : Array(RegionProvider)
        providers = [] of RegionProvider
        providers << EnvRegionProvider.new
        providers << SharedConfigRegionProvider.new(@profile)
        providers << ImdsRegionProvider.new(@transport)
        providers
      end
    end
  end
end
