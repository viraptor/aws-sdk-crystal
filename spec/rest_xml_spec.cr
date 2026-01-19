require "./spec_helper"

describe AwsSdk::Cloudfront::Protocol::RestXml do
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
      AwsSdk::Cloudfront::Client.new("")
    end
  end

  it "builds ListDistributions request with query params" do
    input = AwsSdk::Cloudfront::Types::ListDistributionsRequest.new("abc", "25")
    request = AwsSdk::Cloudfront::Protocol::RestXml.build_request(
      AwsSdk::Cloudfront::Model::LIST_DISTRIBUTIONS,
      input,
      "https://example.com"
    )

    request.method.should eq("GET")
    request.uri.should contain("/2016-01-28/distribution")
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

    error = AwsSdk::Cloudfront::Protocol::RestXml.parse_error(response)
    error.should be_a(AwsSdk::Cloudfront::Errors::InvalidArgument)
    error.message.should eq("bad input")
  end
end
