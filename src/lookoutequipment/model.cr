module Aws
  module LookoutEquipment
    module Model
      API_VERSION = "2020-12-15"
      TARGET_PREFIX = "AWSLookoutEquipmentFrontendService"
      SIGNING_NAME = "lookoutequipment"
      ENDPOINT_PREFIX = "lookoutequipment"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lookoutequipment-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lookoutequipment-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lookoutequipment.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://lookoutequipment.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INFERENCE_SCHEDULER = OperationModel.new(
        name: "CreateInferenceScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LABEL = OperationModel.new(
        name: "CreateLabel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LABEL_GROUP = OperationModel.new(
        name: "CreateLabelGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL = OperationModel.new(
        name: "CreateModel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RETRAINING_SCHEDULER = OperationModel.new(
        name: "CreateRetrainingScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INFERENCE_SCHEDULER = OperationModel.new(
        name: "DeleteInferenceScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LABEL = OperationModel.new(
        name: "DeleteLabel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LABEL_GROUP = OperationModel.new(
        name: "DeleteLabelGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL = OperationModel.new(
        name: "DeleteModel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RETRAINING_SCHEDULER = OperationModel.new(
        name: "DeleteRetrainingScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_INGESTION_JOB = OperationModel.new(
        name: "DescribeDataIngestionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INFERENCE_SCHEDULER = OperationModel.new(
        name: "DescribeInferenceScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LABEL = OperationModel.new(
        name: "DescribeLabel",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LABEL_GROUP = OperationModel.new(
        name: "DescribeLabelGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL = OperationModel.new(
        name: "DescribeModel",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_VERSION = OperationModel.new(
        name: "DescribeModelVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_POLICY = OperationModel.new(
        name: "DescribeResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RETRAINING_SCHEDULER = OperationModel.new(
        name: "DescribeRetrainingScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_DATASET = OperationModel.new(
        name: "ImportDataset",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_MODEL_VERSION = OperationModel.new(
        name: "ImportModelVersion",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_INGESTION_JOBS = OperationModel.new(
        name: "ListDataIngestionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INFERENCE_EVENTS = OperationModel.new(
        name: "ListInferenceEvents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INFERENCE_EXECUTIONS = OperationModel.new(
        name: "ListInferenceExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INFERENCE_SCHEDULERS = OperationModel.new(
        name: "ListInferenceSchedulers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LABEL_GROUPS = OperationModel.new(
        name: "ListLabelGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LABELS = OperationModel.new(
        name: "ListLabels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_VERSIONS = OperationModel.new(
        name: "ListModelVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODELS = OperationModel.new(
        name: "ListModels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RETRAINING_SCHEDULERS = OperationModel.new(
        name: "ListRetrainingSchedulers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SENSOR_STATISTICS = OperationModel.new(
        name: "ListSensorStatistics",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      START_DATA_INGESTION_JOB = OperationModel.new(
        name: "StartDataIngestionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_INFERENCE_SCHEDULER = OperationModel.new(
        name: "StartInferenceScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      START_RETRAINING_SCHEDULER = OperationModel.new(
        name: "StartRetrainingScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_INFERENCE_SCHEDULER = OperationModel.new(
        name: "StopInferenceScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_RETRAINING_SCHEDULER = OperationModel.new(
        name: "StopRetrainingScheduler",
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

      UPDATE_ACTIVE_MODEL_VERSION = OperationModel.new(
        name: "UpdateActiveModelVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INFERENCE_SCHEDULER = OperationModel.new(
        name: "UpdateInferenceScheduler",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LABEL_GROUP = OperationModel.new(
        name: "UpdateLabelGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MODEL = OperationModel.new(
        name: "UpdateModel",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RETRAINING_SCHEDULER = OperationModel.new(
        name: "UpdateRetrainingScheduler",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
