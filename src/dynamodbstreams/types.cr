require "json"
require "time"

module Aws
  module DynamoDBStreams
    module Types

      # Represents the data for an attribute. Each attribute value is described as a name-value pair. The
      # name is the data type, and the value is the data itself. For more information, see Data Types in the
      # Amazon DynamoDB Developer Guide .

      struct AttributeValue
        include JSON::Serializable

        # An attribute of type Binary. For example: "B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"

        @[JSON::Field(key: "B")]
        getter b : Bytes?

        # An attribute of type Boolean. For example: "BOOL": true

        @[JSON::Field(key: "BOOL")]
        getter bool : Bool?

        # An attribute of type Binary Set. For example: "BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]

        @[JSON::Field(key: "BS")]
        getter bs : Array(Bytes)?

        # An attribute of type List. For example: "L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N": "3.14159"}]

        @[JSON::Field(key: "L")]
        getter l : Array(Types::AttributeValue)?

        # An attribute of type Map. For example: "M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}

        @[JSON::Field(key: "M")]
        getter m : Hash(String, Types::AttributeValue)?

        # An attribute of type Number. For example: "N": "123.45" Numbers are sent across the network to
        # DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB
        # treats them as number type attributes for mathematical operations.

        @[JSON::Field(key: "N")]
        getter n : String?

        # An attribute of type Number Set. For example: "NS": ["42.2", "-19", "7.5", "3.14"] Numbers are sent
        # across the network to DynamoDB as strings, to maximize compatibility across languages and libraries.
        # However, DynamoDB treats them as number type attributes for mathematical operations.

        @[JSON::Field(key: "NS")]
        getter ns : Array(String)?

        # An attribute of type Null. For example: "NULL": true

        @[JSON::Field(key: "NULL")]
        getter null : Bool?

        # An attribute of type String. For example: "S": "Hello"

        @[JSON::Field(key: "S")]
        getter s : String?

        # An attribute of type String Set. For example: "SS": ["Giraffe", "Hippo" ,"Zebra"]

        @[JSON::Field(key: "SS")]
        getter ss : Array(String)?

        def initialize(
          @b : Bytes? = nil,
          @bool : Bool? = nil,
          @bs : Array(Bytes)? = nil,
          @l : Array(Types::AttributeValue)? = nil,
          @m : Hash(String, Types::AttributeValue)? = nil,
          @n : String? = nil,
          @ns : Array(String)? = nil,
          @null : Bool? = nil,
          @s : String? = nil,
          @ss : Array(String)? = nil
        )
        end
      end

      # Represents the input of a DescribeStream operation.

      struct DescribeStreamInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the stream.

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        # The shard ID of the first item that this operation will evaluate. Use the value that was returned
        # for LastEvaluatedShardId in the previous operation.

        @[JSON::Field(key: "ExclusiveStartShardId")]
        getter exclusive_start_shard_id : String?

        # The maximum number of shard objects to return. The upper limit is 100.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # This optional field contains the filter definition for the DescribeStream API.

        @[JSON::Field(key: "ShardFilter")]
        getter shard_filter : Types::ShardFilter?

        def initialize(
          @stream_arn : String,
          @exclusive_start_shard_id : String? = nil,
          @limit : Int32? = nil,
          @shard_filter : Types::ShardFilter? = nil
        )
        end
      end

      # Represents the output of a DescribeStream operation.

      struct DescribeStreamOutput
        include JSON::Serializable

        # A complete description of the stream, including its creation date and time, the DynamoDB table
        # associated with the stream, the shard IDs within the stream, and the beginning and ending sequence
        # numbers of stream records within the shards.

        @[JSON::Field(key: "StreamDescription")]
        getter stream_description : Types::StreamDescription?

        def initialize(
          @stream_description : Types::StreamDescription? = nil
        )
        end
      end

      # The shard iterator has expired and can no longer be used to retrieve stream records. A shard
      # iterator expires 15 minutes after it is retrieved using the GetShardIterator action.

      struct ExpiredIteratorException
        include JSON::Serializable

        # The provided iterator exceeds the maximum age allowed.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input of a GetRecords operation.

      struct GetRecordsInput
        include JSON::Serializable

        # A shard iterator that was retrieved from a previous GetShardIterator operation. This iterator can be
        # used to access the stream records in this shard.

        @[JSON::Field(key: "ShardIterator")]
        getter shard_iterator : String

        # The maximum number of records to return from the shard. The upper limit is 1000.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @shard_iterator : String,
          @limit : Int32? = nil
        )
        end
      end

      # Represents the output of a GetRecords operation.

      struct GetRecordsOutput
        include JSON::Serializable

        # The next position in the shard from which to start sequentially reading stream records. If set to
        # null , the shard has been closed and the requested iterator will not return any more data.

        @[JSON::Field(key: "NextShardIterator")]
        getter next_shard_iterator : String?

        # The stream records from the shard, which were retrieved using the shard iterator.

        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)?

        def initialize(
          @next_shard_iterator : String? = nil,
          @records : Array(Types::Record)? = nil
        )
        end
      end

      # Represents the input of a GetShardIterator operation.

      struct GetShardIteratorInput
        include JSON::Serializable

        # The identifier of the shard. The iterator will be returned for this shard ID.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String

        # Determines how the shard iterator is used to start reading stream records from the shard:
        # AT_SEQUENCE_NUMBER - Start reading exactly from the position denoted by a specific sequence number.
        # AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by a specific sequence
        # number. TRIM_HORIZON - Start reading at the last (untrimmed) stream record, which is the oldest
        # record in the shard. In DynamoDB Streams, there is a 24 hour limit on data retention. Stream records
        # whose age exceeds this limit are subject to removal (trimming) from the stream. LATEST - Start
        # reading just after the most recent stream record in the shard, so that you always read the most
        # recent data in the shard.

        @[JSON::Field(key: "ShardIteratorType")]
        getter shard_iterator_type : String

        # The Amazon Resource Name (ARN) for the stream.

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        # The sequence number of a stream record in the shard from which to start reading.

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @shard_id : String,
          @shard_iterator_type : String,
          @stream_arn : String,
          @sequence_number : String? = nil
        )
        end
      end

      # Represents the output of a GetShardIterator operation.

      struct GetShardIteratorOutput
        include JSON::Serializable

        # The position in the shard from which to start reading stream records sequentially. A shard iterator
        # specifies this position using the sequence number of a stream record in a shard.

        @[JSON::Field(key: "ShardIterator")]
        getter shard_iterator : String?

        def initialize(
          @shard_iterator : String? = nil
        )
        end
      end

      # Contains details about the type of identity that made the request.

      struct Identity
        include JSON::Serializable

        # A unique identifier for the entity that made the call. For Time To Live, the principalId is
        # "dynamodb.amazonaws.com".

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # The type of the identity. For Time To Live, the type is "Service".

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @principal_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An error occurred on the server side.

      struct InternalServerError
        include JSON::Serializable

        # The server encountered an internal error trying to fulfill the request.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a single element of a key schema. A key schema specifies the attributes that make up the
      # primary key of a table, or the key attributes of an index. A KeySchemaElement represents exactly one
      # attribute of the primary key. For example, a simple primary key would be represented by one
      # KeySchemaElement (for the partition key). A composite primary key would require one KeySchemaElement
      # for the partition key, and another KeySchemaElement for the sort key. A KeySchemaElement must be a
      # scalar, top-level attribute (not a nested attribute). The data type must be one of String, Number,
      # or Binary. The attribute cannot be nested within a List or a Map.

      struct KeySchemaElement
        include JSON::Serializable

        # The name of a key attribute.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The role that this key attribute will assume: HASH - partition key RANGE - sort key The partition
        # key of an item is also known as its hash attribute . The term "hash attribute" derives from
        # DynamoDB's usage of an internal hash function to evenly distribute data items across partitions,
        # based on their partition key values. The sort key of an item is also known as its range attribute .
        # The term "range attribute" derives from the way DynamoDB stores items with the same partition key
        # physically close together, in sorted order by the sort key value.

        @[JSON::Field(key: "KeyType")]
        getter key_type : String

        def initialize(
          @attribute_name : String,
          @key_type : String
        )
        end
      end

      # There is no limit to the number of daily on-demand backups that can be taken. For most purposes, up
      # to 500 simultaneous table operations are allowed per account. These operations include CreateTable ,
      # UpdateTable , DeleteTable , UpdateTimeToLive , RestoreTableFromBackup , and
      # RestoreTableToPointInTime . When you are creating a table with one or more secondary indexes, you
      # can have up to 250 such requests running at a time. However, if the table or index specifications
      # are complex, then DynamoDB might temporarily reduce the number of concurrent operations. When
      # importing into DynamoDB, up to 50 simultaneous import table operations are allowed per account.
      # There is a soft account quota of 2,500 tables. GetRecords was called with a value of more than 1000
      # for the limit request parameter. More than 2 processes are reading from the same streams shard at
      # the same time. Exceeding this limit may result in request throttling.

      struct LimitExceededException
        include JSON::Serializable

        # Too many operations for a given subscriber.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input of a ListStreams operation.

      struct ListStreamsInput
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the first item that this operation will evaluate. Use the value
        # that was returned for LastEvaluatedStreamArn in the previous operation.

        @[JSON::Field(key: "ExclusiveStartStreamArn")]
        getter exclusive_start_stream_arn : String?

        # The maximum number of streams to return. The upper limit is 100.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If this parameter is provided, then only the streams associated with this table name are returned.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @exclusive_start_stream_arn : String? = nil,
          @limit : Int32? = nil,
          @table_name : String? = nil
        )
        end
      end

      # Represents the output of a ListStreams operation.

      struct ListStreamsOutput
        include JSON::Serializable

        # The stream ARN of the item where the operation stopped, inclusive of the previous result set. Use
        # this value to start a new operation, excluding this value in the new request. If
        # LastEvaluatedStreamArn is empty, then the "last page" of results has been processed and there is no
        # more data to be retrieved. If LastEvaluatedStreamArn is not empty, it does not necessarily mean that
        # there is more data in the result set. The only way to know when you have reached the end of the
        # result set is when LastEvaluatedStreamArn is empty.

        @[JSON::Field(key: "LastEvaluatedStreamArn")]
        getter last_evaluated_stream_arn : String?

        # A list of stream descriptors associated with the current account and endpoint.

        @[JSON::Field(key: "Streams")]
        getter streams : Array(Types::Stream)?

        def initialize(
          @last_evaluated_stream_arn : String? = nil,
          @streams : Array(Types::Stream)? = nil
        )
        end
      end

      # A description of a unique event within a stream.

      struct Record
        include JSON::Serializable

        # The region in which the GetRecords request was received.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # The main body of the stream record, containing all of the DynamoDB-specific fields.

        @[JSON::Field(key: "dynamodb")]
        getter dynamodb : Types::StreamRecord?

        # A globally unique identifier for the event that was recorded in this stream record.

        @[JSON::Field(key: "eventID")]
        getter event_id : String?

        # The type of data modification that was performed on the DynamoDB table: INSERT - a new item was
        # added to the table. MODIFY - one or more of an existing item's attributes were modified. REMOVE -
        # the item was deleted from the table

        @[JSON::Field(key: "eventName")]
        getter event_name : String?

        # The Amazon Web Services service from which the stream record originated. For DynamoDB Streams, this
        # is aws:dynamodb .

        @[JSON::Field(key: "eventSource")]
        getter event_source : String?

        # The version number of the stream record format. This number is updated whenever the structure of
        # Record is modified. Client applications must not assume that eventVersion will remain at a
        # particular value, as this number is subject to change at any time. In general, eventVersion will
        # only increase as the low-level DynamoDB Streams API evolves.

        @[JSON::Field(key: "eventVersion")]
        getter event_version : String?

        # Items that are deleted by the Time to Live process after expiration have the following fields:
        # Records[].userIdentity.type "Service" Records[].userIdentity.principalId "dynamodb.amazonaws.com"

        @[JSON::Field(key: "userIdentity")]
        getter user_identity : Types::Identity?

        def initialize(
          @aws_region : String? = nil,
          @dynamodb : Types::StreamRecord? = nil,
          @event_id : String? = nil,
          @event_name : String? = nil,
          @event_source : String? = nil,
          @event_version : String? = nil,
          @user_identity : Types::Identity? = nil
        )
        end
      end

      # The operation tried to access a nonexistent table or index. The resource might not be specified
      # correctly, or its status might not be ACTIVE .

      struct ResourceNotFoundException
        include JSON::Serializable

        # The resource which is being requested does not exist.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The beginning and ending sequence numbers for the stream records contained within a shard.

      struct SequenceNumberRange
        include JSON::Serializable

        # The last sequence number for the stream records contained within a shard. String contains numeric
        # characters only.

        @[JSON::Field(key: "EndingSequenceNumber")]
        getter ending_sequence_number : String?

        # The first sequence number for the stream records contained within a shard. String contains numeric
        # characters only.

        @[JSON::Field(key: "StartingSequenceNumber")]
        getter starting_sequence_number : String?

        def initialize(
          @ending_sequence_number : String? = nil,
          @starting_sequence_number : String? = nil
        )
        end
      end

      # A uniquely identified group of stream records within a stream.

      struct Shard
        include JSON::Serializable

        # The shard ID of the current shard's parent.

        @[JSON::Field(key: "ParentShardId")]
        getter parent_shard_id : String?

        # The range of possible sequence numbers for the shard.

        @[JSON::Field(key: "SequenceNumberRange")]
        getter sequence_number_range : Types::SequenceNumberRange?

        # The system-generated identifier for this shard.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String?

        def initialize(
          @parent_shard_id : String? = nil,
          @sequence_number_range : Types::SequenceNumberRange? = nil,
          @shard_id : String? = nil
        )
        end
      end

      # This optional field contains the filter definition for the DescribeStream API.

      struct ShardFilter
        include JSON::Serializable

        # Contains the shardId of the parent shard for which you are requesting child shards. Sample request:

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String?

        # Contains the type of filter to be applied on the DescribeStream API. Currently, the only value this
        # parameter accepts is CHILD_SHARDS .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @shard_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents all of the data describing a particular stream.

      struct Stream
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the stream.

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        # A timestamp, in ISO 8601 format, for this stream. Note that LatestStreamLabel is not a unique
        # identifier for the stream, because it is possible that a stream from another table might have the
        # same timestamp. However, the combination of the following three elements is guaranteed to be unique:
        # the Amazon Web Services customer ID. the table name the StreamLabel

        @[JSON::Field(key: "StreamLabel")]
        getter stream_label : String?

        # The DynamoDB table with which the stream is associated.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_label : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      # Represents all of the data describing a particular stream.

      struct StreamDescription
        include JSON::Serializable

        # The date and time when the request to create this stream was issued.

        @[JSON::Field(key: "CreationRequestDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_request_date_time : Time?

        # The key attribute(s) of the stream's DynamoDB table.

        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)?

        # The shard ID of the item where the operation stopped, inclusive of the previous result set. Use this
        # value to start a new operation, excluding this value in the new request. If LastEvaluatedShardId is
        # empty, then the "last page" of results has been processed and there is currently no more data to be
        # retrieved. If LastEvaluatedShardId is not empty, it does not necessarily mean that there is more
        # data in the result set. The only way to know when you have reached the end of the result set is when
        # LastEvaluatedShardId is empty.

        @[JSON::Field(key: "LastEvaluatedShardId")]
        getter last_evaluated_shard_id : String?

        # The shards that comprise the stream.

        @[JSON::Field(key: "Shards")]
        getter shards : Array(Types::Shard)?

        # The Amazon Resource Name (ARN) for the stream.

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        # A timestamp, in ISO 8601 format, for this stream. Note that LatestStreamLabel is not a unique
        # identifier for the stream, because it is possible that a stream from another table might have the
        # same timestamp. However, the combination of the following three elements is guaranteed to be unique:
        # the Amazon Web Services customer ID. the table name the StreamLabel

        @[JSON::Field(key: "StreamLabel")]
        getter stream_label : String?

        # Indicates the current status of the stream: ENABLING - Streams is currently being enabled on the
        # DynamoDB table. ENABLED - the stream is enabled. DISABLING - Streams is currently being disabled on
        # the DynamoDB table. DISABLED - the stream is disabled.

        @[JSON::Field(key: "StreamStatus")]
        getter stream_status : String?

        # Indicates the format of the records within this stream: KEYS_ONLY - only the key attributes of items
        # that were modified in the DynamoDB table. NEW_IMAGE - entire items from the table, as they appeared
        # after they were modified. OLD_IMAGE - entire items from the table, as they appeared before they were
        # modified. NEW_AND_OLD_IMAGES - both the new and the old images of the items from the table.

        @[JSON::Field(key: "StreamViewType")]
        getter stream_view_type : String?

        # The DynamoDB table with which the stream is associated.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @creation_request_date_time : Time? = nil,
          @key_schema : Array(Types::KeySchemaElement)? = nil,
          @last_evaluated_shard_id : String? = nil,
          @shards : Array(Types::Shard)? = nil,
          @stream_arn : String? = nil,
          @stream_label : String? = nil,
          @stream_status : String? = nil,
          @stream_view_type : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      # A description of a single data modification that was performed on an item in a DynamoDB table.

      struct StreamRecord
        include JSON::Serializable

        # The approximate date and time when the stream record was created, in ISO 8601 format and rounded
        # down to the closest second.

        @[JSON::Field(key: "ApproximateCreationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter approximate_creation_date_time : Time?

        # The primary key attribute(s) for the DynamoDB item that was modified.

        @[JSON::Field(key: "Keys")]
        getter keys : Hash(String, Types::AttributeValue)?

        # The item in the DynamoDB table as it appeared after it was modified.

        @[JSON::Field(key: "NewImage")]
        getter new_image : Hash(String, Types::AttributeValue)?

        # The item in the DynamoDB table as it appeared before it was modified.

        @[JSON::Field(key: "OldImage")]
        getter old_image : Hash(String, Types::AttributeValue)?

        # The sequence number of the stream record.

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        # The size of the stream record, in bytes.

        @[JSON::Field(key: "SizeBytes")]
        getter size_bytes : Int64?

        # The type of data from the modified DynamoDB item that was captured in this stream record: KEYS_ONLY
        # - only the key attributes of the modified item. NEW_IMAGE - the entire item, as it appeared after it
        # was modified. OLD_IMAGE - the entire item, as it appeared before it was modified. NEW_AND_OLD_IMAGES
        # - both the new and the old item images of the item.

        @[JSON::Field(key: "StreamViewType")]
        getter stream_view_type : String?

        def initialize(
          @approximate_creation_date_time : Time? = nil,
          @keys : Hash(String, Types::AttributeValue)? = nil,
          @new_image : Hash(String, Types::AttributeValue)? = nil,
          @old_image : Hash(String, Types::AttributeValue)? = nil,
          @sequence_number : String? = nil,
          @size_bytes : Int64? = nil,
          @stream_view_type : String? = nil
        )
        end
      end

      # The operation attempted to read past the oldest stream record in a shard. In DynamoDB Streams, there
      # is a 24 hour limit on data retention. Stream records whose age exceeds this limit are subject to
      # removal (trimming) from the stream. You might receive a TrimmedDataAccessException if: You request a
      # shard iterator with a sequence number older than the trim point (24 hours). You obtain a shard
      # iterator, but before you use the iterator in a GetRecords request, a stream record in the shard
      # exceeds the 24 hour period and is trimmed. This causes the iterator to access a record that no
      # longer exists.

      struct TrimmedDataAccessException
        include JSON::Serializable

        # "The data you are trying to access has been trimmed.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
