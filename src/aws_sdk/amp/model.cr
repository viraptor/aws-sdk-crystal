module AwsSdk
  module Amp
    module Model
      API_VERSION = "2020-08-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "aps"
      ENDPOINT_PREFIX = "aps"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://aps-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://aps-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://aps.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://aps.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ALERT_MANAGER_DEFINITION = OperationModel.new(
        name: "CreateAlertManagerDefinition",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/alertmanager/definition"
      )

      CREATE_ANOMALY_DETECTOR = OperationModel.new(
        name: "CreateAnomalyDetector",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/anomalydetectors"
      )

      CREATE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "CreateLoggingConfiguration",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/logging"
      )

      CREATE_QUERY_LOGGING_CONFIGURATION = OperationModel.new(
        name: "CreateQueryLoggingConfiguration",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/logging/query"
      )

      CREATE_RULE_GROUPS_NAMESPACE = OperationModel.new(
        name: "CreateRuleGroupsNamespace",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/rulegroupsnamespaces"
      )

      CREATE_SCRAPER = OperationModel.new(
        name: "CreateScraper",
        http_method: "POST",
        request_uri: "/scrapers"
      )

      CREATE_WORKSPACE = OperationModel.new(
        name: "CreateWorkspace",
        http_method: "POST",
        request_uri: "/workspaces"
      )

      DELETE_ALERT_MANAGER_DEFINITION = OperationModel.new(
        name: "DeleteAlertManagerDefinition",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/alertmanager/definition"
      )

      DELETE_ANOMALY_DETECTOR = OperationModel.new(
        name: "DeleteAnomalyDetector",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/anomalydetectors/{anomalyDetectorId}"
      )

      DELETE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DeleteLoggingConfiguration",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/logging"
      )

      DELETE_QUERY_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DeleteQueryLoggingConfiguration",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/logging/query"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/policy"
      )

      DELETE_RULE_GROUPS_NAMESPACE = OperationModel.new(
        name: "DeleteRuleGroupsNamespace",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/rulegroupsnamespaces/{name}"
      )

      DELETE_SCRAPER = OperationModel.new(
        name: "DeleteScraper",
        http_method: "DELETE",
        request_uri: "/scrapers/{scraperId}"
      )

      DELETE_SCRAPER_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DeleteScraperLoggingConfiguration",
        http_method: "DELETE",
        request_uri: "/scrapers/{scraperId}/logging-configuration"
      )

      DELETE_WORKSPACE = OperationModel.new(
        name: "DeleteWorkspace",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}"
      )

      DESCRIBE_ALERT_MANAGER_DEFINITION = OperationModel.new(
        name: "DescribeAlertManagerDefinition",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/alertmanager/definition"
      )

      DESCRIBE_ANOMALY_DETECTOR = OperationModel.new(
        name: "DescribeAnomalyDetector",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/anomalydetectors/{anomalyDetectorId}"
      )

      DESCRIBE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DescribeLoggingConfiguration",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/logging"
      )

      DESCRIBE_QUERY_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DescribeQueryLoggingConfiguration",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/logging/query"
      )

      DESCRIBE_RESOURCE_POLICY = OperationModel.new(
        name: "DescribeResourcePolicy",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/policy"
      )

      DESCRIBE_RULE_GROUPS_NAMESPACE = OperationModel.new(
        name: "DescribeRuleGroupsNamespace",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/rulegroupsnamespaces/{name}"
      )

      DESCRIBE_SCRAPER = OperationModel.new(
        name: "DescribeScraper",
        http_method: "GET",
        request_uri: "/scrapers/{scraperId}"
      )

      DESCRIBE_SCRAPER_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DescribeScraperLoggingConfiguration",
        http_method: "GET",
        request_uri: "/scrapers/{scraperId}/logging-configuration"
      )

      DESCRIBE_WORKSPACE = OperationModel.new(
        name: "DescribeWorkspace",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}"
      )

      DESCRIBE_WORKSPACE_CONFIGURATION = OperationModel.new(
        name: "DescribeWorkspaceConfiguration",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/configuration"
      )

      GET_DEFAULT_SCRAPER_CONFIGURATION = OperationModel.new(
        name: "GetDefaultScraperConfiguration",
        http_method: "GET",
        request_uri: "/scraperconfiguration"
      )

      LIST_ANOMALY_DETECTORS = OperationModel.new(
        name: "ListAnomalyDetectors",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/anomalydetectors"
      )

      LIST_RULE_GROUPS_NAMESPACES = OperationModel.new(
        name: "ListRuleGroupsNamespaces",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/rulegroupsnamespaces"
      )

      LIST_SCRAPERS = OperationModel.new(
        name: "ListScrapers",
        http_method: "GET",
        request_uri: "/scrapers"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_WORKSPACES = OperationModel.new(
        name: "ListWorkspaces",
        http_method: "GET",
        request_uri: "/workspaces"
      )

      PUT_ALERT_MANAGER_DEFINITION = OperationModel.new(
        name: "PutAlertManagerDefinition",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/alertmanager/definition"
      )

      PUT_ANOMALY_DETECTOR = OperationModel.new(
        name: "PutAnomalyDetector",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/anomalydetectors/{anomalyDetectorId}"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/policy"
      )

      PUT_RULE_GROUPS_NAMESPACE = OperationModel.new(
        name: "PutRuleGroupsNamespace",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/rulegroupsnamespaces/{name}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "UpdateLoggingConfiguration",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/logging"
      )

      UPDATE_QUERY_LOGGING_CONFIGURATION = OperationModel.new(
        name: "UpdateQueryLoggingConfiguration",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/logging/query"
      )

      UPDATE_SCRAPER = OperationModel.new(
        name: "UpdateScraper",
        http_method: "PUT",
        request_uri: "/scrapers/{scraperId}"
      )

      UPDATE_SCRAPER_LOGGING_CONFIGURATION = OperationModel.new(
        name: "UpdateScraperLoggingConfiguration",
        http_method: "PUT",
        request_uri: "/scrapers/{scraperId}/logging-configuration"
      )

      UPDATE_WORKSPACE_ALIAS = OperationModel.new(
        name: "UpdateWorkspaceAlias",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/alias"
      )

      UPDATE_WORKSPACE_CONFIGURATION = OperationModel.new(
        name: "UpdateWorkspaceConfiguration",
        http_method: "PATCH",
        request_uri: "/workspaces/{workspaceId}/configuration"
      )
    end
  end
end
