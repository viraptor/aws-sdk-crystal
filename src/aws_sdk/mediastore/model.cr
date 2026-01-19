module AwsSdk
  module MediaStore
    module Model
      API_VERSION = "2017-09-01"
      TARGET_PREFIX = "MediaStore_20170901"
      SIGNING_NAME = "mediastore"
      ENDPOINT_PREFIX = "mediastore"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediastore-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediastore-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediastore.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://mediastore.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CONTAINER = OperationModel.new(
        name: "CreateContainer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTAINER = OperationModel.new(
        name: "DeleteContainer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTAINER_POLICY = OperationModel.new(
        name: "DeleteContainerPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CORS_POLICY = OperationModel.new(
        name: "DeleteCorsPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LIFECYCLE_POLICY = OperationModel.new(
        name: "DeleteLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_METRIC_POLICY = OperationModel.new(
        name: "DeleteMetricPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTAINER = OperationModel.new(
        name: "DescribeContainer",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_POLICY = OperationModel.new(
        name: "GetContainerPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CORS_POLICY = OperationModel.new(
        name: "GetCorsPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LIFECYCLE_POLICY = OperationModel.new(
        name: "GetLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_METRIC_POLICY = OperationModel.new(
        name: "GetMetricPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTAINERS = OperationModel.new(
        name: "ListContainers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CONTAINER_POLICY = OperationModel.new(
        name: "PutContainerPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CORS_POLICY = OperationModel.new(
        name: "PutCorsPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LIFECYCLE_POLICY = OperationModel.new(
        name: "PutLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_METRIC_POLICY = OperationModel.new(
        name: "PutMetricPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      START_ACCESS_LOGGING = OperationModel.new(
        name: "StartAccessLogging",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ACCESS_LOGGING = OperationModel.new(
        name: "StopAccessLogging",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
