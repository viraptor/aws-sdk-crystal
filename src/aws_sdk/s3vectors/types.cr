require "json"
require "time"

module AwsSdk
  module S3Vectors
    module Types

      # Access denied.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request failed because a vector bucket name or a vector index name already exists. Vector bucket
      # names must be unique within your Amazon Web Services account for each Amazon Web Services Region.
      # Vector index names must be unique within your vector bucket. Choose a different vector bucket name
      # or vector index name, and try again.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateIndexInput
        include JSON::Serializable

        # The data type of the vectors to be inserted into the vector index.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The dimensions of the vectors to be inserted into the vector index.

        @[JSON::Field(key: "dimension")]
        getter dimension : Int32

        # The distance metric to be used for similarity search.

        @[JSON::Field(key: "distanceMetric")]
        getter distance_metric : String

        # The name of the vector index to create.

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        # The encryption configuration for a vector index. By default, if you don't specify, all new vectors
        # in the vector index will use the encryption configuration of the vector bucket.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The metadata configuration for the vector index.

        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        # An array of user-defined tags that you would like to apply to the vector index that you are
        # creating. A tag is a key-value pair that you apply to your resources. Tags can help you organize,
        # track costs, and control access to resources. For more information, see Tagging for cost allocation
        # or attribute-based access control (ABAC) . You must have the s3vectors:TagResource permission in
        # addition to s3vectors:CreateIndex permission to create a vector index with tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the vector bucket to create the vector index in.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        # The name of the vector bucket to create the vector index in.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @data_type : String,
          @dimension : Int32,
          @distance_metric : String,
          @index_name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @vector_bucket_arn : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct CreateIndexOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created vector index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String

        def initialize(
          @index_arn : String
        )
        end
      end


      struct CreateVectorBucketInput
        include JSON::Serializable

        # The name of the vector bucket to create.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String

        # The encryption configuration for the vector bucket. By default, if you don't specify, all new
        # vectors in Amazon S3 vector buckets use server-side encryption with Amazon S3 managed keys (SSE-S3),
        # specifically AES256 .

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # An array of user-defined tags that you would like to apply to the vector bucket that you are
        # creating. A tag is a key-value pair that you apply to your resources. Tags can help you organize and
        # control access to resources. For more information, see Tagging for cost allocation or
        # attribute-based access control (ABAC) . You must have the s3vectors:TagResource permission in
        # addition to s3vectors:CreateVectorBucket permission to create a vector bucket with tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @vector_bucket_name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateVectorBucketOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created vector bucket.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String

        def initialize(
          @vector_bucket_arn : String
        )
        end
      end


      struct DeleteIndexInput
        include JSON::Serializable

        # The ARN of the vector index to delete.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index to delete.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct DeleteIndexOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteVectorBucketInput
        include JSON::Serializable

        # The ARN of the vector bucket to delete.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        # The name of the vector bucket to delete.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @vector_bucket_arn : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct DeleteVectorBucketOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteVectorBucketPolicyInput
        include JSON::Serializable

        # The ARN of the vector bucket to delete the policy from.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        # The name of the vector bucket to delete the policy from.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @vector_bucket_arn : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct DeleteVectorBucketPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteVectorsInput
        include JSON::Serializable

        # The keys of the vectors to delete.

        @[JSON::Field(key: "keys")]
        getter keys : Array(String)

        # The ARN of the vector index that contains a vector you want to delete.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index that contains a vector you want to delete.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @keys : Array(String),
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct DeleteVectorsOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # The encryption configuration for a vector bucket or index. By default, if you don't specify, all new
      # vectors in Amazon S3 vector buckets use server-side encryption with Amazon S3 managed keys (SSE-S3),
      # specifically AES256 . You can optionally override bucket level encryption settings, and set a
      # specific encryption configuration for a vector index at the time of index creation.

      struct EncryptionConfiguration
        include JSON::Serializable

        # Amazon Web Services Key Management Service (KMS) customer managed key ID to use for the encryption
        # configuration. This parameter is allowed if and only if sseType is set to aws:kms . To specify the
        # KMS key, you must use the format of the KMS key Amazon Resource Name (ARN). For example, specify Key
        # ARN in the following format:
        # arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The server-side encryption type to use for the encryption configuration of the vector bucket. By
        # default, if you don't specify, all new vectors in Amazon S3 vector buckets use server-side
        # encryption with Amazon S3 managed keys (SSE-S3), specifically AES256 .

        @[JSON::Field(key: "sseType")]
        getter sse_type : String?

        def initialize(
          @kms_key_arn : String? = nil,
          @sse_type : String? = nil
        )
        end
      end


      struct GetIndexInput
        include JSON::Serializable

        # The ARN of the vector index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct GetIndexOutput
        include JSON::Serializable

        # The attributes of the vector index.

        @[JSON::Field(key: "index")]
        getter index : Types::Index

        def initialize(
          @index : Types::Index
        )
        end
      end

      # The attributes of a vector returned by the GetVectors operation.

      struct GetOutputVector
        include JSON::Serializable

        # The name of the vector.

        @[JSON::Field(key: "key")]
        getter key : String

        # The vector data of the vector.

        @[JSON::Field(key: "data")]
        getter data : Types::VectorData?

        # Metadata about the vector.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::VectorMetadata?

        def initialize(
          @key : String,
          @data : Types::VectorData? = nil,
          @metadata : Types::VectorMetadata? = nil
        )
        end
      end


      struct GetVectorBucketInput
        include JSON::Serializable

        # The ARN of the vector bucket to retrieve information about.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        # The name of the vector bucket to retrieve information about.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @vector_bucket_arn : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct GetVectorBucketOutput
        include JSON::Serializable

        # The attributes of the vector bucket.

        @[JSON::Field(key: "vectorBucket")]
        getter vector_bucket : Types::VectorBucket

        def initialize(
          @vector_bucket : Types::VectorBucket
        )
        end
      end


      struct GetVectorBucketPolicyInput
        include JSON::Serializable

        # The ARN of the vector bucket.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        # The name of the vector bucket.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @vector_bucket_arn : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct GetVectorBucketPolicyOutput
        include JSON::Serializable

        # The JSON that defines the policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetVectorsInput
        include JSON::Serializable

        # The names of the vectors you want to return attributes for.

        @[JSON::Field(key: "keys")]
        getter keys : Array(String)

        # The ARN of the vector index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # Indicates whether to include the vector data in the response. The default value is false .

        @[JSON::Field(key: "returnData")]
        getter return_data : Bool?

        # Indicates whether to include metadata in the response. The default value is false .

        @[JSON::Field(key: "returnMetadata")]
        getter return_metadata : Bool?

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @keys : Array(String),
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @return_data : Bool? = nil,
          @return_metadata : Bool? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct GetVectorsOutput
        include JSON::Serializable

        # The attributes of the vectors.

        @[JSON::Field(key: "vectors")]
        getter vectors : Array(Types::GetOutputVector)

        def initialize(
          @vectors : Array(Types::GetOutputVector)
        )
        end
      end

      # The attributes of a vector index.

      struct Index
        include JSON::Serializable

        # Date and time when the vector index was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The data type of the vectors inserted into the vector index.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The number of values in the vectors that are inserted into the vector index.

        @[JSON::Field(key: "dimension")]
        getter dimension : Int32

        # The distance metric to be used for similarity search.

        @[JSON::Field(key: "distanceMetric")]
        getter distance_metric : String

        # The Amazon Resource Name (ARN) of the vector index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String

        # The name of the vector index.

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String

        # The encryption configuration for a vector index. By default, if you don't specify, all new vectors
        # in the vector index will use the encryption configuration of the vector bucket.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The metadata configuration for the vector index.

        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        def initialize(
          @creation_time : Time,
          @data_type : String,
          @dimension : Int32,
          @distance_metric : String,
          @index_arn : String,
          @index_name : String,
          @vector_bucket_name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil
        )
        end
      end

      # Summary information about a vector index.

      struct IndexSummary
        include JSON::Serializable

        # Date and time when the vector index was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the vector index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String

        # The name of the vector index.

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String

        def initialize(
          @creation_time : Time,
          @index_arn : String,
          @index_name : String,
          @vector_bucket_name : String
        )
        end
      end

      # The request failed due to an internal server error.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The specified Amazon Web Services KMS key isn't enabled.

      struct KmsDisabledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request was rejected for one of the following reasons: The KeyUsage value of the KMS key is
      # incompatible with the API operation. The encryption algorithm or signing algorithm specified for the
      # operation is incompatible with the type of key material in the KMS key ( KeySpec ). For more
      # information, see InvalidKeyUsageException in the Amazon Web Services Key Management Service API
      # Reference .

      struct KmsInvalidKeyUsageException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The key state of the KMS key isn't compatible with the operation. For more information, see
      # KMSInvalidStateException in the Amazon Web Services Key Management Service API Reference .

      struct KmsInvalidStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The KMS key can't be found.

      struct KmsNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListIndexesInput
        include JSON::Serializable

        # The maximum number of items to be returned in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The previous pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Limits the response to vector indexes that begin with the specified prefix.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # The ARN of the vector bucket that contains the vector indexes.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        # The name of the vector bucket that contains the vector indexes.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil,
          @vector_bucket_arn : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct ListIndexesOutput
        include JSON::Serializable

        # The attributes of the vector indexes

        @[JSON::Field(key: "indexes")]
        getter indexes : Array(Types::IndexSummary)

        # The next pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @indexes : Array(Types::IndexSummary),
          @next_token : String? = nil
        )
        end
      end

      # The attributes of a vector returned by the ListVectors operation.

      struct ListOutputVector
        include JSON::Serializable

        # The name of the vector.

        @[JSON::Field(key: "key")]
        getter key : String

        # The vector data of the vector.

        @[JSON::Field(key: "data")]
        getter data : Types::VectorData?

        # Metadata about the vector.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::VectorMetadata?

        def initialize(
          @key : String,
          @data : Types::VectorData? = nil,
          @metadata : Types::VectorMetadata? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon S3 Vectors resource that you want to list tags for. The
        # tagged resource can be a vector bucket or a vector index.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The user-defined tags that are applied to the S3 Vectors resource. For more information, see Tagging
        # for cost allocation or attribute-based access control (ABAC) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end


      struct ListVectorBucketsInput
        include JSON::Serializable

        # The maximum number of vector buckets to be returned in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The previous pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Limits the response to vector buckets that begin with the specified prefix.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListVectorBucketsOutput
        include JSON::Serializable

        # The list of vector buckets owned by the requester.

        @[JSON::Field(key: "vectorBuckets")]
        getter vector_buckets : Array(Types::VectorBucketSummary)

        # The element is included in the response when there are more buckets to be listed with pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @vector_buckets : Array(Types::VectorBucketSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListVectorsInput
        include JSON::Serializable

        # The Amazon resource Name (ARN) of the vector index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The maximum number of vectors to return on a page. If you don't specify maxResults , the ListVectors
        # operation uses a default value of 500. If the processed dataset size exceeds 1 MB before reaching
        # the maxResults value, the operation stops and returns the vectors that are retrieved up to that
        # point, along with a nextToken that you can use in a subsequent request to retrieve the next set of
        # results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token from a previous request. The value of this field is empty for an initial request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # If true, the vector data of each vector will be included in the response. The default value is false
        # .

        @[JSON::Field(key: "returnData")]
        getter return_data : Bool?

        # If true, the metadata associated with each vector will be included in the response. The default
        # value is false .

        @[JSON::Field(key: "returnMetadata")]
        getter return_metadata : Bool?

        # For a parallel ListVectors request, segmentCount represents the total number of vector segments into
        # which the ListVectors operation will be divided. The value of segmentCount corresponds to the number
        # of application workers that will perform the parallel ListVectors operation. For example, if you
        # want to use four application threads to list vectors in a vector index, specify a segmentCount value
        # of 4. If you specify a segmentCount value of 1, the ListVectors operation will be sequential rather
        # than parallel. If you specify segmentCount , you must also specify segmentIndex .

        @[JSON::Field(key: "segmentCount")]
        getter segment_count : Int32?

        # For a parallel ListVectors request, segmentIndex is the index of the segment from which to list
        # vectors in the current request. It identifies an individual segment to be listed by an application
        # worker. Segment IDs are zero-based, so the first segment is always 0. For example, if you want to
        # use four application threads to list vectors in a vector index, then the first thread specifies a
        # segmentIndex value of 0, the second thread specifies 1, and so on. The value of segmentIndex must be
        # less than the value provided for segmentCount . If you provide segmentIndex , you must also provide
        # segmentCount .

        @[JSON::Field(key: "segmentIndex")]
        getter segment_index : Int32?

        # The name of the vector bucket.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @return_data : Bool? = nil,
          @return_metadata : Bool? = nil,
          @segment_count : Int32? = nil,
          @segment_index : Int32? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct ListVectorsOutput
        include JSON::Serializable

        # Vectors in the current segment.

        @[JSON::Field(key: "vectors")]
        getter vectors : Array(Types::ListOutputVector)

        # Pagination token to be used in the subsequent request. The field is empty if no further pagination
        # is required.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @vectors : Array(Types::ListOutputVector),
          @next_token : String? = nil
        )
        end
      end

      # The metadata configuration for a vector index.

      struct MetadataConfiguration
        include JSON::Serializable

        # Non-filterable metadata keys allow you to enrich vectors with additional context during storage and
        # retrieval. Unlike default metadata keys, these keys can’t be used as query filters. Non-filterable
        # metadata keys can be retrieved but can’t be searched, queried, or filtered. You can access
        # non-filterable metadata keys of your vectors after finding the vectors. For more information about
        # non-filterable metadata keys, see Vectors and Limitations and restrictions in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "nonFilterableMetadataKeys")]
        getter non_filterable_metadata_keys : Array(String)

        def initialize(
          @non_filterable_metadata_keys : Array(String)
        )
        end
      end

      # The request was rejected because the specified resource can't be found.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The attributes of a vector to add to a vector index.

      struct PutInputVector
        include JSON::Serializable

        # The vector data of the vector. Vector dimensions must match the dimension count that's configured
        # for the vector index. For the cosine distance metric, zero vectors (vectors containing all zeros)
        # aren't allowed. For both cosine and euclidean distance metrics, vector data must contain only valid
        # floating-point values. Invalid values such as NaN (Not a Number) or Infinity aren't allowed.

        @[JSON::Field(key: "data")]
        getter data : Types::VectorData

        # The name of the vector. The key uniquely identifies the vector in a vector index.

        @[JSON::Field(key: "key")]
        getter key : String

        # Metadata about the vector. All metadata entries undergo validation to ensure they meet the format
        # requirements for size and data types.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::VectorMetadata?

        def initialize(
          @data : Types::VectorData,
          @key : String,
          @metadata : Types::VectorMetadata? = nil
        )
        end
      end


      struct PutVectorBucketPolicyInput
        include JSON::Serializable

        # The JSON that defines the policy. For more information about bucket policies for S3 Vectors, see
        # Managing vector bucket policies in the Amazon S3 User Guide .

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the vector bucket.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        # The name of the vector bucket.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @policy : String,
          @vector_bucket_arn : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct PutVectorBucketPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct PutVectorsInput
        include JSON::Serializable

        # The vectors to add to a vector index. The number of vectors in a single request must not exceed the
        # resource capacity, otherwise the request will be rejected with the error ServiceUnavailableException
        # with the error message "Currently unable to handle the request".

        @[JSON::Field(key: "vectors")]
        getter vectors : Array(Types::PutInputVector)

        # The ARN of the vector index where you want to write vectors.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index where you want to write vectors.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @vectors : Array(Types::PutInputVector),
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct PutVectorsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The attributes of a vector in the approximate nearest neighbor search.

      struct QueryOutputVector
        include JSON::Serializable

        # The key of the vector in the approximate nearest neighbor search.

        @[JSON::Field(key: "key")]
        getter key : String

        # The measure of similarity between the vector in the response and the query vector.

        @[JSON::Field(key: "distance")]
        getter distance : Float64?

        # The metadata associated with the vector, if requested.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::VectorMetadata?

        def initialize(
          @key : String,
          @distance : Float64? = nil,
          @metadata : Types::VectorMetadata? = nil
        )
        end
      end


      struct QueryVectorsInput
        include JSON::Serializable

        # The query vector. Ensure that the query vector has the same dimension as the dimension of the vector
        # index that's being queried. For example, if your vector index contains vectors with 384 dimensions,
        # your query vector must also have 384 dimensions.

        @[JSON::Field(key: "queryVector")]
        getter query_vector : Types::VectorData

        # The number of results to return for each query.

        @[JSON::Field(key: "topK")]
        getter top_k : Int32

        # Metadata filter to apply during the query. For more information about metadata keys, see Metadata
        # filtering in the Amazon S3 User Guide .

        @[JSON::Field(key: "filter")]
        getter filter : Types::Document?

        # The ARN of the vector index that you want to query.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index that you want to query.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # Indicates whether to include the computed distance in the response. The default value is false .

        @[JSON::Field(key: "returnDistance")]
        getter return_distance : Bool?

        # Indicates whether to include metadata in the response. The default value is false .

        @[JSON::Field(key: "returnMetadata")]
        getter return_metadata : Bool?

        # The name of the vector bucket that contains the vector index.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String?

        def initialize(
          @query_vector : Types::VectorData,
          @top_k : Int32,
          @filter : Types::Document? = nil,
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @return_distance : Bool? = nil,
          @return_metadata : Bool? = nil,
          @vector_bucket_name : String? = nil
        )
        end
      end


      struct QueryVectorsOutput
        include JSON::Serializable

        # The distance metric that was used for the similarity search calculation. This is the same distance
        # metric that was configured for the vector index when it was created.

        @[JSON::Field(key: "distanceMetric")]
        getter distance_metric : String

        # The vectors in the approximate nearest neighbor search.

        @[JSON::Field(key: "vectors")]
        getter vectors : Array(Types::QueryOutputVector)

        def initialize(
          @distance_metric : String,
          @vectors : Array(Types::QueryOutputVector)
        )
        end
      end

      # The request timed out. Retry your request.

      struct RequestTimeoutException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Your request exceeds a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The service is unavailable. Wait briefly and retry your request. If it continues to fail, increase
      # your waiting time between retries.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon S3 Vectors resource that you're applying tags to. The
        # tagged resource can be a vector bucket or a vector index.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The user-defined tag that you want to add to the specified S3 Vectors resource. For more
        # information, see Tagging for cost allocation or attribute-based access control (ABAC) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to request throttling.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon S3 Vectors resource that you're removing tags from. The
        # tagged resource can be a vector bucket or a vector index.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The array of tag keys that you're removing from the S3 Vectors resource. For more information, see
        # Tagging for cost allocation or attribute-based access control (ABAC) .

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The requested action isn't valid.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # A list of specific validation failures that are encountered during input processing. Each entry in
        # the list contains a path to the field that failed validation and a detailed message that explains
        # why the validation failed. To satisfy multiple constraints, a field can appear multiple times in
        # this list if it failed. You can use the information to identify and fix the specific validation
        # issues in your request.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Contains information about a validation exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message about the validation exception.

        @[JSON::Field(key: "message")]
        getter message : String

        # A path about the validation exception.

        @[JSON::Field(key: "path")]
        getter path : String

        def initialize(
          @message : String,
          @path : String
        )
        end
      end

      # The attributes of a vector bucket.

      struct VectorBucket
        include JSON::Serializable

        # Date and time when the vector bucket was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the vector bucket.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String

        # The name of the vector bucket.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String

        # The encryption configuration for the vector bucket.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        def initialize(
          @creation_time : Time,
          @vector_bucket_arn : String,
          @vector_bucket_name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil
        )
        end
      end

      # Summary information about a vector bucket.

      struct VectorBucketSummary
        include JSON::Serializable

        # Date and time when the vector bucket was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the vector bucket.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String

        # The name of the vector bucket.

        @[JSON::Field(key: "vectorBucketName")]
        getter vector_bucket_name : String

        def initialize(
          @creation_time : Time,
          @vector_bucket_arn : String,
          @vector_bucket_name : String
        )
        end
      end

      # The vector data in different formats.

      struct VectorData
        include JSON::Serializable

        # The vector data as 32-bit floating point numbers. The number of elements in this array must exactly
        # match the dimension of the vector index where the operation is being performed.

        @[JSON::Field(key: "float32")]
        getter float32 : Array(Float64)?

        def initialize(
          @float32 : Array(Float64)? = nil
        )
        end
      end


      struct VectorMetadata
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
