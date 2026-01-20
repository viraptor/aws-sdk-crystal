require "../src/sts"
require "json"

client = Aws::STS::Client.new
puts client.get_caller_identity.to_json

