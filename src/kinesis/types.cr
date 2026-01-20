require "json"
require "time"

module Aws
  module Kinesis
    module Types

      # Specifies that you do not have the permissions required to perform this operation.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input for AddTagsToStream .

      struct AddTagsToStreamInput
        include JSON::Serializable

        # A set of up to 50 key-value pairs to use to create the tags. A tag consists of a required key and an
        # optional value. You can add up to 50 tags per resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @tags : Hash(String, String),
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Output parameter of the GetRecords API. The existing child shard of the current shard.

      struct ChildShard
        include JSON::Serializable


        @[JSON::Field(key: "HashKeyRange")]
        getter hash_key_range : Types::HashKeyRange

        # The current shard that is the parent of the existing child shard.

        @[JSON::Field(key: "ParentShards")]
        getter parent_shards : Array(String)

        # The shard ID of the existing child shard of the current shard.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String

        def initialize(
          @hash_key_range : Types::HashKeyRange,
          @parent_shards : Array(String),
          @shard_id : String
        )
        end
      end

      # An object that represents the details of the consumer you registered. This type of object is
      # returned by RegisterStreamConsumer .

      struct Consumer
        include JSON::Serializable

        # When you register a consumer, Kinesis Data Streams generates an ARN for it. You need this ARN to be
        # able to call SubscribeToShard . If you delete a consumer and then create a new one with the same
        # name, it won't have the same ARN. That's because consumer ARNs contain the creation timestamp. This
        # is important to keep in mind if you have IAM policies that reference consumer ARNs.

        @[JSON::Field(key: "ConsumerARN")]
        getter consumer_arn : String


        @[JSON::Field(key: "ConsumerCreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter consumer_creation_timestamp : Time

        # The name of the consumer is something you choose when you register the consumer.

        @[JSON::Field(key: "ConsumerName")]
        getter consumer_name : String

        # A consumer can't read data while in the CREATING or DELETING states.

        @[JSON::Field(key: "ConsumerStatus")]
        getter consumer_status : String

        def initialize(
          @consumer_arn : String,
          @consumer_creation_timestamp : Time,
          @consumer_name : String,
          @consumer_status : String
        )
        end
      end

      # An object that represents the details of a registered consumer. This type of object is returned by
      # DescribeStreamConsumer .

      struct ConsumerDescription
        include JSON::Serializable

        # When you register a consumer, Kinesis Data Streams generates an ARN for it. You need this ARN to be
        # able to call SubscribeToShard . If you delete a consumer and then create a new one with the same
        # name, it won't have the same ARN. That's because consumer ARNs contain the creation timestamp. This
        # is important to keep in mind if you have IAM policies that reference consumer ARNs.

        @[JSON::Field(key: "ConsumerARN")]
        getter consumer_arn : String


        @[JSON::Field(key: "ConsumerCreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter consumer_creation_timestamp : Time

        # The name of the consumer is something you choose when you register the consumer.

        @[JSON::Field(key: "ConsumerName")]
        getter consumer_name : String

        # A consumer can't read data while in the CREATING or DELETING states.

        @[JSON::Field(key: "ConsumerStatus")]
        getter consumer_status : String

        # The ARN of the stream with which you registered the consumer.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        def initialize(
          @consumer_arn : String,
          @consumer_creation_timestamp : Time,
          @consumer_name : String,
          @consumer_status : String,
          @stream_arn : String
        )
        end
      end

      # Represents the input for CreateStream .

      struct CreateStreamInput
        include JSON::Serializable

        # A name to identify the stream. The stream name is scoped to the Amazon Web Services account used by
        # the application that creates the stream. It is also scoped by Amazon Web Services Region. That is,
        # two streams in two different Amazon Web Services accounts can have the same name. Two streams in the
        # same Amazon Web Services account but in two different Regions can also have the same name.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String

        # The maximum record size of a single record in kibibyte (KiB) that you can write to, and read from a
        # stream.

        @[JSON::Field(key: "MaxRecordSizeInKiB")]
        getter max_record_size_in_ki_b : Int32?

        # The number of shards that the stream will use. The throughput of the stream is a function of the
        # number of shards; more shards are required for greater provisioned throughput.

        @[JSON::Field(key: "ShardCount")]
        getter shard_count : Int32?

        # Indicates the capacity mode of the data stream. Currently, in Kinesis Data Streams, you can choose
        # between an on-demand capacity mode and a provisioned capacity mode for your data streams.

        @[JSON::Field(key: "StreamModeDetails")]
        getter stream_mode_details : Types::StreamModeDetails?

        # A set of up to 50 key-value pairs to use to create the tags. A tag consists of a required key and an
        # optional value.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The target warm throughput in MB/s that the stream should be scaled to handle. This represents the
        # throughput capacity that will be immediately available for write operations.

        @[JSON::Field(key: "WarmThroughputMiBps")]
        getter warm_throughput_mi_bps : Int32?

        def initialize(
          @stream_name : String,
          @max_record_size_in_ki_b : Int32? = nil,
          @shard_count : Int32? = nil,
          @stream_mode_details : Types::StreamModeDetails? = nil,
          @tags : Hash(String, String)? = nil,
          @warm_throughput_mi_bps : Int32? = nil
        )
        end
      end

      # Represents the input for DecreaseStreamRetentionPeriod .

      struct DecreaseStreamRetentionPeriodInput
        include JSON::Serializable

        # The new retention period of the stream, in hours. Must be less than the current retention period.

        @[JSON::Field(key: "RetentionPeriodHours")]
        getter retention_period_hours : Int32

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream to modify.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @retention_period_hours : Int32,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data stream or consumer.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Represents the input for DeleteStream .

      struct DeleteStreamInput
        include JSON::Serializable

        # If this parameter is unset ( null ) or if you set it to false , and the stream has registered
        # consumers, the call to DeleteStream fails with a ResourceInUseException .

        @[JSON::Field(key: "EnforceConsumerDeletion")]
        getter enforce_consumer_deletion : Bool?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream to delete.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @enforce_consumer_deletion : Bool? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct DeregisterStreamConsumerInput
        include JSON::Serializable

        # The ARN returned by Kinesis Data Streams when you registered the consumer. If you don't know the ARN
        # of the consumer that you want to deregister, you can use the ListStreamConsumers operation to get a
        # list of the descriptions of all the consumers that are currently registered with a given data
        # stream. The description of a consumer contains its ARN.

        @[JSON::Field(key: "ConsumerARN")]
        getter consumer_arn : String?

        # The name that you gave to the consumer.

        @[JSON::Field(key: "ConsumerName")]
        getter consumer_name : String?

        # The ARN of the Kinesis data stream that the consumer is registered with. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        def initialize(
          @consumer_arn : String? = nil,
          @consumer_name : String? = nil,
          @stream_arn : String? = nil
        )
        end
      end


      struct DescribeAccountSettingsInput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountSettingsOutput
        include JSON::Serializable

        # The current configuration of the minimum throughput billing commitment for your Amazon Web Services
        # account.

        @[JSON::Field(key: "MinimumThroughputBillingCommitment")]
        getter minimum_throughput_billing_commitment : Types::MinimumThroughputBillingCommitmentOutput?

        def initialize(
          @minimum_throughput_billing_commitment : Types::MinimumThroughputBillingCommitmentOutput? = nil
        )
        end
      end


      struct DescribeLimitsInput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeLimitsOutput
        include JSON::Serializable

        # Indicates the number of data streams with the on-demand capacity mode.

        @[JSON::Field(key: "OnDemandStreamCount")]
        getter on_demand_stream_count : Int32

        # The maximum number of data streams with the on-demand capacity mode.

        @[JSON::Field(key: "OnDemandStreamCountLimit")]
        getter on_demand_stream_count_limit : Int32

        # The number of open shards.

        @[JSON::Field(key: "OpenShardCount")]
        getter open_shard_count : Int32

        # The maximum number of shards.

        @[JSON::Field(key: "ShardLimit")]
        getter shard_limit : Int32

        def initialize(
          @on_demand_stream_count : Int32,
          @on_demand_stream_count_limit : Int32,
          @open_shard_count : Int32,
          @shard_limit : Int32
        )
        end
      end


      struct DescribeStreamConsumerInput
        include JSON::Serializable

        # The ARN returned by Kinesis Data Streams when you registered the consumer.

        @[JSON::Field(key: "ConsumerARN")]
        getter consumer_arn : String?

        # The name that you gave to the consumer.

        @[JSON::Field(key: "ConsumerName")]
        getter consumer_name : String?

        # The ARN of the Kinesis data stream that the consumer is registered with. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        def initialize(
          @consumer_arn : String? = nil,
          @consumer_name : String? = nil,
          @stream_arn : String? = nil
        )
        end
      end


      struct DescribeStreamConsumerOutput
        include JSON::Serializable

        # An object that represents the details of the consumer.

        @[JSON::Field(key: "ConsumerDescription")]
        getter consumer_description : Types::ConsumerDescription

        def initialize(
          @consumer_description : Types::ConsumerDescription
        )
        end
      end

      # Represents the input for DescribeStream .

      struct DescribeStreamInput
        include JSON::Serializable

        # The shard ID of the shard to start with. Specify this parameter to indicate that you want to
        # describe the stream starting with the shard whose ID immediately follows ExclusiveStartShardId . If
        # you don't specify this parameter, the default behavior for DescribeStream is to describe the stream
        # starting with the first shard in the stream.

        @[JSON::Field(key: "ExclusiveStartShardId")]
        getter exclusive_start_shard_id : String?

        # The maximum number of shards to return in a single call. The default value is 100. If you specify a
        # value greater than 100, at most 100 results are returned.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream to describe.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @exclusive_start_shard_id : String? = nil,
          @limit : Int32? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Represents the output for DescribeStream .

      struct DescribeStreamOutput
        include JSON::Serializable

        # The current status of the stream, the stream Amazon Resource Name (ARN), an array of shard objects
        # that comprise the stream, and whether there are more shards available.

        @[JSON::Field(key: "StreamDescription")]
        getter stream_description : Types::StreamDescription

        def initialize(
          @stream_description : Types::StreamDescription
        )
        end
      end


      struct DescribeStreamSummaryInput
        include JSON::Serializable

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream to describe.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct DescribeStreamSummaryOutput
        include JSON::Serializable

        # A StreamDescriptionSummary containing information about the stream.

        @[JSON::Field(key: "StreamDescriptionSummary")]
        getter stream_description_summary : Types::StreamDescriptionSummary

        def initialize(
          @stream_description_summary : Types::StreamDescriptionSummary
        )
        end
      end

      # Represents the input for DisableEnhancedMonitoring .

      struct DisableEnhancedMonitoringInput
        include JSON::Serializable

        # List of shard-level metrics to disable. The following are the valid shard-level metrics. The value "
        # ALL " disables every metric. IncomingBytes IncomingRecords OutgoingBytes OutgoingRecords
        # WriteProvisionedThroughputExceeded ReadProvisionedThroughputExceeded IteratorAgeMilliseconds ALL For
        # more information, see Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch in
        # the Amazon Kinesis Data Streams Developer Guide .

        @[JSON::Field(key: "ShardLevelMetrics")]
        getter shard_level_metrics : Array(String)

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the Kinesis data stream for which to disable enhanced monitoring.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @shard_level_metrics : Array(String),
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Represents the input for EnableEnhancedMonitoring .

      struct EnableEnhancedMonitoringInput
        include JSON::Serializable

        # List of shard-level metrics to enable. The following are the valid shard-level metrics. The value "
        # ALL " enables every metric. IncomingBytes IncomingRecords OutgoingBytes OutgoingRecords
        # WriteProvisionedThroughputExceeded ReadProvisionedThroughputExceeded IteratorAgeMilliseconds ALL For
        # more information, see Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch in
        # the Amazon Kinesis Data Streams Developer Guide .

        @[JSON::Field(key: "ShardLevelMetrics")]
        getter shard_level_metrics : Array(String)

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream for which to enable enhanced monitoring.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @shard_level_metrics : Array(String),
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Represents enhanced metrics types.

      struct EnhancedMetrics
        include JSON::Serializable

        # List of shard-level metrics. The following are the valid shard-level metrics. The value " ALL "
        # enhances every metric. IncomingBytes IncomingRecords OutgoingBytes OutgoingRecords
        # WriteProvisionedThroughputExceeded ReadProvisionedThroughputExceeded IteratorAgeMilliseconds ALL For
        # more information, see Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch in
        # the Amazon Kinesis Data Streams Developer Guide .

        @[JSON::Field(key: "ShardLevelMetrics")]
        getter shard_level_metrics : Array(String)?

        def initialize(
          @shard_level_metrics : Array(String)? = nil
        )
        end
      end

      # Represents the output for EnableEnhancedMonitoring and DisableEnhancedMonitoring .

      struct EnhancedMonitoringOutput
        include JSON::Serializable

        # Represents the current state of the metrics that are in the enhanced state before the operation.

        @[JSON::Field(key: "CurrentShardLevelMetrics")]
        getter current_shard_level_metrics : Array(String)?

        # Represents the list of all the metrics that would be in the enhanced state after the operation.

        @[JSON::Field(key: "DesiredShardLevelMetrics")]
        getter desired_shard_level_metrics : Array(String)?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the Kinesis data stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @current_shard_level_metrics : Array(String)? = nil,
          @desired_shard_level_metrics : Array(String)? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # The provided iterator exceeds the maximum age allowed.

      struct ExpiredIteratorException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The pagination token passed to the operation is expired.

      struct ExpiredNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input for GetRecords .

      struct GetRecordsInput
        include JSON::Serializable

        # The position in the shard from which you want to start sequentially reading data records. A shard
        # iterator specifies this position using the sequence number of a data record in the shard.

        @[JSON::Field(key: "ShardIterator")]
        getter shard_iterator : String

        # The maximum number of records to return. Specify a value of up to 10,000. If you specify a value
        # that is greater than 10,000, GetRecords throws InvalidArgumentException . The default value is
        # 10,000.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        def initialize(
          @shard_iterator : String,
          @limit : Int32? = nil,
          @stream_arn : String? = nil
        )
        end
      end

      # Represents the output for GetRecords .

      struct GetRecordsOutput
        include JSON::Serializable

        # The data records retrieved from the shard.

        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)

        # The list of the current shard's child shards, returned in the GetRecords API's response only when
        # the end of the current shard is reached.

        @[JSON::Field(key: "ChildShards")]
        getter child_shards : Array(Types::ChildShard)?

        # The number of milliseconds the GetRecords response is from the tip of the stream, indicating how far
        # behind current time the consumer is. A value of zero indicates that record processing is caught up,
        # and there are no new records to process at this moment.

        @[JSON::Field(key: "MillisBehindLatest")]
        getter millis_behind_latest : Int64?

        # The next position in the shard from which to start sequentially reading data records. If set to null
        # , the shard has been closed and the requested iterator does not return any more data.

        @[JSON::Field(key: "NextShardIterator")]
        getter next_shard_iterator : String?

        def initialize(
          @records : Array(Types::Record),
          @child_shards : Array(Types::ChildShard)? = nil,
          @millis_behind_latest : Int64? = nil,
          @next_shard_iterator : String? = nil
        )
        end
      end


      struct GetResourcePolicyInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data stream or consumer.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyOutput
        include JSON::Serializable

        # Details of the resource policy. This is formatted as a JSON string.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @policy : String
        )
        end
      end

      # Represents the input for GetShardIterator .

      struct GetShardIteratorInput
        include JSON::Serializable

        # The shard ID of the Kinesis Data Streams shard to get the iterator for.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String

        # Determines how the shard iterator is used to start reading data records from the shard. The
        # following are the valid Amazon Kinesis shard iterator types: AT_SEQUENCE_NUMBER - Start reading from
        # the position denoted by a specific sequence number, provided in the value StartingSequenceNumber .
        # AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by a specific sequence
        # number, provided in the value StartingSequenceNumber . AT_TIMESTAMP - Start reading from the
        # position denoted by a specific time stamp, provided in the value Timestamp . TRIM_HORIZON - Start
        # reading at the last untrimmed record in the shard in the system, which is the oldest data record in
        # the shard. LATEST - Start reading just after the most recent record in the shard, so that you always
        # read the most recent data in the shard.

        @[JSON::Field(key: "ShardIteratorType")]
        getter shard_iterator_type : String

        # The sequence number of the data record in the shard from which to start reading. Used with shard
        # iterator type AT_SEQUENCE_NUMBER and AFTER_SEQUENCE_NUMBER.

        @[JSON::Field(key: "StartingSequenceNumber")]
        getter starting_sequence_number : String?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the Amazon Kinesis data stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # The time stamp of the data record from which to start reading. Used with shard iterator type
        # AT_TIMESTAMP. A time stamp is the Unix epoch date with precision in milliseconds. For example,
        # 2016-04-04T19:58:46.480-00:00 or 1459799926.480 . If a record with this exact time stamp does not
        # exist, the iterator returned is for the next (later) record. If the time stamp is older than the
        # current trim horizon, the iterator returned is for the oldest untrimmed data record (TRIM_HORIZON).

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @shard_id : String,
          @shard_iterator_type : String,
          @starting_sequence_number : String? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Represents the output for GetShardIterator .

      struct GetShardIteratorOutput
        include JSON::Serializable

        # The position in the shard from which to start reading data records sequentially. A shard iterator
        # specifies this position using the sequence number of a data record in a shard.

        @[JSON::Field(key: "ShardIterator")]
        getter shard_iterator : String?

        def initialize(
          @shard_iterator : String? = nil
        )
        end
      end

      # The range of possible hash key values for the shard, which is a set of ordered contiguous positive
      # integers.

      struct HashKeyRange
        include JSON::Serializable

        # The ending hash key of the hash key range.

        @[JSON::Field(key: "EndingHashKey")]
        getter ending_hash_key : String

        # The starting hash key of the hash key range.

        @[JSON::Field(key: "StartingHashKey")]
        getter starting_hash_key : String

        def initialize(
          @ending_hash_key : String,
          @starting_hash_key : String
        )
        end
      end

      # Represents the input for IncreaseStreamRetentionPeriod .

      struct IncreaseStreamRetentionPeriodInput
        include JSON::Serializable

        # The new retention period of the stream, in hours. Must be more than the current retention period.

        @[JSON::Field(key: "RetentionPeriodHours")]
        getter retention_period_hours : Int32

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream to modify.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @retention_period_hours : Int32,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # The processing of the request failed because of an unknown error, exception, or failure.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A specified parameter exceeds its restrictions, is not supported, or can't be used. For more
      # information, see the returned message.

      struct InvalidArgumentException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The ciphertext references a key that doesn't exist or that you don't have access to.

      struct KMSAccessDeniedException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the specified customer master key (CMK) isn't enabled.

      struct KMSDisabledException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the state of the specified resource isn't valid for this request.
      # For more information, see How Key State Affects Use of a Customer Master Key in the Amazon Web
      # Services Key Management Service Developer Guide .

      struct KMSInvalidStateException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the specified entity or resource can't be found.

      struct KMSNotFoundException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Amazon Web Services access key ID needs a subscription for the service.

      struct KMSOptInRequired
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was denied due to request throttling. For more information about throttling, see Limits
      # in the Amazon Web Services Key Management Service Developer Guide .

      struct KMSThrottlingException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested resource exceeds the maximum number allowed, or the number of concurrent stream
      # requests exceeds the maximum number allowed.

      struct LimitExceededException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListShardsInput
        include JSON::Serializable

        # Specify this parameter to indicate that you want to list the shards starting with the shard whose ID
        # immediately follows ExclusiveStartShardId . If you don't specify this parameter, the default
        # behavior is for ListShards to list the shards starting with the first one in the stream. You cannot
        # specify this parameter if you specify NextToken .

        @[JSON::Field(key: "ExclusiveStartShardId")]
        getter exclusive_start_shard_id : String?

        # The maximum number of shards to return in a single call to ListShards . The maximum number of shards
        # to return in a single call. The default value is 1000. If you specify a value greater than 1000, at
        # most 1000 results are returned. When the number of shards to be listed is greater than the value of
        # MaxResults , the response contains a NextToken value that you can use in a subsequent call to
        # ListShards to list the next set of shards.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When the number of shards in the data stream is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # shards in the data stream, the response includes a pagination token named NextToken . You can
        # specify this NextToken value in a subsequent call to ListShards to list the next set of shards.
        # Don't specify StreamName or StreamCreationTimestamp if you specify NextToken because the latter
        # unambiguously identifies the stream. You can optionally specify a value for the MaxResults parameter
        # when you specify NextToken . If you specify a MaxResults value that is less than the number of
        # shards that the operation returns if you don't specify MaxResults , the response will contain a new
        # NextToken value. You can use the new NextToken value in a subsequent call to the ListShards
        # operation. Tokens expire after 300 seconds. When you obtain a value for NextToken in the response to
        # a call to ListShards , you have 300 seconds to use that value. If you specify an expired token in a
        # call to ListShards , you get ExpiredNextTokenException .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Enables you to filter out the response of the ListShards API. You can only specify one filter at a
        # time. If you use the ShardFilter parameter when invoking the ListShards API, the Type is the
        # required property and must be specified. If you specify the AT_TRIM_HORIZON , FROM_TRIM_HORIZON , or
        # AT_LATEST types, you do not need to specify either the ShardId or the Timestamp optional properties.
        # If you specify the AFTER_SHARD_ID type, you must also provide the value for the optional ShardId
        # property. The ShardId property is identical in fuctionality to the ExclusiveStartShardId parameter
        # of the ListShards API. When ShardId property is specified, the response includes the shards starting
        # with the shard whose ID immediately follows the ShardId that you provided. If you specify the
        # AT_TIMESTAMP or FROM_TIMESTAMP_ID type, you must also provide the value for the optional Timestamp
        # property. If you specify the AT_TIMESTAMP type, then all shards that were open at the provided
        # timestamp are returned. If you specify the FROM_TIMESTAMP type, then all shards starting from the
        # provided timestamp to TIP are returned.

        @[JSON::Field(key: "ShardFilter")]
        getter shard_filter : Types::ShardFilter?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # Specify this input parameter to distinguish data streams that have the same name. For example, if
        # you create a data stream and then delete it, and you later create another data stream with the same
        # name, you can use this input parameter to specify which of the two streams you want to list the
        # shards for. You cannot specify this parameter if you specify the NextToken parameter.

        @[JSON::Field(key: "StreamCreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stream_creation_timestamp : Time?

        # The name of the data stream whose shards you want to list. You cannot specify this parameter if you
        # specify the NextToken parameter.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @exclusive_start_shard_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shard_filter : Types::ShardFilter? = nil,
          @stream_arn : String? = nil,
          @stream_creation_timestamp : Time? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct ListShardsOutput
        include JSON::Serializable

        # When the number of shards in the data stream is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # shards in the data stream, the response includes a pagination token named NextToken . You can
        # specify this NextToken value in a subsequent call to ListShards to list the next set of shards. For
        # more information about the use of this pagination token when calling the ListShards operation, see
        # ListShardsInput$NextToken . Tokens expire after 300 seconds. When you obtain a value for NextToken
        # in the response to a call to ListShards , you have 300 seconds to use that value. If you specify an
        # expired token in a call to ListShards , you get ExpiredNextTokenException .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of JSON objects. Each object represents one shard and specifies the IDs of the shard, the
        # shard's parent, and the shard that's adjacent to the shard's parent. Each object also contains the
        # starting and ending hash keys and the starting and ending sequence numbers for the shard.

        @[JSON::Field(key: "Shards")]
        getter shards : Array(Types::Shard)?

        def initialize(
          @next_token : String? = nil,
          @shards : Array(Types::Shard)? = nil
        )
        end
      end


      struct ListStreamConsumersInput
        include JSON::Serializable

        # The ARN of the Kinesis data stream for which you want to list the registered consumers. For more
        # information, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        # The maximum number of consumers that you want a single call of ListStreamConsumers to return. The
        # default value is 100. If you specify a value greater than 100, at most 100 results are returned.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When the number of consumers that are registered with the data stream is greater than the default
        # value for the MaxResults parameter, or if you explicitly specify a value for MaxResults that is less
        # than the number of consumers that are registered with the data stream, the response includes a
        # pagination token named NextToken . You can specify this NextToken value in a subsequent call to
        # ListStreamConsumers to list the next set of registered consumers. Don't specify StreamName or
        # StreamCreationTimestamp if you specify NextToken because the latter unambiguously identifies the
        # stream. You can optionally specify a value for the MaxResults parameter when you specify NextToken .
        # If you specify a MaxResults value that is less than the number of consumers that the operation
        # returns if you don't specify MaxResults , the response will contain a new NextToken value. You can
        # use the new NextToken value in a subsequent call to the ListStreamConsumers operation to list the
        # next set of consumers. Tokens expire after 300 seconds. When you obtain a value for NextToken in the
        # response to a call to ListStreamConsumers , you have 300 seconds to use that value. If you specify
        # an expired token in a call to ListStreamConsumers , you get ExpiredNextTokenException .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specify this input parameter to distinguish data streams that have the same name. For example, if
        # you create a data stream and then delete it, and you later create another data stream with the same
        # name, you can use this input parameter to specify which of the two streams you want to list the
        # consumers for. You can't specify this parameter if you specify the NextToken parameter.

        @[JSON::Field(key: "StreamCreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stream_creation_timestamp : Time?

        def initialize(
          @stream_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @stream_creation_timestamp : Time? = nil
        )
        end
      end


      struct ListStreamConsumersOutput
        include JSON::Serializable

        # An array of JSON objects. Each object represents one registered consumer.

        @[JSON::Field(key: "Consumers")]
        getter consumers : Array(Types::Consumer)?

        # When the number of consumers that are registered with the data stream is greater than the default
        # value for the MaxResults parameter, or if you explicitly specify a value for MaxResults that is less
        # than the number of registered consumers, the response includes a pagination token named NextToken .
        # You can specify this NextToken value in a subsequent call to ListStreamConsumers to list the next
        # set of registered consumers. For more information about the use of this pagination token when
        # calling the ListStreamConsumers operation, see ListStreamConsumersInput$NextToken . Tokens expire
        # after 300 seconds. When you obtain a value for NextToken in the response to a call to
        # ListStreamConsumers , you have 300 seconds to use that value. If you specify an expired token in a
        # call to ListStreamConsumers , you get ExpiredNextTokenException .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @consumers : Array(Types::Consumer)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input for ListStreams .

      struct ListStreamsInput
        include JSON::Serializable

        # The name of the stream to start the list with.

        @[JSON::Field(key: "ExclusiveStartStreamName")]
        getter exclusive_start_stream_name : String?

        # The maximum number of streams to list. The default value is 100. If you specify a value greater than
        # 100, at most 100 results are returned.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @exclusive_start_stream_name : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output for ListStreams .

      struct ListStreamsOutput
        include JSON::Serializable

        # If set to true , there are more streams available to list.

        @[JSON::Field(key: "HasMoreStreams")]
        getter has_more_streams : Bool

        # The names of the streams that are associated with the Amazon Web Services account making the
        # ListStreams request.

        @[JSON::Field(key: "StreamNames")]
        getter stream_names : Array(String)


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "StreamSummaries")]
        getter stream_summaries : Array(Types::StreamSummary)?

        def initialize(
          @has_more_streams : Bool,
          @stream_names : Array(String),
          @next_token : String? = nil,
          @stream_summaries : Array(Types::StreamSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis resource for which to list tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # An array of tags associated with the specified Kinesis resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents the input for ListTagsForStream .

      struct ListTagsForStreamInput
        include JSON::Serializable

        # The key to use as the starting point for the list of tags. If this parameter is set,
        # ListTagsForStream gets all tags that occur after ExclusiveStartTagKey .

        @[JSON::Field(key: "ExclusiveStartTagKey")]
        getter exclusive_start_tag_key : String?

        # The number of tags to return. If this number is less than the total number of tags associated with
        # the stream, HasMoreTags is set to true . To list additional tags, set ExclusiveStartTagKey to the
        # last key in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @exclusive_start_tag_key : String? = nil,
          @limit : Int32? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Represents the output for ListTagsForStream .

      struct ListTagsForStreamOutput
        include JSON::Serializable

        # If set to true , more tags are available. To request additional tags, set ExclusiveStartTagKey to
        # the key of the last tag returned.

        @[JSON::Field(key: "HasMoreTags")]
        getter has_more_tags : Bool

        # A list of tags associated with StreamName , starting with the first tag after ExclusiveStartTagKey
        # and up to the specified Limit .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @has_more_tags : Bool,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Represents the input for MergeShards .

      struct MergeShardsInput
        include JSON::Serializable

        # The shard ID of the adjacent shard for the merge.

        @[JSON::Field(key: "AdjacentShardToMerge")]
        getter adjacent_shard_to_merge : String

        # The shard ID of the shard to combine with the adjacent shard for the merge.

        @[JSON::Field(key: "ShardToMerge")]
        getter shard_to_merge : String

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream for the merge.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @adjacent_shard_to_merge : String,
          @shard_to_merge : String,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Represents the request parameters for configuring minimum throughput billing commitment. Minimum
      # throughput billing commitments provide cost savings on on-demand data streams in exchange for
      # committing to a minimum level of throughput usage. Commitments have a minimum duration of 24 hours
      # that must be honored before they can be disabled. If you attempt to disable a commitment before the
      # minimum commitment period ends, the commitment will be scheduled for automatic disable at the
      # earliest allowed end time. You can cancel a pending disable by enabling the commitment again before
      # the earliest allowed end time.

      struct MinimumThroughputBillingCommitmentInput
        include JSON::Serializable

        # The desired status of the minimum throughput billing commitment.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Represents the current status of minimum throughput billing commitment for an account.

      struct MinimumThroughputBillingCommitmentOutput
        include JSON::Serializable

        # The current status of the minimum throughput billing commitment.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The earliest timestamp when the commitment can be ended.

        @[JSON::Field(key: "EarliestAllowedEndAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter earliest_allowed_end_at : Time?

        # The timestamp when the commitment was ended.

        @[JSON::Field(key: "EndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # The timestamp when the commitment was started.

        @[JSON::Field(key: "StartedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        def initialize(
          @status : String,
          @earliest_allowed_end_at : Time? = nil,
          @ended_at : Time? = nil,
          @started_at : Time? = nil
        )
        end
      end

      # The request rate for the stream is too high, or the requested data is too large for the available
      # throughput. Reduce the frequency or size of your requests. For more information, see Streams Limits
      # in the Amazon Kinesis Data Streams Developer Guide , and Error Retries and Exponential Backoff in
      # Amazon Web Services in the Amazon Web Services General Reference .

      struct ProvisionedThroughputExceededException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input for PutRecord .

      struct PutRecordInput
        include JSON::Serializable

        # The data blob to put into the record, which is base64-encoded when the blob is serialized. When the
        # data blob (the payload before base64-encoding) is added to the partition key size, the total size
        # must not exceed the maximum record size (1 MiB).

        @[JSON::Field(key: "Data")]
        getter data : Bytes

        # Determines which shard in the stream the data record is assigned to. Partition keys are Unicode
        # strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses
        # the partition key as input to a hash function that maps the partition key and associated data to a
        # specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer
        # values and to map associated data records to shards. As a result of this hashing mechanism, all data
        # records with the same partition key map to the same shard within the stream.

        @[JSON::Field(key: "PartitionKey")]
        getter partition_key : String

        # The hash value used to explicitly determine the shard the data record is assigned to by overriding
        # the partition key hash.

        @[JSON::Field(key: "ExplicitHashKey")]
        getter explicit_hash_key : String?

        # Guarantees strictly increasing sequence numbers, for puts from the same client and to the same
        # partition key. Usage: set the SequenceNumberForOrdering of record n to the sequence number of record
        # n-1 (as returned in the result when putting record n-1 ). If this parameter is not set, records are
        # coarsely ordered based on arrival time.

        @[JSON::Field(key: "SequenceNumberForOrdering")]
        getter sequence_number_for_ordering : String?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream to put the data record into.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @data : Bytes,
          @partition_key : String,
          @explicit_hash_key : String? = nil,
          @sequence_number_for_ordering : String? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Represents the output for PutRecord .

      struct PutRecordOutput
        include JSON::Serializable

        # The sequence number identifier that was assigned to the put data record. The sequence number for the
        # record is unique across all records in the stream. A sequence number is the identifier associated
        # with every record put into the stream.

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String

        # The shard ID of the shard where the data record was placed.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String

        # The encryption type to use on the record. This parameter can be one of the following values: NONE :
        # Do not encrypt the records in the stream. KMS : Use server-side encryption on the records in the
        # stream using a customer-managed Amazon Web Services KMS key.

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        def initialize(
          @sequence_number : String,
          @shard_id : String,
          @encryption_type : String? = nil
        )
        end
      end

      # A PutRecords request.

      struct PutRecordsInput
        include JSON::Serializable

        # The records associated with the request.

        @[JSON::Field(key: "Records")]
        getter records : Array(Types::PutRecordsRequestEntry)

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The stream name associated with the request.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @records : Array(Types::PutRecordsRequestEntry),
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # PutRecords results.

      struct PutRecordsOutput
        include JSON::Serializable

        # An array of successfully and unsuccessfully processed record results. A record that is successfully
        # added to a stream includes SequenceNumber and ShardId in the result. A record that fails to be added
        # to a stream includes ErrorCode and ErrorMessage in the result.

        @[JSON::Field(key: "Records")]
        getter records : Array(Types::PutRecordsResultEntry)

        # The encryption type used on the records. This parameter can be one of the following values: NONE :
        # Do not encrypt the records. KMS : Use server-side encryption on the records using a customer-managed
        # Amazon Web Services KMS key.

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # The number of unsuccessfully processed records in a PutRecords request.

        @[JSON::Field(key: "FailedRecordCount")]
        getter failed_record_count : Int32?

        def initialize(
          @records : Array(Types::PutRecordsResultEntry),
          @encryption_type : String? = nil,
          @failed_record_count : Int32? = nil
        )
        end
      end

      # Represents the output for PutRecords .

      struct PutRecordsRequestEntry
        include JSON::Serializable

        # The data blob to put into the record, which is base64-encoded when the blob is serialized. When the
        # data blob (the payload before base64-encoding) is added to the partition key size, the total size
        # must not exceed the maximum record size (1 MiB).

        @[JSON::Field(key: "Data")]
        getter data : Bytes

        # Determines which shard in the stream the data record is assigned to. Partition keys are Unicode
        # strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses
        # the partition key as input to a hash function that maps the partition key and associated data to a
        # specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer
        # values and to map associated data records to shards. As a result of this hashing mechanism, all data
        # records with the same partition key map to the same shard within the stream.

        @[JSON::Field(key: "PartitionKey")]
        getter partition_key : String

        # The hash value used to determine explicitly the shard that the data record is assigned to by
        # overriding the partition key hash.

        @[JSON::Field(key: "ExplicitHashKey")]
        getter explicit_hash_key : String?

        def initialize(
          @data : Bytes,
          @partition_key : String,
          @explicit_hash_key : String? = nil
        )
        end
      end

      # Represents the result of an individual record from a PutRecords request. A record that is
      # successfully added to a stream includes SequenceNumber and ShardId in the result. A record that
      # fails to be added to the stream includes ErrorCode and ErrorMessage in the result.

      struct PutRecordsResultEntry
        include JSON::Serializable

        # The error code for an individual record result. ErrorCodes can be either
        # ProvisionedThroughputExceededException or InternalFailure .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message for an individual record result. An ErrorCode value of
        # ProvisionedThroughputExceededException has an error message that includes the account ID, stream
        # name, and shard ID. An ErrorCode value of InternalFailure has the error message "Internal Service
        # Failure" .

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The sequence number for an individual record result.

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        # The shard ID for an individual record result.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @sequence_number : String? = nil,
          @shard_id : String? = nil
        )
        end
      end


      struct PutResourcePolicyInput
        include JSON::Serializable

        # Details of the resource policy. It must include the identity of the principal and the actions
        # allowed on this resource. This is formatted as a JSON string.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the data stream or consumer.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      # The unit of data of the Kinesis data stream, which is composed of a sequence number, a partition
      # key, and a data blob.

      struct Record
        include JSON::Serializable

        # The data blob. The data in the blob is both opaque and immutable to Kinesis Data Streams, which does
        # not inspect, interpret, or change the data in the blob in any way. When the data blob (the payload
        # before base64-encoding) is added to the partition key size, the total size must not exceed the
        # maximum record size (1 MiB).

        @[JSON::Field(key: "Data")]
        getter data : Bytes

        # Identifies which shard in the stream the data record is assigned to.

        @[JSON::Field(key: "PartitionKey")]
        getter partition_key : String

        # The unique identifier of the record within its shard.

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String

        # The approximate time that the record was inserted into the stream.

        @[JSON::Field(key: "ApproximateArrivalTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter approximate_arrival_timestamp : Time?

        # The encryption type used on the record. This parameter can be one of the following values: NONE : Do
        # not encrypt the records in the stream. KMS : Use server-side encryption on the records in the stream
        # using a customer-managed Amazon Web Services KMS key.

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        def initialize(
          @data : Bytes,
          @partition_key : String,
          @sequence_number : String,
          @approximate_arrival_timestamp : Time? = nil,
          @encryption_type : String? = nil
        )
        end
      end


      struct RegisterStreamConsumerInput
        include JSON::Serializable

        # For a given Kinesis data stream, each consumer must have a unique name. However, consumer names
        # don't have to be unique across data streams.

        @[JSON::Field(key: "ConsumerName")]
        getter consumer_name : String

        # The ARN of the Kinesis data stream that you want to register the consumer with. For more info, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        # A set of up to 50 key-value pairs. A tag consists of a required key and an optional value.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @consumer_name : String,
          @stream_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterStreamConsumerOutput
        include JSON::Serializable

        # An object that represents the details of the consumer you registered. When you register a consumer,
        # it gets an ARN that is generated by Kinesis Data Streams.

        @[JSON::Field(key: "Consumer")]
        getter consumer : Types::Consumer

        def initialize(
          @consumer : Types::Consumer
        )
        end
      end

      # Represents the input for RemoveTagsFromStream .

      struct RemoveTagsFromStreamInput
        include JSON::Serializable

        # A list of tag keys. Each corresponding tag is removed from the stream.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @tag_keys : Array(String),
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # The resource is not available for this operation. For successful operation, the resource must be in
      # the ACTIVE state.

      struct ResourceInUseException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested resource could not be found. The stream might not be specified correctly.

      struct ResourceNotFoundException
        include JSON::Serializable

        # A message that provides information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The range of possible sequence numbers for the shard.

      struct SequenceNumberRange
        include JSON::Serializable

        # The starting sequence number for the range.

        @[JSON::Field(key: "StartingSequenceNumber")]
        getter starting_sequence_number : String

        # The ending sequence number for the range. Shards that are in the OPEN state have an ending sequence
        # number of null .

        @[JSON::Field(key: "EndingSequenceNumber")]
        getter ending_sequence_number : String?

        def initialize(
          @starting_sequence_number : String,
          @ending_sequence_number : String? = nil
        )
        end
      end

      # A uniquely identified group of data records in a Kinesis data stream.

      struct Shard
        include JSON::Serializable

        # The range of possible hash key values for the shard, which is a set of ordered contiguous positive
        # integers.

        @[JSON::Field(key: "HashKeyRange")]
        getter hash_key_range : Types::HashKeyRange

        # The range of possible sequence numbers for the shard.

        @[JSON::Field(key: "SequenceNumberRange")]
        getter sequence_number_range : Types::SequenceNumberRange

        # The unique identifier of the shard within the stream.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String

        # The shard ID of the shard adjacent to the shard's parent.

        @[JSON::Field(key: "AdjacentParentShardId")]
        getter adjacent_parent_shard_id : String?

        # The shard ID of the shard's parent.

        @[JSON::Field(key: "ParentShardId")]
        getter parent_shard_id : String?

        def initialize(
          @hash_key_range : Types::HashKeyRange,
          @sequence_number_range : Types::SequenceNumberRange,
          @shard_id : String,
          @adjacent_parent_shard_id : String? = nil,
          @parent_shard_id : String? = nil
        )
        end
      end

      # The request parameter used to filter out the response of the ListShards API.

      struct ShardFilter
        include JSON::Serializable

        # The shard type specified in the ShardFilter parameter. This is a required property of the
        # ShardFilter parameter. You can specify the following valid values: AFTER_SHARD_ID - the response
        # includes all the shards, starting with the shard whose ID immediately follows the ShardId that you
        # provided. AT_TRIM_HORIZON - the response includes all the shards that were open at TRIM_HORIZON .
        # FROM_TRIM_HORIZON - (default), the response includes all the shards within the retention period of
        # the data stream (trim to tip). AT_LATEST - the response includes only the currently open shards of
        # the data stream. AT_TIMESTAMP - the response includes all shards whose start timestamp is less than
        # or equal to the given timestamp and end timestamp is greater than or equal to the given timestamp or
        # still open. FROM_TIMESTAMP - the response incldues all closed shards whose end timestamp is greater
        # than or equal to the given timestamp and also all open shards. Corrected to TRIM_HORIZON of the data
        # stream if FROM_TIMESTAMP is less than the TRIM_HORIZON value.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The exclusive start shardID speified in the ShardFilter parameter. This property can only be used if
        # the AFTER_SHARD_ID shard type is specified.

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String?

        # The timestamps specified in the ShardFilter parameter. A timestamp is a Unix epoch date with
        # precision in milliseconds. For example, 2016-04-04T19:58:46.480-00:00 or 1459799926.480. This
        # property can only be used if FROM_TIMESTAMP or AT_TIMESTAMP shard types are specified.

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @type : String,
          @shard_id : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Represents the input for SplitShard .

      struct SplitShardInput
        include JSON::Serializable

        # A hash key value for the starting hash key of one of the child shards created by the split. The hash
        # key range for a given shard constitutes a set of ordered contiguous positive integers. The value for
        # NewStartingHashKey must be in the range of hash keys being mapped into the shard. The
        # NewStartingHashKey hash key value and all higher hash key values in hash key range are distributed
        # to one of the child shards. All the lower hash key values in the range are distributed to the other
        # child shard.

        @[JSON::Field(key: "NewStartingHashKey")]
        getter new_starting_hash_key : String

        # The shard ID of the shard to split.

        @[JSON::Field(key: "ShardToSplit")]
        getter shard_to_split : String

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream for the shard split.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @new_starting_hash_key : String,
          @shard_to_split : String,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct StartStreamEncryptionInput
        include JSON::Serializable

        # The encryption type to use. The only valid value is KMS .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String

        # The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can
        # be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or
        # a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data
        # Streams by specifying the alias aws/kinesis . Key ARN example:
        # arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012 Alias ARN example:
        # arn:aws:kms:us-east-1:123456789012:alias/MyAliasName Globally unique key ID example:
        # 12345678-1234-1234-1234-123456789012 Alias name example: alias/MyAliasName Master key owned by
        # Kinesis Data Streams: alias/aws/kinesis

        @[JSON::Field(key: "KeyId")]
        getter key_id : String

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream for which to start encrypting records.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @encryption_type : String,
          @key_id : String,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # The starting position in the data stream from which to start streaming.

      struct StartingPosition
        include JSON::Serializable

        # You can set the starting position to one of the following values: AT_SEQUENCE_NUMBER : Start
        # streaming from the position denoted by the sequence number specified in the SequenceNumber field.
        # AFTER_SEQUENCE_NUMBER : Start streaming right after the position denoted by the sequence number
        # specified in the SequenceNumber field. AT_TIMESTAMP : Start streaming from the position denoted by
        # the time stamp specified in the Timestamp field. TRIM_HORIZON : Start streaming at the last
        # untrimmed record in the shard, which is the oldest data record in the shard. LATEST : Start
        # streaming just after the most recent record in the shard, so that you always read the most recent
        # data in the shard.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The sequence number of the data record in the shard from which to start streaming. To specify a
        # sequence number, set StartingPosition to AT_SEQUENCE_NUMBER or AFTER_SEQUENCE_NUMBER .

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        # The time stamp of the data record from which to start reading. To specify a time stamp, set
        # StartingPosition to Type AT_TIMESTAMP . A time stamp is the Unix epoch date with precision in
        # milliseconds. For example, 2016-04-04T19:58:46.480-00:00 or 1459799926.480 . If a record with this
        # exact time stamp does not exist, records will be streamed from the next (later) record. If the time
        # stamp is older than the current trim horizon, records will be streamed from the oldest untrimmed
        # data record ( TRIM_HORIZON ).

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @type : String,
          @sequence_number : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end


      struct StopStreamEncryptionInput
        include JSON::Serializable

        # The encryption type. The only valid value is KMS .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String

        # The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can
        # be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or
        # a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data
        # Streams by specifying the alias aws/kinesis . Key ARN example:
        # arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012 Alias ARN example:
        # arn:aws:kms:us-east-1:123456789012:alias/MyAliasName Globally unique key ID example:
        # 12345678-1234-1234-1234-123456789012 Alias name example: alias/MyAliasName Master key owned by
        # Kinesis Data Streams: alias/aws/kinesis

        @[JSON::Field(key: "KeyId")]
        getter key_id : String

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream on which to stop encrypting records.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @encryption_type : String,
          @key_id : String,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Represents the output for DescribeStream .

      struct StreamDescription
        include JSON::Serializable

        # Represents the current enhanced monitoring settings of the stream.

        @[JSON::Field(key: "EnhancedMonitoring")]
        getter enhanced_monitoring : Array(Types::EnhancedMetrics)

        # If set to true , more shards in the stream are available to describe.

        @[JSON::Field(key: "HasMoreShards")]
        getter has_more_shards : Bool

        # The current retention period, in hours. Minimum value of 24. Maximum value of 168.

        @[JSON::Field(key: "RetentionPeriodHours")]
        getter retention_period_hours : Int32

        # The shards that comprise the stream.

        @[JSON::Field(key: "Shards")]
        getter shards : Array(Types::Shard)

        # The Amazon Resource Name (ARN) for the stream being described.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        # The approximate time that the stream was created.

        @[JSON::Field(key: "StreamCreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stream_creation_timestamp : Time

        # The name of the stream being described.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String

        # The current status of the stream being described. The stream status is one of the following states:
        # CREATING - The stream is being created. Kinesis Data Streams immediately returns and sets
        # StreamStatus to CREATING . DELETING - The stream is being deleted. The specified stream is in the
        # DELETING state until Kinesis Data Streams completes the deletion. ACTIVE - The stream exists and is
        # ready for read and write operations or deletion. You should perform read and write operations only
        # on an ACTIVE stream. UPDATING - Shards in the stream are being merged or split. Read and write
        # operations continue to work while the stream is in the UPDATING state.

        @[JSON::Field(key: "StreamStatus")]
        getter stream_status : String

        # The server-side encryption type used on the stream. This parameter can be one of the following
        # values: NONE : Do not encrypt the records in the stream. KMS : Use server-side encryption on the
        # records in the stream using a customer-managed Amazon Web Services KMS key.

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can
        # be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name
        # prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the
        # alias aws/kinesis . Key ARN example:
        # arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012 Alias ARN example:
        # arn:aws:kms:us-east-1:123456789012:alias/MyAliasName Globally unique key ID example:
        # 12345678-1234-1234-1234-123456789012 Alias name example: alias/MyAliasName Master key owned by
        # Kinesis Data Streams: alias/aws/kinesis

        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data
        # Streams, you can choose between an on-demand capacity mode and a provisioned capacity mode for your
        # data streams.

        @[JSON::Field(key: "StreamModeDetails")]
        getter stream_mode_details : Types::StreamModeDetails?

        def initialize(
          @enhanced_monitoring : Array(Types::EnhancedMetrics),
          @has_more_shards : Bool,
          @retention_period_hours : Int32,
          @shards : Array(Types::Shard),
          @stream_arn : String,
          @stream_creation_timestamp : Time,
          @stream_name : String,
          @stream_status : String,
          @encryption_type : String? = nil,
          @key_id : String? = nil,
          @stream_mode_details : Types::StreamModeDetails? = nil
        )
        end
      end

      # Represents the output for DescribeStreamSummary

      struct StreamDescriptionSummary
        include JSON::Serializable

        # Represents the current enhanced monitoring settings of the stream.

        @[JSON::Field(key: "EnhancedMonitoring")]
        getter enhanced_monitoring : Array(Types::EnhancedMetrics)

        # The number of open shards in the stream.

        @[JSON::Field(key: "OpenShardCount")]
        getter open_shard_count : Int32

        # The current retention period, in hours.

        @[JSON::Field(key: "RetentionPeriodHours")]
        getter retention_period_hours : Int32

        # The Amazon Resource Name (ARN) for the stream being described.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        # The approximate time that the stream was created.

        @[JSON::Field(key: "StreamCreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stream_creation_timestamp : Time

        # The name of the stream being described.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String

        # The current status of the stream being described. The stream status is one of the following states:
        # CREATING - The stream is being created. Kinesis Data Streams immediately returns and sets
        # StreamStatus to CREATING . DELETING - The stream is being deleted. The specified stream is in the
        # DELETING state until Kinesis Data Streams completes the deletion. ACTIVE - The stream exists and is
        # ready for read and write operations or deletion. You should perform read and write operations only
        # on an ACTIVE stream. UPDATING - Shards in the stream are being merged or split. Read and write
        # operations continue to work while the stream is in the UPDATING state.

        @[JSON::Field(key: "StreamStatus")]
        getter stream_status : String

        # The number of enhanced fan-out consumers registered with the stream.

        @[JSON::Field(key: "ConsumerCount")]
        getter consumer_count : Int32?

        # The encryption type used. This value is one of the following: KMS NONE

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can
        # be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name
        # prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the
        # alias aws/kinesis . Key ARN example:
        # arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012 Alias ARN example:
        # arn:aws:kms:us-east-1:123456789012:alias/MyAliasName Globally unique key ID example:
        # 12345678-1234-1234-1234-123456789012 Alias name example: alias/MyAliasName Master key owned by
        # Kinesis Data Streams: alias/aws/kinesis

        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        # The maximum record size of a single record in kibibyte (KiB) that you can write to, and read from a
        # stream.

        @[JSON::Field(key: "MaxRecordSizeInKiB")]
        getter max_record_size_in_ki_b : Int32?

        # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data
        # Streams, you can choose between an on-demand ycapacity mode and a provisioned capacity mode for your
        # data streams.

        @[JSON::Field(key: "StreamModeDetails")]
        getter stream_mode_details : Types::StreamModeDetails?

        # The warm throughput in MB/s for the stream. This represents the throughput capacity that will be
        # immediately available for write operations.

        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::WarmThroughputObject?

        def initialize(
          @enhanced_monitoring : Array(Types::EnhancedMetrics),
          @open_shard_count : Int32,
          @retention_period_hours : Int32,
          @stream_arn : String,
          @stream_creation_timestamp : Time,
          @stream_name : String,
          @stream_status : String,
          @consumer_count : Int32? = nil,
          @encryption_type : String? = nil,
          @key_id : String? = nil,
          @max_record_size_in_ki_b : Int32? = nil,
          @stream_mode_details : Types::StreamModeDetails? = nil,
          @warm_throughput : Types::WarmThroughputObject? = nil
        )
        end
      end

      # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data
      # Streams, you can choose between an on-demand capacity mode and a provisioned capacity mode for your
      # data streams.

      struct StreamModeDetails
        include JSON::Serializable

        # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data
        # Streams, you can choose between an on-demand capacity mode and a provisioned capacity mode for your
        # data streams.

        @[JSON::Field(key: "StreamMode")]
        getter stream_mode : String

        def initialize(
          @stream_mode : String
        )
        end
      end

      # The summary of a stream.

      struct StreamSummary
        include JSON::Serializable

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        # The name of a stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String

        # The status of the stream.

        @[JSON::Field(key: "StreamStatus")]
        getter stream_status : String

        # The timestamp at which the stream was created.

        @[JSON::Field(key: "StreamCreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stream_creation_timestamp : Time?


        @[JSON::Field(key: "StreamModeDetails")]
        getter stream_mode_details : Types::StreamModeDetails?

        def initialize(
          @stream_arn : String,
          @stream_name : String,
          @stream_status : String,
          @stream_creation_timestamp : Time? = nil,
          @stream_mode_details : Types::StreamModeDetails? = nil
        )
        end
      end

      # After you call SubscribeToShard , Kinesis Data Streams sends events of this type over an HTTP/2
      # connection to your consumer.

      struct SubscribeToShardEvent
        include JSON::Serializable

        # Use this as SequenceNumber in the next call to SubscribeToShard , with StartingPosition set to
        # AT_SEQUENCE_NUMBER or AFTER_SEQUENCE_NUMBER . Use ContinuationSequenceNumber for checkpointing
        # because it captures your shard progress even when no data is written to the shard.

        @[JSON::Field(key: "ContinuationSequenceNumber")]
        getter continuation_sequence_number : String

        # The number of milliseconds the read records are from the tip of the stream, indicating how far
        # behind current time the consumer is. A value of zero indicates that record processing is caught up,
        # and there are no new records to process at this moment.

        @[JSON::Field(key: "MillisBehindLatest")]
        getter millis_behind_latest : Int64


        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)

        # The list of the child shards of the current shard, returned only at the end of the current shard.

        @[JSON::Field(key: "ChildShards")]
        getter child_shards : Array(Types::ChildShard)?

        def initialize(
          @continuation_sequence_number : String,
          @millis_behind_latest : Int64,
          @records : Array(Types::Record),
          @child_shards : Array(Types::ChildShard)? = nil
        )
        end
      end

      # This is a tagged union for all of the types of events an enhanced fan-out consumer can receive over
      # HTTP/2 after a call to SubscribeToShard .

      struct SubscribeToShardEventStream
        include JSON::Serializable

        # After you call SubscribeToShard , Kinesis Data Streams sends events of this type to your consumer.
        # For an example of how to handle these events, see Enhanced Fan-Out Using the Kinesis Data Streams
        # API .

        @[JSON::Field(key: "SubscribeToShardEvent")]
        getter subscribe_to_shard_event : Types::SubscribeToShardEvent

        # The processing of the request failed because of an unknown error, exception, or failure.

        @[JSON::Field(key: "InternalFailureException")]
        getter internal_failure_exception : Types::InternalFailureException?


        @[JSON::Field(key: "KMSAccessDeniedException")]
        getter kms_access_denied_exception : Types::KMSAccessDeniedException?


        @[JSON::Field(key: "KMSDisabledException")]
        getter kms_disabled_exception : Types::KMSDisabledException?


        @[JSON::Field(key: "KMSInvalidStateException")]
        getter kms_invalid_state_exception : Types::KMSInvalidStateException?


        @[JSON::Field(key: "KMSNotFoundException")]
        getter kms_not_found_exception : Types::KMSNotFoundException?


        @[JSON::Field(key: "KMSOptInRequired")]
        getter kms_opt_in_required : Types::KMSOptInRequired?


        @[JSON::Field(key: "KMSThrottlingException")]
        getter kms_throttling_exception : Types::KMSThrottlingException?


        @[JSON::Field(key: "ResourceInUseException")]
        getter resource_in_use_exception : Types::ResourceInUseException?


        @[JSON::Field(key: "ResourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?

        def initialize(
          @subscribe_to_shard_event : Types::SubscribeToShardEvent,
          @internal_failure_exception : Types::InternalFailureException? = nil,
          @kms_access_denied_exception : Types::KMSAccessDeniedException? = nil,
          @kms_disabled_exception : Types::KMSDisabledException? = nil,
          @kms_invalid_state_exception : Types::KMSInvalidStateException? = nil,
          @kms_not_found_exception : Types::KMSNotFoundException? = nil,
          @kms_opt_in_required : Types::KMSOptInRequired? = nil,
          @kms_throttling_exception : Types::KMSThrottlingException? = nil,
          @resource_in_use_exception : Types::ResourceInUseException? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil
        )
        end
      end


      struct SubscribeToShardInput
        include JSON::Serializable

        # For this parameter, use the value you obtained when you called RegisterStreamConsumer .

        @[JSON::Field(key: "ConsumerARN")]
        getter consumer_arn : String

        # The ID of the shard you want to subscribe to. To see a list of all the shards for a given stream,
        # use ListShards .

        @[JSON::Field(key: "ShardId")]
        getter shard_id : String

        # The starting position in the data stream from which to start streaming.

        @[JSON::Field(key: "StartingPosition")]
        getter starting_position : Types::StartingPosition

        def initialize(
          @consumer_arn : String,
          @shard_id : String,
          @starting_position : Types::StartingPosition
        )
        end
      end


      struct SubscribeToShardOutput
        include JSON::Serializable

        # The event stream that your consumer can use to read records from the shard.

        @[JSON::Field(key: "EventStream")]
        getter event_stream : Types::SubscribeToShardEventStream

        def initialize(
          @event_stream : Types::SubscribeToShardEventStream
        )
        end
      end

      # Metadata assigned to the stream or consumer, consisting of a key-value pair.

      struct Tag
        include JSON::Serializable

        # A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode letters,
        # digits, white space, _ . / = + - % @

        @[JSON::Field(key: "Key")]
        getter key : String

        # An optional string, typically used to describe or define the tag. Maximum length: 256 characters.
        # Valid characters: Unicode letters, digits, white space, _ . / = + - % @

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis resource to which to add tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # An array of tags to be added to the Kinesis resource. A tag consists of a required key and an
        # optional value. You can add up to 50 tags per resource. Tags may only contain Unicode letters,
        # digits, white space, or these symbols: _ . : / = + - @.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis resource from which to remove tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tag key-value pairs. Existing tags of the resource whose keys are members of this list
        # will be removed from the Kinesis resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateAccountSettingsInput
        include JSON::Serializable

        # Specifies the minimum throughput billing commitment configuration for your account.

        @[JSON::Field(key: "MinimumThroughputBillingCommitment")]
        getter minimum_throughput_billing_commitment : Types::MinimumThroughputBillingCommitmentInput

        def initialize(
          @minimum_throughput_billing_commitment : Types::MinimumThroughputBillingCommitmentInput
        )
        end
      end


      struct UpdateAccountSettingsOutput
        include JSON::Serializable

        # The updated configuration of the minimum throughput billing commitment for your account.

        @[JSON::Field(key: "MinimumThroughputBillingCommitment")]
        getter minimum_throughput_billing_commitment : Types::MinimumThroughputBillingCommitmentOutput?

        def initialize(
          @minimum_throughput_billing_commitment : Types::MinimumThroughputBillingCommitmentOutput? = nil
        )
        end
      end


      struct UpdateMaxRecordSizeInput
        include JSON::Serializable

        # The maximum record size of a single record in KiB that you can write to, and read from a stream.
        # Specify a value between 1024 and 10240 KiB (1 to 10 MiB). If you specify a value that is out of this
        # range, UpdateMaxRecordSize sends back an ValidationException message.

        @[JSON::Field(key: "MaxRecordSizeInKiB")]
        getter max_record_size_in_ki_b : Int32

        # The Amazon Resource Name (ARN) of the stream for the MaxRecordSize update.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        def initialize(
          @max_record_size_in_ki_b : Int32,
          @stream_arn : String? = nil
        )
        end
      end


      struct UpdateShardCountInput
        include JSON::Serializable

        # The scaling type. Uniform scaling creates shards of equal size.

        @[JSON::Field(key: "ScalingType")]
        getter scaling_type : String

        # The new number of shards. This value has the following default limits. By default, you cannot do the
        # following: Set this value to more than double your current shard count for a stream. Set this value
        # below half your current shard count for a stream. Set this value to more than 10000 shards in a
        # stream (the default limit for shard count per stream is 10000 per account per region), unless you
        # request a limit increase. Scale a stream with more than 10000 shards down unless you set this value
        # to less than 10000 shards.

        @[JSON::Field(key: "TargetShardCount")]
        getter target_shard_count : Int32

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @scaling_type : String,
          @target_shard_count : Int32,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct UpdateShardCountOutput
        include JSON::Serializable

        # The current number of shards.

        @[JSON::Field(key: "CurrentShardCount")]
        getter current_shard_count : Int32?

        # The ARN of the stream.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # The updated number of shards.

        @[JSON::Field(key: "TargetShardCount")]
        getter target_shard_count : Int32?

        def initialize(
          @current_shard_count : Int32? = nil,
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @target_shard_count : Int32? = nil
        )
        end
      end


      struct UpdateStreamModeInput
        include JSON::Serializable

        # Specifies the ARN of the data stream whose capacity mode you want to update.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data
        # Streams, you can choose between an on-demand capacity mode and a provisioned capacity mode for your
        # data streams.

        @[JSON::Field(key: "StreamModeDetails")]
        getter stream_mode_details : Types::StreamModeDetails

        # The target warm throughput in MB/s that the stream should be scaled to handle. This represents the
        # throughput capacity that will be immediately available for write operations. This field is only
        # valid when the stream mode is being updated to on-demand.

        @[JSON::Field(key: "WarmThroughputMiBps")]
        getter warm_throughput_mi_bps : Int32?

        def initialize(
          @stream_arn : String,
          @stream_mode_details : Types::StreamModeDetails,
          @warm_throughput_mi_bps : Int32? = nil
        )
        end
      end


      struct UpdateStreamWarmThroughputInput
        include JSON::Serializable

        # The target warm throughput in MB/s that the stream should be scaled to handle. This represents the
        # throughput capacity that will be immediately available for write operations.

        @[JSON::Field(key: "WarmThroughputMiBps")]
        getter warm_throughput_mi_bps : Int32

        # The ARN of the stream to be updated.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream to be updated.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @warm_throughput_mi_bps : Int32,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct UpdateStreamWarmThroughputOutput
        include JSON::Serializable

        # The ARN of the stream that was updated.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The name of the stream that was updated.

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # Specifies the updated warm throughput configuration for your data stream.

        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::WarmThroughputObject?

        def initialize(
          @stream_arn : String? = nil,
          @stream_name : String? = nil,
          @warm_throughput : Types::WarmThroughputObject? = nil
        )
        end
      end

      # Specifies that you tried to invoke this API for a data stream with the on-demand capacity mode. This
      # API is only supported for data streams with the provisioned capacity mode.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the warm throughput configuration on the stream. This is only present for On-Demand
      # Kinesis Data Streams in accounts that have MinimumThroughputBillingCommitment enabled.

      struct WarmThroughputObject
        include JSON::Serializable

        # The current warm throughput value on the stream. This is the write throughput in MiBps that the
        # stream is currently scaled to handle.

        @[JSON::Field(key: "CurrentMiBps")]
        getter current_mi_bps : Int32?

        # The target warm throughput value on the stream. This indicates that the stream is currently scaling
        # towards this target value.

        @[JSON::Field(key: "TargetMiBps")]
        getter target_mi_bps : Int32?

        def initialize(
          @current_mi_bps : Int32? = nil,
          @target_mi_bps : Int32? = nil
        )
        end
      end
    end
  end
end
