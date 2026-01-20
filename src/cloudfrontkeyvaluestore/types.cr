require "json"
require "time"

module Aws
  module CloudFrontKeyValueStore
    module Types

      # Access denied.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Resource is not in expected state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteKeyRequest
        include JSON::Serializable

        # The current version (ETag) of the Key Value Store that you are deleting keys from, which you can get
        # using DescribeKeyValueStore.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The key to delete.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The Amazon Resource Name (ARN) of the Key Value Store.

        @[JSON::Field(key: "KvsARN")]
        getter kvs_arn : String

        def initialize(
          @if_match : String,
          @key : String,
          @kvs_arn : String
        )
        end
      end

      # List item for keys to delete.

      struct DeleteKeyRequestListItem
        include JSON::Serializable

        # The key of the key value pair to be deleted.

        @[JSON::Field(key: "Key")]
        getter key : String

        def initialize(
          @key : String
        )
        end
      end

      # Metadata information about a Key Value Store.

      struct DeleteKeyResponse
        include JSON::Serializable

        # The current version identifier of the Key Value Store after the successful delete.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # Number of key value pairs in the Key Value Store after the successful delete.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32

        # Total size of the Key Value Store after the successful delete, in bytes.

        @[JSON::Field(key: "TotalSizeInBytes")]
        getter total_size_in_bytes : Int64

        def initialize(
          @e_tag : String,
          @item_count : Int32,
          @total_size_in_bytes : Int64
        )
        end
      end


      struct DescribeKeyValueStoreRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Key Value Store.

        @[JSON::Field(key: "KvsARN")]
        getter kvs_arn : String

        def initialize(
          @kvs_arn : String
        )
        end
      end

      # Metadata information about a Key Value Store.

      struct DescribeKeyValueStoreResponse
        include JSON::Serializable

        # Date and time when the Key Value Store was created.

        @[JSON::Field(key: "Created")]
        getter created : Time

        # The version identifier for the current version of the Key Value Store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # Number of key value pairs in the Key Value Store.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32

        # The Amazon Resource Name (ARN) of the Key Value Store.

        @[JSON::Field(key: "KvsARN")]
        getter kvs_arn : String

        # Total size of the Key Value Store in bytes.

        @[JSON::Field(key: "TotalSizeInBytes")]
        getter total_size_in_bytes : Int64

        # The reason for Key Value Store creation failure.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # Date and time when the key value pairs in the Key Value Store was last modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The current status of the Key Value Store.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created : Time,
          @e_tag : String,
          @item_count : Int32,
          @kvs_arn : String,
          @total_size_in_bytes : Int64,
          @failure_reason : String? = nil,
          @last_modified : Time? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetKeyRequest
        include JSON::Serializable

        # The key to get.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The Amazon Resource Name (ARN) of the Key Value Store.

        @[JSON::Field(key: "KvsARN")]
        getter kvs_arn : String

        def initialize(
          @key : String,
          @kvs_arn : String
        )
        end
      end

      # A key value pair.

      struct GetKeyResponse
        include JSON::Serializable

        # Number of key value pairs in the Key Value Store.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32

        # The key of the key value pair.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Total size of the Key Value Store in bytes.

        @[JSON::Field(key: "TotalSizeInBytes")]
        getter total_size_in_bytes : Int64

        # The value of the key value pair.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @item_count : Int32,
          @key : String,
          @total_size_in_bytes : Int64,
          @value : String
        )
        end
      end

      # Internal server error.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListKeysRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Key Value Store.

        @[JSON::Field(key: "KvsARN")]
        getter kvs_arn : String

        # Maximum number of results that are returned per call. The default is 10 and maximum allowed page is
        # 50.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If nextToken is returned in the response, there are more results available. Make the next call using
        # the returned token to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @kvs_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListKeysResponse
        include JSON::Serializable

        # Key value pairs

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListKeysResponseListItem)?

        # If nextToken is returned in the response, there are more results available. Make the next call using
        # the returned token to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListKeysResponseListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A key value pair.

      struct ListKeysResponseListItem
        include JSON::Serializable

        # The key of the key value pair.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the key value pair.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # A key value pair.

      struct PutKeyRequest
        include JSON::Serializable

        # The current version (ETag) of the Key Value Store that you are putting keys into, which you can get
        # using DescribeKeyValueStore.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The key to put.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The Amazon Resource Name (ARN) of the Key Value Store.

        @[JSON::Field(key: "KvsARN")]
        getter kvs_arn : String

        # The value to put.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @if_match : String,
          @key : String,
          @kvs_arn : String,
          @value : String
        )
        end
      end

      # List item for key value pair to put.

      struct PutKeyRequestListItem
        include JSON::Serializable

        # The key of the key value pair list item to put.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the key value pair to put.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Metadata information about a Key Value Store.

      struct PutKeyResponse
        include JSON::Serializable

        # The current version identifier of the Key Value Store after the successful put.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # Number of key value pairs in the Key Value Store after the successful put.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32

        # Total size of the Key Value Store after the successful put, in bytes.

        @[JSON::Field(key: "TotalSizeInBytes")]
        getter total_size_in_bytes : Int64

        def initialize(
          @e_tag : String,
          @item_count : Int32,
          @total_size_in_bytes : Int64
        )
        end
      end

      # Resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Limit exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateKeysRequest
        include JSON::Serializable

        # The current version (ETag) of the Key Value Store that you are updating keys of, which you can get
        # using DescribeKeyValueStore.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The Amazon Resource Name (ARN) of the Key Value Store.

        @[JSON::Field(key: "KvsARN")]
        getter kvs_arn : String

        # List of keys to delete.

        @[JSON::Field(key: "Deletes")]
        getter deletes : Array(Types::DeleteKeyRequestListItem)?

        # List of key value pairs to put.

        @[JSON::Field(key: "Puts")]
        getter puts : Array(Types::PutKeyRequestListItem)?

        def initialize(
          @if_match : String,
          @kvs_arn : String,
          @deletes : Array(Types::DeleteKeyRequestListItem)? = nil,
          @puts : Array(Types::PutKeyRequestListItem)? = nil
        )
        end
      end

      # Metadata information about a Key Value Store.

      struct UpdateKeysResponse
        include JSON::Serializable

        # The current version identifier of the Key Value Store after the successful update.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # Number of key value pairs in the Key Value Store after the successful update.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32

        # Total size of the Key Value Store after the successful update, in bytes.

        @[JSON::Field(key: "TotalSizeInBytes")]
        getter total_size_in_bytes : Int64

        def initialize(
          @e_tag : String,
          @item_count : Int32,
          @total_size_in_bytes : Int64
        )
        end
      end

      # Validation failed.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
