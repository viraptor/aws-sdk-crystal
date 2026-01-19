require "json"
require "time"

module AwsSdk
  module Panorama
    module Types

      # The requestor does not have permission to access the target action or resource.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Details about a beta appliance software update.
      struct AlternateSoftwareMetadata
        include JSON::Serializable

        # The appliance software version.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @version : String? = nil
        )
        end
      end

      # An application instance on a device.
      struct ApplicationInstance
        include JSON::Serializable

        # The application instance's ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String?

        # The application instance's ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # When the application instance was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The device's ID.
        @[JSON::Field(key: "DefaultRuntimeContextDevice")]
        getter default_runtime_context_device : String?

        # The device's name.
        @[JSON::Field(key: "DefaultRuntimeContextDeviceName")]
        getter default_runtime_context_device_name : String?

        # The application instance's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The application instance's health status.
        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # The application instance's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The application's state.
        @[JSON::Field(key: "RuntimeContextStates")]
        getter runtime_context_states : Array(Types::ReportedRuntimeContextState)?

        # The application instance's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The application instance's status description.
        @[JSON::Field(key: "StatusDescription")]
        getter status_description : String?

        # The application instance's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_instance_id : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @default_runtime_context_device : String? = nil,
          @default_runtime_context_device_name : String? = nil,
          @description : String? = nil,
          @health_status : String? = nil,
          @name : String? = nil,
          @runtime_context_states : Array(Types::ReportedRuntimeContextState)? = nil,
          @status : String? = nil,
          @status_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The target resource is in use.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The resource's ID.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource's type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # A list of attributes that led to the exception and their values.
        @[JSON::Field(key: "ErrorArguments")]
        getter error_arguments : Array(Types::ConflictExceptionErrorArgument)?

        # A unique ID for the error.
        @[JSON::Field(key: "ErrorId")]
        getter error_id : String?

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String,
          @error_arguments : Array(Types::ConflictExceptionErrorArgument)? = nil,
          @error_id : String? = nil
        )
        end
      end

      # A conflict exception error argument.
      struct ConflictExceptionErrorArgument
        include JSON::Serializable

        # The error argument's name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The error argument's value.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      struct CreateApplicationInstanceRequest
        include JSON::Serializable

        # A device's ID.
        @[JSON::Field(key: "DefaultRuntimeContextDevice")]
        getter default_runtime_context_device : String

        # The application's manifest document.
        @[JSON::Field(key: "ManifestPayload")]
        getter manifest_payload : Types::ManifestPayload

        # The ID of an application instance to replace with the new instance.
        @[JSON::Field(key: "ApplicationInstanceIdToReplace")]
        getter application_instance_id_to_replace : String?

        # A description for the application instance.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Setting overrides for the application manifest.
        @[JSON::Field(key: "ManifestOverridesPayload")]
        getter manifest_overrides_payload : Types::ManifestOverridesPayload?

        # A name for the application instance.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of a runtime role for the application instance.
        @[JSON::Field(key: "RuntimeRoleArn")]
        getter runtime_role_arn : String?

        # Tags for the application instance.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @default_runtime_context_device : String,
          @manifest_payload : Types::ManifestPayload,
          @application_instance_id_to_replace : String? = nil,
          @description : String? = nil,
          @manifest_overrides_payload : Types::ManifestOverridesPayload? = nil,
          @name : String? = nil,
          @runtime_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateApplicationInstanceResponse
        include JSON::Serializable

        # The application instance's ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        def initialize(
          @application_instance_id : String
        )
        end
      end

      struct CreateJobForDevicesRequest
        include JSON::Serializable

        # ID of target device.
        @[JSON::Field(key: "DeviceIds")]
        getter device_ids : Array(String)

        # The type of job to run.
        @[JSON::Field(key: "JobType")]
        getter job_type : String

        # Configuration settings for a software update job.
        @[JSON::Field(key: "DeviceJobConfig")]
        getter device_job_config : Types::DeviceJobConfig?

        def initialize(
          @device_ids : Array(String),
          @job_type : String,
          @device_job_config : Types::DeviceJobConfig? = nil
        )
        end
      end

      struct CreateJobForDevicesResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "Jobs")]
        getter jobs : Array(Types::Job)

        def initialize(
          @jobs : Array(Types::Job)
        )
        end
      end

      struct CreateNodeFromTemplateJobRequest
        include JSON::Serializable

        # A name for the node.
        @[JSON::Field(key: "NodeName")]
        getter node_name : String

        # An output package name for the node.
        @[JSON::Field(key: "OutputPackageName")]
        getter output_package_name : String

        # An output package version for the node.
        @[JSON::Field(key: "OutputPackageVersion")]
        getter output_package_version : String

        # Template parameters for the node.
        @[JSON::Field(key: "TemplateParameters")]
        getter template_parameters : Hash(String, String)

        # The type of node.
        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # Tags for the job.
        @[JSON::Field(key: "JobTags")]
        getter job_tags : Array(Types::JobResourceTags)?

        # A description for the node.
        @[JSON::Field(key: "NodeDescription")]
        getter node_description : String?

        def initialize(
          @node_name : String,
          @output_package_name : String,
          @output_package_version : String,
          @template_parameters : Hash(String, String),
          @template_type : String,
          @job_tags : Array(Types::JobResourceTags)? = nil,
          @node_description : String? = nil
        )
        end
      end

      struct CreateNodeFromTemplateJobResponse
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct CreatePackageImportJobRequest
        include JSON::Serializable

        # A client token for the package import job.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # An input config for the package import job.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::PackageImportJobInputConfig

        # A job type for the package import job.
        @[JSON::Field(key: "JobType")]
        getter job_type : String

        # An output config for the package import job.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::PackageImportJobOutputConfig

        # Tags for the package import job.
        @[JSON::Field(key: "JobTags")]
        getter job_tags : Array(Types::JobResourceTags)?

        def initialize(
          @client_token : String,
          @input_config : Types::PackageImportJobInputConfig,
          @job_type : String,
          @output_config : Types::PackageImportJobOutputConfig,
          @job_tags : Array(Types::JobResourceTags)? = nil
        )
        end
      end

      struct CreatePackageImportJobResponse
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct CreatePackageRequest
        include JSON::Serializable

        # A name for the package.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # Tags for the package.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @package_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreatePackageResponse
        include JSON::Serializable

        # The package's storage location.
        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::StorageLocation

        # The package's ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The package's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String?

        def initialize(
          @storage_location : Types::StorageLocation,
          @arn : String? = nil,
          @package_id : String? = nil
        )
        end
      end

      struct DeleteDeviceRequest
        include JSON::Serializable

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        def initialize(
          @device_id : String
        )
        end
      end

      struct DeleteDeviceResponse
        include JSON::Serializable

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        def initialize(
          @device_id : String? = nil
        )
        end
      end

      struct DeletePackageRequest
        include JSON::Serializable

        # The package's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # Delete the package even if it has artifacts stored in its access point. Deletes the package's
        # artifacts from Amazon S3.
        @[JSON::Field(key: "ForceDelete")]
        getter force_delete : Bool?

        def initialize(
          @package_id : String,
          @force_delete : Bool? = nil
        )
        end
      end

      struct DeletePackageResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeregisterPackageVersionRequest
        include JSON::Serializable

        # A package ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # A package version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # A patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String

        # An owner account.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # If the version was marked latest, the new version to maker as latest.
        @[JSON::Field(key: "UpdatedLatestPatchVersion")]
        getter updated_latest_patch_version : String?

        def initialize(
          @package_id : String,
          @package_version : String,
          @patch_version : String,
          @owner_account : String? = nil,
          @updated_latest_patch_version : String? = nil
        )
        end
      end

      struct DeregisterPackageVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeApplicationInstanceDetailsRequest
        include JSON::Serializable

        # The application instance's ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        def initialize(
          @application_instance_id : String
        )
        end
      end

      struct DescribeApplicationInstanceDetailsResponse
        include JSON::Serializable

        # The application instance's ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String?

        # The ID of the application instance that this instance replaced.
        @[JSON::Field(key: "ApplicationInstanceIdToReplace")]
        getter application_instance_id_to_replace : String?

        # When the application instance was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The application instance's default runtime context device.
        @[JSON::Field(key: "DefaultRuntimeContextDevice")]
        getter default_runtime_context_device : String?

        # The application instance's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Parameter overrides for the configuration manifest.
        @[JSON::Field(key: "ManifestOverridesPayload")]
        getter manifest_overrides_payload : Types::ManifestOverridesPayload?

        # The application instance's configuration manifest.
        @[JSON::Field(key: "ManifestPayload")]
        getter manifest_payload : Types::ManifestPayload?

        # The application instance's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @application_instance_id : String? = nil,
          @application_instance_id_to_replace : String? = nil,
          @created_time : Time? = nil,
          @default_runtime_context_device : String? = nil,
          @description : String? = nil,
          @manifest_overrides_payload : Types::ManifestOverridesPayload? = nil,
          @manifest_payload : Types::ManifestPayload? = nil,
          @name : String? = nil
        )
        end
      end

      struct DescribeApplicationInstanceRequest
        include JSON::Serializable

        # The application instance's ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        def initialize(
          @application_instance_id : String
        )
        end
      end

      struct DescribeApplicationInstanceResponse
        include JSON::Serializable

        # The application instance's ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String?

        # The ID of the application instance that this instance replaced.
        @[JSON::Field(key: "ApplicationInstanceIdToReplace")]
        getter application_instance_id_to_replace : String?

        # The application instance's ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # When the application instance was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The device's ID.
        @[JSON::Field(key: "DefaultRuntimeContextDevice")]
        getter default_runtime_context_device : String?

        # The device's bane.
        @[JSON::Field(key: "DefaultRuntimeContextDeviceName")]
        getter default_runtime_context_device_name : String?

        # The application instance's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The application instance's health status.
        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # The application instance was updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The application instance's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The application instance's state.
        @[JSON::Field(key: "RuntimeContextStates")]
        getter runtime_context_states : Array(Types::ReportedRuntimeContextState)?

        # The application instance's runtime role ARN.
        @[JSON::Field(key: "RuntimeRoleArn")]
        getter runtime_role_arn : String?

        # The application instance's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The application instance's status description.
        @[JSON::Field(key: "StatusDescription")]
        getter status_description : String?

        # The application instance's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_instance_id : String? = nil,
          @application_instance_id_to_replace : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @default_runtime_context_device : String? = nil,
          @default_runtime_context_device_name : String? = nil,
          @description : String? = nil,
          @health_status : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @runtime_context_states : Array(Types::ReportedRuntimeContextState)? = nil,
          @runtime_role_arn : String? = nil,
          @status : String? = nil,
          @status_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct DescribeDeviceJobRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeDeviceJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The device's ARN.
        @[JSON::Field(key: "DeviceArn")]
        getter device_arn : String?

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The device's name.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The device's type.
        @[JSON::Field(key: "DeviceType")]
        getter device_type : String?

        # For an OTA job, the target version of the device software.
        @[JSON::Field(key: "ImageVersion")]
        getter image_version : String?

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The job's type.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # The job's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_time : Time? = nil,
          @device_arn : String? = nil,
          @device_id : String? = nil,
          @device_name : String? = nil,
          @device_type : String? = nil,
          @image_version : String? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeDeviceRequest
        include JSON::Serializable

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        def initialize(
          @device_id : String
        )
        end
      end

      struct DescribeDeviceResponse
        include JSON::Serializable

        # Beta software releases available for the device.
        @[JSON::Field(key: "AlternateSoftwares")]
        getter alternate_softwares : Array(Types::AlternateSoftwareMetadata)?

        # The device's ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The device's maker.
        @[JSON::Field(key: "Brand")]
        getter brand : String?

        # When the device was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The device's networking status.
        @[JSON::Field(key: "CurrentNetworkingStatus")]
        getter current_networking_status : Types::NetworkStatus?

        # The device's current software version.
        @[JSON::Field(key: "CurrentSoftware")]
        getter current_software : String?

        # The device's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A device's aggregated status. Including the device's connection status, provisioning status, and
        # lease status.
        @[JSON::Field(key: "DeviceAggregatedStatus")]
        getter device_aggregated_status : String?

        # The device's connection status.
        @[JSON::Field(key: "DeviceConnectionStatus")]
        getter device_connection_status : String?

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The most recent beta software release.
        @[JSON::Field(key: "LatestAlternateSoftware")]
        getter latest_alternate_software : String?

        # A device's latest job. Includes the target image version, and the job status.
        @[JSON::Field(key: "LatestDeviceJob")]
        getter latest_device_job : Types::LatestDeviceJob?

        # The latest software version available for the device.
        @[JSON::Field(key: "LatestSoftware")]
        getter latest_software : String?

        # The device's lease expiration time.
        @[JSON::Field(key: "LeaseExpirationTime")]
        getter lease_expiration_time : Time?

        # The device's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The device's networking configuration.
        @[JSON::Field(key: "NetworkingConfiguration")]
        getter networking_configuration : Types::NetworkPayload?

        # The device's provisioning status.
        @[JSON::Field(key: "ProvisioningStatus")]
        getter provisioning_status : String?

        # The device's serial number.
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # The device's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The device's type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @alternate_softwares : Array(Types::AlternateSoftwareMetadata)? = nil,
          @arn : String? = nil,
          @brand : String? = nil,
          @created_time : Time? = nil,
          @current_networking_status : Types::NetworkStatus? = nil,
          @current_software : String? = nil,
          @description : String? = nil,
          @device_aggregated_status : String? = nil,
          @device_connection_status : String? = nil,
          @device_id : String? = nil,
          @latest_alternate_software : String? = nil,
          @latest_device_job : Types::LatestDeviceJob? = nil,
          @latest_software : String? = nil,
          @lease_expiration_time : Time? = nil,
          @name : String? = nil,
          @networking_configuration : Types::NetworkPayload? = nil,
          @provisioning_status : String? = nil,
          @serial_number : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeNodeFromTemplateJobRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeNodeFromTemplateJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # When the job was updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time

        # The node's name.
        @[JSON::Field(key: "NodeName")]
        getter node_name : String

        # The job's output package name.
        @[JSON::Field(key: "OutputPackageName")]
        getter output_package_name : String

        # The job's output package version.
        @[JSON::Field(key: "OutputPackageVersion")]
        getter output_package_version : String

        # The job's status.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The job's status message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String

        # The job's template parameters.
        @[JSON::Field(key: "TemplateParameters")]
        getter template_parameters : Hash(String, String)

        # The job's template type.
        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # The job's tags.
        @[JSON::Field(key: "JobTags")]
        getter job_tags : Array(Types::JobResourceTags)?

        # The node's description.
        @[JSON::Field(key: "NodeDescription")]
        getter node_description : String?

        def initialize(
          @created_time : Time,
          @job_id : String,
          @last_updated_time : Time,
          @node_name : String,
          @output_package_name : String,
          @output_package_version : String,
          @status : String,
          @status_message : String,
          @template_parameters : Hash(String, String),
          @template_type : String,
          @job_tags : Array(Types::JobResourceTags)? = nil,
          @node_description : String? = nil
        )
        end
      end

      struct DescribeNodeRequest
        include JSON::Serializable

        # The node's ID.
        @[JSON::Field(key: "NodeId")]
        getter node_id : String

        # The account ID of the node's owner.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        def initialize(
          @node_id : String,
          @owner_account : String? = nil
        )
        end
      end

      struct DescribeNodeResponse
        include JSON::Serializable

        # The node's category.
        @[JSON::Field(key: "Category")]
        getter category : String

        # When the node was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The node's description.
        @[JSON::Field(key: "Description")]
        getter description : String

        # When the node was updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time

        # The node's name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The node's ID.
        @[JSON::Field(key: "NodeId")]
        getter node_id : String

        # The node's interface.
        @[JSON::Field(key: "NodeInterface")]
        getter node_interface : Types::NodeInterface

        # The account ID of the node's owner.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String

        # The node's package ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # The node's package name.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # The node's package version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # The node's patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String

        # The node's asset name.
        @[JSON::Field(key: "AssetName")]
        getter asset_name : String?

        # The node's ARN.
        @[JSON::Field(key: "PackageArn")]
        getter package_arn : String?

        def initialize(
          @category : String,
          @created_time : Time,
          @description : String,
          @last_updated_time : Time,
          @name : String,
          @node_id : String,
          @node_interface : Types::NodeInterface,
          @owner_account : String,
          @package_id : String,
          @package_name : String,
          @package_version : String,
          @patch_version : String,
          @asset_name : String? = nil,
          @package_arn : String? = nil
        )
        end
      end

      struct DescribePackageImportJobRequest
        include JSON::Serializable

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribePackageImportJobResponse
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The job's input config.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::PackageImportJobInputConfig

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The job's type.
        @[JSON::Field(key: "JobType")]
        getter job_type : String

        # When the job was updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time

        # The job's output.
        @[JSON::Field(key: "Output")]
        getter output : Types::PackageImportJobOutput

        # The job's output config.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::PackageImportJobOutputConfig

        # The job's status.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The job's status message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String

        # The job's client token.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The job's tags.
        @[JSON::Field(key: "JobTags")]
        getter job_tags : Array(Types::JobResourceTags)?

        def initialize(
          @created_time : Time,
          @input_config : Types::PackageImportJobInputConfig,
          @job_id : String,
          @job_type : String,
          @last_updated_time : Time,
          @output : Types::PackageImportJobOutput,
          @output_config : Types::PackageImportJobOutputConfig,
          @status : String,
          @status_message : String,
          @client_token : String? = nil,
          @job_tags : Array(Types::JobResourceTags)? = nil
        )
        end
      end

      struct DescribePackageRequest
        include JSON::Serializable

        # The package's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        def initialize(
          @package_id : String
        )
        end
      end

      struct DescribePackageResponse
        include JSON::Serializable

        # The package's ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # When the package was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The package's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # The package's name.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # The package's storage location.
        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::StorageLocation

        # The package's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        # ARNs of accounts that have read access to the package.
        @[JSON::Field(key: "ReadAccessPrincipalArns")]
        getter read_access_principal_arns : Array(String)?

        # ARNs of accounts that have write access to the package.
        @[JSON::Field(key: "WriteAccessPrincipalArns")]
        getter write_access_principal_arns : Array(String)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @package_id : String,
          @package_name : String,
          @storage_location : Types::StorageLocation,
          @tags : Hash(String, String),
          @read_access_principal_arns : Array(String)? = nil,
          @write_access_principal_arns : Array(String)? = nil
        )
        end
      end

      struct DescribePackageVersionRequest
        include JSON::Serializable

        # The version's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # The version's version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # The version's owner account.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The version's patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String?

        def initialize(
          @package_id : String,
          @package_version : String,
          @owner_account : String? = nil,
          @patch_version : String? = nil
        )
        end
      end

      struct DescribePackageVersionResponse
        include JSON::Serializable

        # Whether the version is the latest available.
        @[JSON::Field(key: "IsLatestPatch")]
        getter is_latest_patch : Bool

        # The version's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # The version's name.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # The version's version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # The version's patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String

        # The version's status.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The account ID of the version's owner.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The ARN of the package.
        @[JSON::Field(key: "PackageArn")]
        getter package_arn : String?

        # The version's registered time.
        @[JSON::Field(key: "RegisteredTime")]
        getter registered_time : Time?

        # The version's status description.
        @[JSON::Field(key: "StatusDescription")]
        getter status_description : String?

        def initialize(
          @is_latest_patch : Bool,
          @package_id : String,
          @package_name : String,
          @package_version : String,
          @patch_version : String,
          @status : String,
          @owner_account : String? = nil,
          @package_arn : String? = nil,
          @registered_time : Time? = nil,
          @status_description : String? = nil
        )
        end
      end

      # A device.
      struct Device
        include JSON::Serializable

        # The device's maker.
        @[JSON::Field(key: "Brand")]
        getter brand : String?

        # When the device was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # A device's current software.
        @[JSON::Field(key: "CurrentSoftware")]
        getter current_software : String?

        # A description for the device.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A device's aggregated status. Including the device's connection status, provisioning status, and
        # lease status.
        @[JSON::Field(key: "DeviceAggregatedStatus")]
        getter device_aggregated_status : String?

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # When the device was updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # A device's latest job. Includes the target image version, and the update job status.
        @[JSON::Field(key: "LatestDeviceJob")]
        getter latest_device_job : Types::LatestDeviceJob?

        # The device's lease expiration time.
        @[JSON::Field(key: "LeaseExpirationTime")]
        getter lease_expiration_time : Time?

        # The device's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The device's provisioning status.
        @[JSON::Field(key: "ProvisioningStatus")]
        getter provisioning_status : String?

        # The device's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The device's type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @brand : String? = nil,
          @created_time : Time? = nil,
          @current_software : String? = nil,
          @description : String? = nil,
          @device_aggregated_status : String? = nil,
          @device_id : String? = nil,
          @last_updated_time : Time? = nil,
          @latest_device_job : Types::LatestDeviceJob? = nil,
          @lease_expiration_time : Time? = nil,
          @name : String? = nil,
          @provisioning_status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # A job that runs on a device.
      struct DeviceJob
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The ID of the target device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The name of the target device
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The job's type.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        def initialize(
          @created_time : Time? = nil,
          @device_id : String? = nil,
          @device_name : String? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil
        )
        end
      end

      # A job's configuration.
      struct DeviceJobConfig
        include JSON::Serializable

        # A configuration for an over-the-air (OTA) upgrade. Required for OTA jobs.
        @[JSON::Field(key: "OTAJobConfig")]
        getter ota_job_config : Types::OTAJobConfig?

        def initialize(
          @ota_job_config : Types::OTAJobConfig? = nil
        )
        end
      end

      # A device's network configuration.
      struct EthernetPayload
        include JSON::Serializable

        # How the device gets an IP address.
        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # Network configuration for a static IP connection.
        @[JSON::Field(key: "StaticIpConnectionInfo")]
        getter static_ip_connection_info : Types::StaticIpConnectionInfo?

        def initialize(
          @connection_type : String,
          @static_ip_connection_info : Types::StaticIpConnectionInfo? = nil
        )
        end
      end

      # A device's Ethernet status.
      struct EthernetStatus
        include JSON::Serializable

        # The device's connection status.
        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : String?

        # The device's physical address.
        @[JSON::Field(key: "HwAddress")]
        getter hw_address : String?

        # The device's IP address.
        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        def initialize(
          @connection_status : String? = nil,
          @hw_address : String? = nil,
          @ip_address : String? = nil
        )
        end
      end

      # An internal error occurred.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The number of seconds a client should wait before retrying the call.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # A job for a device.
      struct Job
        include JSON::Serializable

        # The target device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @device_id : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      # Tags for a job.
      struct JobResourceTags
        include JSON::Serializable

        # The job's type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The job's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_type : String,
          @tags : Hash(String, String)
        )
        end
      end

      # Returns information about the latest device job.
      struct LatestDeviceJob
        include JSON::Serializable

        # The target version of the device software.
        @[JSON::Field(key: "ImageVersion")]
        getter image_version : String?

        # The job's type.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # Status of the latest device job.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @image_version : String? = nil,
          @job_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListApplicationInstanceDependenciesRequest
        include JSON::Serializable

        # The application instance's ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        # The maximum number of application instance dependencies to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationInstanceDependenciesResponse
        include JSON::Serializable

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of package objects.
        @[JSON::Field(key: "PackageObjects")]
        getter package_objects : Array(Types::PackageObject)?

        def initialize(
          @next_token : String? = nil,
          @package_objects : Array(Types::PackageObject)? = nil
        )
        end
      end

      struct ListApplicationInstanceNodeInstancesRequest
        include JSON::Serializable

        # The node instances' application instance ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        # The maximum number of node instances to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationInstanceNodeInstancesResponse
        include JSON::Serializable

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of node instances.
        @[JSON::Field(key: "NodeInstances")]
        getter node_instances : Array(Types::NodeInstance)?

        def initialize(
          @next_token : String? = nil,
          @node_instances : Array(Types::NodeInstance)? = nil
        )
        end
      end

      struct ListApplicationInstancesRequest
        include JSON::Serializable

        # The application instances' device ID.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String?

        # The maximum number of application instances to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Only include instances with a specific status.
        @[JSON::Field(key: "statusFilter")]
        getter status_filter : String?

        def initialize(
          @device_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status_filter : String? = nil
        )
        end
      end

      struct ListApplicationInstancesResponse
        include JSON::Serializable

        # A list of application instances.
        @[JSON::Field(key: "ApplicationInstances")]
        getter application_instances : Array(Types::ApplicationInstance)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_instances : Array(Types::ApplicationInstance)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDevicesJobsRequest
        include JSON::Serializable

        # Filter results by the job's target device ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The maximum number of device jobs to return in one page of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @device_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDevicesJobsResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "DeviceJobs")]
        getter device_jobs : Array(Types::DeviceJob)?

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @device_jobs : Array(Types::DeviceJob)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDevicesRequest
        include JSON::Serializable

        # Filter based on a device's status.
        @[JSON::Field(key: "DeviceAggregatedStatusFilter")]
        getter device_aggregated_status_filter : String?

        # The maximum number of devices to return in one page of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Filter based on device's name. Prefixes supported.
        @[JSON::Field(key: "NameFilter")]
        getter name_filter : String?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The target column to be sorted on. Default column sort is CREATED_TIME.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sorting order for the returned list. SortOrder is DESCENDING by default based on CREATED_TIME.
        # Otherwise, SortOrder is ASCENDING.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @device_aggregated_status_filter : String? = nil,
          @max_results : Int32? = nil,
          @name_filter : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListDevicesResponse
        include JSON::Serializable

        # A list of devices.
        @[JSON::Field(key: "Devices")]
        getter devices : Array(Types::Device)

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @devices : Array(Types::Device),
          @next_token : String? = nil
        )
        end
      end

      struct ListNodeFromTemplateJobsRequest
        include JSON::Serializable

        # The maximum number of node from template jobs to return in one page of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNodeFromTemplateJobsResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "NodeFromTemplateJobs")]
        getter node_from_template_jobs : Array(Types::NodeFromTemplateJob)

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @node_from_template_jobs : Array(Types::NodeFromTemplateJob),
          @next_token : String? = nil
        )
        end
      end

      struct ListNodesRequest
        include JSON::Serializable

        # Search for nodes by category.
        @[JSON::Field(key: "category")]
        getter category : String?

        # The maximum number of nodes to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Search for nodes by the account ID of the nodes' owner.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # Search for nodes by name.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        # Search for nodes by version.
        @[JSON::Field(key: "packageVersion")]
        getter package_version : String?

        # Search for nodes by patch version.
        @[JSON::Field(key: "patchVersion")]
        getter patch_version : String?

        def initialize(
          @category : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner_account : String? = nil,
          @package_name : String? = nil,
          @package_version : String? = nil,
          @patch_version : String? = nil
        )
        end
      end

      struct ListNodesResponse
        include JSON::Serializable

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of nodes.
        @[JSON::Field(key: "Nodes")]
        getter nodes : Array(Types::Node)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::Node)? = nil
        )
        end
      end

      struct ListPackageImportJobsRequest
        include JSON::Serializable

        # The maximum number of package import jobs to return in one page of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPackageImportJobsResponse
        include JSON::Serializable

        # A list of package import jobs.
        @[JSON::Field(key: "PackageImportJobs")]
        getter package_import_jobs : Array(Types::PackageImportJob)

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @package_import_jobs : Array(Types::PackageImportJob),
          @next_token : String? = nil
        )
        end
      end

      struct ListPackagesRequest
        include JSON::Serializable

        # The maximum number of packages to return in one page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPackagesResponse
        include JSON::Serializable

        # A pagination token that's included if more results are available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of packages.
        @[JSON::Field(key: "Packages")]
        getter packages : Array(Types::PackageListItem)?

        def initialize(
          @next_token : String? = nil,
          @packages : Array(Types::PackageListItem)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource's ARN.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Parameter overrides for an application instance. This is a JSON document that has a single key (
      # PayloadData ) where the value is an escaped string representation of the overrides document.
      struct ManifestOverridesPayload
        include JSON::Serializable

        # The overrides document.
        @[JSON::Field(key: "PayloadData")]
        getter payload_data : String?

        def initialize(
          @payload_data : String? = nil
        )
        end
      end

      # A application verion's manifest file. This is a JSON document that has a single key ( PayloadData )
      # where the value is an escaped string representation of the application manifest ( graph.json ). This
      # file is located in the graphs folder in your application source.
      struct ManifestPayload
        include JSON::Serializable

        # The application manifest.
        @[JSON::Field(key: "PayloadData")]
        getter payload_data : String?

        def initialize(
          @payload_data : String? = nil
        )
        end
      end

      # The network configuration for a device.
      struct NetworkPayload
        include JSON::Serializable

        # Settings for Ethernet port 0.
        @[JSON::Field(key: "Ethernet0")]
        getter ethernet0 : Types::EthernetPayload?

        # Settings for Ethernet port 1.
        @[JSON::Field(key: "Ethernet1")]
        getter ethernet1 : Types::EthernetPayload?

        # Network time protocol (NTP) server settings.
        @[JSON::Field(key: "Ntp")]
        getter ntp : Types::NtpPayload?

        def initialize(
          @ethernet0 : Types::EthernetPayload? = nil,
          @ethernet1 : Types::EthernetPayload? = nil,
          @ntp : Types::NtpPayload? = nil
        )
        end
      end

      # The network status of a device.
      struct NetworkStatus
        include JSON::Serializable

        # The status of Ethernet port 0.
        @[JSON::Field(key: "Ethernet0Status")]
        getter ethernet0_status : Types::EthernetStatus?

        # The status of Ethernet port 1.
        @[JSON::Field(key: "Ethernet1Status")]
        getter ethernet1_status : Types::EthernetStatus?

        # When the network status changed.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # Details about a network time protocol (NTP) server connection.
        @[JSON::Field(key: "NtpStatus")]
        getter ntp_status : Types::NtpStatus?

        def initialize(
          @ethernet0_status : Types::EthernetStatus? = nil,
          @ethernet1_status : Types::EthernetStatus? = nil,
          @last_updated_time : Time? = nil,
          @ntp_status : Types::NtpStatus? = nil
        )
        end
      end

      # An application node that represents a camera stream, a model, code, or output.
      struct Node
        include JSON::Serializable

        # The node's category.
        @[JSON::Field(key: "Category")]
        getter category : String

        # When the node was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The node's name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The node's ID.
        @[JSON::Field(key: "NodeId")]
        getter node_id : String

        # The node's package ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # The node's package name.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # The node's package version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # The node's patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String

        # The node's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The account ID of the node's owner.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The node's ARN.
        @[JSON::Field(key: "PackageArn")]
        getter package_arn : String?

        def initialize(
          @category : String,
          @created_time : Time,
          @name : String,
          @node_id : String,
          @package_id : String,
          @package_name : String,
          @package_version : String,
          @patch_version : String,
          @description : String? = nil,
          @owner_account : String? = nil,
          @package_arn : String? = nil
        )
        end
      end

      # A job to create a camera stream node.
      struct NodeFromTemplateJob
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The node's name.
        @[JSON::Field(key: "NodeName")]
        getter node_name : String?

        # The job's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The job's status message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The job's template type.
        @[JSON::Field(key: "TemplateType")]
        getter template_type : String?

        def initialize(
          @created_time : Time? = nil,
          @job_id : String? = nil,
          @node_name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @template_type : String? = nil
        )
        end
      end

      # A node input port.
      struct NodeInputPort
        include JSON::Serializable

        # The input port's default value.
        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The input port's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The input port's max connections.
        @[JSON::Field(key: "MaxConnections")]
        getter max_connections : Int32?

        # The input port's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The input port's type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @default_value : String? = nil,
          @description : String? = nil,
          @max_connections : Int32? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A node instance.
      struct NodeInstance
        include JSON::Serializable

        # The instance's current status.
        @[JSON::Field(key: "CurrentStatus")]
        getter current_status : String

        # The instance's ID.
        @[JSON::Field(key: "NodeInstanceId")]
        getter node_instance_id : String

        # The node's ID.
        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        # The instance's name.
        @[JSON::Field(key: "NodeName")]
        getter node_name : String?

        # The instance's package name.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String?

        # The instance's package patch version.
        @[JSON::Field(key: "PackagePatchVersion")]
        getter package_patch_version : String?

        # The instance's package version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String?

        def initialize(
          @current_status : String,
          @node_instance_id : String,
          @node_id : String? = nil,
          @node_name : String? = nil,
          @package_name : String? = nil,
          @package_patch_version : String? = nil,
          @package_version : String? = nil
        )
        end
      end

      # A node interface.
      struct NodeInterface
        include JSON::Serializable

        # The node interface's inputs.
        @[JSON::Field(key: "Inputs")]
        getter inputs : Array(Types::NodeInputPort)

        # The node interface's outputs.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::NodeOutputPort)

        def initialize(
          @inputs : Array(Types::NodeInputPort),
          @outputs : Array(Types::NodeOutputPort)
        )
        end
      end

      # A node output port.
      struct NodeOutputPort
        include JSON::Serializable

        # The output port's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The output port's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The output port's type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A signal to a camera node to start or stop processing video.
      struct NodeSignal
        include JSON::Serializable

        # The camera node's name, from the application manifest.
        @[JSON::Field(key: "NodeInstanceId")]
        getter node_instance_id : String

        # The signal value.
        @[JSON::Field(key: "Signal")]
        getter signal : String

        def initialize(
          @node_instance_id : String,
          @signal : String
        )
        end
      end

      # Network time protocol (NTP) server settings. Use this option to connect to local NTP servers instead
      # of pool.ntp.org .
      struct NtpPayload
        include JSON::Serializable

        # NTP servers to use, in order of preference.
        @[JSON::Field(key: "NtpServers")]
        getter ntp_servers : Array(String)

        def initialize(
          @ntp_servers : Array(String)
        )
        end
      end

      # Details about an NTP server connection.
      struct NtpStatus
        include JSON::Serializable

        # The connection's status.
        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : String?

        # The IP address of the server.
        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The domain name of the server.
        @[JSON::Field(key: "NtpServerName")]
        getter ntp_server_name : String?

        def initialize(
          @connection_status : String? = nil,
          @ip_address : String? = nil,
          @ntp_server_name : String? = nil
        )
        end
      end

      # An over-the-air update (OTA) job configuration.
      struct OTAJobConfig
        include JSON::Serializable

        # The target version of the device software.
        @[JSON::Field(key: "ImageVersion")]
        getter image_version : String

        # Whether to apply the update if it is a major version change.
        @[JSON::Field(key: "AllowMajorVersionUpdate")]
        getter allow_major_version_update : Bool?

        def initialize(
          @image_version : String,
          @allow_major_version_update : Bool? = nil
        )
        end
      end

      # The location of an output object in Amazon S3.
      struct OutPutS3Location
        include JSON::Serializable

        # The object's bucket.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The object's key.
        @[JSON::Field(key: "ObjectKey")]
        getter object_key : String

        def initialize(
          @bucket_name : String,
          @object_key : String
        )
        end
      end

      # A job to import a package version.
      struct PackageImportJob
        include JSON::Serializable

        # When the job was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The job's ID.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The job's type.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # When the job was updated.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The job's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The job's status message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @created_time : Time? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil,
          @last_updated_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A configuration for a package import job.
      struct PackageImportJobInputConfig
        include JSON::Serializable

        # The package version's input configuration.
        @[JSON::Field(key: "PackageVersionInputConfig")]
        getter package_version_input_config : Types::PackageVersionInputConfig?

        def initialize(
          @package_version_input_config : Types::PackageVersionInputConfig? = nil
        )
        end
      end

      # Results of a package import job.
      struct PackageImportJobOutput
        include JSON::Serializable

        # The package's output location.
        @[JSON::Field(key: "OutputS3Location")]
        getter output_s3_location : Types::OutPutS3Location

        # The package's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # The package's version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # The package's patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String

        def initialize(
          @output_s3_location : Types::OutPutS3Location,
          @package_id : String,
          @package_version : String,
          @patch_version : String
        )
        end
      end

      # An output configuration for a package import job.
      struct PackageImportJobOutputConfig
        include JSON::Serializable

        # The package version's output configuration.
        @[JSON::Field(key: "PackageVersionOutputConfig")]
        getter package_version_output_config : Types::PackageVersionOutputConfig?

        def initialize(
          @package_version_output_config : Types::PackageVersionOutputConfig? = nil
        )
        end
      end

      # A package summary.
      struct PackageListItem
        include JSON::Serializable

        # The package's ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # When the package was created.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The package's ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String?

        # The package's name.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String?

        # The package's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @package_id : String? = nil,
          @package_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A package object.
      struct PackageObject
        include JSON::Serializable

        # The object's name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The object's package version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # The object's patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String

        def initialize(
          @name : String,
          @package_version : String,
          @patch_version : String
        )
        end
      end

      # A package version input configuration.
      struct PackageVersionInputConfig
        include JSON::Serializable

        # A location in Amazon S3.
        @[JSON::Field(key: "S3Location")]
        getter s3_location : Types::S3Location

        def initialize(
          @s3_location : Types::S3Location
        )
        end
      end

      # A package version output configuration.
      struct PackageVersionOutputConfig
        include JSON::Serializable

        # The output's package name.
        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # The output's package version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # Indicates that the version is recommended for all users.
        @[JSON::Field(key: "MarkLatest")]
        getter mark_latest : Bool?

        def initialize(
          @package_name : String,
          @package_version : String,
          @mark_latest : Bool? = nil
        )
        end
      end

      struct ProvisionDeviceRequest
        include JSON::Serializable

        # A name for the device.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A description for the device.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A networking configuration for the device.
        @[JSON::Field(key: "NetworkingConfiguration")]
        getter networking_configuration : Types::NetworkPayload?

        # Tags for the device.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @networking_configuration : Types::NetworkPayload? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ProvisionDeviceResponse
        include JSON::Serializable

        # The device's ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The device's status.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The device's configuration bundle.
        @[JSON::Field(key: "Certificates")]
        getter certificates : Bytes?

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The device's IoT thing name.
        @[JSON::Field(key: "IotThingName")]
        getter iot_thing_name : String?

        def initialize(
          @arn : String,
          @status : String,
          @certificates : Bytes? = nil,
          @device_id : String? = nil,
          @iot_thing_name : String? = nil
        )
        end
      end

      struct RegisterPackageVersionRequest
        include JSON::Serializable

        # A package ID.
        @[JSON::Field(key: "PackageId")]
        getter package_id : String

        # A package version.
        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String

        # A patch version.
        @[JSON::Field(key: "PatchVersion")]
        getter patch_version : String

        # Whether to mark the new version as the latest version.
        @[JSON::Field(key: "MarkLatest")]
        getter mark_latest : Bool?

        # An owner account.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        def initialize(
          @package_id : String,
          @package_version : String,
          @patch_version : String,
          @mark_latest : Bool? = nil,
          @owner_account : String? = nil
        )
        end
      end

      struct RegisterPackageVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct RemoveApplicationInstanceRequest
        include JSON::Serializable

        # An application instance ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        def initialize(
          @application_instance_id : String
        )
        end
      end

      struct RemoveApplicationInstanceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An application instance's state.
      struct ReportedRuntimeContextState
        include JSON::Serializable

        # The application's desired state.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String

        # The application's reported status.
        @[JSON::Field(key: "DeviceReportedStatus")]
        getter device_reported_status : String

        # When the device reported the application's state.
        @[JSON::Field(key: "DeviceReportedTime")]
        getter device_reported_time : Time

        # The device's name.
        @[JSON::Field(key: "RuntimeContextName")]
        getter runtime_context_name : String

        def initialize(
          @desired_state : String,
          @device_reported_status : String,
          @device_reported_time : Time,
          @runtime_context_name : String
        )
        end
      end

      # The target resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The resource's ID.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource's type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A location in Amazon S3.
      struct S3Location
        include JSON::Serializable

        # A bucket name.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # An object key.
        @[JSON::Field(key: "ObjectKey")]
        getter object_key : String

        # The bucket's Region.
        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @bucket_name : String,
          @object_key : String,
          @region : String? = nil
        )
        end
      end

      # The request would cause a limit to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the limit.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The name of the service.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The target resource's ID.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The target resource's type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct SignalApplicationInstanceNodeInstancesRequest
        include JSON::Serializable

        # An application instance ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        # A list of signals.
        @[JSON::Field(key: "NodeSignals")]
        getter node_signals : Array(Types::NodeSignal)

        def initialize(
          @application_instance_id : String,
          @node_signals : Array(Types::NodeSignal)
        )
        end
      end

      struct SignalApplicationInstanceNodeInstancesResponse
        include JSON::Serializable

        # An application instance ID.
        @[JSON::Field(key: "ApplicationInstanceId")]
        getter application_instance_id : String

        def initialize(
          @application_instance_id : String
        )
        end
      end

      # A static IP configuration.
      struct StaticIpConnectionInfo
        include JSON::Serializable

        # The connection's default gateway.
        @[JSON::Field(key: "DefaultGateway")]
        getter default_gateway : String

        # The connection's DNS address.
        @[JSON::Field(key: "Dns")]
        getter dns : Array(String)

        # The connection's IP address.
        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String

        # The connection's DNS mask.
        @[JSON::Field(key: "Mask")]
        getter mask : String

        def initialize(
          @default_gateway : String,
          @dns : Array(String),
          @ip_address : String,
          @mask : String
        )
        end
      end

      # A storage location.
      struct StorageLocation
        include JSON::Serializable

        # The location's binary prefix.
        @[JSON::Field(key: "BinaryPrefixLocation")]
        getter binary_prefix_location : String

        # The location's bucket.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The location's generated prefix.
        @[JSON::Field(key: "GeneratedPrefixLocation")]
        getter generated_prefix_location : String

        # The location's manifest prefix.
        @[JSON::Field(key: "ManifestPrefixLocation")]
        getter manifest_prefix_location : String

        # The location's repo prefix.
        @[JSON::Field(key: "RepoPrefixLocation")]
        getter repo_prefix_location : String

        def initialize(
          @binary_prefix_location : String,
          @bucket : String,
          @generated_prefix_location : String,
          @manifest_prefix_location : String,
          @repo_prefix_location : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The resource's ARN.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Tags for the resource.
        @[JSON::Field(key: "Tags")]
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

      struct UntagResourceRequest
        include JSON::Serializable

        # The resource's ARN.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Tag keys to remove.
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

      struct UpdateDeviceMetadataRequest
        include JSON::Serializable

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # A description for the device.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @device_id : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateDeviceMetadataResponse
        include JSON::Serializable

        # The device's ID.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        def initialize(
          @device_id : String? = nil
        )
        end
      end

      # The request contains an invalid parameter value.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # A list of attributes that led to the exception and their values.
        @[JSON::Field(key: "ErrorArguments")]
        getter error_arguments : Array(Types::ValidationExceptionErrorArgument)?

        # A unique ID for the error.
        @[JSON::Field(key: "ErrorId")]
        getter error_id : String?

        # A list of request parameters that failed validation.
        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # The reason that validation failed.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @error_arguments : Array(Types::ValidationExceptionErrorArgument)? = nil,
          @error_id : String? = nil,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # A validation exception error argument.
      struct ValidationExceptionErrorArgument
        include JSON::Serializable

        # The argument's name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The argument's value.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # A validation exception field.
      struct ValidationExceptionField
        include JSON::Serializable

        # The field's message.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The field's name.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
