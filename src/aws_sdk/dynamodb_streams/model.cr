module AwsSdk
  module DynamoDBStreams
    module Model
      TARGET_PREFIX = "DynamoDBStreams_20120810"
      ENDPOINT_PREFIX = "streams.dynamodb"
      ENDPOINT_RULE_SET_JSON = nil

      struct OperationModel
        getter name : String

        def initialize(@name : String)
        end
      end

      DESCRIBE_STREAM = OperationModel.new(name: "DescribeStream")
      GET_RECORDS = OperationModel.new(name: "GetRecords")
      GET_SHARD_ITERATOR = OperationModel.new(name: "GetShardIterator")
      LIST_STREAMS = OperationModel.new(name: "ListStreams")
    end
  end
end
