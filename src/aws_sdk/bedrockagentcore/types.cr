require "json"
require "time"

module AwsSdk
  module BedrockAgentCore
    module Types

      # The exception that occurs when you do not have sufficient permissions to perform an action. Verify
      # that your IAM policy includes the necessary permissions for the operation you are trying to perform.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains summary information about an actor in an AgentCore Memory resource.

      struct ActorSummary
        include JSON::Serializable

        # The unique identifier of the actor.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        def initialize(
          @actor_id : String
        )
        end
      end


      struct AgentCard
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration for a stream that enables programmatic control of a browser session in Amazon
      # Bedrock. This stream provides a bidirectional communication channel for sending commands to the
      # browser and receiving responses, allowing agents to automate web interactions such as navigation,
      # form filling, and element clicking.

      struct AutomationStream
        include JSON::Serializable

        # The endpoint URL for the automation stream. This URL is used to establish a WebSocket connection to
        # the stream for sending commands and receiving responses.

        @[JSON::Field(key: "streamEndpoint")]
        getter stream_endpoint : String

        # The current status of the automation stream. This indicates whether the stream is available for use.
        # Possible values include ACTIVE, CONNECTING, and DISCONNECTED.

        @[JSON::Field(key: "streamStatus")]
        getter stream_status : String

        def initialize(
          @stream_endpoint : String,
          @stream_status : String
        )
        end
      end

      # Contains information about an update to an automation stream.

      struct AutomationStreamUpdate
        include JSON::Serializable

        # The status of the automation stream.

        @[JSON::Field(key: "streamStatus")]
        getter stream_status : String?

        def initialize(
          @stream_status : String? = nil
        )
        end
      end


      struct BatchCreateMemoryRecordsInput
        include JSON::Serializable

        # The unique ID of the memory resource where records will be created.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # A list of memory record creation inputs to be processed in the batch operation.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::MemoryRecordCreateInput)

        # A unique, case-sensitive identifier to ensure idempotent processing of the batch request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @memory_id : String,
          @records : Array(Types::MemoryRecordCreateInput),
          @client_token : String? = nil
        )
        end
      end


      struct BatchCreateMemoryRecordsOutput
        include JSON::Serializable

        # A list of memory records that failed to be created, including error details for each failure.

        @[JSON::Field(key: "failedRecords")]
        getter failed_records : Array(Types::MemoryRecordOutput)

        # A list of memory records that were successfully created during the batch operation.

        @[JSON::Field(key: "successfulRecords")]
        getter successful_records : Array(Types::MemoryRecordOutput)

        def initialize(
          @failed_records : Array(Types::MemoryRecordOutput),
          @successful_records : Array(Types::MemoryRecordOutput)
        )
        end
      end


      struct BatchDeleteMemoryRecordsInput
        include JSON::Serializable

        # The unique ID of the memory resource where records will be deleted.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # A list of memory record deletion inputs to be processed in the batch operation.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::MemoryRecordDeleteInput)

        def initialize(
          @memory_id : String,
          @records : Array(Types::MemoryRecordDeleteInput)
        )
        end
      end


      struct BatchDeleteMemoryRecordsOutput
        include JSON::Serializable

        # A list of memory records that failed to be deleted, including error details for each failure.

        @[JSON::Field(key: "failedRecords")]
        getter failed_records : Array(Types::MemoryRecordOutput)

        # A list of memory records that were successfully deleted during the batch operation.

        @[JSON::Field(key: "successfulRecords")]
        getter successful_records : Array(Types::MemoryRecordOutput)

        def initialize(
          @failed_records : Array(Types::MemoryRecordOutput),
          @successful_records : Array(Types::MemoryRecordOutput)
        )
        end
      end


      struct BatchUpdateMemoryRecordsInput
        include JSON::Serializable

        # The unique ID of the memory resource where records will be updated.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # A list of memory record update inputs to be processed in the batch operation.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::MemoryRecordUpdateInput)

        def initialize(
          @memory_id : String,
          @records : Array(Types::MemoryRecordUpdateInput)
        )
        end
      end


      struct BatchUpdateMemoryRecordsOutput
        include JSON::Serializable

        # A list of memory records that failed to be updated, including error details for each failure.

        @[JSON::Field(key: "failedRecords")]
        getter failed_records : Array(Types::MemoryRecordOutput)

        # A list of memory records that were successfully updated during the batch operation.

        @[JSON::Field(key: "successfulRecords")]
        getter successful_records : Array(Types::MemoryRecordOutput)

        def initialize(
          @failed_records : Array(Types::MemoryRecordOutput),
          @successful_records : Array(Types::MemoryRecordOutput)
        )
        end
      end

      # Contains information about a branch in an AgentCore Memory resource. Branches allow for organizing
      # events into different conversation threads or paths.

      struct Branch
        include JSON::Serializable

        # The name of the branch.

        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the root event for this branch.

        @[JSON::Field(key: "rootEventId")]
        getter root_event_id : String?

        def initialize(
          @name : String,
          @root_event_id : String? = nil
        )
        end
      end

      # Contains filter criteria for branches when listing events.

      struct BranchFilter
        include JSON::Serializable

        # The name of the branch to filter by.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether to include parent branches in the results. Set to true to include parent branches,
        # or false to exclude them.

        @[JSON::Field(key: "includeParentBranches")]
        getter include_parent_branches : Bool?

        def initialize(
          @name : String,
          @include_parent_branches : Bool? = nil
        )
        end
      end

      # The collection of streams associated with a browser session in Amazon Bedrock. These streams provide
      # different ways to interact with and observe the browser session, including programmatic control and
      # visual representation of the browser content.

      struct BrowserSessionStream
        include JSON::Serializable

        # The stream that enables programmatic control of the browser. This stream allows agents to perform
        # actions such as navigating to URLs, clicking elements, and filling forms.

        @[JSON::Field(key: "automationStream")]
        getter automation_stream : Types::AutomationStream

        # The stream that provides a visual representation of the browser content. This stream allows agents
        # to observe the current state of the browser, including rendered web pages and visual elements.

        @[JSON::Field(key: "liveViewStream")]
        getter live_view_stream : Types::LiveViewStream?

        def initialize(
          @automation_stream : Types::AutomationStream,
          @live_view_stream : Types::LiveViewStream? = nil
        )
        end
      end

      # A condensed representation of a browser session in Amazon Bedrock. This structure contains key
      # information about a browser session, including identifiers, status, and timestamps, without the full
      # details of the session configuration and streams.

      struct BrowserSessionSummary
        include JSON::Serializable

        # The unique identifier of the browser associated with the session. This identifier specifies which
        # browser environment is used for the session.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The timestamp when the browser session was created. This value is in ISO 8601 format.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the browser session. This identifier is used in operations that interact
        # with the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The current status of the browser session. Possible values include ACTIVE, STOPPING, and STOPPED.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the browser session was last updated. This value is in ISO 8601 format.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the browser session. This name helps identify and manage the session.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @browser_identifier : String,
          @created_at : Time,
          @session_id : String,
          @status : String,
          @last_updated_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # The output produced by executing code in a code interpreter session in Amazon Bedrock. This
      # structure contains the results of code execution, including textual output, structured data, and
      # error information. Agents use these results to generate responses that incorporate computation, data
      # analysis, and visualization.

      struct CodeInterpreterResult
        include JSON::Serializable

        # The textual content of the execution result. This includes standard output from the code execution,
        # such as print statements, console output, and text representations of results.

        @[JSON::Field(key: "content")]
        getter content : Array(Types::ContentBlock)

        # Indicates whether the result represents an error. If true, the content contains error messages or
        # exception information. If false, the content contains successful execution results.

        @[JSON::Field(key: "isError")]
        getter is_error : Bool?

        # The structured content of the execution result. This includes additional metadata about the
        # execution, such as execution time, memory usage, and structured representations of output data. The
        # format depends on the specific code interpreter and execution context.

        @[JSON::Field(key: "structuredContent")]
        getter structured_content : Types::ToolResultStructuredContent?

        def initialize(
          @content : Array(Types::ContentBlock),
          @is_error : Bool? = nil,
          @structured_content : Types::ToolResultStructuredContent? = nil
        )
        end
      end

      # A condensed representation of a code interpreter session in Amazon Bedrock. This structure contains
      # key information about a code interpreter session, including identifiers, status, and timestamps,
      # without the full details of the session configuration.

      struct CodeInterpreterSessionSummary
        include JSON::Serializable

        # The unique identifier of the code interpreter associated with the session. This identifier specifies
        # which code interpreter environment is used for the session.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The timestamp when the code interpreter session was created. This value is in ISO 8601 format.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the code interpreter session. This identifier is used in operations that
        # interact with the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The current status of the code interpreter session. Possible values include ACTIVE, STOPPING, and
        # STOPPED.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the code interpreter session was last updated. This value is in ISO 8601 format.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the code interpreter session. This name helps identify and manage the session.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code_interpreter_identifier : String,
          @created_at : Time,
          @session_id : String,
          @status : String,
          @last_updated_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains output from a code interpreter stream.

      struct CodeInterpreterStreamOutput
        include JSON::Serializable


        @[JSON::Field(key: "accessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?


        @[JSON::Field(key: "conflictException")]
        getter conflict_exception : Types::ConflictException?


        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?


        @[JSON::Field(key: "resourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?


        @[JSON::Field(key: "result")]
        getter result : Types::CodeInterpreterResult?


        @[JSON::Field(key: "serviceQuotaExceededException")]
        getter service_quota_exceeded_exception : Types::ServiceQuotaExceededException?


        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?


        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil,
          @result : Types::CodeInterpreterResult? = nil,
          @service_quota_exceeded_exception : Types::ServiceQuotaExceededException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end


      struct CompleteResourceTokenAuthRequest
        include JSON::Serializable

        # Unique identifier for the user's authentication session for retrieving OAuth2 tokens. This ID tracks
        # the authorization flow state across multiple requests and responses during the OAuth2 authentication
        # process.

        @[JSON::Field(key: "sessionUri")]
        getter session_uri : String

        # The OAuth2.0 token or user ID that was used to generate the workload access token used for
        # initiating the user authorization flow to retrieve OAuth2.0 tokens.

        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : Types::UserIdentifier

        def initialize(
          @session_uri : String,
          @user_identifier : Types::UserIdentifier
        )
        end
      end


      struct CompleteResourceTokenAuthResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The exception that occurs when the request conflicts with the current state of the resource. This
      # can happen when trying to modify a resource that is currently being modified by another request, or
      # when trying to create a resource that already exists.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the content of a memory item.

      struct Content
        include JSON::Serializable

        # The text content of the memory item.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # A block of content in a response.

      struct ContentBlock
        include JSON::Serializable

        # The type of content in the block.

        @[JSON::Field(key: "type")]
        getter type : String

        # The binary data content of the block.

        @[JSON::Field(key: "data")]
        getter data : Bytes?

        # The description of the content block.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The MIME type of the content.

        @[JSON::Field(key: "mimeType")]
        getter mime_type : String?

        # The name of the content block.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The resource associated with the content block.

        @[JSON::Field(key: "resource")]
        getter resource : Types::ResourceContent?

        # The size of the content in bytes.

        @[JSON::Field(key: "size")]
        getter size : Int64?

        # The text content of the block.

        @[JSON::Field(key: "text")]
        getter text : String?

        # The URI of the content.

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @type : String,
          @data : Bytes? = nil,
          @description : String? = nil,
          @mime_type : String? = nil,
          @name : String? = nil,
          @resource : Types::ResourceContent? = nil,
          @size : Int64? = nil,
          @text : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # The contextual information associated with an evaluation, including span context details that
      # identify the specific traces and sessions being evaluated within the agent's execution flow.

      struct Context
        include JSON::Serializable

        # The span context information that uniquely identifies the trace and span being evaluated, including
        # session ID, trace ID, and span ID for precise targeting within the agent's execution flow.

        @[JSON::Field(key: "spanContext")]
        getter span_context : Types::SpanContext?

        def initialize(
          @span_context : Types::SpanContext? = nil
        )
        end
      end

      # Contains conversational content for an event payload.

      struct Conversational
        include JSON::Serializable

        # The content of the conversation message.

        @[JSON::Field(key: "content")]
        getter content : Types::Content

        # The role of the participant in the conversation (for example, "user" or "assistant").

        @[JSON::Field(key: "role")]
        getter role : String

        def initialize(
          @content : Types::Content,
          @role : String
        )
        end
      end


      struct CreateEventInput
        include JSON::Serializable

        # The identifier of the actor associated with this event. An actor represents an entity that
        # participates in sessions and generates events.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        # The timestamp when the event occurred. If not specified, the current time is used.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time

        # The identifier of the AgentCore Memory resource in which to create the event.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The content payload of the event. This can include conversational data or binary content.

        @[JSON::Field(key: "payload")]
        getter payload : Array(Types::PayloadType)

        # The branch information for this event. Branches allow for organizing events into different
        # conversation threads or paths.

        @[JSON::Field(key: "branch")]
        getter branch : Types::Branch?

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, AgentCore ignores the request, but does not return an error.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The key-value metadata to attach to the event.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, Types::MetadataValue)?

        # The identifier of the session in which this event occurs. A session represents a sequence of related
        # events.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @actor_id : String,
          @event_timestamp : Time,
          @memory_id : String,
          @payload : Array(Types::PayloadType),
          @branch : Types::Branch? = nil,
          @client_token : String? = nil,
          @metadata : Hash(String, Types::MetadataValue)? = nil,
          @session_id : String? = nil
        )
        end
      end


      struct CreateEventOutput
        include JSON::Serializable

        # The event that was created.

        @[JSON::Field(key: "event")]
        getter event : Types::Event

        def initialize(
          @event : Types::Event
        )
        end
      end


      struct DeleteEventInput
        include JSON::Serializable

        # The identifier of the actor associated with the event to delete.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        # The identifier of the event to delete.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The identifier of the AgentCore Memory resource from which to delete the event.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The identifier of the session containing the event to delete.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @actor_id : String,
          @event_id : String,
          @memory_id : String,
          @session_id : String
        )
        end
      end


      struct DeleteEventOutput
        include JSON::Serializable

        # The identifier of the event that was deleted.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        def initialize(
          @event_id : String
        )
        end
      end


      struct DeleteMemoryRecordInput
        include JSON::Serializable

        # The identifier of the AgentCore Memory resource from which to delete the memory record.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The identifier of the memory record to delete.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        def initialize(
          @memory_id : String,
          @memory_record_id : String
        )
        end
      end


      struct DeleteMemoryRecordOutput
        include JSON::Serializable

        # The identifier of the memory record that was deleted.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        def initialize(
          @memory_record_id : String
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # An exception thrown when attempting to create a resource with an identifier that already exists.

      struct DuplicateIdException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct EvaluateRequest
        include JSON::Serializable

        # The input data containing agent session spans to be evaluated. Includes a list of spans in
        # OpenTelemetry format from supported frameworks like Strands (AgentCore Runtime) or LangGraph with
        # OpenInference instrumentation.

        @[JSON::Field(key: "evaluationInput")]
        getter evaluation_input : Types::EvaluationInput

        # The unique identifier of the evaluator to use for scoring. Can be a built-in evaluator (e.g.,
        # Builtin.Helpfulness , Builtin.Correctness ) or a custom evaluator ARN created through the control
        # plane API.

        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # The specific trace or span IDs to evaluate within the provided input. Allows targeting evaluation at
        # different levels: individual tool calls, single request-response interactions (traces), or entire
        # conversation sessions.

        @[JSON::Field(key: "evaluationTarget")]
        getter evaluation_target : Types::EvaluationTarget?

        def initialize(
          @evaluation_input : Types::EvaluationInput,
          @evaluator_id : String,
          @evaluation_target : Types::EvaluationTarget? = nil
        )
        end
      end


      struct EvaluateResponse
        include JSON::Serializable

        # The detailed evaluation results containing scores, explanations, and metadata. Includes the
        # evaluator information, numerical or categorical ratings based on the evaluator's rating scale, and
        # token usage statistics for the evaluation process.

        @[JSON::Field(key: "evaluationResults")]
        getter evaluation_results : Array(Types::EvaluationResultContent)

        def initialize(
          @evaluation_results : Array(Types::EvaluationResultContent)
        )
        end
      end

      # The input data structure containing agent session spans in OpenTelemetry format. Supports traces
      # from frameworks like Strands (AgentCore Runtime) and LangGraph with OpenInference instrumentation
      # for comprehensive evaluation.

      struct EvaluationInput
        include JSON::Serializable

        # The collection of spans representing agent execution traces within a session. Each span contains
        # detailed information about tool calls, model interactions, and other agent activities that can be
        # evaluated for quality and performance.

        @[JSON::Field(key: "sessionSpans")]
        getter session_spans : Array(Types::Span)?

        def initialize(
          @session_spans : Array(Types::Span)? = nil
        )
        end
      end

      # The comprehensive result of an evaluation containing the score, explanation, evaluator metadata, and
      # execution details. Provides both quantitative ratings and qualitative insights about agent
      # performance.

      struct EvaluationResultContent
        include JSON::Serializable

        # The contextual information associated with this evaluation result, including span context details
        # that identify the specific traces and sessions that were evaluated.

        @[JSON::Field(key: "context")]
        getter context : Types::Context

        # The Amazon Resource Name (ARN) of the evaluator used to generate this result. For custom evaluators,
        # this is the full ARN; for built-in evaluators, this follows the pattern Builtin.{EvaluatorName} .

        @[JSON::Field(key: "evaluatorArn")]
        getter evaluator_arn : String

        # The unique identifier of the evaluator that produced this result. This matches the evaluatorId
        # provided in the evaluation request and can be used to identify which evaluator generated specific
        # results.

        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # The human-readable name of the evaluator used for this evaluation. For built-in evaluators, this is
        # the descriptive name (e.g., "Helpfulness", "Correctness"); for custom evaluators, this is the
        # user-defined name.

        @[JSON::Field(key: "evaluatorName")]
        getter evaluator_name : String

        # The error code indicating the type of failure that occurred during evaluation. Used to
        # programmatically identify and handle different categories of evaluation errors.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message describing what went wrong if the evaluation failed. Provides detailed information
        # about evaluation failures to help diagnose and resolve issues with evaluator configuration or input
        # data.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The detailed explanation provided by the evaluator describing the reasoning behind the assigned
        # score. This qualitative feedback helps understand why specific ratings were given and provides
        # actionable insights for improvement.

        @[JSON::Field(key: "explanation")]
        getter explanation : String?

        # The categorical label assigned by the evaluator when using a categorical rating scale. This provides
        # a human-readable description of the evaluation result (e.g., "Excellent", "Good", "Poor")
        # corresponding to the numerical value. For numerical scales, this field is optional and provides a
        # natural language explanation of what the value means (e.g., value 0.5 = "Somewhat Helpful").

        @[JSON::Field(key: "label")]
        getter label : String?

        # The token consumption statistics for this evaluation, including input tokens, output tokens, and
        # total tokens used by the underlying language model during the evaluation process.

        @[JSON::Field(key: "tokenUsage")]
        getter token_usage : Types::TokenUsage?

        # The numerical score assigned by the evaluator according to its configured rating scale. For
        # numerical scales, this is a decimal value within the defined range. This field is not allowed for
        # categorical scales.

        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @context : Types::Context,
          @evaluator_arn : String,
          @evaluator_id : String,
          @evaluator_name : String,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @explanation : String? = nil,
          @label : String? = nil,
          @token_usage : Types::TokenUsage? = nil,
          @value : Float64? = nil
        )
        end
      end

      # The specification of which trace or span IDs to evaluate within the provided input data. Allows
      # precise targeting of evaluation at different levels: tool calls, traces, or sessions.

      struct EvaluationTarget
        include JSON::Serializable

        # The list of specific span IDs to evaluate within the provided traces. Used to target evaluation at
        # individual tool calls or specific operations within the agent's execution flow.

        @[JSON::Field(key: "spanIds")]
        getter span_ids : Array(String)?

        # The list of trace IDs to evaluate, representing complete request-response interactions. Used to
        # evaluate entire conversation turns or specific agent interactions within a session.

        @[JSON::Field(key: "traceIds")]
        getter trace_ids : Array(String)?

        def initialize(
          @span_ids : Array(String)? = nil,
          @trace_ids : Array(String)? = nil
        )
        end
      end

      # Contains information about an event in an AgentCore Memory resource.

      struct Event
        include JSON::Serializable

        # The identifier of the actor associated with the event.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        # The unique identifier of the event.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The timestamp when the event occurred.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time

        # The identifier of the AgentCore Memory resource containing the event.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The content payload of the event.

        @[JSON::Field(key: "payload")]
        getter payload : Array(Types::PayloadType)

        # The identifier of the session containing the event.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The branch information for the event.

        @[JSON::Field(key: "branch")]
        getter branch : Types::Branch?

        # Metadata associated with an event.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, Types::MetadataValue)?

        def initialize(
          @actor_id : String,
          @event_id : String,
          @event_timestamp : Time,
          @memory_id : String,
          @payload : Array(Types::PayloadType),
          @session_id : String,
          @branch : Types::Branch? = nil,
          @metadata : Hash(String, Types::MetadataValue)? = nil
        )
        end
      end

      # Filter expression for retrieving events based on metadata associated with an event.

      struct EventMetadataFilterExpression
        include JSON::Serializable

        # Left operand of the event metadata filter expression.

        @[JSON::Field(key: "left")]
        getter left : Types::LeftExpression

        # Operator applied to the event metadata filter expression.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # Right operand of the event metadata filter expression.

        @[JSON::Field(key: "right")]
        getter right : Types::RightExpression?

        def initialize(
          @left : Types::LeftExpression,
          @operator : String,
          @right : Types::RightExpression? = nil
        )
        end
      end

      # Represents the metadata of a memory extraction job such as the message identifiers that compose this
      # job.

      struct ExtractionJob
        include JSON::Serializable

        # The unique identifier of the extraction job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # Filters for querying memory extraction jobs based on various criteria.

      struct ExtractionJobFilterInput
        include JSON::Serializable

        # The identifier of the actor. If specified, only extraction jobs with this actor ID are returned.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String?

        # The unique identifier of the session. If specified, only extraction jobs with this session ID are
        # returned.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The status of the extraction job. If specified, only extraction jobs with this status are returned.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The memory strategy identifier to filter extraction jobs by. If specified, only extraction jobs with
        # this strategy ID are returned.

        @[JSON::Field(key: "strategyId")]
        getter strategy_id : String?

        def initialize(
          @actor_id : String? = nil,
          @session_id : String? = nil,
          @status : String? = nil,
          @strategy_id : String? = nil
        )
        end
      end

      # The list of messages that compose this extraction job.

      struct ExtractionJobMessages
        include JSON::Serializable

        # The list of messages that compose this extraction job.

        @[JSON::Field(key: "messagesList")]
        getter messages_list : Array(Types::MessageMetadata)?

        def initialize(
          @messages_list : Array(Types::MessageMetadata)? = nil
        )
        end
      end

      # Metadata information associated with this extraction job.

      struct ExtractionJobMetadata
        include JSON::Serializable

        # The unique identifier for the extraction job.

        @[JSON::Field(key: "jobID")]
        getter job_id : String

        # The messages associated with the extraction job.

        @[JSON::Field(key: "messages")]
        getter messages : Types::ExtractionJobMessages

        # The identifier of the actor for this extraction job.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String?

        # The cause of failure, if the job did not complete successfully.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The identifier of the session for this extraction job.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The current status of the extraction job.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The identifier of the memory strategy for this extraction job.

        @[JSON::Field(key: "strategyId")]
        getter strategy_id : String?

        def initialize(
          @job_id : String,
          @messages : Types::ExtractionJobMessages,
          @actor_id : String? = nil,
          @failure_reason : String? = nil,
          @session_id : String? = nil,
          @status : String? = nil,
          @strategy_id : String? = nil
        )
        end
      end

      # Contains filter criteria for listing events.

      struct FilterInput
        include JSON::Serializable

        # The branch filter criteria to apply when listing events.

        @[JSON::Field(key: "branch")]
        getter branch : Types::BranchFilter?

        # Event metadata filter criteria to apply when retrieving events.

        @[JSON::Field(key: "eventMetadata")]
        getter event_metadata : Array(Types::EventMetadataFilterExpression)?

        def initialize(
          @branch : Types::BranchFilter? = nil,
          @event_metadata : Array(Types::EventMetadataFilterExpression)? = nil
        )
        end
      end


      struct GetAgentCardRequest
        include JSON::Serializable

        # The ARN of the AgentCore Runtime agent for which you want to get the A2A agent card.

        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # Optional qualifier to specify an agent alias, such as prod code&gt; or dev . If you don't provide a
        # value, the DEFAULT alias is used.

        @[JSON::Field(key: "qualifier")]
        getter qualifier : String?

        # The session ID that the AgentCore Runtime agent is using.

        @[JSON::Field(key: "X-Amzn-Bedrock-AgentCore-Runtime-Session-Id")]
        getter runtime_session_id : String?

        def initialize(
          @agent_runtime_arn : String,
          @qualifier : String? = nil,
          @runtime_session_id : String? = nil
        )
        end
      end


      struct GetAgentCardResponse
        include JSON::Serializable

        # An agent card document that contains metadata and capabilities for an AgentCore Runtime agent.

        @[JSON::Field(key: "agentCard")]
        getter agent_card : Types::AgentCard

        # The ID of the session associated with the AgentCore Runtime agent.

        @[JSON::Field(key: "X-Amzn-Bedrock-AgentCore-Runtime-Session-Id")]
        getter runtime_session_id : String?

        # The status code of the request.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @agent_card : Types::AgentCard,
          @runtime_session_id : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct GetBrowserSessionRequest
        include JSON::Serializable

        # The unique identifier of the browser associated with the session.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The unique identifier of the browser session to retrieve.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @browser_identifier : String,
          @session_id : String
        )
        end
      end


      struct GetBrowserSessionResponse
        include JSON::Serializable

        # The identifier of the browser.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The time at which the browser session was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The identifier of the browser session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The time at which the browser session was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the browser session.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The artifact containing the session replay information.

        @[JSON::Field(key: "sessionReplayArtifact")]
        getter session_replay_artifact : String?

        # The timeout period for the browser session in seconds.

        @[JSON::Field(key: "sessionTimeoutSeconds")]
        getter session_timeout_seconds : Int32?

        # The current status of the browser session. Possible values include ACTIVE, STOPPING, and STOPPED.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The streams associated with this browser session. These include the automation stream and live view
        # stream.

        @[JSON::Field(key: "streams")]
        getter streams : Types::BrowserSessionStream?


        @[JSON::Field(key: "viewPort")]
        getter view_port : Types::ViewPort?

        def initialize(
          @browser_identifier : String,
          @created_at : Time,
          @session_id : String,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @session_replay_artifact : String? = nil,
          @session_timeout_seconds : Int32? = nil,
          @status : String? = nil,
          @streams : Types::BrowserSessionStream? = nil,
          @view_port : Types::ViewPort? = nil
        )
        end
      end


      struct GetCodeInterpreterSessionRequest
        include JSON::Serializable

        # The unique identifier of the code interpreter associated with the session.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The unique identifier of the code interpreter session to retrieve.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @code_interpreter_identifier : String,
          @session_id : String
        )
        end
      end


      struct GetCodeInterpreterSessionResponse
        include JSON::Serializable

        # The identifier of the code interpreter.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The time at which the code interpreter session was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The identifier of the code interpreter session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The name of the code interpreter session.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The timeout period for the code interpreter session in seconds.

        @[JSON::Field(key: "sessionTimeoutSeconds")]
        getter session_timeout_seconds : Int32?

        # The current status of the code interpreter session. Possible values include ACTIVE, STOPPING, and
        # STOPPED.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @code_interpreter_identifier : String,
          @created_at : Time,
          @session_id : String,
          @name : String? = nil,
          @session_timeout_seconds : Int32? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetEventInput
        include JSON::Serializable

        # The identifier of the actor associated with the event.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        # The identifier of the event to retrieve.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The identifier of the AgentCore Memory resource containing the event.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The identifier of the session containing the event.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @actor_id : String,
          @event_id : String,
          @memory_id : String,
          @session_id : String
        )
        end
      end


      struct GetEventOutput
        include JSON::Serializable

        # The requested event information.

        @[JSON::Field(key: "event")]
        getter event : Types::Event

        def initialize(
          @event : Types::Event
        )
        end
      end


      struct GetMemoryRecordInput
        include JSON::Serializable

        # The identifier of the AgentCore Memory resource containing the memory record.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The identifier of the memory record to retrieve.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        def initialize(
          @memory_id : String,
          @memory_record_id : String
        )
        end
      end


      struct GetMemoryRecordOutput
        include JSON::Serializable

        # The requested memory record.

        @[JSON::Field(key: "memoryRecord")]
        getter memory_record : Types::MemoryRecord

        def initialize(
          @memory_record : Types::MemoryRecord
        )
        end
      end


      struct GetResourceApiKeyRequest
        include JSON::Serializable

        # The credential provider name for the resource from which you are retrieving the API key.

        @[JSON::Field(key: "resourceCredentialProviderName")]
        getter resource_credential_provider_name : String

        # The identity token of the workload from which you want to retrieve the API key.

        @[JSON::Field(key: "workloadIdentityToken")]
        getter workload_identity_token : String

        def initialize(
          @resource_credential_provider_name : String,
          @workload_identity_token : String
        )
        end
      end


      struct GetResourceApiKeyResponse
        include JSON::Serializable

        # The API key associated with the resource requested.

        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        def initialize(
          @api_key : String
        )
        end
      end


      struct GetResourceOauth2TokenRequest
        include JSON::Serializable

        # The type of flow to be performed.

        @[JSON::Field(key: "oauth2Flow")]
        getter oauth2_flow : String

        # The name of the resource's credential provider.

        @[JSON::Field(key: "resourceCredentialProviderName")]
        getter resource_credential_provider_name : String

        # The OAuth scopes being requested.

        @[JSON::Field(key: "scopes")]
        getter scopes : Array(String)

        # The identity token of the workload from which you want to retrieve the OAuth2 token.

        @[JSON::Field(key: "workloadIdentityToken")]
        getter workload_identity_token : String

        # A map of custom parameters to include in the authorization request to the resource credential
        # provider. These parameters are in addition to the standard OAuth 2.0 flow parameters, and will not
        # override them.

        @[JSON::Field(key: "customParameters")]
        getter custom_parameters : Hash(String, String)?

        # An opaque string that will be sent back to the callback URL provided in resourceOauth2ReturnUrl.
        # This state should be used to protect the callback URL of your application against CSRF attacks by
        # ensuring the response corresponds to the original request.

        @[JSON::Field(key: "customState")]
        getter custom_state : String?

        # Indicates whether to always initiate a new three-legged OAuth (3LO) flow, regardless of any existing
        # session.

        @[JSON::Field(key: "forceAuthentication")]
        getter force_authentication : Bool?

        # The callback URL to redirect to after the OAuth 2.0 token retrieval is complete. This URL must be
        # one of the provided URLs configured for the workload identity.

        @[JSON::Field(key: "resourceOauth2ReturnUrl")]
        getter resource_oauth2_return_url : String?

        # Unique identifier for the user's authentication session for retrieving OAuth2 tokens. This ID tracks
        # the authorization flow state across multiple requests and responses during the OAuth2 authentication
        # process.

        @[JSON::Field(key: "sessionUri")]
        getter session_uri : String?

        def initialize(
          @oauth2_flow : String,
          @resource_credential_provider_name : String,
          @scopes : Array(String),
          @workload_identity_token : String,
          @custom_parameters : Hash(String, String)? = nil,
          @custom_state : String? = nil,
          @force_authentication : Bool? = nil,
          @resource_oauth2_return_url : String? = nil,
          @session_uri : String? = nil
        )
        end
      end


      struct GetResourceOauth2TokenResponse
        include JSON::Serializable

        # The OAuth 2.0 access token to use.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The URL to initiate the authorization process, provided when the access token requires user
        # authorization.

        @[JSON::Field(key: "authorizationUrl")]
        getter authorization_url : String?

        # Status indicating whether the user's authorization session is in progress or has failed. This helps
        # determine the next steps in the OAuth2 authentication flow.

        @[JSON::Field(key: "sessionStatus")]
        getter session_status : String?

        # Unique identifier for the user's authorization session for retrieving OAuth2 tokens. This matches
        # the sessionId from the request and can be used to track the session state.

        @[JSON::Field(key: "sessionUri")]
        getter session_uri : String?

        def initialize(
          @access_token : String? = nil,
          @authorization_url : String? = nil,
          @session_status : String? = nil,
          @session_uri : String? = nil
        )
        end
      end


      struct GetWorkloadAccessTokenForJWTRequest
        include JSON::Serializable

        # The OAuth 2.0 token issued by the user's identity provider.

        @[JSON::Field(key: "userToken")]
        getter user_token : String

        # The unique identifier for the registered workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        def initialize(
          @user_token : String,
          @workload_name : String
        )
        end
      end


      struct GetWorkloadAccessTokenForJWTResponse
        include JSON::Serializable

        # An opaque token representing the identity of both the workload and the user.

        @[JSON::Field(key: "workloadAccessToken")]
        getter workload_access_token : String

        def initialize(
          @workload_access_token : String
        )
        end
      end


      struct GetWorkloadAccessTokenForUserIdRequest
        include JSON::Serializable

        # The ID of the user for whom you are retrieving the access token.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The name of the workload from which you want to retrieve the access token.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        def initialize(
          @user_id : String,
          @workload_name : String
        )
        end
      end


      struct GetWorkloadAccessTokenForUserIdResponse
        include JSON::Serializable

        # The access token for the specified workload.

        @[JSON::Field(key: "workloadAccessToken")]
        getter workload_access_token : String

        def initialize(
          @workload_access_token : String
        )
        end
      end


      struct GetWorkloadAccessTokenRequest
        include JSON::Serializable

        # The unique identifier for the registered workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        def initialize(
          @workload_name : String
        )
        end
      end


      struct GetWorkloadAccessTokenResponse
        include JSON::Serializable

        # An opaque token representing the identity of both the workload and the user.

        @[JSON::Field(key: "workloadAccessToken")]
        getter workload_access_token : String

        def initialize(
          @workload_access_token : String
        )
        end
      end

      # A block of input content.

      struct InputContentBlock
        include JSON::Serializable

        # The path to the input content.

        @[JSON::Field(key: "path")]
        getter path : String

        # The binary input content.

        @[JSON::Field(key: "blob")]
        getter blob : Bytes?

        # The text input content.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @path : String,
          @blob : Bytes? = nil,
          @text : String? = nil
        )
        end
      end

      # The exception that occurs when the service encounters an unexpected internal error. This is a
      # temporary condition that will resolve itself with retries. We recommend implementing exponential
      # backoff retry logic in your application.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by AgentCore. Check your input values and try
      # again.

      struct InvalidInputException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct InvokeAgentRuntimeRequest
        include JSON::Serializable

        # The Amazon Web Services Resource Name (ARN) of the agent runtime to invoke. The ARN uniquely
        # identifies the agent runtime resource in Amazon Bedrock.

        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The input data to send to the agent runtime. The format of this data depends on the specific agent
        # configuration and must match the specified content type. For most agents, this is a JSON object
        # containing the user's request.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        # The desired MIME type for the response from the agent runtime. This tells the agent runtime what
        # format to use for the response data. Common values include application/json for JSON data.

        @[JSON::Field(key: "Accept")]
        getter accept : String?

        # The identifier of the Amazon Web Services account for the agent runtime resource.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Additional context information for distributed tracing.

        @[JSON::Field(key: "baggage")]
        getter baggage : String?

        # The MIME type of the input data in the payload. This tells the agent runtime how to interpret the
        # payload data. Common values include application/json for JSON data.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The version of the MCP protocol being used.

        @[JSON::Field(key: "Mcp-Protocol-Version")]
        getter mcp_protocol_version : String?

        # The identifier of the MCP session.

        @[JSON::Field(key: "Mcp-Session-Id")]
        getter mcp_session_id : String?

        # The qualifier to use for the agent runtime. This can be a version number or an endpoint name that
        # points to a specific version. If not specified, Amazon Bedrock uses the default version of the agent
        # runtime.

        @[JSON::Field(key: "qualifier")]
        getter qualifier : String?

        # The identifier of the runtime session.

        @[JSON::Field(key: "X-Amzn-Bedrock-AgentCore-Runtime-Session-Id")]
        getter runtime_session_id : String?

        # The identifier of the runtime user.

        @[JSON::Field(key: "X-Amzn-Bedrock-AgentCore-Runtime-User-Id")]
        getter runtime_user_id : String?

        # The trace identifier for request tracking.

        @[JSON::Field(key: "X-Amzn-Trace-Id")]
        getter trace_id : String?

        # The parent trace information for distributed tracing.

        @[JSON::Field(key: "traceparent")]
        getter trace_parent : String?

        # The trace state information for distributed tracing.

        @[JSON::Field(key: "tracestate")]
        getter trace_state : String?

        def initialize(
          @agent_runtime_arn : String,
          @payload : Bytes,
          @accept : String? = nil,
          @account_id : String? = nil,
          @baggage : String? = nil,
          @content_type : String? = nil,
          @mcp_protocol_version : String? = nil,
          @mcp_session_id : String? = nil,
          @qualifier : String? = nil,
          @runtime_session_id : String? = nil,
          @runtime_user_id : String? = nil,
          @trace_id : String? = nil,
          @trace_parent : String? = nil,
          @trace_state : String? = nil
        )
        end
      end


      struct InvokeAgentRuntimeResponse
        include JSON::Serializable

        # The MIME type of the response data. This indicates how to interpret the response data. Common values
        # include application/json for JSON data.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String

        # Additional context information for distributed tracing.

        @[JSON::Field(key: "baggage")]
        getter baggage : String?

        # The version of the MCP protocol being used.

        @[JSON::Field(key: "Mcp-Protocol-Version")]
        getter mcp_protocol_version : String?

        # The identifier of the MCP session.

        @[JSON::Field(key: "Mcp-Session-Id")]
        getter mcp_session_id : String?

        # The response data from the agent runtime. The format of this data depends on the specific agent
        # configuration and the requested accept type. For most agents, this is a JSON object containing the
        # agent's response to the user's request.

        @[JSON::Field(key: "response")]
        getter response : Bytes?

        # The identifier of the runtime session.

        @[JSON::Field(key: "X-Amzn-Bedrock-AgentCore-Runtime-Session-Id")]
        getter runtime_session_id : String?

        # The HTTP status code of the response. A status code of 200 indicates a successful operation. Other
        # status codes indicate various error conditions.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        # The trace identifier for request tracking.

        @[JSON::Field(key: "X-Amzn-Trace-Id")]
        getter trace_id : String?

        # The parent trace information for distributed tracing.

        @[JSON::Field(key: "traceparent")]
        getter trace_parent : String?

        # The trace state information for distributed tracing.

        @[JSON::Field(key: "tracestate")]
        getter trace_state : String?

        def initialize(
          @content_type : String,
          @baggage : String? = nil,
          @mcp_protocol_version : String? = nil,
          @mcp_session_id : String? = nil,
          @response : Bytes? = nil,
          @runtime_session_id : String? = nil,
          @status_code : Int32? = nil,
          @trace_id : String? = nil,
          @trace_parent : String? = nil,
          @trace_state : String? = nil
        )
        end
      end


      struct InvokeCodeInterpreterRequest
        include JSON::Serializable

        # The unique identifier of the code interpreter associated with the session. This must match the
        # identifier used when creating the session with StartCodeInterpreterSession .

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The name of the code interpreter to invoke.

        @[JSON::Field(key: "name")]
        getter name : String

        # The arguments for the code interpreter. This includes the code to execute and any additional
        # parameters such as the programming language, whether to clear the execution context, and other
        # execution options. The structure of this parameter depends on the specific code interpreter being
        # used.

        @[JSON::Field(key: "arguments")]
        getter arguments : Types::ToolArguments?

        # The unique identifier of the code interpreter session to use. This must be an active session created
        # with StartCodeInterpreterSession . If the session has expired or been stopped, the request will
        # fail.

        @[JSON::Field(key: "x-amzn-code-interpreter-session-id")]
        getter session_id : String?

        # The trace identifier for request tracking.

        @[JSON::Field(key: "X-Amzn-Trace-Id")]
        getter trace_id : String?

        # The parent trace information for distributed tracing.

        @[JSON::Field(key: "traceparent")]
        getter trace_parent : String?

        def initialize(
          @code_interpreter_identifier : String,
          @name : String,
          @arguments : Types::ToolArguments? = nil,
          @session_id : String? = nil,
          @trace_id : String? = nil,
          @trace_parent : String? = nil
        )
        end
      end


      struct InvokeCodeInterpreterResponse
        include JSON::Serializable

        # The stream containing the results of the code execution. This includes output, errors, and execution
        # status.

        @[JSON::Field(key: "stream")]
        getter stream : Types::CodeInterpreterStreamOutput

        # The identifier of the code interpreter session.

        @[JSON::Field(key: "x-amzn-code-interpreter-session-id")]
        getter session_id : String?

        def initialize(
          @stream : Types::CodeInterpreterStreamOutput,
          @session_id : String? = nil
        )
        end
      end

      # Left expression of the event metadata filter.

      struct LeftExpression
        include JSON::Serializable

        # Key associated with the metadata in an event.

        @[JSON::Field(key: "metadataKey")]
        getter metadata_key : String?

        def initialize(
          @metadata_key : String? = nil
        )
        end
      end


      struct ListActorsInput
        include JSON::Serializable

        # The identifier of the AgentCore Memory resource for which to list actors.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The maximum number of results to return in a single call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memory_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListActorsOutput
        include JSON::Serializable

        # The list of actor summaries.

        @[JSON::Field(key: "actorSummaries")]
        getter actor_summaries : Array(Types::ActorSummary)

        # The token to use in a subsequent request to get the next set of results. This value is null when
        # there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @actor_summaries : Array(Types::ActorSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListBrowserSessionsRequest
        include JSON::Serializable

        # The unique identifier of the browser to list sessions for. If specified, only sessions for this
        # browser are returned. If not specified, sessions for all browsers are returned.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The maximum number of results to return in a single call. The default value is 10. Valid values
        # range from 1 to 100. To retrieve the remaining results, make another call with the returned
        # nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results. If not specified, Amazon Bedrock returns the first page
        # of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the browser sessions to list. Valid values include ACTIVE, STOPPING, and STOPPED. If
        # not specified, sessions with any status are returned.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @browser_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListBrowserSessionsResponse
        include JSON::Serializable

        # The list of browser sessions that match the specified criteria.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::BrowserSessionSummary)

        # The token to use in a subsequent ListBrowserSessions request to get the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BrowserSessionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCodeInterpreterSessionsRequest
        include JSON::Serializable

        # The unique identifier of the code interpreter to list sessions for. If specified, only sessions for
        # this code interpreter are returned. If not specified, sessions for all code interpreters are
        # returned.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The maximum number of results to return in a single call. The default value is 10. Valid values
        # range from 1 to 100. To retrieve the remaining results, make another call with the returned
        # nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results. If not specified, Amazon Bedrock returns the first page
        # of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the code interpreter sessions to list. Valid values include ACTIVE, STOPPING, and
        # STOPPED. If not specified, sessions with any status are returned.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @code_interpreter_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListCodeInterpreterSessionsResponse
        include JSON::Serializable

        # The list of code interpreter sessions that match the specified criteria.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::CodeInterpreterSessionSummary)

        # The token to use in a subsequent ListCodeInterpreterSessions request to get the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::CodeInterpreterSessionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEventsInput
        include JSON::Serializable

        # The identifier of the actor for which to list events.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        # The identifier of the AgentCore Memory resource for which to list events.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The identifier of the session for which to list events.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Filter criteria to apply when listing events.

        @[JSON::Field(key: "filter")]
        getter filter : Types::FilterInput?

        # Specifies whether to include event payloads in the response. Set to true to include payloads, or
        # false to exclude them.

        @[JSON::Field(key: "includePayloads")]
        getter include_payloads : Bool?

        # The maximum number of results to return in a single call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @actor_id : String,
          @memory_id : String,
          @session_id : String,
          @filter : Types::FilterInput? = nil,
          @include_payloads : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventsOutput
        include JSON::Serializable

        # The list of events that match the specified criteria.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::Event)

        # The token to use in a subsequent request to get the next set of results. This value is null when
        # there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event),
          @next_token : String? = nil
        )
        end
      end


      struct ListMemoryExtractionJobsInput
        include JSON::Serializable

        # The unique identifier of the memory to list extraction jobs for.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # Filter criteria to apply when listing extraction jobs.

        @[JSON::Field(key: "filter")]
        getter filter : Types::ExtractionJobFilterInput?

        # The maximum number of results to return in a single call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memory_id : String,
          @filter : Types::ExtractionJobFilterInput? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMemoryExtractionJobsOutput
        include JSON::Serializable

        # List of extraction job metadata matching the specified criteria.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::ExtractionJobMetadata)

        # Token to retrieve the next page of results, if available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::ExtractionJobMetadata),
          @next_token : String? = nil
        )
        end
      end


      struct ListMemoryRecordsInput
        include JSON::Serializable

        # The identifier of the AgentCore Memory resource for which to list memory records.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The namespace to filter memory records by. If specified, only memory records in this namespace are
        # returned.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The maximum number of results to return in a single call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The memory strategy identifier to filter memory records by. If specified, only memory records with
        # this strategy ID are returned.

        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memory_id : String,
          @namespace : String,
          @max_results : Int32? = nil,
          @memory_strategy_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMemoryRecordsOutput
        include JSON::Serializable

        # The list of memory record summaries that match the specified criteria.

        @[JSON::Field(key: "memoryRecordSummaries")]
        getter memory_record_summaries : Array(Types::MemoryRecordSummary)

        # The token to use in a subsequent request to get the next set of results. This value is null when
        # there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memory_record_summaries : Array(Types::MemoryRecordSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListSessionsInput
        include JSON::Serializable

        # The identifier of the actor for which to list sessions.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        # The identifier of the AgentCore Memory resource for which to list sessions.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The maximum number of results to return in a single call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @actor_id : String,
          @memory_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSessionsOutput
        include JSON::Serializable

        # The list of session summaries that match the specified criteria.

        @[JSON::Field(key: "sessionSummaries")]
        getter session_summaries : Array(Types::SessionSummary)

        # The token to use in a subsequent request to get the next set of results. This value is null when
        # there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @session_summaries : Array(Types::SessionSummary),
          @next_token : String? = nil
        )
        end
      end

      # The configuration for a stream that provides a visual representation of a browser session in Amazon
      # Bedrock. This stream enables agents to observe the current state of the browser, including rendered
      # web pages, visual elements, and the results of interactions.

      struct LiveViewStream
        include JSON::Serializable

        # The endpoint URL for the live view stream. This URL is used to establish a connection to receive
        # visual updates from the browser session.

        @[JSON::Field(key: "streamEndpoint")]
        getter stream_endpoint : String?

        def initialize(
          @stream_endpoint : String? = nil
        )
        end
      end

      # Contains the content of a memory record.

      struct MemoryContent
        include JSON::Serializable

        # The text content of the memory record.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Filters to apply to metadata associated with a memory. Specify the metadata key and value in the
      # left and right fields and use the operator field to define the relationship to match.

      struct MemoryMetadataFilterExpression
        include JSON::Serializable


        @[JSON::Field(key: "left")]
        getter left : Types::LeftExpression

        # The relationship between the metadata key and value to match when applying the metadata filter.

        @[JSON::Field(key: "operator")]
        getter operator : String


        @[JSON::Field(key: "right")]
        getter right : Types::RightExpression?

        def initialize(
          @left : Types::LeftExpression,
          @operator : String,
          @right : Types::RightExpression? = nil
        )
        end
      end

      # Contains information about a memory record in an AgentCore Memory resource.

      struct MemoryRecord
        include JSON::Serializable

        # The content of the memory record.

        @[JSON::Field(key: "content")]
        getter content : Types::MemoryContent

        # The timestamp when the memory record was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the memory record.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        # The identifier of the memory strategy associated with this record.

        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String

        # The namespaces associated with this memory record. Namespaces help organize and categorize memory
        # records.

        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        # A map of metadata key-value pairs associated with a memory record.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, Types::MetadataValue)?

        def initialize(
          @content : Types::MemoryContent,
          @created_at : Time,
          @memory_record_id : String,
          @memory_strategy_id : String,
          @namespaces : Array(String),
          @metadata : Hash(String, Types::MetadataValue)? = nil
        )
        end
      end

      # Input structure to create a new memory record.

      struct MemoryRecordCreateInput
        include JSON::Serializable

        # The content to be stored within the memory record.

        @[JSON::Field(key: "content")]
        getter content : Types::MemoryContent

        # A list of namespace identifiers that categorize or group the memory record.

        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        # A client-provided identifier for tracking this specific record creation request.

        @[JSON::Field(key: "requestIdentifier")]
        getter request_identifier : String

        # Time at which the memory record was created.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The ID of the memory strategy that defines how this memory record is grouped.

        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String?

        def initialize(
          @content : Types::MemoryContent,
          @namespaces : Array(String),
          @request_identifier : String,
          @timestamp : Time,
          @memory_strategy_id : String? = nil
        )
        end
      end

      # Input structure to delete an existing memory record.

      struct MemoryRecordDeleteInput
        include JSON::Serializable

        # The unique ID of the memory record to be deleted.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        def initialize(
          @memory_record_id : String
        )
        end
      end

      # Output information returned after processing a memory record operation.

      struct MemoryRecordOutput
        include JSON::Serializable

        # The unique ID associated to the memory record.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        # The status of the memory record operation (e.g., SUCCEEDED, FAILED).

        @[JSON::Field(key: "status")]
        getter status : String

        # The error code returned when the memory record operation fails.

        @[JSON::Field(key: "errorCode")]
        getter error_code : Int32?

        # A human-readable error message describing why the memory record operation failed.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The client-provided identifier that was used to track this record operation.

        @[JSON::Field(key: "requestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @memory_record_id : String,
          @status : String,
          @error_code : Int32? = nil,
          @error_message : String? = nil,
          @request_identifier : String? = nil
        )
        end
      end

      # Contains summary information about a memory record.

      struct MemoryRecordSummary
        include JSON::Serializable

        # The content of the memory record.

        @[JSON::Field(key: "content")]
        getter content : Types::MemoryContent

        # The timestamp when the memory record was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the memory record.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        # The identifier of the memory strategy associated with this record.

        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String

        # The namespaces associated with this memory record.

        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        # A map of metadata key-value pairs associated with a memory record.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, Types::MetadataValue)?

        # The relevance score of the memory record when returned as part of a search result. Higher values
        # indicate greater relevance to the search query.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @content : Types::MemoryContent,
          @created_at : Time,
          @memory_record_id : String,
          @memory_strategy_id : String,
          @namespaces : Array(String),
          @metadata : Hash(String, Types::MetadataValue)? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Input structure to update an existing memory record.

      struct MemoryRecordUpdateInput
        include JSON::Serializable

        # The unique ID of the memory record to be updated.

        @[JSON::Field(key: "memoryRecordId")]
        getter memory_record_id : String

        # Time at which the memory record was updated

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The content to be stored within the memory record.

        @[JSON::Field(key: "content")]
        getter content : Types::MemoryContent?

        # The updated ID of the memory strategy that defines how this memory record is grouped.

        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String?

        # The updated list of namespace identifiers for categorizing the memory record.

        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @memory_record_id : String,
          @timestamp : Time,
          @content : Types::MemoryContent? = nil,
          @memory_strategy_id : String? = nil,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # Metadata information associated with this message.

      struct MessageMetadata
        include JSON::Serializable

        # The identifier of the event associated with this message.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The position of this message within that event’s ordered list of messages.

        @[JSON::Field(key: "messageIndex")]
        getter message_index : Int32

        def initialize(
          @event_id : String,
          @message_index : Int32
        )
        end
      end

      # Value associated with the eventMetadata key.

      struct MetadataValue
        include JSON::Serializable

        # Value associated with the eventMetadata key.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @string_value : String? = nil
        )
        end
      end

      # Contains the payload content for an event.

      struct PayloadType
        include JSON::Serializable

        # The binary content of the payload.

        @[JSON::Field(key: "blob")]
        getter blob : Types::Document?

        # The conversational content of the payload.

        @[JSON::Field(key: "conversational")]
        getter conversational : Types::Conversational?

        def initialize(
          @blob : Types::Document? = nil,
          @conversational : Types::Conversational? = nil
        )
        end
      end

      # Contains information about resource content.

      struct ResourceContent
        include JSON::Serializable

        # The type of resource content.

        @[JSON::Field(key: "type")]
        getter type : String

        # The binary resource content.

        @[JSON::Field(key: "blob")]
        getter blob : Bytes?

        # The MIME type of the resource content.

        @[JSON::Field(key: "mimeType")]
        getter mime_type : String?

        # The text resource content.

        @[JSON::Field(key: "text")]
        getter text : String?

        # The URI of the resource content.

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @type : String,
          @blob : Bytes? = nil,
          @mime_type : String? = nil,
          @text : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # The exception that occurs when the specified resource does not exist. This can happen when using an
      # invalid identifier or when trying to access a resource that has been deleted.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RetrieveMemoryRecordsInput
        include JSON::Serializable

        # The identifier of the AgentCore Memory resource from which to retrieve memory records.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The namespace to filter memory records by.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The search criteria to use for finding relevant memory records. This includes the search query,
        # memory strategy ID, and other search parameters.

        @[JSON::Field(key: "searchCriteria")]
        getter search_criteria : Types::SearchCriteria

        # The maximum number of results to return in a single call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memory_id : String,
          @namespace : String,
          @search_criteria : Types::SearchCriteria,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct RetrieveMemoryRecordsOutput
        include JSON::Serializable

        # The list of memory record summaries that match the search criteria, ordered by relevance.

        @[JSON::Field(key: "memoryRecordSummaries")]
        getter memory_record_summaries : Array(Types::MemoryRecordSummary)

        # The token to use in a subsequent request to get the next set of results. This value is null when
        # there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memory_record_summaries : Array(Types::MemoryRecordSummary),
          @next_token : String? = nil
        )
        end
      end

      # Right expression of the eventMetadata filter.

      struct RightExpression
        include JSON::Serializable

        # Value associated with the key in eventMetadata .

        @[JSON::Field(key: "metadataValue")]
        getter metadata_value : Types::MetadataValue?

        def initialize(
          @metadata_value : Types::MetadataValue? = nil
        )
        end
      end

      # The exception that occurs when there is an error in the runtime client. This can happen due to
      # network issues, invalid configuration, or other client-side problems. Check the error message for
      # specific details about the error.

      struct RuntimeClientError
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains search criteria for retrieving memory records.

      struct SearchCriteria
        include JSON::Serializable

        # The search query to use for finding relevant memory records.

        @[JSON::Field(key: "searchQuery")]
        getter search_query : String

        # The memory strategy identifier to filter memory records by.

        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String?

        # Filters to apply to metadata associated with a memory.

        @[JSON::Field(key: "metadataFilters")]
        getter metadata_filters : Array(Types::MemoryMetadataFilterExpression)?

        # The maximum number of top-scoring memory records to return. This value is used for semantic search
        # ranking.

        @[JSON::Field(key: "topK")]
        getter top_k : Int32?

        def initialize(
          @search_query : String,
          @memory_strategy_id : String? = nil,
          @metadata_filters : Array(Types::MemoryMetadataFilterExpression)? = nil,
          @top_k : Int32? = nil
        )
        end
      end

      # The service encountered an internal error. Try your request again later.

      struct ServiceException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The exception that occurs when the request would cause a service quota to be exceeded. Review your
      # service quotas and either reduce your request rate or request a quota increase.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains summary information about a session in an AgentCore Memory resource.

      struct SessionSummary
        include JSON::Serializable

        # The identifier of the actor associated with the session.

        @[JSON::Field(key: "actorId")]
        getter actor_id : String

        # The timestamp when the session was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @actor_id : String,
          @created_at : Time,
          @session_id : String
        )
        end
      end


      struct Span
        include JSON::Serializable

        def initialize
        end
      end

      # The contextual information that uniquely identifies a span within the distributed tracing system.
      # Contains session, trace, and span identifiers used to correlate evaluation results with specific
      # agent execution points.

      struct SpanContext
        include JSON::Serializable

        # The unique identifier of the session containing this span. Sessions represent complete conversation
        # flows and are detected using configurable SessionTimeoutMinutes (default 15 minutes).

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The unique identifier of the specific span being referenced. Spans represent individual operations
        # like tool calls, model invocations, or other discrete actions within the agent's execution.

        @[JSON::Field(key: "spanId")]
        getter span_id : String?

        # The unique identifier of the trace containing this span. Traces represent individual
        # request-response interactions within a session and group related spans together.

        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @session_id : String,
          @span_id : String? = nil,
          @trace_id : String? = nil
        )
        end
      end


      struct StartBrowserSessionRequest
        include JSON::Serializable

        # The unique identifier of the browser to use for this session. This identifier specifies which
        # browser environment to initialize for the session.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. This parameter helps prevent the creation of duplicate sessions if there are temporary
        # network issues.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the browser session. This name helps you identify and manage the session. The name does
        # not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The time in seconds after which the session automatically terminates if there is no activity. The
        # default value is 3600 seconds (1 hour). The minimum allowed value is 60 seconds, and the maximum
        # allowed value is 28800 seconds (8 hours).

        @[JSON::Field(key: "sessionTimeoutSeconds")]
        getter session_timeout_seconds : Int32?

        # The trace identifier for request tracking.

        @[JSON::Field(key: "X-Amzn-Trace-Id")]
        getter trace_id : String?

        # The parent trace information for distributed tracing.

        @[JSON::Field(key: "traceparent")]
        getter trace_parent : String?

        # The dimensions of the browser viewport for this session. This determines the visible area of the web
        # content and affects how web pages are rendered. If not specified, Amazon Bedrock uses a default
        # viewport size.

        @[JSON::Field(key: "viewPort")]
        getter view_port : Types::ViewPort?

        def initialize(
          @browser_identifier : String,
          @client_token : String? = nil,
          @name : String? = nil,
          @session_timeout_seconds : Int32? = nil,
          @trace_id : String? = nil,
          @trace_parent : String? = nil,
          @view_port : Types::ViewPort? = nil
        )
        end
      end


      struct StartBrowserSessionResponse
        include JSON::Serializable

        # The identifier of the browser.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The timestamp when the browser session was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the created browser session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The streams associated with this browser session. These include the automation stream and live view
        # stream.

        @[JSON::Field(key: "streams")]
        getter streams : Types::BrowserSessionStream?

        def initialize(
          @browser_identifier : String,
          @created_at : Time,
          @session_id : String,
          @streams : Types::BrowserSessionStream? = nil
        )
        end
      end


      struct StartCodeInterpreterSessionRequest
        include JSON::Serializable

        # The unique identifier of the code interpreter to use for this session. This identifier specifies
        # which code interpreter environment to initialize for the session.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. This parameter helps prevent the creation of duplicate sessions if there are temporary
        # network issues.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the code interpreter session. This name helps you identify and manage the session. The
        # name does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The time in seconds after which the session automatically terminates if there is no activity. The
        # default value is 900 seconds (15 minutes). The minimum allowed value is 60 seconds, and the maximum
        # allowed value is 28800 seconds (8 hours).

        @[JSON::Field(key: "sessionTimeoutSeconds")]
        getter session_timeout_seconds : Int32?

        # The trace identifier for request tracking.

        @[JSON::Field(key: "X-Amzn-Trace-Id")]
        getter trace_id : String?

        # The parent trace information for distributed tracing.

        @[JSON::Field(key: "traceparent")]
        getter trace_parent : String?

        def initialize(
          @code_interpreter_identifier : String,
          @client_token : String? = nil,
          @name : String? = nil,
          @session_timeout_seconds : Int32? = nil,
          @trace_id : String? = nil,
          @trace_parent : String? = nil
        )
        end
      end


      struct StartCodeInterpreterSessionResponse
        include JSON::Serializable

        # The identifier of the code interpreter.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The time at which the code interpreter session was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the created code interpreter session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @code_interpreter_identifier : String,
          @created_at : Time,
          @session_id : String
        )
        end
      end


      struct StartMemoryExtractionJobInput
        include JSON::Serializable

        # Extraction job to start in this operation.

        @[JSON::Field(key: "extractionJob")]
        getter extraction_job : Types::ExtractionJob

        # The unique identifier of the memory for which to start extraction jobs.

        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # A unique, case-sensitive identifier to ensure idempotent processing of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @extraction_job : Types::ExtractionJob,
          @memory_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct StartMemoryExtractionJobOutput
        include JSON::Serializable

        # Extraction Job ID that was attempted to start.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StopBrowserSessionRequest
        include JSON::Serializable

        # The unique identifier of the browser associated with the session.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The unique identifier of the browser session to stop.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The trace identifier for request tracking.

        @[JSON::Field(key: "X-Amzn-Trace-Id")]
        getter trace_id : String?

        # The parent trace information for distributed tracing.

        @[JSON::Field(key: "traceparent")]
        getter trace_parent : String?

        def initialize(
          @browser_identifier : String,
          @session_id : String,
          @client_token : String? = nil,
          @trace_id : String? = nil,
          @trace_parent : String? = nil
        )
        end
      end


      struct StopBrowserSessionResponse
        include JSON::Serializable

        # The identifier of the browser.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The time at which the browser session was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The identifier of the browser session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @browser_identifier : String,
          @last_updated_at : Time,
          @session_id : String
        )
        end
      end


      struct StopCodeInterpreterSessionRequest
        include JSON::Serializable

        # The unique identifier of the code interpreter associated with the session.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The unique identifier of the code interpreter session to stop.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The trace identifier for request tracking.

        @[JSON::Field(key: "X-Amzn-Trace-Id")]
        getter trace_id : String?

        # The parent trace information for distributed tracing.

        @[JSON::Field(key: "traceparent")]
        getter trace_parent : String?

        def initialize(
          @code_interpreter_identifier : String,
          @session_id : String,
          @client_token : String? = nil,
          @trace_id : String? = nil,
          @trace_parent : String? = nil
        )
        end
      end


      struct StopCodeInterpreterSessionResponse
        include JSON::Serializable

        # The identifier of the code interpreter.

        @[JSON::Field(key: "codeInterpreterIdentifier")]
        getter code_interpreter_identifier : String

        # The timestamp when the code interpreter session was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The identifier of the code interpreter session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @code_interpreter_identifier : String,
          @last_updated_at : Time,
          @session_id : String
        )
        end
      end


      struct StopRuntimeSessionRequest
        include JSON::Serializable

        # The ARN of the agent that contains the session that you want to stop.

        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The ID of the session that you want to stop.

        @[JSON::Field(key: "X-Amzn-Bedrock-AgentCore-Runtime-Session-Id")]
        getter runtime_session_id : String

        # Idempotent token used to identify the request. If you use the same token with multiple requests, the
        # same response is returned. Use ClientToken to prevent the same request from being processed more
        # than once.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Optional qualifier to specify an agent alias, such as prod code&gt; or dev . If you don't provide a
        # value, the DEFAULT alias is used.

        @[JSON::Field(key: "qualifier")]
        getter qualifier : String?

        def initialize(
          @agent_runtime_arn : String,
          @runtime_session_id : String,
          @client_token : String? = nil,
          @qualifier : String? = nil
        )
        end
      end


      struct StopRuntimeSessionResponse
        include JSON::Serializable

        # The ID of the session that you requested to stop.

        @[JSON::Field(key: "X-Amzn-Bedrock-AgentCore-Runtime-Session-Id")]
        getter runtime_session_id : String?

        # The status code of the request to stop the session.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @runtime_session_id : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      # Contains information about an update to a stream.

      struct StreamUpdate
        include JSON::Serializable

        # The update to an automation stream.

        @[JSON::Field(key: "automationStreamUpdate")]
        getter automation_stream_update : Types::AutomationStreamUpdate?

        def initialize(
          @automation_stream_update : Types::AutomationStreamUpdate? = nil
        )
        end
      end

      # The request was denied due to request throttling. Reduce the frequency of requests and try again.

      struct ThrottledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The exception that occurs when the request was denied due to request throttling. This happens when
      # you exceed the allowed request rate for an operation. Reduce the frequency of requests or implement
      # exponential backoff retry logic in your application.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The token consumption statistics for language model operations during evaluation. Provides detailed
      # breakdown of input, output, and total tokens used for cost tracking and performance monitoring.

      struct TokenUsage
        include JSON::Serializable

        # The number of tokens consumed for input processing during the evaluation. Includes tokens from the
        # evaluation prompt, agent traces, and any additional context provided to the evaluator model.

        @[JSON::Field(key: "inputTokens")]
        getter input_tokens : Int32?

        # The number of tokens generated by the evaluator model in its response. Includes tokens for the
        # score, explanation, and any additional output produced during the evaluation process.

        @[JSON::Field(key: "outputTokens")]
        getter output_tokens : Int32?

        # The total number of tokens consumed during the evaluation, calculated as the sum of input and output
        # tokens. Used for cost calculation and rate limiting within the service limits.

        @[JSON::Field(key: "totalTokens")]
        getter total_tokens : Int32?

        def initialize(
          @input_tokens : Int32? = nil,
          @output_tokens : Int32? = nil,
          @total_tokens : Int32? = nil
        )
        end
      end

      # The collection of arguments that specify the operation to perform and its parameters when invoking a
      # tool in Amazon Bedrock. Different tools require different arguments, and this structure provides a
      # flexible way to pass the appropriate arguments to each tool type.

      struct ToolArguments
        include JSON::Serializable

        # Whether to clear the context for the tool.

        @[JSON::Field(key: "clearContext")]
        getter clear_context : Bool?

        # The code to execute in a code interpreter session. This is the source code in the specified
        # programming language that will be executed by the code interpreter.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The command to execute with the tool.

        @[JSON::Field(key: "command")]
        getter command : String?

        # The content for the tool operation.

        @[JSON::Field(key: "content")]
        getter content : Array(Types::InputContentBlock)?

        # The directory path for the tool operation.

        @[JSON::Field(key: "directoryPath")]
        getter directory_path : String?

        # The programming language of the code to execute. This tells the code interpreter which language
        # runtime to use for execution. Common values include 'python', 'javascript', and 'r'.

        @[JSON::Field(key: "language")]
        getter language : String?

        # The path for the tool operation.

        @[JSON::Field(key: "path")]
        getter path : String?

        # The paths for the tool operation.

        @[JSON::Field(key: "paths")]
        getter paths : Array(String)?

        # The identifier of the task for the tool operation.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @clear_context : Bool? = nil,
          @code : String? = nil,
          @command : String? = nil,
          @content : Array(Types::InputContentBlock)? = nil,
          @directory_path : String? = nil,
          @language : String? = nil,
          @path : String? = nil,
          @paths : Array(String)? = nil,
          @task_id : String? = nil
        )
        end
      end

      # Contains structured content from a tool result.

      struct ToolResultStructuredContent
        include JSON::Serializable

        # The execution time of the tool operation in milliseconds.

        @[JSON::Field(key: "executionTime")]
        getter execution_time : Float64?

        # The exit code from the tool execution.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The standard error output from the tool execution.

        @[JSON::Field(key: "stderr")]
        getter stderr : String?

        # The standard output from the tool execution.

        @[JSON::Field(key: "stdout")]
        getter stdout : String?

        # The identifier of the task that produced the result.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The status of the task that produced the result.

        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        def initialize(
          @execution_time : Float64? = nil,
          @exit_code : Int32? = nil,
          @stderr : String? = nil,
          @stdout : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      # This exception is thrown when the JWT bearer token is invalid or not found for OAuth bearer token
      # based access

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateBrowserStreamRequest
        include JSON::Serializable

        # The identifier of the browser.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The identifier of the browser session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The update to apply to the browser stream.

        @[JSON::Field(key: "streamUpdate")]
        getter stream_update : Types::StreamUpdate

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @browser_identifier : String,
          @session_id : String,
          @stream_update : Types::StreamUpdate,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateBrowserStreamResponse
        include JSON::Serializable

        # The identifier of the browser.

        @[JSON::Field(key: "browserIdentifier")]
        getter browser_identifier : String

        # The identifier of the browser session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String


        @[JSON::Field(key: "streams")]
        getter streams : Types::BrowserSessionStream

        # The time at which the browser stream was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @browser_identifier : String,
          @session_id : String,
          @streams : Types::BrowserSessionStream,
          @updated_at : Time
        )
        end
      end

      # The OAuth2.0 token or user ID that was used to generate the workload access token used for
      # initiating the user authorization flow to retrieve OAuth2.0 tokens.

      struct UserIdentifier
        include JSON::Serializable

        # The ID of the user for whom you have retrieved a workload access token for

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        # The OAuth2.0 token issued by the user’s identity provider

        @[JSON::Field(key: "userToken")]
        getter user_token : String?

        def initialize(
          @user_id : String? = nil,
          @user_token : String? = nil
        )
        end
      end

      # The exception that occurs when the input fails to satisfy the constraints specified by the service.
      # Check the error message for details about which input parameter is invalid and correct your request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "reason")]
        getter reason : String


        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message describing why this field failed validation.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The configuration that defines the dimensions of a browser viewport in a browser session. The
      # viewport determines the visible area of web content and affects how web pages are rendered and
      # displayed. Proper viewport configuration ensures that web content is displayed correctly for the
      # agent's browsing tasks.

      struct ViewPort
        include JSON::Serializable

        # The height of the viewport in pixels. This value determines the vertical dimension of the visible
        # area. Valid values range from 600 to 1080 pixels.

        @[JSON::Field(key: "height")]
        getter height : Int32

        # The width of the viewport in pixels. This value determines the horizontal dimension of the visible
        # area. Valid values range from 800 to 1920 pixels.

        @[JSON::Field(key: "width")]
        getter width : Int32

        def initialize(
          @height : Int32,
          @width : Int32
        )
        end
      end
    end
  end
end
