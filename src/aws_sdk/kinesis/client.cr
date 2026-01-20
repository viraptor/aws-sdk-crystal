module AwsSdk
  module Kinesis
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Adds or updates tags for the specified Kinesis data stream. You can assign up to 50 tags to a data
      # stream. When invoking this API, you must use either the StreamARN or the StreamName parameter, or
      # both. It is recommended that you use the StreamARN input parameter when you invoke this API. If tags
      # have already been assigned to the stream, AddTagsToStream overwrites any existing tags that
      # correspond to the specified tag keys. AddTagsToStream has a limit of five transactions per second
      # per account.

      def add_tags_to_stream(
        tags : Hash(String, String),
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::AddTagsToStreamInput.new(tags: tags, stream_arn: stream_arn, stream_name: stream_name)
        add_tags_to_stream(input)
      end

      def add_tags_to_stream(input : Types::AddTagsToStreamInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a Kinesis data stream. A stream captures and transports data records that are continuously
      # emitted from different data sources or producers . Scale-out within a stream is explicitly supported
      # by means of shards, which are uniquely identified groups of data records in a stream. You can create
      # your data stream using either on-demand or provisioned capacity mode. Data streams with an on-demand
      # mode require no capacity planning and automatically scale to handle gigabytes of write and read
      # throughput per minute. With the on-demand mode, Kinesis Data Streams automatically manages the
      # shards in order to provide the necessary throughput. If you'd still like to proactively scale your
      # on-demand data stream’s capacity, you can unlock the warm throughput feature for on-demand data
      # streams by enabling MinimumThroughputBillingCommitment for your account. Once your account has
      # MinimumThroughputBillingCommitment enabled, you can specify the warm throughput in MiB per second
      # that your stream can support in writes. For the data streams with a provisioned mode, you must
      # specify the number of shards for the data stream. Each shard can support reads up to five
      # transactions per second, up to a maximum data read total of 2 MiB per second. Each shard can support
      # writes up to 1,000 records per second, up to a maximum data write total of 1 MiB per second. If the
      # amount of data input increases or decreases, you can add or remove shards. The stream name
      # identifies the stream. The name is scoped to the Amazon Web Services account used by the
      # application. It is also scoped by Amazon Web Services Region. That is, two streams in two different
      # accounts can have the same name, and two streams in the same account, but in two different Regions,
      # can have the same name. CreateStream is an asynchronous operation. Upon receiving a CreateStream
      # request, Kinesis Data Streams immediately returns and sets the stream status to CREATING . After the
      # stream is created, Kinesis Data Streams sets the stream status to ACTIVE . You should perform read
      # and write operations only on an ACTIVE stream. You receive a LimitExceededException when making a
      # CreateStream request when you try to do one of the following: Have more than five streams in the
      # CREATING state at any point in time. Create more shards than are authorized for your account. For
      # the default shard or on-demand throughput limits for an Amazon Web Services account, see Amazon
      # Kinesis Data Streams Limits in the Amazon Kinesis Data Streams Developer Guide . To increase this
      # limit, contact Amazon Web Services Support . You can use DescribeStreamSummary to check the stream
      # status, which is returned in StreamStatus . CreateStream has a limit of five transactions per second
      # per account. You can add tags to the stream when making a CreateStream request by setting the Tags
      # parameter. If you pass the Tags parameter, in addition to having the kinesis:CreateStream
      # permission, you must also have the kinesis:AddTagsToStream permission for the stream that will be
      # created. The kinesis:TagResource permission won’t work to tag streams on creation. Tags will take
      # effect from the CREATING status of the stream, but you can't make any updates to the tags until the
      # stream is in ACTIVE state.

      def create_stream(
        stream_name : String,
        max_record_size_in_ki_b : Int32? = nil,
        shard_count : Int32? = nil,
        stream_mode_details : Types::StreamModeDetails? = nil,
        tags : Hash(String, String)? = nil,
        warm_throughput_mi_bps : Int32? = nil
      ) : Nil

        input = Types::CreateStreamInput.new(stream_name: stream_name, max_record_size_in_ki_b: max_record_size_in_ki_b, shard_count: shard_count, stream_mode_details: stream_mode_details, tags: tags, warm_throughput_mi_bps: warm_throughput_mi_bps)
        create_stream(input)
      end

      def create_stream(input : Types::CreateStreamInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::CREATE_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Decreases the Kinesis data stream's retention period, which is the length of time data records are
      # accessible after they are added to the stream. The minimum value of a stream's retention period is
      # 24 hours. When invoking this API, you must use either the StreamARN or the StreamName parameter, or
      # both. It is recommended that you use the StreamARN input parameter when you invoke this API. This
      # operation may result in lost data. For example, if the stream's retention period is 48 hours and is
      # decreased to 24 hours, any data already in the stream that is older than 24 hours is inaccessible.

      def decrease_stream_retention_period(
        retention_period_hours : Int32,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::DecreaseStreamRetentionPeriodInput.new(retention_period_hours: retention_period_hours, stream_arn: stream_arn, stream_name: stream_name)
        decrease_stream_retention_period(input)
      end

      def decrease_stream_retention_period(input : Types::DecreaseStreamRetentionPeriodInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DECREASE_STREAM_RETENTION_PERIOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a policy for the specified data stream or consumer. Request patterns can be one of the
      # following: Data stream pattern: arn:aws.*:kinesis:.*:\d{12}:.*stream/\S+ Consumer pattern:
      # ^(arn):aws.*:kinesis:.*:\d{12}:.*stream\/[a-zA-Z0-9_.-]+\/consumer\/[a-zA-Z0-9_.-]+:[0-9]+

      def delete_resource_policy(
        resource_arn : String
      ) : Nil

        input = Types::DeleteResourcePolicyInput.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a Kinesis data stream and all its shards and data. You must shut down any applications that
      # are operating on the stream before you delete the stream. If an application attempts to operate on a
      # deleted stream, it receives the exception ResourceNotFoundException . When invoking this API, you
      # must use either the StreamARN or the StreamName parameter, or both. It is recommended that you use
      # the StreamARN input parameter when you invoke this API. If the stream is in the ACTIVE state, you
      # can delete it. After a DeleteStream request, the specified stream is in the DELETING state until
      # Kinesis Data Streams completes the deletion. Note: Kinesis Data Streams might continue to accept
      # data read and write operations, such as PutRecord , PutRecords , and GetRecords , on a stream in the
      # DELETING state until the stream deletion is complete. When you delete a stream, any shards in that
      # stream are also deleted, and any tags are dissociated from the stream. You can use the
      # DescribeStreamSummary operation to check the state of the stream, which is returned in StreamStatus
      # . DeleteStream has a limit of five transactions per second per account.

      def delete_stream(
        enforce_consumer_deletion : Bool? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::DeleteStreamInput.new(enforce_consumer_deletion: enforce_consumer_deletion, stream_arn: stream_arn, stream_name: stream_name)
        delete_stream(input)
      end

      def delete_stream(input : Types::DeleteStreamInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # To deregister a consumer, provide its ARN. Alternatively, you can provide the ARN of the data stream
      # and the name you gave the consumer when you registered it. You may also provide all three
      # parameters, as long as they don't conflict with each other. If you don't know the name or ARN of the
      # consumer that you want to deregister, you can use the ListStreamConsumers operation to get a list of
      # the descriptions of all the consumers that are currently registered with a given data stream. The
      # description of a consumer contains its name and ARN. This operation has a limit of five transactions
      # per second per stream.

      def deregister_stream_consumer(
        consumer_arn : String? = nil,
        consumer_name : String? = nil,
        stream_arn : String? = nil
      ) : Nil

        input = Types::DeregisterStreamConsumerInput.new(consumer_arn: consumer_arn, consumer_name: consumer_name, stream_arn: stream_arn)
        deregister_stream_consumer(input)
      end

      def deregister_stream_consumer(input : Types::DeregisterStreamConsumerInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_STREAM_CONSUMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Describes the account-level settings for Amazon Kinesis Data Streams. This operation returns
      # information about the minimum throughput billing commitments and other account-level configurations.
      # This API has a call limit of 5 transactions per second (TPS) for each Amazon Web Services account.
      # TPS over 5 will initiate the LimitExceededException .

      def describe_account_settings : Types::DescribeAccountSettingsOutput
        input = Types::DescribeAccountSettingsInput.new
        describe_account_settings(input)
      end

      def describe_account_settings(input : Types::DescribeAccountSettingsInput) : Types::DescribeAccountSettingsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountSettingsOutput, "DescribeAccountSettings")
      end

      # Describes the shard limits and usage for the account. If you update your account limits, the old
      # limits might be returned for a few minutes. This operation has a limit of one transaction per second
      # per account.

      def describe_limits : Types::DescribeLimitsOutput
        input = Types::DescribeLimitsInput.new
        describe_limits(input)
      end

      def describe_limits(input : Types::DescribeLimitsInput) : Types::DescribeLimitsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLimitsOutput, "DescribeLimits")
      end

      # Describes the specified Kinesis data stream. This API has been revised. It's highly recommended that
      # you use the DescribeStreamSummary API to get a summarized description of the specified Kinesis data
      # stream and the ListShards API to list the shards in a specified data stream and obtain information
      # about each shard. When invoking this API, you must use either the StreamARN or the StreamName
      # parameter, or both. It is recommended that you use the StreamARN input parameter when you invoke
      # this API. The information returned includes the stream name, Amazon Resource Name (ARN), creation
      # time, enhanced metric configuration, and shard map. The shard map is an array of shard objects. For
      # each shard object, there is the hash key and sequence number ranges that the shard spans, and the
      # IDs of any earlier shards that played in a role in creating the shard. Every record ingested in the
      # stream is identified by a sequence number, which is assigned when the record is put into the stream.
      # You can limit the number of shards returned by each call. For more information, see Retrieving
      # Shards from a Stream in the Amazon Kinesis Data Streams Developer Guide . There are no guarantees
      # about the chronological order shards returned. To process shards in chronological order, use the ID
      # of the parent shard to track the lineage to the oldest shard. This operation has a limit of 10
      # transactions per second per account.

      def describe_stream(
        exclusive_start_shard_id : String? = nil,
        limit : Int32? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::DescribeStreamOutput

        input = Types::DescribeStreamInput.new(exclusive_start_shard_id: exclusive_start_shard_id, limit: limit, stream_arn: stream_arn, stream_name: stream_name)
        describe_stream(input)
      end

      def describe_stream(input : Types::DescribeStreamInput) : Types::DescribeStreamOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStreamOutput, "DescribeStream")
      end

      # To get the description of a registered consumer, provide the ARN of the consumer. Alternatively, you
      # can provide the ARN of the data stream and the name you gave the consumer when you registered it.
      # You may also provide all three parameters, as long as they don't conflict with each other. If you
      # don't know the name or ARN of the consumer that you want to describe, you can use the
      # ListStreamConsumers operation to get a list of the descriptions of all the consumers that are
      # currently registered with a given data stream. This operation has a limit of 20 transactions per
      # second per stream. When making a cross-account call with DescribeStreamConsumer , make sure to
      # provide the ARN of the consumer.

      def describe_stream_consumer(
        consumer_arn : String? = nil,
        consumer_name : String? = nil,
        stream_arn : String? = nil
      ) : Types::DescribeStreamConsumerOutput

        input = Types::DescribeStreamConsumerInput.new(consumer_arn: consumer_arn, consumer_name: consumer_name, stream_arn: stream_arn)
        describe_stream_consumer(input)
      end

      def describe_stream_consumer(input : Types::DescribeStreamConsumerInput) : Types::DescribeStreamConsumerOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STREAM_CONSUMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStreamConsumerOutput, "DescribeStreamConsumer")
      end

      # Provides a summarized description of the specified Kinesis data stream without the shard list. When
      # invoking this API, you must use either the StreamARN or the StreamName parameter, or both. It is
      # recommended that you use the StreamARN input parameter when you invoke this API. The information
      # returned includes the stream name, Amazon Resource Name (ARN), status, record retention period,
      # approximate creation time, monitoring, encryption details, and open shard count.
      # DescribeStreamSummary has a limit of 20 transactions per second per account.

      def describe_stream_summary(
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::DescribeStreamSummaryOutput

        input = Types::DescribeStreamSummaryInput.new(stream_arn: stream_arn, stream_name: stream_name)
        describe_stream_summary(input)
      end

      def describe_stream_summary(input : Types::DescribeStreamSummaryInput) : Types::DescribeStreamSummaryOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STREAM_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStreamSummaryOutput, "DescribeStreamSummary")
      end

      # Disables enhanced monitoring. When invoking this API, you must use either the StreamARN or the
      # StreamName parameter, or both. It is recommended that you use the StreamARN input parameter when you
      # invoke this API.

      def disable_enhanced_monitoring(
        shard_level_metrics : Array(String),
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::EnhancedMonitoringOutput

        input = Types::DisableEnhancedMonitoringInput.new(shard_level_metrics: shard_level_metrics, stream_arn: stream_arn, stream_name: stream_name)
        disable_enhanced_monitoring(input)
      end

      def disable_enhanced_monitoring(input : Types::DisableEnhancedMonitoringInput) : Types::EnhancedMonitoringOutput
        request = Protocol::JsonRpc.build_request(Model::DISABLE_ENHANCED_MONITORING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnhancedMonitoringOutput, "DisableEnhancedMonitoring")
      end

      # Enables enhanced Kinesis data stream monitoring for shard-level metrics. When invoking this API, you
      # must use either the StreamARN or the StreamName parameter, or both. It is recommended that you use
      # the StreamARN input parameter when you invoke this API.

      def enable_enhanced_monitoring(
        shard_level_metrics : Array(String),
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::EnhancedMonitoringOutput

        input = Types::EnableEnhancedMonitoringInput.new(shard_level_metrics: shard_level_metrics, stream_arn: stream_arn, stream_name: stream_name)
        enable_enhanced_monitoring(input)
      end

      def enable_enhanced_monitoring(input : Types::EnableEnhancedMonitoringInput) : Types::EnhancedMonitoringOutput
        request = Protocol::JsonRpc.build_request(Model::ENABLE_ENHANCED_MONITORING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnhancedMonitoringOutput, "EnableEnhancedMonitoring")
      end

      # Gets data records from a Kinesis data stream's shard. When invoking this API, you must use either
      # the StreamARN or the StreamName parameter, or both. It is recommended that you use the StreamARN
      # input parameter when you invoke this API. Specify a shard iterator using the ShardIterator
      # parameter. The shard iterator specifies the position in the shard from which you want to start
      # reading data records sequentially. If there are no records available in the portion of the shard
      # that the iterator points to, GetRecords returns an empty list. It might take multiple calls to get
      # to a portion of the shard that contains records. You can scale by provisioning multiple shards per
      # stream while considering service limits (for more information, see Amazon Kinesis Data Streams
      # Limits in the Amazon Kinesis Data Streams Developer Guide ). Your application should have one thread
      # per shard, each reading continuously from its stream. To read from a stream continually, call
      # GetRecords in a loop. Use GetShardIterator to get the shard iterator to specify in the first
      # GetRecords call. GetRecords returns a new shard iterator in NextShardIterator . Specify the shard
      # iterator returned in NextShardIterator in subsequent calls to GetRecords . If the shard has been
      # closed, the shard iterator can't return more data and GetRecords returns null in NextShardIterator .
      # You can terminate the loop when the shard is closed, or when the shard iterator reaches the record
      # with the sequence number or other attribute that marks it as the last record to process. Each data
      # record can be up to 1 MiB in size, and each shard can read up to 2 MiB per second. You can ensure
      # that your calls don't exceed the maximum supported size or throughput by using the Limit parameter
      # to specify the maximum number of records that GetRecords can return. Consider your average record
      # size when determining this limit. The maximum number of records that can be returned per call is
      # 10,000. The size of the data returned by GetRecords varies depending on the utilization of the
      # shard. It is recommended that consumer applications retrieve records via the GetRecords command
      # using the 5 TPS limit to remain caught up. Retrieving records less frequently can lead to consumer
      # applications falling behind. The maximum size of data that GetRecords can return is 10 MiB. If a
      # call returns this amount of data, subsequent calls made within the next 5 seconds throw
      # ProvisionedThroughputExceededException . If there is insufficient provisioned throughput on the
      # stream, subsequent calls made within the next 1 second throw ProvisionedThroughputExceededException
      # . GetRecords doesn't return any data when it throws an exception. For this reason, we recommend that
      # you wait 1 second between calls to GetRecords . However, it's possible that the application will get
      # exceptions for longer than 1 second. To detect whether the application is falling behind in
      # processing, you can use the MillisBehindLatest response attribute. You can also monitor the stream
      # using CloudWatch metrics and other mechanisms (see Monitoring in the Amazon Kinesis Data Streams
      # Developer Guide ). Each Amazon Kinesis record includes a value, ApproximateArrivalTimestamp , that
      # is set when a stream successfully receives and stores a record. This is commonly referred to as a
      # server-side time stamp, whereas a client-side time stamp is set when a data producer creates or
      # sends the record to a stream (a data producer is any data source putting data records into a stream,
      # for example with PutRecords ). The time stamp has millisecond precision. There are no guarantees
      # about the time stamp accuracy, or that the time stamp is always increasing. For example, records in
      # a shard or across a stream might have time stamps that are out of order. This operation has a limit
      # of five transactions per second per shard.

      def get_records(
        shard_iterator : String,
        limit : Int32? = nil,
        stream_arn : String? = nil
      ) : Types::GetRecordsOutput

        input = Types::GetRecordsInput.new(shard_iterator: shard_iterator, limit: limit, stream_arn: stream_arn)
        get_records(input)
      end

      def get_records(input : Types::GetRecordsInput) : Types::GetRecordsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRecordsOutput, "GetRecords")
      end

      # Returns a policy attached to the specified data stream or consumer. Request patterns can be one of
      # the following: Data stream pattern: arn:aws.*:kinesis:.*:\d{12}:.*stream/\S+ Consumer pattern:
      # ^(arn):aws.*:kinesis:.*:\d{12}:.*stream\/[a-zA-Z0-9_.-]+\/consumer\/[a-zA-Z0-9_.-]+:[0-9]+

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyOutput

        input = Types::GetResourcePolicyInput.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyInput) : Types::GetResourcePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyOutput, "GetResourcePolicy")
      end

      # Gets an Amazon Kinesis shard iterator. A shard iterator expires 5 minutes after it is returned to
      # the requester. When invoking this API, you must use either the StreamARN or the StreamName
      # parameter, or both. It is recommended that you use the StreamARN input parameter when you invoke
      # this API. A shard iterator specifies the shard position from which to start reading data records
      # sequentially. The position is specified using the sequence number of a data record in a shard. A
      # sequence number is the identifier associated with every record ingested in the stream, and is
      # assigned when a record is put into the stream. Each stream has one or more shards. You must specify
      # the shard iterator type. For example, you can set the ShardIteratorType parameter to read exactly
      # from the position denoted by a specific sequence number by using the AT_SEQUENCE_NUMBER shard
      # iterator type. Alternatively, the parameter can read right after the sequence number by using the
      # AFTER_SEQUENCE_NUMBER shard iterator type, using sequence numbers returned by earlier calls to
      # PutRecord , PutRecords , GetRecords , or DescribeStream . In the request, you can specify the shard
      # iterator type AT_TIMESTAMP to read records from an arbitrary point in time, TRIM_HORIZON to cause
      # ShardIterator to point to the last untrimmed record in the shard in the system (the oldest data
      # record in the shard), or LATEST so that you always read the most recent data in the shard. When you
      # read repeatedly from a stream, use a GetShardIterator request to get the first shard iterator for
      # use in your first GetRecords request and for subsequent reads use the shard iterator returned by the
      # GetRecords request in NextShardIterator . A new shard iterator is returned by every GetRecords
      # request in NextShardIterator , which you use in the ShardIterator parameter of the next GetRecords
      # request. If a GetShardIterator request is made too often, you receive a
      # ProvisionedThroughputExceededException . For more information about throughput limits, see
      # GetRecords , and Streams Limits in the Amazon Kinesis Data Streams Developer Guide . If the shard is
      # closed, GetShardIterator returns a valid iterator for the last sequence number of the shard. A shard
      # can be closed as a result of using SplitShard or MergeShards . GetShardIterator has a limit of five
      # transactions per second per account per open shard.

      def get_shard_iterator(
        shard_id : String,
        shard_iterator_type : String,
        starting_sequence_number : String? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil,
        timestamp : Time? = nil
      ) : Types::GetShardIteratorOutput

        input = Types::GetShardIteratorInput.new(shard_id: shard_id, shard_iterator_type: shard_iterator_type, starting_sequence_number: starting_sequence_number, stream_arn: stream_arn, stream_name: stream_name, timestamp: timestamp)
        get_shard_iterator(input)
      end

      def get_shard_iterator(input : Types::GetShardIteratorInput) : Types::GetShardIteratorOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SHARD_ITERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetShardIteratorOutput, "GetShardIterator")
      end

      # Increases the Kinesis data stream's retention period, which is the length of time data records are
      # accessible after they are added to the stream. The maximum value of a stream's retention period is
      # 8760 hours (365 days). When invoking this API, you must use either the StreamARN or the StreamName
      # parameter, or both. It is recommended that you use the StreamARN input parameter when you invoke
      # this API. If you choose a longer stream retention period, this operation increases the time period
      # during which records that have not yet expired are accessible. However, it does not make previous,
      # expired data (older than the stream's previous retention period) accessible after the operation has
      # been called. For example, if a stream's retention period is set to 24 hours and is increased to 168
      # hours, any data that is older than 24 hours remains inaccessible to consumer applications.

      def increase_stream_retention_period(
        retention_period_hours : Int32,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::IncreaseStreamRetentionPeriodInput.new(retention_period_hours: retention_period_hours, stream_arn: stream_arn, stream_name: stream_name)
        increase_stream_retention_period(input)
      end

      def increase_stream_retention_period(input : Types::IncreaseStreamRetentionPeriodInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::INCREASE_STREAM_RETENTION_PERIOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Lists the shards in a stream and provides information about each shard. This operation has a limit
      # of 1000 transactions per second per data stream. When invoking this API, you must use either the
      # StreamARN or the StreamName parameter, or both. It is recommended that you use the StreamARN input
      # parameter when you invoke this API. This action does not list expired shards. For information about
      # expired shards, see Data Routing, Data Persistence, and Shard State after a Reshard . This API is a
      # new operation that is used by the Amazon Kinesis Client Library (KCL). If you have a fine-grained
      # IAM policy that only allows specific operations, you must update your policy to allow calls to this
      # API. For more information, see Controlling Access to Amazon Kinesis Data Streams Resources Using IAM
      # .

      def list_shards(
        exclusive_start_shard_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shard_filter : Types::ShardFilter? = nil,
        stream_arn : String? = nil,
        stream_creation_timestamp : Time? = nil,
        stream_name : String? = nil
      ) : Types::ListShardsOutput

        input = Types::ListShardsInput.new(exclusive_start_shard_id: exclusive_start_shard_id, max_results: max_results, next_token: next_token, shard_filter: shard_filter, stream_arn: stream_arn, stream_creation_timestamp: stream_creation_timestamp, stream_name: stream_name)
        list_shards(input)
      end

      def list_shards(input : Types::ListShardsInput) : Types::ListShardsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SHARDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListShardsOutput, "ListShards")
      end

      # Lists the consumers registered to receive data from a stream using enhanced fan-out, and provides
      # information about each consumer. This operation has a limit of 5 transactions per second per stream.

      def list_stream_consumers(
        stream_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        stream_creation_timestamp : Time? = nil
      ) : Types::ListStreamConsumersOutput

        input = Types::ListStreamConsumersInput.new(stream_arn: stream_arn, max_results: max_results, next_token: next_token, stream_creation_timestamp: stream_creation_timestamp)
        list_stream_consumers(input)
      end

      def list_stream_consumers(input : Types::ListStreamConsumersInput) : Types::ListStreamConsumersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STREAM_CONSUMERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStreamConsumersOutput, "ListStreamConsumers")
      end

      # Lists your Kinesis data streams. The number of streams may be too large to return from a single call
      # to ListStreams . You can limit the number of returned streams using the Limit parameter. If you do
      # not specify a value for the Limit parameter, Kinesis Data Streams uses the default limit, which is
      # currently 100. You can detect if there are more streams available to list by using the
      # HasMoreStreams flag from the returned output. If there are more streams available, you can request
      # more streams by using the name of the last stream returned by the ListStreams request in the
      # ExclusiveStartStreamName parameter in a subsequent request to ListStreams . The group of stream
      # names returned by the subsequent request is then added to the list. You can continue this process
      # until all the stream names have been collected in the list. ListStreams has a limit of five
      # transactions per second per account.

      def list_streams(
        exclusive_start_stream_name : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStreamsOutput

        input = Types::ListStreamsInput.new(exclusive_start_stream_name: exclusive_start_stream_name, limit: limit, next_token: next_token)
        list_streams(input)
      end

      def list_streams(input : Types::ListStreamsInput) : Types::ListStreamsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STREAMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStreamsOutput, "ListStreams")
      end

      # List all tags added to the specified Kinesis resource. Each tag is a label consisting of a
      # user-defined key and value. Tags can help you manage, identify, organize, search for, and filter
      # resources. For more information about tagging Kinesis resources, see Tag your Amazon Kinesis Data
      # Streams resources .

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceOutput

        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Lists the tags for the specified Kinesis data stream. This operation has a limit of five
      # transactions per second per account. When invoking this API, you must use either the StreamARN or
      # the StreamName parameter, or both. It is recommended that you use the StreamARN input parameter when
      # you invoke this API.

      def list_tags_for_stream(
        exclusive_start_tag_key : String? = nil,
        limit : Int32? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::ListTagsForStreamOutput

        input = Types::ListTagsForStreamInput.new(exclusive_start_tag_key: exclusive_start_tag_key, limit: limit, stream_arn: stream_arn, stream_name: stream_name)
        list_tags_for_stream(input)
      end

      def list_tags_for_stream(input : Types::ListTagsForStreamInput) : Types::ListTagsForStreamOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForStreamOutput, "ListTagsForStream")
      end

      # Merges two adjacent shards in a Kinesis data stream and combines them into a single shard to reduce
      # the stream's capacity to ingest and transport data. This API is only supported for the data streams
      # with the provisioned capacity mode. Two shards are considered adjacent if the union of the hash key
      # ranges for the two shards form a contiguous set with no gaps. For example, if you have two shards,
      # one with a hash key range of 276...381 and the other with a hash key range of 382...454, then you
      # could merge these two shards into a single shard that would have a hash key range of 276...454.
      # After the merge, the single child shard receives data for all hash key values covered by the two
      # parent shards. When invoking this API, you must use either the StreamARN or the StreamName
      # parameter, or both. It is recommended that you use the StreamARN input parameter when you invoke
      # this API. MergeShards is called when there is a need to reduce the overall capacity of a stream
      # because of excess capacity that is not being used. You must specify the shard to be merged and the
      # adjacent shard for a stream. For more information about merging shards, see Merge Two Shards in the
      # Amazon Kinesis Data Streams Developer Guide . If the stream is in the ACTIVE state, you can call
      # MergeShards . If a stream is in the CREATING , UPDATING , or DELETING state, MergeShards returns a
      # ResourceInUseException . If the specified stream does not exist, MergeShards returns a
      # ResourceNotFoundException . You can use DescribeStreamSummary to check the state of the stream,
      # which is returned in StreamStatus . MergeShards is an asynchronous operation. Upon receiving a
      # MergeShards request, Amazon Kinesis Data Streams immediately returns a response and sets the
      # StreamStatus to UPDATING . After the operation is completed, Kinesis Data Streams sets the
      # StreamStatus to ACTIVE . Read and write operations continue to work while the stream is in the
      # UPDATING state. You use DescribeStreamSummary and the ListShards APIs to determine the shard IDs
      # that are specified in the MergeShards request. If you try to operate on too many streams in parallel
      # using CreateStream , DeleteStream , MergeShards , or SplitShard , you receive a
      # LimitExceededException . MergeShards has a limit of five transactions per second per account.

      def merge_shards(
        adjacent_shard_to_merge : String,
        shard_to_merge : String,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::MergeShardsInput.new(adjacent_shard_to_merge: adjacent_shard_to_merge, shard_to_merge: shard_to_merge, stream_arn: stream_arn, stream_name: stream_name)
        merge_shards(input)
      end

      def merge_shards(input : Types::MergeShardsInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::MERGE_SHARDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Writes a single data record into an Amazon Kinesis data stream. Call PutRecord to send data into the
      # stream for real-time ingestion and subsequent processing, one record at a time. Each shard can
      # support writes up to 1,000 records per second, up to a maximum data write total of 10 MiB per
      # second. When invoking this API, you must use either the StreamARN or the StreamName parameter, or
      # both. It is recommended that you use the StreamARN input parameter when you invoke this API. You
      # must specify the name of the stream that captures, stores, and transports the data; a partition key;
      # and the data blob itself. The data blob can be any type of data; for example, a segment from a log
      # file, geographic/location data, website clickstream data, and so on. The partition key is used by
      # Kinesis Data Streams to distribute data across shards. Kinesis Data Streams segregates the data
      # records that belong to a stream into multiple shards, using the partition key associated with each
      # data record to determine the shard to which a given data record belongs. Partition keys are Unicode
      # strings, with a maximum length limit of 256 characters for each key. An MD5 hash function is used to
      # map partition keys to 128-bit integer values and to map associated data records to shards using the
      # hash key ranges of the shards. You can override hashing the partition key to determine the shard by
      # explicitly specifying a hash value using the ExplicitHashKey parameter. For more information, see
      # Adding Data to a Stream in the Amazon Kinesis Data Streams Developer Guide . PutRecord returns the
      # shard ID of where the data record was placed and the sequence number that was assigned to the data
      # record. Sequence numbers increase over time and are specific to a shard within a stream, not across
      # all shards within a stream. To guarantee strictly increasing ordering, write serially to a shard and
      # use the SequenceNumberForOrdering parameter. For more information, see Adding Data to a Stream in
      # the Amazon Kinesis Data Streams Developer Guide . After you write a record to a stream, you cannot
      # modify that record or its order within the stream. If a PutRecord request cannot be processed
      # because of insufficient provisioned throughput on the shard involved in the request, PutRecord
      # throws ProvisionedThroughputExceededException . By default, data records are accessible for 24 hours
      # from the time that they are added to a stream. You can use IncreaseStreamRetentionPeriod or
      # DecreaseStreamRetentionPeriod to modify this retention period.

      def put_record(
        data : Bytes,
        partition_key : String,
        explicit_hash_key : String? = nil,
        sequence_number_for_ordering : String? = nil,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::PutRecordOutput

        input = Types::PutRecordInput.new(data: data, partition_key: partition_key, explicit_hash_key: explicit_hash_key, sequence_number_for_ordering: sequence_number_for_ordering, stream_arn: stream_arn, stream_name: stream_name)
        put_record(input)
      end

      def put_record(input : Types::PutRecordInput) : Types::PutRecordOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_RECORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRecordOutput, "PutRecord")
      end

      # Writes multiple data records into a Kinesis data stream in a single call (also referred to as a
      # PutRecords request). Use this operation to send data into the stream for data ingestion and
      # processing. When invoking this API, you must use either the StreamARN or the StreamName parameter,
      # or both. It is recommended that you use the StreamARN input parameter when you invoke this API. Each
      # PutRecords request can support up to 500 records. Each record in the request can be as large as 10
      # MiB, up to a limit of 10 MiB for the entire request, including partition keys. Each shard can
      # support writes up to 1,000 records per second, up to a maximum data write total of 1 MB per second.
      # You must specify the name of the stream that captures, stores, and transports the data; and an array
      # of request Records , with each record in the array requiring a partition key and data blob. The
      # record size limit applies to the total size of the partition key and data blob. The data blob can be
      # any type of data; for example, a segment from a log file, geographic/location data, website
      # clickstream data, and so on. The partition key is used by Kinesis Data Streams as input to a hash
      # function that maps the partition key and associated data to a specific shard. An MD5 hash function
      # is used to map partition keys to 128-bit integer values and to map associated data records to
      # shards. As a result of this hashing mechanism, all data records with the same partition key map to
      # the same shard within the stream. For more information, see Adding Data to a Stream in the Amazon
      # Kinesis Data Streams Developer Guide . Each record in the Records array may include an optional
      # parameter, ExplicitHashKey , which overrides the partition key to shard mapping. This parameter
      # allows a data producer to determine explicitly the shard where the record is stored. For more
      # information, see Adding Multiple Records with PutRecords in the Amazon Kinesis Data Streams
      # Developer Guide . The PutRecords response includes an array of response Records . Each record in the
      # response array directly correlates with a record in the request array using natural ordering, from
      # the top to the bottom of the request and response. The response Records array always includes the
      # same number of records as the request array. The response Records array includes both successfully
      # and unsuccessfully processed records. Kinesis Data Streams attempts to process all records in each
      # PutRecords request. A single record failure does not stop the processing of subsequent records. As a
      # result, PutRecords doesn't guarantee the ordering of records. If you need to read records in the
      # same order they are written to the stream, use PutRecord instead of PutRecords , and write to the
      # same shard. A successfully processed record includes ShardId and SequenceNumber values. The ShardId
      # parameter identifies the shard in the stream where the record is stored. The SequenceNumber
      # parameter is an identifier assigned to the put record, unique to all records in the stream. An
      # unsuccessfully processed record includes ErrorCode and ErrorMessage values. ErrorCode reflects the
      # type of error and can be one of the following values: ProvisionedThroughputExceededException or
      # InternalFailure . ErrorMessage provides more detailed information about the
      # ProvisionedThroughputExceededException exception including the account ID, stream name, and shard ID
      # of the record that was throttled. For more information about partially successful responses, see
      # Adding Multiple Records with PutRecords in the Amazon Kinesis Data Streams Developer Guide . After
      # you write a record to a stream, you cannot modify that record or its order within the stream. By
      # default, data records are accessible for 24 hours from the time that they are added to a stream. You
      # can use IncreaseStreamRetentionPeriod or DecreaseStreamRetentionPeriod to modify this retention
      # period.

      def put_records(
        records : Array(Types::PutRecordsRequestEntry),
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::PutRecordsOutput

        input = Types::PutRecordsInput.new(records: records, stream_arn: stream_arn, stream_name: stream_name)
        put_records(input)
      end

      def put_records(input : Types::PutRecordsInput) : Types::PutRecordsOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRecordsOutput, "PutRecords")
      end

      # Attaches a resource-based policy to a data stream or registered consumer. If you are using an
      # identity other than the root user of the Amazon Web Services account that owns the resource, the
      # calling identity must have the PutResourcePolicy permissions on the specified Kinesis Data Streams
      # resource and belong to the owner's account in order to use this operation. If you don't have
      # PutResourcePolicy permissions, Amazon Kinesis Data Streams returns a 403 Access Denied error . If
      # you receive a ResourceNotFoundException , check to see if you passed a valid stream or consumer
      # resource. Request patterns can be one of the following: Data stream pattern:
      # arn:aws.*:kinesis:.*:\d{12}:.*stream/\S+ Consumer pattern:
      # ^(arn):aws.*:kinesis:.*:\d{12}:.*stream\/[a-zA-Z0-9_.-]+\/consumer\/[a-zA-Z0-9_.-]+:[0-9]+ For more
      # information, see Controlling Access to Amazon Kinesis Data Streams Resources Using IAM .

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Nil

        input = Types::PutResourcePolicyInput.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Registers a consumer with a Kinesis data stream. When you use this operation, the consumer you
      # register can then call SubscribeToShard to receive data from the stream using enhanced fan-out, at a
      # rate of up to 2 MiB per second for every shard you subscribe to. This rate is unaffected by the
      # total number of consumers that read from the same stream. You can add tags to the registered
      # consumer when making a RegisterStreamConsumer request by setting the Tags parameter. If you pass the
      # Tags parameter, in addition to having the kinesis:RegisterStreamConsumer permission, you must also
      # have the kinesis:TagResource permission for the consumer that will be registered. Tags will take
      # effect from the CREATING status of the consumer. With On-demand Advantage streams, you can register
      # up to 50 consumers per stream to use Enhanced Fan-out. With On-demand Standard and Provisioned
      # streams, you can register up to 20 consumers per stream to use Enhanced Fan-out. A given consumer
      # can only be registered with one stream at a time. For an example of how to use this operation, see
      # Enhanced Fan-Out Using the Kinesis Data Streams API . The use of this operation has a limit of five
      # transactions per second per account. Also, only 5 consumers can be created simultaneously. In other
      # words, you cannot have more than 5 consumers in a CREATING status at the same time. Registering a
      # 6th consumer while there are 5 in a CREATING status results in a LimitExceededException .

      def register_stream_consumer(
        consumer_name : String,
        stream_arn : String,
        tags : Hash(String, String)? = nil
      ) : Types::RegisterStreamConsumerOutput

        input = Types::RegisterStreamConsumerInput.new(consumer_name: consumer_name, stream_arn: stream_arn, tags: tags)
        register_stream_consumer(input)
      end

      def register_stream_consumer(input : Types::RegisterStreamConsumerInput) : Types::RegisterStreamConsumerOutput
        request = Protocol::JsonRpc.build_request(Model::REGISTER_STREAM_CONSUMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterStreamConsumerOutput, "RegisterStreamConsumer")
      end

      # Removes tags from the specified Kinesis data stream. Removed tags are deleted and cannot be
      # recovered after this operation successfully completes. When invoking this API, you must use either
      # the StreamARN or the StreamName parameter, or both. It is recommended that you use the StreamARN
      # input parameter when you invoke this API. If you specify a tag that does not exist, it is ignored.
      # RemoveTagsFromStream has a limit of five transactions per second per account.

      def remove_tags_from_stream(
        tag_keys : Array(String),
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::RemoveTagsFromStreamInput.new(tag_keys: tag_keys, stream_arn: stream_arn, stream_name: stream_name)
        remove_tags_from_stream(input)
      end

      def remove_tags_from_stream(input : Types::RemoveTagsFromStreamInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Splits a shard into two new shards in the Kinesis data stream, to increase the stream's capacity to
      # ingest and transport data. SplitShard is called when there is a need to increase the overall
      # capacity of a stream because of an expected increase in the volume of data records being ingested.
      # This API is only supported for the data streams with the provisioned capacity mode. When invoking
      # this API, you must use either the StreamARN or the StreamName parameter, or both. It is recommended
      # that you use the StreamARN input parameter when you invoke this API. You can also use SplitShard
      # when a shard appears to be approaching its maximum utilization; for example, the producers sending
      # data into the specific shard are suddenly sending more than previously anticipated. You can also
      # call SplitShard to increase stream capacity, so that more Kinesis Data Streams applications can
      # simultaneously read data from the stream for real-time processing. You must specify the shard to be
      # split and the new hash key, which is the position in the shard where the shard gets split in two. In
      # many cases, the new hash key might be the average of the beginning and ending hash key, but it can
      # be any hash key value in the range being mapped into the shard. For more information, see Split a
      # Shard in the Amazon Kinesis Data Streams Developer Guide . You can use DescribeStreamSummary and the
      # ListShards APIs to determine the shard ID and hash key values for the ShardToSplit and
      # NewStartingHashKey parameters that are specified in the SplitShard request. SplitShard is an
      # asynchronous operation. Upon receiving a SplitShard request, Kinesis Data Streams immediately
      # returns a response and sets the stream status to UPDATING . After the operation is completed,
      # Kinesis Data Streams sets the stream status to ACTIVE . Read and write operations continue to work
      # while the stream is in the UPDATING state. You can use DescribeStreamSummary to check the status of
      # the stream, which is returned in StreamStatus . If the stream is in the ACTIVE state, you can call
      # SplitShard . If the specified stream does not exist, DescribeStreamSummary returns a
      # ResourceNotFoundException . If you try to create more shards than are authorized for your account,
      # you receive a LimitExceededException . For the default shard limit for an Amazon Web Services
      # account, see Kinesis Data Streams Limits in the Amazon Kinesis Data Streams Developer Guide . To
      # increase this limit, contact Amazon Web Services Support . If you try to operate on too many streams
      # simultaneously using CreateStream , DeleteStream , MergeShards , and/or SplitShard , you receive a
      # LimitExceededException . SplitShard has a limit of five transactions per second per account.

      def split_shard(
        new_starting_hash_key : String,
        shard_to_split : String,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::SplitShardInput.new(new_starting_hash_key: new_starting_hash_key, shard_to_split: shard_to_split, stream_arn: stream_arn, stream_name: stream_name)
        split_shard(input)
      end

      def split_shard(input : Types::SplitShardInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SPLIT_SHARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables or updates server-side encryption using an Amazon Web Services KMS key for a specified
      # stream. When invoking this API, you must use either the StreamARN or the StreamName parameter, or
      # both. It is recommended that you use the StreamARN input parameter when you invoke this API.
      # Starting encryption is an asynchronous operation. Upon receiving the request, Kinesis Data Streams
      # returns immediately and sets the status of the stream to UPDATING . After the update is complete,
      # Kinesis Data Streams sets the status of the stream back to ACTIVE . Updating or applying encryption
      # normally takes a few seconds to complete, but it can take minutes. You can continue to read and
      # write data to your stream while its status is UPDATING . Once the status of the stream is ACTIVE ,
      # encryption begins for records written to the stream. API Limits: You can successfully apply a new
      # Amazon Web Services KMS key for server-side encryption 25 times in a rolling 24-hour period. Note:
      # It can take up to 5 seconds after the stream is in an ACTIVE status before all records written to
      # the stream are encrypted. After you enable encryption, you can verify that encryption is applied by
      # inspecting the API response from PutRecord or PutRecords .

      def start_stream_encryption(
        encryption_type : String,
        key_id : String,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::StartStreamEncryptionInput.new(encryption_type: encryption_type, key_id: key_id, stream_arn: stream_arn, stream_name: stream_name)
        start_stream_encryption(input)
      end

      def start_stream_encryption(input : Types::StartStreamEncryptionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_STREAM_ENCRYPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Disables server-side encryption for a specified stream. When invoking this API, you must use either
      # the StreamARN or the StreamName parameter, or both. It is recommended that you use the StreamARN
      # input parameter when you invoke this API. Stopping encryption is an asynchronous operation. Upon
      # receiving the request, Kinesis Data Streams returns immediately and sets the status of the stream to
      # UPDATING . After the update is complete, Kinesis Data Streams sets the status of the stream back to
      # ACTIVE . Stopping encryption normally takes a few seconds to complete, but it can take minutes. You
      # can continue to read and write data to your stream while its status is UPDATING . Once the status of
      # the stream is ACTIVE , records written to the stream are no longer encrypted by Kinesis Data
      # Streams. API Limits: You can successfully disable server-side encryption 25 times in a rolling
      # 24-hour period. Note: It can take up to 5 seconds after the stream is in an ACTIVE status before all
      # records written to the stream are no longer subject to encryption. After you disabled encryption,
      # you can verify that encryption is not applied by inspecting the API response from PutRecord or
      # PutRecords .

      def stop_stream_encryption(
        encryption_type : String,
        key_id : String,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Nil

        input = Types::StopStreamEncryptionInput.new(encryption_type: encryption_type, key_id: key_id, stream_arn: stream_arn, stream_name: stream_name)
        stop_stream_encryption(input)
      end

      def stop_stream_encryption(input : Types::StopStreamEncryptionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_STREAM_ENCRYPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This operation establishes an HTTP/2 connection between the consumer you specify in the ConsumerARN
      # parameter and the shard you specify in the ShardId parameter. After the connection is successfully
      # established, Kinesis Data Streams pushes records from the shard to the consumer over this
      # connection. Before you call this operation, call RegisterStreamConsumer to register the consumer
      # with Kinesis Data Streams. When the SubscribeToShard call succeeds, your consumer starts receiving
      # events of type SubscribeToShardEvent over the HTTP/2 connection for up to 5 minutes, after which
      # time you need to call SubscribeToShard again to renew the subscription if you want to continue to
      # receive records. You can make one call to SubscribeToShard per second per registered consumer per
      # shard. For example, if you have a 4000 shard stream and two registered stream consumers, you can
      # make one SubscribeToShard request per second for each combination of shard and registered consumer,
      # allowing you to subscribe both consumers to all 4000 shards in one second. If you call
      # SubscribeToShard again with the same ConsumerARN and ShardId within 5 seconds of a successful call,
      # you'll get a ResourceInUseException . If you call SubscribeToShard 5 seconds or more after a
      # successful call, the second call takes over the subscription and the previous connection expires or
      # fails with a ResourceInUseException . For an example of how to use this operation, see Enhanced
      # Fan-Out Using the Kinesis Data Streams API .

      def subscribe_to_shard(
        consumer_arn : String,
        shard_id : String,
        starting_position : Types::StartingPosition
      ) : Types::SubscribeToShardOutput

        input = Types::SubscribeToShardInput.new(consumer_arn: consumer_arn, shard_id: shard_id, starting_position: starting_position)
        subscribe_to_shard(input)
      end

      def subscribe_to_shard(input : Types::SubscribeToShardInput) : Types::SubscribeToShardOutput
        request = Protocol::JsonRpc.build_request(Model::SUBSCRIBE_TO_SHARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SubscribeToShardOutput, "SubscribeToShard")
      end

      # Adds or updates tags for the specified Kinesis resource. Each tag is a label consisting of a
      # user-defined key and value. Tags can help you manage, identify, organize, search for, and filter
      # resources. You can assign up to 50 tags to a Kinesis resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Nil

        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes tags from the specified Kinesis resource. Removed tags are deleted and can't be recovered
      # after this operation completes successfully.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Nil

        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the account-level settings for Amazon Kinesis Data Streams. Updating account settings is a
      # synchronous operation. Upon receiving the request, Kinesis Data Streams will return immediately with
      # your account’s updated settings. API limits Certain account configurations have minimum commitment
      # windows. Attempting to update your settings prior to the end of the minimum commitment window might
      # have certain restrictions. This API has a call limit of 5 transactions per second (TPS) for each
      # Amazon Web Services account. TPS over 5 will initiate the LimitExceededException .

      def update_account_settings(
        minimum_throughput_billing_commitment : Types::MinimumThroughputBillingCommitmentInput
      ) : Types::UpdateAccountSettingsOutput

        input = Types::UpdateAccountSettingsInput.new(minimum_throughput_billing_commitment: minimum_throughput_billing_commitment)
        update_account_settings(input)
      end

      def update_account_settings(input : Types::UpdateAccountSettingsInput) : Types::UpdateAccountSettingsOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAccountSettingsOutput, "UpdateAccountSettings")
      end

      # This allows you to update the MaxRecordSize of a single record that you can write to, and read from
      # a stream. You can ingest and digest single records up to 10240 KiB.

      def update_max_record_size(
        max_record_size_in_ki_b : Int32,
        stream_arn : String? = nil
      ) : Nil

        input = Types::UpdateMaxRecordSizeInput.new(max_record_size_in_ki_b: max_record_size_in_ki_b, stream_arn: stream_arn)
        update_max_record_size(input)
      end

      def update_max_record_size(input : Types::UpdateMaxRecordSizeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MAX_RECORD_SIZE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the shard count of the specified stream to the specified number of shards. This API is only
      # supported for the data streams with the provisioned capacity mode. When invoking this API, you must
      # use either the StreamARN or the StreamName parameter, or both. It is recommended that you use the
      # StreamARN input parameter when you invoke this API. Updating the shard count is an asynchronous
      # operation. Upon receiving the request, Kinesis Data Streams returns immediately and sets the status
      # of the stream to UPDATING . After the update is complete, Kinesis Data Streams sets the status of
      # the stream back to ACTIVE . Depending on the size of the stream, the scaling action could take a few
      # minutes to complete. You can continue to read and write data to your stream while its status is
      # UPDATING . To update the shard count, Kinesis Data Streams performs splits or merges on individual
      # shards. This can cause short-lived shards to be created, in addition to the final shards. These
      # short-lived shards count towards your total shard limit for your account in the Region. When using
      # this operation, we recommend that you specify a target shard count that is a multiple of 25% (25%,
      # 50%, 75%, 100%). You can specify any target value within your shard limit. However, if you specify a
      # target that isn't a multiple of 25%, the scaling action might take longer to complete. This
      # operation has the following default limits. By default, you cannot do the following: Scale more than
      # ten times per rolling 24-hour period per stream Scale up to more than double your current shard
      # count for a stream Scale down below half your current shard count for a stream Scale up to more than
      # 10000 shards in a stream Scale a stream with more than 10000 shards down unless the result is less
      # than 10000 shards Scale up to more than the shard limit for your account Make over 10 TPS. TPS over
      # 10 will trigger the LimitExceededException For the default limits for an Amazon Web Services
      # account, see Streams Limits in the Amazon Kinesis Data Streams Developer Guide . To request an
      # increase in the call rate limit, the shard limit for this API, or your overall shard limit, use the
      # limits form .

      def update_shard_count(
        scaling_type : String,
        target_shard_count : Int32,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::UpdateShardCountOutput

        input = Types::UpdateShardCountInput.new(scaling_type: scaling_type, target_shard_count: target_shard_count, stream_arn: stream_arn, stream_name: stream_name)
        update_shard_count(input)
      end

      def update_shard_count(input : Types::UpdateShardCountInput) : Types::UpdateShardCountOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SHARD_COUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateShardCountOutput, "UpdateShardCount")
      end

      # Updates the capacity mode of the data stream. Currently, in Kinesis Data Streams, you can choose
      # between an on-demand capacity mode and a provisioned capacity mode for your data stream. If you'd
      # still like to proactively scale your on-demand data stream’s capacity, you can unlock the warm
      # throughput feature for on-demand data streams by enabling MinimumThroughputBillingCommitment for
      # your account. Once your account has MinimumThroughputBillingCommitment enabled, you can specify the
      # warm throughput in MiB per second that your stream can support in writes.

      def update_stream_mode(
        stream_arn : String,
        stream_mode_details : Types::StreamModeDetails,
        warm_throughput_mi_bps : Int32? = nil
      ) : Nil

        input = Types::UpdateStreamModeInput.new(stream_arn: stream_arn, stream_mode_details: stream_mode_details, warm_throughput_mi_bps: warm_throughput_mi_bps)
        update_stream_mode(input)
      end

      def update_stream_mode(input : Types::UpdateStreamModeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STREAM_MODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the warm throughput configuration for the specified Amazon Kinesis Data Streams on-demand
      # data stream. This operation allows you to proactively scale your on-demand data stream to a
      # specified throughput level, enabling better performance for sudden traffic spikes. When invoking
      # this API, you must use either the StreamARN or the StreamName parameter, or both. It is recommended
      # that you use the StreamARN input parameter when you invoke this API. Updating the warm throughput is
      # an asynchronous operation. Upon receiving the request, Kinesis Data Streams returns immediately and
      # sets the status of the stream to UPDATING . After the update is complete, Kinesis Data Streams sets
      # the status of the stream back to ACTIVE . Depending on the size of the stream, the scaling action
      # could take a few minutes to complete. You can continue to read and write data to your stream while
      # its status is UPDATING . This operation is only supported for data streams with the on-demand
      # capacity mode in accounts that have MinimumThroughputBillingCommitment enabled. Provisioned capacity
      # mode streams do not support warm throughput configuration. This operation has the following default
      # limits. By default, you cannot do the following: Scale to more than 10 GiBps for an on-demand
      # stream. This API has a call limit of 5 transactions per second (TPS) for each Amazon Web Services
      # account. TPS over 5 will initiate the LimitExceededException . For the default limits for an Amazon
      # Web Services account, see Streams Limits in the Amazon Kinesis Data Streams Developer Guide . To
      # request an increase in the call rate limit, the shard limit for this API, or your overall shard
      # limit, use the limits form .

      def update_stream_warm_throughput(
        warm_throughput_mi_bps : Int32,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Types::UpdateStreamWarmThroughputOutput

        input = Types::UpdateStreamWarmThroughputInput.new(warm_throughput_mi_bps: warm_throughput_mi_bps, stream_arn: stream_arn, stream_name: stream_name)
        update_stream_warm_throughput(input)
      end

      def update_stream_warm_throughput(input : Types::UpdateStreamWarmThroughputInput) : Types::UpdateStreamWarmThroughputOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STREAM_WARM_THROUGHPUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateStreamWarmThroughputOutput, "UpdateStreamWarmThroughput")
      end
    end
  end
end
