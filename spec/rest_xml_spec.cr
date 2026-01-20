require "./spec_helper"

describe AwsSdk::CloudFront::Protocol::RestXml do
  before_each do
    ENV["AWS_REGION"] = "us-east-1"
    ENV["AWS_ACCESS_KEY_ID"] = "AKID"
    ENV["AWS_SECRET_ACCESS_KEY"] = "SECRET"
  end

  after_each do
    ENV.delete("AWS_REGION")
    ENV.delete("AWS_ACCESS_KEY_ID")
    ENV.delete("AWS_SECRET_ACCESS_KEY")
  end

  it "rejects empty inputs" do
    expect_raises(ArgumentError) do
      AwsSdk::CloudFront::Client.new("")
    end
  end

  it "builds ListDistributions request with query params" do
    input = AwsSdk::CloudFront::Types::ListDistributionsRequest.new("abc", "25")
    request = AwsSdk::CloudFront::Protocol::RestXml.build_request(
      AwsSdk::CloudFront::Model::LIST_DISTRIBUTIONS,
      input,
      "https://example.com"
    )

    request.method.should eq("GET")
    request.uri.should contain("/2020-05-31/distribution")
    request.uri.should contain("Marker=abc")
    request.uri.should contain("MaxItems=25")
    request.headers["content-type"].should eq("application/xml")
    request.body.should be_nil
  end

  it "parses error responses from body" do
    response = AwsSdk::Runtime::Http::Response.new(
      400,
      {} of String => String,
      <<-XML
      <ErrorResponse>
        <Error>
          <Code>InvalidArgument</Code>
          <Message>bad input</Message>
        </Error>
      </ErrorResponse>
      XML
    )

    error = AwsSdk::CloudFront::Protocol::RestXml.parse_error(response)
    error.should be_a(AwsSdk::CloudFront::Errors::InvalidArgument)
    error.message.should eq("bad input")
  end
end
