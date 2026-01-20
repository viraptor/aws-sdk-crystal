require "./spec_helper"
require "file_utils"

class DefaultsStubTransport
  include Aws::Runtime::Transport

  getter requests = [] of Aws::Runtime::Http::Request

  def initialize(@responses : Hash(String, Aws::Runtime::Http::Response))
  end

  def execute(request : Aws::Runtime::Http::Request) : Aws::Runtime::Http::Response
    @requests << request
    key = "#{request.method} #{request.uri}"
    @responses.fetch(key) do
      Aws::Runtime::Http::Response.new(404, {} of String => String, nil)
    end
  end
end

describe Aws::Runtime::Defaults do
  it "resolves region and credentials from env" do
    ENV["AWS_REGION"] = "us-west-2"
    ENV["AWS_ACCESS_KEY_ID"] = "AKID"
    ENV["AWS_SECRET_ACCESS_KEY"] = "SECRET"
    ENV.delete("AWS_SESSION_TOKEN")

    Aws::Runtime::Defaults.resolve_region(nil).should eq("us-west-2")
    credentials = Aws::Runtime::Defaults.resolve_credentials(nil)
    credentials.access_key_id.should eq("AKID")
    credentials.secret_access_key.should eq("SECRET")
    credentials.session_token.should be_nil
  ensure
    ENV.delete("AWS_REGION")
    ENV.delete("AWS_ACCESS_KEY_ID")
    ENV.delete("AWS_SECRET_ACCESS_KEY")
    ENV.delete("AWS_SESSION_TOKEN")
  end

  it "resolves shared config and credentials files" do
    config = <<-INI
    [profile testing]
    region = us-east-2
    INI
    credentials = <<-INI
    [testing]
    aws_access_key_id = AKID_SHARED
    aws_secret_access_key = SECRET_SHARED
    aws_session_token = TOKEN_SHARED
    INI

    dir = File.join(Dir.tempdir, "aws-config-#{Random::Secure.hex(6)}")
    FileUtils.mkdir_p(dir)
    begin
      config_path = File.join(dir, "config")
      credentials_path = File.join(dir, "credentials")
      File.write(config_path, config)
      File.write(credentials_path, credentials)

      ENV["AWS_PROFILE"] = "testing"
      ENV["AWS_CONFIG_FILE"] = config_path
      ENV["AWS_SHARED_CREDENTIALS_FILE"] = credentials_path

      Aws::Runtime::Defaults.resolve_region(nil).should eq("us-east-2")
      creds = Aws::Runtime::Defaults.resolve_credentials(nil)
      creds.access_key_id.should eq("AKID_SHARED")
      creds.secret_access_key.should eq("SECRET_SHARED")
      creds.session_token.should eq("TOKEN_SHARED")
    ensure
      FileUtils.rm_r(dir)
    end
  ensure
    ENV.delete("AWS_PROFILE")
    ENV.delete("AWS_CONFIG_FILE")
    ENV.delete("AWS_SHARED_CREDENTIALS_FILE")
  end

  it "uses ECS credentials when configured" do
    response_body = %({"AccessKeyId":"AKID_ECS","SecretAccessKey":"SECRET_ECS","Token":"TOKEN_ECS"})
    transport = DefaultsStubTransport.new({
      "GET http://169.254.170.2/v2/credentials" => Aws::Runtime::Http::Response.new(200, {} of String => String, response_body),
    })

    ENV["AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"] = "/v2/credentials"

    creds = Aws::Runtime::Defaults.resolve_credentials("default", transport)
    creds.access_key_id.should eq("AKID_ECS")
    creds.secret_access_key.should eq("SECRET_ECS")
    creds.session_token.should eq("TOKEN_ECS")
  ensure
    ENV.delete("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
  end

  it "uses IMDS region when env and shared config are missing" do
    token_response = Aws::Runtime::Http::Response.new(200, {} of String => String, "token")
    region_response = Aws::Runtime::Http::Response.new(200, {} of String => String, "us-east-1")
    transport = DefaultsStubTransport.new({
      "PUT http://169.254.169.254/latest/api/token" => token_response,
      "GET http://169.254.169.254/latest/meta-data/placement/region" => region_response,
    })

    region = Aws::Runtime::Defaults.resolve_region("default", transport)
    region.should eq("us-east-1")
  end
end
