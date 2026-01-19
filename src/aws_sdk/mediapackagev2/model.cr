module AwsSdk
  module MediaPackageV2
    module Model
      API_VERSION = "2022-12-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mediapackagev2"
      ENDPOINT_PREFIX = "mediapackagev2"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackagev2-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackagev2-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackagev2.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackagev2.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_HARVEST_JOB = OperationModel.new(
        name: "CancelHarvestJob",
        http_method: "PUT",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}/harvestJob/{HarvestJobName}"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/channelGroup/{ChannelGroupName}/channel"
      )

      CREATE_CHANNEL_GROUP = OperationModel.new(
        name: "CreateChannelGroup",
        http_method: "POST",
        request_uri: "/channelGroup"
      )

      CREATE_HARVEST_JOB = OperationModel.new(
        name: "CreateHarvestJob",
        http_method: "POST",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}/harvestJob"
      )

      CREATE_ORIGIN_ENDPOINT = OperationModel.new(
        name: "CreateOriginEndpoint",
        http_method: "POST",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "DELETE",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/"
      )

      DELETE_CHANNEL_GROUP = OperationModel.new(
        name: "DeleteChannelGroup",
        http_method: "DELETE",
        request_uri: "/channelGroup/{ChannelGroupName}"
      )

      DELETE_CHANNEL_POLICY = OperationModel.new(
        name: "DeleteChannelPolicy",
        http_method: "DELETE",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/policy"
      )

      DELETE_ORIGIN_ENDPOINT = OperationModel.new(
        name: "DeleteOriginEndpoint",
        http_method: "DELETE",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}"
      )

      DELETE_ORIGIN_ENDPOINT_POLICY = OperationModel.new(
        name: "DeleteOriginEndpointPolicy",
        http_method: "DELETE",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}/policy"
      )

      GET_CHANNEL = OperationModel.new(
        name: "GetChannel",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/"
      )

      GET_CHANNEL_GROUP = OperationModel.new(
        name: "GetChannelGroup",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}"
      )

      GET_CHANNEL_POLICY = OperationModel.new(
        name: "GetChannelPolicy",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/policy"
      )

      GET_HARVEST_JOB = OperationModel.new(
        name: "GetHarvestJob",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}/harvestJob/{HarvestJobName}"
      )

      GET_ORIGIN_ENDPOINT = OperationModel.new(
        name: "GetOriginEndpoint",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}"
      )

      GET_ORIGIN_ENDPOINT_POLICY = OperationModel.new(
        name: "GetOriginEndpointPolicy",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}/policy"
      )

      LIST_CHANNEL_GROUPS = OperationModel.new(
        name: "ListChannelGroups",
        http_method: "GET",
        request_uri: "/channelGroup"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/channel"
      )

      LIST_HARVEST_JOBS = OperationModel.new(
        name: "ListHarvestJobs",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/harvestJob"
      )

      LIST_ORIGIN_ENDPOINTS = OperationModel.new(
        name: "ListOriginEndpoints",
        http_method: "GET",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      PUT_CHANNEL_POLICY = OperationModel.new(
        name: "PutChannelPolicy",
        http_method: "PUT",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/policy"
      )

      PUT_ORIGIN_ENDPOINT_POLICY = OperationModel.new(
        name: "PutOriginEndpointPolicy",
        http_method: "POST",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}/policy"
      )

      RESET_CHANNEL_STATE = OperationModel.new(
        name: "ResetChannelState",
        http_method: "POST",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/reset"
      )

      RESET_ORIGIN_ENDPOINT_STATE = OperationModel.new(
        name: "ResetOriginEndpointState",
        http_method: "POST",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}/reset"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "PUT",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/"
      )

      UPDATE_CHANNEL_GROUP = OperationModel.new(
        name: "UpdateChannelGroup",
        http_method: "PUT",
        request_uri: "/channelGroup/{ChannelGroupName}"
      )

      UPDATE_ORIGIN_ENDPOINT = OperationModel.new(
        name: "UpdateOriginEndpoint",
        http_method: "PUT",
        request_uri: "/channelGroup/{ChannelGroupName}/channel/{ChannelName}/originEndpoint/{OriginEndpointName}"
      )
    end
  end
end
