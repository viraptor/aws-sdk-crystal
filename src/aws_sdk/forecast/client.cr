module AwsSdk
  module Forecast
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates an Amazon Forecast predictor. Amazon Forecast creates predictors with AutoPredictor, which
      # involves applying the optimal combination of algorithms to each time series in your datasets. You
      # can use CreateAutoPredictor to create new predictors or upgrade/retrain existing predictors.
      # Creating new predictors The following parameters are required when creating a new predictor:
      # PredictorName - A unique name for the predictor. DatasetGroupArn - The ARN of the dataset group used
      # to train the predictor. ForecastFrequency - The granularity of your forecasts (hourly, daily,
      # weekly, etc). ForecastHorizon - The number of time-steps that the model predicts. The forecast
      # horizon is also called the prediction length. When creating a new predictor, do not specify a value
      # for ReferencePredictorArn . Upgrading and retraining predictors The following parameters are
      # required when retraining or upgrading a predictor: PredictorName - A unique name for the predictor.
      # ReferencePredictorArn - The ARN of the predictor to retrain or upgrade. When upgrading or retraining
      # a predictor, only specify values for the ReferencePredictorArn and PredictorName .

      def create_auto_predictor(
        predictor_name : String,
        data_config : Types::DataConfig? = nil,
        encryption_config : Types::EncryptionConfig? = nil,
        explain_predictor : Bool? = nil,
        forecast_dimensions : Array(String)? = nil,
        forecast_frequency : String? = nil,
        forecast_horizon : Int32? = nil,
        forecast_types : Array(String)? = nil,
        monitor_config : Types::MonitorConfig? = nil,
        optimization_metric : String? = nil,
        reference_predictor_arn : String? = nil,
        tags : Array(Types::Tag)? = nil,
        time_alignment_boundary : Types::TimeAlignmentBoundary? = nil
      ) : Types::CreateAutoPredictorResponse

        input = Types::CreateAutoPredictorRequest.new(predictor_name: predictor_name, data_config: data_config, encryption_config: encryption_config, explain_predictor: explain_predictor, forecast_dimensions: forecast_dimensions, forecast_frequency: forecast_frequency, forecast_horizon: forecast_horizon, forecast_types: forecast_types, monitor_config: monitor_config, optimization_metric: optimization_metric, reference_predictor_arn: reference_predictor_arn, tags: tags, time_alignment_boundary: time_alignment_boundary)
        create_auto_predictor(input)
      end

      def create_auto_predictor(input : Types::CreateAutoPredictorRequest) : Types::CreateAutoPredictorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AUTO_PREDICTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAutoPredictorResponse, "CreateAutoPredictor")
      end

      # Creates an Amazon Forecast dataset. The information about the dataset that you provide helps
      # Forecast understand how to consume the data for model training. This includes the following:
      # DataFrequency - How frequently your historical time-series data is collected. Domain and DatasetType
      # - Each dataset has an associated dataset domain and a type within the domain. Amazon Forecast
      # provides a list of predefined domains and types within each domain. For each unique dataset domain
      # and type within the domain, Amazon Forecast requires your data to include a minimum set of
      # predefined fields. Schema - A schema specifies the fields in the dataset, including the field name
      # and data type. After creating a dataset, you import your training data into it and add the dataset
      # to a dataset group. You use the dataset group to create a predictor. For more information, see
      # Importing datasets . To get a list of all your datasets, use the ListDatasets operation. For example
      # Forecast datasets, see the Amazon Forecast Sample GitHub repository . The Status of a dataset must
      # be ACTIVE before you can import training data. Use the DescribeDataset operation to get the status.

      def create_dataset(
        dataset_name : String,
        dataset_type : String,
        domain : String,
        schema : Types::Schema,
        data_frequency : String? = nil,
        encryption_config : Types::EncryptionConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetResponse

        input = Types::CreateDatasetRequest.new(dataset_name: dataset_name, dataset_type: dataset_type, domain: domain, schema: schema, data_frequency: data_frequency, encryption_config: encryption_config, tags: tags)
        create_dataset(input)
      end

      def create_dataset(input : Types::CreateDatasetRequest) : Types::CreateDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetResponse, "CreateDataset")
      end

      # Creates a dataset group, which holds a collection of related datasets. You can add datasets to the
      # dataset group when you create the dataset group, or later by using the UpdateDatasetGroup operation.
      # After creating a dataset group and adding datasets, you use the dataset group when you create a
      # predictor. For more information, see Dataset groups . To get a list of all your datasets groups, use
      # the ListDatasetGroups operation. The Status of a dataset group must be ACTIVE before you can use the
      # dataset group to create a predictor. To get the status, use the DescribeDatasetGroup operation.

      def create_dataset_group(
        dataset_group_name : String,
        domain : String,
        dataset_arns : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetGroupResponse

        input = Types::CreateDatasetGroupRequest.new(dataset_group_name: dataset_group_name, domain: domain, dataset_arns: dataset_arns, tags: tags)
        create_dataset_group(input)
      end

      def create_dataset_group(input : Types::CreateDatasetGroupRequest) : Types::CreateDatasetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetGroupResponse, "CreateDatasetGroup")
      end

      # Imports your training data to an Amazon Forecast dataset. You provide the location of your training
      # data in an Amazon Simple Storage Service (Amazon S3) bucket and the Amazon Resource Name (ARN) of
      # the dataset that you want to import the data to. You must specify a DataSource object that includes
      # an Identity and Access Management (IAM) role that Amazon Forecast can assume to access the data, as
      # Amazon Forecast makes a copy of your data and processes it in an internal Amazon Web Services
      # system. For more information, see Set up permissions . The training data must be in CSV or Parquet
      # format. The delimiter must be a comma (,). You can specify the path to a specific file, the S3
      # bucket, or to a folder in the S3 bucket. For the latter two cases, Amazon Forecast imports all files
      # up to the limit of 10,000 files. Because dataset imports are not aggregated, your most recent
      # dataset import is the one that is used when training a predictor or generating a forecast. Make sure
      # that your most recent dataset import contains all of the data you want to model off of, and not just
      # the new data collected since the previous import. To get a list of all your dataset import jobs,
      # filtered by specified criteria, use the ListDatasetImportJobs operation.

      def create_dataset_import_job(
        data_source : Types::DataSource,
        dataset_arn : String,
        dataset_import_job_name : String,
        format : String? = nil,
        geolocation_format : String? = nil,
        import_mode : String? = nil,
        tags : Array(Types::Tag)? = nil,
        time_zone : String? = nil,
        timestamp_format : String? = nil,
        use_geolocation_for_time_zone : Bool? = nil
      ) : Types::CreateDatasetImportJobResponse

        input = Types::CreateDatasetImportJobRequest.new(data_source: data_source, dataset_arn: dataset_arn, dataset_import_job_name: dataset_import_job_name, format: format, geolocation_format: geolocation_format, import_mode: import_mode, tags: tags, time_zone: time_zone, timestamp_format: timestamp_format, use_geolocation_for_time_zone: use_geolocation_for_time_zone)
        create_dataset_import_job(input)
      end

      def create_dataset_import_job(input : Types::CreateDatasetImportJobRequest) : Types::CreateDatasetImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetImportJobResponse, "CreateDatasetImportJob")
      end

      # Explainability is only available for Forecasts and Predictors generated from an AutoPredictor (
      # CreateAutoPredictor ) Creates an Amazon Forecast Explainability. Explainability helps you better
      # understand how the attributes in your datasets impact forecast. Amazon Forecast uses a metric called
      # Impact scores to quantify the relative impact of each attribute and determine whether they increase
      # or decrease forecast values. To enable Forecast Explainability, your predictor must include at least
      # one of the following: related time series, item metadata, or additional datasets like Holidays and
      # the Weather Index. CreateExplainability accepts either a Predictor ARN or Forecast ARN. To receive
      # aggregated Impact scores for all time series and time points in your datasets, provide a Predictor
      # ARN. To receive Impact scores for specific time series and time points, provide a Forecast ARN.
      # CreateExplainability with a Predictor ARN You can only have one Explainability resource per
      # predictor. If you already enabled ExplainPredictor in CreateAutoPredictor , that predictor already
      # has an Explainability resource. The following parameters are required when providing a Predictor
      # ARN: ExplainabilityName - A unique name for the Explainability. ResourceArn - The Arn of the
      # predictor. TimePointGranularity - Must be set to “ALL”. TimeSeriesGranularity - Must be set to
      # “ALL”. Do not specify a value for the following parameters: DataSource - Only valid when
      # TimeSeriesGranularity is “SPECIFIC”. Schema - Only valid when TimeSeriesGranularity is “SPECIFIC”.
      # StartDateTime - Only valid when TimePointGranularity is “SPECIFIC”. EndDateTime - Only valid when
      # TimePointGranularity is “SPECIFIC”. CreateExplainability with a Forecast ARN You can specify a
      # maximum of 50 time series and 500 time points. The following parameters are required when providing
      # a Predictor ARN: ExplainabilityName - A unique name for the Explainability. ResourceArn - The Arn of
      # the forecast. TimePointGranularity - Either “ALL” or “SPECIFIC”. TimeSeriesGranularity - Either
      # “ALL” or “SPECIFIC”. If you set TimeSeriesGranularity to “SPECIFIC”, you must also provide the
      # following: DataSource - The S3 location of the CSV file specifying your time series. Schema - The
      # Schema defines the attributes and attribute types listed in the Data Source. If you set
      # TimePointGranularity to “SPECIFIC”, you must also provide the following: StartDateTime - The first
      # timestamp in the range of time points. EndDateTime - The last timestamp in the range of time points.

      def create_explainability(
        explainability_config : Types::ExplainabilityConfig,
        explainability_name : String,
        resource_arn : String,
        data_source : Types::DataSource? = nil,
        enable_visualization : Bool? = nil,
        end_date_time : String? = nil,
        schema : Types::Schema? = nil,
        start_date_time : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateExplainabilityResponse

        input = Types::CreateExplainabilityRequest.new(explainability_config: explainability_config, explainability_name: explainability_name, resource_arn: resource_arn, data_source: data_source, enable_visualization: enable_visualization, end_date_time: end_date_time, schema: schema, start_date_time: start_date_time, tags: tags)
        create_explainability(input)
      end

      def create_explainability(input : Types::CreateExplainabilityRequest) : Types::CreateExplainabilityResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EXPLAINABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateExplainabilityResponse, "CreateExplainability")
      end

      # Exports an Explainability resource created by the CreateExplainability operation. Exported files are
      # exported to an Amazon Simple Storage Service (Amazon S3) bucket. You must specify a DataDestination
      # object that includes an Amazon S3 bucket and an Identity and Access Management (IAM) role that
      # Amazon Forecast can assume to access the Amazon S3 bucket. For more information, see
      # aws-forecast-iam-roles . The Status of the export job must be ACTIVE before you can access the
      # export in your Amazon S3 bucket. To get the status, use the DescribeExplainabilityExport operation.

      def create_explainability_export(
        destination : Types::DataDestination,
        explainability_arn : String,
        explainability_export_name : String,
        format : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateExplainabilityExportResponse

        input = Types::CreateExplainabilityExportRequest.new(destination: destination, explainability_arn: explainability_arn, explainability_export_name: explainability_export_name, format: format, tags: tags)
        create_explainability_export(input)
      end

      def create_explainability_export(input : Types::CreateExplainabilityExportRequest) : Types::CreateExplainabilityExportResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EXPLAINABILITY_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateExplainabilityExportResponse, "CreateExplainabilityExport")
      end

      # Creates a forecast for each item in the TARGET_TIME_SERIES dataset that was used to train the
      # predictor. This is known as inference. To retrieve the forecast for a single item at low latency,
      # use the operation. To export the complete forecast into your Amazon Simple Storage Service (Amazon
      # S3) bucket, use the CreateForecastExportJob operation. The range of the forecast is determined by
      # the ForecastHorizon value, which you specify in the CreatePredictor request. When you query a
      # forecast, you can request a specific date range within the forecast. To get a list of all your
      # forecasts, use the ListForecasts operation. The forecasts generated by Amazon Forecast are in the
      # same time zone as the dataset that was used to create the predictor. For more information, see
      # howitworks-forecast . The Status of the forecast must be ACTIVE before you can query or export the
      # forecast. Use the DescribeForecast operation to get the status. By default, a forecast includes
      # predictions for every item ( item_id ) in the dataset group that was used to train the predictor.
      # However, you can use the TimeSeriesSelector object to generate a forecast on a subset of time
      # series. Forecast creation is skipped for any time series that you specify that are not in the input
      # dataset. The forecast export file will not contain these time series or their forecasted values.

      def create_forecast(
        forecast_name : String,
        predictor_arn : String,
        forecast_types : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        time_series_selector : Types::TimeSeriesSelector? = nil
      ) : Types::CreateForecastResponse

        input = Types::CreateForecastRequest.new(forecast_name: forecast_name, predictor_arn: predictor_arn, forecast_types: forecast_types, tags: tags, time_series_selector: time_series_selector)
        create_forecast(input)
      end

      def create_forecast(input : Types::CreateForecastRequest) : Types::CreateForecastResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateForecastResponse, "CreateForecast")
      end

      # Exports a forecast created by the CreateForecast operation to your Amazon Simple Storage Service
      # (Amazon S3) bucket. The forecast file name will match the following conventions:
      # &lt;ForecastExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PartNumber&gt; where the
      # &lt;ExportTimestamp&gt; component is in Java SimpleDateFormat (yyyy-MM-ddTHH-mm-ssZ). You must
      # specify a DataDestination object that includes an Identity and Access Management (IAM) role that
      # Amazon Forecast can assume to access the Amazon S3 bucket. For more information, see
      # aws-forecast-iam-roles . For more information, see howitworks-forecast . To get a list of all your
      # forecast export jobs, use the ListForecastExportJobs operation. The Status of the forecast export
      # job must be ACTIVE before you can access the forecast in your Amazon S3 bucket. To get the status,
      # use the DescribeForecastExportJob operation.

      def create_forecast_export_job(
        destination : Types::DataDestination,
        forecast_arn : String,
        forecast_export_job_name : String,
        format : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateForecastExportJobResponse

        input = Types::CreateForecastExportJobRequest.new(destination: destination, forecast_arn: forecast_arn, forecast_export_job_name: forecast_export_job_name, format: format, tags: tags)
        create_forecast_export_job(input)
      end

      def create_forecast_export_job(input : Types::CreateForecastExportJobRequest) : Types::CreateForecastExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FORECAST_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateForecastExportJobResponse, "CreateForecastExportJob")
      end

      # Creates a predictor monitor resource for an existing auto predictor. Predictor monitoring allows you
      # to see how your predictor's performance changes over time. For more information, see Predictor
      # Monitoring .

      def create_monitor(
        monitor_name : String,
        resource_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMonitorResponse

        input = Types::CreateMonitorRequest.new(monitor_name: monitor_name, resource_arn: resource_arn, tags: tags)
        create_monitor(input)
      end

      def create_monitor(input : Types::CreateMonitorRequest) : Types::CreateMonitorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MONITOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMonitorResponse, "CreateMonitor")
      end

      # This operation creates a legacy predictor that does not include all the predictor functionalities
      # provided by Amazon Forecast. To create a predictor that is compatible with all aspects of Forecast,
      # use CreateAutoPredictor . Creates an Amazon Forecast predictor. In the request, provide a dataset
      # group and either specify an algorithm or let Amazon Forecast choose an algorithm for you using
      # AutoML. If you specify an algorithm, you also can override algorithm-specific hyperparameters.
      # Amazon Forecast uses the algorithm to train a predictor using the latest version of the datasets in
      # the specified dataset group. You can then generate a forecast using the CreateForecast operation. To
      # see the evaluation metrics, use the GetAccuracyMetrics operation. You can specify a featurization
      # configuration to fill and aggregate the data fields in the TARGET_TIME_SERIES dataset to improve
      # model training. For more information, see FeaturizationConfig . For RELATED_TIME_SERIES datasets,
      # CreatePredictor verifies that the DataFrequency specified when the dataset was created matches the
      # ForecastFrequency . TARGET_TIME_SERIES datasets don't have this restriction. Amazon Forecast also
      # verifies the delimiter and timestamp format. For more information, see howitworks-datasets-groups .
      # By default, predictors are trained and evaluated at the 0.1 (P10), 0.5 (P50), and 0.9 (P90)
      # quantiles. You can choose custom forecast types to train and evaluate your predictor by setting the
      # ForecastTypes . AutoML If you want Amazon Forecast to evaluate each algorithm and choose the one
      # that minimizes the objective function , set PerformAutoML to true . The objective function is
      # defined as the mean of the weighted losses over the forecast types. By default, these are the p10,
      # p50, and p90 quantile losses. For more information, see EvaluationResult . When AutoML is enabled,
      # the following properties are disallowed: AlgorithmArn HPOConfig PerformHPO TrainingParameters To get
      # a list of all of your predictors, use the ListPredictors operation. Before you can use the predictor
      # to create a forecast, the Status of the predictor must be ACTIVE , signifying that training has
      # completed. To get the status, use the DescribePredictor operation.

      def create_predictor(
        featurization_config : Types::FeaturizationConfig,
        forecast_horizon : Int32,
        input_data_config : Types::InputDataConfig,
        predictor_name : String,
        algorithm_arn : String? = nil,
        auto_ml_override_strategy : String? = nil,
        encryption_config : Types::EncryptionConfig? = nil,
        evaluation_parameters : Types::EvaluationParameters? = nil,
        forecast_types : Array(String)? = nil,
        hpo_config : Types::HyperParameterTuningJobConfig? = nil,
        optimization_metric : String? = nil,
        perform_auto_ml : Bool? = nil,
        perform_hpo : Bool? = nil,
        tags : Array(Types::Tag)? = nil,
        training_parameters : Hash(String, String)? = nil
      ) : Types::CreatePredictorResponse

        input = Types::CreatePredictorRequest.new(featurization_config: featurization_config, forecast_horizon: forecast_horizon, input_data_config: input_data_config, predictor_name: predictor_name, algorithm_arn: algorithm_arn, auto_ml_override_strategy: auto_ml_override_strategy, encryption_config: encryption_config, evaluation_parameters: evaluation_parameters, forecast_types: forecast_types, hpo_config: hpo_config, optimization_metric: optimization_metric, perform_auto_ml: perform_auto_ml, perform_hpo: perform_hpo, tags: tags, training_parameters: training_parameters)
        create_predictor(input)
      end

      def create_predictor(input : Types::CreatePredictorRequest) : Types::CreatePredictorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PREDICTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePredictorResponse, "CreatePredictor")
      end

      # Exports backtest forecasts and accuracy metrics generated by the CreateAutoPredictor or
      # CreatePredictor operations. Two folders containing CSV or Parquet files are exported to your
      # specified S3 bucket. The export file names will match the following conventions:
      # &lt;ExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PartNumber&gt;.csv The &lt;ExportTimestamp&gt;
      # component is in Java SimpleDate format (yyyy-MM-ddTHH-mm-ssZ). You must specify a DataDestination
      # object that includes an Amazon S3 bucket and an Identity and Access Management (IAM) role that
      # Amazon Forecast can assume to access the Amazon S3 bucket. For more information, see
      # aws-forecast-iam-roles . The Status of the export job must be ACTIVE before you can access the
      # export in your Amazon S3 bucket. To get the status, use the DescribePredictorBacktestExportJob
      # operation.

      def create_predictor_backtest_export_job(
        destination : Types::DataDestination,
        predictor_arn : String,
        predictor_backtest_export_job_name : String,
        format : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePredictorBacktestExportJobResponse

        input = Types::CreatePredictorBacktestExportJobRequest.new(destination: destination, predictor_arn: predictor_arn, predictor_backtest_export_job_name: predictor_backtest_export_job_name, format: format, tags: tags)
        create_predictor_backtest_export_job(input)
      end

      def create_predictor_backtest_export_job(input : Types::CreatePredictorBacktestExportJobRequest) : Types::CreatePredictorBacktestExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PREDICTOR_BACKTEST_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePredictorBacktestExportJobResponse, "CreatePredictorBacktestExportJob")
      end

      # What-if analysis is a scenario modeling technique where you make a hypothetical change to a time
      # series and compare the forecasts generated by these changes against the baseline, unchanged time
      # series. It is important to remember that the purpose of a what-if analysis is to understand how a
      # forecast can change given different modifications to the baseline time series. For example, imagine
      # you are a clothing retailer who is considering an end of season sale to clear space for new styles.
      # After creating a baseline forecast, you can use a what-if analysis to investigate how different
      # sales tactics might affect your goals. You could create a scenario where everything is given a 25%
      # markdown, and another where everything is given a fixed dollar markdown. You could create a scenario
      # where the sale lasts for one week and another where the sale lasts for one month. With a what-if
      # analysis, you can compare many different scenarios against each other. Note that a what-if analysis
      # is meant to display what the forecasting model has learned and how it will behave in the scenarios
      # that you are evaluating. Do not blindly use the results of the what-if analysis to make business
      # decisions. For instance, forecasts might not be accurate for novel scenarios where there is no
      # reference available to determine whether a forecast is good. The TimeSeriesSelector object defines
      # the items that you want in the what-if analysis.

      def create_what_if_analysis(
        forecast_arn : String,
        what_if_analysis_name : String,
        tags : Array(Types::Tag)? = nil,
        time_series_selector : Types::TimeSeriesSelector? = nil
      ) : Types::CreateWhatIfAnalysisResponse

        input = Types::CreateWhatIfAnalysisRequest.new(forecast_arn: forecast_arn, what_if_analysis_name: what_if_analysis_name, tags: tags, time_series_selector: time_series_selector)
        create_what_if_analysis(input)
      end

      def create_what_if_analysis(input : Types::CreateWhatIfAnalysisRequest) : Types::CreateWhatIfAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WHAT_IF_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWhatIfAnalysisResponse, "CreateWhatIfAnalysis")
      end

      # A what-if forecast is a forecast that is created from a modified version of the baseline forecast.
      # Each what-if forecast incorporates either a replacement dataset or a set of transformations to the
      # original dataset.

      def create_what_if_forecast(
        what_if_analysis_arn : String,
        what_if_forecast_name : String,
        tags : Array(Types::Tag)? = nil,
        time_series_replacements_data_source : Types::TimeSeriesReplacementsDataSource? = nil,
        time_series_transformations : Array(Types::TimeSeriesTransformation)? = nil
      ) : Types::CreateWhatIfForecastResponse

        input = Types::CreateWhatIfForecastRequest.new(what_if_analysis_arn: what_if_analysis_arn, what_if_forecast_name: what_if_forecast_name, tags: tags, time_series_replacements_data_source: time_series_replacements_data_source, time_series_transformations: time_series_transformations)
        create_what_if_forecast(input)
      end

      def create_what_if_forecast(input : Types::CreateWhatIfForecastRequest) : Types::CreateWhatIfForecastResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WHAT_IF_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWhatIfForecastResponse, "CreateWhatIfForecast")
      end

      # Exports a forecast created by the CreateWhatIfForecast operation to your Amazon Simple Storage
      # Service (Amazon S3) bucket. The forecast file name will match the following conventions:
      # ≈&lt;ForecastExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PartNumber&gt; The
      # &lt;ExportTimestamp&gt; component is in Java SimpleDateFormat (yyyy-MM-ddTHH-mm-ssZ). You must
      # specify a DataDestination object that includes an Identity and Access Management (IAM) role that
      # Amazon Forecast can assume to access the Amazon S3 bucket. For more information, see
      # aws-forecast-iam-roles . For more information, see howitworks-forecast . To get a list of all your
      # what-if forecast export jobs, use the ListWhatIfForecastExports operation. The Status of the
      # forecast export job must be ACTIVE before you can access the forecast in your Amazon S3 bucket. To
      # get the status, use the DescribeWhatIfForecastExport operation.

      def create_what_if_forecast_export(
        destination : Types::DataDestination,
        what_if_forecast_arns : Array(String),
        what_if_forecast_export_name : String,
        format : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateWhatIfForecastExportResponse

        input = Types::CreateWhatIfForecastExportRequest.new(destination: destination, what_if_forecast_arns: what_if_forecast_arns, what_if_forecast_export_name: what_if_forecast_export_name, format: format, tags: tags)
        create_what_if_forecast_export(input)
      end

      def create_what_if_forecast_export(input : Types::CreateWhatIfForecastExportRequest) : Types::CreateWhatIfForecastExportResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WHAT_IF_FORECAST_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWhatIfForecastExportResponse, "CreateWhatIfForecastExport")
      end

      # Deletes an Amazon Forecast dataset that was created using the CreateDataset operation. You can only
      # delete datasets that have a status of ACTIVE or CREATE_FAILED . To get the status use the
      # DescribeDataset operation. Forecast does not automatically update any dataset groups that contain
      # the deleted dataset. In order to update the dataset group, use the UpdateDatasetGroup operation,
      # omitting the deleted dataset's ARN.

      def delete_dataset(
        dataset_arn : String
      ) : Nil

        input = Types::DeleteDatasetRequest.new(dataset_arn: dataset_arn)
        delete_dataset(input)
      end

      def delete_dataset(input : Types::DeleteDatasetRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a dataset group created using the CreateDatasetGroup operation. You can only delete dataset
      # groups that have a status of ACTIVE , CREATE_FAILED , or UPDATE_FAILED . To get the status, use the
      # DescribeDatasetGroup operation. This operation deletes only the dataset group, not the datasets in
      # the group.

      def delete_dataset_group(
        dataset_group_arn : String
      ) : Nil

        input = Types::DeleteDatasetGroupRequest.new(dataset_group_arn: dataset_group_arn)
        delete_dataset_group(input)
      end

      def delete_dataset_group(input : Types::DeleteDatasetGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATASET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a dataset import job created using the CreateDatasetImportJob operation. You can delete only
      # dataset import jobs that have a status of ACTIVE or CREATE_FAILED . To get the status, use the
      # DescribeDatasetImportJob operation.

      def delete_dataset_import_job(
        dataset_import_job_arn : String
      ) : Nil

        input = Types::DeleteDatasetImportJobRequest.new(dataset_import_job_arn: dataset_import_job_arn)
        delete_dataset_import_job(input)
      end

      def delete_dataset_import_job(input : Types::DeleteDatasetImportJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATASET_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Explainability resource. You can delete only predictor that have a status of ACTIVE or
      # CREATE_FAILED . To get the status, use the DescribeExplainability operation.

      def delete_explainability(
        explainability_arn : String
      ) : Nil

        input = Types::DeleteExplainabilityRequest.new(explainability_arn: explainability_arn)
        delete_explainability(input)
      end

      def delete_explainability(input : Types::DeleteExplainabilityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_EXPLAINABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Explainability export.

      def delete_explainability_export(
        explainability_export_arn : String
      ) : Nil

        input = Types::DeleteExplainabilityExportRequest.new(explainability_export_arn: explainability_export_arn)
        delete_explainability_export(input)
      end

      def delete_explainability_export(input : Types::DeleteExplainabilityExportRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_EXPLAINABILITY_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a forecast created using the CreateForecast operation. You can delete only forecasts that
      # have a status of ACTIVE or CREATE_FAILED . To get the status, use the DescribeForecast operation.
      # You can't delete a forecast while it is being exported. After a forecast is deleted, you can no
      # longer query the forecast.

      def delete_forecast(
        forecast_arn : String
      ) : Nil

        input = Types::DeleteForecastRequest.new(forecast_arn: forecast_arn)
        delete_forecast(input)
      end

      def delete_forecast(input : Types::DeleteForecastRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a forecast export job created using the CreateForecastExportJob operation. You can delete
      # only export jobs that have a status of ACTIVE or CREATE_FAILED . To get the status, use the
      # DescribeForecastExportJob operation.

      def delete_forecast_export_job(
        forecast_export_job_arn : String
      ) : Nil

        input = Types::DeleteForecastExportJobRequest.new(forecast_export_job_arn: forecast_export_job_arn)
        delete_forecast_export_job(input)
      end

      def delete_forecast_export_job(input : Types::DeleteForecastExportJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FORECAST_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a monitor resource. You can only delete a monitor resource with a status of ACTIVE ,
      # ACTIVE_STOPPED , CREATE_FAILED , or CREATE_STOPPED .

      def delete_monitor(
        monitor_arn : String
      ) : Nil

        input = Types::DeleteMonitorRequest.new(monitor_arn: monitor_arn)
        delete_monitor(input)
      end

      def delete_monitor(input : Types::DeleteMonitorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MONITOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a predictor created using the DescribePredictor or CreatePredictor operations. You can
      # delete only predictor that have a status of ACTIVE or CREATE_FAILED . To get the status, use the
      # DescribePredictor operation.

      def delete_predictor(
        predictor_arn : String
      ) : Nil

        input = Types::DeletePredictorRequest.new(predictor_arn: predictor_arn)
        delete_predictor(input)
      end

      def delete_predictor(input : Types::DeletePredictorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PREDICTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a predictor backtest export job.

      def delete_predictor_backtest_export_job(
        predictor_backtest_export_job_arn : String
      ) : Nil

        input = Types::DeletePredictorBacktestExportJobRequest.new(predictor_backtest_export_job_arn: predictor_backtest_export_job_arn)
        delete_predictor_backtest_export_job(input)
      end

      def delete_predictor_backtest_export_job(input : Types::DeletePredictorBacktestExportJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PREDICTOR_BACKTEST_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an entire resource tree. This operation will delete the parent resource and its child
      # resources. Child resources are resources that were created from another resource. For example, when
      # a forecast is generated from a predictor, the forecast is the child resource and the predictor is
      # the parent resource. Amazon Forecast resources possess the following parent-child resource
      # hierarchies: Dataset : dataset import jobs Dataset Group : predictors, predictor backtest export
      # jobs, forecasts, forecast export jobs Predictor : predictor backtest export jobs, forecasts,
      # forecast export jobs Forecast : forecast export jobs DeleteResourceTree will only delete Amazon
      # Forecast resources, and will not delete datasets or exported files stored in Amazon S3.

      def delete_resource_tree(
        resource_arn : String
      ) : Nil

        input = Types::DeleteResourceTreeRequest.new(resource_arn: resource_arn)
        delete_resource_tree(input)
      end

      def delete_resource_tree(input : Types::DeleteResourceTreeRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_TREE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a what-if analysis created using the CreateWhatIfAnalysis operation. You can delete only
      # what-if analyses that have a status of ACTIVE or CREATE_FAILED . To get the status, use the
      # DescribeWhatIfAnalysis operation. You can't delete a what-if analysis while any of its forecasts are
      # being exported.

      def delete_what_if_analysis(
        what_if_analysis_arn : String
      ) : Nil

        input = Types::DeleteWhatIfAnalysisRequest.new(what_if_analysis_arn: what_if_analysis_arn)
        delete_what_if_analysis(input)
      end

      def delete_what_if_analysis(input : Types::DeleteWhatIfAnalysisRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WHAT_IF_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a what-if forecast created using the CreateWhatIfForecast operation. You can delete only
      # what-if forecasts that have a status of ACTIVE or CREATE_FAILED . To get the status, use the
      # DescribeWhatIfForecast operation. You can't delete a what-if forecast while it is being exported.
      # After a what-if forecast is deleted, you can no longer query the what-if analysis.

      def delete_what_if_forecast(
        what_if_forecast_arn : String
      ) : Nil

        input = Types::DeleteWhatIfForecastRequest.new(what_if_forecast_arn: what_if_forecast_arn)
        delete_what_if_forecast(input)
      end

      def delete_what_if_forecast(input : Types::DeleteWhatIfForecastRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WHAT_IF_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a what-if forecast export created using the CreateWhatIfForecastExport operation. You can
      # delete only what-if forecast exports that have a status of ACTIVE or CREATE_FAILED . To get the
      # status, use the DescribeWhatIfForecastExport operation.

      def delete_what_if_forecast_export(
        what_if_forecast_export_arn : String
      ) : Nil

        input = Types::DeleteWhatIfForecastExportRequest.new(what_if_forecast_export_arn: what_if_forecast_export_arn)
        delete_what_if_forecast_export(input)
      end

      def delete_what_if_forecast_export(input : Types::DeleteWhatIfForecastExportRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WHAT_IF_FORECAST_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Describes a predictor created using the CreateAutoPredictor operation.

      def describe_auto_predictor(
        predictor_arn : String
      ) : Types::DescribeAutoPredictorResponse

        input = Types::DescribeAutoPredictorRequest.new(predictor_arn: predictor_arn)
        describe_auto_predictor(input)
      end

      def describe_auto_predictor(input : Types::DescribeAutoPredictorRequest) : Types::DescribeAutoPredictorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AUTO_PREDICTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAutoPredictorResponse, "DescribeAutoPredictor")
      end

      # Describes an Amazon Forecast dataset created using the CreateDataset operation. In addition to
      # listing the parameters specified in the CreateDataset request, this operation includes the following
      # dataset properties: CreationTime LastModificationTime Status

      def describe_dataset(
        dataset_arn : String
      ) : Types::DescribeDatasetResponse

        input = Types::DescribeDatasetRequest.new(dataset_arn: dataset_arn)
        describe_dataset(input)
      end

      def describe_dataset(input : Types::DescribeDatasetRequest) : Types::DescribeDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatasetResponse, "DescribeDataset")
      end

      # Describes a dataset group created using the CreateDatasetGroup operation. In addition to listing the
      # parameters provided in the CreateDatasetGroup request, this operation includes the following
      # properties: DatasetArns - The datasets belonging to the group. CreationTime LastModificationTime
      # Status

      def describe_dataset_group(
        dataset_group_arn : String
      ) : Types::DescribeDatasetGroupResponse

        input = Types::DescribeDatasetGroupRequest.new(dataset_group_arn: dataset_group_arn)
        describe_dataset_group(input)
      end

      def describe_dataset_group(input : Types::DescribeDatasetGroupRequest) : Types::DescribeDatasetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATASET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatasetGroupResponse, "DescribeDatasetGroup")
      end

      # Describes a dataset import job created using the CreateDatasetImportJob operation. In addition to
      # listing the parameters provided in the CreateDatasetImportJob request, this operation includes the
      # following properties: CreationTime LastModificationTime DataSize FieldStatistics Status Message - If
      # an error occurred, information about the error.

      def describe_dataset_import_job(
        dataset_import_job_arn : String
      ) : Types::DescribeDatasetImportJobResponse

        input = Types::DescribeDatasetImportJobRequest.new(dataset_import_job_arn: dataset_import_job_arn)
        describe_dataset_import_job(input)
      end

      def describe_dataset_import_job(input : Types::DescribeDatasetImportJobRequest) : Types::DescribeDatasetImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATASET_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatasetImportJobResponse, "DescribeDatasetImportJob")
      end

      # Describes an Explainability resource created using the CreateExplainability operation.

      def describe_explainability(
        explainability_arn : String
      ) : Types::DescribeExplainabilityResponse

        input = Types::DescribeExplainabilityRequest.new(explainability_arn: explainability_arn)
        describe_explainability(input)
      end

      def describe_explainability(input : Types::DescribeExplainabilityRequest) : Types::DescribeExplainabilityResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXPLAINABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExplainabilityResponse, "DescribeExplainability")
      end

      # Describes an Explainability export created using the CreateExplainabilityExport operation.

      def describe_explainability_export(
        explainability_export_arn : String
      ) : Types::DescribeExplainabilityExportResponse

        input = Types::DescribeExplainabilityExportRequest.new(explainability_export_arn: explainability_export_arn)
        describe_explainability_export(input)
      end

      def describe_explainability_export(input : Types::DescribeExplainabilityExportRequest) : Types::DescribeExplainabilityExportResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXPLAINABILITY_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExplainabilityExportResponse, "DescribeExplainabilityExport")
      end

      # Describes a forecast created using the CreateForecast operation. In addition to listing the
      # properties provided in the CreateForecast request, this operation lists the following properties:
      # DatasetGroupArn - The dataset group that provided the training data. CreationTime
      # LastModificationTime Status Message - If an error occurred, information about the error.

      def describe_forecast(
        forecast_arn : String
      ) : Types::DescribeForecastResponse

        input = Types::DescribeForecastRequest.new(forecast_arn: forecast_arn)
        describe_forecast(input)
      end

      def describe_forecast(input : Types::DescribeForecastRequest) : Types::DescribeForecastResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeForecastResponse, "DescribeForecast")
      end

      # Describes a forecast export job created using the CreateForecastExportJob operation. In addition to
      # listing the properties provided by the user in the CreateForecastExportJob request, this operation
      # lists the following properties: CreationTime LastModificationTime Status Message - If an error
      # occurred, information about the error.

      def describe_forecast_export_job(
        forecast_export_job_arn : String
      ) : Types::DescribeForecastExportJobResponse

        input = Types::DescribeForecastExportJobRequest.new(forecast_export_job_arn: forecast_export_job_arn)
        describe_forecast_export_job(input)
      end

      def describe_forecast_export_job(input : Types::DescribeForecastExportJobRequest) : Types::DescribeForecastExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FORECAST_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeForecastExportJobResponse, "DescribeForecastExportJob")
      end

      # Describes a monitor resource. In addition to listing the properties provided in the CreateMonitor
      # request, this operation lists the following properties: Baseline CreationTime LastEvaluationTime
      # LastEvaluationState LastModificationTime Message Status

      def describe_monitor(
        monitor_arn : String
      ) : Types::DescribeMonitorResponse

        input = Types::DescribeMonitorRequest.new(monitor_arn: monitor_arn)
        describe_monitor(input)
      end

      def describe_monitor(input : Types::DescribeMonitorRequest) : Types::DescribeMonitorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MONITOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMonitorResponse, "DescribeMonitor")
      end

      # This operation is only valid for legacy predictors created with CreatePredictor. If you are not
      # using a legacy predictor, use DescribeAutoPredictor . Describes a predictor created using the
      # CreatePredictor operation. In addition to listing the properties provided in the CreatePredictor
      # request, this operation lists the following properties: DatasetImportJobArns - The dataset import
      # jobs used to import training data. AutoMLAlgorithmArns - If AutoML is performed, the algorithms that
      # were evaluated. CreationTime LastModificationTime Status Message - If an error occurred, information
      # about the error.

      def describe_predictor(
        predictor_arn : String
      ) : Types::DescribePredictorResponse

        input = Types::DescribePredictorRequest.new(predictor_arn: predictor_arn)
        describe_predictor(input)
      end

      def describe_predictor(input : Types::DescribePredictorRequest) : Types::DescribePredictorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PREDICTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePredictorResponse, "DescribePredictor")
      end

      # Describes a predictor backtest export job created using the CreatePredictorBacktestExportJob
      # operation. In addition to listing the properties provided by the user in the
      # CreatePredictorBacktestExportJob request, this operation lists the following properties:
      # CreationTime LastModificationTime Status Message (if an error occurred)

      def describe_predictor_backtest_export_job(
        predictor_backtest_export_job_arn : String
      ) : Types::DescribePredictorBacktestExportJobResponse

        input = Types::DescribePredictorBacktestExportJobRequest.new(predictor_backtest_export_job_arn: predictor_backtest_export_job_arn)
        describe_predictor_backtest_export_job(input)
      end

      def describe_predictor_backtest_export_job(input : Types::DescribePredictorBacktestExportJobRequest) : Types::DescribePredictorBacktestExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PREDICTOR_BACKTEST_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePredictorBacktestExportJobResponse, "DescribePredictorBacktestExportJob")
      end

      # Describes the what-if analysis created using the CreateWhatIfAnalysis operation. In addition to
      # listing the properties provided in the CreateWhatIfAnalysis request, this operation lists the
      # following properties: CreationTime LastModificationTime Message - If an error occurred, information
      # about the error. Status

      def describe_what_if_analysis(
        what_if_analysis_arn : String
      ) : Types::DescribeWhatIfAnalysisResponse

        input = Types::DescribeWhatIfAnalysisRequest.new(what_if_analysis_arn: what_if_analysis_arn)
        describe_what_if_analysis(input)
      end

      def describe_what_if_analysis(input : Types::DescribeWhatIfAnalysisRequest) : Types::DescribeWhatIfAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WHAT_IF_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWhatIfAnalysisResponse, "DescribeWhatIfAnalysis")
      end

      # Describes the what-if forecast created using the CreateWhatIfForecast operation. In addition to
      # listing the properties provided in the CreateWhatIfForecast request, this operation lists the
      # following properties: CreationTime LastModificationTime Message - If an error occurred, information
      # about the error. Status

      def describe_what_if_forecast(
        what_if_forecast_arn : String
      ) : Types::DescribeWhatIfForecastResponse

        input = Types::DescribeWhatIfForecastRequest.new(what_if_forecast_arn: what_if_forecast_arn)
        describe_what_if_forecast(input)
      end

      def describe_what_if_forecast(input : Types::DescribeWhatIfForecastRequest) : Types::DescribeWhatIfForecastResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WHAT_IF_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWhatIfForecastResponse, "DescribeWhatIfForecast")
      end

      # Describes the what-if forecast export created using the CreateWhatIfForecastExport operation. In
      # addition to listing the properties provided in the CreateWhatIfForecastExport request, this
      # operation lists the following properties: CreationTime LastModificationTime Message - If an error
      # occurred, information about the error. Status

      def describe_what_if_forecast_export(
        what_if_forecast_export_arn : String
      ) : Types::DescribeWhatIfForecastExportResponse

        input = Types::DescribeWhatIfForecastExportRequest.new(what_if_forecast_export_arn: what_if_forecast_export_arn)
        describe_what_if_forecast_export(input)
      end

      def describe_what_if_forecast_export(input : Types::DescribeWhatIfForecastExportRequest) : Types::DescribeWhatIfForecastExportResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WHAT_IF_FORECAST_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWhatIfForecastExportResponse, "DescribeWhatIfForecastExport")
      end

      # Provides metrics on the accuracy of the models that were trained by the CreatePredictor operation.
      # Use metrics to see how well the model performed and to decide whether to use the predictor to
      # generate a forecast. For more information, see Predictor Metrics . This operation generates metrics
      # for each backtest window that was evaluated. The number of backtest windows (
      # NumberOfBacktestWindows ) is specified using the EvaluationParameters object, which is optionally
      # included in the CreatePredictor request. If NumberOfBacktestWindows isn't specified, the number
      # defaults to one. The parameters of the filling method determine which items contribute to the
      # metrics. If you want all items to contribute, specify zero . If you want only those items that have
      # complete data in the range being evaluated to contribute, specify nan . For more information, see
      # FeaturizationMethod . Before you can get accuracy metrics, the Status of the predictor must be
      # ACTIVE , signifying that training has completed. To get the status, use the DescribePredictor
      # operation.

      def get_accuracy_metrics(
        predictor_arn : String
      ) : Types::GetAccuracyMetricsResponse

        input = Types::GetAccuracyMetricsRequest.new(predictor_arn: predictor_arn)
        get_accuracy_metrics(input)
      end

      def get_accuracy_metrics(input : Types::GetAccuracyMetricsRequest) : Types::GetAccuracyMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCURACY_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccuracyMetricsResponse, "GetAccuracyMetrics")
      end

      # Returns a list of dataset groups created using the CreateDatasetGroup operation. For each dataset
      # group, this operation returns a summary of its properties, including its Amazon Resource Name (ARN).
      # You can retrieve the complete set of properties by using the dataset group ARN with the
      # DescribeDatasetGroup operation.

      def list_dataset_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetGroupsResponse

        input = Types::ListDatasetGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_dataset_groups(input)
      end

      def list_dataset_groups(input : Types::ListDatasetGroupsRequest) : Types::ListDatasetGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetGroupsResponse, "ListDatasetGroups")
      end

      # Returns a list of dataset import jobs created using the CreateDatasetImportJob operation. For each
      # import job, this operation returns a summary of its properties, including its Amazon Resource Name
      # (ARN). You can retrieve the complete set of properties by using the ARN with the
      # DescribeDatasetImportJob operation. You can filter the list by providing an array of Filter objects.

      def list_dataset_import_jobs(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetImportJobsResponse

        input = Types::ListDatasetImportJobsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_dataset_import_jobs(input)
      end

      def list_dataset_import_jobs(input : Types::ListDatasetImportJobsRequest) : Types::ListDatasetImportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASET_IMPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetImportJobsResponse, "ListDatasetImportJobs")
      end

      # Returns a list of datasets created using the CreateDataset operation. For each dataset, a summary of
      # its properties, including its Amazon Resource Name (ARN), is returned. To retrieve the complete set
      # of properties, use the ARN with the DescribeDataset operation.

      def list_datasets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetsResponse

        input = Types::ListDatasetsRequest.new(max_results: max_results, next_token: next_token)
        list_datasets(input)
      end

      def list_datasets(input : Types::ListDatasetsRequest) : Types::ListDatasetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetsResponse, "ListDatasets")
      end

      # Returns a list of Explainability resources created using the CreateExplainability operation. This
      # operation returns a summary for each Explainability. You can filter the list using an array of
      # Filter objects. To retrieve the complete set of properties for a particular Explainability resource,
      # use the ARN with the DescribeExplainability operation.

      def list_explainabilities(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExplainabilitiesResponse

        input = Types::ListExplainabilitiesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_explainabilities(input)
      end

      def list_explainabilities(input : Types::ListExplainabilitiesRequest) : Types::ListExplainabilitiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXPLAINABILITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExplainabilitiesResponse, "ListExplainabilities")
      end

      # Returns a list of Explainability exports created using the CreateExplainabilityExport operation.
      # This operation returns a summary for each Explainability export. You can filter the list using an
      # array of Filter objects. To retrieve the complete set of properties for a particular Explainability
      # export, use the ARN with the DescribeExplainability operation.

      def list_explainability_exports(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExplainabilityExportsResponse

        input = Types::ListExplainabilityExportsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_explainability_exports(input)
      end

      def list_explainability_exports(input : Types::ListExplainabilityExportsRequest) : Types::ListExplainabilityExportsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXPLAINABILITY_EXPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExplainabilityExportsResponse, "ListExplainabilityExports")
      end

      # Returns a list of forecast export jobs created using the CreateForecastExportJob operation. For each
      # forecast export job, this operation returns a summary of its properties, including its Amazon
      # Resource Name (ARN). To retrieve the complete set of properties, use the ARN with the
      # DescribeForecastExportJob operation. You can filter the list using an array of Filter objects.

      def list_forecast_export_jobs(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListForecastExportJobsResponse

        input = Types::ListForecastExportJobsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_forecast_export_jobs(input)
      end

      def list_forecast_export_jobs(input : Types::ListForecastExportJobsRequest) : Types::ListForecastExportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FORECAST_EXPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListForecastExportJobsResponse, "ListForecastExportJobs")
      end

      # Returns a list of forecasts created using the CreateForecast operation. For each forecast, this
      # operation returns a summary of its properties, including its Amazon Resource Name (ARN). To retrieve
      # the complete set of properties, specify the ARN with the DescribeForecast operation. You can filter
      # the list using an array of Filter objects.

      def list_forecasts(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListForecastsResponse

        input = Types::ListForecastsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_forecasts(input)
      end

      def list_forecasts(input : Types::ListForecastsRequest) : Types::ListForecastsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FORECASTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListForecastsResponse, "ListForecasts")
      end

      # Returns a list of the monitoring evaluation results and predictor events collected by the monitor
      # resource during different windows of time. For information about monitoring see predictor-monitoring
      # . For more information about retrieving monitoring results see Viewing Monitoring Results .

      def list_monitor_evaluations(
        monitor_arn : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMonitorEvaluationsResponse

        input = Types::ListMonitorEvaluationsRequest.new(monitor_arn: monitor_arn, filters: filters, max_results: max_results, next_token: next_token)
        list_monitor_evaluations(input)
      end

      def list_monitor_evaluations(input : Types::ListMonitorEvaluationsRequest) : Types::ListMonitorEvaluationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MONITOR_EVALUATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMonitorEvaluationsResponse, "ListMonitorEvaluations")
      end

      # Returns a list of monitors created with the CreateMonitor operation and CreateAutoPredictor
      # operation. For each monitor resource, this operation returns of a summary of its properties,
      # including its Amazon Resource Name (ARN). You can retrieve a complete set of properties of a monitor
      # resource by specify the monitor's ARN in the DescribeMonitor operation.

      def list_monitors(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMonitorsResponse

        input = Types::ListMonitorsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_monitors(input)
      end

      def list_monitors(input : Types::ListMonitorsRequest) : Types::ListMonitorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MONITORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMonitorsResponse, "ListMonitors")
      end

      # Returns a list of predictor backtest export jobs created using the CreatePredictorBacktestExportJob
      # operation. This operation returns a summary for each backtest export job. You can filter the list
      # using an array of Filter objects. To retrieve the complete set of properties for a particular
      # backtest export job, use the ARN with the DescribePredictorBacktestExportJob operation.

      def list_predictor_backtest_export_jobs(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPredictorBacktestExportJobsResponse

        input = Types::ListPredictorBacktestExportJobsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_predictor_backtest_export_jobs(input)
      end

      def list_predictor_backtest_export_jobs(input : Types::ListPredictorBacktestExportJobsRequest) : Types::ListPredictorBacktestExportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PREDICTOR_BACKTEST_EXPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPredictorBacktestExportJobsResponse, "ListPredictorBacktestExportJobs")
      end

      # Returns a list of predictors created using the CreateAutoPredictor or CreatePredictor operations.
      # For each predictor, this operation returns a summary of its properties, including its Amazon
      # Resource Name (ARN). You can retrieve the complete set of properties by using the ARN with the
      # DescribeAutoPredictor and DescribePredictor operations. You can filter the list using an array of
      # Filter objects.

      def list_predictors(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPredictorsResponse

        input = Types::ListPredictorsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_predictors(input)
      end

      def list_predictors(input : Types::ListPredictorsRequest) : Types::ListPredictorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PREDICTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPredictorsResponse, "ListPredictors")
      end

      # Lists the tags for an Amazon Forecast resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Returns a list of what-if analyses created using the CreateWhatIfAnalysis operation. For each
      # what-if analysis, this operation returns a summary of its properties, including its Amazon Resource
      # Name (ARN). You can retrieve the complete set of properties by using the what-if analysis ARN with
      # the DescribeWhatIfAnalysis operation.

      def list_what_if_analyses(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWhatIfAnalysesResponse

        input = Types::ListWhatIfAnalysesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_what_if_analyses(input)
      end

      def list_what_if_analyses(input : Types::ListWhatIfAnalysesRequest) : Types::ListWhatIfAnalysesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WHAT_IF_ANALYSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWhatIfAnalysesResponse, "ListWhatIfAnalyses")
      end

      # Returns a list of what-if forecast exports created using the CreateWhatIfForecastExport operation.
      # For each what-if forecast export, this operation returns a summary of its properties, including its
      # Amazon Resource Name (ARN). You can retrieve the complete set of properties by using the what-if
      # forecast export ARN with the DescribeWhatIfForecastExport operation.

      def list_what_if_forecast_exports(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWhatIfForecastExportsResponse

        input = Types::ListWhatIfForecastExportsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_what_if_forecast_exports(input)
      end

      def list_what_if_forecast_exports(input : Types::ListWhatIfForecastExportsRequest) : Types::ListWhatIfForecastExportsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WHAT_IF_FORECAST_EXPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWhatIfForecastExportsResponse, "ListWhatIfForecastExports")
      end

      # Returns a list of what-if forecasts created using the CreateWhatIfForecast operation. For each
      # what-if forecast, this operation returns a summary of its properties, including its Amazon Resource
      # Name (ARN). You can retrieve the complete set of properties by using the what-if forecast ARN with
      # the DescribeWhatIfForecast operation.

      def list_what_if_forecasts(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWhatIfForecastsResponse

        input = Types::ListWhatIfForecastsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_what_if_forecasts(input)
      end

      def list_what_if_forecasts(input : Types::ListWhatIfForecastsRequest) : Types::ListWhatIfForecastsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WHAT_IF_FORECASTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWhatIfForecastsResponse, "ListWhatIfForecasts")
      end

      # Resumes a stopped monitor resource.

      def resume_resource(
        resource_arn : String
      ) : Nil

        input = Types::ResumeResourceRequest.new(resource_arn: resource_arn)
        resume_resource(input)
      end

      def resume_resource(input : Types::ResumeResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESUME_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a resource. The resource undergoes the following states: CREATE_STOPPING and CREATE_STOPPED .
      # You cannot resume a resource once it has been stopped. This operation can be applied to the
      # following resources (and their corresponding child resources): Dataset Import Job Predictor Job
      # Forecast Job Forecast Export Job Predictor Backtest Export Job Explainability Job Explainability
      # Export Job

      def stop_resource(
        resource_arn : String
      ) : Nil

        input = Types::StopResourceRequest.new(resource_arn: resource_arn)
        stop_resource(input)
      end

      def stop_resource(input : Types::StopResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Associates the specified tags to a resource with the specified resourceArn . If existing tags on a
      # resource are not specified in the request parameters, they are not changed. When a resource is
      # deleted, the tags associated with that resource are also deleted.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Deletes the specified tags from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Replaces the datasets in a dataset group with the specified datasets. The Status of the dataset
      # group must be ACTIVE before you can use the dataset group to create a predictor. Use the
      # DescribeDatasetGroup operation to get the status.

      def update_dataset_group(
        dataset_arns : Array(String),
        dataset_group_arn : String
      ) : Types::UpdateDatasetGroupResponse

        input = Types::UpdateDatasetGroupRequest.new(dataset_arns: dataset_arns, dataset_group_arn: dataset_group_arn)
        update_dataset_group(input)
      end

      def update_dataset_group(input : Types::UpdateDatasetGroupRequest) : Types::UpdateDatasetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATASET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDatasetGroupResponse, "UpdateDatasetGroup")
      end
    end
  end
end
