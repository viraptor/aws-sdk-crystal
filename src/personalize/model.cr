module Aws
  module Personalize
    module Model
      API_VERSION = "2018-05-22"
      TARGET_PREFIX = "AmazonPersonalize"
      SIGNING_NAME = "personalize"
      ENDPOINT_PREFIX = "personalize"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://personalize-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://personalize-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://personalize.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://personalize.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_BATCH_INFERENCE_JOB = OperationModel.new(
        name: "CreateBatchInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BATCH_SEGMENT_JOB = OperationModel.new(
        name: "CreateBatchSegmentJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CAMPAIGN = OperationModel.new(
        name: "CreateCampaign",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_DELETION_JOB = OperationModel.new(
        name: "CreateDataDeletionJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATASET_EXPORT_JOB = OperationModel.new(
        name: "CreateDatasetExportJob",
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

      CREATE_EVENT_TRACKER = OperationModel.new(
        name: "CreateEventTracker",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FILTER = OperationModel.new(
        name: "CreateFilter",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_METRIC_ATTRIBUTION = OperationModel.new(
        name: "CreateMetricAttribution",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RECOMMENDER = OperationModel.new(
        name: "CreateRecommender",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCHEMA = OperationModel.new(
        name: "CreateSchema",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SOLUTION = OperationModel.new(
        name: "CreateSolution",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SOLUTION_VERSION = OperationModel.new(
        name: "CreateSolutionVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CAMPAIGN = OperationModel.new(
        name: "DeleteCampaign",
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

      DELETE_EVENT_TRACKER = OperationModel.new(
        name: "DeleteEventTracker",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FILTER = OperationModel.new(
        name: "DeleteFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_METRIC_ATTRIBUTION = OperationModel.new(
        name: "DeleteMetricAttribution",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RECOMMENDER = OperationModel.new(
        name: "DeleteRecommender",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCHEMA = OperationModel.new(
        name: "DeleteSchema",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SOLUTION = OperationModel.new(
        name: "DeleteSolution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ALGORITHM = OperationModel.new(
        name: "DescribeAlgorithm",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BATCH_INFERENCE_JOB = OperationModel.new(
        name: "DescribeBatchInferenceJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BATCH_SEGMENT_JOB = OperationModel.new(
        name: "DescribeBatchSegmentJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAMPAIGN = OperationModel.new(
        name: "DescribeCampaign",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_DELETION_JOB = OperationModel.new(
        name: "DescribeDataDeletionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET_EXPORT_JOB = OperationModel.new(
        name: "DescribeDatasetExportJob",
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

      DESCRIBE_EVENT_TRACKER = OperationModel.new(
        name: "DescribeEventTracker",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FEATURE_TRANSFORMATION = OperationModel.new(
        name: "DescribeFeatureTransformation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FILTER = OperationModel.new(
        name: "DescribeFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METRIC_ATTRIBUTION = OperationModel.new(
        name: "DescribeMetricAttribution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECIPE = OperationModel.new(
        name: "DescribeRecipe",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECOMMENDER = OperationModel.new(
        name: "DescribeRecommender",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCHEMA = OperationModel.new(
        name: "DescribeSchema",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SOLUTION = OperationModel.new(
        name: "DescribeSolution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SOLUTION_VERSION = OperationModel.new(
        name: "DescribeSolutionVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SOLUTION_METRICS = OperationModel.new(
        name: "GetSolutionMetrics",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BATCH_INFERENCE_JOBS = OperationModel.new(
        name: "ListBatchInferenceJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BATCH_SEGMENT_JOBS = OperationModel.new(
        name: "ListBatchSegmentJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CAMPAIGNS = OperationModel.new(
        name: "ListCampaigns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_DELETION_JOBS = OperationModel.new(
        name: "ListDataDeletionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASET_EXPORT_JOBS = OperationModel.new(
        name: "ListDatasetExportJobs",
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

      LIST_EVENT_TRACKERS = OperationModel.new(
        name: "ListEventTrackers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FILTERS = OperationModel.new(
        name: "ListFilters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_METRIC_ATTRIBUTION_METRICS = OperationModel.new(
        name: "ListMetricAttributionMetrics",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_METRIC_ATTRIBUTIONS = OperationModel.new(
        name: "ListMetricAttributions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECIPES = OperationModel.new(
        name: "ListRecipes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECOMMENDERS = OperationModel.new(
        name: "ListRecommenders",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEMAS = OperationModel.new(
        name: "ListSchemas",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SOLUTION_VERSIONS = OperationModel.new(
        name: "ListSolutionVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SOLUTIONS = OperationModel.new(
        name: "ListSolutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      START_RECOMMENDER = OperationModel.new(
        name: "StartRecommender",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_RECOMMENDER = OperationModel.new(
        name: "StopRecommender",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_SOLUTION_VERSION_CREATION = OperationModel.new(
        name: "StopSolutionVersionCreation",
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

      UPDATE_CAMPAIGN = OperationModel.new(
        name: "UpdateCampaign",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DATASET = OperationModel.new(
        name: "UpdateDataset",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_METRIC_ATTRIBUTION = OperationModel.new(
        name: "UpdateMetricAttribution",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RECOMMENDER = OperationModel.new(
        name: "UpdateRecommender",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SOLUTION = OperationModel.new(
        name: "UpdateSolution",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
