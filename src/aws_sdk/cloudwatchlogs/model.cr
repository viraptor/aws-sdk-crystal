module AwsSdk
  module CloudWatchLogs
    module Model
      API_VERSION = "2014-03-28"
      TARGET_PREFIX = "Logs_20140328"
      SIGNING_NAME = "logs"
      ENDPOINT_PREFIX = "logs"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://logs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://logs.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://logs.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://logs-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://logs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://logs.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_KMS_KEY = OperationModel.new(
        name: "AssociateKmsKey",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SOURCE_TO_S3_TABLE_INTEGRATION = OperationModel.new(
        name: "AssociateSourceToS3TableIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_EXPORT_TASK = OperationModel.new(
        name: "CancelExportTask",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_IMPORT_TASK = OperationModel.new(
        name: "CancelImportTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DELIVERY = OperationModel.new(
        name: "CreateDelivery",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXPORT_TASK = OperationModel.new(
        name: "CreateExportTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMPORT_TASK = OperationModel.new(
        name: "CreateImportTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOG_ANOMALY_DETECTOR = OperationModel.new(
        name: "CreateLogAnomalyDetector",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOG_GROUP = OperationModel.new(
        name: "CreateLogGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOG_STREAM = OperationModel.new(
        name: "CreateLogStream",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCHEDULED_QUERY = OperationModel.new(
        name: "CreateScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCOUNT_POLICY = OperationModel.new(
        name: "DeleteAccountPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_PROTECTION_POLICY = OperationModel.new(
        name: "DeleteDataProtectionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DELIVERY = OperationModel.new(
        name: "DeleteDelivery",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DELIVERY_DESTINATION = OperationModel.new(
        name: "DeleteDeliveryDestination",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DELIVERY_DESTINATION_POLICY = OperationModel.new(
        name: "DeleteDeliveryDestinationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DELIVERY_SOURCE = OperationModel.new(
        name: "DeleteDeliverySource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DESTINATION = OperationModel.new(
        name: "DeleteDestination",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INDEX_POLICY = OperationModel.new(
        name: "DeleteIndexPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INTEGRATION = OperationModel.new(
        name: "DeleteIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOG_ANOMALY_DETECTOR = OperationModel.new(
        name: "DeleteLogAnomalyDetector",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOG_GROUP = OperationModel.new(
        name: "DeleteLogGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOG_STREAM = OperationModel.new(
        name: "DeleteLogStream",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_METRIC_FILTER = OperationModel.new(
        name: "DeleteMetricFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_QUERY_DEFINITION = OperationModel.new(
        name: "DeleteQueryDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RETENTION_POLICY = OperationModel.new(
        name: "DeleteRetentionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCHEDULED_QUERY = OperationModel.new(
        name: "DeleteScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SUBSCRIPTION_FILTER = OperationModel.new(
        name: "DeleteSubscriptionFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSFORMER = OperationModel.new(
        name: "DeleteTransformer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_POLICIES = OperationModel.new(
        name: "DescribeAccountPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_TEMPLATES = OperationModel.new(
        name: "DescribeConfigurationTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DELIVERIES = OperationModel.new(
        name: "DescribeDeliveries",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DELIVERY_DESTINATIONS = OperationModel.new(
        name: "DescribeDeliveryDestinations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DELIVERY_SOURCES = OperationModel.new(
        name: "DescribeDeliverySources",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DESTINATIONS = OperationModel.new(
        name: "DescribeDestinations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPORT_TASKS = OperationModel.new(
        name: "DescribeExportTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FIELD_INDEXES = OperationModel.new(
        name: "DescribeFieldIndexes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMPORT_TASK_BATCHES = OperationModel.new(
        name: "DescribeImportTaskBatches",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMPORT_TASKS = OperationModel.new(
        name: "DescribeImportTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INDEX_POLICIES = OperationModel.new(
        name: "DescribeIndexPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOG_GROUPS = OperationModel.new(
        name: "DescribeLogGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOG_STREAMS = OperationModel.new(
        name: "DescribeLogStreams",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METRIC_FILTERS = OperationModel.new(
        name: "DescribeMetricFilters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_QUERIES = OperationModel.new(
        name: "DescribeQueries",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_QUERY_DEFINITIONS = OperationModel.new(
        name: "DescribeQueryDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_POLICIES = OperationModel.new(
        name: "DescribeResourcePolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUBSCRIPTION_FILTERS = OperationModel.new(
        name: "DescribeSubscriptionFilters",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_KMS_KEY = OperationModel.new(
        name: "DisassociateKmsKey",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SOURCE_FROM_S3_TABLE_INTEGRATION = OperationModel.new(
        name: "DisassociateSourceFromS3TableIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      FILTER_LOG_EVENTS = OperationModel.new(
        name: "FilterLogEvents",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_PROTECTION_POLICY = OperationModel.new(
        name: "GetDataProtectionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DELIVERY = OperationModel.new(
        name: "GetDelivery",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DELIVERY_DESTINATION = OperationModel.new(
        name: "GetDeliveryDestination",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DELIVERY_DESTINATION_POLICY = OperationModel.new(
        name: "GetDeliveryDestinationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DELIVERY_SOURCE = OperationModel.new(
        name: "GetDeliverySource",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INTEGRATION = OperationModel.new(
        name: "GetIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOG_ANOMALY_DETECTOR = OperationModel.new(
        name: "GetLogAnomalyDetector",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOG_EVENTS = OperationModel.new(
        name: "GetLogEvents",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOG_FIELDS = OperationModel.new(
        name: "GetLogFields",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOG_GROUP_FIELDS = OperationModel.new(
        name: "GetLogGroupFields",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOG_OBJECT = OperationModel.new(
        name: "GetLogObject",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOG_RECORD = OperationModel.new(
        name: "GetLogRecord",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUERY_RESULTS = OperationModel.new(
        name: "GetQueryResults",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEDULED_QUERY = OperationModel.new(
        name: "GetScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEDULED_QUERY_HISTORY = OperationModel.new(
        name: "GetScheduledQueryHistory",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSFORMER = OperationModel.new(
        name: "GetTransformer",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AGGREGATE_LOG_GROUP_SUMMARIES = OperationModel.new(
        name: "ListAggregateLogGroupSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ANOMALIES = OperationModel.new(
        name: "ListAnomalies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INTEGRATIONS = OperationModel.new(
        name: "ListIntegrations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOG_ANOMALY_DETECTORS = OperationModel.new(
        name: "ListLogAnomalyDetectors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOG_GROUPS = OperationModel.new(
        name: "ListLogGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOG_GROUPS_FOR_QUERY = OperationModel.new(
        name: "ListLogGroupsForQuery",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEDULED_QUERIES = OperationModel.new(
        name: "ListScheduledQueries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SOURCES_FOR_S3_TABLE_INTEGRATION = OperationModel.new(
        name: "ListSourcesForS3TableIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_LOG_GROUP = OperationModel.new(
        name: "ListTagsLogGroup",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ACCOUNT_POLICY = OperationModel.new(
        name: "PutAccountPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DATA_PROTECTION_POLICY = OperationModel.new(
        name: "PutDataProtectionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DELIVERY_DESTINATION = OperationModel.new(
        name: "PutDeliveryDestination",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DELIVERY_DESTINATION_POLICY = OperationModel.new(
        name: "PutDeliveryDestinationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DELIVERY_SOURCE = OperationModel.new(
        name: "PutDeliverySource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DESTINATION = OperationModel.new(
        name: "PutDestination",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DESTINATION_POLICY = OperationModel.new(
        name: "PutDestinationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_INDEX_POLICY = OperationModel.new(
        name: "PutIndexPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_INTEGRATION = OperationModel.new(
        name: "PutIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LOG_EVENTS = OperationModel.new(
        name: "PutLogEvents",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LOG_GROUP_DELETION_PROTECTION = OperationModel.new(
        name: "PutLogGroupDeletionProtection",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_METRIC_FILTER = OperationModel.new(
        name: "PutMetricFilter",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_QUERY_DEFINITION = OperationModel.new(
        name: "PutQueryDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RETENTION_POLICY = OperationModel.new(
        name: "PutRetentionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SUBSCRIPTION_FILTER = OperationModel.new(
        name: "PutSubscriptionFilter",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_TRANSFORMER = OperationModel.new(
        name: "PutTransformer",
        http_method: "POST",
        request_uri: "/"
      )

      START_LIVE_TAIL = OperationModel.new(
        name: "StartLiveTail",
        http_method: "POST",
        request_uri: "/"
      )

      START_QUERY = OperationModel.new(
        name: "StartQuery",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_QUERY = OperationModel.new(
        name: "StopQuery",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_LOG_GROUP = OperationModel.new(
        name: "TagLogGroup",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_METRIC_FILTER = OperationModel.new(
        name: "TestMetricFilter",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_TRANSFORMER = OperationModel.new(
        name: "TestTransformer",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_LOG_GROUP = OperationModel.new(
        name: "UntagLogGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ANOMALY = OperationModel.new(
        name: "UpdateAnomaly",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DELIVERY_CONFIGURATION = OperationModel.new(
        name: "UpdateDeliveryConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOG_ANOMALY_DETECTOR = OperationModel.new(
        name: "UpdateLogAnomalyDetector",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SCHEDULED_QUERY = OperationModel.new(
        name: "UpdateScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
