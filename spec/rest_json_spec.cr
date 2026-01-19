require "./spec_helper"

describe AwsSdk::KinesisVideoWebRTCStorage::Protocol::RestJson do
  before_each do
    ENV["AWS_REGION"] = "us-west-2"
  end

  after_each do
    ENV.delete("AWS_REGION")
  end

  it "builds JoinStorageSession request payload" do
    client = AwsSdk::KinesisVideoWebRTCStorage::Client.new("https://example.com")
    input = AwsSdk::KinesisVideoWebRTCStorage::Types::JoinStorageSessionInput.new("arn:aws:kinesisvideo:us-west-2:123456789012:channel/test/123")

    request = client.join_storage_session(input)

    request.method.should eq("POST")
    request.uri.should eq("https://example.com/joinStorageSession")
    request.headers["content-type"].should eq("application/json")
    request.body.should eq("{\"channelArn\":\"#{input.channel_arn}\"}")
  end

  it "builds JoinStorageSessionAsViewer request payload" do
    client = AwsSdk::KinesisVideoWebRTCStorage::Client.new("https://example.com")
    input = AwsSdk::KinesisVideoWebRTCStorage::Types::JoinStorageSessionAsViewerInput.new(
      "arn:aws:kinesisvideo:us-west-2:123456789012:channel/test/123",
      "client-123"
    )

    request = client.join_storage_session_as_viewer(input)

    request.method.should eq("POST")
    request.uri.should eq("https://example.com/joinStorageSessionAsViewer")
    request.body.should eq("{\"channelArn\":\"#{input.channel_arn}\",\"clientId\":\"#{input.client_id}\"}")
  end

  it "parses error responses from headers" do
    response = AwsSdk::KinesisVideoWebRTCStorage::Protocol::Response.new(
      403,
      {"x-amzn-errortype" => "AccessDeniedException"},
      "{\"message\":\"nope\"}"
    )

    error = AwsSdk::KinesisVideoWebRTCStorage::Protocol::RestJson.parse_error(response)
    error.should be_a(AwsSdk::KinesisVideoWebRTCStorage::Errors::AccessDeniedException)
    error.message.should eq("nope")
  end

  it "parses error responses from body" do
    response = AwsSdk::KinesisVideoWebRTCStorage::Protocol::Response.new(
      404,
      {} of String => String,
      "{\"__type\":\"ResourceNotFoundException\",\"message\":\"missing\"}"
    )

    error = AwsSdk::KinesisVideoWebRTCStorage::Protocol::RestJson.parse_error(response)
    error.should be_a(AwsSdk::KinesisVideoWebRTCStorage::Errors::ResourceNotFoundException)
    error.message.should eq("missing")
  end
end
