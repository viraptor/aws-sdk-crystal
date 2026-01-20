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
      DISABLE_ENV = "AWS_EC2_METADATA_DISABLED"

      def initialize(@transport : Transport = HttpTransport.new)
      end

      def resolve : String?
        return nil if metadata_disabled?
        token = imds_token
        imds_get(REGION_PATH, token).try(&.strip)
      rescue
        nil
      end

      private def metadata_disabled? : Bool
        ENV[DISABLE_ENV]?.to_s.downcase == "true"
      end

      private def imds_token : String?
        headers = {"x-aws-ec2-metadata-token-ttl-seconds" => "21600"}
        response = @transport.execute(Http::Request.new("PUT", "#{METADATA_HOST}#{TOKEN_PATH}", headers))
        return nil unless response.status == 200
        response.body
      rescue
        nil
      end

      private def imds_get(path : String, token : String?) : String?
        headers = {} of String => String
        headers["x-aws-ec2-metadata-token"] = token if token
        response = @transport.execute(Http::Request.new("GET", "#{METADATA_HOST}#{path}", headers))
        return nil unless response.status == 200
        response.body
      rescue
        nil
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
