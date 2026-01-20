module Aws
  module CloudFormation
    module Model
      API_VERSION = "2010-05-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "cloudformation"
      ENDPOINT_PREFIX = "cloudformation"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudformation-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://cloudformation.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://cloudformation-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudformation.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cloudformation.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_ORGANIZATIONS_ACCESS = OperationModel.new(
        name: "ActivateOrganizationsAccess",
        http_method: "POST",
        request_uri: "/"
      )

      ACTIVATE_TYPE = OperationModel.new(
        name: "ActivateType",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DESCRIBE_TYPE_CONFIGURATIONS = OperationModel.new(
        name: "BatchDescribeTypeConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_UPDATE_STACK = OperationModel.new(
        name: "CancelUpdateStack",
        http_method: "POST",
        request_uri: "/"
      )

      CONTINUE_UPDATE_ROLLBACK = OperationModel.new(
        name: "ContinueUpdateRollback",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CHANGE_SET = OperationModel.new(
        name: "CreateChangeSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GENERATED_TEMPLATE = OperationModel.new(
        name: "CreateGeneratedTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STACK = OperationModel.new(
        name: "CreateStack",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STACK_INSTANCES = OperationModel.new(
        name: "CreateStackInstances",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STACK_REFACTOR = OperationModel.new(
        name: "CreateStackRefactor",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STACK_SET = OperationModel.new(
        name: "CreateStackSet",
        http_method: "POST",
        request_uri: "/"
      )

      DEACTIVATE_ORGANIZATIONS_ACCESS = OperationModel.new(
        name: "DeactivateOrganizationsAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DEACTIVATE_TYPE = OperationModel.new(
        name: "DeactivateType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CHANGE_SET = OperationModel.new(
        name: "DeleteChangeSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GENERATED_TEMPLATE = OperationModel.new(
        name: "DeleteGeneratedTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STACK = OperationModel.new(
        name: "DeleteStack",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STACK_INSTANCES = OperationModel.new(
        name: "DeleteStackInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STACK_SET = OperationModel.new(
        name: "DeleteStackSet",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_TYPE = OperationModel.new(
        name: "DeregisterType",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_LIMITS = OperationModel.new(
        name: "DescribeAccountLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CHANGE_SET = OperationModel.new(
        name: "DescribeChangeSet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CHANGE_SET_HOOKS = OperationModel.new(
        name: "DescribeChangeSetHooks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GENERATED_TEMPLATE = OperationModel.new(
        name: "DescribeGeneratedTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATIONS_ACCESS = OperationModel.new(
        name: "DescribeOrganizationsAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PUBLISHER = OperationModel.new(
        name: "DescribePublisher",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_SCAN = OperationModel.new(
        name: "DescribeResourceScan",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_DRIFT_DETECTION_STATUS = OperationModel.new(
        name: "DescribeStackDriftDetectionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_EVENTS = OperationModel.new(
        name: "DescribeStackEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_INSTANCE = OperationModel.new(
        name: "DescribeStackInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_REFACTOR = OperationModel.new(
        name: "DescribeStackRefactor",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_RESOURCE = OperationModel.new(
        name: "DescribeStackResource",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_RESOURCE_DRIFTS = OperationModel.new(
        name: "DescribeStackResourceDrifts",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_RESOURCES = OperationModel.new(
        name: "DescribeStackResources",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_SET = OperationModel.new(
        name: "DescribeStackSet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACK_SET_OPERATION = OperationModel.new(
        name: "DescribeStackSetOperation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACKS = OperationModel.new(
        name: "DescribeStacks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TYPE = OperationModel.new(
        name: "DescribeType",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TYPE_REGISTRATION = OperationModel.new(
        name: "DescribeTypeRegistration",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_STACK_DRIFT = OperationModel.new(
        name: "DetectStackDrift",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_STACK_RESOURCE_DRIFT = OperationModel.new(
        name: "DetectStackResourceDrift",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_STACK_SET_DRIFT = OperationModel.new(
        name: "DetectStackSetDrift",
        http_method: "POST",
        request_uri: "/"
      )

      ESTIMATE_TEMPLATE_COST = OperationModel.new(
        name: "EstimateTemplateCost",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_CHANGE_SET = OperationModel.new(
        name: "ExecuteChangeSet",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_STACK_REFACTOR = OperationModel.new(
        name: "ExecuteStackRefactor",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GENERATED_TEMPLATE = OperationModel.new(
        name: "GetGeneratedTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_HOOK_RESULT = OperationModel.new(
        name: "GetHookResult",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STACK_POLICY = OperationModel.new(
        name: "GetStackPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEMPLATE = OperationModel.new(
        name: "GetTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEMPLATE_SUMMARY = OperationModel.new(
        name: "GetTemplateSummary",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_STACKS_TO_STACK_SET = OperationModel.new(
        name: "ImportStacksToStackSet",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CHANGE_SETS = OperationModel.new(
        name: "ListChangeSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPORTS = OperationModel.new(
        name: "ListExports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GENERATED_TEMPLATES = OperationModel.new(
        name: "ListGeneratedTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HOOK_RESULTS = OperationModel.new(
        name: "ListHookResults",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMPORTS = OperationModel.new(
        name: "ListImports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SCAN_RELATED_RESOURCES = OperationModel.new(
        name: "ListResourceScanRelatedResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SCAN_RESOURCES = OperationModel.new(
        name: "ListResourceScanResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SCANS = OperationModel.new(
        name: "ListResourceScans",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_INSTANCE_RESOURCE_DRIFTS = OperationModel.new(
        name: "ListStackInstanceResourceDrifts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_INSTANCES = OperationModel.new(
        name: "ListStackInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_REFACTOR_ACTIONS = OperationModel.new(
        name: "ListStackRefactorActions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_REFACTORS = OperationModel.new(
        name: "ListStackRefactors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_RESOURCES = OperationModel.new(
        name: "ListStackResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_SET_AUTO_DEPLOYMENT_TARGETS = OperationModel.new(
        name: "ListStackSetAutoDeploymentTargets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_SET_OPERATION_RESULTS = OperationModel.new(
        name: "ListStackSetOperationResults",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_SET_OPERATIONS = OperationModel.new(
        name: "ListStackSetOperations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_SETS = OperationModel.new(
        name: "ListStackSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACKS = OperationModel.new(
        name: "ListStacks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TYPE_REGISTRATIONS = OperationModel.new(
        name: "ListTypeRegistrations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TYPE_VERSIONS = OperationModel.new(
        name: "ListTypeVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TYPES = OperationModel.new(
        name: "ListTypes",
        http_method: "POST",
        request_uri: "/"
      )

      PUBLISH_TYPE = OperationModel.new(
        name: "PublishType",
        http_method: "POST",
        request_uri: "/"
      )

      RECORD_HANDLER_PROGRESS = OperationModel.new(
        name: "RecordHandlerProgress",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_PUBLISHER = OperationModel.new(
        name: "RegisterPublisher",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TYPE = OperationModel.new(
        name: "RegisterType",
        http_method: "POST",
        request_uri: "/"
      )

      ROLLBACK_STACK = OperationModel.new(
        name: "RollbackStack",
        http_method: "POST",
        request_uri: "/"
      )

      SET_STACK_POLICY = OperationModel.new(
        name: "SetStackPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      SET_TYPE_CONFIGURATION = OperationModel.new(
        name: "SetTypeConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      SET_TYPE_DEFAULT_VERSION = OperationModel.new(
        name: "SetTypeDefaultVersion",
        http_method: "POST",
        request_uri: "/"
      )

      SIGNAL_RESOURCE = OperationModel.new(
        name: "SignalResource",
        http_method: "POST",
        request_uri: "/"
      )

      START_RESOURCE_SCAN = OperationModel.new(
        name: "StartResourceScan",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_STACK_SET_OPERATION = OperationModel.new(
        name: "StopStackSetOperation",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_TYPE = OperationModel.new(
        name: "TestType",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GENERATED_TEMPLATE = OperationModel.new(
        name: "UpdateGeneratedTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STACK = OperationModel.new(
        name: "UpdateStack",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STACK_INSTANCES = OperationModel.new(
        name: "UpdateStackInstances",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STACK_SET = OperationModel.new(
        name: "UpdateStackSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TERMINATION_PROTECTION = OperationModel.new(
        name: "UpdateTerminationProtection",
        http_method: "POST",
        request_uri: "/"
      )

      VALIDATE_TEMPLATE = OperationModel.new(
        name: "ValidateTemplate",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
