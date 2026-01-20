require "json"
require "time"

module AwsSdk
  module KeyspacesStreams
    module Types

      # You don't have sufficient access permissions to perform this operation. This exception occurs when
      # your IAM user or role lacks the required permissions to access the Amazon Keyspaces resource or
      # perform the requested action. Check your IAM policies and ensure they grant the necessary
      # permissions.

      struct AccessDeniedException
        include JSON::Serializable

        # You don't have sufficient permissions to perform this action.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetRecordsInput
        include JSON::Serializable

        # The unique identifier of the shard iterator. A shard iterator specifies the position in the shard
        # from which you want to start reading data records sequentially. You obtain this value by calling the
        # GetShardIterator operation. Each shard iterator is valid for 15 minutes after creation.

        @[JSON::Field(key: "shardIterator")]
        getter shard_iterator : String

        # The maximum number of records to return in a single GetRecords request. Default value is 1000. You
        # can specify a limit between 1 and 1000, but the actual number returned might be less than the
        # specified maximum if the size of the data for the returned records exceeds the internal size limit.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        def initialize(
          @shard_iterator : String,
          @max_results : Int32? = nil
        )
        end
      end


      struct GetRecordsOutput
        include JSON::Serializable

        # An array of change data records retrieved from the specified shard. Each record represents a single
        # data modification (insert, update, or delete) to a row in the Amazon Keyspaces table. Records
        # include the primary key columns and information about what data was modified.

        @[JSON::Field(key: "changeRecords")]
        getter change_records : Array(Types::Record)?

        # The next position in the shard from which to start sequentially reading data records. If null, the
        # shard has been closed and the requested iterator doesn't return any more data.

        @[JSON::Field(key: "nextShardIterator")]
        getter next_shard_iterator : String?

        def initialize(
          @change_records : Array(Types::Record)? = nil,
          @next_shard_iterator : String? = nil
        )
        end
      end


      struct GetShardIteratorInput
        include JSON::Serializable

        # The identifier of the shard within the stream. The shard ID uniquely identifies a subset of the
        # stream's data records that you want to access.

        @[JSON::Field(key: "shardId")]
        getter shard_id : String

        # Determines how the shard iterator is positioned. Must be one of the following: TRIM_HORIZON - Start
        # reading at the last untrimmed record in the shard, which is the oldest data record in the shard.
        # AT_SEQUENCE_NUMBER - Start reading exactly from the specified sequence number. AFTER_SEQUENCE_NUMBER
        # - Start reading right after the specified sequence number. LATEST - Start reading just after the
        # most recent record in the shard, so that you always read the most recent data.

        @[JSON::Field(key: "shardIteratorType")]
        getter shard_iterator_type : String

        # The Amazon Resource Name (ARN) of the stream for which to get the shard iterator. The ARN uniquely
        # identifies the stream within Amazon Keyspaces.

        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String

        # The sequence number of the data record in the shard from which to start reading. Required if
        # ShardIteratorType is AT_SEQUENCE_NUMBER or AFTER_SEQUENCE_NUMBER . This parameter is ignored for
        # other iterator types.

        @[JSON::Field(key: "sequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @shard_id : String,
          @shard_iterator_type : String,
          @stream_arn : String,
          @sequence_number : String? = nil
        )
        end
      end


      struct GetShardIteratorOutput
        include JSON::Serializable

        # The unique identifier for the shard iterator. This value is used in the GetRecords operation to
        # retrieve data records from the specified shard. Each shard iterator expires 15 minutes after it is
        # returned to the requester.

        @[JSON::Field(key: "shardIterator")]
        getter shard_iterator : String?

        def initialize(
          @shard_iterator : String? = nil
        )
        end
      end


      struct GetStreamInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stream for which detailed information is requested. This
        # uniquely identifies the specific stream you want to get information about.

        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String

        # The maximum number of shard objects to return in a single GetStream request. Default value is 100.
        # The minimum value is 1 and the maximum value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous GetStream operation. If this parameter is
        # specified, the response includes only records beyond the token, up to the value specified by
        # maxResults .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional filter criteria to apply when retrieving shards. You can filter shards based on their state
        # or other attributes to narrow down the results returned by the GetStream operation.

        @[JSON::Field(key: "shardFilter")]
        getter shard_filter : Types::ShardFilter?

        def initialize(
          @stream_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shard_filter : Types::ShardFilter? = nil
        )
        end
      end


      struct GetStreamOutput
        include JSON::Serializable

        # The date and time when the request to create this stream was issued. The value is represented in ISO
        # 8601 format.

        @[JSON::Field(key: "creationRequestDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_request_date_time : Time

        # The name of the keyspace containing the table associated with this stream. The keyspace name is part
        # of the table's hierarchical identifier in Amazon Keyspaces.

        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The Amazon Resource Name (ARN) that uniquely identifies the stream within Amazon Keyspaces. This ARN
        # can be used in other API operations to reference this specific stream.

        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String

        # A timestamp that serves as a unique identifier for this stream, used for debugging and monitoring
        # purposes. The stream label represents the point in time when the stream was created.

        @[JSON::Field(key: "streamLabel")]
        getter stream_label : String

        # The current status of the stream. Values can be ENABLING , ENABLED , DISABLING , or DISABLED .
        # Operations on the stream depend on its current status.

        @[JSON::Field(key: "streamStatus")]
        getter stream_status : String

        # The format of the data records in this stream. Currently, this can be one of the following options:
        # NEW_AND_OLD_IMAGES - both versions of the row, before and after the change. This is the default.
        # NEW_IMAGE - the version of the row after the change. OLD_IMAGE - the version of the row before the
        # change. KEYS_ONLY - the partition and clustering keys of the row that was changed.

        @[JSON::Field(key: "streamViewType")]
        getter stream_view_type : String

        # The name of the table associated with this stream. The stream captures changes to rows in this
        # Amazon Keyspaces table.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # A pagination token that can be used in a subsequent GetStream request. This token is returned if the
        # response contains more shards than can be returned in a single response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of shard objects associated with this stream. Each shard contains a subset of the stream's
        # data records and has its own unique identifier. The collection of shards represents the complete
        # stream data.

        @[JSON::Field(key: "shards")]
        getter shards : Array(Types::Shard)?

        def initialize(
          @creation_request_date_time : Time,
          @keyspace_name : String,
          @stream_arn : String,
          @stream_label : String,
          @stream_status : String,
          @stream_view_type : String,
          @table_name : String,
          @next_token : String? = nil,
          @shards : Array(Types::Shard)? = nil
        )
        end
      end

      # The Amazon Keyspaces service encountered an unexpected error while processing the request. This
      # internal server error is not related to your request parameters. Retry your request after a brief
      # delay. If the issue persists, contact Amazon Web Services Support with details of your request to
      # help identify and resolve the problem.

      struct InternalServerException
        include JSON::Serializable

        # The service encountered an internal error. Try your request again.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a cell in an Amazon Keyspaces table, containing both the value and metadata about the
      # cell.

      struct KeyspacesCell
        include JSON::Serializable

        # Metadata associated with this cell, such as time-to-live (TTL) expiration time and write timestamp.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::KeyspacesMetadata?

        # The value stored in this cell, which can be of various data types supported by Amazon Keyspaces.

        @[JSON::Field(key: "value")]
        getter value : Types::KeyspacesCellValue?

        def initialize(
          @metadata : Types::KeyspacesMetadata? = nil,
          @value : Types::KeyspacesCellValue? = nil
        )
        end
      end

      # Represents a key-value pair within a map data type in Amazon Keyspaces, including the associated
      # metadata.

      struct KeyspacesCellMapDefinition
        include JSON::Serializable

        # The key of this map entry in the Amazon Keyspaces cell.

        @[JSON::Field(key: "key")]
        getter key : Types::KeyspacesCellValue?

        # Metadata for this specific key-value pair within the map, such as timestamps and TTL information.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::KeyspacesMetadata?

        # The value associated with the key in this map entry.

        @[JSON::Field(key: "value")]
        getter value : Types::KeyspacesCellValue?

        def initialize(
          @key : Types::KeyspacesCellValue? = nil,
          @metadata : Types::KeyspacesMetadata? = nil,
          @value : Types::KeyspacesCellValue? = nil
        )
        end
      end

      # Represents the value of a cell in an Amazon Keyspaces table, supporting various data types with
      # type-specific fields.

      struct KeyspacesCellValue
        include JSON::Serializable

        # A value of ASCII text type, containing US-ASCII characters.

        @[JSON::Field(key: "asciiT")]
        getter ascii_t : String?

        # A 64-bit signed integer value.

        @[JSON::Field(key: "bigintT")]
        getter bigint_t : String?

        # A binary large object (BLOB) value stored as a Base64-encoded string.

        @[JSON::Field(key: "blobT")]
        getter blob_t : Bytes?

        # A Boolean value, either true or false .

        @[JSON::Field(key: "boolT")]
        getter bool_t : Bool?

        # A distributed counter value that can be incremented and decremented.

        @[JSON::Field(key: "counterT")]
        getter counter_t : String?

        # A date value without a time component, represented as days since epoch (January 1, 1970).

        @[JSON::Field(key: "dateT")]
        getter date_t : String?

        # A variable-precision decimal number value.

        @[JSON::Field(key: "decimalT")]
        getter decimal_t : String?

        # A 64-bit double-precision floating point value.

        @[JSON::Field(key: "doubleT")]
        getter double_t : String?

        # A 32-bit single-precision floating point value.

        @[JSON::Field(key: "floatT")]
        getter float_t : String?

        # An IP address value, either IPv4 or IPv6 format.

        @[JSON::Field(key: "inetT")]
        getter inet_t : String?

        # A 32-bit signed integer value.

        @[JSON::Field(key: "intT")]
        getter int_t : String?

        # An ordered collection of elements that can contain duplicate values.

        @[JSON::Field(key: "listT")]
        getter list_t : Array(Types::KeyspacesCell)?

        # A collection of key-value pairs where each key is unique.

        @[JSON::Field(key: "mapT")]
        getter map_t : Array(Types::KeyspacesCellMapDefinition)?

        # An unordered collection of unique elements.

        @[JSON::Field(key: "setT")]
        getter set_t : Array(Types::KeyspacesCell)?

        # A 16-bit signed integer value.

        @[JSON::Field(key: "smallintT")]
        getter smallint_t : String?

        # A UTF-8 encoded string value.

        @[JSON::Field(key: "textT")]
        getter text_t : String?

        # A time value without a date component, with nanosecond precision.

        @[JSON::Field(key: "timeT")]
        getter time_t : String?

        # A timestamp value representing date and time with millisecond precision.

        @[JSON::Field(key: "timestampT")]
        getter timestamp_t : String?

        # A universally unique identifier (UUID) that includes a timestamp component, ensuring both uniqueness
        # and time ordering.

        @[JSON::Field(key: "timeuuidT")]
        getter timeuuid_t : String?

        # An 8-bit signed integer value.

        @[JSON::Field(key: "tinyintT")]
        getter tinyint_t : String?

        # A fixed-length ordered list of elements, where each element can be of a different data type.

        @[JSON::Field(key: "tupleT")]
        getter tuple_t : Array(Types::KeyspacesCell)?

        # A user-defined type (UDT) value consisting of named fields, each with its own data type.

        @[JSON::Field(key: "udtT")]
        getter udt_t : Hash(String, Types::KeyspacesCell)?

        # A universally unique identifier (UUID) value.

        @[JSON::Field(key: "uuidT")]
        getter uuid_t : String?

        # A UTF-8 encoded string value, functionally equivalent to text type.

        @[JSON::Field(key: "varcharT")]
        getter varchar_t : String?

        # A variable precision integer value with arbitrary length.

        @[JSON::Field(key: "varintT")]
        getter varint_t : String?

        def initialize(
          @ascii_t : String? = nil,
          @bigint_t : String? = nil,
          @blob_t : Bytes? = nil,
          @bool_t : Bool? = nil,
          @counter_t : String? = nil,
          @date_t : String? = nil,
          @decimal_t : String? = nil,
          @double_t : String? = nil,
          @float_t : String? = nil,
          @inet_t : String? = nil,
          @int_t : String? = nil,
          @list_t : Array(Types::KeyspacesCell)? = nil,
          @map_t : Array(Types::KeyspacesCellMapDefinition)? = nil,
          @set_t : Array(Types::KeyspacesCell)? = nil,
          @smallint_t : String? = nil,
          @text_t : String? = nil,
          @time_t : String? = nil,
          @timestamp_t : String? = nil,
          @timeuuid_t : String? = nil,
          @tinyint_t : String? = nil,
          @tuple_t : Array(Types::KeyspacesCell)? = nil,
          @udt_t : Hash(String, Types::KeyspacesCell)? = nil,
          @uuid_t : String? = nil,
          @varchar_t : String? = nil,
          @varint_t : String? = nil
        )
        end
      end

      # Contains metadata information associated with Amazon Keyspaces cells and rows.

      struct KeyspacesMetadata
        include JSON::Serializable

        # The time at which the associated data will expire, based on the time-to-live (TTL) setting.

        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : String?

        # The timestamp at which the associated data was written to the database.

        @[JSON::Field(key: "writeTime")]
        getter write_time : String?

        def initialize(
          @expiration_time : String? = nil,
          @write_time : String? = nil
        )
        end
      end

      # Represents a row in an Amazon Keyspaces table, containing regular column values, static column
      # values, and row-level metadata.

      struct KeyspacesRow
        include JSON::Serializable

        # Metadata that applies to the entire row, such as timestamps and TTL information.

        @[JSON::Field(key: "rowMetadata")]
        getter row_metadata : Types::KeyspacesMetadata?

        # A map of static column cells shared by all rows with the same partition key, where keys are column
        # names and values are the corresponding cells.

        @[JSON::Field(key: "staticCells")]
        getter static_cells : Hash(String, Types::KeyspacesCell)?

        # A map of regular (non-static) column cells in the row, where keys are column names and values are
        # the corresponding cells.

        @[JSON::Field(key: "valueCells")]
        getter value_cells : Hash(String, Types::KeyspacesCell)?

        def initialize(
          @row_metadata : Types::KeyspacesMetadata? = nil,
          @static_cells : Hash(String, Types::KeyspacesCell)? = nil,
          @value_cells : Hash(String, Types::KeyspacesCell)? = nil
        )
        end
      end


      struct ListStreamsInput
        include JSON::Serializable

        # The name of the keyspace for which to list streams. If specified, only streams associated with
        # tables in this keyspace are returned. If omitted, streams from all keyspaces are included in the
        # results.

        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String?

        # The maximum number of streams to return in a single ListStreams request. Default value is 100. The
        # minimum value is 1 and the maximum value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous ListStreams operation. If this parameter is
        # specified, the response includes only records beyond the token, up to the value specified by
        # maxResults .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the table for which to list streams. Must be used together with keyspaceName . If
        # specified, only streams associated with this specific table are returned.

        @[JSON::Field(key: "tableName")]
        getter table_name : String?

        def initialize(
          @keyspace_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @table_name : String? = nil
        )
        end
      end


      struct ListStreamsOutput
        include JSON::Serializable

        # A pagination token that can be used in a subsequent ListStreams request. This token is returned if
        # the response contains more streams than can be returned in a single response based on the MaxResults
        # parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of stream objects, each containing summary information about a stream including its ARN,
        # status, and associated table information. This list includes all streams that match the request
        # criteria.

        @[JSON::Field(key: "streams")]
        getter streams : Array(Types::Stream)?

        def initialize(
          @next_token : String? = nil,
          @streams : Array(Types::Stream)? = nil
        )
        end
      end

      # Represents a change data capture record for a row in an Amazon Keyspaces table, containing both the
      # new and old states of the row.

      struct Record
        include JSON::Serializable

        # The clustering key columns and their values for the affected row, which determine the order of rows
        # within a partition.

        @[JSON::Field(key: "clusteringKeys")]
        getter clustering_keys : Hash(String, Types::KeyspacesCellValue)?

        # The timestamp indicating when this change data capture record was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The version of the record format, used to track the evolution of the record structure over time.

        @[JSON::Field(key: "eventVersion")]
        getter event_version : String?

        # The state of the row after the change operation that generated this record.

        @[JSON::Field(key: "newImage")]
        getter new_image : Types::KeyspacesRow?

        # The state of the row before the change operation that generated this record.

        @[JSON::Field(key: "oldImage")]
        getter old_image : Types::KeyspacesRow?

        # The origin or source of this change data capture record.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        # The partition key columns and their values for the affected row.

        @[JSON::Field(key: "partitionKeys")]
        getter partition_keys : Hash(String, Types::KeyspacesCellValue)?

        # A unique identifier assigned to this record within the shard, used for ordering and tracking
        # purposes.

        @[JSON::Field(key: "sequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @clustering_keys : Hash(String, Types::KeyspacesCellValue)? = nil,
          @created_at : Time? = nil,
          @event_version : String? = nil,
          @new_image : Types::KeyspacesRow? = nil,
          @old_image : Types::KeyspacesRow? = nil,
          @origin : String? = nil,
          @partition_keys : Hash(String, Types::KeyspacesCellValue)? = nil,
          @sequence_number : String? = nil
        )
        end
      end

      # The requested resource doesn't exist or could not be found. This exception occurs when you attempt
      # to access a keyspace, table, stream, or other Amazon Keyspaces resource that doesn't exist or that
      # has been deleted. Verify that the resource identifier is correct and that the resource exists in
      # your account.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The requested resource wasn't found. Verify that the resource exists and try again.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines a range of sequence numbers within a change data capture stream's shard for Amazon
      # Keyspaces.

      struct SequenceNumberRange
        include JSON::Serializable

        # The ending sequence number of the range, which may be null for open-ended ranges.

        @[JSON::Field(key: "endingSequenceNumber")]
        getter ending_sequence_number : String?

        # The starting sequence number of the range.

        @[JSON::Field(key: "startingSequenceNumber")]
        getter starting_sequence_number : String?

        def initialize(
          @ending_sequence_number : String? = nil,
          @starting_sequence_number : String? = nil
        )
        end
      end

      # Represents a uniquely identified group of change records within a change data capture stream for
      # Amazon Keyspaces.

      struct Shard
        include JSON::Serializable

        # The identifiers of parent shards that this shard evolved from, if this shard was created through
        # resharding.

        @[JSON::Field(key: "parentShardIds")]
        getter parent_shard_ids : Array(String)?

        # The range of sequence numbers contained within this shard.

        @[JSON::Field(key: "sequenceNumberRange")]
        getter sequence_number_range : Types::SequenceNumberRange?

        # A unique identifier for this shard within the stream.

        @[JSON::Field(key: "shardId")]
        getter shard_id : String?

        def initialize(
          @parent_shard_ids : Array(String)? = nil,
          @sequence_number_range : Types::SequenceNumberRange? = nil,
          @shard_id : String? = nil
        )
        end
      end

      # A filter used to limit the shards returned by a GetStream operation.

      struct ShardFilter
        include JSON::Serializable

        # The identifier of a specific shard used to filter results based on the specified filter type.

        @[JSON::Field(key: "shardId")]
        getter shard_id : String?

        # The type of shard filter to use, which determines how the shardId parameter is interpreted.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @shard_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents a change data capture stream for an Amazon Keyspaces table, which enables tracking and
      # processing of data changes.

      struct Stream
        include JSON::Serializable

        # The name of the keyspace containing the table associated with this stream.

        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The Amazon Resource Name (ARN) that uniquely identifies this stream.

        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String

        # A unique identifier for this stream that can be used in stream operations.

        @[JSON::Field(key: "streamLabel")]
        getter stream_label : String

        # The name of the table associated with this stream.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @keyspace_name : String,
          @stream_arn : String,
          @stream_label : String,
          @table_name : String
        )
        end
      end

      # The request rate is too high and exceeds the service's throughput limits. This exception occurs when
      # you send too many requests in a short period of time. Implement exponential backoff in your retry
      # strategy to handle this exception. Reducing your request frequency or distributing requests more
      # evenly can help avoid throughput exceptions.

      struct ThrottlingException
        include JSON::Serializable

        # The request was denied due to request throttling. Reduce the frequency of requests and try again.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request validation failed because one or more input parameters failed validation. This exception
      # occurs when there are syntax errors in the request, field constraints are violated, or required
      # parameters are missing. To help you fix the issue, the exception message provides details about
      # which parameter failed and why.

      struct ValidationException
        include JSON::Serializable

        # An error occurred validating your request. See the error message for details.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The input fails to satisfy the constraints specified by the service. Check the error details and
        # modify your request.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end
    end
  end
end
