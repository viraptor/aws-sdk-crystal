module Aws
  module FraudDetector
    module Model
      API_VERSION = "2019-11-15"
      TARGET_PREFIX = "AWSHawksNestServiceFacade"
      SIGNING_NAME = "frauddetector"
      ENDPOINT_PREFIX = "frauddetector"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://frauddetector-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://frauddetector-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://frauddetector.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://frauddetector.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_VARIABLE = OperationModel.new(
        name: "BatchCreateVariable",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_VARIABLE = OperationModel.new(
        name: "BatchGetVariable",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_BATCH_IMPORT_JOB = OperationModel.new(
        name: "CancelBatchImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_BATCH_PREDICTION_JOB = OperationModel.new(
        name: "CancelBatchPredictionJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BATCH_IMPORT_JOB = OperationModel.new(
        name: "CreateBatchImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BATCH_PREDICTION_JOB = OperationModel.new(
        name: "CreateBatchPredictionJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DETECTOR_VERSION = OperationModel.new(
        name: "CreateDetectorVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LIST = OperationModel.new(
        name: "CreateList",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL = OperationModel.new(
        name: "CreateModel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_VERSION = OperationModel.new(
        name: "CreateModelVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RULE = OperationModel.new(
        name: "CreateRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VARIABLE = OperationModel.new(
        name: "CreateVariable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BATCH_IMPORT_JOB = OperationModel.new(
        name: "DeleteBatchImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BATCH_PREDICTION_JOB = OperationModel.new(
        name: "DeleteBatchPredictionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DETECTOR = OperationModel.new(
        name: "DeleteDetector",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DETECTOR_VERSION = OperationModel.new(
        name: "DeleteDetectorVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENTITY_TYPE = OperationModel.new(
        name: "DeleteEntityType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENT = OperationModel.new(
        name: "DeleteEvent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENT_TYPE = OperationModel.new(
        name: "DeleteEventType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENTS_BY_EVENT_TYPE = OperationModel.new(
        name: "DeleteEventsByEventType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EXTERNAL_MODEL = OperationModel.new(
        name: "DeleteExternalModel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LABEL = OperationModel.new(
        name: "DeleteLabel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LIST = OperationModel.new(
        name: "DeleteList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL = OperationModel.new(
        name: "DeleteModel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_VERSION = OperationModel.new(
        name: "DeleteModelVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OUTCOME = OperationModel.new(
        name: "DeleteOutcome",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE = OperationModel.new(
        name: "DeleteRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VARIABLE = OperationModel.new(
        name: "DeleteVariable",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DETECTOR = OperationModel.new(
        name: "DescribeDetector",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_VERSIONS = OperationModel.new(
        name: "DescribeModelVersions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BATCH_IMPORT_JOBS = OperationModel.new(
        name: "GetBatchImportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BATCH_PREDICTION_JOBS = OperationModel.new(
        name: "GetBatchPredictionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DELETE_EVENTS_BY_EVENT_TYPE_STATUS = OperationModel.new(
        name: "GetDeleteEventsByEventTypeStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DETECTOR_VERSION = OperationModel.new(
        name: "GetDetectorVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DETECTORS = OperationModel.new(
        name: "GetDetectors",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENTITY_TYPES = OperationModel.new(
        name: "GetEntityTypes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVENT = OperationModel.new(
        name: "GetEvent",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVENT_PREDICTION = OperationModel.new(
        name: "GetEventPrediction",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVENT_PREDICTION_METADATA = OperationModel.new(
        name: "GetEventPredictionMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVENT_TYPES = OperationModel.new(
        name: "GetEventTypes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EXTERNAL_MODELS = OperationModel.new(
        name: "GetExternalModels",
        http_method: "POST",
        request_uri: "/"
      )

      GET_KMS_ENCRYPTION_KEY = OperationModel.new(
        name: "GetKMSEncryptionKey",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LABELS = OperationModel.new(
        name: "GetLabels",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LIST_ELEMENTS = OperationModel.new(
        name: "GetListElements",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LISTS_METADATA = OperationModel.new(
        name: "GetListsMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MODEL_VERSION = OperationModel.new(
        name: "GetModelVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MODELS = OperationModel.new(
        name: "GetModels",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OUTCOMES = OperationModel.new(
        name: "GetOutcomes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RULES = OperationModel.new(
        name: "GetRules",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VARIABLES = OperationModel.new(
        name: "GetVariables",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EVENT_PREDICTIONS = OperationModel.new(
        name: "ListEventPredictions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DETECTOR = OperationModel.new(
        name: "PutDetector",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ENTITY_TYPE = OperationModel.new(
        name: "PutEntityType",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EVENT_TYPE = OperationModel.new(
        name: "PutEventType",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EXTERNAL_MODEL = OperationModel.new(
        name: "PutExternalModel",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_KMS_ENCRYPTION_KEY = OperationModel.new(
        name: "PutKMSEncryptionKey",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LABEL = OperationModel.new(
        name: "PutLabel",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_OUTCOME = OperationModel.new(
        name: "PutOutcome",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_EVENT = OperationModel.new(
        name: "SendEvent",
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

      UPDATE_DETECTOR_VERSION = OperationModel.new(
        name: "UpdateDetectorVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DETECTOR_VERSION_METADATA = OperationModel.new(
        name: "UpdateDetectorVersionMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DETECTOR_VERSION_STATUS = OperationModel.new(
        name: "UpdateDetectorVersionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EVENT_LABEL = OperationModel.new(
        name: "UpdateEventLabel",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LIST = OperationModel.new(
        name: "UpdateList",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MODEL = OperationModel.new(
        name: "UpdateModel",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MODEL_VERSION = OperationModel.new(
        name: "UpdateModelVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MODEL_VERSION_STATUS = OperationModel.new(
        name: "UpdateModelVersionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULE_METADATA = OperationModel.new(
        name: "UpdateRuleMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULE_VERSION = OperationModel.new(
        name: "UpdateRuleVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VARIABLE = OperationModel.new(
        name: "UpdateVariable",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
