require "json"
require "time"

module AwsSdk
  module MediaStoreData
    module Types

      # The specified container was not found for the specified account.
      struct ContainerNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct DeleteObjectRequest
        include JSON::Serializable

        # The path (including the file name) where the object is stored in the container. Format: &lt;folder
        # name&gt;/&lt;folder name&gt;/&lt;file name&gt;
        @[JSON::Field(key: "Path")]
        getter path : String

        def initialize(
          @path : String
        )
        end
      end

      struct DeleteObjectResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeObjectRequest
        include JSON::Serializable

        # The path (including the file name) where the object is stored in the container. Format: &lt;folder
        # name&gt;/&lt;folder name&gt;/&lt;file name&gt;
        @[JSON::Field(key: "Path")]
        getter path : String

        def initialize(
          @path : String
        )
        end
      end

      struct DescribeObjectResponse
        include JSON::Serializable

        # An optional CacheControl header that allows the caller to control the object's cache behavior.
        # Headers can be passed in as specified in the HTTP at
        # https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9 . Headers with a custom user-defined
        # value are also accepted.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The length of the object in bytes.
        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?

        # The content type of the object.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The ETag that represents a unique instance of the object.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The date and time that the object was last modified.
        @[JSON::Field(key: "Last-Modified")]
        getter last_modified : Time?

        def initialize(
          @cache_control : String? = nil,
          @content_length : Int64? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil
        )
        end
      end

      struct GetObjectRequest
        include JSON::Serializable

        # The path (including the file name) where the object is stored in the container. Format: &lt;folder
        # name&gt;/&lt;folder name&gt;/&lt;file name&gt; For example, to upload the file mlaw.avi to the
        # folder path premium\canada in the container movies , enter the path premium/canada/mlaw.avi . Do not
        # include the container name in this path. If the path includes any folders that don't exist yet, the
        # service creates them. For example, suppose you have an existing premium/usa subfolder. If you
        # specify premium/canada , the service creates a canada subfolder in the premium folder. You then have
        # two subfolders, usa and canada , in the premium folder. There is no correlation between the path to
        # the source and the path (folders) in the container in AWS Elemental MediaStore. For more information
        # about folders and how they exist in a container, see the AWS Elemental MediaStore User Guide . The
        # file name is the name that is assigned to the file that you upload. The file can have the same name
        # inside and outside of AWS Elemental MediaStore, or it can have the same name. The file name can
        # include or omit an extension.
        @[JSON::Field(key: "Path")]
        getter path : String

        # The range bytes of an object to retrieve. For more information about the Range header, see
        # http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35 . AWS Elemental MediaStore ignores
        # this header for partially uploaded objects that have streaming upload availability.
        @[JSON::Field(key: "Range")]
        getter range : String?

        def initialize(
          @path : String,
          @range : String? = nil
        )
        end
      end

      struct GetObjectResponse
        include JSON::Serializable

        # The HTML status code of the request. Status codes ranging from 200 to 299 indicate success. All
        # other status codes indicate the type of error that occurred.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32

        # The bytes of the object.
        @[JSON::Field(key: "Body")]
        getter body : Bytes?

        # An optional CacheControl header that allows the caller to control the object's cache behavior.
        # Headers can be passed in as specified in the HTTP spec at
        # https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9 . Headers with a custom user-defined
        # value are also accepted.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The length of the object in bytes.
        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?

        # The range of bytes to retrieve.
        @[JSON::Field(key: "Content-Range")]
        getter content_range : String?

        # The content type of the object.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The ETag that represents a unique instance of the object.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The date and time that the object was last modified.
        @[JSON::Field(key: "Last-Modified")]
        getter last_modified : Time?

        def initialize(
          @status_code : Int32,
          @body : Bytes? = nil,
          @cache_control : String? = nil,
          @content_length : Int64? = nil,
          @content_range : String? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil
        )
        end
      end

      # The service is temporarily unavailable.
      struct InternalServerError
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A metadata entry for a folder or object.
      struct Item
        include JSON::Serializable

        # The length of the item in bytes.
        @[JSON::Field(key: "ContentLength")]
        getter content_length : Int64?

        # The content type of the item.
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The ETag that represents a unique instance of the item.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The date and time that the item was last modified.
        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The name of the item.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The item type (folder or object).
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @content_length : Int64? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListItemsRequest
        include JSON::Serializable

        # The maximum number of results to return per API request. For example, you submit a ListItems request
        # with MaxResults set at 500. Although 2,000 items match your request, the service returns no more
        # than the first 500 items. (The service also returns a NextToken value that you can use to fetch the
        # next batch of results.) The service might return fewer results than the MaxResults value. If
        # MaxResults is not included in the request, the service defaults to pagination with a maximum of
        # 1,000 results per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token that identifies which batch of results that you want to see. For example, you submit a
        # ListItems request with MaxResults set at 500. The service returns the first batch of results (up to
        # 500) and a NextToken value. To see the next batch of results, you can submit the ListItems request a
        # second time and specify the NextToken value. Tokens expire after 15 minutes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The path in the container from which to retrieve items. Format: &lt;folder name&gt;/&lt;folder
        # name&gt;/&lt;file name&gt;
        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @path : String? = nil
        )
        end
      end

      struct ListItemsResponse
        include JSON::Serializable

        # The metadata entries for the folders and objects at the requested path.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Item)?

        # The token that can be used in a request to view the next set of results. For example, you submit a
        # ListItems request that matches 2,000 items with MaxResults set at 500. The service returns the first
        # batch of results (up to 500) and a NextToken value that can be used to fetch the next batch of
        # results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Item)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Could not perform an operation on an object that does not exist.
      struct ObjectNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct PutObjectRequest
        include JSON::Serializable

        # The bytes to be stored.
        @[JSON::Field(key: "Body")]
        getter body : Bytes

        # The path (including the file name) where the object is stored in the container. Format: &lt;folder
        # name&gt;/&lt;folder name&gt;/&lt;file name&gt; For example, to upload the file mlaw.avi to the
        # folder path premium\canada in the container movies , enter the path premium/canada/mlaw.avi . Do not
        # include the container name in this path. If the path includes any folders that don't exist yet, the
        # service creates them. For example, suppose you have an existing premium/usa subfolder. If you
        # specify premium/canada , the service creates a canada subfolder in the premium folder. You then have
        # two subfolders, usa and canada , in the premium folder. There is no correlation between the path to
        # the source and the path (folders) in the container in AWS Elemental MediaStore. For more information
        # about folders and how they exist in a container, see the AWS Elemental MediaStore User Guide . The
        # file name is the name that is assigned to the file that you upload. The file can have the same name
        # inside and outside of AWS Elemental MediaStore, or it can have the same name. The file name can
        # include or omit an extension.
        @[JSON::Field(key: "Path")]
        getter path : String

        # An optional CacheControl header that allows the caller to control the object's cache behavior.
        # Headers can be passed in as specified in the HTTP at
        # https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9 . Headers with a custom user-defined
        # value are also accepted.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The content type of the object.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Indicates the storage class of a Put request. Defaults to high-performance temporal storage class,
        # and objects are persisted into durable storage shortly after being received.
        @[JSON::Field(key: "x-amz-storage-class")]
        getter storage_class : String?

        # Indicates the availability of an object while it is still uploading. If the value is set to
        # streaming , the object is available for downloading after some initial buffering but before the
        # object is uploaded completely. If the value is set to standard , the object is available for
        # downloading only when it is uploaded completely. The default value for this header is standard . To
        # use this header, you must also set the HTTP Transfer-Encoding header to chunked .
        @[JSON::Field(key: "x-amz-upload-availability")]
        getter upload_availability : String?

        def initialize(
          @body : Bytes,
          @path : String,
          @cache_control : String? = nil,
          @content_type : String? = nil,
          @storage_class : String? = nil,
          @upload_availability : String? = nil
        )
        end
      end

      struct PutObjectResponse
        include JSON::Serializable

        # The SHA256 digest of the object that is persisted.
        @[JSON::Field(key: "ContentSHA256")]
        getter content_sha256 : String?

        # Unique identifier of the object in the container.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The storage class where the object was persisted. The class should be “Temporal”.
        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @content_sha256 : String? = nil,
          @e_tag : String? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # The requested content range is not valid.
      struct RequestedRangeNotSatisfiableException
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
