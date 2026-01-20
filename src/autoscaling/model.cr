module Aws
  module AutoScaling
    module Model
      API_VERSION = "2011-01-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "autoscaling"
      ENDPOINT_PREFIX = "autoscaling"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://autoscaling-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://autoscaling.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://autoscaling-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://autoscaling.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://autoscaling.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ATTACH_INSTANCES = OperationModel.new(
        name: "AttachInstances",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_LOAD_BALANCER_TARGET_GROUPS = OperationModel.new(
        name: "AttachLoadBalancerTargetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_LOAD_BALANCERS = OperationModel.new(
        name: "AttachLoadBalancers",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_TRAFFIC_SOURCES = OperationModel.new(
        name: "AttachTrafficSources",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_SCHEDULED_ACTION = OperationModel.new(
        name: "BatchDeleteScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_PUT_SCHEDULED_UPDATE_GROUP_ACTION = OperationModel.new(
        name: "BatchPutScheduledUpdateGroupAction",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_INSTANCE_REFRESH = OperationModel.new(
        name: "CancelInstanceRefresh",
        http_method: "POST",
        request_uri: "/"
      )

      COMPLETE_LIFECYCLE_ACTION = OperationModel.new(
        name: "CompleteLifecycleAction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AUTO_SCALING_GROUP = OperationModel.new(
        name: "CreateAutoScalingGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LAUNCH_CONFIGURATION = OperationModel.new(
        name: "CreateLaunchConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OR_UPDATE_TAGS = OperationModel.new(
        name: "CreateOrUpdateTags",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AUTO_SCALING_GROUP = OperationModel.new(
        name: "DeleteAutoScalingGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LAUNCH_CONFIGURATION = OperationModel.new(
        name: "DeleteLaunchConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LIFECYCLE_HOOK = OperationModel.new(
        name: "DeleteLifecycleHook",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "DeleteNotificationConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCHEDULED_ACTION = OperationModel.new(
        name: "DeleteScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WARM_POOL = OperationModel.new(
        name: "DeleteWarmPool",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_LIMITS = OperationModel.new(
        name: "DescribeAccountLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ADJUSTMENT_TYPES = OperationModel.new(
        name: "DescribeAdjustmentTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTO_SCALING_GROUPS = OperationModel.new(
        name: "DescribeAutoScalingGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTO_SCALING_INSTANCES = OperationModel.new(
        name: "DescribeAutoScalingInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTO_SCALING_NOTIFICATION_TYPES = OperationModel.new(
        name: "DescribeAutoScalingNotificationTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_REFRESHES = OperationModel.new(
        name: "DescribeInstanceRefreshes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LAUNCH_CONFIGURATIONS = OperationModel.new(
        name: "DescribeLaunchConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LIFECYCLE_HOOK_TYPES = OperationModel.new(
        name: "DescribeLifecycleHookTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LIFECYCLE_HOOKS = OperationModel.new(
        name: "DescribeLifecycleHooks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCER_TARGET_GROUPS = OperationModel.new(
        name: "DescribeLoadBalancerTargetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCERS = OperationModel.new(
        name: "DescribeLoadBalancers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_METRIC_COLLECTION_TYPES = OperationModel.new(
        name: "DescribeMetricCollectionTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NOTIFICATION_CONFIGURATIONS = OperationModel.new(
        name: "DescribeNotificationConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_POLICIES = OperationModel.new(
        name: "DescribePolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCALING_ACTIVITIES = OperationModel.new(
        name: "DescribeScalingActivities",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCALING_PROCESS_TYPES = OperationModel.new(
        name: "DescribeScalingProcessTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCHEDULED_ACTIONS = OperationModel.new(
        name: "DescribeScheduledActions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TERMINATION_POLICY_TYPES = OperationModel.new(
        name: "DescribeTerminationPolicyTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAFFIC_SOURCES = OperationModel.new(
        name: "DescribeTrafficSources",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WARM_POOL = OperationModel.new(
        name: "DescribeWarmPool",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_INSTANCES = OperationModel.new(
        name: "DetachInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_LOAD_BALANCER_TARGET_GROUPS = OperationModel.new(
        name: "DetachLoadBalancerTargetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_LOAD_BALANCERS = OperationModel.new(
        name: "DetachLoadBalancers",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_TRAFFIC_SOURCES = OperationModel.new(
        name: "DetachTrafficSources",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_METRICS_COLLECTION = OperationModel.new(
        name: "DisableMetricsCollection",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_METRICS_COLLECTION = OperationModel.new(
        name: "EnableMetricsCollection",
        http_method: "POST",
        request_uri: "/"
      )

      ENTER_STANDBY = OperationModel.new(
        name: "EnterStandby",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_POLICY = OperationModel.new(
        name: "ExecutePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      EXIT_STANDBY = OperationModel.new(
        name: "ExitStandby",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PREDICTIVE_SCALING_FORECAST = OperationModel.new(
        name: "GetPredictiveScalingForecast",
        http_method: "POST",
        request_uri: "/"
      )

      LAUNCH_INSTANCES = OperationModel.new(
        name: "LaunchInstances",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LIFECYCLE_HOOK = OperationModel.new(
        name: "PutLifecycleHook",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "PutNotificationConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SCALING_POLICY = OperationModel.new(
        name: "PutScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SCHEDULED_UPDATE_GROUP_ACTION = OperationModel.new(
        name: "PutScheduledUpdateGroupAction",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_WARM_POOL = OperationModel.new(
        name: "PutWarmPool",
        http_method: "POST",
        request_uri: "/"
      )

      RECORD_LIFECYCLE_ACTION_HEARTBEAT = OperationModel.new(
        name: "RecordLifecycleActionHeartbeat",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_PROCESSES = OperationModel.new(
        name: "ResumeProcesses",
        http_method: "POST",
        request_uri: "/"
      )

      ROLLBACK_INSTANCE_REFRESH = OperationModel.new(
        name: "RollbackInstanceRefresh",
        http_method: "POST",
        request_uri: "/"
      )

      SET_DESIRED_CAPACITY = OperationModel.new(
        name: "SetDesiredCapacity",
        http_method: "POST",
        request_uri: "/"
      )

      SET_INSTANCE_HEALTH = OperationModel.new(
        name: "SetInstanceHealth",
        http_method: "POST",
        request_uri: "/"
      )

      SET_INSTANCE_PROTECTION = OperationModel.new(
        name: "SetInstanceProtection",
        http_method: "POST",
        request_uri: "/"
      )

      START_INSTANCE_REFRESH = OperationModel.new(
        name: "StartInstanceRefresh",
        http_method: "POST",
        request_uri: "/"
      )

      SUSPEND_PROCESSES = OperationModel.new(
        name: "SuspendProcesses",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_INSTANCE_IN_AUTO_SCALING_GROUP = OperationModel.new(
        name: "TerminateInstanceInAutoScalingGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_AUTO_SCALING_GROUP = OperationModel.new(
        name: "UpdateAutoScalingGroup",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
