module Aws
  module ComprehendMedical
    module Model
      API_VERSION = "2018-10-30"
      TARGET_PREFIX = "ComprehendMedical_20181030"
      SIGNING_NAME = "comprehendmedical"
      ENDPOINT_PREFIX = "comprehendmedical"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://comprehendmedical-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://comprehendmedical-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://comprehendmedical.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://comprehendmedical.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      DESCRIBE_ENTITIES_DETECTION_V2_JOB = OperationModel.new(
        name: "DescribeEntitiesDetectionV2Job",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ICD10_CM_INFERENCE_JOB = OperationModel.new(
        name: "DescribeICD10CMInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PHI_DETECTION_JOB = OperationModel.new(
        name: "DescribePHIDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RX_NORM_INFERENCE_JOB = OperationModel.new(
        name: "DescribeRxNormInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNOMEDCT_INFERENCE_JOB = OperationModel.new(
        name: "DescribeSNOMEDCTInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_ENTITIES = OperationModel.new(
        name: "DetectEntities",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_ENTITIES_V2 = OperationModel.new(
        name: "DetectEntitiesV2",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_PHI = OperationModel.new(
        name: "DetectPHI",
        http_method: "POST",
        request_uri: "/"
      )

      INFER_ICD10_CM = OperationModel.new(
        name: "InferICD10CM",
        http_method: "POST",
        request_uri: "/"
      )

      INFER_RX_NORM = OperationModel.new(
        name: "InferRxNorm",
        http_method: "POST",
        request_uri: "/"
      )

      INFER_SNOMEDCT = OperationModel.new(
        name: "InferSNOMEDCT",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITIES_DETECTION_V2_JOBS = OperationModel.new(
        name: "ListEntitiesDetectionV2Jobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ICD10_CM_INFERENCE_JOBS = OperationModel.new(
        name: "ListICD10CMInferenceJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PHI_DETECTION_JOBS = OperationModel.new(
        name: "ListPHIDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RX_NORM_INFERENCE_JOBS = OperationModel.new(
        name: "ListRxNormInferenceJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SNOMEDCT_INFERENCE_JOBS = OperationModel.new(
        name: "ListSNOMEDCTInferenceJobs",
        http_method: "POST",
        request_uri: "/"
      )

      START_ENTITIES_DETECTION_V2_JOB = OperationModel.new(
        name: "StartEntitiesDetectionV2Job",
        http_method: "POST",
        request_uri: "/"
      )

      START_ICD10_CM_INFERENCE_JOB = OperationModel.new(
        name: "StartICD10CMInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_PHI_DETECTION_JOB = OperationModel.new(
        name: "StartPHIDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_RX_NORM_INFERENCE_JOB = OperationModel.new(
        name: "StartRxNormInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_SNOMEDCT_INFERENCE_JOB = OperationModel.new(
        name: "StartSNOMEDCTInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ENTITIES_DETECTION_V2_JOB = OperationModel.new(
        name: "StopEntitiesDetectionV2Job",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ICD10_CM_INFERENCE_JOB = OperationModel.new(
        name: "StopICD10CMInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_PHI_DETECTION_JOB = OperationModel.new(
        name: "StopPHIDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_RX_NORM_INFERENCE_JOB = OperationModel.new(
        name: "StopRxNormInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_SNOMEDCT_INFERENCE_JOB = OperationModel.new(
        name: "StopSNOMEDCTInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
