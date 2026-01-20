module AwsSdk
  module DatabaseMigrationService
    module Model
      API_VERSION = "2016-01-01"
      TARGET_PREFIX = "AmazonDMSv20160101"
      SIGNING_NAME = "dms"
      ENDPOINT_PREFIX = "dms"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://dms-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://dms.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]}],"endpoint":{"url":"https://dms.{Region}.c2s.ic.gov","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]}],"endpoint":{"url":"https://dms.{Region}.sc2s.sgov.gov","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://dms-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://dms.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://dms.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS_TO_RESOURCE = OperationModel.new(
        name: "AddTagsToResource",
        http_method: "POST",
        request_uri: "/"
      )

      APPLY_PENDING_MAINTENANCE_ACTION = OperationModel.new(
        name: "ApplyPendingMaintenanceAction",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_START_RECOMMENDATIONS = OperationModel.new(
        name: "BatchStartRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_METADATA_MODEL_CONVERSION = OperationModel.new(
        name: "CancelMetadataModelConversion",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_METADATA_MODEL_CREATION = OperationModel.new(
        name: "CancelMetadataModelCreation",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_REPLICATION_TASK_ASSESSMENT_RUN = OperationModel.new(
        name: "CancelReplicationTaskAssessmentRun",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_MIGRATION = OperationModel.new(
        name: "CreateDataMigration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_PROVIDER = OperationModel.new(
        name: "CreateDataProvider",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENDPOINT = OperationModel.new(
        name: "CreateEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "CreateEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLEET_ADVISOR_COLLECTOR = OperationModel.new(
        name: "CreateFleetAdvisorCollector",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_PROFILE = OperationModel.new(
        name: "CreateInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MIGRATION_PROJECT = OperationModel.new(
        name: "CreateMigrationProject",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPLICATION_CONFIG = OperationModel.new(
        name: "CreateReplicationConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPLICATION_INSTANCE = OperationModel.new(
        name: "CreateReplicationInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPLICATION_SUBNET_GROUP = OperationModel.new(
        name: "CreateReplicationSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPLICATION_TASK = OperationModel.new(
        name: "CreateReplicationTask",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CERTIFICATE = OperationModel.new(
        name: "DeleteCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_MIGRATION = OperationModel.new(
        name: "DeleteDataMigration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_PROVIDER = OperationModel.new(
        name: "DeleteDataProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENDPOINT = OperationModel.new(
        name: "DeleteEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "DeleteEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEET_ADVISOR_COLLECTOR = OperationModel.new(
        name: "DeleteFleetAdvisorCollector",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEET_ADVISOR_DATABASES = OperationModel.new(
        name: "DeleteFleetAdvisorDatabases",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE_PROFILE = OperationModel.new(
        name: "DeleteInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MIGRATION_PROJECT = OperationModel.new(
        name: "DeleteMigrationProject",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPLICATION_CONFIG = OperationModel.new(
        name: "DeleteReplicationConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPLICATION_INSTANCE = OperationModel.new(
        name: "DeleteReplicationInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPLICATION_SUBNET_GROUP = OperationModel.new(
        name: "DeleteReplicationSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPLICATION_TASK = OperationModel.new(
        name: "DeleteReplicationTask",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPLICATION_TASK_ASSESSMENT_RUN = OperationModel.new(
        name: "DeleteReplicationTaskAssessmentRun",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_ATTRIBUTES = OperationModel.new(
        name: "DescribeAccountAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICABLE_INDIVIDUAL_ASSESSMENTS = OperationModel.new(
        name: "DescribeApplicableIndividualAssessments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CERTIFICATES = OperationModel.new(
        name: "DescribeCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTIONS = OperationModel.new(
        name: "DescribeConnections",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONVERSION_CONFIGURATION = OperationModel.new(
        name: "DescribeConversionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_MIGRATIONS = OperationModel.new(
        name: "DescribeDataMigrations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_PROVIDERS = OperationModel.new(
        name: "DescribeDataProviders",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT_SETTINGS = OperationModel.new(
        name: "DescribeEndpointSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT_TYPES = OperationModel.new(
        name: "DescribeEndpointTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINTS = OperationModel.new(
        name: "DescribeEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENGINE_VERSIONS = OperationModel.new(
        name: "DescribeEngineVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_CATEGORIES = OperationModel.new(
        name: "DescribeEventCategories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_SUBSCRIPTIONS = OperationModel.new(
        name: "DescribeEventSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXTENSION_PACK_ASSOCIATIONS = OperationModel.new(
        name: "DescribeExtensionPackAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_ADVISOR_COLLECTORS = OperationModel.new(
        name: "DescribeFleetAdvisorCollectors",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_ADVISOR_DATABASES = OperationModel.new(
        name: "DescribeFleetAdvisorDatabases",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_ADVISOR_LSA_ANALYSIS = OperationModel.new(
        name: "DescribeFleetAdvisorLsaAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_ADVISOR_SCHEMA_OBJECT_SUMMARY = OperationModel.new(
        name: "DescribeFleetAdvisorSchemaObjectSummary",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_ADVISOR_SCHEMAS = OperationModel.new(
        name: "DescribeFleetAdvisorSchemas",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_PROFILES = OperationModel.new(
        name: "DescribeInstanceProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL = OperationModel.new(
        name: "DescribeMetadataModel",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL_ASSESSMENTS = OperationModel.new(
        name: "DescribeMetadataModelAssessments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL_CHILDREN = OperationModel.new(
        name: "DescribeMetadataModelChildren",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL_CONVERSIONS = OperationModel.new(
        name: "DescribeMetadataModelConversions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL_CREATIONS = OperationModel.new(
        name: "DescribeMetadataModelCreations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL_EXPORTS_AS_SCRIPT = OperationModel.new(
        name: "DescribeMetadataModelExportsAsScript",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL_EXPORTS_TO_TARGET = OperationModel.new(
        name: "DescribeMetadataModelExportsToTarget",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METADATA_MODEL_IMPORTS = OperationModel.new(
        name: "DescribeMetadataModelImports",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MIGRATION_PROJECTS = OperationModel.new(
        name: "DescribeMigrationProjects",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORDERABLE_REPLICATION_INSTANCES = OperationModel.new(
        name: "DescribeOrderableReplicationInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PENDING_MAINTENANCE_ACTIONS = OperationModel.new(
        name: "DescribePendingMaintenanceActions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECOMMENDATION_LIMITATIONS = OperationModel.new(
        name: "DescribeRecommendationLimitations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECOMMENDATIONS = OperationModel.new(
        name: "DescribeRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REFRESH_SCHEMAS_STATUS = OperationModel.new(
        name: "DescribeRefreshSchemasStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_CONFIGS = OperationModel.new(
        name: "DescribeReplicationConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_INSTANCE_TASK_LOGS = OperationModel.new(
        name: "DescribeReplicationInstanceTaskLogs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_INSTANCES = OperationModel.new(
        name: "DescribeReplicationInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_SUBNET_GROUPS = OperationModel.new(
        name: "DescribeReplicationSubnetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_TABLE_STATISTICS = OperationModel.new(
        name: "DescribeReplicationTableStatistics",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_TASK_ASSESSMENT_RESULTS = OperationModel.new(
        name: "DescribeReplicationTaskAssessmentResults",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_TASK_ASSESSMENT_RUNS = OperationModel.new(
        name: "DescribeReplicationTaskAssessmentRuns",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_TASK_INDIVIDUAL_ASSESSMENTS = OperationModel.new(
        name: "DescribeReplicationTaskIndividualAssessments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_TASKS = OperationModel.new(
        name: "DescribeReplicationTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATIONS = OperationModel.new(
        name: "DescribeReplications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCHEMAS = OperationModel.new(
        name: "DescribeSchemas",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TABLE_STATISTICS = OperationModel.new(
        name: "DescribeTableStatistics",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_METADATA_MODEL_ASSESSMENT = OperationModel.new(
        name: "ExportMetadataModelAssessment",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TARGET_SELECTION_RULES = OperationModel.new(
        name: "GetTargetSelectionRules",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CERTIFICATE = OperationModel.new(
        name: "ImportCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CONVERSION_CONFIGURATION = OperationModel.new(
        name: "ModifyConversionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DATA_MIGRATION = OperationModel.new(
        name: "ModifyDataMigration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DATA_PROVIDER = OperationModel.new(
        name: "ModifyDataProvider",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_ENDPOINT = OperationModel.new(
        name: "ModifyEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "ModifyEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_PROFILE = OperationModel.new(
        name: "ModifyInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_MIGRATION_PROJECT = OperationModel.new(
        name: "ModifyMigrationProject",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_REPLICATION_CONFIG = OperationModel.new(
        name: "ModifyReplicationConfig",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_REPLICATION_INSTANCE = OperationModel.new(
        name: "ModifyReplicationInstance",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_REPLICATION_SUBNET_GROUP = OperationModel.new(
        name: "ModifyReplicationSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_REPLICATION_TASK = OperationModel.new(
        name: "ModifyReplicationTask",
        http_method: "POST",
        request_uri: "/"
      )

      MOVE_REPLICATION_TASK = OperationModel.new(
        name: "MoveReplicationTask",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_REPLICATION_INSTANCE = OperationModel.new(
        name: "RebootReplicationInstance",
        http_method: "POST",
        request_uri: "/"
      )

      REFRESH_SCHEMAS = OperationModel.new(
        name: "RefreshSchemas",
        http_method: "POST",
        request_uri: "/"
      )

      RELOAD_REPLICATION_TABLES = OperationModel.new(
        name: "ReloadReplicationTables",
        http_method: "POST",
        request_uri: "/"
      )

      RELOAD_TABLES = OperationModel.new(
        name: "ReloadTables",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveTagsFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      RUN_FLEET_ADVISOR_LSA_ANALYSIS = OperationModel.new(
        name: "RunFleetAdvisorLsaAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      START_DATA_MIGRATION = OperationModel.new(
        name: "StartDataMigration",
        http_method: "POST",
        request_uri: "/"
      )

      START_EXTENSION_PACK_ASSOCIATION = OperationModel.new(
        name: "StartExtensionPackAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      START_METADATA_MODEL_ASSESSMENT = OperationModel.new(
        name: "StartMetadataModelAssessment",
        http_method: "POST",
        request_uri: "/"
      )

      START_METADATA_MODEL_CONVERSION = OperationModel.new(
        name: "StartMetadataModelConversion",
        http_method: "POST",
        request_uri: "/"
      )

      START_METADATA_MODEL_CREATION = OperationModel.new(
        name: "StartMetadataModelCreation",
        http_method: "POST",
        request_uri: "/"
      )

      START_METADATA_MODEL_EXPORT_AS_SCRIPT = OperationModel.new(
        name: "StartMetadataModelExportAsScript",
        http_method: "POST",
        request_uri: "/"
      )

      START_METADATA_MODEL_EXPORT_TO_TARGET = OperationModel.new(
        name: "StartMetadataModelExportToTarget",
        http_method: "POST",
        request_uri: "/"
      )

      START_METADATA_MODEL_IMPORT = OperationModel.new(
        name: "StartMetadataModelImport",
        http_method: "POST",
        request_uri: "/"
      )

      START_RECOMMENDATIONS = OperationModel.new(
        name: "StartRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      START_REPLICATION = OperationModel.new(
        name: "StartReplication",
        http_method: "POST",
        request_uri: "/"
      )

      START_REPLICATION_TASK = OperationModel.new(
        name: "StartReplicationTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_REPLICATION_TASK_ASSESSMENT = OperationModel.new(
        name: "StartReplicationTaskAssessment",
        http_method: "POST",
        request_uri: "/"
      )

      START_REPLICATION_TASK_ASSESSMENT_RUN = OperationModel.new(
        name: "StartReplicationTaskAssessmentRun",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_DATA_MIGRATION = OperationModel.new(
        name: "StopDataMigration",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_REPLICATION = OperationModel.new(
        name: "StopReplication",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_REPLICATION_TASK = OperationModel.new(
        name: "StopReplicationTask",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_CONNECTION = OperationModel.new(
        name: "TestConnection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SUBSCRIPTIONS_TO_EVENT_BRIDGE = OperationModel.new(
        name: "UpdateSubscriptionsToEventBridge",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
