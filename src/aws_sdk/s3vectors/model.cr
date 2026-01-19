module AwsSdk
  module S3Vectors
    module Model
      API_VERSION = "2025-07-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "s3vectors"
      ENDPOINT_PREFIX = "s3vectors"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3vectors-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3vectors.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_INDEX = OperationModel.new(
        name: "CreateIndex",
        http_method: "POST",
        request_uri: "/CreateIndex"
      )

      CREATE_VECTOR_BUCKET = OperationModel.new(
        name: "CreateVectorBucket",
        http_method: "POST",
        request_uri: "/CreateVectorBucket"
      )

      DELETE_INDEX = OperationModel.new(
        name: "DeleteIndex",
        http_method: "POST",
        request_uri: "/DeleteIndex"
      )

      DELETE_VECTOR_BUCKET = OperationModel.new(
        name: "DeleteVectorBucket",
        http_method: "POST",
        request_uri: "/DeleteVectorBucket"
      )

      DELETE_VECTOR_BUCKET_POLICY = OperationModel.new(
        name: "DeleteVectorBucketPolicy",
        http_method: "POST",
        request_uri: "/DeleteVectorBucketPolicy"
      )

      DELETE_VECTORS = OperationModel.new(
        name: "DeleteVectors",
        http_method: "POST",
        request_uri: "/DeleteVectors"
      )

      GET_INDEX = OperationModel.new(
        name: "GetIndex",
        http_method: "POST",
        request_uri: "/GetIndex"
      )

      GET_VECTOR_BUCKET = OperationModel.new(
        name: "GetVectorBucket",
        http_method: "POST",
        request_uri: "/GetVectorBucket"
      )

      GET_VECTOR_BUCKET_POLICY = OperationModel.new(
        name: "GetVectorBucketPolicy",
        http_method: "POST",
        request_uri: "/GetVectorBucketPolicy"
      )

      GET_VECTORS = OperationModel.new(
        name: "GetVectors",
        http_method: "POST",
        request_uri: "/GetVectors"
      )

      LIST_INDEXES = OperationModel.new(
        name: "ListIndexes",
        http_method: "POST",
        request_uri: "/ListIndexes"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_VECTOR_BUCKETS = OperationModel.new(
        name: "ListVectorBuckets",
        http_method: "POST",
        request_uri: "/ListVectorBuckets"
      )

      LIST_VECTORS = OperationModel.new(
        name: "ListVectors",
        http_method: "POST",
        request_uri: "/ListVectors"
      )

      PUT_VECTOR_BUCKET_POLICY = OperationModel.new(
        name: "PutVectorBucketPolicy",
        http_method: "POST",
        request_uri: "/PutVectorBucketPolicy"
      )

      PUT_VECTORS = OperationModel.new(
        name: "PutVectors",
        http_method: "POST",
        request_uri: "/PutVectors"
      )

      QUERY_VECTORS = OperationModel.new(
        name: "QueryVectors",
        http_method: "POST",
        request_uri: "/QueryVectors"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )
    end
  end
end
