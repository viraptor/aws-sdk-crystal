require "./spec_helper"

class SsmStubTransport
  include Aws::Runtime::Transport

  getter last_request : Aws::Runtime::Http::Request?

  def initialize(@response : Aws::Runtime::Http::Response)
  end

  def execute(request : Aws::Runtime::Http::Request) : Aws::Runtime::Http::Response
    @last_request = request
    @response
  end
end

describe Aws::SSM::Client do
  it "executes signed GetParameter request and parses JSON responses" do
    ENV["AWS_REGION"] = "us-east-1"
    ENV["AWS_ACCESS_KEY_ID"] = "AKID"
    ENV["AWS_SECRET_ACCESS_KEY"] = "SECRET"
    ENV["AWS_SESSION_TOKEN"] = "TOKEN"

    response_body = %({"Parameter":{"Name":"test","Value":"value"}})
    transport = SsmStubTransport.new(
      Aws::Runtime::Http::Response.new(200, {} of String => String, response_body)
    )
    client = Aws::SSM::Client.new(transport: transport)

    output = client.get_parameter(Aws::SSM::Types::GetParameterRequest.new("test"))
    output.parameter.not_nil!.name.should eq("test")
    output.parameter.not_nil!.value.should eq("value")

    request = transport.last_request
    request.should_not be_nil
    headers = request.not_nil!.headers
    headers.has_key?("Authorization").should be_true
    headers["host"].should eq("ssm.us-east-1.amazonaws.com")
    headers["x-amz-security-token"].should eq("TOKEN")
  ensure
    ENV.delete("AWS_REGION")
    ENV.delete("AWS_ACCESS_KEY_ID")
    ENV.delete("AWS_SECRET_ACCESS_KEY")
    ENV.delete("AWS_SESSION_TOKEN")
  end

  it "parses DescribeParameters results with numeric timestamps" do
    ENV["AWS_REGION"] = "us-east-1"
    ENV["AWS_ACCESS_KEY_ID"] = "AKID"
    ENV["AWS_SECRET_ACCESS_KEY"] = "SECRET"
    ENV["AWS_SESSION_TOKEN"] = "TOKEN"

    response_body = <<-JSON
    {
      "Parameters": [
        {
          "Name": "/example",
          "LastModifiedDate": 1.543186986561E9
        }
      ]
    }
    JSON
    transport = SsmStubTransport.new(
      Aws::Runtime::Http::Response.new(200, {} of String => String, response_body)
    )
    client = Aws::SSM::Client.new(transport: transport)

    output = client.describe_parameters(Aws::SSM::Types::DescribeParametersRequest.new)
    output.parameters.should_not be_nil
    output.parameters.not_nil!.size.should eq(1)
    output.parameters.not_nil!.first.name.should eq("/example")
  ensure
    ENV.delete("AWS_REGION")
    ENV.delete("AWS_ACCESS_KEY_ID")
    ENV.delete("AWS_SECRET_ACCESS_KEY")
    ENV.delete("AWS_SESSION_TOKEN")
  end
end
