module AwsSdk
  module Glue
    module Model
      API_VERSION = "2017-03-31"
      TARGET_PREFIX = "AWSGlue"
      SIGNING_NAME = "glue"
      ENDPOINT_PREFIX = "glue"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://glue-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://glue-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://glue.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://glue.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_PARTITION = OperationModel.new(
        name: "BatchCreatePartition",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_CONNECTION = OperationModel.new(
        name: "BatchDeleteConnection",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_PARTITION = OperationModel.new(
        name: "BatchDeletePartition",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_TABLE = OperationModel.new(
        name: "BatchDeleteTable",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_TABLE_VERSION = OperationModel.new(
        name: "BatchDeleteTableVersion",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_BLUEPRINTS = OperationModel.new(
        name: "BatchGetBlueprints",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_CRAWLERS = OperationModel.new(
        name: "BatchGetCrawlers",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_CUSTOM_ENTITY_TYPES = OperationModel.new(
        name: "BatchGetCustomEntityTypes",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_DATA_QUALITY_RESULT = OperationModel.new(
        name: "BatchGetDataQualityResult",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_DEV_ENDPOINTS = OperationModel.new(
        name: "BatchGetDevEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_JOBS = OperationModel.new(
        name: "BatchGetJobs",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_PARTITION = OperationModel.new(
        name: "BatchGetPartition",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_TABLE_OPTIMIZER = OperationModel.new(
        name: "BatchGetTableOptimizer",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_TRIGGERS = OperationModel.new(
        name: "BatchGetTriggers",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_WORKFLOWS = OperationModel.new(
        name: "BatchGetWorkflows",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_PUT_DATA_QUALITY_STATISTIC_ANNOTATION = OperationModel.new(
        name: "BatchPutDataQualityStatisticAnnotation",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_STOP_JOB_RUN = OperationModel.new(
        name: "BatchStopJobRun",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_UPDATE_PARTITION = OperationModel.new(
        name: "BatchUpdatePartition",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_DATA_QUALITY_RULE_RECOMMENDATION_RUN = OperationModel.new(
        name: "CancelDataQualityRuleRecommendationRun",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_DATA_QUALITY_RULESET_EVALUATION_RUN = OperationModel.new(
        name: "CancelDataQualityRulesetEvaluationRun",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_ML_TASK_RUN = OperationModel.new(
        name: "CancelMLTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_STATEMENT = OperationModel.new(
        name: "CancelStatement",
        http_method: "POST",
        request_uri: "/"
      )

      CHECK_SCHEMA_VERSION_VALIDITY = OperationModel.new(
        name: "CheckSchemaVersionValidity",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BLUEPRINT = OperationModel.new(
        name: "CreateBlueprint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CATALOG = OperationModel.new(
        name: "CreateCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLASSIFIER = OperationModel.new(
        name: "CreateClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COLUMN_STATISTICS_TASK_SETTINGS = OperationModel.new(
        name: "CreateColumnStatisticsTaskSettings",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECTION = OperationModel.new(
        name: "CreateConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CRAWLER = OperationModel.new(
        name: "CreateCrawler",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_ENTITY_TYPE = OperationModel.new(
        name: "CreateCustomEntityType",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_QUALITY_RULESET = OperationModel.new(
        name: "CreateDataQualityRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATABASE = OperationModel.new(
        name: "CreateDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DEV_ENDPOINT = OperationModel.new(
        name: "CreateDevEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GLUE_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "CreateGlueIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INTEGRATION = OperationModel.new(
        name: "CreateIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INTEGRATION_RESOURCE_PROPERTY = OperationModel.new(
        name: "CreateIntegrationResourceProperty",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INTEGRATION_TABLE_PROPERTIES = OperationModel.new(
        name: "CreateIntegrationTableProperties",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ML_TRANSFORM = OperationModel.new(
        name: "CreateMLTransform",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARTITION = OperationModel.new(
        name: "CreatePartition",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARTITION_INDEX = OperationModel.new(
        name: "CreatePartitionIndex",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGISTRY = OperationModel.new(
        name: "CreateRegistry",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCHEMA = OperationModel.new(
        name: "CreateSchema",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCRIPT = OperationModel.new(
        name: "CreateScript",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SECURITY_CONFIGURATION = OperationModel.new(
        name: "CreateSecurityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SESSION = OperationModel.new(
        name: "CreateSession",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TABLE = OperationModel.new(
        name: "CreateTable",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TABLE_OPTIMIZER = OperationModel.new(
        name: "CreateTableOptimizer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRIGGER = OperationModel.new(
        name: "CreateTrigger",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USAGE_PROFILE = OperationModel.new(
        name: "CreateUsageProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER_DEFINED_FUNCTION = OperationModel.new(
        name: "CreateUserDefinedFunction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKFLOW = OperationModel.new(
        name: "CreateWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BLUEPRINT = OperationModel.new(
        name: "DeleteBlueprint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CATALOG = OperationModel.new(
        name: "DeleteCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLASSIFIER = OperationModel.new(
        name: "DeleteClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COLUMN_STATISTICS_FOR_PARTITION = OperationModel.new(
        name: "DeleteColumnStatisticsForPartition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COLUMN_STATISTICS_FOR_TABLE = OperationModel.new(
        name: "DeleteColumnStatisticsForTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COLUMN_STATISTICS_TASK_SETTINGS = OperationModel.new(
        name: "DeleteColumnStatisticsTaskSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CRAWLER = OperationModel.new(
        name: "DeleteCrawler",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_ENTITY_TYPE = OperationModel.new(
        name: "DeleteCustomEntityType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_QUALITY_RULESET = OperationModel.new(
        name: "DeleteDataQualityRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATABASE = OperationModel.new(
        name: "DeleteDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEV_ENDPOINT = OperationModel.new(
        name: "DeleteDevEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GLUE_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "DeleteGlueIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INTEGRATION = OperationModel.new(
        name: "DeleteIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INTEGRATION_RESOURCE_PROPERTY = OperationModel.new(
        name: "DeleteIntegrationResourceProperty",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INTEGRATION_TABLE_PROPERTIES = OperationModel.new(
        name: "DeleteIntegrationTableProperties",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_JOB = OperationModel.new(
        name: "DeleteJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ML_TRANSFORM = OperationModel.new(
        name: "DeleteMLTransform",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARTITION = OperationModel.new(
        name: "DeletePartition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARTITION_INDEX = OperationModel.new(
        name: "DeletePartitionIndex",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGISTRY = OperationModel.new(
        name: "DeleteRegistry",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCHEMA = OperationModel.new(
        name: "DeleteSchema",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCHEMA_VERSIONS = OperationModel.new(
        name: "DeleteSchemaVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SECURITY_CONFIGURATION = OperationModel.new(
        name: "DeleteSecurityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SESSION = OperationModel.new(
        name: "DeleteSession",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TABLE = OperationModel.new(
        name: "DeleteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TABLE_OPTIMIZER = OperationModel.new(
        name: "DeleteTableOptimizer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TABLE_VERSION = OperationModel.new(
        name: "DeleteTableVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRIGGER = OperationModel.new(
        name: "DeleteTrigger",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USAGE_PROFILE = OperationModel.new(
        name: "DeleteUsageProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_DEFINED_FUNCTION = OperationModel.new(
        name: "DeleteUserDefinedFunction",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKFLOW = OperationModel.new(
        name: "DeleteWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTION_TYPE = OperationModel.new(
        name: "DescribeConnectionType",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENTITY = OperationModel.new(
        name: "DescribeEntity",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INBOUND_INTEGRATIONS = OperationModel.new(
        name: "DescribeInboundIntegrations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INTEGRATIONS = OperationModel.new(
        name: "DescribeIntegrations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BLUEPRINT = OperationModel.new(
        name: "GetBlueprint",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BLUEPRINT_RUN = OperationModel.new(
        name: "GetBlueprintRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BLUEPRINT_RUNS = OperationModel.new(
        name: "GetBlueprintRuns",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CATALOG = OperationModel.new(
        name: "GetCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CATALOG_IMPORT_STATUS = OperationModel.new(
        name: "GetCatalogImportStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CATALOGS = OperationModel.new(
        name: "GetCatalogs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLASSIFIER = OperationModel.new(
        name: "GetClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLASSIFIERS = OperationModel.new(
        name: "GetClassifiers",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COLUMN_STATISTICS_FOR_PARTITION = OperationModel.new(
        name: "GetColumnStatisticsForPartition",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COLUMN_STATISTICS_FOR_TABLE = OperationModel.new(
        name: "GetColumnStatisticsForTable",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COLUMN_STATISTICS_TASK_RUN = OperationModel.new(
        name: "GetColumnStatisticsTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COLUMN_STATISTICS_TASK_RUNS = OperationModel.new(
        name: "GetColumnStatisticsTaskRuns",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COLUMN_STATISTICS_TASK_SETTINGS = OperationModel.new(
        name: "GetColumnStatisticsTaskSettings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONNECTION = OperationModel.new(
        name: "GetConnection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONNECTIONS = OperationModel.new(
        name: "GetConnections",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CRAWLER = OperationModel.new(
        name: "GetCrawler",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CRAWLER_METRICS = OperationModel.new(
        name: "GetCrawlerMetrics",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CRAWLERS = OperationModel.new(
        name: "GetCrawlers",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CUSTOM_ENTITY_TYPE = OperationModel.new(
        name: "GetCustomEntityType",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_CATALOG_ENCRYPTION_SETTINGS = OperationModel.new(
        name: "GetDataCatalogEncryptionSettings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_QUALITY_MODEL = OperationModel.new(
        name: "GetDataQualityModel",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_QUALITY_MODEL_RESULT = OperationModel.new(
        name: "GetDataQualityModelResult",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_QUALITY_RESULT = OperationModel.new(
        name: "GetDataQualityResult",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_QUALITY_RULE_RECOMMENDATION_RUN = OperationModel.new(
        name: "GetDataQualityRuleRecommendationRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_QUALITY_RULESET = OperationModel.new(
        name: "GetDataQualityRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_QUALITY_RULESET_EVALUATION_RUN = OperationModel.new(
        name: "GetDataQualityRulesetEvaluationRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATABASE = OperationModel.new(
        name: "GetDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATABASES = OperationModel.new(
        name: "GetDatabases",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATAFLOW_GRAPH = OperationModel.new(
        name: "GetDataflowGraph",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEV_ENDPOINT = OperationModel.new(
        name: "GetDevEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEV_ENDPOINTS = OperationModel.new(
        name: "GetDevEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENTITY_RECORDS = OperationModel.new(
        name: "GetEntityRecords",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GLUE_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "GetGlueIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INTEGRATION_RESOURCE_PROPERTY = OperationModel.new(
        name: "GetIntegrationResourceProperty",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INTEGRATION_TABLE_PROPERTIES = OperationModel.new(
        name: "GetIntegrationTableProperties",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB = OperationModel.new(
        name: "GetJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB_BOOKMARK = OperationModel.new(
        name: "GetJobBookmark",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB_RUN = OperationModel.new(
        name: "GetJobRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB_RUNS = OperationModel.new(
        name: "GetJobRuns",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOBS = OperationModel.new(
        name: "GetJobs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ML_TASK_RUN = OperationModel.new(
        name: "GetMLTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ML_TASK_RUNS = OperationModel.new(
        name: "GetMLTaskRuns",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ML_TRANSFORM = OperationModel.new(
        name: "GetMLTransform",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ML_TRANSFORMS = OperationModel.new(
        name: "GetMLTransforms",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAPPING = OperationModel.new(
        name: "GetMapping",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MATERIALIZED_VIEW_REFRESH_TASK_RUN = OperationModel.new(
        name: "GetMaterializedViewRefreshTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARTITION = OperationModel.new(
        name: "GetPartition",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARTITION_INDEXES = OperationModel.new(
        name: "GetPartitionIndexes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARTITIONS = OperationModel.new(
        name: "GetPartitions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PLAN = OperationModel.new(
        name: "GetPlan",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGISTRY = OperationModel.new(
        name: "GetRegistry",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICIES = OperationModel.new(
        name: "GetResourcePolicies",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEMA = OperationModel.new(
        name: "GetSchema",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEMA_BY_DEFINITION = OperationModel.new(
        name: "GetSchemaByDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEMA_VERSION = OperationModel.new(
        name: "GetSchemaVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEMA_VERSIONS_DIFF = OperationModel.new(
        name: "GetSchemaVersionsDiff",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SECURITY_CONFIGURATION = OperationModel.new(
        name: "GetSecurityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SECURITY_CONFIGURATIONS = OperationModel.new(
        name: "GetSecurityConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SESSION = OperationModel.new(
        name: "GetSession",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STATEMENT = OperationModel.new(
        name: "GetStatement",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TABLE = OperationModel.new(
        name: "GetTable",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TABLE_OPTIMIZER = OperationModel.new(
        name: "GetTableOptimizer",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TABLE_VERSION = OperationModel.new(
        name: "GetTableVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TABLE_VERSIONS = OperationModel.new(
        name: "GetTableVersions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TABLES = OperationModel.new(
        name: "GetTables",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TAGS = OperationModel.new(
        name: "GetTags",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRIGGER = OperationModel.new(
        name: "GetTrigger",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRIGGERS = OperationModel.new(
        name: "GetTriggers",
        http_method: "POST",
        request_uri: "/"
      )

      GET_UNFILTERED_PARTITION_METADATA = OperationModel.new(
        name: "GetUnfilteredPartitionMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_UNFILTERED_PARTITIONS_METADATA = OperationModel.new(
        name: "GetUnfilteredPartitionsMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_UNFILTERED_TABLE_METADATA = OperationModel.new(
        name: "GetUnfilteredTableMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USAGE_PROFILE = OperationModel.new(
        name: "GetUsageProfile",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER_DEFINED_FUNCTION = OperationModel.new(
        name: "GetUserDefinedFunction",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER_DEFINED_FUNCTIONS = OperationModel.new(
        name: "GetUserDefinedFunctions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKFLOW = OperationModel.new(
        name: "GetWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKFLOW_RUN = OperationModel.new(
        name: "GetWorkflowRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKFLOW_RUN_PROPERTIES = OperationModel.new(
        name: "GetWorkflowRunProperties",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKFLOW_RUNS = OperationModel.new(
        name: "GetWorkflowRuns",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CATALOG_TO_GLUE = OperationModel.new(
        name: "ImportCatalogToGlue",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BLUEPRINTS = OperationModel.new(
        name: "ListBlueprints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COLUMN_STATISTICS_TASK_RUNS = OperationModel.new(
        name: "ListColumnStatisticsTaskRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONNECTION_TYPES = OperationModel.new(
        name: "ListConnectionTypes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CRAWLERS = OperationModel.new(
        name: "ListCrawlers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CRAWLS = OperationModel.new(
        name: "ListCrawls",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_ENTITY_TYPES = OperationModel.new(
        name: "ListCustomEntityTypes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_QUALITY_RESULTS = OperationModel.new(
        name: "ListDataQualityResults",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_QUALITY_RULE_RECOMMENDATION_RUNS = OperationModel.new(
        name: "ListDataQualityRuleRecommendationRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_QUALITY_RULESET_EVALUATION_RUNS = OperationModel.new(
        name: "ListDataQualityRulesetEvaluationRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_QUALITY_RULESETS = OperationModel.new(
        name: "ListDataQualityRulesets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_QUALITY_STATISTIC_ANNOTATIONS = OperationModel.new(
        name: "ListDataQualityStatisticAnnotations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_QUALITY_STATISTICS = OperationModel.new(
        name: "ListDataQualityStatistics",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEV_ENDPOINTS = OperationModel.new(
        name: "ListDevEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITIES = OperationModel.new(
        name: "ListEntities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INTEGRATION_RESOURCE_PROPERTIES = OperationModel.new(
        name: "ListIntegrationResourceProperties",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ML_TRANSFORMS = OperationModel.new(
        name: "ListMLTransforms",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MATERIALIZED_VIEW_REFRESH_TASK_RUNS = OperationModel.new(
        name: "ListMaterializedViewRefreshTaskRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REGISTRIES = OperationModel.new(
        name: "ListRegistries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEMA_VERSIONS = OperationModel.new(
        name: "ListSchemaVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEMAS = OperationModel.new(
        name: "ListSchemas",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STATEMENTS = OperationModel.new(
        name: "ListStatements",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TABLE_OPTIMIZER_RUNS = OperationModel.new(
        name: "ListTableOptimizerRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRIGGERS = OperationModel.new(
        name: "ListTriggers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USAGE_PROFILES = OperationModel.new(
        name: "ListUsageProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INTEGRATION = OperationModel.new(
        name: "ModifyIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DATA_CATALOG_ENCRYPTION_SETTINGS = OperationModel.new(
        name: "PutDataCatalogEncryptionSettings",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DATA_QUALITY_PROFILE_ANNOTATION = OperationModel.new(
        name: "PutDataQualityProfileAnnotation",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SCHEMA_VERSION_METADATA = OperationModel.new(
        name: "PutSchemaVersionMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_WORKFLOW_RUN_PROPERTIES = OperationModel.new(
        name: "PutWorkflowRunProperties",
        http_method: "POST",
        request_uri: "/"
      )

      QUERY_SCHEMA_VERSION_METADATA = OperationModel.new(
        name: "QuerySchemaVersionMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_SCHEMA_VERSION = OperationModel.new(
        name: "RegisterSchemaVersion",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_SCHEMA_VERSION_METADATA = OperationModel.new(
        name: "RemoveSchemaVersionMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_JOB_BOOKMARK = OperationModel.new(
        name: "ResetJobBookmark",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_WORKFLOW_RUN = OperationModel.new(
        name: "ResumeWorkflowRun",
        http_method: "POST",
        request_uri: "/"
      )

      RUN_STATEMENT = OperationModel.new(
        name: "RunStatement",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_TABLES = OperationModel.new(
        name: "SearchTables",
        http_method: "POST",
        request_uri: "/"
      )

      START_BLUEPRINT_RUN = OperationModel.new(
        name: "StartBlueprintRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_COLUMN_STATISTICS_TASK_RUN = OperationModel.new(
        name: "StartColumnStatisticsTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_COLUMN_STATISTICS_TASK_RUN_SCHEDULE = OperationModel.new(
        name: "StartColumnStatisticsTaskRunSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      START_CRAWLER = OperationModel.new(
        name: "StartCrawler",
        http_method: "POST",
        request_uri: "/"
      )

      START_CRAWLER_SCHEDULE = OperationModel.new(
        name: "StartCrawlerSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      START_DATA_QUALITY_RULE_RECOMMENDATION_RUN = OperationModel.new(
        name: "StartDataQualityRuleRecommendationRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_DATA_QUALITY_RULESET_EVALUATION_RUN = OperationModel.new(
        name: "StartDataQualityRulesetEvaluationRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_EXPORT_LABELS_TASK_RUN = OperationModel.new(
        name: "StartExportLabelsTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_IMPORT_LABELS_TASK_RUN = OperationModel.new(
        name: "StartImportLabelsTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_JOB_RUN = OperationModel.new(
        name: "StartJobRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_ML_EVALUATION_TASK_RUN = OperationModel.new(
        name: "StartMLEvaluationTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_ML_LABELING_SET_GENERATION_TASK_RUN = OperationModel.new(
        name: "StartMLLabelingSetGenerationTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_MATERIALIZED_VIEW_REFRESH_TASK_RUN = OperationModel.new(
        name: "StartMaterializedViewRefreshTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      START_TRIGGER = OperationModel.new(
        name: "StartTrigger",
        http_method: "POST",
        request_uri: "/"
      )

      START_WORKFLOW_RUN = OperationModel.new(
        name: "StartWorkflowRun",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_COLUMN_STATISTICS_TASK_RUN = OperationModel.new(
        name: "StopColumnStatisticsTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_COLUMN_STATISTICS_TASK_RUN_SCHEDULE = OperationModel.new(
        name: "StopColumnStatisticsTaskRunSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_CRAWLER = OperationModel.new(
        name: "StopCrawler",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_CRAWLER_SCHEDULE = OperationModel.new(
        name: "StopCrawlerSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_MATERIALIZED_VIEW_REFRESH_TASK_RUN = OperationModel.new(
        name: "StopMaterializedViewRefreshTaskRun",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_SESSION = OperationModel.new(
        name: "StopSession",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TRIGGER = OperationModel.new(
        name: "StopTrigger",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_WORKFLOW_RUN = OperationModel.new(
        name: "StopWorkflowRun",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_CONNECTION = OperationModel.new(
        name: "TestConnection",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BLUEPRINT = OperationModel.new(
        name: "UpdateBlueprint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CATALOG = OperationModel.new(
        name: "UpdateCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLASSIFIER = OperationModel.new(
        name: "UpdateClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COLUMN_STATISTICS_FOR_PARTITION = OperationModel.new(
        name: "UpdateColumnStatisticsForPartition",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COLUMN_STATISTICS_FOR_TABLE = OperationModel.new(
        name: "UpdateColumnStatisticsForTable",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COLUMN_STATISTICS_TASK_SETTINGS = OperationModel.new(
        name: "UpdateColumnStatisticsTaskSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONNECTION = OperationModel.new(
        name: "UpdateConnection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CRAWLER = OperationModel.new(
        name: "UpdateCrawler",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CRAWLER_SCHEDULE = OperationModel.new(
        name: "UpdateCrawlerSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DATA_QUALITY_RULESET = OperationModel.new(
        name: "UpdateDataQualityRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DATABASE = OperationModel.new(
        name: "UpdateDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEV_ENDPOINT = OperationModel.new(
        name: "UpdateDevEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GLUE_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "UpdateGlueIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INTEGRATION_RESOURCE_PROPERTY = OperationModel.new(
        name: "UpdateIntegrationResourceProperty",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INTEGRATION_TABLE_PROPERTIES = OperationModel.new(
        name: "UpdateIntegrationTableProperties",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_JOB = OperationModel.new(
        name: "UpdateJob",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_JOB_FROM_SOURCE_CONTROL = OperationModel.new(
        name: "UpdateJobFromSourceControl",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ML_TRANSFORM = OperationModel.new(
        name: "UpdateMLTransform",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PARTITION = OperationModel.new(
        name: "UpdatePartition",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REGISTRY = OperationModel.new(
        name: "UpdateRegistry",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SCHEMA = OperationModel.new(
        name: "UpdateSchema",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SOURCE_CONTROL_FROM_JOB = OperationModel.new(
        name: "UpdateSourceControlFromJob",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TABLE = OperationModel.new(
        name: "UpdateTable",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TABLE_OPTIMIZER = OperationModel.new(
        name: "UpdateTableOptimizer",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRIGGER = OperationModel.new(
        name: "UpdateTrigger",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USAGE_PROFILE = OperationModel.new(
        name: "UpdateUsageProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER_DEFINED_FUNCTION = OperationModel.new(
        name: "UpdateUserDefinedFunction",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKFLOW = OperationModel.new(
        name: "UpdateWorkflow",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
