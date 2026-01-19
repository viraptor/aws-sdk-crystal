require "../src/aws_sdk/sts"
require "json"

client = AwsSdk::STS::Client.new
puts client.get_caller_identity.to_json

