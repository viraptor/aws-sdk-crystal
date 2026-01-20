module Aws
  module MachineLearning
    module Model
      API_VERSION = "2014-12-12"
      TARGET_PREFIX = "AmazonML_20141212"
      SIGNING_NAME = "machinelearning"
      ENDPOINT_PREFIX = "machinelearning"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://machinelearning-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://machinelearning-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://machinelearning.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://machinelearning.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BATCH_PREDICTION = OperationModel.new(
        name: "CreateBatchPrediction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_SOURCE_FROM_RDS = OperationModel.new(
        name: "CreateDataSourceFromRDS",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_SOURCE_FROM_REDSHIFT = OperationModel.new(
        name: "CreateDataSourceFromRedshift",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_SOURCE_FROM_S3 = OperationModel.new(
        name: "CreateDataSourceFromS3",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EVALUATION = OperationModel.new(
        name: "CreateEvaluation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ML_MODEL = OperationModel.new(
        name: "CreateMLModel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REALTIME_ENDPOINT = OperationModel.new(
        name: "CreateRealtimeEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BATCH_PREDICTION = OperationModel.new(
        name: "DeleteBatchPrediction",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVALUATION = OperationModel.new(
        name: "DeleteEvaluation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ML_MODEL = OperationModel.new(
        name: "DeleteMLModel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REALTIME_ENDPOINT = OperationModel.new(
        name: "DeleteRealtimeEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BATCH_PREDICTIONS = OperationModel.new(
        name: "DescribeBatchPredictions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_SOURCES = OperationModel.new(
        name: "DescribeDataSources",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVALUATIONS = OperationModel.new(
        name: "DescribeEvaluations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ML_MODELS = OperationModel.new(
        name: "DescribeMLModels",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BATCH_PREDICTION = OperationModel.new(
        name: "GetBatchPrediction",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_SOURCE = OperationModel.new(
        name: "GetDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVALUATION = OperationModel.new(
        name: "GetEvaluation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ML_MODEL = OperationModel.new(
        name: "GetMLModel",
        http_method: "POST",
        request_uri: "/"
      )

      PREDICT = OperationModel.new(
        name: "Predict",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BATCH_PREDICTION = OperationModel.new(
        name: "UpdateBatchPrediction",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EVALUATION = OperationModel.new(
        name: "UpdateEvaluation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ML_MODEL = OperationModel.new(
        name: "UpdateMLModel",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
