module AwsSdk
  module KeyspacesStreams
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

      # Retrieves data records from a specified shard in an Amazon Keyspaces data stream. This operation
      # returns a collection of data records from the shard, including the primary key columns and
      # information about modifications made to the captured table data. Each record represents a single
      # data modification in the Amazon Keyspaces table and includes metadata about when the change
      # occurred.

      def get_records(
        shard_iterator : String,
        max_results : Int32? = nil
      ) : Types::GetRecordsOutput

        input = Types::GetRecordsInput.new(shard_iterator: shard_iterator, max_results: max_results)
        get_records(input)
      end

      def get_records(input : Types::GetRecordsInput) : Types::GetRecordsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRecordsOutput, "GetRecords")
      end

      # Returns a shard iterator that serves as a bookmark for reading data from a specific position in an
      # Amazon Keyspaces data stream's shard. The shard iterator specifies the shard position from which to
      # start reading data records sequentially. You can specify whether to begin reading at the latest
      # record, the oldest record, or at a particular sequence number within the shard.

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

      # Returns detailed information about a specific data capture stream for an Amazon Keyspaces table. The
      # information includes the stream's Amazon Resource Name (ARN), creation time, current status,
      # retention period, shard composition, and associated table details. This operation helps you monitor
      # and manage the configuration of your Amazon Keyspaces data streams.

      def get_stream(
        stream_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shard_filter : Types::ShardFilter? = nil
      ) : Types::GetStreamOutput

        input = Types::GetStreamInput.new(stream_arn: stream_arn, max_results: max_results, next_token: next_token, shard_filter: shard_filter)
        get_stream(input)
      end

      def get_stream(input : Types::GetStreamInput) : Types::GetStreamOutput
        request = Protocol::JsonRpc.build_request(Model::GET_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStreamOutput, "GetStream")
      end

      # Returns a list of all data capture streams associated with your Amazon Keyspaces account or for a
      # specific keyspace or table. The response includes information such as stream ARNs, table
      # associations, creation timestamps, and current status. This operation helps you discover and manage
      # all active data streams in your Amazon Keyspaces environment.

      def list_streams(
        keyspace_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        table_name : String? = nil
      ) : Types::ListStreamsOutput

        input = Types::ListStreamsInput.new(keyspace_name: keyspace_name, max_results: max_results, next_token: next_token, table_name: table_name)
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
