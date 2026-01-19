module AwsSdk
  module IoTEvents
    module Model
      API_VERSION = "2018-07-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iotevents"
      ENDPOINT_PREFIX = "iotevents"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotevents-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotevents-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotevents.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://iotevents.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ALARM_MODEL = OperationModel.new(
        name: "CreateAlarmModel",
        http_method: "POST",
        request_uri: "/alarm-models"
      )

      CREATE_DETECTOR_MODEL = OperationModel.new(
        name: "CreateDetectorModel",
        http_method: "POST",
        request_uri: "/detector-models"
      )

      CREATE_INPUT = OperationModel.new(
        name: "CreateInput",
        http_method: "POST",
        request_uri: "/inputs"
      )

      DELETE_ALARM_MODEL = OperationModel.new(
        name: "DeleteAlarmModel",
        http_method: "DELETE",
        request_uri: "/alarm-models/{alarmModelName}"
      )

      DELETE_DETECTOR_MODEL = OperationModel.new(
        name: "DeleteDetectorModel",
        http_method: "DELETE",
        request_uri: "/detector-models/{detectorModelName}"
      )

      DELETE_INPUT = OperationModel.new(
        name: "DeleteInput",
        http_method: "DELETE",
        request_uri: "/inputs/{inputName}"
      )

      DESCRIBE_ALARM_MODEL = OperationModel.new(
        name: "DescribeAlarmModel",
        http_method: "GET",
        request_uri: "/alarm-models/{alarmModelName}"
      )

      DESCRIBE_DETECTOR_MODEL = OperationModel.new(
        name: "DescribeDetectorModel",
        http_method: "GET",
        request_uri: "/detector-models/{detectorModelName}"
      )

      DESCRIBE_DETECTOR_MODEL_ANALYSIS = OperationModel.new(
        name: "DescribeDetectorModelAnalysis",
        http_method: "GET",
        request_uri: "/analysis/detector-models/{analysisId}"
      )

      DESCRIBE_INPUT = OperationModel.new(
        name: "DescribeInput",
        http_method: "GET",
        request_uri: "/inputs/{inputName}"
      )

      DESCRIBE_LOGGING_OPTIONS = OperationModel.new(
        name: "DescribeLoggingOptions",
        http_method: "GET",
        request_uri: "/logging"
      )

      GET_DETECTOR_MODEL_ANALYSIS_RESULTS = OperationModel.new(
        name: "GetDetectorModelAnalysisResults",
        http_method: "GET",
        request_uri: "/analysis/detector-models/{analysisId}/results"
      )

      LIST_ALARM_MODEL_VERSIONS = OperationModel.new(
        name: "ListAlarmModelVersions",
        http_method: "GET",
        request_uri: "/alarm-models/{alarmModelName}/versions"
      )

      LIST_ALARM_MODELS = OperationModel.new(
        name: "ListAlarmModels",
        http_method: "GET",
        request_uri: "/alarm-models"
      )

      LIST_DETECTOR_MODEL_VERSIONS = OperationModel.new(
        name: "ListDetectorModelVersions",
        http_method: "GET",
        request_uri: "/detector-models/{detectorModelName}/versions"
      )

      LIST_DETECTOR_MODELS = OperationModel.new(
        name: "ListDetectorModels",
        http_method: "GET",
        request_uri: "/detector-models"
      )

      LIST_INPUT_ROUTINGS = OperationModel.new(
        name: "ListInputRoutings",
        http_method: "POST",
        request_uri: "/input-routings"
      )

      LIST_INPUTS = OperationModel.new(
        name: "ListInputs",
        http_method: "GET",
        request_uri: "/inputs"
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

      START_DETECTOR_MODEL_ANALYSIS = OperationModel.new(
        name: "StartDetectorModelAnalysis",
        http_method: "POST",
        request_uri: "/analysis/detector-models/"
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

      UPDATE_ALARM_MODEL = OperationModel.new(
        name: "UpdateAlarmModel",
        http_method: "POST",
        request_uri: "/alarm-models/{alarmModelName}"
      )

      UPDATE_DETECTOR_MODEL = OperationModel.new(
        name: "UpdateDetectorModel",
        http_method: "POST",
        request_uri: "/detector-models/{detectorModelName}"
      )

      UPDATE_INPUT = OperationModel.new(
        name: "UpdateInput",
        http_method: "PUT",
        request_uri: "/inputs/{inputName}"
      )
    end
  end
end
