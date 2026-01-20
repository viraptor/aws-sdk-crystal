module Aws
  module MediaTailor
    module Model
      API_VERSION = "2018-04-23"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mediatailor"
      ENDPOINT_PREFIX = "api.mediatailor"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.mediatailor-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.mediatailor-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.mediatailor.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://api.mediatailor.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CONFIGURE_LOGS_FOR_CHANNEL = OperationModel.new(
        name: "ConfigureLogsForChannel",
        http_method: "PUT",
        request_uri: "/configureLogs/channel"
      )

      CONFIGURE_LOGS_FOR_PLAYBACK_CONFIGURATION = OperationModel.new(
        name: "ConfigureLogsForPlaybackConfiguration",
        http_method: "PUT",
        request_uri: "/configureLogs/playbackConfiguration"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/channel/{ChannelName}"
      )

      CREATE_LIVE_SOURCE = OperationModel.new(
        name: "CreateLiveSource",
        http_method: "POST",
        request_uri: "/sourceLocation/{SourceLocationName}/liveSource/{LiveSourceName}"
      )

      CREATE_PREFETCH_SCHEDULE = OperationModel.new(
        name: "CreatePrefetchSchedule",
        http_method: "POST",
        request_uri: "/prefetchSchedule/{PlaybackConfigurationName}/{Name}"
      )

      CREATE_PROGRAM = OperationModel.new(
        name: "CreateProgram",
        http_method: "POST",
        request_uri: "/channel/{ChannelName}/program/{ProgramName}"
      )

      CREATE_SOURCE_LOCATION = OperationModel.new(
        name: "CreateSourceLocation",
        http_method: "POST",
        request_uri: "/sourceLocation/{SourceLocationName}"
      )

      CREATE_VOD_SOURCE = OperationModel.new(
        name: "CreateVodSource",
        http_method: "POST",
        request_uri: "/sourceLocation/{SourceLocationName}/vodSource/{VodSourceName}"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "DELETE",
        request_uri: "/channel/{ChannelName}"
      )

      DELETE_CHANNEL_POLICY = OperationModel.new(
        name: "DeleteChannelPolicy",
        http_method: "DELETE",
        request_uri: "/channel/{ChannelName}/policy"
      )

      DELETE_LIVE_SOURCE = OperationModel.new(
        name: "DeleteLiveSource",
        http_method: "DELETE",
        request_uri: "/sourceLocation/{SourceLocationName}/liveSource/{LiveSourceName}"
      )

      DELETE_PLAYBACK_CONFIGURATION = OperationModel.new(
        name: "DeletePlaybackConfiguration",
        http_method: "DELETE",
        request_uri: "/playbackConfiguration/{Name}"
      )

      DELETE_PREFETCH_SCHEDULE = OperationModel.new(
        name: "DeletePrefetchSchedule",
        http_method: "DELETE",
        request_uri: "/prefetchSchedule/{PlaybackConfigurationName}/{Name}"
      )

      DELETE_PROGRAM = OperationModel.new(
        name: "DeleteProgram",
        http_method: "DELETE",
        request_uri: "/channel/{ChannelName}/program/{ProgramName}"
      )

      DELETE_SOURCE_LOCATION = OperationModel.new(
        name: "DeleteSourceLocation",
        http_method: "DELETE",
        request_uri: "/sourceLocation/{SourceLocationName}"
      )

      DELETE_VOD_SOURCE = OperationModel.new(
        name: "DeleteVodSource",
        http_method: "DELETE",
        request_uri: "/sourceLocation/{SourceLocationName}/vodSource/{VodSourceName}"
      )

      DESCRIBE_CHANNEL = OperationModel.new(
        name: "DescribeChannel",
        http_method: "GET",
        request_uri: "/channel/{ChannelName}"
      )

      DESCRIBE_LIVE_SOURCE = OperationModel.new(
        name: "DescribeLiveSource",
        http_method: "GET",
        request_uri: "/sourceLocation/{SourceLocationName}/liveSource/{LiveSourceName}"
      )

      DESCRIBE_PROGRAM = OperationModel.new(
        name: "DescribeProgram",
        http_method: "GET",
        request_uri: "/channel/{ChannelName}/program/{ProgramName}"
      )

      DESCRIBE_SOURCE_LOCATION = OperationModel.new(
        name: "DescribeSourceLocation",
        http_method: "GET",
        request_uri: "/sourceLocation/{SourceLocationName}"
      )

      DESCRIBE_VOD_SOURCE = OperationModel.new(
        name: "DescribeVodSource",
        http_method: "GET",
        request_uri: "/sourceLocation/{SourceLocationName}/vodSource/{VodSourceName}"
      )

      GET_CHANNEL_POLICY = OperationModel.new(
        name: "GetChannelPolicy",
        http_method: "GET",
        request_uri: "/channel/{ChannelName}/policy"
      )

      GET_CHANNEL_SCHEDULE = OperationModel.new(
        name: "GetChannelSchedule",
        http_method: "GET",
        request_uri: "/channel/{ChannelName}/schedule"
      )

      GET_PLAYBACK_CONFIGURATION = OperationModel.new(
        name: "GetPlaybackConfiguration",
        http_method: "GET",
        request_uri: "/playbackConfiguration/{Name}"
      )

      GET_PREFETCH_SCHEDULE = OperationModel.new(
        name: "GetPrefetchSchedule",
        http_method: "GET",
        request_uri: "/prefetchSchedule/{PlaybackConfigurationName}/{Name}"
      )

      LIST_ALERTS = OperationModel.new(
        name: "ListAlerts",
        http_method: "GET",
        request_uri: "/alerts"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/channels"
      )

      LIST_LIVE_SOURCES = OperationModel.new(
        name: "ListLiveSources",
        http_method: "GET",
        request_uri: "/sourceLocation/{SourceLocationName}/liveSources"
      )

      LIST_PLAYBACK_CONFIGURATIONS = OperationModel.new(
        name: "ListPlaybackConfigurations",
        http_method: "GET",
        request_uri: "/playbackConfigurations"
      )

      LIST_PREFETCH_SCHEDULES = OperationModel.new(
        name: "ListPrefetchSchedules",
        http_method: "POST",
        request_uri: "/prefetchSchedule/{PlaybackConfigurationName}"
      )

      LIST_SOURCE_LOCATIONS = OperationModel.new(
        name: "ListSourceLocations",
        http_method: "GET",
        request_uri: "/sourceLocations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      LIST_VOD_SOURCES = OperationModel.new(
        name: "ListVodSources",
        http_method: "GET",
        request_uri: "/sourceLocation/{SourceLocationName}/vodSources"
      )

      PUT_CHANNEL_POLICY = OperationModel.new(
        name: "PutChannelPolicy",
        http_method: "PUT",
        request_uri: "/channel/{ChannelName}/policy"
      )

      PUT_PLAYBACK_CONFIGURATION = OperationModel.new(
        name: "PutPlaybackConfiguration",
        http_method: "PUT",
        request_uri: "/playbackConfiguration"
      )

      START_CHANNEL = OperationModel.new(
        name: "StartChannel",
        http_method: "PUT",
        request_uri: "/channel/{ChannelName}/start"
      )

      STOP_CHANNEL = OperationModel.new(
        name: "StopChannel",
        http_method: "PUT",
        request_uri: "/channel/{ChannelName}/stop"
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
        request_uri: "/channel/{ChannelName}"
      )

      UPDATE_LIVE_SOURCE = OperationModel.new(
        name: "UpdateLiveSource",
        http_method: "PUT",
        request_uri: "/sourceLocation/{SourceLocationName}/liveSource/{LiveSourceName}"
      )

      UPDATE_PROGRAM = OperationModel.new(
        name: "UpdateProgram",
        http_method: "PUT",
        request_uri: "/channel/{ChannelName}/program/{ProgramName}"
      )

      UPDATE_SOURCE_LOCATION = OperationModel.new(
        name: "UpdateSourceLocation",
        http_method: "PUT",
        request_uri: "/sourceLocation/{SourceLocationName}"
      )

      UPDATE_VOD_SOURCE = OperationModel.new(
        name: "UpdateVodSource",
        http_method: "PUT",
        request_uri: "/sourceLocation/{SourceLocationName}/vodSource/{VodSourceName}"
      )
    end
  end
end
