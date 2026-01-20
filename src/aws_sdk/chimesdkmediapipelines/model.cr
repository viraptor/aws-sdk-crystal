module AwsSdk
  module ChimeSDKMediaPipelines
    module Model
      API_VERSION = "2021-07-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "chime"
      ENDPOINT_PREFIX = "media-pipelines-chime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://media-pipelines-chime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://media-pipelines-chime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://media-pipelines-chime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://media-pipelines-chime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_MEDIA_CAPTURE_PIPELINE = OperationModel.new(
        name: "CreateMediaCapturePipeline",
        http_method: "POST",
        request_uri: "/sdk-media-capture-pipelines"
      )

      CREATE_MEDIA_CONCATENATION_PIPELINE = OperationModel.new(
        name: "CreateMediaConcatenationPipeline",
        http_method: "POST",
        request_uri: "/sdk-media-concatenation-pipelines"
      )

      CREATE_MEDIA_INSIGHTS_PIPELINE = OperationModel.new(
        name: "CreateMediaInsightsPipeline",
        http_method: "POST",
        request_uri: "/media-insights-pipelines"
      )

      CREATE_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION = OperationModel.new(
        name: "CreateMediaInsightsPipelineConfiguration",
        http_method: "POST",
        request_uri: "/media-insights-pipeline-configurations"
      )

      CREATE_MEDIA_LIVE_CONNECTOR_PIPELINE = OperationModel.new(
        name: "CreateMediaLiveConnectorPipeline",
        http_method: "POST",
        request_uri: "/sdk-media-live-connector-pipelines"
      )

      CREATE_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL = OperationModel.new(
        name: "CreateMediaPipelineKinesisVideoStreamPool",
        http_method: "POST",
        request_uri: "/media-pipeline-kinesis-video-stream-pools"
      )

      CREATE_MEDIA_STREAM_PIPELINE = OperationModel.new(
        name: "CreateMediaStreamPipeline",
        http_method: "POST",
        request_uri: "/sdk-media-stream-pipelines"
      )

      DELETE_MEDIA_CAPTURE_PIPELINE = OperationModel.new(
        name: "DeleteMediaCapturePipeline",
        http_method: "DELETE",
        request_uri: "/sdk-media-capture-pipelines/{mediaPipelineId}"
      )

      DELETE_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION = OperationModel.new(
        name: "DeleteMediaInsightsPipelineConfiguration",
        http_method: "DELETE",
        request_uri: "/media-insights-pipeline-configurations/{identifier}"
      )

      DELETE_MEDIA_PIPELINE = OperationModel.new(
        name: "DeleteMediaPipeline",
        http_method: "DELETE",
        request_uri: "/sdk-media-pipelines/{mediaPipelineId}"
      )

      DELETE_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL = OperationModel.new(
        name: "DeleteMediaPipelineKinesisVideoStreamPool",
        http_method: "DELETE",
        request_uri: "/media-pipeline-kinesis-video-stream-pools/{identifier}"
      )

      GET_MEDIA_CAPTURE_PIPELINE = OperationModel.new(
        name: "GetMediaCapturePipeline",
        http_method: "GET",
        request_uri: "/sdk-media-capture-pipelines/{mediaPipelineId}"
      )

      GET_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION = OperationModel.new(
        name: "GetMediaInsightsPipelineConfiguration",
        http_method: "GET",
        request_uri: "/media-insights-pipeline-configurations/{identifier}"
      )

      GET_MEDIA_PIPELINE = OperationModel.new(
        name: "GetMediaPipeline",
        http_method: "GET",
        request_uri: "/sdk-media-pipelines/{mediaPipelineId}"
      )

      GET_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL = OperationModel.new(
        name: "GetMediaPipelineKinesisVideoStreamPool",
        http_method: "GET",
        request_uri: "/media-pipeline-kinesis-video-stream-pools/{identifier}"
      )

      GET_SPEAKER_SEARCH_TASK = OperationModel.new(
        name: "GetSpeakerSearchTask",
        http_method: "GET",
        request_uri: "/media-insights-pipelines/{identifier}/speaker-search-tasks/{speakerSearchTaskId}"
      )

      GET_VOICE_TONE_ANALYSIS_TASK = OperationModel.new(
        name: "GetVoiceToneAnalysisTask",
        http_method: "GET",
        request_uri: "/media-insights-pipelines/{identifier}/voice-tone-analysis-tasks/{voiceToneAnalysisTaskId}"
      )

      LIST_MEDIA_CAPTURE_PIPELINES = OperationModel.new(
        name: "ListMediaCapturePipelines",
        http_method: "GET",
        request_uri: "/sdk-media-capture-pipelines"
      )

      LIST_MEDIA_INSIGHTS_PIPELINE_CONFIGURATIONS = OperationModel.new(
        name: "ListMediaInsightsPipelineConfigurations",
        http_method: "GET",
        request_uri: "/media-insights-pipeline-configurations"
      )

      LIST_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOLS = OperationModel.new(
        name: "ListMediaPipelineKinesisVideoStreamPools",
        http_method: "GET",
        request_uri: "/media-pipeline-kinesis-video-stream-pools"
      )

      LIST_MEDIA_PIPELINES = OperationModel.new(
        name: "ListMediaPipelines",
        http_method: "GET",
        request_uri: "/sdk-media-pipelines"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      START_SPEAKER_SEARCH_TASK = OperationModel.new(
        name: "StartSpeakerSearchTask",
        http_method: "POST",
        request_uri: "/media-insights-pipelines/{identifier}/speaker-search-tasks?operation=start"
      )

      START_VOICE_TONE_ANALYSIS_TASK = OperationModel.new(
        name: "StartVoiceToneAnalysisTask",
        http_method: "POST",
        request_uri: "/media-insights-pipelines/{identifier}/voice-tone-analysis-tasks?operation=start"
      )

      STOP_SPEAKER_SEARCH_TASK = OperationModel.new(
        name: "StopSpeakerSearchTask",
        http_method: "POST",
        request_uri: "/media-insights-pipelines/{identifier}/speaker-search-tasks/{speakerSearchTaskId}?operation=stop"
      )

      STOP_VOICE_TONE_ANALYSIS_TASK = OperationModel.new(
        name: "StopVoiceToneAnalysisTask",
        http_method: "POST",
        request_uri: "/media-insights-pipelines/{identifier}/voice-tone-analysis-tasks/{voiceToneAnalysisTaskId}?operation=stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags?operation=tag-resource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/tags?operation=untag-resource"
      )

      UPDATE_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION = OperationModel.new(
        name: "UpdateMediaInsightsPipelineConfiguration",
        http_method: "PUT",
        request_uri: "/media-insights-pipeline-configurations/{identifier}"
      )

      UPDATE_MEDIA_INSIGHTS_PIPELINE_STATUS = OperationModel.new(
        name: "UpdateMediaInsightsPipelineStatus",
        http_method: "PUT",
        request_uri: "/media-insights-pipeline-status/{identifier}"
      )

      UPDATE_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL = OperationModel.new(
        name: "UpdateMediaPipelineKinesisVideoStreamPool",
        http_method: "PUT",
        request_uri: "/media-pipeline-kinesis-video-stream-pools/{identifier}"
      )
    end
  end
end
