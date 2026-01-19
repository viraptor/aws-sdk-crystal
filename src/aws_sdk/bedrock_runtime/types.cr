require "json"
require "time"

module AwsSdk
  module BedrockRuntime
    module Types

      # The request is denied because you do not have sufficient permissions to perform the requested
      # action. For troubleshooting this error, see AccessDeniedException in the Amazon Bedrock User Guide
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The model must request at least one tool (no text is generated). For example, {"any" : {}} . For
      # more information, see Call a tool with the Converse API in the Amazon Bedrock User Guide.
      struct AnyToolChoice
        include JSON::Serializable

        def initialize
        end
      end

      # Details about the specific guardrail that was applied during this assessment, including its
      # identifier, version, ARN, origin, and ownership information.
      struct AppliedGuardrailDetails
        include JSON::Serializable

        # The ARN of the guardrail that was applied.
        @[JSON::Field(key: "guardrailArn")]
        getter guardrail_arn : String?

        # The unique ID of the guardrail that was applied.
        @[JSON::Field(key: "guardrailId")]
        getter guardrail_id : String?

        # The origin of how the guardrail was applied. This can be either requested at the API level or
        # enforced at the account or organization level as a default guardrail.
        @[JSON::Field(key: "guardrailOrigin")]
        getter guardrail_origin : Array(String)?

        # The ownership type of the guardrail, indicating whether it is owned by the requesting account or is
        # a cross-account guardrail shared from another AWS account.
        @[JSON::Field(key: "guardrailOwnership")]
        getter guardrail_ownership : String?

        # The version of the guardrail that was applied.
        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String?

        def initialize(
          @guardrail_arn : String? = nil,
          @guardrail_id : String? = nil,
          @guardrail_origin : Array(String)? = nil,
          @guardrail_ownership : String? = nil,
          @guardrail_version : String? = nil
        )
        end
      end

      struct ApplyGuardrailRequest
        include JSON::Serializable

        # The content details used in the request to apply the guardrail.
        @[JSON::Field(key: "content")]
        getter content : Array(Types::GuardrailContentBlock)

        # The guardrail identifier used in the request to apply the guardrail.
        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String

        # The guardrail version used in the request to apply the guardrail.
        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String

        # The source of data used in the request to apply the guardrail.
        @[JSON::Field(key: "source")]
        getter source : String

        # Specifies the scope of the output that you get in the response. Set to FULL to return the entire
        # output, including any detected and non-detected entries in the response for enhanced debugging. Note
        # that the full output scope doesn't apply to word filters or regex in sensitive information filters.
        # It does apply to all other filtering policies, including sensitive information with filters that can
        # detect personally identifiable information (PII).
        @[JSON::Field(key: "outputScope")]
        getter output_scope : String?

        def initialize(
          @content : Array(Types::GuardrailContentBlock),
          @guardrail_identifier : String,
          @guardrail_version : String,
          @source : String,
          @output_scope : String? = nil
        )
        end
      end

      struct ApplyGuardrailResponse
        include JSON::Serializable

        # The action taken in the response from the guardrail.
        @[JSON::Field(key: "action")]
        getter action : String

        # The assessment details in the response from the guardrail.
        @[JSON::Field(key: "assessments")]
        getter assessments : Array(Types::GuardrailAssessment)

        # The output details in the response from the guardrail.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::GuardrailOutputContent)

        # The usage details in the response from the guardrail.
        @[JSON::Field(key: "usage")]
        getter usage : Types::GuardrailUsage

        # The reason for the action taken when harmful content is detected.
        @[JSON::Field(key: "actionReason")]
        getter action_reason : String?

        # The guardrail coverage details in the apply guardrail response.
        @[JSON::Field(key: "guardrailCoverage")]
        getter guardrail_coverage : Types::GuardrailCoverage?

        def initialize(
          @action : String,
          @assessments : Array(Types::GuardrailAssessment),
          @outputs : Array(Types::GuardrailOutputContent),
          @usage : Types::GuardrailUsage,
          @action_reason : String? = nil,
          @guardrail_coverage : Types::GuardrailCoverage? = nil
        )
        end
      end

      # Asynchronous invocation output data settings.
      struct AsyncInvokeOutputDataConfig
        include JSON::Serializable

        # A storage location for the output data in an S3 bucket
        @[JSON::Field(key: "s3OutputDataConfig")]
        getter s3_output_data_config : Types::AsyncInvokeS3OutputDataConfig?

        def initialize(
          @s3_output_data_config : Types::AsyncInvokeS3OutputDataConfig? = nil
        )
        end
      end

      # Asynchronous invocation output data settings.
      struct AsyncInvokeS3OutputDataConfig
        include JSON::Serializable

        # An object URI starting with s3:// .
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # If the bucket belongs to another AWS account, specify that account's ID.
        @[JSON::Field(key: "bucketOwner")]
        getter bucket_owner : String?

        # A KMS encryption key ID.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_uri : String,
          @bucket_owner : String? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      # A summary of an asynchronous invocation.
      struct AsyncInvokeSummary
        include JSON::Serializable

        # The invocation's ARN.
        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        # The invoked model's ARN.
        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The invocation's output data settings.
        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::AsyncInvokeOutputDataConfig

        # When the invocation was submitted.
        @[JSON::Field(key: "submitTime")]
        getter submit_time : Time

        # The invocation's idempotency token.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # When the invocation ended.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # An error message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # When the invocation was last modified.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The invocation's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @invocation_arn : String,
          @model_arn : String,
          @output_data_config : Types::AsyncInvokeOutputDataConfig,
          @submit_time : Time,
          @client_request_token : String? = nil,
          @end_time : Time? = nil,
          @failure_message : String? = nil,
          @last_modified_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # An audio content block that contains audio data in various supported formats.
      struct AudioBlock
        include JSON::Serializable

        # The format of the audio data, such as MP3, WAV, FLAC, or other supported audio formats.
        @[JSON::Field(key: "format")]
        getter format : String

        # The source of the audio data, which can be provided as raw bytes or an S3 location.
        @[JSON::Field(key: "source")]
        getter source : Types::AudioSource

        # Error information if the audio block could not be processed or contains invalid data.
        @[JSON::Field(key: "error")]
        getter error : Types::ErrorBlock?

        def initialize(
          @format : String,
          @source : Types::AudioSource,
          @error : Types::ErrorBlock? = nil
        )
        end
      end

      # The source of audio data, which can be provided either as raw bytes or a reference to an S3
      # location.
      struct AudioSource
        include JSON::Serializable

        # Audio data encoded in base64.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        # A reference to audio data stored in an Amazon S3 bucket. To see which models support S3 uploads, see
        # Supported models and features for Converse .
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @bytes : Bytes? = nil,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # The Model automatically decides if a tool should be called or whether to generate text instead. For
      # example, {"auto" : {}} . For more information, see Call a tool with the Converse API in the Amazon
      # Bedrock User Guide
      struct AutoToolChoice
        include JSON::Serializable

        def initialize
        end
      end

      # Payload content for the bidirectional input. The input is an audio stream.
      struct BidirectionalInputPayloadPart
        include JSON::Serializable

        # The audio content for the bidirectional input.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @bytes : Bytes? = nil
        )
        end
      end

      # Output from the bidirectional stream. The output is speech and a text transcription.
      struct BidirectionalOutputPayloadPart
        include JSON::Serializable

        # The speech output of the bidirectional stream.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @bytes : Bytes? = nil
        )
        end
      end

      # Defines a section of content to be cached for reuse in subsequent API calls.
      struct CachePointBlock
        include JSON::Serializable

        # Specifies the type of cache point within the CachePointBlock.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # Contains information about a citation that references a specific source document. Citations provide
      # traceability between the model's generated response and the source documents that informed that
      # response.
      struct Citation
        include JSON::Serializable

        # The precise location within the source document where the cited content can be found, including
        # character positions, page numbers, or chunk identifiers.
        @[JSON::Field(key: "location")]
        getter location : Types::CitationLocation?

        # The source from the original search result that provided the cited content.
        @[JSON::Field(key: "source")]
        getter source : String?

        # The specific content from the source document that was referenced or cited in the generated
        # response.
        @[JSON::Field(key: "sourceContent")]
        getter source_content : Array(Types::CitationSourceContent)?

        # The title or identifier of the source document being cited.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @location : Types::CitationLocation? = nil,
          @source : String? = nil,
          @source_content : Array(Types::CitationSourceContent)? = nil,
          @title : String? = nil
        )
        end
      end

      # Contains the generated text content that corresponds to or is supported by a citation from a source
      # document.
      struct CitationGeneratedContent
        include JSON::Serializable

        # The text content that was generated by the model and is supported by the associated citation.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Specifies the precise location within a source document where cited content can be found. This can
      # include character-level positions, page numbers, or document chunks depending on the document type
      # and indexing method.
      struct CitationLocation
        include JSON::Serializable

        # The character-level location within the document where the cited content is found.
        @[JSON::Field(key: "documentChar")]
        getter document_char : Types::DocumentCharLocation?

        # The chunk-level location within the document where the cited content is found, typically used for
        # documents that have been segmented into logical chunks.
        @[JSON::Field(key: "documentChunk")]
        getter document_chunk : Types::DocumentChunkLocation?

        # The page-level location within the document where the cited content is found.
        @[JSON::Field(key: "documentPage")]
        getter document_page : Types::DocumentPageLocation?

        # The search result location where the cited content is found, including the search result index and
        # block positions within the content array.
        @[JSON::Field(key: "searchResultLocation")]
        getter search_result_location : Types::SearchResultLocation?

        # The web URL that was cited for this reference.
        @[JSON::Field(key: "web")]
        getter web : Types::WebLocation?

        def initialize(
          @document_char : Types::DocumentCharLocation? = nil,
          @document_chunk : Types::DocumentChunkLocation? = nil,
          @document_page : Types::DocumentPageLocation? = nil,
          @search_result_location : Types::SearchResultLocation? = nil,
          @web : Types::WebLocation? = nil
        )
        end
      end

      # Contains the actual text content from a source document that is being cited or referenced in the
      # model's response.
      struct CitationSourceContent
        include JSON::Serializable

        # The text content from the source document that is being cited.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Contains incremental updates to the source content text during streaming responses, allowing clients
      # to build up the cited content progressively.
      struct CitationSourceContentDelta
        include JSON::Serializable

        # An incremental update to the text content from the source document that is being cited.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Configuration settings for enabling and controlling document citations in Converse API responses.
      # When enabled, the model can include citation information that links generated content back to
      # specific source documents.
      struct CitationsConfig
        include JSON::Serializable

        # Specifies whether citations from the selected document should be used in the model's response. When
        # set to true, the model can generate citations that reference the source documents used to inform the
        # response.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # A content block that contains both generated text and associated citation information. This block
      # type is returned when document citations are enabled, providing traceability between the generated
      # content and the source documents that informed the response.
      struct CitationsContentBlock
        include JSON::Serializable

        # An array of citations that reference the source documents used to generate the associated content.
        @[JSON::Field(key: "citations")]
        getter citations : Array(Types::Citation)?

        # The generated content that is supported by the associated citations.
        @[JSON::Field(key: "content")]
        getter content : Array(Types::CitationGeneratedContent)?

        def initialize(
          @citations : Array(Types::Citation)? = nil,
          @content : Array(Types::CitationGeneratedContent)? = nil
        )
        end
      end

      # Contains incremental updates to citation information during streaming responses. This allows clients
      # to build up citation data progressively as the response is generated.
      struct CitationsDelta
        include JSON::Serializable

        # Specifies the precise location within a source document where cited content can be found. This can
        # include character-level positions, page numbers, or document chunks depending on the document type
        # and indexing method.
        @[JSON::Field(key: "location")]
        getter location : Types::CitationLocation?

        # The source from the original search result that provided the cited content.
        @[JSON::Field(key: "source")]
        getter source : String?

        # The specific content from the source document that was referenced or cited in the generated
        # response.
        @[JSON::Field(key: "sourceContent")]
        getter source_content : Array(Types::CitationSourceContentDelta)?

        # The title or identifier of the source document being cited.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @location : Types::CitationLocation? = nil,
          @source : String? = nil,
          @source_content : Array(Types::CitationSourceContentDelta)? = nil,
          @title : String? = nil
        )
        end
      end

      # Error occurred because of a conflict while performing an operation.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A block of content for a message that you pass to, or receive from, a model with the Converse or
      # ConverseStream API operations.
      struct ContentBlock
        include JSON::Serializable

        # An audio content block containing audio data in the conversation.
        @[JSON::Field(key: "audio")]
        getter audio : Types::AudioBlock?

        # CachePoint to include in the message.
        @[JSON::Field(key: "cachePoint")]
        getter cache_point : Types::CachePointBlock?

        # A content block that contains both generated text and associated citation information, providing
        # traceability between the response and source documents.
        @[JSON::Field(key: "citationsContent")]
        getter citations_content : Types::CitationsContentBlock?

        # A document to include in the message.
        @[JSON::Field(key: "document")]
        getter document : Types::DocumentBlock?

        # Contains the content to assess with the guardrail. If you don't specify guardContent in a call to
        # the Converse API, the guardrail (if passed in the Converse API) assesses the entire message. For
        # more information, see Use a guardrail with the Converse API in the Amazon Bedrock User Guide .
        @[JSON::Field(key: "guardContent")]
        getter guard_content : Types::GuardrailConverseContentBlock?

        # Image to include in the message. This field is only supported by Anthropic Claude 3 models.
        @[JSON::Field(key: "image")]
        getter image : Types::ImageBlock?

        # Contains content regarding the reasoning that is carried out by the model. Reasoning refers to a
        # Chain of Thought (CoT) that the model generates to enhance the accuracy of its final response.
        @[JSON::Field(key: "reasoningContent")]
        getter reasoning_content : Types::ReasoningContentBlock?

        # Search result to include in the message.
        @[JSON::Field(key: "searchResult")]
        getter search_result : Types::SearchResultBlock?

        # Text to include in the message.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The result for a tool request that a model makes.
        @[JSON::Field(key: "toolResult")]
        getter tool_result : Types::ToolResultBlock?

        # Information about a tool use request from a model.
        @[JSON::Field(key: "toolUse")]
        getter tool_use : Types::ToolUseBlock?

        # Video to include in the message.
        @[JSON::Field(key: "video")]
        getter video : Types::VideoBlock?

        def initialize(
          @audio : Types::AudioBlock? = nil,
          @cache_point : Types::CachePointBlock? = nil,
          @citations_content : Types::CitationsContentBlock? = nil,
          @document : Types::DocumentBlock? = nil,
          @guard_content : Types::GuardrailConverseContentBlock? = nil,
          @image : Types::ImageBlock? = nil,
          @reasoning_content : Types::ReasoningContentBlock? = nil,
          @search_result : Types::SearchResultBlock? = nil,
          @text : String? = nil,
          @tool_result : Types::ToolResultBlock? = nil,
          @tool_use : Types::ToolUseBlock? = nil,
          @video : Types::VideoBlock? = nil
        )
        end
      end

      # A block of content in a streaming response.
      struct ContentBlockDelta
        include JSON::Serializable

        # Incremental citation information that is streamed as part of the response generation process.
        @[JSON::Field(key: "citation")]
        getter citation : Types::CitationsDelta?

        # A streaming delta event containing incremental image data.
        @[JSON::Field(key: "image")]
        getter image : Types::ImageBlockDelta?

        # Contains content regarding the reasoning that is carried out by the model. Reasoning refers to a
        # Chain of Thought (CoT) that the model generates to enhance the accuracy of its final response.
        @[JSON::Field(key: "reasoningContent")]
        getter reasoning_content : Types::ReasoningContentBlockDelta?

        # The content text.
        @[JSON::Field(key: "text")]
        getter text : String?

        # An incremental update that contains the results from a tool call.
        @[JSON::Field(key: "toolResult")]
        getter tool_result : Array(Types::ToolResultBlockDelta)?

        # Information about a tool that the model is requesting to use.
        @[JSON::Field(key: "toolUse")]
        getter tool_use : Types::ToolUseBlockDelta?

        def initialize(
          @citation : Types::CitationsDelta? = nil,
          @image : Types::ImageBlockDelta? = nil,
          @reasoning_content : Types::ReasoningContentBlockDelta? = nil,
          @text : String? = nil,
          @tool_result : Array(Types::ToolResultBlockDelta)? = nil,
          @tool_use : Types::ToolUseBlockDelta? = nil
        )
        end
      end

      # The content block delta event.
      struct ContentBlockDeltaEvent
        include JSON::Serializable

        # The block index for a content block delta event.
        @[JSON::Field(key: "contentBlockIndex")]
        getter content_block_index : Int32

        # The delta for a content block delta event.
        @[JSON::Field(key: "delta")]
        getter delta : Types::ContentBlockDelta

        def initialize(
          @content_block_index : Int32,
          @delta : Types::ContentBlockDelta
        )
        end
      end

      # Content block start information.
      struct ContentBlockStart
        include JSON::Serializable

        # The initial event indicating the start of a streaming image block.
        @[JSON::Field(key: "image")]
        getter image : Types::ImageBlockStart?

        # The
        @[JSON::Field(key: "toolResult")]
        getter tool_result : Types::ToolResultBlockStart?

        # Information about a tool that the model is requesting to use.
        @[JSON::Field(key: "toolUse")]
        getter tool_use : Types::ToolUseBlockStart?

        def initialize(
          @image : Types::ImageBlockStart? = nil,
          @tool_result : Types::ToolResultBlockStart? = nil,
          @tool_use : Types::ToolUseBlockStart? = nil
        )
        end
      end

      # Content block start event.
      struct ContentBlockStartEvent
        include JSON::Serializable

        # The index for a content block start event.
        @[JSON::Field(key: "contentBlockIndex")]
        getter content_block_index : Int32

        # Start information about a content block start event.
        @[JSON::Field(key: "start")]
        getter start : Types::ContentBlockStart

        def initialize(
          @content_block_index : Int32,
          @start : Types::ContentBlockStart
        )
        end
      end

      # A content block stop event.
      struct ContentBlockStopEvent
        include JSON::Serializable

        # The index for a content block.
        @[JSON::Field(key: "contentBlockIndex")]
        getter content_block_index : Int32

        def initialize(
          @content_block_index : Int32
        )
        end
      end

      # Metrics for a call to Converse .
      struct ConverseMetrics
        include JSON::Serializable

        # The latency of the call to Converse , in milliseconds.
        @[JSON::Field(key: "latencyMs")]
        getter latency_ms : Int64

        def initialize(
          @latency_ms : Int64
        )
        end
      end

      # The output from a call to Converse .
      struct ConverseOutput
        include JSON::Serializable

        # The message that the model generates.
        @[JSON::Field(key: "message")]
        getter message : Types::Message?

        def initialize(
          @message : Types::Message? = nil
        )
        end
      end

      struct ConverseRequest
        include JSON::Serializable

        # Specifies the model or throughput with which to run inference, or the prompt resource to use in
        # inference. The value depends on the resource that you use: If you use a base model, specify the
        # model ID or its ARN. For a list of model IDs for base models, see Amazon Bedrock base model IDs
        # (on-demand throughput) in the Amazon Bedrock User Guide. If you use an inference profile, specify
        # the inference profile ID or its ARN. For a list of inference profile IDs, see Supported Regions and
        # models for cross-region inference in the Amazon Bedrock User Guide. If you use a provisioned model,
        # specify the ARN of the Provisioned Throughput. For more information, see Run inference using a
        # Provisioned Throughput in the Amazon Bedrock User Guide. If you use a custom model, first purchase
        # Provisioned Throughput for it. Then specify the ARN of the resulting provisioned model. For more
        # information, see Use a custom model in Amazon Bedrock in the Amazon Bedrock User Guide. To include a
        # prompt that was defined in Prompt management , specify the ARN of the prompt version to use. The
        # Converse API doesn't support imported models .
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Additional inference parameters that the model supports, beyond the base set of inference parameters
        # that Converse and ConverseStream support in the inferenceConfig field. For more information, see
        # Model parameters .
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Types::Document?

        # Additional model parameters field paths to return in the response. Converse and ConverseStream
        # return the requested fields as a JSON Pointer object in the additionalModelResponseFields field. The
        # following is example JSON for additionalModelResponseFieldPaths . [ "/stop_sequence" ] For
        # information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF)
        # documentation. Converse and ConverseStream reject an empty JSON Pointer or incorrectly structured
        # JSON Pointer with a 400 error code. if the JSON Pointer is valid, but the requested field is not in
        # the model response, it is ignored by Converse .
        @[JSON::Field(key: "additionalModelResponseFieldPaths")]
        getter additional_model_response_field_paths : Array(String)?

        # Configuration information for a guardrail that you want to use in the request. If you include
        # guardContent blocks in the content field in the messages field, the guardrail operates only on those
        # messages. If you include no guardContent blocks, the guardrail operates on all messages in the
        # request body and in any included prompt resource.
        @[JSON::Field(key: "guardrailConfig")]
        getter guardrail_config : Types::GuardrailConfiguration?

        # Inference parameters to pass to the model. Converse and ConverseStream support a base set of
        # inference parameters. If you need to pass additional parameters that the model supports, use the
        # additionalModelRequestFields request field.
        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::InferenceConfiguration?

        # The messages that you want to send to the model.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        # Model performance settings for the request.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # Contains a map of variables in a prompt from Prompt management to objects containing the values to
        # fill in for them when running model invocation. This field is ignored if you don't specify a prompt
        # resource in the modelId field.
        @[JSON::Field(key: "promptVariables")]
        getter prompt_variables : Hash(String, Types::PromptVariableValues)?

        # Key-value pairs that you can use to filter invocation logs.
        @[JSON::Field(key: "requestMetadata")]
        getter request_metadata : Hash(String, String)?

        # Specifies the processing tier configuration used for serving the request.
        @[JSON::Field(key: "serviceTier")]
        getter service_tier : Types::ServiceTier?

        # A prompt that provides instructions or context to the model about the task it should perform, or the
        # persona it should adopt during the conversation.
        @[JSON::Field(key: "system")]
        getter system : Array(Types::SystemContentBlock)?

        # Configuration information for the tools that the model can use when generating a response. For
        # information about models that support tool use, see Supported models and model features .
        @[JSON::Field(key: "toolConfig")]
        getter tool_config : Types::ToolConfiguration?

        def initialize(
          @model_id : String,
          @additional_model_request_fields : Types::Document? = nil,
          @additional_model_response_field_paths : Array(String)? = nil,
          @guardrail_config : Types::GuardrailConfiguration? = nil,
          @inference_config : Types::InferenceConfiguration? = nil,
          @messages : Array(Types::Message)? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @prompt_variables : Hash(String, Types::PromptVariableValues)? = nil,
          @request_metadata : Hash(String, String)? = nil,
          @service_tier : Types::ServiceTier? = nil,
          @system : Array(Types::SystemContentBlock)? = nil,
          @tool_config : Types::ToolConfiguration? = nil
        )
        end
      end

      struct ConverseResponse
        include JSON::Serializable

        # Metrics for the call to Converse .
        @[JSON::Field(key: "metrics")]
        getter metrics : Types::ConverseMetrics

        # The result from the call to Converse .
        @[JSON::Field(key: "output")]
        getter output : Types::ConverseOutput

        # The reason why the model stopped generating output.
        @[JSON::Field(key: "stopReason")]
        getter stop_reason : String

        # The total number of tokens used in the call to Converse . The total includes the tokens input to the
        # model and the tokens generated by the model.
        @[JSON::Field(key: "usage")]
        getter usage : Types::TokenUsage

        # Additional fields in the response that are unique to the model.
        @[JSON::Field(key: "additionalModelResponseFields")]
        getter additional_model_response_fields : Types::Document?

        # Model performance settings for the request.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # Specifies the processing tier configuration used for serving the request.
        @[JSON::Field(key: "serviceTier")]
        getter service_tier : Types::ServiceTier?

        # A trace object that contains information about the Guardrail behavior.
        @[JSON::Field(key: "trace")]
        getter trace : Types::ConverseTrace?

        def initialize(
          @metrics : Types::ConverseMetrics,
          @output : Types::ConverseOutput,
          @stop_reason : String,
          @usage : Types::TokenUsage,
          @additional_model_response_fields : Types::Document? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @service_tier : Types::ServiceTier? = nil,
          @trace : Types::ConverseTrace? = nil
        )
        end
      end

      # A conversation stream metadata event.
      struct ConverseStreamMetadataEvent
        include JSON::Serializable

        # The metrics for the conversation stream metadata event.
        @[JSON::Field(key: "metrics")]
        getter metrics : Types::ConverseStreamMetrics

        # Usage information for the conversation stream event.
        @[JSON::Field(key: "usage")]
        getter usage : Types::TokenUsage

        # Model performance configuration metadata for the conversation stream event.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # Specifies the processing tier configuration used for serving the request.
        @[JSON::Field(key: "serviceTier")]
        getter service_tier : Types::ServiceTier?

        # The trace object in the response from ConverseStream that contains information about the guardrail
        # behavior.
        @[JSON::Field(key: "trace")]
        getter trace : Types::ConverseStreamTrace?

        def initialize(
          @metrics : Types::ConverseStreamMetrics,
          @usage : Types::TokenUsage,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @service_tier : Types::ServiceTier? = nil,
          @trace : Types::ConverseStreamTrace? = nil
        )
        end
      end

      # Metrics for the stream.
      struct ConverseStreamMetrics
        include JSON::Serializable

        # The latency for the streaming request, in milliseconds.
        @[JSON::Field(key: "latencyMs")]
        getter latency_ms : Int64

        def initialize(
          @latency_ms : Int64
        )
        end
      end

      # The messages output stream
      struct ConverseStreamOutput
        include JSON::Serializable

        # The messages output content block delta.
        @[JSON::Field(key: "contentBlockDelta")]
        getter content_block_delta : Types::ContentBlockDeltaEvent?

        # Start information for a content block.
        @[JSON::Field(key: "contentBlockStart")]
        getter content_block_start : Types::ContentBlockStartEvent?

        # Stop information for a content block.
        @[JSON::Field(key: "contentBlockStop")]
        getter content_block_stop : Types::ContentBlockStopEvent?

        # An internal server error occurred. Retry your request.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # Message start information.
        @[JSON::Field(key: "messageStart")]
        getter message_start : Types::MessageStartEvent?

        # Message stop information.
        @[JSON::Field(key: "messageStop")]
        getter message_stop : Types::MessageStopEvent?

        # Metadata for the converse output stream.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ConverseStreamMetadataEvent?

        # A streaming error occurred. Retry your request.
        @[JSON::Field(key: "modelStreamErrorException")]
        getter model_stream_error_exception : Types::ModelStreamErrorException?

        # The service isn't currently available. For troubleshooting this error, see ServiceUnavailable in the
        # Amazon Bedrock User Guide
        @[JSON::Field(key: "serviceUnavailableException")]
        getter service_unavailable_exception : Types::ServiceUnavailableException?

        # Your request was denied due to exceeding the account quotas for Amazon Bedrock . For troubleshooting
        # this error, see ThrottlingException in the Amazon Bedrock User Guide.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # The input fails to satisfy the constraints specified by Amazon Bedrock . For troubleshooting this
        # error, see ValidationError in the Amazon Bedrock User Guide.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @content_block_delta : Types::ContentBlockDeltaEvent? = nil,
          @content_block_start : Types::ContentBlockStartEvent? = nil,
          @content_block_stop : Types::ContentBlockStopEvent? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @message_start : Types::MessageStartEvent? = nil,
          @message_stop : Types::MessageStopEvent? = nil,
          @metadata : Types::ConverseStreamMetadataEvent? = nil,
          @model_stream_error_exception : Types::ModelStreamErrorException? = nil,
          @service_unavailable_exception : Types::ServiceUnavailableException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      struct ConverseStreamRequest
        include JSON::Serializable

        # Specifies the model or throughput with which to run inference, or the prompt resource to use in
        # inference. The value depends on the resource that you use: If you use a base model, specify the
        # model ID or its ARN. For a list of model IDs for base models, see Amazon Bedrock base model IDs
        # (on-demand throughput) in the Amazon Bedrock User Guide. If you use an inference profile, specify
        # the inference profile ID or its ARN. For a list of inference profile IDs, see Supported Regions and
        # models for cross-region inference in the Amazon Bedrock User Guide. If you use a provisioned model,
        # specify the ARN of the Provisioned Throughput. For more information, see Run inference using a
        # Provisioned Throughput in the Amazon Bedrock User Guide. If you use a custom model, first purchase
        # Provisioned Throughput for it. Then specify the ARN of the resulting provisioned model. For more
        # information, see Use a custom model in Amazon Bedrock in the Amazon Bedrock User Guide. To include a
        # prompt that was defined in Prompt management , specify the ARN of the prompt version to use. The
        # Converse API doesn't support imported models .
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Additional inference parameters that the model supports, beyond the base set of inference parameters
        # that Converse and ConverseStream support in the inferenceConfig field. For more information, see
        # Model parameters .
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Types::Document?

        # Additional model parameters field paths to return in the response. Converse and ConverseStream
        # return the requested fields as a JSON Pointer object in the additionalModelResponseFields field. The
        # following is example JSON for additionalModelResponseFieldPaths . [ "/stop_sequence" ] For
        # information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF)
        # documentation. Converse and ConverseStream reject an empty JSON Pointer or incorrectly structured
        # JSON Pointer with a 400 error code. if the JSON Pointer is valid, but the requested field is not in
        # the model response, it is ignored by Converse .
        @[JSON::Field(key: "additionalModelResponseFieldPaths")]
        getter additional_model_response_field_paths : Array(String)?

        # Configuration information for a guardrail that you want to use in the request. If you include
        # guardContent blocks in the content field in the messages field, the guardrail operates only on those
        # messages. If you include no guardContent blocks, the guardrail operates on all messages in the
        # request body and in any included prompt resource.
        @[JSON::Field(key: "guardrailConfig")]
        getter guardrail_config : Types::GuardrailStreamConfiguration?

        # Inference parameters to pass to the model. Converse and ConverseStream support a base set of
        # inference parameters. If you need to pass additional parameters that the model supports, use the
        # additionalModelRequestFields request field.
        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::InferenceConfiguration?

        # The messages that you want to send to the model.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        # Model performance settings for the request.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # Contains a map of variables in a prompt from Prompt management to objects containing the values to
        # fill in for them when running model invocation. This field is ignored if you don't specify a prompt
        # resource in the modelId field.
        @[JSON::Field(key: "promptVariables")]
        getter prompt_variables : Hash(String, Types::PromptVariableValues)?

        # Key-value pairs that you can use to filter invocation logs.
        @[JSON::Field(key: "requestMetadata")]
        getter request_metadata : Hash(String, String)?

        # Specifies the processing tier configuration used for serving the request.
        @[JSON::Field(key: "serviceTier")]
        getter service_tier : Types::ServiceTier?

        # A prompt that provides instructions or context to the model about the task it should perform, or the
        # persona it should adopt during the conversation.
        @[JSON::Field(key: "system")]
        getter system : Array(Types::SystemContentBlock)?

        # Configuration information for the tools that the model can use when generating a response. For
        # information about models that support streaming tool use, see Supported models and model features .
        @[JSON::Field(key: "toolConfig")]
        getter tool_config : Types::ToolConfiguration?

        def initialize(
          @model_id : String,
          @additional_model_request_fields : Types::Document? = nil,
          @additional_model_response_field_paths : Array(String)? = nil,
          @guardrail_config : Types::GuardrailStreamConfiguration? = nil,
          @inference_config : Types::InferenceConfiguration? = nil,
          @messages : Array(Types::Message)? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @prompt_variables : Hash(String, Types::PromptVariableValues)? = nil,
          @request_metadata : Hash(String, String)? = nil,
          @service_tier : Types::ServiceTier? = nil,
          @system : Array(Types::SystemContentBlock)? = nil,
          @tool_config : Types::ToolConfiguration? = nil
        )
        end
      end

      struct ConverseStreamResponse
        include JSON::Serializable

        # The output stream that the model generated.
        @[JSON::Field(key: "stream")]
        getter stream : Types::ConverseStreamOutput?

        def initialize(
          @stream : Types::ConverseStreamOutput? = nil
        )
        end
      end

      # The trace object in a response from ConverseStream .
      struct ConverseStreamTrace
        include JSON::Serializable

        # The guardrail trace object.
        @[JSON::Field(key: "guardrail")]
        getter guardrail : Types::GuardrailTraceAssessment?

        # The request's prompt router.
        @[JSON::Field(key: "promptRouter")]
        getter prompt_router : Types::PromptRouterTrace?

        def initialize(
          @guardrail : Types::GuardrailTraceAssessment? = nil,
          @prompt_router : Types::PromptRouterTrace? = nil
        )
        end
      end

      # The inputs from a Converse API request for token counting. This structure mirrors the input format
      # for the Converse operation, allowing you to count tokens for conversation-based inference requests.
      struct ConverseTokensRequest
        include JSON::Serializable

        # The additionalModelRequestFields of Converse input request to count tokens for. Use this field when
        # you want to pass additional parameters that the model supports.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Types::Document?

        # An array of messages to count tokens for.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        # The system content blocks to count tokens for. System content provides instructions or context to
        # the model about how it should behave or respond. The token count will include any system content
        # provided.
        @[JSON::Field(key: "system")]
        getter system : Array(Types::SystemContentBlock)?

        # The toolConfig of Converse input request to count tokens for. Configuration information for the
        # tools that the model can use when generating a response.
        @[JSON::Field(key: "toolConfig")]
        getter tool_config : Types::ToolConfiguration?

        def initialize(
          @additional_model_request_fields : Types::Document? = nil,
          @messages : Array(Types::Message)? = nil,
          @system : Array(Types::SystemContentBlock)? = nil,
          @tool_config : Types::ToolConfiguration? = nil
        )
        end
      end

      # The trace object in a response from Converse .
      struct ConverseTrace
        include JSON::Serializable

        # The guardrail trace object.
        @[JSON::Field(key: "guardrail")]
        getter guardrail : Types::GuardrailTraceAssessment?

        # The request's prompt router.
        @[JSON::Field(key: "promptRouter")]
        getter prompt_router : Types::PromptRouterTrace?

        def initialize(
          @guardrail : Types::GuardrailTraceAssessment? = nil,
          @prompt_router : Types::PromptRouterTrace? = nil
        )
        end
      end

      # The input value for token counting. The value should be either an InvokeModel or Converse request
      # body.
      struct CountTokensInput
        include JSON::Serializable

        # A Converse request for which to count tokens. Use this field when you want to count tokens for a
        # conversation-based input that would be sent to the Converse operation.
        @[JSON::Field(key: "converse")]
        getter converse : Types::ConverseTokensRequest?

        # An InvokeModel request for which to count tokens. Use this field when you want to count tokens for a
        # raw text input that would be sent to the InvokeModel operation.
        @[JSON::Field(key: "invokeModel")]
        getter invoke_model : Types::InvokeModelTokensRequest?

        def initialize(
          @converse : Types::ConverseTokensRequest? = nil,
          @invoke_model : Types::InvokeModelTokensRequest? = nil
        )
        end
      end

      struct CountTokensRequest
        include JSON::Serializable

        # The input for which to count tokens. The structure of this parameter depends on whether you're
        # counting tokens for an InvokeModel or Converse request: For InvokeModel requests, provide the
        # request body in the invokeModel field For Converse requests, provide the messages and system content
        # in the converse field The input format must be compatible with the model specified in the modelId
        # parameter.
        @[JSON::Field(key: "input")]
        getter input : Types::CountTokensInput

        # The unique identifier or ARN of the foundation model to use for token counting. Each model processes
        # tokens differently, so the token count is specific to the model you specify.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @input : Types::CountTokensInput,
          @model_id : String
        )
        end
      end

      struct CountTokensResponse
        include JSON::Serializable

        # The number of tokens in the provided input according to the specified model's tokenization rules.
        # This count represents the number of input tokens that would be processed if the same input were sent
        # to the model in an inference request. Use this value to estimate costs and ensure your inputs stay
        # within model token limits.
        @[JSON::Field(key: "inputTokens")]
        getter input_tokens : Int32

        def initialize(
          @input_tokens : Int32
        )
        end
      end

      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # A document to include in a message.
      struct DocumentBlock
        include JSON::Serializable

        # A name for the document. The name can only contain the following characters: Alphanumeric characters
        # Whitespace characters (no more than one in a row) Hyphens Parentheses Square brackets This field is
        # vulnerable to prompt injections, because the model might inadvertently interpret it as instructions.
        # Therefore, we recommend that you specify a neutral name.
        @[JSON::Field(key: "name")]
        getter name : String

        # Contains the content of the document.
        @[JSON::Field(key: "source")]
        getter source : Types::DocumentSource

        # Configuration settings that control how citations should be generated for this specific document.
        @[JSON::Field(key: "citations")]
        getter citations : Types::CitationsConfig?

        # Contextual information about how the document should be processed or interpreted by the model when
        # generating citations.
        @[JSON::Field(key: "context")]
        getter context : String?

        # The format of a document, or its extension.
        @[JSON::Field(key: "format")]
        getter format : String?

        def initialize(
          @name : String,
          @source : Types::DocumentSource,
          @citations : Types::CitationsConfig? = nil,
          @context : String? = nil,
          @format : String? = nil
        )
        end
      end

      # Specifies a character-level location within a document, providing precise positioning information
      # for cited content using start and end character indices.
      struct DocumentCharLocation
        include JSON::Serializable

        # The index of the document within the array of documents provided in the request.
        @[JSON::Field(key: "documentIndex")]
        getter document_index : Int32?

        # The ending character position of the cited content within the document.
        @[JSON::Field(key: "end")]
        getter end : Int32?

        # The starting character position of the cited content within the document.
        @[JSON::Field(key: "start")]
        getter start : Int32?

        def initialize(
          @document_index : Int32? = nil,
          @end : Int32? = nil,
          @start : Int32? = nil
        )
        end
      end

      # Specifies a chunk-level location within a document, providing positioning information for cited
      # content using logical document segments or chunks.
      struct DocumentChunkLocation
        include JSON::Serializable

        # The index of the document within the array of documents provided in the request.
        @[JSON::Field(key: "documentIndex")]
        getter document_index : Int32?

        # The ending chunk identifier or index of the cited content within the document.
        @[JSON::Field(key: "end")]
        getter end : Int32?

        # The starting chunk identifier or index of the cited content within the document.
        @[JSON::Field(key: "start")]
        getter start : Int32?

        def initialize(
          @document_index : Int32? = nil,
          @end : Int32? = nil,
          @start : Int32? = nil
        )
        end
      end

      # Contains the actual content of a document that can be processed by the model and potentially cited
      # in the response.
      struct DocumentContentBlock
        include JSON::Serializable

        # The text content of the document.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Specifies a page-level location within a document, providing positioning information for cited
      # content using page numbers.
      struct DocumentPageLocation
        include JSON::Serializable

        # The index of the document within the array of documents provided in the request.
        @[JSON::Field(key: "documentIndex")]
        getter document_index : Int32?

        # The ending page number of the cited content within the document.
        @[JSON::Field(key: "end")]
        getter end : Int32?

        # The starting page number of the cited content within the document.
        @[JSON::Field(key: "start")]
        getter start : Int32?

        def initialize(
          @document_index : Int32? = nil,
          @end : Int32? = nil,
          @start : Int32? = nil
        )
        end
      end

      # Contains the content of a document.
      struct DocumentSource
        include JSON::Serializable

        # The raw bytes for the document. If you use an Amazon Web Services SDK, you don't need to encode the
        # bytes in base64.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        # The structured content of the document source, which may include various content blocks such as
        # text, images, or other document elements.
        @[JSON::Field(key: "content")]
        getter content : Array(Types::DocumentContentBlock)?

        # The location of a document object in an Amazon S3 bucket. To see which models support S3 uploads,
        # see Supported models and features for Converse .
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        # The text content of the document source.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @bytes : Bytes? = nil,
          @content : Array(Types::DocumentContentBlock)? = nil,
          @s3_location : Types::S3Location? = nil,
          @text : String? = nil
        )
        end
      end

      # A block containing error information when content processing fails.
      struct ErrorBlock
        include JSON::Serializable

        # A human-readable error message describing what went wrong during content processing.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct GetAsyncInvokeRequest
        include JSON::Serializable

        # The invocation's ARN.
        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        def initialize(
          @invocation_arn : String
        )
        end
      end

      struct GetAsyncInvokeResponse
        include JSON::Serializable

        # The invocation's ARN.
        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        # The invocation's model ARN.
        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Output data settings.
        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::AsyncInvokeOutputDataConfig

        # The invocation's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the invocation request was submitted.
        @[JSON::Field(key: "submitTime")]
        getter submit_time : Time

        # The invocation's idempotency token.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # When the invocation ended.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # An error message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The invocation's last modified time.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        def initialize(
          @invocation_arn : String,
          @model_arn : String,
          @output_data_config : Types::AsyncInvokeOutputDataConfig,
          @status : String,
          @submit_time : Time,
          @client_request_token : String? = nil,
          @end_time : Time? = nil,
          @failure_message : String? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end

      # A behavior assessment of the guardrail policies used in a call to the Converse API.
      struct GuardrailAssessment
        include JSON::Serializable

        @[JSON::Field(key: "appliedGuardrailDetails")]
        getter applied_guardrail_details : Types::AppliedGuardrailDetails?

        # The automated reasoning policy assessment results, including logical validation findings for the
        # input content.
        @[JSON::Field(key: "automatedReasoningPolicy")]
        getter automated_reasoning_policy : Types::GuardrailAutomatedReasoningPolicyAssessment?

        # The content policy.
        @[JSON::Field(key: "contentPolicy")]
        getter content_policy : Types::GuardrailContentPolicyAssessment?

        # The contextual grounding policy used for the guardrail assessment.
        @[JSON::Field(key: "contextualGroundingPolicy")]
        getter contextual_grounding_policy : Types::GuardrailContextualGroundingPolicyAssessment?

        # The invocation metrics for the guardrail assessment.
        @[JSON::Field(key: "invocationMetrics")]
        getter invocation_metrics : Types::GuardrailInvocationMetrics?

        # The sensitive information policy.
        @[JSON::Field(key: "sensitiveInformationPolicy")]
        getter sensitive_information_policy : Types::GuardrailSensitiveInformationPolicyAssessment?

        # The topic policy.
        @[JSON::Field(key: "topicPolicy")]
        getter topic_policy : Types::GuardrailTopicPolicyAssessment?

        # The word policy.
        @[JSON::Field(key: "wordPolicy")]
        getter word_policy : Types::GuardrailWordPolicyAssessment?

        def initialize(
          @applied_guardrail_details : Types::AppliedGuardrailDetails? = nil,
          @automated_reasoning_policy : Types::GuardrailAutomatedReasoningPolicyAssessment? = nil,
          @content_policy : Types::GuardrailContentPolicyAssessment? = nil,
          @contextual_grounding_policy : Types::GuardrailContextualGroundingPolicyAssessment? = nil,
          @invocation_metrics : Types::GuardrailInvocationMetrics? = nil,
          @sensitive_information_policy : Types::GuardrailSensitiveInformationPolicyAssessment? = nil,
          @topic_policy : Types::GuardrailTopicPolicyAssessment? = nil,
          @word_policy : Types::GuardrailWordPolicyAssessment? = nil
        )
        end
      end

      # Represents a logical validation result from automated reasoning policy evaluation. The finding
      # indicates whether claims in the input are logically valid, invalid, satisfiable, impossible, or have
      # other logical issues.
      struct GuardrailAutomatedReasoningFinding
        include JSON::Serializable

        # Contains the result when the automated reasoning evaluation determines that no valid logical
        # conclusions can be drawn due to contradictions in the premises or policy rules themselves.
        @[JSON::Field(key: "impossible")]
        getter impossible : Types::GuardrailAutomatedReasoningImpossibleFinding?

        # Contains the result when the automated reasoning evaluation determines that the claims in the input
        # are logically invalid and contradict the established premises or policy rules.
        @[JSON::Field(key: "invalid")]
        getter invalid : Types::GuardrailAutomatedReasoningInvalidFinding?

        # Contains the result when the automated reasoning evaluation cannot extract any relevant logical
        # information from the input that can be validated against the policy rules.
        @[JSON::Field(key: "noTranslations")]
        getter no_translations : Types::GuardrailAutomatedReasoningNoTranslationsFinding?

        # Contains the result when the automated reasoning evaluation determines that the claims in the input
        # could be either true or false depending on additional assumptions not provided in the input context.
        @[JSON::Field(key: "satisfiable")]
        getter satisfiable : Types::GuardrailAutomatedReasoningSatisfiableFinding?

        # Contains the result when the automated reasoning evaluation cannot process the input due to its
        # complexity or volume exceeding the system's processing capacity for logical analysis.
        @[JSON::Field(key: "tooComplex")]
        getter too_complex : Types::GuardrailAutomatedReasoningTooComplexFinding?

        # Contains the result when the automated reasoning evaluation detects that the input has multiple
        # valid logical interpretations, requiring additional context or clarification to proceed with
        # validation.
        @[JSON::Field(key: "translationAmbiguous")]
        getter translation_ambiguous : Types::GuardrailAutomatedReasoningTranslationAmbiguousFinding?

        # Contains the result when the automated reasoning evaluation determines that the claims in the input
        # are logically valid and definitively true based on the provided premises and policy rules.
        @[JSON::Field(key: "valid")]
        getter valid : Types::GuardrailAutomatedReasoningValidFinding?

        def initialize(
          @impossible : Types::GuardrailAutomatedReasoningImpossibleFinding? = nil,
          @invalid : Types::GuardrailAutomatedReasoningInvalidFinding? = nil,
          @no_translations : Types::GuardrailAutomatedReasoningNoTranslationsFinding? = nil,
          @satisfiable : Types::GuardrailAutomatedReasoningSatisfiableFinding? = nil,
          @too_complex : Types::GuardrailAutomatedReasoningTooComplexFinding? = nil,
          @translation_ambiguous : Types::GuardrailAutomatedReasoningTranslationAmbiguousFinding? = nil,
          @valid : Types::GuardrailAutomatedReasoningValidFinding? = nil
        )
        end
      end

      # Indicates that no valid claims can be made due to logical contradictions in the premises or rules.
      struct GuardrailAutomatedReasoningImpossibleFinding
        include JSON::Serializable

        # The automated reasoning policy rules that contradict the claims and/or premises in the input.
        @[JSON::Field(key: "contradictingRules")]
        getter contradicting_rules : Array(Types::GuardrailAutomatedReasoningRule)?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.
        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::GuardrailAutomatedReasoningLogicWarning?

        # The logical translation of the input that this finding evaluates.
        @[JSON::Field(key: "translation")]
        getter translation : Types::GuardrailAutomatedReasoningTranslation?

        def initialize(
          @contradicting_rules : Array(Types::GuardrailAutomatedReasoningRule)? = nil,
          @logic_warning : Types::GuardrailAutomatedReasoningLogicWarning? = nil,
          @translation : Types::GuardrailAutomatedReasoningTranslation? = nil
        )
        end
      end

      # References a portion of the original input text that corresponds to logical elements.
      struct GuardrailAutomatedReasoningInputTextReference
        include JSON::Serializable

        # The specific text from the original input that this reference points to.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Indicates that the claims are logically false and contradictory to the established rules or
      # premises.
      struct GuardrailAutomatedReasoningInvalidFinding
        include JSON::Serializable

        # The automated reasoning policy rules that contradict the claims in the input.
        @[JSON::Field(key: "contradictingRules")]
        getter contradicting_rules : Array(Types::GuardrailAutomatedReasoningRule)?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.
        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::GuardrailAutomatedReasoningLogicWarning?

        # The logical translation of the input that this finding invalidates.
        @[JSON::Field(key: "translation")]
        getter translation : Types::GuardrailAutomatedReasoningTranslation?

        def initialize(
          @contradicting_rules : Array(Types::GuardrailAutomatedReasoningRule)? = nil,
          @logic_warning : Types::GuardrailAutomatedReasoningLogicWarning? = nil,
          @translation : Types::GuardrailAutomatedReasoningTranslation? = nil
        )
        end
      end

      # Identifies logical issues in the translated statements that exist independent of any policy rules,
      # such as statements that are always true or always false.
      struct GuardrailAutomatedReasoningLogicWarning
        include JSON::Serializable

        # The logical statements that are validated while assuming the policy and premises.
        @[JSON::Field(key: "claims")]
        getter claims : Array(Types::GuardrailAutomatedReasoningStatement)?

        # The logical statements that serve as premises under which the claims are validated.
        @[JSON::Field(key: "premises")]
        getter premises : Array(Types::GuardrailAutomatedReasoningStatement)?

        # The category of the detected logical issue, such as statements that are always true or always false.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @claims : Array(Types::GuardrailAutomatedReasoningStatement)? = nil,
          @premises : Array(Types::GuardrailAutomatedReasoningStatement)? = nil,
          @type : String? = nil
        )
        end
      end

      # Indicates that no relevant logical information could be extracted from the input for validation.
      struct GuardrailAutomatedReasoningNoTranslationsFinding
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the results of automated reasoning policy evaluation, including logical findings about the
      # validity of claims made in the input content.
      struct GuardrailAutomatedReasoningPolicyAssessment
        include JSON::Serializable

        # List of logical validation results produced by evaluating the input content against automated
        # reasoning policies.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::GuardrailAutomatedReasoningFinding)?

        def initialize(
          @findings : Array(Types::GuardrailAutomatedReasoningFinding)? = nil
        )
        end
      end

      # References a specific automated reasoning policy rule that was applied during evaluation.
      struct GuardrailAutomatedReasoningRule
        include JSON::Serializable

        # The unique identifier of the automated reasoning rule.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # The ARN of the automated reasoning policy version that contains this rule.
        @[JSON::Field(key: "policyVersionArn")]
        getter policy_version_arn : String?

        def initialize(
          @identifier : String? = nil,
          @policy_version_arn : String? = nil
        )
        end
      end

      # Indicates that the claims could be either true or false depending on additional assumptions not
      # provided in the input.
      struct GuardrailAutomatedReasoningSatisfiableFinding
        include JSON::Serializable

        # An example scenario demonstrating how the claims could be logically false.
        @[JSON::Field(key: "claimsFalseScenario")]
        getter claims_false_scenario : Types::GuardrailAutomatedReasoningScenario?

        # An example scenario demonstrating how the claims could be logically true.
        @[JSON::Field(key: "claimsTrueScenario")]
        getter claims_true_scenario : Types::GuardrailAutomatedReasoningScenario?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.
        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::GuardrailAutomatedReasoningLogicWarning?

        # The logical translation of the input that this finding evaluates.
        @[JSON::Field(key: "translation")]
        getter translation : Types::GuardrailAutomatedReasoningTranslation?

        def initialize(
          @claims_false_scenario : Types::GuardrailAutomatedReasoningScenario? = nil,
          @claims_true_scenario : Types::GuardrailAutomatedReasoningScenario? = nil,
          @logic_warning : Types::GuardrailAutomatedReasoningLogicWarning? = nil,
          @translation : Types::GuardrailAutomatedReasoningTranslation? = nil
        )
        end
      end

      # Represents a logical scenario where claims can be evaluated as true or false, containing specific
      # logical assignments.
      struct GuardrailAutomatedReasoningScenario
        include JSON::Serializable

        # List of logical assignments and statements that define this scenario.
        @[JSON::Field(key: "statements")]
        getter statements : Array(Types::GuardrailAutomatedReasoningStatement)?

        def initialize(
          @statements : Array(Types::GuardrailAutomatedReasoningStatement)? = nil
        )
        end
      end

      # A logical statement that includes both formal logic representation and natural language explanation.
      struct GuardrailAutomatedReasoningStatement
        include JSON::Serializable

        # The formal logical representation of the statement.
        @[JSON::Field(key: "logic")]
        getter logic : String?

        # The natural language explanation of the logical statement.
        @[JSON::Field(key: "naturalLanguage")]
        getter natural_language : String?

        def initialize(
          @logic : String? = nil,
          @natural_language : String? = nil
        )
        end
      end

      # Indicates that the input exceeds the processing capacity due to the volume or complexity of the
      # logical information.
      struct GuardrailAutomatedReasoningTooComplexFinding
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the logical translation of natural language input into formal logical statements, including
      # premises, claims, and confidence scores.
      struct GuardrailAutomatedReasoningTranslation
        include JSON::Serializable

        # The logical statements that are being validated against the premises and policy rules.
        @[JSON::Field(key: "claims")]
        getter claims : Array(Types::GuardrailAutomatedReasoningStatement)?

        # A confidence score between 0 and 1 indicating how certain the system is about the logical
        # translation.
        @[JSON::Field(key: "confidence")]
        getter confidence : Float64?

        # The logical statements that serve as the foundation or assumptions for the claims.
        @[JSON::Field(key: "premises")]
        getter premises : Array(Types::GuardrailAutomatedReasoningStatement)?

        # References to portions of the original input text that correspond to the claims but could not be
        # fully translated.
        @[JSON::Field(key: "untranslatedClaims")]
        getter untranslated_claims : Array(Types::GuardrailAutomatedReasoningInputTextReference)?

        # References to portions of the original input text that correspond to the premises but could not be
        # fully translated.
        @[JSON::Field(key: "untranslatedPremises")]
        getter untranslated_premises : Array(Types::GuardrailAutomatedReasoningInputTextReference)?

        def initialize(
          @claims : Array(Types::GuardrailAutomatedReasoningStatement)? = nil,
          @confidence : Float64? = nil,
          @premises : Array(Types::GuardrailAutomatedReasoningStatement)? = nil,
          @untranslated_claims : Array(Types::GuardrailAutomatedReasoningInputTextReference)? = nil,
          @untranslated_premises : Array(Types::GuardrailAutomatedReasoningInputTextReference)? = nil
        )
        end
      end

      # Indicates that the input has multiple valid logical interpretations, requiring additional context or
      # clarification.
      struct GuardrailAutomatedReasoningTranslationAmbiguousFinding
        include JSON::Serializable

        # Scenarios showing how the different translation options differ in meaning.
        @[JSON::Field(key: "differenceScenarios")]
        getter difference_scenarios : Array(Types::GuardrailAutomatedReasoningScenario)?

        # Different logical interpretations that were detected during translation of the input.
        @[JSON::Field(key: "options")]
        getter options : Array(Types::GuardrailAutomatedReasoningTranslationOption)?

        def initialize(
          @difference_scenarios : Array(Types::GuardrailAutomatedReasoningScenario)? = nil,
          @options : Array(Types::GuardrailAutomatedReasoningTranslationOption)? = nil
        )
        end
      end

      # Represents one possible logical interpretation of ambiguous input content.
      struct GuardrailAutomatedReasoningTranslationOption
        include JSON::Serializable

        # Example translations that provide this possible interpretation of the input.
        @[JSON::Field(key: "translations")]
        getter translations : Array(Types::GuardrailAutomatedReasoningTranslation)?

        def initialize(
          @translations : Array(Types::GuardrailAutomatedReasoningTranslation)? = nil
        )
        end
      end

      # Indicates that the claims are definitively true and logically implied by the premises, with no
      # possible alternative interpretations.
      struct GuardrailAutomatedReasoningValidFinding
        include JSON::Serializable

        # An example scenario demonstrating how the claims are logically true.
        @[JSON::Field(key: "claimsTrueScenario")]
        getter claims_true_scenario : Types::GuardrailAutomatedReasoningScenario?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.
        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::GuardrailAutomatedReasoningLogicWarning?

        # The automated reasoning policy rules that support why this result is considered valid.
        @[JSON::Field(key: "supportingRules")]
        getter supporting_rules : Array(Types::GuardrailAutomatedReasoningRule)?

        # The logical translation of the input that this finding validates.
        @[JSON::Field(key: "translation")]
        getter translation : Types::GuardrailAutomatedReasoningTranslation?

        def initialize(
          @claims_true_scenario : Types::GuardrailAutomatedReasoningScenario? = nil,
          @logic_warning : Types::GuardrailAutomatedReasoningLogicWarning? = nil,
          @supporting_rules : Array(Types::GuardrailAutomatedReasoningRule)? = nil,
          @translation : Types::GuardrailAutomatedReasoningTranslation? = nil
        )
        end
      end

      # Configuration information for a guardrail that you use with the Converse operation.
      struct GuardrailConfiguration
        include JSON::Serializable

        # The identifier for the guardrail.
        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String?

        # The version of the guardrail.
        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String?

        # The trace behavior for the guardrail.
        @[JSON::Field(key: "trace")]
        getter trace : String?

        def initialize(
          @guardrail_identifier : String? = nil,
          @guardrail_version : String? = nil,
          @trace : String? = nil
        )
        end
      end

      # The content block to be evaluated by the guardrail.
      struct GuardrailContentBlock
        include JSON::Serializable

        # Image within guardrail content block to be evaluated by the guardrail.
        @[JSON::Field(key: "image")]
        getter image : Types::GuardrailImageBlock?

        # Text within content block to be evaluated by the guardrail.
        @[JSON::Field(key: "text")]
        getter text : Types::GuardrailTextBlock?

        def initialize(
          @image : Types::GuardrailImageBlock? = nil,
          @text : Types::GuardrailTextBlock? = nil
        )
        end
      end

      # The content filter for a guardrail.
      struct GuardrailContentFilter
        include JSON::Serializable

        # The guardrail action.
        @[JSON::Field(key: "action")]
        getter action : String

        # The guardrail confidence.
        @[JSON::Field(key: "confidence")]
        getter confidence : String

        # The guardrail type.
        @[JSON::Field(key: "type")]
        getter type : String

        # Indicates whether content that breaches the guardrail configuration is detected.
        @[JSON::Field(key: "detected")]
        getter detected : Bool?

        # The filter strength setting for the guardrail content filter.
        @[JSON::Field(key: "filterStrength")]
        getter filter_strength : String?

        def initialize(
          @action : String,
          @confidence : String,
          @type : String,
          @detected : Bool? = nil,
          @filter_strength : String? = nil
        )
        end
      end

      # An assessment of a content policy for a guardrail.
      struct GuardrailContentPolicyAssessment
        include JSON::Serializable

        # The content policy filters.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::GuardrailContentFilter)

        def initialize(
          @filters : Array(Types::GuardrailContentFilter)
        )
        end
      end

      # The details for the guardrails contextual grounding filter.
      struct GuardrailContextualGroundingFilter
        include JSON::Serializable

        # The action performed by the guardrails contextual grounding filter.
        @[JSON::Field(key: "action")]
        getter action : String

        # The score generated by contextual grounding filter.
        @[JSON::Field(key: "score")]
        getter score : Float64

        # The threshold used by contextual grounding filter to determine whether the content is grounded or
        # not.
        @[JSON::Field(key: "threshold")]
        getter threshold : Float64

        # The contextual grounding filter type.
        @[JSON::Field(key: "type")]
        getter type : String

        # Indicates whether content that fails the contextual grounding evaluation (grounding or relevance
        # score less than the corresponding threshold) was detected.
        @[JSON::Field(key: "detected")]
        getter detected : Bool?

        def initialize(
          @action : String,
          @score : Float64,
          @threshold : Float64,
          @type : String,
          @detected : Bool? = nil
        )
        end
      end

      # The policy assessment details for the guardrails contextual grounding filter.
      struct GuardrailContextualGroundingPolicyAssessment
        include JSON::Serializable

        # The filter details for the guardrails contextual grounding filter.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::GuardrailContextualGroundingFilter)?

        def initialize(
          @filters : Array(Types::GuardrailContextualGroundingFilter)? = nil
        )
        end
      end

      # A content block for selective guarding with the Converse or ConverseStream API operations.
      struct GuardrailConverseContentBlock
        include JSON::Serializable

        # Image within converse content block to be evaluated by the guardrail.
        @[JSON::Field(key: "image")]
        getter image : Types::GuardrailConverseImageBlock?

        # The text to guard.
        @[JSON::Field(key: "text")]
        getter text : Types::GuardrailConverseTextBlock?

        def initialize(
          @image : Types::GuardrailConverseImageBlock? = nil,
          @text : Types::GuardrailConverseTextBlock? = nil
        )
        end
      end

      # An image block that contains images that you want to assess with a guardrail.
      struct GuardrailConverseImageBlock
        include JSON::Serializable

        # The format details for the image type of the guardrail converse image block.
        @[JSON::Field(key: "format")]
        getter format : String

        # The image source (image bytes) of the guardrail converse image block.
        @[JSON::Field(key: "source")]
        getter source : Types::GuardrailConverseImageSource

        def initialize(
          @format : String,
          @source : Types::GuardrailConverseImageSource
        )
        end
      end

      # The image source (image bytes) of the guardrail converse image source.
      struct GuardrailConverseImageSource
        include JSON::Serializable

        # The raw image bytes for the image.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @bytes : Bytes? = nil
        )
        end
      end

      # A text block that contains text that you want to assess with a guardrail. For more information, see
      # GuardrailConverseContentBlock .
      struct GuardrailConverseTextBlock
        include JSON::Serializable

        # The text that you want to guard.
        @[JSON::Field(key: "text")]
        getter text : String

        # The qualifier details for the guardrails contextual grounding filter.
        @[JSON::Field(key: "qualifiers")]
        getter qualifiers : Array(String)?

        def initialize(
          @text : String,
          @qualifiers : Array(String)? = nil
        )
        end
      end

      # The action of the guardrail coverage details.
      struct GuardrailCoverage
        include JSON::Serializable

        # The guardrail coverage for images (the number of images that guardrails guarded).
        @[JSON::Field(key: "images")]
        getter images : Types::GuardrailImageCoverage?

        # The text characters of the guardrail coverage details.
        @[JSON::Field(key: "textCharacters")]
        getter text_characters : Types::GuardrailTextCharactersCoverage?

        def initialize(
          @images : Types::GuardrailImageCoverage? = nil,
          @text_characters : Types::GuardrailTextCharactersCoverage? = nil
        )
        end
      end

      # A custom word configured in a guardrail.
      struct GuardrailCustomWord
        include JSON::Serializable

        # The action for the custom word.
        @[JSON::Field(key: "action")]
        getter action : String

        # The match for the custom word.
        @[JSON::Field(key: "match")]
        getter match : String

        # Indicates whether custom word content that breaches the guardrail configuration is detected.
        @[JSON::Field(key: "detected")]
        getter detected : Bool?

        def initialize(
          @action : String,
          @match : String,
          @detected : Bool? = nil
        )
        end
      end

      # Contain an image which user wants guarded. This block is accepted by the guardrails independent API.
      struct GuardrailImageBlock
        include JSON::Serializable

        # The format details for the file type of the image blocked by the guardrail.
        @[JSON::Field(key: "format")]
        getter format : String

        # The image source (image bytes) details of the image blocked by the guardrail.
        @[JSON::Field(key: "source")]
        getter source : Types::GuardrailImageSource

        def initialize(
          @format : String,
          @source : Types::GuardrailImageSource
        )
        end
      end

      # The details of the guardrail image coverage.
      struct GuardrailImageCoverage
        include JSON::Serializable

        # The count (integer) of images guardrails guarded.
        @[JSON::Field(key: "guarded")]
        getter guarded : Int32?

        # Represents the total number of images (integer) that were in the request (guarded and unguarded).
        @[JSON::Field(key: "total")]
        getter total : Int32?

        def initialize(
          @guarded : Int32? = nil,
          @total : Int32? = nil
        )
        end
      end

      # The image source (image bytes) of the guardrail image source. Object used in independent api.
      struct GuardrailImageSource
        include JSON::Serializable

        # The bytes details of the guardrail image source. Object used in independent api.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @bytes : Bytes? = nil
        )
        end
      end

      # The invocation metrics for the guardrail.
      struct GuardrailInvocationMetrics
        include JSON::Serializable

        # The coverage details for the guardrail invocation metrics.
        @[JSON::Field(key: "guardrailCoverage")]
        getter guardrail_coverage : Types::GuardrailCoverage?

        # The processing latency details for the guardrail invocation metrics.
        @[JSON::Field(key: "guardrailProcessingLatency")]
        getter guardrail_processing_latency : Int64?

        # The usage details for the guardrail invocation metrics.
        @[JSON::Field(key: "usage")]
        getter usage : Types::GuardrailUsage?

        def initialize(
          @guardrail_coverage : Types::GuardrailCoverage? = nil,
          @guardrail_processing_latency : Int64? = nil,
          @usage : Types::GuardrailUsage? = nil
        )
        end
      end

      # A managed word configured in a guardrail.
      struct GuardrailManagedWord
        include JSON::Serializable

        # The action for the managed word.
        @[JSON::Field(key: "action")]
        getter action : String

        # The match for the managed word.
        @[JSON::Field(key: "match")]
        getter match : String

        # The type for the managed word.
        @[JSON::Field(key: "type")]
        getter type : String

        # Indicates whether managed word content that breaches the guardrail configuration is detected.
        @[JSON::Field(key: "detected")]
        getter detected : Bool?

        def initialize(
          @action : String,
          @match : String,
          @type : String,
          @detected : Bool? = nil
        )
        end
      end

      # The output content produced by the guardrail.
      struct GuardrailOutputContent
        include JSON::Serializable

        # The specific text for the output content produced by the guardrail.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # A Personally Identifiable Information (PII) entity configured in a guardrail.
      struct GuardrailPiiEntityFilter
        include JSON::Serializable

        # The PII entity filter action.
        @[JSON::Field(key: "action")]
        getter action : String

        # The PII entity filter match.
        @[JSON::Field(key: "match")]
        getter match : String

        # The PII entity filter type.
        @[JSON::Field(key: "type")]
        getter type : String

        # Indicates whether personally identifiable information (PII) that breaches the guardrail
        # configuration is detected.
        @[JSON::Field(key: "detected")]
        getter detected : Bool?

        def initialize(
          @action : String,
          @match : String,
          @type : String,
          @detected : Bool? = nil
        )
        end
      end

      # A Regex filter configured in a guardrail.
      struct GuardrailRegexFilter
        include JSON::Serializable

        # The region filter action.
        @[JSON::Field(key: "action")]
        getter action : String

        # Indicates whether custom regex entities that breach the guardrail configuration are detected.
        @[JSON::Field(key: "detected")]
        getter detected : Bool?

        # The regesx filter match.
        @[JSON::Field(key: "match")]
        getter match : String?

        # The regex filter name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The regex query.
        @[JSON::Field(key: "regex")]
        getter regex : String?

        def initialize(
          @action : String,
          @detected : Bool? = nil,
          @match : String? = nil,
          @name : String? = nil,
          @regex : String? = nil
        )
        end
      end

      # The assessment for a Personally Identifiable Information (PII) policy.
      struct GuardrailSensitiveInformationPolicyAssessment
        include JSON::Serializable

        # The PII entities in the assessment.
        @[JSON::Field(key: "piiEntities")]
        getter pii_entities : Array(Types::GuardrailPiiEntityFilter)

        # The regex queries in the assessment.
        @[JSON::Field(key: "regexes")]
        getter regexes : Array(Types::GuardrailRegexFilter)

        def initialize(
          @pii_entities : Array(Types::GuardrailPiiEntityFilter),
          @regexes : Array(Types::GuardrailRegexFilter)
        )
        end
      end

      # Configuration information for a guardrail that you use with the ConverseStream action.
      struct GuardrailStreamConfiguration
        include JSON::Serializable

        # The identifier for the guardrail.
        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String?

        # The version of the guardrail.
        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String?

        # The processing mode. The processing mode. For more information, see Configure streaming response
        # behavior in the Amazon Bedrock User Guide .
        @[JSON::Field(key: "streamProcessingMode")]
        getter stream_processing_mode : String?

        # The trace behavior for the guardrail.
        @[JSON::Field(key: "trace")]
        getter trace : String?

        def initialize(
          @guardrail_identifier : String? = nil,
          @guardrail_version : String? = nil,
          @stream_processing_mode : String? = nil,
          @trace : String? = nil
        )
        end
      end

      # The text block to be evaluated by the guardrail.
      struct GuardrailTextBlock
        include JSON::Serializable

        # The input text details to be evaluated by the guardrail.
        @[JSON::Field(key: "text")]
        getter text : String

        # The qualifiers describing the text block.
        @[JSON::Field(key: "qualifiers")]
        getter qualifiers : Array(String)?

        def initialize(
          @text : String,
          @qualifiers : Array(String)? = nil
        )
        end
      end

      # The guardrail coverage for the text characters.
      struct GuardrailTextCharactersCoverage
        include JSON::Serializable

        # The text characters that were guarded by the guardrail coverage.
        @[JSON::Field(key: "guarded")]
        getter guarded : Int32?

        # The total text characters by the guardrail coverage.
        @[JSON::Field(key: "total")]
        getter total : Int32?

        def initialize(
          @guarded : Int32? = nil,
          @total : Int32? = nil
        )
        end
      end

      # Information about a topic guardrail.
      struct GuardrailTopic
        include JSON::Serializable

        # The action the guardrail should take when it intervenes on a topic.
        @[JSON::Field(key: "action")]
        getter action : String

        # The name for the guardrail.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type behavior that the guardrail should perform when the model detects the topic.
        @[JSON::Field(key: "type")]
        getter type : String

        # Indicates whether topic content that breaches the guardrail configuration is detected.
        @[JSON::Field(key: "detected")]
        getter detected : Bool?

        def initialize(
          @action : String,
          @name : String,
          @type : String,
          @detected : Bool? = nil
        )
        end
      end

      # A behavior assessment of a topic policy.
      struct GuardrailTopicPolicyAssessment
        include JSON::Serializable

        # The topics in the assessment.
        @[JSON::Field(key: "topics")]
        getter topics : Array(Types::GuardrailTopic)

        def initialize(
          @topics : Array(Types::GuardrailTopic)
        )
        end
      end

      # A Top level guardrail trace object. For more information, see ConverseTrace .
      struct GuardrailTraceAssessment
        include JSON::Serializable

        # Provides the reason for the action taken when harmful content is detected.
        @[JSON::Field(key: "actionReason")]
        getter action_reason : String?

        # The input assessment.
        @[JSON::Field(key: "inputAssessment")]
        getter input_assessment : Hash(String, Types::GuardrailAssessment)?

        # The output from the model.
        @[JSON::Field(key: "modelOutput")]
        getter model_output : Array(String)?

        # the output assessments.
        @[JSON::Field(key: "outputAssessments")]
        getter output_assessments : Hash(String, Array(Types::GuardrailAssessment))?

        def initialize(
          @action_reason : String? = nil,
          @input_assessment : Hash(String, Types::GuardrailAssessment)? = nil,
          @model_output : Array(String)? = nil,
          @output_assessments : Hash(String, Array(Types::GuardrailAssessment))? = nil
        )
        end
      end

      # The details on the use of the guardrail.
      struct GuardrailUsage
        include JSON::Serializable

        # The content policy units processed by the guardrail.
        @[JSON::Field(key: "contentPolicyUnits")]
        getter content_policy_units : Int32

        # The contextual grounding policy units processed by the guardrail.
        @[JSON::Field(key: "contextualGroundingPolicyUnits")]
        getter contextual_grounding_policy_units : Int32

        # The sensitive information policy free units processed by the guardrail.
        @[JSON::Field(key: "sensitiveInformationPolicyFreeUnits")]
        getter sensitive_information_policy_free_units : Int32

        # The sensitive information policy units processed by the guardrail.
        @[JSON::Field(key: "sensitiveInformationPolicyUnits")]
        getter sensitive_information_policy_units : Int32

        # The topic policy units processed by the guardrail.
        @[JSON::Field(key: "topicPolicyUnits")]
        getter topic_policy_units : Int32

        # The word policy units processed by the guardrail.
        @[JSON::Field(key: "wordPolicyUnits")]
        getter word_policy_units : Int32

        # The number of automated reasoning policies that were processed during the guardrail evaluation.
        @[JSON::Field(key: "automatedReasoningPolicies")]
        getter automated_reasoning_policies : Int32?

        # The number of text units processed by the automated reasoning policy.
        @[JSON::Field(key: "automatedReasoningPolicyUnits")]
        getter automated_reasoning_policy_units : Int32?

        # The content policy image units processed by the guardrail.
        @[JSON::Field(key: "contentPolicyImageUnits")]
        getter content_policy_image_units : Int32?

        def initialize(
          @content_policy_units : Int32,
          @contextual_grounding_policy_units : Int32,
          @sensitive_information_policy_free_units : Int32,
          @sensitive_information_policy_units : Int32,
          @topic_policy_units : Int32,
          @word_policy_units : Int32,
          @automated_reasoning_policies : Int32? = nil,
          @automated_reasoning_policy_units : Int32? = nil,
          @content_policy_image_units : Int32? = nil
        )
        end
      end

      # The word policy assessment.
      struct GuardrailWordPolicyAssessment
        include JSON::Serializable

        # Custom words in the assessment.
        @[JSON::Field(key: "customWords")]
        getter custom_words : Array(Types::GuardrailCustomWord)

        # Managed word lists in the assessment.
        @[JSON::Field(key: "managedWordLists")]
        getter managed_word_lists : Array(Types::GuardrailManagedWord)

        def initialize(
          @custom_words : Array(Types::GuardrailCustomWord),
          @managed_word_lists : Array(Types::GuardrailManagedWord)
        )
        end
      end

      # Image content for a message.
      struct ImageBlock
        include JSON::Serializable

        # The format of the image.
        @[JSON::Field(key: "format")]
        getter format : String

        # The source for the image.
        @[JSON::Field(key: "source")]
        getter source : Types::ImageSource

        # Error information if the image block could not be processed or contains invalid data.
        @[JSON::Field(key: "error")]
        getter error : Types::ErrorBlock?

        def initialize(
          @format : String,
          @source : Types::ImageSource,
          @error : Types::ErrorBlock? = nil
        )
        end
      end

      # A streaming delta event that contains incremental image data during streaming responses.
      struct ImageBlockDelta
        include JSON::Serializable

        # Error information if this image delta could not be processed.
        @[JSON::Field(key: "error")]
        getter error : Types::ErrorBlock?

        # The incremental image source data for this delta event.
        @[JSON::Field(key: "source")]
        getter source : Types::ImageSource?

        def initialize(
          @error : Types::ErrorBlock? = nil,
          @source : Types::ImageSource? = nil
        )
        end
      end

      # The initial event in a streaming image block that indicates the start of image content.
      struct ImageBlockStart
        include JSON::Serializable

        # The format of the image data that will be streamed in subsequent delta events.
        @[JSON::Field(key: "format")]
        getter format : String

        def initialize(
          @format : String
        )
        end
      end

      # The source for an image.
      struct ImageSource
        include JSON::Serializable

        # The raw image bytes for the image. If you use an AWS SDK, you don't need to encode the image bytes
        # in base64.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        # The location of an image object in an Amazon S3 bucket. To see which models support S3 uploads, see
        # Supported models and features for Converse .
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @bytes : Bytes? = nil,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # Base inference parameters to pass to a model in a call to Converse or ConverseStream . For more
      # information, see Inference parameters for foundation models . If you need to pass additional
      # parameters that the model supports, use the additionalModelRequestFields request field in the call
      # to Converse or ConverseStream . For more information, see Model parameters .
      struct InferenceConfiguration
        include JSON::Serializable

        # The maximum number of tokens to allow in the generated response. The default value is the maximum
        # allowed value for the model that you are using. For more information, see Inference parameters for
        # foundation models .
        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32?

        # A list of stop sequences. A stop sequence is a sequence of characters that causes the model to stop
        # generating the response.
        @[JSON::Field(key: "stopSequences")]
        getter stop_sequences : Array(String)?

        # The likelihood of the model selecting higher-probability options while generating a response. A
        # lower value makes the model more likely to choose higher-probability options, while a higher value
        # makes the model more likely to choose lower-probability options. The default value is the default
        # value for the model that you are using. For more information, see Inference parameters for
        # foundation models .
        @[JSON::Field(key: "temperature")]
        getter temperature : Float64?

        # The percentage of most-likely candidates that the model considers for the next token. For example,
        # if you choose a value of 0.8 for topP , the model selects from the top 80% of the probability
        # distribution of tokens that could be next in the sequence. The default value is the default value
        # for the model that you are using. For more information, see Inference parameters for foundation
        # models .
        @[JSON::Field(key: "topP")]
        getter top_p : Float64?

        def initialize(
          @max_tokens : Int32? = nil,
          @stop_sequences : Array(String)? = nil,
          @temperature : Float64? = nil,
          @top_p : Float64? = nil
        )
        end
      end

      # An internal server error occurred. For troubleshooting this error, see InternalFailure in the Amazon
      # Bedrock User Guide
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct InvokeModelRequest
        include JSON::Serializable

        # The unique identifier of the model to invoke to run inference. The modelId to provide depends on the
        # type of model or throughput that you use: If you use a base model, specify the model ID or its ARN.
        # For a list of model IDs for base models, see Amazon Bedrock base model IDs (on-demand throughput) in
        # the Amazon Bedrock User Guide. If you use an inference profile, specify the inference profile ID or
        # its ARN. For a list of inference profile IDs, see Supported Regions and models for cross-region
        # inference in the Amazon Bedrock User Guide. If you use a provisioned model, specify the ARN of the
        # Provisioned Throughput. For more information, see Run inference using a Provisioned Throughput in
        # the Amazon Bedrock User Guide. If you use a custom model, specify the ARN of the custom model
        # deployment (for on-demand inference) or the ARN of your provisioned model (for Provisioned
        # Throughput). For more information, see Use a custom model in Amazon Bedrock in the Amazon Bedrock
        # User Guide. If you use an imported model , specify the ARN of the imported model. You can get the
        # model ARN from a successful call to CreateModelImportJob or from the Imported models page in the
        # Amazon Bedrock console.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The desired MIME type of the inference body in the response. The default value is application/json .
        @[JSON::Field(key: "Accept")]
        getter accept : String?

        # The prompt and inference parameters in the format specified in the contentType in the header. You
        # must provide the body in JSON format. To see the format and content of the request and response
        # bodies for different models, refer to Inference parameters . For more information, see Run inference
        # in the Bedrock User Guide.
        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The MIME type of the input data in the request. You must specify application/json .
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The unique identifier of the guardrail that you want to use. If you don't provide a value, no
        # guardrail is applied to the invocation. An error will be thrown in the following situations. You
        # don't provide a guardrail identifier but you specify the amazon-bedrock-guardrailConfig field in the
        # request body. You enable the guardrail but the contentType isn't application/json . You provide a
        # guardrail identifier, but guardrailVersion isn't specified.
        @[JSON::Field(key: "X-Amzn-Bedrock-GuardrailIdentifier")]
        getter guardrail_identifier : String?

        # The version number for the guardrail. The value can also be DRAFT .
        @[JSON::Field(key: "X-Amzn-Bedrock-GuardrailVersion")]
        getter guardrail_version : String?

        # Model performance settings for the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-PerformanceConfig-Latency")]
        getter performance_config_latency : String?

        # Specifies the processing tier type used for serving the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-Service-Tier")]
        getter service_tier : String?

        # Specifies whether to enable or disable the Bedrock trace. If enabled, you can see the full Bedrock
        # trace.
        @[JSON::Field(key: "X-Amzn-Bedrock-Trace")]
        getter trace : String?

        def initialize(
          @model_id : String,
          @accept : String? = nil,
          @body : Bytes? = nil,
          @content_type : String? = nil,
          @guardrail_identifier : String? = nil,
          @guardrail_version : String? = nil,
          @performance_config_latency : String? = nil,
          @service_tier : String? = nil,
          @trace : String? = nil
        )
        end
      end

      struct InvokeModelResponse
        include JSON::Serializable

        # Inference response from the model in the format specified in the contentType header. To see the
        # format and content of the request and response bodies for different models, refer to Inference
        # parameters .
        @[JSON::Field(key: "body")]
        getter body : Bytes

        # The MIME type of the inference result.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String

        # Model performance settings for the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-PerformanceConfig-Latency")]
        getter performance_config_latency : String?

        # Specifies the processing tier type used for serving the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-Service-Tier")]
        getter service_tier : String?

        def initialize(
          @body : Bytes,
          @content_type : String,
          @performance_config_latency : String? = nil,
          @service_tier : String? = nil
        )
        end
      end

      # The body of an InvokeModel API request for token counting. This structure mirrors the input format
      # for the InvokeModel operation, allowing you to count tokens for raw text inference requests.
      struct InvokeModelTokensRequest
        include JSON::Serializable

        # The request body to count tokens for, formatted according to the model's expected input format. To
        # learn about the input format for different models, see Model inference parameters and responses .
        @[JSON::Field(key: "body")]
        getter body : Bytes

        def initialize(
          @body : Bytes
        )
        end
      end

      # Payload content, the speech chunk, for the bidirectional input of the invocation step.
      struct InvokeModelWithBidirectionalStreamInput
        include JSON::Serializable

        # The audio chunk that is used as input for the invocation step.
        @[JSON::Field(key: "chunk")]
        getter chunk : Types::BidirectionalInputPayloadPart?

        def initialize(
          @chunk : Types::BidirectionalInputPayloadPart? = nil
        )
        end
      end

      # Output from the bidirectional stream that was used for model invocation.
      struct InvokeModelWithBidirectionalStreamOutput
        include JSON::Serializable

        # The speech chunk that was provided as output from the invocation step.
        @[JSON::Field(key: "chunk")]
        getter chunk : Types::BidirectionalOutputPayloadPart?

        # The request encountered an unknown internal error.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # The request encountered an error with the model stream.
        @[JSON::Field(key: "modelStreamErrorException")]
        getter model_stream_error_exception : Types::ModelStreamErrorException?

        # The connection was closed because a request was not received within the timeout period.
        @[JSON::Field(key: "modelTimeoutException")]
        getter model_timeout_exception : Types::ModelTimeoutException?

        # The request has failed due to a temporary failure of the server.
        @[JSON::Field(key: "serviceUnavailableException")]
        getter service_unavailable_exception : Types::ServiceUnavailableException?

        # The request was denied due to request throttling.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @chunk : Types::BidirectionalOutputPayloadPart? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @model_stream_error_exception : Types::ModelStreamErrorException? = nil,
          @model_timeout_exception : Types::ModelTimeoutException? = nil,
          @service_unavailable_exception : Types::ServiceUnavailableException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      struct InvokeModelWithBidirectionalStreamRequest
        include JSON::Serializable

        # The prompt and inference parameters in the format specified in the BidirectionalInputPayloadPart in
        # the header. You must provide the body in JSON format. To see the format and content of the request
        # and response bodies for different models, refer to Inference parameters . For more information, see
        # Run inference in the Bedrock User Guide.
        @[JSON::Field(key: "body")]
        getter body : Types::InvokeModelWithBidirectionalStreamInput

        # The model ID or ARN of the model ID to use. Currently, only amazon.nova-sonic-v1:0 is supported.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @body : Types::InvokeModelWithBidirectionalStreamInput,
          @model_id : String
        )
        end
      end

      struct InvokeModelWithBidirectionalStreamResponse
        include JSON::Serializable

        # Streaming response from the model in the format specified by the BidirectionalOutputPayloadPart
        # header.
        @[JSON::Field(key: "body")]
        getter body : Types::InvokeModelWithBidirectionalStreamOutput

        def initialize(
          @body : Types::InvokeModelWithBidirectionalStreamOutput
        )
        end
      end

      struct InvokeModelWithResponseStreamRequest
        include JSON::Serializable

        # The unique identifier of the model to invoke to run inference. The modelId to provide depends on the
        # type of model or throughput that you use: If you use a base model, specify the model ID or its ARN.
        # For a list of model IDs for base models, see Amazon Bedrock base model IDs (on-demand throughput) in
        # the Amazon Bedrock User Guide. If you use an inference profile, specify the inference profile ID or
        # its ARN. For a list of inference profile IDs, see Supported Regions and models for cross-region
        # inference in the Amazon Bedrock User Guide. If you use a provisioned model, specify the ARN of the
        # Provisioned Throughput. For more information, see Run inference using a Provisioned Throughput in
        # the Amazon Bedrock User Guide. If you use a custom model, specify the ARN of the custom model
        # deployment (for on-demand inference) or the ARN of your provisioned model (for Provisioned
        # Throughput). For more information, see Use a custom model in Amazon Bedrock in the Amazon Bedrock
        # User Guide. If you use an imported model , specify the ARN of the imported model. You can get the
        # model ARN from a successful call to CreateModelImportJob or from the Imported models page in the
        # Amazon Bedrock console.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The desired MIME type of the inference body in the response. The default value is application/json .
        @[JSON::Field(key: "X-Amzn-Bedrock-Accept")]
        getter accept : String?

        # The prompt and inference parameters in the format specified in the contentType in the header. You
        # must provide the body in JSON format. To see the format and content of the request and response
        # bodies for different models, refer to Inference parameters . For more information, see Run inference
        # in the Bedrock User Guide.
        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The MIME type of the input data in the request. You must specify application/json .
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The unique identifier of the guardrail that you want to use. If you don't provide a value, no
        # guardrail is applied to the invocation. An error is thrown in the following situations. You don't
        # provide a guardrail identifier but you specify the amazon-bedrock-guardrailConfig field in the
        # request body. You enable the guardrail but the contentType isn't application/json . You provide a
        # guardrail identifier, but guardrailVersion isn't specified.
        @[JSON::Field(key: "X-Amzn-Bedrock-GuardrailIdentifier")]
        getter guardrail_identifier : String?

        # The version number for the guardrail. The value can also be DRAFT .
        @[JSON::Field(key: "X-Amzn-Bedrock-GuardrailVersion")]
        getter guardrail_version : String?

        # Model performance settings for the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-PerformanceConfig-Latency")]
        getter performance_config_latency : String?

        # Specifies the processing tier type used for serving the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-Service-Tier")]
        getter service_tier : String?

        # Specifies whether to enable or disable the Bedrock trace. If enabled, you can see the full Bedrock
        # trace.
        @[JSON::Field(key: "X-Amzn-Bedrock-Trace")]
        getter trace : String?

        def initialize(
          @model_id : String,
          @accept : String? = nil,
          @body : Bytes? = nil,
          @content_type : String? = nil,
          @guardrail_identifier : String? = nil,
          @guardrail_version : String? = nil,
          @performance_config_latency : String? = nil,
          @service_tier : String? = nil,
          @trace : String? = nil
        )
        end
      end

      struct InvokeModelWithResponseStreamResponse
        include JSON::Serializable

        # Inference response from the model in the format specified by the contentType header. To see the
        # format and content of this field for different models, refer to Inference parameters .
        @[JSON::Field(key: "body")]
        getter body : Types::ResponseStream

        # The MIME type of the inference result.
        @[JSON::Field(key: "X-Amzn-Bedrock-Content-Type")]
        getter content_type : String

        # Model performance settings for the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-PerformanceConfig-Latency")]
        getter performance_config_latency : String?

        # Specifies the processing tier type used for serving the request.
        @[JSON::Field(key: "X-Amzn-Bedrock-Service-Tier")]
        getter service_tier : String?

        def initialize(
          @body : Types::ResponseStream,
          @content_type : String,
          @performance_config_latency : String? = nil,
          @service_tier : String? = nil
        )
        end
      end

      struct ListAsyncInvokesRequest
        include JSON::Serializable

        # The maximum number of invocations to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # How to sort the response.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sorting order for the response.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # Filter invocations by status.
        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        # Include invocations submitted after this time.
        @[JSON::Field(key: "submitTimeAfter")]
        getter submit_time_after : Time?

        # Include invocations submitted before this time.
        @[JSON::Field(key: "submitTimeBefore")]
        getter submit_time_before : Time?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil,
          @submit_time_after : Time? = nil,
          @submit_time_before : Time? = nil
        )
        end
      end

      struct ListAsyncInvokesResponse
        include JSON::Serializable

        # A list of invocation summaries.
        @[JSON::Field(key: "asyncInvokeSummaries")]
        getter async_invoke_summaries : Array(Types::AsyncInvokeSummary)?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @async_invoke_summaries : Array(Types::AsyncInvokeSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A message input, or returned from, a call to Converse or ConverseStream .
      struct Message
        include JSON::Serializable

        # The message content. Note the following restrictions: You can include up to 20 images. Each image's
        # size, height, and width must be no more than 3.75 MB, 8000 px, and 8000 px, respectively. You can
        # include up to five documents. Each document's size must be no more than 4.5 MB. If you include a
        # ContentBlock with a document field in the array, you must also include a ContentBlock with a text
        # field. You can only include images and documents if the role is user .
        @[JSON::Field(key: "content")]
        getter content : Array(Types::ContentBlock)

        # The role that the message plays in the message.
        @[JSON::Field(key: "role")]
        getter role : String

        def initialize(
          @content : Array(Types::ContentBlock),
          @role : String
        )
        end
      end

      # The start of a message.
      struct MessageStartEvent
        include JSON::Serializable

        # The role for the message.
        @[JSON::Field(key: "role")]
        getter role : String

        def initialize(
          @role : String
        )
        end
      end

      # The stop event for a message.
      struct MessageStopEvent
        include JSON::Serializable

        # The reason why the model stopped generating output.
        @[JSON::Field(key: "stopReason")]
        getter stop_reason : String

        # The additional model response fields.
        @[JSON::Field(key: "additionalModelResponseFields")]
        getter additional_model_response_fields : Types::Document?

        def initialize(
          @stop_reason : String,
          @additional_model_response_fields : Types::Document? = nil
        )
        end
      end

      # The request failed due to an error while processing the model.
      struct ModelErrorException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The original status code.
        @[JSON::Field(key: "originalStatusCode")]
        getter original_status_code : Int32?

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @original_status_code : Int32? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct ModelInputPayload
        include JSON::Serializable

        def initialize
        end
      end

      # The model specified in the request is not ready to serve inference requests. The AWS SDK will
      # automatically retry the operation up to 5 times. For information about configuring automatic
      # retries, see Retry behavior in the AWS SDKs and Tools reference guide.
      struct ModelNotReadyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An error occurred while streaming the response. Retry your request.
      struct ModelStreamErrorException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The original message.
        @[JSON::Field(key: "originalMessage")]
        getter original_message : String?

        # The original status code.
        @[JSON::Field(key: "originalStatusCode")]
        getter original_status_code : Int32?

        def initialize(
          @message : String? = nil,
          @original_message : String? = nil,
          @original_status_code : Int32? = nil
        )
        end
      end

      # The request took too long to process. Processing time exceeded the model timeout length.
      struct ModelTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Payload content included in the response.
      struct PayloadPart
        include JSON::Serializable

        # Base64-encoded bytes of payload data.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @bytes : Bytes? = nil
        )
        end
      end

      # Performance settings for a model.
      struct PerformanceConfiguration
        include JSON::Serializable

        # To use a latency-optimized version of the model, set to optimized .
        @[JSON::Field(key: "latency")]
        getter latency : String?

        def initialize(
          @latency : String? = nil
        )
        end
      end

      # A prompt router trace.
      struct PromptRouterTrace
        include JSON::Serializable

        # The ID of the invoked model.
        @[JSON::Field(key: "invokedModelId")]
        getter invoked_model_id : String?

        def initialize(
          @invoked_model_id : String? = nil
        )
        end
      end

      # Contains a map of variables in a prompt from Prompt management to an object containing the values to
      # fill in for them when running model invocation. For more information, see How Prompt management
      # works .
      struct PromptVariableValues
        include JSON::Serializable

        # The text value that the variable maps to.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Contains content regarding the reasoning that is carried out by the model with respect to the
      # content in the content block. Reasoning refers to a Chain of Thought (CoT) that the model generates
      # to enhance the accuracy of its final response.
      struct ReasoningContentBlock
        include JSON::Serializable

        # The reasoning that the model used to return the output.
        @[JSON::Field(key: "reasoningText")]
        getter reasoning_text : Types::ReasoningTextBlock?

        # The content in the reasoning that was encrypted by the model provider for safety reasons. The
        # encryption doesn't affect the quality of responses.
        @[JSON::Field(key: "redactedContent")]
        getter redacted_content : Bytes?

        def initialize(
          @reasoning_text : Types::ReasoningTextBlock? = nil,
          @redacted_content : Bytes? = nil
        )
        end
      end

      # Contains content regarding the reasoning that is carried out by the model with respect to the
      # content in the content block. Reasoning refers to a Chain of Thought (CoT) that the model generates
      # to enhance the accuracy of its final response.
      struct ReasoningContentBlockDelta
        include JSON::Serializable

        # The content in the reasoning that was encrypted by the model provider for safety reasons. The
        # encryption doesn't affect the quality of responses.
        @[JSON::Field(key: "redactedContent")]
        getter redacted_content : Bytes?

        # A token that verifies that the reasoning text was generated by the model. If you pass a reasoning
        # block back to the API in a multi-turn conversation, include the text and its signature unmodified.
        @[JSON::Field(key: "signature")]
        getter signature : String?

        # The reasoning that the model used to return the output.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @redacted_content : Bytes? = nil,
          @signature : String? = nil,
          @text : String? = nil
        )
        end
      end

      # Contains the reasoning that the model used to return the output.
      struct ReasoningTextBlock
        include JSON::Serializable

        # The reasoning that the model used to return the output.
        @[JSON::Field(key: "text")]
        getter text : String

        # A token that verifies that the reasoning text was generated by the model. If you pass a reasoning
        # block back to the API in a multi-turn conversation, include the text and its signature unmodified.
        @[JSON::Field(key: "signature")]
        getter signature : String?

        def initialize(
          @text : String,
          @signature : String? = nil
        )
        end
      end

      # The specified resource ARN was not found. For troubleshooting this error, see ResourceNotFound in
      # the Amazon Bedrock User Guide
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Definition of content in the response stream.
      struct ResponseStream
        include JSON::Serializable

        # Content included in the response.
        @[JSON::Field(key: "chunk")]
        getter chunk : Types::PayloadPart?

        # An internal server error occurred. Retry your request.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # An error occurred while streaming the response. Retry your request.
        @[JSON::Field(key: "modelStreamErrorException")]
        getter model_stream_error_exception : Types::ModelStreamErrorException?

        # The request took too long to process. Processing time exceeded the model timeout length.
        @[JSON::Field(key: "modelTimeoutException")]
        getter model_timeout_exception : Types::ModelTimeoutException?

        # The service isn't available. Try again later.
        @[JSON::Field(key: "serviceUnavailableException")]
        getter service_unavailable_exception : Types::ServiceUnavailableException?

        # Your request was throttled because of service-wide limitations. Resubmit your request later or in a
        # different region. You can also purchase Provisioned Throughput to increase the rate or number of
        # tokens you can process.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # Input validation failed. Check your request parameters and retry the request.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @chunk : Types::PayloadPart? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @model_stream_error_exception : Types::ModelStreamErrorException? = nil,
          @model_timeout_exception : Types::ModelTimeoutException? = nil,
          @service_unavailable_exception : Types::ServiceUnavailableException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      # A storage location in an Amazon S3 bucket.
      struct S3Location
        include JSON::Serializable

        # An object URI starting with s3:// .
        @[JSON::Field(key: "uri")]
        getter uri : String

        # If the bucket belongs to another AWS account, specify that account's ID.
        @[JSON::Field(key: "bucketOwner")]
        getter bucket_owner : String?

        def initialize(
          @uri : String,
          @bucket_owner : String? = nil
        )
        end
      end

      # A search result block that enables natural citations with proper source attribution for retrieved
      # content. This field is only supported by Anthropic Claude Opus 4.1, Opus 4, Sonnet 4.5, Sonnet 4,
      # Sonnet 3.7, and 3.5 Haiku models.
      struct SearchResultBlock
        include JSON::Serializable

        # An array of search result content block.
        @[JSON::Field(key: "content")]
        getter content : Array(Types::SearchResultContentBlock)

        # The source URL or identifier for the content.
        @[JSON::Field(key: "source")]
        getter source : String

        # A descriptive title for the search result.
        @[JSON::Field(key: "title")]
        getter title : String

        # Configuration setting for citations
        @[JSON::Field(key: "citations")]
        getter citations : Types::CitationsConfig?

        def initialize(
          @content : Array(Types::SearchResultContentBlock),
          @source : String,
          @title : String,
          @citations : Types::CitationsConfig? = nil
        )
        end
      end

      # A block within a search result that contains the content.
      struct SearchResultContentBlock
        include JSON::Serializable

        # The actual text content
        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # Specifies a search result location within the content array, providing positioning information for
      # cited content using search result index and block positions.
      struct SearchResultLocation
        include JSON::Serializable

        # The ending position in the content array where the cited content ends.
        @[JSON::Field(key: "end")]
        getter end : Int32?

        # The index of the search result content block where the cited content is found.
        @[JSON::Field(key: "searchResultIndex")]
        getter search_result_index : Int32?

        # The starting position in the content array where the cited content begins.
        @[JSON::Field(key: "start")]
        getter start : Int32?

        def initialize(
          @end : Int32? = nil,
          @search_result_index : Int32? = nil,
          @start : Int32? = nil
        )
        end
      end

      # Your request exceeds the service quota for your account. You can view your quotas at Viewing service
      # quotas . You can resubmit your request later.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies the processing tier configuration used for serving the request.
      struct ServiceTier
        include JSON::Serializable

        # Specifies the processing tier type used for serving the request.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # The service isn't currently available. For troubleshooting this error, see ServiceUnavailable in the
      # Amazon Bedrock User Guide
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The model must request a specific tool. For example, {"tool" : {"name" : "Your tool name"}} . For
      # more information, see Call a tool with the Converse API in the Amazon Bedrock User Guide This field
      # is only supported by Anthropic Claude 3 models.
      struct SpecificToolChoice
        include JSON::Serializable

        # The name of the tool that the model must request.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct StartAsyncInvokeRequest
        include JSON::Serializable

        # The model to invoke.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Input to send to the model.
        @[JSON::Field(key: "modelInput")]
        getter model_input : Types::ModelInputPayload

        # Where to store the output.
        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::AsyncInvokeOutputDataConfig

        # Specify idempotency token to ensure that requests are not duplicated.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Tags to apply to the invocation.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @model_id : String,
          @model_input : Types::ModelInputPayload,
          @output_data_config : Types::AsyncInvokeOutputDataConfig,
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartAsyncInvokeResponse
        include JSON::Serializable

        # The ARN of the invocation.
        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        def initialize(
          @invocation_arn : String
        )
        end
      end

      # Contains configurations for instructions to provide the model for how to handle input. To learn
      # more, see Using the Converse API .
      struct SystemContentBlock
        include JSON::Serializable

        # CachePoint to include in the system prompt.
        @[JSON::Field(key: "cachePoint")]
        getter cache_point : Types::CachePointBlock?

        # A content block to assess with the guardrail. Use with the Converse or ConverseStream API
        # operations. For more information, see Use a guardrail with the Converse API in the Amazon Bedrock
        # User Guide .
        @[JSON::Field(key: "guardContent")]
        getter guard_content : Types::GuardrailConverseContentBlock?

        # A system prompt for the model.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @cache_point : Types::CachePointBlock? = nil,
          @guard_content : Types::GuardrailConverseContentBlock? = nil,
          @text : String? = nil
        )
        end
      end

      # Specifies a system-defined tool for the model to use. System-defined tools are tools that are
      # created and provided by the model provider.
      struct SystemTool
        include JSON::Serializable

        # The name of the system-defined tool that you want to call.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # A tag.
      struct Tag
        include JSON::Serializable

        # The tag's key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The tag's value.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Your request was denied due to exceeding the account quotas for Amazon Bedrock . For troubleshooting
      # this error, see ThrottlingException in the Amazon Bedrock User Guide
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The tokens used in a message API inference call.
      struct TokenUsage
        include JSON::Serializable

        # The number of tokens sent in the request to the model.
        @[JSON::Field(key: "inputTokens")]
        getter input_tokens : Int32

        # The number of tokens that the model generated for the request.
        @[JSON::Field(key: "outputTokens")]
        getter output_tokens : Int32

        # The total of input tokens and tokens generated by the model.
        @[JSON::Field(key: "totalTokens")]
        getter total_tokens : Int32

        # The number of input tokens read from the cache for the request.
        @[JSON::Field(key: "cacheReadInputTokens")]
        getter cache_read_input_tokens : Int32?

        # The number of input tokens written to the cache for the request.
        @[JSON::Field(key: "cacheWriteInputTokens")]
        getter cache_write_input_tokens : Int32?

        def initialize(
          @input_tokens : Int32,
          @output_tokens : Int32,
          @total_tokens : Int32,
          @cache_read_input_tokens : Int32? = nil,
          @cache_write_input_tokens : Int32? = nil
        )
        end
      end

      # Information about a tool that you can use with the Converse API. For more information, see Call a
      # tool with the Converse API in the Amazon Bedrock User Guide.
      struct Tool
        include JSON::Serializable

        # CachePoint to include in the tool configuration.
        @[JSON::Field(key: "cachePoint")]
        getter cache_point : Types::CachePointBlock?

        # Specifies the system-defined tool that you want use.
        @[JSON::Field(key: "systemTool")]
        getter system_tool : Types::SystemTool?

        # The specfication for the tool.
        @[JSON::Field(key: "toolSpec")]
        getter tool_spec : Types::ToolSpecification?

        def initialize(
          @cache_point : Types::CachePointBlock? = nil,
          @system_tool : Types::SystemTool? = nil,
          @tool_spec : Types::ToolSpecification? = nil
        )
        end
      end

      # Determines which tools the model should request in a call to Converse or ConverseStream . For more
      # information, see Call a tool with the Converse API in the Amazon Bedrock User Guide.
      struct ToolChoice
        include JSON::Serializable

        # The model must request at least one tool (no text is generated).
        @[JSON::Field(key: "any")]
        getter any : Types::AnyToolChoice?

        # (Default). The Model automatically decides if a tool should be called or whether to generate text
        # instead.
        @[JSON::Field(key: "auto")]
        getter auto : Types::AutoToolChoice?

        # The Model must request the specified tool. Only supported by Anthropic Claude 3 and Amazon Nova
        # models.
        @[JSON::Field(key: "tool")]
        getter tool : Types::SpecificToolChoice?

        def initialize(
          @any : Types::AnyToolChoice? = nil,
          @auto : Types::AutoToolChoice? = nil,
          @tool : Types::SpecificToolChoice? = nil
        )
        end
      end

      # Configuration information for the tools that you pass to a model. For more information, see Tool use
      # (function calling) in the Amazon Bedrock User Guide.
      struct ToolConfiguration
        include JSON::Serializable

        # An array of tools that you want to pass to a model.
        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)

        # If supported by model, forces the model to request a tool.
        @[JSON::Field(key: "toolChoice")]
        getter tool_choice : Types::ToolChoice?

        def initialize(
          @tools : Array(Types::Tool),
          @tool_choice : Types::ToolChoice? = nil
        )
        end
      end

      # The schema for the tool. The top level schema type must be object . For more information, see Call a
      # tool with the Converse API in the Amazon Bedrock User Guide.
      struct ToolInputSchema
        include JSON::Serializable

        # The JSON schema for the tool. For more information, see JSON Schema Reference .
        @[JSON::Field(key: "json")]
        getter json : Types::Document?

        def initialize(
          @json : Types::Document? = nil
        )
        end
      end

      # A tool result block that contains the results for a tool request that the model previously made. For
      # more information, see Call a tool with the Converse API in the Amazon Bedrock User Guide.
      struct ToolResultBlock
        include JSON::Serializable

        # The content for tool result content block.
        @[JSON::Field(key: "content")]
        getter content : Array(Types::ToolResultContentBlock)

        # The ID of the tool request that this is the result for.
        @[JSON::Field(key: "toolUseId")]
        getter tool_use_id : String

        # The status for the tool result content block. This field is only supported by Amazon Nova and
        # Anthropic Claude 3 and 4 models.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type for the tool result content block.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @content : Array(Types::ToolResultContentBlock),
          @tool_use_id : String,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains incremental updates to tool results information during streaming responses. This allows
      # clients to build up tool results data progressively as the response is generated.
      struct ToolResultBlockDelta
        include JSON::Serializable

        # The JSON schema for the tool result content block. see JSON Schema Reference .
        @[JSON::Field(key: "json")]
        getter json : Types::Document?

        # The reasoning the model used to return the output.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @json : Types::Document? = nil,
          @text : String? = nil
        )
        end
      end

      # The start of a tool result block. For more information, see Call a tool with the Converse API in the
      # Amazon Bedrock User Guide.
      struct ToolResultBlockStart
        include JSON::Serializable

        # The ID of the tool that was used to generate this tool result block.
        @[JSON::Field(key: "toolUseId")]
        getter tool_use_id : String

        # The status of the tool result block.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type for the tool that was used to generate this tool result block.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @tool_use_id : String,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The tool result content block. For more information, see Call a tool with the Converse API in the
      # Amazon Bedrock User Guide.
      struct ToolResultContentBlock
        include JSON::Serializable

        # A tool result that is a document.
        @[JSON::Field(key: "document")]
        getter document : Types::DocumentBlock?

        # A tool result that is an image. This field is only supported by Amazon Nova and Anthropic Claude 3
        # and 4 models.
        @[JSON::Field(key: "image")]
        getter image : Types::ImageBlock?

        # A tool result that is JSON format data.
        @[JSON::Field(key: "json")]
        getter json : Types::Document?

        # A tool result that is a search result.
        @[JSON::Field(key: "searchResult")]
        getter search_result : Types::SearchResultBlock?

        # A tool result that is text.
        @[JSON::Field(key: "text")]
        getter text : String?

        # A tool result that is video.
        @[JSON::Field(key: "video")]
        getter video : Types::VideoBlock?

        def initialize(
          @document : Types::DocumentBlock? = nil,
          @image : Types::ImageBlock? = nil,
          @json : Types::Document? = nil,
          @search_result : Types::SearchResultBlock? = nil,
          @text : String? = nil,
          @video : Types::VideoBlock? = nil
        )
        end
      end

      # The specification for the tool. For more information, see Call a tool with the Converse API in the
      # Amazon Bedrock User Guide.
      struct ToolSpecification
        include JSON::Serializable

        # The input schema for the tool in JSON format.
        @[JSON::Field(key: "inputSchema")]
        getter input_schema : Types::ToolInputSchema

        # The name for the tool.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description for the tool.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @input_schema : Types::ToolInputSchema,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # A tool use content block. Contains information about a tool that the model is requesting be run.,
      # The model uses the result from the tool to generate a response. For more information, see Call a
      # tool with the Converse API in the Amazon Bedrock User Guide.
      struct ToolUseBlock
        include JSON::Serializable

        # The input to pass to the tool.
        @[JSON::Field(key: "input")]
        getter input : Types::Document

        # The name of the tool that the model wants to use.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID for the tool request.
        @[JSON::Field(key: "toolUseId")]
        getter tool_use_id : String

        # The type for the tool request.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @input : Types::Document,
          @name : String,
          @tool_use_id : String,
          @type : String? = nil
        )
        end
      end

      # The delta for a tool use block.
      struct ToolUseBlockDelta
        include JSON::Serializable

        # The input for a requested tool.
        @[JSON::Field(key: "input")]
        getter input : String

        def initialize(
          @input : String
        )
        end
      end

      # The start of a tool use block. For more information, see Call a tool with the Converse API in the
      # Amazon Bedrock User Guide.
      struct ToolUseBlockStart
        include JSON::Serializable

        # The name of the tool that the model is requesting to use.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID for the tool request.
        @[JSON::Field(key: "toolUseId")]
        getter tool_use_id : String

        # The type for the tool request.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String,
          @tool_use_id : String,
          @type : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by Amazon Bedrock . For troubleshooting this
      # error, see ValidationError in the Amazon Bedrock User Guide
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A video block.
      struct VideoBlock
        include JSON::Serializable

        # The block's format.
        @[JSON::Field(key: "format")]
        getter format : String

        # The block's source.
        @[JSON::Field(key: "source")]
        getter source : Types::VideoSource

        def initialize(
          @format : String,
          @source : Types::VideoSource
        )
        end
      end

      # A video source. You can upload a smaller video as a base64-encoded string as long as the encoded
      # file is less than 25MB. You can also transfer videos up to 1GB in size from an S3 bucket.
      struct VideoSource
        include JSON::Serializable

        # Video content encoded in base64.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        # The location of a video object in an Amazon S3 bucket. To see which models support S3 uploads, see
        # Supported models and features for Converse .
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @bytes : Bytes? = nil,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # Provides the URL and domain information for the website that was cited when performing a web search.
      struct WebLocation
        include JSON::Serializable

        # The domain that was cited when performing a web search.
        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The URL that was cited when performing a web search.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @domain : String? = nil,
          @url : String? = nil
        )
        end
      end
    end
  end
end
