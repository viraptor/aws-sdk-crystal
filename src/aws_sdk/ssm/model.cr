module AwsSdk
  module SSM
    module Model
      API_VERSION = "2014-11-06"
      TARGET_PREFIX = "AmazonSSM"
      SIGNING_NAME = "ssm"
      ENDPOINT_PREFIX = "ssm"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://ssm.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://ssm-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ssm.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
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

      ASSOCIATE_OPS_ITEM_RELATED_ITEM = OperationModel.new(
        name: "AssociateOpsItemRelatedItem",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_COMMAND = OperationModel.new(
        name: "CancelCommand",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_MAINTENANCE_WINDOW_EXECUTION = OperationModel.new(
        name: "CancelMaintenanceWindowExecution",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACTIVATION = OperationModel.new(
        name: "CreateActivation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ASSOCIATION = OperationModel.new(
        name: "CreateAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ASSOCIATION_BATCH = OperationModel.new(
        name: "CreateAssociationBatch",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOCUMENT = OperationModel.new(
        name: "CreateDocument",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MAINTENANCE_WINDOW = OperationModel.new(
        name: "CreateMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OPS_ITEM = OperationModel.new(
        name: "CreateOpsItem",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OPS_METADATA = OperationModel.new(
        name: "CreateOpsMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PATCH_BASELINE = OperationModel.new(
        name: "CreatePatchBaseline",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOURCE_DATA_SYNC = OperationModel.new(
        name: "CreateResourceDataSync",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACTIVATION = OperationModel.new(
        name: "DeleteActivation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ASSOCIATION = OperationModel.new(
        name: "DeleteAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOCUMENT = OperationModel.new(
        name: "DeleteDocument",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INVENTORY = OperationModel.new(
        name: "DeleteInventory",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MAINTENANCE_WINDOW = OperationModel.new(
        name: "DeleteMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OPS_ITEM = OperationModel.new(
        name: "DeleteOpsItem",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OPS_METADATA = OperationModel.new(
        name: "DeleteOpsMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARAMETER = OperationModel.new(
        name: "DeleteParameter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARAMETERS = OperationModel.new(
        name: "DeleteParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PATCH_BASELINE = OperationModel.new(
        name: "DeletePatchBaseline",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_DATA_SYNC = OperationModel.new(
        name: "DeleteResourceDataSync",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_MANAGED_INSTANCE = OperationModel.new(
        name: "DeregisterManagedInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_PATCH_BASELINE_FOR_PATCH_GROUP = OperationModel.new(
        name: "DeregisterPatchBaselineForPatchGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_TARGET_FROM_MAINTENANCE_WINDOW = OperationModel.new(
        name: "DeregisterTargetFromMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_TASK_FROM_MAINTENANCE_WINDOW = OperationModel.new(
        name: "DeregisterTaskFromMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACTIVATIONS = OperationModel.new(
        name: "DescribeActivations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ASSOCIATION = OperationModel.new(
        name: "DescribeAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ASSOCIATION_EXECUTION_TARGETS = OperationModel.new(
        name: "DescribeAssociationExecutionTargets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ASSOCIATION_EXECUTIONS = OperationModel.new(
        name: "DescribeAssociationExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTOMATION_EXECUTIONS = OperationModel.new(
        name: "DescribeAutomationExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTOMATION_STEP_EXECUTIONS = OperationModel.new(
        name: "DescribeAutomationStepExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AVAILABLE_PATCHES = OperationModel.new(
        name: "DescribeAvailablePatches",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOCUMENT = OperationModel.new(
        name: "DescribeDocument",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOCUMENT_PERMISSION = OperationModel.new(
        name: "DescribeDocumentPermission",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EFFECTIVE_INSTANCE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeEffectiveInstanceAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EFFECTIVE_PATCHES_FOR_PATCH_BASELINE = OperationModel.new(
        name: "DescribeEffectivePatchesForPatchBaseline",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_ASSOCIATIONS_STATUS = OperationModel.new(
        name: "DescribeInstanceAssociationsStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_INFORMATION = OperationModel.new(
        name: "DescribeInstanceInformation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_PATCH_STATES = OperationModel.new(
        name: "DescribeInstancePatchStates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_PATCH_STATES_FOR_PATCH_GROUP = OperationModel.new(
        name: "DescribeInstancePatchStatesForPatchGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_PATCHES = OperationModel.new(
        name: "DescribeInstancePatches",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_PROPERTIES = OperationModel.new(
        name: "DescribeInstanceProperties",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INVENTORY_DELETIONS = OperationModel.new(
        name: "DescribeInventoryDeletions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOW_EXECUTION_TASK_INVOCATIONS = OperationModel.new(
        name: "DescribeMaintenanceWindowExecutionTaskInvocations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOW_EXECUTION_TASKS = OperationModel.new(
        name: "DescribeMaintenanceWindowExecutionTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOW_EXECUTIONS = OperationModel.new(
        name: "DescribeMaintenanceWindowExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOW_SCHEDULE = OperationModel.new(
        name: "DescribeMaintenanceWindowSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOW_TARGETS = OperationModel.new(
        name: "DescribeMaintenanceWindowTargets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOW_TASKS = OperationModel.new(
        name: "DescribeMaintenanceWindowTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOWS = OperationModel.new(
        name: "DescribeMaintenanceWindows",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_WINDOWS_FOR_TARGET = OperationModel.new(
        name: "DescribeMaintenanceWindowsForTarget",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OPS_ITEMS = OperationModel.new(
        name: "DescribeOpsItems",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PARAMETERS = OperationModel.new(
        name: "DescribeParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PATCH_BASELINES = OperationModel.new(
        name: "DescribePatchBaselines",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PATCH_GROUP_STATE = OperationModel.new(
        name: "DescribePatchGroupState",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PATCH_GROUPS = OperationModel.new(
        name: "DescribePatchGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PATCH_PROPERTIES = OperationModel.new(
        name: "DescribePatchProperties",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SESSIONS = OperationModel.new(
        name: "DescribeSessions",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_OPS_ITEM_RELATED_ITEM = OperationModel.new(
        name: "DisassociateOpsItemRelatedItem",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCESS_TOKEN = OperationModel.new(
        name: "GetAccessToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTOMATION_EXECUTION = OperationModel.new(
        name: "GetAutomationExecution",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CALENDAR_STATE = OperationModel.new(
        name: "GetCalendarState",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMMAND_INVOCATION = OperationModel.new(
        name: "GetCommandInvocation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONNECTION_STATUS = OperationModel.new(
        name: "GetConnectionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEFAULT_PATCH_BASELINE = OperationModel.new(
        name: "GetDefaultPatchBaseline",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEPLOYABLE_PATCH_SNAPSHOT_FOR_INSTANCE = OperationModel.new(
        name: "GetDeployablePatchSnapshotForInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOCUMENT = OperationModel.new(
        name: "GetDocument",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EXECUTION_PREVIEW = OperationModel.new(
        name: "GetExecutionPreview",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INVENTORY = OperationModel.new(
        name: "GetInventory",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INVENTORY_SCHEMA = OperationModel.new(
        name: "GetInventorySchema",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAINTENANCE_WINDOW = OperationModel.new(
        name: "GetMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAINTENANCE_WINDOW_EXECUTION = OperationModel.new(
        name: "GetMaintenanceWindowExecution",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAINTENANCE_WINDOW_EXECUTION_TASK = OperationModel.new(
        name: "GetMaintenanceWindowExecutionTask",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAINTENANCE_WINDOW_EXECUTION_TASK_INVOCATION = OperationModel.new(
        name: "GetMaintenanceWindowExecutionTaskInvocation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAINTENANCE_WINDOW_TASK = OperationModel.new(
        name: "GetMaintenanceWindowTask",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPS_ITEM = OperationModel.new(
        name: "GetOpsItem",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPS_METADATA = OperationModel.new(
        name: "GetOpsMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPS_SUMMARY = OperationModel.new(
        name: "GetOpsSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARAMETER = OperationModel.new(
        name: "GetParameter",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARAMETER_HISTORY = OperationModel.new(
        name: "GetParameterHistory",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARAMETERS = OperationModel.new(
        name: "GetParameters",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARAMETERS_BY_PATH = OperationModel.new(
        name: "GetParametersByPath",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PATCH_BASELINE = OperationModel.new(
        name: "GetPatchBaseline",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PATCH_BASELINE_FOR_PATCH_GROUP = OperationModel.new(
        name: "GetPatchBaselineForPatchGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICIES = OperationModel.new(
        name: "GetResourcePolicies",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_SETTING = OperationModel.new(
        name: "GetServiceSetting",
        http_method: "POST",
        request_uri: "/"
      )

      LABEL_PARAMETER_VERSION = OperationModel.new(
        name: "LabelParameterVersion",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSOCIATION_VERSIONS = OperationModel.new(
        name: "ListAssociationVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSOCIATIONS = OperationModel.new(
        name: "ListAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMMAND_INVOCATIONS = OperationModel.new(
        name: "ListCommandInvocations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMMANDS = OperationModel.new(
        name: "ListCommands",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPLIANCE_ITEMS = OperationModel.new(
        name: "ListComplianceItems",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPLIANCE_SUMMARIES = OperationModel.new(
        name: "ListComplianceSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOCUMENT_METADATA_HISTORY = OperationModel.new(
        name: "ListDocumentMetadataHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOCUMENT_VERSIONS = OperationModel.new(
        name: "ListDocumentVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOCUMENTS = OperationModel.new(
        name: "ListDocuments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INVENTORY_ENTRIES = OperationModel.new(
        name: "ListInventoryEntries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NODES = OperationModel.new(
        name: "ListNodes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NODES_SUMMARY = OperationModel.new(
        name: "ListNodesSummary",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPS_ITEM_EVENTS = OperationModel.new(
        name: "ListOpsItemEvents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPS_ITEM_RELATED_ITEMS = OperationModel.new(
        name: "ListOpsItemRelatedItems",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPS_METADATA = OperationModel.new(
        name: "ListOpsMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_COMPLIANCE_SUMMARIES = OperationModel.new(
        name: "ListResourceComplianceSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_DATA_SYNC = OperationModel.new(
        name: "ListResourceDataSync",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DOCUMENT_PERMISSION = OperationModel.new(
        name: "ModifyDocumentPermission",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_COMPLIANCE_ITEMS = OperationModel.new(
        name: "PutComplianceItems",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_INVENTORY = OperationModel.new(
        name: "PutInventory",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PARAMETER = OperationModel.new(
        name: "PutParameter",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_DEFAULT_PATCH_BASELINE = OperationModel.new(
        name: "RegisterDefaultPatchBaseline",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_PATCH_BASELINE_FOR_PATCH_GROUP = OperationModel.new(
        name: "RegisterPatchBaselineForPatchGroup",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TARGET_WITH_MAINTENANCE_WINDOW = OperationModel.new(
        name: "RegisterTargetWithMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TASK_WITH_MAINTENANCE_WINDOW = OperationModel.new(
        name: "RegisterTaskWithMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveTagsFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_SERVICE_SETTING = OperationModel.new(
        name: "ResetServiceSetting",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_SESSION = OperationModel.new(
        name: "ResumeSession",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_AUTOMATION_SIGNAL = OperationModel.new(
        name: "SendAutomationSignal",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_COMMAND = OperationModel.new(
        name: "SendCommand",
        http_method: "POST",
        request_uri: "/"
      )

      START_ACCESS_REQUEST = OperationModel.new(
        name: "StartAccessRequest",
        http_method: "POST",
        request_uri: "/"
      )

      START_ASSOCIATIONS_ONCE = OperationModel.new(
        name: "StartAssociationsOnce",
        http_method: "POST",
        request_uri: "/"
      )

      START_AUTOMATION_EXECUTION = OperationModel.new(
        name: "StartAutomationExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_CHANGE_REQUEST_EXECUTION = OperationModel.new(
        name: "StartChangeRequestExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_EXECUTION_PREVIEW = OperationModel.new(
        name: "StartExecutionPreview",
        http_method: "POST",
        request_uri: "/"
      )

      START_SESSION = OperationModel.new(
        name: "StartSession",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_AUTOMATION_EXECUTION = OperationModel.new(
        name: "StopAutomationExecution",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_SESSION = OperationModel.new(
        name: "TerminateSession",
        http_method: "POST",
        request_uri: "/"
      )

      UNLABEL_PARAMETER_VERSION = OperationModel.new(
        name: "UnlabelParameterVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ASSOCIATION = OperationModel.new(
        name: "UpdateAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ASSOCIATION_STATUS = OperationModel.new(
        name: "UpdateAssociationStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOCUMENT = OperationModel.new(
        name: "UpdateDocument",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOCUMENT_DEFAULT_VERSION = OperationModel.new(
        name: "UpdateDocumentDefaultVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOCUMENT_METADATA = OperationModel.new(
        name: "UpdateDocumentMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MAINTENANCE_WINDOW = OperationModel.new(
        name: "UpdateMaintenanceWindow",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MAINTENANCE_WINDOW_TARGET = OperationModel.new(
        name: "UpdateMaintenanceWindowTarget",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MAINTENANCE_WINDOW_TASK = OperationModel.new(
        name: "UpdateMaintenanceWindowTask",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MANAGED_INSTANCE_ROLE = OperationModel.new(
        name: "UpdateManagedInstanceRole",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_OPS_ITEM = OperationModel.new(
        name: "UpdateOpsItem",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_OPS_METADATA = OperationModel.new(
        name: "UpdateOpsMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PATCH_BASELINE = OperationModel.new(
        name: "UpdatePatchBaseline",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESOURCE_DATA_SYNC = OperationModel.new(
        name: "UpdateResourceDataSync",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_SETTING = OperationModel.new(
        name: "UpdateServiceSetting",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
