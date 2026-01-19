module AwsSdk
  module EBS
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Seals and completes the snapshot after all of the required blocks of data have been written to it.
      # Completing the snapshot changes the status to completed . You cannot write new blocks to a snapshot
      # after it has been completed. You should always retry requests that receive server ( 5xx ) error
      # responses, and ThrottlingException and RequestThrottledException client error responses. For more
      # information see Error retries in the Amazon Elastic Compute Cloud User Guide .
      def complete_snapshot(
        changed_blocks_count : Int32,
        snapshot_id : String,
        checksum : String? = nil,
        checksum_aggregation_method : String? = nil,
        checksum_algorithm : String? = nil
      ) : Protocol::Request
        input = Types::CompleteSnapshotRequest.new(changed_blocks_count: changed_blocks_count, snapshot_id: snapshot_id, checksum: checksum, checksum_aggregation_method: checksum_aggregation_method, checksum_algorithm: checksum_algorithm)
        complete_snapshot(input)
      end
      def complete_snapshot(input : Types::CompleteSnapshotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMPLETE_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the data in a block in an Amazon Elastic Block Store snapshot. You should always retry
      # requests that receive server ( 5xx ) error responses, and ThrottlingException and
      # RequestThrottledException client error responses. For more information see Error retries in the
      # Amazon Elastic Compute Cloud User Guide .
      def get_snapshot_block(
        block_index : Int32,
        block_token : String,
        snapshot_id : String
      ) : Protocol::Request
        input = Types::GetSnapshotBlockRequest.new(block_index: block_index, block_token: block_token, snapshot_id: snapshot_id)
        get_snapshot_block(input)
      end
      def get_snapshot_block(input : Types::GetSnapshotBlockRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SNAPSHOT_BLOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the blocks that are different between two Amazon Elastic Block Store
      # snapshots of the same volume/snapshot lineage. You should always retry requests that receive server
      # ( 5xx ) error responses, and ThrottlingException and RequestThrottledException client error
      # responses. For more information see Error retries in the Amazon Elastic Compute Cloud User Guide .
      def list_changed_blocks(
        second_snapshot_id : String,
        first_snapshot_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        starting_block_index : Int32? = nil
      ) : Protocol::Request
        input = Types::ListChangedBlocksRequest.new(second_snapshot_id: second_snapshot_id, first_snapshot_id: first_snapshot_id, max_results: max_results, next_token: next_token, starting_block_index: starting_block_index)
        list_changed_blocks(input)
      end
      def list_changed_blocks(input : Types::ListChangedBlocksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANGED_BLOCKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the blocks in an Amazon Elastic Block Store snapshot. You should always
      # retry requests that receive server ( 5xx ) error responses, and ThrottlingException and
      # RequestThrottledException client error responses. For more information see Error retries in the
      # Amazon Elastic Compute Cloud User Guide .
      def list_snapshot_blocks(
        snapshot_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        starting_block_index : Int32? = nil
      ) : Protocol::Request
        input = Types::ListSnapshotBlocksRequest.new(snapshot_id: snapshot_id, max_results: max_results, next_token: next_token, starting_block_index: starting_block_index)
        list_snapshot_blocks(input)
      end
      def list_snapshot_blocks(input : Types::ListSnapshotBlocksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SNAPSHOT_BLOCKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Writes a block of data to a snapshot. If the specified block contains data, the existing data is
      # overwritten. The target snapshot must be in the pending state. Data written to a snapshot must be
      # aligned with 512-KiB sectors. You should always retry requests that receive server ( 5xx ) error
      # responses, and ThrottlingException and RequestThrottledException client error responses. For more
      # information see Error retries in the Amazon Elastic Compute Cloud User Guide .
      def put_snapshot_block(
        block_data : Bytes,
        block_index : Int32,
        checksum : String,
        checksum_algorithm : String,
        data_length : Int32,
        snapshot_id : String,
        progress : Int32? = nil
      ) : Protocol::Request
        input = Types::PutSnapshotBlockRequest.new(block_data: block_data, block_index: block_index, checksum: checksum, checksum_algorithm: checksum_algorithm, data_length: data_length, snapshot_id: snapshot_id, progress: progress)
        put_snapshot_block(input)
      end
      def put_snapshot_block(input : Types::PutSnapshotBlockRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SNAPSHOT_BLOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon EBS snapshot. The new snapshot enters the pending state after the request
      # completes. After creating the snapshot, use PutSnapshotBlock to write blocks of data to the
      # snapshot. You should always retry requests that receive server ( 5xx ) error responses, and
      # ThrottlingException and RequestThrottledException client error responses. For more information see
      # Error retries in the Amazon Elastic Compute Cloud User Guide .
      def start_snapshot(
        volume_size : Int64,
        client_token : String? = nil,
        description : String? = nil,
        encrypted : Bool? = nil,
        kms_key_arn : String? = nil,
        parent_snapshot_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout : Int32? = nil
      ) : Protocol::Request
        input = Types::StartSnapshotRequest.new(volume_size: volume_size, client_token: client_token, description: description, encrypted: encrypted, kms_key_arn: kms_key_arn, parent_snapshot_id: parent_snapshot_id, tags: tags, timeout: timeout)
        start_snapshot(input)
      end
      def start_snapshot(input : Types::StartSnapshotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
