module AwsSdk
  module ObservabilityAdmin
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "observabilityadmin"
      ENDPOINT_PREFIX = "observabilityadmin"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://observabilityadmin-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://observabilityadmin-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://observabilityadmin.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://observabilityadmin.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CENTRALIZATION_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "CreateCentralizationRuleForOrganization",
        http_method: "POST",
        request_uri: "/CreateCentralizationRuleForOrganization"
      )

      CREATE_S3_TABLE_INTEGRATION = OperationModel.new(
        name: "CreateS3TableIntegration",
        http_method: "POST",
        request_uri: "/CreateS3TableIntegration"
      )

      CREATE_TELEMETRY_PIPELINE = OperationModel.new(
        name: "CreateTelemetryPipeline",
        http_method: "POST",
        request_uri: "/CreateTelemetryPipeline"
      )

      CREATE_TELEMETRY_RULE = OperationModel.new(
        name: "CreateTelemetryRule",
        http_method: "POST",
        request_uri: "/CreateTelemetryRule"
      )

      CREATE_TELEMETRY_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "CreateTelemetryRuleForOrganization",
        http_method: "POST",
        request_uri: "/CreateTelemetryRuleForOrganization"
      )

      DELETE_CENTRALIZATION_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "DeleteCentralizationRuleForOrganization",
        http_method: "POST",
        request_uri: "/DeleteCentralizationRuleForOrganization"
      )

      DELETE_S3_TABLE_INTEGRATION = OperationModel.new(
        name: "DeleteS3TableIntegration",
        http_method: "POST",
        request_uri: "/DeleteS3TableIntegration"
      )

      DELETE_TELEMETRY_PIPELINE = OperationModel.new(
        name: "DeleteTelemetryPipeline",
        http_method: "POST",
        request_uri: "/DeleteTelemetryPipeline"
      )

      DELETE_TELEMETRY_RULE = OperationModel.new(
        name: "DeleteTelemetryRule",
        http_method: "POST",
        request_uri: "/DeleteTelemetryRule"
      )

      DELETE_TELEMETRY_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "DeleteTelemetryRuleForOrganization",
        http_method: "POST",
        request_uri: "/DeleteTelemetryRuleForOrganization"
      )

      GET_CENTRALIZATION_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "GetCentralizationRuleForOrganization",
        http_method: "POST",
        request_uri: "/GetCentralizationRuleForOrganization"
      )

      GET_S3_TABLE_INTEGRATION = OperationModel.new(
        name: "GetS3TableIntegration",
        http_method: "POST",
        request_uri: "/GetS3TableIntegration"
      )

      GET_TELEMETRY_ENRICHMENT_STATUS = OperationModel.new(
        name: "GetTelemetryEnrichmentStatus",
        http_method: "POST",
        request_uri: "/GetTelemetryEnrichmentStatus"
      )

      GET_TELEMETRY_EVALUATION_STATUS = OperationModel.new(
        name: "GetTelemetryEvaluationStatus",
        http_method: "POST",
        request_uri: "/GetTelemetryEvaluationStatus"
      )

      GET_TELEMETRY_EVALUATION_STATUS_FOR_ORGANIZATION = OperationModel.new(
        name: "GetTelemetryEvaluationStatusForOrganization",
        http_method: "POST",
        request_uri: "/GetTelemetryEvaluationStatusForOrganization"
      )

      GET_TELEMETRY_PIPELINE = OperationModel.new(
        name: "GetTelemetryPipeline",
        http_method: "POST",
        request_uri: "/GetTelemetryPipeline"
      )

      GET_TELEMETRY_RULE = OperationModel.new(
        name: "GetTelemetryRule",
        http_method: "POST",
        request_uri: "/GetTelemetryRule"
      )

      GET_TELEMETRY_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "GetTelemetryRuleForOrganization",
        http_method: "POST",
        request_uri: "/GetTelemetryRuleForOrganization"
      )

      LIST_CENTRALIZATION_RULES_FOR_ORGANIZATION = OperationModel.new(
        name: "ListCentralizationRulesForOrganization",
        http_method: "POST",
        request_uri: "/ListCentralizationRulesForOrganization"
      )

      LIST_RESOURCE_TELEMETRY = OperationModel.new(
        name: "ListResourceTelemetry",
        http_method: "POST",
        request_uri: "/ListResourceTelemetry"
      )

      LIST_RESOURCE_TELEMETRY_FOR_ORGANIZATION = OperationModel.new(
        name: "ListResourceTelemetryForOrganization",
        http_method: "POST",
        request_uri: "/ListResourceTelemetryForOrganization"
      )

      LIST_S3_TABLE_INTEGRATIONS = OperationModel.new(
        name: "ListS3TableIntegrations",
        http_method: "POST",
        request_uri: "/ListS3TableIntegrations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/ListTagsForResource"
      )

      LIST_TELEMETRY_PIPELINES = OperationModel.new(
        name: "ListTelemetryPipelines",
        http_method: "POST",
        request_uri: "/ListTelemetryPipelines"
      )

      LIST_TELEMETRY_RULES = OperationModel.new(
        name: "ListTelemetryRules",
        http_method: "POST",
        request_uri: "/ListTelemetryRules"
      )

      LIST_TELEMETRY_RULES_FOR_ORGANIZATION = OperationModel.new(
        name: "ListTelemetryRulesForOrganization",
        http_method: "POST",
        request_uri: "/ListTelemetryRulesForOrganization"
      )

      START_TELEMETRY_ENRICHMENT = OperationModel.new(
        name: "StartTelemetryEnrichment",
        http_method: "POST",
        request_uri: "/StartTelemetryEnrichment"
      )

      START_TELEMETRY_EVALUATION = OperationModel.new(
        name: "StartTelemetryEvaluation",
        http_method: "POST",
        request_uri: "/StartTelemetryEvaluation"
      )

      START_TELEMETRY_EVALUATION_FOR_ORGANIZATION = OperationModel.new(
        name: "StartTelemetryEvaluationForOrganization",
        http_method: "POST",
        request_uri: "/StartTelemetryEvaluationForOrganization"
      )

      STOP_TELEMETRY_ENRICHMENT = OperationModel.new(
        name: "StopTelemetryEnrichment",
        http_method: "POST",
        request_uri: "/StopTelemetryEnrichment"
      )

      STOP_TELEMETRY_EVALUATION = OperationModel.new(
        name: "StopTelemetryEvaluation",
        http_method: "POST",
        request_uri: "/StopTelemetryEvaluation"
      )

      STOP_TELEMETRY_EVALUATION_FOR_ORGANIZATION = OperationModel.new(
        name: "StopTelemetryEvaluationForOrganization",
        http_method: "POST",
        request_uri: "/StopTelemetryEvaluationForOrganization"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/TagResource"
      )

      TEST_TELEMETRY_PIPELINE = OperationModel.new(
        name: "TestTelemetryPipeline",
        http_method: "POST",
        request_uri: "/TestTelemetryPipeline"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/UntagResource"
      )

      UPDATE_CENTRALIZATION_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "UpdateCentralizationRuleForOrganization",
        http_method: "POST",
        request_uri: "/UpdateCentralizationRuleForOrganization"
      )

      UPDATE_TELEMETRY_PIPELINE = OperationModel.new(
        name: "UpdateTelemetryPipeline",
        http_method: "POST",
        request_uri: "/UpdateTelemetryPipeline"
      )

      UPDATE_TELEMETRY_RULE = OperationModel.new(
        name: "UpdateTelemetryRule",
        http_method: "POST",
        request_uri: "/UpdateTelemetryRule"
      )

      UPDATE_TELEMETRY_RULE_FOR_ORGANIZATION = OperationModel.new(
        name: "UpdateTelemetryRuleForOrganization",
        http_method: "POST",
        request_uri: "/UpdateTelemetryRuleForOrganization"
      )

      VALIDATE_TELEMETRY_PIPELINE_CONFIGURATION = OperationModel.new(
        name: "ValidateTelemetryPipelineConfiguration",
        http_method: "POST",
        request_uri: "/ValidateTelemetryPipelineConfiguration"
      )
    end
  end
end
