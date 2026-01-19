require "json"

module AwsSdk
  module DynamoDBStreams
    module Types
      struct ShardFilter
        include JSON::Serializable

        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String?

        def initialize(@type : String? = nil, @shard_id : String? = nil)
          if (type = @type) && type.empty?
            raise ArgumentError.new("type must not be empty")
          end
          if (shard_id = @shard_id) && shard_id.empty?
            raise ArgumentError.new("shard_id must not be empty")
          end
        end
      end

      struct DescribeStreamInput
        include JSON::Serializable

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        @[JSON::Field(key: "ExclusiveStartShardId")]
        getter exclusive_start_shard_id : String?

        @[JSON::Field(key: "ShardFilter")]
        getter shard_filter : ShardFilter?

        def initialize(
          @stream_arn : String,
          @limit : Int32? = nil,
          @exclusive_start_shard_id : String? = nil,
          @shard_filter : ShardFilter? = nil
        )
          raise ArgumentError.new("stream_arn must not be empty") if @stream_arn.empty?
          if (limit = @limit) && limit < 1
            raise ArgumentError.new("limit must be >= 1")
          end
          if (exclusive_start_shard_id = @exclusive_start_shard_id) && exclusive_start_shard_id.empty?
            raise ArgumentError.new("exclusive_start_shard_id must not be empty")
          end
        end
      end

      struct GetRecordsInput
        include JSON::Serializable

        @[JSON::Field(key: "ShardIterator")]
        getter shard_iterator : String

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(@shard_iterator : String, @limit : Int32? = nil)
          raise ArgumentError.new("shard_iterator must not be empty") if @shard_iterator.empty?
          if (limit = @limit) && limit < 1
            raise ArgumentError.new("limit must be >= 1")
          end
        end
      end

      struct GetShardIteratorInput
        include JSON::Serializable

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String

        @[JSON::Field(key: "ShardIteratorType")]
        getter shard_iterator_type : String

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @stream_arn : String,
          @shard_id : String,
          @shard_iterator_type : String,
          @sequence_number : String? = nil
        )
          raise ArgumentError.new("stream_arn must not be empty") if @stream_arn.empty?
          raise ArgumentError.new("shard_id must not be empty") if @shard_id.empty?
          raise ArgumentError.new("shard_iterator_type must not be empty") if @shard_iterator_type.empty?
          if (sequence_number = @sequence_number) && sequence_number.empty?
            raise ArgumentError.new("sequence_number must not be empty")
          end
        end
      end

      struct ListStreamsInput
        include JSON::Serializable

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        @[JSON::Field(key: "ExclusiveStartStreamArn")]
        getter exclusive_start_stream_arn : String?

        def initialize(
          @table_name : String? = nil,
          @limit : Int32? = nil,
          @exclusive_start_stream_arn : String? = nil
        )
          if (table_name = @table_name) && table_name.empty?
            raise ArgumentError.new("table_name must not be empty")
          end
          if (limit = @limit) && limit < 1
            raise ArgumentError.new("limit must be >= 1")
          end
          if (exclusive_start_stream_arn = @exclusive_start_stream_arn) && exclusive_start_stream_arn.empty?
            raise ArgumentError.new("exclusive_start_stream_arn must not be empty")
          end
        end
      end
    end
  end
end
