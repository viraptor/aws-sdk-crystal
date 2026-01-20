module Aws
  module Runtime
    struct Credentials
      getter access_key_id : String
      getter secret_access_key : String
      getter session_token : String?

      def initialize(@access_key_id : String, @secret_access_key : String, @session_token : String? = nil)
        raise ArgumentError.new("access_key_id must not be empty") if @access_key_id.empty?
        raise ArgumentError.new("secret_access_key must not be empty") if @secret_access_key.empty?
        if (token = @session_token) && token.empty?
          raise ArgumentError.new("session_token must not be empty")
        end
      end

      def self.from_env? : Credentials?
        access_key_id = ENV["AWS_ACCESS_KEY_ID"]?
        secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]?
        session_token = ENV["AWS_SESSION_TOKEN"]?
        return nil unless access_key_id && secret_access_key

        Credentials.new(access_key_id, secret_access_key, session_token)
      end

      def self.from_env : Credentials
        from_env? || raise Errors::MissingCredentialsError.new("missing AWS credentials in environment")
      end
    end
  end
end
