require "json"
require "time"

module AwsSdk
  module Omics
    module Types

      struct AbortMultipartReadSetUploadRequest
        include JSON::Serializable

        # The sequence store ID for the store involved in the multipart upload.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The ID for the multipart upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        def initialize(
          @sequence_store_id : String,
          @upload_id : String
        )
        end
      end

      struct AbortMultipartReadSetUploadResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AcceptShareRequest
        include JSON::Serializable

        # The ID of the resource share.
        @[JSON::Field(key: "shareId")]
        getter share_id : String

        def initialize(
          @share_id : String
        )
        end
      end

      struct AcceptShareResponse
        include JSON::Serializable

        # The status of the resource share.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A read set activation job filter.
      struct ActivateReadSetFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The filter's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # A read set activation job.
      struct ActivateReadSetJobItem
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        def initialize(
          @creation_time : Time,
          @id : String,
          @sequence_store_id : String,
          @status : String,
          @completion_time : Time? = nil
        )
        end
      end

      # A source for a read set activation job.
      struct ActivateReadSetSourceItem
        include JSON::Serializable

        # The source's read set ID.
        @[JSON::Field(key: "readSetId")]
        getter read_set_id : String

        # The source's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The source's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @read_set_id : String,
          @status : String,
          @status_message : String? = nil
        )
        end
      end

      # Details about an imported annotation item.
      struct AnnotationImportItemDetail
        include JSON::Serializable

        # The item's job status.
        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        # The source file's location in Amazon S3.
        @[JSON::Field(key: "source")]
        getter source : String

        def initialize(
          @job_status : String,
          @source : String
        )
        end
      end

      # A source for an annotation import job.
      struct AnnotationImportItemSource
        include JSON::Serializable

        # The source file's location in Amazon S3.
        @[JSON::Field(key: "source")]
        getter source : String

        def initialize(
          @source : String
        )
        end
      end

      # An annotation import job.
      struct AnnotationImportJobItem
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's destination annotation store.
        @[JSON::Field(key: "destinationName")]
        getter destination_name : String

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The name of the annotation store version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The annotation schema generated by the parsed annotation data.
        @[JSON::Field(key: "annotationFields")]
        getter annotation_fields : Hash(String, String)?

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The job's left normalization setting.
        @[JSON::Field(key: "runLeftNormalization")]
        getter run_left_normalization : Bool?

        def initialize(
          @creation_time : Time,
          @destination_name : String,
          @id : String,
          @role_arn : String,
          @status : String,
          @update_time : Time,
          @version_name : String,
          @annotation_fields : Hash(String, String)? = nil,
          @completion_time : Time? = nil,
          @run_left_normalization : Bool? = nil
        )
        end
      end

      # An annotation store.
      struct AnnotationStoreItem
        include JSON::Serializable

        # The store's creation time.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The store's genome reference.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The store's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # The store's ARN.
        @[JSON::Field(key: "storeArn")]
        getter store_arn : String

        # The store's file format.
        @[JSON::Field(key: "storeFormat")]
        getter store_format : String

        # The store's size in bytes.
        @[JSON::Field(key: "storeSizeBytes")]
        getter store_size_bytes : Int64

        # When the store was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @reference : Types::ReferenceItem,
          @sse_config : Types::SseConfig,
          @status : String,
          @status_message : String,
          @store_arn : String,
          @store_format : String,
          @store_size_bytes : Int64,
          @update_time : Time
        )
        end
      end

      # Annotation store versions.
      struct AnnotationStoreVersionItem
        include JSON::Serializable

        # The time stamp for when an annotation store version was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The description of an annotation store version.
        @[JSON::Field(key: "description")]
        getter description : String

        # The annotation store version ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # A name given to an annotation store version to distinguish it from others.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of an annotation store version.
        @[JSON::Field(key: "status")]
        getter status : String

        # The status of an annotation store version.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # The store ID for an annotation store version.
        @[JSON::Field(key: "storeId")]
        getter store_id : String

        # The time stamp for when an annotation store version was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The Arn for an annotation store version.
        @[JSON::Field(key: "versionArn")]
        getter version_arn : String

        # The name of an annotation store version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The size of an annotation store version in Bytes.
        @[JSON::Field(key: "versionSizeBytes")]
        getter version_size_bytes : Int64

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @status : String,
          @status_message : String,
          @store_id : String,
          @update_time : Time,
          @version_arn : String,
          @version_name : String,
          @version_size_bytes : Int64
        )
        end
      end

      struct BatchDeleteReadSetRequest
        include JSON::Serializable

        # The read sets' IDs.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        # The read sets' sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        def initialize(
          @ids : Array(String),
          @sequence_store_id : String
        )
        end
      end

      struct BatchDeleteReadSetResponse
        include JSON::Serializable

        # Errors returned by individual delete operations.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::ReadSetBatchError)?

        def initialize(
          @errors : Array(Types::ReadSetBatchError)? = nil
        )
        end
      end

      struct CancelAnnotationImportRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct CancelAnnotationImportResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CancelRunRequest
        include JSON::Serializable

        # The run's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct CancelVariantImportRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct CancelVariantImportResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CompleteMultipartReadSetUploadRequest
        include JSON::Serializable

        # The individual uploads or parts of a multipart upload.
        @[JSON::Field(key: "parts")]
        getter parts : Array(Types::CompleteReadSetUploadPartListItem)

        # The sequence store ID for the store involved in the multipart upload.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The ID for the multipart upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        def initialize(
          @parts : Array(Types::CompleteReadSetUploadPartListItem),
          @sequence_store_id : String,
          @upload_id : String
        )
        end
      end

      struct CompleteMultipartReadSetUploadResponse
        include JSON::Serializable

        # The read set ID created for an uploaded read set.
        @[JSON::Field(key: "readSetId")]
        getter read_set_id : String

        def initialize(
          @read_set_id : String
        )
        end
      end

      # Part of the response to the CompleteReadSetUpload API, including metadata.
      struct CompleteReadSetUploadPartListItem
        include JSON::Serializable

        # A unique identifier used to confirm that parts are being added to the correct upload.
        @[JSON::Field(key: "checksum")]
        getter checksum : String

        # A number identifying the part in a read set upload.
        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32

        # The source file of the part being uploaded.
        @[JSON::Field(key: "partSource")]
        getter part_source : String

        def initialize(
          @checksum : String,
          @part_number : Int32,
          @part_source : String
        )
        end
      end

      # The request cannot be applied to the target resource in its current state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Use a container registry map to specify mappings between the ECR private repository and one or more
      # upstream registries. For more information, see Container images in the Amazon Web Services
      # HealthOmics User Guide .
      struct ContainerRegistryMap
        include JSON::Serializable

        # Image mappings specify path mappings between the ECR private repository and their corresponding
        # external repositories.
        @[JSON::Field(key: "imageMappings")]
        getter image_mappings : Array(Types::ImageMapping)?

        # Mapping that provides the ECR repository path where upstream container images are pulled and
        # synchronized.
        @[JSON::Field(key: "registryMappings")]
        getter registry_mappings : Array(Types::RegistryMapping)?

        def initialize(
          @image_mappings : Array(Types::ImageMapping)? = nil,
          @registry_mappings : Array(Types::RegistryMapping)? = nil
        )
        end
      end

      struct CreateAnnotationStoreRequest
        include JSON::Serializable

        # The annotation file format of the store.
        @[JSON::Field(key: "storeFormat")]
        getter store_format : String

        # A description for the store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A name for the store.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The genome reference for the store's annotations.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem?

        # Server-side encryption (SSE) settings for the store.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # File parsing options for the annotation store.
        @[JSON::Field(key: "storeOptions")]
        getter store_options : Types::StoreOptions?

        # Tags for the store.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name given to an annotation store version to distinguish it from other versions.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @store_format : String,
          @description : String? = nil,
          @name : String? = nil,
          @reference : Types::ReferenceItem? = nil,
          @sse_config : Types::SseConfig? = nil,
          @store_options : Types::StoreOptions? = nil,
          @tags : Hash(String, String)? = nil,
          @version_name : String? = nil
        )
        end
      end

      struct CreateAnnotationStoreResponse
        include JSON::Serializable

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The name given to an annotation store version to distinguish it from other versions.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The store's genome reference. Required for all stores except TSV format with generic annotations.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem?

        # The annotation file format of the store.
        @[JSON::Field(key: "storeFormat")]
        getter store_format : String?

        # The store's file parsing options.
        @[JSON::Field(key: "storeOptions")]
        getter store_options : Types::StoreOptions?

        def initialize(
          @creation_time : Time,
          @id : String,
          @name : String,
          @status : String,
          @version_name : String,
          @reference : Types::ReferenceItem? = nil,
          @store_format : String? = nil,
          @store_options : Types::StoreOptions? = nil
        )
        end
      end

      struct CreateAnnotationStoreVersionRequest
        include JSON::Serializable

        # The name of an annotation store version from which versions are being created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name given to an annotation store version to distinguish it from other versions.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The description of an annotation store version.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Any tags added to annotation store version.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The options for an annotation store version.
        @[JSON::Field(key: "versionOptions")]
        getter version_options : Types::VersionOptions?

        def initialize(
          @name : String,
          @version_name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version_options : Types::VersionOptions? = nil
        )
        end
      end

      struct CreateAnnotationStoreVersionResponse
        include JSON::Serializable

        # The time stamp for the creation of an annotation store version.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # A generated ID for the annotation store
        @[JSON::Field(key: "id")]
        getter id : String

        # The name given to an annotation store version to distinguish it from other versions.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of a annotation store version.
        @[JSON::Field(key: "status")]
        getter status : String

        # The ID for the annotation store from which new versions are being created.
        @[JSON::Field(key: "storeId")]
        getter store_id : String

        # The name given to an annotation store version to distinguish it from other versions.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The options for an annotation store version.
        @[JSON::Field(key: "versionOptions")]
        getter version_options : Types::VersionOptions?

        def initialize(
          @creation_time : Time,
          @id : String,
          @name : String,
          @status : String,
          @store_id : String,
          @version_name : String,
          @version_options : Types::VersionOptions? = nil
        )
        end
      end

      struct CreateMultipartReadSetUploadRequest
        include JSON::Serializable

        # The name of the read set.
        @[JSON::Field(key: "name")]
        getter name : String

        # The source's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String

        # The sequence store ID for the store that is the destination of the multipart uploads.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The type of file being uploaded.
        @[JSON::Field(key: "sourceFileType")]
        getter source_file_type : String

        # The source's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String

        # An idempotency token that can be used to avoid triggering multiple multipart uploads.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the read set.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Where the source originated.
        @[JSON::Field(key: "generatedFrom")]
        getter generated_from : String?

        # The ARN of the reference.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String?

        # Any tags to add to the read set.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @sample_id : String,
          @sequence_store_id : String,
          @source_file_type : String,
          @subject_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @generated_from : String? = nil,
          @reference_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateMultipartReadSetUploadResponse
        include JSON::Serializable

        # The creation time of the multipart upload.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The read set source's reference ARN.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String

        # The source's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String

        # The sequence store ID for the store that the read set will be created in.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The file type of the read set source.
        @[JSON::Field(key: "sourceFileType")]
        getter source_file_type : String

        # The source's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String

        # The ID for the initiated multipart upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The description of the read set.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The source of the read set.
        @[JSON::Field(key: "generatedFrom")]
        getter generated_from : String?

        # The name of the read set.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags to add to the read set.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_time : Time,
          @reference_arn : String,
          @sample_id : String,
          @sequence_store_id : String,
          @source_file_type : String,
          @subject_id : String,
          @upload_id : String,
          @description : String? = nil,
          @generated_from : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateReferenceStoreRequest
        include JSON::Serializable

        # A name for the store.
        @[JSON::Field(key: "name")]
        getter name : String

        # To ensure that requests don't run multiple times, specify a unique token for each request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Server-side encryption (SSE) settings for the store.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # Tags for the store.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @sse_config : Types::SseConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateReferenceStoreResponse
        include JSON::Serializable

        # The store's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The store's SSE settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @description : String? = nil,
          @name : String? = nil,
          @sse_config : Types::SseConfig? = nil
        )
        end
      end

      struct CreateRunCacheRequest
        include JSON::Serializable

        # Specify the S3 location for storing the cached task outputs. This data must be immediately
        # accessible (not in an archived state).
        @[JSON::Field(key: "cacheS3Location")]
        getter cache_s3_location : String

        # A unique request token, to ensure idempotency. If you don't specify a token, Amazon Web Services
        # HealthOmics automatically generates a universally unique identifier (UUID) for the request.
        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # Default cache behavior for runs that use this cache. Supported values are: CACHE_ON_FAILURE : Caches
        # task outputs from completed tasks for runs that fail. This setting is useful if you're debugging a
        # workflow that fails after several tasks completed successfully. The subsequent run uses the cache
        # outputs for previously-completed tasks if the task definition, inputs, and container in ECR are
        # identical to the prior run. CACHE_ALWAYS : Caches task outputs from completed tasks for all runs.
        # This setting is useful in development mode, but do not use it in a production setting. If you don't
        # specify a value, the default behavior is CACHE_ON_FAILURE. When you start a run that uses this
        # cache, you can override the default cache behavior. For more information, see Run cache behavior in
        # the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "cacheBehavior")]
        getter cache_behavior : String?

        # The Amazon Web Services account ID of the expected owner of the S3 bucket for the run cache. If not
        # provided, your account ID is set as the owner of the bucket.
        @[JSON::Field(key: "cacheBucketOwnerId")]
        getter cache_bucket_owner_id : String?

        # Enter a description of the run cache.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Enter a user-friendly name for the run cache.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specify one or more tags to associate with this run cache.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cache_s3_location : String,
          @request_id : String,
          @cache_behavior : String? = nil,
          @cache_bucket_owner_id : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRunCacheResponse
        include JSON::Serializable

        # Unique resource identifier for the run cache.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Identifier for the run cache.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Run cache status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags associated with this run cache.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRunGroupRequest
        include JSON::Serializable

        # To ensure that requests don't run multiple times, specify a unique ID for each request.
        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The maximum number of CPUs that can run concurrently across all active runs in the run group.
        @[JSON::Field(key: "maxCpus")]
        getter max_cpus : Int32?

        # The maximum time for each run (in minutes). If a run exceeds the maximum run time, the run fails
        # automatically.
        @[JSON::Field(key: "maxDuration")]
        getter max_duration : Int32?

        # The maximum number of GPUs that can run concurrently across all active runs in the run group.
        @[JSON::Field(key: "maxGpus")]
        getter max_gpus : Int32?

        # The maximum number of runs that can be running at the same time.
        @[JSON::Field(key: "maxRuns")]
        getter max_runs : Int32?

        # A name for the group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags for the group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @request_id : String,
          @max_cpus : Int32? = nil,
          @max_duration : Int32? = nil,
          @max_gpus : Int32? = nil,
          @max_runs : Int32? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRunGroupResponse
        include JSON::Serializable

        # The group's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The group's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Tags for the run group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSequenceStoreRequest
        include JSON::Serializable

        # A name for the store.
        @[JSON::Field(key: "name")]
        getter name : String

        # An idempotency token used to dedupe retry requests so that duplicate runs are not created.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ETag algorithm family to use for ingested read sets. The default value is MD5up. For more
        # information on ETags, see ETags and data provenance in the Amazon Web Services HealthOmics User
        # Guide .
        @[JSON::Field(key: "eTagAlgorithmFamily")]
        getter e_tag_algorithm_family : String?

        # An S3 location that is used to store files that have failed a direct upload. You can add or change
        # the fallbackLocation after creating a sequence store. This is not required if you are uploading
        # files from a different S3 bucket.
        @[JSON::Field(key: "fallbackLocation")]
        getter fallback_location : String?

        # The tags keys to propagate to the S3 objects associated with read sets in the sequence store. These
        # tags can be used as input to add metadata to your read sets.
        @[JSON::Field(key: "propagatedSetLevelTags")]
        getter propagated_set_level_tags : Array(String)?

        # S3 access configuration parameters. This specifies the parameters needed to access logs stored in S3
        # buckets. The S3 bucket must be in the same region and account as the sequence store.
        @[JSON::Field(key: "s3AccessConfig")]
        getter s3_access_config : Types::S3AccessConfig?

        # Server-side encryption (SSE) settings for the store.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # Tags for the store. You can configure up to 50 tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @e_tag_algorithm_family : String? = nil,
          @fallback_location : String? = nil,
          @propagated_set_level_tags : Array(String)? = nil,
          @s3_access_config : Types::S3AccessConfig? = nil,
          @sse_config : Types::SseConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSequenceStoreResponse
        include JSON::Serializable

        # The store's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The algorithm family of the ETag.
        @[JSON::Field(key: "eTagAlgorithmFamily")]
        getter e_tag_algorithm_family : String?

        # An S3 location that is used to store files that have failed a direct upload.
        @[JSON::Field(key: "fallbackLocation")]
        getter fallback_location : String?

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags keys to propagate to the S3 objects associated with read sets in the sequence store.
        @[JSON::Field(key: "propagatedSetLevelTags")]
        getter propagated_set_level_tags : Array(String)?

        @[JSON::Field(key: "s3Access")]
        getter s3_access : Types::SequenceStoreS3Access?

        # Server-side encryption (SSE) settings for the store. This contains the KMS key ARN that is used to
        # encrypt read set objects.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # The status of the sequence store.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the sequence store.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @description : String? = nil,
          @e_tag_algorithm_family : String? = nil,
          @fallback_location : String? = nil,
          @name : String? = nil,
          @propagated_set_level_tags : Array(String)? = nil,
          @s3_access : Types::SequenceStoreS3Access? = nil,
          @sse_config : Types::SseConfig? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct CreateShareRequest
        include JSON::Serializable

        # The principal subscriber is the account being offered shared access to the resource.
        @[JSON::Field(key: "principalSubscriber")]
        getter principal_subscriber : String

        # The ARN of the resource to be shared.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A name that the owner defines for the share.
        @[JSON::Field(key: "shareName")]
        getter share_name : String?

        def initialize(
          @principal_subscriber : String,
          @resource_arn : String,
          @share_name : String? = nil
        )
        end
      end

      struct CreateShareResponse
        include JSON::Serializable

        # The ID that HealthOmics generates for the share.
        @[JSON::Field(key: "shareId")]
        getter share_id : String?

        # The name of the share.
        @[JSON::Field(key: "shareName")]
        getter share_name : String?

        # The status of the share.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @share_id : String? = nil,
          @share_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateVariantStoreRequest
        include JSON::Serializable

        # The genome reference for the store's variants.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem

        # A description for the store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A name for the store.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Server-side encryption (SSE) settings for the store.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # Tags for the store.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @reference : Types::ReferenceItem,
          @description : String? = nil,
          @name : String? = nil,
          @sse_config : Types::SseConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateVariantStoreResponse
        include JSON::Serializable

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The store's genome reference.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem?

        def initialize(
          @creation_time : Time,
          @id : String,
          @name : String,
          @status : String,
          @reference : Types::ReferenceItem? = nil
        )
        end
      end

      struct CreateWorkflowRequest
        include JSON::Serializable

        # An idempotency token to ensure that duplicate workflows are not created when Amazon Web Services
        # HealthOmics submits retry requests.
        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The computational accelerator specified to run the workflow.
        @[JSON::Field(key: "accelerators")]
        getter accelerators : String?

        # (Optional) Use a container registry map to specify mappings between the ECR private repository and
        # one or more upstream registries. For more information, see Container images in the Amazon Web
        # Services HealthOmics User Guide .
        @[JSON::Field(key: "containerRegistryMap")]
        getter container_registry_map : Types::ContainerRegistryMap?

        # (Optional) URI of the S3 location for the registry mapping file.
        @[JSON::Field(key: "containerRegistryMapUri")]
        getter container_registry_map_uri : String?

        # The repository information for the workflow definition. This allows you to source your workflow
        # definition directly from a code repository.
        @[JSON::Field(key: "definitionRepository")]
        getter definition_repository : Types::DefinitionRepository?

        # The S3 URI of a definition for the workflow. The S3 bucket must be in the same region as the
        # workflow.
        @[JSON::Field(key: "definitionUri")]
        getter definition_uri : String?

        # A ZIP archive containing the main workflow definition file and dependencies that it imports for the
        # workflow. You can use a file with a ://fileb prefix instead of the Base64 string. For more
        # information, see Workflow definition requirements in the Amazon Web Services HealthOmics User Guide
        # .
        @[JSON::Field(key: "definitionZip")]
        getter definition_zip : Bytes?

        # A description for the workflow.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The workflow engine for the workflow. This is only required if you have workflow definition files
        # from more than one engine in your zip file. Otherwise, the service can detect the engine
        # automatically from your workflow definition.
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The path of the main definition file for the workflow. This parameter is not required if the ZIP
        # archive contains only one workflow definition file, or if the main definition file is named “main”.
        # An example path is: workflow-definition/main-file.wdl .
        @[JSON::Field(key: "main")]
        getter main : String?

        # Name (optional but highly recommended) for the workflow to locate relevant information in the
        # CloudWatch logs and Amazon Web Services HealthOmics console.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A parameter template for the workflow. If this field is blank, Amazon Web Services HealthOmics will
        # automatically parse the parameter template values from your workflow definition file. To override
        # these service generated default values, provide a parameter template. To view an example of a
        # parameter template, see Parameter template files in the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "parameterTemplate")]
        getter parameter_template : Hash(String, Types::WorkflowParameter)?

        # The path to the workflow parameter template JSON file within the repository. This file defines the
        # input parameters for runs that use this workflow. If not specified, the workflow will be created
        # without a parameter template.
        @[JSON::Field(key: "parameterTemplatePath")]
        getter parameter_template_path : String?

        # The markdown content for the workflow's README file. This provides documentation and usage
        # information for users of the workflow.
        @[JSON::Field(key: "readmeMarkdown")]
        getter readme_markdown : String?

        # The path to the workflow README markdown file within the repository. This file provides
        # documentation and usage information for the workflow. If not specified, the README.md file from the
        # root directory of the repository will be used.
        @[JSON::Field(key: "readmePath")]
        getter readme_path : String?

        # The S3 URI of the README file for the workflow. This file provides documentation and usage
        # information for the workflow. Requirements include: The S3 URI must begin with
        # s3://USER-OWNED-BUCKET/ The requester must have access to the S3 bucket and object. The max README
        # content length is 500 KiB.
        @[JSON::Field(key: "readmeUri")]
        getter readme_uri : String?

        # The default static storage capacity (in gibibytes) for runs that use this workflow or workflow
        # version. The storageCapacity can be overwritten at run time. The storage capacity is not required
        # for runs with a DYNAMIC storage type.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The default storage type for runs that use this workflow. The storageType can be overridden at run
        # time. DYNAMIC storage dynamically scales the storage up or down, based on file system utilization.
        # STATIC storage allocates a fixed amount of storage. For more information about dynamic and static
        # storage types, see Run storage types in the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # Tags for the workflow. You can define up to 50 tags for the workflow. For more information, see
        # Adding a tag in the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Web Services account ID of the expected owner of the S3 bucket that contains the workflow
        # definition. If not specified, the service skips the validation.
        @[JSON::Field(key: "workflowBucketOwnerId")]
        getter workflow_bucket_owner_id : String?

        def initialize(
          @request_id : String,
          @accelerators : String? = nil,
          @container_registry_map : Types::ContainerRegistryMap? = nil,
          @container_registry_map_uri : String? = nil,
          @definition_repository : Types::DefinitionRepository? = nil,
          @definition_uri : String? = nil,
          @definition_zip : Bytes? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @main : String? = nil,
          @name : String? = nil,
          @parameter_template : Hash(String, Types::WorkflowParameter)? = nil,
          @parameter_template_path : String? = nil,
          @readme_markdown : String? = nil,
          @readme_path : String? = nil,
          @readme_uri : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflow_bucket_owner_id : String? = nil
        )
        end
      end

      struct CreateWorkflowResponse
        include JSON::Serializable

        # The workflow's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The workflow's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The workflow's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The workflow's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The universally unique identifier (UUID) value for this workflow.
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uuid : String? = nil
        )
        end
      end

      struct CreateWorkflowVersionRequest
        include JSON::Serializable

        # An idempotency token to ensure that duplicate workflows are not created when Amazon Web Services
        # HealthOmics submits retry requests.
        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # A name for the workflow version. Provide a version name that is unique for this workflow. You cannot
        # change the name after HealthOmics creates the version. The version name must start with a letter or
        # number and it can include upper-case and lower-case letters, numbers, hyphens, periods and
        # underscores. The maximum length is 64 characters. You can use a simple naming scheme, such as
        # version1, version2, version3. You can also match your workflow versions with your own internal
        # versioning conventions, such as 2.7.0, 2.7.1, 2.7.2.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The ID of the workflow where you are creating the new version. The workflowId is not the UUID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The computational accelerator for this workflow version.
        @[JSON::Field(key: "accelerators")]
        getter accelerators : String?

        # (Optional) Use a container registry map to specify mappings between the ECR private repository and
        # one or more upstream registries. For more information, see Container images in the Amazon Web
        # Services HealthOmics User Guide .
        @[JSON::Field(key: "containerRegistryMap")]
        getter container_registry_map : Types::ContainerRegistryMap?

        # (Optional) URI of the S3 location for the registry mapping file.
        @[JSON::Field(key: "containerRegistryMapUri")]
        getter container_registry_map_uri : String?

        # The repository information for the workflow version definition. This allows you to source your
        # workflow version definition directly from a code repository.
        @[JSON::Field(key: "definitionRepository")]
        getter definition_repository : Types::DefinitionRepository?

        # The S3 URI of a definition for this workflow version. The S3 bucket must be in the same region as
        # this workflow version.
        @[JSON::Field(key: "definitionUri")]
        getter definition_uri : String?

        # A ZIP archive containing the main workflow definition file and dependencies that it imports for this
        # workflow version. You can use a file with a ://fileb prefix instead of the Base64 string. For more
        # information, see Workflow definition requirements in the Amazon Web Services HealthOmics User Guide
        # .
        @[JSON::Field(key: "definitionZip")]
        getter definition_zip : Bytes?

        # A description for this workflow version.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The workflow engine for this workflow version. This is only required if you have workflow definition
        # files from more than one engine in your zip file. Otherwise, the service can detect the engine
        # automatically from your workflow definition.
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The path of the main definition file for this workflow version. This parameter is not required if
        # the ZIP archive contains only one workflow definition file, or if the main definition file is named
        # “main”. An example path is: workflow-definition/main-file.wdl .
        @[JSON::Field(key: "main")]
        getter main : String?

        # A parameter template for this workflow version. If this field is blank, Amazon Web Services
        # HealthOmics will automatically parse the parameter template values from your workflow definition
        # file. To override these service generated default values, provide a parameter template. To view an
        # example of a parameter template, see Parameter template files in the Amazon Web Services HealthOmics
        # User Guide .
        @[JSON::Field(key: "parameterTemplate")]
        getter parameter_template : Hash(String, Types::WorkflowParameter)?

        # The path to the workflow version parameter template JSON file within the repository. This file
        # defines the input parameters for runs that use this workflow version. If not specified, the workflow
        # version will be created without a parameter template.
        @[JSON::Field(key: "parameterTemplatePath")]
        getter parameter_template_path : String?

        # The markdown content for the workflow version's README file. This provides documentation and usage
        # information for users of this specific workflow version.
        @[JSON::Field(key: "readmeMarkdown")]
        getter readme_markdown : String?

        # The path to the workflow version README markdown file within the repository. This file provides
        # documentation and usage information for the workflow. If not specified, the README.md file from the
        # root directory of the repository will be used.
        @[JSON::Field(key: "readmePath")]
        getter readme_path : String?

        # The S3 URI of the README file for the workflow version. This file provides documentation and usage
        # information for the workflow version. Requirements include: The S3 URI must begin with
        # s3://USER-OWNED-BUCKET/ The requester must have access to the S3 bucket and object. The max README
        # content length is 500 KiB.
        @[JSON::Field(key: "readmeUri")]
        getter readme_uri : String?

        # The default static storage capacity (in gibibytes) for runs that use this workflow version. The
        # storageCapacity can be overwritten at run time. The storage capacity is not required for runs with a
        # DYNAMIC storage type.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The default storage type for runs that use this workflow version. The storageType can be overridden
        # at run time. DYNAMIC storage dynamically scales the storage up or down, based on file system
        # utilization. STATIC storage allocates a fixed amount of storage. For more information about dynamic
        # and static storage types, see Run storage types in the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # Tags for this workflow version. You can define up to 50 tags for the workflow. For more information,
        # see Adding a tag in the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Amazon Web Services Id of the owner of the S3 bucket that contains the workflow definition. You need
        # to specify this parameter if your account is not the bucket owner.
        @[JSON::Field(key: "workflowBucketOwnerId")]
        getter workflow_bucket_owner_id : String?

        def initialize(
          @request_id : String,
          @version_name : String,
          @workflow_id : String,
          @accelerators : String? = nil,
          @container_registry_map : Types::ContainerRegistryMap? = nil,
          @container_registry_map_uri : String? = nil,
          @definition_repository : Types::DefinitionRepository? = nil,
          @definition_uri : String? = nil,
          @definition_zip : Bytes? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @main : String? = nil,
          @parameter_template : Hash(String, Types::WorkflowParameter)? = nil,
          @parameter_template_path : String? = nil,
          @readme_markdown : String? = nil,
          @readme_path : String? = nil,
          @readme_uri : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflow_bucket_owner_id : String? = nil
        )
        end
      end

      struct CreateWorkflowVersionResponse
        include JSON::Serializable

        # ARN of the workflow version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The workflow version status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The workflow version's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The universally unique identifier (UUID) value for this workflow version.
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        # The workflow version name.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        # The workflow's ID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @arn : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uuid : String? = nil,
          @version_name : String? = nil,
          @workflow_id : String? = nil
        )
        end
      end

      # Contains information about a source code repository that hosts the workflow definition files.
      struct DefinitionRepository
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection to the source code repository.
        @[JSON::Field(key: "connectionArn")]
        getter connection_arn : String

        # The full repository identifier, including the repository owner and name. For example,
        # 'repository-owner/repository-name'.
        @[JSON::Field(key: "fullRepositoryId")]
        getter full_repository_id : String

        # A list of file patterns to exclude when retrieving the workflow definition from the repository.
        @[JSON::Field(key: "excludeFilePatterns")]
        getter exclude_file_patterns : Array(String)?

        # The source reference for the repository, such as a branch name, tag, or commit ID.
        @[JSON::Field(key: "sourceReference")]
        getter source_reference : Types::SourceReference?

        def initialize(
          @connection_arn : String,
          @full_repository_id : String,
          @exclude_file_patterns : Array(String)? = nil,
          @source_reference : Types::SourceReference? = nil
        )
        end
      end

      # Contains detailed information about the source code repository that hosts the workflow definition
      # files.
      struct DefinitionRepositoryDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection to the source code repository.
        @[JSON::Field(key: "connectionArn")]
        getter connection_arn : String?

        # The full repository identifier, including the repository owner and name. For example,
        # 'repository-owner/repository-name'.
        @[JSON::Field(key: "fullRepositoryId")]
        getter full_repository_id : String?

        # The endpoint URL of the source code repository provider.
        @[JSON::Field(key: "providerEndpoint")]
        getter provider_endpoint : String?

        # The provider type of the source code repository, such as Bitbucket, GitHub, GitHubEnterpriseServer,
        # GitLab, and GitLabSelfManaged.
        @[JSON::Field(key: "providerType")]
        getter provider_type : String?

        # The source reference for the repository, such as a branch name, tag, or commit ID.
        @[JSON::Field(key: "sourceReference")]
        getter source_reference : Types::SourceReference?

        def initialize(
          @connection_arn : String? = nil,
          @full_repository_id : String? = nil,
          @provider_endpoint : String? = nil,
          @provider_type : String? = nil,
          @source_reference : Types::SourceReference? = nil
        )
        end
      end

      struct DeleteAnnotationStoreRequest
        include JSON::Serializable

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # Whether to force deletion.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @name : String,
          @force : Bool? = nil
        )
        end
      end

      struct DeleteAnnotationStoreResponse
        include JSON::Serializable

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct DeleteAnnotationStoreVersionsRequest
        include JSON::Serializable

        # The name of the annotation store from which versions are being deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        # The versions of an annotation store to be deleted.
        @[JSON::Field(key: "versions")]
        getter versions : Array(String)

        # Forces the deletion of an annotation store version when imports are in-progress..
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @name : String,
          @versions : Array(String),
          @force : Bool? = nil
        )
        end
      end

      struct DeleteAnnotationStoreVersionsResponse
        include JSON::Serializable

        # Any errors that occur when attempting to delete an annotation store version.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::VersionDeleteError)?

        def initialize(
          @errors : Array(Types::VersionDeleteError)? = nil
        )
        end
      end

      struct DeleteReferenceRequest
        include JSON::Serializable

        # The reference's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reference's store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        def initialize(
          @id : String,
          @reference_store_id : String
        )
        end
      end

      struct DeleteReferenceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteReferenceStoreRequest
        include JSON::Serializable

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteReferenceStoreResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteRunCacheRequest
        include JSON::Serializable

        # Run cache identifier for the cache you want to delete.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteRunGroupRequest
        include JSON::Serializable

        # The run group's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteRunRequest
        include JSON::Serializable

        # The run's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteS3AccessPolicyRequest
        include JSON::Serializable

        # The S3 access point ARN that has the access policy.
        @[JSON::Field(key: "s3AccessPointArn")]
        getter s3_access_point_arn : String

        def initialize(
          @s3_access_point_arn : String
        )
        end
      end

      struct DeleteS3AccessPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSequenceStoreRequest
        include JSON::Serializable

        # The sequence store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteSequenceStoreResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteShareRequest
        include JSON::Serializable

        # The ID for the resource share to be deleted.
        @[JSON::Field(key: "shareId")]
        getter share_id : String

        def initialize(
          @share_id : String
        )
        end
      end

      struct DeleteShareResponse
        include JSON::Serializable

        # The status of the share being deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct DeleteVariantStoreRequest
        include JSON::Serializable

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # Whether to force deletion.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @name : String,
          @force : Bool? = nil
        )
        end
      end

      struct DeleteVariantStoreResponse
        include JSON::Serializable

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct DeleteWorkflowRequest
        include JSON::Serializable

        # The workflow's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteWorkflowVersionRequest
        include JSON::Serializable

        # The workflow version name.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The workflow's ID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @version_name : String,
          @workflow_id : String
        )
        end
      end

      # The entity tag (ETag) is a hash of the object representing its semantic content.
      struct ETag
        include JSON::Serializable

        # The algorithm used to calculate the read set’s ETag(s).
        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # The ETag hash calculated on Source1 of the read set.
        @[JSON::Field(key: "source1")]
        getter source1 : String?

        # The ETag hash calculated on Source2 of the read set.
        @[JSON::Field(key: "source2")]
        getter source2 : String?

        def initialize(
          @algorithm : String? = nil,
          @source1 : String? = nil,
          @source2 : String? = nil
        )
        end
      end

      # A read set.
      struct ExportReadSet
        include JSON::Serializable

        # The set's ID.
        @[JSON::Field(key: "readSetId")]
        getter read_set_id : String

        def initialize(
          @read_set_id : String
        )
        end
      end

      # Details about a read set.
      struct ExportReadSetDetail
        include JSON::Serializable

        # The set's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The set's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The set's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @id : String,
          @status : String,
          @status_message : String? = nil
        )
        end
      end

      # An read set export job filter.
      struct ExportReadSetFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a read set export job.
      struct ExportReadSetJobDetail
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's destination in Amazon S3.
        @[JSON::Field(key: "destination")]
        getter destination : String

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        def initialize(
          @creation_time : Time,
          @destination : String,
          @id : String,
          @sequence_store_id : String,
          @status : String,
          @completion_time : Time? = nil
        )
        end
      end

      # Details about a file.
      struct FileInformation
        include JSON::Serializable

        # The file's content length.
        @[JSON::Field(key: "contentLength")]
        getter content_length : Int64?

        # The file's part size.
        @[JSON::Field(key: "partSize")]
        getter part_size : Int64?

        # The S3 URI metadata of a sequence store.
        @[JSON::Field(key: "s3Access")]
        getter s3_access : Types::ReadSetS3Access?

        # The file's total parts.
        @[JSON::Field(key: "totalParts")]
        getter total_parts : Int32?

        def initialize(
          @content_length : Int64? = nil,
          @part_size : Int64? = nil,
          @s3_access : Types::ReadSetS3Access? = nil,
          @total_parts : Int32? = nil
        )
        end
      end

      # Use filters to return a subset of resources. You can define filters for specific parameters, such as
      # the resource status.
      struct Filter
        include JSON::Serializable

        # Filter based on the Amazon Resource Number (ARN) of the resource. You can specify up to 10 values.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # Filter based on the resource status. You can specify up to 10 values.
        @[JSON::Field(key: "status")]
        getter status : Array(String)?

        # The type of resources to be filtered. You can specify one or more of the resource types.
        @[JSON::Field(key: "type")]
        getter type : Array(String)?

        def initialize(
          @resource_arns : Array(String)? = nil,
          @status : Array(String)? = nil,
          @type : Array(String)? = nil
        )
        end
      end

      # Formatting options for a file.
      struct FormatOptions
        include JSON::Serializable

        # Options for a TSV file.
        @[JSON::Field(key: "tsvOptions")]
        getter tsv_options : Types::TsvOptions?

        # Options for a VCF file.
        @[JSON::Field(key: "vcfOptions")]
        getter vcf_options : Types::VcfOptions?

        def initialize(
          @tsv_options : Types::TsvOptions? = nil,
          @vcf_options : Types::VcfOptions? = nil
        )
        end
      end

      struct GetAnnotationImportRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetAnnotationImportResponse
        include JSON::Serializable

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's destination annotation store.
        @[JSON::Field(key: "destinationName")]
        getter destination_name : String

        @[JSON::Field(key: "formatOptions")]
        getter format_options : Types::FormatOptions

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's imported items.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AnnotationImportItemDetail)

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's left normalization setting.
        @[JSON::Field(key: "runLeftNormalization")]
        getter run_left_normalization : Bool

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The job's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # When the job was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The name of the annotation store version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The annotation schema generated by the parsed annotation data.
        @[JSON::Field(key: "annotationFields")]
        getter annotation_fields : Hash(String, String)?

        def initialize(
          @completion_time : Time,
          @creation_time : Time,
          @destination_name : String,
          @format_options : Types::FormatOptions,
          @id : String,
          @items : Array(Types::AnnotationImportItemDetail),
          @role_arn : String,
          @run_left_normalization : Bool,
          @status : String,
          @status_message : String,
          @update_time : Time,
          @version_name : String,
          @annotation_fields : Hash(String, String)? = nil
        )
        end
      end

      struct GetAnnotationStoreRequest
        include JSON::Serializable

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetAnnotationStoreResponse
        include JSON::Serializable

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # An integer indicating how many versions of an annotation store exist.
        @[JSON::Field(key: "numVersions")]
        getter num_versions : Int32

        # The store's genome reference.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # A status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # The store's ARN.
        @[JSON::Field(key: "storeArn")]
        getter store_arn : String

        # The store's size in bytes.
        @[JSON::Field(key: "storeSizeBytes")]
        getter store_size_bytes : Int64

        # The store's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        # When the store was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The store's annotation file format.
        @[JSON::Field(key: "storeFormat")]
        getter store_format : String?

        # The store's parsing options.
        @[JSON::Field(key: "storeOptions")]
        getter store_options : Types::StoreOptions?

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @num_versions : Int32,
          @reference : Types::ReferenceItem,
          @sse_config : Types::SseConfig,
          @status : String,
          @status_message : String,
          @store_arn : String,
          @store_size_bytes : Int64,
          @tags : Hash(String, String),
          @update_time : Time,
          @store_format : String? = nil,
          @store_options : Types::StoreOptions? = nil
        )
        end
      end

      struct GetAnnotationStoreVersionRequest
        include JSON::Serializable

        # The name given to an annotation store version to distinguish it from others.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name given to an annotation store version to distinguish it from others.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        def initialize(
          @name : String,
          @version_name : String
        )
        end
      end

      struct GetAnnotationStoreVersionResponse
        include JSON::Serializable

        # The time stamp for when an annotation store version was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The description for an annotation store version.
        @[JSON::Field(key: "description")]
        getter description : String

        # The annotation store version ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the annotation store.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of an annotation store version.
        @[JSON::Field(key: "status")]
        getter status : String

        # The status of an annotation store version.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # The store ID for annotation store version.
        @[JSON::Field(key: "storeId")]
        getter store_id : String

        # Any tags associated with an annotation store version.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        # The time stamp for when an annotation store version was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The Arn for the annotation store.
        @[JSON::Field(key: "versionArn")]
        getter version_arn : String

        # The name given to an annotation store version to distinguish it from others.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The size of the annotation store version in Bytes.
        @[JSON::Field(key: "versionSizeBytes")]
        getter version_size_bytes : Int64

        # The options for an annotation store version.
        @[JSON::Field(key: "versionOptions")]
        getter version_options : Types::VersionOptions?

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @status : String,
          @status_message : String,
          @store_id : String,
          @tags : Hash(String, String),
          @update_time : Time,
          @version_arn : String,
          @version_name : String,
          @version_size_bytes : Int64,
          @version_options : Types::VersionOptions? = nil
        )
        end
      end

      struct GetReadSetActivationJobRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        def initialize(
          @id : String,
          @sequence_store_id : String
        )
        end
      end

      struct GetReadSetActivationJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The job's source files.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::ActivateReadSetSourceItem)?

        # The job's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time,
          @id : String,
          @sequence_store_id : String,
          @status : String,
          @completion_time : Time? = nil,
          @sources : Array(Types::ActivateReadSetSourceItem)? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct GetReadSetExportJobRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        def initialize(
          @id : String,
          @sequence_store_id : String
        )
        end
      end

      struct GetReadSetExportJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's destination in Amazon S3.
        @[JSON::Field(key: "destination")]
        getter destination : String

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The job's read sets.
        @[JSON::Field(key: "readSets")]
        getter read_sets : Array(Types::ExportReadSetDetail)?

        # The job's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time,
          @destination : String,
          @id : String,
          @sequence_store_id : String,
          @status : String,
          @completion_time : Time? = nil,
          @read_sets : Array(Types::ExportReadSetDetail)? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct GetReadSetImportJobRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        def initialize(
          @id : String,
          @sequence_store_id : String
        )
        end
      end

      struct GetReadSetImportJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's source files.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::ImportReadSetSourceItem)

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The job's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time,
          @id : String,
          @role_arn : String,
          @sequence_store_id : String,
          @sources : Array(Types::ImportReadSetSourceItem),
          @status : String,
          @completion_time : Time? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct GetReadSetMetadataRequest
        include JSON::Serializable

        # The read set's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        def initialize(
          @id : String,
          @sequence_store_id : String
        )
        end
      end

      struct GetReadSetMetadataResponse
        include JSON::Serializable

        # The read set's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the read set was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The read set's file type.
        @[JSON::Field(key: "fileType")]
        getter file_type : String

        # The read set's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The read set's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The read set's creation job ID.
        @[JSON::Field(key: "creationJobId")]
        getter creation_job_id : String?

        # The creation type of the read set.
        @[JSON::Field(key: "creationType")]
        getter creation_type : String?

        # The read set's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The entity tag (ETag) is a hash of the object meant to represent its semantic content.
        @[JSON::Field(key: "etag")]
        getter etag : Types::ETag?

        # The read set's files.
        @[JSON::Field(key: "files")]
        getter files : Types::ReadSetFiles?

        # The read set's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The read set's genome reference ARN.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String?

        # The read set's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String?

        # The read set's sequence information.
        @[JSON::Field(key: "sequenceInformation")]
        getter sequence_information : Types::SequenceInformation?

        # The status message for a read set. It provides more detail as to why the read set has a status.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The read set's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @file_type : String,
          @id : String,
          @sequence_store_id : String,
          @status : String,
          @creation_job_id : String? = nil,
          @creation_type : String? = nil,
          @description : String? = nil,
          @etag : Types::ETag? = nil,
          @files : Types::ReadSetFiles? = nil,
          @name : String? = nil,
          @reference_arn : String? = nil,
          @sample_id : String? = nil,
          @sequence_information : Types::SequenceInformation? = nil,
          @status_message : String? = nil,
          @subject_id : String? = nil
        )
        end
      end

      struct GetReadSetRequest
        include JSON::Serializable

        # The read set's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The part number to retrieve.
        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The file to retrieve.
        @[JSON::Field(key: "file")]
        getter file : String?

        def initialize(
          @id : String,
          @part_number : Int32,
          @sequence_store_id : String,
          @file : String? = nil
        )
        end
      end

      struct GetReadSetResponse
        include JSON::Serializable

        # The read set file payload.
        @[JSON::Field(key: "payload")]
        getter payload : Bytes?

        def initialize(
          @payload : Bytes? = nil
        )
        end
      end

      struct GetReferenceImportJobRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        def initialize(
          @id : String,
          @reference_store_id : String
        )
        end
      end

      struct GetReferenceImportJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's source files.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::ImportReferenceSourceItem)

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The job's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time,
          @id : String,
          @reference_store_id : String,
          @role_arn : String,
          @sources : Array(Types::ImportReferenceSourceItem),
          @status : String,
          @completion_time : Time? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct GetReferenceMetadataRequest
        include JSON::Serializable

        # The reference's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reference's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        def initialize(
          @id : String,
          @reference_store_id : String
        )
        end
      end

      struct GetReferenceMetadataResponse
        include JSON::Serializable

        # The reference's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the reference was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The reference's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reference's MD5 checksum.
        @[JSON::Field(key: "md5")]
        getter md5 : String

        # The reference's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # When the reference was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The reference's creation job ID.
        @[JSON::Field(key: "creationJobId")]
        getter creation_job_id : String?

        # The reference's creation type.
        @[JSON::Field(key: "creationType")]
        getter creation_type : String?

        # The reference's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The reference's files.
        @[JSON::Field(key: "files")]
        getter files : Types::ReferenceFiles?

        # The reference's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The reference's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @md5 : String,
          @reference_store_id : String,
          @update_time : Time,
          @creation_job_id : String? = nil,
          @creation_type : String? = nil,
          @description : String? = nil,
          @files : Types::ReferenceFiles? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetReferenceRequest
        include JSON::Serializable

        # The reference's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The part number to retrieve.
        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32

        # The reference's store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # The file to retrieve.
        @[JSON::Field(key: "file")]
        getter file : String?

        # The range to retrieve.
        @[JSON::Field(key: "Range")]
        getter range : String?

        def initialize(
          @id : String,
          @part_number : Int32,
          @reference_store_id : String,
          @file : String? = nil,
          @range : String? = nil
        )
        end
      end

      struct GetReferenceResponse
        include JSON::Serializable

        # The reference file payload.
        @[JSON::Field(key: "payload")]
        getter payload : Bytes?

        def initialize(
          @payload : Bytes? = nil
        )
        end
      end

      struct GetReferenceStoreRequest
        include JSON::Serializable

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetReferenceStoreResponse
        include JSON::Serializable

        # The store's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @description : String? = nil,
          @name : String? = nil,
          @sse_config : Types::SseConfig? = nil
        )
        end
      end

      struct GetRunCacheRequest
        include JSON::Serializable

        # The identifier of the run cache to retrieve.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetRunCacheResponse
        include JSON::Serializable

        # Unique resource identifier for the run cache.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The default cache behavior for runs using this cache.
        @[JSON::Field(key: "cacheBehavior")]
        getter cache_behavior : String?

        # The identifier of the bucket owner.
        @[JSON::Field(key: "cacheBucketOwnerId")]
        getter cache_bucket_owner_id : String?

        # The S3 URI where the cache data is stored.
        @[JSON::Field(key: "cacheS3Uri")]
        getter cache_s3_uri : String?

        # Creation time of the run cache (an ISO 8601 formatted string).
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The run cache description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The run cache ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The run cache name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The run cache status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags associated with the run cache.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cache_behavior : String? = nil,
          @cache_bucket_owner_id : String? = nil,
          @cache_s3_uri : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetRunGroupRequest
        include JSON::Serializable

        # The group's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetRunGroupResponse
        include JSON::Serializable

        # The group's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When the group was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The group's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The group's maximum number of CPUs to use.
        @[JSON::Field(key: "maxCpus")]
        getter max_cpus : Int32?

        # The group's maximum run time in minutes.
        @[JSON::Field(key: "maxDuration")]
        getter max_duration : Int32?

        # The maximum GPUs that can be used by a run group.
        @[JSON::Field(key: "maxGpus")]
        getter max_gpus : Int32?

        # The maximum number of concurrent runs for the group.
        @[JSON::Field(key: "maxRuns")]
        getter max_runs : Int32?

        # The group's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The group's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @id : String? = nil,
          @max_cpus : Int32? = nil,
          @max_duration : Int32? = nil,
          @max_gpus : Int32? = nil,
          @max_runs : Int32? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetRunRequest
        include JSON::Serializable

        # The run's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The run's export format.
        @[JSON::Field(key: "export")]
        getter export : Array(String)?

        def initialize(
          @id : String,
          @export : Array(String)? = nil
        )
        end
      end

      struct GetRunResponse
        include JSON::Serializable

        # The computational accelerator used to run the workflow.
        @[JSON::Field(key: "accelerators")]
        getter accelerators : String?

        # The run's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The run cache behavior for the run.
        @[JSON::Field(key: "cacheBehavior")]
        getter cache_behavior : String?

        # The run cache associated with the run.
        @[JSON::Field(key: "cacheId")]
        getter cache_id : String?

        # When the run was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The run's definition.
        @[JSON::Field(key: "definition")]
        getter definition : String?

        # The run's digest.
        @[JSON::Field(key: "digest")]
        getter digest : String?

        # The actual Nextflow engine version that Amazon Web Services HealthOmics used for the run. The other
        # workflow definition languages don't provide a value for this field.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The reason a run has failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The run's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The run's log level.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # The location of the run log.
        @[JSON::Field(key: "logLocation")]
        getter log_location : Types::RunLogLocation?

        # The run's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The run's output URI.
        @[JSON::Field(key: "outputUri")]
        getter output_uri : String?

        # The run's parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::RunParameters?

        # The run's priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The run's resource digests.
        @[JSON::Field(key: "resourceDigests")]
        getter resource_digests : Hash(String, String)?

        # The run's retention mode.
        @[JSON::Field(key: "retentionMode")]
        getter retention_mode : String?

        # The run's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The run's group ID.
        @[JSON::Field(key: "runGroupId")]
        getter run_group_id : String?

        # The run's ID.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        # The destination for workflow outputs.
        @[JSON::Field(key: "runOutputUri")]
        getter run_output_uri : String?

        # When the run started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Who started the run.
        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        # The run's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The run's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The run's stop time.
        @[JSON::Field(key: "stopTime")]
        getter stop_time : Time?

        # The run's storage capacity in gibibytes. For dynamic storage, after the run has completed, this
        # value is the maximum amount of storage used during the run.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The run's storage type.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # The run's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The universally unique identifier for a run.
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        # The run's workflow ID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        # The ID of the workflow owner.
        @[JSON::Field(key: "workflowOwnerId")]
        getter workflow_owner_id : String?

        # The run's workflow type.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : String?

        # The universally unique identifier (UUID) value for the workflow.
        @[JSON::Field(key: "workflowUuid")]
        getter workflow_uuid : String?

        # The workflow version name.
        @[JSON::Field(key: "workflowVersionName")]
        getter workflow_version_name : String?

        def initialize(
          @accelerators : String? = nil,
          @arn : String? = nil,
          @cache_behavior : String? = nil,
          @cache_id : String? = nil,
          @creation_time : Time? = nil,
          @definition : String? = nil,
          @digest : String? = nil,
          @engine_version : String? = nil,
          @failure_reason : String? = nil,
          @id : String? = nil,
          @log_level : String? = nil,
          @log_location : Types::RunLogLocation? = nil,
          @name : String? = nil,
          @output_uri : String? = nil,
          @parameters : Types::RunParameters? = nil,
          @priority : Int32? = nil,
          @resource_digests : Hash(String, String)? = nil,
          @retention_mode : String? = nil,
          @role_arn : String? = nil,
          @run_group_id : String? = nil,
          @run_id : String? = nil,
          @run_output_uri : String? = nil,
          @start_time : Time? = nil,
          @started_by : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @stop_time : Time? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uuid : String? = nil,
          @workflow_id : String? = nil,
          @workflow_owner_id : String? = nil,
          @workflow_type : String? = nil,
          @workflow_uuid : String? = nil,
          @workflow_version_name : String? = nil
        )
        end
      end

      struct GetRunTaskRequest
        include JSON::Serializable

        # The workflow run ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The task's ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @id : String,
          @task_id : String
        )
        end
      end

      struct GetRunTaskResponse
        include JSON::Serializable

        # Set to true if Amazon Web Services HealthOmics found a matching entry in the run cache for this
        # task.
        @[JSON::Field(key: "cacheHit")]
        getter cache_hit : Bool?

        # The S3 URI of the cache location.
        @[JSON::Field(key: "cacheS3Uri")]
        getter cache_s3_uri : String?

        # The task's CPU usage.
        @[JSON::Field(key: "cpus")]
        getter cpus : Int32?

        # When the task was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The reason a task has failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The number of Graphics Processing Units (GPU) specified in the task.
        @[JSON::Field(key: "gpus")]
        getter gpus : Int32?

        # Details about the container image that this task uses.
        @[JSON::Field(key: "imageDetails")]
        getter image_details : Types::ImageDetails?

        # The instance type for a task.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The task's log stream.
        @[JSON::Field(key: "logStream")]
        getter log_stream : String?

        # The task's memory use in gigabytes.
        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The task's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The task's start time.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The task's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The task's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The task's stop time.
        @[JSON::Field(key: "stopTime")]
        getter stop_time : Time?

        # The task's ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @cache_hit : Bool? = nil,
          @cache_s3_uri : String? = nil,
          @cpus : Int32? = nil,
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @gpus : Int32? = nil,
          @image_details : Types::ImageDetails? = nil,
          @instance_type : String? = nil,
          @log_stream : String? = nil,
          @memory : Int32? = nil,
          @name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @stop_time : Time? = nil,
          @task_id : String? = nil
        )
        end
      end

      struct GetS3AccessPolicyRequest
        include JSON::Serializable

        # The S3 access point ARN that has the access policy.
        @[JSON::Field(key: "s3AccessPointArn")]
        getter s3_access_point_arn : String

        def initialize(
          @s3_access_point_arn : String
        )
        end
      end

      struct GetS3AccessPolicyResponse
        include JSON::Serializable

        # The current resource policy that controls S3 access on the store.
        @[JSON::Field(key: "s3AccessPolicy")]
        getter s3_access_policy : String

        # The S3 access point ARN that has the access policy.
        @[JSON::Field(key: "s3AccessPointArn")]
        getter s3_access_point_arn : String?

        # The Amazon Web Services-generated Sequence Store or Reference Store ID.
        @[JSON::Field(key: "storeId")]
        getter store_id : String?

        # The type of store associated with the access point.
        @[JSON::Field(key: "storeType")]
        getter store_type : String?

        # The time when the policy was last updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @s3_access_policy : String,
          @s3_access_point_arn : String? = nil,
          @store_id : String? = nil,
          @store_type : String? = nil,
          @update_time : Time? = nil
        )
        end
      end

      struct GetSequenceStoreRequest
        include JSON::Serializable

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetSequenceStoreResponse
        include JSON::Serializable

        # The store's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The algorithm family of the ETag.
        @[JSON::Field(key: "eTagAlgorithmFamily")]
        getter e_tag_algorithm_family : String?

        # An S3 location that is used to store files that have failed a direct upload.
        @[JSON::Field(key: "fallbackLocation")]
        getter fallback_location : String?

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags keys to propagate to the S3 objects associated with read sets in the sequence store.
        @[JSON::Field(key: "propagatedSetLevelTags")]
        getter propagated_set_level_tags : Array(String)?

        # The S3 metadata of a sequence store, including the ARN and S3 URI of the S3 bucket.
        @[JSON::Field(key: "s3Access")]
        getter s3_access : Types::SequenceStoreS3Access?

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # The status of the sequence store.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the sequence store.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The last-updated time of the sequence store.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @description : String? = nil,
          @e_tag_algorithm_family : String? = nil,
          @fallback_location : String? = nil,
          @name : String? = nil,
          @propagated_set_level_tags : Array(String)? = nil,
          @s3_access : Types::SequenceStoreS3Access? = nil,
          @sse_config : Types::SseConfig? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @update_time : Time? = nil
        )
        end
      end

      struct GetShareRequest
        include JSON::Serializable

        # The ID of the share.
        @[JSON::Field(key: "shareId")]
        getter share_id : String

        def initialize(
          @share_id : String
        )
        end
      end

      struct GetShareResponse
        include JSON::Serializable

        # A resource share details object. The object includes the status, the resourceArn, and ownerId.
        @[JSON::Field(key: "share")]
        getter share : Types::ShareDetails?

        def initialize(
          @share : Types::ShareDetails? = nil
        )
        end
      end

      struct GetVariantImportRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetVariantImportResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's destination variant store.
        @[JSON::Field(key: "destinationName")]
        getter destination_name : String

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's items.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::VariantImportItemDetail)

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's left normalization setting.
        @[JSON::Field(key: "runLeftNormalization")]
        getter run_left_normalization : Bool

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The job's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # When the job was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The annotation schema generated by the parsed annotation data.
        @[JSON::Field(key: "annotationFields")]
        getter annotation_fields : Hash(String, String)?

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        def initialize(
          @creation_time : Time,
          @destination_name : String,
          @id : String,
          @items : Array(Types::VariantImportItemDetail),
          @role_arn : String,
          @run_left_normalization : Bool,
          @status : String,
          @status_message : String,
          @update_time : Time,
          @annotation_fields : Hash(String, String)? = nil,
          @completion_time : Time? = nil
        )
        end
      end

      struct GetVariantStoreRequest
        include JSON::Serializable

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetVariantStoreResponse
        include JSON::Serializable

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The store's genome reference.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The store's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # The store's ARN.
        @[JSON::Field(key: "storeArn")]
        getter store_arn : String

        # The store's size in bytes.
        @[JSON::Field(key: "storeSizeBytes")]
        getter store_size_bytes : Int64

        # The store's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        # When the store was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @reference : Types::ReferenceItem,
          @sse_config : Types::SseConfig,
          @status : String,
          @status_message : String,
          @store_arn : String,
          @store_size_bytes : Int64,
          @tags : Hash(String, String),
          @update_time : Time
        )
        end
      end

      struct GetWorkflowRequest
        include JSON::Serializable

        # The workflow's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The export format for the workflow.
        @[JSON::Field(key: "export")]
        getter export : Array(String)?

        # The workflow's type.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The ID of the workflow owner.
        @[JSON::Field(key: "workflowOwnerId")]
        getter workflow_owner_id : String?

        def initialize(
          @id : String,
          @export : Array(String)? = nil,
          @type : String? = nil,
          @workflow_owner_id : String? = nil
        )
        end
      end

      struct GetWorkflowResponse
        include JSON::Serializable

        # The computational accelerator specified to run the workflow.
        @[JSON::Field(key: "accelerators")]
        getter accelerators : String?

        # The workflow's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The registry map that this workflow is using.
        @[JSON::Field(key: "containerRegistryMap")]
        getter container_registry_map : Types::ContainerRegistryMap?

        # When the workflow was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The workflow's definition.
        @[JSON::Field(key: "definition")]
        getter definition : String?

        # Details about the source code repository that hosts the workflow definition files.
        @[JSON::Field(key: "definitionRepositoryDetails")]
        getter definition_repository_details : Types::DefinitionRepositoryDetails?

        # The workflow's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The workflow's digest.
        @[JSON::Field(key: "digest")]
        getter digest : String?

        # The workflow's engine.
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The workflow's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The path of the main definition file for the workflow.
        @[JSON::Field(key: "main")]
        getter main : String?

        # Gets metadata for the workflow.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The workflow's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The workflow's parameter template.
        @[JSON::Field(key: "parameterTemplate")]
        getter parameter_template : Hash(String, Types::WorkflowParameter)?

        # The README content for the workflow, providing documentation and usage information.
        @[JSON::Field(key: "readme")]
        getter readme : String?

        # The path to the workflow README markdown file within the repository. This file provides
        # documentation and usage information for the workflow. If not specified, the README.md file from the
        # root directory of the repository will be used.
        @[JSON::Field(key: "readmePath")]
        getter readme_path : String?

        # The workflow's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The workflow's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The default static storage capacity (in gibibytes) for runs that use this workflow or workflow
        # version.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The default storage type for runs using this workflow.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # The workflow's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The workflow's type.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The universally unique identifier (UUID) value for this workflow.
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        def initialize(
          @accelerators : String? = nil,
          @arn : String? = nil,
          @container_registry_map : Types::ContainerRegistryMap? = nil,
          @creation_time : Time? = nil,
          @definition : String? = nil,
          @definition_repository_details : Types::DefinitionRepositoryDetails? = nil,
          @description : String? = nil,
          @digest : String? = nil,
          @engine : String? = nil,
          @id : String? = nil,
          @main : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @name : String? = nil,
          @parameter_template : Hash(String, Types::WorkflowParameter)? = nil,
          @readme : String? = nil,
          @readme_path : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @uuid : String? = nil
        )
        end
      end

      struct GetWorkflowVersionRequest
        include JSON::Serializable

        # The workflow version name.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The workflow's ID. The workflowId is not the UUID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The export format for the workflow.
        @[JSON::Field(key: "export")]
        getter export : Array(String)?

        # The workflow's type.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The 12-digit account ID of the workflow owner. The workflow owner ID can be retrieved using the
        # GetShare API operation. If you are the workflow owner, you do not need to include this ID.
        @[JSON::Field(key: "workflowOwnerId")]
        getter workflow_owner_id : String?

        def initialize(
          @version_name : String,
          @workflow_id : String,
          @export : Array(String)? = nil,
          @type : String? = nil,
          @workflow_owner_id : String? = nil
        )
        end
      end

      struct GetWorkflowVersionResponse
        include JSON::Serializable

        # The accelerator for this workflow version.
        @[JSON::Field(key: "accelerators")]
        getter accelerators : String?

        # ARN of the workflow version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The registry map that this workflow version uses.
        @[JSON::Field(key: "containerRegistryMap")]
        getter container_registry_map : Types::ContainerRegistryMap?

        # When the workflow version was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Definition of the workflow version.
        @[JSON::Field(key: "definition")]
        getter definition : String?

        # Details about the source code repository that hosts the workflow version definition files.
        @[JSON::Field(key: "definitionRepositoryDetails")]
        getter definition_repository_details : Types::DefinitionRepositoryDetails?

        # Description of the workflow version.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The workflow version's digest.
        @[JSON::Field(key: "digest")]
        getter digest : String?

        # The workflow engine for this workflow version.
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The path of the main definition file for the workflow.
        @[JSON::Field(key: "main")]
        getter main : String?

        # The metadata for the workflow version.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The parameter template for the workflow version.
        @[JSON::Field(key: "parameterTemplate")]
        getter parameter_template : Hash(String, Types::WorkflowParameter)?

        # The README content for the workflow version, providing documentation and usage information specific
        # to this version.
        @[JSON::Field(key: "readme")]
        getter readme : String?

        # The path to the workflow version README markdown file within the repository. This file provides
        # documentation and usage information for the workflow. If not specified, the README.md file from the
        # root directory of the repository will be used.
        @[JSON::Field(key: "readmePath")]
        getter readme_path : String?

        # The workflow version status
        @[JSON::Field(key: "status")]
        getter status : String?

        # The workflow version status message
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The default run storage capacity for static storage.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The default storage type for the run.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # The workflow version tags
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The workflow version type
        @[JSON::Field(key: "type")]
        getter type : String?

        # The universally unique identifier (UUID) value for this workflow version
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        # The workflow version name.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        # Amazon Web Services Id of the owner of the bucket.
        @[JSON::Field(key: "workflowBucketOwnerId")]
        getter workflow_bucket_owner_id : String?

        # The workflow's ID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @accelerators : String? = nil,
          @arn : String? = nil,
          @container_registry_map : Types::ContainerRegistryMap? = nil,
          @creation_time : Time? = nil,
          @definition : String? = nil,
          @definition_repository_details : Types::DefinitionRepositoryDetails? = nil,
          @description : String? = nil,
          @digest : String? = nil,
          @engine : String? = nil,
          @main : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @parameter_template : Hash(String, Types::WorkflowParameter)? = nil,
          @readme : String? = nil,
          @readme_path : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @uuid : String? = nil,
          @version_name : String? = nil,
          @workflow_bucket_owner_id : String? = nil,
          @workflow_id : String? = nil
        )
        end
      end

      # Information about the container image used for a task.
      struct ImageDetails
        include JSON::Serializable

        # The URI of the container image.
        @[JSON::Field(key: "image")]
        getter image : String?

        # The container image digest. If the image URI was transformed, this will be the digest of the
        # container image referenced by the transformed URI.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # URI of the source registry. If the URI is from a third-party registry, Amazon Web Services
        # HealthOmics transforms the URI to the corresponding ECR path, using the pull-through cache mapping
        # rules.
        @[JSON::Field(key: "sourceImage")]
        getter source_image : String?

        def initialize(
          @image : String? = nil,
          @image_digest : String? = nil,
          @source_image : String? = nil
        )
        end
      end

      # Specifies image mappings that workflow tasks can use. For example, you can replace all the task
      # references of a public image to use an equivalent image in your private ECR repository. You can use
      # image mappings with upstream registries that don't support pull through cache. You need to manually
      # synchronize the upstream registry with your private repository.
      struct ImageMapping
        include JSON::Serializable

        # Specifies the URI of the corresponding image in the private ECR registry.
        @[JSON::Field(key: "destinationImage")]
        getter destination_image : String?

        # Specifies the URI of the source image in the upstream registry.
        @[JSON::Field(key: "sourceImage")]
        getter source_image : String?

        def initialize(
          @destination_image : String? = nil,
          @source_image : String? = nil
        )
        end
      end

      # A filter for import read set jobs.
      struct ImportReadSetFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # An import read set job.
      struct ImportReadSetJobItem
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        def initialize(
          @creation_time : Time,
          @id : String,
          @role_arn : String,
          @sequence_store_id : String,
          @status : String,
          @completion_time : Time? = nil
        )
        end
      end

      # A source for an import read set job.
      struct ImportReadSetSourceItem
        include JSON::Serializable

        # The source's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String

        # The source's file type.
        @[JSON::Field(key: "sourceFileType")]
        getter source_file_type : String

        # The source files' location in Amazon S3.
        @[JSON::Field(key: "sourceFiles")]
        getter source_files : Types::SourceFiles

        # The source's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The source's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String

        # The source's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Where the source originated.
        @[JSON::Field(key: "generatedFrom")]
        getter generated_from : String?

        # The source's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The source's read set ID.
        @[JSON::Field(key: "readSetId")]
        getter read_set_id : String?

        # The source's genome reference ARN.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String?

        # The source's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The source's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @sample_id : String,
          @source_file_type : String,
          @source_files : Types::SourceFiles,
          @status : String,
          @subject_id : String,
          @description : String? = nil,
          @generated_from : String? = nil,
          @name : String? = nil,
          @read_set_id : String? = nil,
          @reference_arn : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A filter for import references.
      struct ImportReferenceFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # An import reference job.
      struct ImportReferenceJobItem
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        def initialize(
          @creation_time : Time,
          @id : String,
          @reference_store_id : String,
          @role_arn : String,
          @status : String,
          @completion_time : Time? = nil
        )
        end
      end

      # An genome reference source.
      struct ImportReferenceSourceItem
        include JSON::Serializable

        # The source's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The source's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The source's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The source's reference ID.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String?

        # The source file's location in Amazon S3.
        @[JSON::Field(key: "sourceFile")]
        getter source_file : String?

        # The source's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The source's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @status : String,
          @description : String? = nil,
          @name : String? = nil,
          @reference_id : String? = nil,
          @source_file : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An unexpected error occurred. Try the request again.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A filter for annotation import jobs.
      struct ListAnnotationImportJobsFilter
        include JSON::Serializable

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A store name to filter on.
        @[JSON::Field(key: "storeName")]
        getter store_name : String?

        def initialize(
          @status : String? = nil,
          @store_name : String? = nil
        )
        end
      end

      struct ListAnnotationImportJobsRequest
        include JSON::Serializable

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ListAnnotationImportJobsFilter?

        # IDs of annotation import jobs to retrieve.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # The maximum number of jobs to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ListAnnotationImportJobsFilter? = nil,
          @ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAnnotationImportJobsResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "annotationImportJobs")]
        getter annotation_import_jobs : Array(Types::AnnotationImportJobItem)?

        # Specifies the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @annotation_import_jobs : Array(Types::AnnotationImportJobItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Use filters to focus the returned annotation store versions on a specific parameter, such as the
      # status of the annotation store.
      struct ListAnnotationStoreVersionsFilter
        include JSON::Serializable

        # The status of an annotation store version.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct ListAnnotationStoreVersionsRequest
        include JSON::Serializable

        # The name of an annotation store.
        @[JSON::Field(key: "name")]
        getter name : String

        # A filter to apply to the list of annotation store versions.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ListAnnotationStoreVersionsFilter?

        # The maximum number of annotation store versions to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @filter : Types::ListAnnotationStoreVersionsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAnnotationStoreVersionsResponse
        include JSON::Serializable

        # Lists all versions of an annotation store.
        @[JSON::Field(key: "annotationStoreVersions")]
        getter annotation_store_versions : Array(Types::AnnotationStoreVersionItem)?

        # Specifies the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @annotation_store_versions : Array(Types::AnnotationStoreVersionItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A filter for annotation stores.
      struct ListAnnotationStoresFilter
        include JSON::Serializable

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct ListAnnotationStoresRequest
        include JSON::Serializable

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ListAnnotationStoresFilter?

        # IDs of stores to list.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # The maximum number of stores to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ListAnnotationStoresFilter? = nil,
          @ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAnnotationStoresResponse
        include JSON::Serializable

        # A list of stores.
        @[JSON::Field(key: "annotationStores")]
        getter annotation_stores : Array(Types::AnnotationStoreItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @annotation_stores : Array(Types::AnnotationStoreItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMultipartReadSetUploadsRequest
        include JSON::Serializable

        # The Sequence Store ID used for the multipart uploads.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The maximum number of multipart uploads returned in a page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token returned in the response of a previous ListMultipartReadSetUploads call. Used to get the
        # next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sequence_store_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMultipartReadSetUploadsResponse
        include JSON::Serializable

        # Next token returned in the response of a previous ListMultipartReadSetUploads call. Used to get the
        # next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of multipart uploads.
        @[JSON::Field(key: "uploads")]
        getter uploads : Array(Types::MultipartReadSetUploadListItem)?

        def initialize(
          @next_token : String? = nil,
          @uploads : Array(Types::MultipartReadSetUploadListItem)? = nil
        )
        end
      end

      struct ListReadSetActivationJobsRequest
        include JSON::Serializable

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ActivateReadSetFilter?

        # The maximum number of read set activation jobs to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sequence_store_id : String,
          @filter : Types::ActivateReadSetFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetActivationJobsResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "activationJobs")]
        getter activation_jobs : Array(Types::ActivateReadSetJobItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @activation_jobs : Array(Types::ActivateReadSetJobItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetExportJobsRequest
        include JSON::Serializable

        # The jobs' sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ExportReadSetFilter?

        # The maximum number of jobs to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sequence_store_id : String,
          @filter : Types::ExportReadSetFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetExportJobsResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "exportJobs")]
        getter export_jobs : Array(Types::ExportReadSetJobDetail)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @export_jobs : Array(Types::ExportReadSetJobDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetImportJobsRequest
        include JSON::Serializable

        # The jobs' sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ImportReadSetFilter?

        # The maximum number of jobs to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sequence_store_id : String,
          @filter : Types::ImportReadSetFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetImportJobsResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "importJobs")]
        getter import_jobs : Array(Types::ImportReadSetJobItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @import_jobs : Array(Types::ImportReadSetJobItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetUploadPartsRequest
        include JSON::Serializable

        # The source file for the upload part.
        @[JSON::Field(key: "partSource")]
        getter part_source : String

        # The Sequence Store ID used for the multipart uploads.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The ID for the initiated multipart upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # Attributes used to filter for a specific subset of read set part uploads.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ReadSetUploadPartListFilter?

        # The maximum number of read set upload parts returned in a page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token returned in the response of a previous ListReadSetUploadPartsRequest call. Used to get
        # the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @part_source : String,
          @sequence_store_id : String,
          @upload_id : String,
          @filter : Types::ReadSetUploadPartListFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetUploadPartsResponse
        include JSON::Serializable

        # Next token returned in the response of a previous ListReadSetUploadParts call. Used to get the next
        # page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of upload parts.
        @[JSON::Field(key: "parts")]
        getter parts : Array(Types::ReadSetUploadPartListItem)?

        def initialize(
          @next_token : String? = nil,
          @parts : Array(Types::ReadSetUploadPartListItem)? = nil
        )
        end
      end

      struct ListReadSetsRequest
        include JSON::Serializable

        # The jobs' sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ReadSetFilter?

        # The maximum number of read sets to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sequence_store_id : String,
          @filter : Types::ReadSetFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReadSetsResponse
        include JSON::Serializable

        # A list of read sets.
        @[JSON::Field(key: "readSets")]
        getter read_sets : Array(Types::ReadSetListItem)

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @read_sets : Array(Types::ReadSetListItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListReferenceImportJobsRequest
        include JSON::Serializable

        # The job's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ImportReferenceFilter?

        # The maximum number of jobs to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @reference_store_id : String,
          @filter : Types::ImportReferenceFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReferenceImportJobsResponse
        include JSON::Serializable

        # A lis of jobs.
        @[JSON::Field(key: "importJobs")]
        getter import_jobs : Array(Types::ImportReferenceJobItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @import_jobs : Array(Types::ImportReferenceJobItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReferenceStoresRequest
        include JSON::Serializable

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ReferenceStoreFilter?

        # The maximum number of stores to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ReferenceStoreFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReferenceStoresResponse
        include JSON::Serializable

        # A list of reference stores.
        @[JSON::Field(key: "referenceStores")]
        getter reference_stores : Array(Types::ReferenceStoreDetail)

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @reference_stores : Array(Types::ReferenceStoreDetail),
          @next_token : String? = nil
        )
        end
      end

      struct ListReferencesRequest
        include JSON::Serializable

        # The references' reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ReferenceFilter?

        # The maximum number of references to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @reference_store_id : String,
          @filter : Types::ReferenceFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReferencesResponse
        include JSON::Serializable

        # A list of references.
        @[JSON::Field(key: "references")]
        getter references : Array(Types::ReferenceListItem)

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @references : Array(Types::ReferenceListItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListRunCachesRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Optional pagination token returned from a prior call to the ListRunCaches API operation.
        @[JSON::Field(key: "startingToken")]
        getter starting_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @starting_token : String? = nil
        )
        end
      end

      struct ListRunCachesResponse
        include JSON::Serializable

        # Details about each run cache in the response.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RunCacheListItem)?

        # Pagination token to retrieve additional run caches. If the response does not have a nextToken value,
        # you have reached to the end of the list.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RunCacheListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRunGroupsRequest
        include JSON::Serializable

        # The maximum number of run groups to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The run groups' name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "startingToken")]
        getter starting_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @starting_token : String? = nil
        )
        end
      end

      struct ListRunGroupsResponse
        include JSON::Serializable

        # A list of groups.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RunGroupListItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RunGroupListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRunTasksRequest
        include JSON::Serializable

        # The run's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The maximum number of run tasks to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "startingToken")]
        getter starting_token : String?

        # Filter the list by status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @starting_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListRunTasksResponse
        include JSON::Serializable

        # A list of tasks.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::TaskListItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::TaskListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRunsRequest
        include JSON::Serializable

        # The maximum number of runs to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Filter the list by run name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Filter the list by run group ID.
        @[JSON::Field(key: "runGroupId")]
        getter run_group_id : String?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "startingToken")]
        getter starting_token : String?

        # The status of a run.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @run_group_id : String? = nil,
          @starting_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListRunsResponse
        include JSON::Serializable

        # A list of runs.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RunListItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RunListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSequenceStoresRequest
        include JSON::Serializable

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::SequenceStoreFilter?

        # The maximum number of stores to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::SequenceStoreFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSequenceStoresResponse
        include JSON::Serializable

        # A list of sequence stores.
        @[JSON::Field(key: "sequenceStores")]
        getter sequence_stores : Array(Types::SequenceStoreDetail)

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sequence_stores : Array(Types::SequenceStoreDetail),
          @next_token : String? = nil
        )
        end
      end

      struct ListSharesRequest
        include JSON::Serializable

        # The account that owns the resource shares.
        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # Attributes that you use to filter for a specific subset of resource shares.
        @[JSON::Field(key: "filter")]
        getter filter : Types::Filter?

        # The maximum number of shares to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token returned in the response of a previous ListReadSetUploadPartsRequest call. Used to get
        # the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_owner : String,
          @filter : Types::Filter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSharesResponse
        include JSON::Serializable

        # The shares available and their metadata details.
        @[JSON::Field(key: "shares")]
        getter shares : Array(Types::ShareDetails)

        # Next token returned in the response of a previous ListSharesResponse call. Used to get the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @shares : Array(Types::ShareDetails),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource's ARN.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # A filter for variant import jobs.
      struct ListVariantImportJobsFilter
        include JSON::Serializable

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A store name to filter on.
        @[JSON::Field(key: "storeName")]
        getter store_name : String?

        def initialize(
          @status : String? = nil,
          @store_name : String? = nil
        )
        end
      end

      struct ListVariantImportJobsRequest
        include JSON::Serializable

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ListVariantImportJobsFilter?

        # A list of job IDs.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # The maximum number of import jobs to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ListVariantImportJobsFilter? = nil,
          @ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListVariantImportJobsResponse
        include JSON::Serializable

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of jobs.
        @[JSON::Field(key: "variantImportJobs")]
        getter variant_import_jobs : Array(Types::VariantImportJobItem)?

        def initialize(
          @next_token : String? = nil,
          @variant_import_jobs : Array(Types::VariantImportJobItem)? = nil
        )
        end
      end

      # A filter for variant stores.
      struct ListVariantStoresFilter
        include JSON::Serializable

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct ListVariantStoresRequest
        include JSON::Serializable

        # A filter to apply to the list.
        @[JSON::Field(key: "filter")]
        getter filter : Types::ListVariantStoresFilter?

        # A list of store IDs.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # The maximum number of stores to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ListVariantStoresFilter? = nil,
          @ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListVariantStoresResponse
        include JSON::Serializable

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of variant stores.
        @[JSON::Field(key: "variantStores")]
        getter variant_stores : Array(Types::VariantStoreItem)?

        def initialize(
          @next_token : String? = nil,
          @variant_stores : Array(Types::VariantStoreItem)? = nil
        )
        end
      end

      struct ListWorkflowVersionsRequest
        include JSON::Serializable

        # The workflow's ID. The workflowId is not the UUID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The maximum number of workflows to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "startingToken")]
        getter starting_token : String?

        # The workflow type.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The 12-digit account ID of the workflow owner. The workflow owner ID can be retrieved using the
        # GetShare API operation. If you are the workflow owner, you do not need to include this ID.
        @[JSON::Field(key: "workflowOwnerId")]
        getter workflow_owner_id : String?

        def initialize(
          @workflow_id : String,
          @max_results : Int32? = nil,
          @starting_token : String? = nil,
          @type : String? = nil,
          @workflow_owner_id : String? = nil
        )
        end
      end

      struct ListWorkflowVersionsResponse
        include JSON::Serializable

        # A list of workflow version items.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::WorkflowVersionListItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::WorkflowVersionListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowsRequest
        include JSON::Serializable

        # The maximum number of workflows to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Filter the list by workflow name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "startingToken")]
        getter starting_token : String?

        # Filter the list by workflow type.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @starting_token : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListWorkflowsResponse
        include JSON::Serializable

        # A list of workflow items.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::WorkflowListItem)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::WorkflowListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Part of the response to ListMultipartReadSetUploads, excluding completed and aborted multipart
      # uploads.
      struct MultipartReadSetUploadListItem
        include JSON::Serializable

        # The time stamp for when a direct upload was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The source of an uploaded part.
        @[JSON::Field(key: "generatedFrom")]
        getter generated_from : String

        # The source's reference ARN.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String

        # The read set source's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String

        # The sequence store ID used for the multipart upload.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The type of file the read set originated from.
        @[JSON::Field(key: "sourceFileType")]
        getter source_file_type : String

        # The read set source's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String

        # The ID for the initiated multipart upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The description of a read set.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of a read set.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Any tags you wish to add to a read set.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_time : Time,
          @generated_from : String,
          @reference_arn : String,
          @sample_id : String,
          @sequence_store_id : String,
          @source_file_type : String,
          @subject_id : String,
          @upload_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The operation is not supported by Amazon Omics, or the API does not exist.
      struct NotSupportedOperationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct PutS3AccessPolicyRequest
        include JSON::Serializable

        # The S3 access point ARN where you want to put the access policy.
        @[JSON::Field(key: "s3AccessPointArn")]
        getter s3_access_point_arn : String

        # The resource policy that controls S3 access to the store.
        @[JSON::Field(key: "s3AccessPolicy")]
        getter s3_access_policy : String

        def initialize(
          @s3_access_point_arn : String,
          @s3_access_policy : String
        )
        end
      end

      struct PutS3AccessPolicyResponse
        include JSON::Serializable

        # The S3 access point ARN that now has the access policy.
        @[JSON::Field(key: "s3AccessPointArn")]
        getter s3_access_point_arn : String?

        # The Amazon Web Services-generated Sequence Store or Reference Store ID.
        @[JSON::Field(key: "storeId")]
        getter store_id : String?

        # The type of store associated with the access point.
        @[JSON::Field(key: "storeType")]
        getter store_type : String?

        def initialize(
          @s3_access_point_arn : String? = nil,
          @store_id : String? = nil,
          @store_type : String? = nil
        )
        end
      end

      # The ranges specified in the request are not valid.
      struct RangeNotSatisfiableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Read options for an annotation import job.
      struct ReadOptions
        include JSON::Serializable

        # The file's comment character.
        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The file's encoding.
        @[JSON::Field(key: "encoding")]
        getter encoding : String?

        # A character for escaping quotes in the file.
        @[JSON::Field(key: "escape")]
        getter escape : String?

        # Whether quotes need to be escaped in the file.
        @[JSON::Field(key: "escapeQuotes")]
        getter escape_quotes : Bool?

        # Whether the file has a header row.
        @[JSON::Field(key: "header")]
        getter header : Bool?

        # A line separator for the file.
        @[JSON::Field(key: "lineSep")]
        getter line_sep : String?

        # The file's quote character.
        @[JSON::Field(key: "quote")]
        getter quote : String?

        # Whether all values need to be quoted, or just those that contain quotes.
        @[JSON::Field(key: "quoteAll")]
        getter quote_all : Bool?

        # The file's field separator.
        @[JSON::Field(key: "sep")]
        getter sep : String?

        def initialize(
          @comment : String? = nil,
          @encoding : String? = nil,
          @escape : String? = nil,
          @escape_quotes : Bool? = nil,
          @header : Bool? = nil,
          @line_sep : String? = nil,
          @quote : String? = nil,
          @quote_all : Bool? = nil,
          @sep : String? = nil
        )
        end
      end

      # An error from a batch read set operation.
      struct ReadSetBatchError
        include JSON::Serializable

        # The error's code.
        @[JSON::Field(key: "code")]
        getter code : String

        # The error's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The error's message.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @id : String,
          @message : String
        )
        end
      end

      # Files in a read set.
      struct ReadSetFiles
        include JSON::Serializable

        # The files' index.
        @[JSON::Field(key: "index")]
        getter index : Types::FileInformation?

        # The location of the first file in Amazon S3.
        @[JSON::Field(key: "source1")]
        getter source1 : Types::FileInformation?

        # The location of the second file in Amazon S3.
        @[JSON::Field(key: "source2")]
        getter source2 : Types::FileInformation?

        def initialize(
          @index : Types::FileInformation? = nil,
          @source1 : Types::FileInformation? = nil,
          @source2 : Types::FileInformation? = nil
        )
        end
      end

      # A filter for read sets.
      struct ReadSetFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The creation type of the read set.
        @[JSON::Field(key: "creationType")]
        getter creation_type : String?

        # Where the source originated.
        @[JSON::Field(key: "generatedFrom")]
        getter generated_from : String?

        # A name to filter on.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A genome reference ARN to filter on.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String?

        # The read set source's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String?

        # A status to filter on.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The read set source's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @creation_type : String? = nil,
          @generated_from : String? = nil,
          @name : String? = nil,
          @reference_arn : String? = nil,
          @sample_id : String? = nil,
          @status : String? = nil,
          @subject_id : String? = nil
        )
        end
      end

      # A read set.
      struct ReadSetListItem
        include JSON::Serializable

        # The read set's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the read set was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The read set's file type.
        @[JSON::Field(key: "fileType")]
        getter file_type : String

        # The read set's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The read set's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The creation type of the read set.
        @[JSON::Field(key: "creationType")]
        getter creation_type : String?

        # The read set's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The entity tag (ETag) is a hash of the object representing its semantic content.
        @[JSON::Field(key: "etag")]
        getter etag : Types::ETag?

        # The read set's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The read set's genome reference ARN.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String?

        # The read set's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String?

        @[JSON::Field(key: "sequenceInformation")]
        getter sequence_information : Types::SequenceInformation?

        # The status for a read set. It provides more detail as to why the read set has a status.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The read set's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @file_type : String,
          @id : String,
          @sequence_store_id : String,
          @status : String,
          @creation_type : String? = nil,
          @description : String? = nil,
          @etag : Types::ETag? = nil,
          @name : String? = nil,
          @reference_arn : String? = nil,
          @sample_id : String? = nil,
          @sequence_information : Types::SequenceInformation? = nil,
          @status_message : String? = nil,
          @subject_id : String? = nil
        )
        end
      end

      # The S3 URI for each read set file.
      struct ReadSetS3Access
        include JSON::Serializable

        # The S3 URI for each read set file.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @s3_uri : String? = nil
        )
        end
      end

      # Filter settings that select for read set upload parts of interest.
      struct ReadSetUploadPartListFilter
        include JSON::Serializable

        # Filters for read set uploads after a specified time.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # Filters for read set part uploads before a specified time.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil
        )
        end
      end

      # The metadata of a single part of a file that was added to a multipart upload. A list of these parts
      # is returned in the response to the ListReadSetUploadParts API.
      struct ReadSetUploadPartListItem
        include JSON::Serializable

        # A unique identifier used to confirm that parts are being added to the correct upload.
        @[JSON::Field(key: "checksum")]
        getter checksum : String

        # The number identifying the part in an upload.
        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32

        # The size of the the part in an upload.
        @[JSON::Field(key: "partSize")]
        getter part_size : Int64

        # The origin of the part being direct uploaded.
        @[JSON::Field(key: "partSource")]
        getter part_source : String

        # The time stamp for when a direct upload was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time stamp for the most recent update to an uploaded part.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        def initialize(
          @checksum : String,
          @part_number : Int32,
          @part_size : Int64,
          @part_source : String,
          @creation_time : Time? = nil,
          @last_updated_time : Time? = nil
        )
        end
      end

      # A set of genome reference files.
      struct ReferenceFiles
        include JSON::Serializable

        # The files' index.
        @[JSON::Field(key: "index")]
        getter index : Types::FileInformation?

        # The source file's location in Amazon S3.
        @[JSON::Field(key: "source")]
        getter source : Types::FileInformation?

        def initialize(
          @index : Types::FileInformation? = nil,
          @source : Types::FileInformation? = nil
        )
        end
      end

      # A filter for references.
      struct ReferenceFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # An MD5 checksum to filter on.
        @[JSON::Field(key: "md5")]
        getter md5 : String?

        # A name to filter on.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @md5 : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A genome reference.
      struct ReferenceItem
        include JSON::Serializable

        # The reference's ARN.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String?

        def initialize(
          @reference_arn : String? = nil
        )
        end
      end

      # A genome reference.
      struct ReferenceListItem
        include JSON::Serializable

        # The reference's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the reference was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The reference's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reference's MD5 checksum.
        @[JSON::Field(key: "md5")]
        getter md5 : String

        # The reference's store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # When the reference was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The reference's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The reference's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The reference's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @md5 : String,
          @reference_store_id : String,
          @update_time : Time,
          @description : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a reference store.
      struct ReferenceStoreDetail
        include JSON::Serializable

        # The store's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @description : String? = nil,
          @name : String? = nil,
          @sse_config : Types::SseConfig? = nil
        )
        end
      end

      # A filter for reference stores.
      struct ReferenceStoreFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The name to filter on.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # If you are using the ECR pull through cache feature, the registry mapping maps between the ECR
      # repository and the upstream registry where container images are pulled and synchronized.
      struct RegistryMapping
        include JSON::Serializable

        # Account ID of the account that owns the upstream container image.
        @[JSON::Field(key: "ecrAccountId")]
        getter ecr_account_id : String?

        # The repository prefix to use in the ECR private repository.
        @[JSON::Field(key: "ecrRepositoryPrefix")]
        getter ecr_repository_prefix : String?

        # The URI of the upstream registry.
        @[JSON::Field(key: "upstreamRegistryUrl")]
        getter upstream_registry_url : String?

        # The repository prefix of the corresponding repository in the upstream registry.
        @[JSON::Field(key: "upstreamRepositoryPrefix")]
        getter upstream_repository_prefix : String?

        def initialize(
          @ecr_account_id : String? = nil,
          @ecr_repository_prefix : String? = nil,
          @upstream_registry_url : String? = nil,
          @upstream_repository_prefix : String? = nil
        )
        end
      end

      # The request timed out.
      struct RequestTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The target resource was not found in the current Region.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # List entry for one run cache.
      struct RunCacheListItem
        include JSON::Serializable

        # Unique resource identifier for the run cache.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Default cache behavior for the run cache.
        @[JSON::Field(key: "cacheBehavior")]
        getter cache_behavior : String?

        # The S3 uri for the run cache data.
        @[JSON::Field(key: "cacheS3Uri")]
        getter cache_s3_uri : String?

        # The time that this run cache was created (an ISO 8601 formatted string).
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The identifier for this run cache.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the run cache.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The run cache status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @cache_behavior : String? = nil,
          @cache_s3_uri : String? = nil,
          @creation_time : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A run group.
      struct RunGroupListItem
        include JSON::Serializable

        # The group's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When the group was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The group's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The group's maximum CPU count setting.
        @[JSON::Field(key: "maxCpus")]
        getter max_cpus : Int32?

        # The group's maximum duration setting in minutes.
        @[JSON::Field(key: "maxDuration")]
        getter max_duration : Int32?

        # The maximum GPUs that can be used by a run group.
        @[JSON::Field(key: "maxGpus")]
        getter max_gpus : Int32?

        # The group's maximum concurrent run setting.
        @[JSON::Field(key: "maxRuns")]
        getter max_runs : Int32?

        # The group's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @id : String? = nil,
          @max_cpus : Int32? = nil,
          @max_duration : Int32? = nil,
          @max_gpus : Int32? = nil,
          @max_runs : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # A workflow run.
      struct RunListItem
        include JSON::Serializable

        # The run's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When the run was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The run's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The run's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The run's priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # When the run started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The run's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # When the run stopped.
        @[JSON::Field(key: "stopTime")]
        getter stop_time : Time?

        # The run's storage capacity in gibibytes. For dynamic storage, after the run has completed, this
        # value is the maximum amount of storage used during the run.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The run's storage type.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # The run's workflow ID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        # The name of the workflow version.
        @[JSON::Field(key: "workflowVersionName")]
        getter workflow_version_name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @stop_time : Time? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @workflow_id : String? = nil,
          @workflow_version_name : String? = nil
        )
        end
      end

      # The URI for the run log.
      struct RunLogLocation
        include JSON::Serializable

        # The log stream ARN for the engine log.
        @[JSON::Field(key: "engineLogStream")]
        getter engine_log_stream : String?

        # The log stream ARN for the run log.
        @[JSON::Field(key: "runLogStream")]
        getter run_log_stream : String?

        def initialize(
          @engine_log_stream : String? = nil,
          @run_log_stream : String? = nil
        )
        end
      end

      struct RunParameters
        include JSON::Serializable

        def initialize
        end
      end

      # S3 access configuration parameters.
      struct S3AccessConfig
        include JSON::Serializable

        # Location of the access logs.
        @[JSON::Field(key: "accessLogLocation")]
        getter access_log_location : String?

        def initialize(
          @access_log_location : String? = nil
        )
        end
      end

      # Details about a sequence.
      struct SequenceInformation
        include JSON::Serializable

        # The sequence's alignment setting.
        @[JSON::Field(key: "alignment")]
        getter alignment : String?

        # Where the sequence originated.
        @[JSON::Field(key: "generatedFrom")]
        getter generated_from : String?

        # The sequence's total base count.
        @[JSON::Field(key: "totalBaseCount")]
        getter total_base_count : Int64?

        # The sequence's total read count.
        @[JSON::Field(key: "totalReadCount")]
        getter total_read_count : Int64?

        def initialize(
          @alignment : String? = nil,
          @generated_from : String? = nil,
          @total_base_count : Int64? = nil,
          @total_read_count : Int64? = nil
        )
        end
      end

      # Details about a sequence store.
      struct SequenceStoreDetail
        include JSON::Serializable

        # The store's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The algorithm family of the ETag.
        @[JSON::Field(key: "eTagAlgorithmFamily")]
        getter e_tag_algorithm_family : String?

        # An S3 location that is used to store files that have failed a direct upload.
        @[JSON::Field(key: "fallbackLocation")]
        getter fallback_location : String?

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # Status of the sequence store.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the sequence store.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The last-updated time of the Sequence Store.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @description : String? = nil,
          @e_tag_algorithm_family : String? = nil,
          @fallback_location : String? = nil,
          @name : String? = nil,
          @sse_config : Types::SseConfig? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # A filter for a sequence store.
      struct SequenceStoreFilter
        include JSON::Serializable

        # The filter's start date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The filter's end date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # A name to filter on.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Filter results based on status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Filter results based on stores updated after the specified time.
        @[JSON::Field(key: "updatedAfter")]
        getter updated_after : Time?

        # Filter results based on stores updated before the specified time.
        @[JSON::Field(key: "updatedBefore")]
        getter updated_before : Time?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_after : Time? = nil,
          @updated_before : Time? = nil
        )
        end
      end

      # The S3 access metadata of the sequence store.
      struct SequenceStoreS3Access
        include JSON::Serializable

        # Location of the access logs.
        @[JSON::Field(key: "accessLogLocation")]
        getter access_log_location : String?

        # This is ARN of the access point associated with the S3 bucket storing read sets.
        @[JSON::Field(key: "s3AccessPointArn")]
        getter s3_access_point_arn : String?

        # The S3 URI of the sequence store.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @access_log_location : String? = nil,
          @s3_access_point_arn : String? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # The request exceeds a service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The details of a resource share.
      struct ShareDetails
        include JSON::Serializable

        # The timestamp of when the resource share was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The account ID for the data owner. The owner creates the resource share.
        @[JSON::Field(key: "ownerId")]
        getter owner_id : String?

        # The principal subscriber is the account that is sharing the resource.
        @[JSON::Field(key: "principalSubscriber")]
        getter principal_subscriber : String?

        # The Arn of the shared resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the shared resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The ID of the resource share.
        @[JSON::Field(key: "shareId")]
        getter share_id : String?

        # The name of the resource share.
        @[JSON::Field(key: "shareName")]
        getter share_name : String?

        # The status of the share.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message for a resource share. It provides additional details about the share status.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The timestamp of the resource share update.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @creation_time : Time? = nil,
          @owner_id : String? = nil,
          @principal_subscriber : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @share_id : String? = nil,
          @share_name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # Source files for a sequence.
      struct SourceFiles
        include JSON::Serializable

        # The location of the first file in Amazon S3.
        @[JSON::Field(key: "source1")]
        getter source1 : String

        # The location of the second file in Amazon S3.
        @[JSON::Field(key: "source2")]
        getter source2 : String?

        def initialize(
          @source1 : String,
          @source2 : String? = nil
        )
        end
      end

      # Contains information about the source reference in a code repository, such as a branch, tag, or
      # commit.
      struct SourceReference
        include JSON::Serializable

        # The type of source reference, such as branch, tag, or commit.
        @[JSON::Field(key: "type")]
        getter type : String

        # The value of the source reference, such as the branch name, tag name, or commit ID.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # Server-side encryption (SSE) settings for a store.
      struct SseConfig
        include JSON::Serializable

        # The encryption type.
        @[JSON::Field(key: "type")]
        getter type : String

        # An encryption key ARN.
        @[JSON::Field(key: "keyArn")]
        getter key_arn : String?

        def initialize(
          @type : String,
          @key_arn : String? = nil
        )
        end
      end

      struct StartAnnotationImportRequest
        include JSON::Serializable

        # A destination annotation store for the job.
        @[JSON::Field(key: "destinationName")]
        getter destination_name : String

        # Items to import.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AnnotationImportItemSource)

        # A service role for the job.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The annotation schema generated by the parsed annotation data.
        @[JSON::Field(key: "annotationFields")]
        getter annotation_fields : Hash(String, String)?

        # Formatting options for the annotation file.
        @[JSON::Field(key: "formatOptions")]
        getter format_options : Types::FormatOptions?

        # The job's left normalization setting.
        @[JSON::Field(key: "runLeftNormalization")]
        getter run_left_normalization : Bool?

        # The name of the annotation store version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @destination_name : String,
          @items : Array(Types::AnnotationImportItemSource),
          @role_arn : String,
          @annotation_fields : Hash(String, String)? = nil,
          @format_options : Types::FormatOptions? = nil,
          @run_left_normalization : Bool? = nil,
          @version_name : String? = nil
        )
        end
      end

      struct StartAnnotationImportResponse
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StartReadSetActivationJobRequest
        include JSON::Serializable

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's source files.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::StartReadSetActivationJobSourceItem)

        # To ensure that jobs don't run multiple times, specify a unique token for each job.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @sequence_store_id : String,
          @sources : Array(Types::StartReadSetActivationJobSourceItem),
          @client_token : String? = nil
        )
        end
      end

      struct StartReadSetActivationJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @creation_time : Time,
          @id : String,
          @sequence_store_id : String,
          @status : String
        )
        end
      end

      # A source for a read set activation job.
      struct StartReadSetActivationJobSourceItem
        include JSON::Serializable

        # The source's read set ID.
        @[JSON::Field(key: "readSetId")]
        getter read_set_id : String

        def initialize(
          @read_set_id : String
        )
        end
      end

      struct StartReadSetExportJobRequest
        include JSON::Serializable

        # A location for exported files in Amazon S3.
        @[JSON::Field(key: "destination")]
        getter destination : String

        # A service role for the job.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's source files.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::ExportReadSet)

        # To ensure that jobs don't run multiple times, specify a unique token for each job.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @destination : String,
          @role_arn : String,
          @sequence_store_id : String,
          @sources : Array(Types::ExportReadSet),
          @client_token : String? = nil
        )
        end
      end

      struct StartReadSetExportJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's output location.
        @[JSON::Field(key: "destination")]
        getter destination : String

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @creation_time : Time,
          @destination : String,
          @id : String,
          @sequence_store_id : String,
          @status : String
        )
        end
      end

      struct StartReadSetImportJobRequest
        include JSON::Serializable

        # A service role for the job.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's source files.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::StartReadSetImportJobSourceItem)

        # To ensure that jobs don't run multiple times, specify a unique token for each job.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @role_arn : String,
          @sequence_store_id : String,
          @sources : Array(Types::StartReadSetImportJobSourceItem),
          @client_token : String? = nil
        )
        end
      end

      struct StartReadSetImportJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The read set's sequence store ID.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @creation_time : Time,
          @id : String,
          @role_arn : String,
          @sequence_store_id : String,
          @status : String
        )
        end
      end

      # A source for a read set import job.
      struct StartReadSetImportJobSourceItem
        include JSON::Serializable

        # The source's sample ID.
        @[JSON::Field(key: "sampleId")]
        getter sample_id : String

        # The source's file type.
        @[JSON::Field(key: "sourceFileType")]
        getter source_file_type : String

        # The source files' location in Amazon S3.
        @[JSON::Field(key: "sourceFiles")]
        getter source_files : Types::SourceFiles

        # The source's subject ID.
        @[JSON::Field(key: "subjectId")]
        getter subject_id : String

        # The source's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Where the source originated.
        @[JSON::Field(key: "generatedFrom")]
        getter generated_from : String?

        # The source's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The source's reference ARN.
        @[JSON::Field(key: "referenceArn")]
        getter reference_arn : String?

        # The source's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @sample_id : String,
          @source_file_type : String,
          @source_files : Types::SourceFiles,
          @subject_id : String,
          @description : String? = nil,
          @generated_from : String? = nil,
          @name : String? = nil,
          @reference_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartReferenceImportJobRequest
        include JSON::Serializable

        # The job's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # A service role for the job.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's source files.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::StartReferenceImportJobSourceItem)

        # To ensure that jobs don't run multiple times, specify a unique token for each job.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @reference_store_id : String,
          @role_arn : String,
          @sources : Array(Types::StartReferenceImportJobSourceItem),
          @client_token : String? = nil
        )
        end
      end

      struct StartReferenceImportJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's reference store ID.
        @[JSON::Field(key: "referenceStoreId")]
        getter reference_store_id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @creation_time : Time,
          @id : String,
          @reference_store_id : String,
          @role_arn : String,
          @status : String
        )
        end
      end

      # A source for a reference import job.
      struct StartReferenceImportJobSourceItem
        include JSON::Serializable

        # The source's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The source file's location in Amazon S3.
        @[JSON::Field(key: "sourceFile")]
        getter source_file : String

        # The source's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The source's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @source_file : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartRunRequest
        include JSON::Serializable

        # An output S3 URI for the run. The S3 bucket must be in the same region as the workflow. The role ARN
        # must have permission to write to this S3 bucket.
        @[JSON::Field(key: "outputUri")]
        getter output_uri : String

        # An idempotency token used to dedupe retry requests so that duplicate runs are not created.
        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # A service role for the run. The roleArn requires access to Amazon Web Services HealthOmics, S3,
        # Cloudwatch logs, and EC2. An example roleArn is
        # arn:aws:iam::123456789012:role/omics-service-role-serviceRole-W8O1XMPL7QZ . In this example, the AWS
        # account ID is 123456789012 and the role name is omics-service-role-serviceRole-W8O1XMPL7QZ .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The cache behavior for the run. You specify this value if you want to override the default behavior
        # for the cache. You had set the default value when you created the cache. For more information, see
        # Run cache behavior in the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "cacheBehavior")]
        getter cache_behavior : String?

        # Identifier of the cache associated with this run. If you don't specify a cache ID, no task outputs
        # are cached for this run.
        @[JSON::Field(key: "cacheId")]
        getter cache_id : String?

        # A log level for the run.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # A name for the run. This is recommended to view and organize runs in the Amazon Web Services
        # HealthOmics console and CloudWatch logs.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Parameters for the run. The run needs all required parameters and can include optional parameters.
        # The run cannot include any parameters that are not defined in the parameter template. To retrieve
        # parameters from the run, use the GetRun API operation.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::RunParameters?

        # Use the run priority (highest: 1) to establish the order of runs in a run group when you start a
        # run. If multiple runs share the same priority, the run that was initiated first will have the higher
        # priority. Runs that do not belong to a run group can be assigned a priority. The priorities of these
        # runs are ranked among other runs that are not in a run group. For more information, see Run priority
        # in the Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The retention mode for the run. The default value is RETAIN . Amazon Web Services HealthOmics stores
        # a fixed number of runs that are available to the console and API. In the default mode ( RETAIN ),
        # you need to remove runs manually when the number of run exceeds the maximum. If you set the
        # retention mode to REMOVE , Amazon Web Services HealthOmics automatically removes runs (that have
        # mode set to REMOVE ) when the number of run exceeds the maximum. All run logs are available in
        # CloudWatch logs, if you need information about a run that is no longer available to the API. For
        # more information about retention mode, see Specifying run retention mode in the Amazon Web Services
        # HealthOmics User Guide .
        @[JSON::Field(key: "retentionMode")]
        getter retention_mode : String?

        # The run's group ID. Use a run group to cap the compute resources (and number of concurrent runs) for
        # the runs that you add to the run group.
        @[JSON::Field(key: "runGroupId")]
        getter run_group_id : String?

        # The ID of a run to duplicate.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        # The STATIC storage capacity (in gibibytes, GiB) for this run. The default run storage capacity is
        # 1200 GiB. If your requested storage capacity is unavailable, the system rounds up the value to the
        # nearest 1200 GiB multiple. If the requested storage capacity is still unavailable, the system rounds
        # up the value to the nearest 2400 GiB multiple. This field is not required if the storage type is
        # DYNAMIC (the system ignores any value that you enter).
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The storage type for the run. If you set the storage type to DYNAMIC , Amazon Web Services
        # HealthOmics dynamically scales the storage up or down, based on file system utilization. By default,
        # the run uses STATIC storage type, which allocates a fixed amount of storage. For more information
        # about DYNAMIC and STATIC storage, see Run storage types in the Amazon Web Services HealthOmics User
        # Guide .
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # Tags for the run. You can add up to 50 tags per run. For more information, see Adding a tag in the
        # Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The run's workflow ID. The workflowId is not the UUID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        # The 12-digit account ID of the workflow owner that is used for running a shared workflow. The
        # workflow owner ID can be retrieved using the GetShare API operation. If you are the workflow owner,
        # you do not need to include this ID.
        @[JSON::Field(key: "workflowOwnerId")]
        getter workflow_owner_id : String?

        # The run's workflow type. The workflowType must be specified if you are running a READY2RUN workflow.
        # If you are running a PRIVATE workflow (default), you do not need to include the workflow type.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : String?

        # The name of the workflow version. Use workflow versions to track and organize changes to the
        # workflow. If your workflow has multiple versions, the run uses the default version unless you
        # specify a version name. To learn more, see Workflow versioning in the Amazon Web Services
        # HealthOmics User Guide .
        @[JSON::Field(key: "workflowVersionName")]
        getter workflow_version_name : String?

        def initialize(
          @output_uri : String,
          @request_id : String,
          @role_arn : String,
          @cache_behavior : String? = nil,
          @cache_id : String? = nil,
          @log_level : String? = nil,
          @name : String? = nil,
          @parameters : Types::RunParameters? = nil,
          @priority : Int32? = nil,
          @retention_mode : String? = nil,
          @run_group_id : String? = nil,
          @run_id : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflow_id : String? = nil,
          @workflow_owner_id : String? = nil,
          @workflow_type : String? = nil,
          @workflow_version_name : String? = nil
        )
        end
      end

      struct StartRunResponse
        include JSON::Serializable

        # Unique resource identifier for the run.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The run's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The destination for workflow outputs.
        @[JSON::Field(key: "runOutputUri")]
        getter run_output_uri : String?

        # The run's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The run's tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The universally unique identifier for a run.
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @run_output_uri : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uuid : String? = nil
        )
        end
      end

      struct StartVariantImportRequest
        include JSON::Serializable

        # The destination variant store for the job.
        @[JSON::Field(key: "destinationName")]
        getter destination_name : String

        # Items to import.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::VariantImportItemSource)

        # A service role for the job.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The annotation schema generated by the parsed annotation data.
        @[JSON::Field(key: "annotationFields")]
        getter annotation_fields : Hash(String, String)?

        # The job's left normalization setting.
        @[JSON::Field(key: "runLeftNormalization")]
        getter run_left_normalization : Bool?

        def initialize(
          @destination_name : String,
          @items : Array(Types::VariantImportItemSource),
          @role_arn : String,
          @annotation_fields : Hash(String, String)? = nil,
          @run_left_normalization : Bool? = nil
        )
        end
      end

      struct StartVariantImportResponse
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # Settings for a store.
      struct StoreOptions
        include JSON::Serializable

        # File settings for a TSV store.
        @[JSON::Field(key: "tsvStoreOptions")]
        getter tsv_store_options : Types::TsvStoreOptions?

        def initialize(
          @tsv_store_options : Types::TsvStoreOptions? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The resource's ARN.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tags for the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A workflow run task.
      struct TaskListItem
        include JSON::Serializable

        # Set to true if Amazon Web Services HealthOmics found a matching entry in the run cache for this
        # task.
        @[JSON::Field(key: "cacheHit")]
        getter cache_hit : Bool?

        # The S3 URI of the cache location.
        @[JSON::Field(key: "cacheS3Uri")]
        getter cache_s3_uri : String?

        # The task's CPU count.
        @[JSON::Field(key: "cpus")]
        getter cpus : Int32?

        # When the task was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The number of Graphics Processing Units (GPU) specified for the task.
        @[JSON::Field(key: "gpus")]
        getter gpus : Int32?

        # The instance type for a task.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The task's memory use in gigabyes.
        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The task's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the task started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The task's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # When the task stopped.
        @[JSON::Field(key: "stopTime")]
        getter stop_time : Time?

        # The task's ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @cache_hit : Bool? = nil,
          @cache_s3_uri : String? = nil,
          @cpus : Int32? = nil,
          @creation_time : Time? = nil,
          @gpus : Int32? = nil,
          @instance_type : String? = nil,
          @memory : Int32? = nil,
          @name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @stop_time : Time? = nil,
          @task_id : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Formatting options for a TSV file.
      struct TsvOptions
        include JSON::Serializable

        # The file's read options.
        @[JSON::Field(key: "readOptions")]
        getter read_options : Types::ReadOptions?

        def initialize(
          @read_options : Types::ReadOptions? = nil
        )
        end
      end

      # File settings for a TSV store.
      struct TsvStoreOptions
        include JSON::Serializable

        # The store's annotation type.
        @[JSON::Field(key: "annotationType")]
        getter annotation_type : String?

        # The store's header key to column name mapping.
        @[JSON::Field(key: "formatToHeader")]
        getter format_to_header : Hash(String, String)?

        # The store's schema.
        @[JSON::Field(key: "schema")]
        getter schema : Array(Hash(String, String))?

        def initialize(
          @annotation_type : String? = nil,
          @format_to_header : Hash(String, String)? = nil,
          @schema : Array(Hash(String, String))? = nil
        )
        end
      end

      # The options for a TSV file.
      struct TsvVersionOptions
        include JSON::Serializable

        # The store version's annotation type.
        @[JSON::Field(key: "annotationType")]
        getter annotation_type : String?

        # The annotation store version's header key to column name mapping.
        @[JSON::Field(key: "formatToHeader")]
        getter format_to_header : Hash(String, String)?

        # The TSV schema for an annotation store version.
        @[JSON::Field(key: "schema")]
        getter schema : Array(Hash(String, String))?

        def initialize(
          @annotation_type : String? = nil,
          @format_to_header : Hash(String, String)? = nil,
          @schema : Array(Hash(String, String))? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The resource's ARN.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Keys of tags to remove.
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

      struct UpdateAnnotationStoreRequest
        include JSON::Serializable

        # A name for the store.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description for the store.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateAnnotationStoreResponse
        include JSON::Serializable

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The store's genome reference.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the store was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The annotation file format of the store.
        @[JSON::Field(key: "storeFormat")]
        getter store_format : String?

        # Parsing options for the store.
        @[JSON::Field(key: "storeOptions")]
        getter store_options : Types::StoreOptions?

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @reference : Types::ReferenceItem,
          @status : String,
          @update_time : Time,
          @store_format : String? = nil,
          @store_options : Types::StoreOptions? = nil
        )
        end
      end

      struct UpdateAnnotationStoreVersionRequest
        include JSON::Serializable

        # The name of an annotation store.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of an annotation store version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The description of an annotation store.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @version_name : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateAnnotationStoreVersionResponse
        include JSON::Serializable

        # The time stamp for when an annotation store version was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The description of an annotation store version.
        @[JSON::Field(key: "description")]
        getter description : String

        # The annotation store version ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of an annotation store.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of an annotation store version.
        @[JSON::Field(key: "status")]
        getter status : String

        # The annotation store ID.
        @[JSON::Field(key: "storeId")]
        getter store_id : String

        # The time stamp for when an annotation store version was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The name of an annotation store version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @status : String,
          @store_id : String,
          @update_time : Time,
          @version_name : String
        )
        end
      end

      struct UpdateRunCacheRequest
        include JSON::Serializable

        # The identifier of the run cache you want to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # Update the default run cache behavior.
        @[JSON::Field(key: "cacheBehavior")]
        getter cache_behavior : String?

        # Update the run cache description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Update the name of the run cache.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String,
          @cache_behavior : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateRunGroupRequest
        include JSON::Serializable

        # The group's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The maximum number of CPUs to use.
        @[JSON::Field(key: "maxCpus")]
        getter max_cpus : Int32?

        # A maximum run time for the group in minutes.
        @[JSON::Field(key: "maxDuration")]
        getter max_duration : Int32?

        # The maximum GPUs that can be used by a run group.
        @[JSON::Field(key: "maxGpus")]
        getter max_gpus : Int32?

        # The maximum number of concurrent runs for the group.
        @[JSON::Field(key: "maxRuns")]
        getter max_runs : Int32?

        # A name for the group.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String,
          @max_cpus : Int32? = nil,
          @max_duration : Int32? = nil,
          @max_gpus : Int32? = nil,
          @max_runs : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateSequenceStoreRequest
        include JSON::Serializable

        # The ID of the sequence store.
        @[JSON::Field(key: "id")]
        getter id : String

        # To ensure that requests don't run multiple times, specify a unique token for each request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the sequence store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The S3 URI of a bucket and folder to store Read Sets that fail to upload.
        @[JSON::Field(key: "fallbackLocation")]
        getter fallback_location : String?

        # A name for the sequence store.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags keys to propagate to the S3 objects associated with read sets in the sequence store.
        @[JSON::Field(key: "propagatedSetLevelTags")]
        getter propagated_set_level_tags : Array(String)?

        # S3 access configuration parameters.
        @[JSON::Field(key: "s3AccessConfig")]
        getter s3_access_config : Types::S3AccessConfig?

        def initialize(
          @id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @fallback_location : String? = nil,
          @name : String? = nil,
          @propagated_set_level_tags : Array(String)? = nil,
          @s3_access_config : Types::S3AccessConfig? = nil
        )
        end
      end

      struct UpdateSequenceStoreResponse
        include JSON::Serializable

        # The ARN of the sequence store.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ID of the sequence store.
        @[JSON::Field(key: "id")]
        getter id : String

        # Description of the sequence store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ETag algorithm family to use on ingested read sets.
        @[JSON::Field(key: "eTagAlgorithmFamily")]
        getter e_tag_algorithm_family : String?

        # The S3 URI of a bucket and folder to store Read Sets that fail to upload.
        @[JSON::Field(key: "fallbackLocation")]
        getter fallback_location : String?

        # The name of the sequence store.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags keys to propagate to the S3 objects associated with read sets in the sequence store.
        @[JSON::Field(key: "propagatedSetLevelTags")]
        getter propagated_set_level_tags : Array(String)?

        @[JSON::Field(key: "s3Access")]
        getter s3_access : Types::SequenceStoreS3Access?

        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig?

        # The status of the sequence store.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the sequence store.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The last-updated time of the Sequence Store.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @description : String? = nil,
          @e_tag_algorithm_family : String? = nil,
          @fallback_location : String? = nil,
          @name : String? = nil,
          @propagated_set_level_tags : Array(String)? = nil,
          @s3_access : Types::SequenceStoreS3Access? = nil,
          @sse_config : Types::SseConfig? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @update_time : Time? = nil
        )
        end
      end

      struct UpdateVariantStoreRequest
        include JSON::Serializable

        # A name for the store.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description for the store.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateVariantStoreResponse
        include JSON::Serializable

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The store's genome reference.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the store was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @reference : Types::ReferenceItem,
          @status : String,
          @update_time : Time
        )
        end
      end

      struct UpdateWorkflowRequest
        include JSON::Serializable

        # The workflow's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # A description for the workflow.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A name for the workflow.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The markdown content for the workflow's README file. This provides documentation and usage
        # information for users of the workflow.
        @[JSON::Field(key: "readmeMarkdown")]
        getter readme_markdown : String?

        # The default static storage capacity (in gibibytes) for runs that use this workflow or workflow
        # version.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The default storage type for runs that use this workflow. STATIC storage allocates a fixed amount of
        # storage. DYNAMIC storage dynamically scales the storage up or down, based on file system
        # utilization. For more information about static and dynamic storage, see Running workflows in the
        # Amazon Web Services HealthOmics User Guide .
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        def initialize(
          @id : String,
          @description : String? = nil,
          @name : String? = nil,
          @readme_markdown : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil
        )
        end
      end

      struct UpdateWorkflowVersionRequest
        include JSON::Serializable

        # The name of the workflow version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The workflow's ID. The workflowId is not the UUID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # Description of the workflow version.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The markdown content for the workflow version's README file. This provides documentation and usage
        # information for users of this specific workflow version.
        @[JSON::Field(key: "readmeMarkdown")]
        getter readme_markdown : String?

        # The default static storage capacity (in gibibytes) for runs that use this workflow version. The
        # storageCapacity can be overwritten at run time. The storage capacity is not required for runs with a
        # DYNAMIC storage type.
        @[JSON::Field(key: "storageCapacity")]
        getter storage_capacity : Int32?

        # The default storage type for runs that use this workflow version. The storageType can be overridden
        # at run time. DYNAMIC storage dynamically scales the storage up or down, based on file system
        # utilization. STATIC storage allocates a fixed amount of storage. For more information about dynamic
        # and static storage types, see Run storage types in the in the Amazon Web Services HealthOmics User
        # Guide .
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        def initialize(
          @version_name : String,
          @workflow_id : String,
          @description : String? = nil,
          @readme_markdown : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil
        )
        end
      end

      struct UploadReadSetPartRequest
        include JSON::Serializable

        # The number of the part being uploaded.
        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32

        # The source file for an upload part.
        @[JSON::Field(key: "partSource")]
        getter part_source : String

        # The read set data to upload for a part.
        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        # The Sequence Store ID used for the multipart upload.
        @[JSON::Field(key: "sequenceStoreId")]
        getter sequence_store_id : String

        # The ID for the initiated multipart upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        def initialize(
          @part_number : Int32,
          @part_source : String,
          @payload : Bytes,
          @sequence_store_id : String,
          @upload_id : String
        )
        end
      end

      struct UploadReadSetPartResponse
        include JSON::Serializable

        # An identifier used to confirm that parts are being added to the intended upload.
        @[JSON::Field(key: "checksum")]
        getter checksum : String

        def initialize(
          @checksum : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Details about an imported variant item.
      struct VariantImportItemDetail
        include JSON::Serializable

        # The item's job status.
        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        # The source file's location in Amazon S3.
        @[JSON::Field(key: "source")]
        getter source : String

        # A message that provides additional context about a job
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @job_status : String,
          @source : String,
          @status_message : String? = nil
        )
        end
      end

      # A imported variant item's source.
      struct VariantImportItemSource
        include JSON::Serializable

        # The source file's location in Amazon S3.
        @[JSON::Field(key: "source")]
        getter source : String

        def initialize(
          @source : String
        )
        end
      end

      # A variant import job.
      struct VariantImportJobItem
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The job's destination variant store.
        @[JSON::Field(key: "destinationName")]
        getter destination_name : String

        # The job's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The job's service role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The job's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # When the job was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The annotation schema generated by the parsed annotation data.
        @[JSON::Field(key: "annotationFields")]
        getter annotation_fields : Hash(String, String)?

        # When the job completed.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The job's left normalization setting.
        @[JSON::Field(key: "runLeftNormalization")]
        getter run_left_normalization : Bool?

        def initialize(
          @creation_time : Time,
          @destination_name : String,
          @id : String,
          @role_arn : String,
          @status : String,
          @update_time : Time,
          @annotation_fields : Hash(String, String)? = nil,
          @completion_time : Time? = nil,
          @run_left_normalization : Bool? = nil
        )
        end
      end

      # A variant store.
      struct VariantStoreItem
        include JSON::Serializable

        # When the store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The store's description.
        @[JSON::Field(key: "description")]
        getter description : String

        # The store's ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # The store's name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The store's genome reference.
        @[JSON::Field(key: "reference")]
        getter reference : Types::ReferenceItem

        # The store's server-side encryption (SSE) settings.
        @[JSON::Field(key: "sseConfig")]
        getter sse_config : Types::SseConfig

        # The store's status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The store's status message.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # The store's ARN.
        @[JSON::Field(key: "storeArn")]
        getter store_arn : String

        # The store's size in bytes.
        @[JSON::Field(key: "storeSizeBytes")]
        getter store_size_bytes : Int64

        # When the store was updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @creation_time : Time,
          @description : String,
          @id : String,
          @name : String,
          @reference : Types::ReferenceItem,
          @sse_config : Types::SseConfig,
          @status : String,
          @status_message : String,
          @store_arn : String,
          @store_size_bytes : Int64,
          @update_time : Time
        )
        end
      end

      # Formatting options for a VCF file.
      struct VcfOptions
        include JSON::Serializable

        # The file's ignore filter field setting.
        @[JSON::Field(key: "ignoreFilterField")]
        getter ignore_filter_field : Bool?

        # The file's ignore qual field setting.
        @[JSON::Field(key: "ignoreQualField")]
        getter ignore_qual_field : Bool?

        def initialize(
          @ignore_filter_field : Bool? = nil,
          @ignore_qual_field : Bool? = nil
        )
        end
      end

      # The error preventing deletion of the annotation store version.
      struct VersionDeleteError
        include JSON::Serializable

        # The message explaining the error in annotation store deletion.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name given to an annotation store version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        def initialize(
          @message : String,
          @version_name : String
        )
        end
      end

      # The options for an annotation store version.
      struct VersionOptions
        include JSON::Serializable

        # File settings for a version of a TSV store.
        @[JSON::Field(key: "tsvVersionOptions")]
        getter tsv_version_options : Types::TsvVersionOptions?

        def initialize(
          @tsv_version_options : Types::TsvVersionOptions? = nil
        )
        end
      end

      # A workflow.
      struct WorkflowListItem
        include JSON::Serializable

        # The workflow's ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When the workflow was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The workflow's digest.
        @[JSON::Field(key: "digest")]
        getter digest : String?

        # The workflow's ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Any metadata available for workflow. The information listed may vary depending on the workflow, and
        # there may also be no metadata to return.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The workflow's name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The workflow's status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The workflow's type.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @digest : String? = nil,
          @id : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A workflow parameter.
      struct WorkflowParameter
        include JSON::Serializable

        # The parameter's description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether the parameter is optional.
        @[JSON::Field(key: "optional")]
        getter optional : Bool?

        def initialize(
          @description : String? = nil,
          @optional : Bool? = nil
        )
        end
      end

      # A list of workflow version items.
      struct WorkflowVersionListItem
        include JSON::Serializable

        # ARN of the workflow version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The creation time of the workflow version.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the workflow version.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The digist of the workflow version.
        @[JSON::Field(key: "digest")]
        getter digest : String?

        # Metadata for the workflow version.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The status of the workflow version.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the workflow version.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The name of the workflow version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        # The workflow's ID.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @digest : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @version_name : String? = nil,
          @workflow_id : String? = nil
        )
        end
      end
    end
  end
end
