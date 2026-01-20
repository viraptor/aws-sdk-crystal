require "json"
require "time"

module Aws
  module AutoScalingPlans
    module Types

      # Represents an application source.

      struct ApplicationSource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a AWS CloudFormation stack.

        @[JSON::Field(key: "CloudFormationStackARN")]
        getter cloud_formation_stack_arn : String?

        # A set of tags (up to 50).

        @[JSON::Field(key: "TagFilters")]
        getter tag_filters : Array(Types::TagFilter)?

        def initialize(
          @cloud_formation_stack_arn : String? = nil,
          @tag_filters : Array(Types::TagFilter)? = nil
        )
        end
      end

      # Concurrent updates caused an exception, for example, if you request an update to a scaling plan that
      # already has a pending update.

      struct ConcurrentUpdateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateScalingPlanRequest
        include JSON::Serializable

        # A CloudFormation stack or set of tags. You can create one scaling plan per application source. For
        # more information, see ApplicationSource in the AWS Auto Scaling API Reference .

        @[JSON::Field(key: "ApplicationSource")]
        getter application_source : Types::ApplicationSource

        # The scaling instructions. For more information, see ScalingInstruction in the AWS Auto Scaling API
        # Reference .

        @[JSON::Field(key: "ScalingInstructions")]
        getter scaling_instructions : Array(Types::ScalingInstruction)

        # The name of the scaling plan. Names cannot contain vertical bars, colons, or forward slashes.

        @[JSON::Field(key: "ScalingPlanName")]
        getter scaling_plan_name : String

        def initialize(
          @application_source : Types::ApplicationSource,
          @scaling_instructions : Array(Types::ScalingInstruction),
          @scaling_plan_name : String
        )
        end
      end


      struct CreateScalingPlanResponse
        include JSON::Serializable

        # The version number of the scaling plan. This value is always 1 . Currently, you cannot have multiple
        # scaling plan versions.

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64

        def initialize(
          @scaling_plan_version : Int64
        )
        end
      end

      # Represents a CloudWatch metric of your choosing that can be used for predictive scaling. For
      # predictive scaling to work with a customized load metric specification, AWS Auto Scaling needs
      # access to the Sum and Average statistics that CloudWatch computes from metric data. When you choose
      # a load metric, make sure that the required Sum and Average statistics for your metric are available
      # in CloudWatch and that they provide relevant data for predictive scaling. The Sum statistic must
      # represent the total load on the resource, and the Average statistic must represent the average load
      # per capacity unit of the resource. For example, there is a metric that counts the number of requests
      # processed by your Auto Scaling group. If the Sum statistic represents the total request count
      # processed by the group, then the Average statistic for the specified metric must represent the
      # average request count processed by each instance of the group. If you publish your own metrics, you
      # can aggregate the data points at a given interval and then publish the aggregated data points to
      # CloudWatch. Before AWS Auto Scaling generates the forecast, it sums up all the metric data points
      # that occurred within each hour to match the granularity period that is used in the forecast (60
      # minutes). For information about terminology, available metrics, or how to publish new metrics, see
      # Amazon CloudWatch Concepts in the Amazon CloudWatch User Guide . After creating your scaling plan,
      # you can use the AWS Auto Scaling console to visualize forecasts for the specified metric. For more
      # information, see View Scaling Information for a Resource in the AWS Auto Scaling User Guide .

      struct CustomizedLoadMetricSpecification
        include JSON::Serializable

        # The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # The namespace of the metric.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # The statistic of the metric. The only valid value is Sum .

        @[JSON::Field(key: "Statistic")]
        getter statistic : String

        # The dimensions of the metric. Conditional: If you published your metric with dimensions, you must
        # specify the same dimensions in your customized load metric specification.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::MetricDimension)?

        # The unit of the metric.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric_name : String,
          @namespace : String,
          @statistic : String,
          @dimensions : Array(Types::MetricDimension)? = nil,
          @unit : String? = nil
        )
        end
      end

      # Represents a CloudWatch metric of your choosing that can be used for dynamic scaling as part of a
      # target tracking scaling policy. To create your customized scaling metric specification: Add values
      # for each required parameter from CloudWatch. You can use an existing metric, or a new metric that
      # you create. To use your own metric, you must first publish the metric to CloudWatch. For more
      # information, see Publish Custom Metrics in the Amazon CloudWatch User Guide . Choose a metric that
      # changes proportionally with capacity. The value of the metric should increase or decrease in inverse
      # proportion to the number of capacity units. That is, the value of the metric should decrease when
      # capacity increases. For information about terminology, available metrics, or how to publish new
      # metrics, see Amazon CloudWatch Concepts in the Amazon CloudWatch User Guide .

      struct CustomizedScalingMetricSpecification
        include JSON::Serializable

        # The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # The namespace of the metric.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # The statistic of the metric.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String

        # The dimensions of the metric. Conditional: If you published your metric with dimensions, you must
        # specify the same dimensions in your customized scaling metric specification.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::MetricDimension)?

        # The unit of the metric.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric_name : String,
          @namespace : String,
          @statistic : String,
          @dimensions : Array(Types::MetricDimension)? = nil,
          @unit : String? = nil
        )
        end
      end

      # Represents a single value in the forecast data used for predictive scaling.

      struct Datapoint
        include JSON::Serializable

        # The time stamp for the data point in UTC format.

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        # The value of the data point.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @timestamp : Time? = nil,
          @value : Float64? = nil
        )
        end
      end


      struct DeleteScalingPlanRequest
        include JSON::Serializable

        # The name of the scaling plan.

        @[JSON::Field(key: "ScalingPlanName")]
        getter scaling_plan_name : String

        # The version number of the scaling plan. Currently, the only valid value is 1 .

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64

        def initialize(
          @scaling_plan_name : String,
          @scaling_plan_version : Int64
        )
        end
      end


      struct DeleteScalingPlanResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeScalingPlanResourcesRequest
        include JSON::Serializable

        # The name of the scaling plan.

        @[JSON::Field(key: "ScalingPlanName")]
        getter scaling_plan_name : String

        # The version number of the scaling plan. Currently, the only valid value is 1 .

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64

        # The maximum number of scalable resources to return. The value must be between 1 and 50. The default
        # value is 50.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @scaling_plan_name : String,
          @scaling_plan_version : Int64,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeScalingPlanResourcesResponse
        include JSON::Serializable

        # The token required to get the next set of results. This value is null if there are no more results
        # to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the scalable resources.

        @[JSON::Field(key: "ScalingPlanResources")]
        getter scaling_plan_resources : Array(Types::ScalingPlanResource)?

        def initialize(
          @next_token : String? = nil,
          @scaling_plan_resources : Array(Types::ScalingPlanResource)? = nil
        )
        end
      end


      struct DescribeScalingPlansRequest
        include JSON::Serializable

        # The sources for the applications (up to 10). If you specify scaling plan names, you cannot specify
        # application sources.

        @[JSON::Field(key: "ApplicationSources")]
        getter application_sources : Array(Types::ApplicationSource)?

        # The maximum number of scalable resources to return. This value can be between 1 and 50. The default
        # value is 50.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of the scaling plans (up to 10). If you specify application sources, you cannot specify
        # scaling plan names.

        @[JSON::Field(key: "ScalingPlanNames")]
        getter scaling_plan_names : Array(String)?

        # The version number of the scaling plan. Currently, the only valid value is 1 . If you specify a
        # scaling plan version, you must also specify a scaling plan name.

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64?

        def initialize(
          @application_sources : Array(Types::ApplicationSource)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scaling_plan_names : Array(String)? = nil,
          @scaling_plan_version : Int64? = nil
        )
        end
      end


      struct DescribeScalingPlansResponse
        include JSON::Serializable

        # The token required to get the next set of results. This value is null if there are no more results
        # to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the scaling plans.

        @[JSON::Field(key: "ScalingPlans")]
        getter scaling_plans : Array(Types::ScalingPlan)?

        def initialize(
          @next_token : String? = nil,
          @scaling_plans : Array(Types::ScalingPlan)? = nil
        )
        end
      end


      struct GetScalingPlanResourceForecastDataRequest
        include JSON::Serializable

        # The exclusive end time of the time range for the forecast data to get. The maximum time duration
        # between the start and end time is seven days. Although this parameter can accept a date and time
        # that is more than two days in the future, the availability of forecast data has limits. AWS Auto
        # Scaling only issues forecasts for periods of two days in advance.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The type of forecast data to get. LoadForecast : The load metric forecast. CapacityForecast : The
        # capacity forecast. ScheduledActionMinCapacity : The minimum capacity for each scheduled scaling
        # action. This data is calculated as the larger of two values: the capacity forecast or the minimum
        # capacity in the scaling instruction. ScheduledActionMaxCapacity : The maximum capacity for each
        # scheduled scaling action. The calculation used is determined by the predictive scaling maximum
        # capacity behavior setting in the scaling instruction.

        @[JSON::Field(key: "ForecastDataType")]
        getter forecast_data_type : String

        # The ID of the resource. This string consists of a prefix ( autoScalingGroup ) followed by the name
        # of a specified Auto Scaling group ( my-asg ). Example: autoScalingGroup/my-asg .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension for the resource. The only valid value is
        # autoscaling:autoScalingGroup:DesiredCapacity .

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The name of the scaling plan.

        @[JSON::Field(key: "ScalingPlanName")]
        getter scaling_plan_name : String

        # The version number of the scaling plan. Currently, the only valid value is 1 .

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64

        # The namespace of the AWS service. The only valid value is autoscaling .

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The inclusive start time of the time range for the forecast data to get. The date and time can be at
        # most 56 days before the current date and time.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @forecast_data_type : String,
          @resource_id : String,
          @scalable_dimension : String,
          @scaling_plan_name : String,
          @scaling_plan_version : Int64,
          @service_namespace : String,
          @start_time : Time
        )
        end
      end


      struct GetScalingPlanResourceForecastDataResponse
        include JSON::Serializable

        # The data points to return.

        @[JSON::Field(key: "Datapoints")]
        getter datapoints : Array(Types::Datapoint)

        def initialize(
          @datapoints : Array(Types::Datapoint)
        )
        end
      end

      # The service encountered an internal error.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The token provided is not valid.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your account exceeded a limit. This exception is thrown when a per-account resource limit is
      # exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a dimension for a customized metric.

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

      # The specified object could not be found.

      struct ObjectNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a predefined metric that can be used for predictive scaling. After creating your scaling
      # plan, you can use the AWS Auto Scaling console to visualize forecasts for the specified metric. For
      # more information, see View Scaling Information for a Resource in the AWS Auto Scaling User Guide .

      struct PredefinedLoadMetricSpecification
        include JSON::Serializable

        # The metric type.

        @[JSON::Field(key: "PredefinedLoadMetricType")]
        getter predefined_load_metric_type : String

        # Identifies the resource associated with the metric type. You can't specify a resource label unless
        # the metric type is ALBTargetGroupRequestCount and there is a target group for an Application Load
        # Balancer attached to the Auto Scaling group. You create the resource label by appending the final
        # portion of the load balancer ARN and the final portion of the target group ARN into a single value,
        # separated by a forward slash (/). The format is
        # app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
        # where: app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load
        # balancer ARN targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of
        # the target group ARN. This is an example:
        # app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.
        # To find the ARN for an Application Load Balancer, use the DescribeLoadBalancers API operation. To
        # find the ARN for the target group, use the DescribeTargetGroups API operation.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_load_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Represents a predefined metric that can be used for dynamic scaling as part of a target tracking
      # scaling policy.

      struct PredefinedScalingMetricSpecification
        include JSON::Serializable

        # The metric type. The ALBRequestCountPerTarget metric type applies only to Auto Scaling groups, Spot
        # Fleet requests, and ECS services.

        @[JSON::Field(key: "PredefinedScalingMetricType")]
        getter predefined_scaling_metric_type : String

        # Identifies the resource associated with the metric type. You can't specify a resource label unless
        # the metric type is ALBRequestCountPerTarget and there is a target group for an Application Load
        # Balancer attached to the Auto Scaling group, Spot Fleet request, or ECS service. You create the
        # resource label by appending the final portion of the load balancer ARN and the final portion of the
        # target group ARN into a single value, separated by a forward slash (/). The format is
        # app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
        # where: app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load
        # balancer ARN targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of
        # the target group ARN. This is an example:
        # app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.
        # To find the ARN for an Application Load Balancer, use the DescribeLoadBalancers API operation. To
        # find the ARN for the target group, use the DescribeTargetGroups API operation.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_scaling_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Describes a scaling instruction for a scalable resource in a scaling plan. Each scaling instruction
      # applies to one resource. AWS Auto Scaling creates target tracking scaling policies based on the
      # scaling instructions. Target tracking scaling policies adjust the capacity of your scalable resource
      # as required to maintain resource utilization at the target value that you specified. AWS Auto
      # Scaling also configures predictive scaling for your Amazon EC2 Auto Scaling groups using a subset of
      # parameters, including the load metric, the scaling metric, the target value for the scaling metric,
      # the predictive scaling mode (forecast and scale or forecast only), and the desired behavior when the
      # forecast capacity exceeds the maximum capacity of the resource. With predictive scaling, AWS Auto
      # Scaling generates forecasts with traffic predictions for the two days ahead and schedules scaling
      # actions that proactively add and remove resource capacity to match the forecast. We recommend
      # waiting a minimum of 24 hours after creating an Auto Scaling group to configure predictive scaling.
      # At minimum, there must be 24 hours of historical data to generate a forecast. For more information,
      # see Best Practices for AWS Auto Scaling in the AWS Auto Scaling User Guide .

      struct ScalingInstruction
        include JSON::Serializable

        # The maximum capacity of the resource. The exception to this upper limit is if you specify a
        # non-default setting for PredictiveScalingMaxCapacityBehavior .

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32

        # The minimum capacity of the resource.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Int32

        # The ID of the resource. This string consists of the resource type and unique identifier. Auto
        # Scaling group - The resource type is autoScalingGroup and the unique identifier is the name of the
        # Auto Scaling group. Example: autoScalingGroup/my-asg . ECS service - The resource type is service
        # and the unique identifier is the cluster name and service name. Example:
        # service/default/sample-webapp . Spot Fleet request - The resource type is spot-fleet-request and the
        # unique identifier is the Spot Fleet request ID. Example:
        # spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . DynamoDB table - The resource type is
        # table and the unique identifier is the resource ID. Example: table/my-table . DynamoDB global
        # secondary index - The resource type is index and the unique identifier is the resource ID. Example:
        # table/my-table/index/my-table-index . Aurora DB cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:my-db-cluster .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension associated with the resource. autoscaling:autoScalingGroup:DesiredCapacity -
        # The desired capacity of an Auto Scaling group. ecs:service:DesiredCount - The desired task count of
        # an ECS service. ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet request.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the AWS service.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The target tracking configurations (up to 10). Each of these structures must specify a unique
        # scaling metric and a target value for the metric.

        @[JSON::Field(key: "TargetTrackingConfigurations")]
        getter target_tracking_configurations : Array(Types::TargetTrackingConfiguration)

        # The customized load metric to use for predictive scaling. This parameter or a
        # PredefinedLoadMetricSpecification is required when configuring predictive scaling, and cannot be
        # used otherwise.

        @[JSON::Field(key: "CustomizedLoadMetricSpecification")]
        getter customized_load_metric_specification : Types::CustomizedLoadMetricSpecification?

        # Controls whether dynamic scaling by AWS Auto Scaling is disabled. When dynamic scaling is enabled,
        # AWS Auto Scaling creates target tracking scaling policies based on the specified target tracking
        # configurations. The default is enabled ( false ).

        @[JSON::Field(key: "DisableDynamicScaling")]
        getter disable_dynamic_scaling : Bool?

        # The predefined load metric to use for predictive scaling. This parameter or a
        # CustomizedLoadMetricSpecification is required when configuring predictive scaling, and cannot be
        # used otherwise.

        @[JSON::Field(key: "PredefinedLoadMetricSpecification")]
        getter predefined_load_metric_specification : Types::PredefinedLoadMetricSpecification?

        # Defines the behavior that should be applied if the forecast capacity approaches or exceeds the
        # maximum capacity specified for the resource. The default value is SetForecastCapacityToMaxCapacity .
        # The following are possible values: SetForecastCapacityToMaxCapacity - AWS Auto Scaling cannot scale
        # resource capacity higher than the maximum capacity. The maximum capacity is enforced as a hard
        # limit. SetMaxCapacityToForecastCapacity - AWS Auto Scaling may scale resource capacity higher than
        # the maximum capacity to equal but not exceed forecast capacity. SetMaxCapacityAboveForecastCapacity
        # - AWS Auto Scaling may scale resource capacity higher than the maximum capacity by a specified
        # buffer value. The intention is to give the target tracking scaling policy extra capacity if
        # unexpected traffic occurs. Only valid when configuring predictive scaling.

        @[JSON::Field(key: "PredictiveScalingMaxCapacityBehavior")]
        getter predictive_scaling_max_capacity_behavior : String?

        # The size of the capacity buffer to use when the forecast capacity is close to or exceeds the maximum
        # capacity. The value is specified as a percentage relative to the forecast capacity. For example, if
        # the buffer is 10, this means a 10 percent buffer, such that if the forecast capacity is 50, and the
        # maximum capacity is 40, then the effective maximum capacity is 55. Only valid when configuring
        # predictive scaling. Required if the PredictiveScalingMaxCapacityBehavior is set to
        # SetMaxCapacityAboveForecastCapacity , and cannot be used otherwise. The range is 1-100.

        @[JSON::Field(key: "PredictiveScalingMaxCapacityBuffer")]
        getter predictive_scaling_max_capacity_buffer : Int32?

        # The predictive scaling mode. The default value is ForecastAndScale . Otherwise, AWS Auto Scaling
        # forecasts capacity but does not create any scheduled scaling actions based on the capacity forecast.

        @[JSON::Field(key: "PredictiveScalingMode")]
        getter predictive_scaling_mode : String?

        # Controls whether a resource's externally created scaling policies are kept or replaced. The default
        # value is KeepExternalPolicies . If the parameter is set to ReplaceExternalPolicies , any scaling
        # policies that are external to AWS Auto Scaling are deleted and new target tracking scaling policies
        # created. Only valid when configuring dynamic scaling. Condition: The number of existing policies to
        # be replaced must be less than or equal to 50. If there are more than 50 policies to be replaced, AWS
        # Auto Scaling keeps all existing policies and does not create new ones.

        @[JSON::Field(key: "ScalingPolicyUpdateBehavior")]
        getter scaling_policy_update_behavior : String?

        # The amount of time, in seconds, to buffer the run time of scheduled scaling actions when scaling
        # out. For example, if the forecast says to add capacity at 10:00 AM, and the buffer time is 5
        # minutes, then the run time of the corresponding scheduled scaling action will be 9:55 AM. The
        # intention is to give resources time to be provisioned. For example, it can take a few minutes to
        # launch an EC2 instance. The actual amount of time required depends on several factors, such as the
        # size of the instance and whether there are startup scripts to complete. The value must be less than
        # the forecast interval duration of 3600 seconds (60 minutes). The default is 300 seconds. Only valid
        # when configuring predictive scaling.

        @[JSON::Field(key: "ScheduledActionBufferTime")]
        getter scheduled_action_buffer_time : Int32?

        def initialize(
          @max_capacity : Int32,
          @min_capacity : Int32,
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String,
          @target_tracking_configurations : Array(Types::TargetTrackingConfiguration),
          @customized_load_metric_specification : Types::CustomizedLoadMetricSpecification? = nil,
          @disable_dynamic_scaling : Bool? = nil,
          @predefined_load_metric_specification : Types::PredefinedLoadMetricSpecification? = nil,
          @predictive_scaling_max_capacity_behavior : String? = nil,
          @predictive_scaling_max_capacity_buffer : Int32? = nil,
          @predictive_scaling_mode : String? = nil,
          @scaling_policy_update_behavior : String? = nil,
          @scheduled_action_buffer_time : Int32? = nil
        )
        end
      end

      # Represents a scaling plan.

      struct ScalingPlan
        include JSON::Serializable

        # A CloudFormation stack or a set of tags. You can create one scaling plan per application source.

        @[JSON::Field(key: "ApplicationSource")]
        getter application_source : Types::ApplicationSource

        # The scaling instructions.

        @[JSON::Field(key: "ScalingInstructions")]
        getter scaling_instructions : Array(Types::ScalingInstruction)

        # The name of the scaling plan.

        @[JSON::Field(key: "ScalingPlanName")]
        getter scaling_plan_name : String

        # The version number of the scaling plan.

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64

        # The status of the scaling plan. Active - The scaling plan is active. ActiveWithProblems - The
        # scaling plan is active, but the scaling configuration for one or more resources could not be
        # applied. CreationInProgress - The scaling plan is being created. CreationFailed - The scaling plan
        # could not be created. DeletionInProgress - The scaling plan is being deleted. DeletionFailed - The
        # scaling plan could not be deleted. UpdateInProgress - The scaling plan is being updated.
        # UpdateFailed - The scaling plan could not be updated.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String

        # The Unix time stamp when the scaling plan was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A simple message about the current status of the scaling plan.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The Unix time stamp when the scaling plan entered the current status.

        @[JSON::Field(key: "StatusStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter status_start_time : Time?

        def initialize(
          @application_source : Types::ApplicationSource,
          @scaling_instructions : Array(Types::ScalingInstruction),
          @scaling_plan_name : String,
          @scaling_plan_version : Int64,
          @status_code : String,
          @creation_time : Time? = nil,
          @status_message : String? = nil,
          @status_start_time : Time? = nil
        )
        end
      end

      # Represents a scalable resource.

      struct ScalingPlanResource
        include JSON::Serializable

        # The ID of the resource. This string consists of the resource type and unique identifier. Auto
        # Scaling group - The resource type is autoScalingGroup and the unique identifier is the name of the
        # Auto Scaling group. Example: autoScalingGroup/my-asg . ECS service - The resource type is service
        # and the unique identifier is the cluster name and service name. Example:
        # service/default/sample-webapp . Spot Fleet request - The resource type is spot-fleet-request and the
        # unique identifier is the Spot Fleet request ID. Example:
        # spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . DynamoDB table - The resource type is
        # table and the unique identifier is the resource ID. Example: table/my-table . DynamoDB global
        # secondary index - The resource type is index and the unique identifier is the resource ID. Example:
        # table/my-table/index/my-table-index . Aurora DB cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:my-db-cluster .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension for the resource. autoscaling:autoScalingGroup:DesiredCapacity - The desired
        # capacity of an Auto Scaling group. ecs:service:DesiredCount - The desired task count of an ECS
        # service. ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet request.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The name of the scaling plan.

        @[JSON::Field(key: "ScalingPlanName")]
        getter scaling_plan_name : String

        # The version number of the scaling plan.

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64

        # The scaling status of the resource. Active - The scaling configuration is active. Inactive - The
        # scaling configuration is not active because the scaling plan is being created or the scaling
        # configuration could not be applied. Check the status message for more information. PartiallyActive -
        # The scaling configuration is partially active because the scaling plan is being created or deleted
        # or the scaling configuration could not be fully applied. Check the status message for more
        # information.

        @[JSON::Field(key: "ScalingStatusCode")]
        getter scaling_status_code : String

        # The namespace of the AWS service.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The scaling policies.

        @[JSON::Field(key: "ScalingPolicies")]
        getter scaling_policies : Array(Types::ScalingPolicy)?

        # A simple message about the current scaling status of the resource.

        @[JSON::Field(key: "ScalingStatusMessage")]
        getter scaling_status_message : String?

        def initialize(
          @resource_id : String,
          @scalable_dimension : String,
          @scaling_plan_name : String,
          @scaling_plan_version : Int64,
          @scaling_status_code : String,
          @service_namespace : String,
          @scaling_policies : Array(Types::ScalingPolicy)? = nil,
          @scaling_status_message : String? = nil
        )
        end
      end

      # Represents a scaling policy.

      struct ScalingPolicy
        include JSON::Serializable

        # The name of the scaling policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The type of scaling policy.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # The target tracking scaling policy. Includes support for predefined or customized metrics.

        @[JSON::Field(key: "TargetTrackingConfiguration")]
        getter target_tracking_configuration : Types::TargetTrackingConfiguration?

        def initialize(
          @policy_name : String,
          @policy_type : String,
          @target_tracking_configuration : Types::TargetTrackingConfiguration? = nil
        )
        end
      end

      # Represents a tag.

      struct TagFilter
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The tag values (0 to 20).

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes a target tracking configuration to use with AWS Auto Scaling. Used with ScalingInstruction
      # and ScalingPolicy .

      struct TargetTrackingConfiguration
        include JSON::Serializable

        # The target value for the metric. Although this property accepts numbers of type Double, it won't
        # accept values that are either too small or too large. Values must be in the range of -2^360 to
        # 2^360.

        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        # A customized metric. You can specify either a predefined metric or a customized metric.

        @[JSON::Field(key: "CustomizedScalingMetricSpecification")]
        getter customized_scaling_metric_specification : Types::CustomizedScalingMetricSpecification?

        # Indicates whether scale in by the target tracking scaling policy is disabled. If the value is true ,
        # scale in is disabled and the target tracking scaling policy doesn't remove capacity from the
        # scalable resource. Otherwise, scale in is enabled and the target tracking scaling policy can remove
        # capacity from the scalable resource. The default value is false .

        @[JSON::Field(key: "DisableScaleIn")]
        getter disable_scale_in : Bool?

        # The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch
        # metrics. This value is used only if the resource is an Auto Scaling group.

        @[JSON::Field(key: "EstimatedInstanceWarmup")]
        getter estimated_instance_warmup : Int32?

        # A predefined metric. You can specify either a predefined metric or a customized metric.

        @[JSON::Field(key: "PredefinedScalingMetricSpecification")]
        getter predefined_scaling_metric_specification : Types::PredefinedScalingMetricSpecification?

        # The amount of time, in seconds, after a scale-in activity completes before another scale-in activity
        # can start. This property is not used if the scalable resource is an Auto Scaling group. With the
        # scale-in cooldown period , the intention is to scale in conservatively to protect your application’s
        # availability, so scale-in activities are blocked until the cooldown period has expired. However, if
        # another alarm triggers a scale-out activity during the scale-in cooldown period, Auto Scaling scales
        # out the target immediately. In this case, the scale-in cooldown period stops and doesn't complete.

        @[JSON::Field(key: "ScaleInCooldown")]
        getter scale_in_cooldown : Int32?

        # The amount of time, in seconds, to wait for a previous scale-out activity to take effect. This
        # property is not used if the scalable resource is an Auto Scaling group. With the scale-out cooldown
        # period , the intention is to continuously (but not excessively) scale out. After Auto Scaling
        # successfully scales out using a target tracking scaling policy, it starts to calculate the cooldown
        # time. The scaling policy won't increase the desired capacity again unless either a larger scale out
        # is triggered or the cooldown period ends.

        @[JSON::Field(key: "ScaleOutCooldown")]
        getter scale_out_cooldown : Int32?

        def initialize(
          @target_value : Float64,
          @customized_scaling_metric_specification : Types::CustomizedScalingMetricSpecification? = nil,
          @disable_scale_in : Bool? = nil,
          @estimated_instance_warmup : Int32? = nil,
          @predefined_scaling_metric_specification : Types::PredefinedScalingMetricSpecification? = nil,
          @scale_in_cooldown : Int32? = nil,
          @scale_out_cooldown : Int32? = nil
        )
        end
      end


      struct UpdateScalingPlanRequest
        include JSON::Serializable

        # The name of the scaling plan.

        @[JSON::Field(key: "ScalingPlanName")]
        getter scaling_plan_name : String

        # The version number of the scaling plan. The only valid value is 1 . Currently, you cannot have
        # multiple scaling plan versions.

        @[JSON::Field(key: "ScalingPlanVersion")]
        getter scaling_plan_version : Int64

        # A CloudFormation stack or set of tags. For more information, see ApplicationSource in the AWS Auto
        # Scaling API Reference .

        @[JSON::Field(key: "ApplicationSource")]
        getter application_source : Types::ApplicationSource?

        # The scaling instructions. For more information, see ScalingInstruction in the AWS Auto Scaling API
        # Reference .

        @[JSON::Field(key: "ScalingInstructions")]
        getter scaling_instructions : Array(Types::ScalingInstruction)?

        def initialize(
          @scaling_plan_name : String,
          @scaling_plan_version : Int64,
          @application_source : Types::ApplicationSource? = nil,
          @scaling_instructions : Array(Types::ScalingInstruction)? = nil
        )
        end
      end


      struct UpdateScalingPlanResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An exception was thrown for a validation issue. Review the parameters provided.

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
