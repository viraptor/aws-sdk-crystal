module AwsSdk
  module IoTAnalytics
    module Model
      API_VERSION = "2017-11-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iotanalytics"
      ENDPOINT_PREFIX = "iotanalytics"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotanalytics-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotanalytics-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotanalytics.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://iotanalytics.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_PUT_MESSAGE = OperationModel.new(
        name: "BatchPutMessage",
        http_method: "POST",
        request_uri: "/messages/batch"
      )

      CANCEL_PIPELINE_REPROCESSING = OperationModel.new(
        name: "CancelPipelineReprocessing",
        http_method: "DELETE",
        request_uri: "/pipelines/{pipelineName}/reprocessing/{reprocessingId}"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/channels"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/datasets"
      )

      CREATE_DATASET_CONTENT = OperationModel.new(
        name: "CreateDatasetContent",
        http_method: "POST",
        request_uri: "/datasets/{datasetName}/content"
      )

      CREATE_DATASTORE = OperationModel.new(
        name: "CreateDatastore",
        http_method: "POST",
        request_uri: "/datastores"
      )

      CREATE_PIPELINE = OperationModel.new(
        name: "CreatePipeline",
        http_method: "POST",
        request_uri: "/pipelines"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "DELETE",
        request_uri: "/channels/{channelName}"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "DELETE",
        request_uri: "/datasets/{datasetName}"
      )

      DELETE_DATASET_CONTENT = OperationModel.new(
        name: "DeleteDatasetContent",
        http_method: "DELETE",
        request_uri: "/datasets/{datasetName}/content"
      )

      DELETE_DATASTORE = OperationModel.new(
        name: "DeleteDatastore",
        http_method: "DELETE",
        request_uri: "/datastores/{datastoreName}"
      )

      DELETE_PIPELINE = OperationModel.new(
        name: "DeletePipeline",
        http_method: "DELETE",
        request_uri: "/pipelines/{pipelineName}"
      )

      DESCRIBE_CHANNEL = OperationModel.new(
        name: "DescribeChannel",
        http_method: "GET",
        request_uri: "/channels/{channelName}"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "GET",
        request_uri: "/datasets/{datasetName}"
      )

      DESCRIBE_DATASTORE = OperationModel.new(
        name: "DescribeDatastore",
        http_method: "GET",
        request_uri: "/datastores/{datastoreName}"
      )

      DESCRIBE_LOGGING_OPTIONS = OperationModel.new(
        name: "DescribeLoggingOptions",
        http_method: "GET",
        request_uri: "/logging"
      )

      DESCRIBE_PIPELINE = OperationModel.new(
        name: "DescribePipeline",
        http_method: "GET",
        request_uri: "/pipelines/{pipelineName}"
      )

      GET_DATASET_CONTENT = OperationModel.new(
        name: "GetDatasetContent",
        http_method: "GET",
        request_uri: "/datasets/{datasetName}/content"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/channels"
      )

      LIST_DATASET_CONTENTS = OperationModel.new(
        name: "ListDatasetContents",
        http_method: "GET",
        request_uri: "/datasets/{datasetName}/contents"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "GET",
        request_uri: "/datasets"
      )

      LIST_DATASTORES = OperationModel.new(
        name: "ListDatastores",
        http_method: "GET",
        request_uri: "/datastores"
      )

      LIST_PIPELINES = OperationModel.new(
        name: "ListPipelines",
        http_method: "GET",
        request_uri: "/pipelines"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      PUT_LOGGING_OPTIONS = OperationModel.new(
        name: "PutLoggingOptions",
        http_method: "PUT",
        request_uri: "/logging"
      )

      RUN_PIPELINE_ACTIVITY = OperationModel.new(
        name: "RunPipelineActivity",
        http_method: "POST",
        request_uri: "/pipelineactivities/run"
      )

      SAMPLE_CHANNEL_DATA = OperationModel.new(
        name: "SampleChannelData",
        http_method: "GET",
        request_uri: "/channels/{channelName}/sample"
      )

      START_PIPELINE_REPROCESSING = OperationModel.new(
        name: "StartPipelineReprocessing",
        http_method: "POST",
        request_uri: "/pipelines/{pipelineName}/reprocessing"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags"
      )

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "PUT",
        request_uri: "/channels/{channelName}"
      )

      UPDATE_DATASET = OperationModel.new(
        name: "UpdateDataset",
        http_method: "PUT",
        request_uri: "/datasets/{datasetName}"
      )

      UPDATE_DATASTORE = OperationModel.new(
        name: "UpdateDatastore",
        http_method: "PUT",
        request_uri: "/datastores/{datastoreName}"
      )

      UPDATE_PIPELINE = OperationModel.new(
        name: "UpdatePipeline",
        http_method: "PUT",
        request_uri: "/pipelines/{pipelineName}"
      )
    end
  end
end
