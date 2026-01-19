require "json"
require "time"

module AwsSdk
  module GreengrassV2
    module Types

      # You don't have permission to perform the action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains a request to associate a client device with a core device. The
      # BatchAssociateClientDeviceWithCoreDevice operation consumes a list of these requests.
      struct AssociateClientDeviceWithCoreDeviceEntry
        include JSON::Serializable

        # The name of the IoT thing that represents the client device to associate.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end

      # Contains an error that occurs from a request to associate a client device with a core device. The
      # BatchAssociateClientDeviceWithCoreDevice operation returns a list of these errors.
      struct AssociateClientDeviceWithCoreDeviceErrorEntry
        include JSON::Serializable

        # The error code for the request.
        @[JSON::Field(key: "code")]
        getter code : String?

        # A message that provides additional information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the IoT thing whose associate request failed.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct AssociateServiceRoleToAccountRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service role to associate with IoT Greengrass for your Amazon
        # Web Services account in this Amazon Web Services Region.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end

      struct AssociateServiceRoleToAccountResponse
        include JSON::Serializable

        # The time when the service role was associated with IoT Greengrass for your Amazon Web Services
        # account in this Amazon Web Services Region.
        @[JSON::Field(key: "AssociatedAt")]
        getter associated_at : String?

        def initialize(
          @associated_at : String? = nil
        )
        end
      end

      # Contains information about a client device that is associated to a core device for cloud discovery.
      struct AssociatedClientDevice
        include JSON::Serializable

        # The time that the client device was associated, expressed in ISO 8601 format.
        @[JSON::Field(key: "associationTimestamp")]
        getter association_timestamp : Time?

        # The name of the IoT thing that represents the associated client device.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @association_timestamp : Time? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct BatchAssociateClientDeviceWithCoreDeviceRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        # The list of client devices to associate.
        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::AssociateClientDeviceWithCoreDeviceEntry)?

        def initialize(
          @core_device_thing_name : String,
          @entries : Array(Types::AssociateClientDeviceWithCoreDeviceEntry)? = nil
        )
        end
      end

      struct BatchAssociateClientDeviceWithCoreDeviceResponse
        include JSON::Serializable

        # The list of any errors for the entries in the request. Each error entry contains the name of the IoT
        # thing that failed to associate.
        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::AssociateClientDeviceWithCoreDeviceErrorEntry)?

        def initialize(
          @error_entries : Array(Types::AssociateClientDeviceWithCoreDeviceErrorEntry)? = nil
        )
        end
      end

      struct BatchDisassociateClientDeviceFromCoreDeviceRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        # The list of client devices to disassociate.
        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::DisassociateClientDeviceFromCoreDeviceEntry)?

        def initialize(
          @core_device_thing_name : String,
          @entries : Array(Types::DisassociateClientDeviceFromCoreDeviceEntry)? = nil
        )
        end
      end

      struct BatchDisassociateClientDeviceFromCoreDeviceResponse
        include JSON::Serializable

        # The list of any errors for the entries in the request. Each error entry contains the name of the IoT
        # thing that failed to disassociate.
        @[JSON::Field(key: "errorEntries")]
        getter error_entries : Array(Types::DisassociateClientDeviceFromCoreDeviceErrorEntry)?

        def initialize(
          @error_entries : Array(Types::DisassociateClientDeviceFromCoreDeviceErrorEntry)? = nil
        )
        end
      end

      struct CancelDeploymentRequest
        include JSON::Serializable

        # The ID of the deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @deployment_id : String
        )
        end
      end

      struct CancelDeploymentResponse
        include JSON::Serializable

        # A message that communicates if the cancel was successful.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the status of a component version in the IoT Greengrass service.
      struct CloudComponentStatus
        include JSON::Serializable

        # The state of the component version.
        @[JSON::Field(key: "componentState")]
        getter component_state : String?

        # A dictionary of errors that communicate why the component version is in an error state. For example,
        # if IoT Greengrass can't access an artifact for the component version, then errors contains the
        # artifact's URI as a key, and the error message as the value for that key.
        @[JSON::Field(key: "errors")]
        getter errors : Hash(String, String)?

        # A message that communicates details, such as errors, about the status of the component version.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The vendor guidance state for the component version. This state indicates whether the component
        # version has any issues that you should consider before you deploy it. The vendor guidance state can
        # be: ACTIVE – This component version is available and recommended for use. DISCONTINUED – This
        # component version has been discontinued by its publisher. You can deploy this component version, but
        # we recommend that you use a different version of this component. DELETED – This component version
        # has been deleted by its publisher, so you can't deploy it. If you have any existing deployments that
        # specify this component version, those deployments will fail.
        @[JSON::Field(key: "vendorGuidance")]
        getter vendor_guidance : String?

        # A message that communicates details about the vendor guidance state of the component version. This
        # message communicates why a component version is discontinued or deleted.
        @[JSON::Field(key: "vendorGuidanceMessage")]
        getter vendor_guidance_message : String?

        def initialize(
          @component_state : String? = nil,
          @errors : Hash(String, String)? = nil,
          @message : String? = nil,
          @vendor_guidance : String? = nil,
          @vendor_guidance_message : String? = nil
        )
        end
      end

      # Contains information about a component.
      struct Component
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The latest version of the component and its details.
        @[JSON::Field(key: "latestVersion")]
        getter latest_version : Types::ComponentLatestVersion?

        def initialize(
          @arn : String? = nil,
          @component_name : String? = nil,
          @latest_version : Types::ComponentLatestVersion? = nil
        )
        end
      end

      # Contains information about a component that is a candidate to deploy to a Greengrass core device.
      struct ComponentCandidate
        include JSON::Serializable

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String?

        # The version requirements for the component's dependencies. Greengrass core devices get the version
        # requirements from component recipes. IoT Greengrass V2 uses semantic version constraints. For more
        # information, see Semantic Versioning .
        @[JSON::Field(key: "versionRequirements")]
        getter version_requirements : Hash(String, String)?

        def initialize(
          @component_name : String? = nil,
          @component_version : String? = nil,
          @version_requirements : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about a deployment's update to a component's configuration on Greengrass core
      # devices. For more information, see Update component configurations in the IoT Greengrass V2
      # Developer Guide .
      struct ComponentConfigurationUpdate
        include JSON::Serializable

        # A serialized JSON string that contains the configuration object to merge to target devices. The core
        # device merges this configuration with the component's existing configuration. If this is the first
        # time a component deploys on a device, the core device merges this configuration with the component's
        # default configuration. This means that the core device keeps it's existing configuration for keys
        # and values that you don't specify in this object. For more information, see Merge configuration
        # updates in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "merge")]
        getter merge : String?

        # The list of configuration nodes to reset to default values on target devices. Use JSON pointers to
        # specify each node to reset. JSON pointers start with a forward slash ( / ) and use forward slashes
        # to separate the key for each level in the object. For more information, see the JSON pointer
        # specification and Reset configuration updates in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "reset")]
        getter reset : Array(String)?

        def initialize(
          @merge : String? = nil,
          @reset : Array(String)? = nil
        )
        end
      end

      # Contains information about a component dependency for a Lambda function component.
      struct ComponentDependencyRequirement
        include JSON::Serializable

        # The type of this dependency. Choose from the following options: SOFT – The component doesn't restart
        # if the dependency changes state. HARD – The component restarts if the dependency changes state.
        # Default: HARD
        @[JSON::Field(key: "dependencyType")]
        getter dependency_type : String?

        # The component version requirement for the component dependency. IoT Greengrass V2 uses semantic
        # version constraints. For more information, see Semantic Versioning .
        @[JSON::Field(key: "versionRequirement")]
        getter version_requirement : String?

        def initialize(
          @dependency_type : String? = nil,
          @version_requirement : String? = nil
        )
        end
      end

      # Contains information about a component to deploy.
      struct ComponentDeploymentSpecification
        include JSON::Serializable

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String

        # The configuration updates to deploy for the component. You can define reset updates and merge
        # updates. A reset updates the keys that you specify to the default configuration for the component. A
        # merge updates the core device's component configuration with the keys and values that you specify.
        # The IoT Greengrass Core software applies reset updates before it applies merge updates. For more
        # information, see Update component configurations in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "configurationUpdate")]
        getter configuration_update : Types::ComponentConfigurationUpdate?

        # The system user and group that the IoT Greengrass Core software uses to run component processes on
        # the core device. If you omit this parameter, the IoT Greengrass Core software uses the system user
        # and group that you configure for the core device. For more information, see Configure the user and
        # group that run components in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "runWith")]
        getter run_with : Types::ComponentRunWith?

        def initialize(
          @component_version : String,
          @configuration_update : Types::ComponentConfigurationUpdate? = nil,
          @run_with : Types::ComponentRunWith? = nil
        )
        end
      end

      # Contains information about the latest version of a component.
      struct ComponentLatestVersion
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String?

        # The time at which the component was created, expressed in ISO 8601 format.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # The description of the component version.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The platforms that the component version supports.
        @[JSON::Field(key: "platforms")]
        getter platforms : Array(Types::ComponentPlatform)?

        # The publisher of the component version.
        @[JSON::Field(key: "publisher")]
        getter publisher : String?

        def initialize(
          @arn : String? = nil,
          @component_version : String? = nil,
          @creation_timestamp : Time? = nil,
          @description : String? = nil,
          @platforms : Array(Types::ComponentPlatform)? = nil,
          @publisher : String? = nil
        )
        end
      end

      # Contains information about a platform that a component supports.
      struct ComponentPlatform
        include JSON::Serializable

        # A dictionary of attributes for the platform. The IoT Greengrass Core software defines the os and
        # architecture by default. You can specify additional platform attributes for a core device when you
        # deploy the Greengrass nucleus component. For more information, see the Greengrass nucleus component
        # in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The friendly name of the platform. This name helps you identify the platform. If you omit this
        # parameter, IoT Greengrass creates a friendly name from the os and architecture of the platform.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains information system user and group that the IoT Greengrass Core software uses to run
      # component processes on the core device. For more information, see Configure the user and group that
      # run components in the IoT Greengrass V2 Developer Guide .
      struct ComponentRunWith
        include JSON::Serializable

        # The POSIX system user and, optionally, group to use to run this component on Linux core devices. The
        # user, and group if specified, must exist on each Linux core device. Specify the user and group
        # separated by a colon ( : ) in the following format: user:group . The group is optional. If you don't
        # specify a group, the IoT Greengrass Core software uses the primary user for the group. If you omit
        # this parameter, the IoT Greengrass Core software uses the default system user and group that you
        # configure on the Greengrass nucleus component. For more information, see Configure the user and
        # group that run components .
        @[JSON::Field(key: "posixUser")]
        getter posix_user : String?

        # The system resource limits to apply to this component's process on the core device. IoT Greengrass
        # currently supports this feature on only Linux core devices. If you omit this parameter, the IoT
        # Greengrass Core software uses the default system resource limits that you configure on the
        # Greengrass nucleus component. For more information, see Configure system resource limits for
        # components .
        @[JSON::Field(key: "systemResourceLimits")]
        getter system_resource_limits : Types::SystemResourceLimits?

        # The Windows user to use to run this component on Windows core devices. The user must exist on each
        # Windows core device, and its name and password must be in the LocalSystem account's Credentials
        # Manager instance. If you omit this parameter, the IoT Greengrass Core software uses the default
        # Windows user that you configure on the Greengrass nucleus component. For more information, see
        # Configure the user and group that run components .
        @[JSON::Field(key: "windowsUser")]
        getter windows_user : String?

        def initialize(
          @posix_user : String? = nil,
          @system_resource_limits : Types::SystemResourceLimits? = nil,
          @windows_user : String? = nil
        )
        end
      end

      # Contains information about a component version in a list.
      struct ComponentVersionListItem
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String?

        def initialize(
          @arn : String? = nil,
          @component_name : String? = nil,
          @component_version : String? = nil
        )
        end
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that conflicts with the request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that conflicts with the request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Contains information about an endpoint and port where client devices can connect to an MQTT broker
      # on a Greengrass core device.
      struct ConnectivityInfo
        include JSON::Serializable

        # The IP address or DNS address where client devices can connect to an MQTT broker on the Greengrass
        # core device.
        @[JSON::Field(key: "HostAddress")]
        getter host_address : String?

        # An ID for the connectivity information.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Additional metadata to provide to client devices that connect to this core device.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The port where the MQTT broker operates on the core device. This port is typically 8883, which is
        # the default port for the MQTT broker component that runs on core devices.
        @[JSON::Field(key: "PortNumber")]
        getter port_number : Int32?

        def initialize(
          @host_address : String? = nil,
          @id : String? = nil,
          @metadata : String? = nil,
          @port_number : Int32? = nil
        )
        end
      end

      # Contains information about a Greengrass core device, which is an IoT thing that runs the IoT
      # Greengrass Core software.
      struct CoreDevice
        include JSON::Serializable

        # The computer architecture of the core device.
        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String?

        # The time at which the core device's status last updated, expressed in ISO 8601 format.
        @[JSON::Field(key: "lastStatusUpdateTimestamp")]
        getter last_status_update_timestamp : Time?

        # The operating system platform that the core device runs.
        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The runtime for the core device. The runtime can be: aws_nucleus_classic aws_nucleus_lite
        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        # The status of the core device. Core devices can have the following statuses: HEALTHY – The IoT
        # Greengrass Core software and all components run on the core device without issue. UNHEALTHY – The
        # IoT Greengrass Core software or a component is in a failed state on the core device.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @architecture : String? = nil,
          @core_device_thing_name : String? = nil,
          @last_status_update_timestamp : Time? = nil,
          @platform : String? = nil,
          @runtime : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateComponentVersionRequest
        include JSON::Serializable

        # A unique, case-sensitive identifier that you can provide to ensure that the request is idempotent.
        # Idempotency means that the request is successfully processed only once, even if you send the request
        # multiple times. When a request succeeds, and you specify the same client token for subsequent
        # successful requests, the IoT Greengrass V2 service returns the successful response that it caches
        # from the previous request. IoT Greengrass V2 caches successful responses for idempotent requests for
        # up to 8 hours.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The recipe to use to create the component. The recipe defines the component's metadata, parameters,
        # dependencies, lifecycle, artifacts, and platform compatibility. You must specify either inlineRecipe
        # or lambdaFunction .
        @[JSON::Field(key: "inlineRecipe")]
        getter inline_recipe : Bytes?

        # The parameters to create a component from a Lambda function. You must specify either inlineRecipe or
        # lambdaFunction .
        @[JSON::Field(key: "lambdaFunction")]
        getter lambda_function : Types::LambdaFunctionRecipeSource?

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String? = nil,
          @inline_recipe : Bytes? = nil,
          @lambda_function : Types::LambdaFunctionRecipeSource? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateComponentVersionResponse
        include JSON::Serializable

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String

        # The time at which the component was created, expressed in ISO 8601 format.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time

        # The status of the component version in IoT Greengrass V2. This status is different from the status
        # of the component on a core device.
        @[JSON::Field(key: "status")]
        getter status : Types::CloudComponentStatus

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @component_name : String,
          @component_version : String,
          @creation_timestamp : Time,
          @status : Types::CloudComponentStatus,
          @arn : String? = nil
        )
        end
      end

      struct CreateDeploymentRequest
        include JSON::Serializable

        # The ARN of the target IoT thing or thing group. When creating a subdeployment, the targetARN can
        # only be a thing group.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # A unique, case-sensitive identifier that you can provide to ensure that the request is idempotent.
        # Idempotency means that the request is successfully processed only once, even if you send the request
        # multiple times. When a request succeeds, and you specify the same client token for subsequent
        # successful requests, the IoT Greengrass V2 service returns the successful response that it caches
        # from the previous request. IoT Greengrass V2 caches successful responses for idempotent requests for
        # up to 8 hours.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The components to deploy. This is a dictionary, where each key is the name of a component, and each
        # key's value is the version and configuration to deploy for that component.
        @[JSON::Field(key: "components")]
        getter components : Hash(String, Types::ComponentDeploymentSpecification)?

        # The name of the deployment.
        @[JSON::Field(key: "deploymentName")]
        getter deployment_name : String?

        # The deployment policies for the deployment. These policies define how the deployment updates
        # components and handles failure.
        @[JSON::Field(key: "deploymentPolicies")]
        getter deployment_policies : Types::DeploymentPolicies?

        # The job configuration for the deployment configuration. The job configuration specifies the rollout,
        # timeout, and stop configurations for the deployment configuration.
        @[JSON::Field(key: "iotJobConfiguration")]
        getter iot_job_configuration : Types::DeploymentIoTJobConfiguration?

        # The parent deployment's target ARN within a subdeployment.
        @[JSON::Field(key: "parentTargetArn")]
        getter parent_target_arn : String?

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @target_arn : String,
          @client_token : String? = nil,
          @components : Hash(String, Types::ComponentDeploymentSpecification)? = nil,
          @deployment_name : String? = nil,
          @deployment_policies : Types::DeploymentPolicies? = nil,
          @iot_job_configuration : Types::DeploymentIoTJobConfiguration? = nil,
          @parent_target_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDeploymentResponse
        include JSON::Serializable

        # The ID of the deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The ARN of the IoT job that applies the deployment to target devices.
        @[JSON::Field(key: "iotJobArn")]
        getter iot_job_arn : String?

        # The ID of the IoT job that applies the deployment to target devices.
        @[JSON::Field(key: "iotJobId")]
        getter iot_job_id : String?

        def initialize(
          @deployment_id : String? = nil,
          @iot_job_arn : String? = nil,
          @iot_job_id : String? = nil
        )
        end
      end

      struct DeleteComponentRequest
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteCoreDeviceRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        def initialize(
          @core_device_thing_name : String
        )
        end
      end

      struct DeleteDeploymentRequest
        include JSON::Serializable

        # The ID of the deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @deployment_id : String
        )
        end
      end

      # Contains information about a deployment.
      struct Deployment
        include JSON::Serializable

        # The time at which the deployment was created, expressed in ISO 8601 format.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # The ID of the deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The name of the deployment.
        @[JSON::Field(key: "deploymentName")]
        getter deployment_name : String?

        # The status of the deployment.
        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?

        # Whether or not the deployment is the latest revision for its target.
        @[JSON::Field(key: "isLatestForTarget")]
        getter is_latest_for_target : Bool?

        # The parent deployment's target ARN within a subdeployment.
        @[JSON::Field(key: "parentTargetArn")]
        getter parent_target_arn : String?

        # The revision number of the deployment.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # The ARN of the target IoT thing or thing group. When creating a subdeployment, the targetARN can
        # only be a thing group.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @creation_timestamp : Time? = nil,
          @deployment_id : String? = nil,
          @deployment_name : String? = nil,
          @deployment_status : String? = nil,
          @is_latest_for_target : Bool? = nil,
          @parent_target_arn : String? = nil,
          @revision_id : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # Contains information about a deployment's policy that defines when components are safe to update.
      # Each component on a device can report whether or not it's ready to update. After a component and its
      # dependencies are ready, they can apply the update in the deployment. You can configure whether or
      # not the deployment notifies components of an update and waits for a response. You specify the amount
      # of time each component has to respond to the update notification.
      struct DeploymentComponentUpdatePolicy
        include JSON::Serializable

        # Whether or not to notify components and wait for components to become safe to update. Choose from
        # the following options: NOTIFY_COMPONENTS – The deployment notifies each component before it stops
        # and updates that component. Components can use the SubscribeToComponentUpdates IPC operation to
        # receive these notifications. Then, components can respond with the DeferComponentUpdate IPC
        # operation. For more information, see Create deployments in the IoT Greengrass V2 Developer Guide .
        # SKIP_NOTIFY_COMPONENTS – The deployment doesn't notify components or wait for them to be safe to
        # update. Default: NOTIFY_COMPONENTS
        @[JSON::Field(key: "action")]
        getter action : String?

        # The amount of time in seconds that each component on a device has to report that it's safe to
        # update. If the component waits for longer than this timeout, then the deployment proceeds on the
        # device. Default: 60
        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @action : String? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end

      # Contains information about how long a component on a core device can validate its configuration
      # updates before it times out. Components can use the SubscribeToValidateConfigurationUpdates IPC
      # operation to receive notifications when a deployment specifies a configuration update. Then,
      # components can respond with the SendConfigurationValidityReport IPC operation. For more information,
      # see Create deployments in the IoT Greengrass V2 Developer Guide .
      struct DeploymentConfigurationValidationPolicy
        include JSON::Serializable

        # The amount of time in seconds that a component can validate its configuration updates. If the
        # validation time exceeds this timeout, then the deployment proceeds for the device. Default: 30
        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @timeout_in_seconds : Int32? = nil
        )
        end
      end

      # Contains information about an IoT job configuration.
      struct DeploymentIoTJobConfiguration
        include JSON::Serializable

        # The stop configuration for the job. This configuration defines when and how to stop a job rollout.
        @[JSON::Field(key: "abortConfig")]
        getter abort_config : Types::IoTJobAbortConfig?

        # The rollout configuration for the job. This configuration defines the rate at which the job rolls
        # out to the fleet of target devices.
        @[JSON::Field(key: "jobExecutionsRolloutConfig")]
        getter job_executions_rollout_config : Types::IoTJobExecutionsRolloutConfig?

        # The timeout configuration for the job. This configuration defines the amount of time each device has
        # to complete the job.
        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::IoTJobTimeoutConfig?

        def initialize(
          @abort_config : Types::IoTJobAbortConfig? = nil,
          @job_executions_rollout_config : Types::IoTJobExecutionsRolloutConfig? = nil,
          @timeout_config : Types::IoTJobTimeoutConfig? = nil
        )
        end
      end

      # Contains information about policies that define how a deployment updates components and handles
      # failure.
      struct DeploymentPolicies
        include JSON::Serializable

        # The component update policy for the configuration deployment. This policy defines when it's safe to
        # deploy the configuration to devices.
        @[JSON::Field(key: "componentUpdatePolicy")]
        getter component_update_policy : Types::DeploymentComponentUpdatePolicy?

        # The configuration validation policy for the configuration deployment. This policy defines how long
        # each component has to validate its configure updates.
        @[JSON::Field(key: "configurationValidationPolicy")]
        getter configuration_validation_policy : Types::DeploymentConfigurationValidationPolicy?

        # The failure handling policy for the configuration deployment. This policy defines what to do if the
        # deployment fails. Default: ROLLBACK
        @[JSON::Field(key: "failureHandlingPolicy")]
        getter failure_handling_policy : String?

        def initialize(
          @component_update_policy : Types::DeploymentComponentUpdatePolicy? = nil,
          @configuration_validation_policy : Types::DeploymentConfigurationValidationPolicy? = nil,
          @failure_handling_policy : String? = nil
        )
        end
      end

      struct DescribeComponentRequest
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DescribeComponentResponse
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String?

        # The time at which the component was created, expressed in ISO 8601 format.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # The description of the component version.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The platforms that the component version supports.
        @[JSON::Field(key: "platforms")]
        getter platforms : Array(Types::ComponentPlatform)?

        # The publisher of the component version.
        @[JSON::Field(key: "publisher")]
        getter publisher : String?

        # The status of the component version in IoT Greengrass V2. This status is different from the status
        # of the component on a core device.
        @[JSON::Field(key: "status")]
        getter status : Types::CloudComponentStatus?

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @component_name : String? = nil,
          @component_version : String? = nil,
          @creation_timestamp : Time? = nil,
          @description : String? = nil,
          @platforms : Array(Types::ComponentPlatform)? = nil,
          @publisher : String? = nil,
          @status : Types::CloudComponentStatus? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains a request to disassociate a client device from a core device. The
      # BatchDisassociateClientDeviceWithCoreDevice operation consumes a list of these requests.
      struct DisassociateClientDeviceFromCoreDeviceEntry
        include JSON::Serializable

        # The name of the IoT thing that represents the client device to disassociate.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end

      # Contains an error that occurs from a request to disassociate a client device from a core device. The
      # BatchDisassociateClientDeviceWithCoreDevice operation returns a list of these errors.
      struct DisassociateClientDeviceFromCoreDeviceErrorEntry
        include JSON::Serializable

        # The error code for the request.
        @[JSON::Field(key: "code")]
        getter code : String?

        # A message that provides additional information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the IoT thing whose disassociate request failed.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct DisassociateServiceRoleFromAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateServiceRoleFromAccountResponse
        include JSON::Serializable

        # The time when the service role was disassociated from IoT Greengrass for your Amazon Web Services
        # account in this Amazon Web Services Region.
        @[JSON::Field(key: "DisassociatedAt")]
        getter disassociated_at : String?

        def initialize(
          @disassociated_at : String? = nil
        )
        end
      end

      # Contains information about a deployment job that IoT Greengrass sends to a Greengrass core device.
      struct EffectiveDeployment
        include JSON::Serializable

        # The status of the deployment job on the Greengrass core device. IN_PROGRESS – The deployment job is
        # running. QUEUED – The deployment job is in the job queue and waiting to run. FAILED – The deployment
        # failed. For more information, see the statusDetails field. COMPLETED – The deployment to an IoT
        # thing was completed successfully. TIMED_OUT – The deployment didn't complete in the allotted time.
        # CANCELED – The deployment was canceled by the user. REJECTED – The deployment was rejected. For more
        # information, see the statusDetails field. SUCCEEDED – The deployment to an IoT thing group was
        # completed successfully.
        @[JSON::Field(key: "coreDeviceExecutionStatus")]
        getter core_device_execution_status : String

        # The time at which the deployment was created, expressed in ISO 8601 format.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time

        # The ID of the deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The name of the deployment.
        @[JSON::Field(key: "deploymentName")]
        getter deployment_name : String

        # The time at which the deployment job was last modified, expressed in ISO 8601 format.
        @[JSON::Field(key: "modifiedTimestamp")]
        getter modified_timestamp : Time

        # The ARN of the target IoT thing or thing group.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # The description of the deployment job.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the IoT job that applies the deployment to target devices.
        @[JSON::Field(key: "iotJobArn")]
        getter iot_job_arn : String?

        # The ID of the IoT job that applies the deployment to target devices.
        @[JSON::Field(key: "iotJobId")]
        getter iot_job_id : String?

        # The reason code for the update, if the job was updated.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The status details that explain why a deployment has an error. This response will be null if the
        # deployment is in a success state.
        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::EffectiveDeploymentStatusDetails?

        def initialize(
          @core_device_execution_status : String,
          @creation_timestamp : Time,
          @deployment_id : String,
          @deployment_name : String,
          @modified_timestamp : Time,
          @target_arn : String,
          @description : String? = nil,
          @iot_job_arn : String? = nil,
          @iot_job_id : String? = nil,
          @reason : String? = nil,
          @status_details : Types::EffectiveDeploymentStatusDetails? = nil
        )
        end
      end

      # Contains all error-related information for the deployment record. The status details will be null if
      # the deployment is in a success state. Greengrass nucleus v2.8.0 or later is required to get an
      # accurate errorStack and errorTypes response. This field will not be returned for earlier Greengrass
      # nucleus versions.
      struct EffectiveDeploymentStatusDetails
        include JSON::Serializable

        # Contains an ordered list of short error codes that range from the most generic error to the most
        # specific one. The error codes describe the reason for failure whenever the coreDeviceExecutionStatus
        # is in a failed state. The response will be an empty list if there is no error.
        @[JSON::Field(key: "errorStack")]
        getter error_stack : Array(String)?

        # Contains tags which describe the error. You can use the error types to classify errors to assist
        # with remediating the failure. The response will be an empty list if there is no error.
        @[JSON::Field(key: "errorTypes")]
        getter error_types : Array(String)?

        def initialize(
          @error_stack : Array(String)? = nil,
          @error_types : Array(String)? = nil
        )
        end
      end

      struct GetComponentRequest
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The format of the recipe.
        @[JSON::Field(key: "recipeOutputFormat")]
        getter recipe_output_format : String?

        def initialize(
          @arn : String,
          @recipe_output_format : String? = nil
        )
        end
      end

      struct GetComponentResponse
        include JSON::Serializable

        # The recipe of the component version.
        @[JSON::Field(key: "recipe")]
        getter recipe : Bytes

        # The format of the recipe.
        @[JSON::Field(key: "recipeOutputFormat")]
        getter recipe_output_format : String

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @recipe : Bytes,
          @recipe_output_format : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetComponentVersionArtifactRequest
        include JSON::Serializable

        # The ARN of the component version. Specify the ARN of a public or a Lambda component version.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the artifact. You can use the GetComponent operation to download the component recipe,
        # which includes the URI of the artifact. The artifact name is the section of the URI after the
        # scheme. For example, in the artifact URI greengrass:SomeArtifact.zip , the artifact name is
        # SomeArtifact.zip .
        @[JSON::Field(key: "artifactName")]
        getter artifact_name : String

        # Determines if the Amazon S3 URL returned is a FIPS pre-signed URL endpoint. Specify fips if you want
        # the returned Amazon S3 pre-signed URL to point to an Amazon S3 FIPS endpoint. If you don't specify a
        # value, the default is standard .
        @[JSON::Field(key: "x-amz-iot-endpoint-type")]
        getter iot_endpoint_type : String?

        # Specifies the endpoint to use when getting Amazon S3 pre-signed URLs. All Amazon Web Services
        # Regions except US East (N. Virginia) use REGIONAL in all cases. In the US East (N. Virginia) Region
        # the default is GLOBAL , but you can change it to REGIONAL with this parameter.
        @[JSON::Field(key: "s3EndpointType")]
        getter s3_endpoint_type : String?

        def initialize(
          @arn : String,
          @artifact_name : String,
          @iot_endpoint_type : String? = nil,
          @s3_endpoint_type : String? = nil
        )
        end
      end

      struct GetComponentVersionArtifactResponse
        include JSON::Serializable

        # The URL of the artifact.
        @[JSON::Field(key: "preSignedUrl")]
        getter pre_signed_url : String

        def initialize(
          @pre_signed_url : String
        )
        end
      end

      struct GetConnectivityInfoRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end

      struct GetConnectivityInfoResponse
        include JSON::Serializable

        # The connectivity information for the core device.
        @[JSON::Field(key: "ConnectivityInfo")]
        getter connectivity_info : Array(Types::ConnectivityInfo)?

        # A message about the connectivity information request.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @connectivity_info : Array(Types::ConnectivityInfo)? = nil,
          @message : String? = nil
        )
        end
      end

      struct GetCoreDeviceRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        def initialize(
          @core_device_thing_name : String
        )
        end
      end

      struct GetCoreDeviceResponse
        include JSON::Serializable

        # The computer architecture of the core device.
        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String?

        # The version of the IoT Greengrass Core software that the core device runs. This version is
        # equivalent to the version of the Greengrass nucleus component that runs on the core device. For more
        # information, see the Greengrass nucleus component in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "coreVersion")]
        getter core_version : String?

        # The time at which the core device's status last updated, expressed in ISO 8601 format.
        @[JSON::Field(key: "lastStatusUpdateTimestamp")]
        getter last_status_update_timestamp : Time?

        # The operating system platform that the core device runs.
        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The runtime for the core device. The runtime can be: aws_nucleus_classic aws_nucleus_lite
        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        # The status of the core device. The core device status can be: HEALTHY – The IoT Greengrass Core
        # software and all components run on the core device without issue. UNHEALTHY – The IoT Greengrass
        # Core software or a component is in a failed state on the core device.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @architecture : String? = nil,
          @core_device_thing_name : String? = nil,
          @core_version : String? = nil,
          @last_status_update_timestamp : Time? = nil,
          @platform : String? = nil,
          @runtime : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetDeploymentRequest
        include JSON::Serializable

        # The ID of the deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @deployment_id : String
        )
        end
      end

      struct GetDeploymentResponse
        include JSON::Serializable

        # The components to deploy. This is a dictionary, where each key is the name of a component, and each
        # key's value is the version and configuration to deploy for that component.
        @[JSON::Field(key: "components")]
        getter components : Hash(String, Types::ComponentDeploymentSpecification)?

        # The time at which the deployment was created, expressed in ISO 8601 format.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # The ID of the deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The name of the deployment.
        @[JSON::Field(key: "deploymentName")]
        getter deployment_name : String?

        # The deployment policies for the deployment. These policies define how the deployment updates
        # components and handles failure.
        @[JSON::Field(key: "deploymentPolicies")]
        getter deployment_policies : Types::DeploymentPolicies?

        # The status of the deployment.
        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?

        # The ARN of the IoT job that applies the deployment to target devices.
        @[JSON::Field(key: "iotJobArn")]
        getter iot_job_arn : String?

        # The job configuration for the deployment configuration. The job configuration specifies the rollout,
        # timeout, and stop configurations for the deployment configuration.
        @[JSON::Field(key: "iotJobConfiguration")]
        getter iot_job_configuration : Types::DeploymentIoTJobConfiguration?

        # The ID of the IoT job that applies the deployment to target devices.
        @[JSON::Field(key: "iotJobId")]
        getter iot_job_id : String?

        # Whether or not the deployment is the latest revision for its target.
        @[JSON::Field(key: "isLatestForTarget")]
        getter is_latest_for_target : Bool?

        # The parent deployment's target ARN within a subdeployment.
        @[JSON::Field(key: "parentTargetArn")]
        getter parent_target_arn : String?

        # The revision number of the deployment.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ARN of the target IoT thing or thing group.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @components : Hash(String, Types::ComponentDeploymentSpecification)? = nil,
          @creation_timestamp : Time? = nil,
          @deployment_id : String? = nil,
          @deployment_name : String? = nil,
          @deployment_policies : Types::DeploymentPolicies? = nil,
          @deployment_status : String? = nil,
          @iot_job_arn : String? = nil,
          @iot_job_configuration : Types::DeploymentIoTJobConfiguration? = nil,
          @iot_job_id : String? = nil,
          @is_latest_for_target : Bool? = nil,
          @parent_target_arn : String? = nil,
          @revision_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_arn : String? = nil
        )
        end
      end

      struct GetServiceRoleForAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetServiceRoleForAccountResponse
        include JSON::Serializable

        # The time when the service role was associated with IoT Greengrass for your Amazon Web Services
        # account in this Amazon Web Services Region.
        @[JSON::Field(key: "AssociatedAt")]
        getter associated_at : String?

        # The ARN of the service role that is associated with IoT Greengrass for your Amazon Web Services
        # account in this Amazon Web Services Region.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @associated_at : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Contains information about a component on a Greengrass core device.
      struct InstalledComponent
        include JSON::Serializable

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String?

        # Whether or not the component is a root component.
        @[JSON::Field(key: "isRoot")]
        getter is_root : Bool?

        # The most recent deployment source that brought the component to the Greengrass core device. For a
        # thing group deployment or thing deployment, the source will be the ID of the last deployment that
        # contained the component. For local deployments it will be LOCAL . Any deployment will attempt to
        # reinstall currently broken components on the device, which will update the last installation source.
        @[JSON::Field(key: "lastInstallationSource")]
        getter last_installation_source : String?

        # The last time the Greengrass core device sent a message containing a component's state to the Amazon
        # Web Services Cloud. A component does not need to see a state change for this field to update.
        @[JSON::Field(key: "lastReportedTimestamp")]
        getter last_reported_timestamp : Time?

        # The status of how current the data is. This response is based off of component state changes. The
        # status reflects component disruptions and deployments. If a component only sees a configuration
        # update during a deployment, it might not undergo a state change and this status would not be
        # updated.
        @[JSON::Field(key: "lastStatusChangeTimestamp")]
        getter last_status_change_timestamp : Time?

        # The lifecycle state of the component.
        @[JSON::Field(key: "lifecycleState")]
        getter lifecycle_state : String?

        # A detailed response about the lifecycle state of the component that explains the reason why a
        # component has an error or is broken.
        @[JSON::Field(key: "lifecycleStateDetails")]
        getter lifecycle_state_details : String?

        # The status codes that indicate the reason for failure whenever the lifecycleState has an error or is
        # in a broken state. Greengrass nucleus v2.8.0 or later is required to get an accurate
        # lifecycleStatusCodes response. This response can be inaccurate in earlier Greengrass nucleus
        # versions.
        @[JSON::Field(key: "lifecycleStatusCodes")]
        getter lifecycle_status_codes : Array(String)?

        def initialize(
          @component_name : String? = nil,
          @component_version : String? = nil,
          @is_root : Bool? = nil,
          @last_installation_source : String? = nil,
          @last_reported_timestamp : Time? = nil,
          @last_status_change_timestamp : Time? = nil,
          @lifecycle_state : String? = nil,
          @lifecycle_state_details : String? = nil,
          @lifecycle_status_codes : Array(String)? = nil
        )
        end
      end

      # IoT Greengrass can't process your request right now. Try again later.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The amount of time to wait before you retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Contains a list of criteria that define when and how to cancel a configuration deployment.
      struct IoTJobAbortConfig
        include JSON::Serializable

        # The list of criteria that define when and how to cancel the configuration deployment.
        @[JSON::Field(key: "criteriaList")]
        getter criteria_list : Array(Types::IoTJobAbortCriteria)

        def initialize(
          @criteria_list : Array(Types::IoTJobAbortCriteria)
        )
        end
      end

      # Contains criteria that define when and how to cancel a job. The deployment stops if the following
      # conditions are true: The number of things that receive the deployment exceeds the
      # minNumberOfExecutedThings . The percentage of failures with type failureType exceeds the
      # thresholdPercentage .
      struct IoTJobAbortCriteria
        include JSON::Serializable

        # The action to perform when the criteria are met.
        @[JSON::Field(key: "action")]
        getter action : String

        # The type of job deployment failure that can cancel a job.
        @[JSON::Field(key: "failureType")]
        getter failure_type : String

        # The minimum number of things that receive the configuration before the job can cancel.
        @[JSON::Field(key: "minNumberOfExecutedThings")]
        getter min_number_of_executed_things : Int32

        # The minimum percentage of failureType failures that occur before the job can cancel. This parameter
        # supports up to two digits after the decimal (for example, you can specify 10.9 or 10.99 , but not
        # 10.999 ).
        @[JSON::Field(key: "thresholdPercentage")]
        getter threshold_percentage : Float64

        def initialize(
          @action : String,
          @failure_type : String,
          @min_number_of_executed_things : Int32,
          @threshold_percentage : Float64
        )
        end
      end

      # Contains information about the rollout configuration for a job. This configuration defines the rate
      # at which the job deploys a configuration to a fleet of target devices.
      struct IoTJobExecutionsRolloutConfig
        include JSON::Serializable

        # The exponential rate to increase the job rollout rate.
        @[JSON::Field(key: "exponentialRate")]
        getter exponential_rate : Types::IoTJobExponentialRolloutRate?

        # The maximum number of devices that receive a pending job notification, per minute.
        @[JSON::Field(key: "maximumPerMinute")]
        getter maximum_per_minute : Int32?

        def initialize(
          @exponential_rate : Types::IoTJobExponentialRolloutRate? = nil,
          @maximum_per_minute : Int32? = nil
        )
        end
      end

      # Contains information about an exponential rollout rate for a configuration deployment job.
      struct IoTJobExponentialRolloutRate
        include JSON::Serializable

        # The minimum number of devices that receive a pending job notification, per minute, when the job
        # starts. This parameter defines the initial rollout rate of the job.
        @[JSON::Field(key: "baseRatePerMinute")]
        getter base_rate_per_minute : Int32

        # The exponential factor to increase the rollout rate for the job. This parameter supports up to one
        # digit after the decimal (for example, you can specify 1.5 , but not 1.55 ).
        @[JSON::Field(key: "incrementFactor")]
        getter increment_factor : Float64

        # The criteria to increase the rollout rate for the job.
        @[JSON::Field(key: "rateIncreaseCriteria")]
        getter rate_increase_criteria : Types::IoTJobRateIncreaseCriteria

        def initialize(
          @base_rate_per_minute : Int32,
          @increment_factor : Float64,
          @rate_increase_criteria : Types::IoTJobRateIncreaseCriteria
        )
        end
      end

      # Contains information about criteria to meet before a job increases its rollout rate. Specify either
      # numberOfNotifiedThings or numberOfSucceededThings .
      struct IoTJobRateIncreaseCriteria
        include JSON::Serializable

        # The number of devices to receive the job notification before the rollout rate increases.
        @[JSON::Field(key: "numberOfNotifiedThings")]
        getter number_of_notified_things : Int32?

        # The number of devices to successfully run the configuration job before the rollout rate increases.
        @[JSON::Field(key: "numberOfSucceededThings")]
        getter number_of_succeeded_things : Int32?

        def initialize(
          @number_of_notified_things : Int32? = nil,
          @number_of_succeeded_things : Int32? = nil
        )
        end
      end

      # Contains information about the timeout configuration for a job.
      struct IoTJobTimeoutConfig
        include JSON::Serializable

        # The amount of time, in minutes, that devices have to complete the job. The timer starts when the job
        # status is set to IN_PROGRESS . If the job status doesn't change to a terminal state before the time
        # expires, then the job status is set to TIMED_OUT . The timeout interval must be between 1 minute and
        # 7 days (10080 minutes).
        @[JSON::Field(key: "inProgressTimeoutInMinutes")]
        getter in_progress_timeout_in_minutes : Int64?

        def initialize(
          @in_progress_timeout_in_minutes : Int64? = nil
        )
        end
      end

      # Contains information about a container in which Lambda functions run on Greengrass core devices.
      struct LambdaContainerParams
        include JSON::Serializable

        # The list of system devices that the container can access.
        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::LambdaDeviceMount)?

        # The memory size of the container, expressed in kilobytes. Default: 16384 (16 MB)
        @[JSON::Field(key: "memorySizeInKB")]
        getter memory_size_in_kb : Int32?

        # Whether or not the container can read information from the device's /sys folder. Default: false
        @[JSON::Field(key: "mountROSysfs")]
        getter mount_ro_sysfs : Bool?

        # The list of volumes that the container can access.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::LambdaVolumeMount)?

        def initialize(
          @devices : Array(Types::LambdaDeviceMount)? = nil,
          @memory_size_in_kb : Int32? = nil,
          @mount_ro_sysfs : Bool? = nil,
          @volumes : Array(Types::LambdaVolumeMount)? = nil
        )
        end
      end

      # Contains information about a device that Linux processes in a container can access.
      struct LambdaDeviceMount
        include JSON::Serializable

        # The mount path for the device in the file system.
        @[JSON::Field(key: "path")]
        getter path : String

        # Whether or not to add the component's system user as an owner of the device. Default: false
        @[JSON::Field(key: "addGroupOwner")]
        getter add_group_owner : Bool?

        # The permission to access the device: read/only ( ro ) or read/write ( rw ). Default: ro
        @[JSON::Field(key: "permission")]
        getter permission : String?

        def initialize(
          @path : String,
          @add_group_owner : Bool? = nil,
          @permission : String? = nil
        )
        end
      end

      # Contains information about an event source for an Lambda function. The event source defines the
      # topics on which this Lambda function subscribes to receive messages that run the function.
      struct LambdaEventSource
        include JSON::Serializable

        # The topic to which to subscribe to receive event messages.
        @[JSON::Field(key: "topic")]
        getter topic : String

        # The type of event source. Choose from the following options: PUB_SUB – Subscribe to local
        # publish/subscribe messages. This event source type doesn't support MQTT wildcards ( + and # ) in the
        # event source topic. IOT_CORE – Subscribe to Amazon Web Services IoT Core MQTT messages. This event
        # source type supports MQTT wildcards ( + and # ) in the event source topic.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @topic : String,
          @type : String
        )
        end
      end

      # Contains parameters for a Lambda function that runs on IoT Greengrass.
      struct LambdaExecutionParameters
        include JSON::Serializable

        # The map of environment variables that are available to the Lambda function when it runs.
        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The list of event sources to which to subscribe to receive work messages. The Lambda function runs
        # when it receives a message from an event source. You can subscribe this function to local
        # publish/subscribe messages and Amazon Web Services IoT Core MQTT messages.
        @[JSON::Field(key: "eventSources")]
        getter event_sources : Array(Types::LambdaEventSource)?

        # The list of arguments to pass to the Lambda function when it runs.
        @[JSON::Field(key: "execArgs")]
        getter exec_args : Array(String)?

        # The encoding type that the Lambda function supports. Default: json
        @[JSON::Field(key: "inputPayloadEncodingType")]
        getter input_payload_encoding_type : String?

        # The parameters for the Linux process that contains the Lambda function.
        @[JSON::Field(key: "linuxProcessParams")]
        getter linux_process_params : Types::LambdaLinuxProcessParams?

        # The maximum amount of time in seconds that a non-pinned Lambda function can idle before the IoT
        # Greengrass Core software stops its process.
        @[JSON::Field(key: "maxIdleTimeInSeconds")]
        getter max_idle_time_in_seconds : Int32?

        # The maximum number of instances that a non-pinned Lambda function can run at the same time.
        @[JSON::Field(key: "maxInstancesCount")]
        getter max_instances_count : Int32?

        # The maximum size of the message queue for the Lambda function component. The IoT Greengrass core
        # stores messages in a FIFO (first-in-first-out) queue until it can run the Lambda function to consume
        # each message.
        @[JSON::Field(key: "maxQueueSize")]
        getter max_queue_size : Int32?

        # Whether or not the Lambda function is pinned, or long-lived. A pinned Lambda function starts when
        # IoT Greengrass starts and keeps running in its own container. A non-pinned Lambda function starts
        # only when it receives a work item and exists after it idles for maxIdleTimeInSeconds . If the
        # function has multiple work items, the IoT Greengrass Core software creates multiple instances of the
        # function. Default: true
        @[JSON::Field(key: "pinned")]
        getter pinned : Bool?

        # The interval in seconds at which a pinned (also known as long-lived) Lambda function component sends
        # status updates to the Lambda manager component.
        @[JSON::Field(key: "statusTimeoutInSeconds")]
        getter status_timeout_in_seconds : Int32?

        # The maximum amount of time in seconds that the Lambda function can process a work item.
        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @environment_variables : Hash(String, String)? = nil,
          @event_sources : Array(Types::LambdaEventSource)? = nil,
          @exec_args : Array(String)? = nil,
          @input_payload_encoding_type : String? = nil,
          @linux_process_params : Types::LambdaLinuxProcessParams? = nil,
          @max_idle_time_in_seconds : Int32? = nil,
          @max_instances_count : Int32? = nil,
          @max_queue_size : Int32? = nil,
          @pinned : Bool? = nil,
          @status_timeout_in_seconds : Int32? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end

      # Contains information about an Lambda function to import to create a component.
      struct LambdaFunctionRecipeSource
        include JSON::Serializable

        # The ARN of the Lambda function. The ARN must include the version of the function to import. You
        # can't use version aliases like $LATEST .
        @[JSON::Field(key: "lambdaArn")]
        getter lambda_arn : String

        # The component versions on which this Lambda function component depends.
        @[JSON::Field(key: "componentDependencies")]
        getter component_dependencies : Hash(String, Types::ComponentDependencyRequirement)?

        # The system and runtime parameters for the Lambda function as it runs on the Greengrass core device.
        @[JSON::Field(key: "componentLambdaParameters")]
        getter component_lambda_parameters : Types::LambdaExecutionParameters?

        # The name of the component. Defaults to the name of the Lambda function.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The platforms that the component version supports.
        @[JSON::Field(key: "componentPlatforms")]
        getter component_platforms : Array(Types::ComponentPlatform)?

        # The version of the component. Defaults to the version of the Lambda function as a semantic version.
        # For example, if your function version is 3 , the component version becomes 3.0.0 .
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String?

        def initialize(
          @lambda_arn : String,
          @component_dependencies : Hash(String, Types::ComponentDependencyRequirement)? = nil,
          @component_lambda_parameters : Types::LambdaExecutionParameters? = nil,
          @component_name : String? = nil,
          @component_platforms : Array(Types::ComponentPlatform)? = nil,
          @component_version : String? = nil
        )
        end
      end

      # Contains parameters for a Linux process that contains an Lambda function.
      struct LambdaLinuxProcessParams
        include JSON::Serializable

        # The parameters for the container in which the Lambda function runs.
        @[JSON::Field(key: "containerParams")]
        getter container_params : Types::LambdaContainerParams?

        # The isolation mode for the process that contains the Lambda function. The process can run in an
        # isolated runtime environment inside the IoT Greengrass container, or as a regular process outside
        # any container. Default: GreengrassContainer
        @[JSON::Field(key: "isolationMode")]
        getter isolation_mode : String?

        def initialize(
          @container_params : Types::LambdaContainerParams? = nil,
          @isolation_mode : String? = nil
        )
        end
      end

      # Contains information about a volume that Linux processes in a container can access. When you define
      # a volume, the IoT Greengrass Core software mounts the source files to the destination inside the
      # container.
      struct LambdaVolumeMount
        include JSON::Serializable

        # The path to the logical volume in the file system.
        @[JSON::Field(key: "destinationPath")]
        getter destination_path : String

        # The path to the physical volume in the file system.
        @[JSON::Field(key: "sourcePath")]
        getter source_path : String

        # Whether or not to add the IoT Greengrass user group as an owner of the volume. Default: false
        @[JSON::Field(key: "addGroupOwner")]
        getter add_group_owner : Bool?

        # The permission to access the volume: read/only ( ro ) or read/write ( rw ). Default: ro
        @[JSON::Field(key: "permission")]
        getter permission : String?

        def initialize(
          @destination_path : String,
          @source_path : String,
          @add_group_owner : Bool? = nil,
          @permission : String? = nil
        )
        end
      end

      struct ListClientDevicesAssociatedWithCoreDeviceRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        # The maximum number of results to be returned per paginated request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_device_thing_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListClientDevicesAssociatedWithCoreDeviceResponse
        include JSON::Serializable

        # A list that describes the client devices that are associated with the core device.
        @[JSON::Field(key: "associatedClientDevices")]
        getter associated_client_devices : Array(Types::AssociatedClientDevice)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @associated_client_devices : Array(Types::AssociatedClientDevice)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComponentVersionsRequest
        include JSON::Serializable

        # The ARN of the component.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The maximum number of results to be returned per paginated request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComponentVersionsResponse
        include JSON::Serializable

        # A list of versions that exist for the component.
        @[JSON::Field(key: "componentVersions")]
        getter component_versions : Array(Types::ComponentVersionListItem)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_versions : Array(Types::ComponentVersionListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComponentsRequest
        include JSON::Serializable

        # The maximum number of results to be returned per paginated request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The scope of the components to list. Default: PRIVATE
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scope : String? = nil
        )
        end
      end

      struct ListComponentsResponse
        include JSON::Serializable

        # A list that summarizes each component.
        @[JSON::Field(key: "components")]
        getter components : Array(Types::Component)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @components : Array(Types::Component)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCoreDevicesRequest
        include JSON::Serializable

        # The maximum number of results to be returned per paginated request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The runtime to be used by the core device. The runtime can be: aws_nucleus_classic aws_nucleus_lite
        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        # The core device status by which to filter. If you specify this parameter, the list includes only
        # core devices that have this status. Choose one of the following options: HEALTHY – The IoT
        # Greengrass Core software and all components run on the core device without issue. UNHEALTHY – The
        # IoT Greengrass Core software or a component is in a failed state on the core device.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The ARN of the IoT thing group by which to filter. If you specify this parameter, the list includes
        # only core devices that have successfully deployed a deployment that targets the thing group. When
        # you remove a core device from a thing group, the list continues to include that core device.
        @[JSON::Field(key: "thingGroupArn")]
        getter thing_group_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @runtime : String? = nil,
          @status : String? = nil,
          @thing_group_arn : String? = nil
        )
        end
      end

      struct ListCoreDevicesResponse
        include JSON::Serializable

        # A list that summarizes each core device.
        @[JSON::Field(key: "coreDevices")]
        getter core_devices : Array(Types::CoreDevice)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_devices : Array(Types::CoreDevice)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDeploymentsRequest
        include JSON::Serializable

        # The filter for the list of deployments. Choose one of the following options: ALL – The list includes
        # all deployments. LATEST_ONLY – The list includes only the latest revision of each deployment.
        # Default: LATEST_ONLY
        @[JSON::Field(key: "historyFilter")]
        getter history_filter : String?

        # The maximum number of results to be returned per paginated request. Default: 50
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The parent deployment's target ARN within a subdeployment.
        @[JSON::Field(key: "parentTargetArn")]
        getter parent_target_arn : String?

        # The ARN of the target IoT thing or thing group.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @history_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @parent_target_arn : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      struct ListDeploymentsResponse
        include JSON::Serializable

        # A list that summarizes each deployment.
        @[JSON::Field(key: "deployments")]
        getter deployments : Array(Types::Deployment)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployments : Array(Types::Deployment)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEffectiveDeploymentsRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        # The maximum number of results to be returned per paginated request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_device_thing_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEffectiveDeploymentsResponse
        include JSON::Serializable

        # A list that summarizes each deployment on the core device.
        @[JSON::Field(key: "effectiveDeployments")]
        getter effective_deployments : Array(Types::EffectiveDeployment)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @effective_deployments : Array(Types::EffectiveDeployment)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInstalledComponentsRequest
        include JSON::Serializable

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "coreDeviceThingName")]
        getter core_device_thing_name : String

        # The maximum number of results to be returned per paginated request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to be used for the next set of paginated results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The filter for the list of components. Choose from the following options: ALL – The list includes
        # all components installed on the core device. ROOT – The list includes only root components, which
        # are components that you specify in a deployment. When you choose this option, the list doesn't
        # include components that the core device installs as dependencies of other components. Default: ROOT
        @[JSON::Field(key: "topologyFilter")]
        getter topology_filter : String?

        def initialize(
          @core_device_thing_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @topology_filter : String? = nil
        )
        end
      end

      struct ListInstalledComponentsResponse
        include JSON::Serializable

        # A list that summarizes each component on the core device. Greengrass nucleus v2.7.0 or later is
        # required to get an accurate lastStatusChangeTimestamp response. This response can be inaccurate in
        # earlier Greengrass nucleus versions. Greengrass nucleus v2.8.0 or later is required to get an
        # accurate lastInstallationSource and lastReportedTimestamp response. This response can be inaccurate
        # or null in earlier Greengrass nucleus versions.
        @[JSON::Field(key: "installedComponents")]
        getter installed_components : Array(Types::InstalledComponent)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @installed_components : Array(Types::InstalledComponent)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The request is already in progress. This exception occurs when you use a client token for multiple
      # requests while IoT Greengrass is still processing an earlier request that uses the same client
      # token.
      struct RequestAlreadyInProgressException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ResolveComponentCandidatesRequest
        include JSON::Serializable

        # The list of components to resolve.
        @[JSON::Field(key: "componentCandidates")]
        getter component_candidates : Array(Types::ComponentCandidate)?

        # The platform to use to resolve compatible components.
        @[JSON::Field(key: "platform")]
        getter platform : Types::ComponentPlatform?

        def initialize(
          @component_candidates : Array(Types::ComponentCandidate)? = nil,
          @platform : Types::ComponentPlatform? = nil
        )
        end
      end

      struct ResolveComponentCandidatesResponse
        include JSON::Serializable

        # A list of components that meet the requirements that you specify in the request. This list includes
        # each component's recipe that you can use to install the component.
        @[JSON::Field(key: "resolvedComponentVersions")]
        getter resolved_component_versions : Array(Types::ResolvedComponentVersion)?

        def initialize(
          @resolved_component_versions : Array(Types::ResolvedComponentVersion)? = nil
        )
        end
      end

      # Contains information about a component version that is compatible to run on a Greengrass core
      # device.
      struct ResolvedComponentVersion
        include JSON::Serializable

        # The ARN of the component version.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the component.
        @[JSON::Field(key: "componentName")]
        getter component_name : String?

        # The version of the component.
        @[JSON::Field(key: "componentVersion")]
        getter component_version : String?

        # A message that communicates details about the vendor guidance state of the component version. This
        # message communicates why a component version is discontinued or deleted.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The recipe of the component version.
        @[JSON::Field(key: "recipe")]
        getter recipe : Bytes?

        # The vendor guidance state for the component version. This state indicates whether the component
        # version has any issues that you should consider before you deploy it. The vendor guidance state can
        # be: ACTIVE – This component version is available and recommended for use. DISCONTINUED – This
        # component version has been discontinued by its publisher. You can deploy this component version, but
        # we recommend that you use a different version of this component. DELETED – This component version
        # has been deleted by its publisher, so you can't deploy it. If you have any existing deployments that
        # specify this component version, those deployments will fail.
        @[JSON::Field(key: "vendorGuidance")]
        getter vendor_guidance : String?

        def initialize(
          @arn : String? = nil,
          @component_name : String? = nil,
          @component_version : String? = nil,
          @message : String? = nil,
          @recipe : Bytes? = nil,
          @vendor_guidance : String? = nil
        )
        end
      end

      # The requested resource can't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that isn't found.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that isn't found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Your request exceeds a service quota. For example, you might have the maximum number of components
      # that you can create.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The code for the quota in Service Quotas .
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The code for the service in Service Quotas .
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The ID of the resource that exceeds the service quota.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that exceeds the service quota.
        @[JSON::Field(key: "resourceType")]
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

      # Contains information about system resource limits that the IoT Greengrass Core software applies to a
      # component's processes. For more information, see Configure system resource limits for components .
      struct SystemResourceLimits
        include JSON::Serializable

        # The maximum amount of CPU time that a component's processes can use on the core device. A core
        # device's total CPU time is equivalent to the device's number of CPU cores. For example, on a core
        # device with 4 CPU cores, you can set this value to 2 to limit the component's processes to 50
        # percent usage of each CPU core. On a device with 1 CPU core, you can set this value to 0.25 to limit
        # the component's processes to 25 percent usage of the CPU. If you set this value to a number greater
        # than the number of CPU cores, the IoT Greengrass Core software doesn't limit the component's CPU
        # usage.
        @[JSON::Field(key: "cpus")]
        getter cpus : Float64?

        # The maximum amount of RAM, expressed in kilobytes, that a component's processes can use on the core
        # device.
        @[JSON::Field(key: "memory")]
        getter memory : Int64?

        def initialize(
          @cpus : Float64? = nil,
          @memory : Int64? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of key-value pairs that contain metadata for the resource. For more information, see Tag your
        # resources in the IoT Greengrass V2 Developer Guide .
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

      # Your request exceeded a request rate quota. For example, you might have exceeded the amount of times
      # that you can retrieve device or deployment status per second.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The code for the quota in Service Quotas .
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The amount of time to wait before you retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The code for the service in Service Quotas .
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to untag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of keys for tags to remove from the resource.
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

      struct UpdateConnectivityInfoRequest
        include JSON::Serializable

        # The connectivity information for the core device.
        @[JSON::Field(key: "ConnectivityInfo")]
        getter connectivity_info : Array(Types::ConnectivityInfo)

        # The name of the core device. This is also the name of the IoT thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @connectivity_info : Array(Types::ConnectivityInfo),
          @thing_name : String
        )
        end
      end

      struct UpdateConnectivityInfoResponse
        include JSON::Serializable

        # A message about the connectivity information update request.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The new version of the connectivity information for the core device.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @message : String? = nil,
          @version : String? = nil
        )
        end
      end

      # The request isn't valid. This can occur if your request contains malformed JSON or unsupported
      # characters.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The list of fields that failed to validate.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # The reason for the validation exception.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains information about a validation exception field.
      struct ValidationExceptionField
        include JSON::Serializable

        # The message of the exception field.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the exception field.
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
