require "json"
require "time"

module AwsSdk
  module ComputeOptimizer
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

      # Describes the enrollment status of an organization's member accounts in Compute Optimizer.
      struct AccountEnrollmentStatus
        include JSON::Serializable

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Unix epoch timestamp, in seconds, of when the account enrollment status was last updated.
        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The account enrollment status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason for the account enrollment status. For example, an account might show a status of Pending
        # because member accounts of an organization require more time to be enrolled in the service.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @account_id : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Describes the configuration of an EC2 Amazon EC2 Auto Scaling group.
      struct AutoScalingGroupConfiguration
        include JSON::Serializable

        # Describes the allocation strategy that the EC2 Amazon EC2 Auto Scaling group uses. This field is
        # only available for EC2 Amazon EC2 Auto Scaling groups with mixed instance types.
        @[JSON::Field(key: "allocationStrategy")]
        getter allocation_strategy : String?

        # The desired capacity, or number of instances, for the EC2 Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "desiredCapacity")]
        getter desired_capacity : Int32?

        # Describes the projected percentage reduction in instance hours after adopting the recommended
        # configuration. This field is only available for EC2 Amazon EC2 Auto Scaling groups with scaling
        # policies.
        @[JSON::Field(key: "estimatedInstanceHourReductionPercentage")]
        getter estimated_instance_hour_reduction_percentage : Float64?

        # The instance type for the EC2 Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The maximum size, or maximum number of instances, for the EC2 Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "maxSize")]
        getter max_size : Int32?

        # The minimum size, or minimum number of instances, for the EC2 Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "minSize")]
        getter min_size : Int32?

        # List the instance types within an EC2 Amazon EC2 Auto Scaling group that has mixed instance types.
        @[JSON::Field(key: "mixedInstanceTypes")]
        getter mixed_instance_types : Array(String)?

        # Describes whether the EC2 Amazon EC2 Auto Scaling group has a single instance type or a mixed
        # instance type configuration.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @allocation_strategy : String? = nil,
          @desired_capacity : Int32? = nil,
          @estimated_instance_hour_reduction_percentage : Float64? = nil,
          @instance_type : String? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil,
          @mixed_instance_types : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # An object that describes the estimated monthly savings possible by adopting Compute Optimizer’s
      # Amazon EC2 Auto Scaling group recommendations. This is based on the Savings Plans and Reserved
      # Instances discounts.
      struct AutoScalingGroupEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes an Amazon EC2 Auto Scaling group recommendation.
      struct AutoScalingGroupRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Resource Name (ARN) of the Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "autoScalingGroupArn")]
        getter auto_scaling_group_arn : String?

        # The name of the Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "autoScalingGroupName")]
        getter auto_scaling_group_name : String?

        # An array of objects that describe the current configuration of the Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "currentConfiguration")]
        getter current_configuration : Types::AutoScalingGroupConfiguration?

        # Describes the GPU accelerator settings for the current instance type of the Amazon EC2 Auto Scaling
        # group.
        @[JSON::Field(key: "currentInstanceGpuInfo")]
        getter current_instance_gpu_info : Types::GpuInfo?

        # The risk of the current Amazon EC2 Auto Scaling group not meeting the performance needs of its
        # workloads. The higher the risk, the more likely the current Amazon EC2 Auto Scaling group
        # configuration has insufficient capacity and cannot meet workload requirements.
        @[JSON::Field(key: "currentPerformanceRisk")]
        getter current_performance_risk : String?

        # An object that describes the effective recommendation preferences for the Amazon EC2 Auto Scaling
        # group.
        @[JSON::Field(key: "effectiveRecommendationPreferences")]
        getter effective_recommendation_preferences : Types::EffectiveRecommendationPreferences?

        # The finding classification of the Amazon EC2 Auto Scaling group. Findings for Amazon EC2 Auto
        # Scaling groups include: NotOptimized —An Amazon EC2 Auto Scaling group is considered not optimized
        # when Compute Optimizer identifies a recommendation that can provide better performance for your
        # workload. Optimized —An Amazon EC2 Auto Scaling group is considered optimized when Compute Optimizer
        # determines that the group is correctly provisioned to run your workload based on the chosen instance
        # type. For optimized resources, Compute Optimizer might recommend a new generation instance type.
        @[JSON::Field(key: "finding")]
        getter finding : String?

        # The applications that might be running on the instances in the Amazon EC2 Auto Scaling group as
        # inferred by Compute Optimizer. Compute Optimizer can infer if one of the following applications
        # might be running on the instances: AmazonEmr - Infers that Amazon EMR might be running on the
        # instances. ApacheCassandra - Infers that Apache Cassandra might be running on the instances.
        # ApacheHadoop - Infers that Apache Hadoop might be running on the instances. Memcached - Infers that
        # Memcached might be running on the instances. NGINX - Infers that NGINX might be running on the
        # instances. PostgreSql - Infers that PostgreSQL might be running on the instances. Redis - Infers
        # that Redis might be running on the instances. Kafka - Infers that Kafka might be running on the
        # instance. SQLServer - Infers that SQLServer might be running on the instance.
        @[JSON::Field(key: "inferredWorkloadTypes")]
        getter inferred_workload_types : Array(String)?

        # The timestamp of when the Amazon EC2 Auto Scaling group recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The number of days for which utilization metrics were analyzed for the Amazon EC2 Auto Scaling
        # group.
        @[JSON::Field(key: "lookBackPeriodInDays")]
        getter look_back_period_in_days : Float64?

        # An array of objects that describe the recommendation options for the Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "recommendationOptions")]
        getter recommendation_options : Array(Types::AutoScalingGroupRecommendationOption)?

        # An array of objects that describe the utilization metrics of the Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "utilizationMetrics")]
        getter utilization_metrics : Array(Types::UtilizationMetric)?

        def initialize(
          @account_id : String? = nil,
          @auto_scaling_group_arn : String? = nil,
          @auto_scaling_group_name : String? = nil,
          @current_configuration : Types::AutoScalingGroupConfiguration? = nil,
          @current_instance_gpu_info : Types::GpuInfo? = nil,
          @current_performance_risk : String? = nil,
          @effective_recommendation_preferences : Types::EffectiveRecommendationPreferences? = nil,
          @finding : String? = nil,
          @inferred_workload_types : Array(String)? = nil,
          @last_refresh_timestamp : Time? = nil,
          @look_back_period_in_days : Float64? = nil,
          @recommendation_options : Array(Types::AutoScalingGroupRecommendationOption)? = nil,
          @utilization_metrics : Array(Types::UtilizationMetric)? = nil
        )
        end
      end

      # Describes a recommendation option for an Amazon EC2 Auto Scaling group.
      struct AutoScalingGroupRecommendationOption
        include JSON::Serializable

        # An array of objects that describe an Amazon EC2 Auto Scaling group configuration.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AutoScalingGroupConfiguration?

        # Describes the GPU accelerator settings for the recommended instance type of the Amazon EC2 Auto
        # Scaling group.
        @[JSON::Field(key: "instanceGpuInfo")]
        getter instance_gpu_info : Types::GpuInfo?

        # The level of effort required to migrate from the current instance type to the recommended instance
        # type. For example, the migration effort is Low if Amazon EMR is the inferred workload type and an
        # Amazon Web Services Graviton instance type is recommended. The migration effort is Medium if a
        # workload type couldn't be inferred but an Amazon Web Services Graviton instance type is recommended.
        # The migration effort is VeryLow if both the current and recommended instance types are of the same
        # CPU architecture.
        @[JSON::Field(key: "migrationEffort")]
        getter migration_effort : String?

        # The performance risk of the Amazon EC2 Auto Scaling group configuration recommendation. Performance
        # risk indicates the likelihood of the recommended instance type not meeting the resource needs of
        # your workload. Compute Optimizer calculates an individual performance risk score for each
        # specification of the recommended instance, including CPU, memory, EBS throughput, EBS IOPS, disk
        # throughput, disk IOPS, network throughput, and network PPS. The performance risk of the recommended
        # instance is calculated as the maximum performance risk score across the analyzed resource
        # specifications. The value ranges from 0 - 4 , with 0 meaning that the recommended resource is
        # predicted to always provide enough hardware capability. The higher the performance risk is, the more
        # likely you should validate whether the recommendation will meet the performance requirements of your
        # workload before migrating your resource.
        @[JSON::Field(key: "performanceRisk")]
        getter performance_risk : Float64?

        # An array of objects that describe the projected utilization metrics of the Amazon EC2 Auto Scaling
        # group recommendation option. The Cpu and Memory metrics are the only projected utilization metrics
        # returned. Additionally, the Memory metric is returned only for resources that have the unified
        # CloudWatch agent installed on them. For more information, see Enabling Memory Utilization with the
        # CloudWatch Agent .
        @[JSON::Field(key: "projectedUtilizationMetrics")]
        getter projected_utilization_metrics : Array(Types::UtilizationMetric)?

        # The rank of the Amazon EC2 Auto Scaling group recommendation option. The top recommendation option
        # is ranked as 1 .
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # An object that describes the savings opportunity for the Amazon EC2 Auto Scaling group
        # recommendation option. Savings opportunity includes the estimated monthly savings amount and
        # percentage.
        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # An object that describes the savings opportunity for the Amazon EC2 Auto Scaling group
        # recommendation option that includes Savings Plans and Reserved Instances discounts. Savings
        # opportunity includes the estimated monthly savings and percentage.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::AutoScalingGroupSavingsOpportunityAfterDiscounts?

        def initialize(
          @configuration : Types::AutoScalingGroupConfiguration? = nil,
          @instance_gpu_info : Types::GpuInfo? = nil,
          @migration_effort : String? = nil,
          @performance_risk : Float64? = nil,
          @projected_utilization_metrics : Array(Types::UtilizationMetric)? = nil,
          @rank : Int32? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::AutoScalingGroupSavingsOpportunityAfterDiscounts? = nil
        )
        end
      end

      # Describes the savings opportunity for Amazon EC2 Auto Scaling group recommendations after applying
      # the Savings Plans and Reserved Instances discounts. Savings opportunity represents the estimated
      # monthly savings you can achieve by implementing Compute Optimizer recommendations.
      struct AutoScalingGroupSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # An object that describes the estimated monthly savings possible by adopting Compute Optimizer’s
        # Amazon EC2 Auto Scaling group recommendations. This is based on the Savings Plans and Reserved
        # Instances pricing discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::AutoScalingGroupEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost after applying the Savings
        # Plans and Reserved Instances discounts. This saving can be achieved by adopting Compute Optimizer’s
        # Amazon EC2 Auto Scaling group recommendations.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::AutoScalingGroupEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes the container configurations within the tasks of your Amazon ECS service.
      struct ContainerConfiguration
        include JSON::Serializable

        # The name of the container.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The number of CPU units reserved for the container.
        @[JSON::Field(key: "cpu")]
        getter cpu : Int32?

        # The memory size configurations for the container.
        @[JSON::Field(key: "memorySizeConfiguration")]
        getter memory_size_configuration : Types::MemorySizeConfiguration?

        def initialize(
          @container_name : String? = nil,
          @cpu : Int32? = nil,
          @memory_size_configuration : Types::MemorySizeConfiguration? = nil
        )
        end
      end

      # The CPU and memory recommendations for a container within the tasks of your Amazon ECS service.
      struct ContainerRecommendation
        include JSON::Serializable

        # The name of the container.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The recommended number of CPU units reserved for the container.
        @[JSON::Field(key: "cpu")]
        getter cpu : Int32?

        # The recommended memory size configurations for the container.
        @[JSON::Field(key: "memorySizeConfiguration")]
        getter memory_size_configuration : Types::MemorySizeConfiguration?

        def initialize(
          @container_name : String? = nil,
          @cpu : Int32? = nil,
          @memory_size_configuration : Types::MemorySizeConfiguration? = nil
        )
        end
      end

      # Describes the performance risk ratings for a given resource type. Resources with a high or medium
      # rating are at risk of not meeting the performance needs of their workloads, while resources with a
      # low rating are performing well in their workloads.
      struct CurrentPerformanceRiskRatings
        include JSON::Serializable

        # A count of the applicable resource types with a high performance risk rating.
        @[JSON::Field(key: "high")]
        getter high : Int64?

        # A count of the applicable resource types with a low performance risk rating.
        @[JSON::Field(key: "low")]
        getter low : Int64?

        # A count of the applicable resource types with a medium performance risk rating.
        @[JSON::Field(key: "medium")]
        getter medium : Int64?

        # A count of the applicable resource types with a very low performance risk rating.
        @[JSON::Field(key: "veryLow")]
        getter very_low : Int64?

        def initialize(
          @high : Int64? = nil,
          @low : Int64? = nil,
          @medium : Int64? = nil,
          @very_low : Int64? = nil
        )
        end
      end

      # Defines the various metric parameters that can be customized, such as threshold and headroom.
      struct CustomizableMetricParameters
        include JSON::Serializable

        # The headroom value in percentage used for the specified metric parameter. The following lists the
        # valid values for CPU and memory utilization. CPU utilization: PERCENT_30 | PERCENT_20 | PERCENT_0
        # Memory utilization: PERCENT_30 | PERCENT_20 | PERCENT_10
        @[JSON::Field(key: "headroom")]
        getter headroom : String?

        # The threshold value used for the specified metric parameter. You can only specify the threshold
        # value for CPU utilization.
        @[JSON::Field(key: "threshold")]
        getter threshold : String?

        def initialize(
          @headroom : String? = nil,
          @threshold : String? = nil
        )
        end
      end

      # The configuration of the recommended RDS storage.
      struct DBStorageConfiguration
        include JSON::Serializable

        # The size of the DB storage in gigabytes (GB).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The provisioned IOPs of the DB storage.
        @[JSON::Field(key: "iops")]
        getter iops : Int32?

        # The maximum limit in gibibytes (GiB) to which Amazon RDS can automatically scale the storage of the
        # DB instance.
        @[JSON::Field(key: "maxAllocatedStorage")]
        getter max_allocated_storage : Int32?

        # The storage throughput of the DB storage.
        @[JSON::Field(key: "storageThroughput")]
        getter storage_throughput : Int32?

        # The type of DB storage.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        def initialize(
          @allocated_storage : Int32? = nil,
          @iops : Int32? = nil,
          @max_allocated_storage : Int32? = nil,
          @storage_throughput : Int32? = nil,
          @storage_type : String? = nil
        )
        end
      end

      struct DeleteRecommendationPreferencesRequest
        include JSON::Serializable

        # The name of the recommendation preference to delete.
        @[JSON::Field(key: "recommendationPreferenceNames")]
        getter recommendation_preference_names : Array(String)

        # The target resource type of the recommendation preference to delete. The Ec2Instance option
        # encompasses standalone instances and instances that are part of Amazon EC2 Auto Scaling groups. The
        # AutoScalingGroup option encompasses only instances that are part of an Amazon EC2 Auto Scaling
        # group.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # An object that describes the scope of the recommendation preference to delete. You can delete
        # recommendation preferences that are created at the organization level (for management accounts of an
        # organization only), account level, and resource level. For more information, see Activating enhanced
        # infrastructure metrics in the Compute Optimizer User Guide .
        @[JSON::Field(key: "scope")]
        getter scope : Types::Scope?

        def initialize(
          @recommendation_preference_names : Array(String),
          @resource_type : String,
          @scope : Types::Scope? = nil
        )
        end
      end

      struct DeleteRecommendationPreferencesResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeRecommendationExportJobsRequest
        include JSON::Serializable

        # An array of objects to specify a filter that returns a more specific list of export jobs.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::JobFilter)?

        # The identification numbers of the export jobs to return. An export job ID is returned when you
        # create an export using the ExportAutoScalingGroupRecommendations or ExportEC2InstanceRecommendations
        # actions. All export jobs created in the last seven days are returned if this parameter is omitted.
        @[JSON::Field(key: "jobIds")]
        getter job_ids : Array(String)?

        # The maximum number of export jobs to return with a single request. To retrieve the remaining
        # results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of export jobs.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::JobFilter)? = nil,
          @job_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeRecommendationExportJobsResponse
        include JSON::Serializable

        # The token to use to advance to the next page of export jobs. This value is null when there are no
        # more pages of export jobs to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that describe recommendation export jobs.
        @[JSON::Field(key: "recommendationExportJobs")]
        getter recommendation_export_jobs : Array(Types::RecommendationExportJob)?

        def initialize(
          @next_token : String? = nil,
          @recommendation_export_jobs : Array(Types::RecommendationExportJob)? = nil
        )
        end
      end

      # Describes the effective recommendation preferences for Amazon EBS volumes.
      struct EBSEffectiveRecommendationPreferences
        include JSON::Serializable

        # Describes the savings estimation mode preference applied for calculating savings opportunity for
        # Amazon EBS volumes.
        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : Types::EBSSavingsEstimationMode?

        def initialize(
          @savings_estimation_mode : Types::EBSSavingsEstimationMode? = nil
        )
        end
      end

      # An object that describes the estimated monthly savings possible by adopting Compute Optimizer’s
      # Amazon EBS volume recommendations. This includes any applicable discounts.
      struct EBSEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of Amazon Elastic Block Store (Amazon EBS)
      # volume recommendations. Use this filter with the GetEBSVolumeRecommendations action. You can use
      # LambdaFunctionRecommendationFilter with the GetLambdaFunctionRecommendations action, JobFilter with
      # the DescribeRecommendationExportJobs action, and Filter with the GetAutoScalingGroupRecommendations
      # and GetEC2InstanceRecommendations actions.
      struct EBSFilter
        include JSON::Serializable

        # The name of the filter. Specify Finding to return recommendations with a specific finding
        # classification (for example, NotOptimized ). You can filter your Amazon EBS volume recommendations
        # by tag:key and tag-key tags. A tag:key is a key and value combination of a tag assigned to your
        # Amazon EBS volume recommendations. Use the tag key in the filter name and the tag value as the
        # filter value. For example, to find all Amazon EBS volume recommendations that have a tag with the
        # key of Owner and the value of TeamA , specify tag:Owner for the filter name and TeamA for the filter
        # value. A tag-key is the key of a tag assigned to your Amazon EBS volume recommendations. Use this
        # filter to find all of your Amazon EBS volume recommendations that have a tag with a specific key.
        # This doesn’t consider the tag value. For example, you can find your Amazon EBS volume
        # recommendations with a tag key value of Owner or without any tag keys assigned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter. The valid values are Optimized , or NotOptimized .
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the savings estimation mode used for calculating savings opportunity for Amazon EBS
      # volumes.
      struct EBSSavingsEstimationMode
        include JSON::Serializable

        # Describes the source for calculating the savings opportunity for Amazon EBS volumes.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @source : String? = nil
        )
        end
      end

      # Describes the savings opportunity for Amazon EBS volume recommendations after applying specific
      # discounts.
      struct EBSSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute
        # Optimizer’s Amazon EBS volume recommendations. This saving includes any applicable discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EBSEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost after applying the specific
        # discounts. This saving can be achieved by adopting Compute Optimizer’s Amazon EBS volume
        # recommendations.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::EBSEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes a utilization metric of an Amazon Elastic Block Store (Amazon EBS) volume. Compare the
      # utilization metric data of your resource against its projected utilization metric data to determine
      # the performance difference between your current resource and the recommended option.
      struct EBSUtilizationMetric
        include JSON::Serializable

        # The name of the utilization metric. The following utilization metrics are available:
        # VolumeReadOpsPerSecond - The completed read operations per second from the volume in a specified
        # period of time. Unit: Count VolumeWriteOpsPerSecond - The completed write operations per second to
        # the volume in a specified period of time. Unit: Count VolumeReadBytesPerSecond - The bytes read per
        # second from the volume in a specified period of time. Unit: Bytes VolumeWriteBytesPerSecond - The
        # bytes written to the volume in a specified period of time. Unit: Bytes
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the utilization metric. The Compute Optimizer API, Command Line Interface (CLI),
        # and SDKs return utilization metrics using only the Maximum statistic, which is the highest value
        # observed during the specified period. The Compute Optimizer console displays graphs for some
        # utilization metrics using the Average statistic, which is the value of Sum / SampleCount during the
        # specified period. For more information, see Viewing resource recommendations in the Compute
        # Optimizer User Guide . You can also get averaged utilization metric data for your resources using
        # Amazon CloudWatch. For more information, see the Amazon CloudWatch User Guide .
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the utilization metric.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the effective recommendation preferences for Amazon ECS services.
      struct ECSEffectiveRecommendationPreferences
        include JSON::Serializable

        # Describes the savings estimation mode preference applied for calculating savings opportunity for
        # Amazon ECS services.
        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : Types::ECSSavingsEstimationMode?

        def initialize(
          @savings_estimation_mode : Types::ECSSavingsEstimationMode? = nil
        )
        end
      end

      # Describes the estimated monthly savings possible for Amazon ECS services by adopting Compute
      # Optimizer recommendations. This is based on Amazon ECS service pricing after applying Savings Plans
      # discounts.
      struct ECSEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings for Amazon ECS services.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the savings estimation mode used for calculating savings opportunity for Amazon ECS
      # services.
      struct ECSSavingsEstimationMode
        include JSON::Serializable

        # Describes the source for calculating the savings opportunity for Amazon ECS services.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @source : String? = nil
        )
        end
      end

      # Describes the savings opportunity for Amazon ECS service recommendations after applying Savings
      # Plans discounts. Savings opportunity represents the estimated monthly savings after applying Savings
      # Plans discounts. You can achieve this by implementing a given Compute Optimizer recommendation.
      struct ECSSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # The estimated monthly savings possible by adopting Compute Optimizer’s Amazon ECS service
        # recommendations. This includes any applicable Savings Plans discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::ECSEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute
        # Optimizer’s Amazon ECS service recommendations. This includes any applicable Savings Plans
        # discounts.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::ECSEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes the projected metrics of an Amazon ECS service recommendation option. To determine the
      # performance difference between your current Amazon ECS service and the recommended option, compare
      # the metric data of your service against its projected metric data.
      struct ECSServiceProjectedMetric
        include JSON::Serializable

        # The lower bound values for the projected metric.
        @[JSON::Field(key: "lowerBoundValues")]
        getter lower_bound_values : Array(Float64)?

        # The name of the projected metric. The following metrics are available: Cpu — The percentage of
        # allocated compute units that are currently in use on the service tasks. Memory — The percentage of
        # memory that's currently in use on the service tasks.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamps of the projected metric.
        @[JSON::Field(key: "timestamps")]
        getter timestamps : Array(Time)?

        # The upper bound values for the projected metric.
        @[JSON::Field(key: "upperBoundValues")]
        getter upper_bound_values : Array(Float64)?

        def initialize(
          @lower_bound_values : Array(Float64)? = nil,
          @name : String? = nil,
          @timestamps : Array(Time)? = nil,
          @upper_bound_values : Array(Float64)? = nil
        )
        end
      end

      # Describes the projected utilization metrics of an Amazon ECS service recommendation option. To
      # determine the performance difference between your current Amazon ECS service and the recommended
      # option, compare the utilization metric data of your service against its projected utilization metric
      # data.
      struct ECSServiceProjectedUtilizationMetric
        include JSON::Serializable

        # The lower bound values for the projected utilization metrics.
        @[JSON::Field(key: "lowerBoundValue")]
        getter lower_bound_value : Float64?

        # The name of the projected utilization metric. The following utilization metrics are available: Cpu —
        # The percentage of allocated compute units that are currently in use on the service tasks. Memory —
        # The percentage of memory that's currently in use on the service tasks.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the projected utilization metric. The Compute Optimizer API, Command Line Interface
        # (CLI), and SDKs return utilization metrics using only the Maximum statistic, which is the highest
        # value observed during the specified period. The Compute Optimizer console displays graphs for some
        # utilization metrics using the Average statistic, which is the value of Sum / SampleCount during the
        # specified period. For more information, see Viewing resource recommendations in the Compute
        # Optimizer User Guide . You can also get averaged utilization metric data for your resources using
        # Amazon CloudWatch. For more information, see the Amazon CloudWatch User Guide .
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The upper bound values for the projected utilization metrics.
        @[JSON::Field(key: "upperBoundValue")]
        getter upper_bound_value : Float64?

        def initialize(
          @lower_bound_value : Float64? = nil,
          @name : String? = nil,
          @statistic : String? = nil,
          @upper_bound_value : Float64? = nil
        )
        end
      end

      # Describes an Amazon ECS service recommendation.
      struct ECSServiceRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon ECS service.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The risk of the current Amazon ECS service not meeting the performance needs of its workloads. The
        # higher the risk, the more likely the current service can't meet the performance requirements of its
        # workload.
        @[JSON::Field(key: "currentPerformanceRisk")]
        getter current_performance_risk : String?

        # The configuration of the current Amazon ECS service.
        @[JSON::Field(key: "currentServiceConfiguration")]
        getter current_service_configuration : Types::ServiceConfiguration?

        # Describes the effective recommendation preferences for Amazon ECS services.
        @[JSON::Field(key: "effectiveRecommendationPreferences")]
        getter effective_recommendation_preferences : Types::ECSEffectiveRecommendationPreferences?

        # The finding classification of an Amazon ECS service. Findings for Amazon ECS services include:
        # Underprovisioned — When Compute Optimizer detects that there’s not enough memory or CPU, an Amazon
        # ECS service is considered under-provisioned. An under-provisioned service might result in poor
        # application performance. Overprovisioned — When Compute Optimizer detects that there’s excessive
        # memory or CPU, an Amazon ECS service is considered over-provisioned. An over-provisioned service
        # might result in additional infrastructure costs. Optimized — When both the CPU and memory of your
        # Amazon ECS service meet the performance requirements of your workload, the service is considered
        # optimized.
        @[JSON::Field(key: "finding")]
        getter finding : String?

        # The reason for the finding classification of an Amazon ECS service. Finding reason codes for Amazon
        # ECS services include: CPUUnderprovisioned — The service CPU configuration can be sized up to enhance
        # the performance of your workload. This is identified by analyzing the CPUUtilization metric of the
        # current service during the look-back period. CPUOverprovisioned — The service CPU configuration can
        # be sized down while still meeting the performance requirements of your workload. This is identified
        # by analyzing the CPUUtilization metric of the current service during the look-back period.
        # MemoryUnderprovisioned — The service memory configuration can be sized up to enhance the performance
        # of your workload. This is identified by analyzing the MemoryUtilization metric of the current
        # service during the look-back period. MemoryOverprovisioned — The service memory configuration can be
        # sized down while still meeting the performance requirements of your workload. This is identified by
        # analyzing the MemoryUtilization metric of the current service during the look-back period.
        @[JSON::Field(key: "findingReasonCodes")]
        getter finding_reason_codes : Array(String)?

        # The timestamp of when the Amazon ECS service recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The launch type the Amazon ECS service is using. Compute Optimizer only supports the Fargate launch
        # type.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The number of days the Amazon ECS service utilization metrics were analyzed.
        @[JSON::Field(key: "lookbackPeriodInDays")]
        getter lookback_period_in_days : Float64?

        # The Amazon Resource Name (ARN) of the current Amazon ECS service. The following is the format of the
        # ARN: arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # An array of objects that describe the recommendation options for the Amazon ECS service.
        @[JSON::Field(key: "serviceRecommendationOptions")]
        getter service_recommendation_options : Array(Types::ECSServiceRecommendationOption)?

        # A list of tags assigned to your Amazon ECS service recommendations.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An array of objects that describe the utilization metrics of the Amazon ECS service.
        @[JSON::Field(key: "utilizationMetrics")]
        getter utilization_metrics : Array(Types::ECSServiceUtilizationMetric)?

        def initialize(
          @account_id : String? = nil,
          @current_performance_risk : String? = nil,
          @current_service_configuration : Types::ServiceConfiguration? = nil,
          @effective_recommendation_preferences : Types::ECSEffectiveRecommendationPreferences? = nil,
          @finding : String? = nil,
          @finding_reason_codes : Array(String)? = nil,
          @last_refresh_timestamp : Time? = nil,
          @launch_type : String? = nil,
          @lookback_period_in_days : Float64? = nil,
          @service_arn : String? = nil,
          @service_recommendation_options : Array(Types::ECSServiceRecommendationOption)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @utilization_metrics : Array(Types::ECSServiceUtilizationMetric)? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of Amazon ECS service recommendations. Use this
      # filter with the GetECSServiceRecommendations action.
      struct ECSServiceRecommendationFilter
        include JSON::Serializable

        # The name of the filter. Specify Finding to return recommendations with a specific finding
        # classification. Specify FindingReasonCode to return recommendations with a specific finding reason
        # code. You can filter your Amazon ECS service recommendations by tag:key and tag-key tags. A tag:key
        # is a key and value combination of a tag assigned to your Amazon ECS service recommendations. Use the
        # tag key in the filter name and the tag value as the filter value. For example, to find all Amazon
        # ECS service recommendations that have a tag with the key of Owner and the value of TeamA , specify
        # tag:Owner for the filter name and TeamA for the filter value. A tag-key is the key of a tag assigned
        # to your Amazon ECS service recommendations. Use this filter to find all of your Amazon ECS service
        # recommendations that have a tag with a specific key. This doesn’t consider the tag value. For
        # example, you can find your Amazon ECS service recommendations with a tag key value of Owner or
        # without any tag keys assigned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter. The valid values for this parameter are as follows: If you specify the name
        # parameter as Finding , specify Optimized , Underprovisioned , or Overprovisioned . If you specify
        # the name parameter as FindingReasonCode , specify CPUUnderprovisioned , CPUOverprovisioned ,
        # MemoryUnderprovisioned , or MemoryOverprovisioned .
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the recommendation options for an Amazon ECS service.
      struct ECSServiceRecommendationOption
        include JSON::Serializable

        # The CPU and memory size recommendations for the containers within the task of your Amazon ECS
        # service.
        @[JSON::Field(key: "containerRecommendations")]
        getter container_recommendations : Array(Types::ContainerRecommendation)?

        # The CPU size of the Amazon ECS service recommendation option.
        @[JSON::Field(key: "cpu")]
        getter cpu : Int32?

        # The memory size of the Amazon ECS service recommendation option.
        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # An array of objects that describe the projected utilization metrics of the Amazon ECS service
        # recommendation option.
        @[JSON::Field(key: "projectedUtilizationMetrics")]
        getter projected_utilization_metrics : Array(Types::ECSServiceProjectedUtilizationMetric)?

        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # Describes the savings opportunity for Amazon ECS service recommendations or for the recommendation
        # option. Savings opportunity represents the estimated monthly savings after applying Savings Plans
        # discounts. You can achieve this by implementing a given Compute Optimizer recommendation.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::ECSSavingsOpportunityAfterDiscounts?

        def initialize(
          @container_recommendations : Array(Types::ContainerRecommendation)? = nil,
          @cpu : Int32? = nil,
          @memory : Int32? = nil,
          @projected_utilization_metrics : Array(Types::ECSServiceProjectedUtilizationMetric)? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::ECSSavingsOpportunityAfterDiscounts? = nil
        )
        end
      end

      # Describes the projected metrics of an Amazon ECS service recommendation option. To determine the
      # performance difference between your current Amazon ECS service and the recommended option, compare
      # the metric data of your service against its projected metric data.
      struct ECSServiceRecommendedOptionProjectedMetric
        include JSON::Serializable

        # An array of objects that describe the projected metric.
        @[JSON::Field(key: "projectedMetrics")]
        getter projected_metrics : Array(Types::ECSServiceProjectedMetric)?

        # The recommended CPU size for the Amazon ECS service.
        @[JSON::Field(key: "recommendedCpuUnits")]
        getter recommended_cpu_units : Int32?

        # The recommended memory size for the Amazon ECS service.
        @[JSON::Field(key: "recommendedMemorySize")]
        getter recommended_memory_size : Int32?

        def initialize(
          @projected_metrics : Array(Types::ECSServiceProjectedMetric)? = nil,
          @recommended_cpu_units : Int32? = nil,
          @recommended_memory_size : Int32? = nil
        )
        end
      end

      # Describes the utilization metric of an Amazon ECS service. To determine the performance difference
      # between your current Amazon ECS service and the recommended option, compare the utilization metric
      # data of your service against its projected utilization metric data.
      struct ECSServiceUtilizationMetric
        include JSON::Serializable

        # The name of the utilization metric. The following utilization metrics are available: Cpu — The
        # amount of CPU capacity that's used in the service. Memory — The amount of memory that's used in the
        # service.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the utilization metric. The Compute Optimizer API, Command Line Interface (CLI),
        # and SDKs return utilization metrics using only the Maximum statistic, which is the highest value
        # observed during the specified period. The Compute Optimizer console displays graphs for some
        # utilization metrics using the Average statistic, which is the value of Sum / SampleCount during the
        # specified period. For more information, see Viewing resource recommendations in the Compute
        # Optimizer User Guide . You can also get averaged utilization metric data for your resources using
        # Amazon CloudWatch. For more information, see the Amazon CloudWatch User Guide .
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the utilization metric.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the effective preferred resources that Compute Optimizer considers as rightsizing
      # recommendation candidates. Compute Optimizer only supports Amazon EC2 instance types.
      struct EffectivePreferredResource
        include JSON::Serializable

        # The expanded version of your preferred resource's include list.
        @[JSON::Field(key: "effectiveIncludeList")]
        getter effective_include_list : Array(String)?

        # The list of preferred resources values that you want excluded from rightsizing recommendation
        # candidates.
        @[JSON::Field(key: "excludeList")]
        getter exclude_list : Array(String)?

        # The list of preferred resource values that you want considered as rightsizing recommendation
        # candidates.
        @[JSON::Field(key: "includeList")]
        getter include_list : Array(String)?

        # The name of the preferred resource list.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @effective_include_list : Array(String)? = nil,
          @exclude_list : Array(String)? = nil,
          @include_list : Array(String)? = nil,
          @name : String? = nil
        )
        end
      end

      # Describes the effective recommendation preferences for a resource.
      struct EffectiveRecommendationPreferences
        include JSON::Serializable

        # Describes the CPU vendor and architecture for an instance or Amazon EC2 Auto Scaling group
        # recommendations. For example, when you specify AWS_ARM64 with: A GetEC2InstanceRecommendations or
        # GetAutoScalingGroupRecommendations request, Compute Optimizer returns recommendations that consist
        # of Graviton instance types only. A GetEC2RecommendationProjectedMetrics request, Compute Optimizer
        # returns projected utilization metrics for Graviton instance type recommendations only. A
        # ExportEC2InstanceRecommendations or ExportAutoScalingGroupRecommendations request, Compute Optimizer
        # exports recommendations that consist of Graviton instance types only.
        @[JSON::Field(key: "cpuVendorArchitectures")]
        getter cpu_vendor_architectures : Array(String)?

        # Describes the activation status of the enhanced infrastructure metrics preference. A status of
        # Active confirms that the preference is applied in the latest recommendation refresh, and a status of
        # Inactive confirms that it's not yet applied to recommendations. For more information, see Enhanced
        # infrastructure metrics in the Compute Optimizer User Guide .
        @[JSON::Field(key: "enhancedInfrastructureMetrics")]
        getter enhanced_infrastructure_metrics : String?

        # An object that describes the external metrics recommendation preference. If the preference is
        # applied in the latest recommendation refresh, an object with a valid source value appears in the
        # response. If the preference isn't applied to the recommendations already, then this object doesn't
        # appear in the response.
        @[JSON::Field(key: "externalMetricsPreference")]
        getter external_metrics_preference : Types::ExternalMetricsPreference?

        # Describes the activation status of the inferred workload types preference. A status of Active
        # confirms that the preference is applied in the latest recommendation refresh. A status of Inactive
        # confirms that it's not yet applied to recommendations.
        @[JSON::Field(key: "inferredWorkloadTypes")]
        getter inferred_workload_types : String?

        # The number of days the utilization metrics of the Amazon Web Services resource are analyzed.
        @[JSON::Field(key: "lookBackPeriod")]
        getter look_back_period : String?

        # The resource type values that are considered as candidates when generating rightsizing
        # recommendations.
        @[JSON::Field(key: "preferredResources")]
        getter preferred_resources : Array(Types::EffectivePreferredResource)?

        # Describes the savings estimation mode applied for calculating savings opportunity for a resource.
        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : Types::InstanceSavingsEstimationMode?

        # The resource’s CPU and memory utilization preferences, such as threshold and headroom, that are used
        # to generate rightsizing recommendations. This preference is only available for the Amazon EC2
        # instance resource type.
        @[JSON::Field(key: "utilizationPreferences")]
        getter utilization_preferences : Array(Types::UtilizationPreference)?

        def initialize(
          @cpu_vendor_architectures : Array(String)? = nil,
          @enhanced_infrastructure_metrics : String? = nil,
          @external_metrics_preference : Types::ExternalMetricsPreference? = nil,
          @inferred_workload_types : String? = nil,
          @look_back_period : String? = nil,
          @preferred_resources : Array(Types::EffectivePreferredResource)? = nil,
          @savings_estimation_mode : Types::InstanceSavingsEstimationMode? = nil,
          @utilization_preferences : Array(Types::UtilizationPreference)? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of account enrollment statuses. Use this filter
      # with the GetEnrollmentStatusesForOrganization action.
      struct EnrollmentFilter
        include JSON::Serializable

        # The name of the filter. Specify Status to return accounts with a specific enrollment status (for
        # example, Active ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter. The valid values are Active , Inactive , Pending , and Failed .
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the estimated monthly savings amount possible, based on On-Demand instance pricing, by
      # adopting Compute Optimizer recommendations for a given resource. For more information, see Estimated
      # monthly savings and savings opportunities in the Compute Optimizer User Guide .
      struct EstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      struct ExportAutoScalingGroupRecommendationsRequest
        include JSON::Serializable

        # An object to specify the destination Amazon Simple Storage Service (Amazon S3) bucket name and key
        # prefix for the export job. You must create the destination Amazon S3 bucket for your recommendations
        # export before you create the export job. Compute Optimizer does not create the S3 bucket for you.
        # After you create the S3 bucket, ensure that it has the required permissions policy to allow Compute
        # Optimizer to write the export file to it. If you plan to specify an object prefix when you create
        # the export job, you must include the object prefix in the policy that you add to the S3 bucket. For
        # more information, see Amazon S3 Bucket Policy for Compute Optimizer in the Compute Optimizer User
        # Guide .
        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The IDs of the Amazon Web Services accounts for which to export Amazon EC2 Auto Scaling group
        # recommendations. If your account is the management account of an organization, use this parameter to
        # specify the member account for which you want to export recommendations. This parameter cannot be
        # specified together with the include member accounts parameter. The parameters are mutually
        # exclusive. Recommendations for member accounts are not included in the export if this parameter, or
        # the include member accounts parameter, is omitted. You can specify multiple account IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. The only export file format currently supported is Csv .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of Amazon EC2 Auto Scaling
        # group recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Indicates whether to include recommendations for resources in all member accounts of the
        # organization if your account is the management account of an organization. The member accounts must
        # also be opted in to Compute Optimizer, and trusted access for Compute Optimizer must be enabled in
        # the organization account. For more information, see Compute Optimizer and Amazon Web Services
        # Organizations trusted access in the Compute Optimizer User Guide . Recommendations for member
        # accounts of the organization are not included in the export file if this parameter is omitted. This
        # parameter cannot be specified together with the account IDs parameter. The parameters are mutually
        # exclusive. Recommendations for member accounts are not included in the export if this parameter, or
        # the account IDs parameter, is omitted.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        # An object to specify the preferences for the Amazon EC2 Auto Scaling group recommendations to
        # export.
        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @include_member_accounts : Bool? = nil,
          @recommendation_preferences : Types::RecommendationPreferences? = nil
        )
        end
      end

      struct ExportAutoScalingGroupRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. Use the DescribeRecommendationExportJobs action, and
        # specify the job ID to view the status of an export job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # An object that describes the destination Amazon S3 bucket of a recommendations export file.
        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      # Describes the destination of the recommendations export and metadata files.
      struct ExportDestination
        include JSON::Serializable

        # An object that describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and
        # object keys of a recommendations export file, and its associated metadata file.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Destination?

        def initialize(
          @s3 : Types::S3Destination? = nil
        )
        end
      end

      struct ExportEBSVolumeRecommendationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The IDs of the Amazon Web Services accounts for which to export Amazon EBS volume recommendations.
        # If your account is the management account of an organization, use this parameter to specify the
        # member account for which you want to export recommendations. This parameter cannot be specified
        # together with the include member accounts parameter. The parameters are mutually exclusive.
        # Recommendations for member accounts are not included in the export if this parameter, or the include
        # member accounts parameter, is omitted. You can specify multiple account IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. The only export file format currently supported is Csv .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of Amazon EBS volume
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::EBSFilter)?

        # Indicates whether to include recommendations for resources in all member accounts of the
        # organization if your account is the management account of an organization. The member accounts must
        # also be opted in to Compute Optimizer, and trusted access for Compute Optimizer must be enabled in
        # the organization account. For more information, see Compute Optimizer and Amazon Web Services
        # Organizations trusted access in the Compute Optimizer User Guide . Recommendations for member
        # accounts of the organization are not included in the export file if this parameter is omitted. This
        # parameter cannot be specified together with the account IDs parameter. The parameters are mutually
        # exclusive. Recommendations for member accounts are not included in the export if this parameter, or
        # the account IDs parameter, is omitted.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::EBSFilter)? = nil,
          @include_member_accounts : Bool? = nil
        )
        end
      end

      struct ExportEBSVolumeRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. Use the DescribeRecommendationExportJobs action, and
        # specify the job ID to view the status of an export job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      struct ExportEC2InstanceRecommendationsRequest
        include JSON::Serializable

        # An object to specify the destination Amazon Simple Storage Service (Amazon S3) bucket name and key
        # prefix for the export job. You must create the destination Amazon S3 bucket for your recommendations
        # export before you create the export job. Compute Optimizer does not create the S3 bucket for you.
        # After you create the S3 bucket, ensure that it has the required permissions policy to allow Compute
        # Optimizer to write the export file to it. If you plan to specify an object prefix when you create
        # the export job, you must include the object prefix in the policy that you add to the S3 bucket. For
        # more information, see Amazon S3 Bucket Policy for Compute Optimizer in the Compute Optimizer User
        # Guide .
        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The IDs of the Amazon Web Services accounts for which to export instance recommendations. If your
        # account is the management account of an organization, use this parameter to specify the member
        # account for which you want to export recommendations. This parameter cannot be specified together
        # with the include member accounts parameter. The parameters are mutually exclusive. Recommendations
        # for member accounts are not included in the export if this parameter, or the include member accounts
        # parameter, is omitted. You can specify multiple account IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. The only export file format currently supported is Csv .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of instance
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # Indicates whether to include recommendations for resources in all member accounts of the
        # organization if your account is the management account of an organization. The member accounts must
        # also be opted in to Compute Optimizer, and trusted access for Compute Optimizer must be enabled in
        # the organization account. For more information, see Compute Optimizer and Amazon Web Services
        # Organizations trusted access in the Compute Optimizer User Guide . Recommendations for member
        # accounts of the organization are not included in the export file if this parameter is omitted.
        # Recommendations for member accounts are not included in the export if this parameter, or the account
        # IDs parameter, is omitted.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        # An object to specify the preferences for the Amazon EC2 instance recommendations to export.
        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @include_member_accounts : Bool? = nil,
          @recommendation_preferences : Types::RecommendationPreferences? = nil
        )
        end
      end

      struct ExportEC2InstanceRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. Use the DescribeRecommendationExportJobs action, and
        # specify the job ID to view the status of an export job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # An object that describes the destination Amazon S3 bucket of a recommendations export file.
        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      struct ExportECSServiceRecommendationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The Amazon Web Services account IDs for the export Amazon ECS service recommendations. If your
        # account is the management account or the delegated administrator of an organization, use this
        # parameter to specify the member account you want to export recommendations to. This parameter can't
        # be specified together with the include member accounts parameter. The parameters are mutually
        # exclusive. If this parameter or the include member accounts parameter is omitted, the
        # recommendations for member accounts aren't included in the export. You can specify multiple account
        # IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. The CSV file is the only export file format currently supported.
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of Amazon ECS service
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ECSServiceRecommendationFilter)?

        # If your account is the management account or the delegated administrator of an organization, this
        # parameter indicates whether to include recommendations for resources in all member accounts of the
        # organization. The member accounts must also be opted in to Compute Optimizer, and trusted access for
        # Compute Optimizer must be enabled in the organization account. For more information, see Compute
        # Optimizer and Amazon Web Services Organizations trusted access in the Compute Optimizer User Guide .
        # If this parameter is omitted, recommendations for member accounts of the organization aren't
        # included in the export file. If this parameter or the account ID parameter is omitted,
        # recommendations for member accounts aren't included in the export.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::ECSServiceRecommendationFilter)? = nil,
          @include_member_accounts : Bool? = nil
        )
        end
      end

      struct ExportECSServiceRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. To view the status of an export job, use the
        # DescribeRecommendationExportJobs action and specify the job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      struct ExportIdleRecommendationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The Amazon Web Services account IDs for the export idle resource recommendations. If your account is
        # the management account or the delegated administrator of an organization, use this parameter to
        # specify the member account you want to export recommendations to. This parameter can't be specified
        # together with the include member accounts parameter. The parameters are mutually exclusive. If this
        # parameter or the include member accounts parameter is omitted, the recommendations for member
        # accounts aren't included in the export. You can specify multiple account IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. The CSV file is the only export file format currently supported.
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of idle resource
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::IdleRecommendationFilter)?

        # If your account is the management account or the delegated administrator of an organization, this
        # parameter indicates whether to include recommendations for resources in all member accounts of the
        # organization. The member accounts must also be opted in to Compute Optimizer, and trusted access for
        # Compute Optimizer must be enabled in the organization account. For more information, see Compute
        # Optimizer and Amazon Web Services Organizations trusted access in the Compute Optimizer User Guide .
        # If this parameter is omitted, recommendations for member accounts of the organization aren't
        # included in the export file. If this parameter or the account ID parameter is omitted,
        # recommendations for member accounts aren't included in the export.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::IdleRecommendationFilter)? = nil,
          @include_member_accounts : Bool? = nil
        )
        end
      end

      struct ExportIdleRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. To view the status of an export job, use the
        # DescribeRecommendationExportJobs action and specify the job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      struct ExportLambdaFunctionRecommendationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The IDs of the Amazon Web Services accounts for which to export Lambda function recommendations. If
        # your account is the management account of an organization, use this parameter to specify the member
        # account for which you want to export recommendations. This parameter cannot be specified together
        # with the include member accounts parameter. The parameters are mutually exclusive. Recommendations
        # for member accounts are not included in the export if this parameter, or the include member accounts
        # parameter, is omitted. You can specify multiple account IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. The only export file format currently supported is Csv .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of Lambda function
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::LambdaFunctionRecommendationFilter)?

        # Indicates whether to include recommendations for resources in all member accounts of the
        # organization if your account is the management account of an organization. The member accounts must
        # also be opted in to Compute Optimizer, and trusted access for Compute Optimizer must be enabled in
        # the organization account. For more information, see Compute Optimizer and Amazon Web Services
        # Organizations trusted access in the Compute Optimizer User Guide . Recommendations for member
        # accounts of the organization are not included in the export file if this parameter is omitted. This
        # parameter cannot be specified together with the account IDs parameter. The parameters are mutually
        # exclusive. Recommendations for member accounts are not included in the export if this parameter, or
        # the account IDs parameter, is omitted.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::LambdaFunctionRecommendationFilter)? = nil,
          @include_member_accounts : Bool? = nil
        )
        end
      end

      struct ExportLambdaFunctionRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. Use the DescribeRecommendationExportJobs action, and
        # specify the job ID to view the status of an export job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      struct ExportLicenseRecommendationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The IDs of the Amazon Web Services accounts for which to export license recommendations. If your
        # account is the management account of an organization, use this parameter to specify the member
        # account for which you want to export recommendations. This parameter can't be specified together
        # with the include member accounts parameter. The parameters are mutually exclusive. If this parameter
        # is omitted, recommendations for member accounts aren't included in the export. You can specify
        # multiple account IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. A CSV file is the only export format currently supported.
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of license recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::LicenseRecommendationFilter)?

        # Indicates whether to include recommendations for resources in all member accounts of the
        # organization if your account is the management account of an organization. The member accounts must
        # also be opted in to Compute Optimizer, and trusted access for Compute Optimizer must be enabled in
        # the organization account. For more information, see Compute Optimizer and Amazon Web Services
        # Organizations trusted access in the Compute Optimizer User Guide . If this parameter is omitted,
        # recommendations for member accounts of the organization aren't included in the export file . This
        # parameter cannot be specified together with the account IDs parameter. The parameters are mutually
        # exclusive.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::LicenseRecommendationFilter)? = nil,
          @include_member_accounts : Bool? = nil
        )
        end
      end

      struct ExportLicenseRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. To view the status of an export job, use the
        # DescribeRecommendationExportJobs action and specify the job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      struct ExportRDSDatabaseRecommendationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "s3DestinationConfig")]
        getter s3_destination_config : Types::S3DestinationConfig

        # The Amazon Web Services account IDs for the export Amazon Aurora and RDS database recommendations.
        # If your account is the management account or the delegated administrator of an organization, use
        # this parameter to specify the member account you want to export recommendations to. This parameter
        # can't be specified together with the include member accounts parameter. The parameters are mutually
        # exclusive. If this parameter or the include member accounts parameter is omitted, the
        # recommendations for member accounts aren't included in the export. You can specify multiple account
        # IDs per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The recommendations data to include in the export file. For more information about the fields that
        # can be exported, see Exported files in the Compute Optimizer User Guide .
        @[JSON::Field(key: "fieldsToExport")]
        getter fields_to_export : Array(String)?

        # The format of the export file. The CSV file is the only export file format currently supported.
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # An array of objects to specify a filter that exports a more specific set of Amazon Aurora and RDS
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RDSDBRecommendationFilter)?

        # If your account is the management account or the delegated administrator of an organization, this
        # parameter indicates whether to include recommendations for resources in all member accounts of the
        # organization. The member accounts must also be opted in to Compute Optimizer, and trusted access for
        # Compute Optimizer must be enabled in the organization account. For more information, see Compute
        # Optimizer and Amazon Web Services Organizations trusted access in the Compute Optimizer User Guide .
        # If this parameter is omitted, recommendations for member accounts of the organization aren't
        # included in the export file. If this parameter or the account ID parameter is omitted,
        # recommendations for member accounts aren't included in the export.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        def initialize(
          @s3_destination_config : Types::S3DestinationConfig,
          @account_ids : Array(String)? = nil,
          @fields_to_export : Array(String)? = nil,
          @file_format : String? = nil,
          @filters : Array(Types::RDSDBRecommendationFilter)? = nil,
          @include_member_accounts : Bool? = nil,
          @recommendation_preferences : Types::RecommendationPreferences? = nil
        )
        end
      end

      struct ExportRDSDatabaseRecommendationsResponse
        include JSON::Serializable

        # The identification number of the export job. To view the status of an export job, use the
        # DescribeRecommendationExportJobs action and specify the job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @job_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      # Describes Compute Optimizer's integration status with your chosen external metric provider. For
      # example, Datadog.
      struct ExternalMetricStatus
        include JSON::Serializable

        # The status code for Compute Optimizer's integration with an external metrics provider.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        # The reason for Compute Optimizer's integration status with your external metric provider.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Describes the external metrics preferences for EC2 rightsizing recommendations.
      struct ExternalMetricsPreference
        include JSON::Serializable

        # Contains the source options for external metrics preferences.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @source : String? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of recommendations. Use this filter with the
      # GetAutoScalingGroupRecommendations and GetEC2InstanceRecommendations actions. You can use EBSFilter
      # with the GetEBSVolumeRecommendations action, LambdaFunctionRecommendationFilter with the
      # GetLambdaFunctionRecommendations action, and JobFilter with the DescribeRecommendationExportJobs
      # action.
      struct Filter
        include JSON::Serializable

        # The name of the filter. Specify Finding to return recommendations with a specific finding
        # classification. For example, Underprovisioned . Specify RecommendationSourceType to return
        # recommendations of a specific resource type. For example, Ec2Instance . Specify FindingReasonCodes
        # to return recommendations with a specific finding reason code. For example, CPUUnderprovisioned .
        # Specify InferredWorkloadTypes to return recommendations of a specific inferred workload. For
        # example, Redis . You can filter your EC2 instance recommendations by tag:key and tag-key tags. A
        # tag:key is a key and value combination of a tag assigned to your recommendations. Use the tag key in
        # the filter name and the tag value as the filter value. For example, to find all recommendations that
        # have a tag with the key of Owner and the value of TeamA , specify tag:Owner for the filter name and
        # TeamA for the filter value. A tag-key is the key of a tag assigned to your recommendations. Use this
        # filter to find all of your recommendations that have a tag with a specific key. This doesn’t
        # consider the tag value. For example, you can find your recommendations with a tag key value of Owner
        # or without any tag keys assigned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter. The valid values for this parameter are as follows, depending on what you
        # specify for the name parameter and the resource type that you wish to filter results for: Specify
        # Optimized or NotOptimized if you specify the name parameter as Finding and you want to filter
        # results for Amazon EC2 Auto Scaling groups. Specify Underprovisioned , Overprovisioned , or
        # Optimized if you specify the name parameter as Finding and you want to filter results for EC2
        # instances. Specify Ec2Instance or AutoScalingGroup if you specify the name parameter as
        # RecommendationSourceType . Specify one of the following options if you specify the name parameter as
        # FindingReasonCodes : CPUOverprovisioned — The instance’s CPU configuration can be sized down while
        # still meeting the performance requirements of your workload. CPUUnderprovisioned — The instance’s
        # CPU configuration doesn't meet the performance requirements of your workload and there is an
        # alternative instance type that provides better CPU performance. MemoryOverprovisioned — The
        # instance’s memory configuration can be sized down while still meeting the performance requirements
        # of your workload. MemoryUnderprovisioned — The instance’s memory configuration doesn't meet the
        # performance requirements of your workload and there is an alternative instance type that provides
        # better memory performance. EBSThroughputOverprovisioned — The instance’s EBS throughput
        # configuration can be sized down while still meeting the performance requirements of your workload.
        # EBSThroughputUnderprovisioned — The instance’s EBS throughput configuration doesn't meet the
        # performance requirements of your workload and there is an alternative instance type that provides
        # better EBS throughput performance. EBSIOPSOverprovisioned — The instance’s EBS IOPS configuration
        # can be sized down while still meeting the performance requirements of your workload.
        # EBSIOPSUnderprovisioned — The instance’s EBS IOPS configuration doesn't meet the performance
        # requirements of your workload and there is an alternative instance type that provides better EBS
        # IOPS performance. NetworkBandwidthOverprovisioned — The instance’s network bandwidth configuration
        # can be sized down while still meeting the performance requirements of your workload.
        # NetworkBandwidthUnderprovisioned — The instance’s network bandwidth configuration doesn't meet the
        # performance requirements of your workload and there is an alternative instance type that provides
        # better network bandwidth performance. This finding reason happens when the NetworkIn or NetworkOut
        # performance of an instance is impacted. NetworkPPSOverprovisioned — The instance’s network PPS
        # (packets per second) configuration can be sized down while still meeting the performance
        # requirements of your workload. NetworkPPSUnderprovisioned — The instance’s network PPS (packets per
        # second) configuration doesn't meet the performance requirements of your workload and there is an
        # alternative instance type that provides better network PPS performance. DiskIOPSOverprovisioned —
        # The instance’s disk IOPS configuration can be sized down while still meeting the performance
        # requirements of your workload. DiskIOPSUnderprovisioned — The instance’s disk IOPS configuration
        # doesn't meet the performance requirements of your workload and there is an alternative instance type
        # that provides better disk IOPS performance. DiskThroughputOverprovisioned — The instance’s disk
        # throughput configuration can be sized down while still meeting the performance requirements of your
        # workload. DiskThroughputUnderprovisioned — The instance’s disk throughput configuration doesn't meet
        # the performance requirements of your workload and there is an alternative instance type that
        # provides better disk throughput performance.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      struct GetAutoScalingGroupRecommendationsRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account for which to return Amazon EC2 Auto Scaling group
        # recommendations. If your account is the management account of an organization, use this parameter to
        # specify the member account for which you want to return Amazon EC2 Auto Scaling group
        # recommendations. Only one account ID can be specified per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The Amazon Resource Name (ARN) of the Amazon EC2 Auto Scaling groups for which to return
        # recommendations.
        @[JSON::Field(key: "autoScalingGroupArns")]
        getter auto_scaling_group_arns : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of Amazon EC2 Auto Scaling
        # group recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of Amazon EC2 Auto Scaling group recommendations to return with a single request.
        # To retrieve the remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of Amazon EC2 Auto Scaling group recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object to specify the preferences for the Amazon EC2 Auto Scaling group recommendations to return
        # in the response.
        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        def initialize(
          @account_ids : Array(String)? = nil,
          @auto_scaling_group_arns : Array(String)? = nil,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recommendation_preferences : Types::RecommendationPreferences? = nil
        )
        end
      end

      struct GetAutoScalingGroupRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe Amazon EC2 Auto Scaling group recommendations.
        @[JSON::Field(key: "autoScalingGroupRecommendations")]
        getter auto_scaling_group_recommendations : Array(Types::AutoScalingGroupRecommendation)?

        # An array of objects that describe errors of the request. For example, an error is returned if you
        # request recommendations for an unsupported Amazon EC2 Auto Scaling group.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetRecommendationError)?

        # The token to use to advance to the next page of Amazon EC2 Auto Scaling group recommendations. This
        # value is null when there are no more pages of Amazon EC2 Auto Scaling group recommendations to
        # return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_group_recommendations : Array(Types::AutoScalingGroupRecommendation)? = nil,
          @errors : Array(Types::GetRecommendationError)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetEBSVolumeRecommendationsRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account for which to return volume recommendations. If your
        # account is the management account of an organization, use this parameter to specify the member
        # account for which you want to return volume recommendations. Only one account ID can be specified
        # per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of volume recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::EBSFilter)?

        # The maximum number of volume recommendations to return with a single request. To retrieve the
        # remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of volume recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the volumes for which to return recommendations.
        @[JSON::Field(key: "volumeArns")]
        getter volume_arns : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @filters : Array(Types::EBSFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @volume_arns : Array(String)? = nil
        )
        end
      end

      struct GetEBSVolumeRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe errors of the request. For example, an error is returned if you
        # request recommendations for an unsupported volume.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetRecommendationError)?

        # The token to use to advance to the next page of volume recommendations. This value is null when
        # there are no more pages of volume recommendations to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that describe volume recommendations.
        @[JSON::Field(key: "volumeRecommendations")]
        getter volume_recommendations : Array(Types::VolumeRecommendation)?

        def initialize(
          @errors : Array(Types::GetRecommendationError)? = nil,
          @next_token : String? = nil,
          @volume_recommendations : Array(Types::VolumeRecommendation)? = nil
        )
        end
      end

      struct GetEC2InstanceRecommendationsRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account for which to return instance recommendations. If your
        # account is the management account of an organization, use this parameter to specify the member
        # account for which you want to return instance recommendations. Only one account ID can be specified
        # per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of instance
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The Amazon Resource Name (ARN) of the instances for which to return recommendations.
        @[JSON::Field(key: "instanceArns")]
        getter instance_arns : Array(String)?

        # The maximum number of instance recommendations to return with a single request. To retrieve the
        # remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of instance recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object to specify the preferences for the Amazon EC2 instance recommendations to return in the
        # response.
        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        def initialize(
          @account_ids : Array(String)? = nil,
          @filters : Array(Types::Filter)? = nil,
          @instance_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recommendation_preferences : Types::RecommendationPreferences? = nil
        )
        end
      end

      struct GetEC2InstanceRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe errors of the request. For example, an error is returned if you
        # request recommendations for an instance of an unsupported instance family.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetRecommendationError)?

        # An array of objects that describe instance recommendations.
        @[JSON::Field(key: "instanceRecommendations")]
        getter instance_recommendations : Array(Types::InstanceRecommendation)?

        # The token to use to advance to the next page of instance recommendations. This value is null when
        # there are no more pages of instance recommendations to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @errors : Array(Types::GetRecommendationError)? = nil,
          @instance_recommendations : Array(Types::InstanceRecommendation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetEC2RecommendationProjectedMetricsRequest
        include JSON::Serializable

        # The timestamp of the last projected metrics data point to return.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The Amazon Resource Name (ARN) of the instances for which to return recommendation projected
        # metrics.
        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String

        # The granularity, in seconds, of the projected metrics data points.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The timestamp of the first projected metrics data point to return.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic of the projected metrics.
        @[JSON::Field(key: "stat")]
        getter stat : String

        # An object to specify the preferences for the Amazon EC2 recommendation projected metrics to return
        # in the response.
        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        def initialize(
          @end_time : Time,
          @instance_arn : String,
          @period : Int32,
          @start_time : Time,
          @stat : String,
          @recommendation_preferences : Types::RecommendationPreferences? = nil
        )
        end
      end

      struct GetEC2RecommendationProjectedMetricsResponse
        include JSON::Serializable

        # An array of objects that describes projected metrics.
        @[JSON::Field(key: "recommendedOptionProjectedMetrics")]
        getter recommended_option_projected_metrics : Array(Types::RecommendedOptionProjectedMetric)?

        def initialize(
          @recommended_option_projected_metrics : Array(Types::RecommendedOptionProjectedMetric)? = nil
        )
        end
      end

      struct GetECSServiceRecommendationProjectedMetricsRequest
        include JSON::Serializable

        # The timestamp of the last projected metrics data point to return.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The granularity, in seconds, of the projected metrics data points.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The ARN that identifies the Amazon ECS service. The following is the format of the ARN:
        # arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String

        # The timestamp of the first projected metrics data point to return.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic of the projected metrics.
        @[JSON::Field(key: "stat")]
        getter stat : String

        def initialize(
          @end_time : Time,
          @period : Int32,
          @service_arn : String,
          @start_time : Time,
          @stat : String
        )
        end
      end

      struct GetECSServiceRecommendationProjectedMetricsResponse
        include JSON::Serializable

        # An array of objects that describes the projected metrics.
        @[JSON::Field(key: "recommendedOptionProjectedMetrics")]
        getter recommended_option_projected_metrics : Array(Types::ECSServiceRecommendedOptionProjectedMetric)?

        def initialize(
          @recommended_option_projected_metrics : Array(Types::ECSServiceRecommendedOptionProjectedMetric)? = nil
        )
        end
      end

      struct GetECSServiceRecommendationsRequest
        include JSON::Serializable

        # Return the Amazon ECS service recommendations to the specified Amazon Web Services account IDs. If
        # your account is the management account or the delegated administrator of an organization, use this
        # parameter to return the Amazon ECS service recommendations to specific member accounts. You can only
        # specify one account ID per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of Amazon ECS service
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ECSServiceRecommendationFilter)?

        # The maximum number of Amazon ECS service recommendations to return with a single request. To
        # retrieve the remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of Amazon ECS service recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN that identifies the Amazon ECS service. The following is the format of the ARN:
        # arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name
        @[JSON::Field(key: "serviceArns")]
        getter service_arns : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @filters : Array(Types::ECSServiceRecommendationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_arns : Array(String)? = nil
        )
        end
      end

      struct GetECSServiceRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe the Amazon ECS service recommendations.
        @[JSON::Field(key: "ecsServiceRecommendations")]
        getter ecs_service_recommendations : Array(Types::ECSServiceRecommendation)?

        # An array of objects that describe errors of the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetRecommendationError)?

        # The token to advance to the next page of Amazon ECS service recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ecs_service_recommendations : Array(Types::ECSServiceRecommendation)? = nil,
          @errors : Array(Types::GetRecommendationError)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetEffectiveRecommendationPreferencesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to confirm effective recommendation
        # preferences. Only EC2 instance and Amazon EC2 Auto Scaling group ARNs are currently supported.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetEffectiveRecommendationPreferencesResponse
        include JSON::Serializable

        # The status of the enhanced infrastructure metrics recommendation preference. Considers all
        # applicable preferences that you might have set at the resource, account, and organization level. A
        # status of Active confirms that the preference is applied in the latest recommendation refresh, and a
        # status of Inactive confirms that it's not yet applied to recommendations. To validate whether the
        # preference is applied to your last generated set of recommendations, review the
        # effectiveRecommendationPreferences value in the response of the GetAutoScalingGroupRecommendations
        # and GetEC2InstanceRecommendations actions. For more information, see Enhanced infrastructure metrics
        # in the Compute Optimizer User Guide .
        @[JSON::Field(key: "enhancedInfrastructureMetrics")]
        getter enhanced_infrastructure_metrics : String?

        # The provider of the external metrics recommendation preference. Considers all applicable preferences
        # that you might have set at the account and organization level. If the preference is applied in the
        # latest recommendation refresh, an object with a valid source value appears in the response. If the
        # preference isn't applied to the recommendations already, then this object doesn't appear in the
        # response. To validate whether the preference is applied to your last generated set of
        # recommendations, review the effectiveRecommendationPreferences value in the response of the
        # GetEC2InstanceRecommendations actions. For more information, see Enhanced infrastructure metrics in
        # the Compute Optimizer User Guide .
        @[JSON::Field(key: "externalMetricsPreference")]
        getter external_metrics_preference : Types::ExternalMetricsPreference?

        # The number of days the utilization metrics of the Amazon Web Services resource are analyzed. To
        # validate that the preference is applied to your last generated set of recommendations, review the
        # effectiveRecommendationPreferences value in the response of the GetAutoScalingGroupRecommendations
        # or GetEC2InstanceRecommendations actions.
        @[JSON::Field(key: "lookBackPeriod")]
        getter look_back_period : String?

        # The resource type values that are considered as candidates when generating rightsizing
        # recommendations. This object resolves any wildcard expressions and returns the effective list of
        # candidate resource type values. It also considers all applicable preferences that you set at the
        # resource, account, and organization level. To validate that the preference is applied to your last
        # generated set of recommendations, review the effectiveRecommendationPreferences value in the
        # response of the GetAutoScalingGroupRecommendations or GetEC2InstanceRecommendations actions.
        @[JSON::Field(key: "preferredResources")]
        getter preferred_resources : Array(Types::EffectivePreferredResource)?

        # The resource’s CPU and memory utilization preferences, such as threshold and headroom, that were
        # used to generate rightsizing recommendations. It considers all applicable preferences that you set
        # at the resource, account, and organization level. To validate that the preference is applied to your
        # last generated set of recommendations, review the effectiveRecommendationPreferences value in the
        # response of the GetAutoScalingGroupRecommendations or GetEC2InstanceRecommendations actions.
        @[JSON::Field(key: "utilizationPreferences")]
        getter utilization_preferences : Array(Types::UtilizationPreference)?

        def initialize(
          @enhanced_infrastructure_metrics : String? = nil,
          @external_metrics_preference : Types::ExternalMetricsPreference? = nil,
          @look_back_period : String? = nil,
          @preferred_resources : Array(Types::EffectivePreferredResource)? = nil,
          @utilization_preferences : Array(Types::UtilizationPreference)? = nil
        )
        end
      end

      struct GetEnrollmentStatusRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetEnrollmentStatusResponse
        include JSON::Serializable

        # The Unix epoch timestamp, in seconds, of when the account enrollment status was last updated.
        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # Confirms the enrollment status of member accounts of the organization, if the account is a
        # management account of an organization.
        @[JSON::Field(key: "memberAccountsEnrolled")]
        getter member_accounts_enrolled : Bool?

        # The count of organization member accounts that are opted in to the service, if your account is an
        # organization management account.
        @[JSON::Field(key: "numberOfMemberAccountsOptedIn")]
        getter number_of_member_accounts_opted_in : Int32?

        # The enrollment status of the account.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason for the enrollment status of the account. For example, an account might show a status of
        # Pending because member accounts of an organization require more time to be enrolled in the service.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @last_updated_timestamp : Time? = nil,
          @member_accounts_enrolled : Bool? = nil,
          @number_of_member_accounts_opted_in : Int32? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      struct GetEnrollmentStatusesForOrganizationRequest
        include JSON::Serializable

        # An array of objects to specify a filter that returns a more specific list of account enrollment
        # statuses.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::EnrollmentFilter)?

        # The maximum number of account enrollment statuses to return with a single request. You can specify
        # up to 100 statuses to return with each request. To retrieve the remaining results, make another
        # request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of account enrollment statuses.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::EnrollmentFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetEnrollmentStatusesForOrganizationResponse
        include JSON::Serializable

        # An array of objects that describe the enrollment statuses of organization member accounts.
        @[JSON::Field(key: "accountEnrollmentStatuses")]
        getter account_enrollment_statuses : Array(Types::AccountEnrollmentStatus)?

        # The token to use to advance to the next page of account enrollment statuses. This value is null when
        # there are no more pages of account enrollment statuses to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_enrollment_statuses : Array(Types::AccountEnrollmentStatus)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetIdleRecommendationsRequest
        include JSON::Serializable

        # Return the idle resource recommendations to the specified Amazon Web Services account IDs. If your
        # account is the management account or the delegated administrator of an organization, use this
        # parameter to return the idle resource recommendations to specific member accounts. You can only
        # specify one account ID per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of idle resource
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::IdleRecommendationFilter)?

        # The maximum number of idle resource recommendations to return with a single request. To retrieve the
        # remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of idle resource recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order to sort the idle resource recommendations.
        @[JSON::Field(key: "orderBy")]
        getter order_by : Types::OrderBy?

        # The ARN that identifies the idle resource.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @filters : Array(Types::IdleRecommendationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order_by : Types::OrderBy? = nil,
          @resource_arns : Array(String)? = nil
        )
        end
      end

      struct GetIdleRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe errors of the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::IdleRecommendationError)?

        # An array of objects that describe the idle resource recommendations.
        @[JSON::Field(key: "idleRecommendations")]
        getter idle_recommendations : Array(Types::IdleRecommendation)?

        # The token to advance to the next page of idle resource recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @errors : Array(Types::IdleRecommendationError)? = nil,
          @idle_recommendations : Array(Types::IdleRecommendation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetLambdaFunctionRecommendationsRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account for which to return function recommendations. If your
        # account is the management account of an organization, use this parameter to specify the member
        # account for which you want to return function recommendations. Only one account ID can be specified
        # per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of function
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::LambdaFunctionRecommendationFilter)?

        # The Amazon Resource Name (ARN) of the functions for which to return recommendations. You can specify
        # a qualified or unqualified ARN. If you specify an unqualified ARN without a function version suffix,
        # Compute Optimizer will return recommendations for the latest ( $LATEST ) version of the function. If
        # you specify a qualified ARN with a version suffix, Compute Optimizer will return recommendations for
        # the specified function version. For more information about using function versions, see Using
        # versions in the Lambda Developer Guide .
        @[JSON::Field(key: "functionArns")]
        getter function_arns : Array(String)?

        # The maximum number of function recommendations to return with a single request. To retrieve the
        # remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of function recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @filters : Array(Types::LambdaFunctionRecommendationFilter)? = nil,
          @function_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetLambdaFunctionRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe function recommendations.
        @[JSON::Field(key: "lambdaFunctionRecommendations")]
        getter lambda_function_recommendations : Array(Types::LambdaFunctionRecommendation)?

        # The token to use to advance to the next page of function recommendations. This value is null when
        # there are no more pages of function recommendations to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @lambda_function_recommendations : Array(Types::LambdaFunctionRecommendation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetLicenseRecommendationsRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account for which to return license recommendations. If your
        # account is the management account of an organization, use this parameter to specify the member
        # account for which you want to return license recommendations. Only one account ID can be specified
        # per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of license
        # recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::LicenseRecommendationFilter)?

        # The maximum number of license recommendations to return with a single request. To retrieve the
        # remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of license recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN that identifies the Amazon EC2 instance. The following is the format of the ARN:
        # arn:aws:ec2:region:aws_account_id:instance/instance-id
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @filters : Array(Types::LicenseRecommendationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_arns : Array(String)? = nil
        )
        end
      end

      struct GetLicenseRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe errors of the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetRecommendationError)?

        # An array of objects that describe license recommendations.
        @[JSON::Field(key: "licenseRecommendations")]
        getter license_recommendations : Array(Types::LicenseRecommendation)?

        # The token to use to advance to the next page of license recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @errors : Array(Types::GetRecommendationError)? = nil,
          @license_recommendations : Array(Types::LicenseRecommendation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetRDSDatabaseRecommendationProjectedMetricsRequest
        include JSON::Serializable

        # The timestamp of the last projected metrics data point to return.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The granularity, in seconds, of the projected metrics data points.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The ARN that identifies the Amazon Aurora or RDS database. The following is the format of the ARN:
        # arn:aws:rds:{region}:{accountId}:db:{resourceName}
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The timestamp of the first projected metrics data point to return.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic of the projected metrics.
        @[JSON::Field(key: "stat")]
        getter stat : String

        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        def initialize(
          @end_time : Time,
          @period : Int32,
          @resource_arn : String,
          @start_time : Time,
          @stat : String,
          @recommendation_preferences : Types::RecommendationPreferences? = nil
        )
        end
      end

      struct GetRDSDatabaseRecommendationProjectedMetricsResponse
        include JSON::Serializable

        # An array of objects that describes the projected metrics.
        @[JSON::Field(key: "recommendedOptionProjectedMetrics")]
        getter recommended_option_projected_metrics : Array(Types::RDSDatabaseRecommendedOptionProjectedMetric)?

        def initialize(
          @recommended_option_projected_metrics : Array(Types::RDSDatabaseRecommendedOptionProjectedMetric)? = nil
        )
        end
      end

      struct GetRDSDatabaseRecommendationsRequest
        include JSON::Serializable

        # Return the Amazon Aurora and RDS database recommendations to the specified Amazon Web Services
        # account IDs. If your account is the management account or the delegated administrator of an
        # organization, use this parameter to return the Amazon Aurora and RDS database recommendations to
        # specific member accounts. You can only specify one account ID per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # An array of objects to specify a filter that returns a more specific list of Amazon Aurora and RDS
        # database recommendations.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RDSDBRecommendationFilter)?

        # The maximum number of Amazon Aurora and RDS database recommendations to return with a single
        # request. To retrieve the remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of Amazon Aurora and RDS database recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "recommendationPreferences")]
        getter recommendation_preferences : Types::RecommendationPreferences?

        # The ARN that identifies the Amazon Aurora or RDS database. The following is the format of the ARN:
        # arn:aws:rds:{region}:{accountId}:db:{resourceName} The following is the format of a DB Cluster ARN:
        # arn:aws:rds:{region}:{accountId}:cluster:{resourceName}
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @filters : Array(Types::RDSDBRecommendationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recommendation_preferences : Types::RecommendationPreferences? = nil,
          @resource_arns : Array(String)? = nil
        )
        end
      end

      struct GetRDSDatabaseRecommendationsResponse
        include JSON::Serializable

        # An array of objects that describe errors of the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetRecommendationError)?

        # The token to advance to the next page of Amazon Aurora and RDS database recommendations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that describe the Amazon Aurora and RDS database recommendations.
        @[JSON::Field(key: "rdsDBRecommendations")]
        getter rds_db_recommendations : Array(Types::RDSDBRecommendation)?

        def initialize(
          @errors : Array(Types::GetRecommendationError)? = nil,
          @next_token : String? = nil,
          @rds_db_recommendations : Array(Types::RDSDBRecommendation)? = nil
        )
        end
      end

      # Describes an error experienced when getting recommendations. For example, an error is returned if
      # you request recommendations for an unsupported Amazon EC2 Auto Scaling group, or if you request
      # recommendations for an instance of an unsupported instance family.
      struct GetRecommendationError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The ID of the error.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # The message, or reason, for the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @identifier : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct GetRecommendationPreferencesRequest
        include JSON::Serializable

        # The target resource type of the recommendation preference for which to return preferences. The
        # Ec2Instance option encompasses standalone instances and instances that are part of Amazon EC2 Auto
        # Scaling groups. The AutoScalingGroup option encompasses only instances that are part of an Amazon
        # EC2 Auto Scaling group.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The maximum number of recommendation preferences to return with a single request. To retrieve the
        # remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of recommendation preferences.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object that describes the scope of the recommendation preference to return. You can return
        # recommendation preferences that are created at the organization level (for management accounts of an
        # organization only), account level, and resource level. For more information, see Activating enhanced
        # infrastructure metrics in the Compute Optimizer User Guide .
        @[JSON::Field(key: "scope")]
        getter scope : Types::Scope?

        def initialize(
          @resource_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scope : Types::Scope? = nil
        )
        end
      end

      struct GetRecommendationPreferencesResponse
        include JSON::Serializable

        # The token to use to advance to the next page of recommendation preferences. This value is null when
        # there are no more pages of recommendation preferences to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that describe recommendation preferences.
        @[JSON::Field(key: "recommendationPreferencesDetails")]
        getter recommendation_preferences_details : Array(Types::RecommendationPreferencesDetail)?

        def initialize(
          @next_token : String? = nil,
          @recommendation_preferences_details : Array(Types::RecommendationPreferencesDetail)? = nil
        )
        end
      end

      struct GetRecommendationSummariesRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account for which to return recommendation summaries. If your
        # account is the management account of an organization, use this parameter to specify the member
        # account for which you want to return recommendation summaries. Only one account ID can be specified
        # per request.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The maximum number of recommendation summaries to return with a single request. To retrieve the
        # remaining results, make another request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to advance to the next page of recommendation summaries.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetRecommendationSummariesResponse
        include JSON::Serializable

        # The token to use to advance to the next page of recommendation summaries. This value is null when
        # there are no more pages of recommendation summaries to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that summarize a recommendation.
        @[JSON::Field(key: "recommendationSummaries")]
        getter recommendation_summaries : Array(Types::RecommendationSummary)?

        def initialize(
          @next_token : String? = nil,
          @recommendation_summaries : Array(Types::RecommendationSummary)? = nil
        )
        end
      end

      # Describes the GPU accelerators for the instance type.
      struct Gpu
        include JSON::Serializable

        # The number of GPUs for the instance type.
        @[JSON::Field(key: "gpuCount")]
        getter gpu_count : Int32?

        # The total size of the memory for the GPU accelerators for the instance type, in MiB.
        @[JSON::Field(key: "gpuMemorySizeInMiB")]
        getter gpu_memory_size_in_mi_b : Int32?

        def initialize(
          @gpu_count : Int32? = nil,
          @gpu_memory_size_in_mi_b : Int32? = nil
        )
        end
      end

      # Describes the GPU accelerator settings for the instance type.
      struct GpuInfo
        include JSON::Serializable

        # Describes the GPU accelerators for the instance type.
        @[JSON::Field(key: "gpus")]
        getter gpus : Array(Types::Gpu)?

        def initialize(
          @gpus : Array(Types::Gpu)? = nil
        )
        end
      end

      # Describes the estimated monthly savings possible for idle resources by adopting Compute Optimizer
      # recommendations.
      struct IdleEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings for Idle resources.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes an Idle resource recommendation.
      struct IdleRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the idle resource.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The finding classification of an idle resource.
        @[JSON::Field(key: "finding")]
        getter finding : String?

        # A summary of the findings for the resource.
        @[JSON::Field(key: "findingDescription")]
        getter finding_description : String?

        # The timestamp of when the idle resource recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The number of days the idle resource utilization metrics were analyzed.
        @[JSON::Field(key: "lookBackPeriodInDays")]
        getter look_back_period_in_days : Float64?

        # The ARN of the current idle resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The unique identifier for the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource that is idle.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The savings opportunity for the idle resource.
        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::IdleSavingsOpportunity?

        # The savings opportunity for the idle resource after any applying discounts.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::IdleSavingsOpportunityAfterDiscounts?

        # A list of tags assigned to your idle resource recommendations.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An array of objects that describe the utilization metrics of the idle resource.
        @[JSON::Field(key: "utilizationMetrics")]
        getter utilization_metrics : Array(Types::IdleUtilizationMetric)?

        def initialize(
          @account_id : String? = nil,
          @finding : String? = nil,
          @finding_description : String? = nil,
          @last_refresh_timestamp : Time? = nil,
          @look_back_period_in_days : Float64? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @savings_opportunity : Types::IdleSavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::IdleSavingsOpportunityAfterDiscounts? = nil,
          @tags : Array(Types::Tag)? = nil,
          @utilization_metrics : Array(Types::IdleUtilizationMetric)? = nil
        )
        end
      end

      # Returns of list of resources that doesn't have idle recommendations.
      struct IdleRecommendationError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The ID of the error.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The type of resource associated with the error.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @code : String? = nil,
          @identifier : String? = nil,
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of idle resource recommendations.
      struct IdleRecommendationFilter
        include JSON::Serializable

        # The name of the filter. Specify Finding to return recommendations with a specific finding
        # classification. You can filter your idle resource recommendations by tag:key and tag-key tags. A
        # tag:key is a key and value combination of a tag assigned to your idle resource recommendations. Use
        # the tag key in the filter name and the tag value as the filter value. For example, to find all idle
        # resource service recommendations that have a tag with the key of Owner and the value of TeamA ,
        # specify tag:Owner for the filter name and TeamA for the filter value. A tag-key is the key of a tag
        # assigned to your idle resource recommendations. Use this filter to find all of your idle resource
        # recommendations that have a tag with a specific key. This doesn’t consider the tag value. For
        # example, you can find your idle resource service recommendations with a tag key value of Owner or
        # without any tag keys assigned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the savings opportunity for idle resource recommendations.
      struct IdleSavingsOpportunity
        include JSON::Serializable

        # The estimated monthly savings possible by adopting Compute Optimizer's idle resource
        # recommendations.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::IdleEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute
        # Optimizer's idle resource recommendations.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::IdleEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes the savings opportunity for idle resource recommendations after applying discounts.
      # Savings opportunity represents the estimated monthly savings after applying discounts. You can
      # achieve this by implementing a given Compute Optimizer recommendation.
      struct IdleSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # The estimated monthly savings possible by adopting Compute Optimizer's idle resource
        # recommendations. This includes any applicable discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::IdleEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute
        # Optimizer's idle resource recommendations. This includes any applicable discounts.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::IdleEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes the findings summary of the idle resources.
      struct IdleSummary
        include JSON::Serializable

        # The name of the finding group for the idle resources.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The count of idle resources in the finding group.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the utilization metric of an idle resource.
      struct IdleUtilizationMetric
        include JSON::Serializable

        # The name of the utilization metric.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the utilization metric. The Compute Optimizer API, Command Line Interface (CLI),
        # and SDKs return utilization metrics using only the Maximum statistic, which is the highest value
        # observed during the specified period. The Compute Optimizer console displays graphs for some
        # utilization metrics using the Average statistic, which is the value of Sum / SampleCount during the
        # specified period. For more information, see Viewing resource recommendations in the Compute
        # Optimizer User Guide . You can also get averaged utilization metric data for your resources using
        # Amazon CloudWatch. For more information, see the Amazon CloudWatch User Guide .
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the utilization metric.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # The estimated monthly savings after you adjust the configurations of your instances running on the
      # inferred workload types to the recommended configurations. If the inferredWorkloadTypes list
      # contains multiple entries, then the savings are the sum of the monthly savings from instances that
      # run the exact combination of the inferred workload types.
      struct InferredWorkloadSaving
        include JSON::Serializable

        # An object that describes the estimated monthly savings amount possible by adopting Compute Optimizer
        # recommendations for a given resource. This is based on the On-Demand instance pricing.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        # The applications that might be running on the instance as inferred by Compute Optimizer. Compute
        # Optimizer can infer if one of the following applications might be running on the instance: AmazonEmr
        # - Infers that Amazon EMR might be running on the instance. ApacheCassandra - Infers that Apache
        # Cassandra might be running on the instance. ApacheHadoop - Infers that Apache Hadoop might be
        # running on the instance. Memcached - Infers that Memcached might be running on the instance. NGINX -
        # Infers that NGINX might be running on the instance. PostgreSql - Infers that PostgreSQL might be
        # running on the instance. Redis - Infers that Redis might be running on the instance. Kafka - Infers
        # that Kafka might be running on the instance. SQLServer - Infers that SQLServer might be running on
        # the instance.
        @[JSON::Field(key: "inferredWorkloadTypes")]
        getter inferred_workload_types : Array(String)?

        def initialize(
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil,
          @inferred_workload_types : Array(String)? = nil
        )
        end
      end

      # An object that describes the estimated monthly savings possible by adopting Compute Optimizer’s
      # Amazon EC2 instance recommendations. This is based on the Savings Plans and Reserved Instances
      # pricing discounts.
      struct InstanceEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes an Amazon EC2 instance recommendation.
      struct InstanceRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the instance.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Describes the GPU accelerator settings for the current instance type.
        @[JSON::Field(key: "currentInstanceGpuInfo")]
        getter current_instance_gpu_info : Types::GpuInfo?

        # The instance type of the current instance.
        @[JSON::Field(key: "currentInstanceType")]
        getter current_instance_type : String?

        # The risk of the current instance not meeting the performance needs of its workloads. The higher the
        # risk, the more likely the current instance cannot meet the performance requirements of its workload.
        @[JSON::Field(key: "currentPerformanceRisk")]
        getter current_performance_risk : String?

        # An object that describes the effective recommendation preferences for the instance.
        @[JSON::Field(key: "effectiveRecommendationPreferences")]
        getter effective_recommendation_preferences : Types::EffectiveRecommendationPreferences?

        # An object that describes Compute Optimizer's integration status with your external metrics provider.
        @[JSON::Field(key: "externalMetricStatus")]
        getter external_metric_status : Types::ExternalMetricStatus?

        # The finding classification of the instance. Findings for instances include: Underprovisioned —An
        # instance is considered under-provisioned when at least one specification of your instance, such as
        # CPU, memory, or network, does not meet the performance requirements of your workload.
        # Under-provisioned instances may lead to poor application performance. Overprovisioned —An instance
        # is considered over-provisioned when at least one specification of your instance, such as CPU,
        # memory, or network, can be sized down while still meeting the performance requirements of your
        # workload, and no specification is under-provisioned. Over-provisioned instances may lead to
        # unnecessary infrastructure cost. Optimized —An instance is considered optimized when all
        # specifications of your instance, such as CPU, memory, and network, meet the performance requirements
        # of your workload and is not over provisioned. For optimized resources, Compute Optimizer might
        # recommend a new generation instance type. The valid values in your API responses appear as
        # OVER_PROVISIONED, UNDER_PROVISIONED, or OPTIMIZED.
        @[JSON::Field(key: "finding")]
        getter finding : String?

        # The reason for the finding classification of the instance. Finding reason codes for instances
        # include: CPUOverprovisioned — The instance’s CPU configuration can be sized down while still meeting
        # the performance requirements of your workload. This is identified by analyzing the CPUUtilization
        # metric of the current instance during the look-back period. CPUUnderprovisioned — The instance’s CPU
        # configuration doesn't meet the performance requirements of your workload and there is an alternative
        # instance type that provides better CPU performance. This is identified by analyzing the
        # CPUUtilization metric of the current instance during the look-back period. MemoryOverprovisioned —
        # The instance’s memory configuration can be sized down while still meeting the performance
        # requirements of your workload. This is identified by analyzing the memory utilization metric of the
        # current instance during the look-back period. MemoryUnderprovisioned — The instance’s memory
        # configuration doesn't meet the performance requirements of your workload and there is an alternative
        # instance type that provides better memory performance. This is identified by analyzing the memory
        # utilization metric of the current instance during the look-back period. Memory utilization is
        # analyzed only for resources that have the unified CloudWatch agent installed on them. For more
        # information, see Enabling memory utilization with the Amazon CloudWatch Agent in the Compute
        # Optimizer User Guide . On Linux instances, Compute Optimizer analyses the mem_used_percent metric in
        # the CWAgent namespace, or the legacy MemoryUtilization metric in the System/Linux namespace. On
        # Windows instances, Compute Optimizer analyses the Memory % Committed Bytes In Use metric in the
        # CWAgent namespace. EBSThroughputOverprovisioned — The instance’s EBS throughput configuration can be
        # sized down while still meeting the performance requirements of your workload. This is identified by
        # analyzing the VolumeReadBytes and VolumeWriteBytes metrics of EBS volumes attached to the current
        # instance during the look-back period. EBSThroughputUnderprovisioned — The instance’s EBS throughput
        # configuration doesn't meet the performance requirements of your workload and there is an alternative
        # instance type that provides better EBS throughput performance. This is identified by analyzing the
        # VolumeReadBytes and VolumeWriteBytes metrics of EBS volumes attached to the current instance during
        # the look-back period. EBSIOPSOverprovisioned — The instance’s EBS IOPS configuration can be sized
        # down while still meeting the performance requirements of your workload. This is identified by
        # analyzing the VolumeReadOps and VolumeWriteOps metric of EBS volumes attached to the current
        # instance during the look-back period. EBSIOPSUnderprovisioned — The instance’s EBS IOPS
        # configuration doesn't meet the performance requirements of your workload and there is an alternative
        # instance type that provides better EBS IOPS performance. This is identified by analyzing the
        # VolumeReadOps and VolumeWriteOps metric of EBS volumes attached to the current instance during the
        # look-back period. NetworkBandwidthOverprovisioned — The instance’s network bandwidth configuration
        # can be sized down while still meeting the performance requirements of your workload. This is
        # identified by analyzing the NetworkIn and NetworkOut metrics of the current instance during the
        # look-back period. NetworkBandwidthUnderprovisioned — The instance’s network bandwidth configuration
        # doesn't meet the performance requirements of your workload and there is an alternative instance type
        # that provides better network bandwidth performance. This is identified by analyzing the NetworkIn
        # and NetworkOut metrics of the current instance during the look-back period. This finding reason
        # happens when the NetworkIn or NetworkOut performance of an instance is impacted.
        # NetworkPPSOverprovisioned — The instance’s network PPS (packets per second) configuration can be
        # sized down while still meeting the performance requirements of your workload. This is identified by
        # analyzing the NetworkPacketsIn and NetworkPacketsIn metrics of the current instance during the
        # look-back period. NetworkPPSUnderprovisioned — The instance’s network PPS (packets per second)
        # configuration doesn't meet the performance requirements of your workload and there is an alternative
        # instance type that provides better network PPS performance. This is identified by analyzing the
        # NetworkPacketsIn and NetworkPacketsIn metrics of the current instance during the look-back period.
        # DiskIOPSOverprovisioned — The instance’s disk IOPS configuration can be sized down while still
        # meeting the performance requirements of your workload. This is identified by analyzing the
        # DiskReadOps and DiskWriteOps metrics of the current instance during the look-back period.
        # DiskIOPSUnderprovisioned — The instance’s disk IOPS configuration doesn't meet the performance
        # requirements of your workload and there is an alternative instance type that provides better disk
        # IOPS performance. This is identified by analyzing the DiskReadOps and DiskWriteOps metrics of the
        # current instance during the look-back period. DiskThroughputOverprovisioned — The instance’s disk
        # throughput configuration can be sized down while still meeting the performance requirements of your
        # workload. This is identified by analyzing the DiskReadBytes and DiskWriteBytes metrics of the
        # current instance during the look-back period. DiskThroughputUnderprovisioned — The instance’s disk
        # throughput configuration doesn't meet the performance requirements of your workload and there is an
        # alternative instance type that provides better disk throughput performance. This is identified by
        # analyzing the DiskReadBytes and DiskWriteBytes metrics of the current instance during the look-back
        # period. For more information about instance metrics, see List the available CloudWatch metrics for
        # your instances in the Amazon Elastic Compute Cloud User Guide . For more information about EBS
        # volume metrics, see Amazon CloudWatch metrics for Amazon EBS in the Amazon Elastic Compute Cloud
        # User Guide .
        @[JSON::Field(key: "findingReasonCodes")]
        getter finding_reason_codes : Array(String)?

        # Describes if an Amazon EC2 instance is idle.
        @[JSON::Field(key: "idle")]
        getter idle : String?

        # The applications that might be running on the instance as inferred by Compute Optimizer. Compute
        # Optimizer can infer if one of the following applications might be running on the instance: AmazonEmr
        # - Infers that Amazon EMR might be running on the instance. ApacheCassandra - Infers that Apache
        # Cassandra might be running on the instance. ApacheHadoop - Infers that Apache Hadoop might be
        # running on the instance. Memcached - Infers that Memcached might be running on the instance. NGINX -
        # Infers that NGINX might be running on the instance. PostgreSql - Infers that PostgreSQL might be
        # running on the instance. Redis - Infers that Redis might be running on the instance. Kafka - Infers
        # that Kafka might be running on the instance. SQLServer - Infers that SQLServer might be running on
        # the instance.
        @[JSON::Field(key: "inferredWorkloadTypes")]
        getter inferred_workload_types : Array(String)?

        # The Amazon Resource Name (ARN) of the current instance.
        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?

        # The name of the current instance.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        # The state of the instance when the recommendation was generated.
        @[JSON::Field(key: "instanceState")]
        getter instance_state : String?

        # The timestamp of when the instance recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The number of days for which utilization metrics were analyzed for the instance.
        @[JSON::Field(key: "lookBackPeriodInDays")]
        getter look_back_period_in_days : Float64?

        # An array of objects that describe the recommendation options for the instance.
        @[JSON::Field(key: "recommendationOptions")]
        getter recommendation_options : Array(Types::InstanceRecommendationOption)?

        # An array of objects that describe the source resource of the recommendation.
        @[JSON::Field(key: "recommendationSources")]
        getter recommendation_sources : Array(Types::RecommendationSource)?

        # A list of tags assigned to your Amazon EC2 instance recommendations.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An array of objects that describe the utilization metrics of the instance.
        @[JSON::Field(key: "utilizationMetrics")]
        getter utilization_metrics : Array(Types::UtilizationMetric)?

        def initialize(
          @account_id : String? = nil,
          @current_instance_gpu_info : Types::GpuInfo? = nil,
          @current_instance_type : String? = nil,
          @current_performance_risk : String? = nil,
          @effective_recommendation_preferences : Types::EffectiveRecommendationPreferences? = nil,
          @external_metric_status : Types::ExternalMetricStatus? = nil,
          @finding : String? = nil,
          @finding_reason_codes : Array(String)? = nil,
          @idle : String? = nil,
          @inferred_workload_types : Array(String)? = nil,
          @instance_arn : String? = nil,
          @instance_name : String? = nil,
          @instance_state : String? = nil,
          @last_refresh_timestamp : Time? = nil,
          @look_back_period_in_days : Float64? = nil,
          @recommendation_options : Array(Types::InstanceRecommendationOption)? = nil,
          @recommendation_sources : Array(Types::RecommendationSource)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @utilization_metrics : Array(Types::UtilizationMetric)? = nil
        )
        end
      end

      # Describes a recommendation option for an Amazon EC2 instance.
      struct InstanceRecommendationOption
        include JSON::Serializable

        # Describes the GPU accelerator settings for the recommended instance type.
        @[JSON::Field(key: "instanceGpuInfo")]
        getter instance_gpu_info : Types::GpuInfo?

        # The instance type of the instance recommendation.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The level of effort required to migrate from the current instance type to the recommended instance
        # type. For example, the migration effort is Low if Amazon EMR is the inferred workload type and an
        # Amazon Web Services Graviton instance type is recommended. The migration effort is Medium if a
        # workload type couldn't be inferred but an Amazon Web Services Graviton instance type is recommended.
        # The migration effort is VeryLow if both the current and recommended instance types are of the same
        # CPU architecture.
        @[JSON::Field(key: "migrationEffort")]
        getter migration_effort : String?

        # The performance risk of the instance recommendation option. Performance risk indicates the
        # likelihood of the recommended instance type not meeting the resource needs of your workload. Compute
        # Optimizer calculates an individual performance risk score for each specification of the recommended
        # instance, including CPU, memory, EBS throughput, EBS IOPS, disk throughput, disk IOPS, network
        # throughput, and network PPS. The performance risk of the recommended instance is calculated as the
        # maximum performance risk score across the analyzed resource specifications. The value ranges from 0
        # - 4 , with 0 meaning that the recommended resource is predicted to always provide enough hardware
        # capability. The higher the performance risk is, the more likely you should validate whether the
        # recommendation will meet the performance requirements of your workload before migrating your
        # resource.
        @[JSON::Field(key: "performanceRisk")]
        getter performance_risk : Float64?

        # Describes the configuration differences between the current instance and the recommended instance
        # type. You should consider the configuration differences before migrating your workloads from the
        # current instance to the recommended instance type. The Change the instance type guide for Linux and
        # Change the instance type guide for Windows provide general guidance for getting started with an
        # instance migration. Platform differences include: Hypervisor — The hypervisor of the recommended
        # instance type is different than that of the current instance. For example, the recommended instance
        # type uses a Nitro hypervisor and the current instance uses a Xen hypervisor. The differences that
        # you should consider between these hypervisors are covered in the Nitro Hypervisor section of the
        # Amazon EC2 frequently asked questions. For more information, see Instances built on the Nitro System
        # in the Amazon EC2 User Guide for Linux , or Instances built on the Nitro System in the Amazon EC2
        # User Guide for Windows . NetworkInterface — The network interface of the recommended instance type
        # is different than that of the current instance. For example, the recommended instance type supports
        # enhanced networking and the current instance might not. To enable enhanced networking for the
        # recommended instance type, you must install the Elastic Network Adapter (ENA) driver or the Intel
        # 82599 Virtual Function driver. For more information, see Networking and storage features and
        # Enhanced networking on Linux in the Amazon EC2 User Guide for Linux , or Networking and storage
        # features and Enhanced networking on Windows in the Amazon EC2 User Guide for Windows .
        # StorageInterface — The storage interface of the recommended instance type is different than that of
        # the current instance. For example, the recommended instance type uses an NVMe storage interface and
        # the current instance does not. To access NVMe volumes for the recommended instance type, you will
        # need to install or upgrade the NVMe driver. For more information, see Networking and storage
        # features and Amazon EBS and NVMe on Linux instances in the Amazon EC2 User Guide for Linux , or
        # Networking and storage features and Amazon EBS and NVMe on Windows instances in the Amazon EC2 User
        # Guide for Windows . InstanceStoreAvailability — The recommended instance type does not support
        # instance store volumes and the current instance does. Before migrating, you might need to back up
        # the data on your instance store volumes if you want to preserve them. For more information, see How
        # do I back up an instance store volume on my Amazon EC2 instance to Amazon EBS? in the Amazon Web
        # Services Premium Support Knowledge Base . For more information, see Networking and storage features
        # and Amazon EC2 instance store in the Amazon EC2 User Guide for Linux , or see Networking and storage
        # features and Amazon EC2 instance store in the Amazon EC2 User Guide for Windows . VirtualizationType
        # — The recommended instance type uses the hardware virtual machine (HVM) virtualization type and the
        # current instance uses the paravirtual (PV) virtualization type. For more information about the
        # differences between these virtualization types, see Linux AMI virtualization types in the Amazon EC2
        # User Guide for Linux , or Windows AMI virtualization types in the Amazon EC2 User Guide for Windows
        # . Architecture — The CPU architecture between the recommended instance type and the current instance
        # is different. For example, the recommended instance type might use an Arm CPU architecture and the
        # current instance type might use a different one, such as x86. Before migrating, you should consider
        # recompiling the software on your instance for the new architecture. Alternatively, you might switch
        # to an Amazon Machine Image (AMI) that supports the new architecture. For more information about the
        # CPU architecture for each instance type, see Amazon EC2 Instance Types .
        @[JSON::Field(key: "platformDifferences")]
        getter platform_differences : Array(String)?

        # An array of objects that describe the projected utilization metrics of the instance recommendation
        # option. The Cpu and Memory metrics are the only projected utilization metrics returned.
        # Additionally, the Memory metric is returned only for resources that have the unified CloudWatch
        # agent installed on them. For more information, see Enabling Memory Utilization with the CloudWatch
        # Agent .
        @[JSON::Field(key: "projectedUtilizationMetrics")]
        getter projected_utilization_metrics : Array(Types::UtilizationMetric)?

        # The rank of the instance recommendation option. The top recommendation option is ranked as 1 .
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # An object that describes the savings opportunity for the instance recommendation option. Savings
        # opportunity includes the estimated monthly savings amount and percentage.
        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # An object that describes the savings opportunity for the instance recommendation option that
        # includes Savings Plans and Reserved Instances discounts. Savings opportunity includes the estimated
        # monthly savings and percentage.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::InstanceSavingsOpportunityAfterDiscounts?

        def initialize(
          @instance_gpu_info : Types::GpuInfo? = nil,
          @instance_type : String? = nil,
          @migration_effort : String? = nil,
          @performance_risk : Float64? = nil,
          @platform_differences : Array(String)? = nil,
          @projected_utilization_metrics : Array(Types::UtilizationMetric)? = nil,
          @rank : Int32? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::InstanceSavingsOpportunityAfterDiscounts? = nil
        )
        end
      end

      # Describes the savings estimation mode used for calculating savings opportunity for Amazon EC2
      # instances.
      struct InstanceSavingsEstimationMode
        include JSON::Serializable

        # Describes the source for calculating the savings opportunity for Amazon EC2 instances.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @source : String? = nil
        )
        end
      end

      # Describes the savings opportunity for instance recommendations after applying the Savings Plans and
      # Reserved Instances discounts. Savings opportunity after discounts represents the estimated monthly
      # savings you can achieve by implementing Compute Optimizer recommendations.
      struct InstanceSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # An object that describes the estimated monthly savings possible by adopting Compute Optimizer’s
        # Amazon EC2 instance recommendations. This is based on pricing after applying the Savings Plans and
        # Reserved Instances discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::InstanceEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost after applying the Savings
        # Plans and Reserved Instances discounts. This saving can be achieved by adopting Compute Optimizer’s
        # EC2 instance recommendations.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::InstanceEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # An internal error has occurred. Try your call again.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value supplied for the input parameter is out of range or not valid.
      struct InvalidParameterValueException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of recommendation export jobs. Use this filter
      # with the DescribeRecommendationExportJobs action. You can use EBSFilter with the
      # GetEBSVolumeRecommendations action, LambdaFunctionRecommendationFilter with the
      # GetLambdaFunctionRecommendations action, and Filter with the GetAutoScalingGroupRecommendations and
      # GetEC2InstanceRecommendations actions.
      struct JobFilter
        include JSON::Serializable

        # The name of the filter. Specify ResourceType to return export jobs of a specific resource type (for
        # example, Ec2Instance ). Specify JobStatus to return export jobs with a specific status (e.g,
        # Complete ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter. The valid values for this parameter are as follows, depending on what you
        # specify for the name parameter: Specify Ec2Instance or AutoScalingGroup if you specify the name
        # parameter as ResourceType . There is no filter for EBS volumes because volume recommendations cannot
        # be exported at this time. Specify Queued , InProgress , Complete , or Failed if you specify the name
        # parameter as JobStatus .
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the effective recommendation preferences for Lambda functions.
      struct LambdaEffectiveRecommendationPreferences
        include JSON::Serializable

        # Describes the savings estimation mode applied for calculating savings opportunity for Lambda
        # functions.
        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : Types::LambdaSavingsEstimationMode?

        def initialize(
          @savings_estimation_mode : Types::LambdaSavingsEstimationMode? = nil
        )
        end
      end

      # Describes the estimated monthly savings possible for Lambda functions by adopting Compute Optimizer
      # recommendations. This is based on Lambda functions pricing after applying Savings Plans discounts.
      struct LambdaEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes a projected utilization metric of an Lambda function recommendation option.
      struct LambdaFunctionMemoryProjectedMetric
        include JSON::Serializable

        # The name of the projected utilization metric.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the projected utilization metric.
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The values of the projected utilization metrics.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes a recommendation option for an Lambda function.
      struct LambdaFunctionMemoryRecommendationOption
        include JSON::Serializable

        # The memory size, in MB, of the function recommendation option.
        @[JSON::Field(key: "memorySize")]
        getter memory_size : Int32?

        # An array of objects that describe the projected utilization metrics of the function recommendation
        # option.
        @[JSON::Field(key: "projectedUtilizationMetrics")]
        getter projected_utilization_metrics : Array(Types::LambdaFunctionMemoryProjectedMetric)?

        # The rank of the function recommendation option. The top recommendation option is ranked as 1 .
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # An object that describes the savings opportunity for the Lambda function recommendation option.
        # Savings opportunity includes the estimated monthly savings amount and percentage.
        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # An object that describes the savings opportunity for the Lambda recommendation option which includes
        # Saving Plans discounts. Savings opportunity includes the estimated monthly savings and percentage.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::LambdaSavingsOpportunityAfterDiscounts?

        def initialize(
          @memory_size : Int32? = nil,
          @projected_utilization_metrics : Array(Types::LambdaFunctionMemoryProjectedMetric)? = nil,
          @rank : Int32? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::LambdaSavingsOpportunityAfterDiscounts? = nil
        )
        end
      end

      # Describes an Lambda function recommendation.
      struct LambdaFunctionRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the function.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The amount of memory, in MB, that's allocated to the current function.
        @[JSON::Field(key: "currentMemorySize")]
        getter current_memory_size : Int32?

        # The risk of the current Lambda function not meeting the performance needs of its workloads. The
        # higher the risk, the more likely the current Lambda function requires more memory.
        @[JSON::Field(key: "currentPerformanceRisk")]
        getter current_performance_risk : String?

        # Describes the effective recommendation preferences for Lambda functions.
        @[JSON::Field(key: "effectiveRecommendationPreferences")]
        getter effective_recommendation_preferences : Types::LambdaEffectiveRecommendationPreferences?

        # The finding classification of the function. Findings for functions include: Optimized — The function
        # is correctly provisioned to run your workload based on its current configuration and its utilization
        # history. This finding classification does not include finding reason codes. NotOptimized — The
        # function is performing at a higher level (over-provisioned) or at a lower level (under-provisioned)
        # than required for your workload because its current configuration is not optimal. Over-provisioned
        # resources might lead to unnecessary infrastructure cost, and under-provisioned resources might lead
        # to poor application performance. This finding classification can include the MemoryUnderprovisioned
        # and MemoryUnderprovisioned finding reason codes. Unavailable — Compute Optimizer was unable to
        # generate a recommendation for the function. This could be because the function has not accumulated
        # sufficient metric data, or the function does not qualify for a recommendation. This finding
        # classification can include the InsufficientData and Inconclusive finding reason codes. Functions
        # with a finding of unavailable are not returned unless you specify the filter parameter with a value
        # of Unavailable in your GetLambdaFunctionRecommendations request.
        @[JSON::Field(key: "finding")]
        getter finding : String?

        # The reason for the finding classification of the function. Functions that have a finding
        # classification of Optimized don't have a finding reason code. Finding reason codes for functions
        # include: MemoryOverprovisioned — The function is over-provisioned when its memory configuration can
        # be sized down while still meeting the performance requirements of your workload. An over-provisioned
        # function might lead to unnecessary infrastructure cost. This finding reason code is part of the
        # NotOptimized finding classification. MemoryUnderprovisioned — The function is under-provisioned when
        # its memory configuration doesn't meet the performance requirements of the workload. An
        # under-provisioned function might lead to poor application performance. This finding reason code is
        # part of the NotOptimized finding classification. InsufficientData — The function does not have
        # sufficient metric data for Compute Optimizer to generate a recommendation. For more information, see
        # the Supported resources and requirements in the Compute Optimizer User Guide . This finding reason
        # code is part of the Unavailable finding classification. Inconclusive — The function does not qualify
        # for a recommendation because Compute Optimizer cannot generate a recommendation with a high degree
        # of confidence. This finding reason code is part of the Unavailable finding classification.
        @[JSON::Field(key: "findingReasonCodes")]
        getter finding_reason_codes : Array(String)?

        # The Amazon Resource Name (ARN) of the current function.
        @[JSON::Field(key: "functionArn")]
        getter function_arn : String?

        # The version number of the current function.
        @[JSON::Field(key: "functionVersion")]
        getter function_version : String?

        # The timestamp of when the function recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The number of days for which utilization metrics were analyzed for the function.
        @[JSON::Field(key: "lookbackPeriodInDays")]
        getter lookback_period_in_days : Float64?

        # An array of objects that describe the memory configuration recommendation options for the function.
        @[JSON::Field(key: "memorySizeRecommendationOptions")]
        getter memory_size_recommendation_options : Array(Types::LambdaFunctionMemoryRecommendationOption)?

        # The number of times your function code was applied during the look-back period.
        @[JSON::Field(key: "numberOfInvocations")]
        getter number_of_invocations : Int64?

        # A list of tags assigned to your Lambda function recommendations.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An array of objects that describe the utilization metrics of the function.
        @[JSON::Field(key: "utilizationMetrics")]
        getter utilization_metrics : Array(Types::LambdaFunctionUtilizationMetric)?

        def initialize(
          @account_id : String? = nil,
          @current_memory_size : Int32? = nil,
          @current_performance_risk : String? = nil,
          @effective_recommendation_preferences : Types::LambdaEffectiveRecommendationPreferences? = nil,
          @finding : String? = nil,
          @finding_reason_codes : Array(String)? = nil,
          @function_arn : String? = nil,
          @function_version : String? = nil,
          @last_refresh_timestamp : Time? = nil,
          @lookback_period_in_days : Float64? = nil,
          @memory_size_recommendation_options : Array(Types::LambdaFunctionMemoryRecommendationOption)? = nil,
          @number_of_invocations : Int64? = nil,
          @tags : Array(Types::Tag)? = nil,
          @utilization_metrics : Array(Types::LambdaFunctionUtilizationMetric)? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of Lambda function recommendations. Use this
      # filter with the GetLambdaFunctionRecommendations action. You can use EBSFilter with the
      # GetEBSVolumeRecommendations action, JobFilter with the DescribeRecommendationExportJobs action, and
      # Filter with the GetAutoScalingGroupRecommendations and GetEC2InstanceRecommendations actions.
      struct LambdaFunctionRecommendationFilter
        include JSON::Serializable

        # The name of the filter. Specify Finding to return recommendations with a specific finding
        # classification (for example, NotOptimized ). Specify FindingReasonCode to return recommendations
        # with a specific finding reason code (for example, MemoryUnderprovisioned ). You can filter your
        # Lambda function recommendations by tag:key and tag-key tags. A tag:key is a key and value
        # combination of a tag assigned to your Lambda function recommendations. Use the tag key in the filter
        # name and the tag value as the filter value. For example, to find all Lambda function recommendations
        # that have a tag with the key of Owner and the value of TeamA , specify tag:Owner for the filter name
        # and TeamA for the filter value. A tag-key is the key of a tag assigned to your Lambda function
        # recommendations. Use this filter to find all of your Lambda function recommendations that have a tag
        # with a specific key. This doesn’t consider the tag value. For example, you can find your Lambda
        # function recommendations with a tag key value of Owner or without any tag keys assigned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter. The valid values for this parameter are as follows, depending on what you
        # specify for the name parameter: Specify Optimized , NotOptimized , or Unavailable if you specify the
        # name parameter as Finding . Specify MemoryOverprovisioned , MemoryUnderprovisioned ,
        # InsufficientData , or Inconclusive if you specify the name parameter as FindingReasonCode .
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes a utilization metric of an Lambda function.
      struct LambdaFunctionUtilizationMetric
        include JSON::Serializable

        # The name of the utilization metric. The following utilization metrics are available: Duration - The
        # amount of time that your function code spends processing an event. Memory - The amount of memory
        # used per invocation.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the utilization metric. The Compute Optimizer API, Command Line Interface (CLI),
        # and SDKs return utilization metrics using only the Maximum statistic, which is the highest value
        # observed during the specified period. The Compute Optimizer console displays graphs for some
        # utilization metrics using the Average statistic, which is the value of Sum / SampleCount during the
        # specified period. For more information, see Viewing resource recommendations in the Compute
        # Optimizer User Guide . You can also get averaged utilization metric data for your resources using
        # Amazon CloudWatch. For more information, see the Amazon CloudWatch User Guide .
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the utilization metric.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the savings estimation used for calculating savings opportunity for Lambda functions.
      struct LambdaSavingsEstimationMode
        include JSON::Serializable

        # Describes the source for calculation of savings opportunity for Lambda functions.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @source : String? = nil
        )
        end
      end

      # Describes the savings opportunity for Lambda functions recommendations after applying Savings Plans
      # discounts. Savings opportunity represents the estimated monthly savings after applying Savings Plans
      # discounts. You can achieve this by implementing a given Compute Optimizer recommendation.
      struct LambdaSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # The estimated monthly savings possible by adopting Compute Optimizer’s Lambda function
        # recommendations. This includes any applicable Savings Plans discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::LambdaEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute
        # Optimizer’s Lambda function recommendations. This includes any applicable Savings Plans discounts.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::LambdaEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes the configuration of a license for an Amazon EC2 instance.
      struct LicenseConfiguration
        include JSON::Serializable

        # The instance type used in the license.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The edition of the license for the application that runs on the instance.
        @[JSON::Field(key: "licenseEdition")]
        getter license_edition : String?

        # The license type associated with the instance.
        @[JSON::Field(key: "licenseModel")]
        getter license_model : String?

        # The name of the license for the application that runs on the instance.
        @[JSON::Field(key: "licenseName")]
        getter license_name : String?

        # The version of the license for the application that runs on the instance.
        @[JSON::Field(key: "licenseVersion")]
        getter license_version : String?

        # The list of metric sources required to generate recommendations for commercial software licenses.
        @[JSON::Field(key: "metricsSource")]
        getter metrics_source : Array(Types::MetricSource)?

        # The current number of cores associated with the instance.
        @[JSON::Field(key: "numberOfCores")]
        getter number_of_cores : Int32?

        # The operating system of the instance.
        @[JSON::Field(key: "operatingSystem")]
        getter operating_system : String?

        def initialize(
          @instance_type : String? = nil,
          @license_edition : String? = nil,
          @license_model : String? = nil,
          @license_name : String? = nil,
          @license_version : String? = nil,
          @metrics_source : Array(Types::MetricSource)? = nil,
          @number_of_cores : Int32? = nil,
          @operating_system : String? = nil
        )
        end
      end

      # Describes a license recommendation for an EC2 instance.
      struct LicenseRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the license.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # An object that describes the current configuration of an instance that runs on a license.
        @[JSON::Field(key: "currentLicenseConfiguration")]
        getter current_license_configuration : Types::LicenseConfiguration?

        # The finding classification for an instance that runs on a license. Findings include:
        # InsufficentMetrics — When Compute Optimizer detects that your CloudWatch Application Insights isn't
        # enabled or is enabled with insufficient permissions. NotOptimized — When Compute Optimizer detects
        # that your EC2 infrastructure isn't using any of the SQL server license features you're paying for, a
        # license is considered not optimized. Optimized — When Compute Optimizer detects that all
        # specifications of your license meet the performance requirements of your workload.
        @[JSON::Field(key: "finding")]
        getter finding : String?

        # The reason for the finding classification for an instance that runs on a license. Finding reason
        # codes include: Optimized — All specifications of your license meet the performance requirements of
        # your workload. LicenseOverprovisioned — A license is considered over-provisioned when your license
        # can be downgraded while still meeting the performance requirements of your workload.
        # InvalidCloudwatchApplicationInsights — CloudWatch Application Insights isn't configured properly.
        # CloudwatchApplicationInsightsError — There is a CloudWatch Application Insights error.
        @[JSON::Field(key: "findingReasonCodes")]
        getter finding_reason_codes : Array(String)?

        # The timestamp of when the license recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # An array of objects that describe the license recommendation options.
        @[JSON::Field(key: "licenseRecommendationOptions")]
        getter license_recommendation_options : Array(Types::LicenseRecommendationOption)?

        # The number of days for which utilization metrics were analyzed for an instance that runs on a
        # license.
        @[JSON::Field(key: "lookbackPeriodInDays")]
        getter lookback_period_in_days : Float64?

        # The ARN that identifies the Amazon EC2 instance.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # A list of tags assigned to an EC2 instance.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String? = nil,
          @current_license_configuration : Types::LicenseConfiguration? = nil,
          @finding : String? = nil,
          @finding_reason_codes : Array(String)? = nil,
          @last_refresh_timestamp : Time? = nil,
          @license_recommendation_options : Array(Types::LicenseRecommendationOption)? = nil,
          @lookback_period_in_days : Float64? = nil,
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of license recommendations. Use this filter
      # with the GetLicenseRecommendation action.
      struct LicenseRecommendationFilter
        include JSON::Serializable

        # The name of the filter. Specify Finding to return recommendations with a specific finding
        # classification. Specify FindingReasonCode to return recommendations with a specific finding reason
        # code. You can filter your license recommendations by tag:key and tag-key tags. A tag:key is a key
        # and value combination of a tag assigned to your license recommendations. Use the tag key in the
        # filter name and the tag value as the filter value. For example, to find all license recommendations
        # that have a tag with the key of Owner and the value of TeamA , specify tag:Owner for the filter name
        # and TeamA for the filter value. A tag-key is the key of a tag assigned to your license
        # recommendations. Use this filter to find all of your license recommendations that have a tag with a
        # specific key. This doesn’t consider the tag value. For example, you can find your license
        # recommendations with a tag key value of Owner or without any tag keys assigned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter. The valid values for this parameter are as follows, depending on what you
        # specify for the name parameter: If you specify the name parameter as Finding , then specify
        # Optimized , NotOptimized , or InsufficentMetrics . If you specify the name parameter as
        # FindingReasonCode , then specify Optimized , LicenseOverprovisioned ,
        # InvalidCloudwatchApplicationInsights , or CloudwatchApplicationInsightsError .
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the recommendation options for licenses.
      struct LicenseRecommendationOption
        include JSON::Serializable

        # The recommended edition of the license for the application that runs on the instance.
        @[JSON::Field(key: "licenseEdition")]
        getter license_edition : String?

        # The recommended license type associated with the instance.
        @[JSON::Field(key: "licenseModel")]
        getter license_model : String?

        # The operating system of a license recommendation option.
        @[JSON::Field(key: "operatingSystem")]
        getter operating_system : String?

        # The rank of the license recommendation option. The top recommendation option is ranked as 1 .
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        def initialize(
          @license_edition : String? = nil,
          @license_model : String? = nil,
          @operating_system : String? = nil,
          @rank : Int32? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil
        )
        end
      end

      # The request exceeds a limit of the service.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The memory size configurations of a container.
      struct MemorySizeConfiguration
        include JSON::Serializable

        # The amount of memory in the container.
        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The limit of memory reserve for the container.
        @[JSON::Field(key: "memoryReservation")]
        getter memory_reservation : Int32?

        def initialize(
          @memory : Int32? = nil,
          @memory_reservation : Int32? = nil
        )
        end
      end

      # The list of metric sources required to generate recommendations for commercial software licenses.
      struct MetricSource
        include JSON::Serializable

        # The name of the metric source provider.
        @[JSON::Field(key: "provider")]
        getter provider : String?

        # The ARN of the metric source provider.
        @[JSON::Field(key: "providerArn")]
        getter provider_arn : String?

        def initialize(
          @provider : String? = nil,
          @provider_arn : String? = nil
        )
        end
      end

      # The request must contain either a valid (registered) Amazon Web Services access key ID or X.509
      # certificate.
      struct MissingAuthenticationToken
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The account is not opted in to Compute Optimizer.
      struct OptInRequiredException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes how the recommendations are ordered.
      struct OrderBy
        include JSON::Serializable

        # The dimension values to sort the recommendations.
        @[JSON::Field(key: "dimension")]
        getter dimension : String?

        # The order to sort the recommendations.
        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @dimension : String? = nil,
          @order : String? = nil
        )
        end
      end

      # The preference to control which resource type values are considered when generating rightsizing
      # recommendations. You can specify this preference as a combination of include and exclude lists. You
      # must specify either an includeList or excludeList . If the preference is an empty set of resource
      # type values, an error occurs. For more information, see Rightsizing recommendation preferences in
      # the Compute Optimizer User Guide . This preference is only available for the Amazon EC2 instance and
      # Amazon EC2 Auto Scaling group resource types. Compute Optimizer only supports the customization of
      # Ec2InstanceTypes .
      struct PreferredResource
        include JSON::Serializable

        # The preferred resource type values to exclude from the recommendation candidates. If this isn’t
        # specified, all supported resources are included by default. You can specify up to 1000 values in
        # this list.
        @[JSON::Field(key: "excludeList")]
        getter exclude_list : Array(String)?

        # The preferred resource type values to include in the recommendation candidates. You can specify the
        # exact resource type value, such as m5.large, or use wild card expressions, such as m5. If this isn’t
        # specified, all supported resources are included by default. You can specify up to 1000 values in
        # this list.
        @[JSON::Field(key: "includeList")]
        getter include_list : Array(String)?

        # The type of preferred resource to customize. Compute Optimizer only supports the customization of
        # Ec2InstanceTypes .
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @exclude_list : Array(String)? = nil,
          @include_list : Array(String)? = nil,
          @name : String? = nil
        )
        end
      end

      # Describes a projected utilization metric of a recommendation option, such as an Amazon EC2 instance.
      # This represents the projected utilization of a recommendation option had you used that resource
      # during the analyzed period. Compare the utilization metric data of your resource against its
      # projected utilization metric data to determine the performance difference between your current
      # resource and the recommended option. The Cpu , Memory , GPU , and GPU_MEMORY metrics are the only
      # projected utilization metrics returned when you run the GetEC2RecommendationProjectedMetrics action.
      # Additionally, these metrics are only returned for resources with the unified CloudWatch agent
      # installed on them. For more information, see Enabling Memory Utilization with the CloudWatch Agent
      # and Enabling NVIDIA GPU utilization with the CloudWatch Agent .
      struct ProjectedMetric
        include JSON::Serializable

        # The name of the projected utilization metric. The following projected utilization metrics are
        # returned: Cpu - The projected percentage of allocated EC2 compute units that would be in use on the
        # recommendation option had you used that resource during the analyzed period. This metric identifies
        # the processing power required to run an application on the recommendation option. Depending on the
        # instance type, tools in your operating system can show a lower percentage than CloudWatch when the
        # instance is not allocated a full processor core. Memory - The percentage of memory that would be in
        # use on the recommendation option had you used that resource during the analyzed period. This metric
        # identifies the amount of memory required to run an application on the recommendation option. Units:
        # Percent The Memory metric is only returned for resources with the unified CloudWatch agent installed
        # on them. For more information, see Enabling Memory Utilization with the CloudWatch Agent . GPU - The
        # projected percentage of allocated GPUs if you adjust your configurations to Compute Optimizer's
        # recommendation option. GPU_MEMORY - The projected percentage of total GPU memory if you adjust your
        # configurations to Compute Optimizer's recommendation option. The GPU and GPU_MEMORY metrics are only
        # returned for resources with the unified CloudWatch Agent installed on them. For more information,
        # see Enabling NVIDIA GPU utilization with the CloudWatch Agent .
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamps of the projected utilization metric.
        @[JSON::Field(key: "timestamps")]
        getter timestamps : Array(Time)?

        # The values of the projected utilization metrics.
        @[JSON::Field(key: "values")]
        getter values : Array(Float64)?

        def initialize(
          @name : String? = nil,
          @timestamps : Array(Time)? = nil,
          @values : Array(Float64)? = nil
        )
        end
      end

      struct PutRecommendationPreferencesRequest
        include JSON::Serializable

        # The target resource type of the recommendation preference to create. The Ec2Instance option
        # encompasses standalone instances and instances that are part of Amazon EC2 Auto Scaling groups. The
        # AutoScalingGroup option encompasses only instances that are part of an Amazon EC2 Auto Scaling
        # group.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The status of the enhanced infrastructure metrics recommendation preference to create or update.
        # Specify the Active status to activate the preference, or specify Inactive to deactivate the
        # preference. For more information, see Enhanced infrastructure metrics in the Compute Optimizer User
        # Guide .
        @[JSON::Field(key: "enhancedInfrastructureMetrics")]
        getter enhanced_infrastructure_metrics : String?

        # The provider of the external metrics recommendation preference to create or update. Specify a valid
        # provider in the source field to activate the preference. To delete this preference, see the
        # DeleteRecommendationPreferences action. This preference can only be set for the Ec2Instance resource
        # type. For more information, see External metrics ingestion in the Compute Optimizer User Guide .
        @[JSON::Field(key: "externalMetricsPreference")]
        getter external_metrics_preference : Types::ExternalMetricsPreference?

        # The status of the inferred workload types recommendation preference to create or update. The
        # inferred workload type feature is active by default. To deactivate it, create a recommendation
        # preference. Specify the Inactive status to deactivate the feature, or specify Active to activate it.
        # For more information, see Inferred workload types in the Compute Optimizer User Guide .
        @[JSON::Field(key: "inferredWorkloadTypes")]
        getter inferred_workload_types : String?

        # The preference to control the number of days the utilization metrics of the Amazon Web Services
        # resource are analyzed. When this preference isn't specified, we use the default value DAYS_14 . You
        # can only set this preference for the Amazon EC2 instance and Amazon EC2 Auto Scaling group resource
        # types. Amazon EC2 instance lookback preferences can be set at the organization, account, and
        # resource levels. Amazon EC2 Auto Scaling group lookback preferences can only be set at the resource
        # level.
        @[JSON::Field(key: "lookBackPeriod")]
        getter look_back_period : String?

        # The preference to control which resource type values are considered when generating rightsizing
        # recommendations. You can specify this preference as a combination of include and exclude lists. You
        # must specify either an includeList or excludeList . If the preference is an empty set of resource
        # type values, an error occurs. You can only set this preference for the Amazon EC2 instance and
        # Amazon EC2 Auto Scaling group resource types.
        @[JSON::Field(key: "preferredResources")]
        getter preferred_resources : Array(Types::PreferredResource)?

        # The status of the savings estimation mode preference to create or update. Specify the AfterDiscounts
        # status to activate the preference, or specify BeforeDiscounts to deactivate the preference. Only the
        # account manager or delegated administrator of your organization can activate this preference. For
        # more information, see Savings estimation mode in the Compute Optimizer User Guide .
        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : String?

        # An object that describes the scope of the recommendation preference to create. You can create
        # recommendation preferences at the organization level (for management accounts of an organization
        # only), account level, and resource level. For more information, see Activating enhanced
        # infrastructure metrics in the Compute Optimizer User Guide . You cannot create recommendation
        # preferences for Amazon EC2 Auto Scaling groups at the organization and account levels. You can
        # create recommendation preferences for Amazon EC2 Auto Scaling groups only at the resource level by
        # specifying a scope name of ResourceArn and a scope value of the Amazon EC2 Auto Scaling group Amazon
        # Resource Name (ARN). This will configure the preference for all instances that are part of the
        # specified Amazon EC2 Auto Scaling group. You also cannot create recommendation preferences at the
        # resource level for instances that are part of an Amazon EC2 Auto Scaling group. You can create
        # recommendation preferences at the resource level only for standalone instances.
        @[JSON::Field(key: "scope")]
        getter scope : Types::Scope?

        # The preference to control the resource’s CPU utilization threshold, CPU utilization headroom, and
        # memory utilization headroom. When this preference isn't specified, we use the following default
        # values. CPU utilization: P99_5 for threshold PERCENT_20 for headroom Memory utilization: PERCENT_20
        # for headroom You can only set CPU and memory utilization preferences for the Amazon EC2 instance
        # resource type. The threshold setting isn’t available for memory utilization.
        @[JSON::Field(key: "utilizationPreferences")]
        getter utilization_preferences : Array(Types::UtilizationPreference)?

        def initialize(
          @resource_type : String,
          @enhanced_infrastructure_metrics : String? = nil,
          @external_metrics_preference : Types::ExternalMetricsPreference? = nil,
          @inferred_workload_types : String? = nil,
          @look_back_period : String? = nil,
          @preferred_resources : Array(Types::PreferredResource)? = nil,
          @savings_estimation_mode : String? = nil,
          @scope : Types::Scope? = nil,
          @utilization_preferences : Array(Types::UtilizationPreference)? = nil
        )
        end
      end

      struct PutRecommendationPreferencesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the recommendation options for a DB instance.
      struct RDSDBInstanceRecommendationOption
        include JSON::Serializable

        # Describes the DB instance class recommendation option for your Amazon Aurora or RDS database.
        @[JSON::Field(key: "dbInstanceClass")]
        getter db_instance_class : String?

        # The performance risk of the DB instance recommendation option.
        @[JSON::Field(key: "performanceRisk")]
        getter performance_risk : Float64?

        # An array of objects that describe the projected utilization metrics of the DB instance
        # recommendation option.
        @[JSON::Field(key: "projectedUtilizationMetrics")]
        getter projected_utilization_metrics : Array(Types::RDSDBUtilizationMetric)?

        # The rank identifier of the DB instance recommendation option.
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # Describes the savings opportunity for Amazon Aurora and RDS database recommendations or for the
        # recommendation option. Savings opportunity represents the estimated monthly savings after applying
        # Savings Plans discounts. You can achieve this by implementing a given Compute Optimizer
        # recommendation.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::RDSInstanceSavingsOpportunityAfterDiscounts?

        def initialize(
          @db_instance_class : String? = nil,
          @performance_risk : Float64? = nil,
          @projected_utilization_metrics : Array(Types::RDSDBUtilizationMetric)? = nil,
          @rank : Int32? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::RDSInstanceSavingsOpportunityAfterDiscounts? = nil
        )
        end
      end

      # Describes an Amazon Aurora and RDS database recommendation.
      struct RDSDBRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon Aurora or RDS database.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The DB instance class of the current Aurora or RDS DB instance.
        @[JSON::Field(key: "currentDBInstanceClass")]
        getter current_db_instance_class : String?

        # The performance risk for the current DB instance.
        @[JSON::Field(key: "currentInstancePerformanceRisk")]
        getter current_instance_performance_risk : String?

        # The configuration of the current DB storage.
        @[JSON::Field(key: "currentStorageConfiguration")]
        getter current_storage_configuration : Types::DBStorageConfiguration?

        # The level of variation in monthly I/O costs for the current DB storage configuration.
        @[JSON::Field(key: "currentStorageEstimatedMonthlyVolumeIOPsCostVariation")]
        getter current_storage_estimated_monthly_volume_io_ps_cost_variation : String?

        # The identifier for DB cluster.
        @[JSON::Field(key: "dbClusterIdentifier")]
        getter db_cluster_identifier : String?

        # Describes the effective recommendation preferences for DB instances.
        @[JSON::Field(key: "effectiveRecommendationPreferences")]
        getter effective_recommendation_preferences : Types::RDSEffectiveRecommendationPreferences?

        # The engine of the DB instance.
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The database engine version.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # This indicates if the DB instance is idle or not.
        @[JSON::Field(key: "idle")]
        getter idle : String?

        # The finding classification of an Amazon Aurora and RDS DB instance. For more information about
        # finding classifications, see Finding classifications for Aurora and RDS databases in the Compute
        # Optimizer User Guide .
        @[JSON::Field(key: "instanceFinding")]
        getter instance_finding : String?

        # The reason for the finding classification of a DB instance.
        @[JSON::Field(key: "instanceFindingReasonCodes")]
        getter instance_finding_reason_codes : Array(String)?

        # An array of objects that describe the recommendation options for the RDS DB instance.
        @[JSON::Field(key: "instanceRecommendationOptions")]
        getter instance_recommendation_options : Array(Types::RDSDBInstanceRecommendationOption)?

        # The timestamp of when the DB instance recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The number of days the DB instance utilization metrics were analyzed.
        @[JSON::Field(key: "lookbackPeriodInDays")]
        getter lookback_period_in_days : Float64?

        # The promotion tier for the Aurora instance.
        @[JSON::Field(key: "promotionTier")]
        getter promotion_tier : Int32?

        # The ARN of the current Amazon Aurora or RDS database. The following is the format of the ARN:
        # arn:aws:rds:{region}:{accountId}:db:{resourceName}
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The finding classification of Amazon RDS DB instance storage. For more information about finding
        # classifications, see Finding classifications for Aurora and RDS databases in the Compute Optimizer
        # User Guide .
        @[JSON::Field(key: "storageFinding")]
        getter storage_finding : String?

        # The reason for the finding classification of RDS DB instance storage.
        @[JSON::Field(key: "storageFindingReasonCodes")]
        getter storage_finding_reason_codes : Array(String)?

        # An array of objects that describe the recommendation options for DB instance storage.
        @[JSON::Field(key: "storageRecommendationOptions")]
        getter storage_recommendation_options : Array(Types::RDSDBStorageRecommendationOption)?

        # A list of tags assigned to your DB instance recommendations.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An array of objects that describe the utilization metrics of the DB instance.
        @[JSON::Field(key: "utilizationMetrics")]
        getter utilization_metrics : Array(Types::RDSDBUtilizationMetric)?

        def initialize(
          @account_id : String? = nil,
          @current_db_instance_class : String? = nil,
          @current_instance_performance_risk : String? = nil,
          @current_storage_configuration : Types::DBStorageConfiguration? = nil,
          @current_storage_estimated_monthly_volume_io_ps_cost_variation : String? = nil,
          @db_cluster_identifier : String? = nil,
          @effective_recommendation_preferences : Types::RDSEffectiveRecommendationPreferences? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @idle : String? = nil,
          @instance_finding : String? = nil,
          @instance_finding_reason_codes : Array(String)? = nil,
          @instance_recommendation_options : Array(Types::RDSDBInstanceRecommendationOption)? = nil,
          @last_refresh_timestamp : Time? = nil,
          @lookback_period_in_days : Float64? = nil,
          @promotion_tier : Int32? = nil,
          @resource_arn : String? = nil,
          @storage_finding : String? = nil,
          @storage_finding_reason_codes : Array(String)? = nil,
          @storage_recommendation_options : Array(Types::RDSDBStorageRecommendationOption)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @utilization_metrics : Array(Types::RDSDBUtilizationMetric)? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of DB instance recommendations. Use this filter
      # with the GetECSServiceRecommendations action.
      struct RDSDBRecommendationFilter
        include JSON::Serializable

        # The name of the filter. Specify Finding to return recommendations with a specific finding
        # classification. You can filter your DB instance recommendations by tag:key and tag-key tags. A
        # tag:key is a key and value combination of a tag assigned to your DB instance recommendations. Use
        # the tag key in the filter name and the tag value as the filter value. For example, to find all DB
        # instance recommendations that have a tag with the key of Owner and the value of TeamA , specify
        # tag:Owner for the filter name and TeamA for the filter value. A tag-key is the key of a tag assigned
        # to your DB instance recommendations. Use this filter to find all of your DB instance recommendations
        # that have a tag with a specific key. This doesn’t consider the tag value. For example, you can find
        # your DB instance recommendations with a tag key value of Owner or without any tag keys assigned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the filter.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the recommendation options for DB storage.
      struct RDSDBStorageRecommendationOption
        include JSON::Serializable

        # The projected level of variation in monthly I/O costs for the DB storage recommendation option.
        @[JSON::Field(key: "estimatedMonthlyVolumeIOPsCostVariation")]
        getter estimated_monthly_volume_io_ps_cost_variation : String?

        # The rank identifier of the DB storage recommendation option.
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # Describes the savings opportunity for DB storage recommendations or for the recommendation option.
        # Savings opportunity represents the estimated monthly savings after applying Savings Plans discounts.
        # You can achieve this by implementing a given Compute Optimizer recommendation.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::RDSStorageSavingsOpportunityAfterDiscounts?

        # The recommended storage configuration.
        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::DBStorageConfiguration?

        def initialize(
          @estimated_monthly_volume_io_ps_cost_variation : String? = nil,
          @rank : Int32? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::RDSStorageSavingsOpportunityAfterDiscounts? = nil,
          @storage_configuration : Types::DBStorageConfiguration? = nil
        )
        end
      end

      # Describes the utilization metric of an Amazon Aurora and RDS database. To determine the performance
      # difference between your current DB instance and the recommended option, compare the utilization
      # metric data of your service against its projected utilization metric data.
      struct RDSDBUtilizationMetric
        include JSON::Serializable

        # The name of the utilization metric.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the utilization metric. The Compute Optimizer API, Command Line Interface (CLI),
        # and SDKs return utilization metrics using only the Maximum statistic, which is the highest value
        # observed during the specified period. The Compute Optimizer console displays graphs for some
        # utilization metrics using the Average statistic, which is the value of Sum / SampleCount during the
        # specified period. For more information, see Viewing resource recommendations in the Compute
        # Optimizer User Guide . You can also get averaged utilization metric data for your resources using
        # Amazon CloudWatch. For more information, see the Amazon CloudWatch User Guide .
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the utilization metric.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the projected metrics of an Amazon Aurora and RDS database recommendation option. To
      # determine the performance difference between your current Amazon Aurora and RDS database and the
      # recommended option, compare the metric data of your service against its projected metric data.
      struct RDSDatabaseProjectedMetric
        include JSON::Serializable

        # The name of the projected metric.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamps of the projected metric.
        @[JSON::Field(key: "timestamps")]
        getter timestamps : Array(Time)?

        # The values for the projected metric.
        @[JSON::Field(key: "values")]
        getter values : Array(Float64)?

        def initialize(
          @name : String? = nil,
          @timestamps : Array(Time)? = nil,
          @values : Array(Float64)? = nil
        )
        end
      end

      # Describes the projected metrics of an Amazon Aurora and RDS database recommendation option. To
      # determine the performance difference between your current Amazon Aurora and RDS database and the
      # recommended option, compare the metric data of your service against its projected metric data.
      struct RDSDatabaseRecommendedOptionProjectedMetric
        include JSON::Serializable

        # An array of objects that describe the projected metric.
        @[JSON::Field(key: "projectedMetrics")]
        getter projected_metrics : Array(Types::RDSDatabaseProjectedMetric)?

        # The rank identifier of the Amazon Aurora or RDS DB instance recommendation option.
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # The recommended DB instance class for the Amazon Aurora or RDS database.
        @[JSON::Field(key: "recommendedDBInstanceClass")]
        getter recommended_db_instance_class : String?

        def initialize(
          @projected_metrics : Array(Types::RDSDatabaseProjectedMetric)? = nil,
          @rank : Int32? = nil,
          @recommended_db_instance_class : String? = nil
        )
        end
      end

      # Describes the effective recommendation preferences for Amazon Aurora and RDS databases.
      struct RDSEffectiveRecommendationPreferences
        include JSON::Serializable

        # Describes the CPU vendor and architecture for DB instance recommendations.
        @[JSON::Field(key: "cpuVendorArchitectures")]
        getter cpu_vendor_architectures : Array(String)?

        # Describes the activation status of the enhanced infrastructure metrics preference. A status of
        # Active confirms that the preference is applied in the latest recommendation refresh, and a status of
        # Inactive confirms that it's not yet applied to recommendations. For more information, see Enhanced
        # infrastructure metrics in the Compute Optimizer User Guide .
        @[JSON::Field(key: "enhancedInfrastructureMetrics")]
        getter enhanced_infrastructure_metrics : String?

        # The number of days the utilization metrics of the DB instance are analyzed.
        @[JSON::Field(key: "lookBackPeriod")]
        getter look_back_period : String?

        # Describes the savings estimation mode preference applied for calculating savings opportunity for DB
        # instances.
        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : Types::RDSSavingsEstimationMode?

        def initialize(
          @cpu_vendor_architectures : Array(String)? = nil,
          @enhanced_infrastructure_metrics : String? = nil,
          @look_back_period : String? = nil,
          @savings_estimation_mode : Types::RDSSavingsEstimationMode? = nil
        )
        end
      end

      # Describes the estimated monthly savings possible for DB instances by adopting Compute Optimizer
      # recommendations. This is based on DB instance pricing after applying Savings Plans discounts.
      struct RDSInstanceEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings for DB instances.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the savings opportunity for DB instance recommendations after applying Savings Plans
      # discounts. Savings opportunity represents the estimated monthly savings after applying Savings Plans
      # discounts. You can achieve this by implementing a given Compute Optimizer recommendation.
      struct RDSInstanceSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # The estimated monthly savings possible by adopting Compute Optimizer’s DB instance recommendations.
        # This includes any applicable Savings Plans discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::RDSInstanceEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute
        # Optimizer’s DB instance recommendations. This includes any applicable Savings Plans discounts.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::RDSInstanceEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes the savings estimation mode used for calculating savings opportunity for DB instances.
      struct RDSSavingsEstimationMode
        include JSON::Serializable

        # Describes the source for calculating the savings opportunity for DB instances.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @source : String? = nil
        )
        end
      end

      # Describes the estimated monthly savings possible for DB instance storage by adopting Compute
      # Optimizer recommendations. This is based on DB instance pricing after applying Savings Plans
      # discounts.
      struct RDSStorageEstimatedMonthlySavings
        include JSON::Serializable

        # The currency of the estimated monthly savings.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The value of the estimated monthly savings for DB instance storage.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @currency : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the savings opportunity for Amazon RDS storage recommendations after applying Savings
      # Plans discounts. Savings opportunity represents the estimated monthly savings after applying Savings
      # Plans discounts. You can achieve this by implementing a given Compute Optimizer recommendation.
      struct RDSStorageSavingsOpportunityAfterDiscounts
        include JSON::Serializable

        # The estimated monthly savings possible by adopting Compute Optimizer’s DB instance storage
        # recommendations. This includes any applicable Savings Plans discounts.
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::RDSStorageEstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute
        # Optimizer’s DB instance storage recommendations. This includes any applicable Savings Plans
        # discounts.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::RDSStorageEstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # A summary of a finding reason code.
      struct ReasonCodeSummary
        include JSON::Serializable

        # The name of the finding reason code.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the finding reason code summary.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes a recommendation export job. Use the DescribeRecommendationExportJobs action to view your
      # recommendation export jobs. Use the ExportAutoScalingGroupRecommendations or
      # ExportEC2InstanceRecommendations actions to request an export of your recommendations.
      struct RecommendationExportJob
        include JSON::Serializable

        # The timestamp of when the export job was created.
        @[JSON::Field(key: "creationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # An object that describes the destination of the export file.
        @[JSON::Field(key: "destination")]
        getter destination : Types::ExportDestination?

        # The reason for an export job failure.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The identification number of the export job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The timestamp of when the export job was last updated.
        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The resource type of the exported recommendations.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The status of the export job.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_timestamp : Time? = nil,
          @destination : Types::ExportDestination? = nil,
          @failure_reason : String? = nil,
          @job_id : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @resource_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the recommendation preferences to return in the response of a
      # GetAutoScalingGroupRecommendations , GetEC2InstanceRecommendations ,
      # GetEC2RecommendationProjectedMetrics , GetRDSDatabaseRecommendations , and
      # GetRDSDatabaseRecommendationProjectedMetrics request.
      struct RecommendationPreferences
        include JSON::Serializable

        # Specifies the CPU vendor and architecture for Amazon EC2 instance and Amazon EC2 Auto Scaling group
        # recommendations. For example, when you specify AWS_ARM64 with: A GetEC2InstanceRecommendations or
        # GetAutoScalingGroupRecommendations request, Compute Optimizer returns recommendations that consist
        # of Graviton instance types only. A GetEC2RecommendationProjectedMetrics request, Compute Optimizer
        # returns projected utilization metrics for Graviton instance type recommendations only. A
        # ExportEC2InstanceRecommendations or ExportAutoScalingGroupRecommendations request, Compute Optimizer
        # exports recommendations that consist of Graviton instance types only.
        @[JSON::Field(key: "cpuVendorArchitectures")]
        getter cpu_vendor_architectures : Array(String)?

        def initialize(
          @cpu_vendor_architectures : Array(String)? = nil
        )
        end
      end

      # Describes a recommendation preference.
      struct RecommendationPreferencesDetail
        include JSON::Serializable

        # The status of the enhanced infrastructure metrics recommendation preference. When the
        # recommendations page is refreshed, a status of Active confirms that the preference is applied to the
        # recommendations, and a status of Inactive confirms that the preference isn't yet applied to
        # recommendations. For more information, see Enhanced infrastructure metrics in the Compute Optimizer
        # User Guide .
        @[JSON::Field(key: "enhancedInfrastructureMetrics")]
        getter enhanced_infrastructure_metrics : String?

        # An object that describes the external metrics recommendation preference. If the preference is
        # applied in the latest recommendation refresh, an object with a valid source value appears in the
        # response. If the preference isn't applied to the recommendations already, then this object doesn't
        # appear in the response.
        @[JSON::Field(key: "externalMetricsPreference")]
        getter external_metrics_preference : Types::ExternalMetricsPreference?

        # The status of the inferred workload types recommendation preference. When the recommendations page
        # is refreshed, a status of Active confirms that the preference is applied to the recommendations, and
        # a status of Inactive confirms that the preference isn't yet applied to recommendations.
        @[JSON::Field(key: "inferredWorkloadTypes")]
        getter inferred_workload_types : String?

        # The preference to control the number of days the utilization metrics of the Amazon Web Services
        # resource are analyzed. If the preference isn’t set, this object is null.
        @[JSON::Field(key: "lookBackPeriod")]
        getter look_back_period : String?

        # The preference to control which resource type values are considered when generating rightsizing
        # recommendations. This object resolves any wildcard expressions and returns the effective list of
        # candidate resource type values. If the preference isn’t set, this object is null.
        @[JSON::Field(key: "preferredResources")]
        getter preferred_resources : Array(Types::EffectivePreferredResource)?

        # The target resource type of the recommendation preference to create. The Ec2Instance option
        # encompasses standalone instances and instances that are part of Amazon EC2 Auto Scaling groups. The
        # AutoScalingGroup option encompasses only instances that are part of an Amazon EC2 Auto Scaling
        # group.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Describes the savings estimation mode used for calculating savings opportunity. Only the account
        # manager or delegated administrator of your organization can activate this preference.
        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : String?

        # An object that describes the scope of the recommendation preference. Recommendation preferences can
        # be created at the organization level (for management accounts of an organization only), account
        # level, and resource level. For more information, see Activating enhanced infrastructure metrics in
        # the Compute Optimizer User Guide .
        @[JSON::Field(key: "scope")]
        getter scope : Types::Scope?

        # The preference to control the resource’s CPU utilization threshold, CPU utilization headroom, and
        # memory utilization headroom. If the preference isn’t set, this object is null. This preference is
        # only available for the Amazon EC2 instance resource type.
        @[JSON::Field(key: "utilizationPreferences")]
        getter utilization_preferences : Array(Types::UtilizationPreference)?

        def initialize(
          @enhanced_infrastructure_metrics : String? = nil,
          @external_metrics_preference : Types::ExternalMetricsPreference? = nil,
          @inferred_workload_types : String? = nil,
          @look_back_period : String? = nil,
          @preferred_resources : Array(Types::EffectivePreferredResource)? = nil,
          @resource_type : String? = nil,
          @savings_estimation_mode : String? = nil,
          @scope : Types::Scope? = nil,
          @utilization_preferences : Array(Types::UtilizationPreference)? = nil
        )
        end
      end

      # Describes the source of a recommendation, such as an Amazon EC2 instance or Amazon EC2 Auto Scaling
      # group.
      struct RecommendationSource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommendation source.
        @[JSON::Field(key: "recommendationSourceArn")]
        getter recommendation_source_arn : String?

        # The resource type of the recommendation source.
        @[JSON::Field(key: "recommendationSourceType")]
        getter recommendation_source_type : String?

        def initialize(
          @recommendation_source_arn : String? = nil,
          @recommendation_source_type : String? = nil
        )
        end
      end

      # A summary of a recommendation.
      struct RecommendationSummary
        include JSON::Serializable

        # The Amazon Web Services account ID of the recommendation summary.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        @[JSON::Field(key: "aggregatedSavingsOpportunity")]
        getter aggregated_savings_opportunity : Types::SavingsOpportunity?

        # An object that describes the performance risk ratings for a given resource type.
        @[JSON::Field(key: "currentPerformanceRiskRatings")]
        getter current_performance_risk_ratings : Types::CurrentPerformanceRiskRatings?

        @[JSON::Field(key: "idleSavingsOpportunity")]
        getter idle_savings_opportunity : Types::SavingsOpportunity?

        # Describes the findings summary of the idle resources.
        @[JSON::Field(key: "idleSummaries")]
        getter idle_summaries : Array(Types::IdleSummary)?

        # An array of objects that describes the estimated monthly saving amounts for the instances running on
        # the specified inferredWorkloadTypes . The array contains the top five savings opportunites for the
        # instances that run inferred workload types.
        @[JSON::Field(key: "inferredWorkloadSavings")]
        getter inferred_workload_savings : Array(Types::InferredWorkloadSaving)?

        # The resource type that the recommendation summary applies to.
        @[JSON::Field(key: "recommendationResourceType")]
        getter recommendation_resource_type : String?

        # An object that describes the savings opportunity for a given resource type. Savings opportunity
        # includes the estimated monthly savings amount and percentage.
        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # An array of objects that describe a recommendation summary.
        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::Summary)?

        def initialize(
          @account_id : String? = nil,
          @aggregated_savings_opportunity : Types::SavingsOpportunity? = nil,
          @current_performance_risk_ratings : Types::CurrentPerformanceRiskRatings? = nil,
          @idle_savings_opportunity : Types::SavingsOpportunity? = nil,
          @idle_summaries : Array(Types::IdleSummary)? = nil,
          @inferred_workload_savings : Array(Types::InferredWorkloadSaving)? = nil,
          @recommendation_resource_type : String? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @summaries : Array(Types::Summary)? = nil
        )
        end
      end

      # Describes a projected utilization metric of a recommendation option. The Cpu and Memory metrics are
      # the only projected utilization metrics returned when you run the
      # GetEC2RecommendationProjectedMetrics action. Additionally, the Memory metric is returned only for
      # resources that have the unified CloudWatch agent installed on them. For more information, see
      # Enabling Memory Utilization with the CloudWatch Agent .
      struct RecommendedOptionProjectedMetric
        include JSON::Serializable

        # An array of objects that describe a projected utilization metric.
        @[JSON::Field(key: "projectedMetrics")]
        getter projected_metrics : Array(Types::ProjectedMetric)?

        # The rank of the recommendation option projected metric. The top recommendation option is ranked as 1
        # . The projected metric rank correlates to the recommendation option rank. For example, the projected
        # metric ranked as 1 is related to the recommendation option that is also ranked as 1 in the same
        # response.
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # The recommended instance type.
        @[JSON::Field(key: "recommendedInstanceType")]
        getter recommended_instance_type : String?

        def initialize(
          @projected_metrics : Array(Types::ProjectedMetric)? = nil,
          @rank : Int32? = nil,
          @recommended_instance_type : String? = nil
        )
        end
      end

      # A resource that is required for the action doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and object keys of a
      # recommendations export file, and its associated metadata file.
      struct S3Destination
        include JSON::Serializable

        # The name of the Amazon S3 bucket used as the destination of an export file.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The Amazon S3 bucket key of an export file. The key uniquely identifies the object, or export file,
        # in the S3 bucket.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The Amazon S3 bucket key of a metadata file. The key uniquely identifies the object, or metadata
        # file, in the S3 bucket.
        @[JSON::Field(key: "metadataKey")]
        getter metadata_key : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil,
          @metadata_key : String? = nil
        )
        end
      end

      # Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and key prefix for a
      # recommendations export job. You must create the destination Amazon S3 bucket for your
      # recommendations export before you create the export job. Compute Optimizer does not create the S3
      # bucket for you. After you create the S3 bucket, ensure that it has the required permission policy to
      # allow Compute Optimizer to write the export file to it. If you plan to specify an object prefix when
      # you create the export job, you must include the object prefix in the policy that you add to the S3
      # bucket. For more information, see Amazon S3 Bucket Policy for Compute Optimizer in the Compute
      # Optimizer User Guide .
      struct S3DestinationConfig
        include JSON::Serializable

        # The name of the Amazon S3 bucket to use as the destination for an export job.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The Amazon S3 bucket prefix for an export job.
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String? = nil,
          @key_prefix : String? = nil
        )
        end
      end

      # Describes the savings opportunity for recommendations of a given resource type or for the
      # recommendation option of an individual resource. Savings opportunity represents the estimated
      # monthly savings you can achieve by implementing a given Compute Optimizer recommendation. Savings
      # opportunity data requires that you opt in to Cost Explorer, as well as activate Receive Amazon EC2
      # resource recommendations in the Cost Explorer preferences page. That creates a connection between
      # Cost Explorer and Compute Optimizer. With this connection, Cost Explorer generates savings estimates
      # considering the price of existing resources, the price of recommended resources, and historical
      # usage data. Estimated monthly savings reflects the projected dollar savings associated with each of
      # the recommendations generated. For more information, see Enabling Cost Explorer and Optimizing your
      # cost with Rightsizing Recommendations in the Cost Management User Guide .
      struct SavingsOpportunity
        include JSON::Serializable

        # An object that describes the estimated monthly savings amount possible by adopting Compute Optimizer
        # recommendations for a given resource. This is based on the On-Demand instance pricing..
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        # The estimated monthly savings possible as a percentage of monthly cost by adopting Compute Optimizer
        # recommendations for a given resource.
        @[JSON::Field(key: "savingsOpportunityPercentage")]
        getter savings_opportunity_percentage : Float64?

        def initialize(
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil,
          @savings_opportunity_percentage : Float64? = nil
        )
        end
      end

      # Describes the scope of a recommendation preference. Recommendation preferences can be created at the
      # organization level (for management accounts of an organization only), account level, and resource
      # level. For more information, see Activating enhanced infrastructure metrics in the Compute Optimizer
      # User Guide . You cannot create recommendation preferences for Amazon EC2 Auto Scaling groups at the
      # organization and account levels. You can create recommendation preferences for Amazon EC2 Auto
      # Scaling groups only at the resource level by specifying a scope name of ResourceArn and a scope
      # value of the Amazon EC2 Auto Scaling group Amazon Resource Name (ARN). This will configure the
      # preference for all instances that are part of the specified Amazon EC2 Auto Scaling group. You also
      # cannot create recommendation preferences at the resource level for instances that are part of an
      # Amazon EC2 Auto Scaling group. You can create recommendation preferences at the resource level only
      # for standalone instances.
      struct Scope
        include JSON::Serializable

        # The name of the scope. The following scopes are possible: Organization - Specifies that the
        # recommendation preference applies at the organization level, for all member accounts of an
        # organization. AccountId - Specifies that the recommendation preference applies at the account level,
        # for all resources of a given resource type in an account. ResourceArn - Specifies that the
        # recommendation preference applies at the individual resource level.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the scope. If you specified the name of the scope as: Organization - The value must be
        # ALL_ACCOUNTS . AccountId - The value must be a 12-digit Amazon Web Services account ID. ResourceArn
        # - The value must be the Amazon Resource Name (ARN) of an EC2 instance or an Amazon EC2 Auto Scaling
        # group. Only EC2 instance and Amazon EC2 Auto Scaling group ARNs are currently supported.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The Amazon ECS service configurations used for recommendations.
      struct ServiceConfiguration
        include JSON::Serializable

        # Describes the Auto Scaling configuration methods for an Amazon ECS service. This affects the
        # generated recommendations. For example, if Auto Scaling is configured on a service’s CPU, then
        # Compute Optimizer doesn’t generate CPU size recommendations. The Auto Scaling configuration methods
        # include: TARGET_TRACKING_SCALING_CPU — If the Amazon ECS service is configured to use target scaling
        # on CPU, Compute Optimizer doesn't generate CPU recommendations. TARGET_TRACKING_SCALING_MEMORY — If
        # the Amazon ECS service is configured to use target scaling on memory, Compute Optimizer doesn't
        # generate memory recommendations. For more information about step scaling and target scaling, see
        # Step scaling policies for Application Auto Scaling and Target tracking scaling policies for
        # Application Auto Scaling in the Application Auto Scaling User Guide .
        @[JSON::Field(key: "autoScalingConfiguration")]
        getter auto_scaling_configuration : String?

        # The container configurations within a task of an Amazon ECS service.
        @[JSON::Field(key: "containerConfigurations")]
        getter container_configurations : Array(Types::ContainerConfiguration)?

        # The number of CPU units used by the tasks in the Amazon ECS service.
        @[JSON::Field(key: "cpu")]
        getter cpu : Int32?

        # The amount of memory used by the tasks in the Amazon ECS service.
        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The task definition ARN used by the tasks in the Amazon ECS service.
        @[JSON::Field(key: "taskDefinitionArn")]
        getter task_definition_arn : String?

        def initialize(
          @auto_scaling_configuration : String? = nil,
          @container_configurations : Array(Types::ContainerConfiguration)? = nil,
          @cpu : Int32? = nil,
          @memory : Int32? = nil,
          @task_definition_arn : String? = nil
        )
        end
      end

      # The request has failed due to a temporary failure of the server.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The summary of a recommendation.
      struct Summary
        include JSON::Serializable

        # The finding classification of the recommendation.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of objects that summarize a finding reason code.
        @[JSON::Field(key: "reasonCodeSummaries")]
        getter reason_code_summaries : Array(Types::ReasonCodeSummary)?

        # The value of the recommendation summary.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @reason_code_summaries : Array(Types::ReasonCodeSummary)? = nil,
          @value : Float64? = nil
        )
        end
      end

      # A list of tag key and value pairs that you define.
      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that makes up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "key")]
        getter key : String?

        # One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category
        # (key). The value can be empty or null.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
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

      struct UpdateEnrollmentStatusRequest
        include JSON::Serializable

        # The new enrollment status of the account. The following status options are available: Active - Opts
        # in your account to the Compute Optimizer service. Compute Optimizer begins analyzing the
        # configuration and utilization metrics of your Amazon Web Services resources after you opt in. For
        # more information, see Metrics analyzed by Compute Optimizer in the Compute Optimizer User Guide .
        # Inactive - Opts out your account from the Compute Optimizer service. Your account's recommendations
        # and related metrics data will be deleted from Compute Optimizer after you opt out. The Pending and
        # Failed options cannot be used to update the enrollment status of an account. They are returned in
        # the response of a request to update the enrollment status of an account.
        @[JSON::Field(key: "status")]
        getter status : String

        # Indicates whether to enroll member accounts of the organization if the account is the management
        # account of an organization.
        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        def initialize(
          @status : String,
          @include_member_accounts : Bool? = nil
        )
        end
      end

      struct UpdateEnrollmentStatusResponse
        include JSON::Serializable

        # The enrollment status of the account.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason for the enrollment status of the account. For example, an account might show a status of
        # Pending because member accounts of an organization require more time to be enrolled in the service.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Describes a utilization metric of a resource, such as an Amazon EC2 instance. Compare the
      # utilization metric data of your resource against its projected utilization metric data to determine
      # the performance difference between your current resource and the recommended option.
      struct UtilizationMetric
        include JSON::Serializable

        # The name of the utilization metric. The following utilization metrics are available: Cpu - The
        # percentage of allocated EC2 compute units that are currently in use on the instance. This metric
        # identifies the processing power required to run an application on the instance. Depending on the
        # instance type, tools in your operating system can show a lower percentage than CloudWatch when the
        # instance is not allocated a full processor core. Units: Percent Memory - The percentage of memory
        # that is currently in use on the instance. This metric identifies the amount of memory required to
        # run an application on the instance. Units: Percent The Memory metric is returned only for resources
        # that have the unified CloudWatch agent installed on them. For more information, see Enabling Memory
        # Utilization with the CloudWatch Agent . GPU - The percentage of allocated GPUs that currently run on
        # the instance. GPU_MEMORY - The percentage of total GPU memory that currently runs on the instance.
        # The GPU and GPU_MEMORY metrics are only returned for resources with the unified CloudWatch Agent
        # installed on them. For more information, see Enabling NVIDIA GPU utilization with the CloudWatch
        # Agent . EBS_READ_OPS_PER_SECOND - The completed read operations from all EBS volumes attached to the
        # instance in a specified period of time. Unit: Count EBS_WRITE_OPS_PER_SECOND - The completed write
        # operations to all EBS volumes attached to the instance in a specified period of time. Unit: Count
        # EBS_READ_BYTES_PER_SECOND - The bytes read from all EBS volumes attached to the instance in a
        # specified period of time. Unit: Bytes EBS_WRITE_BYTES_PER_SECOND - The bytes written to all EBS
        # volumes attached to the instance in a specified period of time. Unit: Bytes DISK_READ_OPS_PER_SECOND
        # - The completed read operations from all instance store volumes available to the instance in a
        # specified period of time. If there are no instance store volumes, either the value is 0 or the
        # metric is not reported. DISK_WRITE_OPS_PER_SECOND - The completed write operations from all instance
        # store volumes available to the instance in a specified period of time. If there are no instance
        # store volumes, either the value is 0 or the metric is not reported. DISK_READ_BYTES_PER_SECOND - The
        # bytes read from all instance store volumes available to the instance. This metric is used to
        # determine the volume of the data the application reads from the disk of the instance. This can be
        # used to determine the speed of the application. If there are no instance store volumes, either the
        # value is 0 or the metric is not reported. DISK_WRITE_BYTES_PER_SECOND - The bytes written to all
        # instance store volumes available to the instance. This metric is used to determine the volume of the
        # data the application writes onto the disk of the instance. This can be used to determine the speed
        # of the application. If there are no instance store volumes, either the value is 0 or the metric is
        # not reported. NETWORK_IN_BYTES_PER_SECOND - The number of bytes received by the instance on all
        # network interfaces. This metric identifies the volume of incoming network traffic to a single
        # instance. NETWORK_OUT_BYTES_PER_SECOND - The number of bytes sent out by the instance on all network
        # interfaces. This metric identifies the volume of outgoing network traffic from a single instance.
        # NETWORK_PACKETS_IN_PER_SECOND - The number of packets received by the instance on all network
        # interfaces. This metric identifies the volume of incoming traffic in terms of the number of packets
        # on a single instance. NETWORK_PACKETS_OUT_PER_SECOND - The number of packets sent out by the
        # instance on all network interfaces. This metric identifies the volume of outgoing traffic in terms
        # of the number of packets on a single instance.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The statistic of the utilization metric. The Compute Optimizer API, Command Line Interface (CLI),
        # and SDKs return utilization metrics using only the Maximum statistic, which is the highest value
        # observed during the specified period. The Compute Optimizer console displays graphs for some
        # utilization metrics using the Average statistic, which is the value of Sum / SampleCount during the
        # specified period. For more information, see Viewing resource recommendations in the Compute
        # Optimizer User Guide . You can also get averaged utilization metric data for your resources using
        # Amazon CloudWatch. For more information, see the Amazon CloudWatch User Guide .
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The value of the utilization metric.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @statistic : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # The preference to control the resource’s CPU utilization threshold, CPU utilization headroom, and
      # memory utilization headroom. This preference is only available for the Amazon EC2 instance resource
      # type.
      struct UtilizationPreference
        include JSON::Serializable

        # The name of the resource utilization metric name to customize.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The parameters to set when customizing the resource utilization thresholds.
        @[JSON::Field(key: "metricParameters")]
        getter metric_parameters : Types::CustomizableMetricParameters?

        def initialize(
          @metric_name : String? = nil,
          @metric_parameters : Types::CustomizableMetricParameters? = nil
        )
        end
      end

      # Describes the configuration of an Amazon Elastic Block Store (Amazon EBS) volume.
      struct VolumeConfiguration
        include JSON::Serializable

        # Contains the image used to boot the instance during launch.
        @[JSON::Field(key: "rootVolume")]
        getter root_volume : Bool?

        # The baseline IOPS of the volume.
        @[JSON::Field(key: "volumeBaselineIOPS")]
        getter volume_baseline_iops : Int32?

        # The baseline throughput of the volume.
        @[JSON::Field(key: "volumeBaselineThroughput")]
        getter volume_baseline_throughput : Int32?

        # The burst IOPS of the volume.
        @[JSON::Field(key: "volumeBurstIOPS")]
        getter volume_burst_iops : Int32?

        # The burst throughput of the volume.
        @[JSON::Field(key: "volumeBurstThroughput")]
        getter volume_burst_throughput : Int32?

        # The size of the volume, in GiB.
        @[JSON::Field(key: "volumeSize")]
        getter volume_size : Int32?

        # The volume type. The volume types can be the following: General Purpose SSD gp2 and gp3 Provisioned
        # IOPS SSD io1 , io2 , and io2 Block Express Throughput Optimized HDD st1 Cold HDD sc1 Magnetic
        # volumes standard
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @root_volume : Bool? = nil,
          @volume_baseline_iops : Int32? = nil,
          @volume_baseline_throughput : Int32? = nil,
          @volume_burst_iops : Int32? = nil,
          @volume_burst_throughput : Int32? = nil,
          @volume_size : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Describes an Amazon Elastic Block Store (Amazon EBS) volume recommendation.
      struct VolumeRecommendation
        include JSON::Serializable

        # The Amazon Web Services account ID of the volume.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # An array of objects that describe the current configuration of the volume.
        @[JSON::Field(key: "currentConfiguration")]
        getter current_configuration : Types::VolumeConfiguration?

        # The risk of the current EBS volume not meeting the performance needs of its workloads. The higher
        # the risk, the more likely the current EBS volume doesn't have sufficient capacity.
        @[JSON::Field(key: "currentPerformanceRisk")]
        getter current_performance_risk : String?

        # Describes the effective recommendation preferences for Amazon EBS volume.
        @[JSON::Field(key: "effectiveRecommendationPreferences")]
        getter effective_recommendation_preferences : Types::EBSEffectiveRecommendationPreferences?

        # The finding classification of the volume. Findings for volumes include: NotOptimized —A volume is
        # considered not optimized when Compute Optimizer identifies a recommendation that can provide better
        # performance for your workload. Optimized —An volume is considered optimized when Compute Optimizer
        # determines that the volume is correctly provisioned to run your workload based on the chosen volume
        # type. For optimized resources, Compute Optimizer might recommend a new generation volume type.
        @[JSON::Field(key: "finding")]
        getter finding : String?

        # The timestamp of when the volume recommendation was last generated.
        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The number of days for which utilization metrics were analyzed for the volume.
        @[JSON::Field(key: "lookBackPeriodInDays")]
        getter look_back_period_in_days : Float64?

        # A list of tags assigned to your Amazon EBS volume recommendations.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An array of objects that describe the utilization metrics of the volume.
        @[JSON::Field(key: "utilizationMetrics")]
        getter utilization_metrics : Array(Types::EBSUtilizationMetric)?

        # The Amazon Resource Name (ARN) of the current volume.
        @[JSON::Field(key: "volumeArn")]
        getter volume_arn : String?

        # An array of objects that describe the recommendation options for the volume.
        @[JSON::Field(key: "volumeRecommendationOptions")]
        getter volume_recommendation_options : Array(Types::VolumeRecommendationOption)?

        def initialize(
          @account_id : String? = nil,
          @current_configuration : Types::VolumeConfiguration? = nil,
          @current_performance_risk : String? = nil,
          @effective_recommendation_preferences : Types::EBSEffectiveRecommendationPreferences? = nil,
          @finding : String? = nil,
          @last_refresh_timestamp : Time? = nil,
          @look_back_period_in_days : Float64? = nil,
          @tags : Array(Types::Tag)? = nil,
          @utilization_metrics : Array(Types::EBSUtilizationMetric)? = nil,
          @volume_arn : String? = nil,
          @volume_recommendation_options : Array(Types::VolumeRecommendationOption)? = nil
        )
        end
      end

      # Describes a recommendation option for an Amazon Elastic Block Store (Amazon EBS) instance.
      struct VolumeRecommendationOption
        include JSON::Serializable

        # An array of objects that describe a volume configuration.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::VolumeConfiguration?

        # The performance risk of the volume recommendation option. Performance risk is the likelihood of the
        # recommended volume type meeting the performance requirement of your workload. The value ranges from
        # 0 - 4 , with 0 meaning that the recommended resource is predicted to always provide enough hardware
        # capability. The higher the performance risk is, the more likely you should validate whether the
        # recommendation will meet the performance requirements of your workload before migrating your
        # resource.
        @[JSON::Field(key: "performanceRisk")]
        getter performance_risk : Float64?

        # The rank of the volume recommendation option. The top recommendation option is ranked as 1 .
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # An object that describes the savings opportunity for the EBS volume recommendation option. Savings
        # opportunity includes the estimated monthly savings amount and percentage.
        @[JSON::Field(key: "savingsOpportunity")]
        getter savings_opportunity : Types::SavingsOpportunity?

        # An object that describes the savings opportunity for the Amazon EBS volume recommendation option
        # with specific discounts. Savings opportunity includes the estimated monthly savings and percentage.
        @[JSON::Field(key: "savingsOpportunityAfterDiscounts")]
        getter savings_opportunity_after_discounts : Types::EBSSavingsOpportunityAfterDiscounts?

        def initialize(
          @configuration : Types::VolumeConfiguration? = nil,
          @performance_risk : Float64? = nil,
          @rank : Int32? = nil,
          @savings_opportunity : Types::SavingsOpportunity? = nil,
          @savings_opportunity_after_discounts : Types::EBSSavingsOpportunityAfterDiscounts? = nil
        )
        end
      end
    end
  end
end
