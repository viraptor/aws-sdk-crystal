require "./spec_helper"

describe Aws::DynamoDBStreams::Protocol::JsonRpc do
  it "rejects empty endpoints" do
    expect_raises(ArgumentError) do
      Aws::DynamoDBStreams::Protocol::JsonRpc.build_request(
        Aws::DynamoDBStreams::Model::LIST_STREAMS,
        Aws::DynamoDBStreams::Types::ListStreamsInput.new,
        ""
      )
    end
  end

  it "builds DescribeStream request payload" do
    input = Aws::DynamoDBStreams::Types::DescribeStreamInput.new(
      "arn:aws:dynamodb:us-west-2:123456789012:table/Test/stream/2024-01-01T00:00:00.000"
    )

    request = Aws::DynamoDBStreams::Protocol::JsonRpc.build_request(
      Aws::DynamoDBStreams::Model::DESCRIBE_STREAM,
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
    input = Aws::DynamoDBStreams::Types::ListStreamsInput.new

    request = Aws::DynamoDBStreams::Protocol::JsonRpc.build_request(
      Aws::DynamoDBStreams::Model::LIST_STREAMS,
      input,
      "https://example.com/"
    )

    request.method.should eq("POST")
    request.uri.should eq("https://example.com/")
    request.body.should eq("{}")
  end

  it "parses error responses from headers" do
    response = Aws::Runtime::Http::Response.new(
      400,
      {"x-amzn-errortype" => "LimitExceededException"},
      "{\"message\":\"slow down\"}"
    )

    error = Aws::DynamoDBStreams::Protocol::JsonRpc.parse_error(response)
    error.should be_a(Aws::DynamoDBStreams::Errors::LimitExceededException)
    error.message.should eq("slow down")
  end
end
