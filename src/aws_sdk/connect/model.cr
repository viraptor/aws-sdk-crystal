module AwsSdk
  module Connect
    module Model
      API_VERSION = "2017-08-08"
      TARGET_PREFIX = ""
      SIGNING_NAME = "connect"
      ENDPOINT_PREFIX = "connect"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://connect-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://connect.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://connect-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://connect.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://connect.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_EVALUATION_FORM = OperationModel.new(
        name: "ActivateEvaluationForm",
        http_method: "POST",
        request_uri: "/evaluation-forms/{InstanceId}/{EvaluationFormId}/activate"
      )

      ASSOCIATE_ANALYTICS_DATA_SET = OperationModel.new(
        name: "AssociateAnalyticsDataSet",
        http_method: "PUT",
        request_uri: "/analytics-data/instance/{InstanceId}/association"
      )

      ASSOCIATE_APPROVED_ORIGIN = OperationModel.new(
        name: "AssociateApprovedOrigin",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/approved-origin"
      )

      ASSOCIATE_BOT = OperationModel.new(
        name: "AssociateBot",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/bot"
      )

      ASSOCIATE_CONTACT_WITH_USER = OperationModel.new(
        name: "AssociateContactWithUser",
        http_method: "POST",
        request_uri: "/contacts/{InstanceId}/{ContactId}/associate-user"
      )

      ASSOCIATE_DEFAULT_VOCABULARY = OperationModel.new(
        name: "AssociateDefaultVocabulary",
        http_method: "PUT",
        request_uri: "/default-vocabulary/{InstanceId}/{LanguageCode}"
      )

      ASSOCIATE_EMAIL_ADDRESS_ALIAS = OperationModel.new(
        name: "AssociateEmailAddressAlias",
        http_method: "POST",
        request_uri: "/email-addresses/{InstanceId}/{EmailAddressId}/associate-alias"
      )

      ASSOCIATE_FLOW = OperationModel.new(
        name: "AssociateFlow",
        http_method: "PUT",
        request_uri: "/flow-associations/{InstanceId}"
      )

      ASSOCIATE_HOURS_OF_OPERATIONS = OperationModel.new(
        name: "AssociateHoursOfOperations",
        http_method: "POST",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/associate-hours"
      )

      ASSOCIATE_INSTANCE_STORAGE_CONFIG = OperationModel.new(
        name: "AssociateInstanceStorageConfig",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/storage-config"
      )

      ASSOCIATE_LAMBDA_FUNCTION = OperationModel.new(
        name: "AssociateLambdaFunction",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/lambda-function"
      )

      ASSOCIATE_LEX_BOT = OperationModel.new(
        name: "AssociateLexBot",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/lex-bot"
      )

      ASSOCIATE_PHONE_NUMBER_CONTACT_FLOW = OperationModel.new(
        name: "AssociatePhoneNumberContactFlow",
        http_method: "PUT",
        request_uri: "/phone-number/{PhoneNumberId}/contact-flow"
      )

      ASSOCIATE_QUEUE_QUICK_CONNECTS = OperationModel.new(
        name: "AssociateQueueQuickConnects",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/associate-quick-connects"
      )

      ASSOCIATE_ROUTING_PROFILE_QUEUES = OperationModel.new(
        name: "AssociateRoutingProfileQueues",
        http_method: "POST",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/associate-queues"
      )

      ASSOCIATE_SECURITY_KEY = OperationModel.new(
        name: "AssociateSecurityKey",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/security-key"
      )

      ASSOCIATE_SECURITY_PROFILES = OperationModel.new(
        name: "AssociateSecurityProfiles",
        http_method: "POST",
        request_uri: "/associate-security-profiles/{InstanceId}"
      )

      ASSOCIATE_TRAFFIC_DISTRIBUTION_GROUP_USER = OperationModel.new(
        name: "AssociateTrafficDistributionGroupUser",
        http_method: "PUT",
        request_uri: "/traffic-distribution-group/{TrafficDistributionGroupId}/user"
      )

      ASSOCIATE_USER_PROFICIENCIES = OperationModel.new(
        name: "AssociateUserProficiencies",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/associate-proficiencies"
      )

      ASSOCIATE_WORKSPACE = OperationModel.new(
        name: "AssociateWorkspace",
        http_method: "POST",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/associate"
      )

      BATCH_ASSOCIATE_ANALYTICS_DATA_SET = OperationModel.new(
        name: "BatchAssociateAnalyticsDataSet",
        http_method: "PUT",
        request_uri: "/analytics-data/instance/{InstanceId}/associations"
      )

      BATCH_CREATE_DATA_TABLE_VALUE = OperationModel.new(
        name: "BatchCreateDataTableValue",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/create"
      )

      BATCH_DELETE_DATA_TABLE_VALUE = OperationModel.new(
        name: "BatchDeleteDataTableValue",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/delete"
      )

      BATCH_DESCRIBE_DATA_TABLE_VALUE = OperationModel.new(
        name: "BatchDescribeDataTableValue",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/describe"
      )

      BATCH_DISASSOCIATE_ANALYTICS_DATA_SET = OperationModel.new(
        name: "BatchDisassociateAnalyticsDataSet",
        http_method: "POST",
        request_uri: "/analytics-data/instance/{InstanceId}/associations"
      )

      BATCH_GET_ATTACHED_FILE_METADATA = OperationModel.new(
        name: "BatchGetAttachedFileMetadata",
        http_method: "POST",
        request_uri: "/attached-files/{InstanceId}"
      )

      BATCH_GET_FLOW_ASSOCIATION = OperationModel.new(
        name: "BatchGetFlowAssociation",
        http_method: "POST",
        request_uri: "/flow-associations-batch/{InstanceId}"
      )

      BATCH_PUT_CONTACT = OperationModel.new(
        name: "BatchPutContact",
        http_method: "PUT",
        request_uri: "/contact/batch/{InstanceId}"
      )

      BATCH_UPDATE_DATA_TABLE_VALUE = OperationModel.new(
        name: "BatchUpdateDataTableValue",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/update"
      )

      CLAIM_PHONE_NUMBER = OperationModel.new(
        name: "ClaimPhoneNumber",
        http_method: "POST",
        request_uri: "/phone-number/claim"
      )

      COMPLETE_ATTACHED_FILE_UPLOAD = OperationModel.new(
        name: "CompleteAttachedFileUpload",
        http_method: "POST",
        request_uri: "/attached-files/{InstanceId}/{FileId}"
      )

      CREATE_AGENT_STATUS = OperationModel.new(
        name: "CreateAgentStatus",
        http_method: "PUT",
        request_uri: "/agent-status/{InstanceId}"
      )

      CREATE_CONTACT = OperationModel.new(
        name: "CreateContact",
        http_method: "PUT",
        request_uri: "/contact/create-contact"
      )

      CREATE_CONTACT_FLOW = OperationModel.new(
        name: "CreateContactFlow",
        http_method: "PUT",
        request_uri: "/contact-flows/{InstanceId}"
      )

      CREATE_CONTACT_FLOW_MODULE = OperationModel.new(
        name: "CreateContactFlowModule",
        http_method: "PUT",
        request_uri: "/contact-flow-modules/{InstanceId}"
      )

      CREATE_CONTACT_FLOW_MODULE_ALIAS = OperationModel.new(
        name: "CreateContactFlowModuleAlias",
        http_method: "PUT",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/alias"
      )

      CREATE_CONTACT_FLOW_MODULE_VERSION = OperationModel.new(
        name: "CreateContactFlowModuleVersion",
        http_method: "PUT",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/version"
      )

      CREATE_CONTACT_FLOW_VERSION = OperationModel.new(
        name: "CreateContactFlowVersion",
        http_method: "PUT",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}/version"
      )

      CREATE_DATA_TABLE = OperationModel.new(
        name: "CreateDataTable",
        http_method: "PUT",
        request_uri: "/data-tables/{InstanceId}"
      )

      CREATE_DATA_TABLE_ATTRIBUTE = OperationModel.new(
        name: "CreateDataTableAttribute",
        http_method: "PUT",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/attributes"
      )

      CREATE_EMAIL_ADDRESS = OperationModel.new(
        name: "CreateEmailAddress",
        http_method: "PUT",
        request_uri: "/email-addresses/{InstanceId}"
      )

      CREATE_EVALUATION_FORM = OperationModel.new(
        name: "CreateEvaluationForm",
        http_method: "PUT",
        request_uri: "/evaluation-forms/{InstanceId}"
      )

      CREATE_HOURS_OF_OPERATION = OperationModel.new(
        name: "CreateHoursOfOperation",
        http_method: "PUT",
        request_uri: "/hours-of-operations/{InstanceId}"
      )

      CREATE_HOURS_OF_OPERATION_OVERRIDE = OperationModel.new(
        name: "CreateHoursOfOperationOverride",
        http_method: "PUT",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/overrides"
      )

      CREATE_INSTANCE = OperationModel.new(
        name: "CreateInstance",
        http_method: "PUT",
        request_uri: "/instance"
      )

      CREATE_INTEGRATION_ASSOCIATION = OperationModel.new(
        name: "CreateIntegrationAssociation",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/integration-associations"
      )

      CREATE_PARTICIPANT = OperationModel.new(
        name: "CreateParticipant",
        http_method: "POST",
        request_uri: "/contact/create-participant"
      )

      CREATE_PERSISTENT_CONTACT_ASSOCIATION = OperationModel.new(
        name: "CreatePersistentContactAssociation",
        http_method: "POST",
        request_uri: "/contact/persistent-contact-association/{InstanceId}/{InitialContactId}"
      )

      CREATE_PREDEFINED_ATTRIBUTE = OperationModel.new(
        name: "CreatePredefinedAttribute",
        http_method: "PUT",
        request_uri: "/predefined-attributes/{InstanceId}"
      )

      CREATE_PROMPT = OperationModel.new(
        name: "CreatePrompt",
        http_method: "PUT",
        request_uri: "/prompts/{InstanceId}"
      )

      CREATE_PUSH_NOTIFICATION_REGISTRATION = OperationModel.new(
        name: "CreatePushNotificationRegistration",
        http_method: "PUT",
        request_uri: "/push-notification/{InstanceId}/registrations"
      )

      CREATE_QUEUE = OperationModel.new(
        name: "CreateQueue",
        http_method: "PUT",
        request_uri: "/queues/{InstanceId}"
      )

      CREATE_QUICK_CONNECT = OperationModel.new(
        name: "CreateQuickConnect",
        http_method: "PUT",
        request_uri: "/quick-connects/{InstanceId}"
      )

      CREATE_ROUTING_PROFILE = OperationModel.new(
        name: "CreateRoutingProfile",
        http_method: "PUT",
        request_uri: "/routing-profiles/{InstanceId}"
      )

      CREATE_RULE = OperationModel.new(
        name: "CreateRule",
        http_method: "POST",
        request_uri: "/rules/{InstanceId}"
      )

      CREATE_SECURITY_PROFILE = OperationModel.new(
        name: "CreateSecurityProfile",
        http_method: "PUT",
        request_uri: "/security-profiles/{InstanceId}"
      )

      CREATE_TASK_TEMPLATE = OperationModel.new(
        name: "CreateTaskTemplate",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/task/template"
      )

      CREATE_TRAFFIC_DISTRIBUTION_GROUP = OperationModel.new(
        name: "CreateTrafficDistributionGroup",
        http_method: "PUT",
        request_uri: "/traffic-distribution-group"
      )

      CREATE_USE_CASE = OperationModel.new(
        name: "CreateUseCase",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "PUT",
        request_uri: "/users/{InstanceId}"
      )

      CREATE_USER_HIERARCHY_GROUP = OperationModel.new(
        name: "CreateUserHierarchyGroup",
        http_method: "PUT",
        request_uri: "/user-hierarchy-groups/{InstanceId}"
      )

      CREATE_VIEW = OperationModel.new(
        name: "CreateView",
        http_method: "PUT",
        request_uri: "/views/{InstanceId}"
      )

      CREATE_VIEW_VERSION = OperationModel.new(
        name: "CreateViewVersion",
        http_method: "PUT",
        request_uri: "/views/{InstanceId}/{ViewId}/versions"
      )

      CREATE_VOCABULARY = OperationModel.new(
        name: "CreateVocabulary",
        http_method: "POST",
        request_uri: "/vocabulary/{InstanceId}"
      )

      CREATE_WORKSPACE = OperationModel.new(
        name: "CreateWorkspace",
        http_method: "PUT",
        request_uri: "/workspaces/{InstanceId}"
      )

      CREATE_WORKSPACE_PAGE = OperationModel.new(
        name: "CreateWorkspacePage",
        http_method: "PUT",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/pages"
      )

      DEACTIVATE_EVALUATION_FORM = OperationModel.new(
        name: "DeactivateEvaluationForm",
        http_method: "POST",
        request_uri: "/evaluation-forms/{InstanceId}/{EvaluationFormId}/deactivate"
      )

      DELETE_ATTACHED_FILE = OperationModel.new(
        name: "DeleteAttachedFile",
        http_method: "DELETE",
        request_uri: "/attached-files/{InstanceId}/{FileId}"
      )

      DELETE_CONTACT_EVALUATION = OperationModel.new(
        name: "DeleteContactEvaluation",
        http_method: "DELETE",
        request_uri: "/contact-evaluations/{InstanceId}/{EvaluationId}"
      )

      DELETE_CONTACT_FLOW = OperationModel.new(
        name: "DeleteContactFlow",
        http_method: "DELETE",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}"
      )

      DELETE_CONTACT_FLOW_MODULE = OperationModel.new(
        name: "DeleteContactFlowModule",
        http_method: "DELETE",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}"
      )

      DELETE_CONTACT_FLOW_MODULE_ALIAS = OperationModel.new(
        name: "DeleteContactFlowModuleAlias",
        http_method: "DELETE",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/alias/{AliasId}"
      )

      DELETE_CONTACT_FLOW_MODULE_VERSION = OperationModel.new(
        name: "DeleteContactFlowModuleVersion",
        http_method: "DELETE",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/version/{ContactFlowModuleVersion}"
      )

      DELETE_CONTACT_FLOW_VERSION = OperationModel.new(
        name: "DeleteContactFlowVersion",
        http_method: "DELETE",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}/version/{ContactFlowVersion}"
      )

      DELETE_DATA_TABLE = OperationModel.new(
        name: "DeleteDataTable",
        http_method: "DELETE",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}"
      )

      DELETE_DATA_TABLE_ATTRIBUTE = OperationModel.new(
        name: "DeleteDataTableAttribute",
        http_method: "DELETE",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/attributes/{AttributeName}"
      )

      DELETE_EMAIL_ADDRESS = OperationModel.new(
        name: "DeleteEmailAddress",
        http_method: "DELETE",
        request_uri: "/email-addresses/{InstanceId}/{EmailAddressId}"
      )

      DELETE_EVALUATION_FORM = OperationModel.new(
        name: "DeleteEvaluationForm",
        http_method: "DELETE",
        request_uri: "/evaluation-forms/{InstanceId}/{EvaluationFormId}"
      )

      DELETE_HOURS_OF_OPERATION = OperationModel.new(
        name: "DeleteHoursOfOperation",
        http_method: "DELETE",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}"
      )

      DELETE_HOURS_OF_OPERATION_OVERRIDE = OperationModel.new(
        name: "DeleteHoursOfOperationOverride",
        http_method: "DELETE",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/overrides/{HoursOfOperationOverrideId}"
      )

      DELETE_INSTANCE = OperationModel.new(
        name: "DeleteInstance",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}"
      )

      DELETE_INTEGRATION_ASSOCIATION = OperationModel.new(
        name: "DeleteIntegrationAssociation",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}"
      )

      DELETE_PREDEFINED_ATTRIBUTE = OperationModel.new(
        name: "DeletePredefinedAttribute",
        http_method: "DELETE",
        request_uri: "/predefined-attributes/{InstanceId}/{Name}"
      )

      DELETE_PROMPT = OperationModel.new(
        name: "DeletePrompt",
        http_method: "DELETE",
        request_uri: "/prompts/{InstanceId}/{PromptId}"
      )

      DELETE_PUSH_NOTIFICATION_REGISTRATION = OperationModel.new(
        name: "DeletePushNotificationRegistration",
        http_method: "DELETE",
        request_uri: "/push-notification/{InstanceId}/registrations/{RegistrationId}"
      )

      DELETE_QUEUE = OperationModel.new(
        name: "DeleteQueue",
        http_method: "DELETE",
        request_uri: "/queues/{InstanceId}/{QueueId}"
      )

      DELETE_QUICK_CONNECT = OperationModel.new(
        name: "DeleteQuickConnect",
        http_method: "DELETE",
        request_uri: "/quick-connects/{InstanceId}/{QuickConnectId}"
      )

      DELETE_ROUTING_PROFILE = OperationModel.new(
        name: "DeleteRoutingProfile",
        http_method: "DELETE",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}"
      )

      DELETE_RULE = OperationModel.new(
        name: "DeleteRule",
        http_method: "DELETE",
        request_uri: "/rules/{InstanceId}/{RuleId}"
      )

      DELETE_SECURITY_PROFILE = OperationModel.new(
        name: "DeleteSecurityProfile",
        http_method: "DELETE",
        request_uri: "/security-profiles/{InstanceId}/{SecurityProfileId}"
      )

      DELETE_TASK_TEMPLATE = OperationModel.new(
        name: "DeleteTaskTemplate",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/task/template/{TaskTemplateId}"
      )

      DELETE_TRAFFIC_DISTRIBUTION_GROUP = OperationModel.new(
        name: "DeleteTrafficDistributionGroup",
        http_method: "DELETE",
        request_uri: "/traffic-distribution-group/{TrafficDistributionGroupId}"
      )

      DELETE_USE_CASE = OperationModel.new(
        name: "DeleteUseCase",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases/{UseCaseId}"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "DELETE",
        request_uri: "/users/{InstanceId}/{UserId}"
      )

      DELETE_USER_HIERARCHY_GROUP = OperationModel.new(
        name: "DeleteUserHierarchyGroup",
        http_method: "DELETE",
        request_uri: "/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}"
      )

      DELETE_VIEW = OperationModel.new(
        name: "DeleteView",
        http_method: "DELETE",
        request_uri: "/views/{InstanceId}/{ViewId}"
      )

      DELETE_VIEW_VERSION = OperationModel.new(
        name: "DeleteViewVersion",
        http_method: "DELETE",
        request_uri: "/views/{InstanceId}/{ViewId}/versions/{ViewVersion}"
      )

      DELETE_VOCABULARY = OperationModel.new(
        name: "DeleteVocabulary",
        http_method: "POST",
        request_uri: "/vocabulary-remove/{InstanceId}/{VocabularyId}"
      )

      DELETE_WORKSPACE = OperationModel.new(
        name: "DeleteWorkspace",
        http_method: "DELETE",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}"
      )

      DELETE_WORKSPACE_MEDIA = OperationModel.new(
        name: "DeleteWorkspaceMedia",
        http_method: "DELETE",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/media"
      )

      DELETE_WORKSPACE_PAGE = OperationModel.new(
        name: "DeleteWorkspacePage",
        http_method: "DELETE",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/pages/{Page}"
      )

      DESCRIBE_AGENT_STATUS = OperationModel.new(
        name: "DescribeAgentStatus",
        http_method: "GET",
        request_uri: "/agent-status/{InstanceId}/{AgentStatusId}"
      )

      DESCRIBE_AUTHENTICATION_PROFILE = OperationModel.new(
        name: "DescribeAuthenticationProfile",
        http_method: "GET",
        request_uri: "/authentication-profiles/{InstanceId}/{AuthenticationProfileId}"
      )

      DESCRIBE_CONTACT = OperationModel.new(
        name: "DescribeContact",
        http_method: "GET",
        request_uri: "/contacts/{InstanceId}/{ContactId}"
      )

      DESCRIBE_CONTACT_EVALUATION = OperationModel.new(
        name: "DescribeContactEvaluation",
        http_method: "GET",
        request_uri: "/contact-evaluations/{InstanceId}/{EvaluationId}"
      )

      DESCRIBE_CONTACT_FLOW = OperationModel.new(
        name: "DescribeContactFlow",
        http_method: "GET",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}"
      )

      DESCRIBE_CONTACT_FLOW_MODULE = OperationModel.new(
        name: "DescribeContactFlowModule",
        http_method: "GET",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}"
      )

      DESCRIBE_CONTACT_FLOW_MODULE_ALIAS = OperationModel.new(
        name: "DescribeContactFlowModuleAlias",
        http_method: "GET",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/alias/{AliasId}"
      )

      DESCRIBE_DATA_TABLE = OperationModel.new(
        name: "DescribeDataTable",
        http_method: "GET",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}"
      )

      DESCRIBE_DATA_TABLE_ATTRIBUTE = OperationModel.new(
        name: "DescribeDataTableAttribute",
        http_method: "GET",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/attributes/{AttributeName}"
      )

      DESCRIBE_EMAIL_ADDRESS = OperationModel.new(
        name: "DescribeEmailAddress",
        http_method: "GET",
        request_uri: "/email-addresses/{InstanceId}/{EmailAddressId}"
      )

      DESCRIBE_EVALUATION_FORM = OperationModel.new(
        name: "DescribeEvaluationForm",
        http_method: "GET",
        request_uri: "/evaluation-forms/{InstanceId}/{EvaluationFormId}"
      )

      DESCRIBE_HOURS_OF_OPERATION = OperationModel.new(
        name: "DescribeHoursOfOperation",
        http_method: "GET",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}"
      )

      DESCRIBE_HOURS_OF_OPERATION_OVERRIDE = OperationModel.new(
        name: "DescribeHoursOfOperationOverride",
        http_method: "GET",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/overrides/{HoursOfOperationOverrideId}"
      )

      DESCRIBE_INSTANCE = OperationModel.new(
        name: "DescribeInstance",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}"
      )

      DESCRIBE_INSTANCE_ATTRIBUTE = OperationModel.new(
        name: "DescribeInstanceAttribute",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/attribute/{AttributeType}"
      )

      DESCRIBE_INSTANCE_STORAGE_CONFIG = OperationModel.new(
        name: "DescribeInstanceStorageConfig",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/storage-config/{AssociationId}"
      )

      DESCRIBE_PHONE_NUMBER = OperationModel.new(
        name: "DescribePhoneNumber",
        http_method: "GET",
        request_uri: "/phone-number/{PhoneNumberId}"
      )

      DESCRIBE_PREDEFINED_ATTRIBUTE = OperationModel.new(
        name: "DescribePredefinedAttribute",
        http_method: "GET",
        request_uri: "/predefined-attributes/{InstanceId}/{Name}"
      )

      DESCRIBE_PROMPT = OperationModel.new(
        name: "DescribePrompt",
        http_method: "GET",
        request_uri: "/prompts/{InstanceId}/{PromptId}"
      )

      DESCRIBE_QUEUE = OperationModel.new(
        name: "DescribeQueue",
        http_method: "GET",
        request_uri: "/queues/{InstanceId}/{QueueId}"
      )

      DESCRIBE_QUICK_CONNECT = OperationModel.new(
        name: "DescribeQuickConnect",
        http_method: "GET",
        request_uri: "/quick-connects/{InstanceId}/{QuickConnectId}"
      )

      DESCRIBE_ROUTING_PROFILE = OperationModel.new(
        name: "DescribeRoutingProfile",
        http_method: "GET",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}"
      )

      DESCRIBE_RULE = OperationModel.new(
        name: "DescribeRule",
        http_method: "GET",
        request_uri: "/rules/{InstanceId}/{RuleId}"
      )

      DESCRIBE_SECURITY_PROFILE = OperationModel.new(
        name: "DescribeSecurityProfile",
        http_method: "GET",
        request_uri: "/security-profiles/{InstanceId}/{SecurityProfileId}"
      )

      DESCRIBE_TRAFFIC_DISTRIBUTION_GROUP = OperationModel.new(
        name: "DescribeTrafficDistributionGroup",
        http_method: "GET",
        request_uri: "/traffic-distribution-group/{TrafficDistributionGroupId}"
      )

      DESCRIBE_USER = OperationModel.new(
        name: "DescribeUser",
        http_method: "GET",
        request_uri: "/users/{InstanceId}/{UserId}"
      )

      DESCRIBE_USER_HIERARCHY_GROUP = OperationModel.new(
        name: "DescribeUserHierarchyGroup",
        http_method: "GET",
        request_uri: "/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}"
      )

      DESCRIBE_USER_HIERARCHY_STRUCTURE = OperationModel.new(
        name: "DescribeUserHierarchyStructure",
        http_method: "GET",
        request_uri: "/user-hierarchy-structure/{InstanceId}"
      )

      DESCRIBE_VIEW = OperationModel.new(
        name: "DescribeView",
        http_method: "GET",
        request_uri: "/views/{InstanceId}/{ViewId}"
      )

      DESCRIBE_VOCABULARY = OperationModel.new(
        name: "DescribeVocabulary",
        http_method: "GET",
        request_uri: "/vocabulary/{InstanceId}/{VocabularyId}"
      )

      DESCRIBE_WORKSPACE = OperationModel.new(
        name: "DescribeWorkspace",
        http_method: "GET",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}"
      )

      DISASSOCIATE_ANALYTICS_DATA_SET = OperationModel.new(
        name: "DisassociateAnalyticsDataSet",
        http_method: "POST",
        request_uri: "/analytics-data/instance/{InstanceId}/association"
      )

      DISASSOCIATE_APPROVED_ORIGIN = OperationModel.new(
        name: "DisassociateApprovedOrigin",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/approved-origin"
      )

      DISASSOCIATE_BOT = OperationModel.new(
        name: "DisassociateBot",
        http_method: "POST",
        request_uri: "/instance/{InstanceId}/bot"
      )

      DISASSOCIATE_EMAIL_ADDRESS_ALIAS = OperationModel.new(
        name: "DisassociateEmailAddressAlias",
        http_method: "POST",
        request_uri: "/email-addresses/{InstanceId}/{EmailAddressId}/disassociate-alias"
      )

      DISASSOCIATE_FLOW = OperationModel.new(
        name: "DisassociateFlow",
        http_method: "DELETE",
        request_uri: "/flow-associations/{InstanceId}/{ResourceId}/{ResourceType}"
      )

      DISASSOCIATE_HOURS_OF_OPERATIONS = OperationModel.new(
        name: "DisassociateHoursOfOperations",
        http_method: "POST",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/disassociate-hours"
      )

      DISASSOCIATE_INSTANCE_STORAGE_CONFIG = OperationModel.new(
        name: "DisassociateInstanceStorageConfig",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/storage-config/{AssociationId}"
      )

      DISASSOCIATE_LAMBDA_FUNCTION = OperationModel.new(
        name: "DisassociateLambdaFunction",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/lambda-function"
      )

      DISASSOCIATE_LEX_BOT = OperationModel.new(
        name: "DisassociateLexBot",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/lex-bot"
      )

      DISASSOCIATE_PHONE_NUMBER_CONTACT_FLOW = OperationModel.new(
        name: "DisassociatePhoneNumberContactFlow",
        http_method: "DELETE",
        request_uri: "/phone-number/{PhoneNumberId}/contact-flow"
      )

      DISASSOCIATE_QUEUE_QUICK_CONNECTS = OperationModel.new(
        name: "DisassociateQueueQuickConnects",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/disassociate-quick-connects"
      )

      DISASSOCIATE_ROUTING_PROFILE_QUEUES = OperationModel.new(
        name: "DisassociateRoutingProfileQueues",
        http_method: "POST",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/disassociate-queues"
      )

      DISASSOCIATE_SECURITY_KEY = OperationModel.new(
        name: "DisassociateSecurityKey",
        http_method: "DELETE",
        request_uri: "/instance/{InstanceId}/security-key/{AssociationId}"
      )

      DISASSOCIATE_SECURITY_PROFILES = OperationModel.new(
        name: "DisassociateSecurityProfiles",
        http_method: "POST",
        request_uri: "/disassociate-security-profiles/{InstanceId}"
      )

      DISASSOCIATE_TRAFFIC_DISTRIBUTION_GROUP_USER = OperationModel.new(
        name: "DisassociateTrafficDistributionGroupUser",
        http_method: "DELETE",
        request_uri: "/traffic-distribution-group/{TrafficDistributionGroupId}/user"
      )

      DISASSOCIATE_USER_PROFICIENCIES = OperationModel.new(
        name: "DisassociateUserProficiencies",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/disassociate-proficiencies"
      )

      DISASSOCIATE_WORKSPACE = OperationModel.new(
        name: "DisassociateWorkspace",
        http_method: "POST",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/disassociate"
      )

      DISMISS_USER_CONTACT = OperationModel.new(
        name: "DismissUserContact",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/contact"
      )

      EVALUATE_DATA_TABLE_VALUES = OperationModel.new(
        name: "EvaluateDataTableValues",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/evaluate"
      )

      GET_ATTACHED_FILE = OperationModel.new(
        name: "GetAttachedFile",
        http_method: "GET",
        request_uri: "/attached-files/{InstanceId}/{FileId}"
      )

      GET_CONTACT_ATTRIBUTES = OperationModel.new(
        name: "GetContactAttributes",
        http_method: "GET",
        request_uri: "/contact/attributes/{InstanceId}/{InitialContactId}"
      )

      GET_CONTACT_METRICS = OperationModel.new(
        name: "GetContactMetrics",
        http_method: "POST",
        request_uri: "/metrics/contact"
      )

      GET_CURRENT_METRIC_DATA = OperationModel.new(
        name: "GetCurrentMetricData",
        http_method: "POST",
        request_uri: "/metrics/current/{InstanceId}"
      )

      GET_CURRENT_USER_DATA = OperationModel.new(
        name: "GetCurrentUserData",
        http_method: "POST",
        request_uri: "/metrics/userdata/{InstanceId}"
      )

      GET_EFFECTIVE_HOURS_OF_OPERATIONS = OperationModel.new(
        name: "GetEffectiveHoursOfOperations",
        http_method: "GET",
        request_uri: "/effective-hours-of-operations/{InstanceId}/{HoursOfOperationId}"
      )

      GET_FEDERATION_TOKEN = OperationModel.new(
        name: "GetFederationToken",
        http_method: "GET",
        request_uri: "/user/federate/{InstanceId}"
      )

      GET_FLOW_ASSOCIATION = OperationModel.new(
        name: "GetFlowAssociation",
        http_method: "GET",
        request_uri: "/flow-associations/{InstanceId}/{ResourceId}/{ResourceType}"
      )

      GET_METRIC_DATA = OperationModel.new(
        name: "GetMetricData",
        http_method: "POST",
        request_uri: "/metrics/historical/{InstanceId}"
      )

      GET_METRIC_DATA_V2 = OperationModel.new(
        name: "GetMetricDataV2",
        http_method: "POST",
        request_uri: "/metrics/data"
      )

      GET_PROMPT_FILE = OperationModel.new(
        name: "GetPromptFile",
        http_method: "GET",
        request_uri: "/prompts/{InstanceId}/{PromptId}/file"
      )

      GET_TASK_TEMPLATE = OperationModel.new(
        name: "GetTaskTemplate",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/task/template/{TaskTemplateId}"
      )

      GET_TRAFFIC_DISTRIBUTION = OperationModel.new(
        name: "GetTrafficDistribution",
        http_method: "GET",
        request_uri: "/traffic-distribution/{Id}"
      )

      IMPORT_PHONE_NUMBER = OperationModel.new(
        name: "ImportPhoneNumber",
        http_method: "POST",
        request_uri: "/phone-number/import"
      )

      IMPORT_WORKSPACE_MEDIA = OperationModel.new(
        name: "ImportWorkspaceMedia",
        http_method: "POST",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/media"
      )

      LIST_AGENT_STATUSES = OperationModel.new(
        name: "ListAgentStatuses",
        http_method: "GET",
        request_uri: "/agent-status/{InstanceId}"
      )

      LIST_ANALYTICS_DATA_ASSOCIATIONS = OperationModel.new(
        name: "ListAnalyticsDataAssociations",
        http_method: "GET",
        request_uri: "/analytics-data/instance/{InstanceId}/association"
      )

      LIST_ANALYTICS_DATA_LAKE_DATA_SETS = OperationModel.new(
        name: "ListAnalyticsDataLakeDataSets",
        http_method: "GET",
        request_uri: "/analytics-data/instance/{InstanceId}/datasets"
      )

      LIST_APPROVED_ORIGINS = OperationModel.new(
        name: "ListApprovedOrigins",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/approved-origins"
      )

      LIST_ASSOCIATED_CONTACTS = OperationModel.new(
        name: "ListAssociatedContacts",
        http_method: "GET",
        request_uri: "/contact/associated/{InstanceId}"
      )

      LIST_AUTHENTICATION_PROFILES = OperationModel.new(
        name: "ListAuthenticationProfiles",
        http_method: "GET",
        request_uri: "/authentication-profiles-summary/{InstanceId}"
      )

      LIST_BOTS = OperationModel.new(
        name: "ListBots",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/bots"
      )

      LIST_CHILD_HOURS_OF_OPERATIONS = OperationModel.new(
        name: "ListChildHoursOfOperations",
        http_method: "GET",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/hours"
      )

      LIST_CONTACT_EVALUATIONS = OperationModel.new(
        name: "ListContactEvaluations",
        http_method: "GET",
        request_uri: "/contact-evaluations/{InstanceId}"
      )

      LIST_CONTACT_FLOW_MODULE_ALIASES = OperationModel.new(
        name: "ListContactFlowModuleAliases",
        http_method: "GET",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/aliases"
      )

      LIST_CONTACT_FLOW_MODULE_VERSIONS = OperationModel.new(
        name: "ListContactFlowModuleVersions",
        http_method: "GET",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/versions"
      )

      LIST_CONTACT_FLOW_MODULES = OperationModel.new(
        name: "ListContactFlowModules",
        http_method: "GET",
        request_uri: "/contact-flow-modules-summary/{InstanceId}"
      )

      LIST_CONTACT_FLOW_VERSIONS = OperationModel.new(
        name: "ListContactFlowVersions",
        http_method: "GET",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}/versions"
      )

      LIST_CONTACT_FLOWS = OperationModel.new(
        name: "ListContactFlows",
        http_method: "GET",
        request_uri: "/contact-flows-summary/{InstanceId}"
      )

      LIST_CONTACT_REFERENCES = OperationModel.new(
        name: "ListContactReferences",
        http_method: "GET",
        request_uri: "/contact/references/{InstanceId}/{ContactId}"
      )

      LIST_DATA_TABLE_ATTRIBUTES = OperationModel.new(
        name: "ListDataTableAttributes",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/attributes"
      )

      LIST_DATA_TABLE_PRIMARY_VALUES = OperationModel.new(
        name: "ListDataTablePrimaryValues",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/list-primary"
      )

      LIST_DATA_TABLE_VALUES = OperationModel.new(
        name: "ListDataTableValues",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/list"
      )

      LIST_DATA_TABLES = OperationModel.new(
        name: "ListDataTables",
        http_method: "GET",
        request_uri: "/data-tables/{InstanceId}"
      )

      LIST_DEFAULT_VOCABULARIES = OperationModel.new(
        name: "ListDefaultVocabularies",
        http_method: "POST",
        request_uri: "/default-vocabulary-summary/{InstanceId}"
      )

      LIST_ENTITY_SECURITY_PROFILES = OperationModel.new(
        name: "ListEntitySecurityProfiles",
        http_method: "POST",
        request_uri: "/entity-security-profiles-summary/{InstanceId}"
      )

      LIST_EVALUATION_FORM_VERSIONS = OperationModel.new(
        name: "ListEvaluationFormVersions",
        http_method: "GET",
        request_uri: "/evaluation-forms/{InstanceId}/{EvaluationFormId}/versions"
      )

      LIST_EVALUATION_FORMS = OperationModel.new(
        name: "ListEvaluationForms",
        http_method: "GET",
        request_uri: "/evaluation-forms/{InstanceId}"
      )

      LIST_FLOW_ASSOCIATIONS = OperationModel.new(
        name: "ListFlowAssociations",
        http_method: "GET",
        request_uri: "/flow-associations-summary/{InstanceId}"
      )

      LIST_HOURS_OF_OPERATION_OVERRIDES = OperationModel.new(
        name: "ListHoursOfOperationOverrides",
        http_method: "GET",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/overrides"
      )

      LIST_HOURS_OF_OPERATIONS = OperationModel.new(
        name: "ListHoursOfOperations",
        http_method: "GET",
        request_uri: "/hours-of-operations-summary/{InstanceId}"
      )

      LIST_INSTANCE_ATTRIBUTES = OperationModel.new(
        name: "ListInstanceAttributes",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/attributes"
      )

      LIST_INSTANCE_STORAGE_CONFIGS = OperationModel.new(
        name: "ListInstanceStorageConfigs",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/storage-configs"
      )

      LIST_INSTANCES = OperationModel.new(
        name: "ListInstances",
        http_method: "GET",
        request_uri: "/instance"
      )

      LIST_INTEGRATION_ASSOCIATIONS = OperationModel.new(
        name: "ListIntegrationAssociations",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/integration-associations"
      )

      LIST_LAMBDA_FUNCTIONS = OperationModel.new(
        name: "ListLambdaFunctions",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/lambda-functions"
      )

      LIST_LEX_BOTS = OperationModel.new(
        name: "ListLexBots",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/lex-bots"
      )

      LIST_PHONE_NUMBERS = OperationModel.new(
        name: "ListPhoneNumbers",
        http_method: "GET",
        request_uri: "/phone-numbers-summary/{InstanceId}"
      )

      LIST_PHONE_NUMBERS_V2 = OperationModel.new(
        name: "ListPhoneNumbersV2",
        http_method: "POST",
        request_uri: "/phone-number/list"
      )

      LIST_PREDEFINED_ATTRIBUTES = OperationModel.new(
        name: "ListPredefinedAttributes",
        http_method: "GET",
        request_uri: "/predefined-attributes/{InstanceId}"
      )

      LIST_PROMPTS = OperationModel.new(
        name: "ListPrompts",
        http_method: "GET",
        request_uri: "/prompts-summary/{InstanceId}"
      )

      LIST_QUEUE_QUICK_CONNECTS = OperationModel.new(
        name: "ListQueueQuickConnects",
        http_method: "GET",
        request_uri: "/queues/{InstanceId}/{QueueId}/quick-connects"
      )

      LIST_QUEUES = OperationModel.new(
        name: "ListQueues",
        http_method: "GET",
        request_uri: "/queues-summary/{InstanceId}"
      )

      LIST_QUICK_CONNECTS = OperationModel.new(
        name: "ListQuickConnects",
        http_method: "GET",
        request_uri: "/quick-connects/{InstanceId}"
      )

      LIST_REALTIME_CONTACT_ANALYSIS_SEGMENTS_V2 = OperationModel.new(
        name: "ListRealtimeContactAnalysisSegmentsV2",
        http_method: "POST",
        request_uri: "/contact/list-real-time-analysis-segments-v2/{InstanceId}/{ContactId}"
      )

      LIST_ROUTING_PROFILE_MANUAL_ASSIGNMENT_QUEUES = OperationModel.new(
        name: "ListRoutingProfileManualAssignmentQueues",
        http_method: "GET",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/manual-assignment-queues"
      )

      LIST_ROUTING_PROFILE_QUEUES = OperationModel.new(
        name: "ListRoutingProfileQueues",
        http_method: "GET",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/queues"
      )

      LIST_ROUTING_PROFILES = OperationModel.new(
        name: "ListRoutingProfiles",
        http_method: "GET",
        request_uri: "/routing-profiles-summary/{InstanceId}"
      )

      LIST_RULES = OperationModel.new(
        name: "ListRules",
        http_method: "GET",
        request_uri: "/rules/{InstanceId}"
      )

      LIST_SECURITY_KEYS = OperationModel.new(
        name: "ListSecurityKeys",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/security-keys"
      )

      LIST_SECURITY_PROFILE_APPLICATIONS = OperationModel.new(
        name: "ListSecurityProfileApplications",
        http_method: "GET",
        request_uri: "/security-profiles-applications/{InstanceId}/{SecurityProfileId}"
      )

      LIST_SECURITY_PROFILE_FLOW_MODULES = OperationModel.new(
        name: "ListSecurityProfileFlowModules",
        http_method: "GET",
        request_uri: "/security-profiles-flow-modules/{InstanceId}/{SecurityProfileId}"
      )

      LIST_SECURITY_PROFILE_PERMISSIONS = OperationModel.new(
        name: "ListSecurityProfilePermissions",
        http_method: "GET",
        request_uri: "/security-profiles-permissions/{InstanceId}/{SecurityProfileId}"
      )

      LIST_SECURITY_PROFILES = OperationModel.new(
        name: "ListSecurityProfiles",
        http_method: "GET",
        request_uri: "/security-profiles-summary/{InstanceId}"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TASK_TEMPLATES = OperationModel.new(
        name: "ListTaskTemplates",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/task/template"
      )

      LIST_TRAFFIC_DISTRIBUTION_GROUP_USERS = OperationModel.new(
        name: "ListTrafficDistributionGroupUsers",
        http_method: "GET",
        request_uri: "/traffic-distribution-group/{TrafficDistributionGroupId}/user"
      )

      LIST_TRAFFIC_DISTRIBUTION_GROUPS = OperationModel.new(
        name: "ListTrafficDistributionGroups",
        http_method: "GET",
        request_uri: "/traffic-distribution-groups"
      )

      LIST_USE_CASES = OperationModel.new(
        name: "ListUseCases",
        http_method: "GET",
        request_uri: "/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases"
      )

      LIST_USER_HIERARCHY_GROUPS = OperationModel.new(
        name: "ListUserHierarchyGroups",
        http_method: "GET",
        request_uri: "/user-hierarchy-groups-summary/{InstanceId}"
      )

      LIST_USER_PROFICIENCIES = OperationModel.new(
        name: "ListUserProficiencies",
        http_method: "GET",
        request_uri: "/users/{InstanceId}/{UserId}/proficiencies"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "GET",
        request_uri: "/users-summary/{InstanceId}"
      )

      LIST_VIEW_VERSIONS = OperationModel.new(
        name: "ListViewVersions",
        http_method: "GET",
        request_uri: "/views/{InstanceId}/{ViewId}/versions"
      )

      LIST_VIEWS = OperationModel.new(
        name: "ListViews",
        http_method: "GET",
        request_uri: "/views/{InstanceId}"
      )

      LIST_WORKSPACE_MEDIA = OperationModel.new(
        name: "ListWorkspaceMedia",
        http_method: "GET",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/media"
      )

      LIST_WORKSPACE_PAGES = OperationModel.new(
        name: "ListWorkspacePages",
        http_method: "GET",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/pages"
      )

      LIST_WORKSPACES = OperationModel.new(
        name: "ListWorkspaces",
        http_method: "GET",
        request_uri: "/workspaces/{InstanceId}"
      )

      MONITOR_CONTACT = OperationModel.new(
        name: "MonitorContact",
        http_method: "POST",
        request_uri: "/contact/monitor"
      )

      PAUSE_CONTACT = OperationModel.new(
        name: "PauseContact",
        http_method: "POST",
        request_uri: "/contact/pause"
      )

      PUT_USER_STATUS = OperationModel.new(
        name: "PutUserStatus",
        http_method: "PUT",
        request_uri: "/users/{InstanceId}/{UserId}/status"
      )

      RELEASE_PHONE_NUMBER = OperationModel.new(
        name: "ReleasePhoneNumber",
        http_method: "DELETE",
        request_uri: "/phone-number/{PhoneNumberId}"
      )

      REPLICATE_INSTANCE = OperationModel.new(
        name: "ReplicateInstance",
        http_method: "POST",
        request_uri: "/instance/{InstanceId}/replicate"
      )

      RESUME_CONTACT = OperationModel.new(
        name: "ResumeContact",
        http_method: "POST",
        request_uri: "/contact/resume"
      )

      RESUME_CONTACT_RECORDING = OperationModel.new(
        name: "ResumeContactRecording",
        http_method: "POST",
        request_uri: "/contact/resume-recording"
      )

      SEARCH_AGENT_STATUSES = OperationModel.new(
        name: "SearchAgentStatuses",
        http_method: "POST",
        request_uri: "/search-agent-statuses"
      )

      SEARCH_AVAILABLE_PHONE_NUMBERS = OperationModel.new(
        name: "SearchAvailablePhoneNumbers",
        http_method: "POST",
        request_uri: "/phone-number/search-available"
      )

      SEARCH_CONTACT_EVALUATIONS = OperationModel.new(
        name: "SearchContactEvaluations",
        http_method: "POST",
        request_uri: "/search-contact-evaluations"
      )

      SEARCH_CONTACT_FLOW_MODULES = OperationModel.new(
        name: "SearchContactFlowModules",
        http_method: "POST",
        request_uri: "/search-contact-flow-modules"
      )

      SEARCH_CONTACT_FLOWS = OperationModel.new(
        name: "SearchContactFlows",
        http_method: "POST",
        request_uri: "/search-contact-flows"
      )

      SEARCH_CONTACTS = OperationModel.new(
        name: "SearchContacts",
        http_method: "POST",
        request_uri: "/search-contacts"
      )

      SEARCH_DATA_TABLES = OperationModel.new(
        name: "SearchDataTables",
        http_method: "POST",
        request_uri: "/search-data-tables"
      )

      SEARCH_EMAIL_ADDRESSES = OperationModel.new(
        name: "SearchEmailAddresses",
        http_method: "POST",
        request_uri: "/search-email-addresses"
      )

      SEARCH_EVALUATION_FORMS = OperationModel.new(
        name: "SearchEvaluationForms",
        http_method: "POST",
        request_uri: "/search-evaluation-forms"
      )

      SEARCH_HOURS_OF_OPERATION_OVERRIDES = OperationModel.new(
        name: "SearchHoursOfOperationOverrides",
        http_method: "POST",
        request_uri: "/search-hours-of-operation-overrides"
      )

      SEARCH_HOURS_OF_OPERATIONS = OperationModel.new(
        name: "SearchHoursOfOperations",
        http_method: "POST",
        request_uri: "/search-hours-of-operations"
      )

      SEARCH_PREDEFINED_ATTRIBUTES = OperationModel.new(
        name: "SearchPredefinedAttributes",
        http_method: "POST",
        request_uri: "/search-predefined-attributes"
      )

      SEARCH_PROMPTS = OperationModel.new(
        name: "SearchPrompts",
        http_method: "POST",
        request_uri: "/search-prompts"
      )

      SEARCH_QUEUES = OperationModel.new(
        name: "SearchQueues",
        http_method: "POST",
        request_uri: "/search-queues"
      )

      SEARCH_QUICK_CONNECTS = OperationModel.new(
        name: "SearchQuickConnects",
        http_method: "POST",
        request_uri: "/search-quick-connects"
      )

      SEARCH_RESOURCE_TAGS = OperationModel.new(
        name: "SearchResourceTags",
        http_method: "POST",
        request_uri: "/search-resource-tags"
      )

      SEARCH_ROUTING_PROFILES = OperationModel.new(
        name: "SearchRoutingProfiles",
        http_method: "POST",
        request_uri: "/search-routing-profiles"
      )

      SEARCH_SECURITY_PROFILES = OperationModel.new(
        name: "SearchSecurityProfiles",
        http_method: "POST",
        request_uri: "/search-security-profiles"
      )

      SEARCH_USER_HIERARCHY_GROUPS = OperationModel.new(
        name: "SearchUserHierarchyGroups",
        http_method: "POST",
        request_uri: "/search-user-hierarchy-groups"
      )

      SEARCH_USERS = OperationModel.new(
        name: "SearchUsers",
        http_method: "POST",
        request_uri: "/search-users"
      )

      SEARCH_VIEWS = OperationModel.new(
        name: "SearchViews",
        http_method: "POST",
        request_uri: "/search-views"
      )

      SEARCH_VOCABULARIES = OperationModel.new(
        name: "SearchVocabularies",
        http_method: "POST",
        request_uri: "/vocabulary-summary/{InstanceId}"
      )

      SEARCH_WORKSPACE_ASSOCIATIONS = OperationModel.new(
        name: "SearchWorkspaceAssociations",
        http_method: "POST",
        request_uri: "/search-workspace-associations"
      )

      SEARCH_WORKSPACES = OperationModel.new(
        name: "SearchWorkspaces",
        http_method: "POST",
        request_uri: "/search-workspaces"
      )

      SEND_CHAT_INTEGRATION_EVENT = OperationModel.new(
        name: "SendChatIntegrationEvent",
        http_method: "POST",
        request_uri: "/chat-integration-event"
      )

      SEND_OUTBOUND_EMAIL = OperationModel.new(
        name: "SendOutboundEmail",
        http_method: "PUT",
        request_uri: "/instance/{InstanceId}/outbound-email"
      )

      START_ATTACHED_FILE_UPLOAD = OperationModel.new(
        name: "StartAttachedFileUpload",
        http_method: "PUT",
        request_uri: "/attached-files/{InstanceId}"
      )

      START_CHAT_CONTACT = OperationModel.new(
        name: "StartChatContact",
        http_method: "PUT",
        request_uri: "/contact/chat"
      )

      START_CONTACT_EVALUATION = OperationModel.new(
        name: "StartContactEvaluation",
        http_method: "PUT",
        request_uri: "/contact-evaluations/{InstanceId}"
      )

      START_CONTACT_MEDIA_PROCESSING = OperationModel.new(
        name: "StartContactMediaProcessing",
        http_method: "POST",
        request_uri: "/contact/start-contact-media-processing"
      )

      START_CONTACT_RECORDING = OperationModel.new(
        name: "StartContactRecording",
        http_method: "POST",
        request_uri: "/contact/start-recording"
      )

      START_CONTACT_STREAMING = OperationModel.new(
        name: "StartContactStreaming",
        http_method: "POST",
        request_uri: "/contact/start-streaming"
      )

      START_EMAIL_CONTACT = OperationModel.new(
        name: "StartEmailContact",
        http_method: "PUT",
        request_uri: "/contact/email"
      )

      START_OUTBOUND_CHAT_CONTACT = OperationModel.new(
        name: "StartOutboundChatContact",
        http_method: "PUT",
        request_uri: "/contact/outbound-chat"
      )

      START_OUTBOUND_EMAIL_CONTACT = OperationModel.new(
        name: "StartOutboundEmailContact",
        http_method: "PUT",
        request_uri: "/contact/outbound-email"
      )

      START_OUTBOUND_VOICE_CONTACT = OperationModel.new(
        name: "StartOutboundVoiceContact",
        http_method: "PUT",
        request_uri: "/contact/outbound-voice"
      )

      START_SCREEN_SHARING = OperationModel.new(
        name: "StartScreenSharing",
        http_method: "PUT",
        request_uri: "/contact/screen-sharing"
      )

      START_TASK_CONTACT = OperationModel.new(
        name: "StartTaskContact",
        http_method: "PUT",
        request_uri: "/contact/task"
      )

      START_WEB_RTC_CONTACT = OperationModel.new(
        name: "StartWebRTCContact",
        http_method: "PUT",
        request_uri: "/contact/webrtc"
      )

      STOP_CONTACT = OperationModel.new(
        name: "StopContact",
        http_method: "POST",
        request_uri: "/contact/stop"
      )

      STOP_CONTACT_MEDIA_PROCESSING = OperationModel.new(
        name: "StopContactMediaProcessing",
        http_method: "POST",
        request_uri: "/contact/stop-contact-media-processing"
      )

      STOP_CONTACT_RECORDING = OperationModel.new(
        name: "StopContactRecording",
        http_method: "POST",
        request_uri: "/contact/stop-recording"
      )

      STOP_CONTACT_STREAMING = OperationModel.new(
        name: "StopContactStreaming",
        http_method: "POST",
        request_uri: "/contact/stop-streaming"
      )

      SUBMIT_CONTACT_EVALUATION = OperationModel.new(
        name: "SubmitContactEvaluation",
        http_method: "POST",
        request_uri: "/contact-evaluations/{InstanceId}/{EvaluationId}/submit"
      )

      SUSPEND_CONTACT_RECORDING = OperationModel.new(
        name: "SuspendContactRecording",
        http_method: "POST",
        request_uri: "/contact/suspend-recording"
      )

      TAG_CONTACT = OperationModel.new(
        name: "TagContact",
        http_method: "POST",
        request_uri: "/contact/tags"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      TRANSFER_CONTACT = OperationModel.new(
        name: "TransferContact",
        http_method: "POST",
        request_uri: "/contact/transfer"
      )

      UNTAG_CONTACT = OperationModel.new(
        name: "UntagContact",
        http_method: "DELETE",
        request_uri: "/contact/tags/{InstanceId}/{ContactId}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_AGENT_STATUS = OperationModel.new(
        name: "UpdateAgentStatus",
        http_method: "POST",
        request_uri: "/agent-status/{InstanceId}/{AgentStatusId}"
      )

      UPDATE_AUTHENTICATION_PROFILE = OperationModel.new(
        name: "UpdateAuthenticationProfile",
        http_method: "POST",
        request_uri: "/authentication-profiles/{InstanceId}/{AuthenticationProfileId}"
      )

      UPDATE_CONTACT = OperationModel.new(
        name: "UpdateContact",
        http_method: "POST",
        request_uri: "/contacts/{InstanceId}/{ContactId}"
      )

      UPDATE_CONTACT_ATTRIBUTES = OperationModel.new(
        name: "UpdateContactAttributes",
        http_method: "POST",
        request_uri: "/contact/attributes"
      )

      UPDATE_CONTACT_EVALUATION = OperationModel.new(
        name: "UpdateContactEvaluation",
        http_method: "POST",
        request_uri: "/contact-evaluations/{InstanceId}/{EvaluationId}"
      )

      UPDATE_CONTACT_FLOW_CONTENT = OperationModel.new(
        name: "UpdateContactFlowContent",
        http_method: "POST",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}/content"
      )

      UPDATE_CONTACT_FLOW_METADATA = OperationModel.new(
        name: "UpdateContactFlowMetadata",
        http_method: "POST",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}/metadata"
      )

      UPDATE_CONTACT_FLOW_MODULE_ALIAS = OperationModel.new(
        name: "UpdateContactFlowModuleAlias",
        http_method: "POST",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/alias/{AliasId}"
      )

      UPDATE_CONTACT_FLOW_MODULE_CONTENT = OperationModel.new(
        name: "UpdateContactFlowModuleContent",
        http_method: "POST",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/content"
      )

      UPDATE_CONTACT_FLOW_MODULE_METADATA = OperationModel.new(
        name: "UpdateContactFlowModuleMetadata",
        http_method: "POST",
        request_uri: "/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/metadata"
      )

      UPDATE_CONTACT_FLOW_NAME = OperationModel.new(
        name: "UpdateContactFlowName",
        http_method: "POST",
        request_uri: "/contact-flows/{InstanceId}/{ContactFlowId}/name"
      )

      UPDATE_CONTACT_ROUTING_DATA = OperationModel.new(
        name: "UpdateContactRoutingData",
        http_method: "POST",
        request_uri: "/contacts/{InstanceId}/{ContactId}/routing-data"
      )

      UPDATE_CONTACT_SCHEDULE = OperationModel.new(
        name: "UpdateContactSchedule",
        http_method: "POST",
        request_uri: "/contact/schedule"
      )

      UPDATE_DATA_TABLE_ATTRIBUTE = OperationModel.new(
        name: "UpdateDataTableAttribute",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/attributes/{AttributeName}"
      )

      UPDATE_DATA_TABLE_METADATA = OperationModel.new(
        name: "UpdateDataTableMetadata",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}"
      )

      UPDATE_DATA_TABLE_PRIMARY_VALUES = OperationModel.new(
        name: "UpdateDataTablePrimaryValues",
        http_method: "POST",
        request_uri: "/data-tables/{InstanceId}/{DataTableId}/values/update-primary"
      )

      UPDATE_EMAIL_ADDRESS_METADATA = OperationModel.new(
        name: "UpdateEmailAddressMetadata",
        http_method: "POST",
        request_uri: "/email-addresses/{InstanceId}/{EmailAddressId}"
      )

      UPDATE_EVALUATION_FORM = OperationModel.new(
        name: "UpdateEvaluationForm",
        http_method: "PUT",
        request_uri: "/evaluation-forms/{InstanceId}/{EvaluationFormId}"
      )

      UPDATE_HOURS_OF_OPERATION = OperationModel.new(
        name: "UpdateHoursOfOperation",
        http_method: "POST",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}"
      )

      UPDATE_HOURS_OF_OPERATION_OVERRIDE = OperationModel.new(
        name: "UpdateHoursOfOperationOverride",
        http_method: "POST",
        request_uri: "/hours-of-operations/{InstanceId}/{HoursOfOperationId}/overrides/{HoursOfOperationOverrideId}"
      )

      UPDATE_INSTANCE_ATTRIBUTE = OperationModel.new(
        name: "UpdateInstanceAttribute",
        http_method: "POST",
        request_uri: "/instance/{InstanceId}/attribute/{AttributeType}"
      )

      UPDATE_INSTANCE_STORAGE_CONFIG = OperationModel.new(
        name: "UpdateInstanceStorageConfig",
        http_method: "POST",
        request_uri: "/instance/{InstanceId}/storage-config/{AssociationId}"
      )

      UPDATE_PARTICIPANT_AUTHENTICATION = OperationModel.new(
        name: "UpdateParticipantAuthentication",
        http_method: "POST",
        request_uri: "/contact/update-participant-authentication"
      )

      UPDATE_PARTICIPANT_ROLE_CONFIG = OperationModel.new(
        name: "UpdateParticipantRoleConfig",
        http_method: "PUT",
        request_uri: "/contact/participant-role-config/{InstanceId}/{ContactId}"
      )

      UPDATE_PHONE_NUMBER = OperationModel.new(
        name: "UpdatePhoneNumber",
        http_method: "PUT",
        request_uri: "/phone-number/{PhoneNumberId}"
      )

      UPDATE_PHONE_NUMBER_METADATA = OperationModel.new(
        name: "UpdatePhoneNumberMetadata",
        http_method: "PUT",
        request_uri: "/phone-number/{PhoneNumberId}/metadata"
      )

      UPDATE_PREDEFINED_ATTRIBUTE = OperationModel.new(
        name: "UpdatePredefinedAttribute",
        http_method: "POST",
        request_uri: "/predefined-attributes/{InstanceId}/{Name}"
      )

      UPDATE_PROMPT = OperationModel.new(
        name: "UpdatePrompt",
        http_method: "POST",
        request_uri: "/prompts/{InstanceId}/{PromptId}"
      )

      UPDATE_QUEUE_HOURS_OF_OPERATION = OperationModel.new(
        name: "UpdateQueueHoursOfOperation",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/hours-of-operation"
      )

      UPDATE_QUEUE_MAX_CONTACTS = OperationModel.new(
        name: "UpdateQueueMaxContacts",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/max-contacts"
      )

      UPDATE_QUEUE_NAME = OperationModel.new(
        name: "UpdateQueueName",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/name"
      )

      UPDATE_QUEUE_OUTBOUND_CALLER_CONFIG = OperationModel.new(
        name: "UpdateQueueOutboundCallerConfig",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/outbound-caller-config"
      )

      UPDATE_QUEUE_OUTBOUND_EMAIL_CONFIG = OperationModel.new(
        name: "UpdateQueueOutboundEmailConfig",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/outbound-email-config"
      )

      UPDATE_QUEUE_STATUS = OperationModel.new(
        name: "UpdateQueueStatus",
        http_method: "POST",
        request_uri: "/queues/{InstanceId}/{QueueId}/status"
      )

      UPDATE_QUICK_CONNECT_CONFIG = OperationModel.new(
        name: "UpdateQuickConnectConfig",
        http_method: "POST",
        request_uri: "/quick-connects/{InstanceId}/{QuickConnectId}/config"
      )

      UPDATE_QUICK_CONNECT_NAME = OperationModel.new(
        name: "UpdateQuickConnectName",
        http_method: "POST",
        request_uri: "/quick-connects/{InstanceId}/{QuickConnectId}/name"
      )

      UPDATE_ROUTING_PROFILE_AGENT_AVAILABILITY_TIMER = OperationModel.new(
        name: "UpdateRoutingProfileAgentAvailabilityTimer",
        http_method: "POST",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/agent-availability-timer"
      )

      UPDATE_ROUTING_PROFILE_CONCURRENCY = OperationModel.new(
        name: "UpdateRoutingProfileConcurrency",
        http_method: "POST",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/concurrency"
      )

      UPDATE_ROUTING_PROFILE_DEFAULT_OUTBOUND_QUEUE = OperationModel.new(
        name: "UpdateRoutingProfileDefaultOutboundQueue",
        http_method: "POST",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/default-outbound-queue"
      )

      UPDATE_ROUTING_PROFILE_NAME = OperationModel.new(
        name: "UpdateRoutingProfileName",
        http_method: "POST",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/name"
      )

      UPDATE_ROUTING_PROFILE_QUEUES = OperationModel.new(
        name: "UpdateRoutingProfileQueues",
        http_method: "POST",
        request_uri: "/routing-profiles/{InstanceId}/{RoutingProfileId}/queues"
      )

      UPDATE_RULE = OperationModel.new(
        name: "UpdateRule",
        http_method: "PUT",
        request_uri: "/rules/{InstanceId}/{RuleId}"
      )

      UPDATE_SECURITY_PROFILE = OperationModel.new(
        name: "UpdateSecurityProfile",
        http_method: "POST",
        request_uri: "/security-profiles/{InstanceId}/{SecurityProfileId}"
      )

      UPDATE_TASK_TEMPLATE = OperationModel.new(
        name: "UpdateTaskTemplate",
        http_method: "POST",
        request_uri: "/instance/{InstanceId}/task/template/{TaskTemplateId}"
      )

      UPDATE_TRAFFIC_DISTRIBUTION = OperationModel.new(
        name: "UpdateTrafficDistribution",
        http_method: "PUT",
        request_uri: "/traffic-distribution/{Id}"
      )

      UPDATE_USER_HIERARCHY = OperationModel.new(
        name: "UpdateUserHierarchy",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/hierarchy"
      )

      UPDATE_USER_HIERARCHY_GROUP_NAME = OperationModel.new(
        name: "UpdateUserHierarchyGroupName",
        http_method: "POST",
        request_uri: "/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}/name"
      )

      UPDATE_USER_HIERARCHY_STRUCTURE = OperationModel.new(
        name: "UpdateUserHierarchyStructure",
        http_method: "POST",
        request_uri: "/user-hierarchy-structure/{InstanceId}"
      )

      UPDATE_USER_IDENTITY_INFO = OperationModel.new(
        name: "UpdateUserIdentityInfo",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/identity-info"
      )

      UPDATE_USER_PHONE_CONFIG = OperationModel.new(
        name: "UpdateUserPhoneConfig",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/phone-config"
      )

      UPDATE_USER_PROFICIENCIES = OperationModel.new(
        name: "UpdateUserProficiencies",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/proficiencies"
      )

      UPDATE_USER_ROUTING_PROFILE = OperationModel.new(
        name: "UpdateUserRoutingProfile",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/routing-profile"
      )

      UPDATE_USER_SECURITY_PROFILES = OperationModel.new(
        name: "UpdateUserSecurityProfiles",
        http_method: "POST",
        request_uri: "/users/{InstanceId}/{UserId}/security-profiles"
      )

      UPDATE_VIEW_CONTENT = OperationModel.new(
        name: "UpdateViewContent",
        http_method: "POST",
        request_uri: "/views/{InstanceId}/{ViewId}"
      )

      UPDATE_VIEW_METADATA = OperationModel.new(
        name: "UpdateViewMetadata",
        http_method: "POST",
        request_uri: "/views/{InstanceId}/{ViewId}/metadata"
      )

      UPDATE_WORKSPACE_METADATA = OperationModel.new(
        name: "UpdateWorkspaceMetadata",
        http_method: "POST",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/metadata"
      )

      UPDATE_WORKSPACE_PAGE = OperationModel.new(
        name: "UpdateWorkspacePage",
        http_method: "POST",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/pages/{Page}"
      )

      UPDATE_WORKSPACE_THEME = OperationModel.new(
        name: "UpdateWorkspaceTheme",
        http_method: "POST",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/theme"
      )

      UPDATE_WORKSPACE_VISIBILITY = OperationModel.new(
        name: "UpdateWorkspaceVisibility",
        http_method: "POST",
        request_uri: "/workspaces/{InstanceId}/{WorkspaceId}/visibility"
      )
    end
  end
end
