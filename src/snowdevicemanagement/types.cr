require "json"
require "time"

module Aws
  module SnowDeviceManagement
    module Types

      # You don't have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CancelTaskInput
        include JSON::Serializable

        # The ID of the task that you are attempting to cancel. You can retrieve a task ID by using the
        # ListTasks operation.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct CancelTaskOutput
        include JSON::Serializable

        # The ID of the task that you are attempting to cancel.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @task_id : String? = nil
        )
        end
      end

      # The physical capacity of the Amazon Web Services Snow Family device.

      struct Capacity
        include JSON::Serializable

        # The amount of capacity available for use on the device.

        @[JSON::Field(key: "available")]
        getter available : Int64?

        # The name of the type of capacity, such as memory.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The total capacity on the device.

        @[JSON::Field(key: "total")]
        getter total : Int64?

        # The unit of measure for the type of capacity.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # The amount of capacity used on the device.

        @[JSON::Field(key: "used")]
        getter used : Int64?

        def initialize(
          @available : Int64? = nil,
          @name : String? = nil,
          @total : Int64? = nil,
          @unit : String? = nil,
          @used : Int64? = nil
        )
        end
      end

      # The command given to the device to execute.

      struct Command
        include JSON::Serializable

        # Reboots the device.

        @[JSON::Field(key: "reboot")]
        getter reboot : Types::Reboot?

        # Unlocks the device.

        @[JSON::Field(key: "unlock")]
        getter unlock : Types::Unlock?

        def initialize(
          @reboot : Types::Reboot? = nil,
          @unlock : Types::Unlock? = nil
        )
        end
      end

      # The options for how a device's CPU is configured.

      struct CpuOptions
        include JSON::Serializable

        # The number of cores that the CPU can use.

        @[JSON::Field(key: "coreCount")]
        getter core_count : Int32?

        # The number of threads per core in the CPU.

        @[JSON::Field(key: "threadsPerCore")]
        getter threads_per_core : Int32?

        def initialize(
          @core_count : Int32? = nil,
          @threads_per_core : Int32? = nil
        )
        end
      end


      struct CreateTaskInput
        include JSON::Serializable

        # The task to be performed. Only one task is executed on a device at a time.

        @[JSON::Field(key: "command")]
        getter command : Types::Command

        # A list of managed device IDs.

        @[JSON::Field(key: "targets")]
        getter targets : Array(String)

        # A token ensuring that the action is called only once with the specified details.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the task and its targets.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional metadata that you assign to a resource. You can use tags to categorize a resource in
        # different ways, such as by purpose, owner, or environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @command : Types::Command,
          @targets : Array(String),
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateTaskOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the task that you created.

        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        # The ID of the task that you created.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @task_arn : String? = nil,
          @task_id : String? = nil
        )
        end
      end


      struct DescribeDeviceEc2Input
        include JSON::Serializable

        # A list of instance IDs associated with the managed device.

        @[JSON::Field(key: "instanceIds")]
        getter instance_ids : Array(String)

        # The ID of the managed device.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String

        def initialize(
          @instance_ids : Array(String),
          @managed_device_id : String
        )
        end
      end


      struct DescribeDeviceEc2Output
        include JSON::Serializable

        # A list of structures containing information about each instance.

        @[JSON::Field(key: "instances")]
        getter instances : Array(Types::InstanceSummary)?

        def initialize(
          @instances : Array(Types::InstanceSummary)? = nil
        )
        end
      end


      struct DescribeDeviceInput
        include JSON::Serializable

        # The ID of the device that you are checking the information of.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String

        def initialize(
          @managed_device_id : String
        )
        end
      end


      struct DescribeDeviceOutput
        include JSON::Serializable

        # The ID of the job used when ordering the device.

        @[JSON::Field(key: "associatedWithJob")]
        getter associated_with_job : String?

        # The hardware specifications of the device.

        @[JSON::Field(key: "deviceCapacities")]
        getter device_capacities : Array(Types::Capacity)?

        # The current state of the device.

        @[JSON::Field(key: "deviceState")]
        getter device_state : String?

        # The type of Amazon Web Services Snow Family device.

        @[JSON::Field(key: "deviceType")]
        getter device_type : String?

        # When the device last contacted the Amazon Web Services Cloud. Indicates that the device is online.

        @[JSON::Field(key: "lastReachedOutAt")]
        getter last_reached_out_at : Time?

        # When the device last pushed an update to the Amazon Web Services Cloud. Indicates when the device
        # cache was refreshed.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The Amazon Resource Name (ARN) of the device.

        @[JSON::Field(key: "managedDeviceArn")]
        getter managed_device_arn : String?

        # The ID of the device that you checked the information for.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String?

        # The network interfaces available on the device.

        @[JSON::Field(key: "physicalNetworkInterfaces")]
        getter physical_network_interfaces : Array(Types::PhysicalNetworkInterface)?

        # The software installed on the device.

        @[JSON::Field(key: "software")]
        getter software : Types::SoftwareInformation?

        # Optional metadata that you assign to a resource. You can use tags to categorize a resource in
        # different ways, such as by purpose, owner, or environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @associated_with_job : String? = nil,
          @device_capacities : Array(Types::Capacity)? = nil,
          @device_state : String? = nil,
          @device_type : String? = nil,
          @last_reached_out_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @managed_device_arn : String? = nil,
          @managed_device_id : String? = nil,
          @physical_network_interfaces : Array(Types::PhysicalNetworkInterface)? = nil,
          @software : Types::SoftwareInformation? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeExecutionInput
        include JSON::Serializable

        # The ID of the managed device.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String

        # The ID of the task that the action is describing.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @managed_device_id : String,
          @task_id : String
        )
        end
      end


      struct DescribeExecutionOutput
        include JSON::Serializable

        # The ID of the execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # When the status of the execution was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The ID of the managed device that the task is being executed on.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String?

        # When the execution began.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The current state of the execution.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The ID of the task being executed on the device.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @execution_id : String? = nil,
          @last_updated_at : Time? = nil,
          @managed_device_id : String? = nil,
          @started_at : Time? = nil,
          @state : String? = nil,
          @task_id : String? = nil
        )
        end
      end


      struct DescribeTaskInput
        include JSON::Serializable

        # The ID of the task to be described.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct DescribeTaskOutput
        include JSON::Serializable

        # When the task was completed.

        @[JSON::Field(key: "completedAt")]
        getter completed_at : Time?

        # When the CreateTask operation was called.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description provided of the task and managed devices.

        @[JSON::Field(key: "description")]
        getter description : String?

        # When the state of the task was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The current state of the task.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Optional metadata that you assign to a resource. You can use tags to categorize a resource in
        # different ways, such as by purpose, owner, or environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The managed devices that the task was sent to.

        @[JSON::Field(key: "targets")]
        getter targets : Array(String)?

        # The Amazon Resource Name (ARN) of the task.

        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        # The ID of the task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @targets : Array(String)? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      # Identifying information about the device.

      struct DeviceSummary
        include JSON::Serializable

        # The ID of the job used to order the device.

        @[JSON::Field(key: "associatedWithJob")]
        getter associated_with_job : String?

        # The Amazon Resource Name (ARN) of the device.

        @[JSON::Field(key: "managedDeviceArn")]
        getter managed_device_arn : String?

        # The ID of the device.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String?

        # Optional metadata that you assign to a resource. You can use tags to categorize a resource in
        # different ways, such as by purpose, owner, or environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @associated_with_job : String? = nil,
          @managed_device_arn : String? = nil,
          @managed_device_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes a parameter used to set up an Amazon Elastic Block Store (Amazon EBS) volume in a block
      # device mapping.

      struct EbsInstanceBlockDevice
        include JSON::Serializable

        # When the attachment was initiated.

        @[JSON::Field(key: "attachTime")]
        getter attach_time : Time?

        # A value that indicates whether the volume is deleted on instance termination.

        @[JSON::Field(key: "deleteOnTermination")]
        getter delete_on_termination : Bool?

        # The attachment state.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the Amazon EBS volume.

        @[JSON::Field(key: "volumeId")]
        getter volume_id : String?

        def initialize(
          @attach_time : Time? = nil,
          @delete_on_termination : Bool? = nil,
          @status : String? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # The summary of a task execution on a specified device.

      struct ExecutionSummary
        include JSON::Serializable

        # The ID of the execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # The ID of the managed device that the task is being executed on.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String?

        # The state of the execution.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The ID of the task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @execution_id : String? = nil,
          @managed_device_id : String? = nil,
          @state : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      # The description of an instance. Currently, Amazon EC2 instances are the only supported instance
      # type.

      struct Instance
        include JSON::Serializable

        # The Amazon Machine Image (AMI) launch index, which you can use to find this instance in the launch
        # group.

        @[JSON::Field(key: "amiLaunchIndex")]
        getter ami_launch_index : Int32?

        # Any block device mapping entries for the instance.

        @[JSON::Field(key: "blockDeviceMappings")]
        getter block_device_mappings : Array(Types::InstanceBlockDeviceMapping)?

        # The CPU options for the instance.

        @[JSON::Field(key: "cpuOptions")]
        getter cpu_options : Types::CpuOptions?

        # When the instance was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the AMI used to launch the instance.

        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The ID of the instance.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        # The instance type.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The private IPv4 address assigned to the instance.

        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String?

        # The public IPv4 address assigned to the instance.

        @[JSON::Field(key: "publicIpAddress")]
        getter public_ip_address : String?

        # The device name of the root device volume (for example, /dev/sda1 ).

        @[JSON::Field(key: "rootDeviceName")]
        getter root_device_name : String?

        # The security groups for the instance.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(Types::SecurityGroupIdentifier)?


        @[JSON::Field(key: "state")]
        getter state : Types::InstanceState?

        # When the instance was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @ami_launch_index : Int32? = nil,
          @block_device_mappings : Array(Types::InstanceBlockDeviceMapping)? = nil,
          @cpu_options : Types::CpuOptions? = nil,
          @created_at : Time? = nil,
          @image_id : String? = nil,
          @instance_id : String? = nil,
          @instance_type : String? = nil,
          @private_ip_address : String? = nil,
          @public_ip_address : String? = nil,
          @root_device_name : String? = nil,
          @security_groups : Array(Types::SecurityGroupIdentifier)? = nil,
          @state : Types::InstanceState? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The description of a block device mapping.

      struct InstanceBlockDeviceMapping
        include JSON::Serializable

        # The block device name.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # The parameters used to automatically set up Amazon Elastic Block Store (Amazon EBS) volumes when the
        # instance is launched.

        @[JSON::Field(key: "ebs")]
        getter ebs : Types::EbsInstanceBlockDevice?

        def initialize(
          @device_name : String? = nil,
          @ebs : Types::EbsInstanceBlockDevice? = nil
        )
        end
      end

      # The description of the current state of an instance.

      struct InstanceState
        include JSON::Serializable

        # The state of the instance as a 16-bit unsigned integer. The high byte is all of the bits between 2^8
        # and (2^16)-1, which equals decimal values between 256 and 65,535. These numerical values are used
        # for internal purposes and should be ignored. The low byte is all of the bits between 2^0 and
        # (2^8)-1, which equals decimal values between 0 and 255. The valid values for the instance state code
        # are all in the range of the low byte. These values are: 0 : pending 16 : running 32 : shutting-down
        # 48 : terminated 64 : stopping 80 : stopped You can ignore the high byte value by zeroing out all of
        # the bits above 2^8 or 256 in decimal.

        @[JSON::Field(key: "code")]
        getter code : Int32?

        # The current state of the instance.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # The details about the instance.

      struct InstanceSummary
        include JSON::Serializable

        # A structure containing details about the instance.

        @[JSON::Field(key: "instance")]
        getter instance : Types::Instance?

        # When the instance summary was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        def initialize(
          @instance : Types::Instance? = nil,
          @last_updated_at : Time? = nil
        )
        end
      end

      # An unexpected error occurred while processing the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListDeviceResourcesInput
        include JSON::Serializable

        # The ID of the managed device that you are listing the resources of.

        @[JSON::Field(key: "managedDeviceId")]
        getter managed_device_id : String

        # The maximum number of resources per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to continue to the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A structure used to filter the results by type of resource.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @managed_device_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListDeviceResourcesOutput
        include JSON::Serializable

        # A pagination token to continue to the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A structure defining the resource's type, Amazon Resource Name (ARN), and ID.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::ResourceSummary)?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(Types::ResourceSummary)? = nil
        )
        end
      end


      struct ListDevicesInput
        include JSON::Serializable

        # The ID of the job used to order the device.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The maximum number of devices to list per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to continue to the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDevicesOutput
        include JSON::Serializable

        # A list of device structures that contain information about the device.

        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::DeviceSummary)?

        # A pagination token to continue to the next page of devices.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @devices : Array(Types::DeviceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExecutionsInput
        include JSON::Serializable

        # The ID of the task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The maximum number of tasks to list per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to continue to the next page of tasks.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A structure used to filter the tasks by their current state.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @task_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ListExecutionsOutput
        include JSON::Serializable

        # A list of executions. Each execution contains the task ID, the device that the task is executing on,
        # the execution ID, and the status of the execution.

        @[JSON::Field(key: "executions")]
        getter executions : Array(Types::ExecutionSummary)?

        # A pagination token to continue to the next page of executions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @executions : Array(Types::ExecutionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the device or task.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tags for the device or task.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTasksInput
        include JSON::Serializable

        # The maximum number of tasks per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to continue to the next page of tasks.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A structure used to filter the list of tasks.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ListTasksOutput
        include JSON::Serializable

        # A pagination token to continue to the next page of tasks.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of task structures containing details about each task.

        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::TaskSummary)?

        def initialize(
          @next_token : String? = nil,
          @tasks : Array(Types::TaskSummary)? = nil
        )
        end
      end

      # The details about the physical network interface for the device.

      struct PhysicalNetworkInterface
        include JSON::Serializable

        # The default gateway of the device.

        @[JSON::Field(key: "defaultGateway")]
        getter default_gateway : String?

        # The IP address of the device.

        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # A value that describes whether the IP address is dynamic or persistent.

        @[JSON::Field(key: "ipAddressAssignment")]
        getter ip_address_assignment : String?

        # The MAC address of the device.

        @[JSON::Field(key: "macAddress")]
        getter mac_address : String?

        # The netmask used to divide the IP address into subnets.

        @[JSON::Field(key: "netmask")]
        getter netmask : String?

        # The physical connector type.

        @[JSON::Field(key: "physicalConnectorType")]
        getter physical_connector_type : String?

        # The physical network interface ID.

        @[JSON::Field(key: "physicalNetworkInterfaceId")]
        getter physical_network_interface_id : String?

        def initialize(
          @default_gateway : String? = nil,
          @ip_address : String? = nil,
          @ip_address_assignment : String? = nil,
          @mac_address : String? = nil,
          @netmask : String? = nil,
          @physical_connector_type : String? = nil,
          @physical_network_interface_id : String? = nil
        )
        end
      end

      # A structure used to reboot the device.

      struct Reboot
        include JSON::Serializable

        def initialize
        end
      end

      # The request references a resource that doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A summary of a resource available on the device.

      struct ResourceSummary
        include JSON::Serializable

        # The resource type.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @resource_type : String,
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Information about the device's security group.

      struct SecurityGroupIdentifier
        include JSON::Serializable

        # The security group ID.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # The security group name.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @group_id : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      # The request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about the software on the device.

      struct SoftwareInformation
        include JSON::Serializable

        # The state of the software that is installed or that is being installed on the device.

        @[JSON::Field(key: "installState")]
        getter install_state : String?

        # The version of the software currently installed on the device.

        @[JSON::Field(key: "installedVersion")]
        getter installed_version : String?

        # The version of the software being installed on the device.

        @[JSON::Field(key: "installingVersion")]
        getter installing_version : String?

        def initialize(
          @install_state : String? = nil,
          @installed_version : String? = nil,
          @installing_version : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the device or task.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Optional metadata that you assign to a resource. You can use tags to categorize a resource in
        # different ways, such as by purpose, owner, or environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # Information about the task assigned to one or many devices.

      struct TaskSummary
        include JSON::Serializable

        # The task ID.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The state of the task assigned to one or many devices.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Optional metadata that you assign to a resource. You can use tags to categorize a resource in
        # different ways, such as by purpose, owner, or environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the task.

        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        def initialize(
          @task_id : String,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @task_arn : String? = nil
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

      # A structure used to unlock a device.

      struct Unlock
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the device or task.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Optional metadata that you assign to a resource. You can use tags to categorize a resource in
        # different ways, such as by purpose, owner, or environment.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
