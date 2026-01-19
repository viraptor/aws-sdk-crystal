require "./spec_helper"

class StsStubTransport
  include AwsSdk::Runtime::Transport

  getter last_request : AwsSdk::Runtime::Http::Request?

  def initialize(@response : AwsSdk::Runtime::Http::Response)
  end

  def execute(request : AwsSdk::Runtime::Http::Request) : AwsSdk::Runtime::Http::Response
    @last_request = request
    @response
  end
end

describe AwsSdk::STS::Client do
  it "executes signed GetCallerIdentity request" do
    ENV["AWS_REGION"] = "us-east-1"
    ENV["AWS_ACCESS_KEY_ID"] = "AKID"
    ENV["AWS_SECRET_ACCESS_KEY"] = "SECRET"
    ENV["AWS_SESSION_TOKEN"] = "TOKEN"

    response_xml = <<-XML
    <GetCallerIdentityResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
      <GetCallerIdentityResult>
        <Arn>arn:aws:iam::123456789012:user/test</Arn>
        <UserId>ABCDEF</UserId>
        <Account>123456789012</Account>
      </GetCallerIdentityResult>
      <ResponseMetadata>
        <RequestId>abc</RequestId>
      </ResponseMetadata>
    </GetCallerIdentityResponse>
    XML

    transport = StsStubTransport.new(
      AwsSdk::Runtime::Http::Response.new(200, {} of String => String, response_xml)
    )
    client = AwsSdk::STS::Client.new(transport: transport)

    output = client.get_caller_identity(AwsSdk::STS::Types::GetCallerIdentityRequest.new)

    output.account.should eq("123456789012")
    output.arn.should eq("arn:aws:iam::123456789012:user/test")
    output.user_id.should eq("ABCDEF")

    request = transport.last_request
    request.should_not be_nil
    headers = request.not_nil!.headers
    headers.has_key?("Authorization").should be_true
    headers["host"].should eq("sts.us-east-1.amazonaws.com")
    headers["x-amz-security-token"].should eq("TOKEN")
  ensure
    ENV.delete("AWS_REGION")
    ENV.delete("AWS_ACCESS_KEY_ID")
    ENV.delete("AWS_SECRET_ACCESS_KEY")
    ENV.delete("AWS_SESSION_TOKEN")
  end

  it "raises modeled errors from query responses" do
    ENV["AWS_REGION"] = "us-east-1"
    ENV["AWS_ACCESS_KEY_ID"] = "AKID"
    ENV["AWS_SECRET_ACCESS_KEY"] = "SECRET"

    error_xml = <<-XML
    <ErrorResponse>
      <Error>
        <Type>Sender</Type>
        <Code>InvalidClientTokenId</Code>
        <Message>bad token</Message>
      </Error>
      <RequestId>req</RequestId>
    </ErrorResponse>
    XML

    transport = StsStubTransport.new(
      AwsSdk::Runtime::Http::Response.new(403, {} of String => String, error_xml)
    )
    client = AwsSdk::STS::Client.new(transport: transport)

    error = expect_raises(AwsSdk::STS::Errors::ServiceError) do
      client.get_caller_identity(AwsSdk::STS::Types::GetCallerIdentityRequest.new)
    end
    error.message.should eq("bad token")
  ensure
    ENV.delete("AWS_REGION")
    ENV.delete("AWS_ACCESS_KEY_ID")
    ENV.delete("AWS_SECRET_ACCESS_KEY")
  end
end
