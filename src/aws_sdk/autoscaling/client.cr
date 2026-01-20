module AwsSdk
  module AutoScaling
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Attaches one or more EC2 instances to the specified Auto Scaling group. When you attach instances,
      # Amazon EC2 Auto Scaling increases the desired capacity of the group by the number of instances being
      # attached. If the number of instances being attached plus the desired capacity of the group exceeds
      # the maximum size of the group, the operation fails. If there is a Classic Load Balancer attached to
      # your Auto Scaling group, the instances are also registered with the load balancer. If there are
      # target groups attached to your Auto Scaling group, the instances are also registered with the target
      # groups. For more information, see Detach or attach instances in the Amazon EC2 Auto Scaling User
      # Guide .

      def attach_instances(
        auto_scaling_group_name : String,
        instance_ids : Array(String)? = nil
      ) : Nil

        input = Types::AttachInstancesQuery.new(auto_scaling_group_name: auto_scaling_group_name, instance_ids: instance_ids)
        attach_instances(input)
      end

      def attach_instances(input : Types::AttachInstancesQuery) : Nil
        request = Protocol::Query.build_request(Model::ATTACH_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # This API operation is superseded by AttachTrafficSources , which can attach multiple traffic sources
      # types. We recommend using AttachTrafficSources to simplify how you manage traffic sources. However,
      # we continue to support AttachLoadBalancerTargetGroups . You can use both the original
      # AttachLoadBalancerTargetGroups API operation and AttachTrafficSources on the same Auto Scaling
      # group. Attaches one or more target groups to the specified Auto Scaling group. This operation is
      # used with the following load balancer types: Application Load Balancer - Operates at the application
      # layer (layer 7) and supports HTTP and HTTPS. Network Load Balancer - Operates at the transport layer
      # (layer 4) and supports TCP, TLS, and UDP. Gateway Load Balancer - Operates at the network layer
      # (layer 3). To describe the target groups for an Auto Scaling group, call the
      # DescribeLoadBalancerTargetGroups API. To detach the target group from the Auto Scaling group, call
      # the DetachLoadBalancerTargetGroups API. This operation is additive and does not detach existing
      # target groups or Classic Load Balancers from the Auto Scaling group. For more information, see Use
      # Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group in the
      # Amazon EC2 Auto Scaling User Guide .

      def attach_load_balancer_target_groups(
        auto_scaling_group_name : String,
        target_group_ar_ns : Array(String)
      ) : Types::AttachLoadBalancerTargetGroupsResultType

        input = Types::AttachLoadBalancerTargetGroupsType.new(auto_scaling_group_name: auto_scaling_group_name, target_group_ar_ns: target_group_ar_ns)
        attach_load_balancer_target_groups(input)
      end

      def attach_load_balancer_target_groups(input : Types::AttachLoadBalancerTargetGroupsType) : Types::AttachLoadBalancerTargetGroupsResultType
        request = Protocol::Query.build_request(Model::ATTACH_LOAD_BALANCER_TARGET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AttachLoadBalancerTargetGroupsResultType, "AttachLoadBalancerTargetGroups")
      end

      # This API operation is superseded by
      # https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html , which can
      # attach multiple traffic sources types. We recommend using AttachTrafficSources to simplify how you
      # manage traffic sources. However, we continue to support AttachLoadBalancers . You can use both the
      # original AttachLoadBalancers API operation and AttachTrafficSources on the same Auto Scaling group.
      # Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 Auto
      # Scaling registers the running instances with these Classic Load Balancers. To describe the load
      # balancers for an Auto Scaling group, call the DescribeLoadBalancers API. To detach a load balancer
      # from the Auto Scaling group, call the DetachLoadBalancers API. This operation is additive and does
      # not detach existing Classic Load Balancers or target groups from the Auto Scaling group. For more
      # information, see Use Elastic Load Balancing to distribute traffic across the instances in your Auto
      # Scaling group in the Amazon EC2 Auto Scaling User Guide .

      def attach_load_balancers(
        auto_scaling_group_name : String,
        load_balancer_names : Array(String)
      ) : Types::AttachLoadBalancersResultType

        input = Types::AttachLoadBalancersType.new(auto_scaling_group_name: auto_scaling_group_name, load_balancer_names: load_balancer_names)
        attach_load_balancers(input)
      end

      def attach_load_balancers(input : Types::AttachLoadBalancersType) : Types::AttachLoadBalancersResultType
        request = Protocol::Query.build_request(Model::ATTACH_LOAD_BALANCERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AttachLoadBalancersResultType, "AttachLoadBalancers")
      end

      # Attaches one or more traffic sources to the specified Auto Scaling group. You can use any of the
      # following as traffic sources for an Auto Scaling group: Application Load Balancer Classic Load
      # Balancer Gateway Load Balancer Network Load Balancer VPC Lattice This operation is additive and does
      # not detach existing traffic sources from the Auto Scaling group. After the operation completes, use
      # the DescribeTrafficSources API to return details about the state of the attachments between traffic
      # sources and your Auto Scaling group. To detach a traffic source from the Auto Scaling group, call
      # the DetachTrafficSources API.

      def attach_traffic_sources(
        auto_scaling_group_name : String,
        traffic_sources : Array(Types::TrafficSourceIdentifier),
        skip_zonal_shift_validation : Bool? = nil
      ) : Types::AttachTrafficSourcesResultType

        input = Types::AttachTrafficSourcesType.new(auto_scaling_group_name: auto_scaling_group_name, traffic_sources: traffic_sources, skip_zonal_shift_validation: skip_zonal_shift_validation)
        attach_traffic_sources(input)
      end

      def attach_traffic_sources(input : Types::AttachTrafficSourcesType) : Types::AttachTrafficSourcesResultType
        request = Protocol::Query.build_request(Model::ATTACH_TRAFFIC_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AttachTrafficSourcesResultType, "AttachTrafficSources")
      end

      # Deletes one or more scheduled actions for the specified Auto Scaling group.

      def batch_delete_scheduled_action(
        auto_scaling_group_name : String,
        scheduled_action_names : Array(String)
      ) : Types::BatchDeleteScheduledActionAnswer

        input = Types::BatchDeleteScheduledActionType.new(auto_scaling_group_name: auto_scaling_group_name, scheduled_action_names: scheduled_action_names)
        batch_delete_scheduled_action(input)
      end

      def batch_delete_scheduled_action(input : Types::BatchDeleteScheduledActionType) : Types::BatchDeleteScheduledActionAnswer
        request = Protocol::Query.build_request(Model::BATCH_DELETE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::BatchDeleteScheduledActionAnswer, "BatchDeleteScheduledAction")
      end

      # Creates or updates one or more scheduled scaling actions for an Auto Scaling group.

      def batch_put_scheduled_update_group_action(
        auto_scaling_group_name : String,
        scheduled_update_group_actions : Array(Types::ScheduledUpdateGroupActionRequest)
      ) : Types::BatchPutScheduledUpdateGroupActionAnswer

        input = Types::BatchPutScheduledUpdateGroupActionType.new(auto_scaling_group_name: auto_scaling_group_name, scheduled_update_group_actions: scheduled_update_group_actions)
        batch_put_scheduled_update_group_action(input)
      end

      def batch_put_scheduled_update_group_action(input : Types::BatchPutScheduledUpdateGroupActionType) : Types::BatchPutScheduledUpdateGroupActionAnswer
        request = Protocol::Query.build_request(Model::BATCH_PUT_SCHEDULED_UPDATE_GROUP_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::BatchPutScheduledUpdateGroupActionAnswer, "BatchPutScheduledUpdateGroupAction")
      end

      # Cancels an instance refresh or rollback that is in progress. If an instance refresh or rollback is
      # not in progress, an ActiveInstanceRefreshNotFound error occurs. This operation is part of the
      # instance refresh feature in Amazon EC2 Auto Scaling, which helps you update instances in your Auto
      # Scaling group after you make configuration changes. When you cancel an instance refresh, this does
      # not roll back any changes that it made. Use the RollbackInstanceRefresh API to roll back instead.

      def cancel_instance_refresh(
        auto_scaling_group_name : String,
        wait_for_transitioning_instances : Bool? = nil
      ) : Types::CancelInstanceRefreshAnswer

        input = Types::CancelInstanceRefreshType.new(auto_scaling_group_name: auto_scaling_group_name, wait_for_transitioning_instances: wait_for_transitioning_instances)
        cancel_instance_refresh(input)
      end

      def cancel_instance_refresh(input : Types::CancelInstanceRefreshType) : Types::CancelInstanceRefreshAnswer
        request = Protocol::Query.build_request(Model::CANCEL_INSTANCE_REFRESH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CancelInstanceRefreshAnswer, "CancelInstanceRefresh")
      end

      # Completes the lifecycle action for the specified token or instance with the specified result. This
      # step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group: (Optional)
      # Create a launch template or launch configuration with a user data script that runs while an instance
      # is in a wait state due to a lifecycle hook. (Optional) Create a Lambda function and a rule that
      # allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state
      # due to a lifecycle hook. (Optional) Create a notification target and an IAM role. The target can be
      # either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to
      # publish lifecycle notifications to the target. Create the lifecycle hook. Specify whether the hook
      # is used when the instances launch or terminate. If you need more time, record the lifecycle action
      # heartbeat to keep the instance in a wait state. If you finish before the timeout period ends, send a
      # callback by using the CompleteLifecycleAction API call. For more information, see Complete a
      # lifecycle action in the Amazon EC2 Auto Scaling User Guide .

      def complete_lifecycle_action(
        auto_scaling_group_name : String,
        lifecycle_action_result : String,
        lifecycle_hook_name : String,
        instance_id : String? = nil,
        lifecycle_action_token : String? = nil
      ) : Types::CompleteLifecycleActionAnswer

        input = Types::CompleteLifecycleActionType.new(auto_scaling_group_name: auto_scaling_group_name, lifecycle_action_result: lifecycle_action_result, lifecycle_hook_name: lifecycle_hook_name, instance_id: instance_id, lifecycle_action_token: lifecycle_action_token)
        complete_lifecycle_action(input)
      end

      def complete_lifecycle_action(input : Types::CompleteLifecycleActionType) : Types::CompleteLifecycleActionAnswer
        request = Protocol::Query.build_request(Model::COMPLETE_LIFECYCLE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CompleteLifecycleActionAnswer, "CompleteLifecycleAction")
      end

      # We strongly recommend using a launch template when calling this operation to ensure full
      # functionality for Amazon EC2 Auto Scaling and Amazon EC2. Creates an Auto Scaling group with the
      # specified name and attributes. If you exceed your maximum limit of Auto Scaling groups, the call
      # fails. To query this limit, call the DescribeAccountLimits API. For information about updating this
      # limit, see Quotas for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide . If you're
      # new to Amazon EC2 Auto Scaling, see the introductory tutorials in Get started with Amazon EC2 Auto
      # Scaling in the Amazon EC2 Auto Scaling User Guide . Every Auto Scaling group has three size
      # properties ( DesiredCapacity , MaxSize , and MinSize ). Usually, you set these sizes based on a
      # specific number of instances. However, if you configure a mixed instances policy that defines
      # weights for the instance types, you must specify these sizes with the same units that you use for
      # weighting instances.

      def create_auto_scaling_group(
        auto_scaling_group_name : String,
        max_size : Int32,
        min_size : Int32,
        availability_zone_distribution : Types::AvailabilityZoneDistribution? = nil,
        availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy? = nil,
        availability_zones : Array(String)? = nil,
        capacity_rebalance : Bool? = nil,
        capacity_reservation_specification : Types::CapacityReservationSpecification? = nil,
        context : String? = nil,
        default_cooldown : Int32? = nil,
        default_instance_warmup : Int32? = nil,
        desired_capacity : Int32? = nil,
        desired_capacity_type : String? = nil,
        health_check_grace_period : Int32? = nil,
        health_check_type : String? = nil,
        instance_id : String? = nil,
        instance_lifecycle_policy : Types::InstanceLifecyclePolicy? = nil,
        instance_maintenance_policy : Types::InstanceMaintenancePolicy? = nil,
        launch_configuration_name : String? = nil,
        launch_template : Types::LaunchTemplateSpecification? = nil,
        lifecycle_hook_specification_list : Array(Types::LifecycleHookSpecification)? = nil,
        load_balancer_names : Array(String)? = nil,
        max_instance_lifetime : Int32? = nil,
        mixed_instances_policy : Types::MixedInstancesPolicy? = nil,
        new_instances_protected_from_scale_in : Bool? = nil,
        placement_group : String? = nil,
        service_linked_role_arn : String? = nil,
        skip_zonal_shift_validation : Bool? = nil,
        tags : Array(Types::Tag)? = nil,
        target_group_ar_ns : Array(String)? = nil,
        termination_policies : Array(String)? = nil,
        traffic_sources : Array(Types::TrafficSourceIdentifier)? = nil,
        vpc_zone_identifier : String? = nil
      ) : Nil

        input = Types::CreateAutoScalingGroupType.new(auto_scaling_group_name: auto_scaling_group_name, max_size: max_size, min_size: min_size, availability_zone_distribution: availability_zone_distribution, availability_zone_impairment_policy: availability_zone_impairment_policy, availability_zones: availability_zones, capacity_rebalance: capacity_rebalance, capacity_reservation_specification: capacity_reservation_specification, context: context, default_cooldown: default_cooldown, default_instance_warmup: default_instance_warmup, desired_capacity: desired_capacity, desired_capacity_type: desired_capacity_type, health_check_grace_period: health_check_grace_period, health_check_type: health_check_type, instance_id: instance_id, instance_lifecycle_policy: instance_lifecycle_policy, instance_maintenance_policy: instance_maintenance_policy, launch_configuration_name: launch_configuration_name, launch_template: launch_template, lifecycle_hook_specification_list: lifecycle_hook_specification_list, load_balancer_names: load_balancer_names, max_instance_lifetime: max_instance_lifetime, mixed_instances_policy: mixed_instances_policy, new_instances_protected_from_scale_in: new_instances_protected_from_scale_in, placement_group: placement_group, service_linked_role_arn: service_linked_role_arn, skip_zonal_shift_validation: skip_zonal_shift_validation, tags: tags, target_group_ar_ns: target_group_ar_ns, termination_policies: termination_policies, traffic_sources: traffic_sources, vpc_zone_identifier: vpc_zone_identifier)
        create_auto_scaling_group(input)
      end

      def create_auto_scaling_group(input : Types::CreateAutoScalingGroupType) : Nil
        request = Protocol::Query.build_request(Model::CREATE_AUTO_SCALING_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a launch configuration. If you exceed your maximum limit of launch configurations, the call
      # fails. To query this limit, call the DescribeAccountLimits API. For information about updating this
      # limit, see Quotas for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide . For more
      # information, see Launch configurations in the Amazon EC2 Auto Scaling User Guide . Amazon EC2 Auto
      # Scaling configures instances launched as part of an Auto Scaling group using either a launch
      # template or a launch configuration. We strongly recommend that you do not use launch configurations.
      # They do not provide full functionality for Amazon EC2 Auto Scaling or Amazon EC2. For information
      # about using launch templates, see Launch templates in the Amazon EC2 Auto Scaling User Guide .

      def create_launch_configuration(
        launch_configuration_name : String,
        associate_public_ip_address : Bool? = nil,
        block_device_mappings : Array(Types::BlockDeviceMapping)? = nil,
        classic_link_vpc_id : String? = nil,
        classic_link_vpc_security_groups : Array(String)? = nil,
        ebs_optimized : Bool? = nil,
        iam_instance_profile : String? = nil,
        image_id : String? = nil,
        instance_id : String? = nil,
        instance_monitoring : Types::InstanceMonitoring? = nil,
        instance_type : String? = nil,
        kernel_id : String? = nil,
        key_name : String? = nil,
        metadata_options : Types::InstanceMetadataOptions? = nil,
        placement_tenancy : String? = nil,
        ramdisk_id : String? = nil,
        security_groups : Array(String)? = nil,
        spot_price : String? = nil,
        user_data : String? = nil
      ) : Nil

        input = Types::CreateLaunchConfigurationType.new(launch_configuration_name: launch_configuration_name, associate_public_ip_address: associate_public_ip_address, block_device_mappings: block_device_mappings, classic_link_vpc_id: classic_link_vpc_id, classic_link_vpc_security_groups: classic_link_vpc_security_groups, ebs_optimized: ebs_optimized, iam_instance_profile: iam_instance_profile, image_id: image_id, instance_id: instance_id, instance_monitoring: instance_monitoring, instance_type: instance_type, kernel_id: kernel_id, key_name: key_name, metadata_options: metadata_options, placement_tenancy: placement_tenancy, ramdisk_id: ramdisk_id, security_groups: security_groups, spot_price: spot_price, user_data: user_data)
        create_launch_configuration(input)
      end

      def create_launch_configuration(input : Types::CreateLaunchConfigurationType) : Nil
        request = Protocol::Query.build_request(Model::CREATE_LAUNCH_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or updates tags for the specified Auto Scaling group. When you specify a tag with a key that
      # already exists, the operation overwrites the previous tag definition, and you do not get an error
      # message. For more information, see Tag Auto Scaling groups and instances in the Amazon EC2 Auto
      # Scaling User Guide .

      def create_or_update_tags(
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::CreateOrUpdateTagsType.new(tags: tags)
        create_or_update_tags(input)
      end

      def create_or_update_tags(input : Types::CreateOrUpdateTagsType) : Nil
        request = Protocol::Query.build_request(Model::CREATE_OR_UPDATE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified Auto Scaling group. If the group has instances or scaling activities in
      # progress, you must specify the option to force the deletion in order for it to succeed. The force
      # delete operation will also terminate the EC2 instances. If the group has a warm pool, the force
      # delete option also deletes the warm pool. To remove instances from the Auto Scaling group before
      # deleting it, call the DetachInstances API with the list of instances and the option to decrement the
      # desired capacity. This ensures that Amazon EC2 Auto Scaling does not launch replacement instances.
      # To terminate all instances before deleting the Auto Scaling group, call the UpdateAutoScalingGroup
      # API and set the minimum size and desired capacity of the Auto Scaling group to zero. If the group
      # has scaling policies, deleting the group deletes the policies, the underlying alarm actions, and any
      # alarm that no longer has an associated action. For more information, see Delete your Auto Scaling
      # infrastructure in the Amazon EC2 Auto Scaling User Guide .

      def delete_auto_scaling_group(
        auto_scaling_group_name : String,
        force_delete : Bool? = nil
      ) : Nil

        input = Types::DeleteAutoScalingGroupType.new(auto_scaling_group_name: auto_scaling_group_name, force_delete: force_delete)
        delete_auto_scaling_group(input)
      end

      def delete_auto_scaling_group(input : Types::DeleteAutoScalingGroupType) : Nil
        request = Protocol::Query.build_request(Model::DELETE_AUTO_SCALING_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified launch configuration. The launch configuration must not be attached to an Auto
      # Scaling group. When this call completes, the launch configuration is no longer available for use.

      def delete_launch_configuration(
        launch_configuration_name : String
      ) : Nil

        input = Types::LaunchConfigurationNameType.new(launch_configuration_name: launch_configuration_name)
        delete_launch_configuration(input)
      end

      def delete_launch_configuration(input : Types::LaunchConfigurationNameType) : Nil
        request = Protocol::Query.build_request(Model::DELETE_LAUNCH_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified lifecycle hook. If there are any outstanding lifecycle actions, they are
      # completed first ( ABANDON for launching instances, CONTINUE for terminating instances).

      def delete_lifecycle_hook(
        auto_scaling_group_name : String,
        lifecycle_hook_name : String
      ) : Types::DeleteLifecycleHookAnswer

        input = Types::DeleteLifecycleHookType.new(auto_scaling_group_name: auto_scaling_group_name, lifecycle_hook_name: lifecycle_hook_name)
        delete_lifecycle_hook(input)
      end

      def delete_lifecycle_hook(input : Types::DeleteLifecycleHookType) : Types::DeleteLifecycleHookAnswer
        request = Protocol::Query.build_request(Model::DELETE_LIFECYCLE_HOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteLifecycleHookAnswer, "DeleteLifecycleHook")
      end

      # Deletes the specified notification.

      def delete_notification_configuration(
        auto_scaling_group_name : String,
        topic_arn : String
      ) : Nil

        input = Types::DeleteNotificationConfigurationType.new(auto_scaling_group_name: auto_scaling_group_name, topic_arn: topic_arn)
        delete_notification_configuration(input)
      end

      def delete_notification_configuration(input : Types::DeleteNotificationConfigurationType) : Nil
        request = Protocol::Query.build_request(Model::DELETE_NOTIFICATION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified scaling policy. Deleting either a step scaling policy or a simple scaling
      # policy deletes the underlying alarm action, but does not delete the alarm, even if it no longer has
      # an associated action. For more information, see Delete a scaling policy in the Amazon EC2 Auto
      # Scaling User Guide .

      def delete_policy(
        policy_name : String,
        auto_scaling_group_name : String? = nil
      ) : Nil

        input = Types::DeletePolicyType.new(policy_name: policy_name, auto_scaling_group_name: auto_scaling_group_name)
        delete_policy(input)
      end

      def delete_policy(input : Types::DeletePolicyType) : Nil
        request = Protocol::Query.build_request(Model::DELETE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified scheduled action.

      def delete_scheduled_action(
        auto_scaling_group_name : String,
        scheduled_action_name : String
      ) : Nil

        input = Types::DeleteScheduledActionType.new(auto_scaling_group_name: auto_scaling_group_name, scheduled_action_name: scheduled_action_name)
        delete_scheduled_action(input)
      end

      def delete_scheduled_action(input : Types::DeleteScheduledActionType) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified tags.

      def delete_tags(
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::DeleteTagsType.new(tags: tags)
        delete_tags(input)
      end

      def delete_tags(input : Types::DeleteTagsType) : Nil
        request = Protocol::Query.build_request(Model::DELETE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the warm pool for the specified Auto Scaling group. For more information, see Warm pools for
      # Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

      def delete_warm_pool(
        auto_scaling_group_name : String,
        force_delete : Bool? = nil
      ) : Types::DeleteWarmPoolAnswer

        input = Types::DeleteWarmPoolType.new(auto_scaling_group_name: auto_scaling_group_name, force_delete: force_delete)
        delete_warm_pool(input)
      end

      def delete_warm_pool(input : Types::DeleteWarmPoolType) : Types::DeleteWarmPoolAnswer
        request = Protocol::Query.build_request(Model::DELETE_WARM_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteWarmPoolAnswer, "DeleteWarmPool")
      end

      # Describes the current Amazon EC2 Auto Scaling resource quotas for your account. When you establish
      # an Amazon Web Services account, the account has initial quotas on the maximum number of Auto Scaling
      # groups and launch configurations that you can create in a given Region. For more information, see
      # Quotas for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .


      def describe_account_limits : Types::DescribeAccountLimitsAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_ACCOUNT_LIMITS, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAccountLimitsAnswer, "DescribeAccountLimits")
      end

      # Describes the available adjustment types for step scaling and simple scaling policies. The following
      # adjustment types are supported: ChangeInCapacity ExactCapacity PercentChangeInCapacity


      def describe_adjustment_types : Types::DescribeAdjustmentTypesAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_ADJUSTMENT_TYPES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAdjustmentTypesAnswer, "DescribeAdjustmentTypes")
      end

      # Gets information about the Auto Scaling groups in the account and Region. If you specify Auto
      # Scaling group names, the output includes information for only the specified Auto Scaling groups. If
      # you specify filters, the output includes information for only those Auto Scaling groups that meet
      # the filter criteria. If you do not specify group names or filters, the output includes information
      # for all Auto Scaling groups. This operation also returns information about instances in Auto Scaling
      # groups. To retrieve information about the instances in a warm pool, you must call the
      # DescribeWarmPool API.

      def describe_auto_scaling_groups(
        auto_scaling_group_names : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        include_instances : Bool? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::AutoScalingGroupsType

        input = Types::AutoScalingGroupNamesType.new(auto_scaling_group_names: auto_scaling_group_names, filters: filters, include_instances: include_instances, max_records: max_records, next_token: next_token)
        describe_auto_scaling_groups(input)
      end

      def describe_auto_scaling_groups(input : Types::AutoScalingGroupNamesType) : Types::AutoScalingGroupsType
        request = Protocol::Query.build_request(Model::DESCRIBE_AUTO_SCALING_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AutoScalingGroupsType, "DescribeAutoScalingGroups")
      end

      # Gets information about the Auto Scaling instances in the account and Region.

      def describe_auto_scaling_instances(
        instance_ids : Array(String)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::AutoScalingInstancesType

        input = Types::DescribeAutoScalingInstancesType.new(instance_ids: instance_ids, max_records: max_records, next_token: next_token)
        describe_auto_scaling_instances(input)
      end

      def describe_auto_scaling_instances(input : Types::DescribeAutoScalingInstancesType) : Types::AutoScalingInstancesType
        request = Protocol::Query.build_request(Model::DESCRIBE_AUTO_SCALING_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AutoScalingInstancesType, "DescribeAutoScalingInstances")
      end

      # Describes the notification types that are supported by Amazon EC2 Auto Scaling.


      def describe_auto_scaling_notification_types : Types::DescribeAutoScalingNotificationTypesAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_AUTO_SCALING_NOTIFICATION_TYPES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAutoScalingNotificationTypesAnswer, "DescribeAutoScalingNotificationTypes")
      end

      # Gets information about the instance refreshes for the specified Auto Scaling group from the previous
      # six weeks. This operation is part of the instance refresh feature in Amazon EC2 Auto Scaling, which
      # helps you update instances in your Auto Scaling group after you make configuration changes. To help
      # you determine the status of an instance refresh, Amazon EC2 Auto Scaling returns information about
      # the instance refreshes you previously initiated, including their status, start time, end time, the
      # percentage of the instance refresh that is complete, and the number of instances remaining to update
      # before the instance refresh is complete. If a rollback is initiated while an instance refresh is in
      # progress, Amazon EC2 Auto Scaling also returns information about the rollback of the instance
      # refresh.

      def describe_instance_refreshes(
        auto_scaling_group_name : String,
        instance_refresh_ids : Array(String)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstanceRefreshesAnswer

        input = Types::DescribeInstanceRefreshesType.new(auto_scaling_group_name: auto_scaling_group_name, instance_refresh_ids: instance_refresh_ids, max_records: max_records, next_token: next_token)
        describe_instance_refreshes(input)
      end

      def describe_instance_refreshes(input : Types::DescribeInstanceRefreshesType) : Types::DescribeInstanceRefreshesAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_INSTANCE_REFRESHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeInstanceRefreshesAnswer, "DescribeInstanceRefreshes")
      end

      # Gets information about the launch configurations in the account and Region.

      def describe_launch_configurations(
        launch_configuration_names : Array(String)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::LaunchConfigurationsType

        input = Types::LaunchConfigurationNamesType.new(launch_configuration_names: launch_configuration_names, max_records: max_records, next_token: next_token)
        describe_launch_configurations(input)
      end

      def describe_launch_configurations(input : Types::LaunchConfigurationNamesType) : Types::LaunchConfigurationsType
        request = Protocol::Query.build_request(Model::DESCRIBE_LAUNCH_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::LaunchConfigurationsType, "DescribeLaunchConfigurations")
      end

      # Describes the available types of lifecycle hooks. The following hook types are supported:
      # autoscaling:EC2_INSTANCE_LAUNCHING autoscaling:EC2_INSTANCE_TERMINATING


      def describe_lifecycle_hook_types : Types::DescribeLifecycleHookTypesAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_LIFECYCLE_HOOK_TYPES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLifecycleHookTypesAnswer, "DescribeLifecycleHookTypes")
      end

      # Gets information about the lifecycle hooks for the specified Auto Scaling group.

      def describe_lifecycle_hooks(
        auto_scaling_group_name : String,
        lifecycle_hook_names : Array(String)? = nil
      ) : Types::DescribeLifecycleHooksAnswer

        input = Types::DescribeLifecycleHooksType.new(auto_scaling_group_name: auto_scaling_group_name, lifecycle_hook_names: lifecycle_hook_names)
        describe_lifecycle_hooks(input)
      end

      def describe_lifecycle_hooks(input : Types::DescribeLifecycleHooksType) : Types::DescribeLifecycleHooksAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_LIFECYCLE_HOOKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLifecycleHooksAnswer, "DescribeLifecycleHooks")
      end

      # This API operation is superseded by DescribeTrafficSources , which can describe multiple traffic
      # sources types. We recommend using DetachTrafficSources to simplify how you manage traffic sources.
      # However, we continue to support DescribeLoadBalancerTargetGroups . You can use both the original
      # DescribeLoadBalancerTargetGroups API operation and DescribeTrafficSources on the same Auto Scaling
      # group. Gets information about the Elastic Load Balancing target groups for the specified Auto
      # Scaling group. To determine the attachment status of the target group, use the State element in the
      # response. When you attach a target group to an Auto Scaling group, the initial State value is Adding
      # . The state transitions to Added after all Auto Scaling instances are registered with the target
      # group. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state
      # transitions to InService after at least one Auto Scaling instance passes the health check. When the
      # target group is in the InService state, Amazon EC2 Auto Scaling can terminate and replace any
      # instances that are reported as unhealthy. If no registered instances pass the health checks, the
      # target group doesn't enter the InService state. Target groups also have an InService state if you
      # attach them in the CreateAutoScalingGroup API call. If your target group state is InService , but it
      # is not working properly, check the scaling activities by calling DescribeScalingActivities and take
      # any corrective actions necessary. For help with failed health checks, see Troubleshooting Amazon EC2
      # Auto Scaling: Health checks in the Amazon EC2 Auto Scaling User Guide . For more information, see
      # Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group in
      # the Amazon EC2 Auto Scaling User Guide . You can use this operation to describe target groups that
      # were attached by using AttachLoadBalancerTargetGroups , but not for target groups that were attached
      # by using AttachTrafficSources .

      def describe_load_balancer_target_groups(
        auto_scaling_group_name : String,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeLoadBalancerTargetGroupsResponse

        input = Types::DescribeLoadBalancerTargetGroupsRequest.new(auto_scaling_group_name: auto_scaling_group_name, max_records: max_records, next_token: next_token)
        describe_load_balancer_target_groups(input)
      end

      def describe_load_balancer_target_groups(input : Types::DescribeLoadBalancerTargetGroupsRequest) : Types::DescribeLoadBalancerTargetGroupsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCER_TARGET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLoadBalancerTargetGroupsResponse, "DescribeLoadBalancerTargetGroups")
      end

      # This API operation is superseded by DescribeTrafficSources , which can describe multiple traffic
      # sources types. We recommend using DescribeTrafficSources to simplify how you manage traffic sources.
      # However, we continue to support DescribeLoadBalancers . You can use both the original
      # DescribeLoadBalancers API operation and DescribeTrafficSources on the same Auto Scaling group. Gets
      # information about the load balancers for the specified Auto Scaling group. This operation describes
      # only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or
      # Gateway Load Balancers, use the DescribeLoadBalancerTargetGroups API instead. To determine the
      # attachment status of the load balancer, use the State element in the response. When you attach a
      # load balancer to an Auto Scaling group, the initial State value is Adding . The state transitions to
      # Added after all Auto Scaling instances are registered with the load balancer. If Elastic Load
      # Balancing health checks are enabled for the Auto Scaling group, the state transitions to InService
      # after at least one Auto Scaling instance passes the health check. When the load balancer is in the
      # InService state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported
      # as unhealthy. If no registered instances pass the health checks, the load balancer doesn't enter the
      # InService state. Load balancers also have an InService state if you attach them in the
      # CreateAutoScalingGroup API call. If your load balancer state is InService , but it is not working
      # properly, check the scaling activities by calling DescribeScalingActivities and take any corrective
      # actions necessary. For help with failed health checks, see Troubleshooting Amazon EC2 Auto Scaling:
      # Health checks in the Amazon EC2 Auto Scaling User Guide . For more information, see Use Elastic Load
      # Balancing to distribute traffic across the instances in your Auto Scaling group in the Amazon EC2
      # Auto Scaling User Guide .

      def describe_load_balancers(
        auto_scaling_group_name : String,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeLoadBalancersResponse

        input = Types::DescribeLoadBalancersRequest.new(auto_scaling_group_name: auto_scaling_group_name, max_records: max_records, next_token: next_token)
        describe_load_balancers(input)
      end

      def describe_load_balancers(input : Types::DescribeLoadBalancersRequest) : Types::DescribeLoadBalancersResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLoadBalancersResponse, "DescribeLoadBalancers")
      end

      # Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.


      def describe_metric_collection_types : Types::DescribeMetricCollectionTypesAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_METRIC_COLLECTION_TYPES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeMetricCollectionTypesAnswer, "DescribeMetricCollectionTypes")
      end

      # Gets information about the Amazon SNS notifications that are configured for one or more Auto Scaling
      # groups.

      def describe_notification_configurations(
        auto_scaling_group_names : Array(String)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeNotificationConfigurationsAnswer

        input = Types::DescribeNotificationConfigurationsType.new(auto_scaling_group_names: auto_scaling_group_names, max_records: max_records, next_token: next_token)
        describe_notification_configurations(input)
      end

      def describe_notification_configurations(input : Types::DescribeNotificationConfigurationsType) : Types::DescribeNotificationConfigurationsAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_NOTIFICATION_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeNotificationConfigurationsAnswer, "DescribeNotificationConfigurations")
      end

      # Gets information about the scaling policies in the account and Region.

      def describe_policies(
        auto_scaling_group_name : String? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil,
        policy_names : Array(String)? = nil,
        policy_types : Array(String)? = nil
      ) : Types::PoliciesType

        input = Types::DescribePoliciesType.new(auto_scaling_group_name: auto_scaling_group_name, max_records: max_records, next_token: next_token, policy_names: policy_names, policy_types: policy_types)
        describe_policies(input)
      end

      def describe_policies(input : Types::DescribePoliciesType) : Types::PoliciesType
        request = Protocol::Query.build_request(Model::DESCRIBE_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PoliciesType, "DescribePolicies")
      end

      # Gets information about the scaling activities in the account and Region. When scaling events occur,
      # you see a record of the scaling activity in the scaling activities. For more information, see Verify
      # a scaling activity for an Auto Scaling group in the Amazon EC2 Auto Scaling User Guide . If the
      # scaling event succeeds, the value of the StatusCode element in the response is Successful . If an
      # attempt to launch instances failed, the StatusCode value is Failed or Cancelled and the
      # StatusMessage element in the response indicates the cause of the failure. For help interpreting the
      # StatusMessage , see Troubleshooting Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User
      # Guide .

      def describe_scaling_activities(
        activity_ids : Array(String)? = nil,
        auto_scaling_group_name : String? = nil,
        include_deleted_groups : Bool? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::ActivitiesType

        input = Types::DescribeScalingActivitiesType.new(activity_ids: activity_ids, auto_scaling_group_name: auto_scaling_group_name, include_deleted_groups: include_deleted_groups, max_records: max_records, next_token: next_token)
        describe_scaling_activities(input)
      end

      def describe_scaling_activities(input : Types::DescribeScalingActivitiesType) : Types::ActivitiesType
        request = Protocol::Query.build_request(Model::DESCRIBE_SCALING_ACTIVITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ActivitiesType, "DescribeScalingActivities")
      end

      # Describes the scaling process types for use with the ResumeProcesses and SuspendProcesses APIs.


      def describe_scaling_process_types : Types::ProcessesType
        request = Protocol::Query.build_request(Model::DESCRIBE_SCALING_PROCESS_TYPES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ProcessesType, "DescribeScalingProcessTypes")
      end

      # Gets information about the scheduled actions that haven't run or that have not reached their end
      # time. To describe the scaling activities for scheduled actions that have already run, call the
      # DescribeScalingActivities API.

      def describe_scheduled_actions(
        auto_scaling_group_name : String? = nil,
        end_time : Time? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil,
        scheduled_action_names : Array(String)? = nil,
        start_time : Time? = nil
      ) : Types::ScheduledActionsType

        input = Types::DescribeScheduledActionsType.new(auto_scaling_group_name: auto_scaling_group_name, end_time: end_time, max_records: max_records, next_token: next_token, scheduled_action_names: scheduled_action_names, start_time: start_time)
        describe_scheduled_actions(input)
      end

      def describe_scheduled_actions(input : Types::DescribeScheduledActionsType) : Types::ScheduledActionsType
        request = Protocol::Query.build_request(Model::DESCRIBE_SCHEDULED_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ScheduledActionsType, "DescribeScheduledActions")
      end

      # Describes the specified tags. You can use filters to limit the results. For example, you can query
      # for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag
      # must match at least one of the specified values for it to be included in the results. You can also
      # specify multiple filters. The result includes information for a particular tag only if it matches
      # all the filters. If there's no match, no special message is returned. For more information, see Tag
      # Auto Scaling groups and instances in the Amazon EC2 Auto Scaling User Guide .

      def describe_tags(
        filters : Array(Types::Filter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::TagsType

        input = Types::DescribeTagsType.new(filters: filters, max_records: max_records, next_token: next_token)
        describe_tags(input)
      end

      def describe_tags(input : Types::DescribeTagsType) : Types::TagsType
        request = Protocol::Query.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TagsType, "DescribeTags")
      end

      # Describes the termination policies supported by Amazon EC2 Auto Scaling. For more information, see
      # Configure termination policies for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide
      # .


      def describe_termination_policy_types : Types::DescribeTerminationPolicyTypesAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_TERMINATION_POLICY_TYPES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTerminationPolicyTypesAnswer, "DescribeTerminationPolicyTypes")
      end

      # Gets information about the traffic sources for the specified Auto Scaling group. You can optionally
      # provide a traffic source type. If you provide a traffic source type, then the results only include
      # that traffic source type. If you do not provide a traffic source type, then the results include all
      # the traffic sources for the specified Auto Scaling group.

      def describe_traffic_sources(
        auto_scaling_group_name : String,
        max_records : Int32? = nil,
        next_token : String? = nil,
        traffic_source_type : String? = nil
      ) : Types::DescribeTrafficSourcesResponse

        input = Types::DescribeTrafficSourcesRequest.new(auto_scaling_group_name: auto_scaling_group_name, max_records: max_records, next_token: next_token, traffic_source_type: traffic_source_type)
        describe_traffic_sources(input)
      end

      def describe_traffic_sources(input : Types::DescribeTrafficSourcesRequest) : Types::DescribeTrafficSourcesResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_TRAFFIC_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTrafficSourcesResponse, "DescribeTrafficSources")
      end

      # Gets information about a warm pool and its instances. For more information, see Warm pools for
      # Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

      def describe_warm_pool(
        auto_scaling_group_name : String,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeWarmPoolAnswer

        input = Types::DescribeWarmPoolType.new(auto_scaling_group_name: auto_scaling_group_name, max_records: max_records, next_token: next_token)
        describe_warm_pool(input)
      end

      def describe_warm_pool(input : Types::DescribeWarmPoolType) : Types::DescribeWarmPoolAnswer
        request = Protocol::Query.build_request(Model::DESCRIBE_WARM_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeWarmPoolAnswer, "DescribeWarmPool")
      end

      # Removes one or more instances from the specified Auto Scaling group. After the instances are
      # detached, you can manage them independent of the Auto Scaling group. If you do not specify the
      # option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the
      # ones that are detached. If there is a Classic Load Balancer attached to the Auto Scaling group, the
      # instances are deregistered from the load balancer. If there are target groups attached to the Auto
      # Scaling group, the instances are deregistered from the target groups. For more information, see
      # Detach or attach instances in the Amazon EC2 Auto Scaling User Guide .

      def detach_instances(
        auto_scaling_group_name : String,
        should_decrement_desired_capacity : Bool,
        instance_ids : Array(String)? = nil
      ) : Types::DetachInstancesAnswer

        input = Types::DetachInstancesQuery.new(auto_scaling_group_name: auto_scaling_group_name, should_decrement_desired_capacity: should_decrement_desired_capacity, instance_ids: instance_ids)
        detach_instances(input)
      end

      def detach_instances(input : Types::DetachInstancesQuery) : Types::DetachInstancesAnswer
        request = Protocol::Query.build_request(Model::DETACH_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetachInstancesAnswer, "DetachInstances")
      end

      # This API operation is superseded by DetachTrafficSources , which can detach multiple traffic sources
      # types. We recommend using DetachTrafficSources to simplify how you manage traffic sources. However,
      # we continue to support DetachLoadBalancerTargetGroups . You can use both the original
      # DetachLoadBalancerTargetGroups API operation and DetachTrafficSources on the same Auto Scaling
      # group. Detaches one or more target groups from the specified Auto Scaling group. When you detach a
      # target group, it enters the Removing state while deregistering the instances in the group. When all
      # instances are deregistered, then you can no longer describe the target group using the
      # DescribeLoadBalancerTargetGroups API call. The instances remain running. You can use this operation
      # to detach target groups that were attached by using AttachLoadBalancerTargetGroups , but not for
      # target groups that were attached by using AttachTrafficSources .

      def detach_load_balancer_target_groups(
        auto_scaling_group_name : String,
        target_group_ar_ns : Array(String)
      ) : Types::DetachLoadBalancerTargetGroupsResultType

        input = Types::DetachLoadBalancerTargetGroupsType.new(auto_scaling_group_name: auto_scaling_group_name, target_group_ar_ns: target_group_ar_ns)
        detach_load_balancer_target_groups(input)
      end

      def detach_load_balancer_target_groups(input : Types::DetachLoadBalancerTargetGroupsType) : Types::DetachLoadBalancerTargetGroupsResultType
        request = Protocol::Query.build_request(Model::DETACH_LOAD_BALANCER_TARGET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetachLoadBalancerTargetGroupsResultType, "DetachLoadBalancerTargetGroups")
      end

      # This API operation is superseded by DetachTrafficSources , which can detach multiple traffic sources
      # types. We recommend using DetachTrafficSources to simplify how you manage traffic sources. However,
      # we continue to support DetachLoadBalancers . You can use both the original DetachLoadBalancers API
      # operation and DetachTrafficSources on the same Auto Scaling group. Detaches one or more Classic Load
      # Balancers from the specified Auto Scaling group. This operation detaches only Classic Load
      # Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load
      # Balancers, use the DetachLoadBalancerTargetGroups API instead. When you detach a load balancer, it
      # enters the Removing state while deregistering the instances in the group. When all instances are
      # deregistered, then you can no longer describe the load balancer using the DescribeLoadBalancers API
      # call. The instances remain running.

      def detach_load_balancers(
        auto_scaling_group_name : String,
        load_balancer_names : Array(String)
      ) : Types::DetachLoadBalancersResultType

        input = Types::DetachLoadBalancersType.new(auto_scaling_group_name: auto_scaling_group_name, load_balancer_names: load_balancer_names)
        detach_load_balancers(input)
      end

      def detach_load_balancers(input : Types::DetachLoadBalancersType) : Types::DetachLoadBalancersResultType
        request = Protocol::Query.build_request(Model::DETACH_LOAD_BALANCERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetachLoadBalancersResultType, "DetachLoadBalancers")
      end

      # Detaches one or more traffic sources from the specified Auto Scaling group. When you detach a
      # traffic source, it enters the Removing state while deregistering the instances in the group. When
      # all instances are deregistered, then you can no longer describe the traffic source using the
      # DescribeTrafficSources API call. The instances continue to run.

      def detach_traffic_sources(
        auto_scaling_group_name : String,
        traffic_sources : Array(Types::TrafficSourceIdentifier)
      ) : Types::DetachTrafficSourcesResultType

        input = Types::DetachTrafficSourcesType.new(auto_scaling_group_name: auto_scaling_group_name, traffic_sources: traffic_sources)
        detach_traffic_sources(input)
      end

      def detach_traffic_sources(input : Types::DetachTrafficSourcesType) : Types::DetachTrafficSourcesResultType
        request = Protocol::Query.build_request(Model::DETACH_TRAFFIC_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetachTrafficSourcesResultType, "DetachTrafficSources")
      end

      # Disables group metrics collection for the specified Auto Scaling group.

      def disable_metrics_collection(
        auto_scaling_group_name : String,
        metrics : Array(String)? = nil
      ) : Nil

        input = Types::DisableMetricsCollectionQuery.new(auto_scaling_group_name: auto_scaling_group_name, metrics: metrics)
        disable_metrics_collection(input)
      end

      def disable_metrics_collection(input : Types::DisableMetricsCollectionQuery) : Nil
        request = Protocol::Query.build_request(Model::DISABLE_METRICS_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Enables group metrics collection for the specified Auto Scaling group. You can use these metrics to
      # track changes in an Auto Scaling group and to set alarms on threshold values. You can view group
      # metrics using the Amazon EC2 Auto Scaling console or the CloudWatch console. For more information,
      # see Monitor CloudWatch metrics for your Auto Scaling groups and instances in the Amazon EC2 Auto
      # Scaling User Guide .

      def enable_metrics_collection(
        auto_scaling_group_name : String,
        granularity : String,
        metrics : Array(String)? = nil
      ) : Nil

        input = Types::EnableMetricsCollectionQuery.new(auto_scaling_group_name: auto_scaling_group_name, granularity: granularity, metrics: metrics)
        enable_metrics_collection(input)
      end

      def enable_metrics_collection(input : Types::EnableMetricsCollectionQuery) : Nil
        request = Protocol::Query.build_request(Model::ENABLE_METRICS_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Moves the specified instances into the standby state. If you choose to decrement the desired
      # capacity of the Auto Scaling group, the instances can enter standby as long as the desired capacity
      # of the Auto Scaling group after the instances are placed into standby is equal to or greater than
      # the minimum capacity of the group. If you choose not to decrement the desired capacity of the Auto
      # Scaling group, the Auto Scaling group launches new instances to replace the instances on standby.
      # For more information, see Temporarily removing instances from your Auto Scaling group in the Amazon
      # EC2 Auto Scaling User Guide .

      def enter_standby(
        auto_scaling_group_name : String,
        should_decrement_desired_capacity : Bool,
        instance_ids : Array(String)? = nil
      ) : Types::EnterStandbyAnswer

        input = Types::EnterStandbyQuery.new(auto_scaling_group_name: auto_scaling_group_name, should_decrement_desired_capacity: should_decrement_desired_capacity, instance_ids: instance_ids)
        enter_standby(input)
      end

      def enter_standby(input : Types::EnterStandbyQuery) : Types::EnterStandbyAnswer
        request = Protocol::Query.build_request(Model::ENTER_STANDBY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnterStandbyAnswer, "EnterStandby")
      end

      # Executes the specified policy. This can be useful for testing the design of your scaling policy.

      def execute_policy(
        policy_name : String,
        auto_scaling_group_name : String? = nil,
        breach_threshold : Float64? = nil,
        honor_cooldown : Bool? = nil,
        metric_value : Float64? = nil
      ) : Nil

        input = Types::ExecutePolicyType.new(policy_name: policy_name, auto_scaling_group_name: auto_scaling_group_name, breach_threshold: breach_threshold, honor_cooldown: honor_cooldown, metric_value: metric_value)
        execute_policy(input)
      end

      def execute_policy(input : Types::ExecutePolicyType) : Nil
        request = Protocol::Query.build_request(Model::EXECUTE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Moves the specified instances out of the standby state. After you put the instances back in service,
      # the desired capacity is incremented. For more information, see Temporarily removing instances from
      # your Auto Scaling group in the Amazon EC2 Auto Scaling User Guide .

      def exit_standby(
        auto_scaling_group_name : String,
        instance_ids : Array(String)? = nil
      ) : Types::ExitStandbyAnswer

        input = Types::ExitStandbyQuery.new(auto_scaling_group_name: auto_scaling_group_name, instance_ids: instance_ids)
        exit_standby(input)
      end

      def exit_standby(input : Types::ExitStandbyQuery) : Types::ExitStandbyAnswer
        request = Protocol::Query.build_request(Model::EXIT_STANDBY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ExitStandbyAnswer, "ExitStandby")
      end

      # Retrieves the forecast data for a predictive scaling policy. Load forecasts are predictions of the
      # hourly load values using historical load data from CloudWatch and an analysis of historical trends.
      # Capacity forecasts are represented as predicted values for the minimum capacity that is needed on an
      # hourly basis, based on the hourly load forecast. A minimum of 24 hours of data is required to create
      # the initial forecasts. However, having a full 14 days of historical data results in more accurate
      # forecasts. For more information, see Predictive scaling for Amazon EC2 Auto Scaling in the Amazon
      # EC2 Auto Scaling User Guide .

      def get_predictive_scaling_forecast(
        auto_scaling_group_name : String,
        end_time : Time,
        policy_name : String,
        start_time : Time
      ) : Types::GetPredictiveScalingForecastAnswer

        input = Types::GetPredictiveScalingForecastType.new(auto_scaling_group_name: auto_scaling_group_name, end_time: end_time, policy_name: policy_name, start_time: start_time)
        get_predictive_scaling_forecast(input)
      end

      def get_predictive_scaling_forecast(input : Types::GetPredictiveScalingForecastType) : Types::GetPredictiveScalingForecastAnswer
        request = Protocol::Query.build_request(Model::GET_PREDICTIVE_SCALING_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetPredictiveScalingForecastAnswer, "GetPredictiveScalingForecast")
      end

      # Launches a specified number of instances in an Auto Scaling group. Returns instance IDs and other
      # details if launch is successful or error details if launch is unsuccessful.

      def launch_instances(
        auto_scaling_group_name : String,
        client_token : String,
        requested_capacity : Int32,
        availability_zone_ids : Array(String)? = nil,
        availability_zones : Array(String)? = nil,
        retry_strategy : String? = nil,
        subnet_ids : Array(String)? = nil
      ) : Types::LaunchInstancesResult

        input = Types::LaunchInstancesRequest.new(auto_scaling_group_name: auto_scaling_group_name, client_token: client_token, requested_capacity: requested_capacity, availability_zone_ids: availability_zone_ids, availability_zones: availability_zones, retry_strategy: retry_strategy, subnet_ids: subnet_ids)
        launch_instances(input)
      end

      def launch_instances(input : Types::LaunchInstancesRequest) : Types::LaunchInstancesResult
        request = Protocol::Query.build_request(Model::LAUNCH_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::LaunchInstancesResult, "LaunchInstances")
      end

      # Creates or updates a lifecycle hook for the specified Auto Scaling group. Lifecycle hooks let you
      # create solutions that are aware of events in the Auto Scaling instance lifecycle, and then perform a
      # custom action on instances when the corresponding lifecycle event occurs. This step is a part of the
      # procedure for adding a lifecycle hook to an Auto Scaling group: (Optional) Create a launch template
      # or launch configuration with a user data script that runs while an instance is in a wait state due
      # to a lifecycle hook. (Optional) Create a Lambda function and a rule that allows Amazon EventBridge
      # to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.
      # (Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS
      # queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle
      # notifications to the target. Create the lifecycle hook. Specify whether the hook is used when the
      # instances launch or terminate. If you need more time, record the lifecycle action heartbeat to keep
      # the instance in a wait state using the RecordLifecycleActionHeartbeat API call. If you finish before
      # the timeout period ends, send a callback by using the CompleteLifecycleAction API call. For more
      # information, see Amazon EC2 Auto Scaling lifecycle hooks in the Amazon EC2 Auto Scaling User Guide .
      # If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group,
      # the call fails. You can view the lifecycle hooks for an Auto Scaling group using the
      # DescribeLifecycleHooks API call. If you are no longer using a lifecycle hook, you can delete it by
      # calling the DeleteLifecycleHook API.

      def put_lifecycle_hook(
        auto_scaling_group_name : String,
        lifecycle_hook_name : String,
        default_result : String? = nil,
        heartbeat_timeout : Int32? = nil,
        lifecycle_transition : String? = nil,
        notification_metadata : String? = nil,
        notification_target_arn : String? = nil,
        role_arn : String? = nil
      ) : Types::PutLifecycleHookAnswer

        input = Types::PutLifecycleHookType.new(auto_scaling_group_name: auto_scaling_group_name, lifecycle_hook_name: lifecycle_hook_name, default_result: default_result, heartbeat_timeout: heartbeat_timeout, lifecycle_transition: lifecycle_transition, notification_metadata: notification_metadata, notification_target_arn: notification_target_arn, role_arn: role_arn)
        put_lifecycle_hook(input)
      end

      def put_lifecycle_hook(input : Types::PutLifecycleHookType) : Types::PutLifecycleHookAnswer
        request = Protocol::Query.build_request(Model::PUT_LIFECYCLE_HOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PutLifecycleHookAnswer, "PutLifecycleHook")
      end

      # Configures an Auto Scaling group to send notifications when specified events take place. Subscribers
      # to the specified topic can have messages delivered to an endpoint such as a web server or an email
      # address. This configuration overwrites any existing configuration. For more information, see Amazon
      # SNS notification options for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide . If
      # you exceed your maximum limit of SNS topics, which is 10 per Auto Scaling group, the call fails.

      def put_notification_configuration(
        auto_scaling_group_name : String,
        notification_types : Array(String),
        topic_arn : String
      ) : Nil

        input = Types::PutNotificationConfigurationType.new(auto_scaling_group_name: auto_scaling_group_name, notification_types: notification_types, topic_arn: topic_arn)
        put_notification_configuration(input)
      end

      def put_notification_configuration(input : Types::PutNotificationConfigurationType) : Nil
        request = Protocol::Query.build_request(Model::PUT_NOTIFICATION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or updates a scaling policy for an Auto Scaling group. Scaling policies are used to scale an
      # Auto Scaling group based on configurable metrics. If no policies are defined, the dynamic scaling
      # and predictive scaling features are not used. For more information about using dynamic scaling, see
      # Target tracking scaling policies and Step and simple scaling policies in the Amazon EC2 Auto Scaling
      # User Guide . For more information about using predictive scaling, see Predictive scaling for Amazon
      # EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide . You can view the scaling policies for
      # an Auto Scaling group using the DescribePolicies API call. If you are no longer using a scaling
      # policy, you can delete it by calling the DeletePolicy API.

      def put_scaling_policy(
        auto_scaling_group_name : String,
        policy_name : String,
        adjustment_type : String? = nil,
        cooldown : Int32? = nil,
        enabled : Bool? = nil,
        estimated_instance_warmup : Int32? = nil,
        metric_aggregation_type : String? = nil,
        min_adjustment_magnitude : Int32? = nil,
        min_adjustment_step : Int32? = nil,
        policy_type : String? = nil,
        predictive_scaling_configuration : Types::PredictiveScalingConfiguration? = nil,
        scaling_adjustment : Int32? = nil,
        step_adjustments : Array(Types::StepAdjustment)? = nil,
        target_tracking_configuration : Types::TargetTrackingConfiguration? = nil
      ) : Types::PolicyARNType

        input = Types::PutScalingPolicyType.new(auto_scaling_group_name: auto_scaling_group_name, policy_name: policy_name, adjustment_type: adjustment_type, cooldown: cooldown, enabled: enabled, estimated_instance_warmup: estimated_instance_warmup, metric_aggregation_type: metric_aggregation_type, min_adjustment_magnitude: min_adjustment_magnitude, min_adjustment_step: min_adjustment_step, policy_type: policy_type, predictive_scaling_configuration: predictive_scaling_configuration, scaling_adjustment: scaling_adjustment, step_adjustments: step_adjustments, target_tracking_configuration: target_tracking_configuration)
        put_scaling_policy(input)
      end

      def put_scaling_policy(input : Types::PutScalingPolicyType) : Types::PolicyARNType
        request = Protocol::Query.build_request(Model::PUT_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PolicyARNType, "PutScalingPolicy")
      end

      # Creates or updates a scheduled scaling action for an Auto Scaling group. For more information, see
      # Scheduled scaling in the Amazon EC2 Auto Scaling User Guide . You can view the scheduled actions for
      # an Auto Scaling group using the DescribeScheduledActions API call. If you are no longer using a
      # scheduled action, you can delete it by calling the DeleteScheduledAction API. If you try to schedule
      # your action in the past, Amazon EC2 Auto Scaling returns an error message.

      def put_scheduled_update_group_action(
        auto_scaling_group_name : String,
        scheduled_action_name : String,
        desired_capacity : Int32? = nil,
        end_time : Time? = nil,
        max_size : Int32? = nil,
        min_size : Int32? = nil,
        recurrence : String? = nil,
        start_time : Time? = nil,
        time : Time? = nil,
        time_zone : String? = nil
      ) : Nil

        input = Types::PutScheduledUpdateGroupActionType.new(auto_scaling_group_name: auto_scaling_group_name, scheduled_action_name: scheduled_action_name, desired_capacity: desired_capacity, end_time: end_time, max_size: max_size, min_size: min_size, recurrence: recurrence, start_time: start_time, time: time, time_zone: time_zone)
        put_scheduled_update_group_action(input)
      end

      def put_scheduled_update_group_action(input : Types::PutScheduledUpdateGroupActionType) : Nil
        request = Protocol::Query.build_request(Model::PUT_SCHEDULED_UPDATE_GROUP_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or updates a warm pool for the specified Auto Scaling group. A warm pool is a pool of
      # pre-initialized EC2 instances that sits alongside the Auto Scaling group. Whenever your application
      # needs to scale out, the Auto Scaling group can draw on the warm pool to meet its new desired
      # capacity. This operation must be called from the Region in which the Auto Scaling group was created.
      # You can view the instances in the warm pool using the DescribeWarmPool API call. If you are no
      # longer using a warm pool, you can delete it by calling the DeleteWarmPool API. For more information,
      # see Warm pools for Amazon EC2 Auto Scaling in the Amazon EC2 Auto Scaling User Guide .

      def put_warm_pool(
        auto_scaling_group_name : String,
        instance_reuse_policy : Types::InstanceReusePolicy? = nil,
        max_group_prepared_capacity : Int32? = nil,
        min_size : Int32? = nil,
        pool_state : String? = nil
      ) : Types::PutWarmPoolAnswer

        input = Types::PutWarmPoolType.new(auto_scaling_group_name: auto_scaling_group_name, instance_reuse_policy: instance_reuse_policy, max_group_prepared_capacity: max_group_prepared_capacity, min_size: min_size, pool_state: pool_state)
        put_warm_pool(input)
      end

      def put_warm_pool(input : Types::PutWarmPoolType) : Types::PutWarmPoolAnswer
        request = Protocol::Query.build_request(Model::PUT_WARM_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PutWarmPoolAnswer, "PutWarmPool")
      end

      # Records a heartbeat for the lifecycle action associated with the specified token or instance. This
      # extends the timeout by the length of time defined using the PutLifecycleHook API call. This step is
      # a part of the procedure for adding a lifecycle hook to an Auto Scaling group: (Optional) Create a
      # launch template or launch configuration with a user data script that runs while an instance is in a
      # wait state due to a lifecycle hook. (Optional) Create a Lambda function and a rule that allows
      # Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a
      # lifecycle hook. (Optional) Create a notification target and an IAM role. The target can be either an
      # Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish
      # lifecycle notifications to the target. Create the lifecycle hook. Specify whether the hook is used
      # when the instances launch or terminate. If you need more time, record the lifecycle action heartbeat
      # to keep the instance in a wait state. If you finish before the timeout period ends, send a callback
      # by using the CompleteLifecycleAction API call. For more information, see Amazon EC2 Auto Scaling
      # lifecycle hooks in the Amazon EC2 Auto Scaling User Guide .

      def record_lifecycle_action_heartbeat(
        auto_scaling_group_name : String,
        lifecycle_hook_name : String,
        instance_id : String? = nil,
        lifecycle_action_token : String? = nil
      ) : Types::RecordLifecycleActionHeartbeatAnswer

        input = Types::RecordLifecycleActionHeartbeatType.new(auto_scaling_group_name: auto_scaling_group_name, lifecycle_hook_name: lifecycle_hook_name, instance_id: instance_id, lifecycle_action_token: lifecycle_action_token)
        record_lifecycle_action_heartbeat(input)
      end

      def record_lifecycle_action_heartbeat(input : Types::RecordLifecycleActionHeartbeatType) : Types::RecordLifecycleActionHeartbeatAnswer
        request = Protocol::Query.build_request(Model::RECORD_LIFECYCLE_ACTION_HEARTBEAT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RecordLifecycleActionHeartbeatAnswer, "RecordLifecycleActionHeartbeat")
      end

      # Resumes the specified suspended auto scaling processes, or all suspended process, for the specified
      # Auto Scaling group. For more information, see Suspend and resume Amazon EC2 Auto Scaling processes
      # in the Amazon EC2 Auto Scaling User Guide .

      def resume_processes(
        auto_scaling_group_name : String,
        scaling_processes : Array(String)? = nil
      ) : Nil

        input = Types::ScalingProcessQuery.new(auto_scaling_group_name: auto_scaling_group_name, scaling_processes: scaling_processes)
        resume_processes(input)
      end

      def resume_processes(input : Types::ScalingProcessQuery) : Nil
        request = Protocol::Query.build_request(Model::RESUME_PROCESSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Cancels an instance refresh that is in progress and rolls back any changes that it made. Amazon EC2
      # Auto Scaling replaces any instances that were replaced during the instance refresh. This restores
      # your Auto Scaling group to the configuration that it was using before the start of the instance
      # refresh. This operation is part of the instance refresh feature in Amazon EC2 Auto Scaling, which
      # helps you update instances in your Auto Scaling group after you make configuration changes. A
      # rollback is not supported in the following situations: There is no desired configuration specified
      # for the instance refresh. The Auto Scaling group has a launch template that uses an Amazon Web
      # Services Systems Manager parameter instead of an AMI ID for the ImageId property. The Auto Scaling
      # group uses the launch template's $Latest or $Default version. When you receive a successful response
      # from this operation, Amazon EC2 Auto Scaling immediately begins replacing instances. You can check
      # the status of this operation through the DescribeInstanceRefreshes API operation.

      def rollback_instance_refresh(
        auto_scaling_group_name : String
      ) : Types::RollbackInstanceRefreshAnswer

        input = Types::RollbackInstanceRefreshType.new(auto_scaling_group_name: auto_scaling_group_name)
        rollback_instance_refresh(input)
      end

      def rollback_instance_refresh(input : Types::RollbackInstanceRefreshType) : Types::RollbackInstanceRefreshAnswer
        request = Protocol::Query.build_request(Model::ROLLBACK_INSTANCE_REFRESH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RollbackInstanceRefreshAnswer, "RollbackInstanceRefresh")
      end

      # Sets the size of the specified Auto Scaling group. If a scale-in activity occurs as a result of a
      # new DesiredCapacity value that is lower than the current size of the group, the Auto Scaling group
      # uses its termination policy to determine which instances to terminate. For more information, see
      # Manual scaling in the Amazon EC2 Auto Scaling User Guide .

      def set_desired_capacity(
        auto_scaling_group_name : String,
        desired_capacity : Int32,
        honor_cooldown : Bool? = nil
      ) : Nil

        input = Types::SetDesiredCapacityType.new(auto_scaling_group_name: auto_scaling_group_name, desired_capacity: desired_capacity, honor_cooldown: honor_cooldown)
        set_desired_capacity(input)
      end

      def set_desired_capacity(input : Types::SetDesiredCapacityType) : Nil
        request = Protocol::Query.build_request(Model::SET_DESIRED_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the health status of the specified instance. For more information, see Set up a custom health
      # check for your Auto Scaling group in the Amazon EC2 Auto Scaling User Guide .

      def set_instance_health(
        health_status : String,
        instance_id : String,
        should_respect_grace_period : Bool? = nil
      ) : Nil

        input = Types::SetInstanceHealthQuery.new(health_status: health_status, instance_id: instance_id, should_respect_grace_period: should_respect_grace_period)
        set_instance_health(input)
      end

      def set_instance_health(input : Types::SetInstanceHealthQuery) : Nil
        request = Protocol::Query.build_request(Model::SET_INSTANCE_HEALTH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the instance protection settings of the specified instances. This operation cannot be called
      # on instances in a warm pool. For more information, see Use instance scale-in protection in the
      # Amazon EC2 Auto Scaling User Guide . If you exceed your maximum limit of instance IDs, which is 50
      # per Auto Scaling group, the call fails.

      def set_instance_protection(
        auto_scaling_group_name : String,
        instance_ids : Array(String),
        protected_from_scale_in : Bool
      ) : Types::SetInstanceProtectionAnswer

        input = Types::SetInstanceProtectionQuery.new(auto_scaling_group_name: auto_scaling_group_name, instance_ids: instance_ids, protected_from_scale_in: protected_from_scale_in)
        set_instance_protection(input)
      end

      def set_instance_protection(input : Types::SetInstanceProtectionQuery) : Types::SetInstanceProtectionAnswer
        request = Protocol::Query.build_request(Model::SET_INSTANCE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetInstanceProtectionAnswer, "SetInstanceProtection")
      end

      # Starts an instance refresh. This operation is part of the instance refresh feature in Amazon EC2
      # Auto Scaling, which helps you update instances in your Auto Scaling group. This feature is helpful,
      # for example, when you have a new AMI or a new user data script. You just need to create a new launch
      # template that specifies the new AMI or user data script. Then start an instance refresh to
      # immediately begin the process of updating instances in the group. If successful, the request's
      # response contains a unique ID that you can use to track the progress of the instance refresh. To
      # query its status, call the DescribeInstanceRefreshes API. To describe the instance refreshes that
      # have already run, call the DescribeInstanceRefreshes API. To cancel an instance refresh that is in
      # progress, use the CancelInstanceRefresh API. An instance refresh might fail for several reasons,
      # such as EC2 launch failures, misconfigured health checks, or not ignoring or allowing the
      # termination of instances that are in Standby state or protected from scale in. You can monitor for
      # failed EC2 launches using the scaling activities. To find the scaling activities, call the
      # DescribeScalingActivities API. If you enable auto rollback, your Auto Scaling group will be rolled
      # back automatically when the instance refresh fails. You can enable this feature before starting an
      # instance refresh by specifying the AutoRollback property in the instance refresh preferences.
      # Otherwise, to roll back an instance refresh before it finishes, use the RollbackInstanceRefresh API.

      def start_instance_refresh(
        auto_scaling_group_name : String,
        desired_configuration : Types::DesiredConfiguration? = nil,
        preferences : Types::RefreshPreferences? = nil,
        strategy : String? = nil
      ) : Types::StartInstanceRefreshAnswer

        input = Types::StartInstanceRefreshType.new(auto_scaling_group_name: auto_scaling_group_name, desired_configuration: desired_configuration, preferences: preferences, strategy: strategy)
        start_instance_refresh(input)
      end

      def start_instance_refresh(input : Types::StartInstanceRefreshType) : Types::StartInstanceRefreshAnswer
        request = Protocol::Query.build_request(Model::START_INSTANCE_REFRESH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StartInstanceRefreshAnswer, "StartInstanceRefresh")
      end

      # Suspends the specified auto scaling processes, or all processes, for the specified Auto Scaling
      # group. If you suspend either the Launch or Terminate process types, it can prevent other process
      # types from functioning properly. For more information, see Suspend and resume Amazon EC2 Auto
      # Scaling processes in the Amazon EC2 Auto Scaling User Guide . To resume processes that have been
      # suspended, call the ResumeProcesses API.

      def suspend_processes(
        auto_scaling_group_name : String,
        scaling_processes : Array(String)? = nil
      ) : Nil

        input = Types::ScalingProcessQuery.new(auto_scaling_group_name: auto_scaling_group_name, scaling_processes: scaling_processes)
        suspend_processes(input)
      end

      def suspend_processes(input : Types::ScalingProcessQuery) : Nil
        request = Protocol::Query.build_request(Model::SUSPEND_PROCESSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Terminates the specified instance and optionally adjusts the desired group size. This operation
      # cannot be called on instances in a warm pool. This call simply makes a termination request. The
      # instance is not terminated immediately. When an instance is terminated, the instance status changes
      # to terminated . You can't connect to or start an instance after you've terminated it. If you do not
      # specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to
      # replace the ones that are terminated. By default, Amazon EC2 Auto Scaling balances instances across
      # all Availability Zones. If you decrement the desired capacity, your Auto Scaling group can become
      # unbalanced between Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and
      # rebalancing might terminate instances in other zones. For more information, see Manual scaling in
      # the Amazon EC2 Auto Scaling User Guide .

      def terminate_instance_in_auto_scaling_group(
        instance_id : String,
        should_decrement_desired_capacity : Bool
      ) : Types::ActivityType

        input = Types::TerminateInstanceInAutoScalingGroupType.new(instance_id: instance_id, should_decrement_desired_capacity: should_decrement_desired_capacity)
        terminate_instance_in_auto_scaling_group(input)
      end

      def terminate_instance_in_auto_scaling_group(input : Types::TerminateInstanceInAutoScalingGroupType) : Types::ActivityType
        request = Protocol::Query.build_request(Model::TERMINATE_INSTANCE_IN_AUTO_SCALING_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ActivityType, "TerminateInstanceInAutoScalingGroup")
      end

      # We strongly recommend that all Auto Scaling groups use launch templates to ensure full functionality
      # for Amazon EC2 Auto Scaling and Amazon EC2. Updates the configuration for the specified Auto Scaling
      # group. To update an Auto Scaling group, specify the name of the group and the property that you want
      # to change. Any properties that you don't specify are not changed by this update request. The new
      # settings take effect on any scaling activities after this call returns. If you associate a new
      # launch configuration or template with an Auto Scaling group, all new instances will get the updated
      # configuration. Existing instances continue to run with the configuration that they were originally
      # launched with. When you update a group to specify a mixed instances policy instead of a launch
      # configuration or template, existing instances may be replaced to match the new purchasing options
      # that you specified in the policy. For example, if the group currently has 100% On-Demand capacity
      # and the policy specifies 50% Spot capacity, this means that half of your instances will be gradually
      # terminated and relaunched as Spot Instances. When replacing instances, Amazon EC2 Auto Scaling
      # launches new instances before terminating the old ones, so that updating your group does not
      # compromise the performance or availability of your application. Note the following about changing
      # DesiredCapacity , MaxSize , or MinSize : If a scale-in activity occurs as a result of a new
      # DesiredCapacity value that is lower than the current size of the group, the Auto Scaling group uses
      # its termination policy to determine which instances to terminate. If you specify a new value for
      # MinSize without specifying a value for DesiredCapacity , and the new MinSize is larger than the
      # current size of the group, this sets the group's DesiredCapacity to the new MinSize value. If you
      # specify a new value for MaxSize without specifying a value for DesiredCapacity , and the new MaxSize
      # is smaller than the current size of the group, this sets the group's DesiredCapacity to the new
      # MaxSize value. To see which properties have been set, call the DescribeAutoScalingGroups API. To
      # view the scaling policies for an Auto Scaling group, call the DescribePolicies API. If the group has
      # scaling policies, you can update them by calling the PutScalingPolicy API.

      def update_auto_scaling_group(
        auto_scaling_group_name : String,
        availability_zone_distribution : Types::AvailabilityZoneDistribution? = nil,
        availability_zone_impairment_policy : Types::AvailabilityZoneImpairmentPolicy? = nil,
        availability_zones : Array(String)? = nil,
        capacity_rebalance : Bool? = nil,
        capacity_reservation_specification : Types::CapacityReservationSpecification? = nil,
        context : String? = nil,
        default_cooldown : Int32? = nil,
        default_instance_warmup : Int32? = nil,
        desired_capacity : Int32? = nil,
        desired_capacity_type : String? = nil,
        health_check_grace_period : Int32? = nil,
        health_check_type : String? = nil,
        instance_lifecycle_policy : Types::InstanceLifecyclePolicy? = nil,
        instance_maintenance_policy : Types::InstanceMaintenancePolicy? = nil,
        launch_configuration_name : String? = nil,
        launch_template : Types::LaunchTemplateSpecification? = nil,
        max_instance_lifetime : Int32? = nil,
        max_size : Int32? = nil,
        min_size : Int32? = nil,
        mixed_instances_policy : Types::MixedInstancesPolicy? = nil,
        new_instances_protected_from_scale_in : Bool? = nil,
        placement_group : String? = nil,
        service_linked_role_arn : String? = nil,
        skip_zonal_shift_validation : Bool? = nil,
        termination_policies : Array(String)? = nil,
        vpc_zone_identifier : String? = nil
      ) : Nil

        input = Types::UpdateAutoScalingGroupType.new(auto_scaling_group_name: auto_scaling_group_name, availability_zone_distribution: availability_zone_distribution, availability_zone_impairment_policy: availability_zone_impairment_policy, availability_zones: availability_zones, capacity_rebalance: capacity_rebalance, capacity_reservation_specification: capacity_reservation_specification, context: context, default_cooldown: default_cooldown, default_instance_warmup: default_instance_warmup, desired_capacity: desired_capacity, desired_capacity_type: desired_capacity_type, health_check_grace_period: health_check_grace_period, health_check_type: health_check_type, instance_lifecycle_policy: instance_lifecycle_policy, instance_maintenance_policy: instance_maintenance_policy, launch_configuration_name: launch_configuration_name, launch_template: launch_template, max_instance_lifetime: max_instance_lifetime, max_size: max_size, min_size: min_size, mixed_instances_policy: mixed_instances_policy, new_instances_protected_from_scale_in: new_instances_protected_from_scale_in, placement_group: placement_group, service_linked_role_arn: service_linked_role_arn, skip_zonal_shift_validation: skip_zonal_shift_validation, termination_policies: termination_policies, vpc_zone_identifier: vpc_zone_identifier)
        update_auto_scaling_group(input)
      end

      def update_auto_scaling_group(input : Types::UpdateAutoScalingGroupType) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_AUTO_SCALING_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
