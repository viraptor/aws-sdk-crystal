module Aws
  module ConfigService
    module Model
      API_VERSION = "2014-11-12"
      TARGET_PREFIX = "StarlingDoveService"
      SIGNING_NAME = "config"
      ENDPOINT_PREFIX = "config"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://config-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://config.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://config-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://config.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://config.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_RESOURCE_TYPES = OperationModel.new(
        name: "AssociateResourceTypes",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_AGGREGATE_RESOURCE_CONFIG = OperationModel.new(
        name: "BatchGetAggregateResourceConfig",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_RESOURCE_CONFIG = OperationModel.new(
        name: "BatchGetResourceConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AGGREGATION_AUTHORIZATION = OperationModel.new(
        name: "DeleteAggregationAuthorization",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIG_RULE = OperationModel.new(
        name: "DeleteConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIGURATION_AGGREGATOR = OperationModel.new(
        name: "DeleteConfigurationAggregator",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIGURATION_RECORDER = OperationModel.new(
        name: "DeleteConfigurationRecorder",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFORMANCE_PACK = OperationModel.new(
        name: "DeleteConformancePack",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DELIVERY_CHANNEL = OperationModel.new(
        name: "DeleteDeliveryChannel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVALUATION_RESULTS = OperationModel.new(
        name: "DeleteEvaluationResults",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ORGANIZATION_CONFIG_RULE = OperationModel.new(
        name: "DeleteOrganizationConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ORGANIZATION_CONFORMANCE_PACK = OperationModel.new(
        name: "DeleteOrganizationConformancePack",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PENDING_AGGREGATION_REQUEST = OperationModel.new(
        name: "DeletePendingAggregationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REMEDIATION_CONFIGURATION = OperationModel.new(
        name: "DeleteRemediationConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REMEDIATION_EXCEPTIONS = OperationModel.new(
        name: "DeleteRemediationExceptions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_CONFIG = OperationModel.new(
        name: "DeleteResourceConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RETENTION_CONFIGURATION = OperationModel.new(
        name: "DeleteRetentionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_LINKED_CONFIGURATION_RECORDER = OperationModel.new(
        name: "DeleteServiceLinkedConfigurationRecorder",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STORED_QUERY = OperationModel.new(
        name: "DeleteStoredQuery",
        http_method: "POST",
        request_uri: "/"
      )

      DELIVER_CONFIG_SNAPSHOT = OperationModel.new(
        name: "DeliverConfigSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AGGREGATE_COMPLIANCE_BY_CONFIG_RULES = OperationModel.new(
        name: "DescribeAggregateComplianceByConfigRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AGGREGATE_COMPLIANCE_BY_CONFORMANCE_PACKS = OperationModel.new(
        name: "DescribeAggregateComplianceByConformancePacks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AGGREGATION_AUTHORIZATIONS = OperationModel.new(
        name: "DescribeAggregationAuthorizations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPLIANCE_BY_CONFIG_RULE = OperationModel.new(
        name: "DescribeComplianceByConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPLIANCE_BY_RESOURCE = OperationModel.new(
        name: "DescribeComplianceByResource",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIG_RULE_EVALUATION_STATUS = OperationModel.new(
        name: "DescribeConfigRuleEvaluationStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIG_RULES = OperationModel.new(
        name: "DescribeConfigRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_AGGREGATOR_SOURCES_STATUS = OperationModel.new(
        name: "DescribeConfigurationAggregatorSourcesStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_AGGREGATORS = OperationModel.new(
        name: "DescribeConfigurationAggregators",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_RECORDER_STATUS = OperationModel.new(
        name: "DescribeConfigurationRecorderStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_RECORDERS = OperationModel.new(
        name: "DescribeConfigurationRecorders",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFORMANCE_PACK_COMPLIANCE = OperationModel.new(
        name: "DescribeConformancePackCompliance",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFORMANCE_PACK_STATUS = OperationModel.new(
        name: "DescribeConformancePackStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFORMANCE_PACKS = OperationModel.new(
        name: "DescribeConformancePacks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DELIVERY_CHANNEL_STATUS = OperationModel.new(
        name: "DescribeDeliveryChannelStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DELIVERY_CHANNELS = OperationModel.new(
        name: "DescribeDeliveryChannels",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATION_CONFIG_RULE_STATUSES = OperationModel.new(
        name: "DescribeOrganizationConfigRuleStatuses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATION_CONFIG_RULES = OperationModel.new(
        name: "DescribeOrganizationConfigRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATION_CONFORMANCE_PACK_STATUSES = OperationModel.new(
        name: "DescribeOrganizationConformancePackStatuses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATION_CONFORMANCE_PACKS = OperationModel.new(
        name: "DescribeOrganizationConformancePacks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PENDING_AGGREGATION_REQUESTS = OperationModel.new(
        name: "DescribePendingAggregationRequests",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REMEDIATION_CONFIGURATIONS = OperationModel.new(
        name: "DescribeRemediationConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REMEDIATION_EXCEPTIONS = OperationModel.new(
        name: "DescribeRemediationExceptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REMEDIATION_EXECUTION_STATUS = OperationModel.new(
        name: "DescribeRemediationExecutionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RETENTION_CONFIGURATIONS = OperationModel.new(
        name: "DescribeRetentionConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_RESOURCE_TYPES = OperationModel.new(
        name: "DisassociateResourceTypes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AGGREGATE_COMPLIANCE_DETAILS_BY_CONFIG_RULE = OperationModel.new(
        name: "GetAggregateComplianceDetailsByConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AGGREGATE_CONFIG_RULE_COMPLIANCE_SUMMARY = OperationModel.new(
        name: "GetAggregateConfigRuleComplianceSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AGGREGATE_CONFORMANCE_PACK_COMPLIANCE_SUMMARY = OperationModel.new(
        name: "GetAggregateConformancePackComplianceSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AGGREGATE_DISCOVERED_RESOURCE_COUNTS = OperationModel.new(
        name: "GetAggregateDiscoveredResourceCounts",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AGGREGATE_RESOURCE_CONFIG = OperationModel.new(
        name: "GetAggregateResourceConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPLIANCE_DETAILS_BY_CONFIG_RULE = OperationModel.new(
        name: "GetComplianceDetailsByConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPLIANCE_DETAILS_BY_RESOURCE = OperationModel.new(
        name: "GetComplianceDetailsByResource",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPLIANCE_SUMMARY_BY_CONFIG_RULE = OperationModel.new(
        name: "GetComplianceSummaryByConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPLIANCE_SUMMARY_BY_RESOURCE_TYPE = OperationModel.new(
        name: "GetComplianceSummaryByResourceType",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONFORMANCE_PACK_COMPLIANCE_DETAILS = OperationModel.new(
        name: "GetConformancePackComplianceDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONFORMANCE_PACK_COMPLIANCE_SUMMARY = OperationModel.new(
        name: "GetConformancePackComplianceSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CUSTOM_RULE_POLICY = OperationModel.new(
        name: "GetCustomRulePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISCOVERED_RESOURCE_COUNTS = OperationModel.new(
        name: "GetDiscoveredResourceCounts",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ORGANIZATION_CONFIG_RULE_DETAILED_STATUS = OperationModel.new(
        name: "GetOrganizationConfigRuleDetailedStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ORGANIZATION_CONFORMANCE_PACK_DETAILED_STATUS = OperationModel.new(
        name: "GetOrganizationConformancePackDetailedStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ORGANIZATION_CUSTOM_RULE_POLICY = OperationModel.new(
        name: "GetOrganizationCustomRulePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_CONFIG_HISTORY = OperationModel.new(
        name: "GetResourceConfigHistory",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_EVALUATION_SUMMARY = OperationModel.new(
        name: "GetResourceEvaluationSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STORED_QUERY = OperationModel.new(
        name: "GetStoredQuery",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AGGREGATE_DISCOVERED_RESOURCES = OperationModel.new(
        name: "ListAggregateDiscoveredResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONFIGURATION_RECORDERS = OperationModel.new(
        name: "ListConfigurationRecorders",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONFORMANCE_PACK_COMPLIANCE_SCORES = OperationModel.new(
        name: "ListConformancePackComplianceScores",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DISCOVERED_RESOURCES = OperationModel.new(
        name: "ListDiscoveredResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_EVALUATIONS = OperationModel.new(
        name: "ListResourceEvaluations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STORED_QUERIES = OperationModel.new(
        name: "ListStoredQueries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_AGGREGATION_AUTHORIZATION = OperationModel.new(
        name: "PutAggregationAuthorization",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CONFIG_RULE = OperationModel.new(
        name: "PutConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CONFIGURATION_AGGREGATOR = OperationModel.new(
        name: "PutConfigurationAggregator",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CONFIGURATION_RECORDER = OperationModel.new(
        name: "PutConfigurationRecorder",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CONFORMANCE_PACK = OperationModel.new(
        name: "PutConformancePack",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DELIVERY_CHANNEL = OperationModel.new(
        name: "PutDeliveryChannel",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EVALUATIONS = OperationModel.new(
        name: "PutEvaluations",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EXTERNAL_EVALUATION = OperationModel.new(
        name: "PutExternalEvaluation",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ORGANIZATION_CONFIG_RULE = OperationModel.new(
        name: "PutOrganizationConfigRule",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ORGANIZATION_CONFORMANCE_PACK = OperationModel.new(
        name: "PutOrganizationConformancePack",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REMEDIATION_CONFIGURATIONS = OperationModel.new(
        name: "PutRemediationConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REMEDIATION_EXCEPTIONS = OperationModel.new(
        name: "PutRemediationExceptions",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_CONFIG = OperationModel.new(
        name: "PutResourceConfig",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RETENTION_CONFIGURATION = OperationModel.new(
        name: "PutRetentionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SERVICE_LINKED_CONFIGURATION_RECORDER = OperationModel.new(
        name: "PutServiceLinkedConfigurationRecorder",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_STORED_QUERY = OperationModel.new(
        name: "PutStoredQuery",
        http_method: "POST",
        request_uri: "/"
      )

      SELECT_AGGREGATE_RESOURCE_CONFIG = OperationModel.new(
        name: "SelectAggregateResourceConfig",
        http_method: "POST",
        request_uri: "/"
      )

      SELECT_RESOURCE_CONFIG = OperationModel.new(
        name: "SelectResourceConfig",
        http_method: "POST",
        request_uri: "/"
      )

      START_CONFIG_RULES_EVALUATION = OperationModel.new(
        name: "StartConfigRulesEvaluation",
        http_method: "POST",
        request_uri: "/"
      )

      START_CONFIGURATION_RECORDER = OperationModel.new(
        name: "StartConfigurationRecorder",
        http_method: "POST",
        request_uri: "/"
      )

      START_REMEDIATION_EXECUTION = OperationModel.new(
        name: "StartRemediationExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_RESOURCE_EVALUATION = OperationModel.new(
        name: "StartResourceEvaluation",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_CONFIGURATION_RECORDER = OperationModel.new(
        name: "StopConfigurationRecorder",
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
    end
  end
end
