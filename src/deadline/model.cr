module Aws
  module Deadline
    module Model
      API_VERSION = "2023-10-12"
      TARGET_PREFIX = ""
      SIGNING_NAME = "deadline"
      ENDPOINT_PREFIX = "deadline"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://deadline-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://deadline-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://deadline.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://deadline.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_MEMBER_TO_FARM = OperationModel.new(
        name: "AssociateMemberToFarm",
        http_method: "PUT",
        request_uri: "/2023-10-12/farms/{farmId}/members/{principalId}"
      )

      ASSOCIATE_MEMBER_TO_FLEET = OperationModel.new(
        name: "AssociateMemberToFleet",
        http_method: "PUT",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/members/{principalId}"
      )

      ASSOCIATE_MEMBER_TO_JOB = OperationModel.new(
        name: "AssociateMemberToJob",
        http_method: "PUT",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/members/{principalId}"
      )

      ASSOCIATE_MEMBER_TO_QUEUE = OperationModel.new(
        name: "AssociateMemberToQueue",
        http_method: "PUT",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/members/{principalId}"
      )

      ASSUME_FLEET_ROLE_FOR_READ = OperationModel.new(
        name: "AssumeFleetRoleForRead",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/read-roles"
      )

      ASSUME_FLEET_ROLE_FOR_WORKER = OperationModel.new(
        name: "AssumeFleetRoleForWorker",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}/fleet-roles"
      )

      ASSUME_QUEUE_ROLE_FOR_READ = OperationModel.new(
        name: "AssumeQueueRoleForRead",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/read-roles"
      )

      ASSUME_QUEUE_ROLE_FOR_USER = OperationModel.new(
        name: "AssumeQueueRoleForUser",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/user-roles"
      )

      ASSUME_QUEUE_ROLE_FOR_WORKER = OperationModel.new(
        name: "AssumeQueueRoleForWorker",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}/queue-roles"
      )

      BATCH_GET_JOB_ENTITY = OperationModel.new(
        name: "BatchGetJobEntity",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}/batchGetJobEntity"
      )

      COPY_JOB_TEMPLATE = OperationModel.new(
        name: "CopyJobTemplate",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/template"
      )

      CREATE_BUDGET = OperationModel.new(
        name: "CreateBudget",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/budgets"
      )

      CREATE_FARM = OperationModel.new(
        name: "CreateFarm",
        http_method: "POST",
        request_uri: "/2023-10-12/farms"
      )

      CREATE_FLEET = OperationModel.new(
        name: "CreateFleet",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/fleets"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs"
      )

      CREATE_LICENSE_ENDPOINT = OperationModel.new(
        name: "CreateLicenseEndpoint",
        http_method: "POST",
        request_uri: "/2023-10-12/license-endpoints"
      )

      CREATE_LIMIT = OperationModel.new(
        name: "CreateLimit",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/limits"
      )

      CREATE_MONITOR = OperationModel.new(
        name: "CreateMonitor",
        http_method: "POST",
        request_uri: "/2023-10-12/monitors"
      )

      CREATE_QUEUE = OperationModel.new(
        name: "CreateQueue",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/queues"
      )

      CREATE_QUEUE_ENVIRONMENT = OperationModel.new(
        name: "CreateQueueEnvironment",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/environments"
      )

      CREATE_QUEUE_FLEET_ASSOCIATION = OperationModel.new(
        name: "CreateQueueFleetAssociation",
        http_method: "PUT",
        request_uri: "/2023-10-12/farms/{farmId}/queue-fleet-associations"
      )

      CREATE_QUEUE_LIMIT_ASSOCIATION = OperationModel.new(
        name: "CreateQueueLimitAssociation",
        http_method: "PUT",
        request_uri: "/2023-10-12/farms/{farmId}/queue-limit-associations"
      )

      CREATE_STORAGE_PROFILE = OperationModel.new(
        name: "CreateStorageProfile",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/storage-profiles"
      )

      CREATE_WORKER = OperationModel.new(
        name: "CreateWorker",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers"
      )

      DELETE_BUDGET = OperationModel.new(
        name: "DeleteBudget",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/budgets/{budgetId}"
      )

      DELETE_FARM = OperationModel.new(
        name: "DeleteFarm",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}"
      )

      DELETE_FLEET = OperationModel.new(
        name: "DeleteFleet",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}"
      )

      DELETE_LICENSE_ENDPOINT = OperationModel.new(
        name: "DeleteLicenseEndpoint",
        http_method: "DELETE",
        request_uri: "/2023-10-12/license-endpoints/{licenseEndpointId}"
      )

      DELETE_LIMIT = OperationModel.new(
        name: "DeleteLimit",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/limits/{limitId}"
      )

      DELETE_METERED_PRODUCT = OperationModel.new(
        name: "DeleteMeteredProduct",
        http_method: "DELETE",
        request_uri: "/2023-10-12/license-endpoints/{licenseEndpointId}/metered-products/{productId}"
      )

      DELETE_MONITOR = OperationModel.new(
        name: "DeleteMonitor",
        http_method: "DELETE",
        request_uri: "/2023-10-12/monitors/{monitorId}"
      )

      DELETE_QUEUE = OperationModel.new(
        name: "DeleteQueue",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}"
      )

      DELETE_QUEUE_ENVIRONMENT = OperationModel.new(
        name: "DeleteQueueEnvironment",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/environments/{queueEnvironmentId}"
      )

      DELETE_QUEUE_FLEET_ASSOCIATION = OperationModel.new(
        name: "DeleteQueueFleetAssociation",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/queue-fleet-associations/{queueId}/{fleetId}"
      )

      DELETE_QUEUE_LIMIT_ASSOCIATION = OperationModel.new(
        name: "DeleteQueueLimitAssociation",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/queue-limit-associations/{queueId}/{limitId}"
      )

      DELETE_STORAGE_PROFILE = OperationModel.new(
        name: "DeleteStorageProfile",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/storage-profiles/{storageProfileId}"
      )

      DELETE_WORKER = OperationModel.new(
        name: "DeleteWorker",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}"
      )

      DISASSOCIATE_MEMBER_FROM_FARM = OperationModel.new(
        name: "DisassociateMemberFromFarm",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/members/{principalId}"
      )

      DISASSOCIATE_MEMBER_FROM_FLEET = OperationModel.new(
        name: "DisassociateMemberFromFleet",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/members/{principalId}"
      )

      DISASSOCIATE_MEMBER_FROM_JOB = OperationModel.new(
        name: "DisassociateMemberFromJob",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/members/{principalId}"
      )

      DISASSOCIATE_MEMBER_FROM_QUEUE = OperationModel.new(
        name: "DisassociateMemberFromQueue",
        http_method: "DELETE",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/members/{principalId}"
      )

      GET_BUDGET = OperationModel.new(
        name: "GetBudget",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/budgets/{budgetId}"
      )

      GET_FARM = OperationModel.new(
        name: "GetFarm",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}"
      )

      GET_FLEET = OperationModel.new(
        name: "GetFleet",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}"
      )

      GET_JOB = OperationModel.new(
        name: "GetJob",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}"
      )

      GET_LICENSE_ENDPOINT = OperationModel.new(
        name: "GetLicenseEndpoint",
        http_method: "GET",
        request_uri: "/2023-10-12/license-endpoints/{licenseEndpointId}"
      )

      GET_LIMIT = OperationModel.new(
        name: "GetLimit",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/limits/{limitId}"
      )

      GET_MONITOR = OperationModel.new(
        name: "GetMonitor",
        http_method: "GET",
        request_uri: "/2023-10-12/monitors/{monitorId}"
      )

      GET_QUEUE = OperationModel.new(
        name: "GetQueue",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}"
      )

      GET_QUEUE_ENVIRONMENT = OperationModel.new(
        name: "GetQueueEnvironment",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/environments/{queueEnvironmentId}"
      )

      GET_QUEUE_FLEET_ASSOCIATION = OperationModel.new(
        name: "GetQueueFleetAssociation",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queue-fleet-associations/{queueId}/{fleetId}"
      )

      GET_QUEUE_LIMIT_ASSOCIATION = OperationModel.new(
        name: "GetQueueLimitAssociation",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queue-limit-associations/{queueId}/{limitId}"
      )

      GET_SESSION = OperationModel.new(
        name: "GetSession",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/sessions/{sessionId}"
      )

      GET_SESSION_ACTION = OperationModel.new(
        name: "GetSessionAction",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/session-actions/{sessionActionId}"
      )

      GET_SESSIONS_STATISTICS_AGGREGATION = OperationModel.new(
        name: "GetSessionsStatisticsAggregation",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/sessions-statistics-aggregation"
      )

      GET_STEP = OperationModel.new(
        name: "GetStep",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps/{stepId}"
      )

      GET_STORAGE_PROFILE = OperationModel.new(
        name: "GetStorageProfile",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/storage-profiles/{storageProfileId}"
      )

      GET_STORAGE_PROFILE_FOR_QUEUE = OperationModel.new(
        name: "GetStorageProfileForQueue",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/storage-profiles/{storageProfileId}"
      )

      GET_TASK = OperationModel.new(
        name: "GetTask",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps/{stepId}/tasks/{taskId}"
      )

      GET_WORKER = OperationModel.new(
        name: "GetWorker",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}"
      )

      LIST_AVAILABLE_METERED_PRODUCTS = OperationModel.new(
        name: "ListAvailableMeteredProducts",
        http_method: "GET",
        request_uri: "/2023-10-12/metered-products"
      )

      LIST_BUDGETS = OperationModel.new(
        name: "ListBudgets",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/budgets"
      )

      LIST_FARM_MEMBERS = OperationModel.new(
        name: "ListFarmMembers",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/members"
      )

      LIST_FARMS = OperationModel.new(
        name: "ListFarms",
        http_method: "GET",
        request_uri: "/2023-10-12/farms"
      )

      LIST_FLEET_MEMBERS = OperationModel.new(
        name: "ListFleetMembers",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/members"
      )

      LIST_FLEETS = OperationModel.new(
        name: "ListFleets",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets"
      )

      LIST_JOB_MEMBERS = OperationModel.new(
        name: "ListJobMembers",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/members"
      )

      LIST_JOB_PARAMETER_DEFINITIONS = OperationModel.new(
        name: "ListJobParameterDefinitions",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/parameter-definitions"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs"
      )

      LIST_LICENSE_ENDPOINTS = OperationModel.new(
        name: "ListLicenseEndpoints",
        http_method: "GET",
        request_uri: "/2023-10-12/license-endpoints"
      )

      LIST_LIMITS = OperationModel.new(
        name: "ListLimits",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/limits"
      )

      LIST_METERED_PRODUCTS = OperationModel.new(
        name: "ListMeteredProducts",
        http_method: "GET",
        request_uri: "/2023-10-12/license-endpoints/{licenseEndpointId}/metered-products"
      )

      LIST_MONITORS = OperationModel.new(
        name: "ListMonitors",
        http_method: "GET",
        request_uri: "/2023-10-12/monitors"
      )

      LIST_QUEUE_ENVIRONMENTS = OperationModel.new(
        name: "ListQueueEnvironments",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/environments"
      )

      LIST_QUEUE_FLEET_ASSOCIATIONS = OperationModel.new(
        name: "ListQueueFleetAssociations",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queue-fleet-associations"
      )

      LIST_QUEUE_LIMIT_ASSOCIATIONS = OperationModel.new(
        name: "ListQueueLimitAssociations",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queue-limit-associations"
      )

      LIST_QUEUE_MEMBERS = OperationModel.new(
        name: "ListQueueMembers",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/members"
      )

      LIST_QUEUES = OperationModel.new(
        name: "ListQueues",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues"
      )

      LIST_SESSION_ACTIONS = OperationModel.new(
        name: "ListSessionActions",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/session-actions"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/sessions"
      )

      LIST_SESSIONS_FOR_WORKER = OperationModel.new(
        name: "ListSessionsForWorker",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}/sessions"
      )

      LIST_STEP_CONSUMERS = OperationModel.new(
        name: "ListStepConsumers",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps/{stepId}/consumers"
      )

      LIST_STEP_DEPENDENCIES = OperationModel.new(
        name: "ListStepDependencies",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps/{stepId}/dependencies"
      )

      LIST_STEPS = OperationModel.new(
        name: "ListSteps",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps"
      )

      LIST_STORAGE_PROFILES = OperationModel.new(
        name: "ListStorageProfiles",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/storage-profiles"
      )

      LIST_STORAGE_PROFILES_FOR_QUEUE = OperationModel.new(
        name: "ListStorageProfilesForQueue",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/storage-profiles"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/2023-10-12/tags/{resourceArn}"
      )

      LIST_TASKS = OperationModel.new(
        name: "ListTasks",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps/{stepId}/tasks"
      )

      LIST_WORKERS = OperationModel.new(
        name: "ListWorkers",
        http_method: "GET",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers"
      )

      PUT_METERED_PRODUCT = OperationModel.new(
        name: "PutMeteredProduct",
        http_method: "PUT",
        request_uri: "/2023-10-12/license-endpoints/{licenseEndpointId}/metered-products/{productId}"
      )

      SEARCH_JOBS = OperationModel.new(
        name: "SearchJobs",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/search/jobs"
      )

      SEARCH_STEPS = OperationModel.new(
        name: "SearchSteps",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/search/steps"
      )

      SEARCH_TASKS = OperationModel.new(
        name: "SearchTasks",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/search/tasks"
      )

      SEARCH_WORKERS = OperationModel.new(
        name: "SearchWorkers",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/search/workers"
      )

      START_SESSIONS_STATISTICS_AGGREGATION = OperationModel.new(
        name: "StartSessionsStatisticsAggregation",
        http_method: "POST",
        request_uri: "/2023-10-12/farms/{farmId}/sessions-statistics-aggregation"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/2023-10-12/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/2023-10-12/tags/{resourceArn}"
      )

      UPDATE_BUDGET = OperationModel.new(
        name: "UpdateBudget",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/budgets/{budgetId}"
      )

      UPDATE_FARM = OperationModel.new(
        name: "UpdateFarm",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}"
      )

      UPDATE_FLEET = OperationModel.new(
        name: "UpdateFleet",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}"
      )

      UPDATE_JOB = OperationModel.new(
        name: "UpdateJob",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}"
      )

      UPDATE_LIMIT = OperationModel.new(
        name: "UpdateLimit",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/limits/{limitId}"
      )

      UPDATE_MONITOR = OperationModel.new(
        name: "UpdateMonitor",
        http_method: "PATCH",
        request_uri: "/2023-10-12/monitors/{monitorId}"
      )

      UPDATE_QUEUE = OperationModel.new(
        name: "UpdateQueue",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}"
      )

      UPDATE_QUEUE_ENVIRONMENT = OperationModel.new(
        name: "UpdateQueueEnvironment",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/environments/{queueEnvironmentId}"
      )

      UPDATE_QUEUE_FLEET_ASSOCIATION = OperationModel.new(
        name: "UpdateQueueFleetAssociation",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queue-fleet-associations/{queueId}/{fleetId}"
      )

      UPDATE_QUEUE_LIMIT_ASSOCIATION = OperationModel.new(
        name: "UpdateQueueLimitAssociation",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queue-limit-associations/{queueId}/{limitId}"
      )

      UPDATE_SESSION = OperationModel.new(
        name: "UpdateSession",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/sessions/{sessionId}"
      )

      UPDATE_STEP = OperationModel.new(
        name: "UpdateStep",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps/{stepId}"
      )

      UPDATE_STORAGE_PROFILE = OperationModel.new(
        name: "UpdateStorageProfile",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/storage-profiles/{storageProfileId}"
      )

      UPDATE_TASK = OperationModel.new(
        name: "UpdateTask",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/queues/{queueId}/jobs/{jobId}/steps/{stepId}/tasks/{taskId}"
      )

      UPDATE_WORKER = OperationModel.new(
        name: "UpdateWorker",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}"
      )

      UPDATE_WORKER_SCHEDULE = OperationModel.new(
        name: "UpdateWorkerSchedule",
        http_method: "PATCH",
        request_uri: "/2023-10-12/farms/{farmId}/fleets/{fleetId}/workers/{workerId}/schedule"
      )
    end
  end
end
