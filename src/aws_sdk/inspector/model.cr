module AwsSdk
  module Inspector
    module Model
      API_VERSION = "2016-02-16"
      TARGET_PREFIX = "InspectorService"
      SIGNING_NAME = "inspector"
      ENDPOINT_PREFIX = "inspector"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://inspector-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://inspector-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://inspector.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://inspector.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_ATTRIBUTES_TO_FINDINGS = OperationModel.new(
        name: "AddAttributesToFindings",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ASSESSMENT_TARGET = OperationModel.new(
        name: "CreateAssessmentTarget",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ASSESSMENT_TEMPLATE = OperationModel.new(
        name: "CreateAssessmentTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXCLUSIONS_PREVIEW = OperationModel.new(
        name: "CreateExclusionsPreview",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOURCE_GROUP = OperationModel.new(
        name: "CreateResourceGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ASSESSMENT_RUN = OperationModel.new(
        name: "DeleteAssessmentRun",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ASSESSMENT_TARGET = OperationModel.new(
        name: "DeleteAssessmentTarget",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ASSESSMENT_TEMPLATE = OperationModel.new(
        name: "DeleteAssessmentTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ASSESSMENT_RUNS = OperationModel.new(
        name: "DescribeAssessmentRuns",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ASSESSMENT_TARGETS = OperationModel.new(
        name: "DescribeAssessmentTargets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ASSESSMENT_TEMPLATES = OperationModel.new(
        name: "DescribeAssessmentTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CROSS_ACCOUNT_ACCESS_ROLE = OperationModel.new(
        name: "DescribeCrossAccountAccessRole",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXCLUSIONS = OperationModel.new(
        name: "DescribeExclusions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FINDINGS = OperationModel.new(
        name: "DescribeFindings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_GROUPS = OperationModel.new(
        name: "DescribeResourceGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RULES_PACKAGES = OperationModel.new(
        name: "DescribeRulesPackages",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ASSESSMENT_REPORT = OperationModel.new(
        name: "GetAssessmentReport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EXCLUSIONS_PREVIEW = OperationModel.new(
        name: "GetExclusionsPreview",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TELEMETRY_METADATA = OperationModel.new(
        name: "GetTelemetryMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSESSMENT_RUN_AGENTS = OperationModel.new(
        name: "ListAssessmentRunAgents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSESSMENT_RUNS = OperationModel.new(
        name: "ListAssessmentRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSESSMENT_TARGETS = OperationModel.new(
        name: "ListAssessmentTargets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSESSMENT_TEMPLATES = OperationModel.new(
        name: "ListAssessmentTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EVENT_SUBSCRIPTIONS = OperationModel.new(
        name: "ListEventSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXCLUSIONS = OperationModel.new(
        name: "ListExclusions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FINDINGS = OperationModel.new(
        name: "ListFindings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULES_PACKAGES = OperationModel.new(
        name: "ListRulesPackages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PREVIEW_AGENTS = OperationModel.new(
        name: "PreviewAgents",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_CROSS_ACCOUNT_ACCESS_ROLE = OperationModel.new(
        name: "RegisterCrossAccountAccessRole",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_ATTRIBUTES_FROM_FINDINGS = OperationModel.new(
        name: "RemoveAttributesFromFindings",
        http_method: "POST",
        request_uri: "/"
      )

      SET_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "SetTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      START_ASSESSMENT_RUN = OperationModel.new(
        name: "StartAssessmentRun",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ASSESSMENT_RUN = OperationModel.new(
        name: "StopAssessmentRun",
        http_method: "POST",
        request_uri: "/"
      )

      SUBSCRIBE_TO_EVENT = OperationModel.new(
        name: "SubscribeToEvent",
        http_method: "POST",
        request_uri: "/"
      )

      UNSUBSCRIBE_FROM_EVENT = OperationModel.new(
        name: "UnsubscribeFromEvent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ASSESSMENT_TARGET = OperationModel.new(
        name: "UpdateAssessmentTarget",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
