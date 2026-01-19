module AwsSdk
  module Forecast
    module Model
      API_VERSION = "2018-06-26"
      TARGET_PREFIX = "AmazonForecast"
      SIGNING_NAME = "forecast"
      ENDPOINT_PREFIX = "forecast"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://forecast-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://forecast-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://forecast.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://forecast.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_AUTO_PREDICTOR = OperationModel.new(
        name: "CreateAutoPredictor",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATASET_GROUP = OperationModel.new(
        name: "CreateDatasetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATASET_IMPORT_JOB = OperationModel.new(
        name: "CreateDatasetImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXPLAINABILITY = OperationModel.new(
        name: "CreateExplainability",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXPLAINABILITY_EXPORT = OperationModel.new(
        name: "CreateExplainabilityExport",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FORECAST = OperationModel.new(
        name: "CreateForecast",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FORECAST_EXPORT_JOB = OperationModel.new(
        name: "CreateForecastExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MONITOR = OperationModel.new(
        name: "CreateMonitor",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PREDICTOR = OperationModel.new(
        name: "CreatePredictor",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PREDICTOR_BACKTEST_EXPORT_JOB = OperationModel.new(
        name: "CreatePredictorBacktestExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WHAT_IF_ANALYSIS = OperationModel.new(
        name: "CreateWhatIfAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WHAT_IF_FORECAST = OperationModel.new(
        name: "CreateWhatIfForecast",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WHAT_IF_FORECAST_EXPORT = OperationModel.new(
        name: "CreateWhatIfForecastExport",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATASET_GROUP = OperationModel.new(
        name: "DeleteDatasetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATASET_IMPORT_JOB = OperationModel.new(
        name: "DeleteDatasetImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EXPLAINABILITY = OperationModel.new(
        name: "DeleteExplainability",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EXPLAINABILITY_EXPORT = OperationModel.new(
        name: "DeleteExplainabilityExport",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FORECAST = OperationModel.new(
        name: "DeleteForecast",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FORECAST_EXPORT_JOB = OperationModel.new(
        name: "DeleteForecastExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MONITOR = OperationModel.new(
        name: "DeleteMonitor",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PREDICTOR = OperationModel.new(
        name: "DeletePredictor",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PREDICTOR_BACKTEST_EXPORT_JOB = OperationModel.new(
        name: "DeletePredictorBacktestExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_TREE = OperationModel.new(
        name: "DeleteResourceTree",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WHAT_IF_ANALYSIS = OperationModel.new(
        name: "DeleteWhatIfAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WHAT_IF_FORECAST = OperationModel.new(
        name: "DeleteWhatIfForecast",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WHAT_IF_FORECAST_EXPORT = OperationModel.new(
        name: "DeleteWhatIfForecastExport",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTO_PREDICTOR = OperationModel.new(
        name: "DescribeAutoPredictor",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET_GROUP = OperationModel.new(
        name: "DescribeDatasetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET_IMPORT_JOB = OperationModel.new(
        name: "DescribeDatasetImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPLAINABILITY = OperationModel.new(
        name: "DescribeExplainability",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPLAINABILITY_EXPORT = OperationModel.new(
        name: "DescribeExplainabilityExport",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FORECAST = OperationModel.new(
        name: "DescribeForecast",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FORECAST_EXPORT_JOB = OperationModel.new(
        name: "DescribeForecastExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MONITOR = OperationModel.new(
        name: "DescribeMonitor",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PREDICTOR = OperationModel.new(
        name: "DescribePredictor",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PREDICTOR_BACKTEST_EXPORT_JOB = OperationModel.new(
        name: "DescribePredictorBacktestExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WHAT_IF_ANALYSIS = OperationModel.new(
        name: "DescribeWhatIfAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WHAT_IF_FORECAST = OperationModel.new(
        name: "DescribeWhatIfForecast",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WHAT_IF_FORECAST_EXPORT = OperationModel.new(
        name: "DescribeWhatIfForecastExport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCURACY_METRICS = OperationModel.new(
        name: "GetAccuracyMetrics",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASET_GROUPS = OperationModel.new(
        name: "ListDatasetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASET_IMPORT_JOBS = OperationModel.new(
        name: "ListDatasetImportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPLAINABILITIES = OperationModel.new(
        name: "ListExplainabilities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPLAINABILITY_EXPORTS = OperationModel.new(
        name: "ListExplainabilityExports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FORECAST_EXPORT_JOBS = OperationModel.new(
        name: "ListForecastExportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FORECASTS = OperationModel.new(
        name: "ListForecasts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MONITOR_EVALUATIONS = OperationModel.new(
        name: "ListMonitorEvaluations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MONITORS = OperationModel.new(
        name: "ListMonitors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PREDICTOR_BACKTEST_EXPORT_JOBS = OperationModel.new(
        name: "ListPredictorBacktestExportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PREDICTORS = OperationModel.new(
        name: "ListPredictors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WHAT_IF_ANALYSES = OperationModel.new(
        name: "ListWhatIfAnalyses",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WHAT_IF_FORECAST_EXPORTS = OperationModel.new(
        name: "ListWhatIfForecastExports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WHAT_IF_FORECASTS = OperationModel.new(
        name: "ListWhatIfForecasts",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_RESOURCE = OperationModel.new(
        name: "ResumeResource",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_RESOURCE = OperationModel.new(
        name: "StopResource",
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

      UPDATE_DATASET_GROUP = OperationModel.new(
        name: "UpdateDatasetGroup",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
