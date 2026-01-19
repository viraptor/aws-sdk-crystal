require "json"
require "time"

module AwsSdk
  module WorkSpacesThinClient
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the resource associated with the request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource associated with the request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct CreateEnvironmentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the desktop to stream from Amazon WorkSpaces, WorkSpaces Secure
        # Browser, or AppStream 2.0.
        @[JSON::Field(key: "desktopArn")]
        getter desktop_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ID of the software set to apply.
        @[JSON::Field(key: "desiredSoftwareSetId")]
        getter desired_software_set_id : String?

        # The URL for the identity provider login (only for environments that use AppStream 2.0).
        @[JSON::Field(key: "desktopEndpoint")]
        getter desktop_endpoint : String?

        # A map of the key-value pairs of the tag or tags to assign to the newly created devices for this
        # environment.
        @[JSON::Field(key: "deviceCreationTags")]
        getter device_creation_tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the Key Management Service key to use to encrypt the environment.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # A specification for a time window to apply software updates.
        @[JSON::Field(key: "maintenanceWindow")]
        getter maintenance_window : Types::MaintenanceWindow?

        # The name for the environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An option to define which software updates to apply.
        @[JSON::Field(key: "softwareSetUpdateMode")]
        getter software_set_update_mode : String?

        # An option to define if software updates should be applied within a maintenance window.
        @[JSON::Field(key: "softwareSetUpdateSchedule")]
        getter software_set_update_schedule : String?

        # A map of the key-value pairs of the tag or tags to assign to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @desktop_arn : String,
          @client_token : String? = nil,
          @desired_software_set_id : String? = nil,
          @desktop_endpoint : String? = nil,
          @device_creation_tags : Hash(String, String)? = nil,
          @kms_key_arn : String? = nil,
          @maintenance_window : Types::MaintenanceWindow? = nil,
          @name : String? = nil,
          @software_set_update_mode : String? = nil,
          @software_set_update_schedule : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateEnvironmentResponse
        include JSON::Serializable

        # Describes an environment.
        @[JSON::Field(key: "environment")]
        getter environment : Types::EnvironmentSummary?

        def initialize(
          @environment : Types::EnvironmentSummary? = nil
        )
        end
      end

      struct DeleteDeviceRequest
        include JSON::Serializable

        # The ID of the device to delete.
        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEnvironmentRequest
        include JSON::Serializable

        # The ID of the environment to delete.
        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeregisterDeviceRequest
        include JSON::Serializable

        # The ID of the device to deregister.
        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The desired new status for the device.
        @[JSON::Field(key: "targetDeviceStatus")]
        getter target_device_status : String?

        def initialize(
          @id : String,
          @client_token : String? = nil,
          @target_device_status : String? = nil
        )
        end
      end

      struct DeregisterDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a thin client device.
      struct Device
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the device.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp of when the device was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the software set currently installed on the device.
        @[JSON::Field(key: "currentSoftwareSetId")]
        getter current_software_set_id : String?

        # The version of the software set currently installed on the device.
        @[JSON::Field(key: "currentSoftwareSetVersion")]
        getter current_software_set_version : String?

        # The ID of the software set which the device has been set to.
        @[JSON::Field(key: "desiredSoftwareSetId")]
        getter desired_software_set_id : String?

        # The ID of the environment the device is associated with.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The ID of the device.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the Key Management Service key used to encrypt the device.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The timestamp of the most recent session on the device.
        @[JSON::Field(key: "lastConnectedAt")]
        getter last_connected_at : Time?

        # The timestamp of the most recent check-in of the device.
        @[JSON::Field(key: "lastPostureAt")]
        getter last_posture_at : Time?

        # The user ID of the most recent session on the device.
        @[JSON::Field(key: "lastUserId")]
        getter last_user_id : String?

        # The model number of the device.
        @[JSON::Field(key: "model")]
        getter model : String?

        # The name of the device.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the software set that is pending to be installed on the device.
        @[JSON::Field(key: "pendingSoftwareSetId")]
        getter pending_software_set_id : String?

        # The version of the software set that is pending to be installed on the device.
        @[JSON::Field(key: "pendingSoftwareSetVersion")]
        getter pending_software_set_version : String?

        # The hardware serial number of the device.
        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?

        # Describes if the software currently installed on the device is a supported version.
        @[JSON::Field(key: "softwareSetComplianceStatus")]
        getter software_set_compliance_status : String?

        # An option to define if software updates should be applied within a maintenance window.
        @[JSON::Field(key: "softwareSetUpdateSchedule")]
        getter software_set_update_schedule : String?

        # Describes if the device has a supported version of software installed.
        @[JSON::Field(key: "softwareSetUpdateStatus")]
        getter software_set_update_status : String?

        # The status of the device.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp of when the device was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @current_software_set_id : String? = nil,
          @current_software_set_version : String? = nil,
          @desired_software_set_id : String? = nil,
          @environment_id : String? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @last_connected_at : Time? = nil,
          @last_posture_at : Time? = nil,
          @last_user_id : String? = nil,
          @model : String? = nil,
          @name : String? = nil,
          @pending_software_set_id : String? = nil,
          @pending_software_set_version : String? = nil,
          @serial_number : String? = nil,
          @software_set_compliance_status : String? = nil,
          @software_set_update_schedule : String? = nil,
          @software_set_update_status : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Describes a thin client device.
      struct DeviceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the device.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp of when the device was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the software set currently installed on the device.
        @[JSON::Field(key: "currentSoftwareSetId")]
        getter current_software_set_id : String?

        # The ID of the software set which the device has been set to.
        @[JSON::Field(key: "desiredSoftwareSetId")]
        getter desired_software_set_id : String?

        # The ID of the environment the device is associated with.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The ID of the device.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of the most recent session on the device.
        @[JSON::Field(key: "lastConnectedAt")]
        getter last_connected_at : Time?

        # The timestamp of the most recent check-in of the device.
        @[JSON::Field(key: "lastPostureAt")]
        getter last_posture_at : Time?

        # The user ID of the most recent session on the device.
        @[JSON::Field(key: "lastUserId")]
        getter last_user_id : String?

        # The model number of the device.
        @[JSON::Field(key: "model")]
        getter model : String?

        # The name of the device.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the software set that is pending to be installed on the device.
        @[JSON::Field(key: "pendingSoftwareSetId")]
        getter pending_software_set_id : String?

        # The hardware serial number of the device.
        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?

        # An option to define if software updates should be applied within a maintenance window.
        @[JSON::Field(key: "softwareSetUpdateSchedule")]
        getter software_set_update_schedule : String?

        # The status of the device.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp of when the device was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @current_software_set_id : String? = nil,
          @desired_software_set_id : String? = nil,
          @environment_id : String? = nil,
          @id : String? = nil,
          @last_connected_at : Time? = nil,
          @last_posture_at : Time? = nil,
          @last_user_id : String? = nil,
          @model : String? = nil,
          @name : String? = nil,
          @pending_software_set_id : String? = nil,
          @serial_number : String? = nil,
          @software_set_update_schedule : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Describes an environment.
      struct Environment
        include JSON::Serializable

        # The activation code to register a device to the environment.
        @[JSON::Field(key: "activationCode")]
        getter activation_code : String?

        # The Amazon Resource Name (ARN) of the environment.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp of when the environment was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the software set to apply.
        @[JSON::Field(key: "desiredSoftwareSetId")]
        getter desired_software_set_id : String?

        # The Amazon Resource Name (ARN) of the desktop to stream from Amazon WorkSpaces, WorkSpaces Secure
        # Browser, or AppStream 2.0.
        @[JSON::Field(key: "desktopArn")]
        getter desktop_arn : String?

        # The URL for the identity provider login (only for environments that use AppStream 2.0).
        @[JSON::Field(key: "desktopEndpoint")]
        getter desktop_endpoint : String?

        # The type of streaming desktop for the environment.
        @[JSON::Field(key: "desktopType")]
        getter desktop_type : String?

        # The tag keys and optional values for the newly created devices for this environment.
        @[JSON::Field(key: "deviceCreationTags")]
        getter device_creation_tags : Hash(String, String)?

        # The ID of the environment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the Key Management Service key used to encrypt the environment.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # A specification for a time window to apply software updates.
        @[JSON::Field(key: "maintenanceWindow")]
        getter maintenance_window : Types::MaintenanceWindow?

        # The name of the environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the software set that is pending to be installed.
        @[JSON::Field(key: "pendingSoftwareSetId")]
        getter pending_software_set_id : String?

        # The version of the software set that is pending to be installed.
        @[JSON::Field(key: "pendingSoftwareSetVersion")]
        getter pending_software_set_version : String?

        # The number of devices registered to the environment.
        @[JSON::Field(key: "registeredDevicesCount")]
        getter registered_devices_count : Int32?

        # Describes if the software currently installed on all devices in the environment is a supported
        # version.
        @[JSON::Field(key: "softwareSetComplianceStatus")]
        getter software_set_compliance_status : String?

        # An option to define which software updates to apply.
        @[JSON::Field(key: "softwareSetUpdateMode")]
        getter software_set_update_mode : String?

        # An option to define if software updates should be applied within a maintenance window.
        @[JSON::Field(key: "softwareSetUpdateSchedule")]
        getter software_set_update_schedule : String?

        # The timestamp of when the device was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @activation_code : String? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @desired_software_set_id : String? = nil,
          @desktop_arn : String? = nil,
          @desktop_endpoint : String? = nil,
          @desktop_type : String? = nil,
          @device_creation_tags : Hash(String, String)? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @maintenance_window : Types::MaintenanceWindow? = nil,
          @name : String? = nil,
          @pending_software_set_id : String? = nil,
          @pending_software_set_version : String? = nil,
          @registered_devices_count : Int32? = nil,
          @software_set_compliance_status : String? = nil,
          @software_set_update_mode : String? = nil,
          @software_set_update_schedule : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Describes an environment.
      struct EnvironmentSummary
        include JSON::Serializable

        # The activation code to register a device to the environment.
        @[JSON::Field(key: "activationCode")]
        getter activation_code : String?

        # The Amazon Resource Name (ARN) of the environment.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp of when the environment was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the software set to apply.
        @[JSON::Field(key: "desiredSoftwareSetId")]
        getter desired_software_set_id : String?

        # The Amazon Resource Name (ARN) of the desktop to stream from Amazon WorkSpaces, WorkSpaces Secure
        # Browser, or AppStream 2.0.
        @[JSON::Field(key: "desktopArn")]
        getter desktop_arn : String?

        # The URL for the identity provider login (only for environments that use AppStream 2.0).
        @[JSON::Field(key: "desktopEndpoint")]
        getter desktop_endpoint : String?

        # The type of streaming desktop for the environment.
        @[JSON::Field(key: "desktopType")]
        getter desktop_type : String?

        # The ID of the environment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # A specification for a time window to apply software updates.
        @[JSON::Field(key: "maintenanceWindow")]
        getter maintenance_window : Types::MaintenanceWindow?

        # The name of the environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the software set that is pending to be installed.
        @[JSON::Field(key: "pendingSoftwareSetId")]
        getter pending_software_set_id : String?

        # An option to define which software updates to apply.
        @[JSON::Field(key: "softwareSetUpdateMode")]
        getter software_set_update_mode : String?

        # An option to define if software updates should be applied within a maintenance window.
        @[JSON::Field(key: "softwareSetUpdateSchedule")]
        getter software_set_update_schedule : String?

        # The timestamp of when the device was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @activation_code : String? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @desired_software_set_id : String? = nil,
          @desktop_arn : String? = nil,
          @desktop_endpoint : String? = nil,
          @desktop_type : String? = nil,
          @id : String? = nil,
          @maintenance_window : Types::MaintenanceWindow? = nil,
          @name : String? = nil,
          @pending_software_set_id : String? = nil,
          @software_set_update_mode : String? = nil,
          @software_set_update_schedule : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetDeviceRequest
        include JSON::Serializable

        # The ID of the device for which to return information.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetDeviceResponse
        include JSON::Serializable

        # Describes an device.
        @[JSON::Field(key: "device")]
        getter device : Types::Device?

        def initialize(
          @device : Types::Device? = nil
        )
        end
      end

      struct GetEnvironmentRequest
        include JSON::Serializable

        # The ID of the environment for which to return information.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetEnvironmentResponse
        include JSON::Serializable

        # Describes an environment.
        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end

      struct GetSoftwareSetRequest
        include JSON::Serializable

        # The ID of the software set for which to return information.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetSoftwareSetResponse
        include JSON::Serializable

        # Describes a software set.
        @[JSON::Field(key: "softwareSet")]
        getter software_set : Types::SoftwareSet?

        def initialize(
          @software_set : Types::SoftwareSet? = nil
        )
        end
      end

      # The server encountered an internal error and is unable to complete the request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The number of seconds to wait before retrying the next request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListDevicesRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDevicesResponse
        include JSON::Serializable

        # Describes devices.
        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::DeviceSummary)?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @devices : Array(Types::DeviceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentsRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentsResponse
        include JSON::Serializable

        # Describes environments.
        @[JSON::Field(key: "environments")]
        getter environments : Array(Types::EnvironmentSummary)?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(Types::EnvironmentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSoftwareSetsRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSoftwareSetsResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Describes software sets.
        @[JSON::Field(key: "softwareSets")]
        getter software_sets : Array(Types::SoftwareSetSummary)?

        def initialize(
          @next_token : String? = nil,
          @software_sets : Array(Types::SoftwareSetSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to retrieve tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes the maintenance window for a thin client device.
      struct MaintenanceWindow
        include JSON::Serializable

        # An option to select the default or custom maintenance window.
        @[JSON::Field(key: "type")]
        getter type : String

        # The option to set the maintenance window during the device local time or Universal Coordinated Time
        # (UTC).
        @[JSON::Field(key: "applyTimeOf")]
        getter apply_time_of : String?

        # The days of the week during which the maintenance window is open.
        @[JSON::Field(key: "daysOfTheWeek")]
        getter days_of_the_week : Array(String)?

        # The hour for the maintenance window end ( 00 - 23 ).
        @[JSON::Field(key: "endTimeHour")]
        getter end_time_hour : Int32?

        # The minutes for the maintenance window end ( 00 - 59 ).
        @[JSON::Field(key: "endTimeMinute")]
        getter end_time_minute : Int32?

        # The hour for the maintenance window start ( 00 - 23 ).
        @[JSON::Field(key: "startTimeHour")]
        getter start_time_hour : Int32?

        # The minutes past the hour for the maintenance window start ( 00 - 59 ).
        @[JSON::Field(key: "startTimeMinute")]
        getter start_time_minute : Int32?

        def initialize(
          @type : String,
          @apply_time_of : String? = nil,
          @days_of_the_week : Array(String)? = nil,
          @end_time_hour : Int32? = nil,
          @end_time_minute : Int32? = nil,
          @start_time_hour : Int32? = nil,
          @start_time_minute : Int32? = nil
        )
        end
      end

      # The resource specified in the request was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the resource associated with the request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource associated with the request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Your request exceeds a service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The code for the quota in Service Quotas .
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The ID of the resource that exceeds the service quota.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that exceeds the service quota.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The code for the service in Service Quotas .
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Describes software.
      struct Software
        include JSON::Serializable

        # The name of the software component.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the software component.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Describes a software set.
      struct SoftwareSet
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the software set.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the software set.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of when the software set was released.
        @[JSON::Field(key: "releasedAt")]
        getter released_at : Time?

        # A list of the software components in the software set.
        @[JSON::Field(key: "software")]
        getter software : Array(Types::Software)?

        # The timestamp of the end of support for the software set.
        @[JSON::Field(key: "supportedUntil")]
        getter supported_until : Time?

        # An option to define if the software set has been validated.
        @[JSON::Field(key: "validationStatus")]
        getter validation_status : String?

        # The version of the software set.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @released_at : Time? = nil,
          @software : Array(Types::Software)? = nil,
          @supported_until : Time? = nil,
          @validation_status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Describes a software set.
      struct SoftwareSetSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the software set.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the software set.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of when the software set was released.
        @[JSON::Field(key: "releasedAt")]
        getter released_at : Time?

        # The timestamp of the end of support for the software set.
        @[JSON::Field(key: "supportedUntil")]
        getter supported_until : Time?

        # An option to define if the software set has been validated.
        @[JSON::Field(key: "validationStatus")]
        getter validation_status : String?

        # The version of the software set.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @released_at : Time? = nil,
          @supported_until : Time? = nil,
          @validation_status : String? = nil,
          @version : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A map of the key-value pairs of the tag or tags to assign to the resource.
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The code for the quota in Service Quotas .
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds to wait before retrying the next request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The code for the service in Service Quotas .
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to untag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the key-value pairs for the tag or tags you want to remove from the specified resource.
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

      struct UpdateDeviceRequest
        include JSON::Serializable

        # The ID of the device to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the software set to apply.
        @[JSON::Field(key: "desiredSoftwareSetId")]
        getter desired_software_set_id : String?

        # The name of the device to update.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An option to define if software updates should be applied within a maintenance window.
        @[JSON::Field(key: "softwareSetUpdateSchedule")]
        getter software_set_update_schedule : String?

        def initialize(
          @id : String,
          @desired_software_set_id : String? = nil,
          @name : String? = nil,
          @software_set_update_schedule : String? = nil
        )
        end
      end

      struct UpdateDeviceResponse
        include JSON::Serializable

        # Describes a device.
        @[JSON::Field(key: "device")]
        getter device : Types::DeviceSummary?

        def initialize(
          @device : Types::DeviceSummary? = nil
        )
        end
      end

      struct UpdateEnvironmentRequest
        include JSON::Serializable

        # The ID of the environment to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the software set to apply.
        @[JSON::Field(key: "desiredSoftwareSetId")]
        getter desired_software_set_id : String?

        # The Amazon Resource Name (ARN) of the desktop to stream from Amazon WorkSpaces, WorkSpaces Secure
        # Browser, or AppStream 2.0.
        @[JSON::Field(key: "desktopArn")]
        getter desktop_arn : String?

        # The URL for the identity provider login (only for environments that use AppStream 2.0).
        @[JSON::Field(key: "desktopEndpoint")]
        getter desktop_endpoint : String?

        # A map of the key-value pairs of the tag or tags to assign to the newly created devices for this
        # environment.
        @[JSON::Field(key: "deviceCreationTags")]
        getter device_creation_tags : Hash(String, String)?

        # A specification for a time window to apply software updates.
        @[JSON::Field(key: "maintenanceWindow")]
        getter maintenance_window : Types::MaintenanceWindow?

        # The name of the environment to update.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An option to define which software updates to apply.
        @[JSON::Field(key: "softwareSetUpdateMode")]
        getter software_set_update_mode : String?

        # An option to define if software updates should be applied within a maintenance window.
        @[JSON::Field(key: "softwareSetUpdateSchedule")]
        getter software_set_update_schedule : String?

        def initialize(
          @id : String,
          @desired_software_set_id : String? = nil,
          @desktop_arn : String? = nil,
          @desktop_endpoint : String? = nil,
          @device_creation_tags : Hash(String, String)? = nil,
          @maintenance_window : Types::MaintenanceWindow? = nil,
          @name : String? = nil,
          @software_set_update_mode : String? = nil,
          @software_set_update_schedule : String? = nil
        )
        end
      end

      struct UpdateEnvironmentResponse
        include JSON::Serializable

        # Describes an environment.
        @[JSON::Field(key: "environment")]
        getter environment : Types::EnvironmentSummary?

        def initialize(
          @environment : Types::EnvironmentSummary? = nil
        )
        end
      end

      struct UpdateSoftwareSetRequest
        include JSON::Serializable

        # The ID of the software set to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # An option to define if the software set has been validated.
        @[JSON::Field(key: "validationStatus")]
        getter validation_status : String

        def initialize(
          @id : String,
          @validation_status : String
        )
        end
      end

      struct UpdateSoftwareSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input fails to satisfy the specified constraints.
      struct ValidationException
        include JSON::Serializable

        # A list of fields that didn't validate.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        @[JSON::Field(key: "message")]
        getter message : String?

        # The reason for the exception.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Describes a validation exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # A message that describes the reason for the exception.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the exception.
        @[JSON::Field(key: "name")]
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
