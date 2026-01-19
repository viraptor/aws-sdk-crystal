require "json"
require "time"

module AwsSdk
  module HealthLake
    module Types

      # Access is denied. Your account is not authorized to perform this operation.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The data store is in a transition state and the user requested action cannot be performed.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateFHIRDatastoreRequest
        include JSON::Serializable

        # The FHIR release version supported by the data store. Current support is for version R4 .
        @[JSON::Field(key: "DatastoreTypeVersion")]
        getter datastore_type_version : String

        # An optional user-provided token to ensure API idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The data store name (user-generated).
        @[JSON::Field(key: "DatastoreName")]
        getter datastore_name : String?

        # The identity provider configuration to use for the data store.
        @[JSON::Field(key: "IdentityProviderConfiguration")]
        getter identity_provider_configuration : Types::IdentityProviderConfiguration?

        # An optional parameter to preload (import) open source Synthea FHIR data upon creation of the data
        # store.
        @[JSON::Field(key: "PreloadDataConfig")]
        getter preload_data_config : Types::PreloadDataConfig?

        # The server-side encryption key configuration for a customer-provided encryption key specified for
        # creating a data store.
        @[JSON::Field(key: "SseConfiguration")]
        getter sse_configuration : Types::SseConfiguration?

        # The resource tags applied to a data store when it is created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @datastore_type_version : String,
          @client_token : String? = nil,
          @datastore_name : String? = nil,
          @identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
          @preload_data_config : Types::PreloadDataConfig? = nil,
          @sse_configuration : Types::SseConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateFHIRDatastoreResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the data store.
        @[JSON::Field(key: "DatastoreArn")]
        getter datastore_arn : String

        # The AWS endpoint created for the data store.
        @[JSON::Field(key: "DatastoreEndpoint")]
        getter datastore_endpoint : String

        # The data store identifier.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The data store status.
        @[JSON::Field(key: "DatastoreStatus")]
        getter datastore_status : String

        def initialize(
          @datastore_arn : String,
          @datastore_endpoint : String,
          @datastore_id : String,
          @datastore_status : String
        )
        end
      end

      # The filters applied to a data store query.
      struct DatastoreFilter
        include JSON::Serializable

        # Filter to set cutoff dates for records. All data stores created after the specified date are
        # included in the results.
        @[JSON::Field(key: "CreatedAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_after : Time?

        # Filter to set cutoff dates for records. All data stores created before the specified date are
        # included in the results.
        @[JSON::Field(key: "CreatedBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_before : Time?

        # Filter data store results by name.
        @[JSON::Field(key: "DatastoreName")]
        getter datastore_name : String?

        # Filter data store results by status.
        @[JSON::Field(key: "DatastoreStatus")]
        getter datastore_status : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @datastore_name : String? = nil,
          @datastore_status : String? = nil
        )
        end
      end

      # The data store properties.
      struct DatastoreProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) used in the creation of the data store.
        @[JSON::Field(key: "DatastoreArn")]
        getter datastore_arn : String

        # The AWS endpoint for the data store.
        @[JSON::Field(key: "DatastoreEndpoint")]
        getter datastore_endpoint : String

        # The data store identifier.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The data store status.
        @[JSON::Field(key: "DatastoreStatus")]
        getter datastore_status : String

        # The FHIR release version supported by the data store. Current support is for version R4 .
        @[JSON::Field(key: "DatastoreTypeVersion")]
        getter datastore_type_version : String

        # The time the data store was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The data store name.
        @[JSON::Field(key: "DatastoreName")]
        getter datastore_name : String?

        # The error cause for the current data store operation.
        @[JSON::Field(key: "ErrorCause")]
        getter error_cause : Types::ErrorCause?

        # The identity provider selected during data store creation.
        @[JSON::Field(key: "IdentityProviderConfiguration")]
        getter identity_provider_configuration : Types::IdentityProviderConfiguration?

        # The preloaded Synthea data configuration for the data store.
        @[JSON::Field(key: "PreloadDataConfig")]
        getter preload_data_config : Types::PreloadDataConfig?

        # The server-side encryption key configuration for a customer provided encryption key.
        @[JSON::Field(key: "SseConfiguration")]
        getter sse_configuration : Types::SseConfiguration?

        def initialize(
          @datastore_arn : String,
          @datastore_endpoint : String,
          @datastore_id : String,
          @datastore_status : String,
          @datastore_type_version : String,
          @created_at : Time? = nil,
          @datastore_name : String? = nil,
          @error_cause : Types::ErrorCause? = nil,
          @identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
          @preload_data_config : Types::PreloadDataConfig? = nil,
          @sse_configuration : Types::SseConfiguration? = nil
        )
        end
      end

      struct DeleteFHIRDatastoreRequest
        include JSON::Serializable

        # The AWS-generated identifier for the data store to be deleted.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        def initialize(
          @datastore_id : String
        )
        end
      end

      struct DeleteFHIRDatastoreResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that grants access permission to AWS HealthLake.
        @[JSON::Field(key: "DatastoreArn")]
        getter datastore_arn : String

        # The AWS endpoint of the data store to be deleted.
        @[JSON::Field(key: "DatastoreEndpoint")]
        getter datastore_endpoint : String

        # The AWS-generated ID for the deleted data store.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The data store status.
        @[JSON::Field(key: "DatastoreStatus")]
        getter datastore_status : String

        def initialize(
          @datastore_arn : String,
          @datastore_endpoint : String,
          @datastore_id : String,
          @datastore_status : String
        )
        end
      end

      struct DescribeFHIRDatastoreRequest
        include JSON::Serializable

        # The data store identifier.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        def initialize(
          @datastore_id : String
        )
        end
      end

      struct DescribeFHIRDatastoreResponse
        include JSON::Serializable

        # The data store properties.
        @[JSON::Field(key: "DatastoreProperties")]
        getter datastore_properties : Types::DatastoreProperties

        def initialize(
          @datastore_properties : Types::DatastoreProperties
        )
        end
      end

      struct DescribeFHIRExportJobRequest
        include JSON::Serializable

        # The data store identifier from which FHIR data is being exported from.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The export job identifier.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @datastore_id : String,
          @job_id : String
        )
        end
      end

      struct DescribeFHIRExportJobResponse
        include JSON::Serializable

        # The export job properties.
        @[JSON::Field(key: "ExportJobProperties")]
        getter export_job_properties : Types::ExportJobProperties

        def initialize(
          @export_job_properties : Types::ExportJobProperties
        )
        end
      end

      struct DescribeFHIRImportJobRequest
        include JSON::Serializable

        # The data store identifier.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The import job identifier.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @datastore_id : String,
          @job_id : String
        )
        end
      end

      struct DescribeFHIRImportJobResponse
        include JSON::Serializable

        # The import job properties.
        @[JSON::Field(key: "ImportJobProperties")]
        getter import_job_properties : Types::ImportJobProperties

        def initialize(
          @import_job_properties : Types::ImportJobProperties
        )
        end
      end

      # The error information for CreateFHIRDatastore and DeleteFHIRDatastore actions.
      struct ErrorCause
        include JSON::Serializable

        # The error category for ErrorCause .
        @[JSON::Field(key: "ErrorCategory")]
        getter error_category : String?

        # The error message text for ErrorCause .
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_category : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # The properties of a FHIR export job.
      struct ExportJobProperties
        include JSON::Serializable

        # The data store identifier from which files are being exported.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The export job identifier.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The export job status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # The output data configuration supplied when the export job was created.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # The time the export job was initiated.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time

        # The Amazon Resource Name (ARN) used during the initiation of the export job.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time the export job completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The export job name.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # An explanation of any errors that might have occurred during the export job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @datastore_id : String,
          @job_id : String,
          @job_status : String,
          @output_data_config : Types::OutputDataConfig,
          @submit_time : Time,
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @job_name : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The identity provider configuration selected when the data store was created.
      struct IdentityProviderConfiguration
        include JSON::Serializable

        # The authorization strategy selected when the HealthLake data store is created. HealthLake provides
        # support for both SMART on FHIR V1 and V2 as described below. SMART_ON_FHIR_V1 – Support for only
        # SMART on FHIR V1, which includes read (read/search) and write (create/update/delete) permissions.
        # SMART_ON_FHIR – Support for both SMART on FHIR V1 and V2, which includes create , read , update ,
        # delete , and search permissions. AWS_AUTH – The default HealthLake authorization strategy; not
        # affiliated with SMART on FHIR.
        @[JSON::Field(key: "AuthorizationStrategy")]
        getter authorization_strategy : String

        # The parameter to enable SMART on FHIR fine-grained authorization for the data store.
        @[JSON::Field(key: "FineGrainedAuthorizationEnabled")]
        getter fine_grained_authorization_enabled : Bool?

        # The Amazon Resource Name (ARN) of the Lambda function to use to decode the access token created by
        # the authorization server.
        @[JSON::Field(key: "IdpLambdaArn")]
        getter idp_lambda_arn : String?

        # The JSON metadata elements to use in your identity provider configuration. Required elements are
        # listed based on the launch specification of the SMART application. For more information on all
        # possible elements, see Metadata in SMART's App Launch specification. authorization_endpoint : The
        # URL to the OAuth2 authorization endpoint. grant_types_supported : An array of grant types that are
        # supported at the token endpoint. You must provide at least one grant type option. Valid options are
        # authorization_code and client_credentials . token_endpoint : The URL to the OAuth2 token endpoint.
        # capabilities : An array of strings of the SMART capabilities that the authorization server supports.
        # code_challenge_methods_supported : An array of strings of supported PKCE code challenge methods. You
        # must include the S256 method in the array of PKCE code challenge methods.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        def initialize(
          @authorization_strategy : String,
          @fine_grained_authorization_enabled : Bool? = nil,
          @idp_lambda_arn : String? = nil,
          @metadata : String? = nil
        )
        end
      end

      # The import job properties.
      struct ImportJobProperties
        include JSON::Serializable

        # The data store identifier.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The input data configuration supplied when the import job was created.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The import job identifier.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The import job status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # The time the import job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time

        # The Amazon Resource Name (ARN) that grants AWS HealthLake access to the input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time the import job was completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The import job name.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        @[JSON::Field(key: "JobOutputDataConfig")]
        getter job_output_data_config : Types::OutputDataConfig?

        # Displays the progress of the import job, including total resources scanned, total resources
        # imported, and total size of data imported.
        @[JSON::Field(key: "JobProgressReport")]
        getter job_progress_report : Types::JobProgressReport?

        # An explanation of any errors that might have occurred during the FHIR import job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The validation level of the import job.
        @[JSON::Field(key: "ValidationLevel")]
        getter validation_level : String?

        def initialize(
          @datastore_id : String,
          @input_data_config : Types::InputDataConfig,
          @job_id : String,
          @job_status : String,
          @submit_time : Time,
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @job_name : String? = nil,
          @job_output_data_config : Types::OutputDataConfig? = nil,
          @job_progress_report : Types::JobProgressReport? = nil,
          @message : String? = nil,
          @validation_level : String? = nil
        )
        end
      end

      # The import job input properties.
      struct InputDataConfig
        include JSON::Serializable

        # The S3Uri is the user-specified S3 location of the FHIR data to be imported into AWS HealthLake.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String?

        def initialize(
          @s3_uri : String? = nil
        )
        end
      end

      # An unknown internal error occurred in the service.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The progress report for the import job.
      struct JobProgressReport
        include JSON::Serializable

        # The transaction rate the import job is processed at.
        @[JSON::Field(key: "Throughput")]
        getter throughput : Float64?

        # The number of files that failed to be read from the S3 input bucket due to customer error.
        @[JSON::Field(key: "TotalNumberOfFilesReadWithCustomerError")]
        getter total_number_of_files_read_with_customer_error : Int64?

        # The number of files imported.
        @[JSON::Field(key: "TotalNumberOfImportedFiles")]
        getter total_number_of_imported_files : Int64?

        # The number of resources imported.
        @[JSON::Field(key: "TotalNumberOfResourcesImported")]
        getter total_number_of_resources_imported : Int64?

        # The number of resources scanned from the S3 input bucket.
        @[JSON::Field(key: "TotalNumberOfResourcesScanned")]
        getter total_number_of_resources_scanned : Int64?

        # The number of resources that failed due to customer error.
        @[JSON::Field(key: "TotalNumberOfResourcesWithCustomerError")]
        getter total_number_of_resources_with_customer_error : Int64?

        # The number of files scanned from the S3 input bucket.
        @[JSON::Field(key: "TotalNumberOfScannedFiles")]
        getter total_number_of_scanned_files : Int64?

        # The size (in MB) of files scanned from the S3 input bucket.
        @[JSON::Field(key: "TotalSizeOfScannedFilesInMB")]
        getter total_size_of_scanned_files_in_mb : Float64?

        def initialize(
          @throughput : Float64? = nil,
          @total_number_of_files_read_with_customer_error : Int64? = nil,
          @total_number_of_imported_files : Int64? = nil,
          @total_number_of_resources_imported : Int64? = nil,
          @total_number_of_resources_scanned : Int64? = nil,
          @total_number_of_resources_with_customer_error : Int64? = nil,
          @total_number_of_scanned_files : Int64? = nil,
          @total_size_of_scanned_files_in_mb : Float64? = nil
        )
        end
      end

      # The customer-managed-key (CMK) used when creating a data store. If a customer-owned key is not
      # specified, an AWS-owned key is used for encryption.
      struct KmsEncryptionConfig
        include JSON::Serializable

        # The type of customer-managed-key (CMK) used for encryption.
        @[JSON::Field(key: "CmkType")]
        getter cmk_type : String

        # The Key Management Service (KMS) encryption key id/alias used to encrypt the data store contents at
        # rest.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @cmk_type : String,
          @kms_key_id : String? = nil
        )
        end
      end

      struct ListFHIRDatastoresRequest
        include JSON::Serializable

        # List all filters associated with a FHIR data store request.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::DatastoreFilter?

        # The maximum number of data stores returned on a page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token used to retrieve the next page of data stores when results are paginated.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::DatastoreFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFHIRDatastoresResponse
        include JSON::Serializable

        # The properties associated with all listed data stores.
        @[JSON::Field(key: "DatastorePropertiesList")]
        getter datastore_properties_list : Array(Types::DatastoreProperties)

        # The pagination token used to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @datastore_properties_list : Array(Types::DatastoreProperties),
          @next_token : String? = nil
        )
        end
      end

      struct ListFHIRExportJobsRequest
        include JSON::Serializable

        # Limits the response to the export job with the specified data store ID.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # Limits the response to the export job with the specified job name.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Limits the response to export jobs with the specified job status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # Limits the number of results returned for a ListFHIRExportJobs to a maximum quantity specified by
        # the user.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token used to identify the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Limits the response to FHIR export jobs submitted after a user-specified date.
        @[JSON::Field(key: "SubmittedAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_after : Time?

        # Limits the response to FHIR export jobs submitted before a user- specified date.
        @[JSON::Field(key: "SubmittedBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_before : Time?

        def initialize(
          @datastore_id : String,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @submitted_after : Time? = nil,
          @submitted_before : Time? = nil
        )
        end
      end

      struct ListFHIRExportJobsResponse
        include JSON::Serializable

        # The properties of listed FHIR export jobs.
        @[JSON::Field(key: "ExportJobPropertiesList")]
        getter export_job_properties_list : Array(Types::ExportJobProperties)

        # The pagination token used to identify the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @export_job_properties_list : Array(Types::ExportJobProperties),
          @next_token : String? = nil
        )
        end
      end

      struct ListFHIRImportJobsRequest
        include JSON::Serializable

        # Limits the response to the import job with the specified data store ID.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # Limits the response to the import job with the specified job name.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Limits the response to the import job with the specified job status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # Limits the number of results returned for ListFHIRImportJobs to a maximum quantity specified by the
        # user.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token used to identify the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Limits the response to FHIR import jobs submitted after a user-specified date.
        @[JSON::Field(key: "SubmittedAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_after : Time?

        # Limits the response to FHIR import jobs submitted before a user- specified date.
        @[JSON::Field(key: "SubmittedBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_before : Time?

        def initialize(
          @datastore_id : String,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @submitted_after : Time? = nil,
          @submitted_before : Time? = nil
        )
        end
      end

      struct ListFHIRImportJobsResponse
        include JSON::Serializable

        # The properties for listed import jobs.
        @[JSON::Field(key: "ImportJobPropertiesList")]
        getter import_job_properties_list : Array(Types::ImportJobProperties)

        # The pagination token used to identify the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @import_job_properties_list : Array(Types::ImportJobProperties),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data store to which tags are being added.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Returns a list of tags associated with a data store.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The output data configuration supplied when the export job was created.
      struct OutputDataConfig
        include JSON::Serializable

        # The output data configuration supplied when the export job was created.
        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3Configuration?

        def initialize(
          @s3_configuration : Types::S3Configuration? = nil
        )
        end
      end

      # The input properties for the preloaded (Synthea) data store.
      struct PreloadDataConfig
        include JSON::Serializable

        # The type of preloaded data. Only Synthea preloaded data is supported.
        @[JSON::Field(key: "PreloadDataType")]
        getter preload_data_type : String

        def initialize(
          @preload_data_type : String
        )
        end
      end

      # The requested data store was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration of the S3 bucket for either an import or export job. This includes assigning
      # access permissions.
      struct S3Configuration
        include JSON::Serializable

        # The Key Management Service (KMS) key ID used to access the S3 bucket.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String

        # The S3Uri is the user-specified S3 location of the FHIR data to be imported into AWS HealthLake.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        def initialize(
          @kms_key_id : String,
          @s3_uri : String
        )
        end
      end

      # The server-side encryption key configuration for a customer-provided encryption key.
      struct SseConfiguration
        include JSON::Serializable

        # The Key Management Service (KMS) encryption configuration used to provide details for data
        # encryption.
        @[JSON::Field(key: "KmsEncryptionConfig")]
        getter kms_encryption_config : Types::KmsEncryptionConfig

        def initialize(
          @kms_encryption_config : Types::KmsEncryptionConfig
        )
        end
      end

      struct StartFHIRExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) used during initiation of the export job.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The data store identifier from which files are being exported.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The output data configuration supplied when the export job was started.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # An optional user provided token used for ensuring API idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The export job name.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        def initialize(
          @data_access_role_arn : String,
          @datastore_id : String,
          @output_data_config : Types::OutputDataConfig,
          @client_token : String? = nil,
          @job_name : String? = nil
        )
        end
      end

      struct StartFHIRExportJobResponse
        include JSON::Serializable

        # The export job identifier.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The export job status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # The data store identifier from which files are being exported.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String?

        def initialize(
          @job_id : String,
          @job_status : String,
          @datastore_id : String? = nil
        )
        end
      end

      struct StartFHIRImportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that grants access permission to AWS HealthLake.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The data store identifier.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String

        # The input properties for the import job request.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        @[JSON::Field(key: "JobOutputDataConfig")]
        getter job_output_data_config : Types::OutputDataConfig

        # The optional user-provided token used for ensuring API idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The import job name.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The validation level of the import job.
        @[JSON::Field(key: "ValidationLevel")]
        getter validation_level : String?

        def initialize(
          @data_access_role_arn : String,
          @datastore_id : String,
          @input_data_config : Types::InputDataConfig,
          @job_output_data_config : Types::OutputDataConfig,
          @client_token : String? = nil,
          @job_name : String? = nil,
          @validation_level : String? = nil
        )
        end
      end

      struct StartFHIRImportJobResponse
        include JSON::Serializable

        # The import job identifier.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The import job status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # The data store identifier.
        @[JSON::Field(key: "DatastoreId")]
        getter datastore_id : String?

        def initialize(
          @job_id : String,
          @job_status : String,
          @datastore_id : String? = nil
        )
        end
      end

      # A label consisting of a user-defined key and value. The form for tags is {"Key", "Value"}
      struct Tag
        include JSON::Serializable

        # The key portion of a tag. Tag keys are case sensitive.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value portion of a tag. Tag values are case-sensitive.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that grants access to the data store tags are being added to.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The user-specified key and value pair tags being added to a data store.
        @[JSON::Field(key: "Tags")]
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

      # The user has exceeded their maximum number of allowed calls to the given API.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data store from which tags are being removed.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The keys for the tags to be removed from the data store.
        @[JSON::Field(key: "TagKeys")]
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

      # The user input parameter was invalid.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
