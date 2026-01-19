require "./spec_helper"

describe AwsSdk::ImportExport::Protocol::Query do
  before_each do
    ENV["AWS_REGION"] = "us-east-1"
  end

  after_each do
    ENV.delete("AWS_REGION")
  end

  it "rejects empty inputs" do
    expect_raises(ArgumentError) do
      AwsSdk::ImportExport::Client.new("")
    end

    expect_raises(ArgumentError) do
      AwsSdk::ImportExport::Types::CancelJobInput.new("")
    end
  end

  it "builds CreateJob request payload" do
    client = AwsSdk::ImportExport::Client.new("https://example.com")
    input = AwsSdk::ImportExport::Types::CreateJobInput.new(
      "Import",
      "manifest-body",
      true,
      "manifest-addendum"
    )

    request = client.create_job(input)

    request.method.should eq("POST")
    request.uri.should eq("https://example.com/")
    request.headers["content-type"].should eq("application/x-www-form-urlencoded; charset=utf-8")
    request.body.should_not be_nil
    body = request.body.not_nil!
    body.should contain("Action=CreateJob")
    body.should contain("Version=2010-06-01")
    body.should contain("JobType=Import")
    body.should contain("Manifest=manifest-body")
    body.should contain("ManifestAddendum=manifest-addendum")
    body.should contain("ValidateOnly=true")
  end

  it "builds GetShippingLabel request payload with list members" do
    client = AwsSdk::ImportExport::Client.new("https://example.com")
    input = AwsSdk::ImportExport::Types::GetShippingLabelInput.new(["job-1", "job-2"])

    request = client.get_shipping_label(input)

    request.body.should_not be_nil
    body = request.body.not_nil!
    body.should contain("Action=GetShippingLabel")
    body.should contain("jobIds.member.1=job-1")
    body.should contain("jobIds.member.2=job-2")
  end

  it "parses error responses from body" do
    response = AwsSdk::ImportExport::Protocol::Response.new(
      400,
      {} of String => String,
      <<-XML
      <ErrorResponse>
        <Error>
          <Code>InvalidParameterException</Code>
          <Message>bad input</Message>
        </Error>
        <RequestId>abc</RequestId>
      </ErrorResponse>
      XML
    )

    error = AwsSdk::ImportExport::Protocol::Query.parse_error(response)
    error.should be_a(AwsSdk::ImportExport::Errors::InvalidParameterException)
    error.message.should eq("bad input")
  end
end
