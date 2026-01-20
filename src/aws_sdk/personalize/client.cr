module AwsSdk
  module Personalize
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

      # Generates batch recommendations based on a list of items or users stored in Amazon S3 and exports
      # the recommendations to an Amazon S3 bucket. To generate batch recommendations, specify the ARN of a
      # solution version and an Amazon S3 URI for the input and output data. For user personalization,
      # popular items, and personalized ranking solutions, the batch inference job generates a list of
      # recommended items for each user ID in the input file. For related items solutions, the job generates
      # a list of recommended items for each item ID in the input file. For more information, see Creating a
      # batch inference job . If you use the Similar-Items recipe, Amazon Personalize can add descriptive
      # themes to batch recommendations. To generate themes, set the job's mode to THEME_GENERATION and
      # specify the name of the field that contains item names in the input data. For more information about
      # generating themes, see Batch recommendations with themes from Content Generator . You can't get
      # batch recommendations with the Trending-Now or Next-Best-Action recipes.

      def create_batch_inference_job(
        job_input : Types::BatchInferenceJobInput,
        job_name : String,
        job_output : Types::BatchInferenceJobOutput,
        role_arn : String,
        solution_version_arn : String,
        batch_inference_job_config : Types::BatchInferenceJobConfig? = nil,
        batch_inference_job_mode : String? = nil,
        filter_arn : String? = nil,
        num_results : Int32? = nil,
        tags : Array(Types::Tag)? = nil,
        theme_generation_config : Types::ThemeGenerationConfig? = nil
      ) : Types::CreateBatchInferenceJobResponse

        input = Types::CreateBatchInferenceJobRequest.new(job_input: job_input, job_name: job_name, job_output: job_output, role_arn: role_arn, solution_version_arn: solution_version_arn, batch_inference_job_config: batch_inference_job_config, batch_inference_job_mode: batch_inference_job_mode, filter_arn: filter_arn, num_results: num_results, tags: tags, theme_generation_config: theme_generation_config)
        create_batch_inference_job(input)
      end

      def create_batch_inference_job(input : Types::CreateBatchInferenceJobRequest) : Types::CreateBatchInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BATCH_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBatchInferenceJobResponse, "CreateBatchInferenceJob")
      end

      # Creates a batch segment job. The operation can handle up to 50 million records and the input file
      # must be in JSON format. For more information, see Getting batch recommendations and user segments .

      def create_batch_segment_job(
        job_input : Types::BatchSegmentJobInput,
        job_name : String,
        job_output : Types::BatchSegmentJobOutput,
        role_arn : String,
        solution_version_arn : String,
        filter_arn : String? = nil,
        num_results : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateBatchSegmentJobResponse

        input = Types::CreateBatchSegmentJobRequest.new(job_input: job_input, job_name: job_name, job_output: job_output, role_arn: role_arn, solution_version_arn: solution_version_arn, filter_arn: filter_arn, num_results: num_results, tags: tags)
        create_batch_segment_job(input)
      end

      def create_batch_segment_job(input : Types::CreateBatchSegmentJobRequest) : Types::CreateBatchSegmentJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BATCH_SEGMENT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBatchSegmentJobResponse, "CreateBatchSegmentJob")
      end

      # You incur campaign costs while it is active. To avoid unnecessary costs, make sure to delete the
      # campaign when you are finished. For information about campaign costs, see Amazon Personalize pricing
      # . Creates a campaign that deploys a solution version. When a client calls the GetRecommendations and
      # GetPersonalizedRanking APIs, a campaign is specified in the request. Minimum Provisioned TPS and
      # Auto-Scaling A high minProvisionedTPS will increase your cost. We recommend starting with 1 for
      # minProvisionedTPS (the default). Track your usage using Amazon CloudWatch metrics, and increase the
      # minProvisionedTPS as necessary. When you create an Amazon Personalize campaign, you can specify the
      # minimum provisioned transactions per second ( minProvisionedTPS ) for the campaign. This is the
      # baseline transaction throughput for the campaign provisioned by Amazon Personalize. It sets the
      # minimum billing charge for the campaign while it is active. A transaction is a single
      # GetRecommendations or GetPersonalizedRanking request. The default minProvisionedTPS is 1. If your
      # TPS increases beyond the minProvisionedTPS , Amazon Personalize auto-scales the provisioned capacity
      # up and down, but never below minProvisionedTPS . There's a short time delay while the capacity is
      # increased that might cause loss of transactions. When your traffic reduces, capacity returns to the
      # minProvisionedTPS . You are charged for the the minimum provisioned TPS or, if your requests exceed
      # the minProvisionedTPS , the actual TPS. The actual TPS is the total number of recommendation
      # requests you make. We recommend starting with a low minProvisionedTPS , track your usage using
      # Amazon CloudWatch metrics, and then increase the minProvisionedTPS as necessary. For more
      # information about campaign costs, see Amazon Personalize pricing . Status A campaign can be in one
      # of the following states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
      # DELETE PENDING &gt; DELETE IN_PROGRESS To get the campaign status, call DescribeCampaign . Wait
      # until the status of the campaign is ACTIVE before asking the campaign for recommendations. Related
      # APIs ListCampaigns DescribeCampaign UpdateCampaign DeleteCampaign

      def create_campaign(
        name : String,
        solution_version_arn : String,
        campaign_config : Types::CampaignConfig? = nil,
        min_provisioned_tps : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCampaignResponse

        input = Types::CreateCampaignRequest.new(name: name, solution_version_arn: solution_version_arn, campaign_config: campaign_config, min_provisioned_tps: min_provisioned_tps, tags: tags)
        create_campaign(input)
      end

      def create_campaign(input : Types::CreateCampaignRequest) : Types::CreateCampaignResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCampaignResponse, "CreateCampaign")
      end

      # Creates a batch job that deletes all references to specific users from an Amazon Personalize dataset
      # group in batches. You specify the users to delete in a CSV file of userIds in an Amazon S3 bucket.
      # After a job completes, Amazon Personalize no longer trains on the users’ data and no longer
      # considers the users when generating user segments. For more information about creating a data
      # deletion job, see Deleting users . Your input file must be a CSV file with a single USER_ID column
      # that lists the users IDs. For more information about preparing the CSV file, see Preparing your data
      # deletion file and uploading it to Amazon S3 . To give Amazon Personalize permission to access your
      # input CSV file of userIds, you must specify an IAM service role that has permission to read from the
      # data source. This role needs GetObject and ListBucket permissions for the bucket and its content.
      # These permissions are the same as importing data. For information on granting access to your Amazon
      # S3 bucket, see Giving Amazon Personalize Access to Amazon S3 Resources . After you create a job, it
      # can take up to a day to delete all references to the users from datasets and models. Until the job
      # completes, Amazon Personalize continues to use the data when training. And if you use a User
      # Segmentation recipe, the users might appear in user segments. Status A data deletion job can have
      # one of the following statuses: PENDING &gt; IN_PROGRESS &gt; COMPLETED -or- FAILED To get the status
      # of the data deletion job, call DescribeDataDeletionJob API operation and specify the Amazon Resource
      # Name (ARN) of the job. If the status is FAILED, the response includes a failureReason key, which
      # describes why the job failed. Related APIs ListDataDeletionJobs DescribeDataDeletionJob

      def create_data_deletion_job(
        data_source : Types::DataSource,
        dataset_group_arn : String,
        job_name : String,
        role_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDataDeletionJobResponse

        input = Types::CreateDataDeletionJobRequest.new(data_source: data_source, dataset_group_arn: dataset_group_arn, job_name: job_name, role_arn: role_arn, tags: tags)
        create_data_deletion_job(input)
      end

      def create_data_deletion_job(input : Types::CreateDataDeletionJobRequest) : Types::CreateDataDeletionJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_DELETION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataDeletionJobResponse, "CreateDataDeletionJob")
      end

      # Creates an empty dataset and adds it to the specified dataset group. Use CreateDatasetImportJob to
      # import your training data to a dataset. There are 5 types of datasets: Item interactions Items Users
      # Action interactions Actions Each dataset type has an associated schema with required field types.
      # Only the Item interactions dataset is required in order to train a model (also referred to as
      # creating a solution). A dataset can be in one of the following states: CREATE PENDING &gt; CREATE
      # IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE IN_PROGRESS To get the status
      # of the dataset, call DescribeDataset . Related APIs CreateDatasetGroup ListDatasets DescribeDataset
      # DeleteDataset

      def create_dataset(
        dataset_group_arn : String,
        dataset_type : String,
        name : String,
        schema_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetResponse

        input = Types::CreateDatasetRequest.new(dataset_group_arn: dataset_group_arn, dataset_type: dataset_type, name: name, schema_arn: schema_arn, tags: tags)
        create_dataset(input)
      end

      def create_dataset(input : Types::CreateDatasetRequest) : Types::CreateDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetResponse, "CreateDataset")
      end

      # Creates a job that exports data from your dataset to an Amazon S3 bucket. To allow Amazon
      # Personalize to export the training data, you must specify an service-linked IAM role that gives
      # Amazon Personalize PutObject permissions for your Amazon S3 bucket. For information, see Exporting a
      # dataset in the Amazon Personalize developer guide. Status A dataset export job can be in one of the
      # following states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED To get the
      # status of the export job, call DescribeDatasetExportJob , and specify the Amazon Resource Name (ARN)
      # of the dataset export job. The dataset export is complete when the status shows as ACTIVE. If the
      # status shows as CREATE FAILED, the response includes a failureReason key, which describes why the
      # job failed.

      def create_dataset_export_job(
        dataset_arn : String,
        job_name : String,
        job_output : Types::DatasetExportJobOutput,
        role_arn : String,
        ingestion_mode : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetExportJobResponse

        input = Types::CreateDatasetExportJobRequest.new(dataset_arn: dataset_arn, job_name: job_name, job_output: job_output, role_arn: role_arn, ingestion_mode: ingestion_mode, tags: tags)
        create_dataset_export_job(input)
      end

      def create_dataset_export_job(input : Types::CreateDatasetExportJobRequest) : Types::CreateDatasetExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetExportJobResponse, "CreateDatasetExportJob")
      end

      # Creates an empty dataset group. A dataset group is a container for Amazon Personalize resources. A
      # dataset group can contain at most three datasets, one for each type of dataset: Item interactions
      # Items Users Actions Action interactions A dataset group can be a Domain dataset group, where you
      # specify a domain and use pre-configured resources like recommenders, or a Custom dataset group,
      # where you use custom resources, such as a solution with a solution version, that you deploy with a
      # campaign. If you start with a Domain dataset group, you can still add custom resources such as
      # solutions and solution versions trained with recipes for custom use cases and deployed with
      # campaigns. A dataset group can be in one of the following states: CREATE PENDING &gt; CREATE
      # IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING To get the status of the dataset group,
      # call DescribeDatasetGroup . If the status shows as CREATE FAILED, the response includes a
      # failureReason key, which describes why the creation failed. You must wait until the status of the
      # dataset group is ACTIVE before adding a dataset to the group. You can specify an Key Management
      # Service (KMS) key to encrypt the datasets in the group. If you specify a KMS key, you must also
      # include an Identity and Access Management (IAM) role that has permission to access the key. APIs
      # that require a dataset group ARN in the request CreateDataset CreateEventTracker CreateSolution
      # Related APIs ListDatasetGroups DescribeDatasetGroup DeleteDatasetGroup

      def create_dataset_group(
        name : String,
        domain : String? = nil,
        kms_key_arn : String? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetGroupResponse

        input = Types::CreateDatasetGroupRequest.new(name: name, domain: domain, kms_key_arn: kms_key_arn, role_arn: role_arn, tags: tags)
        create_dataset_group(input)
      end

      def create_dataset_group(input : Types::CreateDatasetGroupRequest) : Types::CreateDatasetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetGroupResponse, "CreateDatasetGroup")
      end

      # Creates a job that imports training data from your data source (an Amazon S3 bucket) to an Amazon
      # Personalize dataset. To allow Amazon Personalize to import the training data, you must specify an
      # IAM service role that has permission to read from the data source, as Amazon Personalize makes a
      # copy of your data and processes it internally. For information on granting access to your Amazon S3
      # bucket, see Giving Amazon Personalize Access to Amazon S3 Resources . If you already created a
      # recommender or deployed a custom solution version with a campaign, how new bulk records influence
      # recommendations depends on the domain use case or recipe that you use. For more information, see How
      # new data influences real-time recommendations . By default, a dataset import job replaces any
      # existing data in the dataset that you imported in bulk. To add new records without replacing
      # existing data, specify INCREMENTAL for the import mode in the CreateDatasetImportJob operation.
      # Status A dataset import job can be in one of the following states: CREATE PENDING &gt; CREATE
      # IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED To get the status of the import job, call
      # DescribeDatasetImportJob , providing the Amazon Resource Name (ARN) of the dataset import job. The
      # dataset import is complete when the status shows as ACTIVE. If the status shows as CREATE FAILED,
      # the response includes a failureReason key, which describes why the job failed. Importing takes time.
      # You must wait until the status shows as ACTIVE before training a model using the dataset. Related
      # APIs ListDatasetImportJobs DescribeDatasetImportJob

      def create_dataset_import_job(
        data_source : Types::DataSource,
        dataset_arn : String,
        job_name : String,
        import_mode : String? = nil,
        publish_attribution_metrics_to_s3 : Bool? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetImportJobResponse

        input = Types::CreateDatasetImportJobRequest.new(data_source: data_source, dataset_arn: dataset_arn, job_name: job_name, import_mode: import_mode, publish_attribution_metrics_to_s3: publish_attribution_metrics_to_s3, role_arn: role_arn, tags: tags)
        create_dataset_import_job(input)
      end

      def create_dataset_import_job(input : Types::CreateDatasetImportJobRequest) : Types::CreateDatasetImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetImportJobResponse, "CreateDatasetImportJob")
      end

      # Creates an event tracker that you use when adding event data to a specified dataset group using the
      # PutEvents API. Only one event tracker can be associated with a dataset group. You will get an error
      # if you call CreateEventTracker using the same dataset group as an existing event tracker. When you
      # create an event tracker, the response includes a tracking ID, which you pass as a parameter when you
      # use the PutEvents operation. Amazon Personalize then appends the event data to the Item interactions
      # dataset of the dataset group you specify in your event tracker. The event tracker can be in one of
      # the following states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE
      # PENDING &gt; DELETE IN_PROGRESS To get the status of the event tracker, call DescribeEventTracker .
      # The event tracker must be in the ACTIVE state before using the tracking ID. Related APIs
      # ListEventTrackers DescribeEventTracker DeleteEventTracker

      def create_event_tracker(
        dataset_group_arn : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEventTrackerResponse

        input = Types::CreateEventTrackerRequest.new(dataset_group_arn: dataset_group_arn, name: name, tags: tags)
        create_event_tracker(input)
      end

      def create_event_tracker(input : Types::CreateEventTrackerRequest) : Types::CreateEventTrackerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EVENT_TRACKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEventTrackerResponse, "CreateEventTracker")
      end

      # Creates a recommendation filter. For more information, see Filtering recommendations and user
      # segments .

      def create_filter(
        dataset_group_arn : String,
        filter_expression : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFilterResponse

        input = Types::CreateFilterRequest.new(dataset_group_arn: dataset_group_arn, filter_expression: filter_expression, name: name, tags: tags)
        create_filter(input)
      end

      def create_filter(input : Types::CreateFilterRequest) : Types::CreateFilterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFilterResponse, "CreateFilter")
      end

      # Creates a metric attribution. A metric attribution creates reports on the data that you import into
      # Amazon Personalize. Depending on how you imported the data, you can view reports in Amazon
      # CloudWatch or Amazon S3. For more information, see Measuring impact of recommendations .

      def create_metric_attribution(
        dataset_group_arn : String,
        metrics : Array(Types::MetricAttribute),
        metrics_output_config : Types::MetricAttributionOutput,
        name : String
      ) : Types::CreateMetricAttributionResponse

        input = Types::CreateMetricAttributionRequest.new(dataset_group_arn: dataset_group_arn, metrics: metrics, metrics_output_config: metrics_output_config, name: name)
        create_metric_attribution(input)
      end

      def create_metric_attribution(input : Types::CreateMetricAttributionRequest) : Types::CreateMetricAttributionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_METRIC_ATTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMetricAttributionResponse, "CreateMetricAttribution")
      end

      # Creates a recommender with the recipe (a Domain dataset group use case) you specify. You create
      # recommenders for a Domain dataset group and specify the recommender's Amazon Resource Name (ARN)
      # when you make a GetRecommendations request. Minimum recommendation requests per second A high
      # minRecommendationRequestsPerSecond will increase your bill. We recommend starting with 1 for
      # minRecommendationRequestsPerSecond (the default). Track your usage using Amazon CloudWatch metrics,
      # and increase the minRecommendationRequestsPerSecond as necessary. When you create a recommender, you
      # can configure the recommender's minimum recommendation requests per second. The minimum
      # recommendation requests per second ( minRecommendationRequestsPerSecond ) specifies the baseline
      # recommendation request throughput provisioned by Amazon Personalize. The default
      # minRecommendationRequestsPerSecond is 1 . A recommendation request is a single GetRecommendations
      # operation. Request throughput is measured in requests per second and Amazon Personalize uses your
      # requests per second to derive your requests per hour and the price of your recommender usage. If
      # your requests per second increases beyond minRecommendationRequestsPerSecond , Amazon Personalize
      # auto-scales the provisioned capacity up and down, but never below minRecommendationRequestsPerSecond
      # . There's a short time delay while the capacity is increased that might cause loss of requests. Your
      # bill is the greater of either the minimum requests per hour (based on
      # minRecommendationRequestsPerSecond) or the actual number of requests. The actual request throughput
      # used is calculated as the average requests/second within a one-hour window. We recommend starting
      # with the default minRecommendationRequestsPerSecond , track your usage using Amazon CloudWatch
      # metrics, and then increase the minRecommendationRequestsPerSecond as necessary. Status A recommender
      # can be in one of the following states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or-
      # CREATE FAILED STOP PENDING &gt; STOP IN_PROGRESS &gt; INACTIVE &gt; START PENDING &gt; START
      # IN_PROGRESS &gt; ACTIVE DELETE PENDING &gt; DELETE IN_PROGRESS To get the recommender status, call
      # DescribeRecommender . Wait until the status of the recommender is ACTIVE before asking the
      # recommender for recommendations. Related APIs ListRecommenders DescribeRecommender UpdateRecommender
      # DeleteRecommender

      def create_recommender(
        dataset_group_arn : String,
        name : String,
        recipe_arn : String,
        recommender_config : Types::RecommenderConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRecommenderResponse

        input = Types::CreateRecommenderRequest.new(dataset_group_arn: dataset_group_arn, name: name, recipe_arn: recipe_arn, recommender_config: recommender_config, tags: tags)
        create_recommender(input)
      end

      def create_recommender(input : Types::CreateRecommenderRequest) : Types::CreateRecommenderResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RECOMMENDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRecommenderResponse, "CreateRecommender")
      end

      # Creates an Amazon Personalize schema from the specified schema string. The schema you create must be
      # in Avro JSON format. Amazon Personalize recognizes three schema variants. Each schema is associated
      # with a dataset type and has a set of required field and keywords. If you are creating a schema for a
      # dataset in a Domain dataset group, you provide the domain of the Domain dataset group. You specify a
      # schema when you call CreateDataset . Related APIs ListSchemas DescribeSchema DeleteSchema

      def create_schema(
        name : String,
        schema : String,
        domain : String? = nil
      ) : Types::CreateSchemaResponse

        input = Types::CreateSchemaRequest.new(name: name, schema: schema, domain: domain)
        create_schema(input)
      end

      def create_schema(input : Types::CreateSchemaRequest) : Types::CreateSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSchemaResponse, "CreateSchema")
      end

      # By default, all new solutions use automatic training. With automatic training, you incur training
      # costs while your solution is active. To avoid unnecessary costs, when you are finished you can
      # update the solution to turn off automatic training. For information about training costs, see Amazon
      # Personalize pricing . Creates the configuration for training a model (creating a solution version).
      # This configuration includes the recipe to use for model training and optional training
      # configuration, such as columns to use in training and feature transformation parameters. For more
      # information about configuring a solution, see Creating and configuring a solution . By default, new
      # solutions use automatic training to create solution versions every 7 days. You can change the
      # training frequency. Automatic solution version creation starts within one hour after the solution is
      # ACTIVE. If you manually create a solution version within the hour, the solution skips the first
      # automatic training. For more information, see Configuring automatic training . To turn off automatic
      # training, set performAutoTraining to false. If you turn off automatic training, you must manually
      # create a solution version by calling the CreateSolutionVersion operation. After training starts, you
      # can get the solution version's Amazon Resource Name (ARN) with the ListSolutionVersions API
      # operation. To get its status, use the DescribeSolutionVersion . After training completes you can
      # evaluate model accuracy by calling GetSolutionMetrics . When you are satisfied with the solution
      # version, you deploy it using CreateCampaign . The campaign provides recommendations to a client
      # through the GetRecommendations API. Amazon Personalize doesn't support configuring the hpoObjective
      # for solution hyperparameter optimization at this time. Status A solution can be in one of the
      # following states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE
      # PENDING &gt; DELETE IN_PROGRESS To get the status of the solution, call DescribeSolution . If you
      # use manual training, the status must be ACTIVE before you call CreateSolutionVersion . Related APIs
      # UpdateSolution ListSolutions CreateSolutionVersion DescribeSolution DeleteSolution
      # ListSolutionVersions DescribeSolutionVersion

      def create_solution(
        dataset_group_arn : String,
        name : String,
        event_type : String? = nil,
        perform_auto_ml : Bool? = nil,
        perform_auto_training : Bool? = nil,
        perform_hpo : Bool? = nil,
        perform_incremental_update : Bool? = nil,
        recipe_arn : String? = nil,
        solution_config : Types::SolutionConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSolutionResponse

        input = Types::CreateSolutionRequest.new(dataset_group_arn: dataset_group_arn, name: name, event_type: event_type, perform_auto_ml: perform_auto_ml, perform_auto_training: perform_auto_training, perform_hpo: perform_hpo, perform_incremental_update: perform_incremental_update, recipe_arn: recipe_arn, solution_config: solution_config, tags: tags)
        create_solution(input)
      end

      def create_solution(input : Types::CreateSolutionRequest) : Types::CreateSolutionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SOLUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSolutionResponse, "CreateSolution")
      end

      # Trains or retrains an active solution in a Custom dataset group. A solution is created using the
      # CreateSolution operation and must be in the ACTIVE state before calling CreateSolutionVersion . A
      # new version of the solution is created every time you call this operation. Status A solution version
      # can be in one of the following states: CREATE PENDING CREATE IN_PROGRESS ACTIVE CREATE FAILED CREATE
      # STOPPING CREATE STOPPED To get the status of the version, call DescribeSolutionVersion . Wait until
      # the status shows as ACTIVE before calling CreateCampaign . If the status shows as CREATE FAILED, the
      # response includes a failureReason key, which describes why the job failed. Related APIs
      # ListSolutionVersions DescribeSolutionVersion ListSolutions CreateSolution DescribeSolution
      # DeleteSolution

      def create_solution_version(
        solution_arn : String,
        name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        training_mode : String? = nil
      ) : Types::CreateSolutionVersionResponse

        input = Types::CreateSolutionVersionRequest.new(solution_arn: solution_arn, name: name, tags: tags, training_mode: training_mode)
        create_solution_version(input)
      end

      def create_solution_version(input : Types::CreateSolutionVersionRequest) : Types::CreateSolutionVersionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SOLUTION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSolutionVersionResponse, "CreateSolutionVersion")
      end

      # Removes a campaign by deleting the solution deployment. The solution that the campaign is based on
      # is not deleted and can be redeployed when needed. A deleted campaign can no longer be specified in a
      # GetRecommendations request. For information on creating campaigns, see CreateCampaign .

      def delete_campaign(
        campaign_arn : String
      ) : Nil

        input = Types::DeleteCampaignRequest.new(campaign_arn: campaign_arn)
        delete_campaign(input)
      end

      def delete_campaign(input : Types::DeleteCampaignRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a dataset. You can't delete a dataset if an associated DatasetImportJob or SolutionVersion
      # is in the CREATE PENDING or IN PROGRESS state. For more information about deleting datasets, see
      # Deleting a dataset .

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

      # Deletes a dataset group. Before you delete a dataset group, you must delete the following: All
      # associated event trackers. All associated solutions. All datasets in the dataset group.

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

      # Deletes the event tracker. Does not delete the dataset from the dataset group. For more information
      # on event trackers, see CreateEventTracker .

      def delete_event_tracker(
        event_tracker_arn : String
      ) : Nil

        input = Types::DeleteEventTrackerRequest.new(event_tracker_arn: event_tracker_arn)
        delete_event_tracker(input)
      end

      def delete_event_tracker(input : Types::DeleteEventTrackerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENT_TRACKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a filter.

      def delete_filter(
        filter_arn : String
      ) : Nil

        input = Types::DeleteFilterRequest.new(filter_arn: filter_arn)
        delete_filter(input)
      end

      def delete_filter(input : Types::DeleteFilterRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a metric attribution.

      def delete_metric_attribution(
        metric_attribution_arn : String
      ) : Nil

        input = Types::DeleteMetricAttributionRequest.new(metric_attribution_arn: metric_attribution_arn)
        delete_metric_attribution(input)
      end

      def delete_metric_attribution(input : Types::DeleteMetricAttributionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_METRIC_ATTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deactivates and removes a recommender. A deleted recommender can no longer be specified in a
      # GetRecommendations request.

      def delete_recommender(
        recommender_arn : String
      ) : Nil

        input = Types::DeleteRecommenderRequest.new(recommender_arn: recommender_arn)
        delete_recommender(input)
      end

      def delete_recommender(input : Types::DeleteRecommenderRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RECOMMENDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a schema. Before deleting a schema, you must delete all datasets referencing the schema. For
      # more information on schemas, see CreateSchema .

      def delete_schema(
        schema_arn : String
      ) : Nil

        input = Types::DeleteSchemaRequest.new(schema_arn: schema_arn)
        delete_schema(input)
      end

      def delete_schema(input : Types::DeleteSchemaRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes all versions of a solution and the Solution object itself. Before deleting a solution, you
      # must delete all campaigns based on the solution. To determine what campaigns are using the solution,
      # call ListCampaigns and supply the Amazon Resource Name (ARN) of the solution. You can't delete a
      # solution if an associated SolutionVersion is in the CREATE PENDING or IN PROGRESS state. For more
      # information on solutions, see CreateSolution .

      def delete_solution(
        solution_arn : String
      ) : Nil

        input = Types::DeleteSolutionRequest.new(solution_arn: solution_arn)
        delete_solution(input)
      end

      def delete_solution(input : Types::DeleteSolutionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SOLUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Describes the given algorithm.

      def describe_algorithm(
        algorithm_arn : String
      ) : Types::DescribeAlgorithmResponse

        input = Types::DescribeAlgorithmRequest.new(algorithm_arn: algorithm_arn)
        describe_algorithm(input)
      end

      def describe_algorithm(input : Types::DescribeAlgorithmRequest) : Types::DescribeAlgorithmResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ALGORITHM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAlgorithmResponse, "DescribeAlgorithm")
      end

      # Gets the properties of a batch inference job including name, Amazon Resource Name (ARN), status,
      # input and output configurations, and the ARN of the solution version used to generate the
      # recommendations.

      def describe_batch_inference_job(
        batch_inference_job_arn : String
      ) : Types::DescribeBatchInferenceJobResponse

        input = Types::DescribeBatchInferenceJobRequest.new(batch_inference_job_arn: batch_inference_job_arn)
        describe_batch_inference_job(input)
      end

      def describe_batch_inference_job(input : Types::DescribeBatchInferenceJobRequest) : Types::DescribeBatchInferenceJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BATCH_INFERENCE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBatchInferenceJobResponse, "DescribeBatchInferenceJob")
      end

      # Gets the properties of a batch segment job including name, Amazon Resource Name (ARN), status, input
      # and output configurations, and the ARN of the solution version used to generate segments.

      def describe_batch_segment_job(
        batch_segment_job_arn : String
      ) : Types::DescribeBatchSegmentJobResponse

        input = Types::DescribeBatchSegmentJobRequest.new(batch_segment_job_arn: batch_segment_job_arn)
        describe_batch_segment_job(input)
      end

      def describe_batch_segment_job(input : Types::DescribeBatchSegmentJobRequest) : Types::DescribeBatchSegmentJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BATCH_SEGMENT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBatchSegmentJobResponse, "DescribeBatchSegmentJob")
      end

      # Describes the given campaign, including its status. A campaign can be in one of the following
      # states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt;
      # DELETE IN_PROGRESS When the status is CREATE FAILED , the response includes the failureReason key,
      # which describes why. For more information on campaigns, see CreateCampaign .

      def describe_campaign(
        campaign_arn : String
      ) : Types::DescribeCampaignResponse

        input = Types::DescribeCampaignRequest.new(campaign_arn: campaign_arn)
        describe_campaign(input)
      end

      def describe_campaign(input : Types::DescribeCampaignRequest) : Types::DescribeCampaignResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCampaignResponse, "DescribeCampaign")
      end

      # Describes the data deletion job created by CreateDataDeletionJob , including the job status.

      def describe_data_deletion_job(
        data_deletion_job_arn : String
      ) : Types::DescribeDataDeletionJobResponse

        input = Types::DescribeDataDeletionJobRequest.new(data_deletion_job_arn: data_deletion_job_arn)
        describe_data_deletion_job(input)
      end

      def describe_data_deletion_job(input : Types::DescribeDataDeletionJobRequest) : Types::DescribeDataDeletionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_DELETION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataDeletionJobResponse, "DescribeDataDeletionJob")
      end

      # Describes the given dataset. For more information on datasets, see CreateDataset .

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

      # Describes the dataset export job created by CreateDatasetExportJob , including the export job
      # status.

      def describe_dataset_export_job(
        dataset_export_job_arn : String
      ) : Types::DescribeDatasetExportJobResponse

        input = Types::DescribeDatasetExportJobRequest.new(dataset_export_job_arn: dataset_export_job_arn)
        describe_dataset_export_job(input)
      end

      def describe_dataset_export_job(input : Types::DescribeDatasetExportJobRequest) : Types::DescribeDatasetExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATASET_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatasetExportJobResponse, "DescribeDatasetExportJob")
      end

      # Describes the given dataset group. For more information on dataset groups, see CreateDatasetGroup .

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

      # Describes the dataset import job created by CreateDatasetImportJob , including the import job
      # status.

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

      # Describes an event tracker. The response includes the trackingId and status of the event tracker.
      # For more information on event trackers, see CreateEventTracker .

      def describe_event_tracker(
        event_tracker_arn : String
      ) : Types::DescribeEventTrackerResponse

        input = Types::DescribeEventTrackerRequest.new(event_tracker_arn: event_tracker_arn)
        describe_event_tracker(input)
      end

      def describe_event_tracker(input : Types::DescribeEventTrackerRequest) : Types::DescribeEventTrackerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_TRACKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventTrackerResponse, "DescribeEventTracker")
      end

      # Describes the given feature transformation.

      def describe_feature_transformation(
        feature_transformation_arn : String
      ) : Types::DescribeFeatureTransformationResponse

        input = Types::DescribeFeatureTransformationRequest.new(feature_transformation_arn: feature_transformation_arn)
        describe_feature_transformation(input)
      end

      def describe_feature_transformation(input : Types::DescribeFeatureTransformationRequest) : Types::DescribeFeatureTransformationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FEATURE_TRANSFORMATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFeatureTransformationResponse, "DescribeFeatureTransformation")
      end

      # Describes a filter's properties.

      def describe_filter(
        filter_arn : String
      ) : Types::DescribeFilterResponse

        input = Types::DescribeFilterRequest.new(filter_arn: filter_arn)
        describe_filter(input)
      end

      def describe_filter(input : Types::DescribeFilterRequest) : Types::DescribeFilterResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFilterResponse, "DescribeFilter")
      end

      # Describes a metric attribution.

      def describe_metric_attribution(
        metric_attribution_arn : String
      ) : Types::DescribeMetricAttributionResponse

        input = Types::DescribeMetricAttributionRequest.new(metric_attribution_arn: metric_attribution_arn)
        describe_metric_attribution(input)
      end

      def describe_metric_attribution(input : Types::DescribeMetricAttributionRequest) : Types::DescribeMetricAttributionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METRIC_ATTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetricAttributionResponse, "DescribeMetricAttribution")
      end

      # Describes a recipe. A recipe contains three items: An algorithm that trains a model. Hyperparameters
      # that govern the training. Feature transformation information for modifying the input data before
      # training. Amazon Personalize provides a set of predefined recipes. You specify a recipe when you
      # create a solution with the CreateSolution API. CreateSolution trains a model by using the algorithm
      # in the specified recipe and a training dataset. The solution, when deployed as a campaign, can
      # provide recommendations using the GetRecommendations API.

      def describe_recipe(
        recipe_arn : String
      ) : Types::DescribeRecipeResponse

        input = Types::DescribeRecipeRequest.new(recipe_arn: recipe_arn)
        describe_recipe(input)
      end

      def describe_recipe(input : Types::DescribeRecipeRequest) : Types::DescribeRecipeResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RECIPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRecipeResponse, "DescribeRecipe")
      end

      # Describes the given recommender, including its status. A recommender can be in one of the following
      # states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED STOP PENDING &gt; STOP
      # IN_PROGRESS &gt; INACTIVE &gt; START PENDING &gt; START IN_PROGRESS &gt; ACTIVE DELETE PENDING &gt;
      # DELETE IN_PROGRESS When the status is CREATE FAILED , the response includes the failureReason key,
      # which describes why. The modelMetrics key is null when the recommender is being created or deleted.
      # For more information on recommenders, see CreateRecommender .

      def describe_recommender(
        recommender_arn : String
      ) : Types::DescribeRecommenderResponse

        input = Types::DescribeRecommenderRequest.new(recommender_arn: recommender_arn)
        describe_recommender(input)
      end

      def describe_recommender(input : Types::DescribeRecommenderRequest) : Types::DescribeRecommenderResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RECOMMENDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRecommenderResponse, "DescribeRecommender")
      end

      # Describes a schema. For more information on schemas, see CreateSchema .

      def describe_schema(
        schema_arn : String
      ) : Types::DescribeSchemaResponse

        input = Types::DescribeSchemaRequest.new(schema_arn: schema_arn)
        describe_schema(input)
      end

      def describe_schema(input : Types::DescribeSchemaRequest) : Types::DescribeSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSchemaResponse, "DescribeSchema")
      end

      # Describes a solution. For more information on solutions, see CreateSolution .

      def describe_solution(
        solution_arn : String
      ) : Types::DescribeSolutionResponse

        input = Types::DescribeSolutionRequest.new(solution_arn: solution_arn)
        describe_solution(input)
      end

      def describe_solution(input : Types::DescribeSolutionRequest) : Types::DescribeSolutionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SOLUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSolutionResponse, "DescribeSolution")
      end

      # Describes a specific version of a solution. For more information on solutions, see CreateSolution

      def describe_solution_version(
        solution_version_arn : String
      ) : Types::DescribeSolutionVersionResponse

        input = Types::DescribeSolutionVersionRequest.new(solution_version_arn: solution_version_arn)
        describe_solution_version(input)
      end

      def describe_solution_version(input : Types::DescribeSolutionVersionRequest) : Types::DescribeSolutionVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SOLUTION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSolutionVersionResponse, "DescribeSolutionVersion")
      end

      # Gets the metrics for the specified solution version.

      def get_solution_metrics(
        solution_version_arn : String
      ) : Types::GetSolutionMetricsResponse

        input = Types::GetSolutionMetricsRequest.new(solution_version_arn: solution_version_arn)
        get_solution_metrics(input)
      end

      def get_solution_metrics(input : Types::GetSolutionMetricsRequest) : Types::GetSolutionMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SOLUTION_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSolutionMetricsResponse, "GetSolutionMetrics")
      end

      # Gets a list of the batch inference jobs that have been performed off of a solution version.

      def list_batch_inference_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        solution_version_arn : String? = nil
      ) : Types::ListBatchInferenceJobsResponse

        input = Types::ListBatchInferenceJobsRequest.new(max_results: max_results, next_token: next_token, solution_version_arn: solution_version_arn)
        list_batch_inference_jobs(input)
      end

      def list_batch_inference_jobs(input : Types::ListBatchInferenceJobsRequest) : Types::ListBatchInferenceJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BATCH_INFERENCE_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBatchInferenceJobsResponse, "ListBatchInferenceJobs")
      end

      # Gets a list of the batch segment jobs that have been performed off of a solution version that you
      # specify.

      def list_batch_segment_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        solution_version_arn : String? = nil
      ) : Types::ListBatchSegmentJobsResponse

        input = Types::ListBatchSegmentJobsRequest.new(max_results: max_results, next_token: next_token, solution_version_arn: solution_version_arn)
        list_batch_segment_jobs(input)
      end

      def list_batch_segment_jobs(input : Types::ListBatchSegmentJobsRequest) : Types::ListBatchSegmentJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BATCH_SEGMENT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBatchSegmentJobsResponse, "ListBatchSegmentJobs")
      end

      # Returns a list of campaigns that use the given solution. When a solution is not specified, all the
      # campaigns associated with the account are listed. The response provides the properties for each
      # campaign, including the Amazon Resource Name (ARN). For more information on campaigns, see
      # CreateCampaign .

      def list_campaigns(
        max_results : Int32? = nil,
        next_token : String? = nil,
        solution_arn : String? = nil
      ) : Types::ListCampaignsResponse

        input = Types::ListCampaignsRequest.new(max_results: max_results, next_token: next_token, solution_arn: solution_arn)
        list_campaigns(input)
      end

      def list_campaigns(input : Types::ListCampaignsRequest) : Types::ListCampaignsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CAMPAIGNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCampaignsResponse, "ListCampaigns")
      end

      # Returns a list of data deletion jobs for a dataset group ordered by creation time, with the most
      # recent first. When a dataset group is not specified, all the data deletion jobs associated with the
      # account are listed. The response provides the properties for each job, including the Amazon Resource
      # Name (ARN). For more information on data deletion jobs, see Deleting users .

      def list_data_deletion_jobs(
        dataset_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDataDeletionJobsResponse

        input = Types::ListDataDeletionJobsRequest.new(dataset_group_arn: dataset_group_arn, max_results: max_results, next_token: next_token)
        list_data_deletion_jobs(input)
      end

      def list_data_deletion_jobs(input : Types::ListDataDeletionJobsRequest) : Types::ListDataDeletionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_DELETION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataDeletionJobsResponse, "ListDataDeletionJobs")
      end

      # Returns a list of dataset export jobs that use the given dataset. When a dataset is not specified,
      # all the dataset export jobs associated with the account are listed. The response provides the
      # properties for each dataset export job, including the Amazon Resource Name (ARN). For more
      # information on dataset export jobs, see CreateDatasetExportJob . For more information on datasets,
      # see CreateDataset .

      def list_dataset_export_jobs(
        dataset_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetExportJobsResponse

        input = Types::ListDatasetExportJobsRequest.new(dataset_arn: dataset_arn, max_results: max_results, next_token: next_token)
        list_dataset_export_jobs(input)
      end

      def list_dataset_export_jobs(input : Types::ListDatasetExportJobsRequest) : Types::ListDatasetExportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASET_EXPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetExportJobsResponse, "ListDatasetExportJobs")
      end

      # Returns a list of dataset groups. The response provides the properties for each dataset group,
      # including the Amazon Resource Name (ARN). For more information on dataset groups, see
      # CreateDatasetGroup .

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

      # Returns a list of dataset import jobs that use the given dataset. When a dataset is not specified,
      # all the dataset import jobs associated with the account are listed. The response provides the
      # properties for each dataset import job, including the Amazon Resource Name (ARN). For more
      # information on dataset import jobs, see CreateDatasetImportJob . For more information on datasets,
      # see CreateDataset .

      def list_dataset_import_jobs(
        dataset_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetImportJobsResponse

        input = Types::ListDatasetImportJobsRequest.new(dataset_arn: dataset_arn, max_results: max_results, next_token: next_token)
        list_dataset_import_jobs(input)
      end

      def list_dataset_import_jobs(input : Types::ListDatasetImportJobsRequest) : Types::ListDatasetImportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASET_IMPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetImportJobsResponse, "ListDatasetImportJobs")
      end

      # Returns the list of datasets contained in the given dataset group. The response provides the
      # properties for each dataset, including the Amazon Resource Name (ARN). For more information on
      # datasets, see CreateDataset .

      def list_datasets(
        dataset_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetsResponse

        input = Types::ListDatasetsRequest.new(dataset_group_arn: dataset_group_arn, max_results: max_results, next_token: next_token)
        list_datasets(input)
      end

      def list_datasets(input : Types::ListDatasetsRequest) : Types::ListDatasetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetsResponse, "ListDatasets")
      end

      # Returns the list of event trackers associated with the account. The response provides the properties
      # for each event tracker, including the Amazon Resource Name (ARN) and tracking ID. For more
      # information on event trackers, see CreateEventTracker .

      def list_event_trackers(
        dataset_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEventTrackersResponse

        input = Types::ListEventTrackersRequest.new(dataset_group_arn: dataset_group_arn, max_results: max_results, next_token: next_token)
        list_event_trackers(input)
      end

      def list_event_trackers(input : Types::ListEventTrackersRequest) : Types::ListEventTrackersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EVENT_TRACKERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEventTrackersResponse, "ListEventTrackers")
      end

      # Lists all filters that belong to a given dataset group.

      def list_filters(
        dataset_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFiltersResponse

        input = Types::ListFiltersRequest.new(dataset_group_arn: dataset_group_arn, max_results: max_results, next_token: next_token)
        list_filters(input)
      end

      def list_filters(input : Types::ListFiltersRequest) : Types::ListFiltersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FILTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFiltersResponse, "ListFilters")
      end

      # Lists the metrics for the metric attribution.

      def list_metric_attribution_metrics(
        max_results : Int32? = nil,
        metric_attribution_arn : String? = nil,
        next_token : String? = nil
      ) : Types::ListMetricAttributionMetricsResponse

        input = Types::ListMetricAttributionMetricsRequest.new(max_results: max_results, metric_attribution_arn: metric_attribution_arn, next_token: next_token)
        list_metric_attribution_metrics(input)
      end

      def list_metric_attribution_metrics(input : Types::ListMetricAttributionMetricsRequest) : Types::ListMetricAttributionMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_METRIC_ATTRIBUTION_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMetricAttributionMetricsResponse, "ListMetricAttributionMetrics")
      end

      # Lists metric attributions.

      def list_metric_attributions(
        dataset_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMetricAttributionsResponse

        input = Types::ListMetricAttributionsRequest.new(dataset_group_arn: dataset_group_arn, max_results: max_results, next_token: next_token)
        list_metric_attributions(input)
      end

      def list_metric_attributions(input : Types::ListMetricAttributionsRequest) : Types::ListMetricAttributionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_METRIC_ATTRIBUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMetricAttributionsResponse, "ListMetricAttributions")
      end

      # Returns a list of available recipes. The response provides the properties for each recipe, including
      # the recipe's Amazon Resource Name (ARN).

      def list_recipes(
        domain : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        recipe_provider : String? = nil
      ) : Types::ListRecipesResponse

        input = Types::ListRecipesRequest.new(domain: domain, max_results: max_results, next_token: next_token, recipe_provider: recipe_provider)
        list_recipes(input)
      end

      def list_recipes(input : Types::ListRecipesRequest) : Types::ListRecipesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECIPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecipesResponse, "ListRecipes")
      end

      # Returns a list of recommenders in a given Domain dataset group. When a Domain dataset group is not
      # specified, all the recommenders associated with the account are listed. The response provides the
      # properties for each recommender, including the Amazon Resource Name (ARN). For more information on
      # recommenders, see CreateRecommender .

      def list_recommenders(
        dataset_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRecommendersResponse

        input = Types::ListRecommendersRequest.new(dataset_group_arn: dataset_group_arn, max_results: max_results, next_token: next_token)
        list_recommenders(input)
      end

      def list_recommenders(input : Types::ListRecommendersRequest) : Types::ListRecommendersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECOMMENDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecommendersResponse, "ListRecommenders")
      end

      # Returns the list of schemas associated with the account. The response provides the properties for
      # each schema, including the Amazon Resource Name (ARN). For more information on schemas, see
      # CreateSchema .

      def list_schemas(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSchemasResponse

        input = Types::ListSchemasRequest.new(max_results: max_results, next_token: next_token)
        list_schemas(input)
      end

      def list_schemas(input : Types::ListSchemasRequest) : Types::ListSchemasResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SCHEMAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSchemasResponse, "ListSchemas")
      end

      # Returns a list of solution versions for the given solution. When a solution is not specified, all
      # the solution versions associated with the account are listed. The response provides the properties
      # for each solution version, including the Amazon Resource Name (ARN).

      def list_solution_versions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        solution_arn : String? = nil
      ) : Types::ListSolutionVersionsResponse

        input = Types::ListSolutionVersionsRequest.new(max_results: max_results, next_token: next_token, solution_arn: solution_arn)
        list_solution_versions(input)
      end

      def list_solution_versions(input : Types::ListSolutionVersionsRequest) : Types::ListSolutionVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SOLUTION_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSolutionVersionsResponse, "ListSolutionVersions")
      end

      # Returns a list of solutions in a given dataset group. When a dataset group is not specified, all the
      # solutions associated with the account are listed. The response provides the properties for each
      # solution, including the Amazon Resource Name (ARN). For more information on solutions, see
      # CreateSolution .

      def list_solutions(
        dataset_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSolutionsResponse

        input = Types::ListSolutionsRequest.new(dataset_group_arn: dataset_group_arn, max_results: max_results, next_token: next_token)
        list_solutions(input)
      end

      def list_solutions(input : Types::ListSolutionsRequest) : Types::ListSolutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SOLUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSolutionsResponse, "ListSolutions")
      end

      # Get a list of tags attached to a resource.

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

      # Starts a recommender that is INACTIVE. Starting a recommender does not create any new models, but
      # resumes billing and automatic retraining for the recommender.

      def start_recommender(
        recommender_arn : String
      ) : Types::StartRecommenderResponse

        input = Types::StartRecommenderRequest.new(recommender_arn: recommender_arn)
        start_recommender(input)
      end

      def start_recommender(input : Types::StartRecommenderRequest) : Types::StartRecommenderResponse
        request = Protocol::JsonRpc.build_request(Model::START_RECOMMENDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartRecommenderResponse, "StartRecommender")
      end

      # Stops a recommender that is ACTIVE. Stopping a recommender halts billing and automatic retraining
      # for the recommender.

      def stop_recommender(
        recommender_arn : String
      ) : Types::StopRecommenderResponse

        input = Types::StopRecommenderRequest.new(recommender_arn: recommender_arn)
        stop_recommender(input)
      end

      def stop_recommender(input : Types::StopRecommenderRequest) : Types::StopRecommenderResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_RECOMMENDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopRecommenderResponse, "StopRecommender")
      end

      # Stops creating a solution version that is in a state of CREATE_PENDING or CREATE IN_PROGRESS.
      # Depending on the current state of the solution version, the solution version state changes as
      # follows: CREATE_PENDING &gt; CREATE_STOPPED or CREATE_IN_PROGRESS &gt; CREATE_STOPPING &gt;
      # CREATE_STOPPED You are billed for all of the training completed up until you stop the solution
      # version creation. You cannot resume creating a solution version once it has been stopped.

      def stop_solution_version_creation(
        solution_version_arn : String
      ) : Nil

        input = Types::StopSolutionVersionCreationRequest.new(solution_version_arn: solution_version_arn)
        stop_solution_version_creation(input)
      end

      def stop_solution_version_creation(input : Types::StopSolutionVersionCreationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_SOLUTION_VERSION_CREATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Add a list of tags to a resource.

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

      # Removes the specified tags that are attached to a resource. For more information, see Removing tags
      # from Amazon Personalize resources .

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

      # Updates a campaign to deploy a retrained solution version with an existing campaign, change your
      # campaign's minProvisionedTPS , or modify your campaign's configuration. For example, you can set
      # enableMetadataWithRecommendations to true for an existing campaign. To update a campaign to start
      # automatically using the latest solution version, specify the following: For the SolutionVersionArn
      # parameter, specify the Amazon Resource Name (ARN) of your solution in SolutionArn/$LATEST format. In
      # the campaignConfig , set syncWithLatestSolutionVersion to true . To update a campaign, the campaign
      # status must be ACTIVE or CREATE FAILED. Check the campaign status using the DescribeCampaign
      # operation. You can still get recommendations from a campaign while an update is in progress. The
      # campaign will use the previous solution version and campaign configuration to generate
      # recommendations until the latest campaign update status is Active . For more information about
      # updating a campaign, including code samples, see Updating a campaign . For more information about
      # campaigns, see Creating a campaign .

      def update_campaign(
        campaign_arn : String,
        campaign_config : Types::CampaignConfig? = nil,
        min_provisioned_tps : Int32? = nil,
        solution_version_arn : String? = nil
      ) : Types::UpdateCampaignResponse

        input = Types::UpdateCampaignRequest.new(campaign_arn: campaign_arn, campaign_config: campaign_config, min_provisioned_tps: min_provisioned_tps, solution_version_arn: solution_version_arn)
        update_campaign(input)
      end

      def update_campaign(input : Types::UpdateCampaignRequest) : Types::UpdateCampaignResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCampaignResponse, "UpdateCampaign")
      end

      # Update a dataset to replace its schema with a new or existing one. For more information, see
      # Replacing a dataset's schema .

      def update_dataset(
        dataset_arn : String,
        schema_arn : String
      ) : Types::UpdateDatasetResponse

        input = Types::UpdateDatasetRequest.new(dataset_arn: dataset_arn, schema_arn: schema_arn)
        update_dataset(input)
      end

      def update_dataset(input : Types::UpdateDatasetRequest) : Types::UpdateDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDatasetResponse, "UpdateDataset")
      end

      # Updates a metric attribution.

      def update_metric_attribution(
        add_metrics : Array(Types::MetricAttribute)? = nil,
        metric_attribution_arn : String? = nil,
        metrics_output_config : Types::MetricAttributionOutput? = nil,
        remove_metrics : Array(String)? = nil
      ) : Types::UpdateMetricAttributionResponse

        input = Types::UpdateMetricAttributionRequest.new(add_metrics: add_metrics, metric_attribution_arn: metric_attribution_arn, metrics_output_config: metrics_output_config, remove_metrics: remove_metrics)
        update_metric_attribution(input)
      end

      def update_metric_attribution(input : Types::UpdateMetricAttributionRequest) : Types::UpdateMetricAttributionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_METRIC_ATTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMetricAttributionResponse, "UpdateMetricAttribution")
      end

      # Updates the recommender to modify the recommender configuration. If you update the recommender to
      # modify the columns used in training, Amazon Personalize automatically starts a full retraining of
      # the models backing your recommender. While the update completes, you can still get recommendations
      # from the recommender. The recommender uses the previous configuration until the update completes. To
      # track the status of this update, use the latestRecommenderUpdate returned in the DescribeRecommender
      # operation.

      def update_recommender(
        recommender_arn : String,
        recommender_config : Types::RecommenderConfig
      ) : Types::UpdateRecommenderResponse

        input = Types::UpdateRecommenderRequest.new(recommender_arn: recommender_arn, recommender_config: recommender_config)
        update_recommender(input)
      end

      def update_recommender(input : Types::UpdateRecommenderRequest) : Types::UpdateRecommenderResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RECOMMENDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRecommenderResponse, "UpdateRecommender")
      end

      # Updates an Amazon Personalize solution to use a different automatic training configuration. When you
      # update a solution, you can change whether the solution uses automatic training, and you can change
      # the training frequency. For more information about updating a solution, see Updating a solution . A
      # solution update can be in one of the following states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt;
      # ACTIVE -or- CREATE FAILED To get the status of a solution update, call the DescribeSolution API
      # operation and find the status in the latestSolutionUpdate .

      def update_solution(
        solution_arn : String,
        perform_auto_training : Bool? = nil,
        perform_incremental_update : Bool? = nil,
        solution_update_config : Types::SolutionUpdateConfig? = nil
      ) : Types::UpdateSolutionResponse

        input = Types::UpdateSolutionRequest.new(solution_arn: solution_arn, perform_auto_training: perform_auto_training, perform_incremental_update: perform_incremental_update, solution_update_config: solution_update_config)
        update_solution(input)
      end

      def update_solution(input : Types::UpdateSolutionRequest) : Types::UpdateSolutionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SOLUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSolutionResponse, "UpdateSolution")
      end
    end
  end
end
