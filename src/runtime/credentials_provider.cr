require "json"

module Aws
  module Runtime
    module CredentialsProvider
      abstract def resolve : Credentials?
    end

    class EnvCredentialsProvider
      include CredentialsProvider

      def resolve : Credentials?
        Credentials.from_env?
      end
    end

    class SharedCredentialsProvider
      include CredentialsProvider

      def initialize(@profile : String)
      end

      def resolve : Credentials?
        SharedConfig.credentials_for(@profile) || SharedConfig.config_credentials_for(@profile)
      end
    end

    class EcsCredentialsProvider
      include CredentialsProvider

      RELATIVE_URI_ENV = "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"
      FULL_URI_ENV = "AWS_CONTAINER_CREDENTIALS_FULL_URI"
      AUTH_TOKEN_ENV = "AWS_CONTAINER_AUTHORIZATION_TOKEN"
      AUTH_TOKEN_FILE_ENV = "AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE"

      def initialize(@transport : Transport = HttpTransport.new)
      end

      def resolve : Credentials?
        uri = ecs_uri
        return nil unless uri
        headers = ecs_headers
        response = @transport.execute(Http::Request.new("GET", uri, headers))
        return nil unless response.status == 200
        body = response.body
        return nil unless body
        parse_credentials(body)
      rescue
        nil
      end

      private def ecs_uri : String?
        if (relative = ENV[RELATIVE_URI_ENV]?)
          return "http://169.254.170.2#{relative}"
        end
        ENV[FULL_URI_ENV]?
      end

      private def ecs_headers : Hash(String, String)
        if (token = ENV[AUTH_TOKEN_ENV]?)
          return {"Authorization" => token}
        end
        if (token_file = ENV[AUTH_TOKEN_FILE_ENV]?)
          return {"Authorization" => File.read(token_file).strip}
        end
        {} of String => String
      end

      private def parse_credentials(body : String) : Credentials?
        data = JSON.parse(body).as_h
        access_key = data["AccessKeyId"]?.try(&.as_s)
        secret_key = data["SecretAccessKey"]?.try(&.as_s)
        return nil unless access_key && secret_key
        token = data["Token"]?.try(&.as_s)
        Credentials.new(access_key, secret_key, token)
      end
    end

    class ImdsCredentialsProvider
      include CredentialsProvider

      METADATA_HOST = "http://169.254.169.254"
      TOKEN_PATH = "/latest/api/token"
      ROLE_PATH = "/latest/meta-data/iam/security-credentials/"
      DISABLE_ENV = "AWS_EC2_METADATA_DISABLED"

      def initialize(@transport : Transport = HttpTransport.new)
      end

      def resolve : Credentials?
        return nil if metadata_disabled?
        token = imds_token
        role_name = imds_get(ROLE_PATH, token).try(&.strip)
        return nil unless role_name && !role_name.empty?
        body = imds_get("#{ROLE_PATH}#{role_name}", token)
        return nil unless body
        parse_credentials(body)
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

      private def parse_credentials(body : String) : Credentials?
        data = JSON.parse(body).as_h
        access_key = data["AccessKeyId"]?.try(&.as_s)
        secret_key = data["SecretAccessKey"]?.try(&.as_s)
        return nil unless access_key && secret_key
        token = data["Token"]?.try(&.as_s)
        Credentials.new(access_key, secret_key, token)
      end
    end

    class CredentialsProviderChain
      def initialize(
        @profile : String = SharedConfig.default_profile,
        @transport : Transport = HttpTransport.new
      )
      end

      def resolve : Credentials?
        providers.each do |provider|
          credentials = provider.resolve
          return credentials if credentials
        end
        nil
      end

      private def providers : Array(CredentialsProvider)
        providers = [] of CredentialsProvider
        providers << EnvCredentialsProvider.new
        providers << SharedCredentialsProvider.new(@profile)
        providers << EcsCredentialsProvider.new(@transport)
        providers << ImdsCredentialsProvider.new(@transport)
        providers
      end
    end
  end
end
