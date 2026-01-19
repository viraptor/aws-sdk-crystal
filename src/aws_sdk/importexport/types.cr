require "json"
require "time"

module AwsSdk
  module Importexport
    module Types

      # A discrete item that contains the description and URL of an artifact (such as a PDF).
      struct Artifact
        include JSON::Serializable

        @[JSON::Field(key: "Description")]
        getter description : String?

        @[JSON::Field(key: "URL")]
        getter url : String?

        def initialize(
          @description : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The account specified does not have the appropriate bucket permissions.
      struct BucketPermissionException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input structure for the CancelJob operation.
      struct CancelJobInput
        include JSON::Serializable

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        @[JSON::Field(key: "APIVersion")]
        getter api_version : String?

        def initialize(
          @job_id : String,
          @api_version : String? = nil
        )
        end
      end

      # Output structure for the CancelJob operation.
      struct CancelJobOutput
        include JSON::Serializable

        @[JSON::Field(key: "Success")]
        getter success : Bool?

        def initialize(
          @success : Bool? = nil
        )
        end
      end

      # The specified job ID has been canceled and is no longer valid.
      struct CanceledJobIdException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input structure for the CreateJob operation.
      struct CreateJobInput
        include JSON::Serializable

        @[JSON::Field(key: "JobType")]
        getter job_type : String

        @[JSON::Field(key: "Manifest")]
        getter manifest : String

        @[JSON::Field(key: "ValidateOnly")]
        getter validate_only : Bool

        @[JSON::Field(key: "APIVersion")]
        getter api_version : String?

        @[JSON::Field(key: "ManifestAddendum")]
        getter manifest_addendum : String?

        def initialize(
          @job_type : String,
          @manifest : String,
          @validate_only : Bool,
          @api_version : String? = nil,
          @manifest_addendum : String? = nil
        )
        end
      end

      # Output structure for the CreateJob operation.
      struct CreateJobOutput
        include JSON::Serializable

        @[JSON::Field(key: "ArtifactList")]
        getter artifact_list : Array(Types::Artifact)?

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        @[JSON::Field(key: "Signature")]
        getter signature : String?

        @[JSON::Field(key: "SignatureFileContents")]
        getter signature_file_contents : String?

        @[JSON::Field(key: "WarningMessage")]
        getter warning_message : String?

        def initialize(
          @artifact_list : Array(Types::Artifact)? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil,
          @signature : String? = nil,
          @signature_file_contents : String? = nil,
          @warning_message : String? = nil
        )
        end
      end

      # Each account can create only a certain number of jobs per day. If you need to create more than this,
      # please contact awsimportexport@amazon.com to explain your particular use case.
      struct CreateJobQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the specified job has expired out of the system.
      struct ExpiredJobIdException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct GetShippingLabelInput
        include JSON::Serializable

        @[JSON::Field(key: "jobIds")]
        getter job_ids : Array(String)

        @[JSON::Field(key: "APIVersion")]
        getter api_version : String?

        @[JSON::Field(key: "city")]
        getter city : String?

        @[JSON::Field(key: "company")]
        getter company : String?

        @[JSON::Field(key: "country")]
        getter country : String?

        @[JSON::Field(key: "name")]
        getter name : String?

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String?

        @[JSON::Field(key: "postalCode")]
        getter postal_code : String?

        @[JSON::Field(key: "stateOrProvince")]
        getter state_or_province : String?

        @[JSON::Field(key: "street1")]
        getter street1 : String?

        @[JSON::Field(key: "street2")]
        getter street2 : String?

        @[JSON::Field(key: "street3")]
        getter street3 : String?

        def initialize(
          @job_ids : Array(String),
          @api_version : String? = nil,
          @city : String? = nil,
          @company : String? = nil,
          @country : String? = nil,
          @name : String? = nil,
          @phone_number : String? = nil,
          @postal_code : String? = nil,
          @state_or_province : String? = nil,
          @street1 : String? = nil,
          @street2 : String? = nil,
          @street3 : String? = nil
        )
        end
      end

      struct GetShippingLabelOutput
        include JSON::Serializable

        @[JSON::Field(key: "ShippingLabelURL")]
        getter shipping_label_url : String?

        @[JSON::Field(key: "Warning")]
        getter warning : String?

        def initialize(
          @shipping_label_url : String? = nil,
          @warning : String? = nil
        )
        end
      end

      # Input structure for the GetStatus operation.
      struct GetStatusInput
        include JSON::Serializable

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        @[JSON::Field(key: "APIVersion")]
        getter api_version : String?

        def initialize(
          @job_id : String,
          @api_version : String? = nil
        )
        end
      end

      # Output structure for the GetStatus operation.
      struct GetStatusOutput
        include JSON::Serializable

        @[JSON::Field(key: "ArtifactList")]
        getter artifact_list : Array(Types::Artifact)?

        @[JSON::Field(key: "Carrier")]
        getter carrier : String?

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        @[JSON::Field(key: "CurrentManifest")]
        getter current_manifest : String?

        @[JSON::Field(key: "ErrorCount")]
        getter error_count : Int32?

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        @[JSON::Field(key: "LocationCode")]
        getter location_code : String?

        @[JSON::Field(key: "LocationMessage")]
        getter location_message : String?

        @[JSON::Field(key: "LogBucket")]
        getter log_bucket : String?

        @[JSON::Field(key: "LogKey")]
        getter log_key : String?

        @[JSON::Field(key: "ProgressCode")]
        getter progress_code : String?

        @[JSON::Field(key: "ProgressMessage")]
        getter progress_message : String?

        @[JSON::Field(key: "Signature")]
        getter signature : String?

        @[JSON::Field(key: "SignatureFileContents")]
        getter signature_file_contents : String?

        @[JSON::Field(key: "TrackingNumber")]
        getter tracking_number : String?

        def initialize(
          @artifact_list : Array(Types::Artifact)? = nil,
          @carrier : String? = nil,
          @creation_date : Time? = nil,
          @current_manifest : String? = nil,
          @error_count : Int32? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil,
          @location_code : String? = nil,
          @location_message : String? = nil,
          @log_bucket : String? = nil,
          @log_key : String? = nil,
          @progress_code : String? = nil,
          @progress_message : String? = nil,
          @signature : String? = nil,
          @signature_file_contents : String? = nil,
          @tracking_number : String? = nil
        )
        end
      end

      # The AWS Access Key ID specified in the request did not match the manifest's accessKeyId value. The
      # manifest and the request authentication must use the same AWS Access Key ID.
      struct InvalidAccessKeyIdException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The address specified in the manifest is invalid.
      struct InvalidAddressException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more customs parameters was invalid. Please correct and resubmit.
      struct InvalidCustomsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # File system specified in export manifest is invalid.
      struct InvalidFileSystemException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The JOBID was missing, not found, or not associated with the AWS account.
      struct InvalidJobIdException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more manifest fields was invalid. Please correct and resubmit.
      struct InvalidManifestFieldException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters had an invalid value.
      struct InvalidParameterException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The client tool version is invalid.
      struct InvalidVersionException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Representation of a job returned by the ListJobs operation.
      struct Job
        include JSON::Serializable

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        @[JSON::Field(key: "IsCanceled")]
        getter is_canceled : Bool?

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        def initialize(
          @creation_date : Time? = nil,
          @is_canceled : Bool? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil
        )
        end
      end

      # Input structure for the ListJobs operation.
      struct ListJobsInput
        include JSON::Serializable

        @[JSON::Field(key: "APIVersion")]
        getter api_version : String?

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        @[JSON::Field(key: "MaxJobs")]
        getter max_jobs : Int32?

        def initialize(
          @api_version : String? = nil,
          @marker : String? = nil,
          @max_jobs : Int32? = nil
        )
        end
      end

      # Output structure for the ListJobs operation.
      struct ListJobsOutput
        include JSON::Serializable

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        @[JSON::Field(key: "Jobs")]
        getter jobs : Array(Types::Job)?

        def initialize(
          @is_truncated : Bool? = nil,
          @jobs : Array(Types::Job)? = nil
        )
        end
      end

      # Your manifest is not well-formed.
      struct MalformedManifestException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more required customs parameters was missing from the manifest.
      struct MissingCustomsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more required fields were missing from the manifest file. Please correct and resubmit.
      struct MissingManifestFieldException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more required parameters was missing from the request.
      struct MissingParameterException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your manifest file contained buckets from multiple regions. A job is restricted to buckets from one
      # region. Please correct and resubmit.
      struct MultipleRegionsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified bucket does not exist. Create the specified bucket or change the manifest's bucket,
      # exportBucket, or logBucket field to a bucket that the account, as specified by the manifest's Access
      # Key ID, has write permissions to.
      struct NoSuchBucketException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # AWS Import/Export cannot cancel the job
      struct UnableToCancelJobIdException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # AWS Import/Export cannot update the job
      struct UnableToUpdateJobIdException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input structure for the UpateJob operation.
      struct UpdateJobInput
        include JSON::Serializable

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        @[JSON::Field(key: "JobType")]
        getter job_type : String

        @[JSON::Field(key: "Manifest")]
        getter manifest : String

        @[JSON::Field(key: "ValidateOnly")]
        getter validate_only : Bool

        @[JSON::Field(key: "APIVersion")]
        getter api_version : String?

        def initialize(
          @job_id : String,
          @job_type : String,
          @manifest : String,
          @validate_only : Bool,
          @api_version : String? = nil
        )
        end
      end

      # Output structure for the UpateJob operation.
      struct UpdateJobOutput
        include JSON::Serializable

        @[JSON::Field(key: "ArtifactList")]
        getter artifact_list : Array(Types::Artifact)?

        @[JSON::Field(key: "Success")]
        getter success : Bool?

        @[JSON::Field(key: "WarningMessage")]
        getter warning_message : String?

        def initialize(
          @artifact_list : Array(Types::Artifact)? = nil,
          @success : Bool? = nil,
          @warning_message : String? = nil
        )
        end
      end
    end
  end
end
