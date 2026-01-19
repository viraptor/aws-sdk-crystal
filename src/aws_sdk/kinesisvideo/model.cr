module AwsSdk
  module KinesisVideo
    module Model
      API_VERSION = "2017-09-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "kinesisvideo"
      ENDPOINT_PREFIX = "kinesisvideo"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesisvideo-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesisvideo-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesisvideo.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://kinesisvideo.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_SIGNALING_CHANNEL = OperationModel.new(
        name: "CreateSignalingChannel",
        http_method: "POST",
        request_uri: "/createSignalingChannel"
      )

      CREATE_STREAM = OperationModel.new(
        name: "CreateStream",
        http_method: "POST",
        request_uri: "/createStream"
      )

      DELETE_EDGE_CONFIGURATION = OperationModel.new(
        name: "DeleteEdgeConfiguration",
        http_method: "POST",
        request_uri: "/deleteEdgeConfiguration"
      )

      DELETE_SIGNALING_CHANNEL = OperationModel.new(
        name: "DeleteSignalingChannel",
        http_method: "POST",
        request_uri: "/deleteSignalingChannel"
      )

      DELETE_STREAM = OperationModel.new(
        name: "DeleteStream",
        http_method: "POST",
        request_uri: "/deleteStream"
      )

      DESCRIBE_EDGE_CONFIGURATION = OperationModel.new(
        name: "DescribeEdgeConfiguration",
        http_method: "POST",
        request_uri: "/describeEdgeConfiguration"
      )

      DESCRIBE_IMAGE_GENERATION_CONFIGURATION = OperationModel.new(
        name: "DescribeImageGenerationConfiguration",
        http_method: "POST",
        request_uri: "/describeImageGenerationConfiguration"
      )

      DESCRIBE_MAPPED_RESOURCE_CONFIGURATION = OperationModel.new(
        name: "DescribeMappedResourceConfiguration",
        http_method: "POST",
        request_uri: "/describeMappedResourceConfiguration"
      )

      DESCRIBE_MEDIA_STORAGE_CONFIGURATION = OperationModel.new(
        name: "DescribeMediaStorageConfiguration",
        http_method: "POST",
        request_uri: "/describeMediaStorageConfiguration"
      )

      DESCRIBE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "DescribeNotificationConfiguration",
        http_method: "POST",
        request_uri: "/describeNotificationConfiguration"
      )

      DESCRIBE_SIGNALING_CHANNEL = OperationModel.new(
        name: "DescribeSignalingChannel",
        http_method: "POST",
        request_uri: "/describeSignalingChannel"
      )

      DESCRIBE_STREAM = OperationModel.new(
        name: "DescribeStream",
        http_method: "POST",
        request_uri: "/describeStream"
      )

      DESCRIBE_STREAM_STORAGE_CONFIGURATION = OperationModel.new(
        name: "DescribeStreamStorageConfiguration",
        http_method: "POST",
        request_uri: "/describeStreamStorageConfiguration"
      )

      GET_DATA_ENDPOINT = OperationModel.new(
        name: "GetDataEndpoint",
        http_method: "POST",
        request_uri: "/getDataEndpoint"
      )

      GET_SIGNALING_CHANNEL_ENDPOINT = OperationModel.new(
        name: "GetSignalingChannelEndpoint",
        http_method: "POST",
        request_uri: "/getSignalingChannelEndpoint"
      )

      LIST_EDGE_AGENT_CONFIGURATIONS = OperationModel.new(
        name: "ListEdgeAgentConfigurations",
        http_method: "POST",
        request_uri: "/listEdgeAgentConfigurations"
      )

      LIST_SIGNALING_CHANNELS = OperationModel.new(
        name: "ListSignalingChannels",
        http_method: "POST",
        request_uri: "/listSignalingChannels"
      )

      LIST_STREAMS = OperationModel.new(
        name: "ListStreams",
        http_method: "POST",
        request_uri: "/listStreams"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/ListTagsForResource"
      )

      LIST_TAGS_FOR_STREAM = OperationModel.new(
        name: "ListTagsForStream",
        http_method: "POST",
        request_uri: "/listTagsForStream"
      )

      START_EDGE_CONFIGURATION_UPDATE = OperationModel.new(
        name: "StartEdgeConfigurationUpdate",
        http_method: "POST",
        request_uri: "/startEdgeConfigurationUpdate"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/TagResource"
      )

      TAG_STREAM = OperationModel.new(
        name: "TagStream",
        http_method: "POST",
        request_uri: "/tagStream"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/UntagResource"
      )

      UNTAG_STREAM = OperationModel.new(
        name: "UntagStream",
        http_method: "POST",
        request_uri: "/untagStream"
      )

      UPDATE_DATA_RETENTION = OperationModel.new(
        name: "UpdateDataRetention",
        http_method: "POST",
        request_uri: "/updateDataRetention"
      )

      UPDATE_IMAGE_GENERATION_CONFIGURATION = OperationModel.new(
        name: "UpdateImageGenerationConfiguration",
        http_method: "POST",
        request_uri: "/updateImageGenerationConfiguration"
      )

      UPDATE_MEDIA_STORAGE_CONFIGURATION = OperationModel.new(
        name: "UpdateMediaStorageConfiguration",
        http_method: "POST",
        request_uri: "/updateMediaStorageConfiguration"
      )

      UPDATE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "UpdateNotificationConfiguration",
        http_method: "POST",
        request_uri: "/updateNotificationConfiguration"
      )

      UPDATE_SIGNALING_CHANNEL = OperationModel.new(
        name: "UpdateSignalingChannel",
        http_method: "POST",
        request_uri: "/updateSignalingChannel"
      )

      UPDATE_STREAM = OperationModel.new(
        name: "UpdateStream",
        http_method: "POST",
        request_uri: "/updateStream"
      )

      UPDATE_STREAM_STORAGE_CONFIGURATION = OperationModel.new(
        name: "UpdateStreamStorageConfiguration",
        http_method: "POST",
        request_uri: "/updateStreamStorageConfiguration"
      )
    end
  end
end
