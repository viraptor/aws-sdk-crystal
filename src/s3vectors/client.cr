module Aws
  module S3Vectors
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a vector index within a vector bucket. To specify the vector bucket, you must use either the
      # vector bucket name or the vector bucket Amazon Resource Name (ARN). Permissions You must have the
      # s3vectors:CreateIndex permission to use this operation. You must have the s3vectors:TagResource
      # permission in addition to s3vectors:CreateIndex permission to create a vector index with tags.

      def create_index(
        data_type : String,
        dimension : Int32,
        distance_metric : String,
        index_name : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        metadata_configuration : Types::MetadataConfiguration? = nil,
        tags : Hash(String, String)? = nil,
        vector_bucket_arn : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateIndexInput.new(data_type: data_type, dimension: dimension, distance_metric: distance_metric, index_name: index_name, encryption_configuration: encryption_configuration, metadata_configuration: metadata_configuration, tags: tags, vector_bucket_arn: vector_bucket_arn, vector_bucket_name: vector_bucket_name)
        create_index(input)
      end

      def create_index(input : Types::CreateIndexInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a vector bucket in the Amazon Web Services Region that you want your bucket to be in.
      # Permissions You must have the s3vectors:CreateVectorBucket permission to use this operation. You
      # must have the s3vectors:TagResource permission in addition to s3vectors:CreateVectorBucket
      # permission to create a vector bucket with tags.

      def create_vector_bucket(
        vector_bucket_name : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVectorBucketInput.new(vector_bucket_name: vector_bucket_name, encryption_configuration: encryption_configuration, tags: tags)
        create_vector_bucket(input)
      end

      def create_vector_bucket(input : Types::CreateVectorBucketInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VECTOR_BUCKET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a vector index. To specify the vector index, you can either use both the vector bucket name
      # and vector index name, or use the vector index Amazon Resource Name (ARN). Permissions You must have
      # the s3vectors:DeleteIndex permission to use this operation.

      def delete_index(
        index_arn : String? = nil,
        index_name : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteIndexInput.new(index_arn: index_arn, index_name: index_name, vector_bucket_name: vector_bucket_name)
        delete_index(input)
      end

      def delete_index(input : Types::DeleteIndexInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a vector bucket. All vector indexes in the vector bucket must be deleted before the vector
      # bucket can be deleted. To perform this operation, you must use either the vector bucket name or the
      # vector bucket Amazon Resource Name (ARN). Permissions You must have the s3vectors:DeleteVectorBucket
      # permission to use this operation.

      def delete_vector_bucket(
        vector_bucket_arn : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVectorBucketInput.new(vector_bucket_arn: vector_bucket_arn, vector_bucket_name: vector_bucket_name)
        delete_vector_bucket(input)
      end

      def delete_vector_bucket(input : Types::DeleteVectorBucketInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VECTOR_BUCKET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a vector bucket policy. To specify the bucket, you must use either the vector bucket name or
      # the vector bucket Amazon Resource Name (ARN). Permissions You must have the
      # s3vectors:DeleteVectorBucketPolicy permission to use this operation.

      def delete_vector_bucket_policy(
        vector_bucket_arn : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVectorBucketPolicyInput.new(vector_bucket_arn: vector_bucket_arn, vector_bucket_name: vector_bucket_name)
        delete_vector_bucket_policy(input)
      end

      def delete_vector_bucket_policy(input : Types::DeleteVectorBucketPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VECTOR_BUCKET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one or more vectors in a vector index. To specify the vector index, you can either use both
      # the vector bucket name and vector index name, or use the vector index Amazon Resource Name (ARN).
      # Permissions You must have the s3vectors:DeleteVectors permission to use this operation.

      def delete_vectors(
        keys : Array(String),
        index_arn : String? = nil,
        index_name : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVectorsInput.new(keys: keys, index_arn: index_arn, index_name: index_name, vector_bucket_name: vector_bucket_name)
        delete_vectors(input)
      end

      def delete_vectors(input : Types::DeleteVectorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns vector index attributes. To specify the vector index, you can either use both the vector
      # bucket name and the vector index name, or use the vector index Amazon Resource Name (ARN).
      # Permissions You must have the s3vectors:GetIndex permission to use this operation.

      def get_index(
        index_arn : String? = nil,
        index_name : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::GetIndexInput.new(index_arn: index_arn, index_name: index_name, vector_bucket_name: vector_bucket_name)
        get_index(input)
      end

      def get_index(input : Types::GetIndexInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns vector bucket attributes. To specify the bucket, you must use either the vector bucket name
      # or the vector bucket Amazon Resource Name (ARN). Permissions You must have the
      # s3vectors:GetVectorBucket permission to use this operation.

      def get_vector_bucket(
        vector_bucket_arn : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::GetVectorBucketInput.new(vector_bucket_arn: vector_bucket_arn, vector_bucket_name: vector_bucket_name)
        get_vector_bucket(input)
      end

      def get_vector_bucket(input : Types::GetVectorBucketInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VECTOR_BUCKET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a vector bucket policy. To specify the bucket, you must use either the vector
      # bucket name or the vector bucket Amazon Resource Name (ARN). Permissions You must have the
      # s3vectors:GetVectorBucketPolicy permission to use this operation.

      def get_vector_bucket_policy(
        vector_bucket_arn : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::GetVectorBucketPolicyInput.new(vector_bucket_arn: vector_bucket_arn, vector_bucket_name: vector_bucket_name)
        get_vector_bucket_policy(input)
      end

      def get_vector_bucket_policy(input : Types::GetVectorBucketPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VECTOR_BUCKET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns vector attributes. To specify the vector index, you can either use both the vector bucket
      # name and the vector index name, or use the vector index Amazon Resource Name (ARN). Permissions You
      # must have the s3vectors:GetVectors permission to use this operation.

      def get_vectors(
        keys : Array(String),
        index_arn : String? = nil,
        index_name : String? = nil,
        return_data : Bool? = nil,
        return_metadata : Bool? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::GetVectorsInput.new(keys: keys, index_arn: index_arn, index_name: index_name, return_data: return_data, return_metadata: return_metadata, vector_bucket_name: vector_bucket_name)
        get_vectors(input)
      end

      def get_vectors(input : Types::GetVectorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the vector indexes within the specified vector bucket. To specify the bucket,
      # you must use either the vector bucket name or the vector bucket Amazon Resource Name (ARN).
      # Permissions You must have the s3vectors:ListIndexes permission to use this operation.

      def list_indexes(
        max_results : Int32? = nil,
        next_token : String? = nil,
        prefix : String? = nil,
        vector_bucket_arn : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::ListIndexesInput.new(max_results: max_results, next_token: next_token, prefix: prefix, vector_bucket_arn: vector_bucket_arn, vector_bucket_name: vector_bucket_name)
        list_indexes(input)
      end

      def list_indexes(input : Types::ListIndexesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDEXES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the tags applied to a specified Amazon S3 Vectors resource. Each tag is a label
      # consisting of a key and value pair. Tags can help you organize, track costs for, and control access
      # to resources. For a list of S3 resources that support tagging, see Managing tags for Amazon S3
      # resources . Permissions For vector buckets and vector indexes, you must have the
      # s3vectors:ListTagsForResource permission to use this operation.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the vector buckets that are owned by the authenticated sender of the request.
      # Permissions You must have the s3vectors:ListVectorBuckets permission to use this operation.

      def list_vector_buckets(
        max_results : Int32? = nil,
        next_token : String? = nil,
        prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListVectorBucketsInput.new(max_results: max_results, next_token: next_token, prefix: prefix)
        list_vector_buckets(input)
      end

      def list_vector_buckets(input : Types::ListVectorBucketsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VECTOR_BUCKETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List vectors in the specified vector index. To specify the vector index, you can either use both the
      # vector bucket name and the vector index name, or use the vector index Amazon Resource Name (ARN).
      # ListVectors operations proceed sequentially; however, for faster performance on a large number of
      # vectors in a vector index, applications can request a parallel ListVectors operation by providing
      # the segmentCount and segmentIndex parameters. Permissions You must have the s3vectors:ListVectors
      # permission to use this operation. Additional permissions are required based on the request
      # parameters you specify: With only s3vectors:ListVectors permission, you can list vector keys when
      # returnData and returnMetadata are both set to false or not specified.. If you set returnData or
      # returnMetadata to true, you must have both s3vectors:ListVectors and s3vectors:GetVectors
      # permissions. The request fails with a 403 Forbidden error if you request vector data or metadata
      # without the s3vectors:GetVectors permission.

      def list_vectors(
        index_arn : String? = nil,
        index_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        return_data : Bool? = nil,
        return_metadata : Bool? = nil,
        segment_count : Int32? = nil,
        segment_index : Int32? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::ListVectorsInput.new(index_arn: index_arn, index_name: index_name, max_results: max_results, next_token: next_token, return_data: return_data, return_metadata: return_metadata, segment_count: segment_count, segment_index: segment_index, vector_bucket_name: vector_bucket_name)
        list_vectors(input)
      end

      def list_vectors(input : Types::ListVectorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a bucket policy for a vector bucket. To specify the bucket, you must use either the vector
      # bucket name or the vector bucket Amazon Resource Name (ARN). Permissions You must have the
      # s3vectors:PutVectorBucketPolicy permission to use this operation.

      def put_vector_bucket_policy(
        policy : String,
        vector_bucket_arn : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::PutVectorBucketPolicyInput.new(policy: policy, vector_bucket_arn: vector_bucket_arn, vector_bucket_name: vector_bucket_name)
        put_vector_bucket_policy(input)
      end

      def put_vector_bucket_policy(input : Types::PutVectorBucketPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VECTOR_BUCKET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more vectors to a vector index. To specify the vector index, you can either use both the
      # vector bucket name and the vector index name, or use the vector index Amazon Resource Name (ARN).
      # For more information about limits, see Limitations and restrictions in the Amazon S3 User Guide .
      # When inserting vector data into your vector index, you must provide the vector data as float32
      # (32-bit floating point) values. If you pass higher-precision values to an Amazon Web Services SDK,
      # S3 Vectors converts the values to 32-bit floating point before storing them, and GetVectors ,
      # ListVectors , and QueryVectors operations return the float32 values. Different Amazon Web Services
      # SDKs may have different default numeric types, so ensure your vectors are properly formatted as
      # float32 values regardless of which SDK you're using. For example, in Python, use numpy.float32 or
      # explicitly cast your values. Permissions You must have the s3vectors:PutVectors permission to use
      # this operation.

      def put_vectors(
        vectors : Array(Types::PutInputVector),
        index_arn : String? = nil,
        index_name : String? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::PutVectorsInput.new(vectors: vectors, index_arn: index_arn, index_name: index_name, vector_bucket_name: vector_bucket_name)
        put_vectors(input)
      end

      def put_vectors(input : Types::PutVectorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs an approximate nearest neighbor search query in a vector index using a query vector. By
      # default, it returns the keys of approximate nearest neighbors. You can optionally include the
      # computed distance (between the query vector and each vector in the response), the vector data, and
      # metadata of each vector in the response. To specify the vector index, you can either use both the
      # vector bucket name and the vector index name, or use the vector index Amazon Resource Name (ARN).
      # Permissions You must have the s3vectors:QueryVectors permission to use this operation. Additional
      # permissions are required based on the request parameters you specify: With only
      # s3vectors:QueryVectors permission, you can retrieve vector keys of approximate nearest neighbors and
      # computed distances between these vectors. This permission is sufficient only when you don't set any
      # metadata filters and don't request vector data or metadata (by keeping the returnMetadata parameter
      # set to false or not specified). If you specify a metadata filter or set returnMetadata to true, you
      # must have both s3vectors:QueryVectors and s3vectors:GetVectors permissions. The request fails with a
      # 403 Forbidden error if you request metadata filtering, vector data, or metadata without the
      # s3vectors:GetVectors permission.

      def query_vectors(
        query_vector : Types::VectorData,
        top_k : Int32,
        filter : Types::Document? = nil,
        index_arn : String? = nil,
        index_name : String? = nil,
        return_distance : Bool? = nil,
        return_metadata : Bool? = nil,
        vector_bucket_name : String? = nil
      ) : Protocol::Request
        input = Types::QueryVectorsInput.new(query_vector: query_vector, top_k: top_k, filter: filter, index_arn: index_arn, index_name: index_name, return_distance: return_distance, return_metadata: return_metadata, vector_bucket_name: vector_bucket_name)
        query_vectors(input)
      end

      def query_vectors(input : Types::QueryVectorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::QUERY_VECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies one or more user-defined tags to an Amazon S3 Vectors resource or updates existing tags.
      # Each tag is a label consisting of a key and value pair. Tags can help you organize, track costs for,
      # and control access to your resources. You can add up to 50 tags for each resource. For a list of S3
      # resources that support tagging, see Managing tags for Amazon S3 resources . Permissions For vector
      # buckets and vector indexes, you must have the s3vectors:TagResource permission to use this
      # operation.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified user-defined tags from an Amazon S3 Vectors resource. You can pass one or more
      # tag keys. For a list of S3 resources that support tagging, see Managing tags for Amazon S3 resources
      # . Permissions For vector buckets and vector indexes, you must have the s3vectors:UntagResource
      # permission to use this operation.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
