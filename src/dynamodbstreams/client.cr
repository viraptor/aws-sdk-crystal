module Aws
  module DynamoDBStreams
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Returns information about a stream, including the current status of the stream, its Amazon Resource
      # Name (ARN), the composition of its shards, and its corresponding DynamoDB table. You can call
      # DescribeStream at a maximum rate of 10 times per second. Each shard in the stream has a
      # SequenceNumberRange associated with it. If the SequenceNumberRange has a StartingSequenceNumber but
      # no EndingSequenceNumber , then the shard is still open (able to receive more stream records). If
      # both StartingSequenceNumber and EndingSequenceNumber are present, then that shard is closed and can
      # no longer receive more data.

      def describe_stream(
        stream_arn : String,
        exclusive_start_shard_id : String? = nil,
        limit : Int32? = nil,
        shard_filter : Types::ShardFilter? = nil
      ) : Types::DescribeStreamOutput

        input = Types::DescribeStreamInput.new(stream_arn: stream_arn, exclusive_start_shard_id: exclusive_start_shard_id, limit: limit, shard_filter: shard_filter)
        describe_stream(input)
      end

      def describe_stream(input : Types::DescribeStreamInput) : Types::DescribeStreamOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStreamOutput, "DescribeStream")
      end

      # Retrieves the stream records from a given shard. Specify a shard iterator using the ShardIterator
      # parameter. The shard iterator specifies the position in the shard from which you want to start
      # reading stream records sequentially. If there are no stream records available in the portion of the
      # shard that the iterator points to, GetRecords returns an empty list. Note that it might take
      # multiple calls to get to a portion of the shard that contains stream records. GetRecords can
      # retrieve a maximum of 1 MB of data or 1000 stream records, whichever comes first.

      def get_records(
        shard_iterator : String,
        limit : Int32? = nil
      ) : Types::GetRecordsOutput

        input = Types::GetRecordsInput.new(shard_iterator: shard_iterator, limit: limit)
        get_records(input)
      end

      def get_records(input : Types::GetRecordsInput) : Types::GetRecordsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRecordsOutput, "GetRecords")
      end

      # Returns a shard iterator. A shard iterator provides information about how to retrieve the stream
      # records from within a shard. Use the shard iterator in a subsequent GetRecords request to read the
      # stream records from the shard. A shard iterator expires 15 minutes after it is returned to the
      # requester.

      def get_shard_iterator(
        shard_id : String,
        shard_iterator_type : String,
        stream_arn : String,
        sequence_number : String? = nil
      ) : Types::GetShardIteratorOutput

        input = Types::GetShardIteratorInput.new(shard_id: shard_id, shard_iterator_type: shard_iterator_type, stream_arn: stream_arn, sequence_number: sequence_number)
        get_shard_iterator(input)
      end

      def get_shard_iterator(input : Types::GetShardIteratorInput) : Types::GetShardIteratorOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SHARD_ITERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetShardIteratorOutput, "GetShardIterator")
      end

      # Returns an array of stream ARNs associated with the current account and endpoint. If the TableName
      # parameter is present, then ListStreams will return only the streams ARNs for that table. You can
      # call ListStreams at a maximum rate of 5 times per second.

      def list_streams(
        exclusive_start_stream_arn : String? = nil,
        limit : Int32? = nil,
        table_name : String? = nil
      ) : Types::ListStreamsOutput

        input = Types::ListStreamsInput.new(exclusive_start_stream_arn: exclusive_start_stream_arn, limit: limit, table_name: table_name)
        list_streams(input)
      end

      def list_streams(input : Types::ListStreamsInput) : Types::ListStreamsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STREAMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStreamsOutput, "ListStreams")
      end
    end
  end
end
