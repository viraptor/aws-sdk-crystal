module AwsSdk
  module Runtime
    module Defaults
      def self.resolve_region(profile : String?, transport : Transport = HttpTransport.new) : String
        resolved_profile = profile || SharedConfig.default_profile
        chain = RegionProviderChain.new(resolved_profile, transport)
        region = chain.resolve
        raise Errors::MissingRegionError.new("missing AWS region") unless region
        region
      end

      def self.resolve_credentials(profile : String?, transport : Transport = HttpTransport.new) : Credentials
        resolved_profile = profile || SharedConfig.default_profile
        chain = CredentialsProviderChain.new(resolved_profile, transport)
        credentials = chain.resolve
        raise Errors::MissingCredentialsError.new("missing AWS credentials") unless credentials
        credentials
      end
    end
  end
end
