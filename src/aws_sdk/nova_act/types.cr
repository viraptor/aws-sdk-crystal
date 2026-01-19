require "json"
require "time"

module AwsSdk
  module NovaAct
    module Types

      # You don't have sufficient permissions to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        # You don't have sufficient permissions to perform this action. Verify your IAM permissions and try
        # again.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Error information when an act fails to execute successfully.
      struct ActError
        include JSON::Serializable

        # A human-readable description of the error that occurred.
        @[JSON::Field(key: "message")]
        getter message : String

        # The type or category of error that occurred.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @message : String,
          @type : String? = nil
        )
        end
      end

      # Summary information about an act, including its status and execution timing.
      struct ActSummary
        include JSON::Serializable

        # The unique identifier of the act.
        @[JSON::Field(key: "actId")]
        getter act_id : String

        # The unique identifier of the session containing this act.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The timestamp when the act started execution.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The current execution status of the act.
        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the workflow run containing this act.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # The timestamp when the act completed execution, if applicable.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The location where trace information for this act is stored.
        @[JSON::Field(key: "traceLocation")]
        getter trace_location : Types::TraceLocation?

        def initialize(
          @act_id : String,
          @session_id : String,
          @started_at : Time,
          @status : String,
          @workflow_run_id : String,
          @ended_at : Time? = nil,
          @trace_location : Types::TraceLocation? = nil
        )
        end
      end

      # A request for the client to execute a specific tool with given parameters.
      struct Call
        include JSON::Serializable

        # A unique identifier for this tool call, used to match results back to requests.
        @[JSON::Field(key: "callId")]
        getter call_id : String

        # The input parameters for the tool call, formatted according to the tool's schema.
        @[JSON::Field(key: "input")]
        getter input : Types::SensitiveDocument

        # The name of the tool to invoke, following the pattern 'tool.{toolName}' or
        # 'browser.{browserAction}'.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @call_id : String,
          @input : Types::SensitiveDocument,
          @name : String
        )
        end
      end

      # The result returned from executing a tool call.
      struct CallResult
        include JSON::Serializable

        # The content returned by the tool execution, which can include text or other media types.
        @[JSON::Field(key: "content")]
        getter content : Array(Types::CallResultContent)

        # The identifier of the tool call that this result corresponds to.
        @[JSON::Field(key: "callId")]
        getter call_id : String?

        def initialize(
          @content : Array(Types::CallResultContent),
          @call_id : String? = nil
        )
        end
      end

      # Content returned from a tool call execution.
      struct CallResultContent
        include JSON::Serializable

        # Text content returned from the tool execution.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Information about the client making API requests, used for compatibility checking.
      struct ClientInfo
        include JSON::Serializable

        # The compatibility version of the client, used to ensure API compatibility.
        @[JSON::Field(key: "compatibilityVersion")]
        getter compatibility_version : Int32

        # The version of the SDK being used by the client.
        @[JSON::Field(key: "sdkVersion")]
        getter sdk_version : String?

        def initialize(
          @compatibility_version : Int32,
          @sdk_version : String? = nil
        )
        end
      end

      # Information about client compatibility and supported model versions.
      struct CompatibilityInformation
        include JSON::Serializable

        # The client compatibility version that was requested.
        @[JSON::Field(key: "clientCompatibilityVersion")]
        getter client_compatibility_version : Int32

        # A list of model IDs that are supported for the client compatibility version.
        @[JSON::Field(key: "supportedModelIds")]
        getter supported_model_ids : Array(String)

        # Additional information about compatibility requirements or recommendations.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @client_compatibility_version : Int32,
          @supported_model_ids : Array(String),
          @message : String? = nil
        )
        end
      end

      # The request could not be completed due to a conflict with the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        # The requested operation conflicts with the current state of the resource.
        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that caused the conflict.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that caused the conflict.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct CreateActRequest
        include JSON::Serializable

        # The unique identifier of the session to create the act in.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The task description that defines what the act should accomplish.
        @[JSON::Field(key: "task")]
        getter task : String

        # The name of the workflow definition containing the session.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run containing the session.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of tool specifications that the act can invoke to complete its task.
        @[JSON::Field(key: "toolSpecs")]
        getter tool_specs : Array(Types::ToolSpec)?

        def initialize(
          @session_id : String,
          @task : String,
          @workflow_definition_name : String,
          @workflow_run_id : String,
          @client_token : String? = nil,
          @tool_specs : Array(Types::ToolSpec)? = nil
        )
        end
      end

      struct CreateActResponse
        include JSON::Serializable

        # The unique identifier for the created act.
        @[JSON::Field(key: "actId")]
        getter act_id : String

        # The initial status of the act after creation.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @act_id : String,
          @status : String
        )
        end
      end

      struct CreateSessionRequest
        include JSON::Serializable

        # The name of the workflow definition containing the workflow run.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run to create the session in.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @workflow_definition_name : String,
          @workflow_run_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateSessionResponse
        include JSON::Serializable

        # The unique identifier for the created session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end

      struct CreateWorkflowDefinitionRequest
        include JSON::Serializable

        # The name of the workflow definition. Must be unique within your account and region.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional description of the workflow definition's purpose and functionality.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Configuration for exporting workflow execution data to Amazon Simple Storage Service.
        @[JSON::Field(key: "exportConfig")]
        getter export_config : Types::WorkflowExportConfig?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @export_config : Types::WorkflowExportConfig? = nil
        )
        end
      end

      struct CreateWorkflowDefinitionResponse
        include JSON::Serializable

        # The current status of the workflow definition after creation.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct CreateWorkflowRunRequest
        include JSON::Serializable

        # Information about the client making the request, including compatibility version and SDK version.
        @[JSON::Field(key: "clientInfo")]
        getter client_info : Types::ClientInfo

        # The ID of the AI model to use for workflow execution.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The name of the workflow definition to execute.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The CloudWatch log group name for storing workflow execution logs.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        def initialize(
          @client_info : Types::ClientInfo,
          @model_id : String,
          @workflow_definition_name : String,
          @client_token : String? = nil,
          @log_group_name : String? = nil
        )
        end
      end

      struct CreateWorkflowRunResponse
        include JSON::Serializable

        # The initial status of the workflow run after creation.
        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier for the created workflow run.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        def initialize(
          @status : String,
          @workflow_run_id : String
        )
        end
      end

      struct DeleteWorkflowDefinitionRequest
        include JSON::Serializable

        # The name of the workflow definition to delete.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        def initialize(
          @workflow_definition_name : String
        )
        end
      end

      struct DeleteWorkflowDefinitionResponse
        include JSON::Serializable

        # The status of the workflow definition after deletion request.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct DeleteWorkflowRunRequest
        include JSON::Serializable

        # The name of the workflow definition containing the workflow run.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run to delete.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        def initialize(
          @workflow_definition_name : String,
          @workflow_run_id : String
        )
        end
      end

      struct DeleteWorkflowRunResponse
        include JSON::Serializable

        # The status of the workflow run after deletion request.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct GetWorkflowDefinitionRequest
        include JSON::Serializable

        # The name of the workflow definition to retrieve.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        def initialize(
          @workflow_definition_name : String
        )
        end
      end

      struct GetWorkflowDefinitionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow definition.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp when the workflow definition was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the workflow definition.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the workflow definition.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the workflow definition.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The export configuration for the workflow definition.
        @[JSON::Field(key: "exportConfig")]
        getter export_config : Types::WorkflowExportConfig?

        def initialize(
          @arn : String,
          @created_at : Time,
          @name : String,
          @status : String,
          @description : String? = nil,
          @export_config : Types::WorkflowExportConfig? = nil
        )
        end
      end

      struct GetWorkflowRunRequest
        include JSON::Serializable

        # The name of the workflow definition containing the workflow run.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run to retrieve.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        def initialize(
          @workflow_definition_name : String,
          @workflow_run_id : String
        )
        end
      end

      struct GetWorkflowRunResponse
        include JSON::Serializable

        # The ID of the AI model being used for this workflow run.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The timestamp when the workflow run started execution.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The current execution status of the workflow run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the workflow run.
        @[JSON::Field(key: "workflowRunArn")]
        getter workflow_run_arn : String

        # The unique identifier of the workflow run.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # The timestamp when the workflow run completed execution, if applicable.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The CloudWatch log group name for this workflow run's logs.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        def initialize(
          @model_id : String,
          @started_at : Time,
          @status : String,
          @workflow_run_arn : String,
          @workflow_run_id : String,
          @ended_at : Time? = nil,
          @log_group_name : String? = nil
        )
        end
      end

      # An internal server error occurred. Please try again later.
      struct InternalServerException
        include JSON::Serializable

        # The service encountered an internal error. Try again later.
        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the internal server error.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The number of seconds to wait before retrying the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @reason : String? = nil,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct InvokeActStepRequest
        include JSON::Serializable

        # The unique identifier of the act to invoke the next step for.
        @[JSON::Field(key: "actId")]
        getter act_id : String

        # The results from previous tool calls that the act requested.
        @[JSON::Field(key: "callResults")]
        getter call_results : Array(Types::CallResult)

        # The unique identifier of the session containing the act.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The name of the workflow definition containing the act.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run containing the act.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # The identifier of the previous step, used for tracking execution flow.
        @[JSON::Field(key: "previousStepId")]
        getter previous_step_id : String?

        def initialize(
          @act_id : String,
          @call_results : Array(Types::CallResult),
          @session_id : String,
          @workflow_definition_name : String,
          @workflow_run_id : String,
          @previous_step_id : String? = nil
        )
        end
      end

      struct InvokeActStepResponse
        include JSON::Serializable

        # A list of tool calls that the act wants to execute in this step.
        @[JSON::Field(key: "calls")]
        getter calls : Array(Types::Call)

        # The unique identifier for this execution step.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        def initialize(
          @calls : Array(Types::Call),
          @step_id : String
        )
        end
      end

      struct ListActsRequest
        include JSON::Serializable

        # The name of the workflow definition containing the session.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The maximum number of acts to return in a single response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The unique identifier of the session to list acts for.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The sort order for the returned acts (ascending or descending).
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # The unique identifier of the workflow run containing the session.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String?

        def initialize(
          @workflow_definition_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @session_id : String? = nil,
          @sort_order : String? = nil,
          @workflow_run_id : String? = nil
        )
        end
      end

      struct ListActsResponse
        include JSON::Serializable

        # A list of summary information for acts in the session.
        @[JSON::Field(key: "actSummaries")]
        getter act_summaries : Array(Types::ActSummary)

        # The token for retrieving the next page of results, if available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @act_summaries : Array(Types::ActSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListModelsRequest
        include JSON::Serializable

        # The client compatibility version to filter models by compatibility.
        @[JSON::Field(key: "clientCompatibilityVersion")]
        getter client_compatibility_version : Int32

        def initialize(
          @client_compatibility_version : Int32
        )
        end
      end

      struct ListModelsResponse
        include JSON::Serializable

        # Information about client compatibility and supported models.
        @[JSON::Field(key: "compatibilityInformation")]
        getter compatibility_information : Types::CompatibilityInformation

        # A list of model aliases that provide stable references to model versions.
        @[JSON::Field(key: "modelAliases")]
        getter model_aliases : Array(Types::ModelAlias)

        # A list of available AI models with their status and compatibility information.
        @[JSON::Field(key: "modelSummaries")]
        getter model_summaries : Array(Types::ModelSummary)

        def initialize(
          @compatibility_information : Types::CompatibilityInformation,
          @model_aliases : Array(Types::ModelAlias),
          @model_summaries : Array(Types::ModelSummary)
        )
        end
      end

      struct ListSessionsRequest
        include JSON::Serializable

        # The name of the workflow definition containing the workflow run.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run to list sessions for.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # The maximum number of sessions to return in a single response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort order for the returned sessions (ascending or descending).
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @workflow_definition_name : String,
          @workflow_run_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListSessionsResponse
        include JSON::Serializable

        # A list of summary information for sessions in the workflow run.
        @[JSON::Field(key: "sessionSummaries")]
        getter session_summaries : Array(Types::SessionSummary)

        # The token for retrieving the next page of results, if available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @session_summaries : Array(Types::SessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowDefinitionsRequest
        include JSON::Serializable

        # The maximum number of workflow definitions to return in a single response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort order for the returned workflow definitions (ascending or descending).
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListWorkflowDefinitionsResponse
        include JSON::Serializable

        # A list of summary information for workflow definitions.
        @[JSON::Field(key: "workflowDefinitionSummaries")]
        getter workflow_definition_summaries : Array(Types::WorkflowDefinitionSummary)

        # The token for retrieving the next page of results, if available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_definition_summaries : Array(Types::WorkflowDefinitionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowRunsRequest
        include JSON::Serializable

        # The name of the workflow definition to list workflow runs for.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The maximum number of workflow runs to return in a single response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort order for the returned workflow runs (ascending or descending).
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @workflow_definition_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListWorkflowRunsResponse
        include JSON::Serializable

        # A list of summary information for workflow runs.
        @[JSON::Field(key: "workflowRunSummaries")]
        getter workflow_run_summaries : Array(Types::WorkflowRunSummary)

        # The token for retrieving the next page of results, if available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_run_summaries : Array(Types::WorkflowRunSummary),
          @next_token : String? = nil
        )
        end
      end

      # An alias that provides a stable reference to a model version.
      struct ModelAlias
        include JSON::Serializable

        # The name of the model alias.
        @[JSON::Field(key: "aliasName")]
        getter alias_name : String

        # The model ID that this alias currently points to.
        @[JSON::Field(key: "latestModelId")]
        getter latest_model_id : String

        # The resolved model ID after alias resolution.
        @[JSON::Field(key: "resolvedModelId")]
        getter resolved_model_id : String?

        def initialize(
          @alias_name : String,
          @latest_model_id : String,
          @resolved_model_id : String? = nil
        )
        end
      end

      # Lifecycle information for an AI model.
      struct ModelLifecycle
        include JSON::Serializable

        # The current lifecycle status of the model.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Summary information about an available AI model.
      struct ModelSummary
        include JSON::Serializable

        # The minimum client compatibility version required to use this model.
        @[JSON::Field(key: "minimumCompatibilityVersion")]
        getter minimum_compatibility_version : Int32

        # The unique identifier of the model.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The lifecycle information for the model.
        @[JSON::Field(key: "modelLifecycle")]
        getter model_lifecycle : Types::ModelLifecycle

        def initialize(
          @minimum_compatibility_version : Int32,
          @model_id : String,
          @model_lifecycle : Types::ModelLifecycle
        )
        end
      end

      # The requested resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The specified resource was not found.
        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that wasn't found.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that wasn't found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct SensitiveDocument
        include JSON::Serializable

        def initialize
        end
      end

      # The request would exceed a service quota limit.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        # The request would exceed one or more service quotas for your account.
        @[JSON::Field(key: "message")]
        getter message : String

        # The code for the specific quota that was exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The identifier of the resource that exceeded the quota.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that exceeded the quota.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The service code for the quota that was exceeded.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      # Summary information about a session within a workflow run.
      struct SessionSummary
        include JSON::Serializable

        # The unique identifier of the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end

      # The request was throttled due to too many requests. Please try again later.
      struct ThrottlingException
        include JSON::Serializable

        # The request was denied due to request throttling.
        @[JSON::Field(key: "message")]
        getter message : String

        # The quota code related to the throttling.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds to wait before retrying the throttled request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The service code where throttling occurred.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      # The schema definition for tool input parameters.
      struct ToolInputSchema
        include JSON::Serializable

        # The JSON schema that defines the expected input format for the tool.
        @[JSON::Field(key: "json")]
        getter json : Types::ToolInputSchemaDocument?

        def initialize(
          @json : Types::ToolInputSchemaDocument? = nil
        )
        end
      end

      struct ToolInputSchemaDocument
        include JSON::Serializable

        def initialize
        end
      end

      # Specification for a tool that acts can invoke, including its name, description, and input schema.
      struct ToolSpec
        include JSON::Serializable

        # A description of what the tool does and how it should be used.
        @[JSON::Field(key: "description")]
        getter description : String

        # The JSON schema that defines the expected input format for the tool.
        @[JSON::Field(key: "inputSchema")]
        getter input_schema : Types::ToolInputSchema

        # The unique name of the tool that acts will use to invoke it.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @description : String,
          @input_schema : Types::ToolInputSchema,
          @name : String
        )
        end
      end

      # Information about where trace data is stored for debugging and monitoring.
      struct TraceLocation
        include JSON::Serializable

        # The specific location where the trace data is stored.
        @[JSON::Field(key: "location")]
        getter location : String

        # The type of storage location for the trace data.
        @[JSON::Field(key: "locationType")]
        getter location_type : String

        def initialize(
          @location : String,
          @location_type : String
        )
        end
      end

      struct UpdateActRequest
        include JSON::Serializable

        # The unique identifier of the act to update.
        @[JSON::Field(key: "actId")]
        getter act_id : String

        # The unique identifier of the session containing the act.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The new status to set for the act.
        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the workflow definition containing the act.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run containing the act.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # Error information to associate with the act, if applicable.
        @[JSON::Field(key: "error")]
        getter error : Types::ActError?

        def initialize(
          @act_id : String,
          @session_id : String,
          @status : String,
          @workflow_definition_name : String,
          @workflow_run_id : String,
          @error : Types::ActError? = nil
        )
        end
      end

      struct UpdateActResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateWorkflowRunRequest
        include JSON::Serializable

        # The new status to set for the workflow run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the workflow definition containing the workflow run.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        # The unique identifier of the workflow run to update.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        def initialize(
          @status : String,
          @workflow_definition_name : String,
          @workflow_run_id : String
        )
        end
      end

      struct UpdateWorkflowRunResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input parameters for the request are invalid.
      struct ValidationException
        include JSON::Serializable

        # The input fails to satisfy the constraints specified by the service.
        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the validation failure.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The list of fields that failed validation.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Information about a field that failed validation.
      struct ValidationExceptionField
        include JSON::Serializable

        # A description of the validation error for this field.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that failed validation.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Summary information about a workflow definition, used in list operations.
      struct WorkflowDefinitionSummary
        include JSON::Serializable

        # The timestamp when the workflow definition was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the workflow definition.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the workflow definition.
        @[JSON::Field(key: "workflowDefinitionArn")]
        getter workflow_definition_arn : String

        # The name of the workflow definition.
        @[JSON::Field(key: "workflowDefinitionName")]
        getter workflow_definition_name : String

        def initialize(
          @created_at : Time,
          @status : String,
          @workflow_definition_arn : String,
          @workflow_definition_name : String
        )
        end
      end

      # Configuration settings for exporting workflow execution data and logs to Amazon Simple Storage
      # Service (Amazon S3).
      struct WorkflowExportConfig
        include JSON::Serializable

        # The name of your Amazon S3 bucket, that Nova Act uses to export your workflow data. Note that the
        # IAM role used to access Nova Act must also have write permissions to this bucket.
        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String

        # An optional prefix for Amazon S3 object keys to organize exported data.
        @[JSON::Field(key: "s3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket_name : String,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # Summary information about a workflow run, including execution status and timing.
      struct WorkflowRunSummary
        include JSON::Serializable

        # The timestamp when the workflow run started execution.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The current execution status of the workflow run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the workflow run.
        @[JSON::Field(key: "workflowRunArn")]
        getter workflow_run_arn : String

        # The unique identifier of the workflow run.
        @[JSON::Field(key: "workflowRunId")]
        getter workflow_run_id : String

        # The timestamp when the workflow run completed execution, if applicable.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The location where trace information for this workflow run is stored.
        @[JSON::Field(key: "traceLocation")]
        getter trace_location : Types::TraceLocation?

        def initialize(
          @started_at : Time,
          @status : String,
          @workflow_run_arn : String,
          @workflow_run_id : String,
          @ended_at : Time? = nil,
          @trace_location : Types::TraceLocation? = nil
        )
        end
      end
    end
  end
end
