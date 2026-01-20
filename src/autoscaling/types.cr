require "json"
require "time"

module Aws
  module AutoScaling
    module Types

      # Specifies the minimum and maximum for the AcceleratorCount object when you specify
      # InstanceRequirements for an Auto Scaling group.

      struct AcceleratorCountRequest
        include JSON::Serializable

        # The maximum value.

        @[JSON::Field(key: "Max")]
        getter max : Int32?

        # The minimum value.

        @[JSON::Field(key: "Min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # Specifies the minimum and maximum for the AcceleratorTotalMemoryMiB object when you specify
      # InstanceRequirements for an Auto Scaling group.

      struct AcceleratorTotalMemoryMiBRequest
        include JSON::Serializable

        # The memory maximum in MiB.

        @[JSON::Field(key: "Max")]
        getter max : Int32?

        # The memory minimum in MiB.

        @[JSON::Field(key: "Min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # The request failed because an active instance refresh or rollback for the specified Auto Scaling
      # group was not found.

      struct ActiveInstanceRefreshNotFoundFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ActivitiesType
        include JSON::Serializable

        # The scaling activities. Activities are sorted by start time. Activities still in progress are
        # described first.

        @[JSON::Field(key: "Activities")]
        getter activities : Array(Types::Activity)

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @activities : Array(Types::Activity),
          @next_token : String? = nil
        )
        end
      end

      # Describes scaling activity, which is a long-running process that represents a change to your Auto
      # Scaling group, such as changing its size or replacing an instance.

      struct Activity
        include JSON::Serializable

        # The ID of the activity.

        @[JSON::Field(key: "ActivityId")]
        getter activity_id : String

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The reason the activity began.

        @[JSON::Field(key: "Cause")]
        getter cause : String

        # The start time of the activity.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The current status of the activity.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String

        # The Amazon Resource Name (ARN) of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupARN")]
        getter auto_scaling_group_arn : String?

        # The state of the Auto Scaling group, which is either InService or Deleted .

        @[JSON::Field(key: "AutoScalingGroupState")]
        getter auto_scaling_group_state : String?

        # A friendly, more verbose description of the activity.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The details about the activity.

        @[JSON::Field(key: "Details")]
        getter details : String?

        # The end time of the activity.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # A value between 0 and 100 that indicates the progress of the activity.

        @[JSON::Field(key: "Progress")]
        getter progress : Int32?

        # A friendly, more verbose description of the activity status.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @activity_id : String,
          @auto_scaling_group_name : String,
          @cause : String,
          @start_time : Time,
          @status_code : String,
          @auto_scaling_group_arn : String? = nil,
          @auto_scaling_group_state : String? = nil,
          @description : String? = nil,
          @details : String? = nil,
          @end_time : Time? = nil,
          @progress : Int32? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct ActivityType
        include JSON::Serializable

        # A scaling activity.

        @[JSON::Field(key: "Activity")]
        getter activity : Types::Activity?

        def initialize(
          @activity : Types::Activity? = nil
        )
        end
      end

      # Describes a policy adjustment type.

      struct AdjustmentType
        include JSON::Serializable

        # The policy adjustment type. The valid values are ChangeInCapacity , ExactCapacity , and
        # PercentChangeInCapacity .

        @[JSON::Field(key: "AdjustmentType")]
        getter adjustment_type : String?

        def initialize(
          @adjustment_type : String? = nil
        )
        end
      end

      # Describes an alarm.

      struct Alarm
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alarm.

        @[JSON::Field(key: "AlarmARN")]
        getter alarm_arn : String?

        # The name of the alarm.

        @[JSON::Field(key: "AlarmName")]
        getter alarm_name : String?

        def initialize(
          @alarm_arn : String? = nil,
          @alarm_name : String? = nil
        )
        end
      end

      # Specifies the CloudWatch alarm specification to use in an instance refresh.

      struct AlarmSpecification
        include JSON::Serializable

        # The names of one or more CloudWatch alarms to monitor for the instance refresh. You can specify up
        # to 10 alarms.

        @[JSON::Field(key: "Alarms")]
        getter alarms : Array(String)?

        def initialize(
          @alarms : Array(String)? = nil
        )
        end
      end

      # You already have an Auto Scaling group or launch configuration with this name.

      struct AlreadyExistsFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AttachInstancesQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The IDs of the instances. You can specify up to 20 instances.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @instance_ids : Array(String)? = nil
        )
        end
      end


      struct AttachLoadBalancerTargetGroupsResultType
        include JSON::Serializable

        def initialize
        end
      end


      struct AttachLoadBalancerTargetGroupsType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The Amazon Resource Names (ARNs) of the target groups. You can specify up to 10 target groups. To
        # get the ARN of a target group, use the Elastic Load Balancing DescribeTargetGroups API operation.

        @[JSON::Field(key: "TargetGroupARNs")]
        getter target_group_ar_ns : Array(String)

        def initialize(
          @auto_scaling_group_name : String,
          @target_group_ar_ns : Array(String)
        )
        end
      end


      struct AttachLoadBalancersResultType
        include JSON::Serializable

        def initialize
        end
      end


      struct AttachLoadBalancersType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The names of the load balancers. You can specify up to 10 load balancers.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)

        def initialize(
          @auto_scaling_group_name : String,
          @load_balancer_names : Array(String)
        )
        end
      end


      struct AttachTrafficSourcesResultType
        include JSON::Serializable

        def initialize
        end
      end


      struct AttachTrafficSourcesType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The unique identifiers of one or more traffic sources. You can specify up to 10 traffic sources.

        @[JSON::Field(key: "TrafficSources")]
        getter traffic_sources : Array(Types::TrafficSourceIdentifier)

        # If you enable zonal shift with cross-zone disabled load balancers, capacity could become imbalanced
        # across Availability Zones. To skip the validation, specify true . For more information, see Auto
        # Scaling group zonal shift in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "SkipZonalShiftValidation")]
        getter skip_zonal_shift_validation : Bool?

        def initialize(
          @auto_scaling_group_name : String,
          @traffic_sources : Array(Types::TrafficSourceIdentifier),
          @skip_zonal_shift_validation : Bool? = nil
        )
        end
      end

      # Describes an Auto Scaling group.

      struct AutoScalingGroup
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # One or more Availability Zones for the group.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)

        # The date and time the group was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The duration of the default cooldown period, in seconds.

        @[JSON::Field(key: "DefaultCooldown")]
        getter default_cooldown : Int32

        # The desired size of the group.

        @[JSON::Field(key: "DesiredCapacity")]
        getter desired_capacity : Int32

        # A comma-separated value string of one or more health check types.

        @[JSON::Field(key: "HealthCheckType")]
        getter health_check_type : String

        # The maximum size of the group.

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32

        # The minimum size of the group.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32

        # The Amazon Resource Name (ARN) of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupARN")]
        getter auto_scaling_group_arn : String?

        # The instance capacity distribution across Availability Zones.

        @[JSON::Field(key: "AvailabilityZoneDistribution")]
        getter availability_zone_distribution : Types::AvailabilityZoneDistribution?

        # The Availability Zone impairment policy.

        @[JSON::Field(key: "AvailabilityZoneImpairmentPolicy")]
        getter availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy?

        # Indicates whether Capacity Rebalancing is enabled.

        @[JSON::Field(key: "CapacityRebalance")]
        getter capacity_rebalance : Bool?

        # The capacity reservation specification.

        @[JSON::Field(key: "CapacityReservationSpecification")]
        getter capacity_reservation_specification : Types::CapacityReservationSpecification?

        # Reserved.

        @[JSON::Field(key: "Context")]
        getter context : String?

        # The duration of the default instance warmup, in seconds.

        @[JSON::Field(key: "DefaultInstanceWarmup")]
        getter default_instance_warmup : Int32?

        # The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling
        # supports DesiredCapacityType for attribute-based instance type selection only.

        @[JSON::Field(key: "DesiredCapacityType")]
        getter desired_capacity_type : String?

        # The metrics enabled for the group.

        @[JSON::Field(key: "EnabledMetrics")]
        getter enabled_metrics : Array(Types::EnabledMetric)?

        # The duration of the health check grace period, in seconds.

        @[JSON::Field(key: "HealthCheckGracePeriod")]
        getter health_check_grace_period : Int32?

        # The instance lifecycle policy applied to this Auto Scaling group. This policy determines instance
        # behavior when an instance transitions through its lifecycle states. It provides additional control
        # over graceful instance management processes.

        @[JSON::Field(key: "InstanceLifecyclePolicy")]
        getter instance_lifecycle_policy : Types::InstanceLifecyclePolicy?

        # An instance maintenance policy.

        @[JSON::Field(key: "InstanceMaintenancePolicy")]
        getter instance_maintenance_policy : Types::InstanceMaintenancePolicy?

        # The EC2 instances associated with the group.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # The name of the associated launch configuration.

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String?

        # The launch template for the group.

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # One or more load balancers associated with the group.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)?

        # The maximum amount of time, in seconds, that an instance can be in service. Valid Range: Minimum
        # value of 0.

        @[JSON::Field(key: "MaxInstanceLifetime")]
        getter max_instance_lifetime : Int32?

        # The mixed instances policy for the group.

        @[JSON::Field(key: "MixedInstancesPolicy")]
        getter mixed_instances_policy : Types::MixedInstancesPolicy?

        # Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling
        # when scaling in. For more information about preventing instances from terminating on scale in, see
        # Use instance scale-in protection in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "NewInstancesProtectedFromScaleIn")]
        getter new_instances_protected_from_scale_in : Bool?

        # The name of the placement group into which to launch your instances, if any.

        @[JSON::Field(key: "PlacementGroup")]
        getter placement_group : String?

        # The predicted capacity of the group when it has a predictive scaling policy.

        @[JSON::Field(key: "PredictedCapacity")]
        getter predicted_capacity : Int32?

        # The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call
        # other Amazon Web Services on your behalf.

        @[JSON::Field(key: "ServiceLinkedRoleARN")]
        getter service_linked_role_arn : String?

        # The current state of the group when the DeleteAutoScalingGroup operation is in progress.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The suspended processes associated with the group.

        @[JSON::Field(key: "SuspendedProcesses")]
        getter suspended_processes : Array(Types::SuspendedProcess)?

        # The tags for the group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagDescription)?

        # The Amazon Resource Names (ARN) of the target groups for your load balancer.

        @[JSON::Field(key: "TargetGroupARNs")]
        getter target_group_ar_ns : Array(String)?

        # The termination policies for the group.

        @[JSON::Field(key: "TerminationPolicies")]
        getter termination_policies : Array(String)?

        # The traffic sources associated with this Auto Scaling group.

        @[JSON::Field(key: "TrafficSources")]
        getter traffic_sources : Array(Types::TrafficSourceIdentifier)?

        # One or more subnet IDs, if applicable, separated by commas.

        @[JSON::Field(key: "VPCZoneIdentifier")]
        getter vpc_zone_identifier : String?

        # The warm pool for the group.

        @[JSON::Field(key: "WarmPoolConfiguration")]
        getter warm_pool_configuration : Types::WarmPoolConfiguration?

        # The current size of the warm pool.

        @[JSON::Field(key: "WarmPoolSize")]
        getter warm_pool_size : Int32?

        def initialize(
          @auto_scaling_group_name : String,
          @availability_zones : Array(String),
          @created_time : Time,
          @default_cooldown : Int32,
          @desired_capacity : Int32,
          @health_check_type : String,
          @max_size : Int32,
          @min_size : Int32,
          @auto_scaling_group_arn : String? = nil,
          @availability_zone_distribution : Types::AvailabilityZoneDistribution? = nil,
          @availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy? = nil,
          @capacity_rebalance : Bool? = nil,
          @capacity_reservation_specification : Types::CapacityReservationSpecification? = nil,
          @context : String? = nil,
          @default_instance_warmup : Int32? = nil,
          @desired_capacity_type : String? = nil,
          @enabled_metrics : Array(Types::EnabledMetric)? = nil,
          @health_check_grace_period : Int32? = nil,
          @instance_lifecycle_policy : Types::InstanceLifecyclePolicy? = nil,
          @instance_maintenance_policy : Types::InstanceMaintenancePolicy? = nil,
          @instances : Array(Types::Instance)? = nil,
          @launch_configuration_name : String? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @load_balancer_names : Array(String)? = nil,
          @max_instance_lifetime : Int32? = nil,
          @mixed_instances_policy : Types::MixedInstancesPolicy? = nil,
          @new_instances_protected_from_scale_in : Bool? = nil,
          @placement_group : String? = nil,
          @predicted_capacity : Int32? = nil,
          @service_linked_role_arn : String? = nil,
          @status : String? = nil,
          @suspended_processes : Array(Types::SuspendedProcess)? = nil,
          @tags : Array(Types::TagDescription)? = nil,
          @target_group_ar_ns : Array(String)? = nil,
          @termination_policies : Array(String)? = nil,
          @traffic_sources : Array(Types::TrafficSourceIdentifier)? = nil,
          @vpc_zone_identifier : String? = nil,
          @warm_pool_configuration : Types::WarmPoolConfiguration? = nil,
          @warm_pool_size : Int32? = nil
        )
        end
      end


      struct AutoScalingGroupNamesType
        include JSON::Serializable

        # The names of the Auto Scaling groups. By default, you can only specify up to 50 names. You can
        # optionally increase this limit using the MaxRecords property. If you omit this property, all Auto
        # Scaling groups are described.

        @[JSON::Field(key: "AutoScalingGroupNames")]
        getter auto_scaling_group_names : Array(String)?

        # One or more filters to limit the results based on specific tags.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies whether to include information about Amazon EC2 instances in the response. When set to
        # true (default), the response includes instance details.

        @[JSON::Field(key: "IncludeInstances")]
        getter include_instances : Bool?

        # The maximum number of items to return with this call. The default value is 50 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_group_names : Array(String)? = nil,
          @filters : Array(Types::Filter)? = nil,
          @include_instances : Bool? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct AutoScalingGroupsType
        include JSON::Serializable

        # The groups.

        @[JSON::Field(key: "AutoScalingGroups")]
        getter auto_scaling_groups : Array(Types::AutoScalingGroup)

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_groups : Array(Types::AutoScalingGroup),
          @next_token : String? = nil
        )
        end
      end

      # Describes an EC2 instance associated with an Auto Scaling group.

      struct AutoScalingInstanceDetails
        include JSON::Serializable

        # The name of the Auto Scaling group for the instance.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The Availability Zone for the instance.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String

        # The last reported health status of this instance. Healthy means that the instance is healthy and
        # should remain in service. Unhealthy means that the instance is unhealthy and Amazon EC2 Auto Scaling
        # should terminate and replace it.

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The lifecycle state for the instance. The Quarantined state is not used. For more information, see
        # Amazon EC2 Auto Scaling instance lifecycle in the Amazon EC2 Auto Scaling User Guide . Valid values:
        # Pending | Pending:Wait | Pending:Proceed | Quarantined | InService | Terminating | Terminating:Wait
        # | Terminating:Proceed | Terminated | Detaching | Detached | EnteringStandby | Standby |
        # Warmed:Pending | Warmed:Pending:Wait | Warmed:Pending:Proceed | Warmed:Terminating |
        # Warmed:Terminating:Wait | Warmed:Terminating:Proceed | Warmed:Terminated | Warmed:Stopped |
        # Warmed:Running

        @[JSON::Field(key: "LifecycleState")]
        getter lifecycle_state : String

        # Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling
        # in.

        @[JSON::Field(key: "ProtectedFromScaleIn")]
        getter protected_from_scale_in : Bool

        # The ID of the Amazon Machine Image (AMI) associated with the instance. This field shows the current
        # AMI ID of the instance's root volume. It may differ from the original AMI used when the instance was
        # first launched. This field appears for: Instances with root volume replacements through Instance
        # Refresh Instances launched with AMI overrides This field won't appear for: Existing instances
        # launched from Launch Templates without overrides Existing instances that didn’t have their root
        # volume replaced through Instance Refresh

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The instance type of the EC2 instance.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The launch configuration used to launch the instance. This value is not available if you attached
        # the instance to the Auto Scaling group.

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String?

        # The launch template for the instance.

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The number of capacity units contributed by the instance based on its instance type. Valid Range:
        # Minimum value of 1. Maximum value of 999.

        @[JSON::Field(key: "WeightedCapacity")]
        getter weighted_capacity : String?

        def initialize(
          @auto_scaling_group_name : String,
          @availability_zone : String,
          @health_status : String,
          @instance_id : String,
          @lifecycle_state : String,
          @protected_from_scale_in : Bool,
          @image_id : String? = nil,
          @instance_type : String? = nil,
          @launch_configuration_name : String? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @weighted_capacity : String? = nil
        )
        end
      end


      struct AutoScalingInstancesType
        include JSON::Serializable

        # The instances.

        @[JSON::Field(key: "AutoScalingInstances")]
        getter auto_scaling_instances : Array(Types::AutoScalingInstanceDetails)?

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_instances : Array(Types::AutoScalingInstanceDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Describes an Availability Zone distribution.

      struct AvailabilityZoneDistribution
        include JSON::Serializable

        # If launches fail in an Availability Zone, the following strategies are available. The default is
        # balanced-best-effort . balanced-only - If launches fail in an Availability Zone, Auto Scaling will
        # continue to attempt to launch in the unhealthy zone to preserve a balanced distribution.
        # balanced-best-effort - If launches fail in an Availability Zone, Auto Scaling will attempt to launch
        # in another healthy Availability Zone instead.

        @[JSON::Field(key: "CapacityDistributionStrategy")]
        getter capacity_distribution_strategy : String?

        def initialize(
          @capacity_distribution_strategy : String? = nil
        )
        end
      end

      # Describes an Availability Zone impairment policy.

      struct AvailabilityZoneImpairmentPolicy
        include JSON::Serializable

        # Specifies the health check behavior for the impaired Availability Zone in an active zonal shift. If
        # you select Replace unhealthy , instances that appear unhealthy will be replaced in all Availability
        # Zones. If you select Ignore unhealthy , instances will not be replaced in the Availability Zone with
        # the active zonal shift. For more information, see Auto Scaling group zonal shift in the Amazon EC2
        # Auto Scaling User Guide .

        @[JSON::Field(key: "ImpairedZoneHealthCheckBehavior")]
        getter impaired_zone_health_check_behavior : String?

        # If true , enable zonal shift for your Auto Scaling group.

        @[JSON::Field(key: "ZonalShiftEnabled")]
        getter zonal_shift_enabled : Bool?

        def initialize(
          @impaired_zone_health_check_behavior : String? = nil,
          @zonal_shift_enabled : Bool? = nil
        )
        end
      end

      # Specifies the minimum and maximum for the BaselineEbsBandwidthMbps object when you specify
      # InstanceRequirements for an Auto Scaling group.

      struct BaselineEbsBandwidthMbpsRequest
        include JSON::Serializable

        # The maximum value in Mbps.

        @[JSON::Field(key: "Max")]
        getter max : Int32?

        # The minimum value in Mbps.

        @[JSON::Field(key: "Min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # The baseline performance to consider, using an instance family as a baseline reference. The instance
      # family establishes the lowest acceptable level of performance. Auto Scaling uses this baseline to
      # guide instance type selection, but there is no guarantee that the selected instance types will
      # always exceed the baseline for every application. Currently, this parameter only supports CPU
      # performance as a baseline performance factor. For example, specifying c6i uses the CPU performance
      # of the c6i family as the baseline reference.

      struct BaselinePerformanceFactorsRequest
        include JSON::Serializable

        # The CPU performance to consider, using an instance family as the baseline reference.

        @[JSON::Field(key: "Cpu")]
        getter cpu : Types::CpuPerformanceFactorRequest?

        def initialize(
          @cpu : Types::CpuPerformanceFactorRequest? = nil
        )
        end
      end


      struct BatchDeleteScheduledActionAnswer
        include JSON::Serializable

        # The names of the scheduled actions that could not be deleted, including an error message.

        @[JSON::Field(key: "FailedScheduledActions")]
        getter failed_scheduled_actions : Array(Types::FailedScheduledUpdateGroupActionRequest)?

        def initialize(
          @failed_scheduled_actions : Array(Types::FailedScheduledUpdateGroupActionRequest)? = nil
        )
        end
      end


      struct BatchDeleteScheduledActionType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The names of the scheduled actions to delete. The maximum number allowed is 50.

        @[JSON::Field(key: "ScheduledActionNames")]
        getter scheduled_action_names : Array(String)

        def initialize(
          @auto_scaling_group_name : String,
          @scheduled_action_names : Array(String)
        )
        end
      end


      struct BatchPutScheduledUpdateGroupActionAnswer
        include JSON::Serializable

        # The names of the scheduled actions that could not be created or updated, including an error message.

        @[JSON::Field(key: "FailedScheduledUpdateGroupActions")]
        getter failed_scheduled_update_group_actions : Array(Types::FailedScheduledUpdateGroupActionRequest)?

        def initialize(
          @failed_scheduled_update_group_actions : Array(Types::FailedScheduledUpdateGroupActionRequest)? = nil
        )
        end
      end


      struct BatchPutScheduledUpdateGroupActionType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # One or more scheduled actions. The maximum number allowed is 50.

        @[JSON::Field(key: "ScheduledUpdateGroupActions")]
        getter scheduled_update_group_actions : Array(Types::ScheduledUpdateGroupActionRequest)

        def initialize(
          @auto_scaling_group_name : String,
          @scheduled_update_group_actions : Array(Types::ScheduledUpdateGroupActionRequest)
        )
        end
      end

      # Describes a block device mapping.

      struct BlockDeviceMapping
        include JSON::Serializable

        # The device name assigned to the volume (for example, /dev/sdh or xvdh ). For more information, see
        # Device naming on Linux instances in the Amazon EC2 User Guide . To define a block device mapping,
        # set the device name and exactly one of the following properties: Ebs , NoDevice , or VirtualName .

        @[JSON::Field(key: "DeviceName")]
        getter device_name : String

        # Information to attach an EBS volume to an instance at launch.

        @[JSON::Field(key: "Ebs")]
        getter ebs : Types::Ebs?

        # Setting this value to true prevents a volume that is included in the block device mapping of the AMI
        # from being mapped to the specified device name at launch. If NoDevice is true for the root device,
        # instances might fail the EC2 health check. In that case, Amazon EC2 Auto Scaling launches
        # replacement instances.

        @[JSON::Field(key: "NoDevice")]
        getter no_device : Bool?

        # The name of the instance store volume (virtual device) to attach to an instance at launch. The name
        # must be in the form ephemeral X where X is a number starting from zero (0), for example, ephemeral0
        # .

        @[JSON::Field(key: "VirtualName")]
        getter virtual_name : String?

        def initialize(
          @device_name : String,
          @ebs : Types::Ebs? = nil,
          @no_device : Bool? = nil,
          @virtual_name : String? = nil
        )
        end
      end


      struct CancelInstanceRefreshAnswer
        include JSON::Serializable

        # The instance refresh ID associated with the request. This is the unique ID assigned to the instance
        # refresh when it was started.

        @[JSON::Field(key: "InstanceRefreshId")]
        getter instance_refresh_id : String?

        def initialize(
          @instance_refresh_id : String? = nil
        )
        end
      end


      struct CancelInstanceRefreshType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # When cancelling an instance refresh, this indicates whether to wait for in-flight launches and
        # terminations to complete. The default is true. When set to false, Amazon EC2 Auto Scaling cancels
        # the instance refresh without waiting for any pending launches or terminations to complete.

        @[JSON::Field(key: "WaitForTransitioningInstances")]
        getter wait_for_transitioning_instances : Bool?

        def initialize(
          @auto_scaling_group_name : String,
          @wait_for_transitioning_instances : Bool? = nil
        )
        end
      end

      # A GetPredictiveScalingForecast call returns the capacity forecast for a predictive scaling policy.
      # This structure includes the data points for that capacity forecast, along with the timestamps of
      # those data points.

      struct CapacityForecast
        include JSON::Serializable

        # The timestamps for the data points, in UTC format.

        @[JSON::Field(key: "Timestamps")]
        getter timestamps : Array(Time)

        # The values of the data points.

        @[JSON::Field(key: "Values")]
        getter values : Array(Float64)

        def initialize(
          @timestamps : Array(Time),
          @values : Array(Float64)
        )
        end
      end

      # Describes the Capacity Reservation preference and targeting options. If you specify open or none for
      # CapacityReservationPreference , do not specify a CapacityReservationTarget .

      struct CapacityReservationSpecification
        include JSON::Serializable

        # The capacity reservation preference. The following options are available: capacity-reservations-only
        # - Auto Scaling will only launch instances into a Capacity Reservation or Capacity Reservation
        # resource group. If capacity isn't available, instances will fail to launch.
        # capacity-reservations-first - Auto Scaling will try to launch instances into a Capacity Reservation
        # or Capacity Reservation resource group first. If capacity isn't available, instances will run in
        # On-Demand capacity. none - Auto Scaling will not launch instances into a Capacity Reservation.
        # Instances will run in On-Demand capacity. default - Auto Scaling uses the Capacity Reservation
        # preference from your launch template or an open Capacity Reservation.

        @[JSON::Field(key: "CapacityReservationPreference")]
        getter capacity_reservation_preference : String?

        # Describes a target Capacity Reservation or Capacity Reservation resource group.

        @[JSON::Field(key: "CapacityReservationTarget")]
        getter capacity_reservation_target : Types::CapacityReservationTarget?

        def initialize(
          @capacity_reservation_preference : String? = nil,
          @capacity_reservation_target : Types::CapacityReservationTarget? = nil
        )
        end
      end

      # The target for the Capacity Reservation. Specify Capacity Reservations IDs or Capacity Reservation
      # resource group ARNs.

      struct CapacityReservationTarget
        include JSON::Serializable

        # The Capacity Reservation IDs to launch instances into.

        @[JSON::Field(key: "CapacityReservationIds")]
        getter capacity_reservation_ids : Array(String)?

        # The resource group ARNs of the Capacity Reservation to launch instances into.

        @[JSON::Field(key: "CapacityReservationResourceGroupArns")]
        getter capacity_reservation_resource_group_arns : Array(String)?

        def initialize(
          @capacity_reservation_ids : Array(String)? = nil,
          @capacity_reservation_resource_group_arns : Array(String)? = nil
        )
        end
      end


      struct CompleteLifecycleActionAnswer
        include JSON::Serializable

        def initialize
        end
      end


      struct CompleteLifecycleActionType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The action for the group to take. You can specify either CONTINUE or ABANDON .

        @[JSON::Field(key: "LifecycleActionResult")]
        getter lifecycle_action_result : String

        # The name of the lifecycle hook.

        @[JSON::Field(key: "LifecycleHookName")]
        getter lifecycle_hook_name : String

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # A universally unique identifier (UUID) that identifies a specific lifecycle action associated with
        # an instance. Amazon EC2 Auto Scaling sends this token to the notification target you specified when
        # you created the lifecycle hook.

        @[JSON::Field(key: "LifecycleActionToken")]
        getter lifecycle_action_token : String?

        def initialize(
          @auto_scaling_group_name : String,
          @lifecycle_action_result : String,
          @lifecycle_hook_name : String,
          @instance_id : String? = nil,
          @lifecycle_action_token : String? = nil
        )
        end
      end

      # The CPU performance to consider, using an instance family as the baseline reference.

      struct CpuPerformanceFactorRequest
        include JSON::Serializable

        # Specify an instance family to use as the baseline reference for CPU performance. All instance types
        # that match your specified attributes will be compared against the CPU performance of the referenced
        # instance family, regardless of CPU manufacturer or architecture differences. Currently only one
        # instance family can be specified in the list.

        @[JSON::Field(key: "Reference")]
        getter references : Array(Types::PerformanceFactorReferenceRequest)?

        def initialize(
          @references : Array(Types::PerformanceFactorReferenceRequest)? = nil
        )
        end
      end


      struct CreateAutoScalingGroupType
        include JSON::Serializable

        # The name of the Auto Scaling group. This name must be unique per Region per account. The name can
        # contain any ASCII character 33 to 126 including most punctuation characters, digits, and upper and
        # lowercased letters. You cannot use a colon (:) in the name.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The maximum size of the group. With a mixed instances policy that uses instance weighting, Amazon
        # EC2 Auto Scaling may need to go above MaxSize to meet your capacity requirements. In this event,
        # Amazon EC2 Auto Scaling will never go above MaxSize by more than your largest instance weight
        # (weights that define how many units each instance contributes to the desired capacity of the group).

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32

        # The minimum size of the group.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32

        # The instance capacity distribution across Availability Zones.

        @[JSON::Field(key: "AvailabilityZoneDistribution")]
        getter availability_zone_distribution : Types::AvailabilityZoneDistribution?

        # The policy for Availability Zone impairment.

        @[JSON::Field(key: "AvailabilityZoneImpairmentPolicy")]
        getter availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy?

        # A list of Availability Zones where instances in the Auto Scaling group can be created. Used for
        # launching into the default VPC subnet in each Availability Zone when not using the VPCZoneIdentifier
        # property, or for attaching a network interface when an existing network interface ID is specified in
        # a launch template.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Indicates whether Capacity Rebalancing is enabled. Otherwise, Capacity Rebalancing is disabled. When
        # you turn on Capacity Rebalancing, Amazon EC2 Auto Scaling attempts to launch a Spot Instance
        # whenever Amazon EC2 notifies that a Spot Instance is at an elevated risk of interruption. After
        # launching a new instance, it then terminates an old instance. For more information, see Use Capacity
        # Rebalancing to handle Amazon EC2 Spot Interruptions in the in the Amazon EC2 Auto Scaling User Guide
        # .

        @[JSON::Field(key: "CapacityRebalance")]
        getter capacity_rebalance : Bool?

        # The capacity reservation specification for the Auto Scaling group.

        @[JSON::Field(key: "CapacityReservationSpecification")]
        getter capacity_reservation_specification : Types::CapacityReservationSpecification?

        # Reserved.

        @[JSON::Field(key: "Context")]
        getter context : String?

        # Only needed if you use simple scaling policies. The amount of time, in seconds, between one scaling
        # activity ending and another one starting due to simple scaling policies. For more information, see
        # Scaling cooldowns for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide . Default:
        # 300 seconds

        @[JSON::Field(key: "DefaultCooldown")]
        getter default_cooldown : Int32?

        # The amount of time, in seconds, until a new instance is considered to have finished initializing and
        # resource consumption to become stable after it enters the InService state. During an instance
        # refresh, Amazon EC2 Auto Scaling waits for the warm-up period after it replaces an instance before
        # it moves on to replacing the next instance. Amazon EC2 Auto Scaling also waits for the warm-up
        # period before aggregating the metrics for new instances with existing instances in the Amazon
        # CloudWatch metrics that are used for scaling, resulting in more reliable usage data. For more
        # information, see Set the default instance warmup for an Auto Scaling group in the Amazon EC2 Auto
        # Scaling User Guide . To manage various warm-up settings at the group level, we recommend that you
        # set the default instance warmup, even if it is set to 0 seconds . To remove a value that you
        # previously set, include the property but specify -1 for the value. However, we strongly recommend
        # keeping the default instance warmup enabled by specifying a value of 0 or other nominal value.
        # Default: None

        @[JSON::Field(key: "DefaultInstanceWarmup")]
        getter default_instance_warmup : Int32?

        # The desired capacity is the initial capacity of the Auto Scaling group at the time of its creation
        # and the capacity it attempts to maintain. It can scale beyond this capacity if you configure auto
        # scaling. This number must be greater than or equal to the minimum size of the group and less than or
        # equal to the maximum size of the group. If you do not specify a desired capacity, the default is the
        # minimum size of the group.

        @[JSON::Field(key: "DesiredCapacity")]
        getter desired_capacity : Int32?

        # The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling
        # supports DesiredCapacityType for attribute-based instance type selection only. For more information,
        # see Create a mixed instances group using attribute-based instance type selection in the Amazon EC2
        # Auto Scaling User Guide . By default, Amazon EC2 Auto Scaling specifies units , which translates
        # into number of instances. Valid values: units | vcpu | memory-mib

        @[JSON::Field(key: "DesiredCapacityType")]
        getter desired_capacity_type : String?

        # The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status
        # of an EC2 instance that has come into service and marking it unhealthy due to a failed health check.
        # This is useful if your instances do not immediately pass their health checks after they enter the
        # InService state. For more information, see Set the health check grace period for an Auto Scaling
        # group in the Amazon EC2 Auto Scaling User Guide . Default: 0 seconds

        @[JSON::Field(key: "HealthCheckGracePeriod")]
        getter health_check_grace_period : Int32?

        # A comma-separated value string of one or more health check types. The valid values are EC2 , EBS ,
        # ELB , and VPC_LATTICE . EC2 is the default health check and cannot be disabled. For more
        # information, see Health checks for instances in an Auto Scaling group in the Amazon EC2 Auto Scaling
        # User Guide . Only specify EC2 if you must clear a value that was previously set.

        @[JSON::Field(key: "HealthCheckType")]
        getter health_check_type : String?

        # The ID of the instance used to base the launch configuration on. If specified, Amazon EC2 Auto
        # Scaling uses the configuration values from the specified instance to create a new launch
        # configuration. To get the instance ID, use the Amazon EC2 DescribeInstances API operation. For more
        # information, see Create an Auto Scaling group using parameters from an existing instance in the
        # Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The instance lifecycle policy for the Auto Scaling group. This policy controls instance behavior
        # when an instance transitions through its lifecycle states. Configure retention triggers to specify
        # when instances should move to a Retained state for manual intervention instead of automatic
        # termination. Instances in a Retained state will continue to incur standard EC2 charges until
        # terminated.

        @[JSON::Field(key: "InstanceLifecyclePolicy")]
        getter instance_lifecycle_policy : Types::InstanceLifecyclePolicy?

        # An instance maintenance policy. For more information, see Set instance maintenance policy in the
        # Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "InstanceMaintenancePolicy")]
        getter instance_maintenance_policy : Types::InstanceMaintenancePolicy?

        # The name of the launch configuration to use to launch instances. Conditional: You must specify
        # either a launch template ( LaunchTemplate or MixedInstancesPolicy ) or a launch configuration (
        # LaunchConfigurationName or InstanceId ).

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String?

        # Information used to specify the launch template and version to use to launch instances. Conditional:
        # You must specify either a launch template ( LaunchTemplate or MixedInstancesPolicy ) or a launch
        # configuration ( LaunchConfigurationName or InstanceId ). The launch template that is specified must
        # be configured for use with an Auto Scaling group. For more information, see Create a launch template
        # for an Auto Scaling group in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # One or more lifecycle hooks to add to the Auto Scaling group before instances are launched.

        @[JSON::Field(key: "LifecycleHookSpecificationList")]
        getter lifecycle_hook_specification_list : Array(Types::LifecycleHookSpecification)?

        # A list of Classic Load Balancers associated with this Auto Scaling group. For Application Load
        # Balancers, Network Load Balancers, and Gateway Load Balancers, specify the TargetGroupARNs property
        # instead.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)?

        # The maximum amount of time, in seconds, that an instance can be in service. The default is null. If
        # specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day).
        # For more information, see Replace Auto Scaling instances based on maximum instance lifetime in the
        # Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "MaxInstanceLifetime")]
        getter max_instance_lifetime : Int32?

        # The mixed instances policy. For more information, see Auto Scaling groups with multiple instance
        # types and purchase options in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "MixedInstancesPolicy")]
        getter mixed_instances_policy : Types::MixedInstancesPolicy?

        # Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling
        # when scaling in. For more information about preventing instances from terminating on scale in, see
        # Use instance scale-in protection in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "NewInstancesProtectedFromScaleIn")]
        getter new_instances_protected_from_scale_in : Bool?

        # The name of the placement group into which to launch your instances. For more information, see
        # Placement groups in the Amazon EC2 User Guide . A cluster placement group is a logical grouping of
        # instances within a single Availability Zone. You cannot specify multiple Availability Zones and a
        # cluster placement group.

        @[JSON::Field(key: "PlacementGroup")]
        getter placement_group : String?

        # The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call
        # other Amazon Web Services service on your behalf. By default, Amazon EC2 Auto Scaling uses a
        # service-linked role named AWSServiceRoleForAutoScaling , which it creates if it does not exist. For
        # more information, see Service-linked roles in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "ServiceLinkedRoleARN")]
        getter service_linked_role_arn : String?

        # If you enable zonal shift with cross-zone disabled load balancers, capacity could become imbalanced
        # across Availability Zones. To skip the validation, specify true . For more information, see Auto
        # Scaling group zonal shift in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "SkipZonalShiftValidation")]
        getter skip_zonal_shift_validation : Bool?

        # One or more tags. You can tag your Auto Scaling group and propagate the tags to the Amazon EC2
        # instances it launches. Tags are not propagated to Amazon EBS volumes. To add tags to Amazon EBS
        # volumes, specify the tags in a launch template but use caution. If the launch template specifies an
        # instance tag with a key that is also specified for the Auto Scaling group, Amazon EC2 Auto Scaling
        # overrides the value of that instance tag with the value specified by the Auto Scaling group. For
        # more information, see Tag Auto Scaling groups and instances in the Amazon EC2 Auto Scaling User
        # Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Resource Names (ARN) of the Elastic Load Balancing target groups to associate with the
        # Auto Scaling group. Instances are registered as targets with the target groups. The target groups
        # receive incoming traffic and route requests to one or more registered targets. For more information,
        # see Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group
        # in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "TargetGroupARNs")]
        getter target_group_ar_ns : Array(String)?

        # A policy or a list of policies that are used to select the instance to terminate. These policies are
        # executed in the order that you list them. For more information, see Configure termination policies
        # for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide . Valid values: Default |
        # AllocationStrategy | ClosestToNextInstanceHour | NewestInstance | OldestInstance |
        # OldestLaunchConfiguration | OldestLaunchTemplate |
        # arn:aws:lambda:region:account-id:function:my-function:my-alias

        @[JSON::Field(key: "TerminationPolicies")]
        getter termination_policies : Array(String)?

        # The list of traffic sources to attach to this Auto Scaling group. You can use any of the following
        # as traffic sources for an Auto Scaling group: Classic Load Balancer, Application Load Balancer,
        # Gateway Load Balancer, Network Load Balancer, and VPC Lattice.

        @[JSON::Field(key: "TrafficSources")]
        getter traffic_sources : Array(Types::TrafficSourceIdentifier)?

        # A comma-separated list of subnet IDs for a virtual private cloud (VPC) where instances in the Auto
        # Scaling group can be created. If you specify VPCZoneIdentifier with AvailabilityZones , the subnets
        # that you specify must reside in those Availability Zones.

        @[JSON::Field(key: "VPCZoneIdentifier")]
        getter vpc_zone_identifier : String?

        def initialize(
          @auto_scaling_group_name : String,
          @max_size : Int32,
          @min_size : Int32,
          @availability_zone_distribution : Types::AvailabilityZoneDistribution? = nil,
          @availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy? = nil,
          @availability_zones : Array(String)? = nil,
          @capacity_rebalance : Bool? = nil,
          @capacity_reservation_specification : Types::CapacityReservationSpecification? = nil,
          @context : String? = nil,
          @default_cooldown : Int32? = nil,
          @default_instance_warmup : Int32? = nil,
          @desired_capacity : Int32? = nil,
          @desired_capacity_type : String? = nil,
          @health_check_grace_period : Int32? = nil,
          @health_check_type : String? = nil,
          @instance_id : String? = nil,
          @instance_lifecycle_policy : Types::InstanceLifecyclePolicy? = nil,
          @instance_maintenance_policy : Types::InstanceMaintenancePolicy? = nil,
          @launch_configuration_name : String? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @lifecycle_hook_specification_list : Array(Types::LifecycleHookSpecification)? = nil,
          @load_balancer_names : Array(String)? = nil,
          @max_instance_lifetime : Int32? = nil,
          @mixed_instances_policy : Types::MixedInstancesPolicy? = nil,
          @new_instances_protected_from_scale_in : Bool? = nil,
          @placement_group : String? = nil,
          @service_linked_role_arn : String? = nil,
          @skip_zonal_shift_validation : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_group_ar_ns : Array(String)? = nil,
          @termination_policies : Array(String)? = nil,
          @traffic_sources : Array(Types::TrafficSourceIdentifier)? = nil,
          @vpc_zone_identifier : String? = nil
        )
        end
      end


      struct CreateLaunchConfigurationType
        include JSON::Serializable

        # The name of the launch configuration. This name must be unique per Region per account.

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String

        # Specifies whether to assign a public IPv4 address to the group's instances. If the instance is
        # launched into a default subnet, the default is to assign a public IPv4 address, unless you disabled
        # the option to assign a public IPv4 address on the subnet. If the instance is launched into a
        # nondefault subnet, the default is not to assign a public IPv4 address, unless you enabled the option
        # to assign a public IPv4 address on the subnet. If you specify true , each instance in the Auto
        # Scaling group receives a unique public IPv4 address. For more information, see Provide network
        # connectivity for your Auto Scaling instances using Amazon VPC in the Amazon EC2 Auto Scaling User
        # Guide . If you specify this property, you must specify at least one subnet for VPCZoneIdentifier
        # when you create your group.

        @[JSON::Field(key: "AssociatePublicIpAddress")]
        getter associate_public_ip_address : Bool?

        # The block device mapping entries that define the block devices to attach to the instances at launch.
        # By default, the block devices specified in the block device mapping for the AMI are used. For more
        # information, see Block device mappings in the Amazon EC2 User Guide .

        @[JSON::Field(key: "BlockDeviceMappings")]
        getter block_device_mappings : Array(Types::BlockDeviceMapping)?

        # Available for backward compatibility.

        @[JSON::Field(key: "ClassicLinkVPCId")]
        getter classic_link_vpc_id : String?

        # Available for backward compatibility.

        @[JSON::Field(key: "ClassicLinkVPCSecurityGroups")]
        getter classic_link_vpc_security_groups : Array(String)?

        # Specifies whether the launch configuration is optimized for EBS I/O ( true ) or not ( false ). The
        # optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to
        # provide optimal I/O performance. This optimization is not available with all instance types.
        # Additional fees are incurred when you enable EBS optimization for an instance type that is not
        # EBS-optimized by default. For more information, see Amazon EBS-optimized instances in the Amazon EC2
        # User Guide . The default value is false .

        @[JSON::Field(key: "EbsOptimized")]
        getter ebs_optimized : Bool?

        # The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for
        # the instance. The instance profile contains the IAM role. For more information, see IAM role for
        # applications that run on Amazon EC2 instances in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "IamInstanceProfile")]
        getter iam_instance_profile : String?

        # The ID of the Amazon Machine Image (AMI) that was assigned during registration. For more
        # information, see Find a Linux AMI in the Amazon EC2 User Guide . If you specify InstanceId , an
        # ImageId is not required.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The ID of the instance to use to create the launch configuration. The new launch configuration
        # derives attributes from the instance, except for the block device mapping. To create a launch
        # configuration with a block device mapping or override any other instance attributes, specify them as
        # part of the same request. For more information, see Create a launch configuration in the Amazon EC2
        # Auto Scaling User Guide .

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # Controls whether instances in this group are launched with detailed ( true ) or basic ( false )
        # monitoring. The default value is true (enabled). When detailed monitoring is enabled, Amazon
        # CloudWatch generates metrics every minute and your account is charged a fee. When you disable
        # detailed monitoring, CloudWatch generates metrics every 5 minutes. For more information, see
        # Configure monitoring for Auto Scaling instances in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "InstanceMonitoring")]
        getter instance_monitoring : Types::InstanceMonitoring?

        # Specifies the instance type of the EC2 instance. For information about available instance types, see
        # Available instance types in the Amazon EC2 User Guide . If you specify InstanceId , an InstanceType
        # is not required.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The ID of the kernel associated with the AMI. We recommend that you use PV-GRUB instead of kernels
        # and RAM disks. For more information, see User provided kernels in the Amazon EC2 User Guide .

        @[JSON::Field(key: "KernelId")]
        getter kernel_id : String?

        # The name of the key pair. For more information, see Amazon EC2 key pairs and Amazon EC2 instances in
        # the Amazon EC2 User Guide .

        @[JSON::Field(key: "KeyName")]
        getter key_name : String?

        # The metadata options for the instances. For more information, see Configure the instance metadata
        # options in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "MetadataOptions")]
        getter metadata_options : Types::InstanceMetadataOptions?

        # The tenancy of the instance, either default or dedicated . An instance with dedicated tenancy runs
        # on isolated, single-tenant hardware and can only be launched into a VPC. To launch dedicated
        # instances into a shared tenancy VPC (a VPC with the instance placement tenancy attribute set to
        # default ), you must set the value of this property to dedicated . If you specify PlacementTenancy ,
        # you must specify at least one subnet for VPCZoneIdentifier when you create your group. Valid values:
        # default | dedicated

        @[JSON::Field(key: "PlacementTenancy")]
        getter placement_tenancy : String?

        # The ID of the RAM disk to select. We recommend that you use PV-GRUB instead of kernels and RAM
        # disks. For more information, see User provided kernels in the Amazon EC2 User Guide .

        @[JSON::Field(key: "RamdiskId")]
        getter ramdisk_id : String?

        # A list that contains the security group IDs to assign to the instances in the Auto Scaling group.
        # For more information, see Control traffic to your Amazon Web Services resources using security
        # groups in the Amazon Virtual Private Cloud User Guide .

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot
        # Instances are launched when the price you specify exceeds the current Spot price. For more
        # information, see Request Spot Instances for fault-tolerant and flexible applications in the Amazon
        # EC2 Auto Scaling User Guide . Valid Range: Minimum value of 0.001 When you change your maximum price
        # by creating a new launch configuration, running instances will continue to run as long as the
        # maximum price for those running instances is higher than the current Spot price.

        @[JSON::Field(key: "SpotPrice")]
        getter spot_price : String?

        # The user data to make available to the launched EC2 instances. For more information, see Instance
        # metadata and user data (Linux) and Instance metadata and user data (Windows). If you are using a
        # command line tool, base64-encoding is performed for you, and you can load the text from a file.
        # Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.

        @[JSON::Field(key: "UserData")]
        getter user_data : String?

        def initialize(
          @launch_configuration_name : String,
          @associate_public_ip_address : Bool? = nil,
          @block_device_mappings : Array(Types::BlockDeviceMapping)? = nil,
          @classic_link_vpc_id : String? = nil,
          @classic_link_vpc_security_groups : Array(String)? = nil,
          @ebs_optimized : Bool? = nil,
          @iam_instance_profile : String? = nil,
          @image_id : String? = nil,
          @instance_id : String? = nil,
          @instance_monitoring : Types::InstanceMonitoring? = nil,
          @instance_type : String? = nil,
          @kernel_id : String? = nil,
          @key_name : String? = nil,
          @metadata_options : Types::InstanceMetadataOptions? = nil,
          @placement_tenancy : String? = nil,
          @ramdisk_id : String? = nil,
          @security_groups : Array(String)? = nil,
          @spot_price : String? = nil,
          @user_data : String? = nil
        )
        end
      end


      struct CreateOrUpdateTagsType
        include JSON::Serializable

        # One or more tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @tags : Array(Types::Tag)
        )
        end
      end

      # Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use with
      # Amazon EC2 Auto Scaling. To create your customized metric specification: Add values for each
      # required property from CloudWatch. You can use an existing metric, or a new metric that you create.
      # To use your own metric, you must first publish the metric to CloudWatch. For more information, see
      # Publish custom metrics in the Amazon CloudWatch User Guide . Choose a metric that changes
      # proportionally with capacity. The value of the metric should increase or decrease in inverse
      # proportion to the number of capacity units. That is, the value of the metric should decrease when
      # capacity increases. For more information about the CloudWatch terminology below, see Amazon
      # CloudWatch concepts . Each individual service provides information about the metrics, namespace, and
      # dimensions they use. For more information, see Amazon Web Services services that publish CloudWatch
      # metrics in the Amazon CloudWatch User Guide .

      struct CustomizedMetricSpecification
        include JSON::Serializable

        # The dimensions of the metric. Conditional: If you published your metric with dimensions, you must
        # specify the same dimensions in your scaling policy.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::MetricDimension)?

        # The name of the metric. To get the exact metric name, namespace, and dimensions, inspect the Metric
        # object that is returned by a call to ListMetrics .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The metrics to include in the target tracking scaling policy, as a metric data query. This can
        # include both raw metric and metric math expressions.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(Types::TargetTrackingMetricDataQuery)?

        # The namespace of the metric.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The period of the metric in seconds. The default value is 60. Accepted values are 10, 30, and 60.
        # For high resolution metric, set the value to less than 60. For more information, see Create a target
        # tracking policy using high-resolution metrics for faster response .

        @[JSON::Field(key: "Period")]
        getter period : Int32?

        # The statistic of the metric.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String?

        # The unit of the metric. For a complete list of the units that CloudWatch supports, see the
        # MetricDatum data type in the Amazon CloudWatch API Reference .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @dimensions : Array(Types::MetricDimension)? = nil,
          @metric_name : String? = nil,
          @metrics : Array(Types::TargetTrackingMetricDataQuery)? = nil,
          @namespace : String? = nil,
          @period : Int32? = nil,
          @statistic : String? = nil,
          @unit : String? = nil
        )
        end
      end


      struct DeleteAutoScalingGroupType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # Specifies that the group is to be deleted along with all instances associated with the group,
        # without waiting for all instances to be terminated. This action also deletes any outstanding
        # lifecycle actions associated with the group.

        @[JSON::Field(key: "ForceDelete")]
        getter force_delete : Bool?

        def initialize(
          @auto_scaling_group_name : String,
          @force_delete : Bool? = nil
        )
        end
      end


      struct DeleteLifecycleHookAnswer
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLifecycleHookType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The name of the lifecycle hook.

        @[JSON::Field(key: "LifecycleHookName")]
        getter lifecycle_hook_name : String

        def initialize(
          @auto_scaling_group_name : String,
          @lifecycle_hook_name : String
        )
        end
      end


      struct DeleteNotificationConfigurationType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The Amazon Resource Name (ARN) of the Amazon SNS topic.

        @[JSON::Field(key: "TopicARN")]
        getter topic_arn : String

        def initialize(
          @auto_scaling_group_name : String,
          @topic_arn : String
        )
        end
      end


      struct DeletePolicyType
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        def initialize(
          @policy_name : String,
          @auto_scaling_group_name : String? = nil
        )
        end
      end


      struct DeleteScheduledActionType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The name of the action to delete.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        def initialize(
          @auto_scaling_group_name : String,
          @scheduled_action_name : String
        )
        end
      end


      struct DeleteTagsType
        include JSON::Serializable

        # One or more tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @tags : Array(Types::Tag)
        )
        end
      end


      struct DeleteWarmPoolAnswer
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWarmPoolType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # Specifies that the warm pool is to be deleted along with all of its associated instances, without
        # waiting for all instances to be terminated. This parameter also deletes any outstanding lifecycle
        # actions associated with the warm pool instances.

        @[JSON::Field(key: "ForceDelete")]
        getter force_delete : Bool?

        def initialize(
          @auto_scaling_group_name : String,
          @force_delete : Bool? = nil
        )
        end
      end


      struct DescribeAccountLimitsAnswer
        include JSON::Serializable

        # The maximum number of groups allowed for your account. The default is 200 groups per Region.

        @[JSON::Field(key: "MaxNumberOfAutoScalingGroups")]
        getter max_number_of_auto_scaling_groups : Int32?

        # The maximum number of launch configurations allowed for your account. The default is 200 launch
        # configurations per Region.

        @[JSON::Field(key: "MaxNumberOfLaunchConfigurations")]
        getter max_number_of_launch_configurations : Int32?

        # The current number of groups for your account.

        @[JSON::Field(key: "NumberOfAutoScalingGroups")]
        getter number_of_auto_scaling_groups : Int32?

        # The current number of launch configurations for your account.

        @[JSON::Field(key: "NumberOfLaunchConfigurations")]
        getter number_of_launch_configurations : Int32?

        def initialize(
          @max_number_of_auto_scaling_groups : Int32? = nil,
          @max_number_of_launch_configurations : Int32? = nil,
          @number_of_auto_scaling_groups : Int32? = nil,
          @number_of_launch_configurations : Int32? = nil
        )
        end
      end


      struct DescribeAdjustmentTypesAnswer
        include JSON::Serializable

        # The policy adjustment types.

        @[JSON::Field(key: "AdjustmentTypes")]
        getter adjustment_types : Array(Types::AdjustmentType)?

        def initialize(
          @adjustment_types : Array(Types::AdjustmentType)? = nil
        )
        end
      end


      struct DescribeAutoScalingInstancesType
        include JSON::Serializable

        # The IDs of the instances. If you omit this property, all Auto Scaling instances are described. If
        # you specify an ID that does not exist, it is ignored with no error. Array Members: Maximum number of
        # 50 items.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        # The maximum number of items to return with this call. The default value is 50 and the maximum value
        # is 50 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_ids : Array(String)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAutoScalingNotificationTypesAnswer
        include JSON::Serializable

        # The notification types.

        @[JSON::Field(key: "AutoScalingNotificationTypes")]
        getter auto_scaling_notification_types : Array(String)?

        def initialize(
          @auto_scaling_notification_types : Array(String)? = nil
        )
        end
      end


      struct DescribeInstanceRefreshesAnswer
        include JSON::Serializable

        # The instance refreshes for the specified group, sorted by creation timestamp in descending order.

        @[JSON::Field(key: "InstanceRefreshes")]
        getter instance_refreshes : Array(Types::InstanceRefresh)?

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_refreshes : Array(Types::InstanceRefresh)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstanceRefreshesType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # One or more instance refresh IDs.

        @[JSON::Field(key: "InstanceRefreshIds")]
        getter instance_refresh_ids : Array(String)?

        # The maximum number of items to return with this call. The default value is 50 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_group_name : String,
          @instance_refresh_ids : Array(String)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLifecycleHookTypesAnswer
        include JSON::Serializable

        # The lifecycle hook types.

        @[JSON::Field(key: "LifecycleHookTypes")]
        getter lifecycle_hook_types : Array(String)?

        def initialize(
          @lifecycle_hook_types : Array(String)? = nil
        )
        end
      end


      struct DescribeLifecycleHooksAnswer
        include JSON::Serializable

        # The lifecycle hooks for the specified group.

        @[JSON::Field(key: "LifecycleHooks")]
        getter lifecycle_hooks : Array(Types::LifecycleHook)?

        def initialize(
          @lifecycle_hooks : Array(Types::LifecycleHook)? = nil
        )
        end
      end


      struct DescribeLifecycleHooksType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The names of one or more lifecycle hooks. If you omit this property, all lifecycle hooks are
        # described.

        @[JSON::Field(key: "LifecycleHookNames")]
        getter lifecycle_hook_names : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @lifecycle_hook_names : Array(String)? = nil
        )
        end
      end


      struct DescribeLoadBalancerTargetGroupsRequest
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The maximum number of items to return with this call. The default value is 100 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_group_name : String,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLoadBalancerTargetGroupsResponse
        include JSON::Serializable

        # Information about the target groups.

        @[JSON::Field(key: "LoadBalancerTargetGroups")]
        getter load_balancer_target_groups : Array(Types::LoadBalancerTargetGroupState)?

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @load_balancer_target_groups : Array(Types::LoadBalancerTargetGroupState)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLoadBalancersRequest
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The maximum number of items to return with this call. The default value is 100 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_group_name : String,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLoadBalancersResponse
        include JSON::Serializable

        # The load balancers.

        @[JSON::Field(key: "LoadBalancers")]
        getter load_balancers : Array(Types::LoadBalancerState)?

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @load_balancers : Array(Types::LoadBalancerState)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMetricCollectionTypesAnswer
        include JSON::Serializable

        # The granularities for the metrics.

        @[JSON::Field(key: "Granularities")]
        getter granularities : Array(Types::MetricGranularityType)?

        # The metrics.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(Types::MetricCollectionType)?

        def initialize(
          @granularities : Array(Types::MetricGranularityType)? = nil,
          @metrics : Array(Types::MetricCollectionType)? = nil
        )
        end
      end


      struct DescribeNotificationConfigurationsAnswer
        include JSON::Serializable

        # The notification configurations.

        @[JSON::Field(key: "NotificationConfigurations")]
        getter notification_configurations : Array(Types::NotificationConfiguration)

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @notification_configurations : Array(Types::NotificationConfiguration),
          @next_token : String? = nil
        )
        end
      end


      struct DescribeNotificationConfigurationsType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupNames")]
        getter auto_scaling_group_names : Array(String)?

        # The maximum number of items to return with this call. The default value is 50 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_group_names : Array(String)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribePoliciesType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # The maximum number of items to be returned with each call. The default value is 50 and the maximum
        # value is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of one or more policies. If you omit this property, all policies are described. If a group
        # name is provided, the results are limited to that group. If you specify an unknown policy name, it
        # is ignored with no error. Array Members: Maximum number of 50 items.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)?

        # One or more policy types. The valid values are SimpleScaling , StepScaling , TargetTrackingScaling ,
        # and PredictiveScaling .

        @[JSON::Field(key: "PolicyTypes")]
        getter policy_types : Array(String)?

        def initialize(
          @auto_scaling_group_name : String? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil,
          @policy_names : Array(String)? = nil,
          @policy_types : Array(String)? = nil
        )
        end
      end


      struct DescribeScalingActivitiesType
        include JSON::Serializable

        # The activity IDs of the desired scaling activities. If you omit this property, all activities for
        # the past six weeks are described. If unknown activities are requested, they are ignored with no
        # error. If you specify an Auto Scaling group, the results are limited to that group. Array Members:
        # Maximum number of 50 IDs.

        @[JSON::Field(key: "ActivityIds")]
        getter activity_ids : Array(String)?

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # Indicates whether to include scaling activity from deleted Auto Scaling groups.

        @[JSON::Field(key: "IncludeDeletedGroups")]
        getter include_deleted_groups : Bool?

        # The maximum number of items to return with this call. The default value is 100 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @activity_ids : Array(String)? = nil,
          @auto_scaling_group_name : String? = nil,
          @include_deleted_groups : Bool? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeScheduledActionsType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # The latest scheduled start time to return. If scheduled action names are provided, this property is
        # ignored.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The maximum number of items to return with this call. The default value is 50 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of one or more scheduled actions. If you omit this property, all scheduled actions are
        # described. If you specify an unknown scheduled action, it is ignored with no error. Array Members:
        # Maximum number of 50 actions.

        @[JSON::Field(key: "ScheduledActionNames")]
        getter scheduled_action_names : Array(String)?

        # The earliest scheduled start time to return. If scheduled action names are provided, this property
        # is ignored.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @auto_scaling_group_name : String? = nil,
          @end_time : Time? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil,
          @scheduled_action_names : Array(String)? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct DescribeTagsType
        include JSON::Serializable

        # One or more filters to scope the tags to return. The maximum number of filters per filter type (for
        # example, auto-scaling-group ) is 1000.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of items to return with this call. The default value is 50 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeTerminationPolicyTypesAnswer
        include JSON::Serializable

        # The termination policies supported by Amazon EC2 Auto Scaling: OldestInstance ,
        # OldestLaunchConfiguration , NewestInstance , ClosestToNextInstanceHour , Default ,
        # OldestLaunchTemplate , and AllocationStrategy .

        @[JSON::Field(key: "TerminationPolicyTypes")]
        getter termination_policy_types : Array(String)?

        def initialize(
          @termination_policy_types : Array(String)? = nil
        )
        end
      end


      struct DescribeTrafficSourcesRequest
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The maximum number of items to return with this call. The maximum value is 50 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The traffic source type that you want to describe. The following lists the valid values: elb if the
        # traffic source is a Classic Load Balancer. elbv2 if the traffic source is a Application Load
        # Balancer, Gateway Load Balancer, or Network Load Balancer. vpc-lattice if the traffic source is VPC
        # Lattice.

        @[JSON::Field(key: "TrafficSourceType")]
        getter traffic_source_type : String?

        def initialize(
          @auto_scaling_group_name : String,
          @max_records : Int32? = nil,
          @next_token : String? = nil,
          @traffic_source_type : String? = nil
        )
        end
      end


      struct DescribeTrafficSourcesResponse
        include JSON::Serializable

        # This string indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the traffic sources.

        @[JSON::Field(key: "TrafficSources")]
        getter traffic_sources : Array(Types::TrafficSourceState)?

        def initialize(
          @next_token : String? = nil,
          @traffic_sources : Array(Types::TrafficSourceState)? = nil
        )
        end
      end


      struct DescribeWarmPoolAnswer
        include JSON::Serializable

        # The instances that are currently in the warm pool.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # This string indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The warm pool configuration details.

        @[JSON::Field(key: "WarmPoolConfiguration")]
        getter warm_pool_configuration : Types::WarmPoolConfiguration?

        def initialize(
          @instances : Array(Types::Instance)? = nil,
          @next_token : String? = nil,
          @warm_pool_configuration : Types::WarmPoolConfiguration? = nil
        )
        end
      end


      struct DescribeWarmPoolType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The maximum number of instances to return with this call. The maximum value is 50 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of instances to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_group_name : String,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Describes the desired configuration for an instance refresh. If you specify a desired configuration,
      # you must specify either a LaunchTemplate or a MixedInstancesPolicy .

      struct DesiredConfiguration
        include JSON::Serializable

        # Describes the launch template and the version of the launch template that Amazon EC2 Auto Scaling
        # uses to launch Amazon EC2 instances. For more information about launch templates, see Launch
        # templates in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # Use this structure to launch multiple instance types and On-Demand Instances and Spot Instances
        # within a single Auto Scaling group. A mixed instances policy contains information that Amazon EC2
        # Auto Scaling can use to launch instances and help optimize your costs. For more information, see
        # Auto Scaling groups with multiple instance types and purchase options in the Amazon EC2 Auto Scaling
        # User Guide .

        @[JSON::Field(key: "MixedInstancesPolicy")]
        getter mixed_instances_policy : Types::MixedInstancesPolicy?

        def initialize(
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @mixed_instances_policy : Types::MixedInstancesPolicy? = nil
        )
        end
      end


      struct DetachInstancesAnswer
        include JSON::Serializable

        # The activities related to detaching the instances from the Auto Scaling group.

        @[JSON::Field(key: "Activities")]
        getter activities : Array(Types::Activity)?

        def initialize(
          @activities : Array(Types::Activity)? = nil
        )
        end
      end


      struct DetachInstancesQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # Indicates whether the Auto Scaling group decrements the desired capacity value by the number of
        # instances detached.

        @[JSON::Field(key: "ShouldDecrementDesiredCapacity")]
        getter should_decrement_desired_capacity : Bool

        # The IDs of the instances. You can specify up to 20 instances.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @should_decrement_desired_capacity : Bool,
          @instance_ids : Array(String)? = nil
        )
        end
      end


      struct DetachLoadBalancerTargetGroupsResultType
        include JSON::Serializable

        def initialize
        end
      end


      struct DetachLoadBalancerTargetGroupsType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The Amazon Resource Names (ARN) of the target groups. You can specify up to 10 target groups.

        @[JSON::Field(key: "TargetGroupARNs")]
        getter target_group_ar_ns : Array(String)

        def initialize(
          @auto_scaling_group_name : String,
          @target_group_ar_ns : Array(String)
        )
        end
      end


      struct DetachLoadBalancersResultType
        include JSON::Serializable

        def initialize
        end
      end


      struct DetachLoadBalancersType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The names of the load balancers. You can specify up to 10 load balancers.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)

        def initialize(
          @auto_scaling_group_name : String,
          @load_balancer_names : Array(String)
        )
        end
      end


      struct DetachTrafficSourcesResultType
        include JSON::Serializable

        def initialize
        end
      end


      struct DetachTrafficSourcesType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The unique identifiers of one or more traffic sources. You can specify up to 10 traffic sources.

        @[JSON::Field(key: "TrafficSources")]
        getter traffic_sources : Array(Types::TrafficSourceIdentifier)

        def initialize(
          @auto_scaling_group_name : String,
          @traffic_sources : Array(Types::TrafficSourceIdentifier)
        )
        end
      end


      struct DisableMetricsCollectionQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # Identifies the metrics to disable. You can specify one or more of the following metrics:
        # GroupMinSize GroupMaxSize GroupDesiredCapacity GroupInServiceInstances GroupPendingInstances
        # GroupStandbyInstances GroupTerminatingInstances GroupTotalInstances GroupInServiceCapacity
        # GroupPendingCapacity GroupStandbyCapacity GroupTerminatingCapacity GroupTotalCapacity
        # WarmPoolDesiredCapacity WarmPoolWarmedCapacity WarmPoolPendingCapacity WarmPoolTerminatingCapacity
        # WarmPoolTotalCapacity GroupAndWarmPoolDesiredCapacity GroupAndWarmPoolTotalCapacity If you omit this
        # property, all metrics are disabled. For more information, see Amazon CloudWatch metrics for Amazon
        # EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @metrics : Array(String)? = nil
        )
        end
      end

      # Describes information used to set up an Amazon EBS volume specified in a block device mapping.

      struct Ebs
        include JSON::Serializable

        # Indicates whether the volume is deleted on instance termination. For Amazon EC2 Auto Scaling, the
        # default value is true .

        @[JSON::Field(key: "DeleteOnTermination")]
        getter delete_on_termination : Bool?

        # Specifies whether the volume should be encrypted. Encrypted EBS volumes can only be attached to
        # instances that support Amazon EBS encryption. For more information, see Requirements for Amazon EBS
        # encryption in the Amazon EBS User Guide . If your AMI uses encrypted volumes, you can also only
        # launch it on supported instance types. If you are creating a volume from a snapshot, you cannot
        # create an unencrypted volume from an encrypted snapshot. Also, you cannot specify a KMS key ID when
        # using a launch configuration. If you enable encryption by default, the EBS volumes that you create
        # are always encrypted, either using the Amazon Web Services managed KMS key or a customer-managed KMS
        # key, regardless of whether the snapshot was encrypted. For more information, see Use Amazon Web
        # Services KMS keys to encrypt Amazon EBS volumes in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # The number of input/output (I/O) operations per second (IOPS) to provision for the volume. For gp3
        # and io1 volumes, this represents the number of IOPS that are provisioned for the volume. For gp2
        # volumes, this represents the baseline performance of the volume and the rate at which the volume
        # accumulates I/O credits for bursting. The following are the supported values for each volume type:
        # gp3 : 3,000-16,000 IOPS io1 : 100-64,000 IOPS For io1 volumes, we guarantee 64,000 IOPS only for
        # Instances built on the Amazon Web Services Nitro System . Other instance families guarantee
        # performance up to 32,000 IOPS. Iops is supported when the volume type is gp3 or io1 and required
        # only when the volume type is io1 . (Not used with standard , gp2 , st1 , or sc1 volumes.)

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # The snapshot ID of the volume to use. You must specify either a VolumeSize or a SnapshotId .

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # The throughput (MiBps) to provision for a gp3 volume.

        @[JSON::Field(key: "Throughput")]
        getter throughput : Int32?

        # The volume size, in GiBs. The following are the supported volumes sizes for each volume type: gp2
        # and gp3 : 1-16,384 io1 : 4-16,384 st1 and sc1 : 125-16,384 standard : 1-1,024 You must specify
        # either a SnapshotId or a VolumeSize . If you specify both SnapshotId and VolumeSize , the volume
        # size must be equal or greater than the size of the snapshot.

        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int32?

        # The volume type. For more information, see Amazon EBS volume types in the Amazon EBS User Guide .
        # Valid values: standard | io1 | gp2 | st1 | sc1 | gp3

        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        def initialize(
          @delete_on_termination : Bool? = nil,
          @encrypted : Bool? = nil,
          @iops : Int32? = nil,
          @snapshot_id : String? = nil,
          @throughput : Int32? = nil,
          @volume_size : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end


      struct EnableMetricsCollectionQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The frequency at which Amazon EC2 Auto Scaling sends aggregated data to CloudWatch. The only valid
        # value is 1Minute .

        @[JSON::Field(key: "Granularity")]
        getter granularity : String

        # Identifies the metrics to enable. You can specify one or more of the following metrics: GroupMinSize
        # GroupMaxSize GroupDesiredCapacity GroupInServiceInstances GroupPendingInstances
        # GroupStandbyInstances GroupTerminatingInstances GroupTotalInstances GroupInServiceCapacity
        # GroupPendingCapacity GroupStandbyCapacity GroupTerminatingCapacity GroupTotalCapacity
        # WarmPoolDesiredCapacity WarmPoolWarmedCapacity WarmPoolPendingCapacity WarmPoolTerminatingCapacity
        # WarmPoolTotalCapacity GroupAndWarmPoolDesiredCapacity GroupAndWarmPoolTotalCapacity If you specify
        # Granularity and don't specify any metrics, all metrics are enabled. For more information, see Amazon
        # CloudWatch metrics for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @granularity : String,
          @metrics : Array(String)? = nil
        )
        end
      end

      # Describes an enabled Auto Scaling group metric.

      struct EnabledMetric
        include JSON::Serializable

        # The granularity of the metric. The only valid value is 1Minute .

        @[JSON::Field(key: "Granularity")]
        getter granularity : String?

        # One of the following metrics: GroupMinSize GroupMaxSize GroupDesiredCapacity GroupInServiceInstances
        # GroupPendingInstances GroupStandbyInstances GroupTerminatingInstances GroupTotalInstances
        # GroupInServiceCapacity GroupPendingCapacity GroupStandbyCapacity GroupTerminatingCapacity
        # GroupTotalCapacity WarmPoolDesiredCapacity WarmPoolWarmedCapacity WarmPoolPendingCapacity
        # WarmPoolTerminatingCapacity WarmPoolTotalCapacity GroupAndWarmPoolDesiredCapacity
        # GroupAndWarmPoolTotalCapacity For more information, see Amazon CloudWatch metrics for Amazon EC2
        # Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "Metric")]
        getter metric : String?

        def initialize(
          @granularity : String? = nil,
          @metric : String? = nil
        )
        end
      end


      struct EnterStandbyAnswer
        include JSON::Serializable

        # The activities related to moving instances into Standby mode.

        @[JSON::Field(key: "Activities")]
        getter activities : Array(Types::Activity)?

        def initialize(
          @activities : Array(Types::Activity)? = nil
        )
        end
      end


      struct EnterStandbyQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # Indicates whether to decrement the desired capacity of the Auto Scaling group by the number of
        # instances moved to Standby mode.

        @[JSON::Field(key: "ShouldDecrementDesiredCapacity")]
        getter should_decrement_desired_capacity : Bool

        # The IDs of the instances. You can specify up to 20 instances.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @should_decrement_desired_capacity : Bool,
          @instance_ids : Array(String)? = nil
        )
        end
      end


      struct ExecutePolicyType
        include JSON::Serializable

        # The name or ARN of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # The breach threshold for the alarm. Required if the policy type is StepScaling and not supported
        # otherwise.

        @[JSON::Field(key: "BreachThreshold")]
        getter breach_threshold : Float64?

        # Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete before executing
        # the policy. Valid only if the policy type is SimpleScaling . For more information, see Scaling
        # cooldowns for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "HonorCooldown")]
        getter honor_cooldown : Bool?

        # The metric value to compare to BreachThreshold . This enables you to execute a policy of type
        # StepScaling and determine which step adjustment to use. For example, if the breach threshold is 50
        # and you want to use a step adjustment with a lower bound of 0 and an upper bound of 10, you can set
        # the metric value to 59. If you specify a metric value that doesn't correspond to a step adjustment
        # for the policy, the call returns an error. Required if the policy type is StepScaling and not
        # supported otherwise.

        @[JSON::Field(key: "MetricValue")]
        getter metric_value : Float64?

        def initialize(
          @policy_name : String,
          @auto_scaling_group_name : String? = nil,
          @breach_threshold : Float64? = nil,
          @honor_cooldown : Bool? = nil,
          @metric_value : Float64? = nil
        )
        end
      end


      struct ExitStandbyAnswer
        include JSON::Serializable

        # The activities related to moving instances out of Standby mode.

        @[JSON::Field(key: "Activities")]
        getter activities : Array(Types::Activity)?

        def initialize(
          @activities : Array(Types::Activity)? = nil
        )
        end
      end


      struct ExitStandbyQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The IDs of the instances. You can specify up to 20 instances.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @instance_ids : Array(String)? = nil
        )
        end
      end

      # Describes a scheduled action that could not be created, updated, or deleted.

      struct FailedScheduledUpdateGroupActionRequest
        include JSON::Serializable

        # The name of the scheduled action.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message accompanying the error code.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @scheduled_action_name : String,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Describes a filter that is used to return a more specific list of results from a describe operation.
      # If you specify multiple filters, the filters are automatically logically joined with an AND , and
      # the request returns only the results that match all of the specified filters. For more information,
      # see Tag Auto Scaling groups and instances in the Amazon EC2 Auto Scaling User Guide .

      struct Filter
        include JSON::Serializable

        # The name of the filter. The valid values for Name depend on which API operation you're using with
        # the filter ( DescribeAutoScalingGroups or DescribeTags ). DescribeAutoScalingGroups Valid values for
        # Name include the following: tag-key - Accepts tag keys. The results only include information about
        # the Auto Scaling groups associated with these tag keys. tag-value - Accepts tag values. The results
        # only include information about the Auto Scaling groups associated with these tag values.
        # tag:&lt;key&gt; - Accepts the key/value combination of the tag. Use the tag key in the filter name
        # and the tag value as the filter value. The results only include information about the Auto Scaling
        # groups associated with the specified key/value combination. DescribeTags Valid values for Name
        # include the following: auto-scaling-group - Accepts the names of Auto Scaling groups. The results
        # only include information about the tags associated with these Auto Scaling groups. key - Accepts tag
        # keys. The results only include information about the tags associated with these tag keys. value -
        # Accepts tag values. The results only include information about the tags associated with these tag
        # values. propagate-at-launch - Accepts a Boolean value, which specifies whether tags propagate to
        # instances at launch. The results only include information about the tags associated with the
        # specified Boolean value.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # One or more filter values. Filter values are case-sensitive. If you specify multiple values for a
        # filter, the values are automatically logically joined with an OR , and the request returns all
        # results that match any of the specified values. For example, specify "tag:environment" for the
        # filter name and "production,development" for the filter values to find Auto Scaling groups with the
        # tag "environment=production" or "environment=development".

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct GetPredictiveScalingForecastAnswer
        include JSON::Serializable

        # The capacity forecast.

        @[JSON::Field(key: "CapacityForecast")]
        getter capacity_forecast : Types::CapacityForecast

        # The load forecast.

        @[JSON::Field(key: "LoadForecast")]
        getter load_forecast : Array(Types::LoadForecast)

        # The time the forecast was made.

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @capacity_forecast : Types::CapacityForecast,
          @load_forecast : Array(Types::LoadForecast),
          @update_time : Time
        )
        end
      end


      struct GetPredictiveScalingForecastType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The exclusive end time of the time range for the forecast data to get. The maximum time duration
        # between the start and end time is 30 days. Although this parameter can accept a date and time that
        # is more than two days in the future, the availability of forecast data has limits. Amazon EC2 Auto
        # Scaling only issues forecasts for periods of two days in advance.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The inclusive start time of the time range for the forecast data to get. At most, the date and time
        # can be one year before the current date and time.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        def initialize(
          @auto_scaling_group_name : String,
          @end_time : Time,
          @policy_name : String,
          @start_time : Time
        )
        end
      end

      # Indicates that the parameters in the current request do not match the parameters from a previous
      # request with the same client token within the idempotency window.

      struct IdempotentParameterMismatchError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an EC2 instance.

      struct Instance
        include JSON::Serializable

        # The Availability Zone in which the instance is running.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String

        # The last reported health status of the instance. Healthy means that the instance is healthy and
        # should remain in service. Unhealthy means that the instance is unhealthy and that Amazon EC2 Auto
        # Scaling should terminate and replace it.

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # A description of the current lifecycle state. The Quarantined state is not used. For more
        # information, see Amazon EC2 Auto Scaling instance lifecycle in the Amazon EC2 Auto Scaling User
        # Guide .

        @[JSON::Field(key: "LifecycleState")]
        getter lifecycle_state : String

        # Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling
        # in.

        @[JSON::Field(key: "ProtectedFromScaleIn")]
        getter protected_from_scale_in : Bool

        # The ID of the Amazon Machine Image (AMI) used for the instance's current root volume. This value
        # reflects the most recent AMI applied to the instance, including updates made through root volume
        # replacement operations. This field appears for: Instances with root volume replacements through
        # Instance Refresh Instances launched with AMI overrides This field won't appear for: Existing
        # instances launched from Launch Templates without overrides Existing instances that didn’t have their
        # root volume replaced through Instance Refresh

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The instance type of the EC2 instance.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The launch configuration associated with the instance.

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String?

        # The launch template for the instance.

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The number of capacity units contributed by the instance based on its instance type. Valid Range:
        # Minimum value of 1. Maximum value of 999.

        @[JSON::Field(key: "WeightedCapacity")]
        getter weighted_capacity : String?

        def initialize(
          @availability_zone : String,
          @health_status : String,
          @instance_id : String,
          @lifecycle_state : String,
          @protected_from_scale_in : Bool,
          @image_id : String? = nil,
          @instance_type : String? = nil,
          @launch_configuration_name : String? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @weighted_capacity : String? = nil
        )
        end
      end

      # Contains details about a collection of instances launched in the Auto Scaling group.

      struct InstanceCollection
        include JSON::Serializable

        # The Availability Zone where the instances were launched.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The Availability Zone ID where the instances in this collection were launched.

        @[JSON::Field(key: "AvailabilityZoneId")]
        getter availability_zone_id : String?

        # A list of instance IDs for the successfully launched instances.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        # The instance type of the launched instances.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The market type for the instances (On-Demand or Spot).

        @[JSON::Field(key: "MarketType")]
        getter market_type : String?

        # The ID of the subnet where the instances were launched.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @availability_zone_id : String? = nil,
          @instance_ids : Array(String)? = nil,
          @instance_type : String? = nil,
          @market_type : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # Defines the lifecycle policy for instances in an Auto Scaling group. This policy controls instance
      # behavior when lifecycles transition and operations fail. Use lifecycle policies to ensure graceful
      # shutdown for stateful workloads or applications requiring extended draining periods.

      struct InstanceLifecyclePolicy
        include JSON::Serializable

        # Specifies the conditions that trigger instance retention behavior. These triggers determine when
        # instances should move to a Retained state instead of being terminated. This allows you to maintain
        # control over instance management when lifecycle operations fail.

        @[JSON::Field(key: "RetentionTriggers")]
        getter retention_triggers : Types::RetentionTriggers?

        def initialize(
          @retention_triggers : Types::RetentionTriggers? = nil
        )
        end
      end

      # Describes an instance maintenance policy. For more information, see Set instance maintenance policy
      # in the Amazon EC2 Auto Scaling User Guide .

      struct InstanceMaintenancePolicy
        include JSON::Serializable

        # Specifies the upper threshold as a percentage of the desired capacity of the Auto Scaling group. It
        # represents the maximum percentage of the group that can be in service and healthy, or pending, to
        # support your workload when replacing instances. Value range is 100 to 200. To clear a previously set
        # value, specify a value of -1 . Both MinHealthyPercentage and MaxHealthyPercentage must be specified,
        # and the difference between them cannot be greater than 100. A large range increases the number of
        # instances that can be replaced at the same time.

        @[JSON::Field(key: "MaxHealthyPercentage")]
        getter max_healthy_percentage : Int32?

        # Specifies the lower threshold as a percentage of the desired capacity of the Auto Scaling group. It
        # represents the minimum percentage of the group to keep in service, healthy, and ready to use to
        # support your workload when replacing instances. Value range is 0 to 100. To clear a previously set
        # value, specify a value of -1 .

        @[JSON::Field(key: "MinHealthyPercentage")]
        getter min_healthy_percentage : Int32?

        def initialize(
          @max_healthy_percentage : Int32? = nil,
          @min_healthy_percentage : Int32? = nil
        )
        end
      end

      # The metadata options for the instances. For more information, see Configure the instance metadata
      # options in the Amazon EC2 Auto Scaling User Guide .

      struct InstanceMetadataOptions
        include JSON::Serializable

        # This parameter enables or disables the HTTP metadata endpoint on your instances. If the parameter is
        # not specified, the default state is enabled . If you specify a value of disabled , you will not be
        # able to access your instance metadata.

        @[JSON::Field(key: "HttpEndpoint")]
        getter http_endpoint : String?

        # The desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the
        # further instance metadata requests can travel. Default: 1

        @[JSON::Field(key: "HttpPutResponseHopLimit")]
        getter http_put_response_hop_limit : Int32?

        # The state of token usage for your instance metadata requests. If the parameter is not specified in
        # the request, the default state is optional . If the state is optional , you can choose to retrieve
        # instance metadata with or without a signed token header on your request. If you retrieve the IAM
        # role credentials without a token, the version 1.0 role credentials are returned. If you retrieve the
        # IAM role credentials using a valid signed token, the version 2.0 role credentials are returned. If
        # the state is required , you must send a signed token header with any instance metadata retrieval
        # requests. In this state, retrieving the IAM role credentials always returns the version 2.0
        # credentials; the version 1.0 credentials are not available.

        @[JSON::Field(key: "HttpTokens")]
        getter http_tokens : String?

        def initialize(
          @http_endpoint : String? = nil,
          @http_put_response_hop_limit : Int32? = nil,
          @http_tokens : String? = nil
        )
        end
      end

      # Describes whether detailed monitoring is enabled for the Auto Scaling instances.

      struct InstanceMonitoring
        include JSON::Serializable

        # If true , detailed monitoring is enabled. Otherwise, basic monitoring is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Describes an instance refresh for an Auto Scaling group.

      struct InstanceRefresh
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # Describes the desired configuration for the instance refresh.

        @[JSON::Field(key: "DesiredConfiguration")]
        getter desired_configuration : Types::DesiredConfiguration?

        # The date and time at which the instance refresh ended.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The instance refresh ID.

        @[JSON::Field(key: "InstanceRefreshId")]
        getter instance_refresh_id : String?

        # The number of instances remaining to update before the instance refresh is complete. If you roll
        # back the instance refresh, InstancesToUpdate shows you the number of instances that were not yet
        # updated by the instance refresh. Therefore, these instances don't need to be replaced as part of the
        # rollback.

        @[JSON::Field(key: "InstancesToUpdate")]
        getter instances_to_update : Int32?

        # The percentage of the instance refresh that is complete. For each instance replacement, Amazon EC2
        # Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status
        # changes to healthy and the specified warm-up time passes, the instance is considered updated and is
        # added to the percentage complete. PercentageComplete does not include instances that are replaced
        # during a rollback. This value gradually goes back down to zero during a rollback.

        @[JSON::Field(key: "PercentageComplete")]
        getter percentage_complete : Int32?

        # The preferences for an instance refresh.

        @[JSON::Field(key: "Preferences")]
        getter preferences : Types::RefreshPreferences?

        # Additional progress details for an Auto Scaling group that has a warm pool.

        @[JSON::Field(key: "ProgressDetails")]
        getter progress_details : Types::InstanceRefreshProgressDetails?

        # The rollback details.

        @[JSON::Field(key: "RollbackDetails")]
        getter rollback_details : Types::RollbackDetails?

        # The date and time at which the instance refresh began.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The current status for the instance refresh operation: Pending - The request was created, but the
        # instance refresh has not started. InProgress - An instance refresh is in progress. Successful - An
        # instance refresh completed successfully. Failed - An instance refresh failed to complete. You can
        # troubleshoot using the status reason and the scaling activities. Cancelling - An ongoing instance
        # refresh is being cancelled. Cancelled - The instance refresh is cancelled. RollbackInProgress - An
        # instance refresh is being rolled back. RollbackFailed - The rollback failed to complete. You can
        # troubleshoot using the status reason and the scaling activities. RollbackSuccessful - The rollback
        # completed successfully. Baking - Waiting the specified bake time after an instance refresh has
        # finished updating instances.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The explanation for the specific status assigned to this operation.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The strategy to use for the instance refresh. This determines how instances in the Auto Scaling
        # group are updated. Default is Rolling. Rolling – Terminates instances and launches replacements in
        # batches ReplaceRootVolume – Updates instances by replacing only the root volume without terminating
        # the instance

        @[JSON::Field(key: "Strategy")]
        getter strategy : String?

        def initialize(
          @auto_scaling_group_name : String? = nil,
          @desired_configuration : Types::DesiredConfiguration? = nil,
          @end_time : Time? = nil,
          @instance_refresh_id : String? = nil,
          @instances_to_update : Int32? = nil,
          @percentage_complete : Int32? = nil,
          @preferences : Types::RefreshPreferences? = nil,
          @progress_details : Types::InstanceRefreshProgressDetails? = nil,
          @rollback_details : Types::RollbackDetails? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @strategy : String? = nil
        )
        end
      end

      # The request failed because an active instance refresh already exists for the specified Auto Scaling
      # group.

      struct InstanceRefreshInProgressFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Reports progress on replacing instances that are in the Auto Scaling group.

      struct InstanceRefreshLivePoolProgress
        include JSON::Serializable

        # The number of instances remaining to update.

        @[JSON::Field(key: "InstancesToUpdate")]
        getter instances_to_update : Int32?

        # The percentage of instances in the Auto Scaling group that have been replaced. For each instance
        # replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the
        # instance's health status changes to healthy and the specified warm-up time passes, the instance is
        # considered updated and is added to the percentage complete.

        @[JSON::Field(key: "PercentageComplete")]
        getter percentage_complete : Int32?

        def initialize(
          @instances_to_update : Int32? = nil,
          @percentage_complete : Int32? = nil
        )
        end
      end

      # Reports progress on replacing instances in an Auto Scaling group that has a warm pool. This includes
      # separate details for instances in the warm pool and instances in the Auto Scaling group (the live
      # pool).

      struct InstanceRefreshProgressDetails
        include JSON::Serializable

        # Reports progress on replacing instances that are in the Auto Scaling group.

        @[JSON::Field(key: "LivePoolProgress")]
        getter live_pool_progress : Types::InstanceRefreshLivePoolProgress?

        # Reports progress on replacing instances that are in the warm pool.

        @[JSON::Field(key: "WarmPoolProgress")]
        getter warm_pool_progress : Types::InstanceRefreshWarmPoolProgress?

        def initialize(
          @live_pool_progress : Types::InstanceRefreshLivePoolProgress? = nil,
          @warm_pool_progress : Types::InstanceRefreshWarmPoolProgress? = nil
        )
        end
      end

      # Reports progress on replacing instances that are in the warm pool.

      struct InstanceRefreshWarmPoolProgress
        include JSON::Serializable

        # The number of instances remaining to update.

        @[JSON::Field(key: "InstancesToUpdate")]
        getter instances_to_update : Int32?

        # The percentage of instances in the warm pool that have been replaced. For each instance replacement,
        # Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's
        # health status changes to healthy and the specified warm-up time passes, the instance is considered
        # updated and is added to the percentage complete.

        @[JSON::Field(key: "PercentageComplete")]
        getter percentage_complete : Int32?

        def initialize(
          @instances_to_update : Int32? = nil,
          @percentage_complete : Int32? = nil
        )
        end
      end

      # The attributes for the instance types for a mixed instances policy. Amazon EC2 Auto Scaling uses
      # your specified requirements to identify instance types. Then, it uses your On-Demand and Spot
      # allocation strategies to launch instances from these instance types. When you specify multiple
      # attributes, you get instance types that satisfy all of the specified attributes. If you specify
      # multiple values for an attribute, you get instance types that satisfy any of the specified values.
      # To limit the list of instance types from which Amazon EC2 Auto Scaling can identify matching
      # instance types, you can use one of the following parameters, but not both in the same request:
      # AllowedInstanceTypes - The instance types to include in the list. All other instance types are
      # ignored, even if they match your specified attributes. ExcludedInstanceTypes - The instance types to
      # exclude from the list, even if they match your specified attributes. You must specify VCpuCount and
      # MemoryMiB . All other attributes are optional. Any unspecified optional attribute is set to its
      # default. For more information, see Create a mixed instances group using attribute-based instance
      # type selection in the Amazon EC2 Auto Scaling User Guide . For help determining which instance types
      # match your attributes before you apply them to your Auto Scaling group, see Preview instance types
      # with specified attributes in the Amazon EC2 User Guide .

      struct InstanceRequirements
        include JSON::Serializable

        # The minimum and maximum instance memory size for an instance type, in MiB.

        @[JSON::Field(key: "MemoryMiB")]
        getter memory_mi_b : Types::MemoryMiBRequest

        # The minimum and maximum number of vCPUs for an instance type.

        @[JSON::Field(key: "VCpuCount")]
        getter v_cpu_count : Types::VCpuCountRequest

        # The minimum and maximum number of accelerators (GPUs, FPGAs, or Amazon Web Services Inferentia
        # chips) for an instance type. To exclude accelerator-enabled instance types, set Max to 0 . Default:
        # No minimum or maximum limits

        @[JSON::Field(key: "AcceleratorCount")]
        getter accelerator_count : Types::AcceleratorCountRequest?

        # Indicates whether instance types must have accelerators by specific manufacturers. For instance
        # types with NVIDIA devices, specify nvidia . For instance types with AMD devices, specify amd . For
        # instance types with Amazon Web Services devices, specify amazon-web-services . For instance types
        # with Xilinx devices, specify xilinx . Default: Any manufacturer

        @[JSON::Field(key: "AcceleratorManufacturers")]
        getter accelerator_manufacturers : Array(String)?

        # Lists the accelerators that must be on an instance type. For instance types with NVIDIA A100 GPUs,
        # specify a100 . For instance types with NVIDIA V100 GPUs, specify v100 . For instance types with
        # NVIDIA K80 GPUs, specify k80 . For instance types with NVIDIA T4 GPUs, specify t4 . For instance
        # types with NVIDIA M60 GPUs, specify m60 . For instance types with AMD Radeon Pro V520 GPUs, specify
        # radeon-pro-v520 . For instance types with Xilinx VU9P FPGAs, specify vu9p . Default: Any accelerator

        @[JSON::Field(key: "AcceleratorNames")]
        getter accelerator_names : Array(String)?

        # The minimum and maximum total memory size for the accelerators on an instance type, in MiB. Default:
        # No minimum or maximum limits

        @[JSON::Field(key: "AcceleratorTotalMemoryMiB")]
        getter accelerator_total_memory_mi_b : Types::AcceleratorTotalMemoryMiBRequest?

        # Lists the accelerator types that must be on an instance type. For instance types with GPU
        # accelerators, specify gpu . For instance types with FPGA accelerators, specify fpga . For instance
        # types with inference accelerators, specify inference . Default: Any accelerator type

        @[JSON::Field(key: "AcceleratorTypes")]
        getter accelerator_types : Array(String)?

        # The instance types to apply your specified attributes against. All other instance types are ignored,
        # even if they match your specified attributes. You can use strings with one or more wild cards,
        # represented by an asterisk ( * ), to allow an instance type, size, or generation. The following are
        # examples: m5.8xlarge , c5*.* , m5a.* , r* , *3* . For example, if you specify c5* , Amazon EC2 Auto
        # Scaling will allow the entire C5 instance family, which includes all C5a and C5n instance types. If
        # you specify m5a.* , Amazon EC2 Auto Scaling will allow all the M5a instance types, but not the M5n
        # instance types. If you specify AllowedInstanceTypes , you can't specify ExcludedInstanceTypes .
        # Default: All instance types

        @[JSON::Field(key: "AllowedInstanceTypes")]
        getter allowed_instance_types : Array(String)?

        # Indicates whether bare metal instance types are included, excluded, or required. Default: excluded

        @[JSON::Field(key: "BareMetal")]
        getter bare_metal : String?

        # The minimum and maximum baseline bandwidth performance for an instance type, in Mbps. For more
        # information, see Amazon EBS–optimized instances in the Amazon EC2 User Guide . Default: No minimum
        # or maximum limits

        @[JSON::Field(key: "BaselineEbsBandwidthMbps")]
        getter baseline_ebs_bandwidth_mbps : Types::BaselineEbsBandwidthMbpsRequest?

        # The baseline performance factors for the instance requirements.

        @[JSON::Field(key: "BaselinePerformanceFactors")]
        getter baseline_performance_factors : Types::BaselinePerformanceFactorsRequest?

        # Indicates whether burstable performance instance types are included, excluded, or required. For more
        # information, see Burstable performance instances in the Amazon EC2 User Guide . Default: excluded

        @[JSON::Field(key: "BurstablePerformance")]
        getter burstable_performance : String?

        # Lists which specific CPU manufacturers to include. For instance types with Intel CPUs, specify intel
        # . For instance types with AMD CPUs, specify amd . For instance types with Amazon Web Services CPUs,
        # specify amazon-web-services . For instance types with Apple CPUs, specify apple . Don't confuse the
        # CPU hardware manufacturer with the CPU hardware architecture. Instances will be launched with a
        # compatible CPU architecture based on the Amazon Machine Image (AMI) that you specify in your launch
        # template. Default: Any manufacturer

        @[JSON::Field(key: "CpuManufacturers")]
        getter cpu_manufacturers : Array(String)?

        # The instance types to exclude. You can use strings with one or more wild cards, represented by an
        # asterisk ( * ), to exclude an instance family, type, size, or generation. The following are
        # examples: m5.8xlarge , c5*.* , m5a.* , r* , *3* . For example, if you specify c5* , you are
        # excluding the entire C5 instance family, which includes all C5a and C5n instance types. If you
        # specify m5a.* , Amazon EC2 Auto Scaling will exclude all the M5a instance types, but not the M5n
        # instance types. If you specify ExcludedInstanceTypes , you can't specify AllowedInstanceTypes .
        # Default: No excluded instance types

        @[JSON::Field(key: "ExcludedInstanceTypes")]
        getter excluded_instance_types : Array(String)?

        # Indicates whether current or previous generation instance types are included. For current generation
        # instance types, specify current . The current generation includes EC2 instance types currently
        # recommended for use. This typically includes the latest two to three generations in each instance
        # family. For more information, see Instance types in the Amazon EC2 User Guide . For previous
        # generation instance types, specify previous . Default: Any current or previous generation

        @[JSON::Field(key: "InstanceGenerations")]
        getter instance_generations : Array(String)?

        # Indicates whether instance types with instance store volumes are included, excluded, or required.
        # For more information, see Amazon EC2 instance store in the Amazon EC2 User Guide . Default: included

        @[JSON::Field(key: "LocalStorage")]
        getter local_storage : String?

        # Indicates the type of local storage that is required. For instance types with hard disk drive (HDD)
        # storage, specify hdd . For instance types with solid state drive (SSD) storage, specify ssd .
        # Default: Any local storage type

        @[JSON::Field(key: "LocalStorageTypes")]
        getter local_storage_types : Array(String)?

        # [Price protection] The price protection threshold for Spot Instances, as a percentage of an
        # identified On-Demand price. The identified On-Demand price is the price of the lowest priced current
        # generation C, M, or R instance type with your specified attributes. If no current generation C, M,
        # or R instance type matches your attributes, then the identified price is from either the lowest
        # priced current generation instance types or, failing that, the lowest priced previous generation
        # instance types that match your attributes. When Amazon EC2 Auto Scaling selects instance types with
        # your attributes, we will exclude instance types whose price exceeds your specified threshold. The
        # parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a percentage. If you set
        # DesiredCapacityType to vcpu or memory-mib , the price protection threshold is based on the per-vCPU
        # or per-memory price instead of the per instance price. Only one of
        # SpotMaxPricePercentageOverLowestPrice or MaxSpotPriceAsPercentageOfOptimalOnDemandPrice can be
        # specified. If you don't specify either, Amazon EC2 Auto Scaling will automatically apply optimal
        # price protection to consistently select from a wide range of instance types. To indicate no price
        # protection threshold for Spot Instances, meaning you want to consider all instance types that match
        # your attributes, include one of these parameters and specify a high value, such as 999999 .

        @[JSON::Field(key: "MaxSpotPriceAsPercentageOfOptimalOnDemandPrice")]
        getter max_spot_price_as_percentage_of_optimal_on_demand_price : Int32?

        # The minimum and maximum amount of memory per vCPU for an instance type, in GiB. Default: No minimum
        # or maximum limits

        @[JSON::Field(key: "MemoryGiBPerVCpu")]
        getter memory_gi_b_per_v_cpu : Types::MemoryGiBPerVCpuRequest?

        # The minimum and maximum amount of network bandwidth, in gigabits per second (Gbps). Default: No
        # minimum or maximum limits

        @[JSON::Field(key: "NetworkBandwidthGbps")]
        getter network_bandwidth_gbps : Types::NetworkBandwidthGbpsRequest?

        # The minimum and maximum number of network interfaces for an instance type. Default: No minimum or
        # maximum limits

        @[JSON::Field(key: "NetworkInterfaceCount")]
        getter network_interface_count : Types::NetworkInterfaceCountRequest?

        # [Price protection] The price protection threshold for On-Demand Instances, as a percentage higher
        # than an identified On-Demand price. The identified On-Demand price is the price of the lowest priced
        # current generation C, M, or R instance type with your specified attributes. If no current generation
        # C, M, or R instance type matches your attributes, then the identified price is from either the
        # lowest priced current generation instance types or, failing that, the lowest priced previous
        # generation instance types that match your attributes. When Amazon EC2 Auto Scaling selects instance
        # types with your attributes, we will exclude instance types whose price exceeds your specified
        # threshold. The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a
        # percentage. To turn off price protection, specify a high value, such as 999999 . If you set
        # DesiredCapacityType to vcpu or memory-mib , the price protection threshold is applied based on the
        # per-vCPU or per-memory price instead of the per instance price. Default: 20

        @[JSON::Field(key: "OnDemandMaxPricePercentageOverLowestPrice")]
        getter on_demand_max_price_percentage_over_lowest_price : Int32?

        # Indicates whether instance types must provide On-Demand Instance hibernation support. Default: false

        @[JSON::Field(key: "RequireHibernateSupport")]
        getter require_hibernate_support : Bool?

        # [Price protection] The price protection threshold for Spot Instances, as a percentage higher than an
        # identified Spot price. The identified Spot price is the price of the lowest priced current
        # generation C, M, or R instance type with your specified attributes. If no current generation C, M,
        # or R instance type matches your attributes, then the identified price is from either the lowest
        # priced current generation instance types or, failing that, the lowest priced previous generation
        # instance types that match your attributes. When Amazon EC2 Auto Scaling selects instance types with
        # your attributes, we will exclude instance types whose price exceeds your specified threshold. The
        # parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a percentage. If you set
        # DesiredCapacityType to vcpu or memory-mib , the price protection threshold is based on the per-vCPU
        # or per-memory price instead of the per instance price. Only one of
        # SpotMaxPricePercentageOverLowestPrice or MaxSpotPriceAsPercentageOfOptimalOnDemandPrice can be
        # specified. If you don't specify either, Amazon EC2 Auto Scaling will automatically apply optimal
        # price protection to consistently select from a wide range of instance types. To indicate no price
        # protection threshold for Spot Instances, meaning you want to consider all instance types that match
        # your attributes, include one of these parameters and specify a high value, such as 999999 .

        @[JSON::Field(key: "SpotMaxPricePercentageOverLowestPrice")]
        getter spot_max_price_percentage_over_lowest_price : Int32?

        # The minimum and maximum total local storage size for an instance type, in GB. Default: No minimum or
        # maximum limits

        @[JSON::Field(key: "TotalLocalStorageGB")]
        getter total_local_storage_gb : Types::TotalLocalStorageGBRequest?

        def initialize(
          @memory_mi_b : Types::MemoryMiBRequest,
          @v_cpu_count : Types::VCpuCountRequest,
          @accelerator_count : Types::AcceleratorCountRequest? = nil,
          @accelerator_manufacturers : Array(String)? = nil,
          @accelerator_names : Array(String)? = nil,
          @accelerator_total_memory_mi_b : Types::AcceleratorTotalMemoryMiBRequest? = nil,
          @accelerator_types : Array(String)? = nil,
          @allowed_instance_types : Array(String)? = nil,
          @bare_metal : String? = nil,
          @baseline_ebs_bandwidth_mbps : Types::BaselineEbsBandwidthMbpsRequest? = nil,
          @baseline_performance_factors : Types::BaselinePerformanceFactorsRequest? = nil,
          @burstable_performance : String? = nil,
          @cpu_manufacturers : Array(String)? = nil,
          @excluded_instance_types : Array(String)? = nil,
          @instance_generations : Array(String)? = nil,
          @local_storage : String? = nil,
          @local_storage_types : Array(String)? = nil,
          @max_spot_price_as_percentage_of_optimal_on_demand_price : Int32? = nil,
          @memory_gi_b_per_v_cpu : Types::MemoryGiBPerVCpuRequest? = nil,
          @network_bandwidth_gbps : Types::NetworkBandwidthGbpsRequest? = nil,
          @network_interface_count : Types::NetworkInterfaceCountRequest? = nil,
          @on_demand_max_price_percentage_over_lowest_price : Int32? = nil,
          @require_hibernate_support : Bool? = nil,
          @spot_max_price_percentage_over_lowest_price : Int32? = nil,
          @total_local_storage_gb : Types::TotalLocalStorageGBRequest? = nil
        )
        end
      end

      # Describes an instance reuse policy for a warm pool. For more information, see Warm pools for Amazon
      # EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

      struct InstanceReusePolicy
        include JSON::Serializable

        # Specifies whether instances in the Auto Scaling group can be returned to the warm pool on scale in.

        @[JSON::Field(key: "ReuseOnScaleIn")]
        getter reuse_on_scale_in : Bool?

        def initialize(
          @reuse_on_scale_in : Bool? = nil
        )
        end
      end

      # Use this structure to specify the distribution of On-Demand Instances and Spot Instances and the
      # allocation strategies used to fulfill On-Demand and Spot capacities for a mixed instances policy.

      struct InstancesDistribution
        include JSON::Serializable

        # The allocation strategy to apply to your On-Demand Instances when they are launched. Possible
        # instance types are determined by the launch template overrides that you specify. The following lists
        # the valid values: lowest-price Uses price to determine which instance types are the highest
        # priority, launching the lowest priced instance types within an Availability Zone first. This is the
        # default value for Auto Scaling groups that specify InstanceRequirements . prioritized You set the
        # order of instance types for the launch template overrides from highest to lowest priority (from
        # first to last in the list). Amazon EC2 Auto Scaling launches your highest priority instance types
        # first. If all your On-Demand capacity cannot be fulfilled using your highest priority instance type,
        # then Amazon EC2 Auto Scaling launches the remaining capacity using the second priority instance
        # type, and so on. This is the default value for Auto Scaling groups that don't specify
        # InstanceRequirements and cannot be used for groups that do.

        @[JSON::Field(key: "OnDemandAllocationStrategy")]
        getter on_demand_allocation_strategy : String?

        # The minimum amount of the Auto Scaling group's capacity that must be fulfilled by On-Demand
        # Instances. This base portion is launched first as your group scales. This number has the same unit
        # of measurement as the group's desired capacity. If you change the default unit of measurement
        # (number of instances) by specifying weighted capacity values in your launch template overrides list,
        # or by changing the default desired capacity type setting of the group, you must specify this number
        # using the same unit of measurement. Default: 0

        @[JSON::Field(key: "OnDemandBaseCapacity")]
        getter on_demand_base_capacity : Int32?

        # Controls the percentages of On-Demand Instances and Spot Instances for your additional capacity
        # beyond OnDemandBaseCapacity . Expressed as a number (for example, 20 specifies 20% On-Demand
        # Instances, 80% Spot Instances). If set to 100, only On-Demand Instances are used. Default: 100

        @[JSON::Field(key: "OnDemandPercentageAboveBaseCapacity")]
        getter on_demand_percentage_above_base_capacity : Int32?

        # The allocation strategy to apply to your Spot Instances when they are launched. Possible instance
        # types are determined by the launch template overrides that you specify. The following lists the
        # valid values: capacity-optimized Requests Spot Instances using pools that are optimally chosen based
        # on the available Spot capacity. This strategy has the lowest risk of interruption. To give certain
        # instance types a higher chance of launching first, use capacity-optimized-prioritized .
        # capacity-optimized-prioritized You set the order of instance types for the launch template overrides
        # from highest to lowest priority (from first to last in the list). Amazon EC2 Auto Scaling honors the
        # instance type priorities on a best effort basis but optimizes for capacity first. Note that if the
        # On-Demand allocation strategy is set to prioritized , the same priority is applied when fulfilling
        # On-Demand capacity. This is not a valid value for Auto Scaling groups that specify
        # InstanceRequirements . lowest-price Requests Spot Instances using the lowest priced pools within an
        # Availability Zone, across the number of Spot pools that you specify for the SpotInstancePools
        # property. To ensure that your desired capacity is met, you might receive Spot Instances from several
        # pools. This is the default value, but it might lead to high interruption rates because this strategy
        # only considers instance price and not available capacity. price-capacity-optimized (recommended) The
        # price and capacity optimized allocation strategy looks at both price and capacity to select the Spot
        # Instance pools that are the least likely to be interrupted and have the lowest possible price.

        @[JSON::Field(key: "SpotAllocationStrategy")]
        getter spot_allocation_strategy : String?

        # The number of Spot Instance pools across which to allocate your Spot Instances. The Spot pools are
        # determined from the different instance types in the overrides. Valid only when the
        # SpotAllocationStrategy is lowest-price . Value must be in the range of 1–20. Default: 2

        @[JSON::Field(key: "SpotInstancePools")]
        getter spot_instance_pools : Int32?

        # The maximum price per unit hour that you are willing to pay for a Spot Instance. If your maximum
        # price is lower than the Spot price for the instance types that you selected, your Spot Instances are
        # not launched. We do not recommend specifying a maximum price because it can lead to increased
        # interruptions. When Spot Instances launch, you pay the current Spot price. To remove a maximum price
        # that you previously set, include the property but specify an empty string ("") for the value. If you
        # specify a maximum price, your instances will be interrupted more frequently than if you do not
        # specify one. Valid Range: Minimum value of 0.001

        @[JSON::Field(key: "SpotMaxPrice")]
        getter spot_max_price : String?

        def initialize(
          @on_demand_allocation_strategy : String? = nil,
          @on_demand_base_capacity : Int32? = nil,
          @on_demand_percentage_above_base_capacity : Int32? = nil,
          @spot_allocation_strategy : String? = nil,
          @spot_instance_pools : Int32? = nil,
          @spot_max_price : String? = nil
        )
        end
      end

      # The NextToken value is not valid.

      struct InvalidNextToken
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because a desired configuration was not found or an incompatible launch template
      # (uses a Systems Manager parameter instead of an AMI ID) or launch template version ( $Latest or
      # $Default ) is present on the Auto Scaling group.

      struct IrreversibleInstanceRefreshFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a launch configuration.

      struct LaunchConfiguration
        include JSON::Serializable

        # The creation date and time for the launch configuration.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The ID of the Amazon Machine Image (AMI) to use to launch your EC2 instances. For more information,
        # see Find a Linux AMI in the Amazon EC2 User Guide .

        @[JSON::Field(key: "ImageId")]
        getter image_id : String

        # The instance type for the instances. For information about available instance types, see Available
        # instance types in the Amazon EC2 User Guide .

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # The name of the launch configuration.

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String

        # Specifies whether to assign a public IPv4 address to the group's instances. If the instance is
        # launched into a default subnet, the default is to assign a public IPv4 address, unless you disabled
        # the option to assign a public IPv4 address on the subnet. If the instance is launched into a
        # nondefault subnet, the default is not to assign a public IPv4 address, unless you enabled the option
        # to assign a public IPv4 address on the subnet. For more information, see Provide network
        # connectivity for your Auto Scaling instances using Amazon VPC in the Amazon EC2 Auto Scaling User
        # Guide .

        @[JSON::Field(key: "AssociatePublicIpAddress")]
        getter associate_public_ip_address : Bool?

        # The block device mapping entries that define the block devices to attach to the instances at launch.
        # By default, the block devices specified in the block device mapping for the AMI are used. For more
        # information, see Block device mappings in the Amazon EC2 User Guide .

        @[JSON::Field(key: "BlockDeviceMappings")]
        getter block_device_mappings : Array(Types::BlockDeviceMapping)?

        # Available for backward compatibility.

        @[JSON::Field(key: "ClassicLinkVPCId")]
        getter classic_link_vpc_id : String?

        # Available for backward compatibility.

        @[JSON::Field(key: "ClassicLinkVPCSecurityGroups")]
        getter classic_link_vpc_security_groups : Array(String)?

        # Specifies whether the launch configuration is optimized for EBS I/O ( true ) or not ( false ). For
        # more information, see Amazon EBS-optimized instances in the Amazon EC2 User Guide .

        @[JSON::Field(key: "EbsOptimized")]
        getter ebs_optimized : Bool?

        # The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for
        # the instance. The instance profile contains the IAM role. For more information, see IAM role for
        # applications that run on Amazon EC2 instances in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "IamInstanceProfile")]
        getter iam_instance_profile : String?

        # Controls whether instances in this group are launched with detailed ( true ) or basic ( false )
        # monitoring. For more information, see Configure monitoring for Auto Scaling instances in the Amazon
        # EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "InstanceMonitoring")]
        getter instance_monitoring : Types::InstanceMonitoring?

        # The ID of the kernel associated with the AMI.

        @[JSON::Field(key: "KernelId")]
        getter kernel_id : String?

        # The name of the key pair. For more information, see Amazon EC2 key pairs and Amazon EC2 instances in
        # the Amazon EC2 User Guide .

        @[JSON::Field(key: "KeyName")]
        getter key_name : String?

        # The Amazon Resource Name (ARN) of the launch configuration.

        @[JSON::Field(key: "LaunchConfigurationARN")]
        getter launch_configuration_arn : String?

        # The metadata options for the instances. For more information, see Configure the instance metadata
        # options in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "MetadataOptions")]
        getter metadata_options : Types::InstanceMetadataOptions?

        # The tenancy of the instance, either default or dedicated . An instance with dedicated tenancy runs
        # on isolated, single-tenant hardware and can only be launched into a VPC.

        @[JSON::Field(key: "PlacementTenancy")]
        getter placement_tenancy : String?

        # The ID of the RAM disk associated with the AMI.

        @[JSON::Field(key: "RamdiskId")]
        getter ramdisk_id : String?

        # A list that contains the security groups to assign to the instances in the Auto Scaling group. For
        # more information, see Control traffic to your Amazon Web Services resources using security groups in
        # the Amazon Virtual Private Cloud User Guide .

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot
        # Instances are launched when the price you specify exceeds the current Spot price. For more
        # information, see Requesting Spot Instances for fault-tolerant and flexible applications in the
        # Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "SpotPrice")]
        getter spot_price : String?

        # The user data to make available to the launched EC2 instances. For more information, see Instance
        # metadata and user data in the Amazon EC2 User Guide . If you are using a command line tool,
        # base64-encoding is performed for you, and you can load the text from a file. Otherwise, you must
        # provide base64-encoded text. User data is limited to 16 KB.

        @[JSON::Field(key: "UserData")]
        getter user_data : String?

        def initialize(
          @created_time : Time,
          @image_id : String,
          @instance_type : String,
          @launch_configuration_name : String,
          @associate_public_ip_address : Bool? = nil,
          @block_device_mappings : Array(Types::BlockDeviceMapping)? = nil,
          @classic_link_vpc_id : String? = nil,
          @classic_link_vpc_security_groups : Array(String)? = nil,
          @ebs_optimized : Bool? = nil,
          @iam_instance_profile : String? = nil,
          @instance_monitoring : Types::InstanceMonitoring? = nil,
          @kernel_id : String? = nil,
          @key_name : String? = nil,
          @launch_configuration_arn : String? = nil,
          @metadata_options : Types::InstanceMetadataOptions? = nil,
          @placement_tenancy : String? = nil,
          @ramdisk_id : String? = nil,
          @security_groups : Array(String)? = nil,
          @spot_price : String? = nil,
          @user_data : String? = nil
        )
        end
      end


      struct LaunchConfigurationNameType
        include JSON::Serializable

        # The name of the launch configuration.

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String

        def initialize(
          @launch_configuration_name : String
        )
        end
      end


      struct LaunchConfigurationNamesType
        include JSON::Serializable

        # The launch configuration names. If you omit this property, all launch configurations are described.
        # Array Members: Maximum number of 50 items.

        @[JSON::Field(key: "LaunchConfigurationNames")]
        getter launch_configuration_names : Array(String)?

        # The maximum number of items to return with this call. The default value is 50 and the maximum value
        # is 100 .

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @launch_configuration_names : Array(String)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct LaunchConfigurationsType
        include JSON::Serializable

        # The launch configurations.

        @[JSON::Field(key: "LaunchConfigurations")]
        getter launch_configurations : Array(Types::LaunchConfiguration)

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @launch_configurations : Array(Types::LaunchConfiguration),
          @next_token : String? = nil
        )
        end
      end

      # Contains details about errors encountered during instance launch attempts.

      struct LaunchInstancesError
        include JSON::Serializable

        # The Availability Zone where the instance launch was attempted.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The Availability Zone ID where the launch error occurred.

        @[JSON::Field(key: "AvailabilityZoneId")]
        getter availability_zone_id : String?

        # The error code representing the type of error encountered (e.g., InsufficientInstanceCapacity).

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A descriptive message providing details about the error encountered during the launch attempt.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The instance type that failed to launch.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The market type (On-Demand or Spot) that encountered the launch error.

        @[JSON::Field(key: "MarketType")]
        getter market_type : String?

        # The subnet ID where the instance launch was attempted.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @availability_zone_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @instance_type : String? = nil,
          @market_type : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end


      struct LaunchInstancesRequest
        include JSON::Serializable

        # The name of the Auto Scaling group to launch instances into.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The number of instances to launch. Although this value can exceed 100 for instance weights, the
        # actual instance count is limited to 100 instances per launch.

        @[JSON::Field(key: "RequestedCapacity")]
        getter requested_capacity : Int32

        # A list of Availability Zone IDs where instances should be launched. Must match or be included in the
        # group's AZ configuration. You cannot specify both AvailabilityZones and AvailabilityZoneIds.
        # Required for multi-AZ groups, optional for single-AZ groups.

        @[JSON::Field(key: "AvailabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The Availability Zones for the instance launch. Must match or be included in the Auto Scaling
        # group's Availability Zone configuration. Either AvailabilityZones or SubnetIds must be specified for
        # groups with multiple Availability Zone configurations.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Specifies whether to retry asynchronously if the synchronous launch fails. Valid values are NONE
        # (default, no async retry) and RETRY_WITH_GROUP_CONFIGURATION (increase desired capacity and retry
        # with group configuration).

        @[JSON::Field(key: "RetryStrategy")]
        getter retry_strategy : String?

        # The subnet IDs for the instance launch. Either AvailabilityZones or SubnetIds must be specified. If
        # both are specified, the subnets must reside in the specified Availability Zones.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @client_token : String,
          @requested_capacity : Int32,
          @availability_zone_ids : Array(String)? = nil,
          @availability_zones : Array(String)? = nil,
          @retry_strategy : String? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end


      struct LaunchInstancesResult
        include JSON::Serializable

        # The name of the Auto Scaling group where the instances were launched.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # The idempotency token used for the request, either customer-specified or auto-generated.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A list of errors encountered during the launch attempt including details about failed instance
        # launches with their corresponding error codes and messages.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::LaunchInstancesError)?

        # A list of successfully launched instances including details such as instance type, Availability
        # Zone, subnet, lifecycle state, and instance IDs.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::InstanceCollection)?

        def initialize(
          @auto_scaling_group_name : String? = nil,
          @client_token : String? = nil,
          @errors : Array(Types::LaunchInstancesError)? = nil,
          @instances : Array(Types::InstanceCollection)? = nil
        )
        end
      end

      # Use this structure to specify the launch templates and instance types (overrides) for a mixed
      # instances policy.

      struct LaunchTemplate
        include JSON::Serializable

        # The launch template.

        @[JSON::Field(key: "LaunchTemplateSpecification")]
        getter launch_template_specification : Types::LaunchTemplateSpecification?

        # Any properties that you specify override the same properties in the launch template.

        @[JSON::Field(key: "Overrides")]
        getter overrides : Array(Types::LaunchTemplateOverrides)?

        def initialize(
          @launch_template_specification : Types::LaunchTemplateSpecification? = nil,
          @overrides : Array(Types::LaunchTemplateOverrides)? = nil
        )
        end
      end

      # Use this structure to let Amazon EC2 Auto Scaling do the following when the Auto Scaling group has a
      # mixed instances policy: Override the instance type that is specified in the launch template. Use
      # multiple instance types. Specify the instance types that you want, or define your instance
      # requirements instead and let Amazon EC2 Auto Scaling provision the available instance types that
      # meet your requirements. This can provide Amazon EC2 Auto Scaling with a larger selection of instance
      # types to choose from when fulfilling Spot and On-Demand capacities. You can view which instance
      # types are matched before you apply the instance requirements to your Auto Scaling group. After you
      # define your instance requirements, you don't have to keep updating these settings to get new EC2
      # instance types automatically. Amazon EC2 Auto Scaling uses the instance requirements of the Auto
      # Scaling group to determine whether a new EC2 instance type can be used.

      struct LaunchTemplateOverrides
        include JSON::Serializable

        # The ID of the Amazon Machine Image (AMI) to use for instances launched with this override. When
        # using Instance Refresh with ReplaceRootVolume strategy, this specifies the AMI for root volume
        # replacement operations. For ReplaceRootVolume operations: All overrides in the MixedInstancesPolicy
        # must specify an ImageId The AMI must contain only a single root volume Root volume replacement
        # doesn't support multi-volume AMIs

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The instance requirements. Amazon EC2 Auto Scaling uses your specified requirements to identify
        # instance types. Then, it uses your On-Demand and Spot allocation strategies to launch instances from
        # these instance types. You can specify up to four separate sets of instance requirements per Auto
        # Scaling group. This is useful for provisioning instances from different Amazon Machine Images (AMIs)
        # in the same Auto Scaling group. To do this, create the AMIs and create a new launch template for
        # each AMI. Then, create a compatible set of instance requirements for each launch template. If you
        # specify InstanceRequirements , you can't specify InstanceType .

        @[JSON::Field(key: "InstanceRequirements")]
        getter instance_requirements : Types::InstanceRequirements?

        # The instance type, such as m3.xlarge . You must specify an instance type that is supported in your
        # requested Region and Availability Zones. For more information, see Instance types in the Amazon EC2
        # User Guide . You can specify up to 40 instance types per Auto Scaling group.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # Provides a launch template for the specified instance type or set of instance requirements. For
        # example, some instance types might require a launch template with a different AMI. If not provided,
        # Amazon EC2 Auto Scaling uses the launch template that's specified in the LaunchTemplate definition.
        # For more information, see Specifying a different launch template for an instance type in the Amazon
        # EC2 Auto Scaling User Guide . You can specify up to 20 launch templates per Auto Scaling group. The
        # launch templates specified in the overrides and in the LaunchTemplate definition count towards this
        # limit.

        @[JSON::Field(key: "LaunchTemplateSpecification")]
        getter launch_template_specification : Types::LaunchTemplateSpecification?

        # If you provide a list of instance types to use, you can specify the number of capacity units
        # provided by each instance type in terms of virtual CPUs, memory, storage, throughput, or other
        # relative performance characteristic. When a Spot or On-Demand Instance is launched, the capacity
        # units count toward the desired capacity. Amazon EC2 Auto Scaling launches instances until the
        # desired capacity is totally fulfilled, even if this results in an overage. For example, if there are
        # two units remaining to fulfill capacity, and Amazon EC2 Auto Scaling can only launch an instance
        # with a WeightedCapacity of five units, the instance is launched, and the desired capacity is
        # exceeded by three units. For more information, see Configure an Auto Scaling group to use instance
        # weights in the Amazon EC2 Auto Scaling User Guide . Value must be in the range of 1–999. If you
        # specify a value for WeightedCapacity for one instance type, you must specify a value for
        # WeightedCapacity for all of them. Every Auto Scaling group has three size parameters (
        # DesiredCapacity , MaxSize , and MinSize ). Usually, you set these sizes based on a specific number
        # of instances. However, if you configure a mixed instances policy that defines weights for the
        # instance types, you must specify these sizes with the same units that you use for weighting
        # instances.

        @[JSON::Field(key: "WeightedCapacity")]
        getter weighted_capacity : String?

        def initialize(
          @image_id : String? = nil,
          @instance_requirements : Types::InstanceRequirements? = nil,
          @instance_type : String? = nil,
          @launch_template_specification : Types::LaunchTemplateSpecification? = nil,
          @weighted_capacity : String? = nil
        )
        end
      end

      # Describes the launch template and the version of the launch template that Amazon EC2 Auto Scaling
      # uses to launch Amazon EC2 instances. For more information about launch templates, see Launch
      # templates in the Amazon EC2 Auto Scaling User Guide .

      struct LaunchTemplateSpecification
        include JSON::Serializable

        # The ID of the launch template. To get the template ID, use the Amazon EC2 DescribeLaunchTemplates
        # API operation. New launch templates can be created using the Amazon EC2 CreateLaunchTemplate API.
        # Conditional: You must specify either a LaunchTemplateId or a LaunchTemplateName .

        @[JSON::Field(key: "LaunchTemplateId")]
        getter launch_template_id : String?

        # The name of the launch template. To get the template name, use the Amazon EC2
        # DescribeLaunchTemplates API operation. New launch templates can be created using the Amazon EC2
        # CreateLaunchTemplate API. Conditional: You must specify either a LaunchTemplateId or a
        # LaunchTemplateName .

        @[JSON::Field(key: "LaunchTemplateName")]
        getter launch_template_name : String?

        # The version number, $Latest , or $Default . To get the version number, use the Amazon EC2
        # DescribeLaunchTemplateVersions API operation. New launch template versions can be created using the
        # Amazon EC2 CreateLaunchTemplateVersion API. If the value is $Latest , Amazon EC2 Auto Scaling
        # selects the latest version of the launch template when launching instances. If the value is $Default
        # , Amazon EC2 Auto Scaling selects the default version of the launch template when launching
        # instances. The default value is $Default .

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @launch_template_id : String? = nil,
          @launch_template_name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Describes a lifecycle hook. A lifecycle hook lets you create solutions that are aware of events in
      # the Auto Scaling instance lifecycle, and then perform a custom action on instances when the
      # corresponding lifecycle event occurs.

      struct LifecycleHook
        include JSON::Serializable

        # The name of the Auto Scaling group for the lifecycle hook.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an unexpected
        # failure occurs. Valid values: CONTINUE | ABANDON

        @[JSON::Field(key: "DefaultResult")]
        getter default_result : String?

        # The maximum time, in seconds, that an instance can remain in a wait state. The maximum is 172800
        # seconds (48 hours) or 100 times HeartbeatTimeout , whichever is smaller.

        @[JSON::Field(key: "GlobalTimeout")]
        getter global_timeout : Int32?

        # The maximum time, in seconds, that can elapse before the lifecycle hook times out. If the lifecycle
        # hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the DefaultResult
        # property.

        @[JSON::Field(key: "HeartbeatTimeout")]
        getter heartbeat_timeout : Int32?

        # The name of the lifecycle hook.

        @[JSON::Field(key: "LifecycleHookName")]
        getter lifecycle_hook_name : String?

        # The lifecycle transition. Valid values: autoscaling:EC2_INSTANCE_LAUNCHING |
        # autoscaling:EC2_INSTANCE_TERMINATING

        @[JSON::Field(key: "LifecycleTransition")]
        getter lifecycle_transition : String?

        # Additional information that is included any time Amazon EC2 Auto Scaling sends a message to the
        # notification target.

        @[JSON::Field(key: "NotificationMetadata")]
        getter notification_metadata : String?

        # The ARN of the target that Amazon EC2 Auto Scaling sends notifications to when an instance is in a
        # wait state for the lifecycle hook.

        @[JSON::Field(key: "NotificationTargetARN")]
        getter notification_target_arn : String?

        # The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification
        # target (an Amazon SNS topic or an Amazon SQS queue).

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @auto_scaling_group_name : String? = nil,
          @default_result : String? = nil,
          @global_timeout : Int32? = nil,
          @heartbeat_timeout : Int32? = nil,
          @lifecycle_hook_name : String? = nil,
          @lifecycle_transition : String? = nil,
          @notification_metadata : String? = nil,
          @notification_target_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Describes information used to specify a lifecycle hook for an Auto Scaling group. For more
      # information, see Amazon EC2 Auto Scaling lifecycle hooks in the Amazon EC2 Auto Scaling User Guide .

      struct LifecycleHookSpecification
        include JSON::Serializable

        # The name of the lifecycle hook.

        @[JSON::Field(key: "LifecycleHookName")]
        getter lifecycle_hook_name : String

        # The lifecycle transition. For Auto Scaling groups, there are two major lifecycle transitions. To
        # create a lifecycle hook for scale-out events, specify autoscaling:EC2_INSTANCE_LAUNCHING . To create
        # a lifecycle hook for scale-in events, specify autoscaling:EC2_INSTANCE_TERMINATING .

        @[JSON::Field(key: "LifecycleTransition")]
        getter lifecycle_transition : String

        # The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an unexpected
        # failure occurs. The default value is ABANDON . Valid values: CONTINUE | ABANDON

        @[JSON::Field(key: "DefaultResult")]
        getter default_result : String?

        # The maximum time, in seconds, that can elapse before the lifecycle hook times out. The range is from
        # 30 to 7200 seconds. The default value is 3600 seconds (1 hour).

        @[JSON::Field(key: "HeartbeatTimeout")]
        getter heartbeat_timeout : Int32?

        # Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to
        # the notification target.

        @[JSON::Field(key: "NotificationMetadata")]
        getter notification_metadata : String?

        # The Amazon Resource Name (ARN) of the notification target that Amazon EC2 Auto Scaling sends
        # notifications to when an instance is in a wait state for the lifecycle hook. You can specify an
        # Amazon SNS topic or an Amazon SQS queue.

        @[JSON::Field(key: "NotificationTargetARN")]
        getter notification_target_arn : String?

        # The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification
        # target. For information about creating this role, see Prepare to add a lifecycle hook to your Auto
        # Scaling group in the Amazon EC2 Auto Scaling User Guide . Valid only if the notification target is
        # an Amazon SNS topic or an Amazon SQS queue.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @lifecycle_hook_name : String,
          @lifecycle_transition : String,
          @default_result : String? = nil,
          @heartbeat_timeout : Int32? = nil,
          @notification_metadata : String? = nil,
          @notification_target_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # You have already reached a limit for your Amazon EC2 Auto Scaling resources (for example, Auto
      # Scaling groups, launch configurations, or lifecycle hooks). For more information, see
      # DescribeAccountLimits in the Amazon EC2 Auto Scaling API Reference .

      struct LimitExceededFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the state of a Classic Load Balancer.

      struct LoadBalancerState
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String?

        # One of the following load balancer states: Adding - The Auto Scaling instances are being registered
        # with the load balancer. Added - All Auto Scaling instances are registered with the load balancer.
        # InService - At least one Auto Scaling instance passed an ELB health check. Removing - The Auto
        # Scaling instances are being deregistered from the load balancer. If connection draining is enabled,
        # Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.
        # Removed - All Auto Scaling instances are deregistered from the load balancer.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @load_balancer_name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Describes the state of a target group.

      struct LoadBalancerTargetGroupState
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "LoadBalancerTargetGroupARN")]
        getter load_balancer_target_group_arn : String?

        # The state of the target group. Adding - The Auto Scaling instances are being registered with the
        # target group. Added - All Auto Scaling instances are registered with the target group. InService -
        # At least one Auto Scaling instance passed an ELB health check. Removing - The Auto Scaling instances
        # are being deregistered from the target group. If connection draining is enabled, Elastic Load
        # Balancing waits for in-flight requests to complete before deregistering the instances. Removed - All
        # Auto Scaling instances are deregistered from the target group.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @load_balancer_target_group_arn : String? = nil,
          @state : String? = nil
        )
        end
      end

      # A GetPredictiveScalingForecast call returns the load forecast for a predictive scaling policy. This
      # structure includes the data points for that load forecast, along with the timestamps of those data
      # points and the metric specification.

      struct LoadForecast
        include JSON::Serializable

        # The metric specification for the load forecast.

        @[JSON::Field(key: "MetricSpecification")]
        getter metric_specification : Types::PredictiveScalingMetricSpecification

        # The timestamps for the data points, in UTC format.

        @[JSON::Field(key: "Timestamps")]
        getter timestamps : Array(Time)

        # The values of the data points.

        @[JSON::Field(key: "Values")]
        getter values : Array(Float64)

        def initialize(
          @metric_specification : Types::PredictiveScalingMetricSpecification,
          @timestamps : Array(Time),
          @values : Array(Float64)
        )
        end
      end

      # Specifies the minimum and maximum for the MemoryGiBPerVCpu object when you specify
      # InstanceRequirements for an Auto Scaling group.

      struct MemoryGiBPerVCpuRequest
        include JSON::Serializable

        # The memory maximum in GiB.

        @[JSON::Field(key: "Max")]
        getter max : Float64?

        # The memory minimum in GiB.

        @[JSON::Field(key: "Min")]
        getter min : Float64?

        def initialize(
          @max : Float64? = nil,
          @min : Float64? = nil
        )
        end
      end

      # Specifies the minimum and maximum for the MemoryMiB object when you specify InstanceRequirements for
      # an Auto Scaling group.

      struct MemoryMiBRequest
        include JSON::Serializable

        # The memory minimum in MiB.

        @[JSON::Field(key: "Min")]
        getter min : Int32

        # The memory maximum in MiB.

        @[JSON::Field(key: "Max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # Represents a specific metric.

      struct Metric
        include JSON::Serializable

        # The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # The namespace of the metric. For more information, see the table in Amazon Web Services services
        # that publish CloudWatch metrics in the Amazon CloudWatch User Guide .

        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # The dimensions for the metric. For the list of available dimensions, see the Amazon Web Services
        # documentation available from the table in Amazon Web Services services that publish CloudWatch
        # metrics in the Amazon CloudWatch User Guide . Conditional: If you published your metric with
        # dimensions, you must specify the same dimensions in your scaling policy.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::MetricDimension)?

        def initialize(
          @metric_name : String,
          @namespace : String,
          @dimensions : Array(Types::MetricDimension)? = nil
        )
        end
      end

      # Describes a metric.

      struct MetricCollectionType
        include JSON::Serializable

        # One of the following metrics: GroupMinSize GroupMaxSize GroupDesiredCapacity GroupInServiceInstances
        # GroupPendingInstances GroupStandbyInstances GroupTerminatingInstances GroupTotalInstances
        # GroupInServiceCapacity GroupPendingCapacity GroupStandbyCapacity GroupTerminatingCapacity
        # GroupTotalCapacity WarmPoolDesiredCapacity WarmPoolWarmedCapacity WarmPoolPendingCapacity
        # WarmPoolTerminatingCapacity WarmPoolTotalCapacity GroupAndWarmPoolDesiredCapacity
        # GroupAndWarmPoolTotalCapacity

        @[JSON::Field(key: "Metric")]
        getter metric : String?

        def initialize(
          @metric : String? = nil
        )
        end
      end

      # The metric data to return. Also defines whether this call is returning data for one metric only, or
      # whether it is performing a math expression on the values of returned metric statistics to create a
      # new time series. A time series is a series of data points, each of which is associated with a
      # timestamp. For more information and examples, see Advanced predictive scaling policy configurations
      # using custom metrics in the Amazon EC2 Auto Scaling User Guide .

      struct MetricDataQuery
        include JSON::Serializable

        # A short name that identifies the object's results in the response. This name must be unique among
        # all MetricDataQuery objects specified for a single scaling policy. If you are performing math
        # expressions on this set of data, this name represents that data and can serve as a variable in the
        # mathematical expression. The valid characters are letters, numbers, and underscores. The first
        # character must be a lowercase letter.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The math expression to perform on the returned data, if this object is performing a math expression.
        # This expression can use the Id of the other metrics to refer to those metrics, and can also use the
        # Id of other expressions to use the result of those expressions. Conditional: Within each
        # MetricDataQuery object, you must specify either Expression or MetricStat , but not both.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # A human-readable label for this metric or expression. This is especially useful if this is a math
        # expression, so that you know what the value represents.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # Information about the metric data to return. Conditional: Within each MetricDataQuery object, you
        # must specify either Expression or MetricStat , but not both.

        @[JSON::Field(key: "MetricStat")]
        getter metric_stat : Types::MetricStat?

        # Indicates whether to return the timestamps and raw data values of this metric. If you use any math
        # expressions, specify true for this value for only the final math expression that the metric
        # specification is based on. You must specify false for ReturnData for all the other metrics and
        # expressions used in the metric specification. If you are only retrieving metrics and not performing
        # any math expressions, do not specify anything for ReturnData . This sets it to its default ( true ).

        @[JSON::Field(key: "ReturnData")]
        getter return_data : Bool?

        def initialize(
          @id : String,
          @expression : String? = nil,
          @label : String? = nil,
          @metric_stat : Types::MetricStat? = nil,
          @return_data : Bool? = nil
        )
        end
      end

      # Describes the dimension of a metric.

      struct MetricDimension
        include JSON::Serializable

        # The name of the dimension.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the dimension.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Describes a granularity of a metric.

      struct MetricGranularityType
        include JSON::Serializable

        # The granularity. The only valid value is 1Minute .

        @[JSON::Field(key: "Granularity")]
        getter granularity : String?

        def initialize(
          @granularity : String? = nil
        )
        end
      end

      # This structure defines the CloudWatch metric to return, along with the statistic and unit. For more
      # information about the CloudWatch terminology below, see Amazon CloudWatch concepts in the Amazon
      # CloudWatch User Guide .

      struct MetricStat
        include JSON::Serializable

        # The CloudWatch metric to return, including the metric name, namespace, and dimensions. To get the
        # exact metric name, namespace, and dimensions, inspect the Metric object that is returned by a call
        # to ListMetrics .

        @[JSON::Field(key: "Metric")]
        getter metric : Types::Metric

        # The statistic to return. It can include any CloudWatch statistic or extended statistic. For a list
        # of valid values, see the table in Statistics in the Amazon CloudWatch User Guide . The most commonly
        # used metrics for predictive scaling are Average and Sum .

        @[JSON::Field(key: "Stat")]
        getter stat : String

        # The unit to use for the returned data points. For a complete list of the units that CloudWatch
        # supports, see the MetricDatum data type in the Amazon CloudWatch API Reference .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric : Types::Metric,
          @stat : String,
          @unit : String? = nil
        )
        end
      end

      # Use this structure to launch multiple instance types and On-Demand Instances and Spot Instances
      # within a single Auto Scaling group. A mixed instances policy contains information that Amazon EC2
      # Auto Scaling can use to launch instances and help optimize your costs. For more information, see
      # Auto Scaling groups with multiple instance types and purchase options in the Amazon EC2 Auto Scaling
      # User Guide .

      struct MixedInstancesPolicy
        include JSON::Serializable

        # The instances distribution.

        @[JSON::Field(key: "InstancesDistribution")]
        getter instances_distribution : Types::InstancesDistribution?

        # One or more launch templates and the instance types (overrides) that are used to launch EC2
        # instances to fulfill On-Demand and Spot capacities.

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplate?

        def initialize(
          @instances_distribution : Types::InstancesDistribution? = nil,
          @launch_template : Types::LaunchTemplate? = nil
        )
        end
      end

      # Specifies the minimum and maximum for the NetworkBandwidthGbps object when you specify
      # InstanceRequirements for an Auto Scaling group. Setting the minimum bandwidth does not guarantee
      # that your instance will achieve the minimum bandwidth. Amazon EC2 will identify instance types that
      # support the specified minimum bandwidth, but the actual bandwidth of your instance might go below
      # the specified minimum at times. For more information, see Available instance bandwidth in the Amazon
      # EC2 User Guide .

      struct NetworkBandwidthGbpsRequest
        include JSON::Serializable

        # The maximum amount of network bandwidth, in gigabits per second (Gbps).

        @[JSON::Field(key: "Max")]
        getter max : Float64?

        # The minimum amount of network bandwidth, in gigabits per second (Gbps).

        @[JSON::Field(key: "Min")]
        getter min : Float64?

        def initialize(
          @max : Float64? = nil,
          @min : Float64? = nil
        )
        end
      end

      # Specifies the minimum and maximum for the NetworkInterfaceCount object when you specify
      # InstanceRequirements for an Auto Scaling group.

      struct NetworkInterfaceCountRequest
        include JSON::Serializable

        # The maximum number of network interfaces.

        @[JSON::Field(key: "Max")]
        getter max : Int32?

        # The minimum number of network interfaces.

        @[JSON::Field(key: "Min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # Describes a notification.

      struct NotificationConfiguration
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # One of the following event notification types: autoscaling:EC2_INSTANCE_LAUNCH
        # autoscaling:EC2_INSTANCE_LAUNCH_ERROR autoscaling:EC2_INSTANCE_TERMINATE
        # autoscaling:EC2_INSTANCE_TERMINATE_ERROR autoscaling:TEST_NOTIFICATION

        @[JSON::Field(key: "NotificationType")]
        getter notification_type : String?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic.

        @[JSON::Field(key: "TopicARN")]
        getter topic_arn : String?

        def initialize(
          @auto_scaling_group_name : String? = nil,
          @notification_type : String? = nil,
          @topic_arn : String? = nil
        )
        end
      end

      # Specify an instance family to use as the baseline reference for CPU performance. All instance types
      # that All instance types that match your specified attributes will be compared against the CPU
      # performance of the referenced instance family, regardless of CPU manufacturer or architecture
      # differences. Currently only one instance family can be specified in the list.

      struct PerformanceFactorReferenceRequest
        include JSON::Serializable

        # The instance family to use as a baseline reference. Make sure that you specify the correct value for
        # the instance family. The instance family is everything before the period (.) in the instance type
        # name. For example, in the instance c6i.large , the instance family is c6i , not c6 . For more
        # information, see Amazon EC2 instance type naming conventions in Amazon EC2 Instance Types . The
        # following instance types are not supported for performance protection. c1 g3| g3s hpc7g m1| m2 mac1
        # | mac2 | mac2-m1ultra | mac2-m2 | mac2-m2pro p3dn | p4d | p5 t1 u-12tb1 | u-18tb1 | u-24tb1 | u-3tb1
        # | u-6tb1 | u-9tb1 | u7i-12tb | u7in-16tb | u7in-24tb | u7in-32tb If you performance protection by
        # specifying a supported instance family, the returned instance types will exclude the preceding
        # unsupported instance families. If you specify an unsupported instance family as a value for baseline
        # performance, the API returns an empty response.

        @[JSON::Field(key: "InstanceFamily")]
        getter instance_family : String?

        def initialize(
          @instance_family : String? = nil
        )
        end
      end


      struct PoliciesType
        include JSON::Serializable

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The scaling policies.

        @[JSON::Field(key: "ScalingPolicies")]
        getter scaling_policies : Array(Types::ScalingPolicy)?

        def initialize(
          @next_token : String? = nil,
          @scaling_policies : Array(Types::ScalingPolicy)? = nil
        )
        end
      end

      # Contains the output of PutScalingPolicy.

      struct PolicyARNType
        include JSON::Serializable

        # The CloudWatch alarms created for the target tracking scaling policy.

        @[JSON::Field(key: "Alarms")]
        getter alarms : Array(Types::Alarm)?

        # The Amazon Resource Name (ARN) of the policy.

        @[JSON::Field(key: "PolicyARN")]
        getter policy_arn : String?

        def initialize(
          @alarms : Array(Types::Alarm)? = nil,
          @policy_arn : String? = nil
        )
        end
      end

      # Represents a predefined metric for a target tracking scaling policy to use with Amazon EC2 Auto
      # Scaling.

      struct PredefinedMetricSpecification
        include JSON::Serializable

        # The metric type. The following predefined metrics are available: ASGAverageCPUUtilization - Average
        # CPU utilization of the Auto Scaling group. ASGAverageNetworkIn - Average number of bytes received on
        # all network interfaces by the Auto Scaling group. ASGAverageNetworkOut - Average number of bytes
        # sent out on all network interfaces by the Auto Scaling group. ALBRequestCountPerTarget - Average
        # Application Load Balancer request count per target for your Auto Scaling group.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # A label that uniquely identifies a specific Application Load Balancer target group from which to
        # determine the average request count served by your Auto Scaling group. You can't specify a resource
        # label unless the target group is attached to the Auto Scaling group. You create the resource label
        # by appending the final portion of the load balancer ARN and the final portion of the target group
        # ARN into a single value, separated by a forward slash (/). The format of the resource label is:
        # app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff . Where:
        # app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer
        # ARN targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target
        # group ARN. To find the ARN for an Application Load Balancer, use the DescribeLoadBalancers API
        # operation. To find the ARN for the target group, use the DescribeTargetGroups API operation.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Represents a predictive scaling policy configuration to use with Amazon EC2 Auto Scaling.

      struct PredictiveScalingConfiguration
        include JSON::Serializable

        # This structure includes the metrics and target utilization to use for predictive scaling. This is an
        # array, but we currently only support a single metric specification. That is, you can specify a
        # target value and a single metric pair, or a target value and one scaling metric and one load metric.

        @[JSON::Field(key: "MetricSpecifications")]
        getter metric_specifications : Array(Types::PredictiveScalingMetricSpecification)

        # Defines the behavior that should be applied if the forecast capacity approaches or exceeds the
        # maximum capacity of the Auto Scaling group. Defaults to HonorMaxCapacity if not specified. The
        # following are possible values: HonorMaxCapacity - Amazon EC2 Auto Scaling can't increase the maximum
        # capacity of the group when the forecast capacity is close to or exceeds the maximum capacity.
        # IncreaseMaxCapacity - Amazon EC2 Auto Scaling can increase the maximum capacity of the group when
        # the forecast capacity is close to or exceeds the maximum capacity. The upper limit is determined by
        # the forecasted capacity and the value for MaxCapacityBuffer . Use caution when allowing the maximum
        # capacity to be automatically increased. This can lead to more instances being launched than intended
        # if the increased maximum capacity is not monitored and managed. The increased maximum capacity then
        # becomes the new normal maximum capacity for the Auto Scaling group until you manually update it. The
        # maximum capacity does not automatically decrease back to the original maximum.

        @[JSON::Field(key: "MaxCapacityBreachBehavior")]
        getter max_capacity_breach_behavior : String?

        # The size of the capacity buffer to use when the forecast capacity is close to or exceeds the maximum
        # capacity. The value is specified as a percentage relative to the forecast capacity. For example, if
        # the buffer is 10, this means a 10 percent buffer, such that if the forecast capacity is 50, and the
        # maximum capacity is 40, then the effective maximum capacity is 55. If set to 0, Amazon EC2 Auto
        # Scaling may scale capacity higher than the maximum capacity to equal but not exceed forecast
        # capacity. Required if the MaxCapacityBreachBehavior property is set to IncreaseMaxCapacity , and
        # cannot be used otherwise.

        @[JSON::Field(key: "MaxCapacityBuffer")]
        getter max_capacity_buffer : Int32?

        # The predictive scaling mode. Defaults to ForecastOnly if not specified.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The amount of time, in seconds, by which the instance launch time can be advanced. For example, the
        # forecast says to add capacity at 10:00 AM, and you choose to pre-launch instances by 5 minutes. In
        # that case, the instances will be launched at 9:55 AM. The intention is to give resources time to be
        # provisioned. It can take a few minutes to launch an EC2 instance. The actual amount of time required
        # depends on several factors, such as the size of the instance and whether there are startup scripts
        # to complete. The value must be less than the forecast interval duration of 3600 seconds (60
        # minutes). Defaults to 300 seconds if not specified.

        @[JSON::Field(key: "SchedulingBufferTime")]
        getter scheduling_buffer_time : Int32?

        def initialize(
          @metric_specifications : Array(Types::PredictiveScalingMetricSpecification),
          @max_capacity_breach_behavior : String? = nil,
          @max_capacity_buffer : Int32? = nil,
          @mode : String? = nil,
          @scheduling_buffer_time : Int32? = nil
        )
        end
      end

      # Describes a customized capacity metric for a predictive scaling policy.

      struct PredictiveScalingCustomizedCapacityMetric
        include JSON::Serializable

        # One or more metric data queries to provide the data points for a capacity metric. Use multiple
        # metric data queries only if you are performing a math expression on returned data.

        @[JSON::Field(key: "MetricDataQueries")]
        getter metric_data_queries : Array(Types::MetricDataQuery)

        def initialize(
          @metric_data_queries : Array(Types::MetricDataQuery)
        )
        end
      end

      # Describes a custom load metric for a predictive scaling policy.

      struct PredictiveScalingCustomizedLoadMetric
        include JSON::Serializable

        # One or more metric data queries to provide the data points for a load metric. Use multiple metric
        # data queries only if you are performing a math expression on returned data.

        @[JSON::Field(key: "MetricDataQueries")]
        getter metric_data_queries : Array(Types::MetricDataQuery)

        def initialize(
          @metric_data_queries : Array(Types::MetricDataQuery)
        )
        end
      end

      # Describes a custom scaling metric for a predictive scaling policy.

      struct PredictiveScalingCustomizedScalingMetric
        include JSON::Serializable

        # One or more metric data queries to provide the data points for a scaling metric. Use multiple metric
        # data queries only if you are performing a math expression on returned data.

        @[JSON::Field(key: "MetricDataQueries")]
        getter metric_data_queries : Array(Types::MetricDataQuery)

        def initialize(
          @metric_data_queries : Array(Types::MetricDataQuery)
        )
        end
      end

      # This structure specifies the metrics and target utilization settings for a predictive scaling
      # policy. You must specify either a metric pair, or a load metric and a scaling metric individually.
      # Specifying a metric pair instead of individual metrics provides a simpler way to configure metrics
      # for a scaling policy. You choose the metric pair, and the policy automatically knows the correct sum
      # and average statistics to use for the load metric and the scaling metric. Example You create a
      # predictive scaling policy and specify ALBRequestCount as the value for the metric pair and 1000.0 as
      # the target value. For this type of metric, you must provide the metric dimension for the
      # corresponding target group, so you also provide a resource label for the Application Load Balancer
      # target group that is attached to your Auto Scaling group. The number of requests the target group
      # receives per minute provides the load metric, and the request count averaged between the members of
      # the target group provides the scaling metric. In CloudWatch, this refers to the RequestCount and
      # RequestCountPerTarget metrics, respectively. For optimal use of predictive scaling, you adhere to
      # the best practice of using a dynamic scaling policy to automatically scale between the minimum
      # capacity and maximum capacity in response to real-time changes in resource utilization. Amazon EC2
      # Auto Scaling consumes data points for the load metric over the last 14 days and creates an hourly
      # load forecast for predictive scaling. (A minimum of 24 hours of data is required.) After creating
      # the load forecast, Amazon EC2 Auto Scaling determines when to reduce or increase the capacity of
      # your Auto Scaling group in each hour of the forecast period so that the average number of requests
      # received by each instance is as close to 1000 requests per minute as possible at all times. For
      # information about using custom metrics with predictive scaling, see Advanced predictive scaling
      # policy configurations using custom metrics in the Amazon EC2 Auto Scaling User Guide .

      struct PredictiveScalingMetricSpecification
        include JSON::Serializable

        # Specifies the target utilization. Some metrics are based on a count instead of a percentage, such as
        # the request count for an Application Load Balancer or the number of messages in an SQS queue. If the
        # scaling policy specifies one of these metrics, specify the target utilization as the optimal average
        # request or message count per instance during any one-minute interval.

        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        # The customized capacity metric specification.

        @[JSON::Field(key: "CustomizedCapacityMetricSpecification")]
        getter customized_capacity_metric_specification : Types::PredictiveScalingCustomizedCapacityMetric?

        # The customized load metric specification.

        @[JSON::Field(key: "CustomizedLoadMetricSpecification")]
        getter customized_load_metric_specification : Types::PredictiveScalingCustomizedLoadMetric?

        # The customized scaling metric specification.

        @[JSON::Field(key: "CustomizedScalingMetricSpecification")]
        getter customized_scaling_metric_specification : Types::PredictiveScalingCustomizedScalingMetric?

        # The predefined load metric specification.

        @[JSON::Field(key: "PredefinedLoadMetricSpecification")]
        getter predefined_load_metric_specification : Types::PredictiveScalingPredefinedLoadMetric?

        # The predefined metric pair specification from which Amazon EC2 Auto Scaling determines the
        # appropriate scaling metric and load metric to use.

        @[JSON::Field(key: "PredefinedMetricPairSpecification")]
        getter predefined_metric_pair_specification : Types::PredictiveScalingPredefinedMetricPair?

        # The predefined scaling metric specification.

        @[JSON::Field(key: "PredefinedScalingMetricSpecification")]
        getter predefined_scaling_metric_specification : Types::PredictiveScalingPredefinedScalingMetric?

        def initialize(
          @target_value : Float64,
          @customized_capacity_metric_specification : Types::PredictiveScalingCustomizedCapacityMetric? = nil,
          @customized_load_metric_specification : Types::PredictiveScalingCustomizedLoadMetric? = nil,
          @customized_scaling_metric_specification : Types::PredictiveScalingCustomizedScalingMetric? = nil,
          @predefined_load_metric_specification : Types::PredictiveScalingPredefinedLoadMetric? = nil,
          @predefined_metric_pair_specification : Types::PredictiveScalingPredefinedMetricPair? = nil,
          @predefined_scaling_metric_specification : Types::PredictiveScalingPredefinedScalingMetric? = nil
        )
        end
      end

      # Describes a load metric for a predictive scaling policy. When returned in the output of
      # DescribePolicies , it indicates that a predictive scaling policy uses individually specified load
      # and scaling metrics instead of a metric pair.

      struct PredictiveScalingPredefinedLoadMetric
        include JSON::Serializable

        # The metric type.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # A label that uniquely identifies a specific Application Load Balancer target group from which to
        # determine the request count served by your Auto Scaling group. You can't specify a resource label
        # unless the target group is attached to the Auto Scaling group. You create the resource label by
        # appending the final portion of the load balancer ARN and the final portion of the target group ARN
        # into a single value, separated by a forward slash (/). The format of the resource label is:
        # app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff . Where:
        # app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer
        # ARN targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target
        # group ARN. To find the ARN for an Application Load Balancer, use the DescribeLoadBalancers API
        # operation. To find the ARN for the target group, use the DescribeTargetGroups API operation.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Represents a metric pair for a predictive scaling policy.

      struct PredictiveScalingPredefinedMetricPair
        include JSON::Serializable

        # Indicates which metrics to use. There are two different types of metrics for each metric type: one
        # is a load metric and one is a scaling metric. For example, if the metric type is ASGCPUUtilization ,
        # the Auto Scaling group's total CPU metric is used as the load metric, and the average CPU metric is
        # used for the scaling metric.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # A label that uniquely identifies a specific Application Load Balancer target group from which to
        # determine the total and average request count served by your Auto Scaling group. You can't specify a
        # resource label unless the target group is attached to the Auto Scaling group. You create the
        # resource label by appending the final portion of the load balancer ARN and the final portion of the
        # target group ARN into a single value, separated by a forward slash (/). The format of the resource
        # label is: app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff . Where:
        # app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer
        # ARN targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target
        # group ARN. To find the ARN for an Application Load Balancer, use the DescribeLoadBalancers API
        # operation. To find the ARN for the target group, use the DescribeTargetGroups API operation.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Describes a scaling metric for a predictive scaling policy. When returned in the output of
      # DescribePolicies , it indicates that a predictive scaling policy uses individually specified load
      # and scaling metrics instead of a metric pair.

      struct PredictiveScalingPredefinedScalingMetric
        include JSON::Serializable

        # The metric type.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # A label that uniquely identifies a specific Application Load Balancer target group from which to
        # determine the average request count served by your Auto Scaling group. You can't specify a resource
        # label unless the target group is attached to the Auto Scaling group. You create the resource label
        # by appending the final portion of the load balancer ARN and the final portion of the target group
        # ARN into a single value, separated by a forward slash (/). The format of the resource label is:
        # app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff . Where:
        # app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer
        # ARN targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target
        # group ARN. To find the ARN for an Application Load Balancer, use the DescribeLoadBalancers API
        # operation. To find the ARN for the target group, use the DescribeTargetGroups API operation.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Describes a process type. For more information, see Types of processes in the Amazon EC2 Auto
      # Scaling User Guide .

      struct ProcessType
        include JSON::Serializable

        # One of the following processes: Launch Terminate AddToLoadBalancer AlarmNotification AZRebalance
        # HealthCheck InstanceRefresh ReplaceUnhealthy ScheduledActions

        @[JSON::Field(key: "ProcessName")]
        getter process_name : String

        def initialize(
          @process_name : String
        )
        end
      end


      struct ProcessesType
        include JSON::Serializable

        # The names of the process types.

        @[JSON::Field(key: "Processes")]
        getter processes : Array(Types::ProcessType)?

        def initialize(
          @processes : Array(Types::ProcessType)? = nil
        )
        end
      end


      struct PutLifecycleHookAnswer
        include JSON::Serializable

        def initialize
        end
      end


      struct PutLifecycleHookType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The name of the lifecycle hook.

        @[JSON::Field(key: "LifecycleHookName")]
        getter lifecycle_hook_name : String

        # The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an unexpected
        # failure occurs. The default value is ABANDON . Valid values: CONTINUE | ABANDON

        @[JSON::Field(key: "DefaultResult")]
        getter default_result : String?

        # The maximum time, in seconds, that can elapse before the lifecycle hook times out. The range is from
        # 30 to 7200 seconds. The default value is 3600 seconds (1 hour).

        @[JSON::Field(key: "HeartbeatTimeout")]
        getter heartbeat_timeout : Int32?

        # The lifecycle transition. For Auto Scaling groups, there are two major lifecycle transitions. To
        # create a lifecycle hook for scale-out events, specify autoscaling:EC2_INSTANCE_LAUNCHING . To create
        # a lifecycle hook for scale-in events, specify autoscaling:EC2_INSTANCE_TERMINATING . Required for
        # new lifecycle hooks, but optional when updating existing hooks.

        @[JSON::Field(key: "LifecycleTransition")]
        getter lifecycle_transition : String?

        # Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to
        # the notification target.

        @[JSON::Field(key: "NotificationMetadata")]
        getter notification_metadata : String?

        # The Amazon Resource Name (ARN) of the notification target that Amazon EC2 Auto Scaling uses to
        # notify you when an instance is in a wait state for the lifecycle hook. You can specify either an
        # Amazon SNS topic or an Amazon SQS queue. If you specify an empty string, this overrides the current
        # ARN. This operation uses the JSON format when sending notifications to an Amazon SQS queue, and an
        # email key-value pair format when sending notifications to an Amazon SNS topic. When you specify a
        # notification target, Amazon EC2 Auto Scaling sends it a test message. Test messages contain the
        # following additional key-value pair: "Event": "autoscaling:TEST_NOTIFICATION" .

        @[JSON::Field(key: "NotificationTargetARN")]
        getter notification_target_arn : String?

        # The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification
        # target. Valid only if the notification target is an Amazon SNS topic or an Amazon SQS queue.
        # Required for new lifecycle hooks, but optional when updating existing hooks.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @auto_scaling_group_name : String,
          @lifecycle_hook_name : String,
          @default_result : String? = nil,
          @heartbeat_timeout : Int32? = nil,
          @lifecycle_transition : String? = nil,
          @notification_metadata : String? = nil,
          @notification_target_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct PutNotificationConfigurationType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The type of event that causes the notification to be sent. To query the notification types supported
        # by Amazon EC2 Auto Scaling, call the DescribeAutoScalingNotificationTypes API.

        @[JSON::Field(key: "NotificationTypes")]
        getter notification_types : Array(String)

        # The Amazon Resource Name (ARN) of the Amazon SNS topic.

        @[JSON::Field(key: "TopicARN")]
        getter topic_arn : String

        def initialize(
          @auto_scaling_group_name : String,
          @notification_types : Array(String),
          @topic_arn : String
        )
        end
      end


      struct PutScalingPolicyType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # Specifies how the scaling adjustment is interpreted (for example, an absolute number or a
        # percentage). The valid values are ChangeInCapacity , ExactCapacity , and PercentChangeInCapacity .
        # Required if the policy type is StepScaling or SimpleScaling . For more information, see Scaling
        # adjustment types in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "AdjustmentType")]
        getter adjustment_type : String?

        # A cooldown period, in seconds, that applies to a specific simple scaling policy. When a cooldown
        # period is specified here, it overrides the default cooldown. Valid only if the policy type is
        # SimpleScaling . For more information, see Scaling cooldowns for Amazon EC2 Auto Scaling in the
        # Amazon EC2 Auto Scaling User Guide . Default: None

        @[JSON::Field(key: "Cooldown")]
        getter cooldown : Int32?

        # Indicates whether the scaling policy is enabled or disabled. The default is enabled. For more
        # information, see Disable a scaling policy for an Auto Scaling group in the Amazon EC2 Auto Scaling
        # User Guide .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Not needed if the default instance warmup is defined for the group. The estimated time, in seconds,
        # until a newly launched instance can contribute to the CloudWatch metrics. This warm-up period
        # applies to instances launched due to a specific target tracking or step scaling policy. When a
        # warm-up period is specified here, it overrides the default instance warmup. Valid only if the policy
        # type is TargetTrackingScaling or StepScaling . The default is to use the value for the default
        # instance warmup defined for the group. If default instance warmup is null, then
        # EstimatedInstanceWarmup falls back to the value of default cooldown.

        @[JSON::Field(key: "EstimatedInstanceWarmup")]
        getter estimated_instance_warmup : Int32?

        # The aggregation type for the CloudWatch metrics. The valid values are Minimum , Maximum , and
        # Average . If the aggregation type is null, the value is treated as Average . Valid only if the
        # policy type is StepScaling .

        @[JSON::Field(key: "MetricAggregationType")]
        getter metric_aggregation_type : String?

        # The minimum value to scale by when the adjustment type is PercentChangeInCapacity . For example,
        # suppose that you create a step scaling policy to scale out an Auto Scaling group by 25 percent and
        # you specify a MinAdjustmentMagnitude of 2. If the group has 4 instances and the scaling policy is
        # performed, 25 percent of 4 is 1. However, because you specified a MinAdjustmentMagnitude of 2,
        # Amazon EC2 Auto Scaling scales out the group by 2 instances. Valid only if the policy type is
        # StepScaling or SimpleScaling . For more information, see Scaling adjustment types in the Amazon EC2
        # Auto Scaling User Guide . Some Auto Scaling groups use instance weights. In this case, set the
        # MinAdjustmentMagnitude to a value that is at least as large as your largest instance weight.

        @[JSON::Field(key: "MinAdjustmentMagnitude")]
        getter min_adjustment_magnitude : Int32?

        # Available for backward compatibility. Use MinAdjustmentMagnitude instead.

        @[JSON::Field(key: "MinAdjustmentStep")]
        getter min_adjustment_step : Int32?

        # One of the following policy types: TargetTrackingScaling StepScaling SimpleScaling (default)
        # PredictiveScaling

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # A predictive scaling policy. Provides support for predefined and custom metrics. Predefined metrics
        # include CPU utilization, network in/out, and the Application Load Balancer request count. For more
        # information, see PredictiveScalingConfiguration in the Amazon EC2 Auto Scaling API Reference .
        # Required if the policy type is PredictiveScaling .

        @[JSON::Field(key: "PredictiveScalingConfiguration")]
        getter predictive_scaling_configuration : Types::PredictiveScalingConfiguration?

        # The amount by which to scale, based on the specified adjustment type. A positive value adds to the
        # current capacity while a negative number removes from the current capacity. For exact capacity, you
        # must specify a non-negative value. Required if the policy type is SimpleScaling . (Not used with any
        # other policy type.)

        @[JSON::Field(key: "ScalingAdjustment")]
        getter scaling_adjustment : Int32?

        # A set of adjustments that enable you to scale based on the size of the alarm breach. Required if the
        # policy type is StepScaling . (Not used with any other policy type.)

        @[JSON::Field(key: "StepAdjustments")]
        getter step_adjustments : Array(Types::StepAdjustment)?

        # A target tracking scaling policy. Provides support for predefined or custom metrics. The following
        # predefined metrics are available: ASGAverageCPUUtilization ASGAverageNetworkIn ASGAverageNetworkOut
        # ALBRequestCountPerTarget If you specify ALBRequestCountPerTarget for the metric, you must specify
        # the ResourceLabel property with the PredefinedMetricSpecification . For more information, see
        # TargetTrackingConfiguration in the Amazon EC2 Auto Scaling API Reference . Required if the policy
        # type is TargetTrackingScaling .

        @[JSON::Field(key: "TargetTrackingConfiguration")]
        getter target_tracking_configuration : Types::TargetTrackingConfiguration?

        def initialize(
          @auto_scaling_group_name : String,
          @policy_name : String,
          @adjustment_type : String? = nil,
          @cooldown : Int32? = nil,
          @enabled : Bool? = nil,
          @estimated_instance_warmup : Int32? = nil,
          @metric_aggregation_type : String? = nil,
          @min_adjustment_magnitude : Int32? = nil,
          @min_adjustment_step : Int32? = nil,
          @policy_type : String? = nil,
          @predictive_scaling_configuration : Types::PredictiveScalingConfiguration? = nil,
          @scaling_adjustment : Int32? = nil,
          @step_adjustments : Array(Types::StepAdjustment)? = nil,
          @target_tracking_configuration : Types::TargetTrackingConfiguration? = nil
        )
        end
      end


      struct PutScheduledUpdateGroupActionType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The name of this scaling action.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action
        # runs and the capacity it attempts to maintain. It can scale beyond this capacity if you add more
        # scaling conditions. You must specify at least one of the following properties: MaxSize , MinSize ,
        # or DesiredCapacity .

        @[JSON::Field(key: "DesiredCapacity")]
        getter desired_capacity : Int32?

        # The date and time for the recurring schedule to end, in UTC. For example, "2021-06-01T00:00:00Z" .

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The maximum size of the Auto Scaling group.

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32?

        # The minimum size of the Auto Scaling group.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # The recurring schedule for this action. This format consists of five fields separated by white
        # spaces: [Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes
        # (for example, "30 0 1 1,6,12 *" ). For more information about this format, see Crontab . When
        # StartTime and EndTime are specified with Recurrence , they form the boundaries of when the recurring
        # action starts and stops. Cron expressions use Universal Coordinated Time (UTC) by default.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : String?

        # The date and time for this action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in
        # quotes (for example, "2021-06-01T00:00:00Z" ). If you specify Recurrence and StartTime , Amazon EC2
        # Auto Scaling performs the action at this time, and then performs the action based on the specified
        # recurrence.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # This property is no longer used.

        @[JSON::Field(key: "Time")]
        getter time : Time?

        # Specifies the time zone for a cron expression. If a time zone is not provided, UTC is used by
        # default. Valid values are the canonical names of the IANA time zones, derived from the IANA Time
        # Zone Database (such as Etc/GMT+9 or Pacific/Tahiti ). For more information, see
        # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones .

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : String?

        def initialize(
          @auto_scaling_group_name : String,
          @scheduled_action_name : String,
          @desired_capacity : Int32? = nil,
          @end_time : Time? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil,
          @recurrence : String? = nil,
          @start_time : Time? = nil,
          @time : Time? = nil,
          @time_zone : String? = nil
        )
        end
      end


      struct PutWarmPoolAnswer
        include JSON::Serializable

        def initialize
        end
      end


      struct PutWarmPoolType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # Indicates whether instances in the Auto Scaling group can be returned to the warm pool on scale in.
        # The default is to terminate instances in the Auto Scaling group when the group scales in.

        @[JSON::Field(key: "InstanceReusePolicy")]
        getter instance_reuse_policy : Types::InstanceReusePolicy?

        # Specifies the maximum number of instances that are allowed to be in the warm pool or in any state
        # except Terminated for the Auto Scaling group. This is an optional property. Specify it only if you
        # do not want the warm pool size to be determined by the difference between the group's maximum
        # capacity and its desired capacity. If a value for MaxGroupPreparedCapacity is not specified, Amazon
        # EC2 Auto Scaling launches and maintains the difference between the group's maximum capacity and its
        # desired capacity. If you specify a value for MaxGroupPreparedCapacity , Amazon EC2 Auto Scaling uses
        # the difference between the MaxGroupPreparedCapacity and the desired capacity instead. The size of
        # the warm pool is dynamic. Only when MaxGroupPreparedCapacity and MinSize are set to the same value
        # does the warm pool have an absolute size. If the desired capacity of the Auto Scaling group is
        # higher than the MaxGroupPreparedCapacity , the capacity of the warm pool is 0, unless you specify a
        # value for MinSize . To remove a value that you previously set, include the property but specify -1
        # for the value.

        @[JSON::Field(key: "MaxGroupPreparedCapacity")]
        getter max_group_prepared_capacity : Int32?

        # Specifies the minimum number of instances to maintain in the warm pool. This helps you to ensure
        # that there is always a certain number of warmed instances available to handle traffic spikes.
        # Defaults to 0 if not specified.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # Sets the instance state to transition to after the lifecycle actions are complete. Default is
        # Stopped .

        @[JSON::Field(key: "PoolState")]
        getter pool_state : String?

        def initialize(
          @auto_scaling_group_name : String,
          @instance_reuse_policy : Types::InstanceReusePolicy? = nil,
          @max_group_prepared_capacity : Int32? = nil,
          @min_size : Int32? = nil,
          @pool_state : String? = nil
        )
        end
      end


      struct RecordLifecycleActionHeartbeatAnswer
        include JSON::Serializable

        def initialize
        end
      end


      struct RecordLifecycleActionHeartbeatType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The name of the lifecycle hook.

        @[JSON::Field(key: "LifecycleHookName")]
        getter lifecycle_hook_name : String

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # A token that uniquely identifies a specific lifecycle action associated with an instance. Amazon EC2
        # Auto Scaling sends this token to the notification target that you specified when you created the
        # lifecycle hook.

        @[JSON::Field(key: "LifecycleActionToken")]
        getter lifecycle_action_token : String?

        def initialize(
          @auto_scaling_group_name : String,
          @lifecycle_hook_name : String,
          @instance_id : String? = nil,
          @lifecycle_action_token : String? = nil
        )
        end
      end

      # Describes the preferences for an instance refresh.

      struct RefreshPreferences
        include JSON::Serializable

        # (Optional) The CloudWatch alarm specification. CloudWatch alarms can be used to identify any issues
        # and fail the operation if an alarm threshold is met.

        @[JSON::Field(key: "AlarmSpecification")]
        getter alarm_specification : Types::AlarmSpecification?

        # (Optional) Indicates whether to roll back the Auto Scaling group to its previous configuration if
        # the instance refresh fails or a CloudWatch alarm threshold is met. The default is false . A rollback
        # is not supported in the following situations: There is no desired configuration specified for the
        # instance refresh. The Auto Scaling group has a launch template that uses an Amazon Web Services
        # Systems Manager parameter instead of an AMI ID for the ImageId property. The Auto Scaling group uses
        # the launch template's $Latest or $Default version. For more information, see Undo changes with a
        # rollback in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "AutoRollback")]
        getter auto_rollback : Bool?

        # The amount of time, in seconds, to wait at the end of an instance refresh before the instance
        # refresh is considered complete.

        @[JSON::Field(key: "BakeTime")]
        getter bake_time : Int32?

        # (Optional) The amount of time, in seconds, to wait after a checkpoint before continuing. This
        # property is optional, but if you specify a value for it, you must also specify a value for
        # CheckpointPercentages . If you specify a value for CheckpointPercentages and not for CheckpointDelay
        # , the CheckpointDelay defaults to 3600 (1 hour).

        @[JSON::Field(key: "CheckpointDelay")]
        getter checkpoint_delay : Int32?

        # (Optional) Threshold values for each checkpoint in ascending order. Each number must be unique. To
        # replace all instances in the Auto Scaling group, the last number in the array must be 100 . For
        # usage examples, see Add checkpoints to an instance refresh in the Amazon EC2 Auto Scaling User Guide
        # .

        @[JSON::Field(key: "CheckpointPercentages")]
        getter checkpoint_percentages : Array(Int32)?

        # A time period, in seconds, during which an instance refresh waits before moving on to replacing the
        # next instance after a new instance enters the InService state. This property is not required for
        # normal usage. Instead, use the DefaultInstanceWarmup property of the Auto Scaling group. The
        # InstanceWarmup and DefaultInstanceWarmup properties work the same way. Only specify this property if
        # you must override the DefaultInstanceWarmup property. If you do not specify this property, the
        # instance warmup by default is the value of the DefaultInstanceWarmup property, if defined (which is
        # recommended in all cases), or the HealthCheckGracePeriod property otherwise.

        @[JSON::Field(key: "InstanceWarmup")]
        getter instance_warmup : Int32?

        # Specifies the maximum percentage of the group that can be in service and healthy, or pending, to
        # support your workload when replacing instances. The value is expressed as a percentage of the
        # desired capacity of the Auto Scaling group. Value range is 100 to 200. If you specify
        # MaxHealthyPercentage , you must also specify MinHealthyPercentage , and the difference between them
        # cannot be greater than 100. A larger range increases the number of instances that can be replaced at
        # the same time. If you do not specify this property, the default is 100 percent, or the percentage
        # set in the instance maintenance policy for the Auto Scaling group, if defined.

        @[JSON::Field(key: "MaxHealthyPercentage")]
        getter max_healthy_percentage : Int32?

        # Specifies the minimum percentage of the group to keep in service, healthy, and ready to use to
        # support your workload to allow the operation to continue. The value is expressed as a percentage of
        # the desired capacity of the Auto Scaling group. Value range is 0 to 100. If you do not specify this
        # property, the default is 90 percent, or the percentage set in the instance maintenance policy for
        # the Auto Scaling group, if defined.

        @[JSON::Field(key: "MinHealthyPercentage")]
        getter min_healthy_percentage : Int32?

        # Choose the behavior that you want Amazon EC2 Auto Scaling to use if instances protected from scale
        # in are found. The following lists the valid values: Refresh Amazon EC2 Auto Scaling replaces
        # instances that are protected from scale in. Ignore Amazon EC2 Auto Scaling ignores instances that
        # are protected from scale in and continues to replace instances that are not protected. Wait
        # (default) Amazon EC2 Auto Scaling waits one hour for you to remove scale-in protection. Otherwise,
        # the instance refresh will fail.

        @[JSON::Field(key: "ScaleInProtectedInstances")]
        getter scale_in_protected_instances : String?

        # (Optional) Indicates whether skip matching is enabled. If enabled ( true ), then Amazon EC2 Auto
        # Scaling skips replacing instances that match the desired configuration. If no desired configuration
        # is specified, then it skips replacing instances that have the same launch template and instance
        # types that the Auto Scaling group was using before the start of the instance refresh. The default is
        # false . For more information, see Use an instance refresh with skip matching in the Amazon EC2 Auto
        # Scaling User Guide .

        @[JSON::Field(key: "SkipMatching")]
        getter skip_matching : Bool?

        # Choose the behavior that you want Amazon EC2 Auto Scaling to use if instances in Standby state are
        # found. The following lists the valid values: Terminate Amazon EC2 Auto Scaling terminates instances
        # that are in Standby . Ignore Amazon EC2 Auto Scaling ignores instances that are in Standby and
        # continues to replace instances that are in the InService state. Wait (default) Amazon EC2 Auto
        # Scaling waits one hour for you to return the instances to service. Otherwise, the instance refresh
        # will fail.

        @[JSON::Field(key: "StandbyInstances")]
        getter standby_instances : String?

        def initialize(
          @alarm_specification : Types::AlarmSpecification? = nil,
          @auto_rollback : Bool? = nil,
          @bake_time : Int32? = nil,
          @checkpoint_delay : Int32? = nil,
          @checkpoint_percentages : Array(Int32)? = nil,
          @instance_warmup : Int32? = nil,
          @max_healthy_percentage : Int32? = nil,
          @min_healthy_percentage : Int32? = nil,
          @scale_in_protected_instances : String? = nil,
          @skip_matching : Bool? = nil,
          @standby_instances : String? = nil
        )
        end
      end

      # You already have a pending update to an Amazon EC2 Auto Scaling resource (for example, an Auto
      # Scaling group, instance, or load balancer).

      struct ResourceContentionFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation can't be performed because the resource is in use.

      struct ResourceInUseFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines the specific triggers that cause instances to be retained in a Retained state rather than
      # terminated. Each trigger corresponds to a different failure scenario during the instance lifecycle.
      # This allows fine-grained control over when to preserve instances for manual intervention.

      struct RetentionTriggers
        include JSON::Serializable

        # Specifies the action when a termination lifecycle hook is abandoned due to failure, timeout, or
        # explicit abandonment (calling CompleteLifecycleAction). Set to Retain to move instances to a
        # Retained state. Set to Terminate for default termination behavior. Retained instances don't count
        # toward desired capacity and remain until you call TerminateInstanceInAutoScalingGroup .

        @[JSON::Field(key: "TerminateHookAbandon")]
        getter terminate_hook_abandon : String?

        def initialize(
          @terminate_hook_abandon : String? = nil
        )
        end
      end

      # Details about an instance refresh rollback.

      struct RollbackDetails
        include JSON::Serializable

        # Indicates the value of InstancesToUpdate at the time the rollback started.

        @[JSON::Field(key: "InstancesToUpdateOnRollback")]
        getter instances_to_update_on_rollback : Int32?

        # Indicates the value of PercentageComplete at the time the rollback started.

        @[JSON::Field(key: "PercentageCompleteOnRollback")]
        getter percentage_complete_on_rollback : Int32?

        # Reports progress on replacing instances in an Auto Scaling group that has a warm pool. This includes
        # separate details for instances in the warm pool and instances in the Auto Scaling group (the live
        # pool).

        @[JSON::Field(key: "ProgressDetailsOnRollback")]
        getter progress_details_on_rollback : Types::InstanceRefreshProgressDetails?

        # The reason for this instance refresh rollback (for example, whether a manual or automatic rollback
        # was initiated).

        @[JSON::Field(key: "RollbackReason")]
        getter rollback_reason : String?

        # The date and time at which the rollback began.

        @[JSON::Field(key: "RollbackStartTime")]
        getter rollback_start_time : Time?

        def initialize(
          @instances_to_update_on_rollback : Int32? = nil,
          @percentage_complete_on_rollback : Int32? = nil,
          @progress_details_on_rollback : Types::InstanceRefreshProgressDetails? = nil,
          @rollback_reason : String? = nil,
          @rollback_start_time : Time? = nil
        )
        end
      end


      struct RollbackInstanceRefreshAnswer
        include JSON::Serializable

        # The instance refresh ID associated with the request. This is the unique ID assigned to the instance
        # refresh when it was started.

        @[JSON::Field(key: "InstanceRefreshId")]
        getter instance_refresh_id : String?

        def initialize(
          @instance_refresh_id : String? = nil
        )
        end
      end


      struct RollbackInstanceRefreshType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        def initialize(
          @auto_scaling_group_name : String
        )
        end
      end

      # The operation can't be performed because there are scaling activities in progress.

      struct ScalingActivityInProgressFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a scaling policy.

      struct ScalingPolicy
        include JSON::Serializable

        # Specifies how the scaling adjustment is interpreted (for example, an absolute number or a
        # percentage). The valid values are ChangeInCapacity , ExactCapacity , and PercentChangeInCapacity .

        @[JSON::Field(key: "AdjustmentType")]
        getter adjustment_type : String?

        # The CloudWatch alarms related to the policy.

        @[JSON::Field(key: "Alarms")]
        getter alarms : Array(Types::Alarm)?

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # The duration of the policy's cooldown period, in seconds.

        @[JSON::Field(key: "Cooldown")]
        getter cooldown : Int32?

        # Indicates whether the policy is enabled ( true ) or disabled ( false ).

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch
        # metrics.

        @[JSON::Field(key: "EstimatedInstanceWarmup")]
        getter estimated_instance_warmup : Int32?

        # The aggregation type for the CloudWatch metrics. The valid values are Minimum , Maximum , and
        # Average .

        @[JSON::Field(key: "MetricAggregationType")]
        getter metric_aggregation_type : String?

        # The minimum value to scale by when the adjustment type is PercentChangeInCapacity .

        @[JSON::Field(key: "MinAdjustmentMagnitude")]
        getter min_adjustment_magnitude : Int32?

        # Available for backward compatibility. Use MinAdjustmentMagnitude instead.

        @[JSON::Field(key: "MinAdjustmentStep")]
        getter min_adjustment_step : Int32?

        # The Amazon Resource Name (ARN) of the policy.

        @[JSON::Field(key: "PolicyARN")]
        getter policy_arn : String?

        # The name of the scaling policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # One of the following policy types: TargetTrackingScaling StepScaling SimpleScaling (default)
        # PredictiveScaling For more information, see Target tracking scaling policies and Step and simple
        # scaling policies in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # A predictive scaling policy.

        @[JSON::Field(key: "PredictiveScalingConfiguration")]
        getter predictive_scaling_configuration : Types::PredictiveScalingConfiguration?

        # The amount by which to scale, based on the specified adjustment type. A positive value adds to the
        # current capacity while a negative number removes from the current capacity.

        @[JSON::Field(key: "ScalingAdjustment")]
        getter scaling_adjustment : Int32?

        # A set of adjustments that enable you to scale based on the size of the alarm breach.

        @[JSON::Field(key: "StepAdjustments")]
        getter step_adjustments : Array(Types::StepAdjustment)?

        # A target tracking scaling policy.

        @[JSON::Field(key: "TargetTrackingConfiguration")]
        getter target_tracking_configuration : Types::TargetTrackingConfiguration?

        def initialize(
          @adjustment_type : String? = nil,
          @alarms : Array(Types::Alarm)? = nil,
          @auto_scaling_group_name : String? = nil,
          @cooldown : Int32? = nil,
          @enabled : Bool? = nil,
          @estimated_instance_warmup : Int32? = nil,
          @metric_aggregation_type : String? = nil,
          @min_adjustment_magnitude : Int32? = nil,
          @min_adjustment_step : Int32? = nil,
          @policy_arn : String? = nil,
          @policy_name : String? = nil,
          @policy_type : String? = nil,
          @predictive_scaling_configuration : Types::PredictiveScalingConfiguration? = nil,
          @scaling_adjustment : Int32? = nil,
          @step_adjustments : Array(Types::StepAdjustment)? = nil,
          @target_tracking_configuration : Types::TargetTrackingConfiguration? = nil
        )
        end
      end


      struct ScalingProcessQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # One or more of the following processes: Launch Terminate AddToLoadBalancer AlarmNotification
        # AZRebalance HealthCheck InstanceRefresh ReplaceUnhealthy ScheduledActions If you omit this property,
        # all processes are specified.

        @[JSON::Field(key: "ScalingProcesses")]
        getter scaling_processes : Array(String)?

        def initialize(
          @auto_scaling_group_name : String,
          @scaling_processes : Array(String)? = nil
        )
        end
      end


      struct ScheduledActionsType
        include JSON::Serializable

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The scheduled actions.

        @[JSON::Field(key: "ScheduledUpdateGroupActions")]
        getter scheduled_update_group_actions : Array(Types::ScheduledUpdateGroupAction)?

        def initialize(
          @next_token : String? = nil,
          @scheduled_update_group_actions : Array(Types::ScheduledUpdateGroupAction)? = nil
        )
        end
      end

      # Describes a scheduled scaling action.

      struct ScheduledUpdateGroupAction
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action
        # runs and the capacity it attempts to maintain.

        @[JSON::Field(key: "DesiredCapacity")]
        getter desired_capacity : Int32?

        # The date and time in UTC for the recurring schedule to end. For example, "2019-06-01T00:00:00Z" .

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The maximum size of the Auto Scaling group.

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32?

        # The minimum size of the Auto Scaling group.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # The recurring schedule for the action, in Unix cron syntax format. When StartTime and EndTime are
        # specified with Recurrence , they form the boundaries of when the recurring action starts and stops.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : String?

        # The Amazon Resource Name (ARN) of the scheduled action.

        @[JSON::Field(key: "ScheduledActionARN")]
        getter scheduled_action_arn : String?

        # The name of the scheduled action.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String?

        # The date and time in UTC for this action to start. For example, "2019-06-01T00:00:00Z" .

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # This property is no longer used.

        @[JSON::Field(key: "Time")]
        getter time : Time?

        # The time zone for the cron expression.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : String?

        def initialize(
          @auto_scaling_group_name : String? = nil,
          @desired_capacity : Int32? = nil,
          @end_time : Time? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil,
          @recurrence : String? = nil,
          @scheduled_action_arn : String? = nil,
          @scheduled_action_name : String? = nil,
          @start_time : Time? = nil,
          @time : Time? = nil,
          @time_zone : String? = nil
        )
        end
      end

      # Describes information used for one or more scheduled scaling action updates in a
      # BatchPutScheduledUpdateGroupAction operation.

      struct ScheduledUpdateGroupActionRequest
        include JSON::Serializable

        # The name of the scaling action.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action
        # runs and the capacity it attempts to maintain.

        @[JSON::Field(key: "DesiredCapacity")]
        getter desired_capacity : Int32?

        # The date and time for the recurring schedule to end, in UTC.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The maximum size of the Auto Scaling group.

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32?

        # The minimum size of the Auto Scaling group.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # The recurring schedule for the action, in Unix cron syntax format. This format consists of five
        # fields separated by white spaces: [Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week]. The
        # value must be in quotes (for example, "30 0 1 1,6,12 *" ). For more information about this format,
        # see Crontab . When StartTime and EndTime are specified with Recurrence , they form the boundaries of
        # when the recurring action starts and stops. Cron expressions use Universal Coordinated Time (UTC) by
        # default.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : String?

        # The date and time for the action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in
        # quotes (for example, "2019-06-01T00:00:00Z" ). If you specify Recurrence and StartTime , Amazon EC2
        # Auto Scaling performs the action at this time, and then performs the action based on the specified
        # recurrence. If you try to schedule the action in the past, Amazon EC2 Auto Scaling returns an error
        # message.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # Specifies the time zone for a cron expression. If a time zone is not provided, UTC is used by
        # default. Valid values are the canonical names of the IANA time zones, derived from the IANA Time
        # Zone Database (such as Etc/GMT+9 or Pacific/Tahiti ). For more information, see
        # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones .

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : String?

        def initialize(
          @scheduled_action_name : String,
          @desired_capacity : Int32? = nil,
          @end_time : Time? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil,
          @recurrence : String? = nil,
          @start_time : Time? = nil,
          @time_zone : String? = nil
        )
        end
      end

      # The service-linked role is not yet ready for use.

      struct ServiceLinkedRoleFailure
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SetDesiredCapacityType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The desired capacity is the initial capacity of the Auto Scaling group after this operation
        # completes and the capacity it attempts to maintain.

        @[JSON::Field(key: "DesiredCapacity")]
        getter desired_capacity : Int32

        # Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete before
        # initiating a scaling activity to set your Auto Scaling group to its new capacity. By default, Amazon
        # EC2 Auto Scaling does not honor the cooldown period during manual scaling activities.

        @[JSON::Field(key: "HonorCooldown")]
        getter honor_cooldown : Bool?

        def initialize(
          @auto_scaling_group_name : String,
          @desired_capacity : Int32,
          @honor_cooldown : Bool? = nil
        )
        end
      end


      struct SetInstanceHealthQuery
        include JSON::Serializable

        # The health status of the instance. Set to Healthy to have the instance remain in service. Set to
        # Unhealthy to have the instance be out of service. Amazon EC2 Auto Scaling terminates and replaces
        # the unhealthy instance.

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # If the Auto Scaling group of the specified instance has a HealthCheckGracePeriod specified for the
        # group, by default, this call respects the grace period. Set this to False , to have the call not
        # respect the grace period associated with the group. For more information about the health check
        # grace period, see Set the health check grace period for an Auto Scaling group in the Amazon EC2 Auto
        # Scaling User Guide .

        @[JSON::Field(key: "ShouldRespectGracePeriod")]
        getter should_respect_grace_period : Bool?

        def initialize(
          @health_status : String,
          @instance_id : String,
          @should_respect_grace_period : Bool? = nil
        )
        end
      end


      struct SetInstanceProtectionAnswer
        include JSON::Serializable

        def initialize
        end
      end


      struct SetInstanceProtectionQuery
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # One or more instance IDs. You can specify up to 50 instances.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)

        # Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling
        # in.

        @[JSON::Field(key: "ProtectedFromScaleIn")]
        getter protected_from_scale_in : Bool

        def initialize(
          @auto_scaling_group_name : String,
          @instance_ids : Array(String),
          @protected_from_scale_in : Bool
        )
        end
      end


      struct StartInstanceRefreshAnswer
        include JSON::Serializable

        # A unique ID for tracking the progress of the instance refresh.

        @[JSON::Field(key: "InstanceRefreshId")]
        getter instance_refresh_id : String?

        def initialize(
          @instance_refresh_id : String? = nil
        )
        end
      end


      struct StartInstanceRefreshType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The desired configuration. For example, the desired configuration can specify a new launch template
        # or a new version of the current launch template. Once the instance refresh succeeds, Amazon EC2 Auto
        # Scaling updates the settings of the Auto Scaling group to reflect the new desired configuration.
        # When you specify a new launch template or a new version of the current launch template for your
        # desired configuration, consider enabling the SkipMatching property in preferences. If it's enabled,
        # Amazon EC2 Auto Scaling skips replacing instances that already use the specified launch template and
        # instance types. This can help you reduce the number of replacements that are required to apply
        # updates.

        @[JSON::Field(key: "DesiredConfiguration")]
        getter desired_configuration : Types::DesiredConfiguration?

        # Sets your preferences for the instance refresh so that it performs as expected when you start it.
        # Includes the instance warmup time, the minimum and maximum healthy percentages, and the behaviors
        # that you want Amazon EC2 Auto Scaling to use if instances that are in Standby state or protected
        # from scale in are found. You can also choose to enable additional features, such as the following:
        # Auto rollback Checkpoints CloudWatch alarms Skip matching Bake time

        @[JSON::Field(key: "Preferences")]
        getter preferences : Types::RefreshPreferences?

        # The strategy to use for the instance refresh. The only valid value is Rolling .

        @[JSON::Field(key: "Strategy")]
        getter strategy : String?

        def initialize(
          @auto_scaling_group_name : String,
          @desired_configuration : Types::DesiredConfiguration? = nil,
          @preferences : Types::RefreshPreferences? = nil,
          @strategy : String? = nil
        )
        end
      end

      # Describes information used to create a step adjustment for a step scaling policy. For the following
      # examples, suppose that you have an alarm with a breach threshold of 50: To trigger the adjustment
      # when the metric is greater than or equal to 50 and less than 60, specify a lower bound of 0 and an
      # upper bound of 10. To trigger the adjustment when the metric is greater than 40 and less than or
      # equal to 50, specify a lower bound of -10 and an upper bound of 0. There are a few rules for the
      # step adjustments for your step policy: The ranges of your step adjustments can't overlap or have a
      # gap. At most, one step adjustment can have a null lower bound. If one step adjustment has a negative
      # lower bound, then there must be a step adjustment with a null lower bound. At most, one step
      # adjustment can have a null upper bound. If one step adjustment has a positive upper bound, then
      # there must be a step adjustment with a null upper bound. The upper and lower bound can't be null in
      # the same step adjustment. For more information, see Step adjustments in the Amazon EC2 Auto Scaling
      # User Guide .

      struct StepAdjustment
        include JSON::Serializable

        # The amount by which to scale, based on the specified adjustment type. A positive value adds to the
        # current capacity while a negative number removes from the current capacity. For exact capacity, you
        # must specify a non-negative value.

        @[JSON::Field(key: "ScalingAdjustment")]
        getter scaling_adjustment : Int32

        # The lower bound for the difference between the alarm threshold and the CloudWatch metric. If the
        # metric value is above the breach threshold, the lower bound is inclusive (the metric must be greater
        # than or equal to the threshold plus the lower bound). Otherwise, it is exclusive (the metric must be
        # greater than the threshold plus the lower bound). A null value indicates negative infinity.

        @[JSON::Field(key: "MetricIntervalLowerBound")]
        getter metric_interval_lower_bound : Float64?

        # The upper bound for the difference between the alarm threshold and the CloudWatch metric. If the
        # metric value is above the breach threshold, the upper bound is exclusive (the metric must be less
        # than the threshold plus the upper bound). Otherwise, it is inclusive (the metric must be less than
        # or equal to the threshold plus the upper bound). A null value indicates positive infinity. The upper
        # bound must be greater than the lower bound.

        @[JSON::Field(key: "MetricIntervalUpperBound")]
        getter metric_interval_upper_bound : Float64?

        def initialize(
          @scaling_adjustment : Int32,
          @metric_interval_lower_bound : Float64? = nil,
          @metric_interval_upper_bound : Float64? = nil
        )
        end
      end

      # Describes an auto scaling process that has been suspended. For more information, see Types of
      # processes in the Amazon EC2 Auto Scaling User Guide .

      struct SuspendedProcess
        include JSON::Serializable

        # The name of the suspended process.

        @[JSON::Field(key: "ProcessName")]
        getter process_name : String?

        # The reason that the process was suspended.

        @[JSON::Field(key: "SuspensionReason")]
        getter suspension_reason : String?

        def initialize(
          @process_name : String? = nil,
          @suspension_reason : String? = nil
        )
        end
      end

      # Describes a tag for an Auto Scaling group.

      struct Tag
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Determines whether the tag is added to new instances as they are launched in the group.

        @[JSON::Field(key: "PropagateAtLaunch")]
        getter propagate_at_launch : Bool?

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource. The only supported value is auto-scaling-group .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The tag value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @propagate_at_launch : Bool? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Describes a tag for an Auto Scaling group.

      struct TagDescription
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Determines whether the tag is added to new instances as they are launched in the group.

        @[JSON::Field(key: "PropagateAtLaunch")]
        getter propagate_at_launch : Bool?

        # The name of the group.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource. The only supported value is auto-scaling-group .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The tag value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @propagate_at_launch : Bool? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct TagsType
        include JSON::Serializable

        # A string that indicates that the response contains more items than can be returned in a single
        # response. To receive additional items, specify this string for the NextToken value when requesting
        # the next set of items. This value is null when there are no more items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # One or more tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagDescription)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::TagDescription)? = nil
        )
        end
      end

      # Represents a target tracking scaling policy configuration to use with Amazon EC2 Auto Scaling.

      struct TargetTrackingConfiguration
        include JSON::Serializable

        # The target value for the metric. Some metrics are based on a count instead of a percentage, such as
        # the request count for an Application Load Balancer or the number of messages in an SQS queue. If the
        # scaling policy specifies one of these metrics, specify the target utilization as the optimal average
        # request or message count per instance during any one-minute interval.

        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        # A customized metric. You must specify either a predefined metric or a customized metric.

        @[JSON::Field(key: "CustomizedMetricSpecification")]
        getter customized_metric_specification : Types::CustomizedMetricSpecification?

        # Indicates whether scaling in by the target tracking scaling policy is disabled. If scaling in is
        # disabled, the target tracking scaling policy doesn't remove instances from the Auto Scaling group.
        # Otherwise, the target tracking scaling policy can remove instances from the Auto Scaling group. The
        # default is false .

        @[JSON::Field(key: "DisableScaleIn")]
        getter disable_scale_in : Bool?

        # A predefined metric. You must specify either a predefined metric or a customized metric.

        @[JSON::Field(key: "PredefinedMetricSpecification")]
        getter predefined_metric_specification : Types::PredefinedMetricSpecification?

        def initialize(
          @target_value : Float64,
          @customized_metric_specification : Types::CustomizedMetricSpecification? = nil,
          @disable_scale_in : Bool? = nil,
          @predefined_metric_specification : Types::PredefinedMetricSpecification? = nil
        )
        end
      end

      # The metric data to return. Also defines whether this call is returning data for one metric only, or
      # whether it is performing a math expression on the values of returned metric statistics to create a
      # new time series. A time series is a series of data points, each of which is associated with a
      # timestamp.

      struct TargetTrackingMetricDataQuery
        include JSON::Serializable

        # A short name that identifies the object's results in the response. This name must be unique among
        # all TargetTrackingMetricDataQuery objects specified for a single scaling policy. If you are
        # performing math expressions on this set of data, this name represents that data and can serve as a
        # variable in the mathematical expression. The valid characters are letters, numbers, and underscores.
        # The first character must be a lowercase letter.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The math expression to perform on the returned data, if this object is performing a math expression.
        # This expression can use the Id of the other metrics to refer to those metrics, and can also use the
        # Id of other expressions to use the result of those expressions. Conditional: Within each
        # TargetTrackingMetricDataQuery object, you must specify either Expression or MetricStat , but not
        # both.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # A human-readable label for this metric or expression. This is especially useful if this is a math
        # expression, so that you know what the value represents.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # Information about the metric data to return. Conditional: Within each TargetTrackingMetricDataQuery
        # object, you must specify either Expression or MetricStat , but not both.

        @[JSON::Field(key: "MetricStat")]
        getter metric_stat : Types::TargetTrackingMetricStat?

        # The period of the metric in seconds. The default value is 60. Accepted values are 10, 30, and 60.
        # For high resolution metric, set the value to less than 60. For more information, see Create a target
        # tracking policy using high-resolution metrics for faster response .

        @[JSON::Field(key: "Period")]
        getter period : Int32?

        # Indicates whether to return the timestamps and raw data values of this metric. If you use any math
        # expressions, specify true for this value for only the final math expression that the metric
        # specification is based on. You must specify false for ReturnData for all the other metrics and
        # expressions used in the metric specification. If you are only retrieving metrics and not performing
        # any math expressions, do not specify anything for ReturnData . This sets it to its default ( true ).

        @[JSON::Field(key: "ReturnData")]
        getter return_data : Bool?

        def initialize(
          @id : String,
          @expression : String? = nil,
          @label : String? = nil,
          @metric_stat : Types::TargetTrackingMetricStat? = nil,
          @period : Int32? = nil,
          @return_data : Bool? = nil
        )
        end
      end

      # This structure defines the CloudWatch metric to return, along with the statistic and unit. For more
      # information about the CloudWatch terminology below, see Amazon CloudWatch concepts in the Amazon
      # CloudWatch User Guide .

      struct TargetTrackingMetricStat
        include JSON::Serializable

        # The metric to use.

        @[JSON::Field(key: "Metric")]
        getter metric : Types::Metric

        # The statistic to return. It can include any CloudWatch statistic or extended statistic. For a list
        # of valid values, see the table in Statistics in the Amazon CloudWatch User Guide . The most commonly
        # used metric for scaling is Average .

        @[JSON::Field(key: "Stat")]
        getter stat : String

        # The period of the metric in seconds. The default value is 60. Accepted values are 10, 30, and 60.
        # For high resolution metric, set the value to less than 60. For more information, see Create a target
        # tracking policy using high-resolution metrics for faster response .

        @[JSON::Field(key: "Period")]
        getter period : Int32?

        # The unit to use for the returned data points. For a complete list of the units that CloudWatch
        # supports, see the MetricDatum data type in the Amazon CloudWatch API Reference .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric : Types::Metric,
          @stat : String,
          @period : Int32? = nil,
          @unit : String? = nil
        )
        end
      end


      struct TerminateInstanceInAutoScalingGroupType
        include JSON::Serializable

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # Indicates whether terminating the instance also decrements the size of the Auto Scaling group.

        @[JSON::Field(key: "ShouldDecrementDesiredCapacity")]
        getter should_decrement_desired_capacity : Bool

        def initialize(
          @instance_id : String,
          @should_decrement_desired_capacity : Bool
        )
        end
      end

      # Specifies the minimum and maximum for the TotalLocalStorageGB object when you specify
      # InstanceRequirements for an Auto Scaling group.

      struct TotalLocalStorageGBRequest
        include JSON::Serializable

        # The storage maximum in GB.

        @[JSON::Field(key: "Max")]
        getter max : Float64?

        # The storage minimum in GB.

        @[JSON::Field(key: "Min")]
        getter min : Float64?

        def initialize(
          @max : Float64? = nil,
          @min : Float64? = nil
        )
        end
      end

      # Identifying information for a traffic source.

      struct TrafficSourceIdentifier
        include JSON::Serializable

        # Identifies the traffic source. For Application Load Balancers, Gateway Load Balancers, Network Load
        # Balancers, and VPC Lattice, this will be the Amazon Resource Name (ARN) for a target group in this
        # account and Region. For Classic Load Balancers, this will be the name of the Classic Load Balancer
        # in this account and Region. For example: Application Load Balancer ARN:
        # arn:aws:elasticloadbalancing:us-west-2:123456789012:targetgroup/my-targets/1234567890123456 Classic
        # Load Balancer name: my-classic-load-balancer VPC Lattice ARN:
        # arn:aws:vpc-lattice:us-west-2:123456789012:targetgroup/tg-1234567890123456 To get the ARN of a
        # target group for a Application Load Balancer, Gateway Load Balancer, or Network Load Balancer, or
        # the name of a Classic Load Balancer, use the Elastic Load Balancing DescribeTargetGroups and
        # DescribeLoadBalancers API operations. To get the ARN of a target group for VPC Lattice, use the VPC
        # Lattice GetTargetGroup API operation.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Provides additional context for the value of Identifier . The following lists the valid values: elb
        # if Identifier is the name of a Classic Load Balancer. elbv2 if Identifier is the ARN of an
        # Application Load Balancer, Gateway Load Balancer, or Network Load Balancer target group. vpc-lattice
        # if Identifier is the ARN of a VPC Lattice target group. Required if the identifier is the name of a
        # Classic Load Balancer.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @identifier : String,
          @type : String? = nil
        )
        end
      end

      # Describes the state of a traffic source.

      struct TrafficSourceState
        include JSON::Serializable

        # The unique identifier of the traffic source.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Describes the current state of a traffic source. The state values are as follows: Adding - The Auto
        # Scaling instances are being registered with the load balancer or target group. Added - All Auto
        # Scaling instances are registered with the load balancer or target group. InService - For an Elastic
        # Load Balancing load balancer or target group, at least one Auto Scaling instance passed an ELB
        # health check. For VPC Lattice, at least one Auto Scaling instance passed an VPC_LATTICE health
        # check. Removing - The Auto Scaling instances are being deregistered from the load balancer or target
        # group. If connection draining (deregistration delay) is enabled, Elastic Load Balancing or VPC
        # Lattice waits for in-flight requests to complete before deregistering the instances. Removed - All
        # Auto Scaling instances are deregistered from the load balancer or target group.

        @[JSON::Field(key: "State")]
        getter state : String?

        # This is replaced by Identifier .

        @[JSON::Field(key: "TrafficSource")]
        getter traffic_source : String?

        # Provides additional context for the value of Identifier . The following lists the valid values: elb
        # if Identifier is the name of a Classic Load Balancer. elbv2 if Identifier is the ARN of an
        # Application Load Balancer, Gateway Load Balancer, or Network Load Balancer target group. vpc-lattice
        # if Identifier is the ARN of a VPC Lattice target group. Required if the identifier is the name of a
        # Classic Load Balancer.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @identifier : String? = nil,
          @state : String? = nil,
          @traffic_source : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct UpdateAutoScalingGroupType
        include JSON::Serializable

        # The name of the Auto Scaling group.

        @[JSON::Field(key: "AutoScalingGroupName")]
        getter auto_scaling_group_name : String

        # The instance capacity distribution across Availability Zones.

        @[JSON::Field(key: "AvailabilityZoneDistribution")]
        getter availability_zone_distribution : Types::AvailabilityZoneDistribution?

        # The policy for Availability Zone impairment.

        @[JSON::Field(key: "AvailabilityZoneImpairmentPolicy")]
        getter availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy?

        # One or more Availability Zones for the group.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Enables or disables Capacity Rebalancing. If Capacity Rebalancing is disabled, proactive replacement
        # of at-risk Spot Instances does not occur. For more information, see Capacity Rebalancing in Auto
        # Scaling to replace at-risk Spot Instances in the Amazon EC2 Auto Scaling User Guide . To suspend
        # rebalancing across Availability Zones, use the SuspendProcesses API.

        @[JSON::Field(key: "CapacityRebalance")]
        getter capacity_rebalance : Bool?

        # The capacity reservation specification for the Auto Scaling group.

        @[JSON::Field(key: "CapacityReservationSpecification")]
        getter capacity_reservation_specification : Types::CapacityReservationSpecification?

        # Reserved.

        @[JSON::Field(key: "Context")]
        getter context : String?

        # Only needed if you use simple scaling policies. The amount of time, in seconds, between one scaling
        # activity ending and another one starting due to simple scaling policies. For more information, see
        # Scaling cooldowns for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "DefaultCooldown")]
        getter default_cooldown : Int32?

        # The amount of time, in seconds, until a new instance is considered to have finished initializing and
        # resource consumption to become stable after it enters the InService state. During an instance
        # refresh, Amazon EC2 Auto Scaling waits for the warm-up period after it replaces an instance before
        # it moves on to replacing the next instance. Amazon EC2 Auto Scaling also waits for the warm-up
        # period before aggregating the metrics for new instances with existing instances in the Amazon
        # CloudWatch metrics that are used for scaling, resulting in more reliable usage data. For more
        # information, see Set the default instance warmup for an Auto Scaling group in the Amazon EC2 Auto
        # Scaling User Guide . To manage various warm-up settings at the group level, we recommend that you
        # set the default instance warmup, even if it is set to 0 seconds . To remove a value that you
        # previously set, include the property but specify -1 for the value. However, we strongly recommend
        # keeping the default instance warmup enabled by specifying a value of 0 or other nominal value.

        @[JSON::Field(key: "DefaultInstanceWarmup")]
        getter default_instance_warmup : Int32?

        # The desired capacity is the initial capacity of the Auto Scaling group after this operation
        # completes and the capacity it attempts to maintain. This number must be greater than or equal to the
        # minimum size of the group and less than or equal to the maximum size of the group.

        @[JSON::Field(key: "DesiredCapacity")]
        getter desired_capacity : Int32?

        # The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling
        # supports DesiredCapacityType for attribute-based instance type selection only. For more information,
        # see Create a mixed instances group using attribute-based instance type selection in the Amazon EC2
        # Auto Scaling User Guide . By default, Amazon EC2 Auto Scaling specifies units , which translates
        # into number of instances. Valid values: units | vcpu | memory-mib

        @[JSON::Field(key: "DesiredCapacityType")]
        getter desired_capacity_type : String?

        # The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status
        # of an EC2 instance that has come into service and marking it unhealthy due to a failed health check.
        # This is useful if your instances do not immediately pass their health checks after they enter the
        # InService state. For more information, see Set the health check grace period for an Auto Scaling
        # group in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "HealthCheckGracePeriod")]
        getter health_check_grace_period : Int32?

        # A comma-separated value string of one or more health check types. The valid values are EC2 , EBS ,
        # ELB , and VPC_LATTICE . EC2 is the default health check and cannot be disabled. For more
        # information, see Health checks for instances in an Auto Scaling group in the Amazon EC2 Auto Scaling
        # User Guide . Only specify EC2 if you must clear a value that was previously set.

        @[JSON::Field(key: "HealthCheckType")]
        getter health_check_type : String?

        # The instance lifecycle policy for the Auto Scaling group. Use this to add, modify, or remove
        # lifecycle policies that control instance behavior when an instance transitions through its lifecycle
        # states. Configure retention triggers to specify when to preserve instances for manual intervention.

        @[JSON::Field(key: "InstanceLifecyclePolicy")]
        getter instance_lifecycle_policy : Types::InstanceLifecyclePolicy?

        # An instance maintenance policy. For more information, see Set instance maintenance policy in the
        # Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "InstanceMaintenancePolicy")]
        getter instance_maintenance_policy : Types::InstanceMaintenancePolicy?

        # The name of the launch configuration. If you specify LaunchConfigurationName in your update request,
        # you can't specify LaunchTemplate or MixedInstancesPolicy .

        @[JSON::Field(key: "LaunchConfigurationName")]
        getter launch_configuration_name : String?

        # The launch template and version to use to specify the updates. If you specify LaunchTemplate in your
        # update request, you can't specify LaunchConfigurationName or MixedInstancesPolicy .

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The maximum amount of time, in seconds, that an instance can be in service. The default is null. If
        # specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day).
        # To clear a previously set value, specify a new value of 0. For more information, see Replacing Auto
        # Scaling instances based on maximum instance lifetime in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "MaxInstanceLifetime")]
        getter max_instance_lifetime : Int32?

        # The maximum size of the Auto Scaling group. With a mixed instances policy that uses instance
        # weighting, Amazon EC2 Auto Scaling may need to go above MaxSize to meet your capacity requirements.
        # In this event, Amazon EC2 Auto Scaling will never go above MaxSize by more than your largest
        # instance weight (weights that define how many units each instance contributes to the desired
        # capacity of the group).

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32?

        # The minimum size of the Auto Scaling group.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # The mixed instances policy. For more information, see Auto Scaling groups with multiple instance
        # types and purchase options in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "MixedInstancesPolicy")]
        getter mixed_instances_policy : Types::MixedInstancesPolicy?

        # Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling
        # when scaling in. For more information about preventing instances from terminating on scale in, see
        # Use instance scale-in protection in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "NewInstancesProtectedFromScaleIn")]
        getter new_instances_protected_from_scale_in : Bool?

        # The name of an existing placement group into which to launch your instances. To remove the placement
        # group setting, pass an empty string for placement-group . For more information about placement
        # groups, see Placement groups in the Amazon EC2 User Guide . A cluster placement group is a logical
        # grouping of instances within a single Availability Zone. You cannot specify multiple Availability
        # Zones and a cluster placement group.

        @[JSON::Field(key: "PlacementGroup")]
        getter placement_group : String?

        # The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call
        # other Amazon Web Services on your behalf. For more information, see Service-linked roles in the
        # Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "ServiceLinkedRoleARN")]
        getter service_linked_role_arn : String?

        # If you enable zonal shift with cross-zone disabled load balancers, capacity could become imbalanced
        # across Availability Zones. To skip the validation, specify true . For more information, see Auto
        # Scaling group zonal shift in the Amazon EC2 Auto Scaling User Guide .

        @[JSON::Field(key: "SkipZonalShiftValidation")]
        getter skip_zonal_shift_validation : Bool?

        # A policy or a list of policies that are used to select the instances to terminate. The policies are
        # executed in the order that you list them. For more information, see Configure termination policies
        # for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide . Valid values: Default |
        # AllocationStrategy | ClosestToNextInstanceHour | NewestInstance | OldestInstance |
        # OldestLaunchConfiguration | OldestLaunchTemplate |
        # arn:aws:lambda:region:account-id:function:my-function:my-alias

        @[JSON::Field(key: "TerminationPolicies")]
        getter termination_policies : Array(String)?

        # A comma-separated list of subnet IDs for a virtual private cloud (VPC). If you specify
        # VPCZoneIdentifier with AvailabilityZones , the subnets that you specify must reside in those
        # Availability Zones.

        @[JSON::Field(key: "VPCZoneIdentifier")]
        getter vpc_zone_identifier : String?

        def initialize(
          @auto_scaling_group_name : String,
          @availability_zone_distribution : Types::AvailabilityZoneDistribution? = nil,
          @availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy? = nil,
          @availability_zones : Array(String)? = nil,
          @capacity_rebalance : Bool? = nil,
          @capacity_reservation_specification : Types::CapacityReservationSpecification? = nil,
          @context : String? = nil,
          @default_cooldown : Int32? = nil,
          @default_instance_warmup : Int32? = nil,
          @desired_capacity : Int32? = nil,
          @desired_capacity_type : String? = nil,
          @health_check_grace_period : Int32? = nil,
          @health_check_type : String? = nil,
          @instance_lifecycle_policy : Types::InstanceLifecyclePolicy? = nil,
          @instance_maintenance_policy : Types::InstanceMaintenancePolicy? = nil,
          @launch_configuration_name : String? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @max_instance_lifetime : Int32? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil,
          @mixed_instances_policy : Types::MixedInstancesPolicy? = nil,
          @new_instances_protected_from_scale_in : Bool? = nil,
          @placement_group : String? = nil,
          @service_linked_role_arn : String? = nil,
          @skip_zonal_shift_validation : Bool? = nil,
          @termination_policies : Array(String)? = nil,
          @vpc_zone_identifier : String? = nil
        )
        end
      end

      # Specifies the minimum and maximum for the VCpuCount object when you specify InstanceRequirements for
      # an Auto Scaling group.

      struct VCpuCountRequest
        include JSON::Serializable

        # The minimum number of vCPUs.

        @[JSON::Field(key: "Min")]
        getter min : Int32

        # The maximum number of vCPUs.

        @[JSON::Field(key: "Max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # Describes a warm pool configuration.

      struct WarmPoolConfiguration
        include JSON::Serializable

        # The instance reuse policy.

        @[JSON::Field(key: "InstanceReusePolicy")]
        getter instance_reuse_policy : Types::InstanceReusePolicy?

        # The maximum number of instances that are allowed to be in the warm pool or in any state except
        # Terminated for the Auto Scaling group.

        @[JSON::Field(key: "MaxGroupPreparedCapacity")]
        getter max_group_prepared_capacity : Int32?

        # The minimum number of instances to maintain in the warm pool.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # The instance state to transition to after the lifecycle actions are complete.

        @[JSON::Field(key: "PoolState")]
        getter pool_state : String?

        # The status of a warm pool that is marked for deletion.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @instance_reuse_policy : Types::InstanceReusePolicy? = nil,
          @max_group_prepared_capacity : Int32? = nil,
          @min_size : Int32? = nil,
          @pool_state : String? = nil,
          @status : String? = nil
        )
        end
      end
    end
  end
end
