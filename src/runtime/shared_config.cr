module AwsSdk
  module Runtime
    module SharedConfig
      def self.default_profile : String
        ENV["AWS_PROFILE"]? || ENV["AWS_DEFAULT_PROFILE"]? || "default"
      end

      def self.config_path : String
        ENV["AWS_CONFIG_FILE"]? || File.join(home_dir, ".aws", "config")
      end

      def self.credentials_path : String
        ENV["AWS_SHARED_CREDENTIALS_FILE"]? || File.join(home_dir, ".aws", "credentials")
      end

      def self.profile_config(profile : String) : Hash(String, String)
        section = config_section_name(profile)
        parse_ini(config_path)[section]? || {} of String => String
      end

      def self.profile_credentials(profile : String) : Hash(String, String)
        parse_ini(credentials_path)[profile]? || {} of String => String
      end

      def self.region_for(profile : String) : String?
        config = profile_config(profile)
        config["region"]?
      end

      def self.credentials_for(profile : String) : Credentials?
        values = profile_credentials(profile)
        access_key = values["aws_access_key_id"]?
        secret_key = values["aws_secret_access_key"]?
        return nil unless access_key && secret_key
        token = values["aws_session_token"]?
        Credentials.new(access_key, secret_key, token)
      end

      def self.config_credentials_for(profile : String) : Credentials?
        values = profile_config(profile)
        access_key = values["aws_access_key_id"]?
        secret_key = values["aws_secret_access_key"]?
        return nil unless access_key && secret_key
        token = values["aws_session_token"]?
        Credentials.new(access_key, secret_key, token)
      end

      private def self.config_section_name(profile : String) : String
        return "default" if profile == "default"
        "profile #{profile}"
      end

      private def self.parse_ini(path : String) : Hash(String, Hash(String, String))
        return {} of String => Hash(String, String) unless File.exists?(path)

        current_section = nil
        data = Hash(String, Hash(String, String)).new { |hash, key| hash[key] = {} of String => String }
        File.each_line(path) do |line|
          line = line.strip
          next if line.empty? || line.starts_with?("#") || line.starts_with?(";")
          if line.starts_with?("[") && line.ends_with?("]")
            current_section = line[1..-2].strip
            next
          end
          next unless current_section
          separator = line.index('=')
          next unless separator
          key = line[0...separator].strip
          value = line[(separator + 1)..-1].strip
          data[current_section][key] = value
        end

        data
      end

      private def self.home_dir : String
        ENV["HOME"]? || "."
      end
    end
  end
end
