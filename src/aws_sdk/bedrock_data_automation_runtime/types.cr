require "json"
require "time"

module AwsSdk
  module BedrockDataAutomationRuntime
    module Types

      # This exception will be thrown when customer does not have access to API.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Config containing asset processing related knobs for all modalities
      struct AssetProcessingConfiguration
        include JSON::Serializable

        # Video asset processing configuration
        @[JSON::Field(key: "video")]
        getter video : Types::VideoAssetProcessingConfiguration?

        def initialize(
          @video : Types::VideoAssetProcessingConfiguration? = nil
        )
        end
      end

      # Structure for single blueprint entity.
      struct Blueprint
        include JSON::Serializable

        # Arn of blueprint.
        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String

        # Stage of blueprint.
        @[JSON::Field(key: "stage")]
        getter stage : String?

        # Version of blueprint.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @blueprint_arn : String,
          @stage : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Data automation configuration.
      struct DataAutomationConfiguration
        include JSON::Serializable

        # Data automation project arn.
        @[JSON::Field(key: "dataAutomationProjectArn")]
        getter data_automation_project_arn : String

        # Data automation stage.
        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @data_automation_project_arn : String,
          @stage : String? = nil
        )
        end
      end

      # Encryption configuration.
      struct EncryptionConfiguration
        include JSON::Serializable

        # Customer KMS key used for encryption
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String

        # KMS encryption context.
        @[JSON::Field(key: "kmsEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?

        def initialize(
          @kms_key_id : String,
          @kms_encryption_context : Hash(String, String)? = nil
        )
        end
      end

      # Event bridge configuration.
      struct EventBridgeConfiguration
        include JSON::Serializable

        # Event bridge flag.
        @[JSON::Field(key: "eventBridgeEnabled")]
        getter event_bridge_enabled : Bool

        def initialize(
          @event_bridge_enabled : Bool
        )
        end
      end

      # Structure for request of GetDataAutomationStatus API.
      struct GetDataAutomationStatusRequest
        include JSON::Serializable

        # Invocation arn.
        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        def initialize(
          @invocation_arn : String
        )
        end
      end

      # Response of GetDataAutomationStatus API.
      struct GetDataAutomationStatusResponse
        include JSON::Serializable

        # Error Message.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Error Type.
        @[JSON::Field(key: "errorType")]
        getter error_type : String?

        # Job completion time.
        @[JSON::Field(key: "jobCompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter job_completion_time : Time?

        # Job duration in seconds.
        @[JSON::Field(key: "jobDurationInSeconds")]
        getter job_duration_in_seconds : Int32?

        # Job Submission time.
        @[JSON::Field(key: "jobSubmissionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter job_submission_time : Time?

        # Output configuration.
        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::OutputConfiguration?

        # Job Status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @error_type : String? = nil,
          @job_completion_time : Time? = nil,
          @job_duration_in_seconds : Int32? = nil,
          @job_submission_time : Time? = nil,
          @output_configuration : Types::OutputConfiguration? = nil,
          @status : String? = nil
        )
        end
      end

      # Input configuration.
      struct InputConfiguration
        include JSON::Serializable

        # S3 uri.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # Asset processing configuration
        @[JSON::Field(key: "assetProcessingConfiguration")]
        getter asset_processing_configuration : Types::AssetProcessingConfiguration?

        def initialize(
          @s3_uri : String,
          @asset_processing_configuration : Types::AssetProcessingConfiguration? = nil
        )
        end
      end

      # This exception is for any internal un-expected service errors.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Invoke Data Automation Async Request
      struct InvokeDataAutomationAsyncRequest
        include JSON::Serializable

        # Data automation profile ARN
        @[JSON::Field(key: "dataAutomationProfileArn")]
        getter data_automation_profile_arn : String

        # Input configuration.
        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::InputConfiguration

        # Output configuration.
        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::OutputConfiguration

        # Blueprint list.
        @[JSON::Field(key: "blueprints")]
        getter blueprints : Array(Types::Blueprint)?

        # Idempotency token.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Data automation configuration.
        @[JSON::Field(key: "dataAutomationConfiguration")]
        getter data_automation_configuration : Types::DataAutomationConfiguration?

        # Encryption configuration.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Notification configuration.
        @[JSON::Field(key: "notificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration?

        # List of tags.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @data_automation_profile_arn : String,
          @input_configuration : Types::InputConfiguration,
          @output_configuration : Types::OutputConfiguration,
          @blueprints : Array(Types::Blueprint)? = nil,
          @client_token : String? = nil,
          @data_automation_configuration : Types::DataAutomationConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @notification_configuration : Types::NotificationConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Invoke Data Automation Async Response
      struct InvokeDataAutomationAsyncResponse
        include JSON::Serializable

        # ARN of the automation job
        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        def initialize(
          @invocation_arn : String
        )
        end
      end

      # Invoke Data Automation Request
      struct InvokeDataAutomationRequest
        include JSON::Serializable

        # Data automation profile ARN
        @[JSON::Field(key: "dataAutomationProfileArn")]
        getter data_automation_profile_arn : String

        # Input configuration.
        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::SyncInputConfiguration

        # Blueprint list.
        @[JSON::Field(key: "blueprints")]
        getter blueprints : Array(Types::Blueprint)?

        # Data automation configuration.
        @[JSON::Field(key: "dataAutomationConfiguration")]
        getter data_automation_configuration : Types::DataAutomationConfiguration?

        # Encryption configuration.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        def initialize(
          @data_automation_profile_arn : String,
          @input_configuration : Types::SyncInputConfiguration,
          @blueprints : Array(Types::Blueprint)? = nil,
          @data_automation_configuration : Types::DataAutomationConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil
        )
        end
      end

      # Invoke Data Automation Response
      struct InvokeDataAutomationResponse
        include JSON::Serializable

        # List of outputs for each logical sub-doc
        @[JSON::Field(key: "outputSegments")]
        getter output_segments : Array(Types::OutputSegment)

        # Detected semantic modality
        @[JSON::Field(key: "semanticModality")]
        getter semantic_modality : String

        def initialize(
          @output_segments : Array(Types::OutputSegment),
          @semantic_modality : String
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Notification configuration.
      struct NotificationConfiguration
        include JSON::Serializable

        # Event bridge configuration.
        @[JSON::Field(key: "eventBridgeConfiguration")]
        getter event_bridge_configuration : Types::EventBridgeConfiguration

        def initialize(
          @event_bridge_configuration : Types::EventBridgeConfiguration
        )
        end
      end

      # Output configuration.
      struct OutputConfiguration
        include JSON::Serializable

        # S3 uri.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # Results for an output segment
      struct OutputSegment
        include JSON::Serializable

        # Custom output response
        @[JSON::Field(key: "customOutput")]
        getter custom_output : String?

        # Status of blueprint match
        @[JSON::Field(key: "customOutputStatus")]
        getter custom_output_status : String?

        # Standard output response
        @[JSON::Field(key: "standardOutput")]
        getter standard_output : String?

        def initialize(
          @custom_output : String? = nil,
          @custom_output_status : String? = nil,
          @standard_output : String? = nil
        )
        end
      end

      # This exception will be thrown when resource provided from customer not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception will be thrown when service quota is exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception will be thrown when service is temporarily unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input configuration for synchronous API
      struct SyncInputConfiguration
        include JSON::Serializable

        # Input data as bytes
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        # S3 URI of the input data
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @bytes : Bytes? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # Key value pair of a tag
      struct Tag
        include JSON::Serializable

        @[JSON::Field(key: "key")]
        getter key : String

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This exception will be thrown when customer reached API TPS limit.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Timestamp segment
      struct TimestampSegment
        include JSON::Serializable

        # End timestamp in milliseconds
        @[JSON::Field(key: "endTimeMillis")]
        getter end_time_millis : Int64

        # Start timestamp in milliseconds
        @[JSON::Field(key: "startTimeMillis")]
        getter start_time_millis : Int64

        def initialize(
          @end_time_millis : Int64,
          @start_time_millis : Int64
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This exception will be thrown when customer provided invalid parameters.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Video asset processing configuration
      struct VideoAssetProcessingConfiguration
        include JSON::Serializable

        # Delimits the segment of the input that will be processed
        @[JSON::Field(key: "segmentConfiguration")]
        getter segment_configuration : Types::VideoSegmentConfiguration?

        def initialize(
          @segment_configuration : Types::VideoSegmentConfiguration? = nil
        )
        end
      end

      # Delimits the segment of the input that will be processed
      struct VideoSegmentConfiguration
        include JSON::Serializable

        # Timestamp segment
        @[JSON::Field(key: "timestampSegment")]
        getter timestamp_segment : Types::TimestampSegment?

        def initialize(
          @timestamp_segment : Types::TimestampSegment? = nil
        )
        end
      end
    end
  end
end
