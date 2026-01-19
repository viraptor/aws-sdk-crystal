require "./spec_helper"

describe AwsSdk::DynamoDBStreams::Protocol::JsonRpc do
  it "rejects empty endpoints" do
    expect_raises(ArgumentError) do
      AwsSdk::DynamoDBStreams::Protocol::JsonRpc.build_request(
        AwsSdk::DynamoDBStreams::Model::LIST_STREAMS,
        AwsSdk::DynamoDBStreams::Types::ListStreamsInput.new,
        ""
      )
    end
  end

  it "builds DescribeStream request payload" do
    input = AwsSdk::DynamoDBStreams::Types::DescribeStreamInput.new(
      "arn:aws:dynamodb:us-west-2:123456789012:table/Test/stream/2024-01-01T00:00:00.000"
    )

    request = AwsSdk::DynamoDBStreams::Protocol::JsonRpc.build_request(
      AwsSdk::DynamoDBStreams::Model::DESCRIBE_STREAM,
      input,
      "https://example.com"
    )

    request.method.should eq("POST")
    request.uri.should eq("https://example.com/")
    request.headers["content-type"].should eq("application/x-amz-json-1.0")
    request.headers["x-amz-target"].should eq("DynamoDBStreams_20120810.DescribeStream")
    request.body.should eq("{\"StreamArn\":\"#{input.stream_arn}\"}")
  end

  it "builds ListStreams request payload with defaults" do
    input = AwsSdk::DynamoDBStreams::Types::ListStreamsInput.new

    request = AwsSdk::DynamoDBStreams::Protocol::JsonRpc.build_request(
      AwsSdk::DynamoDBStreams::Model::LIST_STREAMS,
      input,
      "https://example.com/"
    )

    request.method.should eq("POST")
    request.uri.should eq("https://example.com/")
    request.body.should eq("{}")
  end

  it "parses error responses from headers" do
    response = AwsSdk::Runtime::Http::Response.new(
      400,
      {"x-amzn-errortype" => "LimitExceededException"},
      "{\"message\":\"slow down\"}"
    )

    error = AwsSdk::DynamoDBStreams::Protocol::JsonRpc.parse_error(response)
    error.should be_a(AwsSdk::DynamoDBStreams::Errors::LimitExceededException)
    error.message.should eq("slow down")
  end
end
