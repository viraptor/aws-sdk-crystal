require "json"
require "time"

module AwsSdk
  module AppStream
    module Types

      # Describes an interface VPC endpoint (interface endpoint) that lets you create a private connection
      # between the virtual private cloud (VPC) that you specify and WorkSpaces Applications. When you
      # specify an interface endpoint for a stack, users of the stack can connect to WorkSpaces Applications
      # only through that endpoint. When you specify an interface endpoint for an image builder,
      # administrators can connect to the image builder only through that endpoint.

      struct AccessEndpoint
        include JSON::Serializable

        # The type of interface endpoint.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String

        # The identifier (ID) of the VPC in which the interface endpoint is used.

        @[JSON::Field(key: "VpceId")]
        getter vpce_id : String?

        def initialize(
          @endpoint_type : String,
          @vpce_id : String? = nil
        )
        end
      end

      # The collection of license usage records.

      struct AdminAppLicenseUsageRecord
        include JSON::Serializable

        # The billing period for the license usage record.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String

        # The type of license (for example, Microsoft Office).

        @[JSON::Field(key: "LicenseType")]
        getter license_type : String

        # The account ID of the owner of the license.

        @[JSON::Field(key: "OwnerAWSAccountId")]
        getter owner_aws_account_id : String

        # The date and time when the license was first used.

        @[JSON::Field(key: "SubscriptionFirstUsedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter subscription_first_used_date : Time

        # The date and time when the license was last used.

        @[JSON::Field(key: "SubscriptionLastUsedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter subscription_last_used_date : Time

        # The ARN of the user who used the license-included application.

        @[JSON::Field(key: "UserArn")]
        getter user_arn : String

        # The ID of the user who used the license-included application.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @billing_period : String,
          @license_type : String,
          @owner_aws_account_id : String,
          @subscription_first_used_date : Time,
          @subscription_last_used_date : Time,
          @user_arn : String,
          @user_id : String
        )
        end
      end

      # Describes an app block. App blocks are a WorkSpaces Applications resource that stores the details
      # about the virtual hard disk in an S3 bucket. It also stores the setup script with details about how
      # to mount the virtual hard disk. The virtual hard disk includes the application binaries and other
      # files necessary to launch your applications. Multiple applications can be assigned to a single app
      # block. This is only supported for Elastic fleets.

      struct AppBlock
        include JSON::Serializable

        # The ARN of the app block.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the app block.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The errors of the app block.

        @[JSON::Field(key: "AppBlockErrors")]
        getter app_block_errors : Array(Types::ErrorDetails)?

        # The created time of the app block.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the app block.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the app block.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The packaging type of the app block.

        @[JSON::Field(key: "PackagingType")]
        getter packaging_type : String?

        # The post setup script details of the app block. This only applies to app blocks with PackagingType
        # APPSTREAM2 .

        @[JSON::Field(key: "PostSetupScriptDetails")]
        getter post_setup_script_details : Types::ScriptDetails?

        # The setup script details of the app block. This only applies to app blocks with PackagingType CUSTOM
        # .

        @[JSON::Field(key: "SetupScriptDetails")]
        getter setup_script_details : Types::ScriptDetails?

        # The source S3 location of the app block.

        @[JSON::Field(key: "SourceS3Location")]
        getter source_s3_location : Types::S3Location?

        # The state of the app block. An app block with WorkSpaces Applications packaging will be in the
        # INACTIVE state if no application package (VHD) is assigned to it. After an application package (VHD)
        # is created by an app block builder for an app block, it becomes ACTIVE . Custom app blocks are
        # always in the ACTIVE state and no action is required to use them.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String,
          @name : String,
          @app_block_errors : Array(Types::ErrorDetails)? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @packaging_type : String? = nil,
          @post_setup_script_details : Types::ScriptDetails? = nil,
          @setup_script_details : Types::ScriptDetails? = nil,
          @source_s3_location : Types::S3Location? = nil,
          @state : String? = nil
        )
        end
      end

      # Describes an app block builder.

      struct AppBlockBuilder
        include JSON::Serializable

        # The ARN of the app block builder.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The instance type of the app block builder.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # The name of the app block builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The platform of the app block builder. WINDOWS_SERVER_2019 is the only valid value.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The state of the app block builder.

        @[JSON::Field(key: "State")]
        getter state : String

        # The VPC configuration for the app block builder.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig

        # The list of interface VPC endpoint (interface endpoint) objects. Administrators can connect to the
        # app block builder only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The app block builder errors.

        @[JSON::Field(key: "AppBlockBuilderErrors")]
        getter app_block_builder_errors : Array(Types::ResourceError)?

        # The creation time of the app block builder.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the app block builder.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the app block builder.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Indicates whether default internet access is enabled for the app block builder.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The ARN of the IAM role that is applied to the app block builder.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The state change reason.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::AppBlockBuilderStateChangeReason?

        def initialize(
          @arn : String,
          @instance_type : String,
          @name : String,
          @platform : String,
          @state : String,
          @vpc_config : Types::VpcConfig,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @app_block_builder_errors : Array(Types::ResourceError)? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @enable_default_internet_access : Bool? = nil,
          @iam_role_arn : String? = nil,
          @state_change_reason : Types::AppBlockBuilderStateChangeReason? = nil
        )
        end
      end

      # Describes an association between an app block builder and app block.

      struct AppBlockBuilderAppBlockAssociation
        include JSON::Serializable

        # The ARN of the app block.

        @[JSON::Field(key: "AppBlockArn")]
        getter app_block_arn : String

        # The name of the app block builder.

        @[JSON::Field(key: "AppBlockBuilderName")]
        getter app_block_builder_name : String

        def initialize(
          @app_block_arn : String,
          @app_block_builder_name : String
        )
        end
      end

      # Describes the reason why the last app block builder state change occurred.

      struct AppBlockBuilderStateChangeReason
        include JSON::Serializable

        # The state change reason code.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The state change reason message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes an application in the application catalog.

      struct Application
        include JSON::Serializable

        # The app block ARN of the application.

        @[JSON::Field(key: "AppBlockArn")]
        getter app_block_arn : String?

        # The ARN of the application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the application was created within the app block.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The application name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # If there is a problem, the application can be disabled after image creation.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The S3 location of the application icon.

        @[JSON::Field(key: "IconS3Location")]
        getter icon_s3_location : Types::S3Location?

        # The URL for the application icon. This URL might be time-limited.

        @[JSON::Field(key: "IconURL")]
        getter icon_url : String?

        # The instance families for the application.

        @[JSON::Field(key: "InstanceFamilies")]
        getter instance_families : Array(String)?

        # The arguments that are passed to the application at launch.

        @[JSON::Field(key: "LaunchParameters")]
        getter launch_parameters : String?

        # The path to the application executable in the instance.

        @[JSON::Field(key: "LaunchPath")]
        getter launch_path : String?

        # Additional attributes that describe the application.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The platforms on which the application can run.

        @[JSON::Field(key: "Platforms")]
        getter platforms : Array(String)?

        # The working directory for the application.

        @[JSON::Field(key: "WorkingDirectory")]
        getter working_directory : String?

        def initialize(
          @app_block_arn : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @enabled : Bool? = nil,
          @icon_s3_location : Types::S3Location? = nil,
          @icon_url : String? = nil,
          @instance_families : Array(String)? = nil,
          @launch_parameters : String? = nil,
          @launch_path : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @name : String? = nil,
          @platforms : Array(String)? = nil,
          @working_directory : String? = nil
        )
        end
      end

      # Configuration for an application in the imported image's application catalog. This structure defines
      # how applications appear and launch for users.

      struct ApplicationConfig
        include JSON::Serializable

        # The absolute path to the executable file that launches the application. This is a required field
        # that can be 1-32767 characters to support Windows extended file paths. Use escaped file path strings
        # like "C:\\\\Windows\\\\System32\\\\notepad.exe".

        @[JSON::Field(key: "AbsoluteAppPath")]
        getter absolute_app_path : String

        # The name of the application. This is a required field that must be unique within the application
        # catalog and between 1-100 characters, matching the pattern ^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,99}$.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The absolute path to the icon file for the application. This field is optional and can be 1-32767
        # characters. If not provided, the icon is derived from the executable. Use PNG images with proper
        # transparency for the best user experience.

        @[JSON::Field(key: "AbsoluteIconPath")]
        getter absolute_icon_path : String?

        # The absolute path to the prewarm manifest file for this application. This field is optional and only
        # applicable when using application-specific manifests. The path can be 1-32767 characters and should
        # point to a text file containing file paths to prewarm.

        @[JSON::Field(key: "AbsoluteManifestPath")]
        getter absolute_manifest_path : String?

        # The display name shown to users for this application. This field is optional and can be 0-100
        # characters, matching the pattern ^[a-zA-Z0-9][a-zA-Z0-9_. -]{0,99}$.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The launch parameters to pass to the application executable. This field is optional and can be
        # 0-1024 characters. Use escaped strings with the full list of required parameters, such as PowerShell
        # script paths or command-line arguments.

        @[JSON::Field(key: "LaunchParameters")]
        getter launch_parameters : String?

        # The working directory to use when launching the application. This field is optional and can be
        # 0-32767 characters. Use escaped file path strings like "C:\\\\Path\\\\To\\\\Working\\\\Directory".

        @[JSON::Field(key: "WorkingDirectory")]
        getter working_directory : String?

        def initialize(
          @absolute_app_path : String,
          @name : String,
          @absolute_icon_path : String? = nil,
          @absolute_manifest_path : String? = nil,
          @display_name : String? = nil,
          @launch_parameters : String? = nil,
          @working_directory : String? = nil
        )
        end
      end

      # Describes the application fleet association.

      struct ApplicationFleetAssociation
        include JSON::Serializable

        # The ARN of the application associated with the fleet.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # The name of the fleet associated with the application.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        def initialize(
          @application_arn : String,
          @fleet_name : String
        )
        end
      end

      # The persistent application settings for users of a stack.

      struct ApplicationSettings
        include JSON::Serializable

        # Enables or disables persistent application settings for users during their streaming sessions.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The path prefix for the S3 bucket where users’ persistent application settings are stored. You can
        # allow the same persistent application settings to be used across multiple stacks by specifying the
        # same settings group for each stack.

        @[JSON::Field(key: "SettingsGroup")]
        getter settings_group : String?

        def initialize(
          @enabled : Bool,
          @settings_group : String? = nil
        )
        end
      end

      # Describes the persistent application settings for users of a stack.

      struct ApplicationSettingsResponse
        include JSON::Serializable

        # Specifies whether persistent application settings are enabled for users during their streaming
        # sessions.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The S3 bucket where users’ persistent application settings are stored. When persistent application
        # settings are enabled for the first time for an account in an AWS Region, an S3 bucket is created.
        # The bucket is unique to the AWS account and the Region.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The path prefix for the S3 bucket where users’ persistent application settings are stored.

        @[JSON::Field(key: "SettingsGroup")]
        getter settings_group : String?

        def initialize(
          @enabled : Bool? = nil,
          @s3_bucket_name : String? = nil,
          @settings_group : String? = nil
        )
        end
      end


      struct AssociateAppBlockBuilderAppBlockRequest
        include JSON::Serializable

        # The ARN of the app block.

        @[JSON::Field(key: "AppBlockArn")]
        getter app_block_arn : String

        # The name of the app block builder.

        @[JSON::Field(key: "AppBlockBuilderName")]
        getter app_block_builder_name : String

        def initialize(
          @app_block_arn : String,
          @app_block_builder_name : String
        )
        end
      end


      struct AssociateAppBlockBuilderAppBlockResult
        include JSON::Serializable

        # The list of app block builders associated with app blocks.

        @[JSON::Field(key: "AppBlockBuilderAppBlockAssociation")]
        getter app_block_builder_app_block_association : Types::AppBlockBuilderAppBlockAssociation?

        def initialize(
          @app_block_builder_app_block_association : Types::AppBlockBuilderAppBlockAssociation? = nil
        )
        end
      end


      struct AssociateApplicationFleetRequest
        include JSON::Serializable

        # The ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # The name of the fleet.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        def initialize(
          @application_arn : String,
          @fleet_name : String
        )
        end
      end


      struct AssociateApplicationFleetResult
        include JSON::Serializable

        # If fleet name is specified, this returns the list of applications that are associated to it. If
        # application ARN is specified, this returns the list of fleets to which it is associated.

        @[JSON::Field(key: "ApplicationFleetAssociation")]
        getter application_fleet_association : Types::ApplicationFleetAssociation?

        def initialize(
          @application_fleet_association : Types::ApplicationFleetAssociation? = nil
        )
        end
      end


      struct AssociateApplicationToEntitlementRequest
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The name of the entitlement.

        @[JSON::Field(key: "EntitlementName")]
        getter entitlement_name : String

        # The name of the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @application_identifier : String,
          @entitlement_name : String,
          @stack_name : String
        )
        end
      end


      struct AssociateApplicationToEntitlementResult
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateFleetRequest
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        # The name of the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @fleet_name : String,
          @stack_name : String
        )
        end
      end


      struct AssociateFleetResult
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateSoftwareToImageBuilderRequest
        include JSON::Serializable

        # The name of the target image builder instance.

        @[JSON::Field(key: "ImageBuilderName")]
        getter image_builder_name : String

        # The list of license included applications to associate with the image builder. Possible values
        # include the following: Microsoft_Office_2021_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2021_LTSC_Professional_Plus_64Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_64Bit Microsoft_Visio_2021_LTSC_Professional_32Bit
        # Microsoft_Visio_2021_LTSC_Professional_64Bit Microsoft_Visio_2024_LTSC_Professional_32Bit
        # Microsoft_Visio_2024_LTSC_Professional_64Bit Microsoft_Project_2021_Professional_32Bit
        # Microsoft_Project_2021_Professional_64Bit Microsoft_Project_2024_Professional_32Bit
        # Microsoft_Project_2024_Professional_64Bit Microsoft_Office_2021_LTSC_Standard_32Bit
        # Microsoft_Office_2021_LTSC_Standard_64Bit Microsoft_Office_2024_LTSC_Standard_32Bit
        # Microsoft_Office_2024_LTSC_Standard_64Bit Microsoft_Visio_2021_LTSC_Standard_32Bit
        # Microsoft_Visio_2021_LTSC_Standard_64Bit Microsoft_Visio_2024_LTSC_Standard_32Bit
        # Microsoft_Visio_2024_LTSC_Standard_64Bit Microsoft_Project_2021_Standard_32Bit
        # Microsoft_Project_2021_Standard_64Bit Microsoft_Project_2024_Standard_32Bit
        # Microsoft_Project_2024_Standard_64Bit

        @[JSON::Field(key: "SoftwareNames")]
        getter software_names : Array(String)

        def initialize(
          @image_builder_name : String,
          @software_names : Array(String)
        )
        end
      end


      struct AssociateSoftwareToImageBuilderResult
        include JSON::Serializable

        def initialize
        end
      end


      struct BatchAssociateUserStackRequest
        include JSON::Serializable

        # The list of UserStackAssociation objects.

        @[JSON::Field(key: "UserStackAssociations")]
        getter user_stack_associations : Array(Types::UserStackAssociation)

        def initialize(
          @user_stack_associations : Array(Types::UserStackAssociation)
        )
        end
      end


      struct BatchAssociateUserStackResult
        include JSON::Serializable

        # The list of UserStackAssociationError objects.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::UserStackAssociationError)?

        def initialize(
          @errors : Array(Types::UserStackAssociationError)? = nil
        )
        end
      end


      struct BatchDisassociateUserStackRequest
        include JSON::Serializable

        # The list of UserStackAssociation objects.

        @[JSON::Field(key: "UserStackAssociations")]
        getter user_stack_associations : Array(Types::UserStackAssociation)

        def initialize(
          @user_stack_associations : Array(Types::UserStackAssociation)
        )
        end
      end


      struct BatchDisassociateUserStackResult
        include JSON::Serializable

        # The list of UserStackAssociationError objects.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::UserStackAssociationError)?

        def initialize(
          @errors : Array(Types::UserStackAssociationError)? = nil
        )
        end
      end

      # The certificate-based authentication properties used to authenticate SAML 2.0 Identity Provider
      # (IdP) user identities to Active Directory domain-joined streaming instances. Fallback is turned on
      # by default when certificate-based authentication is Enabled . Fallback allows users to log in using
      # their AD domain password if certificate-based authentication is unsuccessful, or to unlock a desktop
      # lock screen. Enabled_no_directory_login_fallback enables certificate-based authentication, but does
      # not allow users to log in using their AD domain password. Users will be disconnected to
      # re-authenticate using certificates.

      struct CertificateBasedAuthProperties
        include JSON::Serializable

        # The ARN of the AWS Certificate Manager Private CA resource.

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The status of the certificate-based authentication properties.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @certificate_authority_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the capacity for a fleet.

      struct ComputeCapacity
        include JSON::Serializable

        # The desired number of streaming instances.

        @[JSON::Field(key: "DesiredInstances")]
        getter desired_instances : Int32?

        # The desired number of user sessions for a multi-session fleet. This is not allowed for
        # single-session fleets. When you create a fleet, you must set either the DesiredSessions or
        # DesiredInstances attribute, based on the type of fleet you create. You can’t define both attributes
        # or leave both attributes blank.

        @[JSON::Field(key: "DesiredSessions")]
        getter desired_sessions : Int32?

        def initialize(
          @desired_instances : Int32? = nil,
          @desired_sessions : Int32? = nil
        )
        end
      end

      # Describes the capacity status for a fleet.

      struct ComputeCapacityStatus
        include JSON::Serializable

        # The desired number of streaming instances.

        @[JSON::Field(key: "Desired")]
        getter desired : Int32

        # The number of user sessions currently being used for streaming sessions. This only applies to
        # multi-session fleets.

        @[JSON::Field(key: "ActiveUserSessions")]
        getter active_user_sessions : Int32?

        # The total number of session slots that are available for streaming or are currently streaming.
        # ActualUserSessionCapacity = AvailableUserSessionCapacity + ActiveUserSessions This only applies to
        # multi-session fleets.

        @[JSON::Field(key: "ActualUserSessions")]
        getter actual_user_sessions : Int32?

        # The number of currently available instances that can be used to stream sessions.

        @[JSON::Field(key: "Available")]
        getter available : Int32?

        # The number of idle session slots currently available for user sessions. AvailableUserSessionCapacity
        # = ActualUserSessionCapacity - ActiveUserSessions This only applies to multi-session fleets.

        @[JSON::Field(key: "AvailableUserSessions")]
        getter available_user_sessions : Int32?

        # The total number of sessions slots that are either running or pending. This represents the total
        # number of concurrent streaming sessions your fleet can support in a steady state.
        # DesiredUserSessionCapacity = ActualUserSessionCapacity + PendingUserSessionCapacity This only
        # applies to multi-session fleets.

        @[JSON::Field(key: "DesiredUserSessions")]
        getter desired_user_sessions : Int32?

        # The number of instances in use for streaming.

        @[JSON::Field(key: "InUse")]
        getter in_use : Int32?

        # The total number of simultaneous streaming instances that are running.

        @[JSON::Field(key: "Running")]
        getter running : Int32?

        def initialize(
          @desired : Int32,
          @active_user_sessions : Int32? = nil,
          @actual_user_sessions : Int32? = nil,
          @available : Int32? = nil,
          @available_user_sessions : Int32? = nil,
          @desired_user_sessions : Int32? = nil,
          @in_use : Int32? = nil,
          @running : Int32? = nil
        )
        end
      end

      # An API error occurred. Wait a few minutes and try again.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CopyImageRequest
        include JSON::Serializable

        # The name that the image will have when it is copied to the destination.

        @[JSON::Field(key: "DestinationImageName")]
        getter destination_image_name : String

        # The destination region to which the image will be copied. This parameter is required, even if you
        # are copying an image within the same region.

        @[JSON::Field(key: "DestinationRegion")]
        getter destination_region : String

        # The name of the image to copy.

        @[JSON::Field(key: "SourceImageName")]
        getter source_image_name : String

        # The description that the image will have when it is copied to the destination.

        @[JSON::Field(key: "DestinationImageDescription")]
        getter destination_image_description : String?

        def initialize(
          @destination_image_name : String,
          @destination_region : String,
          @source_image_name : String,
          @destination_image_description : String? = nil
        )
        end
      end


      struct CopyImageResponse
        include JSON::Serializable

        # The name of the destination image.

        @[JSON::Field(key: "DestinationImageName")]
        getter destination_image_name : String?

        def initialize(
          @destination_image_name : String? = nil
        )
        end
      end


      struct CreateAppBlockBuilderRequest
        include JSON::Serializable

        # The instance type to use when launching the app block builder. The following instance types are
        # available: stream.standard.small stream.standard.medium stream.standard.large stream.standard.xlarge
        # stream.standard.2xlarge

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # The unique name for the app block builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The platform of the app block builder. WINDOWS_SERVER_2019 is the only valid value.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The VPC configuration for the app block builder. App block builders require that you specify at
        # least two subnets in different availability zones.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig

        # The list of interface VPC endpoint (interface endpoint) objects. Administrators can connect to the
        # app block builder only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The description of the app block builder.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the app block builder.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Enables or disables default internet access for the app block builder.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The Amazon Resource Name (ARN) of the IAM role to apply to the app block builder. To assume a role,
        # the app block builder calls the AWS Security Token Service (STS) AssumeRole API operation and passes
        # the ARN of the role to use. The operation creates a new session with temporary credentials.
        # WorkSpaces Applications retrieves the temporary credentials and creates the appstream_machine_role
        # credential profile on the instance. For more information, see Using an IAM Role to Grant Permissions
        # to Applications and Scripts Running on WorkSpaces Applications Streaming Instances in the Amazon
        # WorkSpaces Applications Administration Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The tags to associate with the app block builder. A tag is a key-value pair, and the value is
        # optional. For example, Environment=Test. If you do not specify a value, Environment=. If you do not
        # specify a value, the value is set to an empty string. Generally allowed characters are: letters,
        # numbers, and spaces representable in UTF-8, and the following special characters: _ . : / = + \ - @
        # For more information, see Tagging Your Resources in the Amazon WorkSpaces Applications
        # Administration Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @instance_type : String,
          @name : String,
          @platform : String,
          @vpc_config : Types::VpcConfig,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @enable_default_internet_access : Bool? = nil,
          @iam_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAppBlockBuilderResult
        include JSON::Serializable


        @[JSON::Field(key: "AppBlockBuilder")]
        getter app_block_builder : Types::AppBlockBuilder?

        def initialize(
          @app_block_builder : Types::AppBlockBuilder? = nil
        )
        end
      end


      struct CreateAppBlockBuilderStreamingURLRequest
        include JSON::Serializable

        # The name of the app block builder.

        @[JSON::Field(key: "AppBlockBuilderName")]
        getter app_block_builder_name : String

        # The time that the streaming URL will be valid, in seconds. Specify a value between 1 and 604800
        # seconds. The default is 3600 seconds.

        @[JSON::Field(key: "Validity")]
        getter validity : Int64?

        def initialize(
          @app_block_builder_name : String,
          @validity : Int64? = nil
        )
        end
      end


      struct CreateAppBlockBuilderStreamingURLResult
        include JSON::Serializable

        # The elapsed time, in seconds after the Unix epoch, when this URL expires.

        @[JSON::Field(key: "Expires", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires : Time?

        # The URL to start the streaming session.

        @[JSON::Field(key: "StreamingURL")]
        getter streaming_url : String?

        def initialize(
          @expires : Time? = nil,
          @streaming_url : String? = nil
        )
        end
      end


      struct CreateAppBlockRequest
        include JSON::Serializable

        # The name of the app block.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The source S3 location of the app block.

        @[JSON::Field(key: "SourceS3Location")]
        getter source_s3_location : Types::S3Location

        # The description of the app block.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the app block. This is not displayed to the user.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The packaging type of the app block.

        @[JSON::Field(key: "PackagingType")]
        getter packaging_type : String?

        # The post setup script details of the app block. This can only be provided for the APPSTREAM2
        # PackagingType.

        @[JSON::Field(key: "PostSetupScriptDetails")]
        getter post_setup_script_details : Types::ScriptDetails?

        # The setup script details of the app block. This must be provided for the CUSTOM PackagingType.

        @[JSON::Field(key: "SetupScriptDetails")]
        getter setup_script_details : Types::ScriptDetails?

        # The tags assigned to the app block.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @source_s3_location : Types::S3Location,
          @description : String? = nil,
          @display_name : String? = nil,
          @packaging_type : String? = nil,
          @post_setup_script_details : Types::ScriptDetails? = nil,
          @setup_script_details : Types::ScriptDetails? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAppBlockResult
        include JSON::Serializable

        # The app block.

        @[JSON::Field(key: "AppBlock")]
        getter app_block : Types::AppBlock?

        def initialize(
          @app_block : Types::AppBlock? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # The app block ARN to which the application should be associated

        @[JSON::Field(key: "AppBlockArn")]
        getter app_block_arn : String

        # The location in S3 of the application icon.

        @[JSON::Field(key: "IconS3Location")]
        getter icon_s3_location : Types::S3Location

        # The instance families the application supports. Valid values are GENERAL_PURPOSE and GRAPHICS_G4.

        @[JSON::Field(key: "InstanceFamilies")]
        getter instance_families : Array(String)

        # The launch path of the application.

        @[JSON::Field(key: "LaunchPath")]
        getter launch_path : String

        # The name of the application. This name is visible to users when display name is not specified.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The platforms the application supports. WINDOWS_SERVER_2019, AMAZON_LINUX2 and UBUNTU_PRO_2404 are
        # supported for Elastic fleets.

        @[JSON::Field(key: "Platforms")]
        getter platforms : Array(String)

        # The description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the application. This name is visible to users in the application catalog.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The launch parameters of the application.

        @[JSON::Field(key: "LaunchParameters")]
        getter launch_parameters : String?

        # The tags assigned to the application.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The working directory of the application.

        @[JSON::Field(key: "WorkingDirectory")]
        getter working_directory : String?

        def initialize(
          @app_block_arn : String,
          @icon_s3_location : Types::S3Location,
          @instance_families : Array(String),
          @launch_path : String,
          @name : String,
          @platforms : Array(String),
          @description : String? = nil,
          @display_name : String? = nil,
          @launch_parameters : String? = nil,
          @tags : Hash(String, String)? = nil,
          @working_directory : String? = nil
        )
        end
      end


      struct CreateApplicationResult
        include JSON::Serializable


        @[JSON::Field(key: "Application")]
        getter application : Types::Application?

        def initialize(
          @application : Types::Application? = nil
        )
        end
      end


      struct CreateDirectoryConfigRequest
        include JSON::Serializable

        # The fully qualified name of the directory (for example, corp.example.com).

        @[JSON::Field(key: "DirectoryName")]
        getter directory_name : String

        # The distinguished names of the organizational units for computer accounts.

        @[JSON::Field(key: "OrganizationalUnitDistinguishedNames")]
        getter organizational_unit_distinguished_names : Array(String)

        # The certificate-based authentication properties used to authenticate SAML 2.0 Identity Provider
        # (IdP) user identities to Active Directory domain-joined streaming instances. Fallback is turned on
        # by default when certificate-based authentication is Enabled . Fallback allows users to log in using
        # their AD domain password if certificate-based authentication is unsuccessful, or to unlock a desktop
        # lock screen. Enabled_no_directory_login_fallback enables certificate-based authentication, but does
        # not allow users to log in using their AD domain password. Users will be disconnected to
        # re-authenticate using certificates.

        @[JSON::Field(key: "CertificateBasedAuthProperties")]
        getter certificate_based_auth_properties : Types::CertificateBasedAuthProperties?

        # The credentials for the service account used by the fleet or image builder to connect to the
        # directory.

        @[JSON::Field(key: "ServiceAccountCredentials")]
        getter service_account_credentials : Types::ServiceAccountCredentials?

        def initialize(
          @directory_name : String,
          @organizational_unit_distinguished_names : Array(String),
          @certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
          @service_account_credentials : Types::ServiceAccountCredentials? = nil
        )
        end
      end


      struct CreateDirectoryConfigResult
        include JSON::Serializable

        # Information about the directory configuration.

        @[JSON::Field(key: "DirectoryConfig")]
        getter directory_config : Types::DirectoryConfig?

        def initialize(
          @directory_config : Types::DirectoryConfig? = nil
        )
        end
      end


      struct CreateEntitlementRequest
        include JSON::Serializable

        # Specifies whether all or selected apps are entitled.

        @[JSON::Field(key: "AppVisibility")]
        getter app_visibility : String

        # The attributes of the entitlement.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::EntitlementAttribute)

        # The name of the entitlement.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the stack with which the entitlement is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The description of the entitlement.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @app_visibility : String,
          @attributes : Array(Types::EntitlementAttribute),
          @name : String,
          @stack_name : String,
          @description : String? = nil
        )
        end
      end


      struct CreateEntitlementResult
        include JSON::Serializable

        # The entitlement.

        @[JSON::Field(key: "Entitlement")]
        getter entitlement : Types::Entitlement?

        def initialize(
          @entitlement : Types::Entitlement? = nil
        )
        end
      end


      struct CreateExportImageTaskRequest
        include JSON::Serializable

        # The name for the exported EC2 AMI. This is a required field that must be unique within your account
        # and region.

        @[JSON::Field(key: "AmiName")]
        getter ami_name : String

        # The ARN of the IAM role that allows WorkSpaces Applications to create the AMI. The role must have
        # permissions to copy images, describe images, and create tags, with a trust relationship allowing
        # appstream.amazonaws.com to assume the role.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The name of the WorkSpaces Applications image to export. The image must be in an available state and
        # owned by your account.

        @[JSON::Field(key: "ImageName")]
        getter image_name : String

        # An optional description for the exported AMI. This description will be applied to the resulting EC2
        # AMI.

        @[JSON::Field(key: "AmiDescription")]
        getter ami_description : String?

        # The tags to apply to the exported AMI. These tags help you organize and manage your EC2 AMIs.

        @[JSON::Field(key: "TagSpecifications")]
        getter tag_specifications : Hash(String, String)?

        def initialize(
          @ami_name : String,
          @iam_role_arn : String,
          @image_name : String,
          @ami_description : String? = nil,
          @tag_specifications : Hash(String, String)? = nil
        )
        end
      end


      struct CreateExportImageTaskResult
        include JSON::Serializable

        # Information about the export image task that was created, including the task ID and initial state.

        @[JSON::Field(key: "ExportImageTask")]
        getter export_image_task : Types::ExportImageTask?

        def initialize(
          @export_image_task : Types::ExportImageTask? = nil
        )
        end
      end


      struct CreateFleetRequest
        include JSON::Serializable

        # The instance type to use when launching fleet instances. The following instance types are available:
        # stream.standard.small stream.standard.medium stream.standard.large stream.standard.xlarge
        # stream.standard.2xlarge stream.compute.large stream.compute.xlarge stream.compute.2xlarge
        # stream.compute.4xlarge stream.compute.8xlarge stream.memory.large stream.memory.xlarge
        # stream.memory.2xlarge stream.memory.4xlarge stream.memory.8xlarge stream.memory.z1d.large
        # stream.memory.z1d.xlarge stream.memory.z1d.2xlarge stream.memory.z1d.3xlarge
        # stream.memory.z1d.6xlarge stream.memory.z1d.12xlarge stream.graphics.g4dn.xlarge
        # stream.graphics.g4dn.2xlarge stream.graphics.g4dn.4xlarge stream.graphics.g4dn.8xlarge
        # stream.graphics.g4dn.12xlarge stream.graphics.g4dn.16xlarge stream.graphics.g5.xlarge
        # stream.graphics.g5.2xlarge stream.graphics.g5.4xlarge stream.graphics.g5.8xlarge
        # stream.graphics.g5.12xlarge stream.graphics.g5.16xlarge stream.graphics.g5.24xlarge
        # stream.graphics.g6.xlarge stream.graphics.g6.2xlarge stream.graphics.g6.4xlarge
        # stream.graphics.g6.8xlarge stream.graphics.g6.16xlarge stream.graphics.g6.12xlarge
        # stream.graphics.g6.24xlarge stream.graphics.gr6.4xlarge stream.graphics.gr6.8xlarge
        # stream.graphics.g6f.large stream.graphics.g6f.xlarge stream.graphics.g6f.2xlarge
        # stream.graphics.g6f.4xlarge stream.graphics.gr6f.4xlarge The following instance types are available
        # for Elastic fleets: stream.standard.small stream.standard.medium stream.standard.large
        # stream.standard.xlarge stream.standard.2xlarge

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # A unique name for the fleet.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The desired capacity for the fleet. This is not allowed for Elastic fleets. For Elastic fleets,
        # specify MaxConcurrentSessions instead.

        @[JSON::Field(key: "ComputeCapacity")]
        getter compute_capacity : Types::ComputeCapacity?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The amount of time that a streaming session remains active after users disconnect. If users try to
        # reconnect to the streaming session after a disconnection or network interruption within this time
        # interval, they are connected to their previous session. Otherwise, they are connected to a new
        # session with a new streaming instance. Specify a value between 60 and 36000.

        @[JSON::Field(key: "DisconnectTimeoutInSeconds")]
        getter disconnect_timeout_in_seconds : Int32?

        # The fleet name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name of the directory and organizational unit (OU) to use to join the fleet to a Microsoft
        # Active Directory domain. This is not allowed for Elastic fleets.

        @[JSON::Field(key: "DomainJoinInfo")]
        getter domain_join_info : Types::DomainJoinInfo?

        # Enables or disables default internet access for the fleet.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The fleet type. ALWAYS_ON Provides users with instant-on access to their apps. You are charged for
        # all running instances in your fleet, even if no users are streaming apps. ON_DEMAND Provide users
        # with access to applications after they connect, which takes one to two minutes. You are charged for
        # instance streaming when users are connected and a small hourly fee for instances that are not
        # streaming apps.

        @[JSON::Field(key: "FleetType")]
        getter fleet_type : String?

        # The Amazon Resource Name (ARN) of the IAM role to apply to the fleet. To assume a role, a fleet
        # instance calls the AWS Security Token Service (STS) AssumeRole API operation and passes the ARN of
        # the role to use. The operation creates a new session with temporary credentials. WorkSpaces
        # Applications retrieves the temporary credentials and creates the appstream_machine_role credential
        # profile on the instance. For more information, see Using an IAM Role to Grant Permissions to
        # Applications and Scripts Running on WorkSpaces Applications Streaming Instances in the Amazon
        # WorkSpaces Applications Administration Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The amount of time that users can be idle (inactive) before they are disconnected from their
        # streaming session and the DisconnectTimeoutInSeconds time interval begins. Users are notified before
        # they are disconnected due to inactivity. If they try to reconnect to the streaming session before
        # the time interval specified in DisconnectTimeoutInSeconds elapses, they are connected to their
        # previous session. Users are considered idle when they stop providing keyboard or mouse input during
        # their streaming session. File uploads and downloads, audio in, audio out, and pixels changing do not
        # qualify as user activity. If users continue to be idle after the time interval in
        # IdleDisconnectTimeoutInSeconds elapses, they are disconnected. To prevent users from being
        # disconnected due to inactivity, specify a value of 0. Otherwise, specify a value between 60 and
        # 36000. The default value is 0. If you enable this feature, we recommend that you specify a value
        # that corresponds exactly to a whole number of minutes (for example, 60, 120, and 180). If you don't
        # do this, the value is rounded to the nearest minute. For example, if you specify a value of 70,
        # users are disconnected after 1 minute of inactivity. If you specify a value that is at the midpoint
        # between two different minutes, the value is rounded up. For example, if you specify a value of 90,
        # users are disconnected after 2 minutes of inactivity.

        @[JSON::Field(key: "IdleDisconnectTimeoutInSeconds")]
        getter idle_disconnect_timeout_in_seconds : Int32?

        # The ARN of the public, private, or shared image to use.

        @[JSON::Field(key: "ImageArn")]
        getter image_arn : String?

        # The name of the image used to create the fleet.

        @[JSON::Field(key: "ImageName")]
        getter image_name : String?

        # The maximum concurrent sessions of the Elastic fleet. This is required for Elastic fleets, and not
        # allowed for other fleet types.

        @[JSON::Field(key: "MaxConcurrentSessions")]
        getter max_concurrent_sessions : Int32?

        # The maximum number of user sessions on an instance. This only applies to multi-session fleets.

        @[JSON::Field(key: "MaxSessionsPerInstance")]
        getter max_sessions_per_instance : Int32?

        # The maximum amount of time that a streaming session can remain active, in seconds. If users are
        # still connected to a streaming instance five minutes before this limit is reached, they are prompted
        # to save any open documents before being disconnected. After this time elapses, the instance is
        # terminated and replaced by a new instance. Specify a value between 600 and 432000.

        @[JSON::Field(key: "MaxUserDurationInSeconds")]
        getter max_user_duration_in_seconds : Int32?

        # The fleet platform. WINDOWS_SERVER_2019, AMAZON_LINUX2 and UBUNTU_PRO_2404 are supported for Elastic
        # fleets.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The configuration for the root volume of fleet instances. Use this to customize storage capacity
        # from 200 GB up to 500 GB based on your application requirements.

        @[JSON::Field(key: "RootVolumeConfig")]
        getter root_volume_config : Types::VolumeConfig?

        # The S3 location of the session scripts configuration zip file. This only applies to Elastic fleets.

        @[JSON::Field(key: "SessionScriptS3Location")]
        getter session_script_s3_location : Types::S3Location?

        # The WorkSpaces Applications view that is displayed to your users when they stream from the fleet.
        # When APP is specified, only the windows of applications opened by users display. When DESKTOP is
        # specified, the standard desktop that is provided by the operating system displays. The default value
        # is APP .

        @[JSON::Field(key: "StreamView")]
        getter stream_view : String?

        # The tags to associate with the fleet. A tag is a key-value pair, and the value is optional. For
        # example, Environment=Test. If you do not specify a value, Environment=. If you do not specify a
        # value, the value is set to an empty string. Generally allowed characters are: letters, numbers, and
        # spaces representable in UTF-8, and the following special characters: _ . : / = + \ - @ For more
        # information, see Tagging Your Resources in the Amazon WorkSpaces Applications Administration Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The USB device filter strings that specify which USB devices a user can redirect to the fleet
        # streaming session, when using the Windows native client. This is allowed but not required for
        # Elastic fleets.

        @[JSON::Field(key: "UsbDeviceFilterStrings")]
        getter usb_device_filter_strings : Array(String)?

        # The VPC configuration for the fleet. This is required for Elastic fleets, but not required for other
        # fleet types. Elastic fleets require that you specify at least two subnets in different availability
        # zones.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @instance_type : String,
          @name : String,
          @compute_capacity : Types::ComputeCapacity? = nil,
          @description : String? = nil,
          @disconnect_timeout_in_seconds : Int32? = nil,
          @display_name : String? = nil,
          @domain_join_info : Types::DomainJoinInfo? = nil,
          @enable_default_internet_access : Bool? = nil,
          @fleet_type : String? = nil,
          @iam_role_arn : String? = nil,
          @idle_disconnect_timeout_in_seconds : Int32? = nil,
          @image_arn : String? = nil,
          @image_name : String? = nil,
          @max_concurrent_sessions : Int32? = nil,
          @max_sessions_per_instance : Int32? = nil,
          @max_user_duration_in_seconds : Int32? = nil,
          @platform : String? = nil,
          @root_volume_config : Types::VolumeConfig? = nil,
          @session_script_s3_location : Types::S3Location? = nil,
          @stream_view : String? = nil,
          @tags : Hash(String, String)? = nil,
          @usb_device_filter_strings : Array(String)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct CreateFleetResult
        include JSON::Serializable

        # Information about the fleet.

        @[JSON::Field(key: "Fleet")]
        getter fleet : Types::Fleet?

        def initialize(
          @fleet : Types::Fleet? = nil
        )
        end
      end


      struct CreateImageBuilderRequest
        include JSON::Serializable

        # The instance type to use when launching the image builder. The following instance types are
        # available: stream.standard.small stream.standard.medium stream.standard.large stream.compute.large
        # stream.compute.xlarge stream.compute.2xlarge stream.compute.4xlarge stream.compute.8xlarge
        # stream.memory.large stream.memory.xlarge stream.memory.2xlarge stream.memory.4xlarge
        # stream.memory.8xlarge stream.memory.z1d.large stream.memory.z1d.xlarge stream.memory.z1d.2xlarge
        # stream.memory.z1d.3xlarge stream.memory.z1d.6xlarge stream.memory.z1d.12xlarge
        # stream.graphics.g4dn.xlarge stream.graphics.g4dn.2xlarge stream.graphics.g4dn.4xlarge
        # stream.graphics.g4dn.8xlarge stream.graphics.g4dn.12xlarge stream.graphics.g4dn.16xlarge
        # stream.graphics.g5.xlarge stream.graphics.g5.2xlarge stream.graphics.g5.4xlarge
        # stream.graphics.g5.8xlarge stream.graphics.g5.16xlarge stream.graphics.g5.12xlarge
        # stream.graphics.g5.24xlarge stream.graphics.g6.xlarge stream.graphics.g6.2xlarge
        # stream.graphics.g6.4xlarge stream.graphics.g6.8xlarge stream.graphics.g6.16xlarge
        # stream.graphics.g6.12xlarge stream.graphics.g6.24xlarge stream.graphics.gr6.4xlarge
        # stream.graphics.gr6.8xlarge stream.graphics.g6f.large stream.graphics.g6f.xlarge
        # stream.graphics.g6f.2xlarge stream.graphics.g6f.4xlarge stream.graphics.gr6f.4xlarge

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # A unique name for the image builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The list of interface VPC endpoint (interface endpoint) objects. Administrators can connect to the
        # image builder only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The version of the WorkSpaces Applications agent to use for this image builder. To use the latest
        # version of the WorkSpaces Applications agent, specify [LATEST].

        @[JSON::Field(key: "AppstreamAgentVersion")]
        getter appstream_agent_version : String?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The image builder name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name of the directory and organizational unit (OU) to use to join the image builder to a
        # Microsoft Active Directory domain.

        @[JSON::Field(key: "DomainJoinInfo")]
        getter domain_join_info : Types::DomainJoinInfo?

        # Enables or disables default internet access for the image builder.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The Amazon Resource Name (ARN) of the IAM role to apply to the image builder. To assume a role, the
        # image builder calls the AWS Security Token Service (STS) AssumeRole API operation and passes the ARN
        # of the role to use. The operation creates a new session with temporary credentials. WorkSpaces
        # Applications retrieves the temporary credentials and creates the appstream_machine_role credential
        # profile on the instance. For more information, see Using an IAM Role to Grant Permissions to
        # Applications and Scripts Running on WorkSpaces Applications Streaming Instances in the Amazon
        # WorkSpaces Applications Administration Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The ARN of the public, private, or shared image to use.

        @[JSON::Field(key: "ImageArn")]
        getter image_arn : String?

        # The name of the image used to create the image builder.

        @[JSON::Field(key: "ImageName")]
        getter image_name : String?

        # The configuration for the root volume of the image builder. Use this to customize storage capacity
        # from 200 GB up to 500 GB based on your application installation requirements.

        @[JSON::Field(key: "RootVolumeConfig")]
        getter root_volume_config : Types::VolumeConfig?

        # The list of license included applications to install on the image builder during creation. Possible
        # values include the following: Microsoft_Office_2021_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2021_LTSC_Professional_Plus_64Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_64Bit Microsoft_Visio_2021_LTSC_Professional_32Bit
        # Microsoft_Visio_2021_LTSC_Professional_64Bit Microsoft_Visio_2024_LTSC_Professional_32Bit
        # Microsoft_Visio_2024_LTSC_Professional_64Bit Microsoft_Project_2021_Professional_32Bit
        # Microsoft_Project_2021_Professional_64Bit Microsoft_Project_2024_Professional_32Bit
        # Microsoft_Project_2024_Professional_64Bit Microsoft_Office_2021_LTSC_Standard_32Bit
        # Microsoft_Office_2021_LTSC_Standard_64Bit Microsoft_Office_2024_LTSC_Standard_32Bit
        # Microsoft_Office_2024_LTSC_Standard_64Bit Microsoft_Visio_2021_LTSC_Standard_32Bit
        # Microsoft_Visio_2021_LTSC_Standard_64Bit Microsoft_Visio_2024_LTSC_Standard_32Bit
        # Microsoft_Visio_2024_LTSC_Standard_64Bit Microsoft_Project_2021_Standard_32Bit
        # Microsoft_Project_2021_Standard_64Bit Microsoft_Project_2024_Standard_32Bit
        # Microsoft_Project_2024_Standard_64Bit

        @[JSON::Field(key: "SoftwaresToInstall")]
        getter softwares_to_install : Array(String)?

        # The list of license included applications to uninstall from the image builder during creation.
        # Possible values include the following: Microsoft_Office_2021_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2021_LTSC_Professional_Plus_64Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_64Bit Microsoft_Visio_2021_LTSC_Professional_32Bit
        # Microsoft_Visio_2021_LTSC_Professional_64Bit Microsoft_Visio_2024_LTSC_Professional_32Bit
        # Microsoft_Visio_2024_LTSC_Professional_64Bit Microsoft_Project_2021_Professional_32Bit
        # Microsoft_Project_2021_Professional_64Bit Microsoft_Project_2024_Professional_32Bit
        # Microsoft_Project_2024_Professional_64Bit Microsoft_Office_2021_LTSC_Standard_32Bit
        # Microsoft_Office_2021_LTSC_Standard_64Bit Microsoft_Office_2024_LTSC_Standard_32Bit
        # Microsoft_Office_2024_LTSC_Standard_64Bit Microsoft_Visio_2021_LTSC_Standard_32Bit
        # Microsoft_Visio_2021_LTSC_Standard_64Bit Microsoft_Visio_2024_LTSC_Standard_32Bit
        # Microsoft_Visio_2024_LTSC_Standard_64Bit Microsoft_Project_2021_Standard_32Bit
        # Microsoft_Project_2021_Standard_64Bit Microsoft_Project_2024_Standard_32Bit
        # Microsoft_Project_2024_Standard_64Bit

        @[JSON::Field(key: "SoftwaresToUninstall")]
        getter softwares_to_uninstall : Array(String)?

        # The tags to associate with the image builder. A tag is a key-value pair, and the value is optional.
        # For example, Environment=Test. If you do not specify a value, Environment=. Generally allowed
        # characters are: letters, numbers, and spaces representable in UTF-8, and the following special
        # characters: _ . : / = + \ - @ If you do not specify a value, the value is set to an empty string.
        # For more information about tags, see Tagging Your Resources in the Amazon WorkSpaces Applications
        # Administration Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The VPC configuration for the image builder. You can specify only one subnet.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @instance_type : String,
          @name : String,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @appstream_agent_version : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @domain_join_info : Types::DomainJoinInfo? = nil,
          @enable_default_internet_access : Bool? = nil,
          @iam_role_arn : String? = nil,
          @image_arn : String? = nil,
          @image_name : String? = nil,
          @root_volume_config : Types::VolumeConfig? = nil,
          @softwares_to_install : Array(String)? = nil,
          @softwares_to_uninstall : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct CreateImageBuilderResult
        include JSON::Serializable

        # Information about the image builder.

        @[JSON::Field(key: "ImageBuilder")]
        getter image_builder : Types::ImageBuilder?

        def initialize(
          @image_builder : Types::ImageBuilder? = nil
        )
        end
      end


      struct CreateImageBuilderStreamingURLRequest
        include JSON::Serializable

        # The name of the image builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The time that the streaming URL will be valid, in seconds. Specify a value between 1 and 604800
        # seconds. The default is 3600 seconds.

        @[JSON::Field(key: "Validity")]
        getter validity : Int64?

        def initialize(
          @name : String,
          @validity : Int64? = nil
        )
        end
      end


      struct CreateImageBuilderStreamingURLResult
        include JSON::Serializable

        # The elapsed time, in seconds after the Unix epoch, when this URL expires.

        @[JSON::Field(key: "Expires", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires : Time?

        # The URL to start the WorkSpaces Applications streaming session.

        @[JSON::Field(key: "StreamingURL")]
        getter streaming_url : String?

        def initialize(
          @expires : Time? = nil,
          @streaming_url : String? = nil
        )
        end
      end


      struct CreateImportedImageRequest
        include JSON::Serializable

        # The ARN of the IAM role that allows WorkSpaces Applications to access your AMI. The role must have
        # permissions to modify image attributes and describe images, with a trust relationship allowing
        # appstream.amazonaws.com to assume the role.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # A unique name for the imported image. The name must be between 1 and 100 characters and can contain
        # letters, numbers, underscores, periods, and hyphens.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the EC2 AMI to import. The AMI must meet specific requirements including Windows Server
        # 2022 Full Base, UEFI boot mode, TPM 2.0 support, and proper drivers.

        @[JSON::Field(key: "SourceAmiId")]
        getter source_ami_id : String

        # The version of the WorkSpaces Applications agent to use for the imported image. Choose
        # CURRENT_LATEST to use the agent version available at the time of import, or ALWAYS_LATEST to
        # automatically update to the latest agent version when new versions are released.

        @[JSON::Field(key: "AgentSoftwareVersion")]
        getter agent_software_version : String?

        # Configuration for the application catalog of the imported image. This allows you to specify
        # applications available for streaming, including their paths, icons, and launch parameters. This
        # field contains sensitive data.

        @[JSON::Field(key: "AppCatalogConfig")]
        getter app_catalog_config : Array(Types::ApplicationConfig)?

        # An optional description for the imported image. The description must match approved regex patterns
        # and can be up to 256 characters.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional display name for the imported image. The display name must match approved regex patterns
        # and can be up to 100 characters.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # When set to true, performs validation checks without actually creating the imported image. Use this
        # to verify your configuration before executing the actual import operation.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # Configuration for runtime validation of the imported image. When specified, WorkSpaces Applications
        # provisions an instance to test streaming functionality, which helps ensure the image is suitable for
        # use.

        @[JSON::Field(key: "RuntimeValidationConfig")]
        getter runtime_validation_config : Types::RuntimeValidationConfig?

        # The tags to apply to the imported image. Tags help you organize and manage your WorkSpaces
        # Applications resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @iam_role_arn : String,
          @name : String,
          @source_ami_id : String,
          @agent_software_version : String? = nil,
          @app_catalog_config : Array(Types::ApplicationConfig)? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @dry_run : Bool? = nil,
          @runtime_validation_config : Types::RuntimeValidationConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateImportedImageResult
        include JSON::Serializable


        @[JSON::Field(key: "Image")]
        getter image : Types::Image?

        def initialize(
          @image : Types::Image? = nil
        )
        end
      end


      struct CreateStackRequest
        include JSON::Serializable

        # The name of the stack.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The list of interface VPC endpoint (interface endpoint) objects. Users of the stack can connect to
        # WorkSpaces Applications only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The persistent application settings for users of a stack. When these settings are enabled, changes
        # that users make to applications and Windows settings are automatically saved after each session and
        # applied to the next session.

        @[JSON::Field(key: "ApplicationSettings")]
        getter application_settings : Types::ApplicationSettings?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The stack name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The domains where WorkSpaces Applications streaming sessions can be embedded in an iframe. You must
        # approve the domains that you want to host embedded WorkSpaces Applications streaming sessions.

        @[JSON::Field(key: "EmbedHostDomains")]
        getter embed_host_domains : Array(String)?

        # The URL that users are redirected to after they click the Send Feedback link. If no URL is
        # specified, no Send Feedback link is displayed.

        @[JSON::Field(key: "FeedbackURL")]
        getter feedback_url : String?

        # The URL that users are redirected to after their streaming session ends.

        @[JSON::Field(key: "RedirectURL")]
        getter redirect_url : String?

        # The storage connectors to enable.

        @[JSON::Field(key: "StorageConnectors")]
        getter storage_connectors : Array(Types::StorageConnector)?

        # The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, UDP is only
        # supported in the Windows native client.

        @[JSON::Field(key: "StreamingExperienceSettings")]
        getter streaming_experience_settings : Types::StreamingExperienceSettings?

        # The tags to associate with the stack. A tag is a key-value pair, and the value is optional. For
        # example, Environment=Test. If you do not specify a value, Environment=. If you do not specify a
        # value, the value is set to an empty string. Generally allowed characters are: letters, numbers, and
        # spaces representable in UTF-8, and the following special characters: _ . : / = + \ - @ For more
        # information about tags, see Tagging Your Resources in the Amazon WorkSpaces Applications
        # Administration Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The actions that are enabled or disabled for users during their streaming sessions. By default,
        # these actions are enabled.

        @[JSON::Field(key: "UserSettings")]
        getter user_settings : Array(Types::UserSetting)?

        def initialize(
          @name : String,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @application_settings : Types::ApplicationSettings? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @embed_host_domains : Array(String)? = nil,
          @feedback_url : String? = nil,
          @redirect_url : String? = nil,
          @storage_connectors : Array(Types::StorageConnector)? = nil,
          @streaming_experience_settings : Types::StreamingExperienceSettings? = nil,
          @tags : Hash(String, String)? = nil,
          @user_settings : Array(Types::UserSetting)? = nil
        )
        end
      end


      struct CreateStackResult
        include JSON::Serializable

        # Information about the stack.

        @[JSON::Field(key: "Stack")]
        getter stack : Types::Stack?

        def initialize(
          @stack : Types::Stack? = nil
        )
        end
      end


      struct CreateStreamingURLRequest
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        # The name of the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The identifier of the user.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # The name of the application to launch after the session starts. This is the name that you specified
        # as Name in the Image Assistant. If your fleet is enabled for the Desktop stream view, you can also
        # choose to launch directly to the operating system desktop. To do so, specify Desktop .

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The session context. For more information, see Session Context in the Amazon WorkSpaces Applications
        # Administration Guide .

        @[JSON::Field(key: "SessionContext")]
        getter session_context : String?

        # The time that the streaming URL will be valid, in seconds. Specify a value between 1 and 604800
        # seconds. The default is 60 seconds.

        @[JSON::Field(key: "Validity")]
        getter validity : Int64?

        def initialize(
          @fleet_name : String,
          @stack_name : String,
          @user_id : String,
          @application_id : String? = nil,
          @session_context : String? = nil,
          @validity : Int64? = nil
        )
        end
      end


      struct CreateStreamingURLResult
        include JSON::Serializable

        # The elapsed time, in seconds after the Unix epoch, when this URL expires.

        @[JSON::Field(key: "Expires", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires : Time?

        # The URL to start the WorkSpaces Applications streaming session.

        @[JSON::Field(key: "StreamingURL")]
        getter streaming_url : String?

        def initialize(
          @expires : Time? = nil,
          @streaming_url : String? = nil
        )
        end
      end


      struct CreateThemeForStackRequest
        include JSON::Serializable

        # The S3 location of the favicon. The favicon enables users to recognize their application streaming
        # site in a browser full of tabs or bookmarks. It is displayed at the top of the browser tab for the
        # application streaming site during users' streaming sessions.

        @[JSON::Field(key: "FaviconS3Location")]
        getter favicon_s3_location : Types::S3Location

        # The organization logo that appears on the streaming application catalog page.

        @[JSON::Field(key: "OrganizationLogoS3Location")]
        getter organization_logo_s3_location : Types::S3Location

        # The name of the stack for the theme.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The color theme that is applied to website links, text, and buttons. These colors are also applied
        # as accents in the background for the streaming application catalog page.

        @[JSON::Field(key: "ThemeStyling")]
        getter theme_styling : String

        # The title that is displayed at the top of the browser tab during users' application streaming
        # sessions.

        @[JSON::Field(key: "TitleText")]
        getter title_text : String

        # The links that are displayed in the footer of the streaming application catalog page. These links
        # are helpful resources for users, such as the organization's IT support and product marketing sites.

        @[JSON::Field(key: "FooterLinks")]
        getter footer_links : Array(Types::ThemeFooterLink)?

        def initialize(
          @favicon_s3_location : Types::S3Location,
          @organization_logo_s3_location : Types::S3Location,
          @stack_name : String,
          @theme_styling : String,
          @title_text : String,
          @footer_links : Array(Types::ThemeFooterLink)? = nil
        )
        end
      end


      struct CreateThemeForStackResult
        include JSON::Serializable

        # The theme object that contains the metadata of the custom branding.

        @[JSON::Field(key: "Theme")]
        getter theme : Types::Theme?

        def initialize(
          @theme : Types::Theme? = nil
        )
        end
      end


      struct CreateUpdatedImageRequest
        include JSON::Serializable

        # The name of the image to update.

        @[JSON::Field(key: "existingImageName")]
        getter existing_image_name : String

        # The name of the new image. The name must be unique within the AWS account and Region.

        @[JSON::Field(key: "newImageName")]
        getter new_image_name : String

        # Indicates whether to display the status of image update availability before WorkSpaces Applications
        # initiates the process of creating a new updated image. If this value is set to true , WorkSpaces
        # Applications displays whether image updates are available. If this value is set to false ,
        # WorkSpaces Applications initiates the process of creating a new updated image without displaying
        # whether image updates are available.

        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # The description to display for the new image.

        @[JSON::Field(key: "newImageDescription")]
        getter new_image_description : String?

        # The name to display for the new image.

        @[JSON::Field(key: "newImageDisplayName")]
        getter new_image_display_name : String?

        # The tags to associate with the new image. A tag is a key-value pair, and the value is optional. For
        # example, Environment=Test. If you do not specify a value, Environment=. Generally allowed characters
        # are: letters, numbers, and spaces representable in UTF-8, and the following special characters: _ .
        # : / = + \ - @ If you do not specify a value, the value is set to an empty string. For more
        # information about tags, see Tagging Your Resources in the Amazon WorkSpaces Applications
        # Administration Guide .

        @[JSON::Field(key: "newImageTags")]
        getter new_image_tags : Hash(String, String)?

        def initialize(
          @existing_image_name : String,
          @new_image_name : String,
          @dry_run : Bool? = nil,
          @new_image_description : String? = nil,
          @new_image_display_name : String? = nil,
          @new_image_tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateUpdatedImageResult
        include JSON::Serializable

        # Indicates whether a new image can be created.

        @[JSON::Field(key: "canUpdateImage")]
        getter can_update_image : Bool?


        @[JSON::Field(key: "image")]
        getter image : Types::Image?

        def initialize(
          @can_update_image : Bool? = nil,
          @image : Types::Image? = nil
        )
        end
      end


      struct CreateUsageReportSubscriptionRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateUsageReportSubscriptionResult
        include JSON::Serializable

        # The Amazon S3 bucket where generated reports are stored. If you enabled on-instance session scripts
        # and Amazon S3 logging for your session script configuration, WorkSpaces Applications created an S3
        # bucket to store the script output. The bucket is unique to your account and Region. When you enable
        # usage reporting in this case, WorkSpaces Applications uses the same bucket to store your usage
        # reports. If you haven't already enabled on-instance session scripts, when you enable usage reports,
        # WorkSpaces Applications creates a new S3 bucket.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The schedule for generating usage reports.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        def initialize(
          @s3_bucket_name : String? = nil,
          @schedule : String? = nil
        )
        end
      end


      struct CreateUserRequest
        include JSON::Serializable

        # The authentication type for the user. You must specify USERPOOL.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # The email address of the user. Users' email addresses are case-sensitive. During login, if they
        # specify an email address that doesn't use the same capitalization as the email address specified
        # when their user pool account was created, a "user does not exist" error message displays.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The first name, or given name, of the user.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The last name, or surname, of the user.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The action to take for the welcome email that is sent to a user after the user is created in the
        # user pool. If you specify SUPPRESS, no email is sent. If you specify RESEND, do not specify the
        # first name or last name of the user. If the value is null, the email is sent. The temporary password
        # in the welcome email is valid for only 7 days. If users don’t set their passwords within 7 days, you
        # must send them a new welcome email.

        @[JSON::Field(key: "MessageAction")]
        getter message_action : String?

        def initialize(
          @authentication_type : String,
          @user_name : String,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @message_action : String? = nil
        )
        end
      end


      struct CreateUserResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAppBlockBuilderRequest
        include JSON::Serializable

        # The name of the app block builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteAppBlockBuilderResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAppBlockRequest
        include JSON::Serializable

        # The name of the app block.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteAppBlockResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteApplicationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDirectoryConfigRequest
        include JSON::Serializable

        # The name of the directory configuration.

        @[JSON::Field(key: "DirectoryName")]
        getter directory_name : String

        def initialize(
          @directory_name : String
        )
        end
      end


      struct DeleteDirectoryConfigResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEntitlementRequest
        include JSON::Serializable

        # The name of the entitlement.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the stack with which the entitlement is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @name : String,
          @stack_name : String
        )
        end
      end


      struct DeleteEntitlementResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFleetRequest
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteFleetResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteImageBuilderRequest
        include JSON::Serializable

        # The name of the image builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteImageBuilderResult
        include JSON::Serializable

        # Information about the image builder.

        @[JSON::Field(key: "ImageBuilder")]
        getter image_builder : Types::ImageBuilder?

        def initialize(
          @image_builder : Types::ImageBuilder? = nil
        )
        end
      end


      struct DeleteImagePermissionsRequest
        include JSON::Serializable

        # The name of the private image.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The 12-digit identifier of the AWS account for which to delete image permissions.

        @[JSON::Field(key: "SharedAccountId")]
        getter shared_account_id : String

        def initialize(
          @name : String,
          @shared_account_id : String
        )
        end
      end


      struct DeleteImagePermissionsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteImageRequest
        include JSON::Serializable

        # The name of the image.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteImageResult
        include JSON::Serializable

        # Information about the image.

        @[JSON::Field(key: "Image")]
        getter image : Types::Image?

        def initialize(
          @image : Types::Image? = nil
        )
        end
      end


      struct DeleteStackRequest
        include JSON::Serializable

        # The name of the stack.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteStackResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteThemeForStackRequest
        include JSON::Serializable

        # The name of the stack for the theme.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @stack_name : String
        )
        end
      end


      struct DeleteThemeForStackResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteUsageReportSubscriptionRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteUsageReportSubscriptionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteUserRequest
        include JSON::Serializable

        # The authentication type for the user. You must specify USERPOOL.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # The email address of the user. Users' email addresses are case-sensitive.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @authentication_type : String,
          @user_name : String
        )
        end
      end


      struct DeleteUserResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAppBlockBuilderAppBlockAssociationsRequest
        include JSON::Serializable

        # The ARN of the app block.

        @[JSON::Field(key: "AppBlockArn")]
        getter app_block_arn : String?

        # The name of the app block builder.

        @[JSON::Field(key: "AppBlockBuilderName")]
        getter app_block_builder_name : String?

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_block_arn : String? = nil,
          @app_block_builder_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAppBlockBuilderAppBlockAssociationsResult
        include JSON::Serializable

        # This list of app block builders associated with app blocks.

        @[JSON::Field(key: "AppBlockBuilderAppBlockAssociations")]
        getter app_block_builder_app_block_associations : Array(Types::AppBlockBuilderAppBlockAssociation)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_block_builder_app_block_associations : Array(Types::AppBlockBuilderAppBlockAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAppBlockBuildersRequest
        include JSON::Serializable

        # The maximum size of each page of results. The maximum value is 25.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The names of the app block builders.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAppBlockBuildersResult
        include JSON::Serializable

        # The list that describes one or more app block builders.

        @[JSON::Field(key: "AppBlockBuilders")]
        getter app_block_builders : Array(Types::AppBlockBuilder)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_block_builders : Array(Types::AppBlockBuilder)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAppBlocksRequest
        include JSON::Serializable

        # The ARNs of the app blocks.

        @[JSON::Field(key: "Arns")]
        getter arns : Array(String)?

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAppBlocksResult
        include JSON::Serializable

        # The app blocks in the list.

        @[JSON::Field(key: "AppBlocks")]
        getter app_blocks : Array(Types::AppBlock)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_blocks : Array(Types::AppBlock)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAppLicenseUsageRequest
        include JSON::Serializable

        # Billing period for the usage record. Specify the value in yyyy-mm format. For example, for August
        # 2025, use 2025-08 .

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for pagination of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_period : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAppLicenseUsageResult
        include JSON::Serializable

        # Collection of license usage records.

        @[JSON::Field(key: "AppLicenseUsages")]
        getter app_license_usages : Array(Types::AdminAppLicenseUsageRecord)?

        # Token for pagination of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_license_usages : Array(Types::AdminAppLicenseUsageRecord)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeApplicationFleetAssociationsRequest
        include JSON::Serializable

        # The ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The name of the fleet.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String?

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_arn : String? = nil,
          @fleet_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeApplicationFleetAssociationsResult
        include JSON::Serializable

        # The application fleet associations in the list.

        @[JSON::Field(key: "ApplicationFleetAssociations")]
        getter application_fleet_associations : Array(Types::ApplicationFleetAssociation)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_fleet_associations : Array(Types::ApplicationFleetAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeApplicationsRequest
        include JSON::Serializable

        # The ARNs for the applications.

        @[JSON::Field(key: "Arns")]
        getter arns : Array(String)?

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeApplicationsResult
        include JSON::Serializable

        # The applications in the list.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::Application)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::Application)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDirectoryConfigsRequest
        include JSON::Serializable

        # The directory names.

        @[JSON::Field(key: "DirectoryNames")]
        getter directory_names : Array(String)?

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_names : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDirectoryConfigsResult
        include JSON::Serializable

        # Information about the directory configurations. Note that although the response syntax in this topic
        # includes the account password, this password is not returned in the actual response.

        @[JSON::Field(key: "DirectoryConfigs")]
        getter directory_configs : Array(Types::DirectoryConfig)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_configs : Array(Types::DirectoryConfig)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEntitlementsRequest
        include JSON::Serializable

        # The name of the stack with which the entitlement is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The name of the entitlement.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_name : String,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEntitlementsResult
        include JSON::Serializable

        # The entitlements.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::Entitlement)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entitlements : Array(Types::Entitlement)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetsRequest
        include JSON::Serializable

        # The names of the fleets to describe.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetsResult
        include JSON::Serializable

        # Information about the fleets.

        @[JSON::Field(key: "Fleets")]
        getter fleets : Array(Types::Fleet)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleets : Array(Types::Fleet)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeImageBuildersRequest
        include JSON::Serializable

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The names of the image builders to describe.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeImageBuildersResult
        include JSON::Serializable

        # Information about the image builders.

        @[JSON::Field(key: "ImageBuilders")]
        getter image_builders : Array(Types::ImageBuilder)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @image_builders : Array(Types::ImageBuilder)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeImagePermissionsRequest
        include JSON::Serializable

        # The name of the private image for which to describe permissions. The image must be one that you own.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The 12-digit identifier of one or more AWS accounts with which the image is shared.

        @[JSON::Field(key: "SharedAwsAccountIds")]
        getter shared_aws_account_ids : Array(String)?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shared_aws_account_ids : Array(String)? = nil
        )
        end
      end


      struct DescribeImagePermissionsResult
        include JSON::Serializable

        # The name of the private image.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The permissions for a private image that you own.

        @[JSON::Field(key: "SharedImagePermissionsList")]
        getter shared_image_permissions_list : Array(Types::SharedImagePermissions)?

        def initialize(
          @name : String? = nil,
          @next_token : String? = nil,
          @shared_image_permissions_list : Array(Types::SharedImagePermissions)? = nil
        )
        end
      end


      struct DescribeImagesRequest
        include JSON::Serializable

        # The ARNs of the public, private, and shared images to describe.

        @[JSON::Field(key: "Arns")]
        getter arns : Array(String)?

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The names of the public or private images to describe.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of image (public, private, or shared) to describe.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct DescribeImagesResult
        include JSON::Serializable

        # Information about the images.

        @[JSON::Field(key: "Images")]
        getter images : Array(Types::Image)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @images : Array(Types::Image)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSessionsRequest
        include JSON::Serializable

        # The name of the fleet. This value is case-sensitive.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        # The name of the stack. This value is case-sensitive.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The authentication method. Specify API for a user authenticated using a streaming URL or SAML for a
        # SAML federated user. The default is to authenticate users using a streaming URL.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String?

        # The identifier for the instance hosting the session.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The size of each page of results. The default value is 20 and the maximum value is 50.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The user identifier (ID). If you specify a user ID, you must also specify the authentication type.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @fleet_name : String,
          @stack_name : String,
          @authentication_type : String? = nil,
          @instance_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct DescribeSessionsResult
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the streaming sessions.

        @[JSON::Field(key: "Sessions")]
        getter sessions : Array(Types::Session)?

        def initialize(
          @next_token : String? = nil,
          @sessions : Array(Types::Session)? = nil
        )
        end
      end


      struct DescribeSoftwareAssociationsRequest
        include JSON::Serializable

        # The ARN of the resource to describe software associations. Possible resources are Image and
        # ImageBuilder.

        @[JSON::Field(key: "AssociatedResource")]
        getter associated_resource : String

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @associated_resource : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSoftwareAssociationsResult
        include JSON::Serializable

        # The ARN of the resource to describe software associations.

        @[JSON::Field(key: "AssociatedResource")]
        getter associated_resource : String?

        # The pagination token to use to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Collection of license included applications association details including: License included
        # application name and version information Deployment status (SoftwareDeploymentStatus enum) Error
        # details for failed deployments Association timestamps

        @[JSON::Field(key: "SoftwareAssociations")]
        getter software_associations : Array(Types::SoftwareAssociations)?

        def initialize(
          @associated_resource : String? = nil,
          @next_token : String? = nil,
          @software_associations : Array(Types::SoftwareAssociations)? = nil
        )
        end
      end


      struct DescribeStacksRequest
        include JSON::Serializable

        # The names of the stacks to describe.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeStacksResult
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the stacks.

        @[JSON::Field(key: "Stacks")]
        getter stacks : Array(Types::Stack)?

        def initialize(
          @next_token : String? = nil,
          @stacks : Array(Types::Stack)? = nil
        )
        end
      end


      struct DescribeThemeForStackRequest
        include JSON::Serializable

        # The name of the stack for the theme.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @stack_name : String
        )
        end
      end


      struct DescribeThemeForStackResult
        include JSON::Serializable

        # The theme object that contains the metadata of the custom branding.

        @[JSON::Field(key: "Theme")]
        getter theme : Types::Theme?

        def initialize(
          @theme : Types::Theme? = nil
        )
        end
      end


      struct DescribeUsageReportSubscriptionsRequest
        include JSON::Serializable

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeUsageReportSubscriptionsResult
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the usage report subscription.

        @[JSON::Field(key: "UsageReportSubscriptions")]
        getter usage_report_subscriptions : Array(Types::UsageReportSubscription)?

        def initialize(
          @next_token : String? = nil,
          @usage_report_subscriptions : Array(Types::UsageReportSubscription)? = nil
        )
        end
      end


      struct DescribeUserStackAssociationsRequest
        include JSON::Serializable

        # The authentication type for the user who is associated with the stack. You must specify USERPOOL.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String?

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the stack that is associated with the user.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # The email address of the user who is associated with the stack. Users' email addresses are
        # case-sensitive.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @authentication_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @stack_name : String? = nil,
          @user_name : String? = nil
        )
        end
      end


      struct DescribeUserStackAssociationsResult
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The UserStackAssociation objects.

        @[JSON::Field(key: "UserStackAssociations")]
        getter user_stack_associations : Array(Types::UserStackAssociation)?

        def initialize(
          @next_token : String? = nil,
          @user_stack_associations : Array(Types::UserStackAssociation)? = nil
        )
        end
      end


      struct DescribeUsersRequest
        include JSON::Serializable

        # The authentication type for the users in the user pool to describe. You must specify USERPOOL.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @authentication_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeUsersResult
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about users in the user pool.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # Describes the configuration information required to join fleets and image builders to Microsoft
      # Active Directory domains.

      struct DirectoryConfig
        include JSON::Serializable

        # The fully qualified name of the directory (for example, corp.example.com).

        @[JSON::Field(key: "DirectoryName")]
        getter directory_name : String

        # The certificate-based authentication properties used to authenticate SAML 2.0 Identity Provider
        # (IdP) user identities to Active Directory domain-joined streaming instances. Fallback is turned on
        # by default when certificate-based authentication is Enabled . Fallback allows users to log in using
        # their AD domain password if certificate-based authentication is unsuccessful, or to unlock a desktop
        # lock screen. Enabled_no_directory_login_fallback enables certificate-based authentication, but does
        # not allow users to log in using their AD domain password. Users will be disconnected to
        # re-authenticate using certificates.

        @[JSON::Field(key: "CertificateBasedAuthProperties")]
        getter certificate_based_auth_properties : Types::CertificateBasedAuthProperties?

        # The time the directory configuration was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The distinguished names of the organizational units for computer accounts.

        @[JSON::Field(key: "OrganizationalUnitDistinguishedNames")]
        getter organizational_unit_distinguished_names : Array(String)?

        # The credentials for the service account used by the fleet or image builder to connect to the
        # directory.

        @[JSON::Field(key: "ServiceAccountCredentials")]
        getter service_account_credentials : Types::ServiceAccountCredentials?

        def initialize(
          @directory_name : String,
          @certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
          @created_time : Time? = nil,
          @organizational_unit_distinguished_names : Array(String)? = nil,
          @service_account_credentials : Types::ServiceAccountCredentials? = nil
        )
        end
      end


      struct DisableUserRequest
        include JSON::Serializable

        # The authentication type for the user. You must specify USERPOOL.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # The email address of the user. Users' email addresses are case-sensitive.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @authentication_type : String,
          @user_name : String
        )
        end
      end


      struct DisableUserResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateAppBlockBuilderAppBlockRequest
        include JSON::Serializable

        # The ARN of the app block.

        @[JSON::Field(key: "AppBlockArn")]
        getter app_block_arn : String

        # The name of the app block builder.

        @[JSON::Field(key: "AppBlockBuilderName")]
        getter app_block_builder_name : String

        def initialize(
          @app_block_arn : String,
          @app_block_builder_name : String
        )
        end
      end


      struct DisassociateAppBlockBuilderAppBlockResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateApplicationFleetRequest
        include JSON::Serializable

        # The ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # The name of the fleet.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        def initialize(
          @application_arn : String,
          @fleet_name : String
        )
        end
      end


      struct DisassociateApplicationFleetResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateApplicationFromEntitlementRequest
        include JSON::Serializable

        # The identifier of the application to remove from the entitlement.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The name of the entitlement.

        @[JSON::Field(key: "EntitlementName")]
        getter entitlement_name : String

        # The name of the stack with which the entitlement is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @application_identifier : String,
          @entitlement_name : String,
          @stack_name : String
        )
        end
      end


      struct DisassociateApplicationFromEntitlementResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateFleetRequest
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        # The name of the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @fleet_name : String,
          @stack_name : String
        )
        end
      end


      struct DisassociateFleetResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateSoftwareFromImageBuilderRequest
        include JSON::Serializable

        # The name of the target image builder instance.

        @[JSON::Field(key: "ImageBuilderName")]
        getter image_builder_name : String

        # The list of license included applications to disassociate from the image builder. Possible values
        # include the following: Microsoft_Office_2021_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2021_LTSC_Professional_Plus_64Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_64Bit Microsoft_Visio_2021_LTSC_Professional_32Bit
        # Microsoft_Visio_2021_LTSC_Professional_64Bit Microsoft_Visio_2024_LTSC_Professional_32Bit
        # Microsoft_Visio_2024_LTSC_Professional_64Bit Microsoft_Project_2021_Professional_32Bit
        # Microsoft_Project_2021_Professional_64Bit Microsoft_Project_2024_Professional_32Bit
        # Microsoft_Project_2024_Professional_64Bit Microsoft_Office_2021_LTSC_Standard_32Bit
        # Microsoft_Office_2021_LTSC_Standard_64Bit Microsoft_Office_2024_LTSC_Standard_32Bit
        # Microsoft_Office_2024_LTSC_Standard_64Bit Microsoft_Visio_2021_LTSC_Standard_32Bit
        # Microsoft_Visio_2021_LTSC_Standard_64Bit Microsoft_Visio_2024_LTSC_Standard_32Bit
        # Microsoft_Visio_2024_LTSC_Standard_64Bit Microsoft_Project_2021_Standard_32Bit
        # Microsoft_Project_2021_Standard_64Bit Microsoft_Project_2024_Standard_32Bit
        # Microsoft_Project_2024_Standard_64Bit

        @[JSON::Field(key: "SoftwareNames")]
        getter software_names : Array(String)

        def initialize(
          @image_builder_name : String,
          @software_names : Array(String)
        )
        end
      end


      struct DisassociateSoftwareFromImageBuilderResult
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the configuration information required to join fleets and image builders to Microsoft
      # Active Directory domains.

      struct DomainJoinInfo
        include JSON::Serializable

        # The fully qualified name of the directory (for example, corp.example.com).

        @[JSON::Field(key: "DirectoryName")]
        getter directory_name : String?

        # The distinguished name of the organizational unit for computer accounts.

        @[JSON::Field(key: "OrganizationalUnitDistinguishedName")]
        getter organizational_unit_distinguished_name : String?

        def initialize(
          @directory_name : String? = nil,
          @organizational_unit_distinguished_name : String? = nil
        )
        end
      end

      # The exception that is thrown when a dry run operation is requested. This indicates that the
      # validation checks have been performed successfully, but no actual resources were created or
      # modified.

      struct DryRunOperationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct EnableUserRequest
        include JSON::Serializable

        # The authentication type for the user. You must specify USERPOOL.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # The email address of the user. Users' email addresses are case-sensitive. During login, if they
        # specify an email address that doesn't use the same capitalization as the email address specified
        # when their user pool account was created, a "user does not exist" error message displays.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @authentication_type : String,
          @user_name : String
        )
        end
      end


      struct EnableUserResult
        include JSON::Serializable

        def initialize
        end
      end

      # The application associated to an entitlement. Access is controlled based on user attributes.

      struct EntitledApplication
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        def initialize(
          @application_identifier : String
        )
        end
      end

      # Specifies an entitlement. Entitlements control access to specific applications within a stack, based
      # on user attributes. Entitlements apply to SAML 2.0 federated user identities. WorkSpaces
      # Applications user pool and streaming URL users are entitled to all applications in a stack.
      # Entitlements don't apply to the desktop stream view application, or to applications managed by a
      # dynamic app provider using the Dynamic Application Framework.

      struct Entitlement
        include JSON::Serializable

        # Specifies whether all or selected apps are entitled.

        @[JSON::Field(key: "AppVisibility")]
        getter app_visibility : String

        # The attributes of the entitlement.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::EntitlementAttribute)

        # The name of the entitlement.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the stack with which the entitlement is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The time when the entitlement was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the entitlement.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time when the entitlement was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        def initialize(
          @app_visibility : String,
          @attributes : Array(Types::EntitlementAttribute),
          @name : String,
          @stack_name : String,
          @created_time : Time? = nil,
          @description : String? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end

      # The entitlement already exists.

      struct EntitlementAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An attribute associated with an entitlement. Application entitlements work by matching a supported
      # SAML 2.0 attribute name to a value when a user identity federates to a WorkSpaces Applications SAML
      # application.

      struct EntitlementAttribute
        include JSON::Serializable

        # A supported AWS IAM SAML PrincipalTag attribute that is matched to the associated value when a user
        # identity federates into a WorkSpaces Applications SAML application. The following are valid values:
        # roles department organization groups title costCenter userType

        @[JSON::Field(key: "Name")]
        getter name : String

        # A value that is matched to a supported SAML attribute name when a user identity federates into a
        # WorkSpaces Applications SAML application.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # The entitlement can't be found.

      struct EntitlementNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The error details.

      struct ErrorDetails
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct ExpireSessionRequest
        include JSON::Serializable

        # The identifier of the streaming session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct ExpireSessionResult
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an export image task, including its current state, timestamps, and any error
      # details.

      struct ExportImageTask
        include JSON::Serializable

        # The name of the EC2 AMI that will be created by this export task.

        @[JSON::Field(key: "AmiName")]
        getter ami_name : String

        # The date and time when the export image task was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The ARN of the WorkSpaces Applications image being exported.

        @[JSON::Field(key: "ImageArn")]
        getter image_arn : String

        # The unique identifier for the export image task. Use this ID to track the task's progress and
        # retrieve its details.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The description that will be applied to the exported EC2 AMI.

        @[JSON::Field(key: "AmiDescription")]
        getter ami_description : String?

        # The ID of the EC2 AMI that was created by this export task. This field is only populated when the
        # task completes successfully.

        @[JSON::Field(key: "AmiId")]
        getter ami_id : String?

        # Details about any errors that occurred during the export process. This field is only populated when
        # the task fails.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetails)?

        # The current state of the export image task, such as PENDING, RUNNING, COMPLETED, or FAILED.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags that will be applied to the exported EC2 AMI.

        @[JSON::Field(key: "TagSpecifications")]
        getter tag_specifications : Hash(String, String)?

        def initialize(
          @ami_name : String,
          @created_date : Time,
          @image_arn : String,
          @task_id : String,
          @ami_description : String? = nil,
          @ami_id : String? = nil,
          @error_details : Array(Types::ErrorDetails)? = nil,
          @state : String? = nil,
          @tag_specifications : Hash(String, String)? = nil
        )
        end
      end

      # A filter for narrowing down the results when listing export image tasks. Filters allow you to
      # specify criteria such as task state or creation date.

      struct Filter
        include JSON::Serializable

        # The name of the filter. Valid filter names depend on the operation being performed.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The values for the filter. Multiple values can be specified for a single filter name.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Describes a fleet.

      struct Fleet
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the fleet.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The capacity status for the fleet.

        @[JSON::Field(key: "ComputeCapacityStatus")]
        getter compute_capacity_status : Types::ComputeCapacityStatus

        # The instance type to use when launching fleet instances. The following instance types are available:
        # stream.standard.small stream.standard.medium stream.standard.large stream.compute.large
        # stream.compute.xlarge stream.compute.2xlarge stream.compute.4xlarge stream.compute.8xlarge
        # stream.memory.large stream.memory.xlarge stream.memory.2xlarge stream.memory.4xlarge
        # stream.memory.8xlarge stream.memory.z1d.large stream.memory.z1d.xlarge stream.memory.z1d.2xlarge
        # stream.memory.z1d.3xlarge stream.memory.z1d.6xlarge stream.memory.z1d.12xlarge
        # stream.graphics.g4dn.xlarge stream.graphics.g4dn.2xlarge stream.graphics.g4dn.4xlarge
        # stream.graphics.g4dn.8xlarge stream.graphics.g4dn.12xlarge stream.graphics.g4dn.16xlarge
        # stream.graphics.g5.xlarge stream.graphics.g5.2xlarge stream.graphics.g5.4xlarge
        # stream.graphics.g5.8xlarge stream.graphics.g5.16xlarge stream.graphics.g5.12xlarge
        # stream.graphics.g5.24xlarge stream.graphics.g6.xlarge stream.graphics.g6.2xlarge
        # stream.graphics.g6.4xlarge stream.graphics.g6.8xlarge stream.graphics.g6.16xlarge
        # stream.graphics.g6.12xlarge stream.graphics.g6.24xlarge stream.graphics.gr6.4xlarge
        # stream.graphics.gr6.8xlarge stream.graphics.g6f.large stream.graphics.g6f.xlarge
        # stream.graphics.g6f.2xlarge stream.graphics.g6f.4xlarge stream.graphics.gr6f.4xlarge

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # The name of the fleet.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The current state for the fleet.

        @[JSON::Field(key: "State")]
        getter state : String

        # The time the fleet was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The amount of time that a streaming session remains active after users disconnect. If they try to
        # reconnect to the streaming session after a disconnection or network interruption within this time
        # interval, they are connected to their previous session. Otherwise, they are connected to a new
        # session with a new streaming instance. Specify a value between 60 and 36000.

        @[JSON::Field(key: "DisconnectTimeoutInSeconds")]
        getter disconnect_timeout_in_seconds : Int32?

        # The fleet name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name of the directory and organizational unit (OU) to use to join the fleet to a Microsoft
        # Active Directory domain.

        @[JSON::Field(key: "DomainJoinInfo")]
        getter domain_join_info : Types::DomainJoinInfo?

        # Indicates whether default internet access is enabled for the fleet.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The fleet errors.

        @[JSON::Field(key: "FleetErrors")]
        getter fleet_errors : Array(Types::FleetError)?

        # The fleet type. ALWAYS_ON Provides users with instant-on access to their apps. You are charged for
        # all running instances in your fleet, even if no users are streaming apps. ON_DEMAND Provide users
        # with access to applications after they connect, which takes one to two minutes. You are charged for
        # instance streaming when users are connected and a small hourly fee for instances that are not
        # streaming apps.

        @[JSON::Field(key: "FleetType")]
        getter fleet_type : String?

        # The ARN of the IAM role that is applied to the fleet. To assume a role, the fleet instance calls the
        # AWS Security Token Service (STS) AssumeRole API operation and passes the ARN of the role to use. The
        # operation creates a new session with temporary credentials. WorkSpaces Applications retrieves the
        # temporary credentials and creates the appstream_machine_role credential profile on the instance. For
        # more information, see Using an IAM Role to Grant Permissions to Applications and Scripts Running on
        # WorkSpaces Applications Streaming Instances in the Amazon WorkSpaces Applications Administration
        # Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The amount of time that users can be idle (inactive) before they are disconnected from their
        # streaming session and the DisconnectTimeoutInSeconds time interval begins. Users are notified before
        # they are disconnected due to inactivity. If users try to reconnect to the streaming session before
        # the time interval specified in DisconnectTimeoutInSeconds elapses, they are connected to their
        # previous session. Users are considered idle when they stop providing keyboard or mouse input during
        # their streaming session. File uploads and downloads, audio in, audio out, and pixels changing do not
        # qualify as user activity. If users continue to be idle after the time interval in
        # IdleDisconnectTimeoutInSeconds elapses, they are disconnected. To prevent users from being
        # disconnected due to inactivity, specify a value of 0. Otherwise, specify a value between 60 and
        # 36000. The default value is 0. If you enable this feature, we recommend that you specify a value
        # that corresponds exactly to a whole number of minutes (for example, 60, 120, and 180). If you don't
        # do this, the value is rounded to the nearest minute. For example, if you specify a value of 70,
        # users are disconnected after 1 minute of inactivity. If you specify a value that is at the midpoint
        # between two different minutes, the value is rounded up. For example, if you specify a value of 90,
        # users are disconnected after 2 minutes of inactivity.

        @[JSON::Field(key: "IdleDisconnectTimeoutInSeconds")]
        getter idle_disconnect_timeout_in_seconds : Int32?

        # The ARN for the public, private, or shared image.

        @[JSON::Field(key: "ImageArn")]
        getter image_arn : String?

        # The name of the image used to create the fleet.

        @[JSON::Field(key: "ImageName")]
        getter image_name : String?

        # The maximum number of concurrent sessions for the fleet.

        @[JSON::Field(key: "MaxConcurrentSessions")]
        getter max_concurrent_sessions : Int32?

        # The maximum number of user sessions on an instance. This only applies to multi-session fleets.

        @[JSON::Field(key: "MaxSessionsPerInstance")]
        getter max_sessions_per_instance : Int32?

        # The maximum amount of time that a streaming session can remain active, in seconds. If users are
        # still connected to a streaming instance five minutes before this limit is reached, they are prompted
        # to save any open documents before being disconnected. After this time elapses, the instance is
        # terminated and replaced by a new instance. Specify a value between 600 and 360000.

        @[JSON::Field(key: "MaxUserDurationInSeconds")]
        getter max_user_duration_in_seconds : Int32?

        # The platform of the fleet.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The current configuration of the root volume for fleet instances, including the storage size in GB.

        @[JSON::Field(key: "RootVolumeConfig")]
        getter root_volume_config : Types::VolumeConfig?

        # The S3 location of the session scripts configuration zip file. This only applies to Elastic fleets.

        @[JSON::Field(key: "SessionScriptS3Location")]
        getter session_script_s3_location : Types::S3Location?

        # The WorkSpaces Applications view that is displayed to your users when they stream from the fleet.
        # When APP is specified, only the windows of applications opened by users display. When DESKTOP is
        # specified, the standard desktop that is provided by the operating system displays. The default value
        # is APP .

        @[JSON::Field(key: "StreamView")]
        getter stream_view : String?

        # The USB device filter strings associated with the fleet.

        @[JSON::Field(key: "UsbDeviceFilterStrings")]
        getter usb_device_filter_strings : Array(String)?

        # The VPC configuration for the fleet.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @arn : String,
          @compute_capacity_status : Types::ComputeCapacityStatus,
          @instance_type : String,
          @name : String,
          @state : String,
          @created_time : Time? = nil,
          @description : String? = nil,
          @disconnect_timeout_in_seconds : Int32? = nil,
          @display_name : String? = nil,
          @domain_join_info : Types::DomainJoinInfo? = nil,
          @enable_default_internet_access : Bool? = nil,
          @fleet_errors : Array(Types::FleetError)? = nil,
          @fleet_type : String? = nil,
          @iam_role_arn : String? = nil,
          @idle_disconnect_timeout_in_seconds : Int32? = nil,
          @image_arn : String? = nil,
          @image_name : String? = nil,
          @max_concurrent_sessions : Int32? = nil,
          @max_sessions_per_instance : Int32? = nil,
          @max_user_duration_in_seconds : Int32? = nil,
          @platform : String? = nil,
          @root_volume_config : Types::VolumeConfig? = nil,
          @session_script_s3_location : Types::S3Location? = nil,
          @stream_view : String? = nil,
          @usb_device_filter_strings : Array(String)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Describes a fleet error.

      struct FleetError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct GetExportImageTaskRequest
        include JSON::Serializable

        # The unique identifier of the export image task to retrieve information about.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        def initialize(
          @task_id : String? = nil
        )
        end
      end


      struct GetExportImageTaskResult
        include JSON::Serializable

        # Information about the export image task, including its current state, created date, and any error
        # details.

        @[JSON::Field(key: "ExportImageTask")]
        getter export_image_task : Types::ExportImageTask?

        def initialize(
          @export_image_task : Types::ExportImageTask? = nil
        )
        end
      end

      # Describes an image.

      struct Image
        include JSON::Serializable

        # The name of the image.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The applications associated with the image.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::Application)?

        # The version of the WorkSpaces Applications agent to use for instances that are launched from this
        # image.

        @[JSON::Field(key: "AppstreamAgentVersion")]
        getter appstream_agent_version : String?

        # The ARN of the image.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ARN of the image from which this image was created.

        @[JSON::Field(key: "BaseImageArn")]
        getter base_image_arn : String?

        # The time the image was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The image name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Indicates whether dynamic app providers are enabled within an WorkSpaces Applications image or not.

        @[JSON::Field(key: "DynamicAppProvidersEnabled")]
        getter dynamic_app_providers_enabled : String?

        # The name of the image builder that was used to create the private image. If the image is shared,
        # copied, or updated by using Managed Image Updates, this value is null.

        @[JSON::Field(key: "ImageBuilderName")]
        getter image_builder_name : String?

        # Indicates whether an image builder can be launched from this image.

        @[JSON::Field(key: "ImageBuilderSupported")]
        getter image_builder_supported : Bool?

        # Describes the errors that are returned when a new image can't be created.

        @[JSON::Field(key: "ImageErrors")]
        getter image_errors : Array(Types::ResourceError)?

        # The permissions to provide to the destination AWS account for the specified image.

        @[JSON::Field(key: "ImagePermissions")]
        getter image_permissions : Types::ImagePermissions?

        # Indicates whether the image is shared with another account ID.

        @[JSON::Field(key: "ImageSharedWithOthers")]
        getter image_shared_with_others : String?

        # The type of the image. Images created through AMI import have type "custom", while WorkSpaces
        # Applications provided images have type "native". Custom images support additional instance types
        # including GeneralPurpose, MemoryOptimized, ComputeOptimized, and Accelerated instance families.

        @[JSON::Field(key: "ImageType")]
        getter image_type : String?

        # Indicates whether the image is using the latest WorkSpaces Applications agent version or not.

        @[JSON::Field(key: "LatestAppstreamAgentVersion")]
        getter latest_appstream_agent_version : String?

        # Indicates whether the image includes license-included applications.

        @[JSON::Field(key: "ManagedSoftwareIncluded")]
        getter managed_software_included : Bool?

        # The operating system platform of the image.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The release date of the public base image. For private images, this date is the release date of the
        # base image from which the image was created.

        @[JSON::Field(key: "PublicBaseImageReleasedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter public_base_image_released_date : Time?

        # The image starts in the PENDING state. If image creation succeeds, the state is AVAILABLE . If image
        # creation fails, the state is FAILED .

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason why the last state change occurred.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::ImageStateChangeReason?

        # The supported instances families that determine which image a customer can use when the customer
        # launches a fleet or image builder. The following instances families are supported: General Purpose
        # Compute Optimized Memory Optimized Graphics G4 Graphics G5 Graphics G6

        @[JSON::Field(key: "SupportedInstanceFamilies")]
        getter supported_instance_families : Array(String)?

        # Indicates whether the image is public or private.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @name : String,
          @applications : Array(Types::Application)? = nil,
          @appstream_agent_version : String? = nil,
          @arn : String? = nil,
          @base_image_arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @dynamic_app_providers_enabled : String? = nil,
          @image_builder_name : String? = nil,
          @image_builder_supported : Bool? = nil,
          @image_errors : Array(Types::ResourceError)? = nil,
          @image_permissions : Types::ImagePermissions? = nil,
          @image_shared_with_others : String? = nil,
          @image_type : String? = nil,
          @latest_appstream_agent_version : String? = nil,
          @managed_software_included : Bool? = nil,
          @platform : String? = nil,
          @public_base_image_released_date : Time? = nil,
          @state : String? = nil,
          @state_change_reason : Types::ImageStateChangeReason? = nil,
          @supported_instance_families : Array(String)? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Describes a virtual machine that is used to create an image.

      struct ImageBuilder
        include JSON::Serializable

        # The name of the image builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The list of virtual private cloud (VPC) interface endpoint objects. Administrators can connect to
        # the image builder only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The version of the WorkSpaces Applications agent that is currently being used by the image builder.

        @[JSON::Field(key: "AppstreamAgentVersion")]
        getter appstream_agent_version : String?

        # The ARN for the image builder.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time stamp when the image builder was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The image builder name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name of the directory and organizational unit (OU) to use to join the image builder to a
        # Microsoft Active Directory domain.

        @[JSON::Field(key: "DomainJoinInfo")]
        getter domain_join_info : Types::DomainJoinInfo?

        # Enables or disables default internet access for the image builder.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The ARN of the IAM role that is applied to the image builder. To assume a role, the image builder
        # calls the AWS Security Token Service (STS) AssumeRole API operation and passes the ARN of the role
        # to use. The operation creates a new session with temporary credentials. WorkSpaces Applications
        # retrieves the temporary credentials and creates the appstream_machine_role credential profile on the
        # instance. For more information, see Using an IAM Role to Grant Permissions to Applications and
        # Scripts Running on WorkSpaces Applications Streaming Instances in the Amazon WorkSpaces Applications
        # Administration Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The ARN of the image from which this builder was created.

        @[JSON::Field(key: "ImageArn")]
        getter image_arn : String?

        # The image builder errors.

        @[JSON::Field(key: "ImageBuilderErrors")]
        getter image_builder_errors : Array(Types::ResourceError)?

        # The instance type for the image builder. The following instance types are available:
        # stream.standard.small stream.standard.medium stream.standard.large stream.compute.large
        # stream.compute.xlarge stream.compute.2xlarge stream.compute.4xlarge stream.compute.8xlarge
        # stream.memory.large stream.memory.xlarge stream.memory.2xlarge stream.memory.4xlarge
        # stream.memory.8xlarge stream.memory.z1d.large stream.memory.z1d.xlarge stream.memory.z1d.2xlarge
        # stream.memory.z1d.3xlarge stream.memory.z1d.6xlarge stream.memory.z1d.12xlarge
        # stream.graphics.g4dn.xlarge stream.graphics.g4dn.2xlarge stream.graphics.g4dn.4xlarge
        # stream.graphics.g4dn.8xlarge stream.graphics.g4dn.12xlarge stream.graphics.g4dn.16xlarge
        # stream.graphics.g5.xlarge stream.graphics.g5.2xlarge stream.graphics.g5.4xlarge
        # stream.graphics.g5.8xlarge stream.graphics.g5.16xlarge stream.graphics.g5.12xlarge
        # stream.graphics.g5.24xlarge stream.graphics.g6.xlarge stream.graphics.g6.2xlarge
        # stream.graphics.g6.4xlarge stream.graphics.g6.8xlarge stream.graphics.g6.16xlarge
        # stream.graphics.g6.12xlarge stream.graphics.g6.24xlarge stream.graphics.gr6.4xlarge
        # stream.graphics.gr6.8xlarge stream.graphics.g6f.large stream.graphics.g6f.xlarge
        # stream.graphics.g6f.2xlarge stream.graphics.g6f.4xlarge stream.graphics.gr6f.4xlarge

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # Indicates whether the image builder is using the latest WorkSpaces Applications agent version or
        # not.

        @[JSON::Field(key: "LatestAppstreamAgentVersion")]
        getter latest_appstream_agent_version : String?


        @[JSON::Field(key: "NetworkAccessConfiguration")]
        getter network_access_configuration : Types::NetworkAccessConfiguration?

        # The operating system platform of the image builder.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The current configuration of the root volume for the image builder, including the storage size in
        # GB.

        @[JSON::Field(key: "RootVolumeConfig")]
        getter root_volume_config : Types::VolumeConfig?

        # The state of the image builder.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason why the last state change occurred.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::ImageBuilderStateChangeReason?

        # The VPC configuration of the image builder.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @name : String,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @appstream_agent_version : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @domain_join_info : Types::DomainJoinInfo? = nil,
          @enable_default_internet_access : Bool? = nil,
          @iam_role_arn : String? = nil,
          @image_arn : String? = nil,
          @image_builder_errors : Array(Types::ResourceError)? = nil,
          @instance_type : String? = nil,
          @latest_appstream_agent_version : String? = nil,
          @network_access_configuration : Types::NetworkAccessConfiguration? = nil,
          @platform : String? = nil,
          @root_volume_config : Types::VolumeConfig? = nil,
          @state : String? = nil,
          @state_change_reason : Types::ImageBuilderStateChangeReason? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Describes the reason why the last image builder state change occurred.

      struct ImageBuilderStateChangeReason
        include JSON::Serializable

        # The state change reason code.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The state change reason message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes the permissions for an image.

      struct ImagePermissions
        include JSON::Serializable

        # Indicates whether the image can be used for a fleet.

        @[JSON::Field(key: "allowFleet")]
        getter allow_fleet : Bool?

        # Indicates whether the image can be used for an image builder.

        @[JSON::Field(key: "allowImageBuilder")]
        getter allow_image_builder : Bool?

        def initialize(
          @allow_fleet : Bool? = nil,
          @allow_image_builder : Bool? = nil
        )
        end
      end

      # Describes the reason why the last image state change occurred.

      struct ImageStateChangeReason
        include JSON::Serializable

        # The state change reason code.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The state change reason message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The image can't be updated because it's not compatible for updates.

      struct IncompatibleImageException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource cannot be created because your AWS account is suspended. For assistance, contact AWS
      # Support.

      struct InvalidAccountStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates an incorrect combination of parameters, or a missing parameter.

      struct InvalidParameterCombinationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified role is invalid.

      struct InvalidRoleException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the error that is returned when a usage report can't be generated.

      struct LastReportGenerationExecutionError
        include JSON::Serializable

        # The error code for the error that is returned when a usage report can't be generated.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message for the error that is returned when a usage report can't be generated.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # The requested limit exceeds the permitted limit for an account.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAssociatedFleetsRequest
        include JSON::Serializable

        # The name of the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedFleetsResult
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedStacksRequest
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedStacksResult
        include JSON::Serializable

        # The name of the stack.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEntitledApplicationsRequest
        include JSON::Serializable

        # The name of the entitlement.

        @[JSON::Field(key: "EntitlementName")]
        getter entitlement_name : String

        # The name of the stack with which the entitlement is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The maximum size of each page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entitlement_name : String,
          @stack_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEntitledApplicationsResult
        include JSON::Serializable

        # The entitled applications.

        @[JSON::Field(key: "EntitledApplications")]
        getter entitled_applications : Array(Types::EntitledApplication)?

        # The pagination token used to retrieve the next page of results for this operation.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entitled_applications : Array(Types::EntitledApplication)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExportImageTasksRequest
        include JSON::Serializable

        # Optional filters to apply when listing export image tasks. Filters help you narrow down the results
        # based on specific criteria.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of export image tasks to return in a single request. The valid range is 1-500,
        # with a default of 50.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request. Use this to retrieve the next page of results when
        # there are more tasks than the MaxResults limit.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExportImageTasksResult
        include JSON::Serializable

        # The list of export image tasks that match the specified criteria.

        @[JSON::Field(key: "ExportImageTasks")]
        getter export_image_tasks : Array(Types::ExportImageTask)?

        # The pagination token to use for retrieving the next page of results. This field is only present when
        # there are more results available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @export_image_tasks : Array(Types::ExportImageTask)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The information about the tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes the network details of the fleet or image builder instance.

      struct NetworkAccessConfiguration
        include JSON::Serializable

        # The resource identifier of the elastic network interface that is attached to instances in your VPC.
        # All network interfaces have the eni-xxxxxxxx resource identifier.

        @[JSON::Field(key: "EniId")]
        getter eni_id : String?

        # The IPv6 addresses assigned to the elastic network interface. This field supports IPv6 connectivity
        # for WorkSpaces Applications instances.

        @[JSON::Field(key: "EniIpv6Addresses")]
        getter eni_ipv6_addresses : Array(String)?

        # The private IP address of the elastic network interface that is attached to instances in your VPC.

        @[JSON::Field(key: "EniPrivateIpAddress")]
        getter eni_private_ip_address : String?

        def initialize(
          @eni_id : String? = nil,
          @eni_ipv6_addresses : Array(String)? = nil,
          @eni_private_ip_address : String? = nil
        )
        end
      end

      # The attempted operation is not permitted.

      struct OperationNotPermittedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WorkSpaces Applications can’t process the request right now because the Describe calls from your AWS
      # account are being throttled by Amazon EC2. Try again later.

      struct RequestLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a resource error.

      struct ResourceError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The time the error occurred.

        @[JSON::Field(key: "ErrorTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter error_timestamp : Time?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @error_timestamp : Time? = nil
        )
        end
      end

      # The specified resource is in use.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource exists and is not in use, but isn't available.

      struct ResourceNotAvailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration for runtime validation of imported images. This structure specifies the instance type
      # to use for testing the imported image's streaming capabilities.

      struct RuntimeValidationConfig
        include JSON::Serializable

        # The instance type to use for runtime validation testing. It's recommended to use the same instance
        # type you plan to use for your fleet to ensure accurate validation results.

        @[JSON::Field(key: "IntendedInstanceType")]
        getter intended_instance_type : String?

        def initialize(
          @intended_instance_type : String? = nil
        )
        end
      end

      # Describes the S3 location.

      struct S3Location
        include JSON::Serializable

        # The S3 bucket of the S3 object.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The S3 key of the S3 object. This is required when used for the following: IconS3Location (Actions:
        # CreateApplication and UpdateApplication) SessionScriptS3Location (Actions: CreateFleet and
        # UpdateFleet) ScriptDetails (Actions: CreateAppBlock) SourceS3Location when creating an app block
        # with CUSTOM PackagingType (Actions: CreateAppBlock) SourceS3Location when creating an app block with
        # APPSTREAM2 PackagingType, and using an existing application package (VHD file). In this case, S3Key
        # refers to the VHD file. If a new application package is required, then S3Key is not required.
        # (Actions: CreateAppBlock)

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        def initialize(
          @s3_bucket : String,
          @s3_key : String? = nil
        )
        end
      end

      # Describes the details of the script.

      struct ScriptDetails
        include JSON::Serializable

        # The run path for the script.

        @[JSON::Field(key: "ExecutablePath")]
        getter executable_path : String

        # The S3 object location for the script.

        @[JSON::Field(key: "ScriptS3Location")]
        getter script_s3_location : Types::S3Location

        # The run timeout, in seconds, for the script.

        @[JSON::Field(key: "TimeoutInSeconds")]
        getter timeout_in_seconds : Int32

        # The runtime parameters passed to the run path for the script.

        @[JSON::Field(key: "ExecutableParameters")]
        getter executable_parameters : String?

        def initialize(
          @executable_path : String,
          @script_s3_location : Types::S3Location,
          @timeout_in_seconds : Int32,
          @executable_parameters : String? = nil
        )
        end
      end

      # Describes the credentials for the service account used by the fleet or image builder to connect to
      # the directory.

      struct ServiceAccountCredentials
        include JSON::Serializable

        # The user name of the account. This account must have the following privileges: create computer
        # objects, join computers to the domain, and change/reset the password on descendant computer objects
        # for the organizational units specified.

        @[JSON::Field(key: "AccountName")]
        getter account_name : String

        # The password for the account.

        @[JSON::Field(key: "AccountPassword")]
        getter account_password : String

        def initialize(
          @account_name : String,
          @account_password : String
        )
        end
      end

      # Describes a streaming session.

      struct Session
        include JSON::Serializable

        # The name of the fleet for the streaming session.

        @[JSON::Field(key: "FleetName")]
        getter fleet_name : String

        # The identifier of the streaming session.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the stack for the streaming session.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The current state of the streaming session.

        @[JSON::Field(key: "State")]
        getter state : String

        # The identifier of the user for whom the session was created.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # The authentication method. The user is authenticated using a streaming URL ( API ) or SAML 2.0
        # federation ( SAML ).

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String?

        # Specifies whether a user is connected to the streaming session.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # The identifier for the instance hosting the session.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The time when the streaming session is set to expire. This time is based on the
        # MaxUserDurationinSeconds value, which determines the maximum length of time that a streaming session
        # can run. A streaming session might end earlier than the time specified in SessionMaxExpirationTime ,
        # when the DisconnectTimeOutInSeconds elapses or the user chooses to end his or her session. If the
        # DisconnectTimeOutInSeconds elapses, or the user chooses to end his or her session, the streaming
        # instance is terminated and the streaming session ends.

        @[JSON::Field(key: "MaxExpirationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter max_expiration_time : Time?

        # The network details for the streaming session.

        @[JSON::Field(key: "NetworkAccessConfiguration")]
        getter network_access_configuration : Types::NetworkAccessConfiguration?

        # The time when a streaming instance is dedicated for the user.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @fleet_name : String,
          @id : String,
          @stack_name : String,
          @state : String,
          @user_id : String,
          @authentication_type : String? = nil,
          @connection_state : String? = nil,
          @instance_id : String? = nil,
          @max_expiration_time : Time? = nil,
          @network_access_configuration : Types::NetworkAccessConfiguration? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Describes the permissions that are available to the specified AWS account for a shared image.

      struct SharedImagePermissions
        include JSON::Serializable

        # Describes the permissions for a shared image.

        @[JSON::Field(key: "imagePermissions")]
        getter image_permissions : Types::ImagePermissions

        # The 12-digit identifier of the AWS account with which the image is shared.

        @[JSON::Field(key: "sharedAccountId")]
        getter shared_account_id : String

        def initialize(
          @image_permissions : Types::ImagePermissions,
          @shared_account_id : String
        )
        end
      end

      # The association between a license-included application and a resource.

      struct SoftwareAssociations
        include JSON::Serializable

        # The error details for failed deployments of the license-included application.

        @[JSON::Field(key: "DeploymentError")]
        getter deployment_error : Array(Types::ErrorDetails)?

        # The name of the license-included application. Possible values include the following:
        # Microsoft_Office_2021_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2021_LTSC_Professional_Plus_64Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_32Bit
        # Microsoft_Office_2024_LTSC_Professional_Plus_64Bit Microsoft_Visio_2021_LTSC_Professional_32Bit
        # Microsoft_Visio_2021_LTSC_Professional_64Bit Microsoft_Visio_2024_LTSC_Professional_32Bit
        # Microsoft_Visio_2024_LTSC_Professional_64Bit Microsoft_Project_2021_Professional_32Bit
        # Microsoft_Project_2021_Professional_64Bit Microsoft_Project_2024_Professional_32Bit
        # Microsoft_Project_2024_Professional_64Bit Microsoft_Office_2021_LTSC_Standard_32Bit
        # Microsoft_Office_2021_LTSC_Standard_64Bit Microsoft_Office_2024_LTSC_Standard_32Bit
        # Microsoft_Office_2024_LTSC_Standard_64Bit Microsoft_Visio_2021_LTSC_Standard_32Bit
        # Microsoft_Visio_2021_LTSC_Standard_64Bit Microsoft_Visio_2024_LTSC_Standard_32Bit
        # Microsoft_Visio_2024_LTSC_Standard_64Bit Microsoft_Project_2021_Standard_32Bit
        # Microsoft_Project_2021_Standard_64Bit Microsoft_Project_2024_Standard_32Bit
        # Microsoft_Project_2024_Standard_64Bit

        @[JSON::Field(key: "SoftwareName")]
        getter software_name : String?

        # The deployment status of the license-included application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @deployment_error : Array(Types::ErrorDetails)? = nil,
          @software_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a stack.

      struct Stack
        include JSON::Serializable

        # The name of the stack.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The list of virtual private cloud (VPC) interface endpoint objects. Users of the stack can connect
        # to WorkSpaces Applications only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The persistent application settings for users of the stack.

        @[JSON::Field(key: "ApplicationSettings")]
        getter application_settings : Types::ApplicationSettingsResponse?

        # The ARN of the stack.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the stack was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The stack name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The domains where WorkSpaces Applications streaming sessions can be embedded in an iframe. You must
        # approve the domains that you want to host embedded WorkSpaces Applications streaming sessions.

        @[JSON::Field(key: "EmbedHostDomains")]
        getter embed_host_domains : Array(String)?

        # The URL that users are redirected to after they click the Send Feedback link. If no URL is
        # specified, no Send Feedback link is displayed.

        @[JSON::Field(key: "FeedbackURL")]
        getter feedback_url : String?

        # The URL that users are redirected to after their streaming session ends.

        @[JSON::Field(key: "RedirectURL")]
        getter redirect_url : String?

        # The errors for the stack.

        @[JSON::Field(key: "StackErrors")]
        getter stack_errors : Array(Types::StackError)?

        # The storage connectors to enable.

        @[JSON::Field(key: "StorageConnectors")]
        getter storage_connectors : Array(Types::StorageConnector)?

        # The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, UDP is only
        # supported in the Windows native client.

        @[JSON::Field(key: "StreamingExperienceSettings")]
        getter streaming_experience_settings : Types::StreamingExperienceSettings?

        # The actions that are enabled or disabled for users during their streaming sessions. By default these
        # actions are enabled.

        @[JSON::Field(key: "UserSettings")]
        getter user_settings : Array(Types::UserSetting)?

        def initialize(
          @name : String,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @application_settings : Types::ApplicationSettingsResponse? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @embed_host_domains : Array(String)? = nil,
          @feedback_url : String? = nil,
          @redirect_url : String? = nil,
          @stack_errors : Array(Types::StackError)? = nil,
          @storage_connectors : Array(Types::StorageConnector)? = nil,
          @streaming_experience_settings : Types::StreamingExperienceSettings? = nil,
          @user_settings : Array(Types::UserSetting)? = nil
        )
        end
      end

      # Describes a stack error.

      struct StackError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct StartAppBlockBuilderRequest
        include JSON::Serializable

        # The name of the app block builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct StartAppBlockBuilderResult
        include JSON::Serializable


        @[JSON::Field(key: "AppBlockBuilder")]
        getter app_block_builder : Types::AppBlockBuilder?

        def initialize(
          @app_block_builder : Types::AppBlockBuilder? = nil
        )
        end
      end


      struct StartFleetRequest
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct StartFleetResult
        include JSON::Serializable

        def initialize
        end
      end


      struct StartImageBuilderRequest
        include JSON::Serializable

        # The name of the image builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The version of the WorkSpaces Applications agent to use for this image builder. To use the latest
        # version of the WorkSpaces Applications agent, specify [LATEST].

        @[JSON::Field(key: "AppstreamAgentVersion")]
        getter appstream_agent_version : String?

        def initialize(
          @name : String,
          @appstream_agent_version : String? = nil
        )
        end
      end


      struct StartImageBuilderResult
        include JSON::Serializable

        # Information about the image builder.

        @[JSON::Field(key: "ImageBuilder")]
        getter image_builder : Types::ImageBuilder?

        def initialize(
          @image_builder : Types::ImageBuilder? = nil
        )
        end
      end


      struct StartSoftwareDeploymentToImageBuilderRequest
        include JSON::Serializable

        # The name of the target image builder instance.

        @[JSON::Field(key: "ImageBuilderName")]
        getter image_builder_name : String

        # Whether to retry previously failed license included application deployments.

        @[JSON::Field(key: "RetryFailedDeployments")]
        getter retry_failed_deployments : Bool?

        def initialize(
          @image_builder_name : String,
          @retry_failed_deployments : Bool? = nil
        )
        end
      end


      struct StartSoftwareDeploymentToImageBuilderResult
        include JSON::Serializable

        def initialize
        end
      end


      struct StopAppBlockBuilderRequest
        include JSON::Serializable

        # The name of the app block builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct StopAppBlockBuilderResult
        include JSON::Serializable


        @[JSON::Field(key: "AppBlockBuilder")]
        getter app_block_builder : Types::AppBlockBuilder?

        def initialize(
          @app_block_builder : Types::AppBlockBuilder? = nil
        )
        end
      end


      struct StopFleetRequest
        include JSON::Serializable

        # The name of the fleet.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct StopFleetResult
        include JSON::Serializable

        def initialize
        end
      end


      struct StopImageBuilderRequest
        include JSON::Serializable

        # The name of the image builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct StopImageBuilderResult
        include JSON::Serializable

        # Information about the image builder.

        @[JSON::Field(key: "ImageBuilder")]
        getter image_builder : Types::ImageBuilder?

        def initialize(
          @image_builder : Types::ImageBuilder? = nil
        )
        end
      end

      # Describes a connector that enables persistent storage for users.

      struct StorageConnector
        include JSON::Serializable

        # The type of storage connector.

        @[JSON::Field(key: "ConnectorType")]
        getter connector_type : String

        # The names of the domains for the account.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(String)?

        # The OneDrive for Business domains where you require admin consent when users try to link their
        # OneDrive account to WorkSpaces Applications. The attribute can only be specified when
        # ConnectorType=ONE_DRIVE.

        @[JSON::Field(key: "DomainsRequireAdminConsent")]
        getter domains_require_admin_consent : Array(String)?

        # The ARN of the storage connector.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        def initialize(
          @connector_type : String,
          @domains : Array(String)? = nil,
          @domains_require_admin_consent : Array(String)? = nil,
          @resource_identifier : String? = nil
        )
        end
      end

      # The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, UDP is only
      # supported in the Windows native client.

      struct StreamingExperienceSettings
        include JSON::Serializable

        # The preferred protocol that you want to use while streaming your application.

        @[JSON::Field(key: "PreferredProtocol")]
        getter preferred_protocol : String?

        def initialize(
          @preferred_protocol : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to associate. A tag is a key-value pair, and the value is optional. For example,
        # Environment=Test. If you do not specify a value, Environment=. If you do not specify a value, the
        # value is set to an empty string. Generally allowed characters are: letters, numbers, and spaces
        # representable in UTF-8, and the following special characters: _ . : / = + \ - @

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

      # The custom branding theme, which might include a custom logo, website links, and other branding to
      # display to users.

      struct Theme
        include JSON::Serializable

        # The time the theme was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The stack that has the custom branding theme.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # The state of the theme.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The URL of the icon that displays at the top of a user's browser tab during streaming sessions.

        @[JSON::Field(key: "ThemeFaviconURL")]
        getter theme_favicon_url : String?

        # The website links that display in the catalog page footer.

        @[JSON::Field(key: "ThemeFooterLinks")]
        getter theme_footer_links : Array(Types::ThemeFooterLink)?

        # The URL of the logo that displays in the catalog page header.

        @[JSON::Field(key: "ThemeOrganizationLogoURL")]
        getter theme_organization_logo_url : String?

        # The color that is used for the website links, text, buttons, and catalog page background.

        @[JSON::Field(key: "ThemeStyling")]
        getter theme_styling : String?

        # The browser tab page title.

        @[JSON::Field(key: "ThemeTitleText")]
        getter theme_title_text : String?

        def initialize(
          @created_time : Time? = nil,
          @stack_name : String? = nil,
          @state : String? = nil,
          @theme_favicon_url : String? = nil,
          @theme_footer_links : Array(Types::ThemeFooterLink)? = nil,
          @theme_organization_logo_url : String? = nil,
          @theme_styling : String? = nil,
          @theme_title_text : String? = nil
        )
        end
      end

      # The website links that display in the catalog page footer.

      struct ThemeFooterLink
        include JSON::Serializable

        # The name of the websites that display in the catalog page footer.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The URL of the websites that display in the catalog page footer.

        @[JSON::Field(key: "FooterLinkURL")]
        getter footer_link_url : String?

        def initialize(
          @display_name : String? = nil,
          @footer_link_url : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys for the tags to disassociate.

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


      struct UpdateAppBlockBuilderRequest
        include JSON::Serializable

        # The unique name for the app block builder.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The list of interface VPC endpoint (interface endpoint) objects. Administrators can connect to the
        # app block builder only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The attributes to delete from the app block builder.

        @[JSON::Field(key: "AttributesToDelete")]
        getter attributes_to_delete : Array(String)?

        # The description of the app block builder.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the app block builder.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Enables or disables default internet access for the app block builder.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The Amazon Resource Name (ARN) of the IAM role to apply to the app block builder. To assume a role,
        # the app block builder calls the AWS Security Token Service (STS) AssumeRole API operation and passes
        # the ARN of the role to use. The operation creates a new session with temporary credentials.
        # WorkSpaces Applications retrieves the temporary credentials and creates the appstream_machine_role
        # credential profile on the instance. For more information, see Using an IAM Role to Grant Permissions
        # to Applications and Scripts Running on WorkSpaces Applications Streaming Instances in the Amazon
        # WorkSpaces Applications Administration Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The instance type to use when launching the app block builder. The following instance types are
        # available: stream.standard.small stream.standard.medium stream.standard.large stream.standard.xlarge
        # stream.standard.2xlarge

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The platform of the app block builder. WINDOWS_SERVER_2019 is the only valid value.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The VPC configuration for the app block builder. App block builders require that you specify at
        # least two subnets in different availability zones.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @name : String,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @attributes_to_delete : Array(String)? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @enable_default_internet_access : Bool? = nil,
          @iam_role_arn : String? = nil,
          @instance_type : String? = nil,
          @platform : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct UpdateAppBlockBuilderResult
        include JSON::Serializable


        @[JSON::Field(key: "AppBlockBuilder")]
        getter app_block_builder : Types::AppBlockBuilder?

        def initialize(
          @app_block_builder : Types::AppBlockBuilder? = nil
        )
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # The name of the application. This name is visible to users when display name is not specified.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ARN of the app block.

        @[JSON::Field(key: "AppBlockArn")]
        getter app_block_arn : String?

        # The attributes to delete for an application.

        @[JSON::Field(key: "AttributesToDelete")]
        getter attributes_to_delete : Array(String)?

        # The description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the application. This name is visible to users in the application catalog.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The icon S3 location of the application.

        @[JSON::Field(key: "IconS3Location")]
        getter icon_s3_location : Types::S3Location?

        # The launch parameters of the application.

        @[JSON::Field(key: "LaunchParameters")]
        getter launch_parameters : String?

        # The launch path of the application.

        @[JSON::Field(key: "LaunchPath")]
        getter launch_path : String?

        # The working directory of the application.

        @[JSON::Field(key: "WorkingDirectory")]
        getter working_directory : String?

        def initialize(
          @name : String,
          @app_block_arn : String? = nil,
          @attributes_to_delete : Array(String)? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @icon_s3_location : Types::S3Location? = nil,
          @launch_parameters : String? = nil,
          @launch_path : String? = nil,
          @working_directory : String? = nil
        )
        end
      end


      struct UpdateApplicationResult
        include JSON::Serializable


        @[JSON::Field(key: "Application")]
        getter application : Types::Application?

        def initialize(
          @application : Types::Application? = nil
        )
        end
      end


      struct UpdateDirectoryConfigRequest
        include JSON::Serializable

        # The name of the Directory Config object.

        @[JSON::Field(key: "DirectoryName")]
        getter directory_name : String

        # The certificate-based authentication properties used to authenticate SAML 2.0 Identity Provider
        # (IdP) user identities to Active Directory domain-joined streaming instances. Fallback is turned on
        # by default when certificate-based authentication is Enabled . Fallback allows users to log in using
        # their AD domain password if certificate-based authentication is unsuccessful, or to unlock a desktop
        # lock screen. Enabled_no_directory_login_fallback enables certificate-based authentication, but does
        # not allow users to log in using their AD domain password. Users will be disconnected to
        # re-authenticate using certificates.

        @[JSON::Field(key: "CertificateBasedAuthProperties")]
        getter certificate_based_auth_properties : Types::CertificateBasedAuthProperties?

        # The distinguished names of the organizational units for computer accounts.

        @[JSON::Field(key: "OrganizationalUnitDistinguishedNames")]
        getter organizational_unit_distinguished_names : Array(String)?

        # The credentials for the service account used by the fleet or image builder to connect to the
        # directory.

        @[JSON::Field(key: "ServiceAccountCredentials")]
        getter service_account_credentials : Types::ServiceAccountCredentials?

        def initialize(
          @directory_name : String,
          @certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
          @organizational_unit_distinguished_names : Array(String)? = nil,
          @service_account_credentials : Types::ServiceAccountCredentials? = nil
        )
        end
      end


      struct UpdateDirectoryConfigResult
        include JSON::Serializable

        # Information about the Directory Config object.

        @[JSON::Field(key: "DirectoryConfig")]
        getter directory_config : Types::DirectoryConfig?

        def initialize(
          @directory_config : Types::DirectoryConfig? = nil
        )
        end
      end


      struct UpdateEntitlementRequest
        include JSON::Serializable

        # The name of the entitlement.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the stack with which the entitlement is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # Specifies whether all or only selected apps are entitled.

        @[JSON::Field(key: "AppVisibility")]
        getter app_visibility : String?

        # The attributes of the entitlement.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::EntitlementAttribute)?

        # The description of the entitlement.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @stack_name : String,
          @app_visibility : String? = nil,
          @attributes : Array(Types::EntitlementAttribute)? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateEntitlementResult
        include JSON::Serializable

        # The entitlement.

        @[JSON::Field(key: "Entitlement")]
        getter entitlement : Types::Entitlement?

        def initialize(
          @entitlement : Types::Entitlement? = nil
        )
        end
      end


      struct UpdateFleetRequest
        include JSON::Serializable

        # The fleet attributes to delete.

        @[JSON::Field(key: "AttributesToDelete")]
        getter attributes_to_delete : Array(String)?

        # The desired capacity for the fleet. This is not allowed for Elastic fleets.

        @[JSON::Field(key: "ComputeCapacity")]
        getter compute_capacity : Types::ComputeCapacity?

        # Deletes the VPC association for the specified fleet.

        @[JSON::Field(key: "DeleteVpcConfig")]
        getter delete_vpc_config : Bool?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The amount of time that a streaming session remains active after users disconnect. If users try to
        # reconnect to the streaming session after a disconnection or network interruption within this time
        # interval, they are connected to their previous session. Otherwise, they are connected to a new
        # session with a new streaming instance. Specify a value between 60 and 36000.

        @[JSON::Field(key: "DisconnectTimeoutInSeconds")]
        getter disconnect_timeout_in_seconds : Int32?

        # The fleet name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name of the directory and organizational unit (OU) to use to join the fleet to a Microsoft
        # Active Directory domain.

        @[JSON::Field(key: "DomainJoinInfo")]
        getter domain_join_info : Types::DomainJoinInfo?

        # Enables or disables default internet access for the fleet.

        @[JSON::Field(key: "EnableDefaultInternetAccess")]
        getter enable_default_internet_access : Bool?

        # The Amazon Resource Name (ARN) of the IAM role to apply to the fleet. To assume a role, a fleet
        # instance calls the AWS Security Token Service (STS) AssumeRole API operation and passes the ARN of
        # the role to use. The operation creates a new session with temporary credentials. WorkSpaces
        # Applications retrieves the temporary credentials and creates the appstream_machine_role credential
        # profile on the instance. For more information, see Using an IAM Role to Grant Permissions to
        # Applications and Scripts Running on WorkSpaces Applications Streaming Instances in the Amazon
        # WorkSpaces Applications Administration Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The amount of time that users can be idle (inactive) before they are disconnected from their
        # streaming session and the DisconnectTimeoutInSeconds time interval begins. Users are notified before
        # they are disconnected due to inactivity. If users try to reconnect to the streaming session before
        # the time interval specified in DisconnectTimeoutInSeconds elapses, they are connected to their
        # previous session. Users are considered idle when they stop providing keyboard or mouse input during
        # their streaming session. File uploads and downloads, audio in, audio out, and pixels changing do not
        # qualify as user activity. If users continue to be idle after the time interval in
        # IdleDisconnectTimeoutInSeconds elapses, they are disconnected. To prevent users from being
        # disconnected due to inactivity, specify a value of 0. Otherwise, specify a value between 60 and
        # 36000. The default value is 0. If you enable this feature, we recommend that you specify a value
        # that corresponds exactly to a whole number of minutes (for example, 60, 120, and 180). If you don't
        # do this, the value is rounded to the nearest minute. For example, if you specify a value of 70,
        # users are disconnected after 1 minute of inactivity. If you specify a value that is at the midpoint
        # between two different minutes, the value is rounded up. For example, if you specify a value of 90,
        # users are disconnected after 2 minutes of inactivity.

        @[JSON::Field(key: "IdleDisconnectTimeoutInSeconds")]
        getter idle_disconnect_timeout_in_seconds : Int32?

        # The ARN of the public, private, or shared image to use.

        @[JSON::Field(key: "ImageArn")]
        getter image_arn : String?

        # The name of the image used to create the fleet.

        @[JSON::Field(key: "ImageName")]
        getter image_name : String?

        # The instance type to use when launching fleet instances. The following instance types are available:
        # stream.standard.small stream.standard.medium stream.standard.large stream.standard.xlarge
        # stream.standard.2xlarge stream.compute.large stream.compute.xlarge stream.compute.2xlarge
        # stream.compute.4xlarge stream.compute.8xlarge stream.memory.large stream.memory.xlarge
        # stream.memory.2xlarge stream.memory.4xlarge stream.memory.8xlarge stream.memory.z1d.large
        # stream.memory.z1d.xlarge stream.memory.z1d.2xlarge stream.memory.z1d.3xlarge
        # stream.memory.z1d.6xlarge stream.memory.z1d.12xlarge stream.graphics.g4dn.xlarge
        # stream.graphics.g4dn.2xlarge stream.graphics.g4dn.4xlarge stream.graphics.g4dn.8xlarge
        # stream.graphics.g4dn.12xlarge stream.graphics.g4dn.16xlarge stream.graphics.g5.xlarge
        # stream.graphics.g5.2xlarge stream.graphics.g5.4xlarge stream.graphics.g5.8xlarge
        # stream.graphics.g5.16xlarge stream.graphics.g5.12xlarge stream.graphics.g5.24xlarge
        # stream.graphics.g6.xlarge stream.graphics.g6.2xlarge stream.graphics.g6.4xlarge
        # stream.graphics.g6.8xlarge stream.graphics.g6.16xlarge stream.graphics.g6.12xlarge
        # stream.graphics.g6.24xlarge stream.graphics.gr6.4xlarge stream.graphics.gr6.8xlarge
        # stream.graphics.g6f.large stream.graphics.g6f.xlarge stream.graphics.g6f.2xlarge
        # stream.graphics.g6f.4xlarge stream.graphics.gr6f.4xlarge The following instance types are available
        # for Elastic fleets: stream.standard.small stream.standard.medium stream.standard.large
        # stream.standard.xlarge stream.standard.2xlarge

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The maximum number of concurrent sessions for a fleet.

        @[JSON::Field(key: "MaxConcurrentSessions")]
        getter max_concurrent_sessions : Int32?

        # The maximum number of user sessions on an instance. This only applies to multi-session fleets.

        @[JSON::Field(key: "MaxSessionsPerInstance")]
        getter max_sessions_per_instance : Int32?

        # The maximum amount of time that a streaming session can remain active, in seconds. If users are
        # still connected to a streaming instance five minutes before this limit is reached, they are prompted
        # to save any open documents before being disconnected. After this time elapses, the instance is
        # terminated and replaced by a new instance. Specify a value between 600 and 432000.

        @[JSON::Field(key: "MaxUserDurationInSeconds")]
        getter max_user_duration_in_seconds : Int32?

        # A unique name for the fleet.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The platform of the fleet. WINDOWS_SERVER_2019, AMAZON_LINUX2 and UBUNTU_PRO_2404 are supported for
        # Elastic fleets.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The updated configuration for the root volume of fleet instances. Note that volume size cannot be
        # decreased below the image volume size.

        @[JSON::Field(key: "RootVolumeConfig")]
        getter root_volume_config : Types::VolumeConfig?

        # The S3 location of the session scripts configuration zip file. This only applies to Elastic fleets.

        @[JSON::Field(key: "SessionScriptS3Location")]
        getter session_script_s3_location : Types::S3Location?

        # The WorkSpaces Applications view that is displayed to your users when they stream from the fleet.
        # When APP is specified, only the windows of applications opened by users display. When DESKTOP is
        # specified, the standard desktop that is provided by the operating system displays. The default value
        # is APP .

        @[JSON::Field(key: "StreamView")]
        getter stream_view : String?

        # The USB device filter strings that specify which USB devices a user can redirect to the fleet
        # streaming session, when using the Windows native client. This is allowed but not required for
        # Elastic fleets.

        @[JSON::Field(key: "UsbDeviceFilterStrings")]
        getter usb_device_filter_strings : Array(String)?

        # The VPC configuration for the fleet. This is required for Elastic fleets, but not required for other
        # fleet types. Elastic fleets require that you specify at least two subnets in different availability
        # zones.

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @attributes_to_delete : Array(String)? = nil,
          @compute_capacity : Types::ComputeCapacity? = nil,
          @delete_vpc_config : Bool? = nil,
          @description : String? = nil,
          @disconnect_timeout_in_seconds : Int32? = nil,
          @display_name : String? = nil,
          @domain_join_info : Types::DomainJoinInfo? = nil,
          @enable_default_internet_access : Bool? = nil,
          @iam_role_arn : String? = nil,
          @idle_disconnect_timeout_in_seconds : Int32? = nil,
          @image_arn : String? = nil,
          @image_name : String? = nil,
          @instance_type : String? = nil,
          @max_concurrent_sessions : Int32? = nil,
          @max_sessions_per_instance : Int32? = nil,
          @max_user_duration_in_seconds : Int32? = nil,
          @name : String? = nil,
          @platform : String? = nil,
          @root_volume_config : Types::VolumeConfig? = nil,
          @session_script_s3_location : Types::S3Location? = nil,
          @stream_view : String? = nil,
          @usb_device_filter_strings : Array(String)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct UpdateFleetResult
        include JSON::Serializable

        # Information about the fleet.

        @[JSON::Field(key: "Fleet")]
        getter fleet : Types::Fleet?

        def initialize(
          @fleet : Types::Fleet? = nil
        )
        end
      end


      struct UpdateImagePermissionsRequest
        include JSON::Serializable

        # The permissions for the image.

        @[JSON::Field(key: "ImagePermissions")]
        getter image_permissions : Types::ImagePermissions

        # The name of the private image.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The 12-digit identifier of the AWS account for which you want add or update image permissions.

        @[JSON::Field(key: "SharedAccountId")]
        getter shared_account_id : String

        def initialize(
          @image_permissions : Types::ImagePermissions,
          @name : String,
          @shared_account_id : String
        )
        end
      end


      struct UpdateImagePermissionsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateStackRequest
        include JSON::Serializable

        # The name of the stack.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The list of interface VPC endpoint (interface endpoint) objects. Users of the stack can connect to
        # WorkSpaces Applications only through the specified endpoints.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)?

        # The persistent application settings for users of a stack. When these settings are enabled, changes
        # that users make to applications and Windows settings are automatically saved after each session and
        # applied to the next session.

        @[JSON::Field(key: "ApplicationSettings")]
        getter application_settings : Types::ApplicationSettings?

        # The stack attributes to delete.

        @[JSON::Field(key: "AttributesToDelete")]
        getter attributes_to_delete : Array(String)?

        # Deletes the storage connectors currently enabled for the stack.

        @[JSON::Field(key: "DeleteStorageConnectors")]
        getter delete_storage_connectors : Bool?

        # The description to display.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The stack name to display.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The domains where WorkSpaces Applications streaming sessions can be embedded in an iframe. You must
        # approve the domains that you want to host embedded WorkSpaces Applications streaming sessions.

        @[JSON::Field(key: "EmbedHostDomains")]
        getter embed_host_domains : Array(String)?

        # The URL that users are redirected to after they choose the Send Feedback link. If no URL is
        # specified, no Send Feedback link is displayed.

        @[JSON::Field(key: "FeedbackURL")]
        getter feedback_url : String?

        # The URL that users are redirected to after their streaming session ends.

        @[JSON::Field(key: "RedirectURL")]
        getter redirect_url : String?

        # The storage connectors to enable.

        @[JSON::Field(key: "StorageConnectors")]
        getter storage_connectors : Array(Types::StorageConnector)?

        # The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, UDP is only
        # supported in the Windows native client.

        @[JSON::Field(key: "StreamingExperienceSettings")]
        getter streaming_experience_settings : Types::StreamingExperienceSettings?

        # The actions that are enabled or disabled for users during their streaming sessions. By default,
        # these actions are enabled.

        @[JSON::Field(key: "UserSettings")]
        getter user_settings : Array(Types::UserSetting)?

        def initialize(
          @name : String,
          @access_endpoints : Array(Types::AccessEndpoint)? = nil,
          @application_settings : Types::ApplicationSettings? = nil,
          @attributes_to_delete : Array(String)? = nil,
          @delete_storage_connectors : Bool? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @embed_host_domains : Array(String)? = nil,
          @feedback_url : String? = nil,
          @redirect_url : String? = nil,
          @storage_connectors : Array(Types::StorageConnector)? = nil,
          @streaming_experience_settings : Types::StreamingExperienceSettings? = nil,
          @user_settings : Array(Types::UserSetting)? = nil
        )
        end
      end


      struct UpdateStackResult
        include JSON::Serializable

        # Information about the stack.

        @[JSON::Field(key: "Stack")]
        getter stack : Types::Stack?

        def initialize(
          @stack : Types::Stack? = nil
        )
        end
      end


      struct UpdateThemeForStackRequest
        include JSON::Serializable

        # The name of the stack for the theme.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The attributes to delete.

        @[JSON::Field(key: "AttributesToDelete")]
        getter attributes_to_delete : Array(String)?

        # The S3 location of the favicon. The favicon enables users to recognize their application streaming
        # site in a browser full of tabs or bookmarks. It is displayed at the top of the browser tab for the
        # application streaming site during users' streaming sessions.

        @[JSON::Field(key: "FaviconS3Location")]
        getter favicon_s3_location : Types::S3Location?

        # The links that are displayed in the footer of the streaming application catalog page. These links
        # are helpful resources for users, such as the organization's IT support and product marketing sites.

        @[JSON::Field(key: "FooterLinks")]
        getter footer_links : Array(Types::ThemeFooterLink)?

        # The organization logo that appears on the streaming application catalog page.

        @[JSON::Field(key: "OrganizationLogoS3Location")]
        getter organization_logo_s3_location : Types::S3Location?

        # Specifies whether custom branding should be applied to catalog page or not.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The color theme that is applied to website links, text, and buttons. These colors are also applied
        # as accents in the background for the streaming application catalog page.

        @[JSON::Field(key: "ThemeStyling")]
        getter theme_styling : String?

        # The title that is displayed at the top of the browser tab during users' application streaming
        # sessions.

        @[JSON::Field(key: "TitleText")]
        getter title_text : String?

        def initialize(
          @stack_name : String,
          @attributes_to_delete : Array(String)? = nil,
          @favicon_s3_location : Types::S3Location? = nil,
          @footer_links : Array(Types::ThemeFooterLink)? = nil,
          @organization_logo_s3_location : Types::S3Location? = nil,
          @state : String? = nil,
          @theme_styling : String? = nil,
          @title_text : String? = nil
        )
        end
      end


      struct UpdateThemeForStackResult
        include JSON::Serializable

        # The theme object that contains the metadata of the custom branding.

        @[JSON::Field(key: "Theme")]
        getter theme : Types::Theme?

        def initialize(
          @theme : Types::Theme? = nil
        )
        end
      end

      # Describes information about the usage report subscription.

      struct UsageReportSubscription
        include JSON::Serializable

        # The time when the last usage report was generated.

        @[JSON::Field(key: "LastGeneratedReportDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_generated_report_date : Time?

        # The Amazon S3 bucket where generated reports are stored. If you enabled on-instance session scripts
        # and Amazon S3 logging for your session script configuration, WorkSpaces Applications created an S3
        # bucket to store the script output. The bucket is unique to your account and Region. When you enable
        # usage reporting in this case, WorkSpaces Applications uses the same bucket to store your usage
        # reports. If you haven't already enabled on-instance session scripts, when you enable usage reports,
        # WorkSpaces Applications creates a new S3 bucket.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The schedule for generating usage reports.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The errors that were returned if usage reports couldn't be generated.

        @[JSON::Field(key: "SubscriptionErrors")]
        getter subscription_errors : Array(Types::LastReportGenerationExecutionError)?

        def initialize(
          @last_generated_report_date : Time? = nil,
          @s3_bucket_name : String? = nil,
          @schedule : String? = nil,
          @subscription_errors : Array(Types::LastReportGenerationExecutionError)? = nil
        )
        end
      end

      # Describes a user in the user pool.

      struct User
        include JSON::Serializable

        # The authentication type for the user.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # The ARN of the user.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time the user was created in the user pool.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # Specifies whether the user in the user pool is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The first name, or given name, of the user.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The last name, or surname, of the user.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The status of the user in the user pool. The status can be one of the following: UNCONFIRMED – The
        # user is created but not confirmed. CONFIRMED – The user is confirmed. ARCHIVED – The user is no
        # longer active. COMPROMISED – The user is disabled because of a potential security threat. UNKNOWN –
        # The user status is not known.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The email address of the user. Users' email addresses are case-sensitive.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @authentication_type : String,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @enabled : Bool? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @status : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Describes an action and whether the action is enabled or disabled for users during their streaming
      # sessions.

      struct UserSetting
        include JSON::Serializable

        # The action that is enabled or disabled.

        @[JSON::Field(key: "Action")]
        getter action : String

        # Indicates whether the action is enabled or disabled.

        @[JSON::Field(key: "Permission")]
        getter permission : String

        # Specifies the number of characters that can be copied by end users from the local device to the
        # remote session, and to the local device from the remote session. This can be specified only for the
        # CLIPBOARD_COPY_FROM_LOCAL_DEVICE and CLIPBOARD_COPY_TO_LOCAL_DEVICE actions. This defaults to
        # 20,971,520 (20 MB) when unspecified and the permission is ENABLED . This can't be specified when the
        # permission is DISABLED . The value can be between 1 and 20,971,520 (20 MB).

        @[JSON::Field(key: "MaximumLength")]
        getter maximum_length : Int32?

        def initialize(
          @action : String,
          @permission : String,
          @maximum_length : Int32? = nil
        )
        end
      end

      # Describes a user in the user pool and the associated stack.

      struct UserStackAssociation
        include JSON::Serializable

        # The authentication type for the user.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # The name of the stack that is associated with the user.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The email address of the user who is associated with the stack. Users' email addresses are
        # case-sensitive.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Specifies whether a welcome email is sent to a user after the user is created in the user pool.

        @[JSON::Field(key: "SendEmailNotification")]
        getter send_email_notification : Bool?

        def initialize(
          @authentication_type : String,
          @stack_name : String,
          @user_name : String,
          @send_email_notification : Bool? = nil
        )
        end
      end

      # Describes the error that is returned when a user can’t be associated with or disassociated from a
      # stack.

      struct UserStackAssociationError
        include JSON::Serializable

        # The error code for the error that is returned when a user can’t be associated with or disassociated
        # from a stack.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message for the error that is returned when a user can’t be associated with or
        # disassociated from a stack.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Information about the user and associated stack.

        @[JSON::Field(key: "UserStackAssociation")]
        getter user_stack_association : Types::UserStackAssociation?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @user_stack_association : Types::UserStackAssociation? = nil
        )
        end
      end

      # Configuration for the root volume of fleet instances and image builders. This allows you to
      # customize the storage capacity beyond the default 200 GB.

      struct VolumeConfig
        include JSON::Serializable

        # The size of the root volume in GB. Valid range is 200-500 GB. The default is 200 GB, which is
        # included in the hourly instance rate. Additional storage beyond 200 GB incurs extra charges and
        # applies to instances regardless of their running state.

        @[JSON::Field(key: "VolumeSizeInGb")]
        getter volume_size_in_gb : Int32?

        def initialize(
          @volume_size_in_gb : Int32? = nil
        )
        end
      end

      # Describes VPC configuration information for fleets and image builders.

      struct VpcConfig
        include JSON::Serializable

        # The identifiers of the security groups for the fleet or image builder.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The identifiers of the subnets to which a network interface is attached from the fleet instance or
        # image builder instance. Fleet instances use one or more subnets. Image builder instances use one
        # subnet.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end
    end
  end
end
