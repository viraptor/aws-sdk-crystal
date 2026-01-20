require "json"
require "time"

module Aws
  module BedrockDataAutomation
    module Types

      # This exception is thrown when a request is denied per access permissions

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Category of Audio Extraction

      struct AudioExtractionCategory
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "typeConfiguration")]
        getter type_configuration : Types::AudioExtractionCategoryTypeConfiguration?


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @state : String,
          @type_configuration : Types::AudioExtractionCategoryTypeConfiguration? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      # Configuration for different audio extraction category types

      struct AudioExtractionCategoryTypeConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "transcript")]
        getter transcript : Types::TranscriptConfiguration?

        def initialize(
          @transcript : Types::TranscriptConfiguration? = nil
        )
        end
      end

      # Optional configuration for audio language settings

      struct AudioLanguageConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "generativeOutputLanguage")]
        getter generative_output_language : String?

        # Enable multiple language identification in audio

        @[JSON::Field(key: "identifyMultipleLanguages")]
        getter identify_multiple_languages : Bool?


        @[JSON::Field(key: "inputLanguages")]
        getter input_languages : Array(String)?

        def initialize(
          @generative_output_language : String? = nil,
          @identify_multiple_languages : Bool? = nil,
          @input_languages : Array(String)? = nil
        )
        end
      end

      # Override Configuration of Audio

      struct AudioOverrideConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "languageConfiguration")]
        getter language_configuration : Types::AudioLanguageConfiguration?


        @[JSON::Field(key: "modalityProcessing")]
        getter modality_processing : Types::ModalityProcessingConfiguration?


        @[JSON::Field(key: "sensitiveDataConfiguration")]
        getter sensitive_data_configuration : Types::SensitiveDataConfiguration?

        def initialize(
          @language_configuration : Types::AudioLanguageConfiguration? = nil,
          @modality_processing : Types::ModalityProcessingConfiguration? = nil,
          @sensitive_data_configuration : Types::SensitiveDataConfiguration? = nil
        )
        end
      end

      # Standard Extraction Configuration of Audio

      struct AudioStandardExtraction
        include JSON::Serializable


        @[JSON::Field(key: "category")]
        getter category : Types::AudioExtractionCategory

        def initialize(
          @category : Types::AudioExtractionCategory
        )
        end
      end

      # Standard Generative Field Configuration of Audio

      struct AudioStandardGenerativeField
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @state : String,
          @types : Array(String)? = nil
        )
        end
      end

      # Standard Output Configuration of Audio

      struct AudioStandardOutputConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "extraction")]
        getter extraction : Types::AudioStandardExtraction?


        @[JSON::Field(key: "generativeField")]
        getter generative_field : Types::AudioStandardGenerativeField?

        def initialize(
          @extraction : Types::AudioStandardExtraction? = nil,
          @generative_field : Types::AudioStandardGenerativeField? = nil
        )
        end
      end

      # Contains the information of a Blueprint.

      struct Blueprint
        include JSON::Serializable


        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String


        @[JSON::Field(key: "blueprintName")]
        getter blueprint_name : String


        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time


        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time


        @[JSON::Field(key: "schema")]
        getter schema : String


        @[JSON::Field(key: "type")]
        getter type : String


        @[JSON::Field(key: "blueprintStage")]
        getter blueprint_stage : String?


        @[JSON::Field(key: "blueprintVersion")]
        getter blueprint_version : String?


        @[JSON::Field(key: "kmsEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?


        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?


        @[JSON::Field(key: "optimizationSamples")]
        getter optimization_samples : Array(Types::BlueprintOptimizationSample)?


        @[JSON::Field(key: "optimizationTime")]
        getter optimization_time : Time?

        def initialize(
          @blueprint_arn : String,
          @blueprint_name : String,
          @creation_time : Time,
          @last_modified_time : Time,
          @schema : String,
          @type : String,
          @blueprint_stage : String? = nil,
          @blueprint_version : String? = nil,
          @kms_encryption_context : Hash(String, String)? = nil,
          @kms_key_id : String? = nil,
          @optimization_samples : Array(Types::BlueprintOptimizationSample)? = nil,
          @optimization_time : Time? = nil
        )
        end
      end

      # Blueprint Filter

      struct BlueprintFilter
        include JSON::Serializable


        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String


        @[JSON::Field(key: "blueprintStage")]
        getter blueprint_stage : String?


        @[JSON::Field(key: "blueprintVersion")]
        getter blueprint_version : String?

        def initialize(
          @blueprint_arn : String,
          @blueprint_stage : String? = nil,
          @blueprint_version : String? = nil
        )
        end
      end

      # Blueprint Item

      struct BlueprintItem
        include JSON::Serializable


        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String


        @[JSON::Field(key: "blueprintStage")]
        getter blueprint_stage : String?


        @[JSON::Field(key: "blueprintVersion")]
        getter blueprint_version : String?

        def initialize(
          @blueprint_arn : String,
          @blueprint_stage : String? = nil,
          @blueprint_version : String? = nil
        )
        end
      end

      # Structure for single blueprint entity.

      struct BlueprintOptimizationObject
        include JSON::Serializable

        # Arn of blueprint.

        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String

        # Stage of blueprint.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @blueprint_arn : String,
          @stage : String? = nil
        )
        end
      end

      # Blueprint Optimization Output configuration.

      struct BlueprintOptimizationOutputConfiguration
        include JSON::Serializable

        # S3 object.

        @[JSON::Field(key: "s3Object")]
        getter s3_object : Types::S3Object

        def initialize(
          @s3_object : Types::S3Object
        )
        end
      end

      # Blueprint Recommendation Sample

      struct BlueprintOptimizationSample
        include JSON::Serializable

        # S3 Object of the asset

        @[JSON::Field(key: "assetS3Object")]
        getter asset_s3_object : Types::S3Object

        # Ground truth for the Blueprint and Asset combination

        @[JSON::Field(key: "groundTruthS3Object")]
        getter ground_truth_s3_object : Types::S3Object

        def initialize(
          @asset_s3_object : Types::S3Object,
          @ground_truth_s3_object : Types::S3Object
        )
        end
      end

      # Summary of a Blueprint

      struct BlueprintSummary
        include JSON::Serializable


        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String


        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time


        @[JSON::Field(key: "blueprintName")]
        getter blueprint_name : String?


        @[JSON::Field(key: "blueprintStage")]
        getter blueprint_stage : String?


        @[JSON::Field(key: "blueprintVersion")]
        getter blueprint_version : String?


        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        def initialize(
          @blueprint_arn : String,
          @creation_time : Time,
          @blueprint_name : String? = nil,
          @blueprint_stage : String? = nil,
          @blueprint_version : String? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end

      # Channel labeling configuration

      struct ChannelLabelingConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # This exception is thrown when there is a conflict performing an operation

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # CopyBlueprintStage Request

      struct CopyBlueprintStageRequest
        include JSON::Serializable

        # Blueprint to be copied

        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String

        # Source stage to copy from

        @[JSON::Field(key: "sourceStage")]
        getter source_stage : String

        # Target stage to copy to

        @[JSON::Field(key: "targetStage")]
        getter target_stage : String

        # Client token for idempotency

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @blueprint_arn : String,
          @source_stage : String,
          @target_stage : String,
          @client_token : String? = nil
        )
        end
      end

      # CopyBlueprintStage Response

      struct CopyBlueprintStageResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Create Blueprint Request

      struct CreateBlueprintRequest
        include JSON::Serializable


        @[JSON::Field(key: "blueprintName")]
        getter blueprint_name : String


        @[JSON::Field(key: "schema")]
        getter schema : String


        @[JSON::Field(key: "type")]
        getter type : String


        @[JSON::Field(key: "blueprintStage")]
        getter blueprint_stage : String?


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?


        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @blueprint_name : String,
          @schema : String,
          @type : String,
          @blueprint_stage : String? = nil,
          @client_token : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Create Blueprint Response

      struct CreateBlueprintResponse
        include JSON::Serializable


        @[JSON::Field(key: "blueprint")]
        getter blueprint : Types::Blueprint

        def initialize(
          @blueprint : Types::Blueprint
        )
        end
      end

      # Create Blueprint Version Request

      struct CreateBlueprintVersionRequest
        include JSON::Serializable

        # ARN generated at the server side when a Blueprint is created

        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @blueprint_arn : String,
          @client_token : String? = nil
        )
        end
      end

      # Create Blueprint Version Response

      struct CreateBlueprintVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "blueprint")]
        getter blueprint : Types::Blueprint

        def initialize(
          @blueprint : Types::Blueprint
        )
        end
      end

      # Create DataAutomationProject Request

      struct CreateDataAutomationProjectRequest
        include JSON::Serializable


        @[JSON::Field(key: "projectName")]
        getter project_name : String


        @[JSON::Field(key: "standardOutputConfiguration")]
        getter standard_output_configuration : Types::StandardOutputConfiguration


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "customOutputConfiguration")]
        getter custom_output_configuration : Types::CustomOutputConfiguration?


        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?


        @[JSON::Field(key: "overrideConfiguration")]
        getter override_configuration : Types::OverrideConfiguration?


        @[JSON::Field(key: "projectDescription")]
        getter project_description : String?


        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?


        @[JSON::Field(key: "projectType")]
        getter project_type : String?


        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @project_name : String,
          @standard_output_configuration : Types::StandardOutputConfiguration,
          @client_token : String? = nil,
          @custom_output_configuration : Types::CustomOutputConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @override_configuration : Types::OverrideConfiguration? = nil,
          @project_description : String? = nil,
          @project_stage : String? = nil,
          @project_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Create DataAutomationProject Response

      struct CreateDataAutomationProjectResponse
        include JSON::Serializable


        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @project_arn : String,
          @project_stage : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Custom output configuration

      struct CustomOutputConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "blueprints")]
        getter blueprints : Array(Types::BlueprintItem)?

        def initialize(
          @blueprints : Array(Types::BlueprintItem)? = nil
        )
        end
      end

      # Contains the information of a DataAutomationProject.

      struct DataAutomationProject
        include JSON::Serializable


        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time


        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time


        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "projectName")]
        getter project_name : String


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "customOutputConfiguration")]
        getter custom_output_configuration : Types::CustomOutputConfiguration?


        @[JSON::Field(key: "kmsEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?


        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?


        @[JSON::Field(key: "overrideConfiguration")]
        getter override_configuration : Types::OverrideConfiguration?


        @[JSON::Field(key: "projectDescription")]
        getter project_description : String?


        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?


        @[JSON::Field(key: "projectType")]
        getter project_type : String?


        @[JSON::Field(key: "standardOutputConfiguration")]
        getter standard_output_configuration : Types::StandardOutputConfiguration?

        def initialize(
          @creation_time : Time,
          @last_modified_time : Time,
          @project_arn : String,
          @project_name : String,
          @status : String,
          @custom_output_configuration : Types::CustomOutputConfiguration? = nil,
          @kms_encryption_context : Hash(String, String)? = nil,
          @kms_key_id : String? = nil,
          @override_configuration : Types::OverrideConfiguration? = nil,
          @project_description : String? = nil,
          @project_stage : String? = nil,
          @project_type : String? = nil,
          @standard_output_configuration : Types::StandardOutputConfiguration? = nil
        )
        end
      end

      # Data Automation Project Filter

      struct DataAutomationProjectFilter
        include JSON::Serializable


        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?

        def initialize(
          @project_arn : String,
          @project_stage : String? = nil
        )
        end
      end

      # Summary of a DataAutomationProject

      struct DataAutomationProjectSummary
        include JSON::Serializable


        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time


        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "projectName")]
        getter project_name : String?


        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?


        @[JSON::Field(key: "projectType")]
        getter project_type : String?

        def initialize(
          @creation_time : Time,
          @project_arn : String,
          @project_name : String? = nil,
          @project_stage : String? = nil,
          @project_type : String? = nil
        )
        end
      end

      # Delete Blueprint Request

      struct DeleteBlueprintRequest
        include JSON::Serializable

        # ARN generated at the server side when a Blueprint is created

        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String

        # Optional field to delete a specific Blueprint version

        @[JSON::Field(key: "blueprintVersion")]
        getter blueprint_version : String?

        def initialize(
          @blueprint_arn : String,
          @blueprint_version : String? = nil
        )
        end
      end

      # Delete Blueprint Response

      struct DeleteBlueprintResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Delete DataAutomationProject Request

      struct DeleteDataAutomationProjectRequest
        include JSON::Serializable

        # ARN generated at the server side when a DataAutomationProject is created

        @[JSON::Field(key: "projectArn")]
        getter project_arn : String

        def initialize(
          @project_arn : String
        )
        end
      end

      # Delete DataAutomationProject Response

      struct DeleteDataAutomationProjectResponse
        include JSON::Serializable


        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @project_arn : String,
          @status : String? = nil
        )
        end
      end

      # Bounding Box Configuration of Document Extraction

      struct DocumentBoundingBox
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Granularity of Document Extraction

      struct DocumentExtractionGranularity
        include JSON::Serializable


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @types : Array(String)? = nil
        )
        end
      end

      # Additional File Format of Document Output

      struct DocumentOutputAdditionalFileFormat
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Output Format of Document

      struct DocumentOutputFormat
        include JSON::Serializable


        @[JSON::Field(key: "additionalFileFormat")]
        getter additional_file_format : Types::DocumentOutputAdditionalFileFormat


        @[JSON::Field(key: "textFormat")]
        getter text_format : Types::DocumentOutputTextFormat

        def initialize(
          @additional_file_format : Types::DocumentOutputAdditionalFileFormat,
          @text_format : Types::DocumentOutputTextFormat
        )
        end
      end

      # Text Format of Document Output

      struct DocumentOutputTextFormat
        include JSON::Serializable


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @types : Array(String)? = nil
        )
        end
      end

      # Override Configuration of Document

      struct DocumentOverrideConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "modalityProcessing")]
        getter modality_processing : Types::ModalityProcessingConfiguration?


        @[JSON::Field(key: "sensitiveDataConfiguration")]
        getter sensitive_data_configuration : Types::SensitiveDataConfiguration?


        @[JSON::Field(key: "splitter")]
        getter splitter : Types::SplitterConfiguration?

        def initialize(
          @modality_processing : Types::ModalityProcessingConfiguration? = nil,
          @sensitive_data_configuration : Types::SensitiveDataConfiguration? = nil,
          @splitter : Types::SplitterConfiguration? = nil
        )
        end
      end

      # Standard Extraction Configuration of Document

      struct DocumentStandardExtraction
        include JSON::Serializable


        @[JSON::Field(key: "boundingBox")]
        getter bounding_box : Types::DocumentBoundingBox


        @[JSON::Field(key: "granularity")]
        getter granularity : Types::DocumentExtractionGranularity

        def initialize(
          @bounding_box : Types::DocumentBoundingBox,
          @granularity : Types::DocumentExtractionGranularity
        )
        end
      end

      # Standard Generative Field Configuration of Document

      struct DocumentStandardGenerativeField
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Standard Output Configuration of Document

      struct DocumentStandardOutputConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "extraction")]
        getter extraction : Types::DocumentStandardExtraction?


        @[JSON::Field(key: "generativeField")]
        getter generative_field : Types::DocumentStandardGenerativeField?


        @[JSON::Field(key: "outputFormat")]
        getter output_format : Types::DocumentOutputFormat?

        def initialize(
          @extraction : Types::DocumentStandardExtraction? = nil,
          @generative_field : Types::DocumentStandardGenerativeField? = nil,
          @output_format : Types::DocumentOutputFormat? = nil
        )
        end
      end

      # KMS Encryption Configuration

      struct EncryptionConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String


        @[JSON::Field(key: "kmsEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?

        def initialize(
          @kms_key_id : String,
          @kms_encryption_context : Hash(String, String)? = nil
        )
        end
      end

      # Structure for request of GetBlueprintOptimizationStatus API.

      struct GetBlueprintOptimizationStatusRequest
        include JSON::Serializable

        # Invocation arn.

        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        def initialize(
          @invocation_arn : String
        )
        end
      end

      # Response of GetBlueprintOptimizationStatus API.

      struct GetBlueprintOptimizationStatusResponse
        include JSON::Serializable

        # Error Message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Error Type.

        @[JSON::Field(key: "errorType")]
        getter error_type : String?

        # Output configuration.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::BlueprintOptimizationOutputConfiguration?

        # Job Status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @error_type : String? = nil,
          @output_configuration : Types::BlueprintOptimizationOutputConfiguration? = nil,
          @status : String? = nil
        )
        end
      end

      # Get Blueprint Request

      struct GetBlueprintRequest
        include JSON::Serializable

        # ARN generated at the server side when a Blueprint is created

        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String

        # Optional field to get a specific Blueprint stage

        @[JSON::Field(key: "blueprintStage")]
        getter blueprint_stage : String?

        # Optional field to get a specific Blueprint version

        @[JSON::Field(key: "blueprintVersion")]
        getter blueprint_version : String?

        def initialize(
          @blueprint_arn : String,
          @blueprint_stage : String? = nil,
          @blueprint_version : String? = nil
        )
        end
      end

      # Get Blueprint Response

      struct GetBlueprintResponse
        include JSON::Serializable


        @[JSON::Field(key: "blueprint")]
        getter blueprint : Types::Blueprint

        def initialize(
          @blueprint : Types::Blueprint
        )
        end
      end

      # Get DataAutomationProject Request

      struct GetDataAutomationProjectRequest
        include JSON::Serializable

        # ARN generated at the server side when a DataAutomationProject is created

        @[JSON::Field(key: "projectArn")]
        getter project_arn : String

        # Optional field to delete a specific DataAutomationProject stage

        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?

        def initialize(
          @project_arn : String,
          @project_stage : String? = nil
        )
        end
      end

      # Get DataAutomationProject Response

      struct GetDataAutomationProjectResponse
        include JSON::Serializable


        @[JSON::Field(key: "project")]
        getter project : Types::DataAutomationProject

        def initialize(
          @project : Types::DataAutomationProject
        )
        end
      end

      # Bounding Box Configuration of Image Extraction

      struct ImageBoundingBox
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Category of Image Extraction

      struct ImageExtractionCategory
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @state : String,
          @types : Array(String)? = nil
        )
        end
      end

      # Override Configuration of Image

      struct ImageOverrideConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "modalityProcessing")]
        getter modality_processing : Types::ModalityProcessingConfiguration?


        @[JSON::Field(key: "sensitiveDataConfiguration")]
        getter sensitive_data_configuration : Types::SensitiveDataConfiguration?

        def initialize(
          @modality_processing : Types::ModalityProcessingConfiguration? = nil,
          @sensitive_data_configuration : Types::SensitiveDataConfiguration? = nil
        )
        end
      end

      # Standard Extraction Configuration of Image

      struct ImageStandardExtraction
        include JSON::Serializable


        @[JSON::Field(key: "boundingBox")]
        getter bounding_box : Types::ImageBoundingBox


        @[JSON::Field(key: "category")]
        getter category : Types::ImageExtractionCategory

        def initialize(
          @bounding_box : Types::ImageBoundingBox,
          @category : Types::ImageExtractionCategory
        )
        end
      end

      # Standard Generative Field Configuration of Image

      struct ImageStandardGenerativeField
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @state : String,
          @types : Array(String)? = nil
        )
        end
      end

      # Standard Output Configuration of Image

      struct ImageStandardOutputConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "extraction")]
        getter extraction : Types::ImageStandardExtraction?


        @[JSON::Field(key: "generativeField")]
        getter generative_field : Types::ImageStandardGenerativeField?

        def initialize(
          @extraction : Types::ImageStandardExtraction? = nil,
          @generative_field : Types::ImageStandardGenerativeField? = nil
        )
        end
      end

      # This exception is thrown if there was an unexpected error during processing of request

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Invoke Blueprint Optimization Async Request

      struct InvokeBlueprintOptimizationAsyncRequest
        include JSON::Serializable

        # Blueprint to be optimized

        @[JSON::Field(key: "blueprint")]
        getter blueprint : Types::BlueprintOptimizationObject

        # Data automation profile ARN

        @[JSON::Field(key: "dataAutomationProfileArn")]
        getter data_automation_profile_arn : String

        # Output configuration where the results should be placed

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::BlueprintOptimizationOutputConfiguration

        # List of Blueprint Optimization Samples

        @[JSON::Field(key: "samples")]
        getter samples : Array(Types::BlueprintOptimizationSample)

        # Encryption configuration.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # List of tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @blueprint : Types::BlueprintOptimizationObject,
          @data_automation_profile_arn : String,
          @output_configuration : Types::BlueprintOptimizationOutputConfiguration,
          @samples : Array(Types::BlueprintOptimizationSample),
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Invoke Blueprint Optimization Async Response

      struct InvokeBlueprintOptimizationAsyncResponse
        include JSON::Serializable

        # ARN of the blueprint optimization job

        @[JSON::Field(key: "invocationArn")]
        getter invocation_arn : String

        def initialize(
          @invocation_arn : String
        )
        end
      end

      # List Blueprint Request

      struct ListBlueprintsRequest
        include JSON::Serializable


        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String?


        @[JSON::Field(key: "blueprintStageFilter")]
        getter blueprint_stage_filter : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "projectFilter")]
        getter project_filter : Types::DataAutomationProjectFilter?


        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String?

        def initialize(
          @blueprint_arn : String? = nil,
          @blueprint_stage_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @project_filter : Types::DataAutomationProjectFilter? = nil,
          @resource_owner : String? = nil
        )
        end
      end

      # List Blueprint Response

      struct ListBlueprintsResponse
        include JSON::Serializable


        @[JSON::Field(key: "blueprints")]
        getter blueprints : Array(Types::BlueprintSummary)


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @blueprints : Array(Types::BlueprintSummary),
          @next_token : String? = nil
        )
        end
      end

      # List DataAutomationProject Request

      struct ListDataAutomationProjectsRequest
        include JSON::Serializable


        @[JSON::Field(key: "blueprintFilter")]
        getter blueprint_filter : Types::BlueprintFilter?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "projectStageFilter")]
        getter project_stage_filter : String?


        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String?

        def initialize(
          @blueprint_filter : Types::BlueprintFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @project_stage_filter : String? = nil,
          @resource_owner : String? = nil
        )
        end
      end

      # List DataAutomationProject Response

      struct ListDataAutomationProjectsResponse
        include JSON::Serializable


        @[JSON::Field(key: "projects")]
        getter projects : Array(Types::DataAutomationProjectSummary)


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @projects : Array(Types::DataAutomationProjectSummary),
          @next_token : String? = nil
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

      # Configuration to enable/disable processing of modality

      struct ModalityProcessingConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end

      # Configuration for routing file type to desired modality

      struct ModalityRoutingConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "jpeg")]
        getter jpeg : String?


        @[JSON::Field(key: "mov")]
        getter mov : String?


        @[JSON::Field(key: "mp4")]
        getter mp4 : String?


        @[JSON::Field(key: "png")]
        getter png : String?

        def initialize(
          @jpeg : String? = nil,
          @mov : String? = nil,
          @mp4 : String? = nil,
          @png : String? = nil
        )
        end
      end

      # Override configuration

      struct OverrideConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "audio")]
        getter audio : Types::AudioOverrideConfiguration?


        @[JSON::Field(key: "document")]
        getter document : Types::DocumentOverrideConfiguration?


        @[JSON::Field(key: "image")]
        getter image : Types::ImageOverrideConfiguration?


        @[JSON::Field(key: "modalityRouting")]
        getter modality_routing : Types::ModalityRoutingConfiguration?


        @[JSON::Field(key: "video")]
        getter video : Types::VideoOverrideConfiguration?

        def initialize(
          @audio : Types::AudioOverrideConfiguration? = nil,
          @document : Types::DocumentOverrideConfiguration? = nil,
          @image : Types::ImageOverrideConfiguration? = nil,
          @modality_routing : Types::ModalityRoutingConfiguration? = nil,
          @video : Types::VideoOverrideConfiguration? = nil
        )
        end
      end

      # Configuration for PII entities detection and redaction

      struct PIIEntitiesConfiguration
        include JSON::Serializable

        # Types of PII entities to detect

        @[JSON::Field(key: "piiEntityTypes")]
        getter pii_entity_types : Array(String)?

        # Mode for redacting detected PII

        @[JSON::Field(key: "redactionMaskMode")]
        getter redaction_mask_mode : String?

        def initialize(
          @pii_entity_types : Array(String)? = nil,
          @redaction_mask_mode : String? = nil
        )
        end
      end

      # This exception is thrown when a resource referenced by the operation does not exist

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # S3 object

      struct S3Object
        include JSON::Serializable

        # S3 uri.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # S3 object version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @s3_uri : String,
          @version : String? = nil
        )
        end
      end

      # Configuration for sensitive data detection and redaction

      struct SensitiveDataConfiguration
        include JSON::Serializable

        # Mode for sensitive data detection

        @[JSON::Field(key: "detectionMode")]
        getter detection_mode : String

        # Scope of detection - what types of sensitive data to detect

        @[JSON::Field(key: "detectionScope")]
        getter detection_scope : Array(String)?

        # Configuration for PII entities detection and redaction

        @[JSON::Field(key: "piiEntitiesConfiguration")]
        getter pii_entities_configuration : Types::PIIEntitiesConfiguration?

        def initialize(
          @detection_mode : String,
          @detection_scope : Array(String)? = nil,
          @pii_entities_configuration : Types::PIIEntitiesConfiguration? = nil
        )
        end
      end

      # This exception is thrown when a request is made beyond the service quota

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Speaker labeling configuration

      struct SpeakerLabelingConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Configuration of Splitter

      struct SplitterConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end

      # Standard output configuration

      struct StandardOutputConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "audio")]
        getter audio : Types::AudioStandardOutputConfiguration?


        @[JSON::Field(key: "document")]
        getter document : Types::DocumentStandardOutputConfiguration?


        @[JSON::Field(key: "image")]
        getter image : Types::ImageStandardOutputConfiguration?


        @[JSON::Field(key: "video")]
        getter video : Types::VideoStandardOutputConfiguration?

        def initialize(
          @audio : Types::AudioStandardOutputConfiguration? = nil,
          @document : Types::DocumentStandardOutputConfiguration? = nil,
          @image : Types::ImageStandardOutputConfiguration? = nil,
          @video : Types::VideoStandardOutputConfiguration? = nil
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

      # This exception is thrown when the number of requests exceeds the limit

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration for transcript related features

      struct TranscriptConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "channelLabeling")]
        getter channel_labeling : Types::ChannelLabelingConfiguration?


        @[JSON::Field(key: "speakerLabeling")]
        getter speaker_labeling : Types::SpeakerLabelingConfiguration?

        def initialize(
          @channel_labeling : Types::ChannelLabelingConfiguration? = nil,
          @speaker_labeling : Types::SpeakerLabelingConfiguration? = nil
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

      # Update Blueprint Request

      struct UpdateBlueprintRequest
        include JSON::Serializable

        # ARN generated at the server side when a Blueprint is created

        @[JSON::Field(key: "blueprintArn")]
        getter blueprint_arn : String


        @[JSON::Field(key: "schema")]
        getter schema : String


        @[JSON::Field(key: "blueprintStage")]
        getter blueprint_stage : String?


        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        def initialize(
          @blueprint_arn : String,
          @schema : String,
          @blueprint_stage : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil
        )
        end
      end

      # Update Blueprint Response

      struct UpdateBlueprintResponse
        include JSON::Serializable


        @[JSON::Field(key: "blueprint")]
        getter blueprint : Types::Blueprint

        def initialize(
          @blueprint : Types::Blueprint
        )
        end
      end

      # Update DataAutomationProject Request

      struct UpdateDataAutomationProjectRequest
        include JSON::Serializable

        # ARN generated at the server side when a DataAutomationProject is created

        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "standardOutputConfiguration")]
        getter standard_output_configuration : Types::StandardOutputConfiguration


        @[JSON::Field(key: "customOutputConfiguration")]
        getter custom_output_configuration : Types::CustomOutputConfiguration?


        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?


        @[JSON::Field(key: "overrideConfiguration")]
        getter override_configuration : Types::OverrideConfiguration?


        @[JSON::Field(key: "projectDescription")]
        getter project_description : String?


        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?

        def initialize(
          @project_arn : String,
          @standard_output_configuration : Types::StandardOutputConfiguration,
          @custom_output_configuration : Types::CustomOutputConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @override_configuration : Types::OverrideConfiguration? = nil,
          @project_description : String? = nil,
          @project_stage : String? = nil
        )
        end
      end

      # Update DataAutomationProject Response

      struct UpdateDataAutomationProjectResponse
        include JSON::Serializable


        @[JSON::Field(key: "projectArn")]
        getter project_arn : String


        @[JSON::Field(key: "projectStage")]
        getter project_stage : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @project_arn : String,
          @project_stage : String? = nil,
          @status : String? = nil
        )
        end
      end

      # This exception is thrown when the request's input validation fails

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an exception

      struct ValidationExceptionField
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Bounding Box Configuration of Video Extraction

      struct VideoBoundingBox
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # Category of Video Extraction

      struct VideoExtractionCategory
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @state : String,
          @types : Array(String)? = nil
        )
        end
      end

      # Override Configuration of Video

      struct VideoOverrideConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "modalityProcessing")]
        getter modality_processing : Types::ModalityProcessingConfiguration?


        @[JSON::Field(key: "sensitiveDataConfiguration")]
        getter sensitive_data_configuration : Types::SensitiveDataConfiguration?

        def initialize(
          @modality_processing : Types::ModalityProcessingConfiguration? = nil,
          @sensitive_data_configuration : Types::SensitiveDataConfiguration? = nil
        )
        end
      end

      # Standard Extraction Configuration of Video

      struct VideoStandardExtraction
        include JSON::Serializable


        @[JSON::Field(key: "boundingBox")]
        getter bounding_box : Types::VideoBoundingBox


        @[JSON::Field(key: "category")]
        getter category : Types::VideoExtractionCategory

        def initialize(
          @bounding_box : Types::VideoBoundingBox,
          @category : Types::VideoExtractionCategory
        )
        end
      end

      # Standard Generative Field Configuration of Video

      struct VideoStandardGenerativeField
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @state : String,
          @types : Array(String)? = nil
        )
        end
      end

      # Standard Output Configuration of Video

      struct VideoStandardOutputConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "extraction")]
        getter extraction : Types::VideoStandardExtraction?


        @[JSON::Field(key: "generativeField")]
        getter generative_field : Types::VideoStandardGenerativeField?

        def initialize(
          @extraction : Types::VideoStandardExtraction? = nil,
          @generative_field : Types::VideoStandardGenerativeField? = nil
        )
        end
      end
    end
  end
end
