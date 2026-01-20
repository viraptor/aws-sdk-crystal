require "json"
require "time"

module AwsSdk
  module EBS
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @reason : String,
          @message : String? = nil
        )
        end
      end

      # A block of data in an Amazon Elastic Block Store snapshot.

      struct Block
        include JSON::Serializable

        # The block index.

        @[JSON::Field(key: "BlockIndex")]
        getter block_index : Int32?

        # The block token for the block index.

        @[JSON::Field(key: "BlockToken")]
        getter block_token : String?

        def initialize(
          @block_index : Int32? = nil,
          @block_token : String? = nil
        )
        end
      end

      # A block of data in an Amazon Elastic Block Store snapshot that is different from another snapshot of
      # the same volume/snapshot lineage.

      struct ChangedBlock
        include JSON::Serializable

        # The block index.

        @[JSON::Field(key: "BlockIndex")]
        getter block_index : Int32?

        # The block token for the block index of the FirstSnapshotId specified in the ListChangedBlocks
        # operation. This value is absent if the first snapshot does not have the changed block that is on the
        # second snapshot.

        @[JSON::Field(key: "FirstBlockToken")]
        getter first_block_token : String?

        # The block token for the block index of the SecondSnapshotId specified in the ListChangedBlocks
        # operation.

        @[JSON::Field(key: "SecondBlockToken")]
        getter second_block_token : String?

        def initialize(
          @block_index : Int32? = nil,
          @first_block_token : String? = nil,
          @second_block_token : String? = nil
        )
        end
      end


      struct CompleteSnapshotRequest
        include JSON::Serializable

        # The number of blocks that were written to the snapshot.

        @[JSON::Field(key: "x-amz-ChangedBlocksCount")]
        getter changed_blocks_count : Int32

        # The ID of the snapshot.

        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String

        # An aggregated Base-64 SHA256 checksum based on the checksums of each written block. To generate the
        # aggregated checksum using the linear aggregation method, arrange the checksums for each written
        # block in ascending order of their block index, concatenate them to form a single string, and then
        # generate the checksum on the entire string using the SHA256 algorithm.

        @[JSON::Field(key: "x-amz-Checksum")]
        getter checksum : String?

        # The aggregation method used to generate the checksum. Currently, the only supported aggregation
        # method is LINEAR .

        @[JSON::Field(key: "x-amz-Checksum-Aggregation-Method")]
        getter checksum_aggregation_method : String?

        # The algorithm used to generate the checksum. Currently, the only supported algorithm is SHA256 .

        @[JSON::Field(key: "x-amz-Checksum-Algorithm")]
        getter checksum_algorithm : String?

        def initialize(
          @changed_blocks_count : Int32,
          @snapshot_id : String,
          @checksum : String? = nil,
          @checksum_aggregation_method : String? = nil,
          @checksum_algorithm : String? = nil
        )
        end
      end


      struct CompleteSnapshotResponse
        include JSON::Serializable

        # The status of the snapshot.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # You have reached the limit for concurrent API requests. For more information, see Optimizing
      # performance of the EBS direct APIs in the Amazon Elastic Compute Cloud User Guide .

      struct ConcurrentLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request uses the same client token as a previous, but non-identical request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetSnapshotBlockRequest
        include JSON::Serializable

        # The block index of the block in which to read the data. A block index is a logical index in units of
        # 512 KiB blocks. To identify the block index, divide the logical offset of the data in the logical
        # volume by the block size (logical offset of data/ 524288 ). The logical offset of the data must be
        # 512 KiB aligned.

        @[JSON::Field(key: "blockIndex")]
        getter block_index : Int32

        # The block token of the block from which to get data. You can obtain the BlockToken by running the
        # ListChangedBlocks or ListSnapshotBlocks operations.

        @[JSON::Field(key: "blockToken")]
        getter block_token : String

        # The ID of the snapshot containing the block from which to get data. If the specified snapshot is
        # encrypted, you must have permission to use the KMS key that was used to encrypt the snapshot. For
        # more information, see Using encryption in the Amazon Elastic Compute Cloud User Guide .

        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String

        def initialize(
          @block_index : Int32,
          @block_token : String,
          @snapshot_id : String
        )
        end
      end


      struct GetSnapshotBlockResponse
        include JSON::Serializable

        # The data content of the block.

        @[JSON::Field(key: "BlockData")]
        getter block_data : Bytes?

        # The checksum generated for the block, which is Base64 encoded.

        @[JSON::Field(key: "x-amz-Checksum")]
        getter checksum : String?

        # The algorithm used to generate the checksum for the block, such as SHA256.

        @[JSON::Field(key: "x-amz-Checksum-Algorithm")]
        getter checksum_algorithm : String?

        # The size of the data in the block.

        @[JSON::Field(key: "x-amz-Data-Length")]
        getter data_length : Int32?

        def initialize(
          @block_data : Bytes? = nil,
          @checksum : String? = nil,
          @checksum_algorithm : String? = nil,
          @data_length : Int32? = nil
        )
        end
      end

      # An internal error has occurred. For more information see Error retries .

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListChangedBlocksRequest
        include JSON::Serializable

        # The ID of the second snapshot to use for the comparison. The SecondSnapshotId parameter must be
        # specified with a FirstSnapshotID parameter; otherwise, an error occurs.

        @[JSON::Field(key: "secondSnapshotId")]
        getter second_snapshot_id : String

        # The ID of the first snapshot to use for the comparison. The FirstSnapshotID parameter must be
        # specified with a SecondSnapshotId parameter; otherwise, an error occurs.

        @[JSON::Field(key: "firstSnapshotId")]
        getter first_snapshot_id : String?

        # The maximum number of blocks to be returned by the request. Even if additional blocks can be
        # retrieved from the snapshot, the request can return less blocks than MaxResults or an empty array of
        # blocks. To retrieve the next set of blocks from the snapshot, make another request with the returned
        # NextToken value. The value of NextToken is null when there are no more blocks to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results. If you specify NextToken , then StartingBlockIndex is
        # ignored.

        @[JSON::Field(key: "pageToken")]
        getter next_token : String?

        # The block index from which the comparison should start. The list in the response will start from
        # this block index or the next valid block index in the snapshots. If you specify NextToken , then
        # StartingBlockIndex is ignored.

        @[JSON::Field(key: "startingBlockIndex")]
        getter starting_block_index : Int32?

        def initialize(
          @second_snapshot_id : String,
          @first_snapshot_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @starting_block_index : Int32? = nil
        )
        end
      end


      struct ListChangedBlocksResponse
        include JSON::Serializable

        # The size of the blocks in the snapshot, in bytes.

        @[JSON::Field(key: "BlockSize")]
        getter block_size : Int32?

        # An array of objects containing information about the changed blocks.

        @[JSON::Field(key: "ChangedBlocks")]
        getter changed_blocks : Array(Types::ChangedBlock)?

        # The time when the BlockToken expires.

        @[JSON::Field(key: "ExpiryTime")]
        getter expiry_time : Time?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The size of the volume in GB.

        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int64?

        def initialize(
          @block_size : Int32? = nil,
          @changed_blocks : Array(Types::ChangedBlock)? = nil,
          @expiry_time : Time? = nil,
          @next_token : String? = nil,
          @volume_size : Int64? = nil
        )
        end
      end


      struct ListSnapshotBlocksRequest
        include JSON::Serializable

        # The ID of the snapshot from which to get block indexes and block tokens.

        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String

        # The maximum number of blocks to be returned by the request. Even if additional blocks can be
        # retrieved from the snapshot, the request can return less blocks than MaxResults or an empty array of
        # blocks. To retrieve the next set of blocks from the snapshot, make another request with the returned
        # NextToken value. The value of NextToken is null when there are no more blocks to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results. If you specify NextToken , then StartingBlockIndex is
        # ignored.

        @[JSON::Field(key: "pageToken")]
        getter next_token : String?

        # The block index from which the list should start. The list in the response will start from this
        # block index or the next valid block index in the snapshot. If you specify NextToken , then
        # StartingBlockIndex is ignored.

        @[JSON::Field(key: "startingBlockIndex")]
        getter starting_block_index : Int32?

        def initialize(
          @snapshot_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @starting_block_index : Int32? = nil
        )
        end
      end


      struct ListSnapshotBlocksResponse
        include JSON::Serializable

        # The size of the blocks in the snapshot, in bytes.

        @[JSON::Field(key: "BlockSize")]
        getter block_size : Int32?

        # An array of objects containing information about the blocks.

        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        # The time when the BlockToken expires.

        @[JSON::Field(key: "ExpiryTime")]
        getter expiry_time : Time?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The size of the volume in GB.

        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int64?

        def initialize(
          @block_size : Int32? = nil,
          @blocks : Array(Types::Block)? = nil,
          @expiry_time : Time? = nil,
          @next_token : String? = nil,
          @volume_size : Int64? = nil
        )
        end
      end


      struct PutSnapshotBlockRequest
        include JSON::Serializable

        # The data to write to the block. The block data is not signed as part of the Signature Version 4
        # signing process. As a result, you must generate and provide a Base64-encoded SHA256 checksum for the
        # block data using the x-amz-Checksum header. Also, you must specify the checksum algorithm using the
        # x-amz-Checksum-Algorithm header. The checksum that you provide is part of the Signature Version 4
        # signing process. It is validated against a checksum generated by Amazon EBS to ensure the validity
        # and authenticity of the data. If the checksums do not correspond, the request fails. For more
        # information, see Using checksums with the EBS direct APIs in the Amazon Elastic Compute Cloud User
        # Guide .

        @[JSON::Field(key: "BlockData")]
        getter block_data : Bytes

        # The block index of the block in which to write the data. A block index is a logical index in units
        # of 512 KiB blocks. To identify the block index, divide the logical offset of the data in the logical
        # volume by the block size (logical offset of data/ 524288 ). The logical offset of the data must be
        # 512 KiB aligned.

        @[JSON::Field(key: "blockIndex")]
        getter block_index : Int32

        # A Base64-encoded SHA256 checksum of the data. Only SHA256 checksums are supported.

        @[JSON::Field(key: "x-amz-Checksum")]
        getter checksum : String

        # The algorithm used to generate the checksum. Currently, the only supported algorithm is SHA256 .

        @[JSON::Field(key: "x-amz-Checksum-Algorithm")]
        getter checksum_algorithm : String

        # The size of the data to write to the block, in bytes. Currently, the only supported size is 524288
        # bytes. Valid values: 524288

        @[JSON::Field(key: "x-amz-Data-Length")]
        getter data_length : Int32

        # The ID of the snapshot. If the specified snapshot is encrypted, you must have permission to use the
        # KMS key that was used to encrypt the snapshot. For more information, see Using encryption in the
        # Amazon Elastic Compute Cloud User Guide ..

        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String

        # The progress of the write process, as a percentage.

        @[JSON::Field(key: "x-amz-Progress")]
        getter progress : Int32?

        def initialize(
          @block_data : Bytes,
          @block_index : Int32,
          @checksum : String,
          @checksum_algorithm : String,
          @data_length : Int32,
          @snapshot_id : String,
          @progress : Int32? = nil
        )
        end
      end


      struct PutSnapshotBlockResponse
        include JSON::Serializable

        # The SHA256 checksum generated for the block data by Amazon EBS.

        @[JSON::Field(key: "x-amz-Checksum")]
        getter checksum : String?

        # The algorithm used by Amazon EBS to generate the checksum.

        @[JSON::Field(key: "x-amz-Checksum-Algorithm")]
        getter checksum_algorithm : String?

        def initialize(
          @checksum : String? = nil,
          @checksum_algorithm : String? = nil
        )
        end
      end

      # The number of API requests has exceeded the maximum allowed API request throttling limit for the
      # snapshot. For more information see Error retries .

      struct RequestThrottledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Your current service quotas do not allow you to perform this action.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct StartSnapshotRequest
        include JSON::Serializable

        # The size of the volume, in GiB. The maximum size is 65536 GiB (64 TiB).

        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int64

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully. The subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you do not
        # specify a client token, one is automatically generated by the Amazon Web Services SDK. For more
        # information, see Idempotency for StartSnapshot API in the Amazon Elastic Compute Cloud User Guide .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the snapshot.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether to encrypt the snapshot. You can't specify Encrypted and ParentSnapshotId in the
        # same request. If you specify both parameters, the request fails with ValidationException . The
        # encryption status of the snapshot depends on the values that you specify for Encrypted , KmsKeyArn ,
        # and ParentSnapshotId , and whether your Amazon Web Services account is enabled for encryption by
        # default . For more information, see Using encryption in the Amazon Elastic Compute Cloud User Guide
        # . To create an encrypted snapshot, you must have permission to use the KMS key. For more
        # information, see Permissions to use Key Management Service keys in the Amazon Elastic Compute Cloud
        # User Guide .

        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # The Amazon Resource Name (ARN) of the Key Management Service (KMS) key to be used to encrypt the
        # snapshot. The encryption status of the snapshot depends on the values that you specify for Encrypted
        # , KmsKeyArn , and ParentSnapshotId , and whether your Amazon Web Services account is enabled for
        # encryption by default . For more information, see Using encryption in the Amazon Elastic Compute
        # Cloud User Guide . To create an encrypted snapshot, you must have permission to use the KMS key. For
        # more information, see Permissions to use Key Management Service keys in the Amazon Elastic Compute
        # Cloud User Guide .

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The ID of the parent snapshot. If there is no parent snapshot, or if you are creating the first
        # snapshot for an on-premises volume, omit this parameter. You can't specify ParentSnapshotId and
        # Encrypted in the same request. If you specify both parameters, the request fails with
        # ValidationException . The encryption status of the snapshot depends on the values that you specify
        # for Encrypted , KmsKeyArn , and ParentSnapshotId , and whether your Amazon Web Services account is
        # enabled for encryption by default . For more information, see Using encryption in the Amazon Elastic
        # Compute Cloud User Guide . If you specify an encrypted parent snapshot, you must have permission to
        # use the KMS key that was used to encrypt the parent snapshot. For more information, see Permissions
        # to use Key Management Service keys in the Amazon Elastic Compute Cloud User Guide .

        @[JSON::Field(key: "ParentSnapshotId")]
        getter parent_snapshot_id : String?

        # The tags to apply to the snapshot.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The amount of time (in minutes) after which the snapshot is automatically cancelled if: No blocks
        # are written to the snapshot. The snapshot is not completed after writing the last block of data. If
        # no value is specified, the timeout defaults to 60 minutes.

        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        def initialize(
          @volume_size : Int64,
          @client_token : String? = nil,
          @description : String? = nil,
          @encrypted : Bool? = nil,
          @kms_key_arn : String? = nil,
          @parent_snapshot_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout : Int32? = nil
        )
        end
      end


      struct StartSnapshotResponse
        include JSON::Serializable

        # The size of the blocks in the snapshot, in bytes.

        @[JSON::Field(key: "BlockSize")]
        getter block_size : Int32?

        # The description of the snapshot.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the Key Management Service (KMS) key used to encrypt the snapshot.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The Amazon Web Services account ID of the snapshot owner.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The ID of the parent snapshot.

        @[JSON::Field(key: "ParentSnapshotId")]
        getter parent_snapshot_id : String?

        # The ID of the snapshot.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # Reserved for future use.

        @[JSON::Field(key: "SseType")]
        getter sse_type : String?

        # The timestamp when the snapshot was created.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The status of the snapshot.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags applied to the snapshot. You can specify up to 50 tags per snapshot. For more information,
        # see Tagging your Amazon EC2 resources in the Amazon Elastic Compute Cloud User Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The size of the volume, in GiB.

        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int64?

        def initialize(
          @block_size : Int32? = nil,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @owner_id : String? = nil,
          @parent_snapshot_id : String? = nil,
          @snapshot_id : String? = nil,
          @sse_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_size : Int64? = nil
        )
        end
      end

      # Describes a tag.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints of the EBS direct APIs.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the validation exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
